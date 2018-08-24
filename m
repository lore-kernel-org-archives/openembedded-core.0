Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5DE4278E00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 15:45:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7OFjuCq017246
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Aug 2018 08:45:56 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Fri, 24 Aug 2018 08:45:56 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 24 Aug 2018 11:45:55 -0400
Message-ID: <1535125555-28523-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] lttng: uprev to 2.10.7
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
X-List-Received-Date: Fri, 24 Aug 2018 15:45:56 -0000
Content-Type: text/plain

Uprev'ing lttng to 2.10.7 to support 4.18+ kernels.

Dropped the brtfs patch as it is no longer required to for the tested
kernel range.

License-Update: headers changed to include SPDX information

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---

v2: addressed patch appliation issues

    Added License-Update: tag, and removed unneeded btrfs patch

 ...trfs-Remove-unnecessary-fs_info-parameter.patch | 116 ---------------------
 meta/recipes-kernel/lttng/lttng-modules_2.10.6.bb  |  36 -------
 meta/recipes-kernel/lttng/lttng-modules_2.10.7.bb  |  35 +++++++
 3 files changed, 35 insertions(+), 152 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-btrfs-Remove-unnecessary-fs_info-parameter.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.10.6.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.10.7.bb

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-btrfs-Remove-unnecessary-fs_info-parameter.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-btrfs-Remove-unnecessary-fs_info-parameter.patch
deleted file mode 100644
index 0fe4ee8294e8..000000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-btrfs-Remove-unnecessary-fs_info-parameter.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From 51ab0b1da29354375a19f865abcd233dd2178295 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 18 Jun 2018 14:53:19 -0400
-Subject: [PATCH] Fix: btrfs: Remove unnecessary fs_info parameter
-
-See upstream commit:
-
-  commit 3dca5c942dac60164e6a6e89172f25b86af07ce7
-  Author: Qu Wenruo <wqu@suse.com>
-  Date:   Thu Apr 26 14:24:25 2018 +0800
-
-    btrfs: trace: Remove unnecessary fs_info parameter for btrfs__reserve_extent event class
-
-    fs_info can be extracted from btrfs_block_group_cache, and all
-    btrfs_block_group_cache is created by btrfs_create_block_group_cache()
-    with fs_info initialized, no need to worry about NULL pointer
-    dereference.
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Upstream-Status: Backport
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- instrumentation/events/lttng-module/btrfs.h | 54 ++++++++++++++++++++++++++++-
- 1 file changed, 53 insertions(+), 1 deletion(-)
-
-diff --git a/instrumentation/events/lttng-module/btrfs.h b/instrumentation/events/lttng-module/btrfs.h
-index 75cc73b..fd1b6b8 100644
---- a/instrumentation/events/lttng-module/btrfs.h
-+++ b/instrumentation/events/lttng-module/btrfs.h
-@@ -1658,8 +1658,57 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserved_extent,  btrfs_reserved_extent_f
- 
- #endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,10,0)) */
- 
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0))
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,18,0))
-+LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
-+
-+	btrfs_find_free_extent,
-+
-+	TP_PROTO(const struct btrfs_fs_info *info, u64 num_bytes, u64 empty_size,
-+		 u64 data),
-+
-+	TP_ARGS(info, num_bytes, empty_size, data),
-+
-+	TP_FIELDS(
-+		ctf_array(u8, fsid, info->fsid, BTRFS_UUID_SIZE)
-+		ctf_integer(u64, num_bytes, num_bytes)
-+		ctf_integer(u64, empty_size, empty_size)
-+		ctf_integer(u64, data, data)
-+	)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
-+
-+	TP_PROTO(const struct btrfs_block_group_cache *block_group, u64 start,
-+		 u64 len),
-+
-+	TP_ARGS(block_group, start, len),
-+
-+	TP_FIELDS(
-+		ctf_array(u8, fsid, block_group->fs_info->fsid, BTRFS_UUID_SIZE)
-+		ctf_integer(u64, bg_objectid, block_group->key.objectid)
-+		ctf_integer(u64, flags, block_group->flags)
-+		ctf_integer(u64, start, start)
-+		ctf_integer(u64, len, len)
-+	)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent,
-+
-+	TP_PROTO(const struct btrfs_block_group_cache *block_group, u64 start,
-+		 u64 len),
-+
-+	TP_ARGS(block_group, start, len)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_cluster,
-+
-+	TP_PROTO(const struct btrfs_block_group_cache *block_group, u64 start,
-+		 u64 len),
-+
-+	TP_ARGS(block_group, start, len)
-+)
- 
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0))
- LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
- 
- 	btrfs_find_free_extent,
-@@ -1670,6 +1719,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
- 	TP_ARGS(info, num_bytes, empty_size, data),
- 
- 	TP_FIELDS(
-+		ctf_array(u8, fsid, info->fsid, BTRFS_UUID_SIZE)
- 		ctf_integer(u64, num_bytes, num_bytes)
- 		ctf_integer(u64, empty_size, empty_size)
- 		ctf_integer(u64, data, data)
-@@ -1685,6 +1735,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
- 	TP_ARGS(info, block_group, start, len),
- 
- 	TP_FIELDS(
-+		ctf_array(u8, fsid, info->fsid, BTRFS_UUID_SIZE)
- 		ctf_integer(u64, bg_objectid, block_group->key.objectid)
- 		ctf_integer(u64, flags, block_group->flags)
- 		ctf_integer(u64, start, start)
-@@ -1722,6 +1773,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
- 	TP_ARGS(info, num_bytes, empty_size, data),
- 
- 	TP_FIELDS(
-+		ctf_array(u8, fsid, info->fsid, BTRFS_UUID_SIZE)
- 		ctf_integer(u64, num_bytes, num_bytes)
- 		ctf_integer(u64, empty_size, empty_size)
- 		ctf_integer(u64, data, data)
--- 
-2.13.3
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.6.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.6.bb
deleted file mode 100644
index d9d5588f9ac9..000000000000
--- a/meta/recipes-kernel/lttng/lttng-modules_2.10.6.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SECTION = "devel"
-SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
-DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
-LICENSE = "LGPLv2.1 & GPLv2 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c4613d1f8a9587bd7b366191830364b3 \
-                    file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
-                    file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad \
-                    "
-
-inherit module
-
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
-
-SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
-           file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
-           file://0001-Fix-btrfs-Remove-unnecessary-fs_info-parameter.patch \
-"
-
-SRC_URI[md5sum] = "8110099f4615fc89a74ffe9189b56cfc"
-SRC_URI[sha256sum] = "04a080c81743eb29d181bac29ceb0c15819a2f4210793f2cc9958d885435029f"
-
-export INSTALL_MOD_DIR="kernel/lttng-modules"
-
-EXTRA_OEMAKE += "KERNELDIR='${STAGING_KERNEL_DIR}'"
-
-do_install_append() {
-	# Delete empty directories to avoid QA failures if no modules were built
-	find ${D}/${nonarch_base_libdir} -depth -type d -empty -exec rmdir {} \;
-}
-
-python do_package_prepend() {
-    if not os.path.exists(os.path.join(d.getVar('D'), d.getVar('nonarch_base_libdir')[1:], 'modules')):
-        bb.warn("%s: no modules were created; this may be due to CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN'))
-}
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.7.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.7.bb
new file mode 100644
index 000000000000..0e280b32c979
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.7.bb
@@ -0,0 +1,35 @@
+SECTION = "devel"
+SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
+DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
+LICENSE = "LGPLv2.1 & GPLv2 & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c4613d1f8a9587bd7b366191830364b3 \
+                    file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
+                    file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad \
+                    "
+
+inherit module
+
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
+
+SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
+           file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
+           file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
+"
+
+SRC_URI[md5sum] = "d3cb4520948083bf1573a2e4cb7406aa"
+SRC_URI[sha256sum] = "f049428d3d131e103a7a7038d184731bf7bcdce00503fc19a2c9b5693ecbb3b5"
+
+export INSTALL_MOD_DIR="kernel/lttng-modules"
+
+EXTRA_OEMAKE += "KERNELDIR='${STAGING_KERNEL_DIR}'"
+
+do_install_append() {
+	# Delete empty directories to avoid QA failures if no modules were built
+	find ${D}/${nonarch_base_libdir} -depth -type d -empty -exec rmdir {} \;
+}
+
+python do_package_prepend() {
+    if not os.path.exists(os.path.join(d.getVar('D'), d.getVar('nonarch_base_libdir')[1:], 'modules')):
+        bb.warn("%s: no modules were created; this may be due to CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN'))
+}
+
-- 
2.5.0


