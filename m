Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29FDC369AA
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 16:30:04 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.1462.1743784195397342876
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 09:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ET/t/8Px;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54998f865b8so2050269e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 09:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743784193; x=1744388993; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xaYtMYmz77OMFXSactMtdw6dSA8FtMuGWPtR7pFiWg=;
        b=ET/t/8PxNJuAh9eX/yXJJyNnzHEs8P9T1UuOP9b+GqzMWsOMaJR9BNfv3zDcBg3Z33
         nTbh43IoW2d8VsPW2IML+3sRyz4nw1lP/7tRt3yYD6QLBx1MutXCDEWXbe3xYP7rAlyZ
         y1aEH00nwE4qerZRLkaTftYqnh8rfib544ARNLROEPV+zy2yg8YM6QdrJzV34HgtKZHf
         4CGvbUoToDwIF+ZOVO7uv5HirE25CBYnfbh0ojev7LpJp9CEM0Snjrke54BbO9Gdf9Kk
         HkJoFeWn3OLzQXXOqkNeSbkhFkpmDpWLS27yimLZgPmN9xBT8KGDLetuif0N+tIOdNOx
         m7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743784193; x=1744388993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4xaYtMYmz77OMFXSactMtdw6dSA8FtMuGWPtR7pFiWg=;
        b=R4y3dtMGGbT/DBiIMXYxvAqMEc8TXfjGVE7+kf0t0RpNpBizKRmCImOPc1rNf2NHaP
         qxM2yCJEdzrP+ctMObfWIyga0YhQsBIau590RjRf5GI4YVpZgDQAF24pHm/1QBc4bjtj
         c39mDutekXt3se7tx8I9gMEt+/cJqbjel2Og9xOYVS+dPWQlpvUWvxftcuhWQejXojkf
         m9zBcLNEJtsCJvWRGRIpeXcv1zrvYNUL+2BbSWZ7H2OoRJ57+3ii7U2urXgNkjokNZ6I
         Zb75LhY+ioLytAQZhhEGcOdoX1wd2UgjqoLpFStCrSdC656+ZBu0vUlxl2IDWYIgB0lY
         ml/g==
X-Gm-Message-State: AOJu0Yw2cCU+UxB0Qd13uFVNATJYlqR+sFWNKnm0KTyCcExIVA2B5rgF
	WRagiWUjwyngymgoWrQrhk3stZ4u+K92Bxp8S5CRa2aW7RSpyIF/PFueXpvWQmd0LxWWT1qotVA
	/xYY=
X-Gm-Gg: ASbGncuB0n992RR3kEiI3l4/lrH/tueJ5HpZaL70/VYTIDzS1fAGFQ6bTAwBLm/OgHp
	dJCMUszroY3CoKdEaIQLEERM46cN8FWC7yqiHIkfwD6vRg1o+5pcz2566FtVgbHKReiZFTaZMOc
	s063jjx6guvjMGUO+1JWN6TK/axOsb/EufUTlqU6m/mVLRSzplhRLDHi6tfEFv7GS//bDrYhZiv
	zoJua3zBNs3fU6Y4vJn/1JVvhFhG9HboXZjdMjr1RI/6M1Mn0nDD30suqvTxhiZYSVtzMyzN4FE
	jsYiaYk4tFRVfikp8qCLBPAW/1kCCE5AXz+bRUkVOsoZRGHjElkSujVjmnAOkdIC92DwJBi2htW
	sb/qFVGRwsnieTAWMUCf5xA==
X-Google-Smtp-Source: AGHT+IH4Jqj7zSy84uMNm77BS9UAPj4CmTytPmki1LOgSjSZch9Rnu4EKG1qSaC7SegjKihQBUuGQQ==
X-Received: by 2002:a05:6512:3351:b0:54a:cc07:4091 with SMTP id 2adb3069b0e04-54c2276e863mr846282e87.2.1743784193415;
        Fri, 04 Apr 2025 09:29:53 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671f54sm469786e87.228.2025.04.04.09.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 09:29:53 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 03/11] kernel.bbclass: add kernel-initrd-modules meta package
