Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9C76A6AC33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 00:28:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Mar 2015 17:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,455,1422950400"; d="scan'208";a="669540458"
Received: from bitbang.jf.intel.com ([10.7.201.37])
	by orsmga001.jf.intel.com with ESMTP; 23 Mar 2015 17:28:17 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Mar 2015 17:28:14 -0700
Message-Id: <1427156894-24614-3-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1427156894-24614-1-git-send-email-randy.e.witt@linux.intel.com>
References: <1427156894-24614-1-git-send-email-randy.e.witt@linux.intel.com>
Subject: [PATCH 2/2] image.bbclass: Empty /var/volatile if it is a mount point
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

If /var/volatile is a mount point it shouldn't contain any files before
mount time. If files are there, they will no longer be able to be accessed
once the tmpfs gets mounted at /var/volatile.

This problem can be seen for instance when systemd creates
/var/volatile/log/journal as part of its package installation. It then
assumes the journal is persistent even though /var/volatile/log/journal
goes away shortly thereafter.

This change makes sure that there are no files in /var/volatile if it is
to be used as a mount point.

[Yocto #7388]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/image.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 89eb5f3..dfedf9d 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -181,6 +181,8 @@ POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
 SYSTEMD_DEFAULT_TARGET ?= '${@bb.utils.contains("IMAGE_FEATURES", "x11-base", "graphical.target", "multi-user.target", d)}'
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target; ", "", d)}'
 
+ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
+
 # some default locales
 IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
 
@@ -377,6 +379,20 @@ set_systemd_default_target () {
 	fi
 }
 
+# If /var/volatile is not empty, we have seen problems where programs such as the
+# journal make assumptions based on the contents of /var/volatile. The journal
+# would then write to /var/volatile before it was mounted, thus hiding the
+# items previously written.
+#
+# This change is to attempt to fix those types of issues in a way that doesn't
+# affect users that may not be using /var/volatile.
+empty_var_volatile () {
+	match=`awk '$1 !~ "#" && $2 ~ /\/var\/volatile/{print $2}' ${IMAGE_ROOTFS}/etc/fstab 2> /dev/null`
+	if [ -n "$match" ]; then
+		find ${IMAGE_ROOTFS}/var/volatile -mindepth 1 -delete
+	fi
+}
+
 # Turn any symbolic /sbin/init link into a file
 remove_init_link () {
 	if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
-- 
1.9.3


