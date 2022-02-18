Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A53EC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:55 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.9186.1645178814244471925
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=abii2aoK;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id m27so1844761wrb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kFmaIn6KKAnd62e6QXFoKlb/V84sWa3y2wjep4wK8kk=;
        b=abii2aoKcdYAFOptiiGpm8foE/x6vBcSheJfynN+Yy8TC5+h0D/K6KzElcxlZ6uAxR
         bgh85gzctmGa09oUbUEI/4u2SNyDU0d4CyOP+wSlltpdDGmgAOF2NgtgvmGqy94l7WwZ
         UhB2jZlMljAPT4ctyj4jrsMc234njdxhL/z4+kB0zAHaEGr5fpoO0bfUtfEWnaouinsA
         ++tqFEHAIgN1sToaxjZ4XhPrfn7ywtJdaXA4WtsHN1g+zL+z39AcmxTh6jQ3zHNnuIX7
         LTOyvpvIbCbdjGg4Bh/W8IqMBDg6qXBuyAa1dXKPjpIjH6u1JUNBh2y/UiVCoMk5MGhe
         SMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kFmaIn6KKAnd62e6QXFoKlb/V84sWa3y2wjep4wK8kk=;
        b=y1nInuVzJY8FiNnO351CAqWKXuCKVOEI+LGBRhDpXmZm+OzKl4XWW37SjGQhlrA/by
         C6WYagzV8cLpvsqhEG64EGjo1XlIIUTIY413hOBD1qYjOgYNyE+0l9uJZCXduQVByMr3
         zNYya5MN9XX342cokqarXngzVja4WpmoFe5B4eKwjBM2sOx2w5b/5ha8h95uCykaviow
         w5MPpCCI8WPgLr9+3wTocTK+YeW7jOeUAn+V+xiaK0l+Zl+9RFh5OoGLzufrGvWAHg4I
         qhomJ5Iv4HyzHiLpfarztsiBHmNQ79pXfpWlVIVEQUaY61GBPsVsijI59S3WVWZPZPpw
         856A==
X-Gm-Message-State: AOAM532CTrbSM+n+1ysSFQFe8W8pA2zPjjHHH55Rstljg+K12e2Vrluq
	m4KJqL4esqm42rdGlO3eJQYm/3RmlYc=
X-Google-Smtp-Source: 
 ABdhPJzg2jWujAPgiM4kevyiP+RMnirAA4m+2aajTnVgd9qsLfYXKsyAl4dOKjh+BR/ZAuoA+EVslg==
X-Received: by 2002:adf:c382:0:b0:1e3:1be3:cc38 with SMTP id
 p2-20020adfc382000000b001e31be3cc38mr5402675wrf.368.1645178812823;
        Fri, 18 Feb 2022 02:06:52 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:52 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 34/46][dunfell] grub: fix a possible integer overflow
Date: Fri, 18 Feb 2022 11:05:42 +0100
Message-Id: <20220218100554.1315511-35-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161922

This patch adds a fix for a possible integer overflow in grub's
video/fb/video_fb. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...deo_fb-Fix-possible-integer-overflow.patch | 39 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0034-video-fb-video_fb-Fix-possible-integer-overflow.patch

diff --git a/meta/recipes-bsp/grub/files/0034-video-fb-video_fb-Fix-possible-integer-overflow.patch b/meta/recipes-bsp/grub/files/0034-video-fb-video_fb-Fix-possible-integer-overflow.patch
new file mode 100644
index 0000000000..c82b2c7df0
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0034-video-fb-video_fb-Fix-possible-integer-overflow.patch
@@ -0,0 +1,39 @@
+From aac5574ff340a665ccc78d4c3d61596ac67acbbe Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Fri, 4 Dec 2020 14:51:30 +0000
+Subject: [PATCH] video/fb/video_fb: Fix possible integer overflow
+
+It is minimal possibility that the values being used here will overflow.
+So, change the code to use the safemath function grub_mul() to ensure
+that doesn't happen.
+
+Fixes: CID 73761
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=08413f2f4edec0e2d9bf15f836f6ee5ca2e379cb]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/video/fb/video_fb.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/video/fb/video_fb.c b/grub-core/video/fb/video_fb.c
+index 1c9a138..ae6b89f 100644
+--- a/grub-core/video/fb/video_fb.c
++++ b/grub-core/video/fb/video_fb.c
+@@ -1537,7 +1537,13 @@ doublebuf_pageflipping_init (struct grub_video_mode_info *mode_info,
+ 			     volatile void *page1_ptr)
+ {
+   grub_err_t err;
+-  grub_size_t page_size = mode_info->pitch * mode_info->height;
++  grub_size_t page_size = 0;
++
++  if (grub_mul (mode_info->pitch, mode_info->height, &page_size))
++    {
++      /* Shouldn't happen, but if it does we've a bug. */
++      return GRUB_ERR_BUG;
++    }
+ 
+   framebuffer.offscreen_buffer = grub_malloc (page_size);
+   if (! framebuffer.offscreen_buffer)
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 8b5b9e3b3e..04c9b4c092 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -80,6 +80,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0031-video-efi_gop-Remove-unnecessary-return-value-of-gru.patch \
            file://0032-video-fb-fbfill-Fix-potential-integer-overflow.patch \
            file://0033-video-fb-video_fb-Fix-multiple-integer-overflows.patch \
+           file://0034-video-fb-video_fb-Fix-possible-integer-overflow.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


