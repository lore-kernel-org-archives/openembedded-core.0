Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF9FC43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:42 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.4132.1667832923527943959
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mvdjRrzy;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id y16so16550869wrt.12
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tw2DskQVNsSPZ8fy/dYKa9S1xsOJ0kQRT1SL/5unYOA=;
        b=mvdjRrzyLN+c04sWrM7VpokrKAB+qkvxZSz32st22soeaQAfRayMuqVCFBFzo3AM2s
         DeXJu2WnviPIuT3crKZARb8aGYATgbI9AlD+Ravl61ojTSHVnZlRzvI+sh4iKs5GL7bo
         EM66ddMRWXyx/Gq/ypJ4mUniEofmDwGDC2VGw2SPxmn0ank5UuiD25koTIzS+MCOAzKA
         SSLBZV/zv2p19gUTVBdlNPhBe7GuqEAyZxA4S2HFo7PgsBlHfP7dqOZZOvQLrZYSwcJo
         H0sT6HgEsvp9UBK5lladC3HFZsm9rLgs2Zk5px/H75c2q/Cfv/Na8VVhP3HKPyYv4tc2
         r/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tw2DskQVNsSPZ8fy/dYKa9S1xsOJ0kQRT1SL/5unYOA=;
        b=2lZpnIf4aJdfdL49bZv0wIT6rfM5gBqAeNqxrDh92MMyzS37zyS9l8WN5clpGu36th
         sbjAxuSVCTSoHsHbzE0b65QmivPWkhlieLQPqWZu+NYteDsELu2rXsFhNCLdIuvCOg38
         VHcW8QcumhWmkasCYr5igD/biW0gWZa7FULluSI5igtboLDluRpvF7VG55UhFDs+KBKf
         eilV8OAxsaXVZiO1Lz+ThaTfkxeibpNdSkofMootnKBmgw9gP3Wwne6YOp1Ibx5+DIMk
         5ce1FJgRCYIxxGI8D9hJAvLg9S746Y9Z2joeAxVeSN/Uwezth/A8+uStSDbugAy7xGZP
         0w0w==
X-Gm-Message-State: ACrzQf0eVDXgXeAxeR1CrqQLYNHl6nB5MGs4naX/kEwFhpW4KyPQ4WpG
	UL4wUzyp3I0/qOGluCVaqtt7oFvx5WY=
X-Google-Smtp-Source: AMsMyM71v01D0vYpqDS4IQ6/tRfpsU4+gQT+kiUjt0Uuz4LzE40hUdBjLtX7tUcR9bv6iKBwD2GtAA==
X-Received: by 2002:a5d:6d0b:0:b0:236:f055:e561 with SMTP id e11-20020a5d6d0b000000b00236f055e561mr18527502wrq.166.1667832937590;
        Mon, 07 Nov 2022 06:55:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/48] libffi: upgrade 3.4.2 -> 3.4.4
Date: Mon,  7 Nov 2022 15:54:44 +0100
Message-Id: <20221107145508.1051404-24-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172874

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-arm-sysv-reverted-clang-VFP-mitigation.patch     | 6 ++----
 meta/recipes-support/libffi/libffi/not-win32.patch        | 8 ++++----
 .../libffi/{libffi_3.4.2.bb => libffi_3.4.4.bb}           | 4 ++--
 3 files changed, 8 insertions(+), 10 deletions(-)
 rename meta/recipes-support/libffi/{libffi_3.4.2.bb => libffi_3.4.4.bb} (90%)

diff --git a/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch b/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch
index 4233799501..3ffcb3e128 100644
--- a/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch
+++ b/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch
@@ -1,4 +1,4 @@
-From 501a6b55853af549fae72723e74271f2a4ec7cf6 Mon Sep 17 00:00:00 2001
+From 000f1500b693a84880d2da49b77b1113f98dde35 Mon Sep 17 00:00:00 2001
 From: Brett Warren <brett.warren@arm.com>
 Date: Fri, 27 Nov 2020 15:28:42 +0000
 Subject: [PATCH] arm/sysv: reverted clang VFP mitigation
@@ -13,6 +13,7 @@ has been reverted.
 
 Upstream-Status: Submitted [https://github.com/libffi/libffi/pull/747]
 Signed-off-by: Brett Warren <brett.warren@arm.com>
+
 ---
  src/arm/sysv.S | 33 ---------------------------------
  1 file changed, 33 deletions(-)
@@ -99,6 +100,3 @@ index fb36213..e4272a1 100644
  	b	call_epilogue
  E(ARM_TYPE_INT64)
  	ldr	r1, [r2, #4]
--- 
-2.25.1
-
diff --git a/meta/recipes-support/libffi/libffi/not-win32.patch b/meta/recipes-support/libffi/libffi/not-win32.patch
index 62daaf4b38..38f9b0025c 100644
--- a/meta/recipes-support/libffi/libffi/not-win32.patch
+++ b/meta/recipes-support/libffi/libffi/not-win32.patch
@@ -1,4 +1,4 @@
-From 306719369a0d3608b4ff2737de74ae284788a14b Mon Sep 17 00:00:00 2001
+From 20bc4e03442e15965ae3907013e9a177878f0323 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 4 Feb 2016 16:22:50 +0000
 Subject: [PATCH] libffi: ensure sysroot paths are not in libffi.pc
@@ -21,11 +21,11 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index b764368..d51ce91 100644
+index 7e8cd98..cf37e88 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -354,7 +354,7 @@ AC_ARG_ENABLE(multi-os-directory,
-                           
+@@ -405,7 +405,7 @@ AC_ARG_ENABLE(multi-os-directory,
+ 
  # These variables are only ever used when we cross-build to X86_WIN32.
  # And we only support this with GCC, so...
 -if test "x$GCC" = "xyes"; then
diff --git a/meta/recipes-support/libffi/libffi_3.4.2.bb b/meta/recipes-support/libffi/libffi_3.4.4.bb
similarity index 90%
rename from meta/recipes-support/libffi/libffi_3.4.2.bb
rename to meta/recipes-support/libffi/libffi_3.4.4.bb
index 41c3cad586..15d974c83e 100644
--- a/meta/recipes-support/libffi/libffi_3.4.2.bb
+++ b/meta/recipes-support/libffi/libffi_3.4.4.bb
@@ -8,13 +8,13 @@ library really only provides the lowest, machine dependent layer of a fully feat
 A layer must exist above `libffi' that handles type conversions for values passed between the two languages."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=679b5c9bdc79a2b93ee574e193e7a7bc"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=32c0d09a0641daf4903e5d61cc8f23a8"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            file://0001-arm-sysv-reverted-clang-VFP-mitigation.patch \
            "
-SRC_URI[sha256sum] = "540fb721619a6aba3bdeef7d940d8e9e0e6d2c193595bc243241b77ff9e93620"
+SRC_URI[sha256sum] = "d66c56ad259a82cf2a9dfc408b32bf5da52371500b84745f7fb8b645712df676"
 
 EXTRA_OECONF += "--disable-builddir --disable-exec-static-tramp"
 EXTRA_OECONF:class-native += "--with-gcc-arch=generic"
-- 
2.30.2


