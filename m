Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RTUPO-0005XJ-By
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 09:11:53 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 Nov 2011 00:05:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,564,1315206000"; d="scan'208";a="88782105"
Received: from unknown (HELO localhost) ([10.255.15.253])
	by fmsmga001.fm.intel.com with ESMTP; 24 Nov 2011 00:05:16 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Koen Kooi <koen@dominion.thruhere.net>, Chris Larson <clarson@kergoth.com>,
	Josef Ahmad <josef.ahmad@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2011 00:05:09 -0800
Message-Id: <ee9362144ea7a5ae671d932b75b731c76f0fa8c7.1322120651.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <d5ab9354f38a3cdecfedaf734ffb48aa969a8541.1322120651.git.dvhart@linux.intel.com>
References: <d5ab9354f38a3cdecfedaf734ffb48aa969a8541.1322120651.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1322120651.git.dvhart@linux.intel.com>
References: <cover.1322120651.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [RFC PATCH 4/5] bootimg: Add grub-efi support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Nov 2011 08:11:53 -0000

Create a new grub-efi.bbclass and integrate it into bootimg alongside the
syslinux support. This new class uses the output from the grub-efi-native
recipe. Thanks goes to Josef Ahmad <josef.ahmad@intel.com> for the original
build_grub_cfg() routine.

The EFI features are only added to the image if MACHINE_FEATURES contains
"efi". The resulting images are therefor either legacy boot only (like they
were originally) or legacy boot and EFI boot.

A new "dummy.bbclass" was added to allow for the conditional include
of grub-efi. This makes it so if efi support is not to be built in, we
don't spend time building grub-efi-native just because the include adds
the dependency.

There is a bug in the mkdosfs tool from the dosfstools package which causes
it to crash when the directory passed with the -d parameter contains
sub-directories. An /EFI/BOOT directory is required for a proper EFI
installation. Until it is fixed, we install to the top level directory
for the hddimg.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Josef Ahmad <josef.ahmad@intel.com>
---
 meta/classes/bootimg.bbclass  |   13 ++++
 meta/classes/dummy.bbclass    |    2 +
 meta/classes/grub-efi.bbclass |  140 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 155 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/dummy.bbclass
 create mode 100644 meta/classes/grub-efi.bbclass

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index d4da95b..44bb61e 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -35,7 +35,12 @@ ISODIR = "${S}/cd"
 BOOTIMG_VOLUME_ID   ?= "boot"
 BOOTIMG_EXTRA_SPACE ?= "512"
 
+EFI = ${@base_contains("MACHINE_FEATURES", "efi", "1", "0", d)}
+EFI_CLASS = ${@base_contains("MACHINE_FEATURES", "efi", "grub-efi", "dummy", d)}
+
 inherit syslinux
