Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TkXLo-0004gJ-9C
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 10:51:19 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Dec 2012 01:36:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,300,1355126400"; d="scan'208";a="181808641"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Dec 2012 01:36:25 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 11:37:05 +0200
Message-Id: <1355737025-13222-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH v2] psplash: enable multilib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Dec 2012 09:51:21 -0000

[YOCTO #3438]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-core/psplash/psplash_git.bb | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 7c033e7..0b08bab 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=16;md5=840fb2356b10a85b
 
 SRCREV = "de9979aefbc56af59b4d236a4b63dd19dcdcfb53"
 PV = "0.1+git${SRCPV}"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
            file://psplash-init \
@@ -50,13 +50,17 @@ python __anonymous() {
         d.appendVar("DEPENDS", " gdk-pixbuf-native")
 
     d.prependVar("PACKAGES", "%s " % (" ".join(pkgs)))
+    mlprefix = d.getVar('MLPREFIX', True) or ''
+    pn = d.getVar('PN', True) or ''
     for p in pkgs:
-        d.setVar("FILES_%s" % p, "${bindir}/%s" % p)
-        d.setVar("ALTERNATIVE_%s" % p, 'psplash')
-        d.setVarFlag("ALTERNATIVE_TARGET_%s" % p, 'psplash', '${bindir}/%s' % p)
-        d.appendVar("RDEPENDS_%s" % p, " ${PN}")
+        ep = '%s%s' % (mlprefix, p)
+        epsplash = '%s%s' % (mlprefix, 'psplash')
+        d.setVar("FILES_%s" % ep, "${bindir}/%s" % p)
+        d.setVar("ALTERNATIVE_%s" % ep, epsplash)
+        d.setVarFlag("ALTERNATIVE_TARGET_%s" % ep, epsplash, '${bindir}/%s' % p)
+        d.appendVar("RDEPENDS_%s" % ep, " %s" % pn)
         if p == "psplash-default":
-            d.appendVar("RRECOMMENDS_${PN}", " %s" % p)
+            d.appendVar("RRECOMMENDS_%s" %  pn, " %s" % ep)
 }
 
 S = "${WORKDIR}/git"
-- 
1.7.11.7



