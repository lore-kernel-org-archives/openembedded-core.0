Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C46C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 03:07:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.34279.1670814448390486052
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Dec 2022 19:07:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9345b5b890=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BC2urLj029402
	for <openembedded-core@lists.openembedded.org>; Sun, 11 Dec 2022 19:07:28 -0800
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mctgp8vvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 11 Dec 2022 19:07:27 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 11 Dec 2022 19:07:27 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 11 Dec 2022 19:07:26 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] yocto-check-layer: Allow OE-Core to be tested
Date: Mon, 12 Dec 2022 11:07:25 +0800
Message-ID: <20221212030725.2659725-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: fdan6qdU2bkV_DESUpQH9ZuyLDe547s1
X-Proofpoint-ORIG-GUID: fdan6qdU2bkV_DESUpQH9ZuyLDe547s1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-10_10,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxscore=0 suspectscore=0 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=702 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 03:07:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174479

From: Richard Purdie <richard.purdie@linuxfoundation.org>

For unknown reasons we've never seemingly run the check layer script
against OE-Core itself. This isn't entirely straightforward as the core
layer is a bit of a special case, we can't for example compare signatures
against ourselve and we can't remove core from bblayers.conf.

Core does have distro, machine and software components too, in the case
of distro, our fallback default settings. Whilst the qemu machines could
be split into a seperate layer directory, core wouldn't then parse at all
standalone due to the lack of any machine so it seems a bit pointless to
do that.

These changes tweak the script to handle core's special cases, specifically
to allow distro and machine directories and to account for the README placed
a directory level higher than other layers.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 scripts/lib/checklayer/__init__.py     | 11 ++++++++---
 scripts/lib/checklayer/cases/bsp.py    |  2 +-
 scripts/lib/checklayer/cases/common.py |  3 +++
 scripts/lib/checklayer/cases/distro.py |  2 +-
 scripts/yocto-check-layer              |  5 ++---
 5 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index aa946f3036..938805289e 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -16,6 +16,7 @@ class LayerType(Enum):
     BSP = 0
     DISTRO = 1
     SOFTWARE = 2
+    CORE = 3
     ERROR_NO_LAYER_CONF = 98
     ERROR_BSP_DISTRO = 99
 
@@ -106,7 +107,13 @@ def _detect_layer(layer_path):
         if distros:
             is_distro = True
 
-    if is_bsp and is_distro:
+    layer['collections'] = _get_layer_collections(layer['path'])
+
+    if layer_name == "meta" and "core" in layer['collections']:
+        layer['type'] = LayerType.CORE
+        layer['conf']['machines'] = machines
+        layer['conf']['distros'] = distros
+    elif is_bsp and is_distro:
         layer['type'] = LayerType.ERROR_BSP_DISTRO
     elif is_bsp:
         layer['type'] = LayerType.BSP
@@ -117,8 +124,6 @@ def _detect_layer(layer_path):
     else:
         layer['type'] = LayerType.SOFTWARE
 
-    layer['collections'] = _get_layer_collections(layer['path'])
-
     return layer
 
 def detect_layers(layer_directories, no_auto):
diff --git a/scripts/lib/checklayer/cases/bsp.py b/scripts/lib/checklayer/cases/bsp.py
index a80a5844da..b76163fb56 100644
--- a/scripts/lib/checklayer/cases/bsp.py
+++ b/scripts/lib/checklayer/cases/bsp.py
@@ -11,7 +11,7 @@ from checklayer.case import OECheckLayerTestCase
 class BSPCheckLayer(OECheckLayerTestCase):
     @classmethod
     def setUpClass(self):
-        if self.tc.layer['type'] != LayerType.BSP:
+        if self.tc.layer['type'] not in (LayerType.BSP, LayerType.CORE):
             raise unittest.SkipTest("BSPCheckLayer: Layer %s isn't BSP one." %\
                 self.tc.layer['name'])
 
diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
index 491a13953c..722d3cf638 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -12,6 +12,9 @@ from checklayer.case import OECheckLayerTestCase
 
 class CommonCheckLayer(OECheckLayerTestCase):
     def test_readme(self):
+        if self.tc.layer['type'] == LayerType.CORE:
+            raise unittest.SkipTest("Core layer's README is top level")
+
         # The top-level README file may have a suffix (like README.rst or README.txt).
         readme_files = glob.glob(os.path.join(self.tc.layer['path'], '[Rr][Ee][Aa][Dd][Mm][Ee]*'))
         self.assertTrue(len(readme_files) > 0,
diff --git a/scripts/lib/checklayer/cases/distro.py b/scripts/lib/checklayer/cases/distro.py
index f0bee5493c..a35332451c 100644
--- a/scripts/lib/checklayer/cases/distro.py
+++ b/scripts/lib/checklayer/cases/distro.py
@@ -11,7 +11,7 @@ from checklayer.case import OECheckLayerTestCase
 class DistroCheckLayer(OECheckLayerTestCase):
     @classmethod
     def setUpClass(self):
-        if self.tc.layer['type'] != LayerType.DISTRO:
+        if self.tc.layer['type'] not in (LayerType.DISTRO, LayerType.CORE):
             raise unittest.SkipTest("DistroCheckLayer: Layer %s isn't Distro one." %\
                 self.tc.layer['name'])
 
diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 0e5b75b1f7..67cc71950f 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -168,14 +168,13 @@ def main():
 
     layers_tested = 0
     for layer in layers:
-        if layer['type'] == LayerType.ERROR_NO_LAYER_CONF or \
-                layer['type'] == LayerType.ERROR_BSP_DISTRO:
+        if layer['type'] in (LayerType.ERROR_NO_LAYER_CONF, LayerType.ERROR_BSP_DISTRO):
             continue
 
         # Reset to a clean backup copy for each run
         shutil.copyfile(bblayersconf + '.backup', bblayersconf)
 
-        if check_bblayers(bblayersconf, layer['path'], logger):
+        if layer['type'] not in (LayerType.CORE, ) and check_bblayers(bblayersconf, layer['path'], logger):
             logger.info("%s already in %s. To capture initial signatures, layer under test should not present "
                "in BBLAYERS. Please remove %s from BBLAYERS." % (layer['name'], bblayersconf, layer['name']))
             results[layer['name']] = None
-- 
2.25.1


