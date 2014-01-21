Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DE2996E747
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 17:30:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Jan 2014 09:26:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,696,1384329600"; d="scan'208";a="470222862"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.212])
	by orsmga002.jf.intel.com with ESMTP; 21 Jan 2014 09:30:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2014 17:30:04 +0000
Message-Id: <f705fb2cb896efe02bbf74f965a3d740dcbc5b50.1390325320.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <cover.1390325320.git.paul.eggleton@linux.intel.com>
References: <cover.1390325320.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1390325320.git.paul.eggleton@linux.intel.com>
References: <cover.1390325320.git.paul.eggleton@linux.intel.com>
Subject: [dylan][PATCH 2/2] guile: fix build with Texinfo 5.0
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
X-List-Received-Date: Tue, 21 Jan 2014 17:30:26 -0000

Backport a patch from upstream which fixes failures building
guile-native on newer distros such as Ubuntu 13.10. (This does not
affect dora or master because we are using Guile 2.0.9 there, which
already contains this patch.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../0001-doc-Fix-build-with-Texinfo-5.0.patch      | 71 ++++++++++++++++++++++
 meta/recipes-devtools/guile/guile_2.0.7.bb         |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/guile/files/0001-doc-Fix-build-with-Texinfo-5.0.patch

diff --git a/meta/recipes-devtools/guile/files/0001-doc-Fix-build-with-Texinfo-5.0.patch b/meta/recipes-devtools/guile/files/0001-doc-Fix-build-with-Texinfo-5.0.patch
new file mode 100644
index 0000000..f39905c
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/0001-doc-Fix-build-with-Texinfo-5.0.patch
@@ -0,0 +1,71 @@
+From 183d2ace576710079a2bcf2a8bfcbc39b7d9becc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ludovic=20Court=C3=A8s?= <ludo@gnu.org>
+Date: Fri, 1 Mar 2013 17:49:24 +0100
+Subject: [PATCH] doc: Fix build with Texinfo 5.0.
+
+* doc/ref/api-control.texi (Handling Errors): Move misplaced description
+  for `scm_memory_error' & co.
+* doc/ref/r6rs.texi (rnrs base): Change `deffnx' of `let-syntax' and
+  `letrec-syntax' to fit on one line.
+
+Upstream-Status: Backport [in 2.0.9 release]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+---
+ doc/ref/api-control.texi | 6 +++---
+ doc/ref/r6rs.texi        | 8 +++-----
+ 2 files changed, 6 insertions(+), 8 deletions(-)
+
+diff --git a/doc/ref/api-control.texi b/doc/ref/api-control.texi
+index 95c4925..ea943d3 100644
+--- a/doc/ref/api-control.texi
++++ b/doc/ref/api-control.texi
+@@ -1,7 +1,7 @@
+ @c -*-texinfo-*-
+ @c This is part of the GNU Guile Reference Manual.
+-@c Copyright (C)  1996, 1997, 2000, 2001, 2002, 2003, 2004, 2009, 2010, 2011, 2012
+-@c   Free Software Foundation, Inc.
++@c Copyright (C)  1996, 1997, 2000, 2001, 2002, 2003, 2004, 2009, 2010,
++@c   2011, 2012, 2013 Free Software Foundation, Inc.
+ @c See the file guile.texi for copying conditions.
+ 
+ @node Control Mechanisms
+@@ -1732,8 +1732,8 @@ and the call to these routines doesn't change @code{errno}.
+ @deftypefnx {C Function} void scm_wrong_type_arg (char *@var{subr}, int @var{argnum}, SCM @var{bad_value})
+ @deftypefnx {C Function} void scm_wrong_type_arg_msg (char *@var{subr}, int @var{argnum}, SCM @var{bad_value}, const char *@var{expected})
+ @deftypefnx {C Function} void scm_memory_error (char *@var{subr})
+-Throw an error with the various keys described above.
+ @deftypefnx {C Function} void scm_misc_error (const char *@var{subr}, const char *@var{message}, SCM @var{args})
++Throw an error with the various keys described above.
+ 
+ In @code{scm_wrong_num_args}, @var{proc} should be a Scheme symbol
+ which is the name of the procedure incorrectly invoked.  The other
+diff --git a/doc/ref/r6rs.texi b/doc/ref/r6rs.texi
+index 2028ada..13f9e20 100644
+--- a/doc/ref/r6rs.texi
++++ b/doc/ref/r6rs.texi
+@@ -1,6 +1,6 @@
+ @c -*-texinfo-*-
+ @c This is part of the GNU Guile Reference Manual.
+-@c Copyright (C)  2010, 2011, 2012
++@c Copyright (C)  2010, 2011, 2012, 2013
+ @c   Free Software Foundation, Inc.
+ @c See the file guile.texi for copying conditions.
+ 
+@@ -273,10 +273,8 @@ grouped below by the existing manual sections to which they correspond.
+ @end deffn
+ 
+ @deffn {Scheme Syntax} define-syntax keyword expression
+-@deffnx {Scheme Syntax} let-syntax ((keyword transformer) @dots{})
+-                        exp1 exp2 @dots{}
+-@deffnx {Scheme Syntax} letrec-syntax ((keyword transformer) @dots{})
+-                        exp1 exp2 @dots{}
++@deffnx {Scheme Syntax} let-syntax ((keyword transformer) @dots{}) exp1 exp2 @dots{}
++@deffnx {Scheme Syntax} letrec-syntax ((keyword transformer) @dots{}) exp1 exp2 @dots{}
+ @xref{Defining Macros}, for documentation.
+ @end deffn
+ 
+-- 
+1.8.4.2
+
diff --git a/meta/recipes-devtools/guile/guile_2.0.7.bb b/meta/recipes-devtools/guile/guile_2.0.7.bb
index 5863014..e7191a7 100644
--- a/meta/recipes-devtools/guile/guile_2.0.7.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.7.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
            file://guile_2.0.6_fix_sed_error.patch \
            file://arm_endianness.patch \
            file://fix_parallel_build_issue.patch \
+           file://0001-doc-Fix-build-with-Texinfo-5.0.patch \
            "
 
 #           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
-- 
1.8.4.2


