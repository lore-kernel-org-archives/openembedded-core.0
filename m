Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 27F1C6017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 22:15:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 06 Mar 2015 14:15:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,355,1422950400"; d="scan'208";a="661648960"
Received: from localhost.jf.intel.com ([10.7.201.37])
	by orsmga001.jf.intel.com with ESMTP; 06 Mar 2015 14:15:37 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Mar 2015 14:15:33 -0800
Message-Id: <1425680133-32013-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] systemd: Fix journal "Failed to set file attributes:" warning
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
X-List-Received-Date: Fri, 06 Mar 2015 22:15:36 -0000

This is a backport of an upstream patch that fixes the
"Failed to set file attributes: Inappropriate ioctl for device" message
when the device exists on ext4 filesystems.

No functionality is changed, the patch just removes a potentially misleading
warning.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 ...ix-Inappropriate-ioctl-for-device-on-ext4.patch | 37 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_219.bb           |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0013-journal-fix-Inappropriate-ioctl-for-device-on-ext4.patch

diff --git a/meta/recipes-core/systemd/systemd/0013-journal-fix-Inappropriate-ioctl-for-device-on-ext4.patch b/meta/recipes-core/systemd/systemd/0013-journal-fix-Inappropriate-ioctl-for-device-on-ext4.patch
new file mode 100644
index 0000000..a49d626
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0013-journal-fix-Inappropriate-ioctl-for-device-on-ext4.patch
@@ -0,0 +1,37 @@
+From 65eae3b76243d2dfd869f8c43b787575f7b4b994 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Cristian=20Rodr=C3=ADguez?= <crrodriguez@opensuse.org>
+Date: Sun, 1 Mar 2015 21:13:10 -0300
+Subject: [PATCH] journal: fix Inappropriate ioctl for device on ext4
+
+Logs constantly show
+
+systemd-journald[395]: Failed to set file attributes: Inappropriate ioctl for device
+
+This is because ext4 does not support FS_NOCOW_FL.
+
+[zj: fold into one conditional as suggested on the ML and
+     fix (preexisting) r/errno confusion in error message.]
+
+Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
+---
+ src/journal/journal-file.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/journal/journal-file.c b/src/journal/journal-file.c
+index 9c9a548..0e33a0f 100644
+--- a/src/journal/journal-file.c
++++ b/src/journal/journal-file.c
+@@ -2609,8 +2609,8 @@ int journal_file_open(
+                  * shouldn't be too bad, given that we do our own
+                  * checksumming). */
+                 r = chattr_fd(f->fd, true, FS_NOCOW_FL);
+-                if (r < 0)
+-                        log_warning_errno(errno, "Failed to set file attributes: %m");
++                if (r < 0 && r != -ENOTTY)
++                        log_warning_errno(r, "Failed to set file attributes: %m");
+ 
+                 /* Let's attach the creation time to the journal file,
+                  * so that the vacuuming code knows the age of this
+-- 
+1.9.3
+
diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index 2be66af..4fa1fb2 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -43,6 +43,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://0001-tmpfiles-avoid-creating-duplicate-acl-entries.patch \
            file://0002-tmpfiles-quietly-ignore-ACLs-on-unsupported-filesyst.patch \
            file://0012-systemd-tmpfiles.c-Honor-ordering-within-files-as-th.patch \
+           file://0013-journal-fix-Inappropriate-ioctl-for-device-on-ext4.patch \
            file://tmpfiles-pam.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
-- 
1.9.3


