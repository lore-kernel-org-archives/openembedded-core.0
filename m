Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R31xi-0001dH-Ji
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Sep 2011 10:33:54 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Sep 2011 01:28:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="47291431"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga002.jf.intel.com with ESMTP; 12 Sep 2011 01:28:45 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2011 16:34:00 +0800
Message-Id: <57947e84078c2fbd1dde287bd9910cfd95e2ea27.1315815933.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1315815933.git.dongxiao.xu@intel.com>
References: <cover.1315815933.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1315815933.git.dongxiao.xu@intel.com>
References: <cover.1315815933.git.dongxiao.xu@intel.com>
Subject: [PATCH 2/3] rpm: add multilib prefix for archs under deploy/rpm
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
X-List-Received-Date: Mon, 12 Sep 2011 08:33:54 -0000

Currently MACHINE_ARCH deploy folder is unique in multilib system, thus
a lib32 version of rpm package will override a normal rpm package if
its PACKAGE_ARCH is ${MACHINE_ARCH}.

Define different deploy folder for multilib architectures to avoid the
confliction.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/multilib.bbclass   |    5 +++++
 meta/classes/rootfs_rpm.bbclass |    4 +++-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 76c86b2..6ace1fe 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -77,4 +77,9 @@ python __anonymous () {
     multilib_map_variable("PACKAGES_DYNAMIC", variant, d)
     multilib_map_variable("PACKAGE_INSTALL", variant, d)
     multilib_map_variable("INITSCRIPT_PACKAGES", variant, d)
+
+    package_arch = d.getVar("PACKAGE_ARCH", True)
+    machine_arch = d.getVar("MACHINE_ARCH", True)
+    if package_arch == machine_arch:
+        d.setVar("PACKAGE_ARCH", variant + "_" + package_arch)
 }
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 135ca75..7936d77 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -218,7 +218,9 @@ python () {
             default_tune = localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False)
             if default_tune:
                 localdata.setVar("DEFAULTTUNE", default_tune)
-            ml_package_archs += localdata.getVar("PACKAGE_ARCHS", True) or ""
+            localdata.setVar("MACHINE_ARCH", eext[1] + "_" + localdata.getVar("MACHINE_ARCH", False))
+            package_archs = localdata.getVar("PACKAGE_ARCHS", True) or ""
+            ml_package_archs += " " + package_archs
             #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1], localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
     bb.data.setVar('MULTILIB_PACKAGE_ARCHS', ml_package_archs, d)
 }
-- 
1.7.1



