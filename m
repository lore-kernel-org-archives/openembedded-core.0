Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CCDF673BEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 00:28:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Mar 2015 17:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,455,1422950400"; d="scan'208";a="669540457"
Received: from bitbang.jf.intel.com ([10.7.201.37])
	by orsmga001.jf.intel.com with ESMTP; 23 Mar 2015 17:28:17 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Mar 2015 17:28:13 -0700
Message-Id: <1427156894-24614-2-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1427156894-24614-1-git-send-email-randy.e.witt@linux.intel.com>
References: <1427156894-24614-1-git-send-email-randy.e.witt@linux.intel.com>
Subject: [PATCH 1/2] Revert "systemd: Fix the problem of an empty journal on boot"
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
X-List-Received-Date: Tue, 24 Mar 2015 00:28:16 -0000

This reverts commit e75c95ceca34879698b1ea229a2101dc1ccc12fc. The fix
was reported to cause long waits for some users.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/recipes-core/systemd/systemd/journald-volatile.conf | 6 ------
 meta/recipes-core/systemd/systemd_219.bb                 | 2 --
 2 files changed, 8 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/journald-volatile.conf

diff --git a/meta/recipes-core/systemd/systemd/journald-volatile.conf b/meta/recipes-core/systemd/systemd/journald-volatile.conf
deleted file mode 100644
index b11e160..0000000
--- a/meta/recipes-core/systemd/systemd/journald-volatile.conf
+++ /dev/null
@@ -1,6 +0,0 @@
-# If /var/volatile is a mount point then make sure to mount it before
-# the journal starts. This is because base-files creates a symlink
-# /var/log -> /var/volatile/log. And if the journal starts before the mount
-# happens, the journal will appear empty until restarted.
-[Unit]
-After=var-volatile.mount
diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index f2d3c13..43c4f95 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -51,7 +51,6 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master \
            file://00-create-volatile.conf \
            file://init \
            file://run-ptest \
-           file://journald-volatile.conf \
           "
 
 S = "${WORKDIR}/git"
@@ -153,7 +152,6 @@ do_install() {
 	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
 
 	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
-	install -D -m 0644 ${WORKDIR}/journald-volatile.conf ${D}${systemd_unitdir}/system/systemd-journald.service.d/journald-volatile.conf
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
-- 
1.9.3


