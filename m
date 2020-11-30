Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.53737.1606698751849314392
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Nov 2020 17:12:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: WTYWB5p/XAt02fmonpx98nKY688IFo7ZixC3LIhmHsMPkSs8aUP8rdl1s6bqmmJcuMUYOVC+ZN
 LuapdPGmE4cA==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="170004452"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="170004452"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:27 -0800
IronPort-SDR: B6LAOTqS3RasFqtVcmGc5MGmezL9hY99OAtKLyco2cqeDXiYCcFxFP82BRmUldm4CjyHto0aPO
 n75ZjyByyoLQ==
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="372302748"
Received: from ajraj-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.114.166])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:25 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 21/21] lttng-modules: Backport a patch to fix btrfs build failure
Date: Mon, 30 Nov 2020 09:11:36 +0800
Message-Id: <af428fa2432279d24cdf2a62f9dee91b30d46c3a.1606698421.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606698421.git.anuj.mittal@intel.com>
References: <cover.1606698421.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: He Zhe <zhe.he@windriver.com>

lttng-modules-2.12.3/probes/lttng-probe-btrfs.c:36:
lttng-modules-2.12.3/probes/../probes/lttng-tracepoint-event-impl.h:131:6:
error: conflicting types for 'trace_find_free_extent'

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 42c791ab3815b47188fdd98998cdcb3d2c62ef20)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...oints-output-proper-root-owner-for-t.patch | 318 ++++++++++++++++++
 .../lttng/lttng-modules_2.12.3.bb             |   1 +
 2 files changed, 319 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-tracepoints-output-proper-root-owner-for-t.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-tracepoints-output-proper-root-owner-for-t.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-tracepoints-output-proper-root-owner-for-t.patch
