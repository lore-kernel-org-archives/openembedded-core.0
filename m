Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 53E4D77C73
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 02:30:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2V2UnRb027367
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Mar 2017 19:30:49 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 30 Mar 2017 19:30:49 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Mar 2017 21:30:26 -0500
Message-ID: <1490927429-48266-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1490927429-48266-1-git-send-email-mark.hatle@windriver.com>
References: <1490927429-48266-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/4] yocto-compat-layer.py: Add status for skipped items
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
X-List-Received-Date: Fri, 31 Mar 2017 02:30:50 -0000
Content-Type: text/plain

If items were skipped because the dependencies could not be found, we
want to record this was skipped so we can display it later.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 scripts/yocto-compat-layer.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/yocto-compat-layer.py b/scripts/yocto-compat-layer.py
index 9e74033..d13d8c0 100755
--- a/scripts/yocto-compat-layer.py
+++ b/scripts/yocto-compat-layer.py
@@ -107,6 +107,7 @@ def main():
 
     td = {}
     results = collections.OrderedDict()
+    results_status = collections.OrderedDict()
 
     logger.info('')
     logger.info('Getting initial bitbake variables ...')
@@ -125,19 +126,22 @@ def main():
         shutil.copyfile(bblayersconf + '.backup', bblayersconf)
 
         if not add_layer(bblayersconf, layer, layers, logger):
+            results[layer['name']] = None
+            results_status[layer['name']] = 'SKIPPED (Missing dependencies)'
+            layers_tested = layers_tested + 1
             continue
 
         result = test_layer_compatibility(td, layer)
         results[layer['name']] = result
+        results_status[layer['name']] = 'PASS' if results[layer['name']].wasSuccessful() else 'FAIL'
         layers_tested = layers_tested + 1
 
     if layers_tested:
         logger.info('')
         logger.info('Summary of results:')
         logger.info('')
-        for layer_name in results:
-            logger.info('%s ... %s' % (layer_name, 'PASS' if \
-                    results[layer_name].wasSuccessful() else 'FAIL'))
+        for layer_name in results_status:
+            logger.info('%s ... %s' % (layer_name, results_status[layer_name]))
 
     cleanup_bblayers(None, None)
 
-- 
1.8.3.1


