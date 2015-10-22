Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 5FAD177187
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id C1909608FC3
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:22:00 +0100
Message-Id: <69f5bbc1041e15691af0b4845e2136957a4846a1.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 39/52] oeqa/selftest: verify that devtool can use plugins in other layers
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:27 -0000

From: Ross Burton <ross.burton@intel.com>

In selftest we want to exercise devtool's ability to use plugins from other
layers, so add a basic command to reverse a string to meta-selftest and a test
in oe-selftest to call it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-selftest/lib/devtool/__init__.py |  0
 meta-selftest/lib/devtool/test.py     | 11 +++++++++++
 meta/lib/oeqa/selftest/devtool.py     | 12 ++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 meta-selftest/lib/devtool/__init__.py
 create mode 100644 meta-selftest/lib/devtool/test.py

diff --git a/meta-selftest/lib/devtool/__init__.py b/meta-selftest/lib/devtool/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/meta-selftest/lib/devtool/test.py b/meta-selftest/lib/devtool/test.py
new file mode 100644
index 0000000..b7474b5
--- /dev/null
+++ b/meta-selftest/lib/devtool/test.py
@@ -0,0 +1,11 @@
+import argparse
+
+def selftest_reverse(args, config, basepath, workspace):
+    """Reverse the value passed to verify the plugin is executing."""
+    print args.value[::-1]
+
+def register_commands(subparsers, context):
+    parser_build = subparsers.add_parser('selftest-reverse', help='Reverse value (for selftest)',
+                                         formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+    parser_build.add_argument('value', help='Value to reverse')
+    parser_build.set_defaults(func=selftest_reverse)
diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index e4de309..fb46559 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -1015,3 +1015,15 @@ class DevtoolTests(DevtoolBase):
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+
+    def test_devtool_layer_plugins(self):
+        """Test that devtool can use plugins from other layers.
+
+        This test executes the selftest-reverse command from meta-selftest."""
+
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+
+        s = "Microsoft Made No Profit From Anyone's Zunes Yo"
+        result = runCmd("devtool --quiet selftest-reverse \"%s\"" % s)
+        self.assertEqual(result.output, s[::-1])
-- 
2.1.4


