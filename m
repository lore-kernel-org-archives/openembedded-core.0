Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F531C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:28:12 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.6943.1645799291292771947
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Szh615ya;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 gl14-20020a17090b120e00b001bc2182c3d5so7567119pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r3T4N70ecjrvua634zK2XaxpdIvLazkCiTvVrSdTOp4=;
        b=Szh615yaWicdPgwSYN4YW/phzQSz4TtLj2jm11r/Kwbfn2MVGsTtGXcKeEX94AaC/y
         cJMV5bePiORZOtNuyWBIetZpE4lHbPqJ9bwnGoCmDJ3TgqcjppCnzc1aVNksRGwpkgYh
         BTMuKnBEp5QNFbHtPMJFh+BYUboMp0VWVs6Mu5ybg1Ietkwif9u3BMiQnW5X7pRN8cyA
         13x0sfTBu/XKcXE+jTaNy2dhBizGwzGfrcrlJ3VzGTw3FMyTsH1LXm01mGSpAvcjLVVU
         uVm9QIt7eikLuAyJ5oq7GUIXitzNf3TfKepqIo4fb6FhmnvpxggRvGMrkv9R/HazlAwm
         44aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r3T4N70ecjrvua634zK2XaxpdIvLazkCiTvVrSdTOp4=;
        b=DmPIzphAiwsQI9VOoSnENM8j234sgbErJlx8lSz3F9xw4Dw3v+orsm2jW8n0sxMxI1
         xTGjOLkRnbrMPBir7dToMVy0LUrycWmQoLToaGWkIBZovALJIfQ7wi3wYfEaIwbABaRt
         woZ1ivgYBYYVCLJ4UmuO7435ymVBQg/jTccHuv/9nhVFNX1UVdqngd+B5qWWFMIUgWi+
         D40yqdrpWIlvBADWAHw3oUt3qVnErDgSAVW80rgYCQm0Ly9Ia5j6paXrQ9/Dfzsyc8Kv
         v41hFZhiY+jK2WC2z6qbn+7ZQdEDKOapjtrXTCjPjukix3Vx3mqhkLU/WhlN8r4QL6W2
         SjIA==
X-Gm-Message-State: AOAM530yqwP3wdpV75lBmBvCdNorsIOIhJIUzN2cu9eqDCRyrEDEs8AC
	snyZcfDjGBTl2oUBYCJPy+Jcy6eCuAM82QHE
X-Google-Smtp-Source: 
 ABdhPJxFcrXmdnRFcZZV1bSDBgiaGZay4htm3Zz3SJPoExamigJ576wpIqOGBlQtZ/RguKobhwn7rQ==
X-Received: by 2002:a17:903:2301:b0:150:140:c69e with SMTP id
 d1-20020a170903230100b001500140c69emr7637331plh.82.1645799290311;
        Fri, 25 Feb 2022 06:28:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.28.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:28:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 36/50] grub: fix an integer overflow
Date: Fri, 25 Feb 2022 04:26:16 -1000
Message-Id: 
 <fbf3260bd196a5d252ad5ccf2a5fe719d3bd9c7f.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:28:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162382

From: Marta Rybczynska <rybczynska@gmail.com>

This patch adds a fix for a potential integer overflow in grub's
video/fb/fbfill. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...bfill-Fix-potential-integer-overflow.patch | 78 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0032-video-fb-fbfill-Fix-potential-integer-overflow.patch

