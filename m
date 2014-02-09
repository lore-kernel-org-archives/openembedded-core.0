Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 4236D6ED5F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Feb 2014 10:39:41 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 09 Feb 2014 02:39:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,812,1384329600"; d="scan'208";a="339726894"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Feb 2014 02:39:41 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id 35DFD6A4007;
	Sun,  9 Feb 2014 02:39:33 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Feb 2014 12:39:31 +0200
Message-Id: <1391942371-23953-2-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] testimage: fail if no package manifest is found
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
X-List-Received-Date: Sun, 09 Feb 2014 10:39:41 -0000

Sometimes we may forget to actually build the image
we want to test (when testimage task is called manually).
Instead of an ugly traceback we should fail nicely.
The manifest is written after the rootfs so this ensures
the image was actually built.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/classes/testimage.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 75ab716..48e1032 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -185,8 +185,11 @@ def testimage_main(d):
             self.imagefeatures = d.getVar("IMAGE_FEATURES", True).split()
             self.distrofeatures = d.getVar("DISTRO_FEATURES", True).split()
             manifest = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("IMAGE_LINK_NAME", True) + ".manifest")
-            with open(manifest) as f:
-                self.pkgmanifest = f.read()
+            try:
+                with open(manifest) as f:
+                    self.pkgmanifest = f.read()
+            except IOError as e:
+                bb.fatal("No package manifest file found. Did you build the image?\n%s" % e)
 
     # test context
     tc = TestContext()
-- 
1.8.5.3


