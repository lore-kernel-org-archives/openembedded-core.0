Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C8C96A463
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 10:22:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0LAM9A4001860
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 02:22:09 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 21 Jan 2014 02:22:08 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jan 2014 18:22:21 +0800
Message-ID: <9d1f573c27a5ff44c8cb8718ea50d9c9b7f7b48f.1390298848.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1390298848.git.liezhi.yang@windriver.com>
References: <cover.1390298848.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] guile: don't use the identifier 'noreturn'
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
X-List-Received-Date: Tue, 21 Jan 2014 10:22:08 -0000
Content-Type: text/plain

Fix the build error of autogen-native which depends on guile-native:

ysroots/x86_64-linux/usr/include/guile/2.0/libguile/error.h:40:24: error: expected ')' before '__attribute__'
sysroots/x86_64-linux/usr/include/guile/2.0/libguile/error.h:40:24: error: expected ',' or ';' before ')' token
sysroots/x86_64-linux/usr/include/guile/2.0/libguile/error.h:42:27: error: expected ')' before '__attribute__'

[YOCTO #5743]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../guile/files/guile_2.0.9_fix_noreturn.patch     | 65 ++++++++++++++++++++++
 meta/recipes-devtools/guile/guile_2.0.9.bb         |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/guile/files/guile_2.0.9_fix_noreturn.patch

diff --git a/meta/recipes-devtools/guile/files/guile_2.0.9_fix_noreturn.patch b/meta/recipes-devtools/guile/files/guile_2.0.9_fix_noreturn.patch
new file mode 100644
index 0000000..3f65dce
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/guile_2.0.9_fix_noreturn.patch
@@ -0,0 +1,65 @@
+From 36c40440078c005cd5e239cca487d29f6f60007d Mon Sep 17 00:00:00 2001
+From: Mark H Weaver <mhw@netris.org>
+Date: Mon, 4 Nov 2013 19:41:52 -0500
+Subject: [PATCH] Don't use the identifier 'noreturn'.
+
+Fixes <http://bugs.gnu.org/15798>.
+Reported by Matt Sicker <boards@gmail.com>.
+
+* libguile/__scm.h (SCM_NORETURN): Use ((__noreturn__)) instead of
+  ((noreturn)).
+
+* libguile/throw.h (scm_ithrow): Rename formal parameter from 'noreturn'
+  to 'no_return'.
+
+* libguile/throw.c (scm_ithrow): Rename formal parameter from 'noreturn'
+  to 'no_return'.
+---
+ libguile/__scm.h |    2 +-
+ libguile/throw.c |    2 +-
+ libguile/throw.h |    2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+Upstream-Status: Backport
+
+diff --git a/libguile/__scm.h b/libguile/__scm.h
+index ed35d53..a0b02b6 100644
+--- a/libguile/__scm.h
++++ b/libguile/__scm.h
+@@ -77,7 +77,7 @@
+  *   1) int foo (char arg) SCM_NORETURN;
+  */
+ #ifdef __GNUC__
+-#define SCM_NORETURN __attribute__ ((noreturn))
++#define SCM_NORETURN __attribute__ ((__noreturn__))
+ #else
+ #define SCM_NORETURN
+ #endif
+diff --git a/libguile/throw.c b/libguile/throw.c
+index 9c29351..7fc9edf 100644
+--- a/libguile/throw.c
++++ b/libguile/throw.c
+@@ -436,7 +436,7 @@ scm_handle_by_throw (void *handler_data SCM_UNUSED, SCM tag, SCM args)
+ }
+ 
+ SCM
+-scm_ithrow (SCM key, SCM args, int noreturn SCM_UNUSED)
++scm_ithrow (SCM key, SCM args, int no_return SCM_UNUSED)
+ {
+   return scm_throw (key, args);
+ }
+diff --git a/libguile/throw.h b/libguile/throw.h
+index 6cf6790..62592d2 100644
+--- a/libguile/throw.h
++++ b/libguile/throw.h
+@@ -79,7 +79,7 @@ SCM_API int scm_exit_status (SCM args);
+ SCM_API SCM scm_catch_with_pre_unwind_handler (SCM tag, SCM thunk, SCM handler, SCM lazy_handler);
+ SCM_API SCM scm_catch (SCM tag, SCM thunk, SCM handler);
+ SCM_API SCM scm_with_throw_handler (SCM tag, SCM thunk, SCM handler);
+-SCM_API SCM scm_ithrow (SCM key, SCM args, int noreturn);
++SCM_API SCM scm_ithrow (SCM key, SCM args, int no_return);
+ 
+ SCM_API SCM scm_throw (SCM key, SCM args);
+ SCM_INTERNAL void scm_init_throw (void);
+-- 
+1.7.2.5
diff --git a/meta/recipes-devtools/guile/guile_2.0.9.bb b/meta/recipes-devtools/guile/guile_2.0.9.bb
index 9845682..e1504bb 100644
--- a/meta/recipes-devtools/guile/guile_2.0.9.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.9.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
            file://opensuse/guile-64bit.patch \
            file://guile_2.0.6_fix_sed_error.patch \
            file://arm_endianness.patch \
+           file://guile_2.0.9_fix_noreturn.patch \
            "
 
 #           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
-- 
1.8.3.1


