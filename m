Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RK6dC-00084T-02
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Oct 2011 12:59:18 +0200
Received: by faas16 with SMTP id s16so4810315faa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2011 03:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=pZHMe/ptfYM+n7sZ8bMM7nIyGpRTTGRDDUQfM4OpBjk=;
	b=NfC5969F9RJuv0QzQYNYm1OiXyKf86OqLwPlk3yLIsPHYaQ07jdU2sj0U+bBcK2Ijf
	7WQBDxdIzz+EHwyu+LY/DsrCYV/DOriZTGCiy1qZqMB38EHV6YmkPmoWjQ0Xd97Hw1Nb
	mbA0gCjG+j6FPZ/qvNZc3FgALjeyqJ0BLWjUw=
Received: by 10.223.91.68 with SMTP id l4mr13084513fam.16.1319885595765;
	Sat, 29 Oct 2011 03:53:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x19sm15841609fag.5.2011.10.29.03.53.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Oct 2011 03:53:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Oct 2011 12:53:08 +0200
Message-Id: <1319885588-5947-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <20111028205842.GA17752@gonzales.palutemo>
References: <20111028205842.GA17752@gonzales.palutemo>
Subject: [PATCH] dbus: add work around to set right owner in postinst
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
X-List-Received-Date: Sat, 29 Oct 2011 10:59:18 -0000

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

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/dbus/dbus.inc |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 2a97c02..b862bb4 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -10,7 +10,7 @@ DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X
 DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
 DEPENDS_virtclass-nativesdk = "expat-nativesdk virtual/libintl-nativesdk virtual/libx11"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch; \
@@ -51,9 +51,14 @@ RRECOMMENDS_${PN}-lib = "${PN}"
 FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
 
 pkg_postinst_dbus() {
-	if [ -z "${D}" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
+	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
 		/etc/init.d/populate-volatile.sh update
 	fi
+	if [ -z "$D" ] ; then
+		chown messagebus:messagebus ${localstatedir}/run/dbus ${localstatedir}/lib/dbus
+		chown root:messagebus ${libexecdir}/dbus-daemon-launch-helper
+		chmod 4754 ${libexecdir}/dbus-daemon-launch-helper
+	fi
 }
 
 EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
-- 
1.7.7.1



