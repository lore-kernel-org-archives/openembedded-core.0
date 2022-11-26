Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B39EC46467
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:15:16 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.70813.1669472109551557357
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=2b1NVW2R;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id a22-20020a17090a6d9600b0021896eb5554so10018120pjk.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3pwL/DJyv0wpTGgR02+RZh826T8EPpRTS03PMzDUF0=;
        b=2b1NVW2RnaID09YpWivcR5UJv/tMTrOrMO9CfNuIHN8eomXrvKvzTD4/Ykiqa6ZMkt
         Vm8txrjciorJfiywrsrnXoN+SJafcCi2SV0OPT6WXf1QiaD+CeVoeIl+6yak1/44/iOA
         1YXg6rgNtbG//J/3tXA2fOYQ3sj2KtpIfgEVdjA3epBb7hCf67K2TG+ViO9dx3pjNLOR
         VzoY9KVwoxmZpn3Fvbu7DWVuwpcV8hHpXoYmL0Dt9bV5Y/PmxnSrVkCAFl4I2tT4s8Fb
         rKGWilSYZ5y1fDDJDLqrr3grphnmFqssXPVQw7iSourFO/rPtIco7FYlJEiXoa4o6Ejl
         gPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3pwL/DJyv0wpTGgR02+RZh826T8EPpRTS03PMzDUF0=;
        b=zd/EPWTQrZ5h07v6bqusRZRPquL/ESKVvep7FPL0nHdhzcr2qO0+BafeYMpRqHfcty
         I6FwQUFe52iOhMVTi5WEVKXkDqK5H5eozIlkRaoHHETEvVugtX8pI3A8PdXy2G5q9Dvf
         z61X1UfNISlQfU62bcmla9lTWRylQtHAff+5Wkb32dByRNnmVKe0v5jXKXuIt4Wt1GFE
         9WlUQuf17fIlyNKl99uNtf6VceW8QwjxTBJpRHIYUgEyTAS4LVzEFaDeC5SRolBcSfZK
         rckgTv+OZrmge2VgftlipZfwnq/i/y0ShET032DwV8yxA5kBszq8rQoZFHnLZNyAK62F
         NINA==
X-Gm-Message-State: ANoB5plVAk3sxmyX4CSU8z1DQJaN9PjZPxdAq8/qHtaHCoeFNnCwwDde
	1tF0d08TdnIRzw0nqk0xVBfS8/NjICYcBrXjbCU=
X-Google-Smtp-Source: AA0mqf5p1IkCLjGVBInAJv1c8JHS4OWFmvS3uKLCJy/iyVlfNItCn2OAGaDcdCCmCnYqllbORRtDQA==
X-Received: by 2002:a17:903:41c8:b0:187:3932:6422 with SMTP id u8-20020a17090341c800b0018739326422mr23249524ple.135.1669472107064;
        Sat, 26 Nov 2022 06:15:07 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 05/37] libffi: upgrade 3.4.2 -> 3.4.4
Date: Sat, 26 Nov 2022 04:14:09 -1000
Message-Id: <a9adc3c60a1afee650f1d711ce0d943ca72f35d5.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173798

From: Alexander Kanavin <alex.kanavin@gmail.com>

3.4.4 Oct-23-2022
    Important aarch64 fixes, including support for linux builds
      with Link Time Optimization (-flto).
    Fix x86 stdcall stack alignment.
    Fix x86 Windows msvc assembler compatibility.
    Fix moxie and or1k small structure args.

3.4.3 Sep-19-22
    All struct args are passed by value, regardless of size, as per ABIs.
    Enable static trampolines for Cygwin.
    Add support for Loongson's LoongArch64 architecture.
    Fix x32 static trampolines.
    Fix 32-bit x86 stdcall stack corruption.
    Fix ILP32 aarch64 support.

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 5b42ba98ef26a52bad8de1790b402938fec4a160)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


