Return-Path: <michelle.linto91@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C41CA0FEC
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 23:32:38 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.9503.1693611157615940885
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 16:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=mklpK349;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: michelle.linto91@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c1e128135aso20359845ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 16:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693611156; x=1694215956; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nkASFey+iGGUcvAo58+ZdDjzGWTo8jj//YhOpJcDC6g=;
        b=mklpK34960oqxL2ti2Z8QElCJeyM8EN5lCHLoDouAX4ddMxfqwFOrPx9AkU5hGc10x
         u5VIhD4DD9kngJki7CRxa/87HXRx5PIKZwAQ9rFKZGNJa/3Kw8LW2F4OKbPRTMxRKB9W
         Vx3eYnEABDKZhgDKaeoBtWH/HIY6Z3MuKAVOQBMLUSp/CLMb2pNn2gi/Kz0ymCm4Mzc7
         YVkaJcADenI+M1Te21RgW4qDM1zWOp00PfWmnwBX3cNhj3CzPsqqYAb/oFc6XnVMncps
         yjy8mMsfBwC+8ThdGemuB1cv8PtNVhkC1kEmTQnNhPc13BE1f4qrSlRl0hmOld+2Si9P
         M60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693611156; x=1694215956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nkASFey+iGGUcvAo58+ZdDjzGWTo8jj//YhOpJcDC6g=;
        b=LwnyxIb8kfvNa8atzNuvAw7p5ZTrUzx/la5myHE5wEhxJsMAjZ7cxSIkye+FlsLAdJ
         YB462yahRdMv3SGJHtZIkGCPhBC0pYiYIZeYCR3uituCpKLFbDMj+Fus8850rIcN263m
         wEdl/0OyRW303qjueyN/VgNmD32RudBzTHQjEy9CBAhTsKtFRFtOJ4Z+L94fIW1tKNfD
         A5+H66yy7Mjumu749gC5BeuW/uHrh2XaNnG4mucOnWAdg79kq7xQDimdxtmD775hugOa
         imn9DOFkgDNceHGaflaJhjjhg0DQN0L7p8dR+u2oWUMeygxl9J1QG89XSJCGwyf82pj5
         wmwQ==
X-Gm-Message-State: AOJu0YyS0sxU3fXuvVlriuCCBYfS6/Vk5floWfKTgJPePV9JpJZOtvTd
	heN81tdk+KBQGx1Gggjm5XbB+Kcxw4+Dpw==
X-Google-Smtp-Source: AGHT+IH1Xkv0xPG18YStlMcJPZfikj8or09UX9Jqc/Vj7ohovFkk2zVeYE3J9zB16S6kCRVE0HrPDA==
X-Received: by 2002:a17:902:9893:b0:1b8:94e9:e7b0 with SMTP id s19-20020a170902989300b001b894e9e7b0mr3366758plp.9.1693611156489;
        Fri, 01 Sep 2023 16:32:36 -0700 (PDT)
Received: from t-michellin-ubuntu20-dev.lmomnpnukpourfhb2n2erxnm1c.xx.internal.cloudapp.net ([172.179.2.30])
        by smtp.gmail.com with ESMTPSA id jh21-20020a170903329500b001bf3bdbceb5sm3509536plb.134.2023.09.01.16.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 16:32:36 -0700 (PDT)
From: Michelle Lin <michelle.linto91@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michelle Lin <michelle.linto91@gmail.com>
Subject: [PATCH] uki: Add support for building Unified Kernel Images
Date: Fri,  1 Sep 2023 23:32:31 +0000
Message-Id: <20230901233231.1109712-1-michelle.linto91@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 23:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187017

Currently, there is not a class to support the building of unified kernel
images. Adding a uki.bbclass to support the creation of UKIs. This class calls
the systemd Ukify tool, which will combine the kernel/initrd/stub components to
build the UKI. To sign the UKI (i.e. SecureBoot, TPM PCR signing), the keys/cert
files are to be specified in a separate configuration file, and the path to the
file is passed to the Ukify tool. UKIs are supported by UEFI and can improve
security through predicted TPM PCR states, and reduce the build burden due to
its single PE binary format.

Signed-off-by: Michelle Lin <michelle.linto91@gmail.com>
---
 meta/classes/uki.bbclass                 | 140 +++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_254.bb |  23 ++++
 2 files changed, 163 insertions(+)
 create mode 100644 meta/classes/uki.bbclass

