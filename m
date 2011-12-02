Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RWJm5-0006wD-3X
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 04:26:57 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 19:20:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,281,1320652800"; d="scan'208";a="81358025"
Received: from unknown (HELO localhost) ([10.255.12.185])
	by azsmga001.ch.intel.com with ESMTP; 01 Dec 2011 19:20:13 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu,  1 Dec 2011 19:20:15 -0800
Message-Id: <4ef49c1f45f1d61be02121e755546ca10e4668a1.1322795646.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322795646.git.dvhart@linux.intel.com>
References: <cover.1322795646.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1322795646.git.dvhart@linux.intel.com>
References: <cover.1322795646.git.dvhart@linux.intel.com>
Subject: [PATCH 1/1] bootimage: Use ${S} explicitly for generated config files
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
X-List-Received-Date: Fri, 02 Dec 2011 03:26:57 -0000

The syslinux and grub-efi classes were generating config files in the current
working directory. This caused a failure due to a race in the creation of the
directories leading to cwd changing and the build failing to find the config
files. While this has been addressed in bitbake, it is better to use an
explicit path.

While ${WORKDIR} may seem a more appropriate place, the recipe
already uses ${S} for the "hdd" and "cd" construction, so we use ${S}
here to keep things consolidated and consistent and address the issue
with minimal change.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/classes/grub-efi.bbclass |    8 +++-----
 meta/classes/syslinux.bbclass |    4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 333e6c5..36b5831 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -16,7 +16,7 @@
 
 do_bootimg[depends] += "grub-efi-${TARGET_ARCH}-native:do_deploy"
 
-GRUBCFG = "grub.cfg"
+GRUBCFG = "${S}/grub.cfg"
 GRUB_TIMEOUT ?= "10"
 #FIXME: build this from the machine config
 GRUB_OPTS ?= "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1"
@@ -56,7 +56,7 @@ grubefi_iso_populate() {
 
 	# FIXUP the <EFIDIR> token in the config
 	# FIXME: This can be dropped once mkdosfs is fixed
-	sed -i "s@<EFIDIR>@${EFIDIR}@g" ${GRUB_ISODIR}/${GRUBCFG}
+	sed -i "s@<EFIDIR>@${EFIDIR}@g" ${GRUB_ISODIR}/$(basename "${GRUBCFG}")
 }
 
 grubefi_hddimg_populate() {
@@ -64,7 +64,7 @@ grubefi_hddimg_populate() {
 
 	# FIXUP the <EFIDIR> token in the config
 	# FIXME: This can be dropped once mkdosfs is fixed
-	sed -i "s@<EFIDIR>@@g" ${GRUB_HDDDIR}/${GRUBCFG}
+	sed -i "s@<EFIDIR>@@g" ${GRUB_HDDDIR}/$(basename "${GRUBCFG}")
 }
 
 # FIXME: The <EFIDIR> token can be replaced with ${EFIDIR} once the
@@ -90,8 +90,6 @@ python build_grub_cfg() {
     if not cfile:
         raise bb.build.FuncFailed('Unable to read GRUBCFG')
 
-    #bb.mkdirhier(os.path.dirname(cfile))
-
     try:
          cfgfile = file(cfile, 'w')
     except OSError:
diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 6eb804b..91c4275 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -15,8 +15,8 @@
 do_bootimg[depends] += "syslinux:do_populate_sysroot \
                         syslinux-native:do_populate_sysroot"
 
-SYSLINUXCFG  = "syslinux.cfg"
-SYSLINUXMENU = "menu"
+SYSLINUXCFG  = "${S}/syslinux.cfg"
+SYSLINUXMENU = "${S}/menu"
 
 SYSLINUX_ISODIR = "${ISODIR}/isolinux"
 SYSLINUX_HDDDIR = "${HDDDIR}"
-- 
1.7.6.4