Date: Fri,  4 Apr 2025 19:29:24 +0300
Message-ID: <20250404162932.447699-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404162932.447699-1-mikko.rapeli@linaro.org>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 16:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214354

At the moment linux-yocto kernels for various architectures
are not very modular and a lot of drivers are built into the kernel
even when they are not needed at runtime. These make the main kernel
binary big and slow to boot. This also impacts udev in userspace
which takes a long time processing events from all these built in drivers,
for example when udev runs in initrd.

Then constructing the initrd is very device and kernel configuration specific.
initrd image needs explicitly define which binary packages to install
to avoid pulling in complex dependencies. A full set of kernel modules
via kernel-modules meta package is too big for initrd and most of the
drivers are not needed for use cases like "just load modules to mount
main rootfs". Then the initrd configuration breaks if kernel driver
is built into the kernel since the binary package doesn't exist.

Introduce kernel-initrd-modules meta package to solve these problems.
The meta package adds dependencies to real kernel modules based on
the kernel module file paths so that it will include several
kernel subsystems and their drivers which are often needed to find
main rootfs from some block device. This works when drivers are built
as modules but does not break if drivers are built into the kernel.

The resulting initrd is also smaller since only a subset of drivers
are needed for "mount the rootfs" usecase. Tested on genericarm64
kernel and qemu and AMD KV260 HW.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../kernel-module-split.bbclass               | 48 +++++++++++++++++++
 meta/classes-recipe/kernel.bbclass            |  5 +-
 meta/classes-recipe/module.bbclass            | 37 ++++++++++++++
 3 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 9487365eb7..101c5cd959 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -42,6 +42,40 @@ KERNEL_MODULE_PACKAGE_PREFIX ?= ""
 KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
 KERNEL_MODULE_PROVIDE_VIRTUAL ?= "1"
 
