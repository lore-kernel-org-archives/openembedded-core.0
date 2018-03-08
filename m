Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8993978980
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053769"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:02 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:35 +0200
Message-Id: <20180308181804.31261-13-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 13/42] kmod: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:01 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch | 13 +++++--------
 meta/recipes-kernel/kmod/kmod/fix-O_CLOEXEC.patch        | 15 ++++++---------
 2 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch b/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
index feafcb9b7c6..5f45fce932e 100644
--- a/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
+++ b/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
@@ -11,10 +11,10 @@ Upstream-Status: Inappropriate (disable feature incompatible with ptest)
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index eb0f9d1..a539968 100644
---- a/configure.ac
-+++ b/configure.ac
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac
++++ git/configure.ac
 @@ -14,7 +14,7 @@ AC_USE_SYSTEM_EXTENSIONS
  AC_SYS_LARGEFILE
  AC_PREFIX_DEFAULT([/usr])
@@ -23,7 +23,4 @@ index eb0f9d1..a539968 100644
 +AM_INIT_AUTOMAKE([check-news foreign 1.11 silent-rules tar-pax no-dist-gzip dist-xz subdir-objects color-tests serial-tests])
  AM_SILENT_RULES([yes])
  LT_INIT([disable-static pic-only])
- 
--- 
-1.9.1
-
+ DOLT
diff --git a/meta/recipes-kernel/kmod/kmod/fix-O_CLOEXEC.patch b/meta/recipes-kernel/kmod/kmod/fix-O_CLOEXEC.patch
index 8161d6128d3..5d9d40c387f 100644
--- a/meta/recipes-kernel/kmod/kmod/fix-O_CLOEXEC.patch
+++ b/meta/recipes-kernel/kmod/kmod/fix-O_CLOEXEC.patch
@@ -18,12 +18,12 @@ Upstream-Status: Pending
  libkmod/libkmod-internal.h |    4 ++++
  1 file changed, 4 insertions(+)
 
-diff --git a/libkmod/libkmod-internal.h b/libkmod/libkmod-internal.h
-index 0180124..100b40f 100644
---- a/libkmod/libkmod-internal.h
-+++ b/libkmod/libkmod-internal.h
-@@ -9,6 +9,10 @@
- #include "macro.h"
+Index: git/libkmod/libkmod-internal.h
+===================================================================
+--- git.orig/libkmod/libkmod-internal.h
++++ git/libkmod/libkmod-internal.h
+@@ -10,6 +10,10 @@
+ 
  #include "libkmod.h"
  
 +#ifndef O_CLOEXEC
@@ -33,6 +33,3 @@ index 0180124..100b40f 100644
  static _always_inline_ _printf_format_(2, 3) void
  	kmod_log_null(struct kmod_ctx *ctx, const char *format, ...) {}
  
--- 
-1.7.10.4
-
-- 
2.16.1


