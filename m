Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.1967.1593740721396596187
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 18:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from ALSAMON-X.corp.microsoft.com (unknown [131.107.159.250])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4AD5620B717A
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Jul 2020 18:45:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4AD5620B717A
From: "Alejandro Hernandez" <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] baremetal-helloworld: Use do_image_complete instead of do_deploy
Date: Thu,  2 Jul 2020 18:45:16 -0700
Message-Id: <20200703014516.29370-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.17.1

To better align with upstream and mimic how images
are built, use do_image and do_image_complete instead
of do_deploy to populate artifacts on DEPLOY_DIR_IMAGE.

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
---
 .../baremetal-helloworld_git.bb               | 31 ++++++++++++++-----
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
index e84a90f28c..a5789e27d3 100644
--- a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
+++ b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
@@ -36,21 +36,19 @@ do_install(){
 
 # Borrowed from meta-freertos
 inherit rootfs-postcommands
-inherit deploy
 IMGDEPLOYDIR ?= "${WORKDIR}/deploy-${PN}-image-complete"
-do_deploy[dirs] = "${DEPLOYDIR} ${DEPLOY_DIR_IMAGE}"
 do_rootfs[dirs] = "${DEPLOYDIR} ${DEPLOY_DIR_IMAGE}"
 DEPLOYDIR = "${IMGDEPLOYDIR}"
 IMAGE_LINK_NAME ?= "baremetal-helloworld-image-${MACHINE}"
 IMAGE_NAME_SUFFIX ?= ""
 
-do_deploy(){
-    install ${D}/${datadir}/hello_baremetal_${MACHINE}.bin ${DEPLOYDIR}/${IMAGE_LINK_NAME}.bin
-    install ${D}/${datadir}/hello_baremetal_${MACHINE}.elf ${DEPLOYDIR}/${IMAGE_LINK_NAME}.elf
+do_image_complete(){
+    :
 }
 
 do_image(){
-    :
+    install ${D}/${datadir}/hello_baremetal_${MACHINE}.bin ${DEPLOYDIR}/${IMAGE_LINK_NAME}.bin
+    install ${D}/${datadir}/hello_baremetal_${MACHINE}.elf ${DEPLOYDIR}/${IMAGE_LINK_NAME}.elf
 }
 
 FILES_${PN} += " \
@@ -83,11 +81,28 @@ QB_OPT_APPEND = "-nographic"
 QB_DEFAULT_FSTYPE = "bin"
 QB_DTB = ""
 
+
+# Assure binaries, manifest and qemubootconf are populated on DEPLOY_DIR_IMAGE
+do_image_complete[dirs] = "${TOPDIR}"
+do_image_complete[umask] = "022"
+SSTATETASKS += "do_image_complete"
+SSTATE_SKIP_CREATION_task-image-complete = '1'
+do_image_complete[sstate-inputdirs] = "${IMGDEPLOYDIR}"
+do_image_complete[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
+do_image_complete[stamp-extra-info] = "${MACHINE_ARCH}"
+addtask do_image_complete after do_image before do_build
+
+python do_image_complete_setscene () {
+    sstate_setscene(d)
+}
+addtask do_image_complete_setscene
+
 # This next part is necessary to trick the build system into thinking
 # its building an image recipe so it generates the qemuboot.conf
-addtask do_deploy after do_write_qemuboot_conf before do_build
-addtask do_rootfs before do_deploy after do_install
+# addtask do_deploy after do_write_qemuboot_conf before do_build
+addtask do_rootfs before do_image after do_install
 addtask do_image after do_rootfs before do_build
+addtask do_image_complete after do_image before do_build
 inherit qemuboot
 
 # Based on image.bbclass to make sure we build qemu
-- 
2.17.1