diff --git a/meta/classes/uki.bbclass b/meta/classes/uki.bbclass
new file mode 100644
index 0000000000..2eff387c75
--- /dev/null
+++ b/meta/classes/uki.bbclass
@@ -0,0 +1,140 @@
+#
+# Unified kernel image (UKI) class
+#
+#
+# This bbclass is designed to repack an Overlake image as a UKI, to be booted on a qemuarm64 with SecureBoot
+# signing and embedded with TPM PCR measurements.
+#
+# The UKI is composed by:
+#   - an UEFI stub
+#     The linux kernel can generate a UEFI stub, however the one from systemd-boot can fetch
+#     the command line from a separate section of the EFI application, avoiding the need to
+#     rebuild the kernel.
+#   - the kernel
+#   - an initramfs
+#   - other metadata (e.g. PCR measurements)
+#
+#
+#
+
+# List build time dependencies
+DEPENDS += "systemd-native \
+            sbsigntool-native \
+            virtual/${TARGET_PREFIX}binutils \
+            "
+
+REQUIRED_DISTRO_FEATURES += "usrmerge systemd"
+
+inherit features_check
+require ../conf/image-uefi.conf
+
+INITRD_IMAGE ?= "core-image-minimal-initramfs"
+
+INITRD_LIVE ?= "${@ ('${DEPLOY_DIR_IMAGE}/' + d.getVar('INITRD_IMAGE') + '-${MACHINE}.cpio.gz') if d.getVar('INITRD_IMAGE') else ''}"
+
+UKI_CONFIG_FILE ?= "${WORKDIR}/core-image-minimal-uki.conf"
+UKI_FILENAME ?= "${@ 'UKI.signed.efi' if d.getVar('UKI_CONFIG_FILE') else 'UKI.unsigned.efi'}"
+
+do_uki[depends] += " \
+                        systemd-boot:do_deploy \
+                        virtual/kernel:do_deploy \
+                     "
+
+# INITRD_IMAGE is added to INITRD_LIVE, which we use to create our initrd, so depend on it if it is set
+# So we want to generate the initrd image if INITRD_IMAGE exists
+do_uki[depends] += "${@ '${INITRD_IMAGE}:do_image_complete' if d.getVar('INITRD_IMAGE') else ''}"
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
+    import subprocess
+
+    # Construct the ukify command
+    ukify_cmd = ("ukify build")
+
+    # Handle the creation of an initrd image by reading and concatenating multiple cpio files. 
+    # If the INITRD_LIVE variable is defined and not empty, it opens the necessary files, reads their contents, 
+    # and constructs a list.
+    if d.getVar('INITRD_LIVE'):
+        initrd_list = ""
+        for cpio in d.getVar('INITRD_LIVE').split():
+            # get a list of initrds
+            initrd_list += cpio + ' '
+        
+        ukify_cmd += " --initrd=%s" % initrd_list
+    else:
+        bb.fatal("ERROR - Required argument: INITRD")
+    
+    deploy_dir_image = d.getVar('DEPLOY_DIR_IMAGE')
+   
+    # Kernel
+    if d.getVar('KERNEL_IMAGETYPE'):
+        kernel = "%s/%s" % (deploy_dir_image, d.getVar('KERNEL_IMAGETYPE'))
+        kernel_version = d.getVar('KERNEL_VERSION')
+        if not os.path.exists(kernel):
+            bb.fatal(f"ERROR: cannot find {kernel}.")
+
+        ukify_cmd += " --linux=%s --uname %s" % (kernel, kernel_version)
+    else:
+        bb.fatal("ERROR - Required argument: KERNEL")
+
+    # Architecture
+    target_arch = d.getVar('EFI_ARCH')
+    ukify_cmd += " --efi-arch %s" % target_arch
+
+    # Stub
+    stub = "%s/linux%s.efi.stub" % (deploy_dir_image, target_arch)
+    if not os.path.exists(stub):
+        bb.fatal(f"ERROR: cannot find {stub}.")
+    ukify_cmd += " --stub %s" % stub
+
+    # Add option for dtb
+    if d.getVar('KERNEL_DEVICETREE'):
+        first_dtb = d.getVar('KERNEL_DEVICETREE').split()[0]
+        dtb_path = "%s/%s" % (deploy_dir_image, first_dtb)
+
+        if not os.path.exists(dtb_path):
+            bb.fatal(f"ERROR: cannot find {dtb_path}.")
+
+        ukify_cmd += " --devicetree %s" % dtb_path
+
+    # Add option to pass a config file to sign the UKI.
+    if os.path.exists(d.getVar('UKI_CONFIG_FILE')):
+        ukify_cmd += " --config=%s" % d.getVar('UKI_CONFIG_FILE')
+        ukify_cmd += " --tools=%s%s/lib/systemd/tools" % (d.getVar("RECIPE_SYSROOT_NATIVE"), d.getVar("prefix"))
+        bb.note("Pulling keys from config file")
+    else: 
+        bb.note("Generating unsigned UKI")
+
+    # Custom UKI name
+    output = " --output=%s" % d.getVar('UKI_FILENAME')
+    ukify_cmd += " %s" % output
+
+    # Set env to determine where bitbake should look for dynamic libraries
+    env = os.environ.copy() # get the env variables
+    env['LD_LIBRARY_PATH'] = d.expand("${RECIPE_SYSROOT_NATIVE}/usr/lib/systemd:${LD_LIBRARY_PATH}")
+    
+    # Run the ukify command
+    subprocess.check_call(ukify_cmd, env=env, shell=True)
+}
+ 
+inherit deploy
+
+do_deploy () {
+    # Copy generated UKI into DEPLOYDIR
+	install ${B}/${UKI_FILENAME} ${DEPLOYDIR}
+}
+
+addtask uki before do_deploy do_image after do_rootfs
+addtask deploy before do_build after do_compile
\ No newline at end of file
diff --git a/meta/recipes-core/systemd/systemd_254.bb b/meta/recipes-core/systemd/systemd_254.bb
index 8d5cf13095..65f132abb8 100644
--- a/meta/recipes-core/systemd/systemd_254.bb
+++ b/meta/recipes-core/systemd/systemd_254.bb
@@ -6,6 +6,9 @@ PE = "1"
 
 DEPENDS = "intltool-native gperf-native libcap util-linux python3-jinja2-native"
 
