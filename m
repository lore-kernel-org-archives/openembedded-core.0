Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E9A277FC10
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2019 06:43:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Oct 2019 23:43:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,254,1569308400"; d="scan'208";a="206330815"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by FMSMGA003.fm.intel.com with ESMTP; 31 Oct 2019 23:43:50 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Nov 2019 14:43:47 +0800
Message-Id: <1572590627-46560-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] scripts/oe-pkgdata-util: Enable list-pkgs to print ordered packages
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
X-List-Received-Date: Fri, 01 Nov 2019 06:43:50 -0000

The list-pkgs currently print packages in unordered format.
Enable list-pkgs to print ordered packages that will ease
viewing.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/oe-pkgdata-util | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 9cc78d1..93220e3 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -389,21 +389,16 @@ def list_pkgs(args):
                     return False
         return True
 
+    pkglist = []
     if args.recipe:
         packages = get_recipe_pkgs(args.pkgdata_dir, args.recipe, args.unpackaged)
 
         if args.runtime:
-            pkglist = []
             runtime_pkgs = lookup_pkglist(packages, args.pkgdata_dir, False)
             for rtpkgs in runtime_pkgs.values():
                 pkglist.extend(rtpkgs)
         else:
             pkglist = packages
-
-        for pkg in pkglist:
-            if matchpkg(pkg):
-                found = True
-                print("%s" % pkg)
     else:
         if args.runtime:
             searchdir = 'runtime-reverse'
@@ -414,9 +409,13 @@ def list_pkgs(args):
             for fn in files:
                 if fn.endswith('.packaged'):
                     continue
-                if matchpkg(fn):
-                    found = True
-                    print("%s" % fn)
+                pkglist.append(fn)
+
+    for pkg in sorted(pkglist):
+        if matchpkg(pkg):
+            found = True
+            print("%s" % pkg)
+
     if not found:
         if args.pkgspec:
             logger.error("Unable to find any package matching %s" % args.pkgspec)
-- 
2.7.4


