Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E673AC61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:23:59 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7795.1787732633422343613
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nOXm7LDf;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-499b6c02b02so1338285e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 01:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787732632; x=1788337432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZxbmmJDyEL6NdOzDIkIC6oG5e1O4HuUiWgKD6jrpw0=;
        b=nOXm7LDf72IW45uTK/tcgUyo5hcL3ccTJd4lu9RyAk9idERWDJcixeB90YGF/OdrUN
         1Hk+nrUc0NFex5FqGiIyMPdON67CQ18Llesliahq5XYKK8aaTcJVNC5npTNSNBJ4TwU6
         33hup2f9RQvnAJ80k6guDUvvnzv/Ot8yGfyOlZwk3rNEuR8Dc66F7GVeiJe6BFbBCmM4
         a4g7Khi3bqO5XVAG3EEbuoq6+MLNSUZAD49aWxW2B1ZxwgN+Q1K3DlIrTkX1majDF1Vv
         zFFSl1VcJa3Oxcenb8J6G8x2MwQDtzhlTqGSm88CdUVy+I54fi+hD7/njo93FTPXlnRW
         YIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787732632; x=1788337432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EZxbmmJDyEL6NdOzDIkIC6oG5e1O4HuUiWgKD6jrpw0=;
        b=drgLbBsSQpFTkrX0eyhLmS9rQg8laPgkKtPbNURa3oYicrlhwAOCULoK2TfZSAL6Bk
         QC93yaQPx1disNnW7NOT+AkUcngzjG6ByHWPoS+Ii7CmK/AJH8U8PK6x5nXBavcY0lxH
         RV4SS6BgLSLLKW0DLb0TMZ/yo2Dv0BlgNRnIS/ZWcCcEgPkgP6OiqVBglhlkB46JYnhX
         FgIswy88NIfbsELdaV5EUu1W0utbE9aAYNSlYu3mKIMJQa3cDUY9EcpjQ+3ta4qOOSyy
         vLt6u8oxPWexUAQNF3GqR7Jcg8ZewmCpRN+rJrVziRII2fAzTpmCCzQlIUYCY2N89/ct
         Rs7Q==
X-Gm-Message-State: AFuF++n7RDEIXxmC10nXq//1QkoGVQQUbFkn49NZC+t3imEj5X6oZIjn
	PiK/q973EEBLdhAiGqHFPvH2rIV2M8s/wSf82uA9p8SPUO0VFJGRlVWlWf04vU0Oh3Q=
X-Gm-Gg: AR+sD10eSih2OsULMj9y3tQYrP3qJy0wkRtLeu/egIISgCDvoZ42aRAmz278kGRL+ow
	sACEwnEiSzJyiB2diOddKYMpRD2UgqfgzHkL92+N0JVXVYBFNGiGOcH8yNyvDnyAab39PNrRJvN
	L4lC4gkNX8FAP33YB26rTsxa0XjKc72/BQqkuSNgjcJyqbbgFv3eeB1A0Xs+agValKSy9j7KhVn
	72yAN4Oybg97j3iOGREfJI4hQDrZljzolQcKTbEKLPod2N4/r6ZX1Fp16GaD1wdVvh5xAkVwT0O
	qXPQg77sM57KrZp1L3MpYz/R3r5fuH169fxnt2KSrVYXTJgK5GFXf9l31rpXXQInqnyaPODLT8z
	aNrKQJ0llVdZiLyDwFfLIV+0FZ+07XPf9ytVv6ScNhd0z0CUpMihNYMHt7I4Qvg6C4Jpex8jYmv
	wWsAYnRB8afjrD3549BvYiCt452ErYqq+K+iW94TZK07vmX0tXtpD5QptfCdYAROF6efMuReumX
	Q949j22Ebu4/HTuvk/TXGv+yFnq7VNt+T3zCAt0Yfq9zHC9oOaGyNLxkkBoukJ6VbWYuR8XIQk6
	f+KLi78ViOOFbPgoWfjz5A==
X-Received: by 2002:a05:600c:a12:b0:499:dae2:c613 with SMTP id 5b1f17b1804b1-499dc81cca1mr37017205e9.12.1787732631241;
        Wed, 26 Aug 2026 01:23:51 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:f9af:e499:eded:1124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8b84esm17933655e9.1.2026.08.26.01.23.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 01:23:51 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	richard.purdie@linuxfoundation.org,
	peter.kjellerstedt@axis.com,
	antonin.godard@bootlin.com,
	Anis Bougrine <anis.bougrine10@gmail.com>
Subject: [OE-core][PATCH v6 4/5] kernel: centralize kernel module installation path in one variable
Date: Wed, 26 Aug 2026 10:23:20 +0200
Message-ID: <20260826082321.22104-5-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260826082321.22104-1-anis.bougrine10@gmail.com>
References: <20260826082321.22104-1-anis.bougrine10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:23:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244363

The kernel module installation path is currently defined in multiple
places, although it is used 10 times throughout the code. This
increases the risk of bugs due to inconsistencies or desynchronization.

