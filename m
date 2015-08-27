Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 1155376E09
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 09:12:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id 92D99608F8A
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 11:12:22 +0200
Message-Id: <1440666743-12035-2-git-send-email-andrew.shadura@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440666743-12035-1-git-send-email-andrew.shadura@collabora.co.uk>
References: <1440666743-12035-1-git-send-email-andrew.shadura@collabora.co.uk>
Subject: [PATCH 2/3] dbus: update the recipes to 1.10.0
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
X-List-Received-Date: Thu, 27 Aug 2015 09:12:35 -0000

Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>
---
 meta/recipes-core/dbus/dbus-test_1.10.0.bb      |  61 ++++++++
 meta/recipes-core/dbus/dbus-test_1.8.20.bb      |  61 --------
 meta/recipes-core/dbus/dbus/python-config.patch |  13 +-
 meta/recipes-core/dbus/dbus_1.10.0.bb           | 177 ++++++++++++++++++++++++
 meta/recipes-core/dbus/dbus_1.8.20.bb           | 173 -----------------------
 5 files changed, 245 insertions(+), 240 deletions(-)
 create mode 100644 meta/recipes-core/dbus/dbus-test_1.10.0.bb
 delete mode 100644 meta/recipes-core/dbus/dbus-test_1.8.20.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.10.0.bb
 delete mode 100644 meta/recipes-core/dbus/dbus_1.8.20.bb

