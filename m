Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EB00E77CC6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 13:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491485010; x=1523021010;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=aTGogqt7xxfNCJM+I9y/FAw2CHVkQ/bl4bR/Qck5dak=;
	b=Bs0QG5QvrxMB14GjpZmVQGZgSqZ4fX7tESb0kLXZysPyskCaWCt/glnS
	JyuqDk+Sz1HYNJ0Lx4FuJD0nTpyFpw==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2017 06:23:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,159,1488873600"; d="scan'208";a="1116286955"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.12.215])
	by orsmga001.jf.intel.com with ESMTP; 06 Apr 2017 06:23:29 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Apr 2017 14:23:13 +0100
Message-Id: <e41f4c4b0a6b402ffc15e22fe0075e782aaa108f.1491484515.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1491484515.git.joshua.g.lock@intel.com>
References: <cover.1491484515.git.joshua.g.lock@intel.com>
Subject: [PATCH 1/2] elfutils: fix building elfutils-native with GCC7
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
X-List-Received-Date: Thu, 06 Apr 2017 13:23:29 -0000

Backport a fix from upstream for a -Wformat-truncation=2 warning
and implement a simple fix for a -Wimplicit-fallthrough warning.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 .../elfutils-0.168/Fix_one_GCC7_warning.patch      | 44 ++++++++++++++++++++++
 .../elfutils/elfutils-0.168/fallthrough.patch      | 36 ++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.168.bb   |  3 ++
 3 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/Fix_one_GCC7_warning.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/fallthrough.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/Fix_one_GCC7_warning.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/Fix_one_GCC7_warning.patch
new file mode 100644
index 0000000..d88f4eb
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.168/Fix_one_GCC7_warning.patch
@@ -0,0 +1,44 @@
+From 93c51144c3f664d4e9709da75a1d0fa00ea0fe95 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Sun, 12 Feb 2017 21:51:34 +0100
+Subject: [PATCH] libasm: Fix one GCC7 -Wformat-truncation=2 warning.
+
+Make sure that if we have really lots of labels the tempsym doesn't get
+truncated because it is too small to hold the whole name.
+
+This doesn't enable -Wformat-truncation=2 or fix other "issues" pointed
+out by enabling this warning because there are currently some issues
+with it. https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79448
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+Upstream-Status: Backport (https://sourceware.org/git/?p=elfutils.git;a=commit;h=93c51144c3f664d4e9709da75a1d0fa00ea0fe95)
+Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
+
+---
+ libasm/ChangeLog    | 6 +++++-
+ libasm/asm_newsym.c | 6 ++++--
+ 2 files changed, 9 insertions(+), 3 deletions(-)
+
+Index: elfutils-0.168/libasm/asm_newsym.c
+===================================================================
+--- elfutils-0.168.orig/libasm/asm_newsym.c
++++ elfutils-0.168/libasm/asm_newsym.c
+@@ -1,5 +1,5 @@
+ /* Define new symbol for current position in given section.
+-   Copyright (C) 2002, 2005, 2016 Red Hat, Inc.
++   Copyright (C) 2002, 2005, 2016, 2017 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2002.
+ 
+@@ -44,7 +44,9 @@ AsmSym_t *
+ asm_newsym (AsmScn_t *asmscn, const char *name, GElf_Xword size,
+ 	    int type, int binding)
+ {
+-#define TEMPSYMLEN 10
++/* We don't really expect labels with many digits, but in theory it could
++   be 10 digits (plus ".L" and a zero terminator).  */
++#define TEMPSYMLEN 13
+   char tempsym[TEMPSYMLEN];
+   AsmSym_t *result;
+ 
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/fallthrough.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/fallthrough.patch
new file mode 100644
index 0000000..b2623f9
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.168/fallthrough.patch
@@ -0,0 +1,36 @@
+GCC7 adds -Wimplicit-fallthrough to warn when a switch case falls through,
+however this causes warnings (which are promoted to errors) with the elfutils
+patches from Debian for mips and parisc, which use fallthrough's by design.
+
+Explicitly mark the intentional fallthrough switch cases with a comment to
+disable the warnings where the fallthrough behaviour is desired.
+
+Upstream-Status: Pending [debian]
+Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
+
+Index: elfutils-0.168/backends/parisc_retval.c
+===================================================================
+--- elfutils-0.168.orig/backends/parisc_retval.c
++++ elfutils-0.168/backends/parisc_retval.c
+@@ -166,7 +166,7 @@ parisc_return_value_location_ (Dwarf_Die
+ 	  return nloc_intregpair;
+ 
+ 	/* Else fall through.  */
+-      }
++      } // fallthrough
+ 
+     case DW_TAG_structure_type:
+     case DW_TAG_class_type:
+Index: elfutils-0.168/backends/mips_retval.c
+===================================================================
+--- elfutils-0.168.orig/backends/mips_retval.c
++++ elfutils-0.168/backends/mips_retval.c
+@@ -387,7 +387,7 @@ mips_return_value_location (Dwarf_Die *f
+               else
+                 return nloc_intregpair;
+             }
+-        }
++        } // fallthrough
+ 
+       /* Fallthrough to handle large types */
+ 
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.168.bb b/meta/recipes-devtools/elfutils/elfutils_0.168.bb
index 9557933..3b8f2a3 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.168.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.168.bb
@@ -17,6 +17,7 @@ SRC_URI += "\
         file://0001-remove-the-unneed-checking.patch \
         file://0001-fix-a-stack-usage-warning.patch \
         file://aarch64_uio.patch \
+        file://Fix_one_GCC7_warning.patch \
         file://shadow.patch \
 "
 
@@ -35,6 +36,8 @@ SRC_URI += "\
         file://debian/hurd_path.patch \
         file://debian/ignore_strmerge.diff \
 "
+# Fix the patches from Debian with GCC7
+SRC_URI += "file://fallthrough.patch"
 SRC_URI_append_libc-musl = " file://0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch "
 
 # The buildsystem wants to generate 2 .h files from source using a binary it just built,
-- 
2.9.3


