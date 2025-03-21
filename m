Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C466C3600A
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 13:25:50 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.21064.1742563549389884252
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 06:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Y2ULjXIR;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bfc79ad97so30929381fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 06:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742563547; x=1743168347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMipRXNP+w7buVUw3k9n8R6+R1UDtIZrGFwg1zyiylY=;
        b=Y2ULjXIRjNtB1kvsOqOtNEb877hNeZwLcm8a6gzUx3U7DGxVL2oz5A9XpL9hCZCz+Z
         nXgwE77KPR3xyi6OTw0F0Jj8cN2wClVzyyrXKhX6fozVpgXZIS/pvjI+UAQ34YMi07ni
         rDKUzx8Ory3HaV+xmBbtdbMOeT5TFoMVD3eF4vrWuDTf3rY8n6ZxqsN8Qegz1rykC5J7
         WgXUqfW8JPzzqSmmTKZRJjbzsZycU7DERqY4syKT6i3wIOV3zc16Xke1X9WcQeWxUg9n
         bmAvjgRA5sfS9llzqQo4oSHFSfCoOiZAQxNJJ4DkqKg7gIRqYyexldtIF5d79lZh/UpW
         tM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742563547; x=1743168347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMipRXNP+w7buVUw3k9n8R6+R1UDtIZrGFwg1zyiylY=;
        b=vDwsLjYkREoF2QQLrbMO+cvyhuK9pynoneL0j+tmwNUY8HA3vQg39knOllGwSlJ2U3
         jqjK1RpSYjWWUz6UpOWukb9945KjSXPxiS2SR8cDyH4CKLxsU1XlgPpLz3DV0AOKjfhz
         WpjO/2YN7CyhM+JHlqSpnC/ipYHXxZFUoMArFL2nttwjD7KAF2OAV9D7Fs6O34Ja1X31
         vJw1LyfRSBEF/XqVLgK5m1/ayPjRko6mvqruBRFrfTUT9Tk73qL8KA3uoI0hYcDhB2Uh
         v87BfNG23D3XKXqhcpBvvLq3BmcUfV5bEJy9hkDtlmcofVKQjN0HyjDIAsj/ZvYWaTDg
         I3xQ==
X-Gm-Message-State: AOJu0YxZPnJRH3RgHvxG65wWNdK8acSykCpNlDjcr30C/cHiL0jWsDD4
	ObYbGhtif5VidZfSHfArTrh2ovMBZMcN5Xlf8JZdwmInVpAQz8q65tSAWa1dl/w6E1BWECrCDbz
	BlmU=
X-Gm-Gg: ASbGncvnLkTDaJP0+ubAZ8yKToWrITuJjuXbk1Fhbky0i3W/xlWOpTd4e6BeB6LX03l
	DjOWxxBtJ5zAS5hb232B2WzGiP7GDA3PVBTAmqmN4YSbNe+3WnKc3rJ6Yz8uZs6TjJj5JBcxPAS
	FJr9j80BNEBvFfKhnl43M4PYUh2lLOcNUM9jz8cANntM/YScXfKA1kyRrtFn4Ah21yq7PpNF19B
	74W/rElmdHeyN8xTn53+Nw2Qk7xKvB/9QuQU0p8t4qx5pWivGS03Go/IG/6IG0ac5gea6gno8Ej
	abkn4I1ws7rtxxyWr8gTo3u+Oi7SoIWZUCjd0MSyH22BUPz+nnZfsbx4XadKufuFwnZAlW7l8nA
	3NFXEDumuy25uyipZOJjgjg==
X-Google-Smtp-Source: AGHT+IFiPM6Gq1/V7DYM5FB29Yt9lg0q3SLw8/mizec3rhIvzsfsAJYrLwGefJSR2UZLto7+vOhs7A==
X-Received: by 2002:a05:6512:1313:b0:542:2139:636a with SMTP id 2adb3069b0e04-54ad6034b1dmr1317755e87.7.1742563547443;
        Fri, 21 Mar 2025 06:25:47 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6468a25sm182634e87.11.2025.03.21.06.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:25:46 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 03/11] kernel.bbclass: add kernel-initrd-modules meta package
Date: Fri, 21 Mar 2025 15:25:09 +0200
Message-ID: <20250321132517.670372-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250321132517.670372-1-mikko.rapeli@linaro.org>
References: <20250321132517.670372-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 13:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213459

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


