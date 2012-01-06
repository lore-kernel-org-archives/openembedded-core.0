Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1RjGhy-0003ZW-D0
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 21:48:14 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Jan 2012 12:39:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="93763970"
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.178])
	by orsmga001.jf.intel.com with ESMTP; 06 Jan 2012 12:39:45 -0800
From: Jessica Zhang <jessica.zhang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jan 2012 12:40:33 -0800
Message-Id: <5394915c3a4456777d18f68de3f6cc31c405384e.1325882211.git.jessica.zhang@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1325882211.git.jessica.zhang@intel.com>
References: <cover.1325882211.git.jessica.zhang@intel.com>
In-Reply-To: <cover.1325882211.git.jessica.zhang@intel.com>
References: <cover.1325882211.git.jessica.zhang@intel.com>
Subject: [PATCH 1/1] add sysroot support for meta-ide-support which is the toolchain within build env case
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
X-List-Received-Date: Fri, 06 Jan 2012 20:48:14 -0000

Signed-off-by: Jessica Zhang <jessica.zhang@intel.com>
---
 meta/classes/toolchain-scripts.bbclass |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 5fb6cd3..5cba403 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -49,7 +49,7 @@ toolchain_create_tree_env_script () {
 	echo 'export CXX=${TARGET_PREFIX}g++' >> $script
 	echo 'export GDB=${TARGET_PREFIX}gdb' >> $script
 	echo 'export TARGET_PREFIX=${TARGET_PREFIX}' >> $script
-	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${BUILD_SYS}"' >> $script
+	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${BUILD_SYS} --with-libtool-sysroot=${STAGING_DIR_TARGET}"' >> $script
 	if [ "${TARGET_OS}" = "darwin8" ]; then
 		echo 'export TARGET_CFLAGS="-I${STAGING_DIR}${MACHINE}${includedir}"' >> $script
 		echo 'export TARGET_LDFLAGS="-L${STAGING_DIR}${MACHINE}${libdir}"' >> $script
@@ -57,9 +57,10 @@ toolchain_create_tree_env_script () {
 		cd ${SDK_OUTPUT}${SDKTARGETSYSROOT}/usr
 		ln -s /usr/local local
 	fi
-	echo 'export CFLAGS="${TARGET_CC_ARCH}"' >> $script
-	echo 'export CXXFLAGS="${TARGET_CC_ARCH}"' >> $script
-	echo 'export LDFLAGS="${TARGET_LD_ARCH}"' >> $script
+	echo 'export CFLAGS="${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
+	echo 'export CXXFLAGS="${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
+	echo 'export LDFLAGS="${TARGET_LD_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
+	echo 'export CPPFLAGS="${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${STAGING_DIR_NATIVE}"' >> $script
 	echo 'export OECORE_TARGET_SYSROOT="${STAGING_DIR_TARGET}"' >> $script
 	echo 'export OECORE_ACLOCAL_OPTS="-I ${STAGING_DIR_NATIVE}/usr/share/aclocal"' >> $script
-- 
1.7.0.4



