Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B414460962
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 02:57:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5G2v7F9015901
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 19:57:07 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 15 Jun 2015 19:57:07 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Jun 2015 10:50:04 +0800
Message-ID: <1434423004-14647-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] babeltrace: Fix invalid pointer free with trace collection
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
X-List-Received-Date: Tue, 16 Jun 2015 02:57:08 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

This fixed the bug https://bugs.lttng.org/issues/790

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...nvalid-pointer-free-with-trace-collection.patch | 44 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/babeltrace_1.2.4.bb      |  4 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace/0001-Fix-invalid-pointer-free-with-trace-collection.patch

diff --git a/meta/recipes-kernel/lttng/babeltrace/0001-Fix-invalid-pointer-free-with-trace-collection.patch b/meta/recipes-kernel/lttng/babeltrace/0001-Fix-invalid-pointer-free-with-trace-collection.patch
new file mode 100644
index 0000000..3e2c4e1
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace/0001-Fix-invalid-pointer-free-with-trace-collection.patch
@@ -0,0 +1,44 @@
+From e4cad900994cf286d971796a947fea782dfc6651 Mon Sep 17 00:00:00 2001
+From: Francis Giraldeau <francis.giraldeau@gmail.com>
+Date: Mon, 15 Jun 2015 11:43:02 -0400
+Subject: [PATCH] Fix invalid pointer free with trace collection
+
+Upstream-Status: Submitted
+
+Patch proposed by Li RongQing related to bug# 790
+
+Signed-off-by: Mikael Beckius <mikael.beckius@windriver.com>
+Signed-off-by: Francis Giraldeau <francis.giraldeau@gmail.com>
+---
+ lib/context.c | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/lib/context.c b/lib/context.c
+index 45aab34..8d3770f 100644
+--- a/lib/context.c
++++ b/lib/context.c
+@@ -79,7 +79,7 @@ int bt_context_add_trace(struct bt_context *ctx, const char *path,
+ 	struct bt_trace_descriptor *td;
+ 	struct bt_format *fmt;
+ 	struct bt_trace_handle *handle;
+-	int ret, closeret;
++	int ret;
+ 
+ 	if (!ctx || !format_name || (!path && !stream_list))
+ 		return -EINVAL;
+@@ -159,10 +159,8 @@ int bt_context_add_trace(struct bt_context *ctx, const char *path,
+ 	return handle->id;
+ 
+ error:
+-	closeret = fmt->close_trace(td);
+-	if (closeret) {
+-		fprintf(stderr, "Error in close_trace callback\n");
+-	}
++	if (handle)
++		bt_context_remove_trace(ctx, handle->id);
+ end:
+ 	return ret;
+ }
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.2.4.bb b/meta/recipes-kernel/lttng/babeltrace_1.2.4.bb
index f616146..536be41 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.2.4.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.2.4.bb
@@ -13,7 +13,9 @@ DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 SRCREV = "90395824efc007de88787a6b8e400a07c980be1c"
 PV = "1.2.4+git${SRCPV}"
 
-SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.2"
+SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.2 \
+           file://0001-Fix-invalid-pointer-free-with-trace-collection.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


