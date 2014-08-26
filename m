Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1C371710BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 08:00:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 26 Aug 2014 01:00:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,402,1406617200"; d="scan'208";a="589898191"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 26 Aug 2014 01:00:15 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id 69F922C8001;
	Tue, 26 Aug 2014 00:59:34 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Aug 2014 13:05:42 +0300
Message-Id: <1409047544-7026-3-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1409047544-7026-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1409047544-7026-1-git-send-email-corneliux.stoicescu@intel.com>
Subject: [PATCH 2/4] classes/testimage.bbclass: add more fields to the sdk TestContext
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
X-List-Received-Date: Tue, 26 Aug 2014 08:00:34 -0000

In order to use hasFeature and hasPackage methods in sdk test modules, we need specific fields to be set in the TestContext object.
Adding pkgmanifest, imagefeatures and distrofeatures to the TestContext.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/classes/testimage.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 97d0380..f2480fe 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -281,6 +281,14 @@ def testsdk_main(d):
             self.filesdir = os.path.join(os.path.dirname(os.path.abspath(oeqa.runtime.__file__)),"files")
             self.sdktestdir = sdktestdir
             self.sdkenv = sdkenv
+            self.imagefeatures = d.getVar("IMAGE_FEATURES", True).split()
+            self.distrofeatures = d.getVar("DISTRO_FEATURES", True).split()
+            manifest = os.path.join(d.getVar("SDK_MANIFEST", True))
+            try:
+                with open(manifest) as f:
+                    self.pkgmanifest = f.read()
+            except IOError as e:
+                bb.fatal("No package manifest file found. Did you build the sdk image?\n%s" % e)
 
     # test context
     tc = TestContext()
-- 
1.8.3.2


