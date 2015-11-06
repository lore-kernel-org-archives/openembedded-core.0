Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 31ADD766B2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:17:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 06 Nov 2015 05:17:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="844167507"
Received: from bdiacone-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.207])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2015 05:17:10 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 13:16:59 +0000
Message-Id: <03e482060c833632d750126eef8986cfb990c994.1446815768.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1446815768.git.paul.eggleton@linux.intel.com>
References: <cover.1446815768.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1446815768.git.paul.eggleton@linux.intel.com>
References: <cover.1446815768.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] oeqa/selftest/layerappend: fix test if build directory is not inside COREBASE
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
X-List-Received-Date: Fri, 06 Nov 2015 13:17:12 -0000

Fix test_layer_appends to work when build directory is not inside
COREBASE.

Fixes [YOCTO #8639].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/layerappend.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/layerappend.py b/meta/lib/oeqa/selftest/layerappend.py
index a82a6c8..4de5034 100644
--- a/meta/lib/oeqa/selftest/layerappend.py
+++ b/meta/lib/oeqa/selftest/layerappend.py
@@ -46,10 +46,11 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI_append += "file://appendtest.txt"
 """
-    layerappend = "BBLAYERS += \"COREBASE/meta-layertest0 COREBASE/meta-layertest1 COREBASE/meta-layertest2\""
+    layerappend = ''
 
     def tearDownLocal(self):
-        ftools.remove_from_file(self.builddir + "/conf/bblayers.conf", self.layerappend.replace("COREBASE", self.builddir + "/.."))
+        if self.layerappend:
+            ftools.remove_from_file(self.builddir + "/conf/bblayers.conf", self.layerappend)
 
     @testcase(1196)
     def test_layer_appends(self):
@@ -79,7 +80,9 @@ SRC_URI_append += "file://appendtest.txt"
                 with open(layer + "/recipes-test/layerappendtest/appendtest.txt", "w") as f:
                     f.write("Layer 2 test")
             self.track_for_cleanup(layer)
-        ftools.append_file(self.builddir + "/conf/bblayers.conf", self.layerappend.replace("COREBASE", self.builddir + "/.."))
+
+        self.layerappend = "BBLAYERS += \"{0}/meta-layertest0 {0}/meta-layertest1 {0}/meta-layertest2\"".format(corebase)
+        ftools.append_file(self.builddir + "/conf/bblayers.conf", self.layerappend)
         bitbake("layerappendtest")
         data = ftools.read_file(stagingdir + "/appendtest.txt")
         self.assertEqual(data, "Layer 2 test")
-- 
2.1.0


