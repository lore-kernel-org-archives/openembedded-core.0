Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym01.jp.fujitsu.com (mgwym01.jp.fujitsu.com [211.128.242.40])
	by mail.openembedded.org (Postfix) with ESMTP id B199F77AE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 07:46:47 +0000 (UTC)
Received: from yt-mxauth.gw.nic.fujitsu.com (unknown [192.168.229.68]) by
	mgwym01.jp.fujitsu.com with smtp
	id 1d74_7718_82f4819b_3300_46a6_bf8a_4ac14290152a;
	Thu, 21 Sep 2017 16:46:45 +0900
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local
	(g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
	by yt-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id 4943FAC0214
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 16:46:44 +0900 (JST)
Received: from G01JPEXCHKW18.g01.fujitsu.local
	(G01JPEXCHKW18.g01.fujitsu.local [10.0.194.57])
	by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	13315BD6840 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 16:46:43 +0900 (JST)
Received: from localhost.localdomain (10.54.205.122) by
	G01JPEXCHKW18.g01.fujitsu.local (10.0.194.57) with Microsoft SMTP
	Server id 14.3.352.0; Thu, 21 Sep 2017 16:46:42 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Sep 2017 16:46:40 +0900
Message-ID: <1505980000-17996-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] dbus: 1.10.20 -> 1.10.22
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
X-List-Received-Date: Thu, 21 Sep 2017 07:46:48 -0000
Content-Type: text/plain

Upgrade dbus from 1.10.20 to 1.10.22

Signed-off-by: fan.xin@jp.fujitsu.com
---
 meta/recipes-core/dbus/dbus_1.10.20.bb | 180 ---------------------------------
 meta/recipes-core/dbus/dbus_1.10.22.bb | 180 +++++++++++++++++++++++++++++++++
 2 files changed, 180 insertions(+), 180 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus_1.10.20.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.10.22.bb

