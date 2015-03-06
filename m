Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 39A5B71637
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 02:11:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Mar 2015 18:10:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,350,1422950400"; d="scan'208";a="694699823"
Received: from localhost.jf.intel.com ([10.7.201.37])
	by orsmga002.jf.intel.com with ESMTP; 05 Mar 2015 18:11:49 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Mar 2015 18:11:46 -0800
Message-Id: <1425607906-21810-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] systemd: Fix the problem of an empty journal on boot
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
X-List-Received-Date: Fri, 06 Mar 2015 02:11:59 -0000

systemd by default tries to write the journal to /var/log/journal.
But base-files has a symlink /var/log -> /var/volatile/log. And
/var/volatile is a tmpfs mount in /etc/fstab.

If the journal service started before /var/volatile was mounted (which
was the typical scenario) then the journal would appear empty since
the old location was mounted over.

This change fixes the problem by ensuring that the journal doesn't start
until after the mount happens.

[Yocto #7388]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/recipes-core/systemd/systemd/journald-volatile.conf | 6 ++++++
 meta/recipes-core/systemd/systemd_219.bb                 | 2 ++
 2 files changed, 8 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/journald-volatile.conf

diff --git a/meta/recipes-core/systemd/systemd/journald-volatile.conf b/meta/recipes-core/systemd/systemd/journald-volatile.conf
new file mode 100644
index 0000000..b11e160
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/journald-volatile.conf
@@ -0,0 +1,6 @@
+# If /var/volatile is a mount point then make sure to mount it before
+# the journal starts. This is because base-files creates a symlink
+# /var/log -> /var/volatile/log. And if the journal starts before the mount
+# happens, the journal will appear empty until restarted.
+[Unit]
+After=var-volatile.mount
diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index 3c4b6cf..2be66af 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -48,6 +48,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://00-create-volatile.conf \
            file://init \
            file://run-ptest \
+           file://journald-volatile.conf \
           "
 
 S = "${WORKDIR}/git"
@@ -143,6 +144,7 @@ do_install() {
 	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
 
 	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+	install -D -m 0644 ${WORKDIR}/journald-volatile.conf ${D}${systemd_unitdir}/system/systemd-journald.service.d/journald-volatile.conf
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
-- 
1.9.3


