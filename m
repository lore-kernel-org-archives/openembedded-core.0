Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id D2F8474B03
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 21:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C892B183B3;
	Tue, 15 May 2018 23:38:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id uirrB6YUMMCQ; Tue, 15 May 2018 23:38:03 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 253A418391;
	Tue, 15 May 2018 23:38:03 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0646B1A062;
	Tue, 15 May 2018 23:38:03 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE09A1A05F;
	Tue, 15 May 2018 23:38:02 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 15 May 2018 23:38:02 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id E19182F6B;
	Tue, 15 May 2018 23:38:02 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w4FLbtoZ016641;
	Tue, 15 May 2018 23:37:55 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w4FLbt3R016639;
	Tue, 15 May 2018 23:37:55 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2018 23:33:03 +0200
Message-Id: <20180515213303.30553-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Amanda Brindle <amanda.r.brindle@intel.com>
Subject: [master][sumo][PATCH] oe-pkgdata-util: lookup-recipe, package-info: Don't finish prematurely
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
X-List-Received-Date: Tue, 15 May 2018 21:38:04 -0000

If a package name exists in runtime-rprovides, lookup-recipe and
package-info would finish after printing information about that
package even if more packages were specified.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/oe-pkgdata-util | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index aea8a57516..5dd9588224 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -277,7 +277,7 @@ def lookup_recipe(args):
                     print("%s is in the RPROVIDES of %s:" % (pkg, f))
                 pkgdatafile = os.path.join(args.pkgdata_dir, "runtime", f)
                 parse_pkgdatafile(pkgdatafile)
-            break
+            continue
         pkgdatafile = os.path.join(args.pkgdata_dir, 'runtime-reverse', pkg)
         if not os.path.exists(pkgdatafile):
             logger.error("The following packages could not be found: %s" % pkg)
@@ -341,7 +341,7 @@ def package_info(args):
                     print("%s is in the RPROVIDES of %s:" % (pkg, f))
                 pkgdatafile = os.path.join(args.pkgdata_dir, "runtime", f)
                 parse_pkgdatafile(pkgdatafile)
-            break
+            continue
         pkgdatafile = os.path.join(args.pkgdata_dir, "runtime-reverse", pkg)
         if not os.path.exists(pkgdatafile):
             logger.error("Unable to find any built runtime package named %s" % pkg)
-- 
2.12.0


