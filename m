Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD0FC5DF8C
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 00:29:50 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2174.1787358581502116189
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 17:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Bv6vmsKe;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so14289845e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 17:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787358580; x=1787963380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHz1313nGIDGYT+BbyrXkGPGaPxcS2NwmdMnLs/vdEk=;
        b=Bv6vmsKeYsJFLc77VY3sKpOPyZKJd+K/g7X5xD2COjrwu2j+MENaG3ezrGCAbw+Xd/
         eE/Uj/2gGl9PpueyM9nMo/t2GUe+9z7Kafuo88vq3oWOTKWaxSfyDWvmy1rE281vH/WX
         MkpSXVzMogWyz8cG3pvDk0pPJ+UYYIondwg/7+aZqf39wTCvr/9UmN2V8SMMiU1u8obq
         RJVd0QMctPJFjDxcyTCBlQAvimJeAP7xXhRFUnkh/ryrjl2QairxyAdRTJ6RiTEEWvIU
         Mwxxf9OXTLi/aVG4wt5SMdd2P+UqTUCG4Ob7s76zpPsVTu5n/nBnDZo0KDTTP+xjjJUu
         jgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787358580; x=1787963380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHz1313nGIDGYT+BbyrXkGPGaPxcS2NwmdMnLs/vdEk=;
        b=ER+1WZzWCcNYMzfIJnwdSGysdc2RmJwxtaFqRJdXeJ8kvmOS3o+tp1u9IA5qqPRfaW
         ZWoBKVa2g+wgqBGq3NlLjX1E1bt5ZGfeduoJn/cJpXmzupyALh4iyRDE8rJRDGKfkrGi
         OG+gW5SZ7uLyRPE3azy8vCeRaTazbFGcH5SEIbKCVkSBU5IT5EV04P9HDBGVixNsBv8P
         iSr+u3I8YJqmWVObeqWD6av9jF/PeI3mZFUyDJdpNbIJwmzjw2FE+yL/2Ba2wxec+P1f
         UsPqBOiGEQweEbuCl/1pPUPB43jwoIgbG2ZG9Tf5pWOj16VbFkSL/V3Ez9/TGDraO+32
         zVIA==
X-Gm-Message-State: AFuF++nlJR73BU1/RMWwYEu53Pb29/9q9haX7G0ZIINHfjsVs/821jtS
	ejzBRo/ZoiZRy4UhSkJnqcRaNZT3o+eM8VIjUzBs6dk5mQ1rNdbop0LD2jSskn9hJEw=
X-Gm-Gg: AR+sD133kq50GKehwcITpU/kvWszW4OwXHlyilEUyZ+Vva3GSRxVmljZwfAyk7j4MtQ
	xPBj2to4iwI/bUuIdZL2fAW7UhPLm3ZFlTlK5LDOyNvC2obQ2KoaXeIgsZYQsoPteW0lYF6YEyn
	UP0uYGjVd9P4WtCar8VvEUhml88GtaQ7SPfl5GAkqEw/xvIHUA83dNUap2cO9C1O9sYwm/gtNNg
	y6N05yc9IcZtVBdTH2tjsX81VT9OS+lysLdcDnMr+3vfE+Xb2jsS/KNcTCewQHbja4lPVfUB6sm
	0l7bKxzBcFGohP/pUmf88x2f/gy3Aaq+xN3WF1wGNS44csPucblZyvgUzYyhpx8Pyws84FufZMT
	Kzl99cMCfHwKz1g8D6iMrnh1NtAtxRm9B0q5Ipk2tWjE8LQzgK9J6LeU7IuEzr2RkYArhm/PFyJ
	YG9HA8g6WXpPNkpMz38CqIwFYVZWTlvR0G4TIZCcWCsMQ3X3e0jXcMdYw1fZlfEyJ0Zukgfrww8
	9bf+CYt45VlW551gvNJBXt4vKeEUdfP8eIKzbST5a5pptmYksVtiyeVBKMgD2FXVHbPDACdN/uR
	aiW8xkc9TmJI
X-Received: by 2002:a05:600c:4f83:b0:499:a8bd:1930 with SMTP id 5b1f17b1804b1-499c19b5363mr19086945e9.5.1787358579600;
        Fri, 21 Aug 2026 17:29:39 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:7910:2866:fbeb:d177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b914bfcbsm44728335e9.9.2026.08.21.17.29.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 21 Aug 2026 17:29:39 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: antonin.godard@bootlin.com,
	bruce.ashfield@gmail.com,
	jose.quaresma@oss.qualcomm.com,
	richard.purdie@linuxfoundation.org,
	Anis Bougrine <anis.bougrine10@gmail.com>
