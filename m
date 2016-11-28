Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5A28571A84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 13:37:24 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2016 05:37:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,564,1473145200"; d="scan'208";a="36412228"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2016 05:37:25 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 15:34:13 +0200
Message-Id: <05e7f7590faa7e2c2b98911f7f6213fca82b7851.1480333940.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/18] sysprof: update to 3.22.2
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
X-List-Received-Date: Mon, 28 Nov 2016 13:37:24 -0000

Drop 0001-Forward-port-mips-arm-memory-barrier-patches.patch; upstream
is using standard C11 facilities for this now.

Drop 0001-callgraph-Use-U64_TO_POINTER.patch; it has been merged upstream.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...ward-port-mips-arm-memory-barrier-patches.patch | 38 ----------------------
 .../files/0001-callgraph-Use-U64_TO_POINTER.patch  | 29 -----------------
 .../sysprof/{sysprof_git.bb => sysprof_3.22.2.bb}  | 12 ++-----
 3 files changed, 3 insertions(+), 76 deletions(-)
 delete mode 100644 meta/recipes-kernel/sysprof/files/0001-Forward-port-mips-arm-memory-barrier-patches.patch
 delete mode 100644 meta/recipes-kernel/sysprof/files/0001-callgraph-Use-U64_TO_POINTER.patch
 rename meta/recipes-kernel/sysprof/{sysprof_git.bb => sysprof_3.22.2.bb} (71%)

diff --git a/meta/recipes-kernel/sysprof/files/0001-Forward-port-mips-arm-memory-barrier-patches.patch b/meta/recipes-kernel/sysprof/files/0001-Forward-port-mips-arm-memory-barrier-patches.patch
deleted file mode 100644
index 92e804f..0000000
--- a/meta/recipes-kernel/sysprof/files/0001-Forward-port-mips-arm-memory-barrier-patches.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From a2d385e504323641b1127821833c61e77301c90b Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Sat, 11 Jun 2016 22:45:37 +0300
-Subject: [PATCH] Forward port mips & arm memory barrier patches
-
-Upstream-Status: Pending
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- lib/util/util.h | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/lib/util/util.h b/lib/util/util.h
-index 591722d..0768056 100644
---- a/lib/util/util.h
-+++ b/lib/util/util.h
-@@ -29,4 +29,19 @@
- #define read_barrier()           asm volatile("" ::: "memory")
- #endif
- 
-+#ifdef __arm__
-+/*
-+ * Use the __kuser_memory_barrier helper in the CPU helper page. See
-+ * arch/arm/kernel/entry-armv.S in the kernel source for details.
-+ */
-+#define read_barrier()         ((void(*)(void))0xffff0fa0)()
-+#endif
-+
-+#ifdef __mips__
-+#define read_barrier()         asm volatile(".set   mips2\n\t" \
-+                                            "sync\n\t" \
-+                                            ".set   mips0" ::: "memory")
-+#endif
-+
-+
- #endif /* SP_UTIL_H */
--- 
-2.1.4
-
diff --git a/meta/recipes-kernel/sysprof/files/0001-callgraph-Use-U64_TO_POINTER.patch b/meta/recipes-kernel/sysprof/files/0001-callgraph-Use-U64_TO_POINTER.patch
deleted file mode 100644
index ac1384c..0000000
--- a/meta/recipes-kernel/sysprof/files/0001-callgraph-Use-U64_TO_POINTER.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 05816e6f9cd65b2624bb04de65fdf61031c7017f Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Fri, 10 Jun 2016 14:01:54 +0300
-Subject: [PATCH] callgraph: Use U64_TO_POINTER
-
-This fixes a "cast to pointer from integer of different size" on i586.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Pending
----
- lib/sp-callgraph-view.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/sp-callgraph-view.c b/lib/sp-callgraph-view.c
-index 02cc17b..58315b0 100644
---- a/lib/sp-callgraph-view.c
-+++ b/lib/sp-callgraph-view.c
-@@ -135,7 +135,7 @@ build_functions_store (StackNode *node,
- 
-   gtk_list_store_append (state->store, &iter);
-   gtk_list_store_set (state->store, &iter,
--                      COLUMN_NAME, (const gchar *)node->data,
-+                      COLUMN_NAME, U64_TO_POINTER(node->data),
-                       COLUMN_SELF, 100.0 * size / state->profile_size,
-                       COLUMN_TOTAL, 100.0 * total / state->profile_size,
-                       COLUMN_POINTER, node,
--- 
-2.1.4
-
diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_3.22.2.bb
similarity index 71%
rename from meta/recipes-kernel/sysprof/sysprof_git.bb
rename to meta/recipes-kernel/sysprof/sysprof_3.22.2.bb
index 8d8b626..a1ed7c8 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_3.22.2.bb
@@ -7,20 +7,14 @@ inherit gnomebase gettext systemd
 
 DEPENDS = "glib-2.0"
 
-S = "${WORKDIR}/git"
-SRCREV = "9c6cec9b49766bf77c1713bc5a7c6d651e628068"
-PV = "3.20.0+git${SRCPV}"
-
-SRC_URI = "git://git.gnome.org/sysprof \
+SRC_URI += " \
            file://define-NT_GNU_BUILD_ID.patch \
            file://0001-configure-Add-option-to-enable-disable-polkit.patch \
            file://0001-Disable-check-for-polkit-for-UI.patch \
            file://0001-Avoid-building-docs.patch \
-           file://0001-callgraph-Use-U64_TO_POINTER.patch \
-           file://0001-Forward-port-mips-arm-memory-barrier-patches.patch \
           "
-SRC_URI[archive.md5sum] = "d56e8492033b60e247634731e7f760b9"
-SRC_URI[archive.sha256sum] = "4a338ad41bfffae87ef281f6e75c9660b3e0c6671bf5233be0c3f55a5e5b1ce5"
+SRC_URI[archive.md5sum] = "2634bf35f5592e5e4520ccaba87e909e"
+SRC_URI[archive.sha256sum] = "d57fb19a3e5d4ad37d5fb554dc93d9a03f332779c3bffd9c2aa8f176e85269d7"
 
 AUTOTOOLS_AUXDIR = "${S}/build-aux"
 
-- 
2.10.2


