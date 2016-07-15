Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4546B73166
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 01:49:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6F1ncDQ022183
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 18:49:38 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 14 Jul 2016 18:49:37 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jul 2016 09:49:34 +0800
Message-ID: <75169293a2dbfb6b4b0c5a74b261723609c6eb59.1468547302.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1468547302.git.Qi.Chen@windriver.com>
References: <cover.1468547302.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] at: upgrade to 3.1.20
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
X-List-Received-Date: Fri, 15 Jul 2016 01:49:38 -0000
Content-Type: text/plain

configure-fix-with-without-selinux.patch is removed as it has been merged.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../at/at/configure-fix-with-without-selinux.patch | 53 ----------------------
 .../at/{at_3.1.18.bb => at_3.1.20.bb}              |  7 ++-
 2 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 meta/recipes-extended/at/at/configure-fix-with-without-selinux.patch
 rename meta/recipes-extended/at/{at_3.1.18.bb => at_3.1.20.bb} (89%)

diff --git a/meta/recipes-extended/at/at/configure-fix-with-without-selinux.patch b/meta/recipes-extended/at/at/configure-fix-with-without-selinux.patch
deleted file mode 100644
index 389af1e..0000000
--- a/meta/recipes-extended/at/at/configure-fix-with-without-selinux.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From c02354af7f3d9426da31503abfae70952c699a9d Mon Sep 17 00:00:00 2001
-From: Wenzong Fan <wenzong.fan@windriver.com>
-Date: Fri, 18 Mar 2016 03:23:11 -0400
-Subject: [PATCH] configure: fix with/without selinux
-
-Problem:
-without-selinux doesn't work since WITH_SELINUX is always be defined no
-matter which option is given: with-selinux, without-selinux.
-
-Fix:
-Disable selinux support if without-selinux is given; otherwise check
-libselinux to determine if selinux support should be enabled.
-
-Upstream-Status: Submitted [at@packages.debian.org]
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- configure.ac | 19 +++++++++++++++----
- 1 file changed, 15 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5a43419..8c9de62 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -240,10 +240,21 @@ AC_ARG_WITH(daemon_username,
- AC_SUBST(DAEMON_USERNAME)
- 
- AC_ARG_WITH(selinux,
--[ --with-selinux       Define to run with selinux],
--AC_DEFINE(WITH_SELINUX, 1, [Define if you are building with_selinux]),
--)
--AC_CHECK_LIB(selinux, is_selinux_enabled, SELINUXLIB=-lselinux)
-+[ --with-selinux       Define to run with selinux (default=check)],
-+[],
-+[with_selinux=check])
-+
-+if test "x$with_selinux" != xno; then
-+  AC_CHECK_LIB([selinux], [is_selinux_enabled],
-+    [SELINUXLIB=-lselinux
-+     AC_DEFINE(WITH_SELINUX, 1, [Define if you are building with_selinux])
-+    ],
-+    [if test "x$with_selinux" != xcheck; then
-+       AC_MSG_FAILURE([--with-selinux is given, but test for selinux failed])
-+     fi
-+    ]
-+  )
-+fi
- AC_SUBST(SELINUXLIB)
- AC_SUBST(WITH_SELINUX)
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/at/at_3.1.18.bb b/meta/recipes-extended/at/at_3.1.20.bb
similarity index 89%
rename from meta/recipes-extended/at/at_3.1.18.bb
rename to meta/recipes-extended/at/at_3.1.20.bb
index 93044f5..1c3eefc 100644
--- a/meta/recipes-extended/at/at_3.1.18.bb
+++ b/meta/recipes-extended/at/at_3.1.20.bb
@@ -15,7 +15,7 @@ PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
 RCONFLICTS_${PN} = "atd"
 RREPLACES_${PN} = "atd"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz;subdir=${BP} \
+SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
     file://fix_parallel_build_error.patch \
     file://posixtm.c \
     file://posixtm.h \
@@ -25,14 +25,13 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz;subdir=${BP} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
     file://makefile-fix-parallel.patch \
     file://0001-remove-glibc-assumption.patch \
-    file://configure-fix-with-without-selinux.patch \
     "
 
 PAM_SRC_URI = "file://pam.conf.patch \
                file://configure-add-enable-pam.patch"
 
-SRC_URI[md5sum] = "f67a7aab557cd5b4a1311079a08acebe"
-SRC_URI[sha256sum] = "dbd5c8cb8edd53ef467363c3af0391c08769f1dbbd4d5002c59a4cd4cac11d52"
+SRC_URI[md5sum] = "e7bd7b785b2cbb17e133d6bdc0fb099e"
+SRC_URI[sha256sum] = "0871923cab73050b98ace020664eb2ddc1e669e4166b5abb64d864d02fcefab9"
 
 EXTRA_OECONF += "ac_cv_path_SENDMAIL=/bin/true \
                  --with-daemon_username=root \
-- 
1.9.1