+# subset of kernel modules needed in initrd, to e.g. mount rootfs from block device
+KERNEL_INITRD_MODULES_META_PACKAGE ?= "${@ d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
+
+# match regex to path or file name. E.g. include all drivers with files in path /drivers/ata/
+KERNEL_INITRD_MODULES_REGEX ?= "(.*)(\
+/drivers/acpi/|\
+/drivers/ata/|\
+/drivers/block/|\
+/drivers/cdrom/|\
+/drivers/char/hw_random/|\
+/drivers/char/tpm/|\
+/drivers/char/|\
+/drivers/crypto/|\
+/drivers/dax/|\
+/drivers/firmware/arm_scmi/|\
+/drivers/gpu/drm/|\
+/drivers/md/|\
+/drivers/mmc/|\
+/drivers/mtd/|\
+/drivers/nvdimm/|\
+/drivers/nvme/|\
+/drivers/pci/|\
+/drivers/scsi/|\
+/drivers/tee/|\
+/drivers/tty/serial/|\
+/drivers/virtio/|\
+/drivers/watchdog/|\
+/kernel/arch/|\
+/kernel/block/|\
+/kernel/crypto/|\
+/kernel/fs/|\
+/kernel/lib/\
+)(.*)"
+
 python split_kernel_module_packages () {
     import re
 
@@ -183,6 +217,20 @@ python split_kernel_module_packages () {
     modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%s-%s' % (kernel_package_name, kernel_version))
     if modules:
         d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
+
+    initrd_metapkg = d.getVar('KERNEL_INITRD_MODULES_META_PACKAGE') or ""
+    initrd_module_regex = d.getVar('KERNEL_INITRD_MODULES_REGEX') or ""
+    if (initrd_metapkg != "") and (initrd_module_regex != ""):
+        initrd_module_regex = re.compile(initrd_module_regex)
+        initrd_modules = []
+        for module in modules:
+            files = d.getVar('FILES:' + module)
+            m = re.match(initrd_module_regex, files)
+            if m:
+                initrd_modules.append(module)
+
+        if initrd_modules:
+            d.appendVar('RDEPENDS:' + initrd_metapkg, ' '+' '.join(initrd_modules))
 }
 
 do_package[vardeps] += '${@" ".join(map(lambda s: "module_conf_" + s, (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()))}'
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 36ce659762..3dcaebcaed 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -695,13 +695,14 @@ EXPORT_FUNCTIONS do_compile do_transform_kernel do_transform_bundled_initramfs d
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
 # kernel-image becomes kernel-image-${KERNEL_VERSION}
-PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-dbg"
+PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-initrd-modules ${KERNEL_PACKAGE_NAME}-dbg"
 FILES:${PN} = ""
 FILES:${KERNEL_PACKAGE_NAME}-base = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.modinfo"
 FILES:${KERNEL_PACKAGE_NAME}-image = ""
 FILES:${KERNEL_PACKAGE_NAME}-dev = "/${KERNEL_IMAGEDEST}/System.map* /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
 FILES:${KERNEL_PACKAGE_NAME}-vmlinux = "/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION_NAME}"
 FILES:${KERNEL_PACKAGE_NAME}-modules = ""
+FILES:${KERNEL_PACKAGE_NAME}-initrd-modules = ""
 FILES:${KERNEL_PACKAGE_NAME}-dbg = "/usr/lib/debug /usr/src/debug"
 RDEPENDS:${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base (= ${EXTENDPKGV})"
 # Allow machines to override this dependency if kernel image files are
@@ -716,7 +717,9 @@ ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} = "1"
 ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-base = "1"
 ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image = "1"
 ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-modules = "1"
+ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-initrd-modules = "1"
 DESCRIPTION:${KERNEL_PACKAGE_NAME}-modules = "Kernel modules meta package"
+DESCRIPTION:${KERNEL_PACKAGE_NAME}-initrd-modules = "Kernel initrd modules meta package"
 
 pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {
 	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/module.bbclass
index f2f0b25a2d..51f864f1f9 100644
--- a/meta/classes-recipe/module.bbclass
+++ b/meta/classes-recipe/module.bbclass
@@ -86,3 +86,40 @@ EXPORT_FUNCTIONS do_compile do_install
 KERNEL_MODULES_META_PACKAGE = "${PN}"
 FILES:${PN} = ""
 ALLOW_EMPTY:${PN} = "1"
+
+# subset of kernel modules needed in initrd, to e.g. mount rootfs from block device
+KERNEL_INITRD_MODULES_META_PACKAGE ?= "${@ d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
+
+# match regex to path or file name. E.g. include all drivers with files in path /drivers/ata/
+KERNEL_INITRD_MODULES_REGEX ?= "(.*)(\
+/drivers/acpi/|\
+/drivers/ata/|\
+/drivers/block/|\
+/drivers/cdrom/|\
+/drivers/char/hw_random/|\
+/drivers/char/tpm/|\
+/drivers/char/|\
+/drivers/crypto/|\
+/drivers/dax/|\
+/drivers/firmware/arm_scmi/|\
+/drivers/gpu/drm/|\
+/drivers/md/|\
+/drivers/mmc/|\
+/drivers/mtd/|\
+/drivers/nvdimm/|\
+/drivers/nvme/|\
+/drivers/pci/|\
+/drivers/scsi/|\
+/drivers/tee/|\
+/drivers/tty/serial/|\
+/drivers/virtio/|\
+/drivers/watchdog/|\
+/kernel/arch/|\
+/kernel/block/|\
+/kernel/crypto/|\
+/kernel/fs/|\
+/kernel/lib/\
+)(.*)"
+
+FILES:${PN}-initrd = ""
+ALLOW_EMPTY:${PN}-initrd = "1"
-- 
2.43.0


