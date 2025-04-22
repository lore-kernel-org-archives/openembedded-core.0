Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3D2C369DE
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:35:26 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.41499.1745332520475888051
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SdE0dMkB;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54d65cb6e8aso6229824e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 07:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745332519; x=1745937319; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IH16F6KVX06RkUj1GTosX97WDaBr9V8dPegawmnVMI0=;
        b=SdE0dMkBd+FEfJD2XmES5AFpkDKVbr1baA8l+u5DY6um05+ZJsufdLh+UjX2Y32WnO
         GhM3gqcI4k7rn9CeBRKTTOLMLA/JuknmGXE6eazmsrM8cgOB7oH10kYZGoyXDVULCidw
         xYPTUmWc4sIwAICirzxjZ/Q8czEzyRsawQRVuClRA39Ax4DtMprn6XIiGj9SYJUUu4Wv
         VI6NQaFkIDWFj/UidF4TQ0wYbZVH5uFSY61c8NEwkh7Bd3umHt0FV98WcSEu+QbdD6Zb
         c1zw0MGhjdI3BcmTl5hkODbFE+NIzv1RpKg7BTrNzX9DbF2qUvBJUZFnSeddyisCyHYT
         qz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745332519; x=1745937319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IH16F6KVX06RkUj1GTosX97WDaBr9V8dPegawmnVMI0=;
        b=vD+5wF+8TFx93uMTopuQACRJP6TZi8ustFWnWKZGAm3lUkV1IXvjyRqRN90FX9+OD2
         g9YtPHRQRG61kqKISueuUztZgeK+Vd7QftYHlZdsGxoN4//Q0MUTKplveLjkr3QJ9o17
         3zxrcTAhuxxwkt3k+AGSgG4bL1GeOkhPVSuOzhqi8L0vmvCb7u9sGCsJC1T6B6VmruCS
         IsOtxO+3AfPgwjlA1t2loesPnDtZqcG8pUE0QNPQcQZhnlvTbHHl2xaC2LHAWt2dh5Yd
         Ab8dKLCA2/RajSQvzRDI6eNw+vrQNp62aXB4DJ7zDFFkXpOGnbYzqGp3b5o0UQ4uWvnY
         LFQg==
X-Gm-Message-State: AOJu0Yz52olD/IbpMzvI8WVfR2QPrzTG0vGqpcDeu/uyGqU0g3a2OCoD
	X/VKIs2awSmzOLg1uoVrzCrn/pG2QC/twV58p+Iii+5FJD1/jb/JJdsYyXCwT2GNWWX/HHTNqjX
	gh98=
X-Gm-Gg: ASbGncugYeG9H8LDAA2gw/R3zeHdztS+ZvKlKJF4PbZUPrerc/EjYG5Rhc8MSO6pGWx
	Ss3x65vcxFeoXHh5NYklaU+4DMsSECeS8Qw5QFNDU75o6BkXgmeG/5rVvFh8vBQ6mIHUvRx6rQx
	nNActuOimyh1UDkh1UrzST6xTzSyABveVfBJ4rVijtz/875avncfjK7nFRo8wyOHbPN+cAI3Izr
	IgjiPBiTj1ZQnvBobzjZxjRByhGVUKzeaU4rCXhlG/8Vnp+lr1hSxb+AALiVI2txmLI5Gv+ueNG
	pLmQ76+rrKOhTyOlP+ggSFNRDT7A+W3E6jLZSgoEQzMP6cOsLzy+ISaMBihgxuSbL2YiDfcCuZq
	+P57lyWzE8M/bhAZU+g==
X-Google-Smtp-Source: AGHT+IER+fPwSy0dGeV1qSWdnNFo4lOzLhHAB8Hg3/xM6BGRR9SS/PYdQRZ2TrEUYDCaQ+a51fhNwg==
X-Received: by 2002:a05:6512:3b93:b0:545:17d:f96b with SMTP id 2adb3069b0e04-54d6e629bfemr5267127e87.14.1745332518483;
        Tue, 22 Apr 2025 07:35:18 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5d0837sm1236503e87.118.2025.04.22.07.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:35:18 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 2/9] kernel.bbclass: add kernel-initrd-modules meta package
Date: Tue, 22 Apr 2025 17:34:54 +0300
Message-ID: <20250422143501.99565-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422143501.99565-1-mikko.rapeli@linaro.org>
References: <20250422143501.99565-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215216

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
 .../kernel-module-split.bbclass               | 18 +++++++++
 meta/classes-recipe/kernel.bbclass            |  5 ++-
 meta/classes-recipe/module.bbclass            |  3 ++
 .../distro/include/kernel-initrd-modules.inc  | 37 +++++++++++++++++++
 4 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta/conf/distro/include/kernel-initrd-modules.inc

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 9487365eb7..8633f0f364 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -42,6 +42,10 @@ KERNEL_MODULE_PACKAGE_PREFIX ?= ""
 KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
 KERNEL_MODULE_PROVIDE_VIRTUAL ?= "1"
 
+KERNEL_INITRD_MODULES ?= "conf/distro/include/kernel-initrd-modules.inc"
+
+require ${KERNEL_INITRD_MODULES}
+
 python split_kernel_module_packages () {
     import re
 
@@ -183,6 +187,20 @@ python split_kernel_module_packages () {
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
index f2f0b25a2d..4661501ded 100644
--- a/meta/classes-recipe/module.bbclass
+++ b/meta/classes-recipe/module.bbclass
@@ -86,3 +86,6 @@ EXPORT_FUNCTIONS do_compile do_install
 KERNEL_MODULES_META_PACKAGE = "${PN}"
 FILES:${PN} = ""
 ALLOW_EMPTY:${PN} = "1"
+
+FILES:${PN}-initrd = ""
+ALLOW_EMPTY:${PN}-initrd = "1"
diff --git a/meta/conf/distro/include/kernel-initrd-modules.inc b/meta/conf/distro/include/kernel-initrd-modules.inc
new file mode 100644
index 0000000000..f2176cb0f1
--- /dev/null
+++ b/meta/conf/distro/include/kernel-initrd-modules.inc
@@ -0,0 +1,37 @@
+# for kernel.bbclass to create "kernel-initd-modules" meta package
+# with a subset of all kernel drivers to suite usecase of mounting
+# the main rootfs from a number block devices on multiple HW devices.
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
-- 
2.43.0


