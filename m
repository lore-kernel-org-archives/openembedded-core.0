Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5EC7C6AFD4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 22:26:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2013 15:24:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,991,1363158000"; d="scan'208";a="340154931"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.183])
	by orsmga001.jf.intel.com with ESMTP; 03 Jul 2013 15:26:30 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2013 15:26:23 -0700
Message-Id: <c9b8490c65d03e9bc3f603d2a3a20ea680c089aa.1372890071.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1372890071.git.sgw@linux.intel.com>
References: <cover.1372890071.git.sgw@linux.intel.com>
In-Reply-To: <cover.1372890071.git.sgw@linux.intel.com>
References: <cover.1372890071.git.sgw@linux.intel.com>
Subject: [PATCH 2/8] util-linux: disable runuser by default since it depends on PAM
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
X-List-Received-Date: Wed, 03 Jul 2013 22:26:29 -0000

util-linux's configure checks for pam_misc.h and if it finds it will
enable runuser, there was a case where it was found via shared state
and then got rebuilt. This makes the build more deterministic.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 0ada1a5..5bae370 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -45,6 +45,7 @@ EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
                 --disable-vipw --disable-newgrp --disable-chfn-chsh --disable-su \
                 --enable-write --enable-arch --enable-mount --with-fsprobe=builtin \
                 --enable-libuuid --enable-libblkid --enable-fsck --without-udev \
+                --disable-runuser \
 		usrsbin_execdir='${sbindir}' \
 "
 
@@ -52,7 +53,7 @@ EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
 EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--enable-socket-activation', '--disable-socket-activation', d)}"
 EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-EXTRA_OECONF_append_class-native = " --disable-login --disable-su"
+EXTRA_OECONF_append_class-native = " --disable-login --disable-su --disable-runuser"
 
 FILES_${PN}-bash-completion += "${datadir}/bash-completion"
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
-- 
1.8.1.4


