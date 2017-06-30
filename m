Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0CAF678070
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 19:21:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jun 2017 12:21:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,288,1496127600"; d="scan'208";a="1146592530"
Received: from jgperezc-mobl1.zpn.intel.com ([10.219.4.33])
	by orsmga001.jf.intel.com with ESMTP; 30 Jun 2017 12:21:51 -0700
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jun 2017 14:24:34 -0500
Message-Id: <20170630192434.19437-1-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] selftest/bbtests: Create test case to verify bberror/waring
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
X-List-Received-Date: Fri, 30 Jun 2017 19:21:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

Create test case that uses “crasher.bbclass” to generate some warnings
and errors and verify that are correctly displayed on log.

[YOCTO #9949]

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
---
 meta-selftest/classes/crasher.bbclass   | 37 +++++++++++++++
 meta/lib/oeqa/selftest/cases/bbtests.py | 80 +++++++++++++++++++++++++++++++++
 2 files changed, 117 insertions(+)
 create mode 100644 meta-selftest/classes/crasher.bbclass

diff --git a/meta-selftest/classes/crasher.bbclass b/meta-selftest/classes/crasher.bbclass
new file mode 100644
index 0000000000..63501c60f4
--- /dev/null
+++ b/meta-selftest/classes/crasher.bbclass
@@ -0,0 +1,37 @@
+addtask throwerror
+do_throwerror[nostamp] = "1"
+python do_throwerror() {
+    bb.warn("About to crash...")
+    raise RuntimeError("argh!")
+}
+
+addtask spawnerror
+do_spawnerror[nostamp] = "1"
+python do_spawnerror() {
+    import subprocess
+    subprocess.check_output("echo about to fail; echo here we go; false", shell=True, stderr=subprocess.STDOUT)
+}
+
+addtask spawnerrorbinary
+do_spawnerrorbinary[nostamp] = "1"
+python do_spawnerrorbinary() {
+    import subprocess
+    subprocess.check_output("head -c 10 /bin/bash; false", shell=True, stderr=subprocess.STDOUT)
+}
+
+addtask emiterror
+do_emiterror[nostamp] = "1"
+python do_emiterror() {
+    bb.warn("this is a warning")
+    bb.error("this is an error")
+    bb.error("this is an error\non two lines")
+}
+
+addtask shellerror
+do_shellerror[nostamp] = "1"
+do_shellerror() {
+    bbwarn This is a warning
+    bberror This is an error
+    bbfatal This is fatal
+    bbwarn This should not appear
+}
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 4c82049032..1bdcf808c0 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -14,6 +14,19 @@ class BitbakeTests(OESelftestTestCase):
             if line in l:
                 return l
 
+    def check_log_exception(self, test_recipe, test_task, result):
+        found = re.search('%s' % test_task, result.output)
+
+        return found
+
+    def check_log_error_warning(self, bbtype, test_recipe, test_task, result):
+        bbtype_regex = re.compile('%s: %s.* %s: %s.*'% (bbtype, test_recipe,
+                                                       test_task['TASK'], test_task[bbtype]))
+        found = bbtype_regex.search(result.output)
+
+        return found
+
+
     @OETestID(789)
     def test_run_bitbake_from_dir_1(self):
         os.chdir(os.path.join(self.builddir, 'conf'))
@@ -277,3 +290,70 @@ INHERIT_remove = \"report-error\"
 
         test_recipe_summary_after = get_bb_var('SUMMARY', test_recipe)
         self.assertEqual(expected_recipe_summary, test_recipe_summary_after)
+
+    @OETestID(1886)
+    def test_bberror_types(self):
+        test_recipe = 'm4-native'
+        self.write_config("INHERIT += \"crasher\"")
+
+        throwerror = {'TASK' : 'do_throwerror', 'ERROR' : 'Function failed:',
+                      'WARNING' : 'About to crash...',
+                      'EXCEPTION' : 'Exception: RuntimeError: argh!'}
+        spawnerror = {'TASK' : 'do_spawnerror', 'ERROR' : 'Function failed:',
+                      'EXCEPTION' : "Exception: subprocess.CalledProcessError: Command 'echo about to fail; echo here we go; false",
+                      'OUTPUT' : "Subprocess output:\nabout to fail\nhere we go"}
+        spawnerrorbin = {'TASK' : 'do_spawnerrorbinary', 'ERROR' : '',
+                         'EXCEPTION': "Exception: subprocess.CalledProcessError: Command 'head -c 10 /bin/bash; false"}
+        emiterror = {'TASK' : 'do_emiterror', 'ERROR' : 'this is an error', 'WARNING' : 'this is a warning'}
+        emiterror_twol = {'TASK' : 'do_emiterror', 'ERROR' : "this is an error\non two lines"}
+        shellerror = {'TASK' : 'do_shellerror', 'ERROR' : 'This is an error', 'WARNING' : 'This is a warning'}
+        shellfatal = {'TASK' : 'do_shellerror', 'ERROR' : 'This is fatal', 'WARNING' : 'This should not appear'}
+
+        tasks_to_execute = "%s:%s "%(test_recipe, throwerror['TASK']) + \
+            "%s:%s "%(test_recipe, spawnerror['TASK']) + "%s:%s "%(test_recipe, spawnerrorbin['TASK']) + \
+            "%s:%s "%(test_recipe, emiterror['TASK']) + "%s:%s"%(test_recipe, shellerror['TASK'])
+
+        result = bitbake('%s '% tasks_to_execute, ignore_status=True)
+
+        #Test do_throwerror
+        find_error = self.check_log_error_warning('ERROR', test_recipe, throwerror, result)
+        self.assertTrue(find_error, msg = "%s not found on :\n%s" % (throwerror['ERROR'] ,result.output))
+        find_warn = self.check_log_error_warning('WARNING', test_recipe, throwerror, result)
+        self.assertTrue(find_warn, msg = "%s not found on :\n%s" % (throwerror['WARNING'] ,result.output))
+        find_excpt = self.check_log_exception(test_recipe, throwerror['EXCEPTION'], result)
+        self.assertTrue(find_excpt, msg = "%s not found on :\n%s" % (throwerror['EXCEPTION'] ,result.output))
+
+        #Test do_spawnerror
+        find_error = self.check_log_error_warning('ERROR', test_recipe, spawnerror, result)
+        self.assertTrue(find_error, msg = "%s not found on :\n%s" % (spawnerror['ERROR'] ,result.output))
+        find_excpt = self.check_log_exception(test_recipe, spawnerror['EXCEPTION'], result)
+        self.assertTrue(find_excpt, msg = "%s not found on :\n%s" % (spawnerror['EXCEPTION'] ,result.output))
+        find_output = re.search('%s'% spawnerror['OUTPUT'], result.output)
+        self.assertTrue(find_output, msg = "%s not found on :\n%s" % (spawnerror['OUTPUT'] ,result.output))
+
+        #Test do_spawnerror
+        find_error = self.check_log_error_warning('ERROR', test_recipe, spawnerrorbin, result)
+        self.assertTrue(find_error, msg = "%s not found on :\n%s" % (spawnerrorbin['ERROR'] ,result.output))
+        find_excpt = self.check_log_exception(test_recipe, spawnerrorbin['EXCEPTION'], result)
+        self.assertTrue(find_excpt, msg = "%s not found on :\n%s" % (spawnerrorbin['EXCEPTION'] ,result.output))
+        output_bin = runCmd('head -c 10 /bin/bash; false', ignore_status=True)
+        find_output = re.search('%s'% output_bin.output, result.output)
+        self.assertTrue(find_output, msg = "%s not found on :\n%s" % (output_bin.output, result.output))
+
+        #Test do_emiterror
+        find_error = self.check_log_error_warning('ERROR', test_recipe, emiterror, result)
+        self.assertTrue(find_error, msg = "%s not found on :\n%s" % (emiterror['ERROR'] ,result.output))
+        find_warn = self.check_log_error_warning('WARNING', test_recipe, emiterror, result)
+        self.assertTrue(find_warn, msg = "%s not found on :\n%s" % (emiterror['WARNING'] ,result.output))
+        find_error = self.check_log_error_warning('ERROR', test_recipe, emiterror_twol, result)
+        self.assertTrue(find_error, msg = "%s not found on :\n%s" % (emiterror_twol['ERROR'] ,result.output))
+
+        #Test do_shellerror
+        find_error = self.check_log_error_warning('ERROR', test_recipe, shellerror, result)
+        self.assertTrue(find_error, msg = "%s not found on :\n%s" % (shellerror['ERROR'] ,result.output))
+        find_warn = self.check_log_error_warning('WARNING', test_recipe, shellerror, result)
+        self.assertTrue(find_warn, msg = "%s not found on :\n%s" % (shellerror['WARNING'] ,result.output))
+        find_warn = self.check_log_error_warning('ERROR', test_recipe, shellfatal, result)
+        self.assertTrue(find_warn, msg = "%s not found on :\n%s" % (shellfatal['ERROR'] ,result.output))
+        find_warn = self.check_log_error_warning('WARNING', test_recipe, shellfatal, result)
+        self.assertIsNone(find_warn, msg = "%s not found on :\n%s" % (shellfatal['WARNING'] ,result.output))
-- 
2.11.0


