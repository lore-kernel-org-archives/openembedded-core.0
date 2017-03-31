Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4816E77D73
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 02:30:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2V2UohW027311
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 30 Mar 2017 19:30:50 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 30 Mar 2017 19:30:49 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Mar 2017 21:30:27 -0500
Message-ID: <1490927429-48266-3-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1490927429-48266-1-git-send-email-mark.hatle@windriver.com>
References: <1490927429-48266-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/4] yocto-compat-layer.py: Add --dependency argument
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
X-List-Received-Date: Fri, 31 Mar 2017 02:30:51 -0000
Content-Type: text/plain

When processing a large number of items, there are times that it would be
nice to be able to pass in a series of layers that can be used as dependencies
for the layer that is being scanned.  This avoids the significant overhead
of processing all of the layers to compatibility.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 scripts/yocto-compat-layer.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/yocto-compat-layer.py b/scripts/yocto-compat-layer.py
index d13d8c0..f8a1ac7 100755
--- a/scripts/yocto-compat-layer.py
+++ b/scripts/yocto-compat-layer.py
@@ -47,6 +47,8 @@ def main():
             help='Layer to test compatibility with Yocto Project')
     parser.add_argument('-o', '--output-log',
             help='File to output log (optional)', action='store')
+    parser.add_argument('--dependency', nargs="+",
+            help='Layers to process for dependencies', action='store')
     parser.add_argument('-n', '--no-auto', help='Disable auto layer discovery',
             action='store_true')
     parser.add_argument('-d', '--debug', help='Enable debug output',
@@ -80,6 +82,11 @@ def main():
     if not layers:
         logger.error("Fail to detect layers")
         return 1
+    if args.dependency:
+        dep_layers = detect_layers(args.dependency, args.no_auto)
+        dep_layers = dep_layers + layers
+    else:
+        dep_layers = layers
 
     logger.info("Detected layers:")
     for layer in layers:
@@ -125,7 +132,8 @@ def main():
 
         shutil.copyfile(bblayersconf + '.backup', bblayersconf)
 
-        if not add_layer(bblayersconf, layer, layers, logger):
+        if not add_layer(bblayersconf, layer, dep_layers, logger):
+            logger.info('Skipping %s due to missing dependencies.' % layer['name'])
             results[layer['name']] = None
             results_status[layer['name']] = 'SKIPPED (Missing dependencies)'
             layers_tested = layers_tested + 1
-- 
1.8.3.1