diff --git a/meta/recipes-bsp/grub/files/0032-video-fb-fbfill-Fix-potential-integer-overflow.patch b/meta/recipes-bsp/grub/files/0032-video-fb-fbfill-Fix-potential-integer-overflow.patch
new file mode 100644
index 0000000000..8165ea3f71
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0032-video-fb-fbfill-Fix-potential-integer-overflow.patch
@@ -0,0 +1,78 @@
+From 99ecf5a44b99d529a6405fe276bedcefa3657a0a Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Wed, 4 Nov 2020 15:10:51 +0000
+Subject: [PATCH] video/fb/fbfill: Fix potential integer overflow
+
+The multiplication of 2 unsigned 32-bit integers may overflow before
+promotion to unsigned 64-bit. We should ensure that the multiplication
+is done with overflow detection. Additionally, use grub_sub() for
+subtraction.
+
+Fixes: CID 73640, CID 73697, CID 73702, CID 73823
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Signed-off-by: Marco A Benatto <mbenatto@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=7ce3259f67ac2cd93acb0ec0080c24b3b69e66c6]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/video/fb/fbfill.c | 17 +++++++++++++----
+ 1 file changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/grub-core/video/fb/fbfill.c b/grub-core/video/fb/fbfill.c
+index 11816d0..a37acd1 100644
+--- a/grub-core/video/fb/fbfill.c
++++ b/grub-core/video/fb/fbfill.c
+@@ -31,6 +31,7 @@
+ #include <grub/fbfill.h>
+ #include <grub/fbutil.h>
+ #include <grub/types.h>
++#include <grub/safemath.h>
+ #include <grub/video.h>
+ 
+ /* Generic filler that works for every supported mode.  */
+@@ -61,7 +62,9 @@ grub_video_fbfill_direct32 (struct grub_video_fbblit_info *dst,
+ 
+   /* Calculate the number of bytes to advance from the end of one line
+      to the beginning of the next line.  */
+-  rowskip = dst->mode_info->pitch - dst->mode_info->bytes_per_pixel * width;
++  if (grub_mul (dst->mode_info->bytes_per_pixel, width, &rowskip) ||
++      grub_sub (dst->mode_info->pitch, rowskip, &rowskip))
++    return;
+ 
+   /* Get the start address.  */
+   dstptr = grub_video_fb_get_video_ptr (dst, x, y);
+@@ -98,7 +101,9 @@ grub_video_fbfill_direct24 (struct grub_video_fbblit_info *dst,
+ #endif
+   /* Calculate the number of bytes to advance from the end of one line
+      to the beginning of the next line.  */
+-  rowskip = dst->mode_info->pitch - dst->mode_info->bytes_per_pixel * width;
++  if (grub_mul (dst->mode_info->bytes_per_pixel, width, &rowskip) ||
++      grub_sub (dst->mode_info->pitch, rowskip, &rowskip))
++    return;
+ 
+   /* Get the start address.  */
+   dstptr = grub_video_fb_get_video_ptr (dst, x, y);
+@@ -131,7 +136,9 @@ grub_video_fbfill_direct16 (struct grub_video_fbblit_info *dst,
+ 
+   /* Calculate the number of bytes to advance from the end of one line
+      to the beginning of the next line.  */
+-  rowskip = (dst->mode_info->pitch - dst->mode_info->bytes_per_pixel * width);
++  if (grub_mul (dst->mode_info->bytes_per_pixel, width, &rowskip) ||
++      grub_sub (dst->mode_info->pitch, rowskip, &rowskip))
++    return;
+ 
+   /* Get the start address.  */
+   dstptr = grub_video_fb_get_video_ptr (dst, x, y);
+@@ -161,7 +168,9 @@ grub_video_fbfill_direct8 (struct grub_video_fbblit_info *dst,
+ 
+   /* Calculate the number of bytes to advance from the end of one line
+      to the beginning of the next line.  */
+-  rowskip = dst->mode_info->pitch - dst->mode_info->bytes_per_pixel * width;
++  if (grub_mul (dst->mode_info->bytes_per_pixel, width, &rowskip) ||
++      grub_sub (dst->mode_info->pitch, rowskip, &rowskip))
++    return;
+ 
+   /* Get the start address.  */
+   dstptr = grub_video_fb_get_video_ptr (dst, x, y);
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 24a269d90d..710ab5e361 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -78,6 +78,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0029-normal-completion-Fix-leaking-of-memory-when-process.patch \
            file://0030-commands-hashsum-Fix-a-memory-leak.patch \
            file://0031-video-efi_gop-Remove-unnecessary-return-value-of-gru.patch \
+           file://0032-video-fb-fbfill-Fix-potential-integer-overflow.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


