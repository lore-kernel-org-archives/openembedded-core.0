Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8451B738AE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 15:32:08 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 29 Jun 2015 08:32:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,699,1427785200"; d="scan'208";a="596788565"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 29 Jun 2015 08:32:10 -0700
Received: from localhost.localdomain (unknown [10.237.112.249])
	by linux.intel.com (Postfix) with ESMTP id 95F8F6A4083;
	Mon, 29 Jun 2015 08:31:30 -0700 (PDT)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 18:31:55 +0300
Message-Id: <1435591915-2243-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] scripts/oe-selftest: Added mechanism for including/removing bblayers.inc
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
X-List-Received-Date: Mon, 29 Jun 2015 15:32:10 -0000

When oe-selftest starts it includes bblayers.inc into bblayers.conf
When oe-selftest ends it deletes bblayers.inc and the included line
from bblayers.conf

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 scripts/oe-selftest | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index fd58a66..fa6245a 100755
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