diff --git a/meta/recipes-core/dbus/dbus_1.10.20.bb b/meta/recipes-core/dbus/dbus_1.10.20.bb
deleted file mode 100644
index 9ddedc1..0000000
--- a/meta/recipes-core/dbus/dbus_1.10.20.bb
+++ /dev/null
@@ -1,180 +0,0 @@
-SUMMARY = "D-Bus message bus"
-DESCRIPTION = "D-Bus is a message bus system, a simple way for applications to talk to one another. In addition to interprocess communication, D-Bus helps coordinate process lifecycle; it makes it simple and reliable to code a \"single instance\" application or daemon, and to launch applications and daemons on demand when their services are needed."
-HOMEPAGE = "http://dbus.freedesktop.org"
-SECTION = "base"
-LICENSE = "AFL-2 | GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
-                    file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
-DEPENDS = "expat virtual/libintl"
-RDEPENDS_dbus_class-native = ""
-RDEPENDS_dbus_class-nativesdk = ""
-PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest', '', d)}"
-ALLOW_EMPTY_dbus-ptest = "1"
-RDEPENDS_dbus-ptest_class-target = "dbus-test-ptest"
-
-SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
-           file://tmpdir.patch \
-           file://dbus-1.init \
-           file://os-test.patch \
-           file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
-           file://0001-configure.ac-explicitely-check-stdint.h.patch \
-"
-
-SRC_URI[md5sum] = "94c991e763d4f9f13690416b2dcd9411"
-SRC_URI[sha256sum] = "e574b9780b5425fde4d973bb596e7ea0f09e00fe2edd662da9016e976c460b48"
-
-inherit useradd autotools pkgconfig gettext update-rc.d upstream-version-is-even
-
-INITSCRIPT_NAME = "dbus-1"
-INITSCRIPT_PARAMS = "start 02 5 3 2 . stop 20 0 1 6 ."
-
-python __anonymous() {
-    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
-        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
-}
-
-USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM_${PN} = "-r netdev"
-USERADD_PARAM_${PN} = "--system --home ${localstatedir}/lib/dbus \
-                       --no-create-home --shell /bin/false \
-                       --user-group messagebus"
-
-CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session.conf"
-
-DEBIANNAME_${PN} = "dbus-1"
-
-PACKAGES =+ "${PN}-lib"
-
-OLDPKGNAME = "dbus-x11"
-OLDPKGNAME_class-nativesdk = ""
-
-# for compatibility
-RPROVIDES_${PN} = "${OLDPKGNAME}"
-RREPLACES_${PN} += "${OLDPKGNAME}"
-
-FILES_${PN} = "${bindir}/dbus-daemon* \
-               ${bindir}/dbus-uuidgen \
-               ${bindir}/dbus-cleanup-sockets \
-               ${bindir}/dbus-send \
-               ${bindir}/dbus-monitor \
-               ${bindir}/dbus-launch \
-               ${bindir}/dbus-run-session \
-               ${bindir}/dbus-update-activation-environment \
-               ${libexecdir}/dbus* \
-               ${sysconfdir} \
-               ${localstatedir} \
-               ${datadir}/dbus-1/services \
-               ${datadir}/dbus-1/system-services \
-               ${datadir}/dbus-1/session.d \
-               ${datadir}/dbus-1/session.conf \
-               ${datadir}/dbus-1/system.d \
-               ${datadir}/dbus-1/system.conf \
-               ${systemd_system_unitdir} \
-               ${systemd_user_unitdir} \
-"
-FILES_${PN}-lib = "${libdir}/lib*.so.*"
-RRECOMMENDS_${PN}-lib = "${PN}"
-FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-test-tool"
-
-PACKAGE_WRITE_DEPS += "${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','systemd-systemctl-native','',d)}"
-pkg_postinst_dbus() {
-	# If both systemd and sysvinit are enabled, mask the dbus-1 init script
-        if ${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','true','false',d)}; then
-		if [ -n "$D" ]; then
-			OPTS="--root=$D"
-		fi
-		systemctl $OPTS mask dbus-1.service
-	fi
-
-	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
-		/etc/init.d/populate-volatile.sh update
-	fi
-}
-
-EXTRA_OECONF = "--disable-tests \
-                --disable-xml-docs \
-                --disable-doxygen-docs \
-                --disable-libaudit \
-                --enable-largefile \
-                "
-
-EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
-EXTRA_OECONF_append_class-native = " --disable-selinux"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)}"
-PACKAGECONFIG_class-native = ""
-PACKAGECONFIG_class-nativesdk = ""
-
-PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd --without-systemdsystemunitdir,systemd"
-PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
-PACKAGECONFIG[user-session] = "--enable-user-session --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
-
-do_install() {
-	autotools_do_install
-
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-		install -d ${D}${sysconfdir}/init.d
-		sed 's:@bindir@:${bindir}:' < ${WORKDIR}/dbus-1.init >${WORKDIR}/dbus-1.init.sh
-		install -m 0755 ${WORKDIR}/dbus-1.init.sh ${D}${sysconfdir}/init.d/dbus-1
-	fi
-
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-		for i in dbus.target.wants sockets.target.wants multi-user.target.wants; do \
-			install -d ${D}${systemd_system_unitdir}/$i; done
-		install -m 0644 ${B}/bus/dbus.service ${B}/bus/dbus.socket ${D}${systemd_system_unitdir}/
-		ln -fs ../dbus.socket ${D}${systemd_system_unitdir}/dbus.target.wants/dbus.socket
-		ln -fs ../dbus.socket ${D}${systemd_system_unitdir}/sockets.target.wants/dbus.socket
-		ln -fs ../dbus.service ${D}${systemd_system_unitdir}/multi-user.target.wants/dbus.service
-	fi
-
-	install -d ${D}${sysconfdir}/default/volatiles
-	echo "d messagebus messagebus 0755 ${localstatedir}/run/dbus none" \
-	     > ${D}${sysconfdir}/default/volatiles/99_dbus
-
-
-	mkdir -p ${D}${localstatedir}/lib/dbus
-
-	chown messagebus:messagebus ${D}${localstatedir}/lib/dbus
-
-	chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-helper
-	chmod 4755 ${D}${libexecdir}/dbus-daemon-launch-helper
-
-	# Remove Red Hat initscript
-	rm -rf ${D}${sysconfdir}/rc.d
-
-	# Remove empty testexec directory as we don't build tests
-	rm -rf ${D}${libdir}/dbus-1.0/test
-
-	# Remove /var/run as it is created on startup
-	rm -rf ${D}${localstatedir}/run
-}
-
-do_install_class-native() {
-	autotools_do_install
-
-	# for dbus-glib-native introspection generation
-	install -d ${D}${STAGING_DATADIR_NATIVE}/dbus/
-	# N.B. is below install actually required?
-	install -m 0644 bus/session.conf ${D}${STAGING_DATADIR_NATIVE}/dbus/session.conf
-
-	# dbus-glib-native and dbus-glib need this xml file
-	./bus/dbus-daemon --introspect > ${D}${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml
-	
-	# dbus-launch has no X support so lets not install it in case the host
-	# has a more featured and useful version
-	rm -f ${D}${bindir}/dbus-launch
-}
-
-do_install_class-nativesdk() {
-	autotools_do_install
-
-	# dbus-launch has no X support so lets not install it in case the host
-	# has a more featured and useful version
-	rm -f ${D}${bindir}/dbus-launch
-
-	# Remove /var/run to avoid QA error
-	rm -rf ${D}${localstatedir}/run
-}
-BBCLASSEXTEND = "native nativesdk"
-
-INSANE_SKIP_${PN}-ptest += "build-deps"
diff --git a/meta/recipes-core/dbus/dbus_1.10.22.bb b/meta/recipes-core/dbus/dbus_1.10.22.bb
new file mode 100644
index 0000000..370e4b2
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus_1.10.22.bb
@@ -0,0 +1,180 @@
+SUMMARY = "D-Bus message bus"
+DESCRIPTION = "D-Bus is a message bus system, a simple way for applications to talk to one another. In addition to interprocess communication, D-Bus helps coordinate process lifecycle; it makes it simple and reliable to code a \"single instance\" application or daemon, and to launch applications and daemons on demand when their services are needed."
+HOMEPAGE = "http://dbus.freedesktop.org"
+SECTION = "base"
+LICENSE = "AFL-2 | GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
+                    file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
+DEPENDS = "expat virtual/libintl"
+RDEPENDS_dbus_class-native = ""
+RDEPENDS_dbus_class-nativesdk = ""
+PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest', '', d)}"
+ALLOW_EMPTY_dbus-ptest = "1"
+RDEPENDS_dbus-ptest_class-target = "dbus-test-ptest"
+
+SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
+           file://tmpdir.patch \
+           file://dbus-1.init \
+           file://os-test.patch \
+           file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
+           file://0001-configure.ac-explicitely-check-stdint.h.patch \
+"
+
+SRC_URI[md5sum] = "baaa10b7cb49086ad91179a8decfadc5"
+SRC_URI[sha256sum] = "e2b1401e3eedc7b5c9a2034d31254c886e1fcbc7858006e0a1c59158fe4b7b97"
+
+inherit useradd autotools pkgconfig gettext update-rc.d upstream-version-is-even
+
+INITSCRIPT_NAME = "dbus-1"
+INITSCRIPT_PARAMS = "start 02 5 3 2 . stop 20 0 1 6 ."
+
+python __anonymous() {
+    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+}
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "-r netdev"
+USERADD_PARAM_${PN} = "--system --home ${localstatedir}/lib/dbus \
+                       --no-create-home --shell /bin/false \
+                       --user-group messagebus"
+
+CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session.conf"
+
+DEBIANNAME_${PN} = "dbus-1"
+
+PACKAGES =+ "${PN}-lib"
+
+OLDPKGNAME = "dbus-x11"
+OLDPKGNAME_class-nativesdk = ""
+
+# for compatibility
+RPROVIDES_${PN} = "${OLDPKGNAME}"
+RREPLACES_${PN} += "${OLDPKGNAME}"
+
+FILES_${PN} = "${bindir}/dbus-daemon* \
+               ${bindir}/dbus-uuidgen \
+               ${bindir}/dbus-cleanup-sockets \
+               ${bindir}/dbus-send \
+               ${bindir}/dbus-monitor \
+               ${bindir}/dbus-launch \
+               ${bindir}/dbus-run-session \
+               ${bindir}/dbus-update-activation-environment \
+               ${libexecdir}/dbus* \
+               ${sysconfdir} \
+               ${localstatedir} \
+               ${datadir}/dbus-1/services \
+               ${datadir}/dbus-1/system-services \
+               ${datadir}/dbus-1/session.d \
+               ${datadir}/dbus-1/session.conf \
+               ${datadir}/dbus-1/system.d \
+               ${datadir}/dbus-1/system.conf \
+               ${systemd_system_unitdir} \
+               ${systemd_user_unitdir} \
+"
+FILES_${PN}-lib = "${libdir}/lib*.so.*"
+RRECOMMENDS_${PN}-lib = "${PN}"
+FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-test-tool"
+
+PACKAGE_WRITE_DEPS += "${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','systemd-systemctl-native','',d)}"
+pkg_postinst_dbus() {
+	# If both systemd and sysvinit are enabled, mask the dbus-1 init script
+        if ${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','true','false',d)}; then
+		if [ -n "$D" ]; then
+			OPTS="--root=$D"
+		fi
+		systemctl $OPTS mask dbus-1.service
+	fi
+
+	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
+		/etc/init.d/populate-volatile.sh update
+	fi
+}
+
+EXTRA_OECONF = "--disable-tests \
+                --disable-xml-docs \
+                --disable-doxygen-docs \
+                --disable-libaudit \
+                --enable-largefile \
+                "
+
+EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
+EXTRA_OECONF_append_class-native = " --disable-selinux"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)}"
+PACKAGECONFIG_class-native = ""
+PACKAGECONFIG_class-nativesdk = ""
+
+PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd --without-systemdsystemunitdir,systemd"
+PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
+PACKAGECONFIG[user-session] = "--enable-user-session --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
+
+do_install() {
+	autotools_do_install
+
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/init.d
+		sed 's:@bindir@:${bindir}:' < ${WORKDIR}/dbus-1.init >${WORKDIR}/dbus-1.init.sh
+		install -m 0755 ${WORKDIR}/dbus-1.init.sh ${D}${sysconfdir}/init.d/dbus-1
+	fi
+
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		for i in dbus.target.wants sockets.target.wants multi-user.target.wants; do \
+			install -d ${D}${systemd_system_unitdir}/$i; done
+		install -m 0644 ${B}/bus/dbus.service ${B}/bus/dbus.socket ${D}${systemd_system_unitdir}/
+		ln -fs ../dbus.socket ${D}${systemd_system_unitdir}/dbus.target.wants/dbus.socket
+		ln -fs ../dbus.socket ${D}${systemd_system_unitdir}/sockets.target.wants/dbus.socket
+		ln -fs ../dbus.service ${D}${systemd_system_unitdir}/multi-user.target.wants/dbus.service
+	fi
+
+	install -d ${D}${sysconfdir}/default/volatiles
+	echo "d messagebus messagebus 0755 ${localstatedir}/run/dbus none" \
+	     > ${D}${sysconfdir}/default/volatiles/99_dbus
+
+
+	mkdir -p ${D}${localstatedir}/lib/dbus
+
+	chown messagebus:messagebus ${D}${localstatedir}/lib/dbus
+
+	chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-helper
+	chmod 4755 ${D}${libexecdir}/dbus-daemon-launch-helper
+
+	# Remove Red Hat initscript
+	rm -rf ${D}${sysconfdir}/rc.d
+
+	# Remove empty testexec directory as we don't build tests
+	rm -rf ${D}${libdir}/dbus-1.0/test
+
+	# Remove /var/run as it is created on startup
+	rm -rf ${D}${localstatedir}/run
+}
+
+do_install_class-native() {
+	autotools_do_install
+
+	# for dbus-glib-native introspection generation
+	install -d ${D}${STAGING_DATADIR_NATIVE}/dbus/
+	# N.B. is below install actually required?
+	install -m 0644 bus/session.conf ${D}${STAGING_DATADIR_NATIVE}/dbus/session.conf
+
+	# dbus-glib-native and dbus-glib need this xml file
+	./bus/dbus-daemon --introspect > ${D}${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml
+	
+	# dbus-launch has no X support so lets not install it in case the host
+	# has a more featured and useful version
+	rm -f ${D}${bindir}/dbus-launch
+}
+
+do_install_class-nativesdk() {
+	autotools_do_install
+
+	# dbus-launch has no X support so lets not install it in case the host
+	# has a more featured and useful version
+	rm -f ${D}${bindir}/dbus-launch
+
+	# Remove /var/run to avoid QA error
+	rm -rf ${D}${localstatedir}/run
+}
+BBCLASSEXTEND = "native nativesdk"
+
+INSANE_SKIP_${PN}-ptest += "build-deps"
-- 
2.7.4



