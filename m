Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1B23D78973
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:24:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:24:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053660"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:24:52 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:29 +0200
Message-Id: <20180308181804.31261-7-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/42] gmp: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:24:52 -0000

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
 ...fiure.ac-Believe-the-cflags-from-environment.patch | 19 ++++++++-----------
 meta/recipes-support/gmp/gmp-6.1.2/amd64.patch        | 10 +++++-----
 .../gmp/gmp-6.1.2/use-includedir.patch                | 14 +++++++-------
 3 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-support/gmp/gmp-6.1.2/0001-confiure.ac-Believe-the-cflags-from-environment.patch b/meta/recipes-support/gmp/gmp-6.1.2/0001-confiure.ac-Believe-the-cflags-from-environment.patch
index 665367658bc..1e47924ccc7 100644
--- a/meta/recipes-support/gmp/gmp-6.1.2/0001-confiure.ac-Believe-the-cflags-from-environment.patch
+++ b/meta/recipes-support/gmp/gmp-6.1.2/0001-confiure.ac-Believe-the-cflags-from-environment.patch
@@ -18,13 +18,13 @@ Upstream-Status: Inappropriate[OE-Specific]
  configure.ac | 11 -----------
  1 file changed, 11 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index 857ea3b..359e919 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -607,15 +607,6 @@ case $host in
-     GMP_INCLUDE_MPN(arm/arm-defs.m4)
-     CALLING_CONVENTIONS_OBJS='arm32call.lo arm32check.lo'
+Index: gmp-6.1.2/configure.ac
+===================================================================
+--- gmp-6.1.2.orig/configure.ac
++++ gmp-6.1.2/configure.ac
+@@ -604,15 +604,6 @@ case $host in
+     any_32_testlist="sizeof-long-4"
+     any_64_testlist="sizeof-long-8"
  
 -    # This is needed for clang, which is not content with flags like -mfpu=neon
 -    # alone.
@@ -38,7 +38,7 @@ index 857ea3b..359e919 100644
      # FIXME: We make mandatory compiler options optional here.  We should
      # either enforce them, or organise to strip paths as the corresponding
      # options fail.
-@@ -686,8 +677,6 @@ case $host in
+@@ -746,8 +737,6 @@ case $host in
  	;;
        *)
  	path="arm"
@@ -47,6 +47,3 @@ index 857ea3b..359e919 100644
  	;;
      esac
      ;;
--- 
-1.9.1
-
diff --git a/meta/recipes-support/gmp/gmp-6.1.2/amd64.patch b/meta/recipes-support/gmp/gmp-6.1.2/amd64.patch
index 564d12d42b9..3935589f8b2 100644
--- a/meta/recipes-support/gmp/gmp-6.1.2/amd64.patch
+++ b/meta/recipes-support/gmp/gmp-6.1.2/amd64.patch
@@ -1,10 +1,10 @@
 Upstream-Status: Pending
 
-Index: gmp-5.0.3/longlong.h
+Index: gmp-6.1.2/longlong.h
 ===================================================================
---- gmp-5.0.3.orig/longlong.h
-+++ gmp-5.0.3/longlong.h
-@@ -994,8 +994,10 @@ extern UWtype __MPN(udiv_qrnnd) _PROTO (
+--- gmp-6.1.2.orig/longlong.h
++++ gmp-6.1.2/longlong.h
+@@ -1036,8 +1036,10 @@ extern UWtype __MPN(udiv_qrnnd) (UWtype
     count is only an int. */
  #define count_trailing_zeros(count, x)					\
    do {									\
@@ -14,5 +14,5 @@ Index: gmp-5.0.3/longlong.h
 +    __asm__ ("bsfq %1,%0" : "=r" (__cbtmp) : "rm" ((UDItype)(x)));	\
 +    (count) = __cbtmp;							\
    } while (0)
- #endif /* x86_64 */
+ #endif /* __amd64__ */
  
diff --git a/meta/recipes-support/gmp/gmp-6.1.2/use-includedir.patch b/meta/recipes-support/gmp/gmp-6.1.2/use-includedir.patch
index 74904a25302..6b089cf39c2 100644
--- a/meta/recipes-support/gmp/gmp-6.1.2/use-includedir.patch
+++ b/meta/recipes-support/gmp/gmp-6.1.2/use-includedir.patch
@@ -1,15 +1,15 @@
 Upstream-Status: Pending
 
-Index: gmp-4.2.4/Makefile.am
+Index: gmp-6.1.2/Makefile.am
 ===================================================================
---- gmp-4.2.4.orig/Makefile.am	2008-09-10 19:31:27.000000000 +0000
-+++ gmp-4.2.4/Makefile.am	2009-07-06 20:19:19.000000000 +0000
-@@ -106,7 +106,7 @@
- # but anyone knowledgable enough to be playing with exec_prefix will be able
+--- gmp-6.1.2.orig/Makefile.am
++++ gmp-6.1.2/Makefile.am
+@@ -130,7 +130,7 @@ EXTRA_DIST += gmpxx.h
+ # but anyone knowledgeable enough to be playing with exec_prefix will be able
  # to address that.
  #
 -includeexecdir = $(exec_prefix)/include
 +includeexecdir = $(includedir)
  include_HEADERS = $(GMPXX_HEADERS_OPTION)
- nodist_includeexec_HEADERS = gmp.h $(MPBSD_HEADERS_OPTION)
- lib_LTLIBRARIES = libgmp.la $(GMPXX_LTLIBRARIES_OPTION) $(MPBSD_LTLIBRARIES_OPTION)
+ nodist_includeexec_HEADERS = gmp.h
+ lib_LTLIBRARIES = libgmp.la $(GMPXX_LTLIBRARIES_OPTION)
-- 
2.16.1


