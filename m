Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5DAC4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 08:56:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.38548.1670835376378130303
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Dec 2022 00:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9345b5b890=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BC8g5gO029036
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 08:56:15 GMT
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mchn39bbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 08:56:15 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 12 Dec 2022 00:56:14 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 12 Dec 2022 00:56:13 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] yocto-check-layer: add skip layer support
Date: Mon, 12 Dec 2022 16:56:12 +0800
Message-ID: <20221212085612.3204827-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: dvscrRD9SCc3cpa2lttIzwvp5lZsEnXT
X-Proofpoint-ORIG-GUID: dvscrRD9SCc3cpa2lttIzwvp5lZsEnXT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_01,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 08:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174488

From: Mingli Yu <mingli.yu@windriver.com>

We can define the layers need to check in a file and skip the yocto
compliance check if the layer is't defined in the file.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 scripts/yocto-check-layer | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 67cc71950f..e75f89f224 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -47,6 +47,28 @@ def dump_layer_debug(layer):
     if collections:
         logger.debug("%s collections: %s" % (layer["name"], ", ".join(collections)))
 
+def skip_layer(layer, config=""):
+    """
+    The config define a file used to define the layers we need to check.
+    And the content looks like as below for example:
+    RECIPE_LIST_LAYERS = 'openembedded-layer chromium-browser-layer clang-layer'
+    The return value True indicates we need to skip the layer
+    """
+    if config and os.path.exists(config):
+        logger.debug("Reading RECIPE_LIST_LAYERS from %s" % os.path.realpath(config))
+        layerlists = []
+        collections = layer.get("collections", {})
+        if collections:
+            collections = " ".join(collections)
+            logger.debug("layername: %s, collections: %s" % (layer["name"], collections))
+            with open(config, 'r') as f:
+                for line in f:
+                    if line.startswith("RECIPE_LIST_LAYERS"):
+                        layerlists = line.replace("'", '').replace('"', '').split()[2:]
+            if layerlists:
+                return not (collections in layerlists)
+    return False
+
 def main():
     parser = argparse.ArgumentParser(
             description="Yocto Project layer checking tool",
@@ -57,6 +79,8 @@ def main():
             help='File to output log (optional)', action='store')
     parser.add_argument('--dependency', nargs="+",
             help='Layers to process for dependencies', action='store')
+    parser.add_argument("--recipe-list-layers",
+            help='Read RECIPE_LIST_LAYERS from the file, the RECIPE_LIST_LAYERS must be in one line (optional)', action='store')
     parser.add_argument('--no-auto-dependency', help='Disable automatic testing of dependencies',
             action='store_true')
     parser.add_argument('--machines', nargs="+",
@@ -185,6 +209,12 @@ def main():
         logger.info("Setting up for %s(%s), %s" % (layer['name'], layer['type'],
             layer['path']))
 
+        if args.recipe_list_layers and skip_layer(layer, args.recipe_list_layers):
+
+            results[layer['name']] = None
+            results_status[layer['name']] = 'SKIPPED (Unsupported by RECIPE_LIST_LAYERS)'
+            layers_tested = layers_tested + 1
+            continue
         missing_dependencies = not add_layer_dependencies(bblayersconf, layer, dep_layers, logger)
         if not missing_dependencies:
             for additional_layer in additional_layers:
-- 
2.25.1


