Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7386F73F9E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 13:23:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2015 06:23:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,626,1427785200"; d="scan'208";a="509160649"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Jun 2015 06:23:09 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 58E7A6A4005;
	Tue, 16 Jun 2015 06:22:31 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2015 14:29:20 +0300
Message-Id: <1434454160-6541-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH v2] wic: Return error code when wic fails to invoke command
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
X-List-Received-Date: Tue, 16 Jun 2015 13:23:07 -0000

Return 1 if command doesn't exist or wic is called without
any commmand.
Return result of invoke_command as wic return code.

Added tests for unsupported command and no command.

Fixed typo in test case test02_createhelp spotted by this fix.

[YOCTO #7856]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 11 ++++++++++-
 scripts/lib/image/help.py     |  2 ++
 scripts/wic                   |  2 +-
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 0e3f1f6..ca8fe99 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -52,7 +52,7 @@ class Wic(oeSelfTest):
 
     def test02_createhelp(self):
         """Test wic create --help"""
-        self.assertEqual(0, runCmd('wic creat --help').status)
+        self.assertEqual(0, runCmd('wic create --help').status)
 
     def test03_listhelp(self):
         """Test wic list --help"""
@@ -82,3 +82,12 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd("wic create directdisk-gpt "
                                    "--image-name core-image-minimal").status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+
+    def test07_unsupported_subcommand(self):
+        """Test unsupported subcommand"""
+        self.assertEqual(1, runCmd('wic unsupported',
+                         ignore_status=True).status)
+
+    def test08_no_command(self):
+        """Test wic without command"""
+        self.assertEqual(1, runCmd('wic', ignore_status=True).status)
diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index adfe976..a546c7c 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -63,11 +63,13 @@ def invoke_subcommand(args, parser, main_command_usage, subcommands):
     if not args:
         logging.error("No subcommand specified, exiting")
         parser.print_help()
+        return 1
     elif args[0] == "help":
         wic_help(args, main_command_usage, subcommands)
     elif args[0] not in subcommands:
         logging.error("Unsupported subcommand %s, exiting\n" % (args[0]))
         parser.print_help()
+        return 1
     else:
         usage = subcommands.get(args[0], subcommand_error)[1]
         subcommands.get(args[0], subcommand_error)[0](args[1:], usage)
diff --git a/scripts/wic b/scripts/wic
index cf96859..d48e45d 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -305,7 +305,7 @@ def main(argv):
                 parser.print_help()
                 sys.exit(1)
 
-    hlp.invoke_subcommand(args, parser, hlp.wic_help_usage, subcommands)
+    return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage, subcommands)
 
 
 if __name__ == "__main__":
-- 
2.1.4


