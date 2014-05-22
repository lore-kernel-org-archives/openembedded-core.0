Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 462FA65EA8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 06:37:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4M6bKg9003356
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 23:37:20 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 21 May 2014 23:37:19 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 May 2014 14:37:18 +0800
Message-ID: <1400740638-11280-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] babeltrace: fix alignment issue
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
X-List-Received-Date: Thu, 22 May 2014 06:37:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Roy Li <rongqing.li@windriver.com>

Fix alignment issue in babeltrace

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...uffers-from-objstack_alloc-on-sizeof-void.patch |   54 ++++++++++++++++++++
 meta/recipes-kernel/lttng/babeltrace_1.2.1.bb      |    4 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace/Fix-Align-buffers-from-objstack_alloc-on-sizeof-void.patch

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
 
-- 
1.7.10.4