+# The Ukify tool requires this module
+DEPENDS:append:class-native = " python3-pefile-native"
+
 SECTION = "base/shell"
 
 inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu systemd gettext bash-completion manpages features_check
@@ -18,6 +21,8 @@ REQUIRED_DISTRO_FEATURES += "usrmerge"
 # that we don't build both udev and systemd in world builds.
 REQUIRED_DISTRO_FEATURES += "systemd"
 
+REQUIRED_DISTRO_FEATURES:class-native = ""
+
 SRC_URI += " \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
@@ -120,6 +125,8 @@ PACKAGECONFIG:remove:libc-musl = " \
 # https://github.com/seccomp/libseccomp/issues/347
 PACKAGECONFIG:remove:mipsarch = "seccomp"
 
+PACKAGECONFIG:class-native = "serial-getty-generator openssl tpm2 efi"
+
 TARGET_CC_ARCH:append:libc-musl = " -D__UAPI_DEF_ETHHDR=0 -D_LARGEFILE64_SOURCE"
 
 # Some of the dependencies are weak-style recommends - if not available at runtime,
@@ -260,6 +267,9 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
                   -Dloadkeys-path=${bindir}/loadkeys \
                   -Dsetfont-path=${bindir}/setfont"
 
+EXTRA_OEMESON:append:class-native = " -Dbootloader=true \
+                                      -Dman=false \
+                                    "
 # The 60 seconds is watchdog's default vaule.
 WATCHDOG_TIMEOUT ??= "60"
 
@@ -380,6 +390,14 @@ do_install() {
     fi
 }
 
+do_install:class-native() {
+	meson_do_install
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
+	install -d ${D}${prefix}/lib/systemd/tools
+	install -m 0755 ${B}/systemd-measure ${D}${prefix}/lib/systemd/tools
+}
+
 python populate_packages:prepend (){
     systemdlibdir = d.getVar("rootlibdir")
     do_split_packages(d, systemdlibdir, r'^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
@@ -702,6 +720,9 @@ RRECOMMENDS:${PN} += "systemd-extra-utils \
                       ${@bb.utils.contains('PACKAGECONFIG', 'logind', 'pam-plugin-umask', '', d)} \
 "
 
+RRECOMMENDS:${PN}:class-native = ""
+RDEPENDS:${PN}:class-native = ""
+
 INSANE_SKIP:${PN} += "dev-so libdir"
 INSANE_SKIP:${PN}-dbg += "libdir"
 INSANE_SKIP:${PN}-doc += " libdir"
@@ -852,3 +873,5 @@ pkg_postinst:udev-hwdb () {
 pkg_prerm:udev-hwdb () {
 	rm -f $D${sysconfdir}/udev/hwdb.bin
 }
+
+BBCLASSEXTEND += "native"
-- 
2.34.1


