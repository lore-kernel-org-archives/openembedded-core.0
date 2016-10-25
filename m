Return-Path: <ola.x.nilsson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id AC78F71C06
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 11:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 9E52F2E4D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 0CzI8pnxMNiJ
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:36 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id C710B2E4CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:36 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE7031A0AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:36 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A37A71A0A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:36 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:36 +0200 (CEST)
Received: from lnxolani.se.axis.com (lnxolani.se.axis.com [10.88.67.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 951643FA;
	Tue, 25 Oct 2016 13:03:36 +0200 (CEST)
Received: by lnxolani.se.axis.com (Postfix, from userid 20853)
	id 4DECE7C612; Tue, 25 Oct 2016 13:03:35 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: olani@axis.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 25 Oct 2016 13:03:32 +0200
Message-Id: <1477393415-13053-2-git-send-email-olani@axis.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1477393415-13053-1-git-send-email-olani@axis.com>
References: <1477393415-13053-1-git-send-email-olani@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 1/4] devtool: selftest: add test for devtool plugin loading
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
X-List-Received-Date: Tue, 25 Oct 2016 11:03:43 -0000

From: Ola x Nilsson <ola.x.nilsson@axis.com>

Test that devtool plugins are loaded in a well defined order.

Signed-off-by: Ola x Nilsson <ola.x.nilsson@axis.com>
---
 meta-selftest/lib/devtool/bbpath.py | 44 +++++++++++++++++++++++++++++++++++++
 meta/lib/oeqa/selftest/devtool.py   | 43 ++++++++++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 meta-selftest/lib/devtool/bbpath.py

diff --git a/meta-selftest/lib/devtool/bbpath.py b/meta-selftest/lib/devtool/bbpath.py
new file mode 100644
index 0000000..5e8ffb3
--- /dev/null
+++ b/meta-selftest/lib/devtool/bbpath.py
@@ -0,0 +1,44 @@
+import argparse
+
+already_loaded = False
+kept_context = None
+
+def plugin_name(filename):
+    return os.path.splitext(os.path.basename(filename))[0]
+
+def plugin_init(plugins):
+    global already_loaded
+    already_loaded = plugin_name(__file__) in (plugin_name(p.__name__) for p in plugins)
+
+def print_name(args, config, basepath, workspace):
+    print (__file__)
+
+def print_bbdir(args, config, basepath, workspace):
+    print (__file__.replace('/lib/devtool/bbpath.py',''))
+
+def print_registered(args, config, basepath, workspace):
+    global kept_context
+    print(kept_context.loaded)
+
+def multiloaded(args, config, basepath, workspace):
+    global already_loaded
+    print("yes" if already_loaded else "no")
+
+def register_commands(subparsers, context):
+    global kept_context
+    kept_context = context
+    if 'loaded' in context.__dict__:
+        context.loaded += 1
+    else:
+        context.loaded = 1
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
diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index e992dcf..cd9077f 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -1191,6 +1191,49 @@ class DevtoolTests(DevtoolBase):
         result = runCmd("devtool --quiet selftest-reverse \"%s\"" % s)
         self.assertEqual(result.output, s[::-1])
 
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
+    def test_devtool_load_plugin(self):
+        """Test that devtool loads only the first found plugin in BBPATH."""
+
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+
+        devtool = runCmd("which devtool")
+        fromname = runCmd("devtool --quiet pluginfile")
+        srcfile = fromname.output
+        bbpath = get_bb_var('BBPATH')
+        searchpath = bbpath.split(':') + [os.path.dirname(devtool.output)]
+        plugincontent = []
+        with open(srcfile) as fh:
+            plugincontent = fh.readlines()
+        try:
+            self.assertIn('meta-selftest', srcfile, 'wrong bbpath plugin found')
+            for path in searchpath:
+                self._copy_file_with_cleanup(srcfile, path, 'lib', 'devtool')
+            result = runCmd("devtool --quiet count")
+            self.assertEqual(result.output, '1')
+            result = runCmd("devtool --quiet multiloaded")
+            self.assertEqual(result.output, "no")
+            for path in searchpath:
+                result = runCmd("devtool --quiet bbdir")
+                self.assertEqual(result.output, path)
+                os.unlink(os.path.join(result.output, 'lib', 'devtool', 'bbpath.py'))
+        finally:
+            with open(srcfile, 'w') as fh:
+                fh.writelines(plugincontent)
+
     def _setup_test_devtool_finish_upgrade(self):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
-- 
2.1.4


