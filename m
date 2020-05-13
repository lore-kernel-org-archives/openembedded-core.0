Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.7084.1589379879398830282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 07:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NVb9iwGW;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id n14so17472281qke.8
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 07:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W0Cs5SmY8OvL3wLlJLY5EgnT3Dn9G4eSmjJx63bL+yY=;
        b=NVb9iwGWuhNvc/ASCFHmBdjHHYPVIJfTP/q4Lhp17pZXKKbIXcrziUVb0U26TMM3Rj
         NAY7WKs4RRA6eZTWEQgTM04m2rHiFArmHmDF7Yldv/kdh+jz3VDR7xoKGwtaErEAB96J
         3BTn3Rb5iyTG8PUAnYpKTEm1CtPpQYY+09Hr8CKRgdSzH3f6AQ3qJfQITo3ikdINkzsO
         Day/d/rBit/Og0C/WejUet/rIiD9at900xfq+7HtyFcJ0+s8VdUp8SqUC9CAriN64MLs
         ickwaLZUQFSQPMVoE3JO3f2IEE4vc3tE1SmxNIkz8XQrrlz0DWBEvuMR1g24EOJ3uc0t
         cTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W0Cs5SmY8OvL3wLlJLY5EgnT3Dn9G4eSmjJx63bL+yY=;
        b=IxApCqi/uIyfq5A8aGxHBvopMETSfypNr8cONvEKubYsEMg+YXWSM/mKYjhAS1wSwY
         ACcQ0W5jZ/ZtfF1Ncy/8QbSy+aUIcf6hIK+mzyGg96FoUguHJbfYUqkEEUEFztyTG2bG
         qsMIq3AktmXicot6/q/uCgIsScICmt4cbIqFZTJcp6tjqrg62+IGe6UXMCXBvLKzlwkL
         eR8mvbczfXnDL7vYPJehrofyiv+YpIqkZD2CtgRS3/3WsR9BA3mkUR0fdJg0pdxbezKQ
         qL2oBzWKzCM1MJtImWS6yRIG+k9zonWb0FkO62j7KJPT6vD3RfEjNeAQfCcfWuwnRCgN
         WfVw==
X-Gm-Message-State: AOAM532Wab0gb7ak29vXSaWX5qkJOeAKhlDPpACIgMIO0t3ZEe1V+e9p
	4SmyuzkO5cqnm/u9/F2rLZ0=
X-Google-Smtp-Source: ABdhPJzwYMj6eZ5RAefOXyG9rfQu3oCySSMgcd+HYXwrEfiz1g+LZtyWZQTIgsrdw1Fjoa+i3q2fIg==
X-Received: by 2002:ae9:dc47:: with SMTP id q68mr3947215qkf.17.1589379878506;
        Wed, 13 May 2020 07:24:38 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id 5sm10138445qkl.101.2020.05.13.07.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 07:24:37 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Subject: [PATCH 0/4] kernel/kernel-yocto: consolidated pull request
Date: Wed, 13 May 2020 10:24:32 -0400
Message-Id: <cover.1589378829.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

This is a resend of the v5.4 stable bump to v5.4.38, plus a new -stable
bump to v5.4.40.

The extra changes to make these pass the AB tests are the kernel
reproducibility commits.

The issue we had on the last submission was that IKHEADERS was switched
to a module, and hence was failing reproducibility tests as we didn't
have the timestamp variables exported for the module build. It has
always been a problem, just one we hadn't hit.

I've left the fix as two commits on purpose, since the copy of the
reproducibility export fixes the problem, and is definitely safe for dunfell,
and the second commit is my effort to remove the duplication of logic and
create a common python routine they can call. I've used the techniques for
subprocess running that I've done in other kernel build elements, but if they
aren't the right ones to use, point me in the right direction.

All said, these are green on the AB and should be ok for master and
dunfell.

Cheers,

Bruce

The following changes since commit b5763b2f480a9b994103debf02f1d11a92c27238:

  bitbake: lib/bs4/testing.py: fix bs4 testing (2020-05-05 13:22:29 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/5.4: update to v5.4.38
  linux-yocto/5.4: update to v5.4.40
  kernel/reproducibility: kernel modules need SOURCE_DATE_EPOCH export
  kernel/reproducibility: factor kernel source epoch for common use

 meta/classes/kernel.bbclass                   | 34 ++++++++++++-------
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_5.4.bb             |  8 ++---
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++++++------
 4 files changed, 40 insertions(+), 30 deletions(-)

-- 
2.19.1

