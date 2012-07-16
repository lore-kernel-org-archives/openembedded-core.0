Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1Sqv3I-0006og-Te
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 01:50:09 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Jul 2012 16:38:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="167153179"
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.83])
	by orsmga001.jf.intel.com with ESMTP; 16 Jul 2012 16:38:45 -0700
From: Jessica Zhang <jessica.zhang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 16:49:44 -0700
Message-Id: <4917bd6d87259841522529052a765d1664bf0d20.1342482042.git.jessica.zhang@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1342482042.git.jessica.zhang@intel.com>
References: <cover.1342482042.git.jessica.zhang@intel.com>
In-Reply-To: <cover.1342482042.git.jessica.zhang@intel.com>
References: <cover.1342482042.git.jessica.zhang@intel.com>
Subject: [PATCH 1/1] meta-ide-support: Add native qemu support for meta-ide-support
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
X-List-Received-Date: Mon, 16 Jul 2012 23:50:09 -0000

[YOCTO #2761]

This patch fixed the issue that after "bitbake meta-ide-support" and try to start qemu and it will fail.  This is due to the meta-ide-support lacking dependency for qemu native and ended up using qemu under /usr/bin.  Fix the issue by adding dependency for qemu native in meta-ide-support and also add the path info in the environment-setup script.

Signed-off-by: Jessica Zhang <jessica.zhang@intel.com>
---
 meta/classes/toolchain-scripts.bbclass     |    2 +-
 meta/recipes-core/meta/meta-ide-support.bb |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index bedcd61..0a0ac47 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -43,7 +43,7 @@ toolchain_create_tree_env_script () {
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
1.7.7



