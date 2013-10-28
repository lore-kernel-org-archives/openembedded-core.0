Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7CEAC6D2C5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 17:12:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Oct 2013 10:12:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,587,1378882800"; d="scan'208";a="418613114"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.120.252])
	by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2013 10:12:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 17:11:54 +0000
Message-Id: <8b9ee57afbbcf633cba66e4b6e8ab7339ad6d391.1382980153.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1382980153.git.paul.eggleton@linux.intel.com>
References: <cover.1382980153.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1382980153.git.paul.eggleton@linux.intel.com>
References: <cover.1382980153.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/6] scripts/oe-pkgdata-util: remove remnants of former pkgdata structure
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
X-List-Received-Date: Mon, 28 Oct 2013 17:12:13 -0000

OE-Core commit 1b8e4abd2d9c0901d38d89d0f944fe1ffd019379 removed the
vendor-os argument from the command line, and the code using the package
architectures, so clean these items up.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-pkgdata-util | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index dcdfe25..c0fd50d 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -35,8 +35,8 @@ import fnmatch
 import re
 
 def usage():
-    print("syntax: oe-pkgdata-util glob [-d] <pkgdatadir> <vendor-os> <pkglist> \"<globs>\"\n \
-                    read-value [-d] <pkgdatadir> <vendor-os> <value-name> \"<package-name>_<package_architecture>\"");
+    print("syntax: oe-pkgdata-util glob [-d] <pkgdatadir> <pkglist> \"<globs>\"\n \
+                    read-value [-d] <pkgdatadir> <value-name> \"<pkgs>\"");
 
 
 
@@ -55,10 +55,11 @@ def glob(args):
     with open(pkglist_file, 'r') as f:
         for line in f:
             fields = line.rstrip().split()
-            if len(fields) < 2:
+            if not fields:
                 continue
             pkg = fields[0]
-            arch = fields[1]
+            # We don't care about other args (used to need the package architecture but the
+            # new pkgdata structure avoids the need for that)
 
             # Skip packages for which there is no point applying globs
             if skipregex.search(pkg):
@@ -172,9 +173,8 @@ def read_value(args):
     for package in packages:
         pkg_split = package.split('_')
         pkg_name = pkg_split[0]
-        pkg_arch = '_'.join(pkg_split[1:])
         if debug:
-            print "package: name: '%s', arch: '%s'" % (pkg_name, pkg_arch)
+            print "package: '%s'" % pkg_name
         revlink = os.path.join(pkgdata_dir, "runtime-reverse", pkg_name)
         if debug:
             print(revlink)
-- 
1.8.1.2


