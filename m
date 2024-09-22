Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF0ECF9C69
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 08:42:14 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.11538.1726994524292578441
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Sep 2024 01:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=s6lsghwS;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-536584f6c84so4189670e87.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 01:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726994522; x=1727599322; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TY1LcLRkDV0dwoZOYgyz7hs4xM3PQA3/2P0EdgxcE/o=;
        b=s6lsghwSW3W6wQoD9VQAI1a1ao2NXBYUzFzJOF94Fn2ViOevt3faWjGe1BtrcEGEdk
         LmsavE14Dju7/brkCfon0w2Ot2zxaIqvx7wMAG4AyZ4+ITUvw8vxZA+itR774dGXoMKP
         Uaps6mqIx2xCu3fNRupXWXVY0V6uTKrSIS0atn5CbW4bEgUkdE4JdIQSwaA3LyBcFv4H
         Eg0bJU0obiv+OLudQZKb1UZ7wXQHaEztwa+Emlpwkt4h6rKcf88Qz8A52DfzwBOWokHW
         nsQh50/TP/spPObTkCOukbwyS7diC2wXzj7cld2gN1JxQkRgZvaiNjos5IFJGO/qsaiv
         SQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726994522; x=1727599322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TY1LcLRkDV0dwoZOYgyz7hs4xM3PQA3/2P0EdgxcE/o=;
        b=KsISH+ApLLlbHoKnKTPz/deBnp7FypUVoy4Xrbaptiri1TMt/y5L/mCbhOSdvmPrmw
         SOCrr5xF5y3DAtkJXWp5Kf95AvFl6tOsH+a6m3Yh2/girOW6V7CzjsVAs+xcj74m4wKX
         FgYEGurmpTFgStRExf1koB1rsEfnAqStHdL/OdTqaBFM1uaREE7XVWxbq68TAzqdrx6b
         Pd0ihfFtyvFPaAyWdoVlr3QSRCnE/+3BNYP3riol2ckH7NI+WC0hEpxuwAc4Cg7NKMdh
         CryQx1Z1IgK7nkl0UDt1X3wOZ9P1yLTTxtAXK3DFS9s/j4Ng0UHPsaF7upXR6m+dTaMP
         VuvA==
X-Gm-Message-State: AOJu0YyqIFUrYjBOMZ9hYO3O75H9FSDG4nQBm1DqXkRjlS2O0Q4jp64s
	+ZdoeTaSda7IKEN8gvPg1UyYhmgHGOEGj3pnZcQ2PQH02Ni0xwosXT8E0Xp5Ppse2X0mJz8VHdV
	QaJw=
X-Google-Smtp-Source: AGHT+IFNJJfe8tdfoYQYnjse5syJJ4YC4HRHpB1VMy/NR57gHPAy+8O43MW8cC8FZGcpot+OwaNZUQ==
X-Received: by 2002:a05:6512:138b:b0:52f:c833:861a with SMTP id 2adb3069b0e04-536ac3400b5mr4125884e87.51.1726994522314;
        Sun, 22 Sep 2024 01:42:02 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a8745sm2877339e87.236.2024.09.22.01.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 01:42:00 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Michelle Lin <michelle.linto91@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 04/12] uki.bbclass: add class for building Unified Kernel Images (UKI)
Date: Sun, 22 Sep 2024 11:41:20 +0300
Message-ID: <20240922084128.9648-5-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240922084128.9648-1-mikko.rapeli@linaro.org>
References: <20240922084128.9648-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 08:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204776

From: Michelle Lin <michelle.linto91@gmail.com>

This class calls systemd ukify tool, which will combine
kernel/initrd/stub components to build the UKI. To sign the UKI
(i.e. SecureBoot), the keys/cert files can be specified
in a configuration file or UEFI binary signing can be done
via separate steps, see qemuarm64-secureboot in meta-arm.
UKIs are loaded by UEFI firmware on target which can improve
security by loading only correctly signed kernel, initrd and kernel
command line.

Using systemd-measure to pre-calculate TPM PCR values and sign them is
not supported since that requires a TPM device on the build host. Thus
"ConditionSecurity=measured-uki" default from systemd 256 does not work
but "ConditionSecurity=tpm2" in combination with secure boot will.
These can be used to boot securely into systemd-boot, kernel, kernel
command line and initrd which then securely mounts a read-only dm-verity
/usr partition and creates a TPM encrypted read-write / rootfs.

Tested via qemuarm64-secureboot in meta-arm with
https://lists.yoctoproject.org/g/meta-arm/topic/patch_v3_02_13/108031399
and a few more changes needed, will be posted separately.

