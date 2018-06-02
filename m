Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA93374616
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 19:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C28411814A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:18:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id w8u3xraExXP7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:18:39 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 369F718133
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:18:39 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1DE641E064
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:18:39 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F6911E060
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:18:39 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:18:39 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 032BC1B01
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:18:39 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w52JIUvS007141
	for <openembedded-core@lists.openembedded.org>;
	Sat, 2 Jun 2018 21:18:30 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w52JIUIH007140
	for openembedded-core@lists.openembedded.org;
	Sat, 2 Jun 2018 21:18:30 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Jun 2018 21:18:19 +0200
Message-Id: <20180602191819.7087-2-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20180602191819.7087-1-pkj@axis.com>
References: <20180602191819.7087-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/2] oe-pkgdata-util: package-info: Re-add support for the --extra option
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
X-List-Received-Date: Sat, 02 Jun 2018 19:18:40 -0000

Commit 64d3ce83 broke the --extra option.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/oe-pkgdata-util | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 965f473725..bd12047ea5 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -287,8 +287,11 @@ def lookup_recipe(args):
 def package_info(args):
     def parse_pkgdatafile(pkgdatafile):
         vars = ['PKGV', 'PKGE', 'PKGR', 'PN', 'PV', 'PE', 'PR', 'PKGSIZE']
+        if args.extra:
+            vars += args.extra
         with open(pkgdatafile, 'r') as f:
             vals = dict()
+            extra = ''
             for line in f:
                 for var in vars:
                     m = re.match(var + '(?:_\S+)?:\s*(.+?)\s*$', line)
@@ -306,7 +309,12 @@ def package_info(args):
                 recipe_version = vals['PE'] + ":" + recipe_version
             if 'PR' in vals:
                 recipe_version = recipe_version + "-" + vals['PR']
-            print("%s %s %s %s %s" % (pkg, pkg_version, recipe, recipe_version, pkg_size))
+            if args.extra:
+                for var in args.extra:
+                    if var in vals:
+                        val = re.sub(r'\s+', ' ', vals[var])
+                        extra += ' "%s"' % val
+            print("%s %s %s %s %s%s" % (pkg, pkg_version, recipe, recipe_version, pkg_size, extra))
 
     # Handle both multiple arguments and multiple values within an arg (old syntax)
     packages = []
-- 
2.12.0


