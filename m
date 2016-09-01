Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 5DC51731C2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 18:54:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 01 Sep 2016 11:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,268,1470726000"; d="scan'208";a="1034368212"
Received: from jhibarra-mobl1.zpn.intel.com ([10.219.26.58])
	by fmsmga001.fm.intel.com with ESMTP; 01 Sep 2016 11:54:35 -0700
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Sep 2016 13:56:40 -0500
Message-Id: <1472756200-4001-3-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.4.11
In-Reply-To: <1472756200-4001-1-git-send-email-humberto.ibarra.lopez@intel.com>
References: <1472756200-4001-1-git-send-email-humberto.ibarra.lopez@intel.com>
Cc: joshua.g.lock@intel.com
Subject: [PATCH v4 2/2] oe-selftest: Add syntax version tracking to oe-selftest
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
X-List-Received-Date: Thu, 01 Sep 2016 18:54:35 -0000

Add a version field and option to argparse so the sntax version can be tracked

[YOCTO #8938]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 scripts/oe-selftest | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index e0ef0c1..ef996b6 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -48,6 +48,9 @@ import oeqa.utils.ftools as ftools
 from oeqa.utils.commands import runCmd, get_bb_var, get_test_layer
 from oeqa.selftest.base import oeSelfTest, get_available_machines
 
+# command syntax version
+__version__ = "2.0"
+
 try:
     import xmlrunner
     from xmlrunner.result import _XMLTestResult as TestResult
@@ -499,8 +502,8 @@ def main():
     description = "Script that runs unit tests against bitbake and other Yocto related tools. The goal is to validate tools functionality and metadata integrity. Refer to https://wiki.yoctoproject.org/wiki/Oe-selftest for more information."
     parser = argparse_oe.ArgumentParser(description=description)
 
+    parser.add_argument('--version', action='store_true', help = 'print the oe-selftest version and exit.')
     subparsers = parser.add_subparsers(title='subcommands', metavar='<subcommand>')
-    subparsers.required = True
 
     class IncludeAction(argparse.Action):
         #def __init__(self, option_strings, dest, nargs=None, **kwargs):
@@ -549,6 +552,17 @@ def main():
 
     args = parser.parse_args()
 
+    if args.version:
+        print("Oe-selftest %s" % __version__)
+
+    if args._subparser_name is None:
+        if args.version:
+            return 0
+        else:
+            print("oe-selftest: error: the following arguments are required: <subcommand>")
+            parser.print_help()
+            return 2
+
     if args._subparser_name == 'list':
 
         args.list_arg = args.list_arg or 'tests'
-- 
2.4.11


