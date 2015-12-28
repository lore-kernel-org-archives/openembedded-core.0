Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 716D77317D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:14:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBS7F0nH025228
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:15:00 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:15:00 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:26 -0800
Message-ID: <e353b303e271368426e71810bb75173ca6f53455.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 18/40] oeqa/selftest/layerappend: fix test if build directory is not inside COREBASE
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
X-List-Received-Date: Mon, 28 Dec 2015 07:14:59 -0000
Content-Type: text/plain

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Fix test_layer_appends to work when build directory is not inside
COREBASE.

Fixes [YOCTO #8639].

(From OE-Core master rev: 0f146e77655d153d3f9a59e489265450f08c6ad7)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/layerappend.py |    9 ++++++---
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
1.7.9.5


