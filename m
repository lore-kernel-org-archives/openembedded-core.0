Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RYyAJ-0003oM-0A
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 11:58:55 +0100
Received: by yenm12 with SMTP id m12so2226731yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 02:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=NXvoqDTmW0OaAW94htfRpOGP6Kz1ZId4Cq4HOHgT5+0=;
	b=GlVJDcattc9p8Ntq/ijhW7LUPtWVqSJ4JWcdEjY8S+TIQz2TrVsjeOunrBBtMLpYpW
	icT2KnWT+myXkfiZ63Ag9MWP7+cn7fo1hjlAhVPruTiu1tvODltaRFHFs37IBd9o5sl7
	JWGAsRLg7qANtGq2YW4BTvYpjXugCmmPfANn0=
Received: by 10.236.129.164 with SMTP id h24mr10247196yhi.78.1323427923463;
	Fri, 09 Dec 2011 02:52:03 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l19sm22993023anc.14.2011.12.09.02.52.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 02:52:02 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2011 10:51:52 +0000
Message-Id: <1323427912-10122-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] connman: update to 0.78
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
X-List-Received-Date: Fri, 09 Dec 2011 10:58:55 -0000

Updates the package to 0.78 bringing changes done on meta-oe to
OE-Core. This also removes unrequired build-depends and makes the
package to respect wifi and bluetooth distro features.

Following patches were removed:

 * xtables_version.patch: merged upstream

 * dbusperms.patch: dropped in favour of using sed to make the change
   in do_compile_append

Another important change is the addition of ppp in depends that is
used by some plugins.

This uses PR as "r1" since it was previously available on meta-oe.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Acked-by: Joshua Lock <josh@linux.intel.com>
---
 .../connman-0.75/add_xuser_dbus_permission.patch   |   23 -----
 .../connman/connman-0.75/connman                   |   62 --------------
 .../connman/connman-0.75/dbusperms.patch           |   14 ---
 .../connman/connman-0.75/xtables_version.patch     |   64 --------------
 meta/recipes-connectivity/connman/connman.inc      |   90 ++++++++++++++------
 .../connman/add_xuser_dbus_permission.patch        |   23 +++++
 meta/recipes-connectivity/connman/connman/connman  |   62 ++++++++++++++
 meta/recipes-connectivity/connman/connman_0.75.bb  |   29 ------
 meta/recipes-connectivity/connman/connman_0.78.bb  |   10 ++
 meta/recipes-connectivity/connman/connman_git.bb   |   11 ---
 10 files changed, 157 insertions(+), 231 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman-0.75/add_xuser_dbus_permission.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-0.75/connman
 delete mode 100644 meta/recipes-connectivity/connman/connman-0.75/dbusperms.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-0.75/xtables_version.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/connman
 delete mode 100644 meta/recipes-connectivity/connman/connman_0.75.bb
 create mode 100644 meta/recipes-connectivity/connman/connman_0.78.bb
 delete mode 100644 meta/recipes-connectivity/connman/connman_git.bb

