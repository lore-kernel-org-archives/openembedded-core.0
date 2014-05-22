Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 22A836AD68
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 06:37:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4M6bakD027292
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 23:37:36 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 21 May 2014 23:37:36 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 May 2014 14:37:35 +0800
Message-ID: <1400740655-11317-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] lttng-tools: fix alignment issue
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
X-List-Received-Date: Thu, 22 May 2014 06:37:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Roy Li <rongqing.li@windriver.com>

Fix alignment issue in lttng-tools

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...nt-problems-on-targets-not-supporting-una.patch |   47 ++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb     |    1 +
 meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb     |    1 +
 3 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/Fix-alignment-problems-on-targets-not-supporting-una.patch

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


