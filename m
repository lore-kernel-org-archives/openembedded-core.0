Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U2fB8-0006Tz-HY
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 10:51:03 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Feb 2013 01:35:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,602,1355126400"; d="scan'208";a="281086883"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2013 01:35:09 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 11:34:57 +0200
Message-Id: <8f083e08423bf37206fff61c4da34641a7b1291f.1360055640.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360055640.git.laurentiu.palcu@intel.com>
References: <cover.1360055640.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360055640.git.laurentiu.palcu@intel.com>
References: <cover.1360055640.git.laurentiu.palcu@intel.com>
Subject: [PATCH 3/8] qemu.bbclass: return qemuwrapper instead of qemu-allarch
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
X-List-Received-Date: Tue, 05 Feb 2013 09:51:12 -0000

When qemu bbclass is inherited from a recipe that is not architecture
dependent, qemu_run_binary will return "qemu-allarch". However this
binary does not exist. Instead, return "qemuwrapper" which will, in
turn, execute the right binary for the target the image was built for.

[YOCTO #2599]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/qemu.bbclass |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 13af339..9cefabb 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -23,10 +23,14 @@ def qemu_target_binary(data):
 # ${@qemu_run_binary(d, '$D', '/usr/bin/test_app')} [test_app arguments]
 #
 def qemu_run_binary(data, rootfs_path, binary):
+    qemu_binary = qemu_target_binary(data)
+    if qemu_binary == "qemu-allarch":
+        qemu_binary = "qemuwrapper"
+
     dynamic_loader = rootfs_path + '$(readelf -l ' + rootfs_path + \
                      binary + '| grep "Requesting program interpreter"|sed -e \'s/^.*\[.*: \(.*\)\]/\\1/\')'
     library_path = rootfs_path + data.getVar("base_libdir", True) + ":" + \
                    rootfs_path + data.getVar("libdir", True)
 
-    return qemu_target_binary(data) + " " + dynamic_loader + " --library-path " + library_path \
+    return qemu_binary + " " + dynamic_loader + " --library-path " + library_path \
            + " " + rootfs_path + binary
-- 
1.7.9.5



