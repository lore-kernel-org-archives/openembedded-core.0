Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.52604.1594018241391727538
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2020 23:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from ALSAMON-X.corp.microsoft.com (unknown [131.107.159.250])
	by linux.microsoft.com (Postfix) with ESMTPSA id D85D720B717A
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Jul 2020 23:50:40 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D85D720B717A
From: "Alejandro Hernandez" <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] baremetal-helloworld: Use baremetal-image class to deploy the application
Date: Sun,  5 Jul 2020 23:50:37 -0700
Message-Id: <20200706065037.18796-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
---
 .../baremetal-helloworld_git.bb               | 109 +++---------------
 1 file changed, 19 insertions(+), 90 deletions(-)

diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
index a5789e27d3..3acc523a88 100644
--- a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
+++ b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
@@ -10,10 +10,19 @@ SRC_URI = "git://github.com/aehs29/baremetal-helloqemu.git;protocol=https;branch
 
 S = "${WORKDIR}/git/"
 
-# These examples are not meant to be built when using either musl or glibc
-COMPATIBLE_HOST_libc-musl_class-target = "null"
-COMPATIBLE_HOST_libc-glibc_class-target = "null"
+# The following variables should be set to accomodate each application
+BAREMETAL_BINNAME ?= "hello_baremetal_${MACHINE}"
+IMAGE_LINK_NAME ?= "baremetal-helloworld-image-${MACHINE}"
+IMAGE_NAME_SUFFIX ?= ""
+
+# Baremetal-Image creates the proper wiring, assumes the output is provided in
+# binary and ELF format, installed on ${base_libdir}/firmware/ , we want a
+# package to be created since we might have some way of updating the baremetal
+# firmware from Linux
+inherit baremetal-image
+
 
+# These parameters are app specific for this example
 # This will be translated automatically to the architecture and
 # machine that QEMU uses on OE, e.g. -machine virt -cpu cortex-a57
 # but the examples can also be run on other architectures/machines
@@ -25,97 +34,17 @@ BAREMETAL_QEMUARCH_qemuarmv5 = "versatile"
 BAREMETAL_QEMUARCH_qemuarm = "arm"
 BAREMETAL_QEMUARCH_qemuarm64 = "aarch64"
 
-
 EXTRA_OEMAKE_append = " QEMUARCH=${BAREMETAL_QEMUARCH} V=1"
 
-do_install(){
-    install -d ${D}/${datadir}
-    install -m 755 ${B}build/hello_baremetal_${BAREMETAL_QEMUARCH}.bin ${D}/${datadir}/hello_baremetal_${MACHINE}.bin
-    install -m 755 ${B}build/hello_baremetal_${BAREMETAL_QEMUARCH}.elf ${D}/${datadir}/hello_baremetal_${MACHINE}.elf
-}
 
-# Borrowed from meta-freertos
-inherit rootfs-postcommands
-IMGDEPLOYDIR ?= "${WORKDIR}/deploy-${PN}-image-complete"
-do_rootfs[dirs] = "${DEPLOYDIR} ${DEPLOY_DIR_IMAGE}"
-DEPLOYDIR = "${IMGDEPLOYDIR}"
-IMAGE_LINK_NAME ?= "baremetal-helloworld-image-${MACHINE}"
-IMAGE_NAME_SUFFIX ?= ""
-
-do_image_complete(){
-    :
-}
-
-do_image(){
-    install ${D}/${datadir}/hello_baremetal_${MACHINE}.bin ${DEPLOYDIR}/${IMAGE_LINK_NAME}.bin
-    install ${D}/${datadir}/hello_baremetal_${MACHINE}.elf ${DEPLOYDIR}/${IMAGE_LINK_NAME}.elf
+# Install binaries on the proper location for baremetal-image to fetch and deploy
+do_install(){
+    install -d ${D}/${base_libdir}/firmware
+    install -m 755 ${B}build/hello_baremetal_${BAREMETAL_QEMUARCH}.bin ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin
+    install -m 755 ${B}build/hello_baremetal_${BAREMETAL_QEMUARCH}.elf ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf
 }
 
 FILES_${PN} += " \
-    ${datadir}/hello_baremetal_${MACHINE}.bin \
-    ${datadir}/hello_baremetal_${MACHINE}.elf \
+    ${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin \
+    ${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf \
 "
-
-python do_rootfs(){
-    from oe.utils import execute_pre_post_process
-    from pathlib import Path
-
-    # Write empty manifest testdate file
-    deploy_dir = d.getVar('DEPLOYDIR')
-    link_name = d.getVar('IMAGE_LINK_NAME')
-    manifest_name = d.getVar('IMAGE_MANIFEST')
-
-    Path(manifest_name).touch()
-    if os.path.exists(manifest_name) and link_name:
-        manifest_link = deploy_dir + "/" + link_name + ".manifest"
-        if os.path.lexists(manifest_link):
-            os.remove(manifest_link)
-        os.symlink(os.path.basename(manifest_name), manifest_link)
-    execute_pre_post_process(d, d.getVar('ROOTFS_POSTPROCESS_COMMAND'))
-}
-
-# QEMU generic FreeRTOS parameters
-QB_DEFAULT_KERNEL = "${IMAGE_LINK_NAME}.bin"
-QB_MEM = "-m 256"
-QB_OPT_APPEND = "-nographic"
-QB_DEFAULT_FSTYPE = "bin"
-QB_DTB = ""
-
-
-# Assure binaries, manifest and qemubootconf are populated on DEPLOY_DIR_IMAGE
-do_image_complete[dirs] = "${TOPDIR}"
-do_image_complete[umask] = "022"
-SSTATETASKS += "do_image_complete"
-SSTATE_SKIP_CREATION_task-image-complete = '1'
-do_image_complete[sstate-inputdirs] = "${IMGDEPLOYDIR}"
-do_image_complete[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
-do_image_complete[stamp-extra-info] = "${MACHINE_ARCH}"
-addtask do_image_complete after do_image before do_build
-
-python do_image_complete_setscene () {
-    sstate_setscene(d)
-}
-addtask do_image_complete_setscene
-
-# This next part is necessary to trick the build system into thinking
-# its building an image recipe so it generates the qemuboot.conf
-# addtask do_deploy after do_write_qemuboot_conf before do_build
-addtask do_rootfs before do_image after do_install
-addtask do_image after do_rootfs before do_build
-addtask do_image_complete after do_image before do_build
-inherit qemuboot
-
-# Based on image.bbclass to make sure we build qemu
-python(){
-    # do_addto_recipe_sysroot doesnt exist for all recipes, but we need it to have
-    # /usr/bin on recipe-sysroot (qemu) populated
-    def extraimage_getdepends(task):
-        deps = ""
-        for dep in (d.getVar('EXTRA_IMAGEDEPENDS') or "").split():
-        # Make sure we only add it for qemu
-            if 'qemu' in dep:
-                deps += " %s:%s" % (dep, task)
-        return deps
-    d.appendVarFlag('do_image', 'depends', extraimage_getdepends('do_addto_recipe_sysroot'))
-    d.appendVarFlag('do_image', 'depends', extraimage_getdepends('do_populate_sysroot'))
-}
-- 
2.17.1

