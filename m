Return-Path: <Jianchuan.Wang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A91386017E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 07:28:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6A7Svug007730
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 00:28:57 -0700 (PDT)
Received: from PEK-JWANG7-D1.wrs.com (128.224.162.190) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Fri, 10 Jul 2015 00:28:57 -0700
From: <jianchuan.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jul 2015 15:28:28 +0800
Message-ID: <1436513308-21493-1-git-send-email-jianchuan.wang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] lttng-tools: Allow multiple attempts to connect to relayd
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
X-List-Received-Date: Fri, 10 Jul 2015 07:28:59 -0000
Content-Type: text/plain

From: Jianchuan Wang <jianchuan.wang@windriver.com>

Enable to connect to relayd when connecting failed for
allowing multiple connects.

Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
---
 ...ow-multiple-attempts-to-connect-to-relayd.patch | 43 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb     |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/Allow-multiple-attempts-to-connect-to-relayd.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/Allow-multiple-attempts-to-connect-to-relayd.patch b/meta/recipes-kernel/lttng/lttng-tools/Allow-multiple-attempts-to-connect-to-relayd.patch
new file mode 100644
index 0000000..8d458d6
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/Allow-multiple-attempts-to-connect-to-relayd.patch
@@ -0,0 +1,43 @@
+From 7e9fa50ab3734b63dd62b381e0f17bf6abdd8c40 Mon Sep 17 00:00:00 2001
+From: Jianchuan Wang <jianchuan.wang@windriver.com>
+Date: Fri, 12 Jun 2015 10:05:48 +0800
+Subject: [PATCH] Allow multiple attempts to connect to relayd
+
+It is unclear why a session needs to be made
+unusable after a failure to connect to relayd
+since a check for a relayd connection is
+always made before a session can be configured.
+
+The behaviour was introduced in:
+d9078d0c000d04d49c599a72c1a725026b636ec0
+
+Upstream-Status: Pending
+
+Signed-off-by: Mikael Beckius <mikael.beckius@windriver.com>
+Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
+---
+ src/bin/lttng-sessiond/cmd.c | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/src/bin/lttng-sessiond/cmd.c b/src/bin/lttng-sessiond/cmd.c
+index 044e9ee..53b2bb0 100644
+--- a/src/bin/lttng-sessiond/cmd.c
++++ b/src/bin/lttng-sessiond/cmd.c
+@@ -657,14 +657,6 @@ close_sock:
+ 	free(rsock);
+ 
+ error:
+-	if (ret != LTTNG_OK) {
+-		/*
+-		 * The consumer output for this session should not be used anymore
+-		 * since the relayd connection failed thus making any tracing or/and
+-		 * streaming not usable.
+-		 */
+-		consumer->enabled = 0;
+-	}
+ 	return ret;
+ }
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
index 6397a98..0da1faf 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.6 \
            file://extern-decls.patch \
            file://run-ptest \
            file://lttng-tools-Fix-live-timer-calculation-error.patch \
+           file://Allow-multiple-attempts-to-connect-to-relayd.patch \
 	  "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


