Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 80C3760065
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 20:42:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6OKgEcx001359
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Jul 2014 13:42:14 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 24 Jul 2014 13:42:13 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 24 Jul 2014 16:41:48 -0400
Message-ID: <48ca1900cd8400421948c4a2c33c722b979f3292.1406234258.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1406234258.git.bruce.ashfield@windriver.com>
References: <cover.1406234258.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] lttng-modules: update to 2.5.0
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
X-List-Received-Date: Thu, 24 Jul 2014 20:42:19 -0000
Content-Type: text/plain

During the uprev of the yocto kernel to 3.16, lttng-modules failed to build.
To grab the latest stable content, we update to 2.5.0, and add two patches
to also make it build against 3.16+.

We also drop the older 2.3.3 lttng-modules, since it is no longer required
to support ARM builds.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...compaction-instrumentation-to-3.16-kernel.patch | 83 ++++++++++++++++++++++
 ...ate-vmscan-instrumentation-to-3.16-kernel.patch | 70 ++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb   | 36 ----------
 ...tng-modules_2.4.1.bb => lttng-modules_2.5.0.bb} |  7 +-
 4 files changed, 157 insertions(+), 39 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-compaction-instrumentation-to-3.16-kernel.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-vmscan-instrumentation-to-3.16-kernel.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
 rename meta/recipes-kernel/lttng/{lttng-modules_2.4.1.bb => lttng-modules_2.5.0.bb} (85%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/Update-compaction-instrumentation-to-3.16-kernel.patch b/meta/recipes-kernel/lttng/lttng-modules/Update-compaction-instrumentation-to-3.16-kernel.patch
new file mode 100644
index 000000000000..0a056a947570
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/Update-compaction-instrumentation-to-3.16-kernel.patch
@@ -0,0 +1,83 @@
+From 0007344741ef65259bc52dea72259173dfbf96c0 Mon Sep 17 00:00:00 2001
+From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Date: Sun, 13 Jul 2014 13:33:21 -0400
+Subject: [PATCH 2/2] Update compaction instrumentation to 3.16 kernel
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ instrumentation/events/lttng-module/compaction.h | 45 +++++++++++++++++++++++-
+ 1 file changed, 44 insertions(+), 1 deletion(-)
+
+diff --git a/instrumentation/events/lttng-module/compaction.h b/instrumentation/events/lttng-module/compaction.h
+index 1b237fa45ab0..22024e9ee582 100644
+--- a/instrumentation/events/lttng-module/compaction.h
++++ b/instrumentation/events/lttng-module/compaction.h
+@@ -6,6 +6,7 @@
+ 
+ #include <linux/types.h>
+ #include <linux/tracepoint.h>
++#include <linux/version.h>
+ #include <trace/events/gfpflags.h>
+ 
+ DECLARE_EVENT_CLASS(mm_compaction_isolate_template,
+@@ -45,6 +46,48 @@ DEFINE_EVENT(mm_compaction_isolate_template, mm_compaction_isolate_freepages,
+ 	TP_ARGS(nr_scanned, nr_taken)
+ )
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0))
++TRACE_EVENT(mm_compaction_migratepages,
++
++	TP_PROTO(unsigned long nr_all,
++		int migrate_rc,
++		struct list_head *migratepages),
++
++	TP_ARGS(nr_all, migrate_rc, migratepages),
++
++	TP_STRUCT__entry(
++		__field(unsigned long, nr_migrated)
++		__field(unsigned long, nr_failed)
++	),
++
++	TP_fast_assign(
++		tp_assign(nr_migrated,
++			nr_all -
++			(migrate_rc >= 0 ? migrate_rc :
++				({
++					unsigned long nr_failed = 0;
++					struct list_head *page_lru;
++
++					list_for_each(page_lru, migratepages)
++						nr_failed++;
++					nr_failed;
++				})))
++		tp_assign(nr_failed,
++				({
++					unsigned long nr_failed = 0;
++					struct list_head *page_lru;
++
++					list_for_each(page_lru, migratepages)
++						nr_failed++;
++					nr_failed;
++				}))
++	),
++
++	TP_printk("nr_migrated=%lu nr_failed=%lu",
++		__entry->nr_migrated,
++		__entry->nr_failed)
++)
++#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0)) */
+ TRACE_EVENT(mm_compaction_migratepages,
+ 
+ 	TP_PROTO(unsigned long nr_migrated,
+@@ -66,7 +109,7 @@ TRACE_EVENT(mm_compaction_migratepages,
+ 		__entry->nr_migrated,
+ 		__entry->nr_failed)
+ )
+-
++#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0)) */
+ 
+ #endif /* _TRACE_COMPACTION_H */
+ 
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/Update-vmscan-instrumentation-to-3.16-kernel.patch b/meta/recipes-kernel/lttng/lttng-modules/Update-vmscan-instrumentation-to-3.16-kernel.patch
new file mode 100644
index 000000000000..5f02270e89c1
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/Update-vmscan-instrumentation-to-3.16-kernel.patch
@@ -0,0 +1,70 @@
+From 5defe623568273e9b87da1b817e373ff087fd862 Mon Sep 17 00:00:00 2001
+From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Date: Sun, 13 Jul 2014 13:27:01 -0400
+Subject: [PATCH 1/2] Update vmscan instrumentation to 3.16 kernel
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ instrumentation/events/lttng-module/vmscan.h | 39 ++++++++++++++++++++++++++++
+ 1 file changed, 39 insertions(+)
+
+diff --git a/instrumentation/events/lttng-module/vmscan.h b/instrumentation/events/lttng-module/vmscan.h
+index 1fd50ba7c235..0b4aa56761dc 100644
+--- a/instrumentation/events/lttng-module/vmscan.h
++++ b/instrumentation/events/lttng-module/vmscan.h
+@@ -238,6 +238,44 @@ TRACE_EVENT(mm_shrink_slab_start,
+ 		__entry->total_scan)
+ )
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0))
++TRACE_EVENT(mm_shrink_slab_end,
++	TP_PROTO(struct shrinker *shr, int nid, int shrinker_retval,
++		long unused_scan_cnt, long new_scan_cnt, long total_scan),
++
++	TP_ARGS(shr, nid, shrinker_retval, unused_scan_cnt, new_scan_cnt,
++		total_scan),
++
++	TP_STRUCT__entry(
++		__field(struct shrinker *, shr)
++		__field(int, nid)
++		__field(void *, shrink)
++		__field(long, unused_scan)
++		__field(long, new_scan)
++		__field(int, retval)
++		__field(long, total_scan)
++	),
++
++	TP_fast_assign(
++		tp_assign(shr, shr)
++		tp_assign(nid, nid)
++		tp_assign(shrink, shr->scan_objects)
++		tp_assign(unused_scan, unused_scan_cnt)
++		tp_assign(new_scan, new_scan_cnt)
++		tp_assign(retval, shrinker_retval)
++		tp_assign(total_scan, total_scan)
++	),
++
++	TP_printk("%pF %p: nid %d unused scan count %ld new scan count %ld total_scan %ld last shrinker return val %d",
++		__entry->shrink,
++		__entry->shr,
++		__entry->nid,
++		__entry->unused_scan,
++		__entry->new_scan,
++		__entry->total_scan,
++		__entry->retval)
++)
++#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0)) */
+ TRACE_EVENT(mm_shrink_slab_end,
+ 	TP_PROTO(struct shrinker *shr, int shrinker_retval,
+ 		long unused_scan_cnt, long new_scan_cnt),
+@@ -274,6 +312,7 @@ TRACE_EVENT(mm_shrink_slab_end,
+ 		__entry->total_scan,
+ 		__entry->retval)
+ )
++#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0)) */
+ #endif
+ 
+ DECLARE_EVENT_CLASS(mm_vmscan_lru_isolate_template,
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb b/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
deleted file mode 100644
index 81a3983c64f1..000000000000
--- a/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SECTION = "devel"
-SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
-DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
-LICENSE = "LGPLv2.1 & GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1412caf5a1aa90d6a48588a4794c0eac \
-                    file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
-                    file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
-
-DEPENDS = "virtual/kernel"
-
-inherit module
-
-SRCREV = "eef112db0e63feff6cbf0a98cda9af607cefb377"
-PV = "2.3.3"
-
-SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.3 \
-           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
-           file://bio-bvec-iter.patch \
-          "
-
-export INSTALL_MOD_DIR="kernel/lttng-modules"
-export KERNEL_SRC="${STAGING_KERNEL_DIR}"
-
-
-S = "${WORKDIR}/git"
-
-do_install_append() {
-	# Delete empty directories to avoid QA failures if no modules were built
-	find ${D}/lib -depth -type d -empty -exec rmdir {} \;
-}
-
-python do_package_prepend() {
-    if not os.path.exists(os.path.join(d.getVar('D', True), 'lib/modules')):
-        bb.warn("%s: no modules were created; this may be due to CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN', True))
-}
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
similarity index 85%
rename from meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
index 5e05ffc69853..5a99a5adae8b 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
@@ -10,14 +10,15 @@ DEPENDS = "virtual/kernel"
 
 inherit module
 
-SRCREV = "a0383def517e3aebbbcebae61fe2bcfb50d31e71"
-PV = "2.4.1"
+SRCREV = "789fd1d06d07aeb9a403bdce1b3318560cfc6eca"
 
 # lttng currently blacklists arm with gcc-4.8
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
 
-SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.4 \
+SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.5 \
            file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
+           file://Update-compaction-instrumentation-to-3.16-kernel.patch \
+           file://Update-vmscan-instrumentation-to-3.16-kernel.patch \
            "
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
-- 
1.8.1.2


