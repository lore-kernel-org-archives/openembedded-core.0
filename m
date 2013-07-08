Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 61EC6618B5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 23:10:35 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Jul 2013 16:10:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1023,1363158000"; d="scan'208";a="265635899"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.85])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Jul 2013 16:10:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2013 16:10:35 -0700
Message-Id: <1373325035-29814-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH v2] util-linux: Use PACKAGECONFIG to control pam and system config options
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
X-List-Received-Date: Mon, 08 Jul 2013 23:10:35 -0000

The PACKAGECONFIG will ensure consistent enabling and disabling of the pam and systemd related
options for configure and the correct dependencies

v2: fixed PACKAGECONFIG line continuation grammar
    added _class-target for PACKAGECONFIG to work on target only

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 5bae370..7d50856 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -42,18 +42,17 @@ EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
                 --disable-makeinstall-chown --enable-elvtune --enable-init \
                 --enable-kill --enable-last --enable-mesg --enable-partx \
                 --enable-raw --enable-rdev --enable-reset --disable-login \
-                --disable-vipw --disable-newgrp --disable-chfn-chsh --disable-su \
+                --disable-vipw --disable-newgrp --disable-chfn-chsh \
                 --enable-write --enable-arch --enable-mount --with-fsprobe=builtin \
                 --enable-libuuid --enable-libblkid --enable-fsck --without-udev \
-                --disable-runuser \
 		usrsbin_execdir='${sbindir}' \
 "
+PACKAGECONFIG_class-target ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                                ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} "
+PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, pam,"
 
 # Respect the systemd feature for uuidd
-EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--enable-socket-activation', '--disable-socket-activation', d)}"
-EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
-
-EXTRA_OECONF_append_class-native = " --disable-login --disable-su --disable-runuser"
+PACKAGECONFIG[systemd] = "--enable-socket-activation --with-systemdsystemunitdir=${systemd_unitdir}/system/, --disable-socket-activation --without-systemdsystemunitdir"
 
 FILES_${PN}-bash-completion += "${datadir}/bash-completion"
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
-- 
1.8.1.4


