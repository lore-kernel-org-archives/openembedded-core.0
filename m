Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TlMLN-0004fO-RT
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 17:18:06 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Dec 2012 08:03:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,318,1355126400"; d="scan'208";a="264490100"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2012 08:02:55 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2012 18:02:49 +0200
Message-Id: <1355932969-25071-3-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355932969-25071-1-git-send-email-laurentiu.palcu@intel.com>
References: <1355932969-25071-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 2/2] matchbox-keyboard: use the gtk-immodules-cache.bbclass
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
X-List-Received-Date: Wed, 19 Dec 2012 16:18:06 -0000

Since the class was already present, use it. Also, this will have the
postinstalls run on host, at do_rootfs time.

[YOCTO #3602]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |   18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index adde25b..a7091d2 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -22,7 +22,7 @@ SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext gtk-immodules-cache
 
 EXTRA_OECONF = "--disable-cairo --enable-gtk-im --enable-applet"
 
@@ -49,18 +49,4 @@ do_install_append () {
 	rm -f ${D}${libdir}/matchbox-panel/*.la
 }
 
-pkg_postinst_matchbox-keyboard-im () {
-if [ "x$D" != "x" ]; then
-  exit 1
-fi
-
-gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
-}
-
-pkg_postrm_matchbox-keyboard-im () {
-if [ "x$D" != "x" ]; then
-  exit 1
-fi
-
-gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
-}
+GTKIMMODULES_PACKAGES = "${PN}-im"
-- 
1.7.9.5