Subject: [OE-core][PATCH v4 3/4] kernel: centralize kernel module installation path in one variable
Date: Sat, 22 Aug 2026 02:26:00 +0200
Message-ID: <20260822002601.90667-4-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260822002601.90667-1-anis.bougrine10@gmail.com>
References: <20260822002601.90667-1-anis.bougrine10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 00:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243962

The kernel module installation path is currently defined in multiple
places, although it is used 10 times throughout the code. This
increases the risk of bugs due to inconsistencies or desynchronization.

Centralizing the path in a single variable makes the code more
reliable and easier to maintain.

Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
---
    changes in v4:
    
    - Re-sign kernel modules after package stripping process
    - Remove package-stripping skip in package.py
    - Add MOD_INSTALL_PREFIX variable
    
    changes in v3:
    
    - Fixing rebase issue.
    
    changes in v2:
    
    - Use the conditional INSTALL_MOD_STRIP environment variable to avoid
      duplicating the oe_runmake call.
    - Use `scripts/config` script instead of grepping .config file.
---
 meta/classes-recipe/kernel-module-split.bbclass |  4 +++-
 meta/classes-recipe/kernel.bbclass              | 13 +++++++------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 253a723b95..061522fc22 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -48,6 +48,8 @@ KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
 KERNEL_MODULE_PROVIDE_VIRTUAL ?= "1"
 
 # Sign kernel modules if auto-signing is enabled in the kernel config
+# MOD_INSTALL_PREFIX must be the same at installation and signing time.
+MOD_INSTALL_PREFIX ?= "${nonarch_base_libdir}/modules/${KERNEL_VERSION}"
 post_strip_kernel_modules_signing(){
     # Read .config values
     is_modules="$(${S}/scripts/config --file ${B}/.config --state MODULES)"
@@ -58,7 +60,7 @@ post_strip_kernel_modules_signing(){
         # Sign modules under ${PKGD}
         oe_runmake \
             -C ${B} \
-            MODLIB=${PKGD}${nonarch_base_libdir}/modules/${KERNEL_VERSION} \
+            MODLIB=${PKGD}${MOD_INSTALL_PREFIX} \
             modules_sign
     fi
 }
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index a82bdf7ecb..18bad854ce 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -38,6 +38,7 @@ S = "${STAGING_KERNEL_DIR}"
 B = "${WORKDIR}/build"
 KBUILD_OUTPUT = "${B}"
 OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
+MOD_INSTALL_PREFIX = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}"
 
 # we include gcc above, we dont need virtual/libc
 INHIBIT_DEFAULT_DEPS = "1"
@@ -453,11 +454,11 @@ kernel_do_install() {
 	#
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${firmwaredir} modules_install
-		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
-		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
+		oe_runmake DEPMOD=echo MODLIB=${D}${MOD_INSTALL_PREFIX} INSTALL_FW_PATH=${D}${firmwaredir} modules_install
+		rm -f "${D}${MOD_INSTALL_PREFIX}/build"
+		rm -f "${D}${MOD_INSTALL_PREFIX}/source"
 		# Remove empty module directories to prevent QA issues
-		[ -d "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" ] && find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type d -empty -delete
+		[ -d "${D}${MOD_INSTALL_PREFIX}/kernel" ] && find "${D}${MOD_INSTALL_PREFIX}/kernel" -type d -empty -delete
 	else
 		bbnote "no modules to install"
 	fi
@@ -680,9 +681,9 @@ EXPORT_FUNCTIONS do_compile do_transform_kernel do_transform_bundled_initramfs d
 # kernel-image becomes kernel-image-${KERNEL_VERSION}
 PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-dbg"
 FILES:${PN} = ""
-FILES:${KERNEL_PACKAGE_NAME}-base = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.modinfo"
+FILES:${KERNEL_PACKAGE_NAME}-base = "${MOD_INSTALL_PREFIX}/modules.order ${MOD_INSTALL_PREFIX}/modules.builtin ${MOD_INSTALL_PREFIX}/modules.builtin.modinfo"
 FILES:${KERNEL_PACKAGE_NAME}-image = ""
-FILES:${KERNEL_PACKAGE_NAME}-dev = "/${KERNEL_IMAGEDEST}/System.map* /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
+FILES:${KERNEL_PACKAGE_NAME}-dev = "/${KERNEL_IMAGEDEST}/System.map* /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config* ${KERNEL_SRC_PATH} ${MOD_INSTALL_PREFIX}/build"
 FILES:${KERNEL_PACKAGE_NAME}-vmlinux = "/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION_NAME}"
 FILES:${KERNEL_PACKAGE_NAME}-modules = ""
 FILES:${KERNEL_PACKAGE_NAME}-dbg = "/usr/lib/debug /usr/src/debug"
-- 
2.50.1 (Apple Git-155)


