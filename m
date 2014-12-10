Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 305CF7259C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 14:16:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBAEGQrQ028954
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Dec 2014 06:16:26 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.92.225) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Dec 2014 06:16:25 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Dec 2014 09:16:13 -0500
Message-ID: <0a877fe681e264400886cb9f5391ecd731afe515.1418220684.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1418220684.git.bruce.ashfield@windriver.com>
References: <cover.1418220684.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] lttng-modules: fix mm_compaction_isolate_template build
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
X-List-Received-Date: Wed, 10 Dec 2014 14:16:30 -0000
Content-Type: text/plain

linux-stable integrated the 3.16 commit f8c9301fa5a2a [mm/compaction: do
not count migratepages when unnecessary] with the 3.14.25 update.

So we have to update the lttng-module linux version codes to use the
new definition in builds greater than 3.14.24 or 3.16.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...-fix-mm_compaction_isolate_template-build.patch | 41 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb   |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/compaction-fix-mm_compaction_isolate_template-build.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/compaction-fix-mm_compaction_isolate_template-build.patch b/meta/recipes-kernel/lttng/lttng-modules/compaction-fix-mm_compaction_isolate_template-build.patch
new file mode 100644
index 000000000000..a99871a62e5c
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/compaction-fix-mm_compaction_isolate_template-build.patch
@@ -0,0 +1,41 @@
+From af48c7b08de4b811d3d974e65e362b86ce8c4a34 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@windriver.com>
+Date: Wed, 10 Dec 2014 03:19:28 -0500
+Subject: [PATCH] compaction: fix mm_compaction_isolate_template build
+
+linux-stable integrated the 3.16 commit f8c9301fa5a2a [mm/compaction: do
+not count migratepages when unnecessary] with the 3.14.25 update.
+
+So we have to update the lttng-module linux version codes to use the
+new definition in builds greater than 3.14.24 or 3.16.
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+---
+ instrumentation/events/lttng-module/compaction.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/instrumentation/events/lttng-module/compaction.h b/instrumentation/events/lttng-module/compaction.h
+index 22024e9ee582..07afbe06f1a6 100644
+--- a/instrumentation/events/lttng-module/compaction.h
++++ b/instrumentation/events/lttng-module/compaction.h
+@@ -46,7 +46,7 @@ DEFINE_EVENT(mm_compaction_isolate_template, mm_compaction_isolate_freepages,
+ 	TP_ARGS(nr_scanned, nr_taken)
+ )
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0) || LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,25))
+ TRACE_EVENT(mm_compaction_migratepages,
+ 
+ 	TP_PROTO(unsigned long nr_all,
+@@ -87,7 +87,7 @@ TRACE_EVENT(mm_compaction_migratepages,
+ 		__entry->nr_migrated,
+ 		__entry->nr_failed)
+ )
+-#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0)) */
++#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0) || LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,25)) */
+ TRACE_EVENT(mm_compaction_migratepages,
+ 
+ 	TP_PROTO(unsigned long nr_migrated,
+-- 
+2.1.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
index f66118011afe..f9475e9d8596 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.5 \
            file://Update-statedump-to-3.17-nsproxy-locking.patch \
            file://Update-kvm-instrumentation-compile-on-3.17-rc1.patch \
            file://fix_build_with_v3.17_kernel.patch \
+           file://compaction-fix-mm_compaction_isolate_template-build.patch \
            "
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
-- 
2.1.0


