Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1AB9E6B7C7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 17:05:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 15 Aug 2013 10:04:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,886,1367996400"; d="scan'208";a="381479000"
Received: from timevans-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.206])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2013 10:04:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 18:04:40 +0100
Message-Id: <0a259270f3f2266b7ba627f31a20ebff983c9e01.1376585082.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376585082.git.paul.eggleton@linux.intel.com>
References: <cover.1376585082.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1376585082.git.paul.eggleton@linux.intel.com>
References: <cover.1376585082.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/7] buildhistory-collect-srcrevs: match new buildhistory-diff command line parsing
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
X-List-Received-Date: Thu, 15 Aug 2013 17:05:26 -0000

* Default buildhistory directory to buildhistory/ under the current
  directory and require an option to set it
* Show a description in the help output

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/buildhistory-collect-srcrevs | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/scripts/buildhistory-collect-srcrevs b/scripts/buildhistory-collect-srcrevs
index 7f65c90..58a2708 100755
--- a/scripts/buildhistory-collect-srcrevs
+++ b/scripts/buildhistory-collect-srcrevs
@@ -34,8 +34,9 @@ logger = logger_create()
 
 def main():
     parser = optparse.OptionParser(
+        description = "Collects the recorded SRCREV values from buildhistory and reports on them.",
         usage = """
-    %prog [options] <buildhistory-dir>""")
+    %prog [options]""")
 
     parser.add_option("-a", "--report-all",
             help = "Report all SRCREV values, not just ones where AUTOREV has been used",
@@ -43,16 +44,20 @@ def main():
     parser.add_option("-f", "--forcevariable",
             help = "Use forcevariable override for all output lines",
             action="store_true", dest="forcevariable")
+    parser.add_option("-p", "--buildhistory-dir",
+            help = "Specify path to buildhistory directory (defaults to buildhistory/ under cwd)",
+            action="store", dest="buildhistory_dir", default='buildhistory/')
 
     options, args = parser.parse_args(sys.argv)
 
-    if len(args) != 2:
+    if len(args) > 1:
+        sys.stderr.write('Invalid argument(s) specified: %s\n\n' % ' '.join(args[1:]))
         parser.print_help()
         sys.exit(1)
 
-    buildhistory_dir = args[1]
-    if not os.path.exists(buildhistory_dir):
-        logger.error('specified buildhistory path %s could not be found' % buildhistory_dir)
+    if not os.path.exists(options.buildhistory_dir):
+        sys.stderr.write('Buildhistory directory "%s" does not exist\n\n' % options.buildhistory_dir)
+        parser.print_help()
         sys.exit(1)
 
     if options.forcevariable:
@@ -61,7 +66,7 @@ def main():
         forcevariable = ''
 
     lastdir = ''
-    for root, dirs, files in os.walk(buildhistory_dir):
+    for root, dirs, files in os.walk(options.buildhistory_dir):
         if '.git' in dirs:
             dirs.remove('.git')
         for fn in files:
-- 
1.8.1.2


