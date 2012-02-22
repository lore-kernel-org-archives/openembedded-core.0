Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1S01QB-0001qf-D0
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 02:55:08 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Feb 2012 17:46:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119901754"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.15.54])
	by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2012 17:46:46 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2012 17:46:42 -0800
Message-Id: <834e28acbef1c9e2fa250dfd59eb7e50a4c842bf.1329875013.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1329875013.git.josh@linux.intel.com>
References: <cover.1329875013.git.josh@linux.intel.com>
In-Reply-To: <cover.1329875013.git.josh@linux.intel.com>
References: <cover.1329875013.git.josh@linux.intel.com>
Subject: [PATCH 1/3] base.bbclass: check all entries of FILESPATH for MACHINE overrides
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
X-List-Received-Date: Wed, 22 Feb 2012 01:55:09 -0000

The logic which looks for MACHINE overrides in SRC_URI and updates
PACKAGE_ARCH was checking only certain subdirectories of the recipes parent
which, amongst other issues, doesn't account for SRC_URI overrides in layers.

This patch changes the logic such that all FILESPATH entries are checked
for children named for MACHINE.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/base.bbclass |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index a26ac94..e80e874 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -453,13 +453,15 @@ python () {
     # We always try to scan SRC_URI for urls with machine overrides
     # unless the package sets SRC_URI_OVERRIDES_PACKAGE_ARCH=0
     #
-    override = d.getVar('SRC_URI_OVERRIDES_PACKAGE_ARCH', 1)
+    override = d.getVar('SRC_URI_OVERRIDES_PACKAGE_ARCH', True)
     if override != '0':
         paths = []
-        for p in [ "${PF}", "${P}", "${PN}", "files", "" ]:
-            path = bb.data.expand(os.path.join("${FILE_DIRNAME}", p, "${MACHINE}"), d)
-            if os.path.isdir(path):
-                paths.append(path)
+        fpaths = (d.getVar('FILESPATH', True) or '').split(':')
+        machine = d.getVar('MACHINE', True)
+        for p in fpaths:
+            if os.path.basename(p) == machine and os.path.isdir(p):
+                paths.append(p)
+
         if len(paths) != 0:
             for s in srcuri.split():
                 if not s.startswith("file://"):
@@ -468,7 +470,7 @@ python () {
                 local = fetcher.localpath(s)
                 for mp in paths:
                     if local.startswith(mp):
-                        #bb.note("overriding PACKAGE_ARCH from %s to %s" % (pkg_arch, mach_arch))
+                        #bb.note("overriding PACKAGE_ARCH from %s to %s for %s" % (pkg_arch, mach_arch, pn))
                         d.setVar('PACKAGE_ARCH', "${MACHINE_ARCH}")
                         return
 
-- 
1.7.7.6



