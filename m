Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.52601.1594018229954965201
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2020 23:50:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from ALSAMON-X.corp.microsoft.com (unknown [131.107.159.250])
	by linux.microsoft.com (Postfix) with ESMTPSA id DAA9020B717A
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Jul 2020 23:50:28 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DAA9020B717A
From: "Alejandro Hernandez" <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] baremetal-image.bbclass: Create a class for baremetal applications or an RTOS
Date: Sun,  5 Jul 2020 23:50:21 -0700
Message-Id: <20200706065021.18735-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.17.1

Baremetal applications or an RTOS built with OpenEmbedded can share the same
code to be built as an image, tested and packaged in case they can be updated
as a firmware blob from Linux.

This class creates the proper wiring to mimic OE Linux image creation and
testing infrastructure, inheriting it makes the process of creating a baremetal
application transparent to the developer deploying it automatically along with
its required bits to be run and tested.

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
---
 meta/classes/baremetal-image.bbclass | 99 ++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 meta/classes/baremetal-image.bbclass

diff --git a/meta/classes/baremetal-image.bbclass b/meta/classes/baremetal-image.bbclass
new file mode 100644
index 0000000000..90d58f2615
--- /dev/null
+++ b/meta/classes/baremetal-image.bbclass
@@ -0,0 +1,99 @@
+# Baremetal image class
+#
+# This class is meant to be inherited by recipes for baremetal/RTOS applications
+# It contains code that would be used by all of them, every recipe just needs to
+# override certain variables.
+#
+# For scalability purposes, code within this class focuses on the "image" wiring
+# to satisfy the OpenEmbedded image creation and testing infrastructure.
+#
+# See meta-skeleton for a working example.
+
+
+# Toolchain should be baremetal or newlib based.
+# TCLIBC="baremetal" or TCLIBC="newlib"
+COMPATIBLE_HOST_libc-musl_class-target = "null"
+COMPATIBLE_HOST_libc-glibc_class-target = "null"
+
+
+inherit rootfs-postcommands
+
+# Set some defaults, but these should be overriden by each recipe if required
+IMGDEPLOYDIR ?= "${WORKDIR}/deploy-${PN}-image-complete"
+BAREMETAL_BINNAME ?= "hello_baremetal_${MACHINE}"
+IMAGE_LINK_NAME ?= "baremetal-helloworld-image-${MACHINE}"
+IMAGE_NAME_SUFFIX ?= ""
+
+do_rootfs[dirs] = "${IMGDEPLOYDIR} ${DEPLOY_DIR_IMAGE}"
+
+do_image(){
+    install ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin ${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.bin
+    install ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf ${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.elf
+}
+
+do_image_complete(){
+    :
+}
+
+python do_rootfs(){
+    from oe.utils import execute_pre_post_process
+    from pathlib import Path
+
+    # Write empty manifest file to satisfy test infrastructure
+    deploy_dir = d.getVar('IMGDEPLOYDIR')
+    link_name = d.getVar('IMAGE_LINK_NAME')
+    manifest_name = d.getVar('IMAGE_MANIFEST')
+
+    Path(manifest_name).touch()
+    if os.path.exists(manifest_name) and link_name:
+        manifest_link = deploy_dir + "/" + link_name + ".manifest"
+        if os.path.lexists(manifest_link):
+            os.remove(manifest_link)
+        os.symlink(os.path.basename(manifest_name), manifest_link)
+    execute_pre_post_process(d, d.getVar('ROOTFS_POSTPROCESS_COMMAND'))
+}
+
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
+# QEMU generic Baremetal/RTOS parameters
+QB_DEFAULT_KERNEL ?= "${IMAGE_LINK_NAME}.bin"
+QB_MEM ?= "-m 256"
+QB_DEFAULT_FSTYPE ?= "bin"
+QB_DTB ?= ""
+QB_OPT_APPEND = "-nographic"
+
+# This next part is necessary to trick the build system into thinking
+# its building an image recipe so it generates the qemuboot.conf
+addtask do_rootfs before do_image after do_install
+addtask do_image after do_rootfs before do_image_complete
+addtask do_image_complete after do_image before do_build
+inherit qemuboot
+
+# Based on image.bbclass to make sure we build qemu
+python(){
+    # do_addto_recipe_sysroot doesnt exist for all recipes, but we need it to have
+    # /usr/bin on recipe-sysroot (qemu) populated
+    def extraimage_getdepends(task):
+        deps = ""
+        for dep in (d.getVar('EXTRA_IMAGEDEPENDS') or "").split():
+        # Make sure we only add it for qemu
+            if 'qemu' in dep:
+                deps += " %s:%s" % (dep, task)
+        return deps
+    d.appendVarFlag('do_image', 'depends', extraimage_getdepends('do_addto_recipe_sysroot'))
+    d.appendVarFlag('do_image', 'depends', extraimage_getdepends('do_populate_sysroot'))
+}
-- 
2.17.1

