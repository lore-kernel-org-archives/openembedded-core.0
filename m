Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U2fB6-0006Tt-W1
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 10:51:03 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Feb 2013 01:35:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,602,1355126400"; d="scan'208";a="281086853"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2013 01:35:08 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 11:34:56 +0200
Message-Id: <cf8923a687af2bbb2f39fb50bb7d03cb28ce3672.1360055640.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360055640.git.laurentiu.palcu@intel.com>
References: <cover.1360055640.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360055640.git.laurentiu.palcu@intel.com>
References: <cover.1360055640.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/8] add qemuwrapper-cross recipe
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
X-List-Received-Date: Tue, 05 Feb 2013 09:51:11 -0000
X-List-Received-Date: Tue, 05 Feb 2013 09:51:11 -0000

This will just install a wrapper script in STAGING_BINDIR_CROSS that
will execute the proper qemu user binary for the current target.

[YOCTO #2599]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../recipes-devtools/qemu/qemuwrapper-cross_1.0.bb |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb

diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
new file mode 100644
index 0000000..dc16047
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Qemu wrapper script"
+LICENSE = "MIT"
+PR = "r0"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+inherit qemu
+
+do_install () {
+    install -d ${STAGING_BINDIR_CROSS}
+
+    echo "#!/bin/sh" > ${STAGING_BINDIR_CROSS}/qemuwrapper
+    echo exec env ${@qemu_target_binary(d)} \"\$@\" >> ${STAGING_BINDIR_CROSS}/qemuwrapper
+    chmod +x ${STAGING_BINDIR_CROSS}/qemuwrapper
+}
-- 
1.7.9.5



