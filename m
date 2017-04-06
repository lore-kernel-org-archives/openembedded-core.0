Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F0E2F77CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 13:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491485012; x=1523021012;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eAgh9hXPnH/V0XXbrQXFqs7ZwkZLi0lywaf5q4OErTU=;
	b=mqvffsYBMUY6zOzizqAQiD34g6Ey+y0hO39rd3RYkXmYMyhZA7x5bEtZ
	wqEj1/q/K6w2lM5rZrFZLBR38M+4XQ==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2017 06:23:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,159,1488873600"; d="scan'208";a="1116286965"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.12.215])
	by orsmga001.jf.intel.com with ESMTP; 06 Apr 2017 06:23:30 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Apr 2017 14:23:14 +0100
Message-Id: <830c850679639205133115941119043a50ab733d.1491484515.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1491484515.git.joshua.g.lock@intel.com>
References: <cover.1491484515.git.joshua.g.lock@intel.com>
Subject: [PATCH 2/2] gcc-6.3: backport fix of check for empty string in ubsan.c
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
X-List-Received-Date: Thu, 06 Apr 2017 13:23:31 -0000

Building gcc-cross-initial with GCC7 on the host fails due to the
comparison of a pointer to an integer in ubsan_use_new_style_p, which
is forbidden by ISO C++:

ubsan.c:1474:23: error: ISO C++ forbids comparison between pointer and
integer [-fpermissive]
       || xloc.file == '\0' || xloc.file[0] == '\xff'

Backport the fix from upstream GCC to enable the build with GCC 7

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/recipes-devtools/gcc/gcc-6.3.inc              |  1 +
 .../gcc/gcc-6.3/ubsan-fix-check-empty-string.patch | 28 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/ubsan-fix-check-empty-string.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.3.inc b/meta/recipes-devtools/gcc/gcc-6.3.inc
index da7a083..71d0aff 100644
--- a/meta/recipes-devtools/gcc/gcc-6.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
@@ -84,6 +84,7 @@ SRC_URI = "\
 "
 BACKPORTS = "\
            file://CVE-2016-6131.patch \
+           file://ubsan-fix-check-empty-string.patch \
 "
 SRC_URI[md5sum] = "677a7623c7ef6ab99881bc4e048debb6"
 SRC_URI[sha256sum] = "f06ae7f3f790fbf0f018f6d40e844451e6bc3b7bc96e128e63b09825c1f8b29f"
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/ubsan-fix-check-empty-string.patch b/meta/recipes-devtools/gcc/gcc-6.3/ubsan-fix-check-empty-string.patch
new file mode 100644
index 0000000..c012719
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.3/ubsan-fix-check-empty-string.patch
@@ -0,0 +1,28 @@
+From 8db2cf6353c13f2a84cbe49b689654897906c499 Mon Sep 17 00:00:00 2001
+From: kyukhin <kyukhin@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Sat, 3 Sep 2016 10:57:05 +0000
+Subject: [PATCH] gcc/ 	* ubsan.c (ubsan_use_new_style_p): Fix check for empty
+ string.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@239971 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport
+Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
+
+---
+ gcc/ubsan.c   | 2 +-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+Index: gcc-6.3.0/gcc/ubsan.c
+===================================================================
+--- gcc-6.3.0.orig/gcc/ubsan.c
++++ gcc-6.3.0/gcc/ubsan.c
+@@ -1471,7 +1471,7 @@ ubsan_use_new_style_p (location_t loc)
+ 
+   expanded_location xloc = expand_location (loc);
+   if (xloc.file == NULL || strncmp (xloc.file, "\1", 2) == 0
+-      || xloc.file == '\0' || xloc.file[0] == '\xff'
++      || xloc.file[0] == '\0' || xloc.file[0] == '\xff'
+       || xloc.file[1] == '\xff')
+     return false;
+ 
-- 
2.9.3


