Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C89FAC54EBE
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 00:39:14 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.59747.1673224745715929993
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 16:39:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TIqF2FL6;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id p17so5232663qvn.1
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 16:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oRyY1CExvhdyChf5JaHapJyJ1TfLBTINDLdRPhSkMUQ=;
        b=TIqF2FL6OjF0wi49TrXsyVqFOSpItvRcEMuCfhVdKgNoDN/icNK2sWthDZnJ7z83Bp
         9qHIlwFJIJ0hyObFSU+zT7ws4dVjxlxFBBdpu8D7Y8VMHNuBrSdqhlkvhw7AQR62jheb
         bi8VFXxSK+Z0m8+DRq9eokc0n1H6qz7gteAxqHwF2ToxAf0vsXiIdLi73828H5g/07Mu
         MGCRZq1PA3EpfvtTBzTV7oWNa+0yrNdQSGvqWrBL9HnFQpdmDq9f7PJ3VrOMUXUmj8Wh
         9Ug/gU8KYU28YY/6XFGZAnrMtLwpioTJt3ZcwjdrfrJnqMoahHJRaSEESdYs082TI0ZJ
         SiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRyY1CExvhdyChf5JaHapJyJ1TfLBTINDLdRPhSkMUQ=;
        b=otL33fsD5oORfccsL8z+3jGJdeApO8wiztJY+lGosK6QXvR1QiFOUPrj40eDh29uLW
         x9oWvGx2KLgSe/A97ClRMbpchFzWVlRRtCwixF62gaPOPx9sztTKpImZlNIeTzKPC+y5
         myiRkFwyWqynp2F9952wLF6SKB8iUE2HDDYZ6B8s49kfXtPeEkdT7EjlaQkPxPyL+14B
         zYNaES+oe8J+4NJqOuuokcNTc7+6zYE2xM668iqZAguN9mka09EYtwDzSzGA+n5sxKEZ
         qh82N2VPIup4ZIo0VM7CPt0rFjueFjzb1/kX9h88030504QGw3u1c+Mqe7/cagKx+Eia
         nY5g==
X-Gm-Message-State: AFqh2koOhYLAJdtvpQ/K1dArEDWeUJUpED3618N3C9ceQmJD21HjRsNQ
	8sy7fpg/Mx5ARoTm+nA6P9k=
X-Google-Smtp-Source: AMrXdXte2/5sCPmUs9J13JDKZ9bx99HmuPu36QYbvZHKdT75fxCph6YtBGraT961AiXAOJjlofpjQw==
X-Received: by 2002:a0c:d64f:0:b0:531:e83e:c28e with SMTP id e15-20020a0cd64f000000b00531e83ec28emr22566587qvj.0.1673224744647;
        Sun, 08 Jan 2023 16:39:04 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id i1-20020a05620a248100b006fc9fe67e34sm4529980qkn.81.2023.01.08.16.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:39:04 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/14]]v2] kernel: consolidated pull request
Date: Sun,  8 Jan 2023 19:38:47 -0500
Message-Id: <cover.1673224444.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 00:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175641

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

This is v2 of the libc-headers and reference kernel bump that I
sent before Christmas. It is largely the same, but I've addressed
the one warning that popped up for qemuarm, as well as stacking
more -stable commits on top of the previously sent changes.

Once this merges, I'll move onto removing 5.19 and we can get the
h/w references updated.

v1 of the cover letter follows:

Most of these are -stable udpates, mixed in are a couple of clang fixes
from Khem, and of course the bigger items of the libc-headers bump and
the v6.1 reference kernel recipes.

I've built both musl and glibc for all architectures with the new libc
headers, and sent patches last week for issues that I found in core or
meta-oe.

That being said, I'm sure there's something .. somewhere lurking, but
there's no sense sitting on it longer.

As for the 6.1 reference kernel, I've done the same. Built and booted
core-image-minimal, sato and kernel dev on all architectures. The changes
sent before the last release meant that our normal culprits of lttng-modules
and kernel-devsrc don't need any tweaking to work. -rt has also been
tested.

We can't make 6.1 the default yet, as the reference h/w BSPs need to
be updated, and then 5.19 removed. But again, no sense sitting on these
longer.

I'm around full time for the rest of this week, and then off and on
through the first week of January to squash any fallout from the
updates.

Cheers,

Bruce



The following changes since commit 7f556c68619377224560066e92a88469919b335b:

  bitbake: cooker: Clean up inotify idle handler (2023-01-06 17:40:01 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (14):
  yocto-bsps/5.15: update to v5.15.78
  linux-yocto/5.15: update to v5.15.80
  linux-yocto/5.19: fix perf build with clang
  linux-yocto/5.15: ltp and squashfs fixes
  linux-libc-headers: bump to 6.1
  linux-yocto: introduce v6.1 reference kernel recipes
  linux-yocto/5.15: fix perf build with clang
  linux-yocto/5.15: libbpf: Fix build warning on ref_ctr_off
  linux-yocto/5.15: update to v5.15.84
  linux-yocto/6.1: update to v6.1.1
  linux-yocto/5.15: powerpc: Fix reschedule bug in KUAP-unlocked user
    copy
  linux-yocto/5.19: powerpc: Fix reschedule bug in KUAP-unlocked user
    copy
  linux-yocto/6.1: update to v6.1.3
  linux-yocto/6.1: cfg: remove CONFIG_ARM_CRYPTO

 .../linux/linux-yocto_5.15.bbappend           | 16 ++---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...d-input-and-output-files-instead-of-.patch | 67 ------------------
 ...ders_5.19.bb => linux-libc-headers_6.1.bb} |  5 +-
 .../linux/linux-yocto-rt_5.15.bb              |  6 +-
 .../linux/linux-yocto-rt_5.19.bb              |  4 +-
 .../linux/linux-yocto-rt_6.1.bb               | 45 ++++++++++++
 .../linux/linux-yocto-tiny_5.15.bb            |  6 +-
 .../linux/linux-yocto-tiny_5.19.bb            |  4 +-
 .../linux/linux-yocto-tiny_6.1.bb             | 30 ++++++++
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++----
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 22 +++---
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 70 +++++++++++++++++++
 13 files changed, 190 insertions(+), 113 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.19.bb => linux-libc-headers_6.1.bb} (70%)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_6.1.bb

-- 
2.34.1


