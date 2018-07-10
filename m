Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9E28A605C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 10:03:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6AA3jMZ007067
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 03:03:45 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Tue, 10 Jul 2018 03:03:44 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2018 18:03:42 +0800
Message-ID: <1531217022-231739-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] lttng-modules: Fix do_compile failure for btrfs related tracepoints
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
X-List-Received-Date: Tue, 10 Jul 2018 10:03:44 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Building lttng-modules with linux-yocto-dev will cause do_compile
failure:

lttng-modules/2.10.6-r0/lttng-modules-2.10.6/probes/../probes/lttng-tracepoint-event-impl.h:143:6: error: conflicting types for 'trace_btrfs_reserve_extent'
 void trace_##_name(_proto);
      ^~~~~~

The following commit from latest mainline kernel changes some btrfs
functions' prototype.

3dca5c942dac60164e6a6e89172f25b86af07ce7
"btrfs: trace: Remove unnecessary fs_info parameter for btrfs__reserve_extent event class"

This patch backports a commit from upstream to meet the above changes.

51ab0b1da29354375a19f865abcd233dd2178295
"Fix: btrfs: Remove unnecessary fs_info parameter"

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...trfs-Remove-unnecessary-fs_info-parameter.patch | 116 +++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.10.6.bb  |   1 +
 2 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-btrfs-Remove-unnecessary-fs_info-parameter.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-btrfs-Remove-unnecessary-fs_info-parameter.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-btrfs-Remove-unnecessary-fs_info-parameter.patch
new file mode 100644
index 0000000..0fe4ee8
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-btrfs-Remove-unnecessary-fs_info-parameter.patch
@@ -0,0 +1,116 @@
+From 51ab0b1da29354375a19f865abcd233dd2178295 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 18 Jun 2018 14:53:19 -0400
+Subject: [PATCH] Fix: btrfs: Remove unnecessary fs_info parameter
+
+See upstream commit:
+
+  commit 3dca5c942dac60164e6a6e89172f25b86af07ce7
+  Author: Qu Wenruo <wqu@suse.com>
+  Date:   Thu Apr 26 14:24:25 2018 +0800
+
+    btrfs: trace: Remove unnecessary fs_info parameter for btrfs__reserve_extent event class
+
+    fs_info can be extracted from btrfs_block_group_cache, and all
+    btrfs_block_group_cache is created by btrfs_create_block_group_cache()
+    with fs_info initialized, no need to worry about NULL pointer
+    dereference.
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Upstream-Status: Backport
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ instrumentation/events/lttng-module/btrfs.h | 54 ++++++++++++++++++++++++++++-
+ 1 file changed, 53 insertions(+), 1 deletion(-)
+
+diff --git a/instrumentation/events/lttng-module/btrfs.h b/instrumentation/events/lttng-module/btrfs.h
+index 75cc73b..fd1b6b8 100644
+--- a/instrumentation/events/lttng-module/btrfs.h
++++ b/instrumentation/events/lttng-module/btrfs.h
+@@ -1658,8 +1658,57 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserved_extent,  btrfs_reserved_extent_f
+ 
+ #endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,10,0)) */
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,18,0))
++LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
++
++	btrfs_find_free_extent,
++
++	TP_PROTO(const struct btrfs_fs_info *info, u64 num_bytes, u64 empty_size,
++		 u64 data),
++
++	TP_ARGS(info, num_bytes, empty_size, data),
++
++	TP_FIELDS(
++		ctf_array(u8, fsid, info->fsid, BTRFS_UUID_SIZE)
++		ctf_integer(u64, num_bytes, num_bytes)
++		ctf_integer(u64, empty_size, empty_size)
++		ctf_integer(u64, data, data)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
++
++	TP_PROTO(const struct btrfs_block_group_cache *block_group, u64 start,
++		 u64 len),
++
++	TP_ARGS(block_group, start, len),
++
++	TP_FIELDS(
++		ctf_array(u8, fsid, block_group->fs_info->fsid, BTRFS_UUID_SIZE)
++		ctf_integer(u64, bg_objectid, block_group->key.objectid)
++		ctf_integer(u64, flags, block_group->flags)
++		ctf_integer(u64, start, start)
++		ctf_integer(u64, len, len)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent,
++
++	TP_PROTO(const struct btrfs_block_group_cache *block_group, u64 start,
++		 u64 len),
++
++	TP_ARGS(block_group, start, len)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_cluster,
++
++	TP_PROTO(const struct btrfs_block_group_cache *block_group, u64 start,
++		 u64 len),
++
++	TP_ARGS(block_group, start, len)
++)
+ 
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0))
+ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+ 
+ 	btrfs_find_free_extent,
+@@ -1670,6 +1719,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+ 	TP_ARGS(info, num_bytes, empty_size, data),
+ 
+ 	TP_FIELDS(
++		ctf_array(u8, fsid, info->fsid, BTRFS_UUID_SIZE)
+ 		ctf_integer(u64, num_bytes, num_bytes)
+ 		ctf_integer(u64, empty_size, empty_size)
+ 		ctf_integer(u64, data, data)
+@@ -1685,6 +1735,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
+ 	TP_ARGS(info, block_group, start, len),
+ 
+ 	TP_FIELDS(
++		ctf_array(u8, fsid, info->fsid, BTRFS_UUID_SIZE)
+ 		ctf_integer(u64, bg_objectid, block_group->key.objectid)
+ 		ctf_integer(u64, flags, block_group->flags)
+ 		ctf_integer(u64, start, start)
+@@ -1722,6 +1773,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+ 	TP_ARGS(info, num_bytes, empty_size, data),
+ 
+ 	TP_FIELDS(
++		ctf_array(u8, fsid, info->fsid, BTRFS_UUID_SIZE)
+ 		ctf_integer(u64, num_bytes, num_bytes)
+ 		ctf_integer(u64, empty_size, empty_size)
+ 		ctf_integer(u64, data, data)
+-- 
+2.13.3
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.6.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.6.bb
index 6146966..d9d5588 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.10.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.6.bb
@@ -14,6 +14,7 @@ COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
+           file://0001-Fix-btrfs-Remove-unnecessary-fs_info-parameter.patch \
 "
 
 SRC_URI[md5sum] = "8110099f4615fc89a74ffe9189b56cfc"
-- 
2.7.4


