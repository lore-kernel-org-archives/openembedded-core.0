Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2EE7B60196
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 01:28:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4K1STKS002673
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 18:28:29 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 19 May 2014 18:28:28 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 May 2014 09:28:26 +0800
Message-ID: <30113d1d27d63ac46f8aecdc7fbaffeb4efaedd8.1400549249.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1400549249.git.Chong.Lu@windriver.com>
References: <cover.1400549249.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] guile: Update to 2.0.11 version
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
X-List-Received-Date: Tue, 20 May 2014 01:28:28 -0000
Content-Type: text/plain

Upgrade guile to 2.0.11 version and remove unneeded patch since
it's included in new version.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../guile/files/guile_2.0.9_fix_noreturn.patch     | 65 ----------------------
 .../guile/{guile_2.0.9.bb => guile_2.0.11.bb}      |  5 +-
 2 files changed, 2 insertions(+), 68 deletions(-)
 delete mode 100644 meta/recipes-devtools/guile/files/guile_2.0.9_fix_noreturn.patch
 rename meta/recipes-devtools/guile/{guile_2.0.9.bb => guile_2.0.11.bb} (95%)

diff --git a/meta/recipes-devtools/guile/files/guile_2.0.9_fix_noreturn.patch b/meta/recipes-devtools/guile/files/guile_2.0.9_fix_noreturn.patch
deleted file mode 100644
index 3f65dce..0000000
--- a/meta/recipes-devtools/guile/files/guile_2.0.9_fix_noreturn.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 36c40440078c005cd5e239cca487d29f6f60007d Mon Sep 17 00:00:00 2001
-From: Mark H Weaver <mhw@netris.org>
-Date: Mon, 4 Nov 2013 19:41:52 -0500
-Subject: [PATCH] Don't use the identifier 'noreturn'.
-
-Fixes <http://bugs.gnu.org/15798>.
-Reported by Matt Sicker <boards@gmail.com>.
-
-* libguile/__scm.h (SCM_NORETURN): Use ((__noreturn__)) instead of
-  ((noreturn)).
-
-* libguile/throw.h (scm_ithrow): Rename formal parameter from 'noreturn'
-  to 'no_return'.
-
-* libguile/throw.c (scm_ithrow): Rename formal parameter from 'noreturn'
-  to 'no_return'.
----
- libguile/__scm.h |    2 +-
- libguile/throw.c |    2 +-
- libguile/throw.h |    2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-Upstream-Status: Backport
-
-diff --git a/libguile/__scm.h b/libguile/__scm.h
-index ed35d53..a0b02b6 100644
---- a/libguile/__scm.h
-+++ b/libguile/__scm.h
-@@ -77,7 +77,7 @@
-  *   1) int foo (char arg) SCM_NORETURN;
-  */
- #ifdef __GNUC__
--#define SCM_NORETURN __attribute__ ((noreturn))
-+#define SCM_NORETURN __attribute__ ((__noreturn__))
- #else
- #define SCM_NORETURN
- #endif
-diff --git a/libguile/throw.c b/libguile/throw.c
-index 9c29351..7fc9edf 100644
---- a/libguile/throw.c
-+++ b/libguile/throw.c
-@@ -436,7 +436,7 @@ scm_handle_by_throw (void *handler_data SCM_UNUSED, SCM tag, SCM args)
- }
- 
- SCM
--scm_ithrow (SCM key, SCM args, int noreturn SCM_UNUSED)
-+scm_ithrow (SCM key, SCM args, int no_return SCM_UNUSED)
- {
-   return scm_throw (key, args);
- }
-diff --git a/libguile/throw.h b/libguile/throw.h
-index 6cf6790..62592d2 100644
---- a/libguile/throw.h
-+++ b/libguile/throw.h
-@@ -79,7 +79,7 @@ SCM_API int scm_exit_status (SCM args);
- SCM_API SCM scm_catch_with_pre_unwind_handler (SCM tag, SCM thunk, SCM handler, SCM lazy_handler);
- SCM_API SCM scm_catch (SCM tag, SCM thunk, SCM handler);
- SCM_API SCM scm_with_throw_handler (SCM tag, SCM thunk, SCM handler);
--SCM_API SCM scm_ithrow (SCM key, SCM args, int noreturn);
-+SCM_API SCM scm_ithrow (SCM key, SCM args, int no_return);
- 
- SCM_API SCM scm_throw (SCM key, SCM args);
- SCM_INTERNAL void scm_init_throw (void);
--- 
-1.7.2.5
diff --git a/meta/recipes-devtools/guile/guile_2.0.9.bb b/meta/recipes-devtools/guile/guile_2.0.11.bb
similarity index 95%
rename from meta/recipes-devtools/guile/guile_2.0.9.bb
rename to meta/recipes-devtools/guile/guile_2.0.11.bb
index b35d54e..c597111 100644
--- a/meta/recipes-devtools/guile/guile_2.0.9.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
@@ -19,14 +19,13 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
            file://opensuse/guile-64bit.patch \
            file://guile_2.0.6_fix_sed_error.patch \
            file://arm_endianness.patch \
-           file://guile_2.0.9_fix_noreturn.patch \
            "
 
 #           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
 #           file://opensuse/guile-turn-off-gc-test.patch 
 
-SRC_URI[md5sum] = "a69b575d4a633bdd9118f3a4a1e97766"
-SRC_URI[sha256sum] = "f70a38c8d9751f442679bfe61852bba8545af4d4355d037630997c2f37f2895b"
+SRC_URI[md5sum] = "03f1bce1a4983076d955003472306a13"
+SRC_URI[sha256sum] = "aed0a4a6db4e310cbdfeb3613fa6f86fddc91ef624c1e3f8937a6304c69103e2"
 
 
 inherit autotools gettext texinfo
-- 
1.8.1.2


