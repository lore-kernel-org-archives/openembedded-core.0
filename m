Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18A6C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 08:16:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.112815.1669623408862780300
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 00:16:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83312b5adc=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS7wPt5007896
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 08:16:48 GMT
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m38131c1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 08:16:47 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 28 Nov 2022 00:16:46 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 28 Nov 2022 00:16:46 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] yocto-check-layer: add option to skip sublayer
Date: Mon, 28 Nov 2022 16:16:45 +0800
Message-ID: <20221128081645.3010581-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: QcaKyo4rqKHPhB3wRTkm4K4cDIx7y7FN
X-Proofpoint-ORIG-GUID: QcaKyo4rqKHPhB3wRTkm4K4cDIx7y7FN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_06,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 08:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173896

From: Mingli Yu <mingli.yu@windriver.com>

When do yocto compliance for a layer which contains many sublayers,
we may just want to check the top-level layer, so add one option to
achieve this.

Before the patch:
  $ yocto-check-layer-wrapper ../layers/meta-cloud-services  --dependency ../layers/meta-openembedded ../layers/meta-virtualization --no-auto-dependency
  [snip]
  INFO: meta-cloud-services ... PASS
  INFO: meta-openstack-controller-deploy ... PASS
  INFO: meta-openstack-aio-deploy ... PASS
  INFO: meta-openstack-compute-test-config ... PASS
  INFO: meta-openstack-controller-test-config ... PASS
  INFO: meta-openstack-compute-deploy ... PASS
  INFO: meta-openstack-swift-deploy ... PASS
  INFO: meta-openstack ... PASS
  INFO: meta-openstack-qemu ... PASS

After the patch:
 $ yocto-check-layer-wrapper ../layers/meta-cloud-services  --dependency ../layers/meta-openembedded ../layers/meta-virtualization --no-auto-dependency --no-sub
  [snip]
  INFO: meta-cloud-services ... PASS

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 scripts/lib/checklayer/__init__.py | 9 ++++++++-
 scripts/yocto-check-layer          | 4 +++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index aa946f3036..07bc7f3e3c 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -121,7 +121,7 @@ def _detect_layer(layer_path):
 
     return layer
 
-def detect_layers(layer_directories, no_auto):
+def detect_layers(layer_directories, no_auto, no_sub=0):
     layers = []
 
     for directory in layer_directories:
@@ -129,6 +129,13 @@ def detect_layers(layer_directories, no_auto):
         if directory[-1] == '/':
             directory = directory[0:-1]
 
+        if no_sub:
+            conf_dir = os.path.join(directory, 'conf')
+            if os.path.isdir(conf_dir):
+                layer = _detect_layer(directory)
+                if layer:
+                    layers.append(layer)
+                    continue
         if no_auto:
             conf_dir = os.path.join(directory, 'conf')
             if os.path.isdir(conf_dir):
diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 0e5b75b1f7..6a8f23e8f8 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -71,6 +71,8 @@ def main():
                        help='disable signature checking for software layers')
     parser.add_argument('-n', '--no-auto', help='Disable auto layer discovery',
             action='store_true')
+    parser.add_argument('-s', '--no-sub', help='Disable auto sublayer testing',
+            action='store_true')
     parser.add_argument('-d', '--debug', help='Enable debug output',
             action='store_true')
     parser.add_argument('-q', '--quiet', help='Print only errors',
@@ -98,7 +100,7 @@ def main():
     builddir = os.environ['BUILDDIR']
     bblayersconf = os.path.join(builddir, 'conf', 'bblayers.conf')
 
-    layers = detect_layers(args.layers, args.no_auto)
+    layers = detect_layers(args.layers, args.no_auto, args.no_sub)
     if not layers:
         logger.error("Failed to detect layers")
         return 1
-- 
2.25.1


