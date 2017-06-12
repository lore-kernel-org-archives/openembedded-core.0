Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3B7527826F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 15:10:50 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2017 08:10:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,333,1493708400"; d="scan'208";a="112135958"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 12 Jun 2017 08:10:45 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id A12E25806E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 08:10:44 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 18:10:21 +0300
Message-Id: <1497280222-11549-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1497280222-11549-1-git-send-email-maxin.john@intel.com>
References: <1497280222-11549-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 1/2] systemd: enable resolved and networkd
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
X-List-Received-Date: Mon, 12 Jun 2017 15:10:51 -0000

Enable systemd-resolved and systemd-networkd by default.
Make it co-exist with connman and  Fix associated problems
in read-only rootfs.

Fixes [YOCTO #11331]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-core/systemd/systemd_232.bb | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
index f843c58..6aeccbd 100644
--- a/meta/recipes-core/systemd/systemd_232.bb
+++ b/meta/recipes-core/systemd/systemd_232.bb
@@ -62,6 +62,8 @@ PACKAGECONFIG ??= "xz \
                    firstboot \
                    utmp \
                    polkit \
+                   resolved \
+                   networkd \
 "
 PACKAGECONFIG_remove_libc-musl = "selinux"
 PACKAGECONFIG_remove_libc-musl = "smack"
@@ -244,9 +246,10 @@ do_install() {
 		echo 'L! ${sysconfdir}/resolv.conf - - - - ../run/systemd/resolve/resolv.conf' >>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
 		echo 'd /run/systemd/resolve 0755 root root -' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
 		echo 'f /run/systemd/resolve/resolv.conf 0644 root root' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
-		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv.conf
+		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
 	else
 		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf%g" ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
+		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
 	fi
 	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
 }
@@ -451,7 +454,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${sysconfdir}/tmpfiles.d/ \
                 ${sysconfdir}/xdg/ \
                 ${sysconfdir}/init.d/README \
-                ${sysconfdir}/resolv.conf \
+                ${sysconfdir}/resolv-conf.systemd \
                 ${rootlibexecdir}/systemd/* \
                 ${systemd_unitdir}/* \
                 ${base_libdir}/security/*.so \
@@ -535,7 +538,7 @@ python __anonymous() {
 # TODO:
 # u-a for runlevel and telinit
 
-ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel"
+ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel resolv-conf"
 
 ALTERNATIVE_TARGET[init] = "${rootlibexecdir}/systemd/systemd"
 ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
@@ -561,6 +564,10 @@ ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
 ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
 ALTERNATIVE_PRIORITY[runlevel] ?= "300"
 
+ALTERNATIVE_TARGET[resolv-conf] = "${sysconfdir}/resolv-conf.systemd"
+ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/resolv.conf"
+ALTERNATIVE_PRIORITY[resolv-conf] ?= "50"
+
 pkg_postinst_${PN} () {
 	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
 		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' \
-- 
2.4.0


