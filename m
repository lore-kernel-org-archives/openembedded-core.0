Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8xh3-0007zv-Le
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 20:17:45 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Sep 2012 11:05:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,368,1344236400"; d="scan'208";a="188695269"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.161])
	by azsmga001.ch.intel.com with ESMTP; 04 Sep 2012 11:05:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Sep 2012 19:05:19 +0100
Message-Id: <1346781919-20817-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] packagegroup-(base|core-basic): add RREPLACES/RCONFLICTS
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
X-List-Received-Date: Tue, 04 Sep 2012 18:17:46 -0000

These are needed to support upgrading from task-* to packagegroup-*
within existing target images at runtime.

Note: these settings will very likely be moved to a separate inc file
at some point in the future.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../packagegroups/packagegroup-base.bb             |   10 ++++------
 .../packagegroups/packagegroup-core-basic.bb       |    4 +++-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 2178308..347a7e1 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Merge machine and distro options to create a basic machine task/package"
 LICENSE = "MIT"
-PR = "r75"
+PR = "r76"
 
 inherit packagegroup
 
@@ -117,12 +117,10 @@ python __anonymous () {
 
     # For backwards compatibility after rename
     packages = d.getVar("PACKAGES", True).split()
-    packages.remove("packagegroup-distro-base")
-    packages.remove("packagegroup-machine-base")
     for pkg in packages:
-        d.appendVar("RPROVIDES_%s" % pkg, pkg.replace("packagegroup-base", "task-base"))
-    d.appendVar("RPROVIDES_packagegroup-distro-base", "task-distro-base")
-    d.appendVar("RPROVIDES_packagegroup-machine-base", "task-machine-base")
+        d.appendVar("RPROVIDES_%s" % pkg, pkg.replace("packagegroup-", "task-"))
+        d.appendVar("RREPLACES_%s" % pkg, pkg.replace("packagegroup-", "task-"))
+        d.appendVar("RCONFLICTS_%s" % pkg, pkg.replace("packagegroup-", "task-"))
 }
 
 #
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
index 30b66c5..d3eeeed 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
@@ -3,7 +3,7 @@
 #
 
 DESCRIPTION = "Create Basic Image Tasks"
-PR = "r4"
+PR = "r5"
 LICENSE = "MIT"
 
 inherit packagegroup
@@ -24,6 +24,8 @@ python __anonymous () {
     packages = d.getVar("PACKAGES", True).split()
     for pkg in packages:
         d.appendVar("RPROVIDES_%s" % pkg, pkg.replace("packagegroup-core", "task-core"))
+        d.appendVar("RREPLACES_%s" % pkg, pkg.replace("packagegroup-core", "task-core"))
+        d.appendVar("RCONFLICTS_%s" % pkg, pkg.replace("packagegroup-core", "task-core"))
 }
 
 
-- 
1.7.9.5