Centralizing the path in a single variable makes the code more
reliable and easier to maintain.

This commit introduce KERNEL_MODULE_INSTALL_PREFIX to resolve this issue.

Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
---
 meta/classes-recipe/kernel-arch.bbclass         |  1 +
 meta/classes-recipe/kernel-module-split.bbclass |  2 +-
 meta/classes-recipe/kernel.bbclass              | 12 ++++++------
 meta/classes-recipe/module.bbclass              |  2 +-
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 26b8a1a67f..91cceb8dc1 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -10,6 +10,7 @@ TARGET_CC_KERNEL_ARCH ?= ""
 TARGET_LD_KERNEL_ARCH ?= ""
 TARGET_AR_KERNEL_ARCH ?= ""
 TARGET_OBJCOPY_KERNEL_ARCH ?= ""
+KERNEL_MODULE_INSTALL_PREFIX ?= "${nonarch_base_libdir}/modules/${KERNEL_VERSION}"
 
 KERNEL_CC:toolchain-gcc = "${CCACHE}${HOST_PREFIX}gcc ${TARGET_CC_KERNEL_ARCH} \
  -fuse-ld=bfd ${DEBUG_PREFIX_MAP} \
diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index da7b30e99f..158fa98c50 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -82,7 +82,7 @@ post_strip_kernel_modules_signing(){
         # be invoked manually after retrieving M= variable from package source code Makefile.
         oe_runmake \
             -C ${KBUILD_OUTPUT}  \
-            MODLIB=${PKGD}${nonarch_base_libdir}/modules/${KERNEL_VERSION} \
+            MODLIB=${PKGD}${KERNEL_MODULE_INSTALL_PREFIX} \
             ${@'M=${@get_ext_mod(d)}' if not "virtual/kernel" in d.getVar('PROVIDES') else ''} \
             modules_sign
     fi
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index a82bdf7ecb..0a6d754108 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -453,11 +453,11 @@ kernel_do_install() {
 	#
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${firmwaredir} modules_install
-		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
-		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
+		oe_runmake DEPMOD=echo MODLIB=${D}${KERNEL_MODULE_INSTALL_PREFIX} INSTALL_FW_PATH=${D}${firmwaredir} modules_install
+		rm -f "${D}${KERNEL_MODULE_INSTALL_PREFIX}/build"
+		rm -f "${D}${KERNEL_MODULE_INSTALL_PREFIX}/source"
 		# Remove empty module directories to prevent QA issues
-		[ -d "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" ] && find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type d -empty -delete
+		[ -d "${D}${KERNEL_MODULE_INSTALL_PREFIX}/kernel" ] && find "${D}${KERNEL_MODULE_INSTALL_PREFIX}/kernel" -type d -empty -delete
 	else
 		bbnote "no modules to install"
 	fi
@@ -680,9 +680,9 @@ EXPORT_FUNCTIONS do_compile do_transform_kernel do_transform_bundled_initramfs d
 # kernel-image becomes kernel-image-${KERNEL_VERSION}
 PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-dbg"
 FILES:${PN} = ""
-FILES:${KERNEL_PACKAGE_NAME}-base = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.modinfo"
+FILES:${KERNEL_PACKAGE_NAME}-base = "${KERNEL_MODULE_INSTALL_PREFIX}/modules.order ${KERNEL_MODULE_INSTALL_PREFIX}/modules.builtin ${KERNEL_MODULE_INSTALL_PREFIX}/modules.builtin.modinfo"
 FILES:${KERNEL_PACKAGE_NAME}-image = ""
-FILES:${KERNEL_PACKAGE_NAME}-dev = "/${KERNEL_IMAGEDEST}/System.map* /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
+FILES:${KERNEL_PACKAGE_NAME}-dev = "/${KERNEL_IMAGEDEST}/System.map* /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config* ${KERNEL_SRC_PATH} ${KERNEL_MODULE_INSTALL_PREFIX}/build"
 FILES:${KERNEL_PACKAGE_NAME}-vmlinux = "/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION_NAME}"
 FILES:${KERNEL_PACKAGE_NAME}-modules = ""
 FILES:${KERNEL_PACKAGE_NAME}-dbg = "/usr/lib/debug /usr/src/debug"
diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/module.bbclass
index ce5898125b..985c24bed5 100644
--- a/meta/classes-recipe/module.bbclass
+++ b/meta/classes-recipe/module.bbclass
@@ -46,7 +46,7 @@ module_do_compile() {
 
 module_do_install() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-	oe_runmake DEPMOD=echo MODLIB="${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}" \
+	oe_runmake DEPMOD=echo MODLIB="${D}${KERNEL_MODULE_INSTALL_PREFIX}" \
 	           INSTALL_FW_PATH="${D}${firmwaredir}" \
 	           CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" \
 	           STRIP="${KERNEL_STRIP}" \
-- 
2.50.1 (Apple Git-155)


