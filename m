Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TwhSw-0007e4-5b
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 00:04:46 +0100
Received: from mail-wg0-f72.google.com ([74.125.82.72])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 19 Jan 2013 14:49:18 -0800
Received: by mail-wg0-f72.google.com with SMTP id fg15so5235534wgb.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 14:49:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=evj2du2e9WjsiyeayOoYKI0OY7B+LahdDyDgnS8UvnI=;
	b=FtLv06/yq/7bzRD1ExLd888ou9VpWoMeD9kAAjFQ7qzKHm9GmNNsK0hfIFlUNLbCMi
	+ZhXnBBU+Dch28dYh5utekIZ/Szb6tw67M8NOLgp1PwfABVANUXszhAruj6BzbBdR5FG
	fEeXsQYegAP35L5bV7VNkkSJsMUGsJvs8KkFAqCFaZ84F/OOGz+M2ZlzHzA0TLBICZeF
	bGT0XJSM2K4zKwO5uo2/uVY7bLoCDmFE77qnDQGutXD8VHr0mSx1lhtxv89NH81clofj
	B3c/SMtaMhkvDuNtPMeZVTu2MeXAy3jjam/BC036JrsIeKpm/FL56YpvA6hI/oFMByQ1
	HLVw==
X-Received: by 10.194.20.231 with SMTP id q7mr19991295wje.44.1358635756675;
	Sat, 19 Jan 2013 14:49:16 -0800 (PST)
X-Received: by 10.194.20.231 with SMTP id q7mr19991291wje.44.1358635756605;
	Sat, 19 Jan 2013 14:49:16 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id p2sm10967931wic.7.2013.01.19.14.49.15
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 14:49:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2013 22:47:06 +0000
Message-Id: <ae25b75af351676b7866215d07359fb602a953b8.1358635193.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358635193.git.ross.burton@intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
In-Reply-To: <cover.1358635193.git.ross.burton@intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnZpUDzVIucaCeROoHx9f4eevflTTG9HzhgXLGZt47QRlqg355+vGHF5GpLn1pFyUbBdOQur3+T90qoldeefJ7yJ4rj8cDJHkOo7lMSfrSocHyGX16N/wA8TN0pDbHlLlW3orc3462/fteWk940YrAAyZBD6aKuVdHIv4+JinU61WjE/t49dgoploO8Fpz39TDjHcd+
Subject: [PATCH 03/10] dbus: respect systemd distro feature
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
X-List-Received-Date: Sat, 19 Jan 2013 23:04:46 -0000

Only configure for systemd if we are using systemd, and remove the dbus-systemd
package by putting the service files into PN itself.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/dbus/dbus.inc |   27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index bcc5b6b..88218b7 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -33,7 +33,7 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
 
 DEBIANNAME_${PN} = "dbus-1"
 
-PACKAGES =+ "${PN}-lib ${PN}-systemd"
+PACKAGES =+ "${PN}-lib"
 
 OLDPKGNAME = "dbus-x11"
 OLDPKGNAME_class-nativesdk = ""
@@ -42,8 +42,6 @@ OLDPKGNAME_class-nativesdk = ""
 RPROVIDES_${PN} = "${OLDPKGNAME}"
 RREPLACES_${PN} += "${OLDPKGNAME}"
 
-FILES_${PN}-systemd = "${systemd_unitdir}/system/"
-
 FILES_${PN} = "${bindir}/dbus-daemon* \
                ${bindir}/dbus-uuidgen \
                ${bindir}/dbus-cleanup-sockets \
@@ -54,7 +52,8 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
                ${sysconfdir} \
                ${localstatedir} \
                ${datadir}/dbus-1/services \
-               ${datadir}/dbus-1/system-services"
+               ${datadir}/dbus-1/system-services \
+               ${systemd_unitdir}/system/"
 FILES_${PN}-lib = "${libdir}/lib*.so.*"
 RRECOMMENDS_${PN}-lib = "${PN}"
 FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
@@ -67,6 +66,9 @@ pkg_postinst_dbus() {
 
 EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
 EXTRA_OECONF_X_class-native = "--without-x --disable-x11-autolaunch"
+# TODO: would like to --enable-systemd but that's a circular build-dependency
+# between systemd <->dbus
+EXTRA_OECONF_SYSTEMD = "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '', d)}"
 
 EXTRA_OECONF = "--disable-tests \
                 --disable-checks \
@@ -74,15 +76,18 @@ EXTRA_OECONF = "--disable-tests \
                 --disable-doxygen-docs \
                 --disable-libaudit \
                 --with-xml=expat \
-                --with-systemdsystemunitdir=${systemd_unitdir}/system/ \
+                --disable-systemd \
+                ${EXTRA_OECONF_SYSTEMD} \
                 ${EXTRA_OECONF_X}"
 
 do_install() {
 	autotools_do_install
 
-	install -d ${D}${sysconfdir}/init.d
-	sed 's:@bindir@:${bindir}:' < ${WORKDIR}/dbus-1.init >${WORKDIR}/dbus-1.init.sh
-	install -m 0755 ${WORKDIR}/dbus-1.init.sh ${D}${sysconfdir}/init.d/dbus-1
+	if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/init.d
+		sed 's:@bindir@:${bindir}:' < ${WORKDIR}/dbus-1.init >${WORKDIR}/dbus-1.init.sh
+		install -m 0755 ${WORKDIR}/dbus-1.init.sh ${D}${sysconfdir}/init.d/dbus-1
+	fi
 
 	install -d ${D}${sysconfdir}/default/volatiles
 	echo "d messagebus messagebus 0755 ${localstatedir}/run/dbus none" \
@@ -101,10 +106,6 @@ do_install() {
 
 	# Remove empty testexec directory as we don't build tests
 	rm -rf ${D}${libdir}/dbus-1.0/test
-
-	# disable dbus-1 sysv script on systemd installs
-	# nearly all distros call the initscript plain 'dbus', but OE-core is different
-	ln -sf /dev/null ${D}/${systemd_unitdir}/system/dbus-1.service
 }
 
 do_install_class-native() {
@@ -114,7 +115,7 @@ do_install_class-native() {
 	install -d ${STAGING_DATADIR_NATIVE}/dbus/
 	# N.B. is below install actually required?
 	install -m 0644 bus/session.conf ${STAGING_DATADIR_NATIVE}/dbus/session.conf
-	
+
 	# dbus-glib-native and dbus-glib need this xml file
 	./bus/dbus-daemon --introspect > ${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml
 }
-- 
1.7.10.4



