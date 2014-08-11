Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 2B65965E3D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 15:36:04 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XGrdl-0000m0-FF from Yasir_Khan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Aug 2014 08:36:05 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 11 Aug 2014 08:36:04 -0700
From: Yasir Khan <yasir_khan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Aug 2014 20:35:21 +0500
Message-Id: <1407771321-42619-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginalArrivalTime: 11 Aug 2014 15:36:05.0275 (UTC)
	FILETIME=[F6C416B0:01CFB579]
Subject: [PATCH] lttng-tools: Update to version 2.5.0
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
X-List-Received-Date: Mon, 11 Aug 2014 15:36:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Yasir-Khan <yasir_khan@mentor.com>

update to latest stable-2.5 revision

* drop patches - merged upstream
 - Fix-alignment-problems-on-targets-not-supporting-una.patch

Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 ...nt-problems-on-targets-not-supporting-una.patch |   47 --------------------
 .../{lttng-tools_2.4.0.bb => lttng-tools_2.5.0.bb} |    7 ++-
 2 files changed, 3 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/Fix-alignment-problems-on-targets-not-supporting-una.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.4.0.bb => lttng-tools_2.5.0.bb} (90%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/Fix-alignment-problems-on-targets-not-supporting-una.patch b/meta/recipes-kernel/lttng/lttng-tools/Fix-alignment-problems-on-targets-not-supporting-una.patch
deleted file mode 100644
index 2c1756e..0000000
--- a/meta/recipes-kernel/lttng/lttng-tools/Fix-alignment-problems-on-targets-not-supporting-una.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 9dc4d3a8dcc7cfb6991e760e78f614afd593bf66 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Fredrik=20Markstr=C3=B6m?= <fredrik.markstrom@gmail.com>
-Date: Tue, 1 Apr 2014 17:46:23 +0200
-Subject: [PATCH v2] Fix: alignment problems on targets not supporting unaligned
- access.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Submitted (https://www.mail-archive.com/lttng-dev@lists.lttng.org/msg06012.html) 
-
-Accessing floats, doubles and 64 bit int at unaligned addresses is not
-supported on all configurations of arm processors and if it is it's
-emulated and slow. This patch replaces direct assignments with memcpy.
-
-Signed-off-by: Fredrik Markström <fredrik.markstrom@gmail.com>
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-Acked-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- src/lib/lttng-ctl/filter/filter-visitor-generate-bytecode.c |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/lib/lttng-ctl/filter/filter-visitor-generate-bytecode.c b/src/lib/lttng-ctl/filter/filter-visitor-generate-bytecode.c
-index 762d604..8c6dc96 100644
---- a/src/lib/lttng-ctl/filter/filter-visitor-generate-bytecode.c
-+++ b/src/lib/lttng-ctl/filter/filter-visitor-generate-bytecode.c
-@@ -222,7 +222,7 @@ int visit_node_load(struct filter_parser_ctx *ctx, struct ir_op *node)
- 		if (!insn)
- 			return -ENOMEM;
- 		insn->op = FILTER_OP_LOAD_S64;
--		*(int64_t *) insn->data = node->u.load.u.num;
-+		memcpy(insn->data, &node->u.load.u.num, sizeof(int64_t));
- 		ret = bytecode_push(&ctx->bytecode, insn, 1, insn_len);
- 		free(insn);
- 		return ret;
-@@ -237,7 +237,7 @@ int visit_node_load(struct filter_parser_ctx *ctx, struct ir_op *node)
- 		if (!insn)
- 			return -ENOMEM;
- 		insn->op = FILTER_OP_LOAD_DOUBLE;
--		*(double *) insn->data = node->u.load.u.flt;
-+		memcpy(insn->data, &node->u.load.u.flt, sizeof(double));
- 		ret = bytecode_push(&ctx->bytecode, insn, 1, insn_len);
- 		free(insn);
- 		return ret;
--- 
-1.7.10.4
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb
similarity index 90%
rename from meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb
index aab9bf6..86dd981 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb
@@ -12,13 +12,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
 DEPENDS = "liburcu popt lttng-ust"
 RDEPENDS_${PN}-ptest += "make"
 
-SRCREV = "8e3234eea2d81f8a962214c570532f8e096a9a8d"
-PV = "v2.4.0"
+SRCREV = "8b27cacb277c2cdab791139b08da8eb87ab14a88"
+PV = "v2.5.0"
 
-SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.4 \
+SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.5 \
            file://runtest-2.4.0.patch \
            file://run-ptest \
-           file://Fix-alignment-problems-on-targets-not-supporting-una.patch \
 	  "
 
 S = "${WORKDIR}/git"
-- 
1.7.9.5


