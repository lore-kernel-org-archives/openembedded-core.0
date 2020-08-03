Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.10089.1596457832299002146
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2020 05:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hKTegFJ/;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id x69so34917358qkb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2020 05:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=McXdKw+w1EBiqx1/6efKe4JIWWVdQmTm+H6Exhsi7zk=;
        b=hKTegFJ/TBv2ou0miEBN9BvuzpsYA2x2VIhZUjdbtWz0nanCYg95YW7KnEUSmC2mdN
         M85+BK4nCseKk30wisJJ4F4Dsf4tkp33TFIJO9ICKuCzdXE52RDhUdeXOP+y9mEVBbWs
         9zMScQNT6TuRy/pQdGpfQ4+6E4wyrwRuHMou8bkd0dQE/deRgWzs5WOrnkEwin7sxGZ6
         rXnrLnFvBAaBQAwkE3C/QKnHTQgXt30unIyHLJT3RRHY8CfiUJZE76qSoWmgt+/TRyVL
         dIvgiGchvEJeZ4IL4kCdkFl39FR8xL51oge4nXW15dlnQbAgj8JG2zuBpQ4hrCQ+fT5V
         vUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=McXdKw+w1EBiqx1/6efKe4JIWWVdQmTm+H6Exhsi7zk=;
        b=ZlAbZcgLd33djymvpAd/CNX/F8EvRDZHblD2kjuIpPjRNfreVBC2mSVWE6pyApi1+A
         Q7XXAA5hAuDmUAbatGb4mel5NtHVNjdASLfeXFwfrCkuXypukVSKxcuYhiVB+Po02Kil
         6LuazZHFqetRcRc3V8hEbqz9L/R2UoJPIUrkZAaH3IwxluS3PHQ6tb0fKEdYTeLuNR7U
         U1f93enfSXoYRqHRWhYwC9xVCm23JxiFsNm7u6CLJ9EIcAa+Tw9twUH+qCeEJ0cPv9Rt
         ZtzF6O6gquSVyj3ha9rthwEQitnk0HZ47g9i7hmbHU318UMvMXn9fvpxQBR+UTOnp7qP
         BBLQ==
X-Gm-Message-State: AOAM531iFNAsmeEMMSe8m44ybp9BJ4CG5T75Y+QaSxo/0dfOsmttTF58
	7091RkwqJf4R9Nk3whRxDig=
X-Google-Smtp-Source: ABdhPJy5oxxqJ54J0J2kJjgBv95oRkKTmJPX2Yq30l82+YjKdXU2RuhwGo1GeYOr0KZiw/Xb1hK4aw==
X-Received: by 2002:ae9:ea13:: with SMTP id f19mr15930209qkg.331.1596457830492;
        Mon, 03 Aug 2020 05:30:30 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id z14sm20184299qtn.92.2020.08.03.05.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 05:30:29 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] kernel-yocto: consolidated pull request
Date: Mon,  3 Aug 2020 08:30:24 -0400
Message-Id: <cover.1596457310.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

This series contains two routine updates of 5.4. The -stable update and
a backport to fix a perf build issue with the new binutils (as reported
and debugged by Khem).

The other two are features that I've been working on for the fall release.
One is minor (the dangling kernel_features warning) and one is a
significant re-write of the kernel configuration auditing tools and has
been taking place over the past three weeks.

The dangling features change is just to allow more flexibility with
layers and the types of features they may be requesting. The details
are in the commit log. By default the behaviour is the same, so there
shouldn't be any issues (since if a feature is missing, someone's
build was already stopping).

The configuration queue one is an update of the symbol analysis to
include looking at the fragments to provide details when the common
question is asked "why didn't my config value make it into the .config".
We now get detailed forensics from within the kernel configuration
system (to deal with issues when something is selected, or not visible)
and also insight into what fragment(s) set values. The tweaks are run
both as part of the standard kernel-yocto build and through a dedicated
task for deugging.

I expect that the configuration update may trigger some warnings, since
it finds things that the old tools couldn't. As such, if it causes
any issues, just drop it from the queue and take the other patches. I
wasn't able to run all the builds for it, but did get through multiple
green builds on the AB and locally .. so this needs to get some wider
testing now.

Cheers,

Bruce


The following changes since commit 20e9df57217c5f37817653d2c3d492f2d4d37623:

  lib/oe/reproducible.py: Fix git HEAD check (2020-07-29 11:37:31 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/5.4: update to v5.4.53
  linux-yocto/5.4: fix perf build with binutils 2.35
  kernel/yocto: allow dangling KERNEL_FEATURES
  kernel-yocto: enhance configuration queue analysis capabilities

 meta/classes/kernel-yocto.bbclass             | 191 ++++++++++++++----
 .../kern-tools/kern-tools-native_git.bb       |   2 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  24 +--
 5 files changed, 175 insertions(+), 56 deletions(-)

-- 
2.19.1