diff --git a/meta/recipes-connectivity/connman/connman-0.75/add_xuser_dbus_permission.patch b/meta/recipes-connectivity/connman/connman-0.75/add_xuser_dbus_permission.patch
deleted file mode 100644
index 764c689..0000000
--- a/meta/recipes-connectivity/connman/connman-0.75/add_xuser_dbus_permission.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Some platform (like atom-pc) enables rootless X,
-thus we need to add the xuser in the list.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
-
-diff -ruN connman-0.65-orig/src/connman-dbus.conf connman-0.65/src/connman-dbus.conf
---- connman-0.65-orig/src/connman-dbus.conf	2011-03-04 09:34:49.000000000 +0800
-+++ connman-0.65/src/connman-dbus.conf	2011-03-04 09:35:21.000000000 +0800
-@@ -7,6 +7,12 @@
-         <allow send_interface="net.connman.Agent"/>
-         <allow send_interface="net.connman.Counter"/>
-     </policy>
-+    <policy user="xuser">
-+        <allow own="net.connman"/>
-+        <allow send_destination="net.connman"/>
-+        <allow send_interface="net.connman.Agent"/>
-+        <allow send_interface="net.connman.Counter"/>
-+    </policy>
-     <policy at_console="true">
-         <allow send_destination="net.connman"/>
-     </policy>
diff --git a/meta/recipes-connectivity/connman/connman-0.75/connman b/meta/recipes-connectivity/connman/connman-0.75/connman
deleted file mode 100644
index f01bf37..0000000
--- a/meta/recipes-connectivity/connman/connman-0.75/connman
+++ /dev/null
@@ -1,62 +0,0 @@
-#!/bin/sh
-
-DAEMON=/usr/sbin/connmand
-PIDFILE=/var/run/connmand.pid
-DESC="Connection Manager"
-
-if [ -f /etc/default/connman ] ; then
-	. /etc/default/connman
-fi
-
-set -e
-
-nfsroot=0
-
-exec 9<&0 < /proc/mounts
-while read dev mtpt fstype rest; do
-	if test $mtpt = "/" ; then
-		case $fstype in
-		    nfs | nfs4)
-			nfsroot=1
-			break
-			;;
-		    *)
-			;;
-		esac
-	fi
-done
-
-do_start() {
-	EXTRA_PARAM=""
-	if test $nfsroot -eq 1 ; then
-		EXTRA_PARAM="-P ethernet"
-	fi
-	$DAEMON $EXTRA_PARAM
-}
-
-do_stop() {
-	start-stop-daemon --stop --name connmand --quiet
-}
-
-case "$1" in
-  start)
-	echo "Starting $DESC"
-	do_start
-	;;
-  stop)
-	echo "Stopping $DESC"
-	do_stop
-	;;
-  restart|force-reload)
-	echo "Restarting $DESC"
-	do_stop
-	sleep 1
-	do_start
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart|force-reload}" >&2
-	exit 1
-	;;
-esac
-
-exit 0
diff --git a/meta/recipes-connectivity/connman/connman-0.75/dbusperms.patch b/meta/recipes-connectivity/connman/connman-0.75/dbusperms.patch
deleted file mode 100644
index c331654..0000000
--- a/meta/recipes-connectivity/connman/connman-0.75/dbusperms.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: git/src/connman-dbus.conf
-===================================================================
---- git.orig/src/connman-dbus.conf	2009-05-26 00:34:35.000000000 +0100
-+++ git/src/connman-dbus.conf	2009-05-26 00:34:48.000000000 +0100
-@@ -10,6 +10,6 @@
-         <allow send_destination="org.moblin.connman"/>
-     </policy>
-     <policy context="default">
--        <deny send_destination="org.moblin.connman"/>
-+        <allow send_destination="org.moblin.connman"/>
-     </policy>
- </busconfig>
diff --git a/meta/recipes-connectivity/connman/connman-0.75/xtables_version.patch b/meta/recipes-connectivity/connman/connman-0.75/xtables_version.patch
deleted file mode 100644
index 13e2c36..0000000
--- a/meta/recipes-connectivity/connman/connman-0.75/xtables_version.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-xtables_merge_options API change, fix its calling in connman.
-
-Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
-
-Upstream-Status: Backport
-
-diff -ruN connman-0.75-orig//src/iptables.c connman-0.75/src/iptables.c
---- connman-0.75-orig//src/iptables.c	2011-02-22 12:16:25.000000000 +0800
-+++ connman-0.75/src/iptables.c	2011-10-26 09:21:33.941164000 +0800
-@@ -1089,7 +1089,11 @@
- 			if (xt_t->init != NULL)
- 				xt_t->init(xt_t->t);
- 			iptables_globals.opts =
--				xtables_merge_options(iptables_globals.opts,
-+				xtables_merge_options(
-+#if XTABLES_VERSION_CODE > 5
-+                                                     iptables_globals.orig_opts,
-+#endif
-+                                                     iptables_globals.opts,
- 						     xt_t->extra_opts,
- 						     &xt_t->option_offset);
- 			if (iptables_globals.opts == NULL)
-@@ -1113,7 +1117,11 @@
- 				xt_m->init(xt_m->m);
- 			if (xt_m != xt_m->next) {
- 				iptables_globals.opts =
--				xtables_merge_options(iptables_globals.opts,
-+				xtables_merge_options(
-+#if XTABLES_VERSION_CODE > 5
-+                                                iptables_globals.orig_opts,
-+#endif
-+                                                iptables_globals.opts,
- 						xt_m->extra_opts,
- 						&xt_m->option_offset);
- 				if (iptables_globals.opts == NULL)
-diff -ruN connman-0.75-orig//tools/iptables-test.c connman-0.75/tools/iptables-test.c
---- connman-0.75-orig//tools/iptables-test.c	2011-02-22 12:16:25.000000000 +0800
-+++ connman-0.75/tools/iptables-test.c	2011-10-26 09:23:25.701164000 +0800
-@@ -1076,7 +1076,11 @@
- 			if (xt_t->init != NULL)
- 				xt_t->init(xt_t->t);
- 			connman_iptables_globals.opts =
--				xtables_merge_options(connman_iptables_globals.opts,
-+				xtables_merge_options(
-+#if XTABLES_VERSION_CODE > 5
-+						     connman_iptables_globals.orig_opts,
-+#endif
-+						     connman_iptables_globals.opts,
- 						     xt_t->extra_opts,
- 						     &xt_t->option_offset);
- 			if (connman_iptables_globals.opts == NULL)
-@@ -1102,7 +1106,11 @@
- 				xt_m->init(xt_m->m);
- 			if (xt_m != xt_m->next) {
- 				connman_iptables_globals.opts =
--					xtables_merge_options(connman_iptables_globals.opts,
-+					xtables_merge_options(
-+#if XTABLES_VERSION_CODE > 5
-+						connman_iptables_globals.orig_opts,
-+#endif
-+						connman_iptables_globals.opts,
- 						xt_m->extra_opts,
- 						&xt_m->option_offset);
- 				if (connman_iptables_globals.opts == NULL)
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 7ee460e..938d074 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -13,7 +13,30 @@ LICENSE  = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://src/main.c;beginline=1;endline=20;md5=4b55b550fa6b33cc2055ef30dd262b3e"
 
-DEPENDS  = "libgdbus dbus glib-2.0 iptables"
+# we need to define the depends here, the dynamic stuff is too late
+DEPENDS  = "dbus glib-2.0 ppp iptables gnutls ntp \
+            ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)} \
+            ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
+            "
+
+EXTRA_OECONF += "\
+    ac_cv_path_WPASUPPLICANT=${sbindir}/wpa_supplicant \
+    ac_cv_path_PPPD=${sbindir}/pppd \
+    --disable-gtk-doc \
+    --enable-debug \
+    --enable-threads \
+    --enable-loopback \
+    --enable-ethernet \
+    ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi', '--disable-wifi', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
+    --enable-ofono \
+    --enable-tools \
+    --disable-polkit \
+    --enable-client \
+    --enable-fake \
+    --enable-ntpd \
+    --with-ntpd=${bindir}/ntpd \
+"
 
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
@@ -25,44 +48,55 @@ USERADD_PARAM_${PN} = "--system --no-create-home \
 
 inherit autotools pkgconfig update-rc.d useradd
 
-do_install_append() {
-    install -d ${D}${sysconfdir}/init.d/
-    install -m 0755 ${WORKDIR}/connman ${D}${sysconfdir}/init.d/connman
+do_compile_append() {
+	sed -i -e s:deny:allow:g src/connman-dbus.conf
 }
 
-PACKAGES += "${PN}-scripts"
-RDEPENDS_${PN}-scripts += "python"
-
-PACKAGES_DYNAMIC = "${PN}-plugin-*"
-FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
-            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
-            ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* ${datadir}/${PN} \
-            ${datadir}/pixmaps ${datadir}/applications \
-            ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
-            ${libdir}/bonobo/servers \
-            ${datadir}/dbus-1/system-services/* \
-            ${libdir}/connman/scripts/dhclient*"
-FILES_${PN}-dbg += "${libdir}/connman/plugins/.debug \
-                    ${libdir}/connman/scripts/.debug"
-
-FILES_${PN}-dev += "${libdir}/connman/plugins/*.la"
+do_install_append() {
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/connman ${D}${sysconfdir}/init.d/connman
 
-FILES_${PN}-scripts += "${libdir}/${PN}/test/*"
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/tools/*-test ${D}${bindir}
+	install -m 0755 ${S}/tools/wispr ${D}${bindir}
+}
 
 python populate_packages_prepend() {
-	prefix = (d.getVar("MLPREFIX", True) or "")
-	depmap = dict( wifi=prefix+"wpa-supplicant", bluetooth=prefix+"bluez4", ofono=prefix+"ofono" )
+	depmap = dict( pppd="ppp",
+	               udhcp="busybox connman-scripts",
+	               dhclient="dhcp-client",
+	               wifi="wpa-supplicant",
+	               resolvconf="resolvconf",
+	               bluetooth="bluez4",
+	               ntpd="ntp",
+	               ofono="ofono" )
 	packages = []
 	hook = lambda file,pkg,b,c,d:packages.append((file,pkg))
-
-	plugin_dir = bb.data.expand('${libdir}/connman/plugins/', d)
-	plugin_name = bb.data.expand('${PN}-plugin-%s', d)
-
+	plugin_dir = d.expand('${libdir}/connman/plugins/')
+	plugin_name = d.expand('${PN}-plugin-%s')
 	do_split_packages(d, plugin_dir, '^(.*).so$', plugin_name, '${PN} plugin for %s', extra_depends='', hook=hook )
-
 	for (file, package) in packages:
 		plugintype = package.split( '-' )[-1]
 		if plugintype in depmap:
+			rdepends = d.getVar( "RDEPENDS_%s" % package)
 			bb.note( "Adding rdependency on %s to package %s" % ( depmap[plugintype], package ) )
 			d.setVar("RDEPENDS_%s" % package, depmap[plugintype])
 }
+
+PACKAGES_DYNAMIC = "${PN}-plugin-*"
+
+PACKAGES =+ "${PN}-scripts ${PN}-tools ${PN}-tests"
+
+FILES_${PN}-tools = "${bindir}/wispr"
+FILES_${PN}-tests = "${bindir}/*-test"
+FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
+            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
+            ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* ${datadir}/${PN} \
+            ${datadir}/pixmaps ${datadir}/applications \
+            ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
+            ${libdir}/bonobo/servers \
+            ${datadir}/dbus-1/system-services/*"
+
+FILES_${PN}-scripts += "${libdir}/connman/scripts"
+FILES_${PN}-dbg += "${libdir}/connman/*/.debug"
+FILES_${PN}-dev += "${libdir}/connman/*/*.la"
diff --git a/meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch b/meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch
new file mode 100644
index 0000000..764c689
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch
@@ -0,0 +1,23 @@
+Some platform (like atom-pc) enables rootless X,
+thus we need to add the xuser in the list.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+
+diff -ruN connman-0.65-orig/src/connman-dbus.conf connman-0.65/src/connman-dbus.conf
+--- connman-0.65-orig/src/connman-dbus.conf	2011-03-04 09:34:49.000000000 +0800
++++ connman-0.65/src/connman-dbus.conf	2011-03-04 09:35:21.000000000 +0800
+@@ -7,6 +7,12 @@
+         <allow send_interface="net.connman.Agent"/>
+         <allow send_interface="net.connman.Counter"/>
+     </policy>
++    <policy user="xuser">
++        <allow own="net.connman"/>
++        <allow send_destination="net.connman"/>
++        <allow send_interface="net.connman.Agent"/>
++        <allow send_interface="net.connman.Counter"/>
++    </policy>
+     <policy at_console="true">
+         <allow send_destination="net.connman"/>
+     </policy>
diff --git a/meta/recipes-connectivity/connman/connman/connman b/meta/recipes-connectivity/connman/connman/connman
new file mode 100644
index 0000000..f01bf37
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/connman
@@ -0,0 +1,62 @@
+#!/bin/sh
+
+DAEMON=/usr/sbin/connmand
+PIDFILE=/var/run/connmand.pid
+DESC="Connection Manager"
+
+if [ -f /etc/default/connman ] ; then
+	. /etc/default/connman
+fi
+
+set -e
+
+nfsroot=0
+
+exec 9<&0 < /proc/mounts
+while read dev mtpt fstype rest; do
+	if test $mtpt = "/" ; then
+		case $fstype in
+		    nfs | nfs4)
+			nfsroot=1
+			break
+			;;
+		    *)
+			;;
+		esac
+	fi
+done
+
+do_start() {
+	EXTRA_PARAM=""
+	if test $nfsroot -eq 1 ; then
+		EXTRA_PARAM="-P ethernet"
+	fi
+	$DAEMON $EXTRA_PARAM
+}
+
+do_stop() {
+	start-stop-daemon --stop --name connmand --quiet
+}
+
+case "$1" in
+  start)
+	echo "Starting $DESC"
+	do_start
+	;;
+  stop)
+	echo "Stopping $DESC"
+	do_stop
+	;;
+  restart|force-reload)
+	echo "Restarting $DESC"
+	do_stop
+	sleep 1
+	do_start
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart|force-reload}" >&2
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/meta/recipes-connectivity/connman/connman_0.75.bb b/meta/recipes-connectivity/connman/connman_0.75.bb
deleted file mode 100644
index c6e911b..0000000
--- a/meta/recipes-connectivity/connman/connman_0.75.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-require connman.inc
-PR = "r4"
-
-EXTRA_OECONF += "\
-  ac_cv_path_WPASUPPLICANT=/usr/sbin/wpa_supplicant \
-  --disable-gtk-doc \
-  --enable-debug \
-  --enable-threads \
-  --enable-loopback \
-  --enable-ethernet \
-  ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi', '--disable-wifi', d)} \
-  ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
-  --enable-dnsproxy \
-  --disable-dhclient \
-  --enable-test \
-  --disable-polkit \
-  --enable-client \
-  --enable-ofono \
-  --prefix=/usr --sysconfdir=/etc --localstatedir=/var"
-
-SRC_URI  = "\
-  ${KERNELORG_MIRROR}/linux/network/connman/connman-${PV}.tar.gz \
-  file://add_xuser_dbus_permission.patch \
-  file://xtables_version.patch \
-  file://connman \
-"
-
-SRC_URI[md5sum] = "9973cb89a11fff6b51fc85b51c13b711"
-SRC_URI[sha256sum] = "b15361237f7ec8092fb0e55d4585550ab35491485edaf10ddd032d6e36299db7"
diff --git a/meta/recipes-connectivity/connman/connman_0.78.bb b/meta/recipes-connectivity/connman/connman_0.78.bb
new file mode 100644
index 0000000..cc23c28
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman_0.78.bb
@@ -0,0 +1,10 @@
+require connman.inc
+
+PR = "r1"
+
+# 0.78 tag
+SRCREV = "02f5d5fe2d7c71514a6387ba2b772b42d8e8d297"
+SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
+            file://add_xuser_dbus_permission.patch \
+            file://connman"
+S = "${WORKDIR}/git"
diff --git a/meta/recipes-connectivity/connman/connman_git.bb b/meta/recipes-connectivity/connman/connman_git.bb
deleted file mode 100644
index 54ac4a5..0000000
--- a/meta/recipes-connectivity/connman/connman_git.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require connman.inc
-
-SRCREV = "36e877dece72577a3ae6197eafd505d0e6e0c1d2"
-PV       = "0.47+git${SRCPV}"
-PR       = "r17"
-S        = "${WORKDIR}/git"
-
-SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git;protocol=git \
-            file://dbusperms.patch \
-            file://connman "
-
-- 
1.7.2.5