diff --git a/meta/recipes-core/dbus/dbus-test_1.10.0.bb b/meta/recipes-core/dbus/dbus-test_1.10.0.bb
new file mode 100644
index 0000000..7dec16e
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-test_1.10.0.bb
@@ -0,0 +1,61 @@
+SUMMARY = "D-Bus test package (for D-bus functionality testing only)"
+HOMEPAGE = "http://dbus.freedesktop.org"
+SECTION = "base"
+LICENSE = "AFL-2 | GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
+                    file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
+
+DEPENDS = "python-pygobject dbus"
+
+RDEPENDS_${PN} += "make"
+RDEPENDS_${PN}-dev = ""
+
+SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
+           file://tmpdir.patch \
+           file://dbus-1.init  \
+           file://run-ptest \
+           file://python-config.patch \
+           file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
+           "
+
+SRC_URI[md5sum] = "5af6297348107a906c8449817a728b3b"
+SRC_URI[sha256sum] = "1dfb9745fb992f1ccd43c920490de8caddf6726a6222e8b803be6098293f924b"
+
+S="${WORKDIR}/dbus-${PV}"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
+
+inherit autotools pkgconfig gettext ptest
+
+EXTRA_OECONF_X = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
+EXTRA_OECONF_X_class-native = "--without-x"
+
+EXTRA_OECONF = "--enable-tests \
+                --enable-modular-tests \
+                --enable-installed-tests \
+                --enable-checks \
+                --enable-asserts \
+                --enable-verbose-mode \
+                --disable-xml-docs \
+                --disable-doxygen-docs \
+                --disable-libaudit \
+                --disable-systemd \
+                --without-systemdsystemunitdir \
+                --with-dbus-test-dir=${PTEST_PATH} \
+                ${EXTRA_OECONF_X}"
+
+do_install() {
+    :
+}
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/test
+	case1="shell printf refs syslog"
+	for i in ${case1}; do install ${B}/test/test-$i ${D}${PTEST_PATH}/test; done
+	case2="marshal syntax corrupt dbus-daemon dbus-daemon-eavesdrop loopback relay"
+	for i in ${case2}; do install ${B}/test/.libs/test-$i ${D}${PTEST_PATH}/test; done
+	case3="bus bus-system bus-launch-helper"
+	for i in ${case3}; do install ${B}/bus/test-$i ${D}${PTEST_PATH}/test; done
+	install ${B}/dbus/test-dbus ${D}${PTEST_PATH}/test
+	cp -r ${B}/test/data ${D}${PTEST_PATH}/test
+}
+RDEPENDS_${PN}-ptest += "bash"
diff --git a/meta/recipes-core/dbus/dbus-test_1.8.20.bb b/meta/recipes-core/dbus/dbus-test_1.8.20.bb
deleted file mode 100644
index 704070b..0000000
--- a/meta/recipes-core/dbus/dbus-test_1.8.20.bb
+++ /dev/null
@@ -1,61 +0,0 @@
-SUMMARY = "D-Bus test package (for D-bus functionality testing only)"
-HOMEPAGE = "http://dbus.freedesktop.org"
-SECTION = "base"
-LICENSE = "AFL-2 | GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
-                    file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
-
-DEPENDS = "python-pygobject dbus dbus-glib"
-
-RDEPENDS_${PN} += "make"
-RDEPENDS_${PN}-dev = ""
-
-SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
-           file://tmpdir.patch \
-           file://dbus-1.init  \
-           file://run-ptest \
-           file://python-config.patch \
-           file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
-           "
-
-SRC_URI[md5sum] = "b49890bbabedab3a1c3f4f73c7ff8b2b"
-SRC_URI[sha256sum] = "5c4fbf4c64621c96e871da91d2b729a5b00536e116d3c4612a469d924b1b703a"
-
-S="${WORKDIR}/dbus-${PV}"
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
-
-inherit autotools pkgconfig gettext ptest
-
-EXTRA_OECONF_X = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
-EXTRA_OECONF_X_class-native = "--without-x"
-
-EXTRA_OECONF = "--enable-tests \
-                --enable-modular-tests \
-                --enable-installed-tests \
-                --enable-checks \
-                --enable-asserts \
-                --enable-verbose-mode \
-                --disable-xml-docs \
-                --disable-doxygen-docs \
-                --disable-libaudit \
-                --disable-systemd \
-                --without-systemdsystemunitdir \
-                --with-dbus-test-dir=${PTEST_PATH} \
-                ${EXTRA_OECONF_X}"
-
-do_install() {
-    :
-}
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/test
-	case1="shell printf refs syslog"
-	for i in ${case1}; do install ${B}/test/test-$i ${D}${PTEST_PATH}/test; done
-	case2="marshal syntax corrupt dbus-daemon dbus-daemon-eavesdrop loopback relay"
-	for i in ${case2}; do install ${B}/test/.libs/test-$i ${D}${PTEST_PATH}/test; done
-	case3="bus bus-system bus-launch-helper"
-	for i in ${case3}; do install ${B}/bus/test-$i ${D}${PTEST_PATH}/test; done
-	install ${B}/dbus/test-dbus ${D}${PTEST_PATH}/test
-	cp -r ${B}/test/data ${D}${PTEST_PATH}/test
-}
-RDEPENDS_${PN}-ptest += "bash"
diff --git a/meta/recipes-core/dbus/dbus/python-config.patch b/meta/recipes-core/dbus/dbus/python-config.patch
index 2944002..fbb4ede 100644
--- a/meta/recipes-core/dbus/dbus/python-config.patch
+++ b/meta/recipes-core/dbus/dbus/python-config.patch
@@ -6,19 +6,20 @@ Disable the python module check for cross compiling.
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>
 
---- dbus-1.6.8/configure.ac.orig	2013-07-11 14:15:58.834554799 -0500
-+++ dbus-1.6.8/configure.ac	2013-07-11 14:14:40.969554848 -0500
-@@ -257,13 +257,6 @@
+--- a/configure.ac
++++ b/configure.ac
+@@ -267,13 +267,6 @@
    # full test coverage is required, Python is a hard dependency
-   AC_MSG_NOTICE([Full test coverage (--enable-tests=yes) requires Python, dbus-python, pygobject])
+   AC_MSG_NOTICE([Full test coverage (--enable-tests=yes) requires Python, dbus-python, pygi])
    AM_PATH_PYTHON([2.6])
 -  AC_MSG_CHECKING([for Python modules for full test coverage])
--  if "$PYTHON" -c "import dbus, gobject, dbus.mainloop.glib"; then
+-  if "$PYTHON" -c "import dbus, gi.repository.GObject, dbus.mainloop.glib"; then
 -    AC_MSG_RESULT([yes])
 -  else
 -    AC_MSG_RESULT([no])
