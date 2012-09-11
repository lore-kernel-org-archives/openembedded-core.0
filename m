Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TBQtr-0004TW-5m
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 15:53:11 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Sep 2012 06:40:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,404,1344236400"; d="scan'208";a="143788750"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Sep 2012 06:40:38 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 16:40:35 +0300
Message-Id: <1347370836-13101-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] nativesdk-qemu: fix SDK relocation issue
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
X-List-Received-Date: Tue, 11 Sep 2012 13:53:11 -0000

User mode emulation binaries are linked using a local linker script. The
nativesdk ones were not used and the resulting binaries did not have the
interp section resized. Hence, those binaries could not be relocated.

[YOCTO #3083]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../qemu/qemu-1.2.0/relocatable_sdk.patch          |   34 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_1.2.0.bb           |    4 +++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu-1.2.0/relocatable_sdk.patch

diff --git a/meta/recipes-devtools/qemu/qemu-1.2.0/relocatable_sdk.patch b/meta/recipes-devtools/qemu/qemu-1.2.0/relocatable_sdk.patch
new file mode 100644
index 0000000..0a01a8a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-1.2.0/relocatable_sdk.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Inappropriate [SDK specific]
+
+In order to be able to change the dynamic loader path when relocating
+binaries, the interp section has to be made big enough to accomodate
+the new path (4096 is the maximum path length in Linux).
+
+Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
+
+Index: qemu-1.2.0/i386.ld
+===================================================================
+--- qemu-1.2.0.orig/i386.ld
++++ qemu-1.2.0/i386.ld
+@@ -8,7 +8,7 @@ SECTIONS
+ {
+   /* Read-only sections, merged into text segment: */
+   . = 0x60000000 + SIZEOF_HEADERS;
+-  .interp     : { *(.interp) 	}
++  .interp     : { *(.interp); . = 0x1000; }
+   .hash          : { *(.hash)		}
+   .dynsym        : { *(.dynsym)		}
+   .dynstr        : { *(.dynstr)		}
+Index: qemu-1.2.0/x86_64.ld
+===================================================================
+--- qemu-1.2.0.orig/x86_64.ld
++++ qemu-1.2.0/x86_64.ld
+@@ -6,7 +6,7 @@ SECTIONS
+ {
+   /* Read-only sections, merged into text segment: */
+   . = 0x60000000 + SIZEOF_HEADERS;
+-  .interp         : { *(.interp) }
++  .interp         : { *(.interp); . = 0x1000; }
+   .hash           : { *(.hash) }
+   .dynsym         : { *(.dynsym) }
+   .dynstr         : { *(.dynstr) }
diff --git a/meta/recipes-devtools/qemu/qemu_1.2.0.bb b/meta/recipes-devtools/qemu/qemu_1.2.0.bb
index 55ac532..636a666 100644
--- a/meta/recipes-devtools/qemu/qemu_1.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.2.0.bb
@@ -17,6 +17,10 @@ SRC_URI = "\
 SRC_URI[md5sum] = "78eb1e984f4532aa9f2bdd3c127b5b61"
 SRC_URI[sha256sum] = "c8b84420d9f4869397f84cad2dabd9a475b7723d619a924a873740353e9df936"
 
+SRC_URI_append_virtclass-nativesdk = "\
+    file://relocatable_sdk.patch \
+    "
+
 do_configure_prepend_virtclass-nativesdk() {
 	if [ "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" = "" ] ; then
 		# Undo the -lX11 added by linker-flags.patch
-- 
1.7.9.5



