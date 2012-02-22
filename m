Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S0ATV-00047o-GJ
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 12:35:09 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2012 12:26:47 +0100
Message-Id: <1329910007-8441-6-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1329910007-8441-1-git-send-email-obi@opendreambox.org>
References: <1329910007-8441-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 5/5] gnomebase.bbclass: skip packages inheriting gnomebase unless x11 is defined
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
X-List-Received-Date: Wed, 22 Feb 2012 11:35:09 -0000

* Drop dependency on GNOME if x11 is disabled.
* Exceptions may be listed in a whitelist.
* Current exceptions are: libcroco, librsvg and pango.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/gnomebase.bbclass |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.bbclass
index a4209a0..f81d79b 100644
--- a/meta/classes/gnomebase.bbclass
+++ b/meta/classes/gnomebase.bbclass
@@ -6,7 +6,7 @@ def gnome_verdir(v):
 SECTION ?= "x11/gnome"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.bz2;name=archive"
 
-DEPENDS += "gnome-common"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'gnome-common', '', d)}"
 
 FILES_${PN} += "${datadir}/application-registry  \
 	${datadir}/mime-info \
@@ -28,3 +28,8 @@ do_install_append() {
 	rm -f ${D}${datadir}/applications/*.cache
 }
 
+python () {
+        whitelist = [ "libcroco", "librsvg", "pango" ]
+        if not d.getVar('BPN', True) in whitelist and not oe.utils.contains ('DISTRO_FEATURES', 'x11', True, False, d):
+                raise bb.parse.SkipPackage("'x11' not in DISTRO_FEATURES")
+}
-- 
1.7.5.4



