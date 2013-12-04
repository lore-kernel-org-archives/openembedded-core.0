Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9E2886D915
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 11:42:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Dec 2013 03:38:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,824,1378882800"; d="scan'208";a="446663944"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 04 Dec 2013 03:42:24 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 4FFF16A4009;
	Wed,  4 Dec 2013 03:42:22 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 13:42:58 +0200
Message-Id: <1386157378-22214-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] lib/oeqa/selftest/base, scripts/oe-selftest: fix wrong remove path and do a complete cleanup at the end
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
X-List-Received-Date: Wed, 04 Dec 2013 11:42:25 -0000

The script should clean-up all the .inc files that might
have been created by tests regardless of the outcome or if
the script is interrupted. (currently the
last test will leave a conf/selftest.inc around, even
if it's not included anywhere)
Also fix delete_recipeinc to actually delete what's supposed to.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/selftest/base.py |  2 +-
 scripts/oe-selftest            | 12 ++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/base.py b/meta/lib/oeqa/selftest/base.py
index 30a71e8..c3474a3 100644
--- a/meta/lib/oeqa/selftest/base.py
+++ b/meta/lib/oeqa/selftest/base.py
@@ -92,7 +92,7 @@ class oeSelfTest(unittest.TestCase):
         inc_file = os.path.join(self.testlayer_path, 'recipes-test', recipe, 'test_recipe.inc')
         self.log.debug("Deleting file: %s" % inc_file)
         try:
-            os.remove(self.testinc_path)
+            os.remove(inc_file)
         except OSError as e:
             if e.errno != errno.ENOENT:
                 raise
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index db42e73..29fe010 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -97,6 +97,17 @@ def remove_include():
             ftools.remove_from_file(os.path.join(builddir, "conf/local.conf"), \
                     "#include added by oe-selftest.py\ninclude selftest.inc")
 
+
+def remove_inc_files():
+    try:
+        os.remove(os.path.join(os.environ.get("BUILDDIR"), "conf/selftest.inc"))
+        for root, _, files in os.walk(get_test_layer()):
+            for f in files:
+                if f == 'test_recipe.inc':
+                    os.remove(os.path.join(root, f))
+    except OSError as e:
+        pass
+
 def get_tests():
     testslist = []
     for x in sys.argv[1:]:
@@ -145,4 +156,5 @@ if __name__ == "__main__":
         traceback.print_exc(5)
     finally:
         remove_include()
+        remove_inc_files()
     sys.exit(ret)
-- 
1.8.3.1


