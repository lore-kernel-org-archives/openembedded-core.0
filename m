Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 2697F6D99E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 13:09:24 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB4D9JJ4027617 for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Dec 2013 13:09:19 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id h45940GnV2kA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 13:09:19 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB4D9G5u027613
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Dec 2013 13:09:17 GMT
Message-ID: <1386162551.4463.156.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 04 Dec 2013 13:09:11 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] classes/recipes: More optimal DISTRO_FEATURES references
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
X-List-Received-Date: Wed, 04 Dec 2013 13:09:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Using the contains function results in more optimal sstate checksums 
resulting in better cache reuse as we as more consistent code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 454ee76..0af42a0 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -36,10 +36,10 @@ python __anonymous () {
                 d.setVar("GLIBC_INTERNAL_USE_BINARY_LOCALE", "compile")
                 break
 
-    distro_features = (d.getVar('DISTRO_FEATURES', True) or '').split()
-
     # try to fix disable charsets/locales/locale-code compile fail
-    if 'libc-charsets' in distro_features and 'libc-locales' in distro_features and 'libc-locale-code' in distro_features:
+    if oe.utils.contains('DISTRO_FEATURES', 'libc-charsets', True, False, d) and \
+            oe.utils.contains('DISTRO_FEATURES', 'libc-locales', True, False, d) and \
+            oe.utils.contains('DISTRO_FEATURES', 'libc-locale-code', True, False, d):
         d.setVar('PACKAGE_NO_GCONV', '0')
     else:
         d.setVar('PACKAGE_NO_GCONV', '1')
diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 7a8d35c..26b9a76 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -12,13 +12,12 @@ SYSTEMD_AUTO_ENABLE ??= "enable"
 # even if systemd is not in DISTRO_FEATURES.  As such don't make any changes
 # directly but check the DISTRO_FEATURES first.
 python __anonymous() {
-    features = d.getVar("DISTRO_FEATURES", True).split()
     # If the distro features have systemd but not sysvinit, inhibit update-rcd
     # from doing any work so that pure-systemd images don't have redundant init
     # files.
-    if "systemd" in features:
+    if oe.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
         d.appendVar("DEPENDS", " systemd-systemctl-native")
-        if "sysvinit" not in features:
+        if not oe.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
             d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
 
@@ -52,7 +51,7 @@ fi
 systemd_populate_packages[vardeps] += "systemd_prerm systemd_postinst"
 
 python systemd_populate_packages() {
-    if "systemd" not in d.getVar("DISTRO_FEATURES", True).split():
+    if not oe.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
         return
 
     def get_package_var(d, var, pkg):
@@ -167,7 +166,7 @@ PACKAGESPLITFUNCS_prepend = "systemd_populate_packages "
 
 python rm_systemd_unitdir (){
     import shutil
-    if "systemd" not in d.getVar("DISTRO_FEATURES", True).split():
+    if not oe.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
         systemd_unitdir = oe.path.join(d.getVar("D", True), d.getVar('systemd_unitdir', True))
         if os.path.exists(systemd_unitdir):
             shutil.rmtree(systemd_unitdir)
@@ -181,8 +180,8 @@ python rm_sysvinit_initddir (){
     import shutil
     sysv_initddir = oe.path.join(d.getVar("D", True), (d.getVar('INIT_D_DIR', True) or "/etc/init.d"))
 
-    if ("systemd" in d.getVar("DISTRO_FEATURES", True).split() and
-        "sysvinit" not in d.getVar("DISTRO_FEATURES", True).split() and
+    if oe.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and 
+        not oe.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) and
         os.path.exists(sysv_initddir)):
         systemd_unitdir = oe.path.join(d.getVar("D", True), d.getVar('systemd_unitdir', True), "system")
 
diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 29b5a8e..c9bf04c 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -105,7 +105,7 @@ python populate_packages_updatercd () {
 
     # Check that this class isn't being inhibited (generally, by
     # systemd.bbclass) before doing any work.
-    if "sysvinit" in d.getVar("DISTRO_FEATURES").split() or \
+    if oe.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) or \
        not d.getVar("INHIBIT_UPDATERCD_BBCLASS", True):
         pkgs = d.getVar('INITSCRIPT_PACKAGES', True)
         if pkgs == None:
diff --git a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
index 859fdd6..b9a7580 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
@@ -80,13 +80,11 @@ do_compile_append () {
 }
 
 do_install_append () {
-	for i in ${DISTRO_FEATURES};
-	do
-		if [ ${i} = "pam" ];  then
-			install -d ${D}${sysconfdir}/pam.d
-			install -m 0755 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
-		fi
-	done
+	if [ "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
+		install -d ${D}${sysconfdir}/pam.d
+		install -m 0755 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
+	fi
+
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
 	rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index b3d0cd2..0c84c1f 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -47,11 +47,11 @@ RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
 inherit cml1 systemd update-rc.d ptest
 
 # internal helper
-def busybox_cfg(feature, features, tokens, cnf, rem):
+def busybox_cfg(feature, tokens, cnf, rem):
 	if type(tokens) == type(""):
 		tokens = [tokens]
 	rem.extend(['/^[# ]*' + token + '[ =]/d' for token in tokens])
-	if type(features) == type([]) and feature in features:
+	if feature:
 		cnf.extend([token + '=y' for token in tokens])
 	else:
 		cnf.extend(['# ' + token + ' is not set' for token in tokens])
@@ -59,15 +59,14 @@ def busybox_cfg(feature, features, tokens, cnf, rem):
 # Map distro features to config settings
 def features_to_busybox_settings(d):
 	cnf, rem = ([], [])
-	distro_features = d.getVar('DISTRO_FEATURES', True).split()
-	busybox_cfg('ipv6', distro_features, 'CONFIG_FEATURE_IPV6', cnf, rem)
-	busybox_cfg('largefile', distro_features, 'CONFIG_LFS', cnf, rem)
-	busybox_cfg('largefile', distro_features, 'CONFIG_FDISK_SUPPORT_LARGE_DISKS', cnf, rem)
-	busybox_cfg('nls',  distro_features, 'CONFIG_LOCALE_SUPPORT', cnf, rem)
-	busybox_cfg('ipv4', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
-	busybox_cfg('ipv6', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
-	busybox_cfg('wifi', distro_features, 'CONFIG_RFKILL', cnf, rem)
-	busybox_cfg('bluetooth', distro_features, 'CONFIG_RFKILL', cnf, rem)
+	busybox_cfg(base_contains('DISTRO_FEATURES', 'ipv6', True, False, d), 'CONFIG_FEATURE_IPV6', cnf, rem)
+	busybox_cfg(base_contains('DISTRO_FEATURES', 'largefile', True, False, d), 'CONFIG_LFS', cnf, rem)
+	busybox_cfg(base_contains('DISTRO_FEATURES', 'largefile', True, False, d), 'CONFIG_FDISK_SUPPORT_LARGE_DISKS', cnf, rem)
+	busybox_cfg(base_contains('DISTRO_FEATURES', 'nls', True, False, d), 'CONFIG_LOCALE_SUPPORT', cnf, rem)
+	busybox_cfg(base_contains('DISTRO_FEATURES', 'ipv4', True, False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
+	busybox_cfg(base_contains('DISTRO_FEATURES', 'ipv6', True, False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
+	busybox_cfg(base_contains('DISTRO_FEATURES', 'wifi', True, False, d), 'CONFIG_RFKILL', cnf, rem)
+	busybox_cfg(base_contains('DISTRO_FEATURES', 'bluetooth', True, False, d), 'CONFIG_RFKILL', cnf, rem)
 	return "\n".join(cnf), "\n".join(rem)
 
 # X, Y = ${@features_to_uclibc_settings(d)}
@@ -295,7 +294,7 @@ ALTERNATIVE_${PN}-syslog += "syslog-conf"
 ALTERNATIVE_LINK_NAME[syslog-conf] = "${sysconfdir}/syslog.conf"
 
 python () {
-    if 'sysvinit' in d.getVar("DISTRO_FEATURES", True).split():
+    if base_contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
         pn = d.getVar('PN', True)
         d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' syslog-init')
         d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/syslog' % (d.getVar('sysconfdir', True)))
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 6612184..5b99034 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -27,8 +27,7 @@ INITSCRIPT_NAME = "dbus-1"
 INITSCRIPT_PARAMS = "start 02 5 3 2 . stop 20 0 1 6 ."
 
 python __anonymous() {
-    features = d.getVar("DISTRO_FEATURES", True).split()
-    if "sysvinit" not in features:
+    if not oe.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
         d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
 
diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 5d9623d..4262b1d 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -62,14 +62,10 @@ do_install() {
 				  -e 's,/usr/bin,${bindir},g' \
 				  -e 's,/usr,${prefix},g' > ${D}${sysconfdir}/init.d/dropbear
 	chmod 755 ${D}${sysconfdir}/init.d/dropbear
-	for i in ${DISTRO_FEATURES};
-	do
-		if [ ${i} = "pam" ];  then
-			install -d ${D}${sysconfdir}/pam.d
-			install -m 0644 ${WORKDIR}/dropbear  ${D}${sysconfdir}/pam.d/
-		fi
-	done
-
+	if [ "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
+		install -d ${D}${sysconfdir}/pam.d
+		install -m 0644 ${WORKDIR}/dropbear  ${D}${sysconfdir}/pam.d/
+	fi
 }
 
 inherit update-alternatives
diff --git a/meta/recipes-core/systemd/systemd_208.bb b/meta/recipes-core/systemd/systemd_208.bb
index 66e6bee..c1f8d77 100644
--- a/meta/recipes-core/systemd/systemd_208.bb
+++ b/meta/recipes-core/systemd/systemd_208.bb
@@ -271,8 +271,7 @@ INITSCRIPT_NAME_udev = "systemd-udevd"
 INITSCRIPT_PARAMS_udev = "start 03 S ."
 
 python __anonymous() {
-    features = d.getVar("DISTRO_FEATURES", True).split()
-    if "sysvinit" not in features:
+    if not oe.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
         d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
 
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index cc0ab2a..55c6185 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -19,7 +19,7 @@ def get_gcc_fpu_setting(bb, d):
 get_gcc_fpu_setting[vardepvalue] = "${@get_gcc_fpu_setting(bb, d)}"
 
 def get_gcc_mips_plt_setting(bb, d):
-    if d.getVar('TRANSLATED_TARGET_ARCH', True) in [ 'mips', 'mipsel' ] and 'mplt' in d.getVar('DISTRO_FEATURES',1).split() :
+    if d.getVar('TRANSLATED_TARGET_ARCH', True) in [ 'mips', 'mipsel' ] and oe.utils.contains('DISTRO_FEATURES', 'mplt', True, False, d):
         return "--with-mips-plt"
     return ""
 
@@ -32,7 +32,7 @@ def get_gcc_multiarch_setting(bb, d):
         "sparc":   "--enable-targets=all",
     }
 
-    if 'multiarch' in d.getVar('DISTRO_FEATURES', True).split() :
+    if oe.utils.contains('DISTRO_FEATURES', 'multiarch', True, False, d):
         if target_arch in multiarch_options :
             return multiarch_options[target_arch]
     return ""
diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index 1076472..4ffd430 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -18,7 +18,7 @@ do_configure_prepend() {
 inherit autotools pkgconfig systemd
 
 python () {
-    if 'sysvinit' not in d.getVar("DISTRO_FEATURES", True).split():
+    if not oe.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
         pn = d.getVar('PN', True)
         d.setVar('SYSTEMD_SERVICE_%s' % (pn), 'opkg-configure.service')
 }
diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 6999e6b..914ca0f 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -42,7 +42,7 @@ python populate_packages_prepend() {
     # Put all *.t files from the lib dir in the ptest package
     # do_split_packages requires a pair of () in the regex, but we have nothing
     # to match, so use an empty pair.
-    if "ptest" in d.getVar("DISTRO_FEATURES", True).split():
+    if oe.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
         do_split_packages(d, d.expand('${libdir}/perl/${PV}'), '.*\.t()',
             '${PN}-ptest%s', '%s', recursive=True, match_path=True)
 }
diff --git a/meta/recipes-extended/at/at_3.1.14.bb b/meta/recipes-extended/at/at_3.1.14.bb
index f80b620..b0b2848 100644
--- a/meta/recipes-extended/at/at_3.1.14.bb
+++ b/meta/recipes-extended/at/at_3.1.14.bb
@@ -54,10 +54,7 @@ do_install () {
 	install -m 0755    ${WORKDIR}/S99at		${D}${sysconfdir}/init.d/atd
 	ln -sf ../init.d/atd ${D}${sysconfdir}/rcS.d/S99at
 
-	for feature in ${DISTRO_FEATURES}; do
-		if [ "$feature" = "pam" ]; then
-			install -D -m 0644 ${WORKDIR}/${BP}/pam.conf ${D}${sysconfdir}/pam.d/atd
-			break
-		fi
-	done
-}
+	if [ "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
+		install -D -m 0644 ${WORKDIR}/${BP}/pam.conf ${D}${sysconfdir}/pam.d/atd
+	fi
+s}
diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index c9bdcb0..8d0a568 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -110,7 +110,7 @@ do_install() {
 }
 
 python do_pam_sanity () {
-    if "pam" not in d.getVar("DISTRO_FEATURES", True).split():
+    if not base_contains('DISTRO_FEATURES', 'pam', True, False, d):
         bb.warn("Building libpam but 'pam' isn't in DISTRO_FEATURES, PAM won't work correctly")
 }
 addtask pam_sanity before do_configure
diff --git a/meta/recipes-extended/screen/screen_4.0.3.bb b/meta/recipes-extended/screen/screen_4.0.3.bb
index be42fb9..b79b573 100644
--- a/meta/recipes-extended/screen/screen_4.0.3.bb
+++ b/meta/recipes-extended/screen/screen_4.0.3.bb
@@ -36,12 +36,9 @@ EXTRA_OECONF = "--with-pty-mode=0620 --with-pty-group=5 \
                ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
 
 do_install_append () {
-	for feature in ${DISTRO_FEATURES}; do
-		if [ "$feature" = "pam" ]; then
-			install -D -m 644 ${WORKDIR}/screen.pam ${D}/${sysconfdir}/pam.d/screen
-			break
-		fi
-	done
+	if [ "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
+		install -D -m 644 ${WORKDIR}/screen.pam ${D}/${sysconfdir}/pam.d/screen
+	fi
 }
 
 pkg_postinst_${PN} () {
diff --git a/meta/recipes-extended/sudo/sudo_1.8.8.bb b/meta/recipes-extended/sudo/sudo_1.8.8.bb
index ba7c4ab..6ab072f 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.8.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.8.bb
@@ -14,12 +14,9 @@ RDEPENDS_${PN} += " ${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limit
 EXTRA_OECONF += " ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)}"
 
 do_install_append () {
-	for feature in ${DISTRO_FEATURES}; do
-		if [ "$feature" = "pam" ]; then
-			install -D -m 664 ${WORKDIR}/sudo.pam ${D}/${sysconfdir}/pam.d/sudo
-			break
-		fi
-	done
+	if [ "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
+		install -D -m 664 ${WORKDIR}/sudo.pam ${D}/${sysconfdir}/pam.d/sudo
+	fi
 
 	chmod 4111 ${D}${bindir}/sudo
 	chmod 0440 ${D}${sysconfdir}/sudoers
diff --git a/meta/recipes-graphics/wayland/weston_1.3.1.bb b/meta/recipes-graphics/wayland/weston_1.3.1.bb
index 82bcf3b..d97f6af 100644
--- a/meta/recipes-graphics/wayland/weston_1.3.1.bb
+++ b/meta/recipes-graphics/wayland/weston_1.3.1.bb
@@ -55,16 +55,14 @@ do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
 	rm -f ${D}/${libdir}/weston/*.la
 
-	for feature in ${DISTRO_FEATURES}; do
-		# If X11, ship a desktop file to launch it
-		if [ "$feature" = "x11" ]; then
-			install -d ${D}${datadir}/applications
-			install ${WORKDIR}/weston.desktop ${D}${datadir}/applications
+	# If X11, ship a desktop file to launch it
+	if [ "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" = "x11" ]; then
+		install -d ${D}${datadir}/applications
+		install ${WORKDIR}/weston.desktop ${D}${datadir}/applications
 
-			install -d ${D}${datadir}/icons/hicolor/48x48/apps
-			install ${WORKDIR}/weston.png ${D}${datadir}/icons/hicolor/48x48/apps
-                fi
-	done
+		install -d ${D}${datadir}/icons/hicolor/48x48/apps
+		install ${WORKDIR}/weston.png ${D}${datadir}/icons/hicolor/48x48/apps
+        fi
 }
 
 PACKAGES += "${PN}-examples"



