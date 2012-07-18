Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrP5O-0004Vi-F7
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 09:54:18 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Jul 2012 00:42:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169736803"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by azsmga001.ch.intel.com with ESMTP; 18 Jul 2012 00:42:58 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 00:42:37 -0700
Message-Id: <3ea597249c18d73417abe7d7a9d32bba00499914.1342597081.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
References: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342597081.git.sgw@linux.intel.com>
References: <cover.1342597081.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/18] meta-ide-support: Add native qemu support for meta-ide-support
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
X-List-Received-Date: Wed, 18 Jul 2012 07:54:20 -0000

From: Jessica Zhang <jessica.zhang@intel.com>

[YOCTO #2761]

This patch fixed the issue that after "bitbake meta-ide-support" and try to start qemu and it will fail.  This is due to the meta-ide-support lacking dependency for qemu native and ended up using qemu under /usr/bin.  Fix the issue by adding dependency for qemu native in meta-ide-support and also add the path info in the environment-setup script.

Signed-off-by: Jessica Zhang <jessica.zhang@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/toolchain-scripts.bbclass     |    2 +-
 meta/recipes-core/meta/meta-ide-support.bb |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index bf37ec9..e5e5e96 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -52,7 +52,7 @@ toolchain_create_tree_env_script () {
 	script=${TMPDIR}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
 	rm -f $script
 	touch $script
-	echo 'export PATH=${PATH}' >> $script
+	echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${PATH}' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR}' >> $script
 	echo 'export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}' >> $script
 
diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipes-core/meta/meta-ide-support.bb
index 326b25a..130b1c9 100644
--- a/meta/recipes-core/meta/meta-ide-support.bb
+++ b/meta/recipes-core/meta/meta-ide-support.bb
@@ -3,8 +3,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-DEPENDS = "virtual/libc gdb-cross qemu-helper-native unfs-server-native"
-PR = "r2"
+DEPENDS = "virtual/libc gdb-cross qemu-native qemu-helper-native unfs-server-native"
+PR = "r3"
 
 inherit meta toolchain-scripts
 
-- 
1.7.7.6



