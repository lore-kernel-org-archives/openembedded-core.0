Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 002636D7D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2013 13:26:27 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 28 Nov 2013 05:26:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,791,1378882800"; d="scan'208";a="324254301"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Nov 2013 05:26:22 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 7D71C6A4009;
	Thu, 28 Nov 2013 05:26:20 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Nov 2013 15:27:00 +0200
Message-Id: <1385645220-27463-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] lib/oeqa: use the new manifest file for determining if a package is installed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Nov 2013 13:26:28 -0000

Use the new manifest file instead of ${WORKDIR}/installed_pkgs.txt for determining
if an image has a certain package, because installed_pkgs.txt goes away with rm_work
enabled.
We can't use the IMAGE_MANIFEST var for the file path because that relies on IMAGE_NAME which
changes at every run (because of date), so we use the link which points to the last
one built.

[ YOCTO #5072 ]

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/oetest.py | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 3bb3589..9566150 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -56,17 +56,11 @@ class oeTest(unittest.TestCase):
 
     @classmethod
     def hasPackage(self, pkg):
-
-        pkgfile = os.path.join(oeTest.tc.d.getVar("WORKDIR", True), "installed_pkgs.txt")
-
-        with open(pkgfile) as f:
-            data = mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ)
-            match = re.search(pkg, data)
-            data.close()
-
-        if match:
+        manifest = os.path.join(oeTest.tc.d.getVar("DEPLOY_DIR_IMAGE", True), oeTest.tc.d.getVar("IMAGE_LINK_NAME", True) + ".manifest")
+        with open(manifest) as f:
+            data = f.read()
+        if re.search(pkg, data):
             return True
-
         return False
 
     @classmethod
-- 
1.8.3.1


