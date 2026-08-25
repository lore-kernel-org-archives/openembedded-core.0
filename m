Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FE5C61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 20:50:18 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31931.1787691011092642551
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 13:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aq42cwhR;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-499b0eefa61so909465e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 13:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787691009; x=1788295809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZxbmmJDyEL6NdOzDIkIC6oG5e1O4HuUiWgKD6jrpw0=;
        b=aq42cwhRkNVP1aJmN6d5Ky5U3+r8f0ti1hHOzLT6s+7g25HKQ1mqrzG79xzVWKtV0H
         UD61jaERR6ZUcyuTxcqwZl0fAcvHDoAl6Uamw6kLovv5N+M6Tt5je5urG3uxgU2Yen+T
         gOc8BD4sFkWym+rWBN391LEn5JfTc9uX5fDUahgxhBNu/lSoPWKX/jS+HoA1t1BDa9VQ
         qco2j8URohFqqS9FOQXF26hYz9aa5cX1ny3Eslw+rbO08t0iwawsOARYCo9Mx69kccaI
         c3HUdGnsw1RrFvQc3QceWkQslMVvf0Tk2+dafSd+L4O0sUPdNUdVAJDl8kjBJtULpAPE
         eO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787691009; x=1788295809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EZxbmmJDyEL6NdOzDIkIC6oG5e1O4HuUiWgKD6jrpw0=;
        b=eE7h1nTWpjLsWdo6dYqnnAhIHY3C9IS0qz4P8Le39SOW+F6Af/PPrRxcNbOZ6ahuvF
         oKV7rZ3Hzba246ntYgJ5bBQ3wanO6bDwKn880LXA/ByuJgi0TsbZ83wvYXkpruaFnaYr
         ElTWYWfGzMwbyfDG+r5OlSPcOCmHdS7057vkbb2MCzz5XEJlU0kTqxyg3KH+qM5A98h8
         4q7HHYBqxvCGfMwgte3odYvRQsXeTLHmSPvSPiZ7e75vFlHfurFi8bFGdnpKdtJNqe6s
         pf1vx9PClCZXRYoBAfTVR8ZMzQVSdFRq0pvSsdUF0L/s7jdALH/h5W7CjyI0dWueFUAf
         DDNA==
X-Gm-Message-State: AFuF++k7sQh0i9MNnO/fe2pERqMgwbSNGD/WPwGo0NdIrxvLHiWWELHh
	NhcslYvZaYCPWLyK2pOAmIPiknmfYVsYciKbNYVR8yMwYkDe4eI1SyXVq5zvuJ67O2c=
X-Gm-Gg: AR+sD13enFj7yzQBrY/qk5AI16edKJyMRHEfWimBJ09NmJk1F12iQo9FnSJYWfy+eWL
	Yn8Qr4rDv0uh0wEELhD9MRRwcZ4GZ4DuTp7HRjhmvRBrKrty+aHf2uw/sbCzl9aMQ1m+g+xgRHm
	zxqQHRcl6IIrI0wzHUW2LM6rS/uPcQJFLrcnWWNT0p0lJkPLCPtcCZEmR9ast/MXs0N+KBEJFWI
	/OKTEvdaiCwN9pJyKOVN64q41dBYxdVyrFtvygYv/GHW7rNwz9EJeno0JboyzW+qhMsMHhvhnxp
	leOmJs+SC+BjvatC/KV8QxwW7x2hmO4nm9//oGMyTqHHEwWbaiBK68uyxsTsAmuBeBMzAyTwjP1
	+FR/yslvjTAgWD3MYb6XVHS2mkbZHB+80Jm3K/+QWZkkYo1xRJ5Af1cmGGPRhAeRC23pVAupAs2
	r4/mqn9XM3DMQjLQhGRefRbuTuxwSxdmduzIwspG5LR3NqFNWHRorAGRHSCB3GrwfFLSgzMJjR4
	7G22ykEfxLIxz1cOfHaNn8XvGJB50+nHEkFLkVodjTMJ7payQFxofVLElZKUSUc3/pGMKqV5WAY
	Q4LAyNNevss9
X-Received: by 2002:a05:600c:3b8b:b0:499:7a19:408b with SMTP id 5b1f17b1804b1-499dc722993mr15238585e9.11.1787691009220;
        Tue, 25 Aug 2026 13:50:09 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:f9af:e499:eded:1124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca98095sm4507845e9.5.2026.08.25.13.50.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 25 Aug 2026 13:50:08 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	richard.purdie@linuxfoundation.org,
	peter.kjellerstedt@axis.com,
	Anis Bougrine <anis.bougrine10@gmail.com>
Subject: [OE-core][PATCH v5 4/5] kernel: centralize kernel module installation path in one variable
Date: Tue, 25 Aug 2026 22:49:29 +0200
Message-ID: <20260825204931.17628-5-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260825204931.17628-1-anis.bougrine10@gmail.com>
References: <20260825204931.17628-1-anis.bougrine10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 20:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244278

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


