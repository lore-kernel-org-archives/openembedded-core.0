Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3F7A37D27F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 06:24:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Apr 2019 23:24:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,328,1549958400"; d="scan'208";a="314299374"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga005.jf.intel.com with ESMTP; 08 Apr 2019 23:24:07 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2019 13:53:08 +0800
Message-Id: <1554789188-6328-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554789188-6328-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1554789188-6328-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 2/2] resulttool/manualexecution: Enable creation of configuration option file
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
X-List-Received-Date: Tue, 09 Apr 2019 06:24:07 -0000

Allow the creation of configuration option file based on user inputs.
Where this configuration option file will be used by the the manual
execution to display options for configuration rather than user
need to inputs configuration manually.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/resulttool/manualexecution.py | 54 ++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index 57e7b29..12ef90d 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -24,6 +24,11 @@ def load_json_file(file):
     with open(file, "r") as f:
         return json.load(f)
 
+def write_json_file(f, json_data):
+    os.makedirs(os.path.dirname(f), exist_ok=True)
+    with open(f, 'w') as filedata:
+        filedata.write(json.dumps(json_data, sort_keys=True, indent=4))
+
 class ManualTestRunner(object):
 
     def _get_testcases(self, file):
@@ -139,8 +144,53 @@ class ManualTestRunner(object):
             test_results.update(test_result)
         return self.configuration, self.result_id, self.write_dir, test_results
 
+    def _get_true_false_input(self, input_message):
+        yes_list = ['Y', 'YES']
+        no_list = ['N', 'NO']
+        while True:
+            more_config_option = input(input_message).upper()
+            if more_config_option in yes_list or more_config_option in no_list:
+                break
+            print('Invalid input!')
+        if more_config_option in no_list:
+            return False
+        return True
+
+    def make_config_option_file(self, logger, manual_case_file, config_options_file):
+        config_options = {}
+        if config_options_file:
+            config_options = load_json_file(config_options_file)
+        new_test_module = os.path.basename(manual_case_file).split('.')[0]
+        print('Creating configuration options file for test module: %s' % new_test_module)
+        new_config_options = {}
+
+        while True:
+            config_name = input('\nPlease provide test configuration to create:\n').upper()
+            new_config_options[config_name] = {}
+            while True:
+                config_value = self._get_input('Configuration possible option value')
+                config_option_index = len(new_config_options[config_name]) + 1
+                new_config_options[config_name][config_option_index] = config_value
+                more_config_option = self._get_true_false_input('\nIs there more configuration option input: (Y)es/(N)o\n')
+                if not more_config_option:
+                    break
+            more_config = self._get_true_false_input('\nIs there more configuration to create: (Y)es/(N)o\n')
+            if not more_config:
+                break
+
+        if new_config_options:
+            config_options[new_test_module] = new_config_options
+        if not config_options_file:
+            self._create_write_dir()
+            config_options_file = os.path.join(self.write_dir, 'manual_config_options.json')
+        write_json_file(config_options_file, config_options)
+        logger.info('Configuration option file created at %s' % config_options_file)
+
 def manualexecution(args, logger):
     testrunner = ManualTestRunner()
+    if args.make_config_options_file:
+        testrunner.make_config_option_file(logger, args.file, args.config_options_file)
+        return 0
     get_configuration, get_result_id, get_write_dir, get_test_results = testrunner.run_test(args.file, args.config_options_file)
     resultjsonhelper = OETestResultJSONHelper()
     resultjsonhelper.dump_testresult_file(get_write_dir, get_configuration, get_result_id, get_test_results)
@@ -154,4 +204,6 @@ def register_commands(subparsers):
     parser_build.set_defaults(func=manualexecution)
     parser_build.add_argument('file', help='specify path to manual test case JSON file.Note: Please use \"\" to encapsulate the file path.')
     parser_build.add_argument('-c', '--config-options-file', default='',
-                              help='the config options file to import and used as available configuration option selection')
+                              help='the config options file to import and used as available configuration option selection or make config option file')
+    parser_build.add_argument('-m', '--make-config-options-file', action='store_true',
+                              help='make the configuration options file based on provided inputs')
-- 
2.7.4


