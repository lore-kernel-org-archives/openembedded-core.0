Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63AE4C282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 11:20:24 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.11882.1741951221006024521
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 04:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QzLHwwcF;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30761be8fa8so21520271fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 04:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741951219; x=1742556019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMipRXNP+w7buVUw3k9n8R6+R1UDtIZrGFwg1zyiylY=;
        b=QzLHwwcFGInvZ/2zsTEvAve0JNuq9C1CGrS3WarR6JFoBRM1U+9N5K7Ob5UpZMLVXm
         0DOgU/maAoSriNh79sa6HOcqC/Rh0Lpw2PtT6c7NGHZlw0RahR1p5H8bCSHnQ3hB/8av
         c6SM0KUWZzvQ7KGye6zn0NSi3kMReUru315MFyKYwvCXDhGWJ2SR+dkZhNBG/WYkajsb
         hLaUWSqdK5FHVhlCRCYeSjMFW45OHGpdi+xNmGhMnqkNp1DX/Lqx3brGvzl+8M2BNM2o
         YW5xx4Kdvjwkjbqkm1MXLlJ4iYE/hKk+Oky6yccWzz9tlWZYabzwh44Dm3zUgeDro8TO
         uEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951219; x=1742556019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMipRXNP+w7buVUw3k9n8R6+R1UDtIZrGFwg1zyiylY=;
        b=Bj74BMAWtGfnMV2SeZjdjDgAC+lTuUWarU0teCF0lwrh6uXF2NAWezfzsgWpyT83br
         LFT+mjG+PUtOHMfuahHEE6EcV675TU2bfa//TPr+mTcOMvsELCGhaekqGwk/EmqRzKAu
         hTiA0calCLPe1JVFpbTC0A3/jguEAeWSUqlVmlZ213pVYnF+6+F3CLVpsrZCaDil1Iwb
         7oDfAXi15MKDmNNG0twv/4D073iJVysfuOiCIf0IOEm/62j3F1N45QWRcc8JRJU8Y9Kh
         ZOzvd0TuIocbauYgZudGLS7xkpyfjQnN3Jl4mF6XDPOQowy+DTjqQ/i2fLPKaFEg+ufW
         Wsfg==
X-Gm-Message-State: AOJu0Yy/eIEIKlxEtjgRofH+jMGqUiqbyQbi4Lu07EcHh9kpH93lJQaU
	YQ4+EcWUKAMaIxi0eHRnNNpIZPKE9fBz00iRnuNWs/4JWgWOCciVZeTegnUv1ilAsKvuYHTzTF9
	IsQY=
X-Gm-Gg: ASbGncsT5XLP/BCN22a9H7DCU6svFY39RGS9gnh02FCHWDkIkcpEYhXnRbdKIX2wVt3
	xBxWeAWheDGfJXlcOkr/ZdZtP186lPB33tbdzHsvOTYSzUkiu5GrqNhGt4JeeIysRUdepwvnOhZ
	qn5rA9+0kLIUvMsZcuIMFzYNq9hGsXDBuD/En1JPL/4hyUjKQoSLADB8KbTitz5TbNw0waDxn4j
	IDThkGdMcdvnMMXsUU2j1vw8bLE+lFqAKu4TMewhwLXsh/Dq+9ohu62JE2vQakuXmWn3N7NGbOR
	3JpwVgAnAE0RUiPVLrecpe0hgJMZqU2xog67PVJpYUxInS/nuQsrsFpHCwPOeQC/tPbMXK49qAf
	4QApYB3VH+tP4sQ==
X-Google-Smtp-Source: AGHT+IH3AJxz3hq5MAmVA9CRXXn6Aq0Y85JPz6J0C+KrIA/G8pdnOM/8lLtaz0uHtm67lEhKHLv6Sg==
X-Received: by 2002:a05:651c:1507:b0:306:501:4772 with SMTP id 38308e7fff4ca-30c4a8e52f3mr7832321fa.37.1741951219038;
        Fri, 14 Mar 2025 04:20:19 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0d26e5sm5364391fa.20.2025.03.14.04.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 04:20:17 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 4/6] kernel.bbclass: add kernel-initrd-modules meta package
Date: Fri, 14 Mar 2025 13:19:40 +0200
Message-ID: <20250314111942.304800-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250314111942.304800-1-mikko.rapeli@linaro.org>
References: <20250314111942.304800-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 11:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212835

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
 .../kernel-module-split.bbclass               | 46 +++++++++++++++++++
 meta/classes-recipe/kernel.bbclass            |  5 +-
 meta/classes-recipe/module.bbclass            | 37 +++++++++++++++
 3 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 9487365eb7..06e8fbed6e 100644
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
 
@@ -183,6 +217,18 @@ python split_kernel_module_packages () {
     modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%s-%s' % (kernel_package_name, kernel_version))
     if modules:
         d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
+
+    initrd_metapkg = d.getVar('KERNEL_INITRD_MODULES_META_PACKAGE')
+    initrd_module_regex = re.compile(d.getVar('KERNEL_INITRD_MODULES_REGEX'))
+    initrd_modules = []
+    for module in modules:
+        files = d.getVar('FILES:' + module)
+        m = re.match(initrd_module_regex, files)
+        if m:
+            initrd_modules.append(module)
+
+    if initrd_modules:
+        d.appendVar('RDEPENDS:' + initrd_metapkg, ' '+' '.join(initrd_modules))
 }
 
 do_package[vardeps] += '${@" ".join(map(lambda s: "module_conf_" + s, (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()))}'
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 64a685a964..8fda61574d 100644
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


