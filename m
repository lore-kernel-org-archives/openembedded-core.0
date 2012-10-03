Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TJLlV-0003jD-W3
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 12:01:18 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Oct 2012 02:48:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,527,1344236400"; d="scan'208";a="229372996"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 03 Oct 2012 02:48:16 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 12:48:14 +0300
Message-Id: <1349257694-20782-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] qemu: add wrapper for qemu-mips binary
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
X-List-Received-Date: Wed, 03 Oct 2012 10:01:18 -0000

qemu-mips user emulation binary segfaults when running any kind of
binary. This is due to a MMU access fault in the virtual CPU. This
problem has been introduced in qemu when 4GB of vmem were reserved for
32-on-64 bit.

This workaround will need to be reverted once the proper fix is found.

[YOCTO #3143]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-devtools/qemu/qemu_1.2.0.bb |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu_1.2.0.bb b/meta/recipes-devtools/qemu/qemu_1.2.0.bb
index 191ee48..dcf998a 100644
--- a/meta/recipes-devtools/qemu/qemu_1.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.2.0.bb
@@ -29,6 +29,20 @@ do_configure_prepend_virtclass-nativesdk() {
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
+inherit utils
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



