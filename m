Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D94CFD35C
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 12:21:10 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.10031.1728649267604162923
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 05:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=D8FIwexk;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5398b589032so3373958e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 05:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728649266; x=1729254066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iyp9362Z4M3adhdcTJ8A6OzCXqM22i/SfhTqjiGK4D8=;
        b=D8FIwexk6YNWT7o8gN7gVhOz0X8gv98tjiQlwazeyW23hRf0eXWMUOT4Pu9cdQFw2p
         qfuouWpjkSCrmq41oQX2uIBu7xQrFM6fK3tcHgWXnExNvXb5CZhi0ROZ3gDV4lm6o+Me
         vqXdohPAR6vtALmc2fB4ZcQzK29UX17yPaq80ZwgxAQMBPCOEbpxmerjrkMkOonONX16
         Uzvz2zFeIuVcJAGYsIx3CmltTJxzqvX9cmkGGeD9xyoNJqQMwRHWDvqT/9MnBlzigOwm
         W1ceh/tvNlxl4bqr/NCH0/Ag54EOnE3D9m2kfS+ke+AF4hTs4Y7L+LyOwb49pMOr7KOg
         FgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728649266; x=1729254066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iyp9362Z4M3adhdcTJ8A6OzCXqM22i/SfhTqjiGK4D8=;
        b=Z5SeMg9XKM1MfER8SLcHqLXMqKMxbiidgoN4tz6l1oLk8tsbsTcW9WwrFio/uj5to5
         2A7Dcb1m8OqMUwMulI1aIGgQzRH3n6K75eVimYgzSHmELhNnWW1o4xElRaW9uA47MIyB
         zNMOA1ITYKOE2KhMLrupphGprXY7mGLjC6xRa5Qm2jznTAiMZkqAaKJ7VqGsz47qSL40
         8xTuNnOcKoHqh1AF8bjIG63oGpyx2ih6TTdYkVnh0LnZgPNgUiMvrgjbBrFqpQvyLqIu
         LQNTCna6OPe49cfyaRZ9RTWtgc1+jh6W1WtUSNHl2BWTvfs3Z8x+KzKcnlckvUCpfKsu
         KXGQ==
X-Gm-Message-State: AOJu0YzFqMvK/n7w5ei1iuXGcHijSieL9NyK3YHzU6DfxlaIqxdjocDO
	HwzgnGcl3Fz3juXMMZqugXt5ToeJcnwcdSraYu2n32ogzW3V/TFZCN5rFqfvAHh5W8m18bV934h
	XgV0=
X-Google-Smtp-Source: AGHT+IHMCzBlFj7KbJkV3qrhfMezBFnJ+y7pqheY2HXGQt7G7qq+5/w8xR+6bZZbddsoPVQBUAeSeQ==
X-Received: by 2002:a05:6512:3992:b0:536:a695:9414 with SMTP id 2adb3069b0e04-539da3b205amr1928960e87.6.1728649265603;
        Fri, 11 Oct 2024 05:21:05 -0700 (PDT)
Received: from localhost.localdomain (2001-14ba-7452-eb00--183.rev.dnainternet.fi. [2001:14ba:7452:eb00::183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb6c8608sm591336e87.89.2024.10.11.05.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:21:03 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Michelle Lin <michelle.linto91@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v8 1/8] uki.bbclass: add class for building Unified Kernel Images (UKI)
Date: Fri, 11 Oct 2024 15:20:37 +0300
Message-ID: <20241011122044.12222-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241011122044.12222-1-mikko.rapeli@linaro.org>
References: <20241011122044.12222-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 12:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205686

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
 meta/classes-recipe/uki.bbclass | 195 ++++++++++++++++++++++++++++++++
 1 file changed, 195 insertions(+)
 create mode 100644 meta/classes-recipe/uki.bbclass

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
new file mode 100644
index 0000000000..d4f25c7fd2
--- /dev/null
+++ b/meta/classes-recipe/uki.bbclass
@@ -0,0 +1,195 @@
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
+    bb.debug("uki: running command: %s" % (ukify_cmd))
+    bb.process.run(ukify_cmd, shell=True)
+}
+addtask uki after do_rootfs before do_deploy do_image_complete do_image_wic
-- 
2.34.1


