Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA850C44536
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:37 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2869.1784568216325678844
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aYA2jH9d;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4955adb04e8so11202705e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568214; x=1785173014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iYgjVOrWsXhvBDvkj2S7izmW+6Wn48H51ZpGpSauhEY=;
        b=aYA2jH9dzq6TAnZVIP/OucUp4ywcw/8g4evtFBg7CmA0O3ILqOlR90ic94s6jXfuAU
         oVdOYL0eWwquNi3rvn272pdTUznsD3nYpA1u7G+9aj4z6MlYzRWujYSPwzVY4KjcboKC
         EKeYxGjZz8RUZNnGjQpv4aCODRExnDDdKq3ZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568214; x=1785173014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iYgjVOrWsXhvBDvkj2S7izmW+6Wn48H51ZpGpSauhEY=;
        b=m3qGJRhACNZ3MyCtU3a1bGDRg4KZn4FGUEj+ryjAGs9nk6vmTmqjqcLopWlZfROM6j
         J2yG987XmV1+J8VrxV7ksBCtJoyqVeenwZRfVB0c06wWmgev9hxXIew7qlECvoqSgm6P
         E8vX7tcB1FTawUzd+ycvMruDopWRTrO5470FsSmLBDilJxYi9O1xGREusuD3qe6xRiuo
         3ouN1QMYzu8CG68i0zvnQ1AKdkSiXP2sFJHzXOGKB7XYJ8hgn6vnAAv8newP40cT7n2m
         b8LarjjRxxxhpNxm7EjbNE4VNvT/RrK+vRARwvrsIJusfNJ/IjmGhYa5CFNL0BeMGNwK
         vtMg==
X-Gm-Message-State: AOJu0YyZ5mr8LUMFNtF6nO2tlBxYRQNjOVfLIy8PalpeydgYeZZbg6sH
	dpafvVrlfJ4b9odYE8kgXnzG27aOsCbF4IgxNyYu2xyMR7I9aGiL/5W4GJmbw79ATw70F1ZOFf5
	+1M9+rGI=
X-Gm-Gg: AfdE7cnqGyeRfsdEbBTRvCt5TO5/ivf/uILxvy5UHZs96iUp7SrwH0PHknm9SIfJhG6
	akxjjBYhwUagENQMB8k9V4PutfwA1P4s3seja9v6aI4mqjly76LB83Coh3C5Fi0z++irJ7Q8KkU
	dCVDfOX9fXPdOmCzoi10dhA09CgI223eMppQQb585Z/bYxKyu/n9IKR/XFFuMlkUi0wOz5KViEa
	Soco4EgOcYqzXCtuwfYJzCzIQTDCCLs9jc9CKXQ9DKmjZnb80AdQF+tx5JPheG5F/05HeHjt/t+
	2S5Is0U5IZTKfmV/kF9AEZdmWnJy+htK8aYjF0wO0dDlKZpFQgd+ZzM5bWwpburqhaHrFUANCGD
	uluCLGFy5B6lbb1xg/rmhng6wbSO80sxbVpw55hOZI5j6iW2oLsXPWqQZFt3hOXe+9FfXvYmY66
	SgdZljD2HGqN1Un0hWoWXptQpwOzwBHWCNv/gObnojXiDWyDNAy7tUMLjC+k5UXF1Pl2VIVlAov
	r8XWSzo
X-Received: by 2002:a05:600c:4585:b0:495:3eb2:b763 with SMTP id 5b1f17b1804b1-4954a50c51bmr162749635e9.21.1784568214549;
        Mon, 20 Jul 2026 10:23:34 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/33] bzip2: Fix CVE-2026-42250
Date: Mon, 20 Jul 2026 19:22:44 +0200
Message-ID: <2ae360e0f03c70f376226f4cbb5fd7d61b7bae99.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241445

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

This patch applies the upstream fix as referenced in [1], using the commit shown in [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-42250
[2] https://sourceware.org/cgit/bzip2/commit/?id=35d122a3df8b0cc4082a4d89fdc6ee99f375fe67

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bf39a3c0497023e96de11444579ffef31f968bcd)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../bzip2/bzip2/CVE-2026-42250.patch          | 35 +++++++++++++++++++
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-extended/bzip2/bzip2/CVE-2026-42250.patch

diff --git a/meta/recipes-extended/bzip2/bzip2/CVE-2026-42250.patch b/meta/recipes-extended/bzip2/bzip2/CVE-2026-42250.patch
new file mode 100644
index 00000000000..1679e744478
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2/CVE-2026-42250.patch
@@ -0,0 +1,35 @@
+From 71bf61d2e664c754ae5b1eb04018c8eaf5f99ae3 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Thu, 28 May 2026 16:15:45 +0200
+Subject: [PATCH] bzip2recover: Make sure to not process more than
+ BZ_MAX_HANDLED_BLOCKS
+
+There is an off-by-one in the check before calling tooManyBlocks. This
+causes the scanning loop to run one more time and cause a possible
+read or write one past the global bStart, bEnd, rbStart and rbEnd
+buffers. There are no known exploits of this issue and you will need
+to compile with something like gcc -fsanitize=address (ASAN
+AddressSanitizer) to observe the faulty read/write.
+
+This has been assigned CVE-2026-42250.
+
+CVE: CVE-2026-42250
+Upstream-Status: Backport [https://sourceware.org/cgit/bzip2/commit/?id=35d122a3df8b0cc4082a4d89fdc6ee99f375fe67]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bzip2recover.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bzip2recover.c b/bzip2recover.c
+index a8131e0..4b1c219 100644
+--- a/bzip2recover.c
++++ b/bzip2recover.c
+@@ -402,7 +402,7 @@ Int32 main ( Int32 argc, Char** argv )
+             rbEnd[rbCtr] = bEnd[currBlock];
+             rbCtr++;
+          }
+-         if (currBlock >= BZ_MAX_HANDLED_BLOCKS)
++         if (currBlock >= BZ_MAX_HANDLED_BLOCKS - 1)
+             tooManyBlocks(BZ_MAX_HANDLED_BLOCKS);
+          currBlock++;
+ 
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index f9224908685..b661bc95465 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
            file://configure.ac;subdir=${BP} \
            file://Makefile.am;subdir=${BP} \
            file://run-ptest \
+           file://CVE-2026-42250.patch;subdir=${BP} \
            "
 SRC_URI[md5sum] = "67e051268d0c475ea773822f7500d0e5"
 SRC_URI[sha256sum] = "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"

