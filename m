Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S0ATY-00049I-Oq
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 12:35:12 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2012 12:26:46 +0100
Message-Id: <1329910007-8441-5-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1329910007-8441-1-git-send-email-obi@opendreambox.org>
References: <1329910007-8441-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 4/5] gtk-icon-cache.bbclass: don't add dependencies or hooks unless x11 is defined
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
X-List-Received-Date: Wed, 22 Feb 2012 11:35:12 -0000

* Drop dependency on GNOME if x11 is disabled.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/gtk-icon-cache.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 0204fd3..cf5907b 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -1,6 +1,6 @@
 FILES_${PN} += "${datadir}/icons/hicolor"
 
-DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']}"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', ['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme'], '', d)}"
 
 # This could run on the host as icon cache files are architecture independent,
 # but there is no gtk-update-icon-cache built natively.
@@ -28,6 +28,9 @@ done
 }
 
 python populate_packages_append () {
+	if not oe.utils.contains('DISTRO_FEATURES', 'x11', True, False, d):
+		return
+
 	packages = d.getVar('PACKAGES', 1).split()
 	pkgdest =  d.getVar('PKGDEST', 1)
 	
-- 
1.7.5.4



