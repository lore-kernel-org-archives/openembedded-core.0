Return-Path: <dmitry.rozhkov@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 315BB771DA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 15:43:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Feb 2016 07:41:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,521,1449561600"; d="scan'208";a="897529599"
Received: from drozhkov-desk.fi.intel.com ([10.237.72.185])
	by orsmga001.jf.intel.com with ESMTP; 29 Feb 2016 07:41:40 -0800
From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 17:48:33 +0200
Message-Id: <1456760913-19518-1-git-send-email-dmitry.rozhkov@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH v2] libarchive: Set xattrs after setting times
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
X-List-Received-Date: Mon, 29 Feb 2016 15:43:38 -0000

With Integrity Measurement Architecture (IMA) enabled in Linux
kernel the security.ima extended attribute gets overwritten
when setting times on a file with a futimens() call. So it's safer
to set xattrs after times.

Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/664]

Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
---
 .../0001-Set-xattrs-after-setting-times.patch      | 54 ++++++++++++++++++++++
 .../libarchive/libarchive_3.1.2.bb                 |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Set-xattrs-after-setting-times.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-Set-xattrs-after-setting-times.patch b/meta/recipes-extended/libarchive/libarchive/0001-Set-xattrs-after-setting-times.patch
new file mode 100644
index 0000000..beded5c
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-Set-xattrs-after-setting-times.patch
@@ -0,0 +1,54 @@
+From 545ded56095c570426fe102ff2192889681ea75c Mon Sep 17 00:00:00 2001
+From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
+Date: Mon, 29 Feb 2016 14:38:25 +0200
+Subject: [PATCH] Set xattrs after setting times
+
+With Integrity Measurement Architecture (IMA) enabled Linux
+kernel the security.ima extended attribute gets overwritten
+when setting times on a file with a futimens() call. So it's safer
+to set xattrs after times.
+---
+ libarchive/archive_write_disk_posix.c | 21 +++++++++++----------
+ 1 file changed, 11 insertions(+), 10 deletions(-)
+
+diff --git a/libarchive/archive_write_disk_posix.c b/libarchive/archive_write_disk_posix.c
+index 0fc6193..27c9c1e 100644
+--- a/libarchive/archive_write_disk_posix.c
++++ b/libarchive/archive_write_disk_posix.c
+@@ -1620,16 +1620,6 @@ _archive_write_disk_finish_entry(struct archive *_a)
+	}
+
+	/*
+-	 * Security-related extended attributes (such as
+-	 * security.capability on Linux) have to be restored last,
+-	 * since they're implicitly removed by other file changes.
+-	 */
+-	if (a->todo & TODO_XATTR) {
+-		int r2 = set_xattrs(a);
+-		if (r2 < ret) ret = r2;
+-	}
+-
+-	/*
+	 * Some flags prevent file modification; they must be restored after
+	 * file contents are written.
+	 */
+@@ -1648,6 +1638,17 @@ _archive_write_disk_finish_entry(struct archive *_a)
+	}
+
+	/*
++	 * Security-related extended attributes (such as
++	 * security.capability or security.ima on Linux) have to be restored last,
++	 * since they're implicitly removed by other file changes like setting
++	 * times.
++	 */
++	if (a->todo & TODO_XATTR) {
++		int r2 = set_xattrs(a);
++		if (r2 < ret) ret = r2;
++	}
++
++	/*
+	 * Mac extended metadata includes ACLs.
+	 */
+	if (a->todo & TODO_MAC_METADATA) {
+--
+2.5.0
diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
index 89c8faf..ed677ac 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://pkgconfig.patch \
            file://libarchive-CVE-2015-2304.patch \
            file://mkdir.patch \
+           file://0001-Set-xattrs-after-setting-times.patch \
            "
 
 SRC_URI[md5sum] = "efad5a503f66329bb9d2f4308b5de98a"
-- 
2.5.0


