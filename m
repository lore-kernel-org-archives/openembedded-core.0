Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RKvzl-0002Jw-5B
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 18:50:01 +0100
Received: by faas16 with SMTP id s16so6406773faa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 10:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=0egRY++2mQzipWm0OuLzufnipA7/bxxBDXomCq36GWM=;
	b=cE+cGuE20hbPTi0LqwEkLDJlHsf+66cmqMHCgHYH967+5NSJkEz6AOjrCBvLPXbBdp
	iZYUdebG7qbSkRE6cOGaW20S2MEwdu+1kmBVtDH1Xnff2mrHlbfo2uhGbQyTrpNLcIAq
	77JV+k3Pt3H7GPk3eb0Z0sRZgVRu9IRjfZp7c=
Received: by 10.223.15.10 with SMTP id i10mr30608524faa.17.1320083035526;
	Mon, 31 Oct 2011 10:43:55 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l26sm26640374fad.17.2011.10.31.10.43.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Oct 2011 10:43:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2011 18:43:46 +0100
Message-Id: <1320083026-31637-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <1319885588-5947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1319885588-5947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2] dbus: fix for right owner in postinst
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
X-List-Received-Date: Mon, 31 Oct 2011 17:50:01 -0000

* even when I see right chown/chmod in log.do_install, files are still
  owned by bitbake:bitbake (user running bitbake) and we need to fix it on target
$ tail -n 4 temp/log.do_install.27768
+ chown messagebus:messagebus /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/var/run/dbus /OE/shr-core/tmp/work/armv7a-vfp-neon-o
e-linux-gnueabi/dbus-1.4.12-r2/image/var/lib/dbus
+ chown root:messagebus /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/usr/libexec/dbus-daemon-launch-helper
+ chmod 4754 /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/usr/libexec/dbus-daemon-launch-helper
+ ln -sf /dev/null /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image//lib/systemd/system/dbus-1.service

$ ll -d /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/var/run/dbus \
  /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/var/lib/dbus \
  /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/usr/libexec/dbus-daemon-launch-helper \
 /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/usr/libexec/dbus-daemon-launch-helper
-rwsr-xr-- 1 bitbake bitbake 819869 Oct 29 12:35 /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/usr/libexec/dbus-daemon-launch-he
lper*
-rwsr-xr-- 1 bitbake bitbake 819869 Oct 29 12:35 /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/usr/libexec/dbus-daemon-launch-he
lper*
drwxr-xr-x 2 bitbake bitbake   4096 Oct 29 12:35 /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/var/lib/dbus/
drwxr-xr-x 2 bitbake bitbake   4096 Oct 29 12:35 /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image/var/run/dbus/

* and we _cannot_ use ${D} in postinst script because it get's expanded
  before including postinst file to ipk's control.tar.gz
  and on target I see something like this:
  if [ -z "/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/image" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
  which is wrong $D without {} works

* V2: updated with Otavio version to fix it also for do_rootfs

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/dbus/dbus.inc |   12 +++++-------
 1 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 2a97c02..a72407c 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -10,7 +10,7 @@ DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X
 DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
 DEPENDS_virtclass-nativesdk = "expat-nativesdk virtual/libintl-nativesdk virtual/libx11"
 
-PR = "r1"
+PR = "r3"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch; \
@@ -51,9 +51,12 @@ RRECOMMENDS_${PN}-lib = "${PN}"
 FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
 
 pkg_postinst_dbus() {
-	if [ -z "${D}" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
+	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
 		/etc/init.d/populate-volatile.sh update
 	fi
+	chown messagebus:messagebus $D${localstatedir}/run/dbus $D${localstatedir}/lib/dbus
+	chown root:messagebus $D${libexecdir}/dbus-daemon-launch-helper
+	chmod 4754 $D${libexecdir}/dbus-daemon-launch-helper
 }
 
 EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
@@ -81,11 +84,6 @@ do_install() {
 
 	mkdir -p ${D}${localstatedir}/run/dbus ${D}${localstatedir}/lib/dbus
 
-	chown messagebus:messagebus ${D}${localstatedir}/run/dbus ${D}${localstatedir}/lib/dbus
-
-	chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-helper
-	chmod 4754 ${D}${libexecdir}/dbus-daemon-launch-helper
-
 	# disable dbus-1 sysv script on systemd installs
 	# nearly all distros call the initscript plain 'dbus', but OE-core is different
 	ln -sf /dev/null ${D}/${base_libdir}/systemd/system/dbus-1.service
-- 
1.7.7.1