new file mode 100644
index 0000000000..956f53d7b7
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-tracepoints-output-proper-root-owner-for-t.patch
@@ -0,0 +1,318 @@
+From e13a7d262928984154fcf89feb14098e0cd1ad31 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 27 Oct 2020 11:42:23 -0400
+Subject: [PATCH 04/11] fix: btrfs: tracepoints: output proper root owner for
+ trace_find_free_extent() (v5.10)
+
+See upstream commit :
+
+  commit 437490fed3b0c9ae21af8f70e0f338d34560842b
+  Author: Qu Wenruo <wqu@suse.com>
+  Date:   Tue Jul 28 09:42:49 2020 +0800
+
+    btrfs: tracepoints: output proper root owner for trace_find_free_extent()
+
+    The current trace event always output result like this:
+
+     find_free_extent: root=2(EXTENT_TREE) len=16384 empty_size=0 flags=4(METADATA)
+     find_free_extent: root=2(EXTENT_TREE) len=16384 empty_size=0 flags=4(METADATA)
+     find_free_extent: root=2(EXTENT_TREE) len=8192 empty_size=0 flags=1(DATA)
+     find_free_extent: root=2(EXTENT_TREE) len=8192 empty_size=0 flags=1(DATA)
+     find_free_extent: root=2(EXTENT_TREE) len=4096 empty_size=0 flags=1(DATA)
+     find_free_extent: root=2(EXTENT_TREE) len=4096 empty_size=0 flags=1(DATA)
+
+    T's saying we're allocating data extent for EXTENT tree, which is not
+    even possible.
+
+    It's because we always use EXTENT tree as the owner for
+    trace_find_free_extent() without using the @root from
+    btrfs_reserve_extent().
+
+    This patch will change the parameter to use proper @root for
+    trace_find_free_extent():
+
+    Now it looks much better:
+
+     find_free_extent: root=5(FS_TREE) len=16384 empty_size=0 flags=36(METADATA|DUP)
+     find_free_extent: root=5(FS_TREE) len=8192 empty_size=0 flags=1(DATA)
+     find_free_extent: root=5(FS_TREE) len=16384 empty_size=0 flags=1(DATA)
+     find_free_extent: root=5(FS_TREE) len=4096 empty_size=0 flags=1(DATA)
+     find_free_extent: root=5(FS_TREE) len=8192 empty_size=0 flags=1(DATA)
+     find_free_extent: root=5(FS_TREE) len=16384 empty_size=0 flags=36(METADATA|DUP)
+     find_free_extent: root=7(CSUM_TREE) len=16384 empty_size=0 flags=36(METADATA|DUP)
+     find_free_extent: root=2(EXTENT_TREE) len=16384 empty_size=0 flags=36(METADATA|DUP)
+     find_free_extent: root=1(ROOT_TREE) len=16384 empty_size=0 flags=36(METADATA|DUP)
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: I1d674064d29b31417e2acffdeb735f5052a87032
+
+Upstream-Status: Backport
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ instrumentation/events/lttng-module/btrfs.h | 206 ++++++++++++--------
+ 1 file changed, 122 insertions(+), 84 deletions(-)
+
+diff --git a/instrumentation/events/lttng-module/btrfs.h b/instrumentation/events/lttng-module/btrfs.h
+index 7b29008..52fcfd0 100644
+--- a/instrumentation/events/lttng-module/btrfs.h
++++ b/instrumentation/events/lttng-module/btrfs.h
+@@ -1856,7 +1856,29 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserved_extent,  btrfs_reserved_extent_f
+ 
+ #endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,10,0)) */
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,5,0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0) || \
++	LTTNG_KERNEL_RANGE(5,9,6, 5,10,0) || \
++	LTTNG_KERNEL_RANGE(5,4,78, 5,5,0))
++LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
++
++	btrfs_find_free_extent,
++
++	TP_PROTO(const struct btrfs_root *root, u64 num_bytes, u64 empty_size,
++		 u64 data),
++
++	TP_ARGS(root, num_bytes, empty_size, data),
++
++	TP_FIELDS(
++		ctf_array(u8, fsid, root->lttng_fs_info_fsid, BTRFS_UUID_SIZE)
++		ctf_integer(u64, root_objectid, root->root_key.objectid)
++		ctf_integer(u64, num_bytes, num_bytes)
++		ctf_integer(u64, empty_size, empty_size)
++		ctf_integer(u64, data, data)
++	)
++)
++
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(5,5,0))
++
+ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+ 
+ 	btrfs_find_free_extent,
+@@ -1874,6 +1896,105 @@ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+ 	)
+ )
+ 
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,18,0))
++
++LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
++
++	btrfs_find_free_extent,
++
++	TP_PROTO(const struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
++		 u64 data),
++
++	TP_ARGS(fs_info, num_bytes, empty_size, data),
++
++	TP_FIELDS(
++		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
++		ctf_integer(u64, num_bytes, num_bytes)
++		ctf_integer(u64, empty_size, empty_size)
++		ctf_integer(u64, data, data)
++	)
++)
++
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0))
++
++LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
++
++	btrfs_find_free_extent,
++
++	TP_PROTO(const struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
++		 u64 data),
++
++	TP_ARGS(fs_info, num_bytes, empty_size, data),
++
++	TP_FIELDS(
++		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
++		ctf_integer(u64, num_bytes, num_bytes)
++		ctf_integer(u64, empty_size, empty_size)
++		ctf_integer(u64, data, data)
++	)
++)
++
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,10,0))
++
++LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
++
++	btrfs_find_free_extent,
++
++	TP_PROTO(struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
++		 u64 data),
++
++	TP_ARGS(fs_info, num_bytes, empty_size, data),
++
++	TP_FIELDS(
++		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
++		ctf_integer(u64, num_bytes, num_bytes)
++		ctf_integer(u64, empty_size, empty_size)
++		ctf_integer(u64, data, data)
++	)
++)
++
++#elif (LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
++	LTTNG_SLE_KERNEL_RANGE(4,4,82,6,0,0, 4,4,82,7,0,0) || \
++	LTTNG_SLE_KERNEL_RANGE(4,4,92,6,0,0, 4,4,92,7,0,0) || \
++	LTTNG_SLE_KERNEL_RANGE(4,4,103,6,0,0, 4,5,0,0,0,0))
++
++LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
++
++	btrfs_find_free_extent,
++
++	TP_PROTO(const struct btrfs_root *root, u64 num_bytes, u64 empty_size,
++		 u64 data),
++
++	TP_ARGS(root, num_bytes, empty_size, data),
++
++	TP_FIELDS(
++		ctf_integer(u64, root_objectid, root->root_key.objectid)
++		ctf_integer(u64, num_bytes, num_bytes)
++		ctf_integer(u64, empty_size, empty_size)
++		ctf_integer(u64, data, data)
++	)
++)
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,3,0))
++
++LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
++
++	btrfs_find_free_extent,
++
++	TP_PROTO(struct btrfs_root *root, u64 num_bytes, u64 empty_size,
++		 u64 data),
++
++	TP_ARGS(root, num_bytes, empty_size, data),
++
++	TP_FIELDS(
++		ctf_integer(u64, root_objectid, root->root_key.objectid)
++		ctf_integer(u64, num_bytes, num_bytes)
++		ctf_integer(u64, empty_size, empty_size)
++		ctf_integer(u64, data, data)
++	)
++)
++#endif
++
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,5,0))
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
+ 
+ 	TP_PROTO(const struct btrfs_block_group *block_group, u64 start,
+@@ -1907,22 +2028,6 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_clus
+ )
+ 
+ #elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,18,0))
+-LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+-
+-	btrfs_find_free_extent,
+-
+-	TP_PROTO(const struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
+-		 u64 data),
+-
+-	TP_ARGS(fs_info, num_bytes, empty_size, data),
+-
+-	TP_FIELDS(
+-		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
+-		ctf_integer(u64, num_bytes, num_bytes)
+-		ctf_integer(u64, empty_size, empty_size)
+-		ctf_integer(u64, data, data)
+-	)
+-)
+ 
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
+ 
+@@ -1957,22 +2062,6 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_clus
+ )
+ 
+ #elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0))
+-LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+-
+-	btrfs_find_free_extent,
+-
+-	TP_PROTO(const struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
+-		 u64 data),
+-
+-	TP_ARGS(fs_info, num_bytes, empty_size, data),
+-
+-	TP_FIELDS(
+-		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
+-		ctf_integer(u64, num_bytes, num_bytes)
+-		ctf_integer(u64, empty_size, empty_size)
+-		ctf_integer(u64, data, data)
+-	)
+-)
+ 
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
+ 
+@@ -2011,23 +2100,6 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_clus
+ 
+ #elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,10,0))
+ 
+-LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+-
+-	btrfs_find_free_extent,
+-
+-	TP_PROTO(struct btrfs_fs_info *fs_info, u64 num_bytes, u64 empty_size,
+-		 u64 data),
+-
+-	TP_ARGS(fs_info, num_bytes, empty_size, data),
+-
+-	TP_FIELDS(
+-		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
+-		ctf_integer(u64, num_bytes, num_bytes)
+-		ctf_integer(u64, empty_size, empty_size)
+-		ctf_integer(u64, data, data)
+-	)
+-)
+-
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
+ 
+ 	TP_PROTO(struct btrfs_fs_info *fs_info,
+@@ -2066,23 +2138,6 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_clus
+ 	LTTNG_SLE_KERNEL_RANGE(4,4,92,6,0,0, 4,4,92,7,0,0) || \
+ 	LTTNG_SLE_KERNEL_RANGE(4,4,103,6,0,0, 4,5,0,0,0,0))
+ 
+-LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+-
+-	btrfs_find_free_extent,
+-
+-	TP_PROTO(const struct btrfs_root *root, u64 num_bytes, u64 empty_size,
+-		 u64 data),
+-
+-	TP_ARGS(root, num_bytes, empty_size, data),
+-
+-	TP_FIELDS(
+-		ctf_integer(u64, root_objectid, root->root_key.objectid)
+-		ctf_integer(u64, num_bytes, num_bytes)
+-		ctf_integer(u64, empty_size, empty_size)
+-		ctf_integer(u64, data, data)
+-	)
+-)
+-
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
+ 
+ 	TP_PROTO(const struct btrfs_root *root,
+@@ -2120,23 +2175,6 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_clus
+ 
+ #elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,3,0))
+ 
+-LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+-
+-	btrfs_find_free_extent,
+-
+-	TP_PROTO(struct btrfs_root *root, u64 num_bytes, u64 empty_size,
+-		 u64 data),
+-
+-	TP_ARGS(root, num_bytes, empty_size, data),
+-
+-	TP_FIELDS(
+-		ctf_integer(u64, root_objectid, root->root_key.objectid)
+-		ctf_integer(u64, num_bytes, num_bytes)
+-		ctf_integer(u64, empty_size, empty_size)
+-		ctf_integer(u64, data, data)
+-	)
+-)
+-
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
+ 
+ 	TP_PROTO(struct btrfs_root *root,
+-- 
+2.17.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.3.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.3.bb
index 0b6a69ff5e..ca79e27df6 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.12.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.3.bb
@@ -11,6 +11,7 @@ include lttng-platforms.inc
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
+           file://0001-fix-btrfs-tracepoints-output-proper-root-owner-for-t.patch \
            "
 
 SRC_URI[sha256sum] = "673ef85c9f03e9b8fed10795e09d4e68add39404b70068d08b10f7b85754d7f0"
-- 
2.28.0

