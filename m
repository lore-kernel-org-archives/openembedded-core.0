Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TlgD3-0005ZR-Qa
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 14:30:52 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Dec 2012 05:14:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,322,1355126400"; d="scan'208";a="260184603"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 20 Dec 2012 05:15:43 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2012 15:15:38 +0200
Message-Id: <1356009340-15874-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1356009340-15874-1-git-send-email-laurentiu.palcu@intel.com>
References: <1356009340-15874-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH v2 1/3] qemu.bbclass: add qemu_run_binary() function
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
X-List-Received-Date: Thu, 20 Dec 2012 13:30:52 -0000
X-List-Received-Date: Thu, 20 Dec 2012 13:30:52 -0000

[YOCTO #3602]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/qemu.bbclass |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index aead8e2..13af339 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -13,3 +13,20 @@ def qemu_target_binary(data):
         target_arch = "ppc64"
 
     return "qemu-" + target_arch
+#
+# Next function will return a string containing the command that is needed to
+# to run a certain binary through qemu. For example, in order to make a certain
+# postinstall scriptlet run at do_rootfs time and running the postinstall is
+# architecture dependent, we can run it through qemu. For example, in the
+# postinstall scriptlet, we could use the following:
+#
+# ${@qemu_run_binary(d, '$D', '/usr/bin/test_app')} [test_app arguments]
+#
+def qemu_run_binary(data, rootfs_path, binary):
+    dynamic_loader = rootfs_path + '$(readelf -l ' + rootfs_path + \
+                     binary + '| grep "Requesting program interpreter"|sed -e \'s/^.*\[.*: \(.*\)\]/\\1/\')'
+    library_path = rootfs_path + data.getVar("base_libdir", True) + ":" + \
+                   rootfs_path + data.getVar("libdir", True)
+
+    return qemu_target_binary(data) + " " + dynamic_loader + " --library-path " + library_path \
+           + " " + rootfs_path + binary
-- 
1.7.9.5



