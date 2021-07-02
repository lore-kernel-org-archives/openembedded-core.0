Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.11921.1625242814841293130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 09:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="196043450"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="196043450"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:23 -0700
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="626776380"
Received: from ypoh4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.151.64])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:21 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 08/22] selftest/fetch: Avoid occasional selftest failure from poor temp file name choice
Date: Sat,  3 Jul 2021 00:19:50 +0800
Message-Id: <8c2d92f855fe0d692228f7ebf7e7b116195ccf0c.1625242066.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625242066.git.anuj.mittal@intel.com>
References: <cover.1625242066.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The temp file name may contain "_" characters. Switch to a temporary directory
and a fixed filename to avoid this to avoid errors like:

bb.data_smart.ExpansionError: Failure expanding variable PN, expression was
${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[0] or 'defaultpkgname'}
which triggered exception ParseError:
ParseError in /tmp/tmpd_f2__to.bb: Unable to generate default variables from
filename (too many underscores)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 086e2ae7b2b7496b4f3ae01436b4049d7f2ff8c4)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/fetch.py | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fetch.py b/meta/lib/oeqa/selftest/cases/fetch.py
index 67e85d3e4c..cd15f65129 100644
--- a/meta/lib/oeqa/selftest/cases/fetch.py
+++ b/meta/lib/oeqa/selftest/cases/fetch.py
@@ -55,25 +55,26 @@ MIRRORS_forcevariable = "git://.*/.* http://downloads.yoctoproject.org/mirror/so
 
 
 class Dependencies(OESelftestTestCase):
-    def write_recipe(self, content):
-        f = tempfile.NamedTemporaryFile(mode="wt", suffix=".bb")
-        f.write(content)
-        f.flush()
+    def write_recipe(self, content, tempdir):
+        f = os.path.join(tempdir, "test.bb")
+        with open(f, "w") as fd:
+            fd.write(content)
         return f
 
     def test_dependencies(self):
         """
         Verify that the correct dependencies are generated for specific SRC_URI entries.
         """
-        with bb.tinfoil.Tinfoil() as tinfoil:
+
+        with bb.tinfoil.Tinfoil() as tinfoil, tempfile.TemporaryDirectory(prefix="selftest-fetch") as tempdir:
             tinfoil.prepare(config_only=False, quiet=2)
 
             r = """
             LICENSE="CLOSED"
             SRC_URI="http://example.com/tarball.zip"
             """
-            f = self.write_recipe(textwrap.dedent(r))
-            d = tinfoil.parse_recipe_file(f.name)
+            f = self.write_recipe(textwrap.dedent(r), tempdir)
+            d = tinfoil.parse_recipe_file(f)
             self.assertIn("wget-native", d.getVarFlag("do_fetch", "depends"))
             self.assertIn("unzip-native", d.getVarFlag("do_unpack", "depends"))
 
@@ -82,8 +83,8 @@ class Dependencies(OESelftestTestCase):
             LICENSE="CLOSED"
             SRC_URI="https://example.com/tarball;downloadfilename=something.zip"
             """
-            f = self.write_recipe(textwrap.dedent(r))
-            d = tinfoil.parse_recipe_file(f.name)
+            f = self.write_recipe(textwrap.dedent(r), tempdir)
+            d = tinfoil.parse_recipe_file(f)
             self.assertIn("wget-native", d.getVarFlag("do_fetch", "depends"))
             self.assertIn("unzip-native", d.getVarFlag("do_unpack", "depends") or "")
 
@@ -91,8 +92,8 @@ class Dependencies(OESelftestTestCase):
             LICENSE="CLOSED"
             SRC_URI="ftp://example.com/tarball.lz"
             """
-            f = self.write_recipe(textwrap.dedent(r))
-            d = tinfoil.parse_recipe_file(f.name)
+            f = self.write_recipe(textwrap.dedent(r), tempdir)
+            d = tinfoil.parse_recipe_file(f)
             self.assertIn("wget-native", d.getVarFlag("do_fetch", "depends"))
             self.assertIn("lzip-native", d.getVarFlag("do_unpack", "depends"))
 
@@ -100,6 +101,6 @@ class Dependencies(OESelftestTestCase):
             LICENSE="CLOSED"
             SRC_URI="git://example.com/repo"
             """
-            f = self.write_recipe(textwrap.dedent(r))
-            d = tinfoil.parse_recipe_file(f.name)
+            f = self.write_recipe(textwrap.dedent(r), tempdir)
+            d = tinfoil.parse_recipe_file(f)
             self.assertIn("git-native", d.getVarFlag("do_fetch", "depends"))
-- 
2.31.1

