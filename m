Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7FCC5AD5A
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 20:29:43 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15688.1786307380945273787
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 13:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PlvnBcv7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-495635a85d2so11109045e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 13:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786307379; x=1786912179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4L9zUlEXwytpJ/wHneW6pS05qMJP305KtUZCjcBjefA=;
        b=PlvnBcv7PR5oe1frSVVELR36tjc7qR5r/azHLAAGo0tInw1HvDKLlrFHBMfybviA1W
         sc17iDGKzix33VP0NOI7oQRiXCBwjlleTGF9tbxWrrTFKslFe42kCQLMZ9XjvwUrzpYP
         weFZ+aNsAoGAh56AJcDhmBNYo5xj5T3SArC10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307379; x=1786912179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4L9zUlEXwytpJ/wHneW6pS05qMJP305KtUZCjcBjefA=;
        b=F9D/g0zMVw8fwGLy7jELNquTYeZ6+nZKgdTVCZdhE6xFk2WQ8Ms8Tn2Op3thK8DmMM
         vYukWSCcLWiwY3EcHR9VFS6s1N1TLExJ6wTnC0w8QhIMfITouMEj7gPgP2MkaK19Un23
         nHoJbqBfoNFaDZ6KaRN3N5Ie6yucJrPjEET0TbBEpsIfoUyuMM0zccL0vB6WUcgrP+sU
         raXoQcxURZ0lBARxZqMyJQ4ym+CbszEchIkIe/ltFCcSUxFLITAEAFRds9YVTW/r23s6
         dNtziqor3YNVCpk2FRI8pDHNmiZ4ctCXZxfo0f+6TV1PJTFr+1PDyoUbT2a2KmEOUfhE
         aQFg==
X-Gm-Message-State: AOJu0YyaGEMM0Oo8NKZFmFjd5cY/qliy811nU333XW8+gB2uaXDyRNGo
	L9j0ayMtIFMrGgH3s2hzf4PylWIkTksE7UjaENdFrv2w5xl6SIrFL30gElP+LynQPpIRs8gWbbW
	K9odaWVA=
X-Gm-Gg: AR+sD11GPxPeWFMkryuYUdgtuyseJv56cp86VV2597o+uGB4H8BqS3cbasNEyniTMYb
	QQ/4R3vMT5ucg5B5BDdLH3OAdFjTXg4heHWAzqRJTYIFnf/3BaKDEzrmPetYdyUM8b6wmlkf62a
	4q8Y83uYxfpJLssnoLyzCtcQAyzA0HURLyTdwIrtCylzuyvJxY1cIa8JsU7ltVJZws3SULJT9qh
	iZ2R2um/mFoySXHEH5ST/9bPncfajeYDCCddZhHKUd1RJTUy+mqPyq5yHpkq3MlDY15P1OqjC+K
	WstO1yoyEXaEdU8gX9gZfo+Nv3rcDlNmnjlNq/5ZyjgRBdBOUGjMIp8uwYCpuMNvG0p7usRAIJX
	VPF2jjUFclfwAHwBlfPv7G9Xvy1tY3f0J+e17p+KL+x4kE6BOhl5kNyn3iKCOSrTZq0yjfWpk03
	GLggpi8wq4Xey5GJ2YTt1f0i9Rig6OyVhuABkOVn1hVN4Oz7Xg7wESV0l10W/jb38LVYzPEOoze
	Z5+oOcYktIV2C2y9g==
X-Received: by 2002:a05:600c:1c19:b0:499:5220:db3d with SMTP id 5b1f17b1804b1-4995220db75mr442581805e9.16.1786307378465;
        Sun, 09 Aug 2026 13:29:38 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:50cd:e139:7482:bd41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f8b9bsm31267873f8f.25.2026.08.09.13.29.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:29:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] libffi: upgrade 3.7.1 -> 3.8.0
Date: Sun,  9 Aug 2026 21:29:32 +0100
Message-ID: <20260809202935.1904858-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 20:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243075

3.8.0 August-8-2026
    Add FFI_TYPE_VECTOR (SIMD) type support with libffi-computed
      layout, for aarch64 and x86-64 (#1000, closes #773).
    Add ffi_call_plan_size to report the total memory a reusable call
      plan owns, for embedders that account for the memory held by
      long-lived plans.
    Add powerpc64 ELFv2 _Complex long double support for both
      IBM-128 (double-double) and IEEE-128 formats (#1003, closes #1001).
    Fix powerpc64 big-endian ELFv2 closures returning 5-, 6-, or
      7-byte structs: missing return jump-table entries produced a
      wrong result and leaked a libffi code pointer.
    Fix ia64 return-value jump-table desync after the FFI_TYPE_LAST
      bump, which corrupted small-struct and HFA returns.
    Fix powerpc Darwin closure returns broken by #951 (#1002).
    Return small (1, 2, 4 or 8 byte) structs in registers on the i386
      FreeBSD and OpenBSD targets, matching the platform ABI and
      fixing a segfault on struct returns through ffi_call and closures.
    Cache the static trampoline "unsupported" result on hosts whose
      page size exceeds the trampoline table mapping, avoiding
      redundant re-initialization on every closure allocation
      (e.g. 64K-page aarch64).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libffi/libffi/not-win32.patch            | 4 ++--
 .../libffi/{libffi_3.7.1.bb => libffi_3.8.0.bb}               | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libffi/{libffi_3.7.1.bb => libffi_3.8.0.bb} (94%)

diff --git a/meta/recipes-support/libffi/libffi/not-win32.patch b/meta/recipes-support/libffi/libffi/not-win32.patch
index 1f77db2fe03..8808f502fba 100644
--- a/meta/recipes-support/libffi/libffi/not-win32.patch
+++ b/meta/recipes-support/libffi/libffi/not-win32.patch
@@ -1,4 +1,4 @@
-From 3b0ec51416b341cdb681796bd52dfe86d0d9bea0 Mon Sep 17 00:00:00 2001
+From 4f0da02754f86ec1aa38b2207872386b19605ec1 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 4 Feb 2016 16:22:50 +0000
 Subject: [PATCH] libffi: ensure sysroot paths are not in libffi.pc
@@ -20,7 +20,7 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 3370acc..2f96c6f 100644
+index 826b453..54a41d8 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -429,7 +429,7 @@ AC_ARG_ENABLE(multi-os-directory,
diff --git a/meta/recipes-support/libffi/libffi_3.7.1.bb b/meta/recipes-support/libffi/libffi_3.8.0.bb
similarity index 94%
rename from meta/recipes-support/libffi/libffi_3.7.1.bb
rename to meta/recipes-support/libffi/libffi_3.8.0.bb
index e9afb7eb7c5..583b1431579 100644
--- a/meta/recipes-support/libffi/libffi_3.7.1.bb
+++ b/meta/recipes-support/libffi/libffi_3.8.0.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5e9a8df556846bb3d1edec0d968a2311"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            "
-SRC_URI[sha256sum] = "d5e9a6638ddbd2513ddb54518eb67e4bbe6fa707bcc01c10f6212f0a088d819d"
+SRC_URI[sha256sum] = "7da3e2d9a171eb0a038f592ecad3ff2bb2550f3496d87b3b29ad0cf4430c0db4"
 
 EXTRA_OECONF = "--disable-builddir"
 EXTRA_OECONF:class-native += "--with-gcc-arch=generic"

