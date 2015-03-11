Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2B0257398C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 21:28:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 11 Mar 2015 14:29:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,384,1422950400"; d="scan'208";a="663951364"
Received: from localhost.jf.intel.com ([10.7.201.37])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2015 14:29:00 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2015 14:28:59 -0700
Message-Id: <1426109339-12975-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] systemd: Instruct the journal to always be volatile
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
X-List-Received-Date: Wed, 11 Mar 2015 21:28:59 -0000

When the storage mode for the journal is "auto" if /var/log/journal
exists then the journal will flush to /var/log/journal assuming that
/var/log/journal is persistent.

However /var/log -> /var/volatile/log in poky, so even though
/var/log/journal exists, it is still volatile.

Since this can cause ordering issues due to /var/volatile needing to be mounted before the journal actually writes to it, just specify that the journal
should always be volatile and never try to write to "persistent"
storage. The journal will exist in /run/log/journal only.

This also disables the "After" of the journal on var-volatile.mount
since the ordering is no longer necessary when the journal is only
stored in /run/log/journal.

[Yocto #7388]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/recipes-core/systemd/systemd/journald-volatile.conf | 6 ------
 meta/recipes-core/systemd/systemd_219.bb                 | 4 ++--
 2 files changed, 2 insertions(+), 8 deletions(-)
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
index d5eed08..f3bb0c4 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -48,7 +48,6 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://00-create-volatile.conf \
            file://init \
            file://run-ptest \
-           file://journald-volatile.conf \
           "
 
 S = "${WORKDIR}/git"
@@ -145,7 +144,6 @@ do_install() {
 	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
 
 	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
-	install -D -m 0644 ${WORKDIR}/journald-volatile.conf ${D}${systemd_unitdir}/system/systemd-journald.service.d/journald-volatile.conf
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
@@ -170,6 +168,8 @@ do_install() {
 
 	# Enable journal to forward message to syslog daemon
 	sed -i -e 's/.*ForwardToSyslog.*/ForwardToSyslog=yes/' ${D}${sysconfdir}/systemd/journald.conf
+	# Make the journal volatile by default.
+	sed -i -e 's/.*Storage.*/Storage=volatile/' ${D}${sysconfdir}/systemd/journald.conf
 	# its needed in 216 upstream has fixed it with 919699ec301ea507edce4a619141ed22e789ac0d
 	# don't order journal flushing afte remote-fs.target
 	sed -i -e 's/ remote-fs.target$//' ${D}${systemd_unitdir}/system/systemd-journal-flush.service
-- 
1.9.3


