Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62E9C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:41 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.14672.1639070740684952446
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 09:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XyeJENLF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id v11so10902620wrw.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 09:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o3frlBnCGYaUXcivF4ROgWnGhV0dh8jpsTR3IJFyvgg=;
        b=XyeJENLFcWpcxjhVq+3FKXOGS+aecQR/JIWPmMNFP+oB6gp8hu0yuvY1M3RzIz7TKM
         dMAKHsf3Cp72/byX94D6l2RY9gwC7QprchIz1AtlIaeyu4HfrWrWw1soRTKmFdnyE48e
         lZu43TO38R+i5LeZ+uYQRip5M353mil1qzkHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o3frlBnCGYaUXcivF4ROgWnGhV0dh8jpsTR3IJFyvgg=;
        b=zfVOXo8QP33GWw533W40bT1rrOvP1tJw8eM9DYPAp81dd9SvMoJ1SGOqyNJCZbdXCT
         s3KclpX6g/F+jc4J0a+FcXv7kddM/ot8tnaX5JDcFguk3+eICHsK01EKSup72RaCpHP7
         zZFhnZbfjRdCh+dWw+iVLQ6R7a2EOzWv16jUskU5q+/gcFWFacMkdLnJ6pi0cg/Zawg2
         HSxAlq3oznW0FqKJWV0t23iR33T/uW+JNPxiMinLjcdPskZ3DEo4Wag8L0SGyWr90js+
         B9yHDPXj2ErKFH7MgfOZj0x+ZUa26gR7XAbg5cqTs31Abo5xVSqutKwXY2EcWYzZ3OW+
         My3Q==
X-Gm-Message-State: AOAM530trJpFo2gp/KO0KzC1R4aqGsl1ry/oIAGI/Ky2sXmVGXYSSYF1
	GuwvTiBCJ3k93idHuViNRHc23Q1jJ62T4w==
X-Google-Smtp-Source: 
 ABdhPJzbReUkCpKs7ftk651rcxT6jkLzaKAMwanzTZauUGDYqQpzQ0fgJtH5lzn2qiS1cDRmSN1J4Q==
X-Received: by 2002:a5d:650f:: with SMTP id x15mr8025878wru.201.1639070738334;
        Thu, 09 Dec 2021 09:25:38 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:cb2b:2e37:1385:897e])
        by smtp.gmail.com with ESMTPSA id i7sm304146wro.58.2021.12.09.09.25.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:38 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] binutils: Drop mips gold patch
Date: Thu,  9 Dec 2021 17:25:34 +0000
Message-Id: <20211209172537.641755-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 17:25:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159464

As mentioned in a followup to the patch upstream:

https://sourceware.org/legacy-ml/binutils/2016-08/msg00215.html

"With 2.16.1, --enable-gold is just ignored when building on mips"

so we don't need the patch since 2.16.1.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../binutils/binutils-2.37.inc                |  1 -
 .../0012-Detect-64-bit-MIPS-targets.patch     | 47 -------------------
 2 files changed, 48 deletions(-)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0012-Detect-64-bit-MIPS-targets.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.37.inc b/meta/recipes-devtools/binutils/binutils-2.37.inc
index 8f91c6460d7..a3e0fbc769d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.37.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.37.inc
@@ -29,7 +29,6 @@ SRC_URI = "\
      file://0009-Change-default-emulation-for-mips64-linux.patch \
      file://0010-Add-support-for-Netlogic-XLP.patch \
      file://0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
-     file://0012-Detect-64-bit-MIPS-targets.patch \
      file://0013-Use-libtool-2.4.patch \
      file://0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/0012-Detect-64-bit-MIPS-targets.patch b/meta/recipes-devtools/binutils/binutils/0012-Detect-64-bit-MIPS-targets.patch
deleted file mode 100644
index 04f81c66718..00000000000
--- a/meta/recipes-devtools/binutils/binutils/0012-Detect-64-bit-MIPS-targets.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 02374940dd34fddd2b04624af3f23e01f9cb81cd Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 31 Mar 2017 11:42:03 -0700
-Subject: [PATCH] Detect 64-bit MIPS targets
-
-Add mips64 target triplets and default to N64
-
-Upstream-Status: Submitted
-https://sourceware.org/ml/binutils/2016-08/msg00048.html
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gold/configure.tgt | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/gold/configure.tgt b/gold/configure.tgt
-index cac0866e628..24fbf641456 100644
---- a/gold/configure.tgt
-+++ b/gold/configure.tgt
-@@ -153,6 +153,13 @@ aarch64*-*)
-  targ_big_endian=false
-  targ_extra_big_endian=true
-  ;;
-+mips*64*el*-*-*|mips*64*le*-*-*)
-+ targ_obj=mips
-+ targ_machine=EM_MIPS_RS3_LE
-+ targ_size=64
-+ targ_big_endian=false
-+ targ_extra_big_endian=true
-+ ;;
- mips*el*-*-*|mips*le*-*-*)
-  targ_obj=mips
-  targ_machine=EM_MIPS_RS3_LE
-@@ -160,6 +167,13 @@ mips*el*-*-*|mips*le*-*-*)
-  targ_big_endian=false
-  targ_extra_big_endian=true
-  ;;
-+mips*64*-*-*)
-+ targ_obj=mips
-+ targ_machine=EM_MIPS
-+ targ_size=64
-+ targ_big_endian=true
-+ targ_extra_big_endian=false
-+ ;;
- mips*-*-*)
-  targ_obj=mips
-  targ_machine=EM_MIPS
-- 
2.32.0


