Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TvrAf-0001Nx-LS
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 16:14:26 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2013 06:58:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,486,1355126400"; d="scan'208";a="192236331"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Jan 2013 06:58:57 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2013 16:58:47 +0200
Message-Id: <81a1810d4c60fe2648c4e34d64c63ced7e0a7296.1358432402.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1358432402.git.laurentiu.palcu@intel.com>
References: <cover.1358432402.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1358432402.git.laurentiu.palcu@intel.com>
References: <cover.1358432402.git.laurentiu.palcu@intel.com>
Subject: [PATCH 5/6] kernel.bbclass: remove references to update-modules
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2013 15:14:28 -0000

Since update-modules is now obsolete, remove it from the bbclass.

[YOCTO #3598]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/kernel.bbclass |   36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 46ba55f..4893cf2 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,7 +1,7 @@
 inherit linux-kernel-base module_strip
 
 PROVIDES += "virtual/kernel"
-DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
+DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX}"
 
 # we include gcc above, we dont need virtual/libc
 INHIBIT_DEFAULT_DEPS = "1"
@@ -293,12 +293,17 @@ fi
 pkg_postinst_modules () {
 if [ -z "$D" ]; then
 	depmod -a ${KERNEL_VERSION}
-	update-modules || true
+else
+	depmod -a -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
 fi
 }
 
 pkg_postrm_modules () {
-update-modules || true
+if [ -z "$D" ]; then
+	depmod -a ${KERNEL_VERSION}
+else
+	depmod -a -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
+fi
 }
 
 autoload_postinst_fragment() {
@@ -403,12 +408,10 @@ python populate_packages_prepend () {
 
         dvar = d.getVar('PKGD', True)
 
-        use_update_modules = oe.utils.contains('DISTRO_FEATURES', 'update-modules', True, False, d)
-
         # If autoloading is requested, output /etc/modules-load.d/<name>.conf and append
         # appropriate modprobe commands to the postinst
         autoload = d.getVar('module_autoload_%s' % basename, True)
-        if autoload and use_update_modules:
+        if autoload:
             name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
             f = open(name, 'w')
             for m in autoload.split():
@@ -422,16 +425,15 @@ python populate_packages_prepend () {
 
         # Write out any modconf fragment
         modconf = d.getVar('module_conf_%s' % basename, True)
-        if modconf and use_update_modules:
+        if modconf:
             name = '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
             f = open(name, 'w')
             f.write("%s\n" % modconf)
             f.close()
 
-        if use_update_modules:
-            files = d.getVar('FILES_%s' % pkg, True)
-            files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
-            d.setVar('FILES_%s' % pkg, files)
+        files = d.getVar('FILES_%s' % pkg, True)
+        files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
+        d.setVar('FILES_%s' % pkg, files)
 
         if vals.has_key("description"):
             old_desc = d.getVar('DESCRIPTION_' + pkg, True) or ""
@@ -447,17 +449,13 @@ python populate_packages_prepend () {
     module_regex = '^(.*)\.k?o$'
     module_pattern = 'kernel-module-%s'
 
-    use_update_modules = oe.utils.contains('DISTRO_FEATURES', 'update-modules', True, False, d)
-    if use_update_modules:
-        postinst = d.getVar('pkg_postinst_modules', True)
-        postrm = d.getVar('pkg_postrm_modules', True)
-    else:
-        postinst = None
-        postrm = None
+    postinst = d.getVar('pkg_postinst_modules', True)
+    postrm = d.getVar('pkg_postrm_modules', True)
+
     do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.bin$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
     do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.fw$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
     do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.cis$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
-    do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%skernel-%s' % (['', 'update-modules '][use_update_modules], d.getVar("KERNEL_VERSION", True)))
+    do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION", True)))
 
     # If modules-load.d and modprobe.d are empty at this point, remove them to
     # avoid warnings. removedirs only raises an OSError if an empty
-- 
1.7.9.5



