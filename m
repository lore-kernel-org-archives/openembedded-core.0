Return-Path: <reinette.chatre@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 788A57404E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 22:38:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 24 Sep 2015 15:38:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,583,1437462000"; d="scan'208";a="796781687"
Received: from rchatre-builder.jf.intel.com ([10.54.39.14])
	by fmsmga001.fm.intel.com with ESMTP; 24 Sep 2015 15:38:33 -0700
From: Reinette Chatre <reinette.chatre@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 15:41:01 -0700
Message-Id: <57feac174ac90daeecb414a03910bf4e5cb244f0.1443134176.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.4.3
Subject: [PATCH] systemd: replace ${exec_prefix}/lib with ${nonarch_libdir}
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
X-List-Received-Date: Thu, 24 Sep 2015 22:38:35 -0000

In meta/conf/bitbake.conf there is:
export nonarch_libdir = "${exec_prefix}/lib"

We can thus replace the uses of ${exec_prefix}/lib with ${nonarch_libdir}

Suggested-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
 meta/recipes-core/systemd/systemd_225.bb | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index ef8d297..b15d993 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -189,8 +189,8 @@ do_install() {
 	sed -i -e 's/.*ForwardToSyslog.*/ForwardToSyslog=yes/' ${D}${sysconfdir}/systemd/journald.conf
 	# this file is needed to exist if networkd is disabled but timesyncd is still in use since timesyncd checks it
 	# for existence else it fails
-	if [ -s ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf ]; then
-		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf', d)}
+	if [ -s ${D}${nonarch_libdir}/tmpfiles.d/systemd.conf ]; then
+		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${nonarch_libdir}/tmpfiles.d/systemd.conf', d)}
 	fi
 	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
 }
@@ -246,9 +246,9 @@ FILES_${PN}-vconsole-setup = "${rootlibexecdir}/systemd/systemd-vconsole-setup \
 RDEPENDS_${PN}-kernel-install += "bash"
 FILES_${PN}-kernel-install = "${bindir}/kernel-install \
                               ${sysconfdir}/kernel/ \
-                              ${exec_prefix}/lib/kernel \
+                              ${nonarch_libdir}/kernel \
                              "
-FILES_${PN}-rpm-macros = "${exec_prefix}/lib/rpm \
+FILES_${PN}-rpm-macros = "${nonarch_libdir}/rpm \
                          "
 
 FILES_${PN}-xorg-xinitrc = "${sysconfdir}/X11/xinit/xinitrc.d/*"
@@ -256,7 +256,7 @@ FILES_${PN}-xorg-xinitrc = "${sysconfdir}/X11/xinit/xinitrc.d/*"
 FILES_${PN}-zsh = "${datadir}/zsh/site-functions"
 
 FILES_${PN}-binfmt = "${sysconfdir}/binfmt.d/ \
-                      ${exec_prefix}/lib/binfmt.d \
+                      ${nonarch_libdir}/binfmt.d \
                       ${rootlibexecdir}/systemd/systemd-binfmt \
                       ${systemd_unitdir}/system/proc-sys-fs-binfmt_misc.* \
                       ${systemd_unitdir}/system/systemd-binfmt.service"
@@ -298,11 +298,11 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${bindir}/timedatectl \
                 ${bindir}/bootctl \
                 ${bindir}/kernel-install \
-                ${exec_prefix}/lib/tmpfiles.d/*.conf \
-                ${exec_prefix}/lib/systemd \
-                ${exec_prefix}/lib/modules-load.d \
-                ${exec_prefix}/lib/sysctl.d \
-                ${exec_prefix}/lib/sysusers.d \
+                ${nonarch_libdir}/tmpfiles.d/*.conf \
+                ${nonarch_libdir}/systemd \
+                ${nonarch_libdir}/modules-load.d \
+                ${nonarch_libdir}/sysctl.d \
+                ${nonarch_libdir}/sysusers.d \
                 ${localstatedir} \
                 ${nonarch_base_libdir}/udev/rules.d/70-uaccess.rules \
                 ${nonarch_base_libdir}/udev/rules.d/71-seat.rules \
-- 
2.4.3


