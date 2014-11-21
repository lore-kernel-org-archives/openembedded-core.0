Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6849E60DD7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 17:20:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Nov 2014 09:20:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,432,1413270000"; d="scan'208";a="626293796"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.72])
	by fmsmga001.fm.intel.com with ESMTP; 21 Nov 2014 09:20:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Nov 2014 09:20:12 -0800
Message-Id: <1568ff3fb4f5d4775eb1832a8b90de4164032a14.1416590209.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1416590209.git.sgw@linux.intel.com>
References: <cover.1416590209.git.sgw@linux.intel.com>
In-Reply-To: <cover.1416590209.git.sgw@linux.intel.com>
References: <cover.1416590209.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] babeltrace: Upgrade to 1.2.3
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
X-List-Received-Date: Fri, 21 Nov 2014 17:20:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove backported patches

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...-Support-out-of-tree-builds-in-babeltrace.patch | 17 -------
 ...uffers-from-objstack_alloc-on-sizeof-void.patch | 54 ----------------------
 .../{babeltrace_1.2.1.bb => babeltrace_1.2.3.bb}   |  9 ++--
 3 files changed, 3 insertions(+), 77 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace/0001-Fix-Support-out-of-tree-builds-in-babeltrace.patch
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace/Fix-Align-buffers-from-objstack_alloc-on-sizeof-void.patch
 rename meta/recipes-kernel/lttng/{babeltrace_1.2.1.bb => babeltrace_1.2.3.bb} (73%)

diff --git a/meta/recipes-kernel/lttng/babeltrace/0001-Fix-Support-out-of-tree-builds-in-babeltrace.patch b/meta/recipes-kernel/lttng/babeltrace/0001-Fix-Support-out-of-tree-builds-in-babeltrace.patch
deleted file mode 100644
index 258eedd..0000000
--- a/meta/recipes-kernel/lttng/babeltrace/0001-Fix-Support-out-of-tree-builds-in-babeltrace.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: backport
-
-babeltrace: Fix support out of tree builds in babeltrace
-
-Signed-off-by: Lars Persson <larper@axis.com>
-
-diff --git a/formats/lttng-live/Makefile.am b/formats/lttng-live/Makefile.am
-index c834699..2c6b0bd 100644
---- a/formats/lttng-live/Makefile.am
-+++ b/formats/lttng-live/Makefile.am
-@@ -1,4 +1,4 @@
--AM_CFLAGS = $(PACKAGE_CFLAGS) -I$(top_srcdir)/include -I$(top_builddir)/include
-+AM_CFLAGS = $(PACKAGE_CFLAGS) -I$(top_srcdir)/include -I$(top_builddir)/include -I$(top_srcdir)
- 
- lib_LTLIBRARIES = libbabeltrace-lttng-live.la
- 
-
diff --git a/meta/recipes-kernel/lttng/babeltrace/Fix-Align-buffers-from-objstack_alloc-on-sizeof-void.patch b/meta/recipes-kernel/lttng/babeltrace/Fix-Align-buffers-from-objstack_alloc-on-sizeof-void.patch
deleted file mode 100644
index 8e81d2d..0000000
--- a/meta/recipes-kernel/lttng/babeltrace/Fix-Align-buffers-from-objstack_alloc-on-sizeof-void.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From cae67efbd9ddf2cee6bbefec076dc8933ababc43 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Fredrik=20Markstr=C3=B6m?= <fredrik.markstrom@gmail.com>
-Date: Fri, 16 May 2014 10:10:38 +0800
-Subject: [PATCH] Fix: Align buffers from objstack_alloc on sizeof(void *)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Backport
-
-The buffers from objstack_alloc will store pointers, so they must
-be aligned on a pointer's size, or else it will cause issues on the
-CPUs which do not support unaligned addresses access.
-
-Signed-off-by: Fredrik Markstrom <fredrik.markstrom@gmail.com>
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
----
- formats/ctf/metadata/objstack.c |    5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/formats/ctf/metadata/objstack.c b/formats/ctf/metadata/objstack.c
-index 9e264a4..14d9252 100644
---- a/formats/ctf/metadata/objstack.c
-+++ b/formats/ctf/metadata/objstack.c
-@@ -27,6 +27,7 @@
- #include <stdlib.h>
- #include <babeltrace/list.h>
- #include <babeltrace/babeltrace-internal.h>
-+#include <babeltrace/align.h>
- 
- #define OBJSTACK_INIT_LEN		128
- #define OBJSTACK_POISON			0xcc
-@@ -39,7 +40,7 @@ struct objstack_node {
- 	struct bt_list_head node;
- 	size_t len;
- 	size_t used_len;
--	char data[];
-+	char __attribute__ ((aligned (sizeof(void *)))) data[];
- };
- 
- BT_HIDDEN
-@@ -118,6 +119,8 @@ void *objstack_alloc(struct objstack *objstack, size_t len)
- 	struct objstack_node *last_node;
- 	void *p;
- 
-+	len = ALIGN(len, sizeof(void *));
-+
- 	/* Get last node */
- 	last_node = bt_list_entry(objstack->head.prev,
- 			struct objstack_node, node);
--- 
-1.7.10.4
-
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb b/meta/recipes-kernel/lttng/babeltrace_1.2.3.bb
similarity index 73%
rename from meta/recipes-kernel/lttng/babeltrace_1.2.1.bb
rename to meta/recipes-kernel/lttng/babeltrace_1.2.3.bb
index dd9961c..c62589c 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.2.3.bb
@@ -10,13 +10,10 @@ inherit autotools pkgconfig
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
-SRCREV = "66c2a20b4391fb5c7f870aeb0dde854f0ae1fc79"
-PV = "1.2.1+git${SRCPV}"
+SRCREV = "753a40ead9fa4f6bd5e29d5765e2021122df9c1c"
+PV = "1.2.3+git${SRCPV}"
 
-SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.2 \
-           file://0001-Fix-Support-out-of-tree-builds-in-babeltrace.patch \
-           file://Fix-Align-buffers-from-objstack_alloc-on-sizeof-void.patch \
-"
+SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.2"
 
 S = "${WORKDIR}/git"
 
-- 
1.8.3.1


