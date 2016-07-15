Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C42066FF93
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 01:49:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jul 2016 18:49:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,365,1464678000"; d="scan'208";a="995612653"
Received: from timo-fedora.jf.intel.com ([10.7.201.162])
	by orsmga001.jf.intel.com with ESMTP; 14 Jul 2016 18:49:02 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 18:49:33 -0700
Message-Id: <10d2d3665114bd533e25db3a3d531e9fdc997391.1468546499.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
References: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
In-Reply-To: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
References: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
Subject: [krogoth][PATCH 2/8] elfutils-0.148: Fix build with gcc6
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
X-List-Received-Date: Fri, 15 Jul 2016 01:49:01 -0000

From: Khem Raj <raj.khem@gmail.com>

(From OE-Core rev: c2668171f5d76bfea085ecf2fa7dfe1e42df1e63)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../elfutils/elfutils-0.148/gcc6.patch             | 23 ++++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.148/gcc6.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/gcc6.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/gcc6.patch
new file mode 100644
index 0000000..b56a754
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/gcc6.patch
@@ -0,0 +1,23 @@
+Fix warnings found with gcc6
+
+| ../../elfutils-0.148/libdw/dwarf_siblingof.c: In function 'dwarf_siblingof':
+| ../../elfutils-0.148/libdw/dwarf_siblingof.c:69:6: error: nonnull argument 'result' compared to NULL [-Werror=nonnull-compare]
+|    if (result == NULL)
+|       ^
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Inappropriate [ unmaintained ]
+Index: elfutils-0.148/libdw/dwarf_siblingof.c
+===================================================================
+--- elfutils-0.148.orig/libdw/dwarf_siblingof.c
++++ elfutils-0.148/libdw/dwarf_siblingof.c
+@@ -66,9 +66,6 @@ dwarf_siblingof (die, result)
+   if (die == NULL)
+     return -1;
+ 
+-  if (result == NULL)
+-    return -1;
+-
+   if (result != die)
+     result->addr = NULL;
+ 
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index ff53257..6080c17 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -34,6 +34,7 @@ SRC_URI += "\
         file://Fix_elf_cvt_gunhash.patch \
         file://elf_begin.c-CVE-2014-9447-fix.patch \
         file://fix-build-gcc-4.8.patch \
+        file://gcc6.patch \
 "
 # Only apply when building uclibc based target recipe
 SRC_URI_append_libc-uclibc = " file://uclibc-support-for-elfutils-0.148.patch"
-- 
2.7.4


