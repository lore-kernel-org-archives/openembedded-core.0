Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fcooperjr27@gmail.com>) id 1TDkYS-0004L5-7N
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 01:16:40 +0200
Received: by obblz20 with SMTP id lz20so9889076obb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 16:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=QheufKQuf7oPCR6bwLU1HeArnvlaqU5MHvhz19MnR60=;
	b=fFupAjs77oHGGVTzdQ0QQzPm9u+y/ThPW4/gYi6NDvfnuxnbPNPvMd5kz67f+ti2ix
	yU3xsor6LrNj/ga1XMIa4Ba0QzFaadNWcBY/hor+5Lad6vd4+LmWd97xiPBoKME7y5SX
	zVydGLrqJNrzHraJQrhfhakZG7KlJa2ajZoKFSKJ0Ews/WvYbDO6y2u3wXDx9FFdQvda
	VtlXRZy3py9qO5smG080GexyVhUVOBvvOBz7iO/K4+qticL+bUeb05V1xe/Pqk1jjgoO
	mXnQctxg41eBv7pYDaDSTohg76uXIcU2r4QExQ38hKvF8KR/3y5oo24y2egJR7xEEkKp
	i6gQ==
Received: by 10.182.44.74 with SMTP id c10mr13634195obm.29.1347923040527;
	Mon, 17 Sep 2012 16:04:00 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id d6sm12216451obx.15.2012.09.17.16.03.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 16:03:59 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 18:25:52 -0500
Message-Id: <1347924353-11159-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [denzil][PATCH 1/2] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Mon, 17 Sep 2012 23:16:40 -0000

From: Radu Moisan <radu.moisan@intel.com>

Followed suggestions from Bugz 2261:

2) make the virtual/libx11 DEPENDS conditional based on the x11 distro feature.
This makes the build dependencies reflect the feature list.

3) remove dbus-x11, meaning that dbus-launch with its potential X11 dependency
is now back in dbus where is belongs.

4) make dbus provide dbus-x11, for compatibility.

Fixes [Yocto #2261]

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/dbus/dbus.inc |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index a75583d..164c4d3 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -31,10 +31,11 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
 
 DEBIANNAME_${PN} = "dbus-1"
 
-PACKAGES =+ "${PN}-lib ${PN}-systemd ${@base_contains('DISTRO_FEATURES', 'x11', '${PN}-x11', '', d)}"
+PACKAGES =+ "${PN}-lib ${PN}-systemd"
 
-FILES_${PN}-x11 = "${bindir}/dbus-launch"
-RDEPENDS_${PN}-x11 = "${PN}"
+# for compatibility
+RPROVIDES_${PN} = "dbus-x11"
+RREPLACES_${PN} += "dbus-x11"
 
 FILES_${PN}-systemd = "${systemd_unitdir}/system/"
 
@@ -43,6 +44,7 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
                ${bindir}/dbus-cleanup-sockets \
                ${bindir}/dbus-send \
                ${bindir}/dbus-monitor \
+               ${bindir}/dbus-launch \
                ${libexecdir}/dbus* \
                ${sysconfdir} \
                ${localstatedir} \
@@ -59,7 +61,7 @@ pkg_postinst_dbus() {
 }
 
 EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
-EXTRA_OECONF_X_virtclass-native = "--without-x"
+EXTRA_OECONF_X_virtclass-native = "--disable-x11-autolaunch"
 
 EXTRA_OECONF = "--disable-tests \
                 --disable-checks \
-- 
1.7.0.4