+inherit ${EFI_CLASS}
+
 
 build_iso() {
 	# Only create an ISO if we have an INITRD and NOISO was not set
@@ -47,6 +52,9 @@ build_iso() {
 	install -d ${ISODIR}
 
 	syslinux_iso_populate
+	if [ "${EFI}" = "1" ]; then
+		grubefi_iso_populate
+	fi
 
 	mkisofs -V ${BOOTIMG_VOLUME_ID} \
 	        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
@@ -62,6 +70,9 @@ build_hddimg() {
 	install -d ${HDDDIR}
 
 	syslinux_hddimg_populate
+	if [ "${EFI}" = "1" ]; then
+		grubefi_hddimg_populate
+	fi
 
 	# Determine the block count for the final image
 	BLOCKS=`du -bks ${HDDDIR} | cut -f 1`
@@ -81,6 +92,8 @@ build_hddimg() {
 
 python do_bootimg() {
 	bb.build.exec_func('build_syslinux_cfg', d)
+	if d.getVar("EFI", True) == "1":
+		bb.build.exec_func('build_grub_cfg', d)
 	bb.build.exec_func('build_hddimg', d)
 	bb.build.exec_func('build_iso', d)
 }
diff --git a/meta/classes/dummy.bbclass b/meta/classes/dummy.bbclass
new file mode 100644
index 0000000..8c30071
--- /dev/null
+++ b/meta/classes/dummy.bbclass
@@ -0,0 +1,2 @@
+# An empty bbclass to facilitate dynamic inherit, include,
+# and require statements.
diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
new file mode 100644
index 0000000..333e6c5
--- /dev/null
+++ b/meta/classes/grub-efi.bbclass
@@ -0,0 +1,140 @@
+# grub-efi.bbclass
+# Copyright (c) 2011, Intel Corporation.
+# All rights reserved.
+#
+# Released under the MIT license (see packages/COPYING)
+
+# Provide grub-efi specific functions for building bootable images.
+
+# External variables
+# ${INITRD} - indicates a filesystem image to use as an initrd (optional)
+# ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
+# ${LABELS} - a list of targets for the automatic config
+# ${APPEND} - an override list of append strings for each label
+# ${GRUB_OPTS} - additional options to add to the config, ';' delimited # (optional)
+# ${GRUB_TIMEOUT} - timeout before executing the deault label (optional)
+
+do_bootimg[depends] += "grub-efi-${TARGET_ARCH}-native:do_deploy"
+
+GRUBCFG = "grub.cfg"
+GRUB_TIMEOUT ?= "10"
+#FIXME: build this from the machine config
+GRUB_OPTS ?= "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1"
+
+# FIXME: add EFI/BOOT to GRUB_HDDDIR once the mkdosfs subdir bug is resolved
+#        http://bugzilla.yoctoproject.org/show_bug.cgi?id=1783
+EFIDIR = "/EFI/BOOT"
+GRUB_HDDDIR = "${HDDDIR}"
+GRUB_ISODIR = "${ISODIR}${EFIDIR}"
+
+grubefi_populate() {
+	DEST=$1
+
+	install -d ${DEST}
+
+	install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage ${DEST}/vmlinuz
+
+	if [ -n "${INITRD}" ] && [ -s "${INITRD}" ]; then 
+    		install -m 0644 ${INITRD} ${DEST}/initrd
+	fi
+
+	if [ -n "${ROOTFS}" ] && [ -s "${ROOTFS}" ]; then 
+    		install -m 0644 ${ROOTFS} ${DEST}/rootfs.img
+	fi
+
+	GRUB_IMAGE="bootia32.efi"
+	if [ "${TARGET_ARCH}" = "x86_64" ]; then
+		GRUB_IMAGE="bootx64.efi"
+	fi
+	install -m 0644 ${DEPLOY_DIR_IMAGE}/${GRUB_IMAGE} ${DEST}
+
+	install -m 0644 ${GRUBCFG} ${DEST}
+}
+
+grubefi_iso_populate() {
+	grubefi_populate ${GRUB_ISODIR}
+
+	# FIXUP the <EFIDIR> token in the config
+	# FIXME: This can be dropped once mkdosfs is fixed
+	sed -i "s@<EFIDIR>@${EFIDIR}@g" ${GRUB_ISODIR}/${GRUBCFG}
+}
+
+grubefi_hddimg_populate() {
+	grubefi_populate ${GRUB_HDDDIR}
+
+	# FIXUP the <EFIDIR> token in the config
+	# FIXME: This can be dropped once mkdosfs is fixed
+	sed -i "s@<EFIDIR>@@g" ${GRUB_HDDDIR}/${GRUBCFG}
+}
+
+# FIXME: The <EFIDIR> token can be replaced with ${EFIDIR} once the
+#        mkdosfs bug is resolved.
+python build_grub_cfg() {
+    import sys
+
+    workdir = d.getVar('WORKDIR', True)
+    if not workdir:
+        bb.error("WORKDIR not defined, unable to package")
+        return
+       
+    labels = d.getVar('LABELS', True)
+    if not labels:
+        bb.debug(1, "LABELS not defined, nothing to do")
+        return
+   
+    if labels == []:
+        bb.debug(1, "No labels, nothing to do")
+        return
+
+    cfile = d.getVar('GRUBCFG', True)
+    if not cfile:
+        raise bb.build.FuncFailed('Unable to read GRUBCFG')
+
+    #bb.mkdirhier(os.path.dirname(cfile))
+
+    try:
+         cfgfile = file(cfile, 'w')
+    except OSError:
+        raise bb.build.funcFailed('Unable to open %s' % (cfile))
+
+    cfgfile.write('# Automatically created by OE\n')
+
+    opts = d.getVar('GRUB_OPTS', True)
+    if opts:
+        for opt in opts.split(';'):
+            cfgfile.write('%s\n' % opt)
+
+    cfgfile.write('default=%s\n' % (labels.split()[0]))
+
+    timeout = d.getVar('GRUB_TIMEOUT', True)
+    if timeout:
+        cfgfile.write('timeout=%s\n' % timeout)
+    else:
+        cfgfile.write('timeout=50\n')
+
+    for label in labels.split():
+        localdata = d.createCopy()
+
+        overrides = localdata.getVar('OVERRIDES', True)
+        if not overrides:
+            raise bb.build.FuncFailed('OVERRIDES not defined')
+
+        localdata.setVar('OVERRIDES', label + ':' + overrides)
+        bb.data.update_data(localdata)
+
+        cfgfile.write('\nmenuentry \'%s\'{\n' % (label))
+        cfgfile.write('linux <EFIDIR>/vmlinuz LABEL=%s' % (label))
+
+        append = localdata.getVar('APPEND', True)
+        initrd = localdata.getVar('INITRD', True)
+
+        if append:
+            cfgfile.write('%s' % (append))
+        cfgfile.write('\n')
+   
+        if initrd:
+            cfgfile.write('initrd <EFIDIR>/initrd')
+        cfgfile.write('\n}\n')
+
+    cfgfile.close()
+}
-- 
1.7.6.4



