Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BDB0577921
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 08:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v358qQR1008957; 
	Wed, 5 Apr 2017 09:52:26 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id msSvWweKq-hH; Wed,  5 Apr 2017 09:52:26 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v358dHqu007726
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 5 Apr 2017 09:39:18 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cvgTF-0003xb-Ct; Wed, 05 Apr 2017 09:39:17 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Apr 2017 09:39:15 +0100
Message-Id: <1491381555-15185-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] recipe_sanity: Drop now unused FILESDIR
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
X-List-Received-Date: Wed, 05 Apr 2017 08:52:27 -0000

FILESDIR is long dead and unreferenced pretty much anywhere now, drop these
sanity references too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/recipe_sanity.bbclass | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
index 3b00b0e..7fa4a84 100644
--- a/meta/classes/recipe_sanity.bbclass
+++ b/meta/classes/recipe_sanity.bbclass
@@ -70,22 +70,6 @@ def can_delete_FILESPATH(cfgdata, d):
             return False
     return expected != unexpanded
 
-def can_delete_FILESDIR(cfgdata, d):
-    expected = cfgdata.get("FILESDIR")
-    #expected = "${@bb.utils.which(d.getVar('FILESPATH'), '.')}"
-    unexpanded = d.getVar("FILESDIR", False)
-    if unexpanded is None:
-        return False
-
-    expanded = os.path.normpath(d.getVar("FILESDIR"))
-    filespath = d.getVar("FILESPATH").split(":")
-    filespath = [os.path.normpath(f) for f in filespath if os.path.exists(f)]
-
-    return unexpanded != expected and \
-           os.path.exists(expanded) and \
-           (expanded in filespath or
-            expanded == d.expand(expected))
-
 def can_delete_others(p, cfgdata, d):
     for k in ["S", "PV", "PN", "DESCRIPTION", "DEPENDS",
               "SECTION", "PACKAGES", "EXTRA_OECONF", "EXTRA_OEMAKE"]:
@@ -112,7 +96,6 @@ python do_recipe_sanity () {
     p = "%s %s %s" % (d.getVar("PN"), d.getVar("PV"), d.getVar("PR"))
 
     sanitychecks = [
-        (can_delete_FILESDIR, "candidate for removal of FILESDIR"),
         (can_delete_FILESPATH, "candidate for removal of FILESPATH"),
         #(can_use_autotools_base, "candidate for use of autotools_base"),
         (incorrect_nonempty_PACKAGES, "native or cross recipe with non-empty PACKAGES"),
-- 
2.7.4


