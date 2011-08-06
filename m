Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QpbKb-0001rJ-DL
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 09:30:01 +0200
Received: by wyf19 with SMTP id 19so720547wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Aug 2011 00:25:36 -0700 (PDT)
Received: by 10.216.54.134 with SMTP id i6mr1238411wec.110.1312615535824;
	Sat, 06 Aug 2011 00:25:35 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id y4sm2251685weq.30.2011.08.06.00.25.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Aug 2011 00:25:34 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Aug 2011 09:25:28 +0200
Message-Id: <1312615528-23732-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] gtk-icon-cache: fix RDEPENDS append bug
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
X-List-Received-Date: Sat, 06 Aug 2011 07:30:01 -0000

python += doesn't add a leading space, which we do need:

| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies for task-gnome-themes:
|  *    gnome-icon-themehicolor-icon-theme *
|  * opkg_install_cmd: Cannot install package task-gnome-themes.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies for task-gnome-apps:
|  *    iso-codeshicolor-icon-theme *
|  * opkg_install_cmd: Cannot install package task-gnome-apps.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies for task-gnome:
|  *    grephicolor-icon-theme *
|  * opkg_install_cmd: Cannot install package task-gnome.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/gtk-icon-cache.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 5d8ef34..3bfb8ff 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -38,7 +38,7 @@ python populate_packages_append () {
 
 		bb.note("adding hicolor-icon-theme dependency to %s" % pkg)	
 		rdepends = bb.data.getVar('RDEPENDS_%s' % pkg, d, 1)
-		rdepends += "hicolor-icon-theme"
+		rdepends += " hicolor-icon-theme"
 		bb.data.setVar('RDEPENDS_%s' % pkg, rdepends, d)
 	
 		bb.note("adding gtk-icon-cache postinst and postrm scripts to %s" % pkg)
-- 
1.6.6.1



