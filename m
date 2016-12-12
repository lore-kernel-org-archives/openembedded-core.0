Return-Path: <ola.x.nilsson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id ABF3B6FFED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 16:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id D17762E1DC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 17:19:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 7dUqbCH3eX2y
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 17:19:30 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 40E342E1DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 17:19:30 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 227D81E081
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 17:19:30 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15AF51E080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 17:19:30 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 17:19:30 +0100 (CET)
Received: from lnxolani.se.axis.com (lnxolani.se.axis.com [10.88.67.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 089522C5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 17:19:30 +0100 (CET)
Received: by lnxolani.se.axis.com (Postfix, from userid 20853)
	id E85E77C066; Mon, 12 Dec 2016 17:19:29 +0100 (CET)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2016 17:19:29 +0100
Message-Id: <1481559569-20474-1-git-send-email-ola.x.nilsson@axis.com>
X-Mailer: git-send-email 2.1.4
X-TM-AS-GCONF: 00
Subject: [PATCH] oe-pkgdata-util: Make read-value handle override variables
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
X-List-Received-Date: Mon, 12 Dec 2016 16:19:32 -0000

Some variables in pkgdata files have a package-name override.  When
the bare variable can not be found, try with the override-variant.

PKGSIZE is one such variable, and already had special code to handle this.

Test included.

Signed-off-by: Ola x Nilsson <ola.x.nilsson@axis.com>
---
 meta/lib/oeqa/selftest/pkgdata.py |  2 ++
 scripts/oe-pkgdata-util           | 16 ++++++++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/pkgdata.py b/meta/lib/oeqa/selftest/pkgdata.py
index 5a63f89..adfe346 100644
--- a/meta/lib/oeqa/selftest/pkgdata.py
+++ b/meta/lib/oeqa/selftest/pkgdata.py
@@ -41,6 +41,8 @@ class OePkgdataUtilTests(oeSelfTest):
     def test_read_value(self):
         result = runCmd('oe-pkgdata-util read-value PN libz1')
         self.assertEqual(result.output, 'zlib')
+        result = runCmd('oe-pkgdata-util read-value PKG libz1')
+        self.assertEqual(result.output, 'libz1')
         result = runCmd('oe-pkgdata-util read-value PKGSIZE bash')
         pkgsize = int(result.output.strip())
         self.assertGreater(pkgsize, 1, "Size should be greater than 1. %s" % result.output)
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index dbffd6a..fe41f41 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -174,15 +174,16 @@ def read_value(args):
             logger.error("No packages specified")
             sys.exit(1)
 
-    def readvar(pkgdata_file, valuename):
+    def readvar(pkgdata_file, valuename, mappedpkg):
         val = ""
         with open(pkgdata_file, 'r') as f:
             for line in f:
-                if line.startswith(valuename + ":"):
+                if (line.startswith(valuename + ":") or
+                    line.startswith(valuename + "_" + mappedpkg + ":")):
                     val = line.split(': ', 1)[1].rstrip()
         return val
 
-    logger.debug("read-value('%s', '%s' '%s'" % (args.pkgdata_dir, args.valuename, packages))
+    logger.debug("read-value('%s', '%s' '%s')" % (args.pkgdata_dir, args.valuename, packages))
     for package in packages:
         pkg_split = package.split('_')
         pkg_name = pkg_split[0]
@@ -192,18 +193,17 @@ def read_value(args):
         if os.path.exists(revlink):
             mappedpkg = os.path.basename(os.readlink(revlink))
             qvar = args.valuename
+            value = readvar(revlink, qvar, mappedpkg)
             if qvar == "PKGSIZE":
-                # append packagename
-                qvar = "%s_%s" % (args.valuename, mappedpkg)
                 # PKGSIZE is now in bytes, but we we want it in KB
-                pkgsize = (int(readvar(revlink, qvar)) + 1024 // 2) // 1024
+                pkgsize = (int(value) + 1024 // 2) // 1024
                 value = "%d" % pkgsize
-            else:
-                value = readvar(revlink, qvar)
             if args.prefix_name:
                 print('%s %s' % (pkg_name, value))
             else:
                 print(value)
+        else:
+            logger.debug("revlink %s does not exist", revlink)
 
 def lookup_pkglist(pkgs, pkgdata_dir, reverse):
     if reverse:
-- 
2.1.4


