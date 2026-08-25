Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4617CC61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 20:50:08 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32363.1787691007382233030
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 13:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=A4osxpi4;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso982885e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 13:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787691006; x=1788295806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qcAY5phukPhDG9j6gQXxCiC7402vHsTFsP0BZvHX64c=;
        b=A4osxpi4875ehYysv2RYm/odzsQlhPT2Hbr+nEs5giVocrrNa8l7m0DLplMmzD/Ff+
         vEchFcXoA3wvOa1+0NxhFEogF6T5UUPYvlc2eJYAeMwkIqH37/q6uSDK3OEcGdnPTscc
         Gv2K7XDvoVS4eYnq34z/JGqPRtZjMSTKuiUf8Mw9mFUnsEqhuonj4Zkiny1XxR/s+CGE
         5D2BsiqZyzTAznx0iaCamS4kT0ELYOOBAnnC8/8VybaHiUdeF+uix1Szaaf80JJ6XwDh
         TLMuPKxzDYMEFL8++bteNIZkuwNT1y9iyRtoAWHZ8+mhxGtfJna9mE44ID8O04WZdY0k
         saiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787691006; x=1788295806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qcAY5phukPhDG9j6gQXxCiC7402vHsTFsP0BZvHX64c=;
        b=hePLkp8i7IBKJrXyat1/J01csksqT3/0l13xjYnD4YwUqndleqOKmev/fx6mzYFxlN
         +mpu9KALzwzxFHEiaGMy+o4qcbQxRZidoMutXbuzNU1BgFqD/qaa88qZwI8gWOhqgcN8
         Q6MDSUMiDwg4Sd1sHLCq9OBHpZQT/vf/OojZfWinYpu9NyDSFSHz01RdnztK9XNNaDaU
         uoNx18d9zaIO/tA7T83EyzEuqZyLBTLN8jmCMm8YiN7Q83ZFNTEIeoaGb9PFcC6AKNbd
         e3YhU0J6wEfqBn6YtTMLx9G2fSD7SSo9V44ezyCZGU5Laaz+ZZOeNd2j5xGlOAToxfEd
         rFxQ==
X-Gm-Message-State: AFuF++luZIwXF1JJ85aNodTDBpg3gIS4PpMsYEd54iPF//SBRNxfGLYb
	uWvLYhXyN2WmujxM+mrMeRV1hovCzeqAAJfmQDyM+NkMNAEDsB4jjIEwjGMnHOJa+6Y=
X-Gm-Gg: AR+sD1132/Ax7eXcooIrp5XMZJs7Fm4g71mX//8ip5kKViuCalc896hZzDqzh6dVbcT
	rZUwSFWBY4AiyYCi5q+m+tt8w/1DatT8L5QAhFsvPyHN30uRpQnFZeNOVUhfSL8brBy3lljI4SO
	A3VrdY8Nj+CRH6nfQEZTvBSos7K3fzwBacEE6ki6tX6ytuwqemSR4PKZrY8UB4B01BoKLSS39Zb
	3yjBIiO4HfFRufVd4mMDxyuDgg2/Q7QK3SRUtsMY2jt6x/O5nl3AsGSXEQQXrsIrEULuUBOzqe8
	O5s18/3E7loZN4UJPgpD4r8gZcDCrPZd5ppGN4YJDyZt6A8qX7OaIb6NwskEv8HULb/FipM11K7
	092JxLvNPylPH8A2La9RssEufztFd8MA/fokecWyEDX76uwD6U+FoxgAW2epwaLGey2jqZx3gwY
	QqnxIqgTcOHck2dnmla6c9dEx/vn64/cssDJ6jJ0zQK53Q3xUjkCHHZ3Ok7xW/ERx0xbX91ArsA
	aN78fJXullF4517Z+bMtbJlSmST1ruxAiX62KOKVVwpKni0W1q0dGICzXDHxQIjmEXTEJYgkLOb
	HPNNFO541/cl
X-Received: by 2002:a05:600c:4505:b0:499:8ff5:8ec4 with SMTP id 5b1f17b1804b1-499dc6e4095mr16994435e9.3.1787691005564;
        Tue, 25 Aug 2026 13:50:05 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:f9af:e499:eded:1124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca98095sm4507845e9.5.2026.08.25.13.50.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 25 Aug 2026 13:50:05 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	richard.purdie@linuxfoundation.org,
	peter.kjellerstedt@axis.com,
	Anis Bougrine <anis.bougrine10@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [OE-core][PATCH v5 2/5] kernel: re-sign kernel modules after package stripping process
Date: Tue, 25 Aug 2026 22:49:27 +0200
Message-ID: <20260825204931.17628-3-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260825204931.17628-1-anis.bougrine10@gmail.com>
References: <20260825204931.17628-1-anis.bougrine10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 20:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244276

Fixes [YOCTO #12927]

Currently, signed kernel modules are not stripped in order to preserve
their valid signatures. See commit 4c47e5f.

Therefore, this commit makes kernel modules stripped and correctly
signed. Two options are possible:

    - Strip the kernel modules after installation and before signing.
    - Re-sign the kernel modules after stripping and before package splitting.

The first option was rejected because debug symbols would be dropped early
in the build workflow, which may impact the SPDX process.

The second option is adopted because it does not impact the build flow.

Reported-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
---
 .../kernel-module-split.bbclass               | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index bde7cd02dd..da7b30e99f 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -35,6 +35,11 @@ modprobedir ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${nonarch_b
 
 KERNEL_SPLIT_MODULES ?= "1"
 PACKAGESPLITFUNCS =+ "split_kernel_module_packages"
+# Order matters:
+# 1. Strip the modules
+# 2. Re-sign the modules (if enabled)
+# 3. Split the packages
+PACKAGESPLITFUNCS =+ "post_strip_kernel_modules_signing"
 
 KERNEL_MODULES_META_PACKAGE ?= "${@ d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-modules"
 
@@ -63,6 +68,26 @@ def get_ext_mod(d):
 
     return d.getVar("S")
 
+# This function supports both in-tree and out-of-tree modules.
+post_strip_kernel_modules_signing(){
+    # Read .config values to determine if module auto-signing is enabled
+    is_modules="$(${STAGING_KERNEL_DIR}/scripts/config --file ${KBUILD_OUTPUT}/.config --state MODULES)"
+    is_module_sig="$(${STAGING_KERNEL_DIR}/scripts/config --file ${KBUILD_OUTPUT}/.config --state MODULE_SIG)"
+    is_module_sig_all="$(${STAGING_KERNEL_DIR}/scripts/config --file ${KBUILD_OUTPUT}/.config --state MODULE_SIG_ALL)"
+
+    if [ "$is_modules" = "y" ] && [ "$is_module_sig" = "y" ] && [ "$is_module_sig_all" = "y" ]; then
+        # Sign modules under ${PKGD}, with M= if out-of-tree module.
+        # Out-of-tree module Makefiles invoke the kernel Makefile by appending M= (the module directory) to MAKEFLAGS.
+        # However, they usually do not provide a modules_sign target. Therefore, the kernel modules_sign target has to
+        # be invoked manually after retrieving M= variable from package source code Makefile.
+        oe_runmake \
+            -C ${KBUILD_OUTPUT}  \
+            MODLIB=${PKGD}${nonarch_base_libdir}/modules/${KERNEL_VERSION} \
+            ${@'M=${@get_ext_mod(d)}' if not "virtual/kernel" in d.getVar('PROVIDES') else ''} \
+            modules_sign
+    fi
+}
+
 python split_kernel_module_packages () {
     import re
 
-- 
2.50.1 (Apple Git-155)


