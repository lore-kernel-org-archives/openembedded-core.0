Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1Sue5v-00062N-PR
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 08:32:15 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Jul 2012 23:20:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173816525"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by azsmga001.ch.intel.com with ESMTP; 26 Jul 2012 23:20:42 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2012 09:22:17 +0300
Message-Id: <1343370137-30705-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v5] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Fri, 27 Jul 2012 06:32:16 -0000

Followed suggestions from Bugz 2261:

2) make the virtual/libx11 DEPENDS conditional based on the x11 distro feature.
This makes the build dependencies reflect the feature list.

3) remove dbus-x11, meaning that dbus-launch with its potential X11 dependency
is now back in dbus where is belongs.

4) Potentially make dbus provide dbus-x11, for compatibility.

Fixes [Yocto #2261]

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/recipes-core/dbus/dbus.inc |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index a75583d..b01323b 100644
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
-- 
1.7.9.5



