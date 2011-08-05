Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QpDMN-0002Xw-Mf
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 07:54:15 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Aug 2011 22:49:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,321,1309762800"; d="scan'208";a="35618445"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga001.jf.intel.com with ESMTP; 04 Aug 2011 22:49:50 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 13:48:25 +0800
Message-Id: <acf0ee2a4a18f8a50bcb7dc81dfec290bf8d6656.1312522526.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1312522526.git.dongxiao.xu@intel.com>
References: <cover.1312522526.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1312522526.git.dongxiao.xu@intel.com>
References: <cover.1312522526.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] task-core-boot.bb: Add PACKAGE definition to facilitate multilib
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
X-List-Received-Date: Fri, 05 Aug 2011 05:54:15 -0000

If there is no PACKAGES defined in bb file, its default definition would
be "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-locale".
In multilib case, ${PN} is extended with ${MLPREFIX}, so there is no
rename occurred for the PACKAGES. Therefore for task-core-boot,
RDEPENDS_lib32-task-core-boot will be empty, resulting busybox,
tinylogin, etc. are not bulit out.

This fixed the issue that /bin/sh is not provided while do_rootfs.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-core/tasks/task-core-boot.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-boot.bb b/meta/recipes-core/tasks/task-core-boot.bb
index 5aea771..eb2b548 100644
--- a/meta/recipes-core/tasks/task-core-boot.bb
+++ b/meta/recipes-core/tasks/task-core-boot.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 DEPENDS = "virtual/kernel"
 ALLOW_EMPTY = "1"
-PR = "r7"
+PR = "r8"
 
 #
 # Set by the machine configuration with packages essential for device bootup
@@ -17,6 +17,12 @@ PR = "r7"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 
+PACKAGES = "\
+    task-core-boot \
+    task-core-boot-dbg \
+    task-core-boot-dev \
+"
+
 RDEPENDS_task-core-boot = "\
     base-files \
     base-passwd \
-- 
1.7.1



