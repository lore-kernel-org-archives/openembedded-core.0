Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 73CB77CE69
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 05:20:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Mar 2019 21:20:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,450,1544515200"; d="scan'208";a="326181491"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga005.fm.intel.com with ESMTP; 06 Mar 2019 21:20:12 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Mar 2019 12:49:08 +0800
Message-Id: <1551934148-80245-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] scripts/resulttool: Enable manual result store and regression
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
X-List-Received-Date: Thu, 07 Mar 2019 05:20:16 -0000

To enable store for testresults.json file from manualexecution,
add layers metadata to configuration and add "manual" map to
resultutils.store_map.

To enable regression for manual, add "manual" map to
resultutils.regression_map. Also added compulsory configurations
('MACHINE', 'IMAGE_BASENAME') to manualexecution.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/resulttool/manualexecution.py | 36 +++++++++++++++++--------------
 scripts/lib/resulttool/resultutils.py     |  9 +++++---
 2 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index ecdc4e7..a44cc86 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -19,6 +19,7 @@ import datetime
 import re
 from oeqa.core.runner import OETestResultJSONHelper
 
+
 def load_json_file(file):
     with open(file, "r") as f:
         return json.load(f)
@@ -46,31 +47,34 @@ class ManualTestRunner(object):
     def _get_input(self, config):
         while True:
             output = input('{} = '.format(config))
-            if re.match('^[a-zA-Z0-9_]+$', output):
+            if re.match('^[a-zA-Z0-9_-]+$', output):
                 break
-            print('Only alphanumeric and underscore are allowed. Please try again')
+            print('Only alphanumeric and underscore/hyphen are allowed. Please try again')
         return output
 
     def _create_config(self):
+        from oeqa.utils.metadata import get_layers
+        from oeqa.utils.commands import get_bb_var
+        from resulttool.resultutils import store_map
+
+        layers = get_layers(get_bb_var('BBLAYERS'))
         self.configuration = {}
-        while True:
-            try:
-                conf_total = int(input('\nPlease provide how many configuration you want to save \n'))
-                break
-            except ValueError:
-                print('Invalid input. Please provide input as a number not character.')
-        for i in range(conf_total):
+        self.configuration['LAYERS'] = layers
+        current_datetime = datetime.datetime.now()
+        self.starttime = current_datetime.strftime('%Y%m%d%H%M%S')
+        self.configuration['STARTTIME'] = self.starttime
+        self.configuration['TEST_TYPE'] = 'manual'
+        self.configuration['TEST_MODULE'] = self.test_module
+
+        extra_config = set(store_map['manual']) - set(self.configuration)
+        for config in sorted(extra_config):
             print('---------------------------------------------')
-            print('This is configuration #%s ' % (i + 1) + '. Please provide configuration name and its value')
+            print('This is configuration #%s. Please provide configuration value(use "None" if not applicable).'
+                  % config)
             print('---------------------------------------------')
-            name_conf = self._get_input('Configuration Name')
             value_conf = self._get_input('Configuration Value')
             print('---------------------------------------------\n')
-            self.configuration[name_conf.upper()] = value_conf
-        current_datetime = datetime.datetime.now()
-        self.starttime = current_datetime.strftime('%Y%m%d%H%M%S')
-        self.configuration['STARTTIME'] = self.starttime
-        self.configuration['TEST_TYPE'] = self.test_module
+            self.configuration[config] = value_conf
 
     def _create_result_id(self):
         self.result_id = 'manual_' + self.test_module + '_' + self.starttime
diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index c8ccf1b..153f2b8 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -21,19 +21,22 @@ flatten_map = {
     "oeselftest": [],
     "runtime": [],
     "sdk": [],
-    "sdkext": []
+    "sdkext": [],
+    "manual": []
 }
 regression_map = {
     "oeselftest": ['TEST_TYPE', 'MACHINE'],
     "runtime": ['TESTSERIES', 'TEST_TYPE', 'IMAGE_BASENAME', 'MACHINE', 'IMAGE_PKGTYPE', 'DISTRO'],
     "sdk": ['TESTSERIES', 'TEST_TYPE', 'IMAGE_BASENAME', 'MACHINE', 'SDKMACHINE'],
-    "sdkext": ['TESTSERIES', 'TEST_TYPE', 'IMAGE_BASENAME', 'MACHINE', 'SDKMACHINE']
+    "sdkext": ['TESTSERIES', 'TEST_TYPE', 'IMAGE_BASENAME', 'MACHINE', 'SDKMACHINE'],
+    "manual": ['TEST_TYPE', 'TEST_MODULE', 'IMAGE_BASENAME', 'MACHINE']
 }
 store_map = {
     "oeselftest": ['TEST_TYPE'],
     "runtime": ['TEST_TYPE', 'DISTRO', 'MACHINE', 'IMAGE_BASENAME'],
     "sdk": ['TEST_TYPE', 'MACHINE', 'SDKMACHINE', 'IMAGE_BASENAME'],
-    "sdkext": ['TEST_TYPE', 'MACHINE', 'SDKMACHINE', 'IMAGE_BASENAME']
+    "sdkext": ['TEST_TYPE', 'MACHINE', 'SDKMACHINE', 'IMAGE_BASENAME'],
+    "manual": ['TEST_TYPE', 'TEST_MODULE', 'MACHINE', 'IMAGE_BASENAME']
 }
 
 #
-- 
2.7.4


