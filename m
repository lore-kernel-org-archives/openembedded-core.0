Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 40D8F60D74
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2013 23:47:33 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Dec 2013 15:47:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,545,1384329600"; d="scan'208";a="457319766"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.16])
	by orsmga002.jf.intel.com with ESMTP; 24 Dec 2013 15:47:33 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Dec 2013 15:47:31 -0800
Message-Id: <1387928852-14853-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [RFC - PATCH 1/2] passwd-initial: add recipe to populate sysroot early
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
X-List-Received-Date: Tue, 24 Dec 2013 23:47:34 -0000

By providing a basic password and group entry with only root, this will
ensure that we have a consistent root user and not read the host's password 
and group files.

[YOCTO #5612]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/base-passwd/passwd-initial.bb | 35 +++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/base-passwd/passwd-initial.bb

diff --git a/meta/recipes-core/base-passwd/passwd-initial.bb b/meta/recipes-core/base-passwd/passwd-initial.bb
new file mode 100644
index 0000000..8d4d5bb
--- /dev/null
+++ b/meta/recipes-core/base-passwd/passwd-initial.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Base system master password/group files for initial sysroot"
+DESCRIPTION = "Initialize the sysroot with a password and group file for pseudo to use"
+SECTION = "base"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+inherit allarch
+
+PACKAGES = ""
+
+do_fetch[noexec] = "1"
+do_unpack[noexec] = "1"
+do_patch[noexec] = "1"
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+do_package[noexec] = "1"
+do_packagedata[noexec] = "1"
+do_package_write[noexec] = "1"
+do_package_write_ipk[noexec] = "1"
+do_package_write_rpm[noexec] = "1"
+do_package_write_deb[noexec] = "1"
+
+do_install() {
+	install -d ${D}/${sysconfdir}
+	echo "root:*:0:0:root:/root:/bin/sh" > ${D}${sysconfdir}/passwd
+	echo "root:*:0:" > ${D}${sysconfdir}/group
+}
+
+
+SYSROOT_PREPROCESS_FUNCS = "fake_passwd_stage_dir"
+fake_passwd_stage_dir() {
+    sysroot_stage_dir ${D}${sysconfdir} ${SYSROOT_DESTDIR}${sysconfdir}
+}
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.8.3.1


