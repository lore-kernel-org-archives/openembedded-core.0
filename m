Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8C9C473D27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 21:45:51 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 16 Sep 2015 14:45:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,542,1437462000"; d="scan'208";a="646246450"
Received: from bitbang.jf.intel.com ([10.7.201.51])
	by orsmga003.jf.intel.com with ESMTP; 16 Sep 2015 14:45:51 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Sep 2015 14:45:49 -0700
Message-Id: <1442439949-29473-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.4.3
Subject: [PATCH] testimage.bbclass: Don't require an image manifest
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
X-List-Received-Date: Wed, 16 Sep 2015 21:45:53 -0000

Sometimes an "image" may not actually have a manifest file such as when
using a "baremetal kernel". This change allows for  a user to set a
IMAGE_NO_MANIFEST flag to 1 in order to inform the code that there is no
corresponding manifest that should exist for an image.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/testimage.bbclass | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index a1918ba..70e2800 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -279,14 +279,20 @@ def testimage_main(d):
             self.imagefeatures = d.getVar("IMAGE_FEATURES", True).split()
             self.distrofeatures = d.getVar("DISTRO_FEATURES", True).split()
             manifest = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("IMAGE_LINK_NAME", True) + ".manifest")
+            nomanifest = d.getVar("IMAGE_NO_MANIFEST", True)
+
             self.sigterm = False
             self.origsigtermhandler = signal.getsignal(signal.SIGTERM)
             signal.signal(signal.SIGTERM, self.sigterm_exception)
-            try:
-                with open(manifest) as f:
-                    self.pkgmanifest = f.read()
-            except IOError as e:
-                bb.fatal("No package manifest file found. Did you build the image?\n%s" % e)
+
+            if nomanifest is None or nomanifest != "1":
+                try:
+                    with open(manifest) as f:
+                        self.pkgmanifest = f.read()
+                except IOError as e:
+                    bb.fatal("No package manifest file found. Did you build the image?\n%s" % e)
+            else:
+                self.pkgmanifest = ""
 
         def sigterm_exception(self, signum, stackframe):
             bb.warn("TestImage received SIGTERM, shutting down...")
-- 
2.4.3


