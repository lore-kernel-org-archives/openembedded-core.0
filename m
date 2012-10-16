Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.ferland@gmail.com>) id 1TOFBv-0001hE-Pc
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 00:00:48 +0200
Received: by mail-qc0-f175.google.com with SMTP id j3so5491369qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2012 14:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=v38pAQMume4ewfQPkOv3l2AF17mEv7riPlxIv2Oxmk0=;
	b=om0lpRMTN8i5v4kPvQC7IUcdeB6w52rTNYYFz/j0JYVqCZ8rVYgovaY6u9NZqlG33W
	EVu4bSP4NYEsmHvk/H8sdVMgDZlyxlj32aqnCNinWU/wI/SmtRCdJTTBzUhRgHvircXZ
	7+1HG0voK9bvN07+2v6lqG/kZ9v4hFomW7PVMlXIrFtBXlkvfydA844Pb4lPSOPaCUF4
	B7ebEgljvwN4+hylxCxi1aGm5+569UbIgYyFtqVqJcr8oBbwi4KZX/rtPHZ+Ruv7Zpud
	DoBjf3sTBKgywo6s+robM9ppZ/c/wLuhC0CsrRvgOoDCfcwZFeR4U6Q2NPJ8XSY8L8cq
	DBsQ==
Received: by 10.49.104.129 with SMTP id ge1mr38534796qeb.62.1350424050133;
	Tue, 16 Oct 2012 14:47:30 -0700 (PDT)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPS id
	ig20sm16547446qab.19.2012.10.16.14.47.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Oct 2012 14:47:29 -0700 (PDT)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Tue, 16 Oct 2012 17:47:29 -0400
From: Marc Ferland <ferlandm@sonatest.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Oct 2012 17:47:26 -0400
Message-Id: <1350424046-18863-2-git-send-email-ferlandm@sonatest.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1350424046-18863-1-git-send-email-ferlandm@sonatest.com>
References: <1350424046-18863-1-git-send-email-ferlandm@sonatest.com>
MIME-Version: 1.0
Subject: [PATCH] lmsensors: Initial commit.
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
X-List-Received-Date: Tue, 16 Oct 2012 22:00:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds the lm_sensors applications. These consists of:

*libsensors: the main application library
*sensors: cmd line tool to list current sensors values
*sensord: sensors logging daemon
*fancontrol: fan speed regulation daemon
*sensorsdetect: script to autodetect sensors
*sensorsconfconvert: converts lm_sensorsv2 to lm_sensorsv3 config files
*pwmconfig: script to configure fancontrol
*isatools: get/set isa registers

This patch also adds the rrdtool program which is needed by sensord.
---
 meta/recipes-bsp/lm_sensors/files/fancontrol       |    2 +
 meta/recipes-bsp/lm_sensors/files/fancontrol.sh    |   48 ++++++
 meta/recipes-bsp/lm_sensors/files/sensord.cgi      |   10 ++
 meta/recipes-bsp/lm_sensors/files/sensord.conf     |   16 ++
 meta/recipes-bsp/lm_sensors/files/sensord.sh       |   49 +++++++
 meta/recipes-bsp/lm_sensors/files/sensors.conf     |    2 +
 meta/recipes-bsp/lm_sensors/lmsensors_3.3.2.bb     |  150 ++++++++++++++++++++
 meta/recipes-support/rrdtool/files/automake.patch  |   15 ++
 meta/recipes-support/rrdtool/files/configure.patch |   19 +++
 meta/recipes-support/rrdtool/rrdtool_1.4.7.bb      |   31 ++++
 10 files changed, 342 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-bsp/lm_sensors/files/fancontrol
 create mode 100644 meta/recipes-bsp/lm_sensors/files/fancontrol.sh
 create mode 100644 meta/recipes-bsp/lm_sensors/files/sensord.cgi
 create mode 100644 meta/recipes-bsp/lm_sensors/files/sensord.conf
 create mode 100644 meta/recipes-bsp/lm_sensors/files/sensord.sh
 create mode 100644 meta/recipes-bsp/lm_sensors/files/sensors.conf
 create mode 100644 meta/recipes-bsp/lm_sensors/lmsensors_3.3.2.bb
 create mode 100644 meta/recipes-support/rrdtool/files/automake.patch
 create mode 100644 meta/recipes-support/rrdtool/files/configure.patch
 create mode 100644 meta/recipes-support/rrdtool/rrdtool_1.4.7.bb

