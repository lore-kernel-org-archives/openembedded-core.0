Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 90FC261F16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 03:07:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4K37vFI026622
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 20:08:00 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 19 May 2014 20:07:58 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 May 2014 11:07:58 +0800
Message-ID: <1400555278-19708-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] lttng: fix alignment issue
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
X-List-Received-Date: Tue, 20 May 2014 03:08:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Roy Li <rongqing.li@windriver.com>

Fix alignment issue in lttng-tools and babeltrace

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...uffers-from-objstack_alloc-on-sizeof-void.patch |   54 ++++++++++++++++++++
 meta/recipes-kernel/lttng/babeltrace_1.2.1.bb      |    4 +-
 ...nt-problems-on-targets-not-supporting-una.patch |   47 +++++++++++++++++
 meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb     |    1 +
 meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb     |    1 +
 5 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace/Fix-Align-buffers-from-objstack_alloc-on-sizeof-void.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/Fix-alignment-problems-on-targets-not-supporting-una.patch

diff --git a/meta/recipes-kernel/lttng/babeltrace/Fix-Align-buffers-from-objstack_alloc-on-sizeof-void.patch b/meta/recipes-kernel/lttng/babeltrace/Fix-Align-buffers-from-objstack_alloc-on-sizeof-void.patch
new file mode 100644
index 0000000..8e81d2d
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace/Fix-Align-buffers-from-objstack_alloc-on-sizeof-void.patch
@@ -0,0 +1,54 @@
+From cae67efbd9ddf2cee6bbefec076dc8933ababc43 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Fredrik=20Markstr=C3=B6m?= <fredrik.markstrom@gmail.com>
+Date: Fri, 16 May 2014 10:10:38 +0800
+Subject: [PATCH] Fix: Align buffers from objstack_alloc on sizeof(void *)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport
+
+The buffers from objstack_alloc will store pointers, so they must
+be aligned on a pointer's size, or else it will cause issues on the
+CPUs which do not support unaligned addresses access.
+
+Signed-off-by: Fredrik Markstrom <fredrik.markstrom@gmail.com>
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
+---
+ formats/ctf/metadata/objstack.c |    5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/formats/ctf/metadata/objstack.c b/formats/ctf/metadata/objstack.c
+index 9e264a4..14d9252 100644
+--- a/formats/ctf/metadata/objstack.c
++++ b/formats/ctf/metadata/objstack.c
+@@ -27,6 +27,7 @@
+ #include <stdlib.h>
+ #include <babeltrace/list.h>
+ #include <babeltrace/babeltrace-internal.h>
++#include <babeltrace/align.h>
+ 
+ #define OBJSTACK_INIT_LEN		128
+ #define OBJSTACK_POISON			0xcc
+@@ -39,7 +40,7 @@ struct objstack_node {
+ 	struct bt_list_head node;
+ 	size_t len;
+ 	size_t used_len;
+-	char data[];
++	char __attribute__ ((aligned (sizeof(void *)))) data[];
+ };
+ 
+ BT_HIDDEN
+@@ -118,6 +119,8 @@ void *objstack_alloc(struct objstack *objstack, size_t len)
+ 	struct objstack_node *last_node;
+ 	void *p;
+ 
++	len = ALIGN(len, sizeof(void *));
++
+ 	/* Get last node */
+ 	last_node = bt_list_entry(objstack->head.prev,
+ 			struct objstack_node, node);
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb b/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb
index 5c105d8..542491b 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.2.1.bb
@@ -14,7 +14,9 @@ SRCREV = "66c2a20b4391fb5c7f870aeb0dde854f0ae1fc79"
 PV = "1.2.1+git${SRCPV}"
 
 SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.2 \
-           file://0001-Fix-Support-out-of-tree-builds-in-babeltrace.patch"
+           file://0001-Fix-Support-out-of-tree-builds-in-babeltrace.patch \
+           file://Fix-Align-buffers-from-objstack_alloc-on-sizeof-void.patch \
+"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/lttng/lttng-tools/Fix-alignment-problems-on-targets-not-supporting-una.patch b/meta/recipes-kernel/lttng/lttng-tools/Fix-alignment-problems-on-targets-not-supporting-una.patch
new file mode 100644
index 0000000..2c1756e
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/Fix-alignment-problems-on-targets-not-supporting-una.patch
@@ -0,0 +1,47 @@
+From 9dc4d3a8dcc7cfb6991e760e78f614afd593bf66 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Fredrik=20Markstr=C3=B6m?= <fredrik.markstrom@gmail.com>
+Date: Tue, 1 Apr 2014 17:46:23 +0200
+Subject: [PATCH v2] Fix: alignment problems on targets not supporting unaligned
+ access.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Submitted (https://www.mail-archive.com/lttng-dev@lists.lttng.org/msg06012.html) 
+
+Accessing floats, doubles and 64 bit int at unaligned addresses is not
+supported on all configurations of arm processors and if it is it's
+emulated and slow. This patch replaces direct assignments with memcpy.
+
+Signed-off-by: Fredrik Markström <fredrik.markstrom@gmail.com>
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+Acked-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ src/lib/lttng-ctl/filter/filter-visitor-generate-bytecode.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/lttng-ctl/filter/filter-visitor-generate-bytecode.c b/src/lib/lttng-ctl/filter/filter-visitor-generate-bytecode.c
+index 762d604..8c6dc96 100644
+--- a/src/lib/lttng-ctl/filter/filter-visitor-generate-bytecode.c
++++ b/src/lib/lttng-ctl/filter/filter-visitor-generate-bytecode.c
+@@ -222,7 +222,7 @@ int visit_node_load(struct filter_parser_ctx *ctx, struct ir_op *node)
+ 		if (!insn)
+ 			return -ENOMEM;
+ 		insn->op = FILTER_OP_LOAD_S64;
+-		*(int64_t *) insn->data = node->u.load.u.num;
++		memcpy(insn->data, &node->u.load.u.num, sizeof(int64_t));
+ 		ret = bytecode_push(&ctx->bytecode, insn, 1, insn_len);
+ 		free(insn);
+ 		return ret;
+@@ -237,7 +237,7 @@ int visit_node_load(struct filter_parser_ctx *ctx, struct ir_op *node)
+ 		if (!insn)
+ 			return -ENOMEM;
+ 		insn->op = FILTER_OP_LOAD_DOUBLE;
+-		*(double *) insn->data = node->u.load.u.flt;
++		memcpy(insn->data, &node->u.load.u.flt, sizeof(double));
+ 		ret = bytecode_push(&ctx->bytecode, insn, 1, insn_len);
+ 		free(insn);
+ 		return ret;
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
index ee59a46..db8b65b 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
@@ -18,6 +18,7 @@ PV = "v2.3.1"
 SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.3 \
            file://runtest.patch \
            file://run-ptest \
+           file://Fix-alignment-problems-on-targets-not-supporting-una.patch \
 	  "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb
index 223b52e..aab9bf6 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb
@@ -18,6 +18,7 @@ PV = "v2.4.0"
 SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.4 \
            file://runtest-2.4.0.patch \
            file://run-ptest \
+           file://Fix-alignment-problems-on-targets-not-supporting-una.patch \
 	  "
 
 S = "${WORKDIR}/git"
-- 
1.7.10.4


