Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E7ADB6B40D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 18:02:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Aug 2013 11:01:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,871,1367996400"; d="scan'208";a="385749338"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.106])
	by fmsmga002.fm.intel.com with ESMTP; 13 Aug 2013 11:01:50 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2013 11:01:50 -0700
Message-Id: <1376416910-21399-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 2/2 v3] meta-skeleton: Add busybox config fragment example
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
X-List-Received-Date: Tue, 13 Aug 2013 18:02:20 -0000

This shows an example of the config fragment support that
both the linux-yocto and busybox recipes use. This example
is specific to busybox.

By adding busybox CONFIG options into a .cfg file and then
adding that .cfg file to SRC_URI the merge_config.sh script will
correctly handle these CONFIG options during the do_configure task.
The merge_config.sh script uses a last-in wins method.

For more details about this, see the Kernel Development Manual Section 2.2.3
http://www.yoctoproject.org/docs/current/kernel-dev/kernel-dev.html#changing-the-configuration

v2: fixed FILESEXTRAPATHS
v3: Fixed kconfig line and added comments

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg   | 1 +
 meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend | 12 +++++
 2 files changed, 6 insertions(+)
 create mode 100644 meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
 create mode 100644 meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend

diff --git a/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg b/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
new file mode 100644
index 0000000..42c6730
--- /dev/null
+++ b/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
@@ -0,0 +1 @@
+# CONFIG_RFKILL is not set
diff --git a/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend b/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
new file mode 100644
index 0000000..641f04a4
--- /dev/null
+++ b/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
@@ -0,0 +1,12 @@
+# Example use of configuration fragments for busybox, which uses the same
+# mechanism as the linux-yocto kernel recipe.
+#
+# The entries here will override any entries in the base busybox recipe
+#
+# More details can be found in the Kernel Dev Manual
+# http://www.yoctoproject.org/docs/current/kernel-dev/kernel-dev.html#changing-the-configuration
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += " \
+	    file://no_rfkill.cfg \
+           "
-- 
1.8.1.4


