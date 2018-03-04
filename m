Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 01B4278A96
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 22:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0452C20B84;
	Sun,  4 Mar 2018 22:58:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 3YSqOsHHxZJb; Sun,  4 Mar 2018 22:58:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C3A7C20B2F;
	Sun,  4 Mar 2018 22:58:26 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 0BA191632FA;
	Sun,  4 Mar 2018 17:58:26 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 17:58:12 -0500
Message-Id: <1520204294-38993-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [rocko][PATCH 1/3] busybox: separate inittab into own package, due to SERIAL_CONSOLES being machine-specific
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
X-List-Received-Date: Sun, 04 Mar 2018 22:58:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Create busybox-inittab recipe to produce machine-specific package with /etc/inittab
  and necessary getty calls for a machine, based on SERIAL_CONSOLES, similar to how
  sysvinit-inittab was done

* Since CONFIG_FEATURE_USE_INITTAB is controlled by VIRTUAL-RUNTIME_init_manager, make
  main busybox package RDEPENDS on busybox-inittab when init_manager is set to busybox

(From OE-Core rev: afb09abd2f0f7555ba156260a87fd3867f591310)

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-core/busybox/busybox-inittab_1.24.1.bb | 32 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox.inc              | 12 ++------
 2 files changed, 34 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox-inittab_1.24.1.bb

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.24.1.bb b/meta/recipes-core/busybox/busybox-inittab_1.24.1.bb
new file mode 100644
index 0000000..a83620e
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox-inittab_1.24.1.bb
@@ -0,0 +1,32 @@
+SUMMARY = "inittab configuration for BusyBox"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+SRC_URI = "file://inittab"
+
+S = "${WORKDIR}"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+do_compile() {
+	:
+}
+
+do_install() {
+    install -d ${D}${sysconfdir}
+    install -D -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
+    tmp="${SERIAL_CONSOLES}"
+    for i in $tmp
+    do
+            j=`echo ${i} | sed s/\;/\ /g`
+            id=`echo ${i} | sed -e 's/^.*;//' -e 's/;.*//'`
+            echo "$id::respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
+    done
+}
+
+# SERIAL_CONSOLES is generally defined by the MACHINE .conf.
+# Set PACKAGE_ARCH appropriately.
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+FILES_${PN} = "${sysconfdir}/inittab"
+CONFFILES_${PN} = "${sysconfdir}/inittab"
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 48910ca..a6bfd46 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -48,6 +48,8 @@ CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
 
 RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
 
+RDEPENDS_${PN} = "${@["", "busybox-inittab"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]}"
+
 inherit cml1 systemd update-rc.d ptest
 
 # internal helper
@@ -292,16 +294,6 @@ do_install () {
                 install -D -m 0777 ${WORKDIR}/rcS ${D}${sysconfdir}/init.d/rcS
                 install -D -m 0777 ${WORKDIR}/rcK ${D}${sysconfdir}/init.d/rcK
                 install -D -m 0755 ${WORKDIR}/runlevel ${D}${base_sbindir}/runlevel
-                if grep "CONFIG_FEATURE_USE_INITTAB=y" ${B}/.config; then
-                        install -D -m 0777 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
-                        tmp="${SERIAL_CONSOLES}"
-                        for i in $tmp
-                        do
-                                j=`echo ${i} | sed s/\;/\ /g`
-                                id=`echo ${i} | sed -e 's/^.*;//' -e 's/;.*//'`
-                                echo "$id::respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
-                        done
-                fi
         fi
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-- 
2.7.4