Signed-off-by: Michelle Lin <michelle.linto91@gmail.com>
Acked-by: Erik Schilling <erik.schilling@linaro.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/uki.bbclass | 197 ++++++++++++++++++++++++++++++++
 1 file changed, 197 insertions(+)
 create mode 100644 meta/classes-recipe/uki.bbclass

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
new file mode 100644
index 0000000000..fac50ea8ca
--- /dev/null
+++ b/meta/classes-recipe/uki.bbclass
@@ -0,0 +1,197 @@
+# Unified kernel image (UKI) class
+#
+# This bbclass merges kernel, initrd etc as a UKI standard UEFI binary,
+# to be loaded with UEFI firmware and systemd-boot on target HW.
+# TPM PCR pre-calculation is not supported since systemd-measure tooling
+# is meant to run on target, not in cross compile environment.
+#
+# See:
+# https://www.freedesktop.org/software/systemd/man/latest/ukify.html
+# https://uapi-group.org/specifications/specs/unified_kernel_image/
+#
+# The UKI contains:
+#
+#   - UEFI stub
+#     The linux kernel can generate a UEFI stub, however the one from systemd-boot can fetch
+#     the command line from a separate section of the EFI application, avoiding the need to
+#     rebuild the kernel.
+#   - kernel
+#   - initramfs
+#   - kernel command line
+#   - uname -r kernel version
+#   - /etc/os-release to create a boot menu with version details
+#   - optionally secure boot signature(s)
+#   - other metadata (e.g. TPM PCR measurements)
+#
+# Usage instructions:
+#
+#   - requires UEFI compatible firmware on target, e.g. qemuarm64-secureboot u-boot based
+#     from meta-arm or qemux86 ovmf/edk2 based firmware for x86_64
+#
+#   - Distro/build config:
+#
+#     INIT_MANAGER = "systemd"
+#     MACHINE_FEATURES:append = " efi"
+#     DISTRO_FEATURES:append = " systemd"
+#     DISTRO_FEATURES_NATIVE:append = " systemd"
+#     EFI_PROVIDER = "systemd-boot"
+#     INITRAMFS_IMAGE = "core-image-minimal-initramfs"
+#
+#   - image recipe:
+#
+#     inherit uki
+#
+#   - qemuboot/runqemu changes in image recipe or build config:
+#
+#     # Kernel command line must be inside the signed uki
+#     QB_KERNEL_ROOT = ""
+#     # kernel is in the uki image, not loaded separately
+#     QB_DEFAULT_KERNEL = "none"
+#
+#   - for UEFI secure boot, systemd-boot and uki (including kernel) can
+#     be signed but require sbsign-tool-native (recipe available from meta-secure-core,
+#     see also qemuarm64-secureboot from meta-arm). Set variable
+#     UKI_SB_KEY to path of private key and UKI_SB_CERT for certificate.
+#     Note that systemd-boot also need to be signed with the same key.
+#
+#   - at runtime, UEFI firmware will load and boot systemd-boot which
+#     creates a menu from all detected uki binaries. No need to manually
+#     setup boot menu entries.
+#
+#   - see efi-uki-bootdisk.wks.in how to create ESP partition which hosts systemd-boot,
+#     config file(s) for systemd-boot and the UKI binaries.
+#
+
+DEPENDS += "\
+    os-release \
+    systemd-boot \
+    systemd-boot-native \
+    virtual/${TARGET_PREFIX}binutils \
+    virtual/kernel \
+"
+
+inherit image-artifact-names
+require ../conf/image-uefi.conf
+
+INITRAMFS_IMAGE ?= "core-image-minimal-initramfs"
+
+INITRD_ARCHIVE ?= "${INITRAMFS_IMAGE}-${MACHINE}.${INITRAMFS_FSTYPES}"
+
+do_image_complete[depends] += "${INITRAMFS_IMAGE}:do_image_complete"
+
+UKIFY_CMD ?= "ukify build"
+UKI_CONFIG_FILE ?= "${UNPACKDIR}/uki.conf"
+UKI_FILENAME ?= "uki.efi"
+UKI_KERNEL_FILENAME ?= "${KERNEL_IMAGETYPE}"
+UKI_CMDLINE ?= "rootwait root=LABEL=root console=${KERNEL_CONSOLE}"
+# secure boot keys and cert, needs sbsign-tools-native (meta-secure-core)
+#UKI_SB_KEY ?= ""
+#UKI_SB_CERT ?= ""
+
+IMAGE_EFI_BOOT_FILES ?= "${UKI_FILENAME};EFI/Linux/${UKI_FILENAME}"
+
+do_uki[depends] += " \
+                        systemd-boot:do_deploy \
+                        virtual/kernel:do_deploy \
+                     "
+do_uki[depends] += "${@ '${INITRAMFS_IMAGE}:do_image_complete' if d.getVar('INITRAMFS_IMAGE') else ''}"
+
+# ensure that the build directory is empty everytime we generate a newly-created uki
+do_uki[cleandirs] = "${B}"
+# influence the build directory at the start of the builds
+do_uki[dirs] = "${B}"
+
+# we want to allow specifying files in SRC_URI, such as for signing the UKI
+python () {
+    d.delVarFlag("do_fetch","noexec")
+    d.delVarFlag("do_unpack","noexec")
+}
+
+# main task
+python do_uki() {
+    import glob
+    import bb.process
+
+    # base ukify command, can be extended if needed
+    ukify_cmd = d.getVar('UKIFY_CMD')
+
+    deploy_dir_image = d.getVar('DEPLOY_DIR_IMAGE')
+
+    # architecture
+    target_arch = d.getVar('EFI_ARCH')
+    if target_arch:
+        ukify_cmd += " --efi-arch %s" % (target_arch)
+
+    # systemd stubs
+    stub = "%s/linux%s.efi.stub" % (d.getVar('DEPLOY_DIR_IMAGE'), target_arch)
+    if not os.path.exists(stub):
+        bb.fatal(f"ERROR: cannot find {stub}.")
+    ukify_cmd += " --stub %s" % (stub)
+
+    # initrd
+    initramfs_image = "%s" % (d.getVar('INITRD_ARCHIVE'))
+    ukify_cmd += " --initrd=%s" % (os.path.join(deploy_dir_image, initramfs_image))
+
+    deploy_dir_image = d.getVar('DEPLOY_DIR_IMAGE')
+
+    # kernel
+    kernel_filename = d.getVar('UKI_KERNEL_FILENAME') or None
+    if kernel_filename:
+        kernel = "%s/%s" % (deploy_dir_image, kernel_filename)
+        if not os.path.exists(kernel):
+            bb.fatal(f"ERROR: cannot find %s" % (kernel))
+        ukify_cmd += " --linux=%s" % (kernel)
+        # not always needed, ukify can detect version from kernel binary
+        kernel_version = d.getVar('KERNEL_VERSION')
+        if kernel_version:
+            ukify_cmd += "--uname %s" % (kernel_version)
+    else:
+        bb.fatal("ERROR - UKI_KERNEL_FILENAME not set")
+
+    # command line
+    cmdline = d.getVar('UKI_CMDLINE')
+    if cmdline:
+        ukify_cmd += " --cmdline='%s'" % (cmdline)
+
+    # dtb
+    if d.getVar('KERNEL_DEVICETREE'):
+        for dtb in d.getVar('KERNEL_DEVICETREE').split():
+            dtb_path = "%s/%s" % (deploy_dir_image, dtb)
+            if not os.path.exists(dtb_path):
+                bb.fatal(f"ERROR: cannot find {dtb_path}.")
+            ukify_cmd += " --devicetree %s" % (dtb_path)
+
+    # custom config for ukify
+    if os.path.exists(d.getVar('UKI_CONFIG_FILE')):
+        ukify_cmd += " --config=%s" % (d.getVar('UKI_CONFIG_FILE'))
+
+    # systemd tools
+    ukify_cmd += " --tools=%s%s/lib/systemd/tools" % \
+        (d.getVar("RECIPE_SYSROOT_NATIVE"), d.getVar("prefix"))
+
+    # version
+    ukify_cmd += " --os-release=@%s%s/lib/os-release" % \
+        (d.getVar("RECIPE_SYSROOT"), d.getVar("prefix"))
+
+    # TODO: tpm2 measure for secure boot, depends on systemd-native and TPM tooling
+    # needed in systemd > 254 to fulfill ConditionSecurity=measured-uki
+    # Requires TPM device on build host, thus not supported at build time.
+    #ukify_cmd += " --measure"
+
+    # securebooot signing, also for kernel
+    key = d.getVar('UKI_SB_KEY')
+    if key:
+        ukify_cmd += " --sign-kernel --secureboot-private-key='%s'" % (key)
+    cert = d.getVar('UKI_SB_CERT')
+    if cert:
+        ukify_cmd += " --secureboot-certificate='%s'" % (cert)
+
+    # custom output UKI filename
+    output = " --output=%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('UKI_FILENAME'))
+    ukify_cmd += " %s" % (output)
+
+    # Run the ukify command
+    bb.warn("uki: running command: %s" % (ukify_cmd))
+    bb.process.run(ukify_cmd, shell=True)
+}
+addtask uki after do_rootfs before do_deploy do_image_complete do_image_wic
-- 
2.34.1


