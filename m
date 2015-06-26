Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BFF9360132
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 15:07:36 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jun 2015 08:07:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,685,1427785200"; d="scan'208";a="595315625"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 26 Jun 2015 08:07:32 -0700
Received: from localhost.localdomain (unknown [10.237.112.249])
	by linux.intel.com (Postfix) with ESMTP id C2B146A4005;
	Fri, 26 Jun 2015 08:06:53 -0700 (PDT)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jun 2015 18:07:06 +0300
Message-Id: <1435331227-25862-2-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435331227-25862-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1435331227-25862-1-git-send-email-daniel.alexandrux.istrate@intel.com>
Subject: [PATCH 2/3] Added methods for manipulating bblayer.conf file in the same manner as local.conf file: - write_bblayers_config - append_bblayers_config - remove_bblayers_config
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
X-List-Received-Date: Fri, 26 Jun 2015 15:07:42 -0000

---
 meta/lib/oeqa/selftest/base.py | 22 ++++++++++++++++++++++
 scripts/oe-selftest            | 16 +++++++++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/base.py b/meta/lib/oeqa/selftest/base.py
index 80b9b4b..b2faa66 100644
--- a/meta/lib/oeqa/selftest/base.py
+++ b/meta/lib/oeqa/selftest/base.py
@@ -27,6 +27,8 @@ class oeSelfTest(unittest.TestCase):
         self.builddir = os.environ.get("BUILDDIR")
         self.localconf_path = os.path.join(self.builddir, "conf/local.conf")
         self.testinc_path = os.path.join(self.builddir, "conf/selftest.inc")
+        self.local_bblayers_path = os.path.join(self.builddir, "conf/bblayers.conf")
+        self.testinc_bblayers_path = os.path.join(self.builddir, "conf/bblayers.inc")
         self.testlayer_path = oeSelfTest.testlayer_path
         self._extra_tear_down_commands = []
         self._track_for_cleanup = []
@@ -45,6 +47,11 @@ class oeSelfTest(unittest.TestCase):
             for f in files:
                 if f == 'test_recipe.inc':
                     os.remove(os.path.join(root, f))
+        try:
+            os.remove(self.testinc_bblayers_path)
+        except OSError as e:
+            if e.errno != errno.ENOENT:
+                raise
         # tests might need their own setup
         # but if they overwrite this one they have to call
         # super each time, so let's give them an alternative
@@ -129,3 +136,18 @@ class oeSelfTest(unittest.TestCase):
         except OSError as e:
             if e.errno != errno.ENOENT:
                 raise
+
+    # write to <builddir>/conf/bblayers.inc
+    def write_bblayers_config(self, data):
+        self.log.debug("Writing to: %s\n%s\n" % (self.testinc_bblayers_path, data))
+        ftools.write_file(self.testinc_bblayers_path, data)
+
+    # append to <builddir>/conf/bblayers.inc
+    def append_bblayers_config(self, data):
+        self.log.debug("Appending to: %s\n%s\n" % (self.testinc_bblayers_path, data))
+        ftools.append_file(self.testinc_bblayers_path, data)
+
+    # remove data from <builddir>/conf/bblayers.inc
+    def remove_bblayers_config(self, data):
+        self.log.debug("Removing from: %s\n\%s\n" % (self.testinc_bblayers_path, data))
+        ftools.remove_from_file(self.testinc_bblayers_path, data)
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index a04e9fc..049a94e 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -100,6 +100,11 @@ def add_include():
             ftools.append_file(os.path.join(builddir, "conf/local.conf"), \
                     "\n#include added by oe-selftest.py\ninclude selftest.inc")
 
+    if "#include added by oe-selftest.py" \
+        not in ftools.read_file(os.path.join(builddir, "conf/bblayers.conf")):
+            log.info("Adding: \"include bblayers.inc\" in bblayers.conf")
+            ftools.append_file(os.path.join(builddir, "conf/bblayers.conf"), \
+                    "\n#include added by oe-selftest.py\ninclude bblayers.inc")
 
 def remove_include():
     builddir = os.environ.get("BUILDDIR")
@@ -111,6 +116,11 @@ def remove_include():
             ftools.remove_from_file(os.path.join(builddir, "conf/local.conf"), \
                     "#include added by oe-selftest.py\ninclude selftest.inc")
 
+    if "#include added by oe-selftest.py" \
+        in ftools.read_file(os.path.join(builddir, "conf/bblayers.conf")):
+            log.info("Removing the include from bblayers.conf")
+            ftools.remove_from_file(os.path.join(builddir, "conf/bblayers.conf"), \
+                    "#include added by oe-selftest.py\ninclude bblayers.inc")
 
 def remove_inc_files():
     try:
@@ -122,6 +132,11 @@ def remove_inc_files():
     except (AttributeError, OSError,) as e:    # AttributeError may happen if BUILDDIR is not set
         pass
 
+    try:
+        os.remove(os.path.join(os.environ.get("BUILDDIR"), "conf/bblayers.inc"))
+    except:
+        pass
+
 def get_tests(exclusive_modules=[], include_hidden=False):
     testslist = []
     for x in exclusive_modules:
@@ -167,7 +182,6 @@ def main():
                     print e
                     pass
 
-
     if args.run_tests or args.run_all_tests:
         if not preflight_check():
             return 1
-- 
2.1.4


