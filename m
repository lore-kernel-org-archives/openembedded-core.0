Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E9C0C6612D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 01:48:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBC1mEWV006400
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 17:48:14 -0800 (PST)
Received: from localhost (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 11 Dec 2017 17:48:13 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <dengke.du@windriver.com>
Date: Tue, 12 Dec 2017 09:46:23 +0800
Message-ID: <1513043183-22417-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513043183-22417-1-git-send-email-yi.zhao@windriver.com>
References: <1513043183-22417-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.134]
Subject: [PATCH V2] avahi: upgrade to 0.7
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
X-List-Received-Date: Tue, 12 Dec 2017 01:48:13 -0000
Content-Type: text/plain

From: Dengke Du <dengke.du@windriver.com>

Delete the unneeded patch, because the upstream contains the needed changes.
The new version of avahi 0.7 use "/run" directory to place some run-time
variable data, not /var/run, so in avahi.inc, we should remove the "/run"
not "/var/run".

Remove PACKAGECONFIG for pygtk which already dropped in upstream.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../avahi/{avahi-ui_0.6.32.bb => avahi-ui_0.7.bb}  |  6 ++---
 meta/recipes-connectivity/avahi/avahi.inc          | 14 +++-------
 .../avahi/{avahi_0.6.32.bb => avahi_0.7.bb}        |  6 ++---
 ...c-install-GtkBuilder-interface-files-for-.patch | 29 ---------------------
 .../files/avahi-fix-resource-unavaiable.patch      | 30 ----------------------
 5 files changed, 8 insertions(+), 77 deletions(-)
 rename meta/recipes-connectivity/avahi/{avahi-ui_0.6.32.bb => avahi-ui_0.7.bb} (89%)
 rename meta/recipes-connectivity/avahi/{avahi_0.6.32.bb => avahi_0.7.bb} (78%)
 delete mode 100644 meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBuilder-interface-files-for-.patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/avahi-fix-resource-unavaiable.patch

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
similarity index 89%
rename from meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
rename to meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
index ac36461..5648e38 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
@@ -9,9 +9,8 @@ require avahi.inc
 inherit distro_features_check
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI += "file://0001-configure.ac-install-GtkBuilder-interface-files-for-.patch"
-SRC_URI[md5sum] = "22b5e705d3eabb31d26f2e1e7b074013"
-SRC_URI[sha256sum] = "d54991185d514a0aba54ebeb408d7575b60f5818a772e28fa0e18b98bc1db454"
+SRC_URI[md5sum] = "d76c59d0882ac6c256d70a2a585362a6"
+SRC_URI[sha256sum] = "57a99b5dfe7fdae794e3d1ee7a62973a368e91e414bd0dfa5d84434de5b14804"
 
 DEPENDS += "avahi"
 
@@ -52,7 +51,6 @@ do_install_append () {
 	rm ${D}${libdir}/pkgconfig/avahi-g*
 	rm ${D}${sbindir} -rf
 	rm ${D}${datadir}/avahi/a*
-	rm ${D}${datadir}/avahi/s*
 	rm ${D}${datadir}/locale/ -rf
 	rm ${D}${datadir}/dbus* -rf
 	rm ${D}${mandir}/man1/a*
diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 7814464..ef655de 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -23,21 +23,20 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
           "
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
 
-# For gtk related PACKAGECONFIGs: gtk, gtk3 and pygtk
+# For gtk related PACKAGECONFIGs: gtk, gtk3
 AVAHI_GTK ?= ""
 
 PACKAGECONFIG ??= "dbus ${AVAHI_GTK}"
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+"
 PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3,gtk+3"
-PACKAGECONFIG[pygtk] = "--enable-pygtk,--disable-pygtk,"
 
 USERADD_PACKAGES = "avahi-daemon avahi-autoipd"
-USERADD_PARAM_avahi-daemon = "--system --home /var/run/avahi-daemon \
+USERADD_PARAM_avahi-daemon = "--system --home /run/avahi-daemon \
                               --no-create-home --shell /bin/false \
                               --user-group avahi"
 
-USERADD_PARAM_avahi-autoipd = "--system --home /var/run/avahi-autoipd \
+USERADD_PARAM_avahi-autoipd = "--system --home /run/avahi-autoipd \
                               --no-create-home --shell /bin/false \
                               --user-group \
                               -c \"Avahi autoip daemon\" \
@@ -125,12 +124,7 @@ INITSCRIPT_PARAMS_avahi-dnsconfd = "defaults 22 19"
 
 do_install() {
 	autotools_do_install
-
-	# don't install /var/run when populating rootfs. Do it through volatile
-	# /var/run of current version is empty, so just remove it.
-	# if /var/run become non-empty in the future, need to install it via volatile
-	rm -rf ${D}${localstatedir}/run
-	rmdir --ignore-fail-on-non-empty ${D}${localstatedir}
+	rm -rf ${D}/run
 	rm -rf ${D}${datadir}/dbus-1/interfaces
 	test -d ${D}${datadir}/dbus-1 && rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
 	rm -rf ${D}${libdir}/avahi
diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.32.bb b/meta/recipes-connectivity/avahi/avahi_0.7.bb
similarity index 78%
rename from meta/recipes-connectivity/avahi/avahi_0.6.32.bb
rename to meta/recipes-connectivity/avahi/avahi_0.7.bb
index bfa6304..7c91f10 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.6.32.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.7.bb
@@ -12,10 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
                     file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
 
-SRC_URI += "file://avahi-fix-resource-unavaiable.patch"
-
-SRC_URI[md5sum] = "22b5e705d3eabb31d26f2e1e7b074013"
-SRC_URI[sha256sum] = "d54991185d514a0aba54ebeb408d7575b60f5818a772e28fa0e18b98bc1db454"
+SRC_URI[md5sum] = "d76c59d0882ac6c256d70a2a585362a6"
+SRC_URI[sha256sum] = "57a99b5dfe7fdae794e3d1ee7a62973a368e91e414bd0dfa5d84434de5b14804"
 
 DEPENDS += "intltool-native"
 
diff --git a/meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBuilder-interface-files-for-.patch b/meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBuilder-interface-files-for-.patch
deleted file mode 100644
index 942607a..0000000
--- a/meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBuilder-interface-files-for-.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 6ff255eff4fea6350b5e0462fee176fadc26fc1c Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Sun, 12 Jun 2016 18:32:49 +0300
-Subject: [PATCH] configure.ac: install GtkBuilder interface files for GTK+3
- too
-
-Upstream-Status: Submitted [https://github.com/lathiat/avahi/pull/130]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 87a9a17..9860dcc 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -965,7 +965,7 @@ AC_SUBST(avahi_socket)
- #
- # Avahi interfaces dir
- #
--if test "x$HAVE_PYTHON_DBUS" = "xyes" -o "x$HAVE_GTK" = "xyes"; then
-+if test "x$HAVE_PYTHON_DBUS" = "xyes" -o "x$HAVE_GTK" = "xyes" -o "x$HAVE_GTK3" = "xyes"; then
- 	interfacesdir="${datadir}/${PACKAGE}/interfaces/"
- 	AC_SUBST(interfacesdir)
- fi
--- 
-2.8.1
-
diff --git a/meta/recipes-connectivity/avahi/files/avahi-fix-resource-unavaiable.patch b/meta/recipes-connectivity/avahi/files/avahi-fix-resource-unavaiable.patch
deleted file mode 100644
index 5a2fd75..0000000
--- a/meta/recipes-connectivity/avahi/files/avahi-fix-resource-unavaiable.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Backport
-
-Backport from:
-https://github.com/experimental-platform/platform-hostname-avahi/pull/9
-
-It sometimes fails to run avahi with error: "Could not receive return value
-from daemon process". It has same root cause with
-https://github.com/lxc/lxc/issues/25.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From 5150983102ad5ad43f0dae203cb332c168eb5a71 Mon Sep 17 00:00:00 2001
-From: Hinnerk Haardt <haardt@information-control.de>
-Date: Thu, 17 Dec 2015 11:52:19 +0100
-Subject: [PATCH] Fix `chroot.c: fork() failed: Resource temporarily
- unavailable` as per https://github.com/lxc/lxc/issues/25.
-
----
- avahi-daemon/avahi-daemon.conf | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/avahi-daemon/avahi-daemon.conf b/avahi-daemon/avahi-daemon.conf
-index 95166f8..3d5b7a6 100644
---- a/avahi-daemon/avahi-daemon.conf
-+++ b/avahi-daemon/avahi-daemon.conf
-@@ -65,4 +65,3 @@ rlimit-data=4194304
- rlimit-fsize=0
- rlimit-nofile=768
- rlimit-stack=4194304
--rlimit-nproc=3
-- 
2.7.4


