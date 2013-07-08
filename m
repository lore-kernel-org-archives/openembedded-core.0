Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 2857E6A5A5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 15:52:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 08 Jul 2013 08:52:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1021,1363158000"; d="scan'208";a="362092579"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.85])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jul 2013 08:53:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2013 08:52:03 -0700
Message-Id: <1373298723-12460-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1373298723-12460-1-git-send-email-sgw@linux.intel.com>
References: <1373298723-12460-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2] util-linux: Use PACKAGECONFIG to control pam and system config options
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
X-List-Received-Date: Mon, 08 Jul 2013 15:52:23 -0000

The PACKAGECONFIG will ensure consistent enabling and disabling of the pam and systemd related
options for configure and the correct dependencies

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 5bae370..c7da4ed 100644
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
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \"
+                   ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \"
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


