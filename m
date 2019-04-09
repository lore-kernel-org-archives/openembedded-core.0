Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2CEBB7D27F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 06:24:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Apr 2019 23:24:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,328,1549958400"; d="scan'208";a="314299368"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga005.jf.intel.com with ESMTP; 08 Apr 2019 23:24:05 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2019 13:53:07 +0800
Message-Id: <1554789188-6328-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] resulttool/manualexecution: Enable configuration options selection
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
X-List-Received-Date: Tue, 09 Apr 2019 06:24:06 -0000

Current manualexecution required user to input configuration manually
where there were inconsistent inputs and human typo issues.

Enable manualexecution to have the optional feature where it
will use pre-compiled configuration options file where user will
be able to select configuration from the pre-compiled list instead
of manual key-in the configuration. This will eliminate human error.

Expect the pre-compiled configuration options file in json format below

{
    "bsps-hw": {
        "IMAGE_BASENAME": {
            "1": "core-image-sato-sdk"
        },
        "MACHINE": {
            "1": "beaglebone-yocto",
            "2": "edgerouter",
            "3": "mpc8315e-rdb",
            "4": "genericx86",
            "5": "genericx86-64"
        }
    },
    "bsps-qemu": {
        "IMAGE_BASENAME": {
            "1": "core-image-sato-sdk"
        },
        "MACHINE": {
            "1": "qemuarm",
            "2": "qemuarm64",
            "3": "qemumips",
            "4": "qemumips64",
            "5": "qemuppc",
            "6": "qemux86",
            "7": "qemux86-64"
        }
    }
}

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/resulttool/manualexecution.py | 48 +++++++++++++++++++++++++------
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index c94f981..57e7b29 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -38,7 +38,21 @@ class ManualTestRunner(object):
             print('Only lowercase alphanumeric, hyphen and dot are allowed. Please try again')
         return output
 
-    def _create_config(self):
+    def _get_available_config_options(self, config_options, test_module, target_config):
+        avail_config_options = None
+        if test_module in config_options:
+            avail_config_options = config_options[test_module].get(target_config)
+        return avail_config_options
+
+    def _choose_config_option(self, options):
+        while True:
+            output = input('{} = '.format('Option index number'))
+            if output in options:
+                break
+            print('Only integer index inputs from above available configuration options are allowed. Please try again.')
+        return options[output]
+
+    def _create_config(self, config_options):
         from oeqa.utils.metadata import get_layers
         from oeqa.utils.commands import get_bb_var
         from resulttool.resultutils import store_map
@@ -54,11 +68,22 @@ class ManualTestRunner(object):
 
         extra_config = set(store_map['manual']) - set(self.configuration)
         for config in sorted(extra_config):
-            print('---------------------------------------------')
-            print('This is configuration #%s. Please provide configuration value(use "None" if not applicable).' % config)
-            print('---------------------------------------------')
-            value_conf = self._get_input('Configuration Value')
-            print('---------------------------------------------\n')
+            avail_config_options = self._get_available_config_options(config_options, self.test_module, config)
+            if avail_config_options:
+                print('---------------------------------------------')
+                print('These are available configuration #%s options:' % config)
+                print('---------------------------------------------')
+                for option, _ in sorted(avail_config_options.items(), key=lambda x: int(x[0])):
+                    print('%s: %s' % (option, avail_config_options[option]))
+                print('Please select configuration option, enter the integer index number.')
+                value_conf = self._choose_config_option(avail_config_options)
+                print('---------------------------------------------\n')
+            else:
+                print('---------------------------------------------')
+                print('This is configuration #%s. Please provide configuration value(use "None" if not applicable).' % config)
+                print('---------------------------------------------')
+                value_conf = self._get_input('Configuration Value')
+                print('---------------------------------------------\n')
             self.configuration[config] = value_conf
 
     def _create_result_id(self):
@@ -99,9 +124,12 @@ class ManualTestRunner(object):
         basepath = os.environ['BUILDDIR']
         self.write_dir = basepath + '/tmp/log/manual/'
 
-    def run_test(self, file):
+    def run_test(self, file, config_options_file):
         self._get_testcases(file)
-        self._create_config()
+        config_options = {}
+        if config_options_file:
+            config_options = load_json_file(config_options_file)
+        self._create_config(config_options)
         self._create_result_id()
         self._create_write_dir()
         test_results = {}
@@ -113,7 +141,7 @@ class ManualTestRunner(object):
 
 def manualexecution(args, logger):
     testrunner = ManualTestRunner()
-    get_configuration, get_result_id, get_write_dir, get_test_results = testrunner.run_test(args.file)
+    get_configuration, get_result_id, get_write_dir, get_test_results = testrunner.run_test(args.file, args.config_options_file)
     resultjsonhelper = OETestResultJSONHelper()
     resultjsonhelper.dump_testresult_file(get_write_dir, get_configuration, get_result_id, get_test_results)
     return 0
@@ -125,3 +153,5 @@ def register_commands(subparsers):
                                          group='manualexecution')
     parser_build.set_defaults(func=manualexecution)
     parser_build.add_argument('file', help='specify path to manual test case JSON file.Note: Please use \"\" to encapsulate the file path.')
+    parser_build.add_argument('-c', '--config-options-file', default='',
+                              help='the config options file to import and used as available configuration option selection')
-- 
2.7.4


