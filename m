Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A7877E634
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 00:26:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5I0QLKL016418
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 17:26:22 -0700 (PDT)
Received: from localhost (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 17 Jun 2019 17:26:21 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Jun 2019 08:26:19 +0800
Message-ID: <1560817579-4773-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.136]
Subject: [PATCH] shadow: fix configure error with dash
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
X-List-Received-Date: Tue, 18 Jun 2019 00:26:21 -0000
Content-Type: text/plain

A configure error occurs when /bin/sh -> dash:
  checking for is_selinux_enabled in -lselinux... yes
  checking for semanage_connect in -lsemanage... yes
  configure: 16322: test: yesyes: unexpected operator

Use "=" instead of "==" since dash doesn't support the latter.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...onfigure.ac-fix-configure-error-with-dash.patch | 36 ++++++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-configure.ac-fix-configure-error-with-dash.patch

diff --git a/meta/recipes-extended/shadow/files/0001-configure.ac-fix-configure-error-with-dash.patch b/meta/recipes-extended/shadow/files/0001-configure.ac-fix-configure-error-with-dash.patch
new file mode 100644
index 0000000..a74cbb0
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-configure.ac-fix-configure-error-with-dash.patch
@@ -0,0 +1,36 @@
+From 3c52a84ff8775590e7e9da9c0d4408c23494305e Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Mon, 17 Jun 2019 15:36:34 +0800
+Subject: [PATCH] configure.ac: fix configure error with dash
+
+A configure error occurs when /bin/sh -> dash:
+  checking for is_selinux_enabled in -lselinux... yes
+  checking for semanage_connect in -lsemanage... yes
+  configure: 16322: test: yesyes: unexpected operator
+
+Use "=" instead of "==" since dash doesn't support this operator.
+
+Upstream-Status: Backport
+[https://github.com/shadow-maint/shadow/commit/3c52a84ff8775590e7e9da9c0d4408c23494305e]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6762556..1907afb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -500,7 +500,7 @@ if test "$with_selinux" != "no"; then
+ 			AC_MSG_ERROR([libsemanage not found])
+ 		fi
+ 
+-		if test "$selinux_lib$semanage_lib" == "yesyes" ; then
++		if test "$selinux_lib$semanage_lib" = "yesyes" ; then
+ 			AC_DEFINE(WITH_SELINUX, 1,
+ 			          [Build shadow with SELinux support])
+ 			LIBSELINUX="-lselinux"
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 831751d..7f82d20 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -13,6 +13,7 @@ SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/${PV}/${BP}.
            file://shadow-4.1.3-dots-in-usernames.patch \
            file://0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch  \
            file://0002-gettime-Use-secure_getenv-over-getenv.patch \
+           file://0001-configure.ac-fix-configure-error-with-dash.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
-- 
2.7.4