--    AC_MSG_ERROR([cannot import dbus, gobject, dbus.mainloop.glib Python modules])
+-    AC_MSG_ERROR([cannot import dbus, gi.repository.GObject, dbus.mainloop.glib Python modules])
 -  fi
  else
    # --enable-tests not given: do not abort if Python is missing
diff --git a/meta/recipes-core/dbus/dbus_1.10.0.bb b/meta/recipes-core/dbus/dbus_1.10.0.bb
new file mode 100644
index 0000000..cbfdf05
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus_1.10.0.bb
@@ -0,0 +1,177 @@
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
+"
+
+SRC_URI[md5sum] = "5af6297348107a906c8449817a728b3b"
+SRC_URI[sha256sum] = "1dfb9745fb992f1ccd43c920490de8caddf6726a6222e8b803be6098293f924b"
+
+inherit useradd autotools pkgconfig gettext update-rc.d
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
+               ${systemd_unitdir}/system/"
+FILES_${PN}-lib = "${libdir}/lib*.so.*"
+RRECOMMENDS_${PN}-lib = "${PN}"
+FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool ${bindir}/dbus-test-tool"
+
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
+                --disable-systemd"
+
+EXTRA_OECONF_append_class-native = " --disable-selinux"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG_class-native = ""
+PACKAGECONFIG_class-nativesdk = ""
+
+# Would like to --enable-systemd but that's a circular build-dependency between
+# systemd<->dbus
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir"
+PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
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
+			install -d ${D}${systemd_unitdir}/system/$i; done
+		install -m 0644 ${B}/bus/dbus.service ${B}/bus/dbus.socket ${D}${systemd_unitdir}/system/
+		cd ${D}${systemd_unitdir}/system/dbus.target.wants/
+		ln -fs ../dbus.socket ${D}${systemd_unitdir}/system/dbus.target.wants/dbus.socket
+		ln -fs ../dbus.socket ${D}${systemd_unitdir}/system/sockets.target.wants/dbus.socket
+		ln -fs ../dbus.service ${D}${systemd_unitdir}/system/multi-user.target.wants/dbus.service
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
diff --git a/meta/recipes-core/dbus/dbus_1.8.20.bb b/meta/recipes-core/dbus/dbus_1.8.20.bb
deleted file mode 100644
index 207a018..0000000
--- a/meta/recipes-core/dbus/dbus_1.8.20.bb
+++ /dev/null
@@ -1,173 +0,0 @@
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
-"
-
-SRC_URI[md5sum] = "b49890bbabedab3a1c3f4f73c7ff8b2b"
-SRC_URI[sha256sum] = "5c4fbf4c64621c96e871da91d2b729a5b00536e116d3c4612a469d924b1b703a"
-
-inherit useradd autotools pkgconfig gettext update-rc.d
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
-               ${libexecdir}/dbus* \
-               ${sysconfdir} \
-               ${localstatedir} \
-               ${datadir}/dbus-1/services \
-               ${datadir}/dbus-1/system-services \
-               ${systemd_unitdir}/system/"
-FILES_${PN}-lib = "${libdir}/lib*.so.*"
-RRECOMMENDS_${PN}-lib = "${PN}"
-FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
-
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
-                --disable-systemd \
-                --without-dbus-glib"
-
-EXTRA_OECONF_append_class-native = " --disable-selinux"
-
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-PACKAGECONFIG_class-native = ""
-PACKAGECONFIG_class-nativesdk = ""
-
-# Would like to --enable-systemd but that's a circular build-dependency between
-# systemd<->dbus
-PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir"
-PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
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
-			install -d ${D}${systemd_unitdir}/system/$i; done
-		install -m 0644 ${B}/bus/dbus.service ${B}/bus/dbus.socket ${D}${systemd_unitdir}/system/
-		cd ${D}${systemd_unitdir}/system/dbus.target.wants/
-		ln -fs ../dbus.socket ${D}${systemd_unitdir}/system/dbus.target.wants/dbus.socket
-		ln -fs ../dbus.socket ${D}${systemd_unitdir}/system/sockets.target.wants/dbus.socket
-		ln -fs ../dbus.service ${D}${systemd_unitdir}/system/multi-user.target.wants/dbus.service
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
-- 
2.1.4


