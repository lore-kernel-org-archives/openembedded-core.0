Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85441094489
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 15:32:07 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12971.1774107119312882815
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2026 08:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=YzSLHPXB;
 spf=pass (domain: baylibre.com, ip: 209.85.160.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50b2ebca625so23229311cf.0
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 08:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774107117; x=1774711917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jZFePLBlW98DSzr+ZRqbQz32l5ICXBntg0TW60+0V90=;
        b=YzSLHPXB69Ufh8dB/Tu0bEN4r121yLrRhFXGFVGzQUmg+j9nZHy4PVUIByTtEakYOj
         5Ckp0M9dkpS18++2Bk+UcskPfa1D7j39j/Ph9bBzqkEjCw0ZLg1Fa5YNG/AQ9wQSGfVF
         6Bbtm2ctrG5M6IdSQMmaBQRqYqJDLeqEjyr0otliO6/v7vOrqkq/3PLeo5PnqU2FX2B/
         hHW0oz1SmbxvzuX5wzy1M7/4/t15lUs/eb2GC8EoO4QV0qKEvx90Jy0hO8nS6JdP/vAz
         jA0gXWddit90M6LhQ9W32YlIurNm4/4cW6If+FU5t8vzlovIiEK81T4e5AF5EgXiYoXh
         dudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774107117; x=1774711917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZFePLBlW98DSzr+ZRqbQz32l5ICXBntg0TW60+0V90=;
        b=jqa5MjkkUg0eDYYUGpVTTia/wAt83fO0//bb6KPUZ0GoFgmqra0Klw98/k75NQ2GqM
         Fl7AUgpmiGUMgVAg83EQnCO1obM15D0cCyP7wdQelkiJKKKoK8saQ2yFT9nM+cCP0yVJ
         bc/Lo8sqQAuUMIhOlZfOerK02CUcZiM/ravws6UgqkUCB2Z/fKgS1lAyjT6AoDO87wVT
         DeWuZgsdJ4eCGVbBmPdktxFB25Pd5UV5dG1hEZtsjXTB09KGle2lpdyKxjvz+O1QtUck
         qRW6Nm5jb0P27Q21+6tefrT/AyW1oE+vxXKkROLw1fg3IVUXa1T+VJqH0cxDWQMl9Y81
         8dnQ==
X-Gm-Message-State: AOJu0YxmdN12OYCiurYv+Bwd5+RxH0PSRZaAufyJwlz57TfVMZaFhbPO
	0H7OrgMB3iw7Dsac9bqw6mqwCjeEGxT15a7DLJDnjUxnJbrRGKkGqK8KgWNeInpGVwBjvUzx+ds
	DoXLYlYA=
X-Gm-Gg: ATEYQzycPWRkO1ISI/yWbc3J37oy0uKBMSFgkuxHSDwanDVwecXYBbh4WIqYJpOkeRA
	sKh5s3dVXxIRp2unPhY31Z3/ruoEWYHz+UNF+7u41UzjsZG/C8TnBLrvUrr8qWGXQnHYZcspJnt
	dWoLEbUWiQmac4ZCqbvY/4Aku8R4TKULmog8SIEUCtHFZ5oNfj3BdD8NFlnFG/Yd17uzP89/zC8
	DkUv1Vc/S77jtVNSHbrOYNceWArbya2/uQjB4dhUBLJ4LfS6zfPb4wS/LFxZolHmg4y4c4BRYyY
	futXZGiOSdPZqqCZ37f/w+828ZmmxkvJdc4nqC6WYL6r+68dhlDQGLcutImThMUxYlw8a5ViY0r
	Kd1rlijHqCkMis6tNs8T5ENdjDBn4vVuPMmLeMFNA7vZ+BkJ1OfAqe11kl+GWuyMGqkNpos8A2G
	Gv7g4M+DofRq1kQrU+ryeT/0KEVAc=
X-Received: by 2002:ac8:7d93:0:b0:4ff:a8c1:b00e with SMTP id d75a77b69052e-50b245b42d3mr150807781cf.2.1774107117386;
        Sat, 21 Mar 2026 08:31:57 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36cf542dsm43005121cf.7.2026.03.21.08.31.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 08:31:56 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] Revert "grub: add patch to use medany for riscv64"
Date: Sat, 21 Mar 2026 11:31:54 -0400
Message-ID: <20260321153154.1816865-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 15:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233665

This reverts commit 2d8da77f28ed3fd7a5715fde02715c7d59f6b991.

This patch is still carried by Fedora, but is no longer a problem
anymore in grub 2.14+. See:

https://lists.gnu.org/archive/html/grub-devel/2026-03/msg00044.html
---
 ...any-instead-of-large-model-for-RISCV.patch | 39 -------------------
 meta/recipes-bsp/grub/grub2.inc               |  1 -
 2 files changed, 40 deletions(-)
 delete mode 100644 meta/recipes-bsp/grub/files/0263-Use-medany-instead-of-large-model-for-RISCV.patch

diff --git a/meta/recipes-bsp/grub/files/0263-Use-medany-instead-of-large-model-for-RISCV.patch b/meta/recipes-bsp/grub/files/0263-Use-medany-instead-of-large-model-for-RISCV.patch
deleted file mode 100644
index e10a116ae3..0000000000
--- a/meta/recipes-bsp/grub/files/0263-Use-medany-instead-of-large-model-for-RISCV.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From fcf4b96cfd3a04e1cfa177b08afba4fd80c9978e Mon Sep 17 00:00:00 2001
-From: Jason Montleon <jason@montleon.com>
-Date: Fri, 3 May 2024 13:18:37 -0400
-Subject: [PATCH] Use medany instead of large model for RISCV
-
-Upstream-Status: Submitted [https://savannah.gnu.org/bugs/?65909]
-
-Signed-off-by: Jason Montleon <jason@montleon.com>
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- configure.ac | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0d693f8..0289fe1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1653,7 +1653,7 @@ fi]
- 
- CFLAGS="$TARGET_CFLAGS"
- 
--if test "$target_cpu" = x86_64 || test "$target_cpu" = sparc64 || test "$target_cpu" = riscv64 ; then
-+if test "$target_cpu" = x86_64 || test "$target_cpu" = sparc64 ; then
-   # Use large model to support 4G memory
-   AC_CACHE_CHECK([whether option -mcmodel=large works], grub_cv_cc_mcmodel, [
-     CFLAGS="$TARGET_CFLAGS -mcmodel=large"
-@@ -1663,9 +1663,11 @@ if test "$target_cpu" = x86_64 || test "$target_cpu" = sparc64 || test "$target_
-   ])
-   if test "x$grub_cv_cc_mcmodel" = xyes; then
-     TARGET_CFLAGS="$TARGET_CFLAGS -mcmodel=large"
--  elif test "$target_cpu" = sparc64 || test "$target_cpu" = riscv64; then
-+  elif test "$target_cpu" = sparc64; then
-     TARGET_CFLAGS="$TARGET_CFLAGS -mcmodel=medany"
-   fi
-+elif test "$target_cpu" = riscv64 ; then
-+    TARGET_CFLAGS="$TARGET_CFLAGS -mcmodel=medany"
- fi
- 
- # Stack smashing protector.
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 7cdeff5edd..8c62315e69 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -19,7 +19,6 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0003-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
            file://0001-Revert-configure-Check-linker-for-image-base-support.patch \
            file://0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch \
-           file://0263-Use-medany-instead-of-large-model-for-RISCV.patch \
 "
 
 SRC_URI[sha256sum] = "d0415fbb3e739237064e173743a6e5f60c33a81ec02a069cc9152d80efff4967"
-- 
2.53.0


