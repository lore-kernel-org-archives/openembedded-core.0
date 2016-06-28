Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4B97773179
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 08:06:37 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 28 Jun 2016 01:06:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,540,1459839600"; d="scan'208";a="129745482"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 28 Jun 2016 01:06:30 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2016 11:06:14 +0300
Message-Id: <1467101180-23116-4-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1467101180-23116-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1467101180-23116-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/10] babeltrace: update to 1.4.0
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
X-List-Received-Date: Tue, 28 Jun 2016 08:06:38 -0000

Switch to using tarballs for upstream releases.

Drop merged patches.

Add a --disable-debug-info parameter to ./configure, as it otherwise
attempts to execute a small test binary. If this (new) feature is truly needed,
we can set up a qemu wrapper later, or patch autoconf macros.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...nvalid-pointer-free-with-trace-collection.patch | 44 ----------------------
 ...Include-sys-param.h-for-MAXNAMLEN-definti.patch | 29 --------------
 .../{babeltrace_1.3.2.bb => babeltrace_1.4.0.bb}   | 10 +++--
 3 files changed, 6 insertions(+), 77 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace/0001-Fix-invalid-pointer-free-with-trace-collection.patch
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace/0001-lttng-live-Include-sys-param.h-for-MAXNAMLEN-definti.patch
 rename meta/recipes-kernel/lttng/{babeltrace_1.3.2.bb => babeltrace_1.4.0.bb} (69%)

diff --git a/meta/recipes-kernel/lttng/babeltrace/0001-Fix-invalid-pointer-free-with-trace-collection.patch b/meta/recipes-kernel/lttng/babeltrace/0001-Fix-invalid-pointer-free-with-trace-collection.patch
deleted file mode 100644
index 3e2c4e1..0000000
--- a/meta/recipes-kernel/lttng/babeltrace/0001-Fix-invalid-pointer-free-with-trace-collection.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From e4cad900994cf286d971796a947fea782dfc6651 Mon Sep 17 00:00:00 2001
-From: Francis Giraldeau <francis.giraldeau@gmail.com>
-Date: Mon, 15 Jun 2015 11:43:02 -0400
-Subject: [PATCH] Fix invalid pointer free with trace collection
-
-Upstream-Status: Submitted
-
-Patch proposed by Li RongQing related to bug# 790
-
-Signed-off-by: Mikael Beckius <mikael.beckius@windriver.com>
-Signed-off-by: Francis Giraldeau <francis.giraldeau@gmail.com>
----
- lib/context.c | 8 +++-----
- 1 file changed, 3 insertions(+), 5 deletions(-)
-
-diff --git a/lib/context.c b/lib/context.c
-index 45aab34..8d3770f 100644
---- a/lib/context.c
-+++ b/lib/context.c
-@@ -79,7 +79,7 @@ int bt_context_add_trace(struct bt_context *ctx, const char *path,
- 	struct bt_trace_descriptor *td;
- 	struct bt_format *fmt;
- 	struct bt_trace_handle *handle;
--	int ret, closeret;
-+	int ret;
- 
- 	if (!ctx || !format_name || (!path && !stream_list))
- 		return -EINVAL;
-@@ -159,10 +159,8 @@ int bt_context_add_trace(struct bt_context *ctx, const char *path,
- 	return handle->id;
- 
- error:
--	closeret = fmt->close_trace(td);
--	if (closeret) {
--		fprintf(stderr, "Error in close_trace callback\n");
--	}
-+	if (handle)
-+		bt_context_remove_trace(ctx, handle->id);
- end:
- 	return ret;
- }
--- 
-1.9.1
-
diff --git a/meta/recipes-kernel/lttng/babeltrace/0001-lttng-live-Include-sys-param.h-for-MAXNAMLEN-definti.patch b/meta/recipes-kernel/lttng/babeltrace/0001-lttng-live-Include-sys-param.h-for-MAXNAMLEN-definti.patch
deleted file mode 100644
index eb16cd1..0000000
--- a/meta/recipes-kernel/lttng/babeltrace/0001-lttng-live-Include-sys-param.h-for-MAXNAMLEN-definti.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 8331b87845cafdda40e59a682f2ca8120ed0c472 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 31 Dec 2015 08:17:40 +0000
-Subject: [PATCH] lttng-live: Include sys/param.h for MAXNAMLEN defintion
-
-exposed on musl based systems
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: pending
-
- formats/lttng-live/lttng-live.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/formats/lttng-live/lttng-live.h b/formats/lttng-live/lttng-live.h
-index 4ab641d..808ed2b 100644
---- a/formats/lttng-live/lttng-live.h
-+++ b/formats/lttng-live/lttng-live.h
-@@ -25,6 +25,7 @@
-  */
- 
- #include <stdint.h>
-+#include <sys/param.h>
- #include "lttng-viewer-abi.h"
- 
- #define LTTNG_DEFAULT_NETWORK_VIEWER_PORT	5344
--- 
-2.6.4
-
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.3.2.bb b/meta/recipes-kernel/lttng/babeltrace_1.4.0.bb
similarity index 69%
rename from meta/recipes-kernel/lttng/babeltrace_1.3.2.bb
rename to meta/recipes-kernel/lttng/babeltrace_1.4.0.bb
index a7df630..854e278 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.3.2.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.4.0.bb
@@ -12,9 +12,11 @@ inherit autotools pkgconfig
 
 SRCREV = "c551f7a1ed635138b083b4e9e0c445ef63d0a562"
 
-SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.3 \
-           file://0001-Fix-invalid-pointer-free-with-trace-collection.patch \
-           file://0001-lttng-live-Include-sys-param.h-for-MAXNAMLEN-definti.patch \
+SRC_URI = "http://www.efficios.com/files/babeltrace/babeltrace-${PV}.tar.bz2 \
 "
 
-S = "${WORKDIR}/git"
+EXTRA_OECONF = "--disable-debug-info"
+
+SRC_URI[md5sum] = "fa99064048af5c9c6ff00e489ac809c2"
+SRC_URI[sha256sum] = "9469eeb22617cd12668683b04c27003e5337e9ac66ade914988df3642fc0d0e4"
+
-- 
2.8.1


