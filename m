Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RZ4LR-0002Op-RK
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 18:34:50 +0100
Received: by mail-yx0-f175.google.com with SMTP id m12so2538752yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 09:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=GPSkzBw3hh8nBNQRFSxqcAFBVc8Y/SnTyHOYtz7TwzU=;
	b=mSAGKUvRB2/jnTlWjXUFJB4ZFdoJRXDahwfduyxbb7ZF6f+5Of5Q5RzlLC5SC6qZZo
	FZn5JJpNU6HT8JJs4d4xs59MyXAftvFynIk4naZoHMos/1Mj4SJ2VJ0FmyCmF9Z+P4nE
	9Pss/MJwVwClMzkPNIApuCCBi0yqUW39GcJyE=
Received: by 10.236.115.40 with SMTP id d28mr13310813yhh.37.1323451680521;
	Fri, 09 Dec 2011 09:28:00 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l11sm25562627anm.22.2011.12.09.09.27.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 09:27:59 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2011 17:27:35 +0000
Message-Id: <32a43de5a217052a1dc886ca76ac133e5f179148.1323451575.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323451575.git.otavio@ossystems.com.br>
References: <cover.1323451575.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323451575.git.otavio@ossystems.com.br>
References: <cover.1323451575.git.otavio@ossystems.com.br>
Subject: [PATCH 5/5] connman: update to 0.78
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
X-List-Received-Date: Fri, 09 Dec 2011 17:34:50 -0000

Updates the package to 0.78 bringing changes done on meta-oe and extra
cleanups as:

* xtables_version.patch: removed as it has been merged upstream

* use sed to fix dbus access policy

* remove build depends on dhclient as connman has an internal client
  now

* make wifi and bluetooth building optional

* add ppp in depends that is used by some plugins

* add ntp in depends and enable ntp plugin

* package tools

* enable fake plugin

This uses PR as "r1" since it was previously available on meta-oe.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Acked-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-connectivity/connman/connman.inc      |   96 ++++++++++++++------
 .../connman/connman/xtables_version.patch          |   64 -------------
 meta/recipes-connectivity/connman/connman_0.75.bb  |   29 ------
 meta/recipes-connectivity/connman/connman_0.78.bb  |   10 ++
 4 files changed, 79 insertions(+), 120 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/xtables_version.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman_0.75.bb
 create mode 100644 meta/recipes-connectivity/connman/connman_0.78.bb

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 7ee460e..e90aa4b 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -13,7 +13,32 @@ LICENSE  = "GPLv2"
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
+    --enable-dnsproxy \
+    --enable-ofono \
+    --enable-tools \
+    --enable-test \
+    --disable-polkit \
+    --enable-client \
+    --enable-fake \
+    --enable-ntpd \
+    --with-ntpd=${bindir}/ntpd \
+"
 
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
@@ -25,44 +50,61 @@ USERADD_PARAM_${PN} = "--system --no-create-home \
 
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
+do_install_append() {
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/connman ${D}${sysconfdir}/init.d/connman
 
-FILES_${PN}-dev += "${libdir}/connman/plugins/*.la"
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/tools/*-test ${D}${bindir}
+	install -m 0755 ${S}/tools/wispr ${D}${bindir}
+}
 
-FILES_${PN}-scripts += "${libdir}/${PN}/test/*"
+PACKAGES_DYNAMIC = "${PN}-plugin-*"
 
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
+	multilib_prefix = (d.getVar("MLPREFIX", True) or "")
 	hook = lambda file,pkg,b,c,d:packages.append((file,pkg))
-
 	plugin_dir = bb.data.expand('${libdir}/connman/plugins/', d)
 	plugin_name = bb.data.expand('${PN}-plugin-%s', d)
-
 	do_split_packages(d, plugin_dir, '^(.*).so$', plugin_name, '${PN} plugin for %s', extra_depends='', hook=hook )
-
 	for (file, package) in packages:
 		plugintype = package.split( '-' )[-1]
 		if plugintype in depmap:
-			bb.note( "Adding rdependency on %s to package %s" % ( depmap[plugintype], package ) )
-			d.setVar("RDEPENDS_%s" % package, depmap[plugintype])
+			rdepends = map(lambda x: multilib_prefix + x,  depmap[plugintype].split())
+			bb.note( "Adding rdependency on %s to %s" % ( rdepends, package ) )
+			d.setVar("RDEPENDS_%s" % package, " ".join(rdepends))
 }
+
+PACKAGES =+ "${PN}-scripts ${PN}-tools ${PN}-tests"
+
+FILES_${PN}-tools = "${bindir}/wispr"
+
+FILES_${PN}-tests = "${bindir}/*-test"
+
+FILES_${PN}-scripts += "${libdir}/${PN}/test/* ${libdir}/connman/scripts"
+RDEPENDS_${PN}-scripts = "python"
+
+FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
+            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
+            ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* ${datadir}/${PN} \
+            ${datadir}/pixmaps ${datadir}/applications \
+            ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
+            ${libdir}/bonobo/servers \
+            ${datadir}/dbus-1/system-services/*"
+
+FILES_${PN}-dbg += "${libdir}/connman/*/.debug"
+
+FILES_${PN}-dev += "${libdir}/connman/*/*.la"
diff --git a/meta/recipes-connectivity/connman/connman/xtables_version.patch b/meta/recipes-connectivity/connman/connman/xtables_version.patch
deleted file mode 100644
index 13e2c36..0000000
--- a/meta/recipes-connectivity/connman/connman/xtables_version.patch
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
-- 
1.7.2.5



