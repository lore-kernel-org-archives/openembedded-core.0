Return-Path: <nitin.a.kamble@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5FDF56FEF8
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 18:30:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Jul 2014 11:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,758,1400050800"; d="scan'208";a="580776394"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by orsmga002.jf.intel.com with ESMTP; 29 Jul 2014 11:30:10 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org, darren.hart@intel.com,
	ross.burton@intel.com, richard.purdie@linuxfoundation.org
Date: Tue, 29 Jul 2014 11:34:45 -0700
Message-Id: <b60eac03f169389484bcc40fdfc3e4e12cb7934b.1406658528.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1406658528.git.nitin.a.kamble@intel.com>
References: <cover.1406658528.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] INITRD var: make it a list of filesystem images
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jul 2014 18:30:22 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The initrd image used by the Linux kernel is list of file system images
concatenated together and presented as a single initrd file at boot time.

So far the initrd is a single filesystem image. But in cases like to support
early microcode loading, the initrd image need to have multiple filesystem
images concatenated together.

This commit is extending the INITRD variable from a single filesystem image
to a list of filesystem images to satisfy the need mentioned above.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 documentation/ref-manual/ref-classes.xml   |  4 ++--
 documentation/ref-manual/ref-variables.xml |  2 +-
 meta/classes/boot-directdisk.bbclass       | 13 ++++++++++---
 meta/classes/bootimg.bbclass               | 27 ++++++++++++++++++++++-----
 meta/classes/grub-efi.bbclass              |  2 +-
 meta/classes/syslinux.bbclass              |  2 +-
 meta/conf/documentation.conf               |  2 +-
 7 files changed, 38 insertions(+), 14 deletions(-)

diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-manual/ref-classes.xml
index e7e9942..0bf3546 100644
--- a/documentation/ref-manual/ref-classes.xml
+++ b/documentation/ref-manual/ref-classes.xml
@@ -881,7 +881,7 @@
         <itemizedlist>
             <listitem><para>
                 <link linkend='var-INITRD'><filename>INITRD</filename></link>:
-                Indicates a filesystem image to use as an initrd (optional).
+                Indicates list of filesystem images to concatenate and use as an initrd (optional).
                 </para></listitem>
             <listitem><para>
                 <link linkend='var-ROOTFS'><filename>ROOTFS</filename></link>:
@@ -2864,7 +2864,7 @@
         The class supports the following variables:
         <itemizedlist>
             <listitem><para><emphasis><link linkend='var-INITRD'><filename>INITRD</filename></link>:</emphasis>
-                Indicates a filesystem image to use as an initial RAM disk
+                Indicates list of filesystem images to concatenate and use as an initial RAM disk
                 (initrd).
                 This variable is optional.</para></listitem>
             <listitem><para><emphasis><link linkend='var-ROOTFS'><filename>ROOTFS</filename></link>:</emphasis>
diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index b4d6e71..16e3ed6 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -4020,7 +4020,7 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
         <glossentry id='var-INITRD'><glossterm>INITRD</glossterm>
             <glossdef>
                 <para>
-                    Indicates a filesystem image to use as an initial RAM
+                    Indicates list of filesystem images to concatenate and use as an initial RAM
                     disk (<filename>initrd</filename>).
                 </para>
 
diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 0da9932..995d3e7 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -71,10 +71,17 @@ boot_direct_populate() {
 	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
 	install -m 0644 ${STAGING_KERNEL_DIR}/bzImage $dest/vmlinuz
 
-	if [ -n "${INITRD}" ] && [ -s "${INITRD}" ]; then
-		install -m 0644 ${INITRD} $dest/initrd
+	# initrd is made of concatenation of multiple filesystem images
+	if [ -n "${INITRD}" ]; then
+		rm -f $dest/initrd
+		for fs in ${INITRD}
+		do
+			if [ -n "${fs}" ] && [ -s "${fs}" ]; then
+				cat ${fs} >> $dest/initrd
+			fi
+		done
+		chmod 0644 $dest/initrd
 	fi
-
 }
 
 build_boot_dd() {
diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index d52aace..7b3ce65 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -18,7 +18,7 @@
 # an hdd)
 
 # External variables (also used by syslinux.bbclass)
-# ${INITRD} - indicates a filesystem image to use as an initrd (optional)
+# ${INITRD} - indicates a list of filesystem images to concatenate and use as an initrd (optional)
 # ${COMPRESSISO} - Transparent compress ISO, reduce size ~40% if set to 1
 # ${NOISO}  - skip building the ISO image if set to 1
 # ${NOHDD}  - skip building the HDD image if set to 1
@@ -67,9 +67,17 @@ populate() {
 
 	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
 	install -m 0644 ${STAGING_KERNEL_DIR}/bzImage ${DEST}/vmlinuz
-
-	if [ -n "${INITRD}" ] && [ -s "${INITRD}" ]; then
-		install -m 0644 ${INITRD} ${DEST}/initrd
+	
+	# initrd is made of concatenation of multiple filesystem images
+	if [ -n "${INITRD}" ]; then
+		rm -f ${DEST}/initrd
+		for fs in ${INITRD}
+		do
+			if [ -s "${fs}" ]; then
+				cat ${fs} >> ${DEST}/initrd
+			fi
+		done
+		chmod 0644 ${DEST}/initrd
 	fi
 
 	if [ -n "${ROOTFS}" ] && [ -s "${ROOTFS}" ]; then
@@ -80,10 +88,19 @@ populate() {
 
 build_iso() {
 	# Only create an ISO if we have an INITRD and NOISO was not set
-	if [ -z "${INITRD}" ] || [ ! -s "${INITRD}" ] || [ "${NOISO}" = "1" ]; then
+	if [ -z "${INITRD}" ] || [ "${NOISO}" = "1" ]; then
 		bbnote "ISO image will not be created."
 		return
 	fi
+	# ${INITRD} is a list of multiple filesystem images
+	for fs in ${INITRD}
+	do
+		if [ ! -s "${fs}" ]; then
+			bbnote "ISO image will not be created. ${fs} is invalid."
+			return
+		fi
+	done
+
 
 	populate ${ISODIR}
 
diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 505d032..47bd35e 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -7,7 +7,7 @@
 # Provide grub-efi specific functions for building bootable images.
 
 # External variables
-# ${INITRD} - indicates a filesystem image to use as an initrd (optional)
+# ${INITRD} - indicates a list of filesystem images to concatenate and use as an initrd (optional)
 # ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
 # ${GRUB_GFXSERIAL} - set this to 1 to have graphics and serial in the boot menu
 # ${LABELS} - a list of targets for the automatic config
diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index b9701bf..d6498d9 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -5,7 +5,7 @@
 # Provide syslinux specific functions for building bootable images.
 
 # External variables
-# ${INITRD} - indicates a filesystem image to use as an initrd (optional)
+# ${INITRD} - indicates a list of filesystem images to concatenate and use as an initrd (optional)
 # ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
 # ${AUTO_SYSLINUXMENU} - set this to 1 to enable creating an automatic menu
 # ${LABELS} - a list of targets for the automatic config
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 7fa3f31..31fbd6c 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -225,7 +225,7 @@ INHIBIT_PACKAGE_STRIP[doc] = "If set to "1", causes the build to not strip binar
 INHERIT[doc] = "Causes the named class to be inherited at this point during parsing. The variable is only valid in configuration files."
 INHERIT_DISTRO[doc] = "Lists classes that will be inherited at the distribution level. It is unlikely that you want to edit this variable."
 INITRAMFS_FSTYPES[doc] = "Defines the format for the output image of an initial RAM disk (initramfs), which is used during boot."
-INITRD[doc] = "Indicates a filesystem image to use as an initial RAM disk (initrd)."
+INITRD[doc] = "Indicates list of filesystem images to concatenate and use as an initial RAM disk (initrd)."
 INITSCRIPT_NAME[doc] = "The filename of the initialization script as installed to ${sysconfdir}/init.d."
 INITSCRIPT_PACKAGES[doc] = "A list of the packages that contain initscripts. This variable is used in recipes when using update-rc.d.bbclass. The variable is optional and defaults to the PN variable."
 INITSCRIPT_PARAMS[doc] = "Specifies the options to pass to update-rc.d. The variable is mandatory and is used in recipes when using update-rc.d.bbclass."
-- 
1.8.1.4


