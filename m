Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EBB9C6DF83
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 06:14:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB56EZ9k028258
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Dec 2013 22:14:35 -0800 (PST)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 4 Dec 2013 22:14:35 -0800
From: <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Dec 2013 14:14:19 +0800
Message-ID: <1386224059-29263-3-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1386224059-29263-1-git-send-email-Chong.Lu@windriver.com>
References: <1386224059-29263-1-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 3/3] lttng-ust: fix python interpret path
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
X-List-Received-Date: Thu, 05 Dec 2013 06:14:36 -0000
Content-Type: text/plain

From: Chong Lu <Chong.Lu@windriver.com>

Change python interpreter path to avoid syntax errors on CentOS 5.10
which has Python 2.4.x.
Add dependency for python-native.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../0001-lttng-ust-fix-python-interpret-path.patch |   26 ++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb       |    3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-fix-python-interpret-path.patch

diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-fix-python-interpret-path.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-fix-python-interpret-path.patch
new file mode 100644
index 0000000..1760244
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-fix-python-interpret-path.patch
@@ -0,0 +1,26 @@
+From 5099ea7a497c719924f59a782ebf23ef8b698de3 Mon Sep 17 00:00:00 2001
+From: Chong Lu <Chong.Lu@windriver.com>
+Date: Thu, 5 Dec 2013 13:24:56 +0800
+Subject: [PATCH] lttng-ust: fix python interpret path
+
+Change python interpreter path to avoid syntax errors on CentOS 5.10
+which has Python 2.4.x.
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ tools/lttng-gen-tp |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/lttng-gen-tp b/tools/lttng-gen-tp
+index 0f6f0b5..dca2e28 100755
+--- a/tools/lttng-gen-tp
++++ b/tools/lttng-gen-tp
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python
+ #
+ # Copyright (c)  2012 Yannick Brosseau <yannick.brosseau@gmail.com>
+ #
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb
index cdc834c..39d5049 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
 
 inherit autotools
 
-DEPENDS = "liburcu util-linux"
+DEPENDS = "liburcu util-linux python-native"
 RDEPENDS_${PN} = "python"
 
 # For backwards compatibility after rename
@@ -24,6 +24,7 @@ PE = "2"
 
 SRC_URI = "git://git.lttng.org/lttng-ust.git \
            file://0001-lttng-ust-several-fixes.patch \
+           file://0001-lttng-ust-fix-python-interpret-path.patch \
 	   "
 
 S = "${WORKDIR}/git"
-- 
1.7.9.5


