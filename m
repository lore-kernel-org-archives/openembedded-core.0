Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SvoEz-0007uK-DG
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 13:34:25 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jul 2012 04:22:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="199912228"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by fmsmga002.fm.intel.com with ESMTP; 30 Jul 2012 04:22:47 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2012 14:24:28 +0300
Message-Id: <1343647468-25684-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Mon, 30 Jul 2012 11:34:25 -0000

Followed suggestions from Bugz 2261:

2) make the virtual/libx11 DEPENDS conditional based on the x11 distro feature.
This makes the build dependencies reflect the feature list.

3) remove dbus-x11, meaning that dbus-launch with its potential X11 dependency
is now back in dbus where is belongs.

4) make dbus provide dbus-x11, for compatibility.

Fixes [Yocto #2261]

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/recipes-core/dbus/dbus.inc |   11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index a75583d..8a9edaa 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -31,10 +31,12 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
 
 DEBIANNAME_${PN} = "dbus-1"
 
-PACKAGES =+ "${PN}-lib ${PN}-systemd ${@base_contains('DISTRO_FEATURES', 'x11', '${PN}-x11', '', d)}"
+PACKAGES =+ "${PN}-lib ${PN}-systemd"
 
-FILES_${PN}-x11 = "${bindir}/dbus-launch"
-RDEPENDS_${PN}-x11 = "${PN}"
+# for compatibility
+PROVIDES = "dbus-x11"
+RPROVIDES_${PN} = "dbus-x11"
+RREPLACES_${PN} += "dbus-x11"
 
 FILES_${PN}-systemd = "${systemd_unitdir}/system/"
 
@@ -43,6 +45,7 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
                ${bindir}/dbus-cleanup-sockets \
                ${bindir}/dbus-send \
                ${bindir}/dbus-monitor \
+               ${bindir}/dbus-launch \
                ${libexecdir}/dbus* \
                ${sysconfdir} \
                ${localstatedir} \
@@ -59,7 +62,7 @@ pkg_postinst_dbus() {
 }
 
 EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
-EXTRA_OECONF_X_virtclass-native = "--without-x"
+EXTRA_OECONF_X_virtclass-native = "--disable-x11-autolaunch"
 
 EXTRA_OECONF = "--disable-tests \
                 --disable-checks \
-- 
1.7.9.5



