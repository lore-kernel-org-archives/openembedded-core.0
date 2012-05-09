Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SSDA2-0002vt-3t
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 22:06:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q49Jv4B1028121
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 12:57:04 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 9 May 2012 12:57:04 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 May 2012 15:00:07 -0500
Message-ID: <583198c49fc63d31fd0f15484983032b50b2ce8a.1336593352.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1336593352.git.mark.hatle@windriver.com>
References: <cover.1336593352.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/2 v2] blacklist.bbclass: Refactor, use PNBLACKLIST[pn]
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2012 20:06:58 -0000
Content-Type: text/plain

Revise the handling from ANGSTROM_BLACKLIST to PNBLACKLIST[pn].

Refactor the code to eliminate references to the distribution and recipe
name in the message.

Change the skipPackage message message from:

ERROR: <recipe> was skipped: <distro> DOES NOT support <recipe> because <reason>

to:

ERROR: <recipe> was skipped: Recipe is blacklisted: <reason>

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/blacklist.bbclass |   22 +++++++++++-----------
 1 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbclass
index 7bf4a73..75abd99 100644
--- a/meta/classes/blacklist.bbclass
+++ b/meta/classes/blacklist.bbclass
@@ -1,20 +1,20 @@
-# anonymous support class from angstrom
+# anonymous support class from originally from angstrom
 # 
+# To use the blacklist, a distribution should include this
+# class in the INHERIT_DISTRO
+#
+# No longer use ANGSTROM_BLACKLIST, instead use a table of
+# recipes in PNBLACKLIST
+#
 # Features:
 #
-# * blacklist handling, set ANGSTROM_BLACKLIST_pn-blah = "message"
+# * To add a package to the blacklist, set:
+#   PNBLACKLIST[pn] = "message"
 #
 
 python () {
-    import bb
-
-    blacklist = bb.data.getVar("ANGSTROM_BLACKLIST", d, 1)
-    pkgnm = bb.data.getVar("PN", d, 1)
-    distro = bb.data.getVar("DISTRO", d, 1)
+    blacklist = d.getVarFlag('PNBLACKLIST', d.getVar('PN', True), True)
 
     if blacklist:
-	bb.note("%s DOES NOT support %s because %s" % (distro,pkgnm, blacklist))
-        raise bb.parse.SkipPackage("%s DOES NOT support %s because %s" % (distro,pkgnm, blacklist))
-
+        raise bb.parse.SkipPackage("Recipe is blacklisted: %s" % (blacklist))
 }
-
-- 
1.7.3.4



