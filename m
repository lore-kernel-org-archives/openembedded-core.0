Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SS9Y6-0003Sw-Fb
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 18:15:34 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q49G5euv000700
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 09:05:41 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 9 May 2012 09:05:40 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 May 2012 11:08:43 -0500
Message-ID: <230ca87131ff1d90b63c277422b4c2386b638654.1336579481.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1336579481.git.mark.hatle@windriver.com>
References: <cover.1336579481.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/2] blacklist.bbclass: Rename to OE_BLACKLIST and minor cleanup
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
X-List-Received-Date: Wed, 09 May 2012 16:15:35 -0000
Content-Type: text/plain

Revise the handling from ANGSTROM_BLACKLIST to OE_BLACKLIST.  Preserved
references to ANGSTROM_BLACKLIST for compatibility with existing users.

Rearrange a bit of the code to avoid unncessary steps if the package does
not have a blacklist.

Change the message generation from a note to debug, adjust the SkipPackage
message from:

<distro> DOES NOT support <recipe> because <reason>

to:

Recipe <recipe> is blacklisted: <reason>

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/blacklist.bbclass |   21 ++++++++++++---------
 1 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbclass
index 7bf4a73..4bf6629 100644
--- a/meta/classes/blacklist.bbclass
+++ b/meta/classes/blacklist.bbclass
@@ -1,20 +1,23 @@
 # anonymous support class from angstrom
 # 
+# To use the blacklist, a distribution should include this
+# class in the INHERIT_DISTRO
+#
+# Modified to allow default to OE_BLACKLIST, with a fallback
+# to ANGSTROM_BLACKLIST for compatibility
+#
 # Features:
 #
-# * blacklist handling, set ANGSTROM_BLACKLIST_pn-blah = "message"
+# * blacklist handling, set OE_BLACKLIST_pn-blah = "message"
 #
 
 python () {
-    import bb
-
-    blacklist = bb.data.getVar("ANGSTROM_BLACKLIST", d, 1)
-    pkgnm = bb.data.getVar("PN", d, 1)
-    distro = bb.data.getVar("DISTRO", d, 1)
+    blacklist = d.getVar("OE_BLACKLIST", True) or d.getVar("ANGSTROM_BLACKLIST", True)
 
     if blacklist:
-	bb.note("%s DOES NOT support %s because %s" % (distro,pkgnm, blacklist))
-        raise bb.parse.SkipPackage("%s DOES NOT support %s because %s" % (distro,pkgnm, blacklist))
-
+        distro = d.getVar("DISTRO", True)
+        pkgnm = d.getVar("PN", True)
+        bb.debug(2, "%s DOES NOT support %s because %s" % (distro, pkgnm, blacklist))
+        raise bb.parse.SkipPackage("Recipe %s is blacklisted: %s" % (pkgnm, blacklist))
 }
 
-- 
1.7.3.4



