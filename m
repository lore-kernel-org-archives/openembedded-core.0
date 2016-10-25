Return-Path: <ola.x.nilsson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id F2EF4607A3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 11:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 5DD7C2E47A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id GBCwpSAJm3CL
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:37 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id D88A0361BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:37 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AF9E41E094
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:37 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3ACE1E092
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:37 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:37 +0200 (CEST)
Received: from lnxolani.se.axis.com (lnxolani.se.axis.com [10.88.67.1])
	by seth.se.axis.com (Postfix) with ESMTP id 5608251D;
	Tue, 25 Oct 2016 13:03:36 +0200 (CEST)
Received: by lnxolani.se.axis.com (Postfix, from userid 20853)
	id 0E70D7C614; Tue, 25 Oct 2016 13:03:35 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: olani@axis.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 25 Oct 2016 13:03:33 +0200
Message-Id: <1477393415-13053-3-git-send-email-olani@axis.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1477393415-13053-1-git-send-email-olani@axis.com>
References: <1477393415-13053-1-git-send-email-olani@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/4] recipetool: selftest: Add test for recipetool plugin loading
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
X-List-Received-Date: Tue, 25 Oct 2016 11:03:42 -0000

From: Ola x Nilsson <ola.x.nilsson@axis.com>

Test that recipetool plugins are loaded in a well defined order.

Signed-off-by: Ola x Nilsson <ola.x.nilsson@axis.com>
---
 meta-selftest/lib/recipetool/bbpath.py | 41 +++++++++++++++++++++++++++++++
 meta/lib/oeqa/selftest/recipetool.py   | 44 ++++++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 meta-selftest/lib/recipetool/bbpath.py

diff --git a/meta-selftest/lib/recipetool/bbpath.py b/meta-selftest/lib/recipetool/bbpath.py
new file mode 100644
index 0000000..783b2dc
--- /dev/null
+++ b/meta-selftest/lib/recipetool/bbpath.py
@@ -0,0 +1,41 @@
+import argparse
+
+already_loaded = False
+register_count = 0
+
+def plugin_name(filename):
+    return os.path.splitext(os.path.basename(filename))[0]
+
+def plugin_init(plugins):
+    global already_loaded
+    already_loaded = plugin_name(__file__) in (plugin_name(p.__name__) for p in plugins)
+
+def print_name(opts):
+    print (__file__)
+
+def print_bbdir(opts):
+    print (__file__.replace('/lib/recipetool/bbpath.py',''))
+
+def print_registered(opts):
+    #global kept_context
+    #print(kept_context.loaded)
+    print ("1")
+
+def multiloaded(opts):
+    global already_loaded
+    print("yes" if already_loaded else "no")
+
+def register_commands(subparsers):
+    global register_count
+    register_count += 1
+
+    def addparser(name, helptxt, func):
+        parser = subparsers.add_parser(name, help=helptxt,
+                                       formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+        parser.set_defaults(func=func)
+        return parser
+
+    addparser('pluginfile', 'Print the filename of this plugin', print_name)
+    addparser('bbdir', 'Print the BBPATH directory of this plugin', print_bbdir)
+    addparser('count', 'How many times have this plugin been registered.', print_registered)
+    addparser('multiloaded', 'How many times have this plugin been initialized', multiloaded)
diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index db1f8de..bcc2b46 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -1,5 +1,6 @@
 import os
 import logging
+import shutil
 import tempfile
 import urllib.parse
 
@@ -485,6 +486,47 @@ class RecipetoolTests(RecipetoolBase):
         inherits = ['pkgconfig', 'autotools']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
+    def _copy_file_with_cleanup(self, srcfile, basedstdir, *paths):
+        dstdir = basedstdir
+        self.assertTrue(os.path.exists(dstdir))
+        for p in paths:
+            dstdir = os.path.join(dstdir, p)
+            if not os.path.exists(dstdir):
+                os.makedirs(dstdir)
+                self.track_for_cleanup(dstdir)
+        dstfile = os.path.join(dstdir, os.path.basename(srcfile))
+        if srcfile != dstfile:
+            shutil.copy(srcfile, dstfile)
+            self.track_for_cleanup(dstfile)
+
+    def test_recipetool_load_plugin(self):
+        """Test that recipetool loads only the first found plugin in BBPATH."""
+
+        recipetool = runCmd("which recipetool")
+        fromname = runCmd("recipetool --quiet pluginfile")
+        srcfile = fromname.output
+        bbpath = get_bb_var('BBPATH')
+        searchpath = bbpath.split(':') + [os.path.dirname(recipetool.output)]
+        plugincontent = []
+        with open(srcfile) as fh:
+            plugincontent = fh.readlines()
+        try:
+            self.assertIn('meta-selftest', srcfile, 'wrong bbpath plugin found')
+            for path in searchpath:
+                self._copy_file_with_cleanup(srcfile, path, 'lib', 'recipetool')
+            result = runCmd("recipetool --quiet count")
+            self.assertEqual(result.output, '1')
+            result = runCmd("recipetool --quiet multiloaded")
+            self.assertEqual(result.output, "no")
+            for path in searchpath:
+                result = runCmd("recipetool --quiet bbdir")
+                self.assertEqual(result.output, path)
+                os.unlink(os.path.join(result.output, 'lib', 'recipetool', 'bbpath.py'))
+        finally:
+            with open(srcfile, 'w') as fh:
+                fh.writelines(plugincontent)
+
+
 class RecipetoolAppendsrcBase(RecipetoolBase):
     def _try_recipetool_appendsrcfile(self, testrecipe, newfile, destfile, options, expectedlines, expectedfiles):
         cmd = 'recipetool appendsrcfile %s %s %s %s %s' % (options, self.templayerdir, testrecipe, newfile, destfile)
@@ -574,6 +616,8 @@ class RecipetoolAppendsrcBase(RecipetoolBase):
         self.assertIn(filesdir, filesextrapaths)
 
 
+
+
 class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
 
     @testcase(1273)
-- 
2.1.4


