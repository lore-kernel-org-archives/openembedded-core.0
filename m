Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 313B97FE0F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 14:20:29 +0000 (UTC)
Received: from localhost.localdomain (31-10-206-124.static.upc.ch
	[31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 8AC905C87D9;
	Wed, 22 Jan 2020 15:20:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1579702828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=B/L3NAnfKJ34ie7flI/bnLJ/t09AV5cDYvg/ycMGVgg=;
	b=aqfJ8nzNa8QcQt/W4OCFugXTcqK80EhpqN4fvSlvtlEmt1TKClyW/a0w76OHqslFk5Hbn2
	uFba07cNKyQeh4ixAthJkQdRIdC7qPAXb9G7AT14e0JXr4pB4lieOMlJoWOwETsgDe3+4G
	vv0hRsv6u0BEC+QFTLHu6hkmQpZR2hA=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2020 14:20:24 +0000
Message-Id: <20200122142024.25453-1-stefan@agner.ch>
X-Mailer: git-send-email 2.17.1
Cc: Stefan Agner <stefan.agner@toradex.com>, yann@blade-group.com,
	david@sonabuzz.com, agherzan@hanoverdisplays.com
Subject: [PATCH] psplash: add systemd support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jan 2020 14:20:29 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Make use of the recently added systemd support in psplash. The utility
psplash-systemd communicates boot progress to the splash screen. The
splash is disabled once systemd consideres the system fully booted
(progress is at 1.0). Note that this can take a while if systemd is
stuck on a failing unit.

This change adds two systemd services. One service starts psplash itself
(psplash-start.service) and the second service starts the helper utility
psplash-systemd (psplash-systemd.service). The units are written such
that psplash-systemd.service can be used indepenendenly. This is useful
when starting psplash in initramfs (not using systemd).

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
Note that this does *not* move to the very latest version of psplash.
The latest changes from Yann Dirson change how the header files for
the splash logo and progress bar are generated which needs more work
on the recipe side.

In fact, we probably could get rid of most of the logic which generates
the header files in the recipe and make use of the built-in functionality
now. It also would somewhat brake the recipe "API" as we probably would
allow to define header files directly through file:// anymore.

I currently do not plan to work on this.

--
Stefan


 meta/recipes-core/psplash/files/psplash-init  |  8 ++--
 .../psplash/files/psplash-start.service       | 10 +++++
 .../psplash/files/psplash-systemd.service     | 10 +++++
 meta/recipes-core/psplash/psplash_git.bb      | 38 +++++++++++--------
 4 files changed, 47 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-core/psplash/files/psplash-start.service
 create mode 100644 meta/recipes-core/psplash/files/psplash-systemd.service

diff --git a/meta/recipes-core/psplash/files/psplash-init b/meta/recipes-core/psplash/files/psplash-init
index 4bee866b0d..f58e043733 100755
--- a/meta/recipes-core/psplash/files/psplash-init
+++ b/meta/recipes-core/psplash/files/psplash-init
@@ -23,10 +23,10 @@ for x in $CMDLINE; do
         esac
 done
 
-export TMPDIR=/mnt/.psplash
-[ -d $TMPDIR ] || mkdir -p $TMPDIR
-if ! mountpoint -q $TMPDIR; then
-	mount tmpfs -t tmpfs $TMPDIR -o,size=40k
+export PSPLASH_FIFO_DIR=/mnt/.psplash
+[ -d $PSPLASH_FIFO_DIR ] || mkdir -p $PSPLASH_FIFO_DIR
+if ! mountpoint -q $PSPLASH_FIFO_DIR; then
+	mount tmpfs -t tmpfs $PSPLASH_FIFO_DIR -o,size=40k
 fi
 
 rotation=0
diff --git a/meta/recipes-core/psplash/files/psplash-start.service b/meta/recipes-core/psplash/files/psplash-start.service
new file mode 100644
index 0000000000..9de8f6321a
--- /dev/null
+++ b/meta/recipes-core/psplash/files/psplash-start.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Start psplash boot splash screen
+DefaultDependencies=no
+Requires=psplash-systemd.service
+
+[Service]
+ExecStart=/usr/bin/psplash
+
+[Install]
+WantedBy=sysinit.target
diff --git a/meta/recipes-core/psplash/files/psplash-systemd.service b/meta/recipes-core/psplash/files/psplash-systemd.service
new file mode 100644
index 0000000000..e14f42032d
--- /dev/null
+++ b/meta/recipes-core/psplash/files/psplash-systemd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Start psplash-systemd progress communication helper
+DefaultDependencies=no
+After=systemd-start.service
+
+[Service]
+ExecStart=/usr/bin/psplash-systemd
+
+[Install]
+WantedBy=sysinit.target
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 56734c1582..6ff0393194 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -3,14 +3,16 @@ DESCRIPTION = "PSplash is a userspace graphical boot splash screen for mainly em
 HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/psplash"
 SECTION = "base"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=16;md5=840fb2356b10a85bed78dd09dc7745c6"
+LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=8;md5=8f232c1e95929eacab37f00900580224"
 
-SRCREV = "2015f7073e98dd9562db0936a254af5ef56356cf"
+SRCREV = "773a3977d255e8f59a741ad6ce37c4d40f1feaa1"
 PV = "0.1+git${SRCPV}"
 PR = "r15"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN} \
            file://psplash-init \
+           file://psplash-start.service \
+           file://psplash-systemd.service \
            ${SPLASH_IMAGES}"
 UPSTREAM_CHECK_COMMITS = "1"
 
@@ -66,7 +68,11 @@ python __anonymous() {
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig update-rc.d update-alternatives
+inherit autotools pkgconfig update-rc.d update-alternatives systemd
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+
+PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd"
 
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_LINK_NAME[psplash] = "${bindir}/psplash"
@@ -97,8 +103,17 @@ python do_compile () {
 }
 
 do_install_append() {
-	install -d ${D}${sysconfdir}/init.d/
-	install -m 0755 ${WORKDIR}/psplash-init ${D}${sysconfdir}/init.d/psplash.sh
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/init.d/
+		install -m 0755 ${WORKDIR}/psplash-init ${D}${sysconfdir}/init.d/psplash.sh
+	fi
+
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${systemd_unitdir}/system
+		install -m 644 ${WORKDIR}/psplash-start.service ${D}/${systemd_unitdir}/system
+		install -m 644 ${WORKDIR}/psplash-systemd.service ${D}/${systemd_unitdir}/system
+	fi
+
 	install -d ${D}${bindir}
 	for i in ${SPLASH_INSTALL} ; do
 		install -m 0755 $i ${D}${bindir}/$i
@@ -106,15 +121,8 @@ do_install_append() {
 	rm -f ${D}${bindir}/psplash
 }
 
+SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
+SYSTEMD_SERVICE_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'psplash-start.service psplash-systemd.service', '', d)}"
+
 INITSCRIPT_NAME = "psplash.sh"
 INITSCRIPT_PARAMS = "start 0 S . stop 20 0 1 6 ."
-
-PACKAGE_WRITE_DEPS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"
-pkg_postinst_${PN} () {
-	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-		if [ -n "$D" ]; then
-			OPTS="--root=$D"
-		fi
-		systemctl $OPTS mask psplash.service
-	fi
-}
-- 
2.17.1


