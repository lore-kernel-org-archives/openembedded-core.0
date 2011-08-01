Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QnqQk-0005NB-Vq
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 13:13:07 +0200
Received: by wyg30 with SMTP id 30so1598608wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2011 04:08:47 -0700 (PDT)
Received: by 10.216.229.200 with SMTP id h50mr587124weq.13.1312196926981;
	Mon, 01 Aug 2011 04:08:46 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id h1sm3253282wee.25.2011.08.01.04.08.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Aug 2011 04:08:46 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2011 13:08:42 +0200
Message-Id: <1312196922-20019-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>, Koen Kooi <koen@openembedded.org>
Subject: [PATCH] gtk-icon-cache bbclass: only add runtime dependencies on hicolor-icon-theme when installing icons
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
X-List-Received-Date: Mon, 01 Aug 2011 11:13:07 -0000

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
1.6.6.1



