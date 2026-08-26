Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD3FC61DC6
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 23:35:17 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25442.1787787312041304675
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 16:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fuEQZs2H;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482e257a23aso796083f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 16:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787787310; x=1788392110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zzKdMTyixJtiQxBIPa7dnpyi0s6unMAjm2qWHyh3k4A=;
        b=fuEQZs2Hxa2DDT4TpbPKxoYJp/ePQlT9Hzo3sU5DWa5zjkUGN4ynbzOprKWe08akkp
         /LUNF1n0u8EMybyvvyAwEPMq7xJqLgbGTTGpciOpq/icptNANUMss3V2SQsoMDfw+Ggy
         kk4HE9HD9HjwzT+rz5uJeb61xAryr3tOp1qxhLDIUeGvPlnKI5P36OXxyjnpZFHv02VW
         sPYmxUxC/iTHLegqU6dYBVe+B+rXGtJ3y0IwrqJp+J32Y6S2ZeIXcOlXb+S7To2AGu37
         P4J/XID+926HSJYLQ1erOyc2YfGBGmp8OWwhijAp7EQ+2E4KkObc3EooJwkl10q7NNvP
         R2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787787310; x=1788392110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zzKdMTyixJtiQxBIPa7dnpyi0s6unMAjm2qWHyh3k4A=;
        b=BVOjvgXllZ/zkVpJnu3rKC1pWpT0mhPk5+HOTzgBXLN5CmIGMgt12Sn9D9pbLn0cXi
         l7P955/qcWXMMKrgpLAk7IMupeECMnud0z5Tw8+rai3t1StguJeGaXt5RSaOu7OSIkCB
         UIMsaRWrH6npGmOKI15xKpLpdtaJ+bm7qQG3K0INvjjTKGdYlXq2nHmd/VwbbotsBZD8
         OR2SaGTWos1BzHTN13LUXXuRuuj52RpCKUSQ/rHxJ0GzS+zztI5SM6+6h5h27yyOj+V5
         AtEMWgS/Ky/cHIb8oT33bFMInwaYcHUr4qP2QTnWaz1snQ6j+IW8QtlJzIuql5N+OOr8
         Lz9g==
X-Gm-Message-State: AFuF++nsj1Uuv54lD5CFJ2NUBK07shIHOgdsFJlNIURM4O59fxgSNC1V
	GOcyG3Qj1QjId+hAWnKkXLa4CNA0Q3KfEB5WgejrkoS1Zk/RJqD9fZCFJs7B/noOrJA=
X-Gm-Gg: AR+sD12/Rn9GSYos6/qIVpCrOvnOV9JB1s0E8FTSUclQX2mHPdHKzqMXTh8K+BsEu8+
	SU+F+6dxrfT0iMqz40eNYnmt03CW1FKbK24MqnM1WiuGJGaIlQ5A9oEKke1gGiZmnq6YAC9dQ7O
	ochcgto9bSd6Hl8gMwhX4vMpzlEFbK4j2IpgoB42Vfl6+dFX24RqYQB5AXo83oegWKIDmBM8qOy
	o/fs6NJoS/katLCKK0pIRK7L0Yx1nDZVJuxnOgq14SsNseArmNCiwXx8oNPUWmXZZx9K8AsqOp5
	GyTxn8GJ2I2QUXBZnqkyjzsW4/1KfsPpLW+Gf8L4rO9QT1J+pVnRuK+oe1JnoEKjO1SQ7JXoCEe
	uSljrD/rC1i8F9gfjZEUlj1++aFeFmOkvc8pZ7hkdG+luYpRYLxooHYTlyzzvbucHeXqxk5PtGi
	IYkqTSdQZn9QigHLkPZRowEydsbH3Xp3/OVljSHTt9kAoJLcAAK96M1vL0IM4Xj8gNGoI2Ap8PN
	z/x2mUT7+Flbx+D001eh6d9x6Z8e6ogvSj15nw6qEvpy7EBbGntm7NS8PC8nzc3eUtnr24/kNLd
	CqaHhC7pBQ0=
X-Received: by 2002:a05:6000:3c9:b0:480:268:8f04 with SMTP id ffacd0b85a97d-482e26f855amr12763167f8f.11.1787787310258;
        Wed, 26 Aug 2026 16:35:10 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:f9af:e499:eded:1124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab569sm4586872f8f.16.2026.08.26.16.35.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 16:35:09 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Anis Bougrine <anis.bougrine10@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [OE-core][PATCH v7 2/5] kernel: re-sign kernel modules after package stripping process
Date: Thu, 27 Aug 2026 01:34:13 +0200
Message-ID: <20260826233416.37047-3-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260826233416.37047-1-anis.bougrine10@gmail.com>
References: <20260826233416.37047-1-anis.bougrine10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 23:35:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244437

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
index ab2f0d1c37..2b40437cc2 100644
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
 
@@ -42,6 +47,26 @@ KERNEL_MODULE_PACKAGE_PREFIX ?= ""
 KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
 KERNEL_MODULE_PROVIDE_VIRTUAL ?= "1"
 
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
+            ${@'M=%s' % oe.kernel_module.get_ext_mod(d) if not "virtual/kernel" in d.getVar('PROVIDES') else ''} \
+            modules_sign
+    fi
+}
+
 python split_kernel_module_packages () {
     import re
 
-- 
2.50.1 (Apple Git-155)


