Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E2A9F606D1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 11:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4LBP7wA004200 for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 12:25:07 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7VZR9JsTdpyD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 12:25:07 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4LBP2H2004197
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 12:25:03 +0100
Message-ID: <1463829902.4578.168.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 21 May 2016 12:25:02 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] meta/selftest/scripts: Use print function for python3 compatibility
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
X-List-Received-Date: Sat, 21 May 2016 11:25:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Used print function instead of print statement to make
the code work in python 3.

[Changes from both Ed and Richard]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta-selftest/lib/devtool/test.py b/meta-selftest/lib/devtool/test.py
index b7474b5..31190f5 100644
--- a/meta-selftest/lib/devtool/test.py
+++ b/meta-selftest/lib/devtool/test.py
@@ -2,7 +2,7 @@ import argparse
 
 def selftest_reverse(args, config, basepath, workspace):
     """Reverse the value passed to verify the plugin is executing."""
-    print args.value[::-1]
+    print(args.value[::-1])
 
 def register_commands(subparsers, context):
     parser_build = subparsers.add_parser('selftest-reverse', help='Reverse value (for selftest)',
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index 3cfeee7..cc2902f 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -148,4 +148,4 @@ if __name__ == "__main__":
     import sys
     elf = ELFFile(sys.argv[1])
     elf.open()
-    print elf.isDynamic()
+    print(elf.isDynamic())
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 30d3062..d1dfbfb 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -265,7 +265,7 @@ class ThreadedWorker(Thread):
             try:
                 func(self, *args, **kargs)
             except Exception, e:
-                print e
+                print(e)
             finally:
                 self.tasks.task_done()
 
diff --git a/meta/lib/oeqa/runtime/files/test.py b/meta/lib/oeqa/runtime/files/test.py
index f3a2273..f389225 100644
--- a/meta/lib/oeqa/runtime/files/test.py
+++ b/meta/lib/oeqa/runtime/files/test.py
@@ -3,4 +3,4 @@ import os
 os.system('touch /tmp/testfile.python')
 
 a = 9.01e+21 - 9.01e+21 + 0.01
-print "the value of a is %s" % a
+print("the value of a is %s" % a)
diff --git a/meta/lib/oeqa/runtime/systemd.py b/meta/lib/oeqa/runtime/systemd.py
index 2b2f10d..a96efa2 100644
--- a/meta/lib/oeqa/runtime/systemd.py
+++ b/meta/lib/oeqa/runtime/systemd.py
@@ -153,7 +153,7 @@ class SystemdJournalTests(SystemdTest):
             if check_match: break
         # put the startup time in the test log
         if check_match:
-            print "%s" % check_match
+            print("%s" % check_match)
         else:
             self.skipTest("Error at obtaining the boot time from journalctl")
         boot_time_sec = 0
@@ -174,5 +174,5 @@ class SystemdJournalTests(SystemdTest):
             self.skipTest("Error when parsing time from boot string")
         #Assert the target boot time against systemd's unit start timeout
         if boot_time_sec > systemd_TimeoutStartSec:
-            print "Target boot time %s exceeds systemd's TimeoutStartSec %s"\
-                    %(boot_time_sec, systemd_TimeoutStartSec)
+            print("Target boot time %s exceeds systemd's TimeoutStartSec %s"\
+                    %(boot_time_sec, systemd_TimeoutStartSec))
diff --git a/meta/lib/oeqa/selftest/base.py b/meta/lib/oeqa/selftest/base.py
index e10455e..b5a52fe 100644
--- a/meta/lib/oeqa/selftest/base.py
+++ b/meta/lib/oeqa/selftest/base.py
@@ -67,7 +67,7 @@ class oeSelfTest(unittest.TestCase):
                 machine = custommachine
             machine_conf = 'MACHINE ??= "%s"\n' % machine
             self.set_machine_config(machine_conf)
-            print 'MACHINE: %s' % machine
+            print('MACHINE: %s' % machine)
 
         # tests might need their own setup
         # but if they overwrite this one they have to call
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 8cc2095..900b3f4 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -220,12 +220,12 @@ def get_tests_from_module(tmod):
                         try:
                             tid = vars(mod)[test].test_case
                         except:
-                            print 'DEBUG: tc id missing for ' + str(test)
+                            print('DEBUG: tc id missing for ' + str(test))
                             tid = None
                         try:
                             ttag = vars(mod)[test].tag__feature
                         except:
-                            # print 'DEBUG: feature tag missing for ' + str(test)
+                            # print('DEBUG: feature tag missing for ' + str(test))
                             ttag = None
 
                         # NOTE: for some reason lstrip() doesn't work for mod.__module__
@@ -320,17 +320,17 @@ def list_testsuite_by(criteria, keyword):
 
     ts = sorted([ (tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule) for tc in get_testsuite_by(criteria, keyword) ])
 
-    print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % ('id', 'tag', 'name', 'class', 'module')
-    print '_' * 150
+    print('%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % ('id', 'tag', 'name', 'class', 'module'))
+    print('_' * 150)
     for t in ts:
         if isinstance(t[1], (tuple, list)):
-            print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % (t[0], ', '.join(t[1]), t[2], t[3], t[4])
+            print('%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % (t[0], ', '.join(t[1]), t[2], t[3], t[4]))
         else:
-            print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % t
-    print '_' * 150
-    print 'Filtering by:\t %s' % criteria
-    print 'Looking for:\t %s' % ', '.join(str(x) for x in keyword)
-    print 'Total found:\t %s' % len(ts)
+            print('%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % t)
+    print('_' * 150)
+    print('Filtering by:\t %s' % criteria)
+    print('Looking for:\t %s' % ', '.join(str(x) for x in keyword))
+    print('Total found:\t %s' % len(ts))
 
 
 def list_tests():
@@ -338,16 +338,15 @@ def list_tests():
 
     ts = get_all_tests()
 
-    print '%-4s\t%-10s\t%-50s' % ('id', 'tag', 'test')
-    print '_' * 80
+    print('%-4s\t%-10s\t%-50s' % ('id', 'tag', 'test'))
+    print('_' * 80)
     for t in ts:
         if isinstance(t.tctag, (tuple, list)):
-            print '%-4s\t%-10s\t%-50s' % (t.tcid, ', '.join(t.tctag), '.'.join([t.tcmodule, t.tcclass, t.tcname]))
+            print('%-4s\t%-10s\t%-50s' % (t.tcid, ', '.join(t.tctag), '.'.join([t.tcmodule, t.tcclass, t.tcname])))
         else:
-            print '%-4s\t%-10s\t%-50s' % (t.tcid, t.tctag, '.'.join([t.tcmodule, t.tcclass, t.tcname]))
-    print '_' * 80
-    print 'Total found:\t %s' % len(ts)
-
+            print('%-4s\t%-10s\t%-50s' % (t.tcid, t.tctag, '.'.join([t.tcmodule, t.tcclass, t.tcname])))
+    print('_' * 80)
+    print('Total found:\t %s' % len(ts))
 
 def list_tags():
     # Get all tags set to test cases
@@ -362,7 +361,7 @@ def list_tags():
         else:
             tags.add(tc.tctag)
 
-    print 'Tags:\t%s' % ', '.join(str(x) for x in tags)
+    print('Tags:\t%s' % ', '.join(str(x) for x in tags))
 
 def coverage_setup(coverage_source, coverage_include, coverage_omit):
     """ Set up the coverage measurement for the testcases to be run """
@@ -443,12 +442,12 @@ def main():
     bbpath = get_bb_var('BBPATH').split(':')
     layer_libdirs = [p for p in (os.path.join(l, 'lib') for l in bbpath) if os.path.exists(p)]
     sys.path.extend(layer_libdirs)
-    reload(oeqa.selftest)
+    imp.reload(oeqa.selftest)
 
     if args.run_tests_by and len(args.run_tests_by) >= 2:
         valid_options = ['name', 'class', 'module', 'id', 'tag']
         if args.run_tests_by[0] not in valid_options:
-            print '--run-tests-by %s not a valid option. Choose one of <name|class|module|id|tag>.' % args.run_tests_by[0]
+            print('--run-tests-by %s not a valid option. Choose one of <name|class|module|id|tag>.' % args.run_tests_by[0])
             return 1
         else:
             criteria = args.run_tests_by[0]
@@ -458,7 +457,7 @@ def main():
     if args.list_tests_by and len(args.list_tests_by) >= 2:
         valid_options = ['name', 'class', 'module', 'id', 'tag']
         if args.list_tests_by[0] not in valid_options:
-            print '--list-tests-by %s not a valid option. Choose one of <name|class|module|id|tag>.' % args.list_tests_by[0]
+            print('--list-tests-by %s not a valid option. Choose one of <name|class|module|id|tag>.' % args.list_tests_by[0])
             return 1
         else:
             criteria = args.list_tests_by[0]
@@ -482,7 +481,7 @@ def main():
             info = ''
             if module.startswith('_'):
                 info = ' (hidden)'
-            print module + info
+            print(module + info)
             if args.list_allclasses:
                 try:
                     import importlib
@@ -490,13 +489,13 @@ def main():
                     for v in vars(modlib):
                         t = vars(modlib)[v]
                         if isinstance(t, type(oeSelfTest)) and issubclass(t, oeSelfTest) and t!=oeSelfTest:
-                            print " --", v
+                            print(" --", v)
                             for method in dir(t):
                                 if method.startswith("test_") and callable(vars(t)[method]):
-                                    print " --  --", method
+                                    print(" --  --", method)
 
                 except (AttributeError, ImportError) as e:
-                    print e
+                    print(e)
                     pass
 
     if args.run_tests or args.run_all_tests or args.run_tests_by:



