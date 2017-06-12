Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B44AD7826F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 15:10:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2017 08:10:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,333,1493708400"; d="scan'208";a="98484176"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 12 Jun 2017 08:10:48 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 0EB855806E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 08:10:47 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 18:10:22 +0300
Message-Id: <1497280222-11549-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1497280222-11549-1-git-send-email-maxin.john@intel.com>
References: <1497280222-11549-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] connman: correct the systemd boot in read only rootfs
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
X-List-Received-Date: Mon, 12 Jun 2017 15:10:48 -0000

connman fails to start in systemd based read-only images while creating links:

Jun 08 12:53:56 qemux86-64 systemd[1]: Starting Create Volatile Files
and Directories...
Jun 08 12:53:56 qemux86-64 systemd-tmpfiles[366]:
[[0;1;31msymlink(/var/run/connman/resolv.conf, /etc/resolv.conf) failed:
Read-only file system[[0m

Fix this failure and make connman co-exist with systemd-resolved.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc      | 15 ++++++++++-
 ...vice-stop-systemd-resolved-when-we-use-co.patch | 29 ++++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_1.34.bb  |  1 +
 3 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-resolved-when-we-use-co.patch

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index cc2d469..ab18f2f 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -13,7 +13,7 @@ LICENSE  = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://src/main.c;beginline=1;endline=20;md5=486a279a6ab0c8d152bcda3a5b5edc36"
 
-inherit autotools pkgconfig systemd update-rc.d bluetooth
+inherit autotools pkgconfig systemd update-rc.d bluetooth update-alternatives
 
 DEPENDS  = "dbus glib-2.0 ppp readline"
 
@@ -69,6 +69,11 @@ SYSTEMD_SERVICE_${PN} = "connman.service"
 SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
 SYSTEMD_SERVICE_${PN}-wait-online = "connman-wait-online.service"
 
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} ="resolv-conf"
+ALTERNATIVE_TARGET[resolv-conf] = "${sysconfdir}/resolv-conf.connman"
+ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/resolv.conf"
+
 do_install_append() {
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
@@ -89,6 +94,14 @@ do_install_append() {
 	# Automake 1.12 won't install empty directories, but we need the
 	# plugins directory to be present for ownership
 	mkdir -p ${D}${libdir}/connman/plugins
+
+    # For read-only filesystem, do not create links during bootup
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        if ${@bb.utils.contains('IMAGE_FEATURES','read-only-rootfs','true','false',d)}; then
+            echo "d    /var/run/connman    - - - -" > ${D}${sysconfdir}/tmpfiles.d/connman_resolvconf.conf
+        fi
+        ln -sf ../run/connman/resolv.conf ${D}${sysconfdir}/resolv-conf.connman
+    fi
 }
 
 # These used to be plugins, but now they are core
diff --git a/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-resolved-when-we-use-co.patch b/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-resolved-when-we-use-co.patch
new file mode 100644
index 0000000..8e2e0bd
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-resolved-when-we-use-co.patch
@@ -0,0 +1,29 @@
+From 9f70b94ebf18f52c115634642652830fa77f27a1 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Mon, 12 Jun 2017 16:52:39 +0300
+Subject: [PATCH] connman.service: stop systemd-resolved when we use connman
+
+Stop systemd-resolved service when we use connman as network manager.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ src/connman.service.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/connman.service.in b/src/connman.service.in
+index 9f5c10f..dab48bc 100644
+--- a/src/connman.service.in
++++ b/src/connman.service.in
+@@ -6,6 +6,7 @@ RequiresMountsFor=@localstatedir@/lib/connman
+ After=dbus.service network-pre.target systemd-sysusers.service
+ Before=network.target multi-user.target shutdown.target
+ Wants=network.target
++Conflicts=systemd-resolved.service
+ 
+ [Service]
+ Type=dbus
+-- 
+2.4.0
+
diff --git a/meta/recipes-connectivity/connman/connman_1.34.bb b/meta/recipes-connectivity/connman/connman_1.34.bb
index 5d0f242..d520568 100644
--- a/meta/recipes-connectivity/connman/connman_1.34.bb
+++ b/meta/recipes-connectivity/connman/connman_1.34.bb
@@ -3,6 +3,7 @@ require connman.inc
 SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://0001-firewall-nftables-fix-build-with-libnftnl-1.0.7.patch \
+            file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
             file://connman \
             file://no-version-scripts.patch \
             file://includes.patch \
-- 
2.4.0


