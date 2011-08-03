Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QoivV-0002CA-9s
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 23:24:30 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Aug 2011 14:20:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; d="scan'208";a="34056897"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 03 Aug 2011 14:19:50 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 14:19:20 -0700
Message-Id: <60d74bc1f8549b007e47af8f5f8f8fa83cd06af4.1312394851.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312394851.git.sgw@linux.intel.com>
References: <cover.1312394851.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312394851.git.sgw@linux.intel.com>
References: <cover.1312394851.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/33] gtk-icon-cache bbclass: only add runtime dependencies on hicolor-icon-theme when installing icons
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
X-List-Received-Date: Wed, 03 Aug 2011 21:24:30 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

Tested with gnome-icon-theme and libsoup recipes on angstrom.

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 meta/classes/gtk-icon-cache.bbclass |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index dcabaf5..d9b5d1b 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -1,5 +1,4 @@
 FILES_${PN} += "${datadir}/icons/hicolor"
-RDEPENDS += "hicolor-icon-theme"
 
 # This could run on the host as icon cache files are architecture independent,
 # but there is no gtk-update-icon-cache built natively.
@@ -34,7 +33,12 @@ python populate_packages_append () {
 		icon_dir = '%s/%s/%s/icons' % (pkgdest, pkg, bb.data.getVar('datadir', d, 1))
 		if not os.path.exists(icon_dir):
 			continue
-		
+
+		bb.note("adding hicolor-icon-theme dependency to %s" % pkg)	
+		rdepends = bb.data.getVar('RDEPENDS', d, 1)
+		rdepends += "hicolor-icon-theme"
+		bb.data.setVar('RDEPENDS', rdepends, d)
+	
 		bb.note("adding gtk-icon-cache postinst and postrm scripts to %s" % pkg)
 		
 		postinst = bb.data.getVar('pkg_postinst_%s' % pkg, d, 1) or bb.data.getVar('pkg_postinst', d, 1)
-- 
1.7.3.4