diff --git a/meta/recipes-bsp/lm_sensors/files/fancontrol b/meta/recipes-bsp/lm_sensors/files/fancontrol
new file mode 100644
index 0000000..1f03a2b
--- /dev/null
+++ b/meta/recipes-bsp/lm_sensors/files/fancontrol
@@ -0,0 +1,2 @@
+# fancontrol configuration file.
+# Place your device specific configuration in this file.
diff --git a/meta/recipes-bsp/lm_sensors/files/fancontrol.sh b/meta/recipes-bsp/lm_sensors/files/fancontrol.sh
new file mode 100644
index 0000000..f179310
--- /dev/null
+++ b/meta/recipes-bsp/lm_sensors/files/fancontrol.sh
@@ -0,0 +1,48 @@
+#! /bin/sh
+### BEGIN INIT INFO
+# Provides:          fancontrol
+# Required-Start:    $local_fs
+# Should-Start:
+# Required-Stop:     $local_fs
+# Should-Stop:
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: fancontrol initscript
+# Description:       Starts and controls the fancontrol daemon
+### END INIT INFO
+
+PATH=/sbin:/usr/sbin:/bin:/usr/bin
+
+DESC="fan control daemon"
+NAME="fancontrol"
+FANCONTROL=`which $NAME`
+
+. /etc/init.d/functions || exit 1
+
+# Exit if the package is not installed
+[ -x "$FANCONTROL" ] || exit 0
+
+case "$1" in
+    start)
+        echo -n "Starting $DESC: $NAME... "
+        /sbin/start-stop-daemon -S -x $FANCONTROL -b -- $FANCONTROL_ARGS
+        echo "done."
+        ;;
+    stop)
+        echo -n "Stopping $DESC: $NAME... "
+        /sbin/start-stop-daemon -K -x $FANCONTROL
+        echo "done."
+        ;;
+    restart)
+        echo "Restarting $DESC: $NAME... "
+        $0 stop
+        $0 start
+        echo "done."
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart}"
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/meta/recipes-bsp/lm_sensors/files/sensord.cgi b/meta/recipes-bsp/lm_sensors/files/sensord.cgi
new file mode 100644
index 0000000..b1aad05
--- /dev/null
+++ b/meta/recipes-bsp/lm_sensors/files/sensord.cgi
@@ -0,0 +1,10 @@
+#!/usr/bin/rrdcgi
+
+<html>
+<head>
+<title>sensord</title>
+</head>
+<body>
+Generate a valid sensord.cgi script and install it in your BSP.
+</body>
+</html>
diff --git a/meta/recipes-bsp/lm_sensors/files/sensord.conf b/meta/recipes-bsp/lm_sensors/files/sensord.conf
new file mode 100644
index 0000000..6b48cf6
--- /dev/null
+++ b/meta/recipes-bsp/lm_sensors/files/sensord.conf
@@ -0,0 +1,16 @@
+# Default sensord configuration file
+# Syntax: sensord {options} {chips}
+# -i, --interval <time>     -- interval between scanning alarms (default 60s)
+# -l, --log-interval <time> -- interval between logging sensors (default 30m)
+# -t, --rrd-interval <time> -- interval between updating RRD file (default 5m)
+# -T, --rrd-no-average      -- switch RRD in non-average mode
+# -r, --rrd-file <file>     -- RRD file (default <none>)
+# -c, --config-file <file>  -- configuration file
+# -p, --pid-file <file>     -- PID file (default /var/run/sensord.pid)
+# -f, --syslog-facility <f> -- syslog facility to use (default local4)
+# -g, --rrd-cgi <img-dir>   -- output an RRD CGI script and exit
+# -a, --load-average        -- include load average in RRD file
+# -d, --debug               -- display some debug information
+# -v, --version             -- display version and exit
+# -h, --help                -- display help and exit
+SENSORD_ARGS="-i60s -l30m -t1m -r/var/lib/sensord.rrd -a"
diff --git a/meta/recipes-bsp/lm_sensors/files/sensord.sh b/meta/recipes-bsp/lm_sensors/files/sensord.sh
new file mode 100644
index 0000000..5a09cd3
--- /dev/null
+++ b/meta/recipes-bsp/lm_sensors/files/sensord.sh
@@ -0,0 +1,49 @@
+#! /bin/sh
+### BEGIN INIT INFO
+# Provides:          sensord
+# Required-Start:    $local_fs
+# Should-Start:
+# Required-Stop:     $local_fs
+# Should-Stop:
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: sensord initscript
+# Description:       Starts the sensord logging daemon
+### END INIT INFO
+
+PATH=/sbin:/usr/sbin:/bin:/usr/bin
+
+DESC="sensors logging daemon"
+NAME="sensord"
+SENSORD=`which $NAME`
+
+. /etc/init.d/functions || exit 1
+. /etc/sensord.conf || exit 1
+
+# Exit if the package is not installed
+[ -x "$SENSORD" ] || exit 0
+
+case "$1" in
+    start)
+        echo -n "Starting $DESC: $NAME... "
+        start-stop-daemon -S -x $SENSORD -- $SENSORD_ARGS
+        echo "done."
+        ;;
+    stop)
+        echo -n "Stopping $DESC: $NAME... "
+        start-stop-daemon -K -x $SENSORD
+        echo "done."
+        ;;
+    restart)
+        echo "Restarting $DESC: $NAME... "
+        $0 stop
+        $0 start
+        echo "done."
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart}"
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/meta/recipes-bsp/lm_sensors/files/sensors.conf b/meta/recipes-bsp/lm_sensors/files/sensors.conf
new file mode 100644
index 0000000..bb8c93d
--- /dev/null
+++ b/meta/recipes-bsp/lm_sensors/files/sensors.conf
@@ -0,0 +1,2 @@
+# sensors configuration file.
+# Place your device specific configuration in this file.
diff --git a/meta/recipes-bsp/lm_sensors/lmsensors_3.3.2.bb b/meta/recipes-bsp/lm_sensors/lmsensors_3.3.2.bb
new file mode 100644
index 0000000..009628e
--- /dev/null
+++ b/meta/recipes-bsp/lm_sensors/lmsensors_3.3.2.bb
@@ -0,0 +1,150 @@
+SUMMARY = "lm_sensors"
+DESCRIPTION = "Hardware health monitoring applications"
+HOMEPAGE = "http://www.lm-sensors.org/"
+LICENSE = "GPLv2+ & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
+                    file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"
+PR = "r0"
+DEPENDS = "sysfsutils virtual/libiconv bison-native flex-native rrdtool"
+PROVIDES = "\
+${PN}-libsensors \
+${PN}-sensors \
+${PN}-sensord \
+${PN}-fancontrol \
+${PN}-sensorsdetect \
+${PN}-sensorsconfconvert \
+${PN}-pwmconfig \
+${PN}-isatools \
+"
+
+SRC_URI = "http://dl.lm-sensors.org/lm-sensors/releases/lm_sensors-${PV}.tar.bz2 \
+           file://fancontrol \
+           file://fancontrol.sh \
+           file://sensors.conf \
+           file://sensord.conf \
+           file://sensord.sh \
+           file://sensord.cgi \
+"
+
+SRC_URI[md5sum] = "f357ba00b080ab102a170f7bf8bb2578"
+SRC_URI[sha256sum] = "f13dd885406841a7352ccfb8b9ccb23c4c057abe3de4258da5444c149a9e3ae1"
+
+inherit update-rc.d
+
+INITSCRIPT_PACKAGES = "${PN}-fancontrol ${PN}-sensord"
+INITSCRIPT_NAME_${PN}-fancontrol = "fancontrol.sh"
+INITSCRIPT_NAME_${PN}-sensord = "sensord.sh"
+INITSCRIPT_PARAMS_${PN}-fancontrol = "defaults 66"
+INITSCRIPT_PARAMS_${PN}-sensord = "defaults 67"
+
+S = "${WORKDIR}/lm_sensors-${PV}"
+
+EXTRA_OEMAKE = 'LINUX=${STAGING_KERNEL_DIR} EXLDFLAGS="${LDFLAGS}" \
+		MACHINE=${TARGET_ARCH} PREFIX=${prefix} CC="${CC}" AR="${AR}"'
+
+do_compile() {
+    oe_runmake user PROG_EXTRA="sensors sensord"
+}
+
+do_install() {
+    oe_runmake user_install DESTDIR=${D}
+    install -m 0755 ${S}/prog/sensord/sensord ${D}${bindir}
+    install -m 0644 ${S}/prog/sensord/sensord.8 ${D}/usr/man/man8
+    
+    # move manuals into proper place
+    install -d ${D}${mandir}
+    rm -rf ${D}${mandir}/*
+    mv ${D}/usr/man/* ${D}${mandir}
+    rmdir ${D}/usr/man
+
+    # Install directories
+    install -d ${D}${sysconfdir}
+    install -d ${D}${sysconfdir}/init.d
+    install -d ${D}${sysconfdir}/sensors.d
+
+    # Install sensors.conf
+    install -m 0644 ${WORKDIR}/sensors.conf ${D}${sysconfdir}/sensors.d
+
+    # Install fancontrol config file
+    install -m 0644 ${WORKDIR}/fancontrol ${D}${sysconfdir}
+
+    # Install fancontrol init script
+    install -m 0755 ${WORKDIR}/fancontrol.sh ${D}${sysconfdir}/init.d
+
+    # Install sensord init script
+    install -m 0755 ${WORKDIR}/sensord.sh ${D}${sysconfdir}/init.d
+    install -m 0644 ${WORKDIR}/sensord.conf ${D}${sysconfdir}
+
+    # Install sensord.cgi script and create world-writable
+    # web-accessible sensord directory.
+    install -d ${D}/www/pages/cgi-bin
+    install -m 0755 ${WORKDIR}/sensord.cgi ${D}/www/pages/cgi-bin
+    install -d -m a=rwxs ${D}/www/pages/sensord
+}
+
+# libsensors packages
+PACKAGES =+ "${PN}-libsensors ${PN}-libsensors-dbg ${PN}-libsensors-dev ${PN}-libsensors-staticdev ${PN}-libsensors-doc"
+
+# sensors command packages
+PACKAGES =+ "${PN}-sensors ${PN}-sensors-dbg ${PN}-sensors-doc"
+
+# sensord logging daemon
+PACKAGES =+ "${PN}-sensord ${PN}-sensord-dbg ${PN}-sensord-doc"
+
+# fancontrol script
+PACKAGES =+ "${PN}-fancontrol ${PN}-fancontrol-doc"
+
+# sensors-detect script
+PACKAGES =+ "${PN}-sensorsdetect ${PN}-sensorsdetect-doc"
+
+# sensors-conf-convert script
+PACKAGES =+ "${PN}-sensorsconfconvert"
+
+# pwmconfig script
+PACKAGES =+ "${PN}-pwmconfig ${PN}-pwmconfig-doc"
+
+# isadump and isaset helper program
+PACKAGES =+ "${PN}-isatools ${PN}-isatools-dbg ${PN}-isatools-doc"
+
+# libsensors files
+FILES_${PN}-libsensors = "${libdir}/libsensors.so.* ${sysconfdir}/sensors3.conf ${sysconfdir}/sensors.d/sensors.conf"
+FILES_${PN}-libsensors-dbg = "${libdir}/.debug ${prefix}/src/debug"
+FILES_${PN}-libsensors-dev = "${libdir}/libsensors.so ${includedir}"
+FILES_${PN}-libsensors-staticdev = "${libdir}/libsensors.a"
+FILES_${PN}-libsensors-doc = "${mandir}/man3"
+
+# sensors command files
+FILES_${PN}-sensors = "${bindir}/sensors"
+FILES_${PN}-sensors-dbg = "${bindir}/.debug/sensors"
+FILES_${PN}-sensors-doc = "${mandir}/man1 ${mandir}/man5"
+RDEPENDS_${PN}-sensors = "${PN}-libsensors"
+
+# sensord logging daemon
+FILES_${PN}-sensord = "${bindir}/sensord ${sysconfdir}/sensord.conf ${sysconfdir}/init.d/sensord.sh /www/*"
+FILES_${PN}-sensord-dbg = "${bindir}/.debug/sensord"
+FILES_${PN}-sensord-doc = "${mandir}/man8/sensord.8"
+RDEPENDS_${PN}-sensord = "${PN}-sensors rrdtool lighttpd lighttpd-module-cgi"
+
+# fancontrol script files
+FILES_${PN}-fancontrol = "${sbindir}/fancontrol ${sysconfdir}/fancontrol ${sysconfdir}/init.d/fancontrol.sh"
+FILES_${PN}-fancontrol-doc = "${mandir}/man8/fancontrol.8"
+RDEPENDS_${PN}-fancontrol = "bash"
+
+# sensors-detect script files
+FILES_${PN}-sensorsdetect = "${sbindir}/sensors-detect"
+FILES_${PN}-sensorsdetect-doc = "${mandir}/man8/sensors-detect.8"
+RDEPENDS_${PN}-sensorsdetect = "${PN}-sensors perl perl-modules"
+
+# sensors-conf-convert script files
+FILES_${PN}-sensorsconfconvert = "${bindir}/sensors-conf-convert"
+RDEPENDS_${PN}-sensorsconfconvert = "${PN}-sensors perl perl-modules"
+
+# pwmconfig script files
+FILES_${PN}-pwmconfig = "${sbindir}/pwmconfig"
+FILES_${PN}-pwmconfig-doc = "${mandir}/man8/pwmconfig.8"
+RDEPENDS_${PN}-pwmconfig = "${PN}-fancontrol"
+
+# isadump and isaset helper program files
+FILES_${PN}-isatools = "${sbindir}/isa*"
+FILES_${PN}-isatools-dbg = "${sbindir}/.debug/isa*"
+FILES_${PN}-isatools-doc = "${mandir}/man8/isa*"
diff --git a/meta/recipes-support/rrdtool/files/automake.patch b/meta/recipes-support/rrdtool/files/automake.patch
new file mode 100644
index 0000000..891c5c8
--- /dev/null
+++ b/meta/recipes-support/rrdtool/files/automake.patch
@@ -0,0 +1,15 @@
+Index: bindings/tcl/Makefile.am
+===================================================================
+--- rrdtool-1.4.7/bindings/tcl/Makefile.am	(révision 2287)
++++ rrdtool-1.4.7/bindings/tcl/Makefile.am	(copie de travail)
+@@ -27,8 +27,8 @@
+ tclpkg_DATA = pkgIndex.tcl
+ tclpkg_SCRIPTS = ifOctets.tcl
+ else
+-pkglib_DATA = pkgIndex.tcl
+-pkglib_SCRIPTS = ifOctets.tcl
++pkgdata_DATA = pkgIndex.tcl
++pkgdata_SCRIPTS = ifOctets.tcl
+ endif
+ 
+ # Automake doen't like `tclrrd$(VERSION)$(TCL_SHLIB_SUFFIX)' as
diff --git a/meta/recipes-support/rrdtool/files/configure.patch b/meta/recipes-support/rrdtool/files/configure.patch
new file mode 100644
index 0000000..f413bd2
--- /dev/null
+++ b/meta/recipes-support/rrdtool/files/configure.patch
@@ -0,0 +1,19 @@
+--- rrdtool-1.4.7/configure.ac	2012-01-24 05:08:48.000000000 -0500
++++ rrdtool-1.4.7.mine/configure.ac	2012-01-27 13:50:42.717578624 -0500
+@@ -348,7 +348,6 @@
+ 	        AC_DEFINE(HAVE_ISFINITE)],[AC_MSG_RESULT(no)])])])
+ fi  
+ 
+-AC_FULL_IEEE
+ 
+ CONFIGURE_PART(Resolve Portability Issues)
+ 
+@@ -548,7 +547,7 @@
+ 
+ fi
+ EX_CHECK_ALL(glib-2.0,   glib_check_version,            glib.h,                 glib-2.0,    2.28.7, ftp://ftp.gtk.org/pub/glib/2.28/, "")
+-EX_CHECK_ALL(xml2,       xmlParseFile,                  libxml/parser.h,        libxml-2.0,        2.7.8,  http://xmlsoft.org/downloads.html, /usr/include/libxml2)
++EX_CHECK_ALL(xml2,       xmlParseFile,                  libxml/parser.h,        libxml-2.0,        2.7.8,  http://xmlsoft.org/downloads.html, "")
+ 
+ if test "$EX_CHECK_ALL_ERR" = "YES"; then
+   AC_MSG_ERROR([Please fix the library issues listed above and try again.])
diff --git a/meta/recipes-support/rrdtool/rrdtool_1.4.7.bb b/meta/recipes-support/rrdtool/rrdtool_1.4.7.bb
new file mode 100644
index 0000000..4b60622
--- /dev/null
+++ b/meta/recipes-support/rrdtool/rrdtool_1.4.7.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "High performance data logging and graphing system for time series data."
+HOMEPAGE = "http://oss.oetiker.ch/rrdtool/"
+SECTION = "utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=44fee82a1d2ed0676cf35478283e0aa0"
+
+DEPENDS = "libpng zlib cairo glib-2.0 pango libxml2 virtual/gettext"
+RDEPENDS = "liberation-fonts"
+
+PR = "r0"
+
+SRC_URI = "http://oss.oetiker.ch/rrdtool/pub/rrdtool-${PV}.tar.gz \
+           file://configure.patch \
+           file://automake.patch \
+           "
+
+inherit autotools
+
+EXTRA_OECONF = "--enable-shared \
+                --program-prefix='' \
+                --disable-libdbi \
+                --disable-libwrap \
+                --disable-perl \
+                --disable-ruby \
+                --disable-lua \
+                --disable-tcl \
+                --disable-python \
+                "
+
+SRC_URI[md5sum] = "ffe369d8921b4dfdeaaf43812100c38f"
+SRC_URI[sha256sum] = "956aaf431c955ba88dd7d98920ade3a8c4bad04adb1f9431377950a813a7af11"
-- 
1.7.5.4



