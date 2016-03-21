Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 65AAC65CBC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 02:10:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2L2AL2Z014027
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Mar 2016 19:10:21 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 20 Mar 2016 19:10:21 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 20 Mar 2016 22:10:19 -0400
Message-ID: <1458526219-15319-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] at: fix configure option with/without-selinux
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
X-List-Received-Date: Mon, 21 Mar 2016 02:10:21 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

without-selinux doesn't work since WITH_SELINUX is always be defined no
matter which option is given: with-selinux, without-selinux.

This causes build errors if '--without-selinux' is used and libselinux
is not buildable in project:

  atd.c:87:29: fatal error: selinux/selinux.h: No such file or directory

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../at/at/configure-fix-with-without-selinux.patch | 53 ++++++++++++++++++++++
 meta/recipes-extended/at/at_3.1.18.bb              |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-extended/at/at/configure-fix-with-without-selinux.patch

diff --git a/meta/recipes-extended/at/at/configure-fix-with-without-selinux.patch b/meta/recipes-extended/at/at/configure-fix-with-without-selinux.patch
new file mode 100644
index 0000000..389af1e
--- /dev/null
+++ b/meta/recipes-extended/at/at/configure-fix-with-without-selinux.patch
@@ -0,0 +1,53 @@
+From c02354af7f3d9426da31503abfae70952c699a9d Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Fri, 18 Mar 2016 03:23:11 -0400
+Subject: [PATCH] configure: fix with/without selinux
+
+Problem:
+without-selinux doesn't work since WITH_SELINUX is always be defined no
+matter which option is given: with-selinux, without-selinux.
+
+Fix:
+Disable selinux support if without-selinux is given; otherwise check
+libselinux to determine if selinux support should be enabled.
+
+Upstream-Status: Submitted [at@packages.debian.org]
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ configure.ac | 19 +++++++++++++++----
+ 1 file changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5a43419..8c9de62 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -240,10 +240,21 @@ AC_ARG_WITH(daemon_username,
+ AC_SUBST(DAEMON_USERNAME)
+ 
+ AC_ARG_WITH(selinux,
+-[ --with-selinux       Define to run with selinux],
+-AC_DEFINE(WITH_SELINUX, 1, [Define if you are building with_selinux]),
+-)
+-AC_CHECK_LIB(selinux, is_selinux_enabled, SELINUXLIB=-lselinux)
++[ --with-selinux       Define to run with selinux (default=check)],
++[],
++[with_selinux=check])
++
++if test "x$with_selinux" != xno; then
++  AC_CHECK_LIB([selinux], [is_selinux_enabled],
++    [SELINUXLIB=-lselinux
++     AC_DEFINE(WITH_SELINUX, 1, [Define if you are building with_selinux])
++    ],
++    [if test "x$with_selinux" != xcheck; then
++       AC_MSG_FAILURE([--with-selinux is given, but test for selinux failed])
++     fi
++    ]
++  )
++fi
+ AC_SUBST(SELINUXLIB)
+ AC_SUBST(WITH_SELINUX)
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/at/at_3.1.18.bb b/meta/recipes-extended/at/at_3.1.18.bb
index e83ea32..93044f5 100644
--- a/meta/recipes-extended/at/at_3.1.18.bb
+++ b/meta/recipes-extended/at/at_3.1.18.bb
@@ -25,6 +25,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz;subdir=${BP} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
     file://makefile-fix-parallel.patch \
     file://0001-remove-glibc-assumption.patch \
+    file://configure-fix-with-without-selinux.patch \
     "
 
 PAM_SRC_URI = "file://pam.conf.patch \
-- 
1.9.1


