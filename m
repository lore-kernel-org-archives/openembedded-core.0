Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TJNFe-00065H-9G
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 13:36:30 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Oct 2012 04:23:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,527,1344236400"; d="scan'208";a="229964951"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 03 Oct 2012 04:23:29 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 14:23:26 +0300
Message-Id: <1349263406-23095-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1349263406-23095-1-git-send-email-laurentiu.palcu@intel.com>
References: <1349263406-23095-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH v3 1/1] qemu: add wrapper for qemu-mips binary
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
X-List-Received-Date: Wed, 03 Oct 2012 11:36:30 -0000

qemu-mips user emulation binary segfaults when running any kind of
binary. This is due to a MMU access fault in the virtual CPU. This
problem has been introduced in qemu when 4GB of vmem were reserved for
32-on-64 bit.

This workaround will need to be reverted once the proper fix is found.

[YOCTO #3143]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-devtools/qemu/qemu_1.2.0.bb |   15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu_1.2.0.bb b/meta/recipes-devtools/qemu/qemu_1.2.0.bb
index 191ee48..cbdb4d4 100644
--- a/meta/recipes-devtools/qemu/qemu_1.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.2.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "\
 SRC_URI[md5sum] = "78eb1e984f4532aa9f2bdd3c127b5b61"
 SRC_URI[sha256sum] = "c8b84420d9f4869397f84cad2dabd9a475b7723d619a924a873740353e9df936"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI_append_virtclass-nativesdk = "\
     file://relocatable_sdk.patch \
@@ -29,6 +29,19 @@ do_configure_prepend_virtclass-nativesdk() {
 		sed -i 's/-lX11//g' Makefile.target
 	fi
 }
+
+# The following fragment will create a wrapper for qemu-mips user emulation
+# binary in order to work around a segmentation fault issue. Basically, by
+# default, the reserved virtual address space for 32-on-64 bit is set to 4GB.
+# This will trigger a MMU access fault in the virtual CPU. With this change,
+# the qemu-mips works fine.
+# IMPORTANT: This piece needs to be removed once the root cause is fixed!
+do_install_append() {
+	create_wrapper ${D}/${bindir}/qemu-mips \
+		QEMU_RESERVED_VA=0x0
+}
+# END of qemu-mips workaround
+
 do_configure_prepend_virtclass-native() {
 	# Undo the -lX11 added by linker-flags.patch, don't assume that host has libX11 installed
 	sed -i 's/-lX11//g' Makefile.target
-- 
1.7.9.5



