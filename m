Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D388E7271F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 16:10:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 23 Dec 2014 08:08:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,632,1413270000"; d="scan'208";a="628280233"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.255.13.178])
	by orsmga001.jf.intel.com with ESMTP; 23 Dec 2014 08:08:53 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Dec 2014 16:08:42 +0000
Message-Id: <f707823fb4cdfd1f0ce8f4f70fe1ecb0800ddad4.1419350817.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1419350817.git.paul.eggleton@linux.intel.com>
References: <cover.1419350817.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1419350817.git.paul.eggleton@linux.intel.com>
References: <cover.1419350817.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/7] oeqa/utils: replace some tabs with spaces
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
X-List-Received-Date: Tue, 23 Dec 2014 16:10:06 -0000

Python code should use spaces only for indentation.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/utils/commands.py   | 10 ++---
 meta/lib/oeqa/utils/decorators.py | 84 +++++++++++++++++++--------------------
 2 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index d29c1b1..5b601d9 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -110,11 +110,11 @@ def runCmd(command, ignore_status=False, timeout=None, assert_error=True, **opti
 def bitbake(command, ignore_status=False, timeout=None, postconfig=None, **options):
 
     if postconfig:
-	postconfig_file = os.path.join(os.environ.get('BUILDDIR'), 'oeqa-post.conf')
-	ftools.write_file(postconfig_file, postconfig)
-	extra_args = "-R %s" % postconfig_file
+        postconfig_file = os.path.join(os.environ.get('BUILDDIR'), 'oeqa-post.conf')
+        ftools.write_file(postconfig_file, postconfig)
+        extra_args = "-R %s" % postconfig_file
     else:
-	extra_args = ""
+        extra_args = ""
 
     if isinstance(command, basestring):
         cmd = "bitbake " + extra_args + " " + command
@@ -122,7 +122,7 @@ def bitbake(command, ignore_status=False, timeout=None, postconfig=None, **optio
         cmd = [ "bitbake" ] + [a for a in (command + extra_args.split(" ")) if a not in [""]]
 
     try:
-	return runCmd(cmd, ignore_status, timeout, **options)
+        return runCmd(cmd, ignore_status, timeout, **options)
     finally:
         if postconfig:
             os.remove(postconfig_file)
diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index 7f845db..1ae1162 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -86,14 +86,14 @@ class testcase(object):
         self.test_case = test_case
 
     def __call__(self, func):
-	def wrapped_f(*args):
-		return func(*args)
-	wrapped_f.test_case = self.test_case
-	return wrapped_f
+        def wrapped_f(*args):
+            return func(*args)
+        wrapped_f.test_case = self.test_case
+        return wrapped_f
 
 class NoParsingFilter(logging.Filter):
     def filter(self, record):
-	return record.levelno == 100
+        return record.levelno == 100
 
 def LogResults(original_class):
     orig_method = original_class.run
@@ -101,51 +101,51 @@ def LogResults(original_class):
     #rewrite the run method of unittest.TestCase to add testcase logging
     def run(self, result, *args, **kws):
         orig_method(self, result, *args, **kws)
-	passed = True
-	testMethod = getattr(self, self._testMethodName)
-
-	#if test case is decorated then use it's number, else use it's name
-	try:
-		test_case = testMethod.test_case
-	except AttributeError:
-		test_case = self._testMethodName
-
-	#create custom logging level for filtering.
-	custom_log_level = 100
-	logging.addLevelName(custom_log_level, 'RESULTS')
-	caller = os.path.basename(sys.argv[0])
-
-	def results(self, message, *args, **kws):
-	    if self.isEnabledFor(custom_log_level):
-		self.log(custom_log_level, message, *args, **kws)
-	logging.Logger.results = results
-
-	logging.basicConfig(filename=os.path.join(os.getcwd(),'results-'+caller+'.log'),
+        passed = True
+        testMethod = getattr(self, self._testMethodName)
+
+        #if test case is decorated then use it's number, else use it's name
+        try:
+            test_case = testMethod.test_case
+        except AttributeError:
+            test_case = self._testMethodName
+
+        #create custom logging level for filtering.
+        custom_log_level = 100
+        logging.addLevelName(custom_log_level, 'RESULTS')
+        caller = os.path.basename(sys.argv[0])
+
+        def results(self, message, *args, **kws):
+            if self.isEnabledFor(custom_log_level):
+                self.log(custom_log_level, message, *args, **kws)
+        logging.Logger.results = results
+
+        logging.basicConfig(filename=os.path.join(os.getcwd(),'results-'+caller+'.log'),
                             filemode='w',
                             format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
                             datefmt='%H:%M:%S',
                             level=custom_log_level)
-	for handler in logging.root.handlers:
-		handler.addFilter(NoParsingFilter())
-	local_log = logging.getLogger(caller)
+        for handler in logging.root.handlers:
+            handler.addFilter(NoParsingFilter())
+        local_log = logging.getLogger(caller)
 
-	#check status of tests and record it
+        #check status of tests and record it
         for (name, msg) in result.errors:
-                if self._testMethodName == str(name).split(' ')[0]:
-			local_log.results("Testcase "+str(test_case)+": ERROR")
-			local_log.results("Testcase "+str(test_case)+":\n"+msg)
-			passed = False
+            if self._testMethodName == str(name).split(' ')[0]:
+                local_log.results("Testcase "+str(test_case)+": ERROR")
+                local_log.results("Testcase "+str(test_case)+":\n"+msg)
+                passed = False
         for (name, msg) in result.failures:
-                if self._testMethodName == str(name).split(' ')[0]:
-			local_log.results("Testcase "+str(test_case)+": FAILED")
-			local_log.results("Testcase "+str(test_case)+":\n"+msg)
-			passed = False
+            if self._testMethodName == str(name).split(' ')[0]:
+                local_log.results("Testcase "+str(test_case)+": FAILED")
+                local_log.results("Testcase "+str(test_case)+":\n"+msg)
+                passed = False
         for (name, msg) in result.skipped:
-                if self._testMethodName == str(name).split(' ')[0]:
-			local_log.results("Testcase "+str(test_case)+": SKIPPED")
-			passed = False
-	if passed:
-			local_log.results("Testcase "+str(test_case)+": PASSED")
+            if self._testMethodName == str(name).split(' ')[0]:
+                local_log.results("Testcase "+str(test_case)+": SKIPPED")
+                passed = False
+        if passed:
+            local_log.results("Testcase "+str(test_case)+": PASSED")
 
     original_class.run = run
     return original_class
-- 
1.9.3


