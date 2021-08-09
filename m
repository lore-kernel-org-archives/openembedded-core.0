Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.24726.1628523364931716435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 08:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="278466856"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="278466856"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:20 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="483462924"
Received: from abinzahx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.229.181])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:18 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 12/23] aspell: fix CVE-2019-25051
Date: Mon,  9 Aug 2021 23:35:44 +0800
Message-Id: <b415b0bc39dfae329e845569a122bcd301c326cc.1628522214.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1628522214.git.anuj.mittal@intel.com>
References: <cover.1628522214.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 297f8c4eb4ff209b5ea69910902d216d86dbe2bf)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/aspell/aspell_0.60.8.bb  |   4 +-
 .../aspell/files/CVE-2019-25051.patch         | 101 ++++++++++++++++++
 2 files changed, 104 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/aspell/files/CVE-2019-25051.patch

diff --git a/meta/recipes-support/aspell/aspell_0.60.8.bb b/meta/recipes-support/aspell/aspell_0.60.8.bb
index 6548c54b64..9147c820e7 100644
--- a/meta/recipes-support/aspell/aspell_0.60.8.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.bb
@@ -13,7 +13,9 @@ HOMEPAGE = "http://aspell.net/"
 LICENSE = "LGPLv2 | LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz \
+           file://CVE-2019-25051.patch \
+"
 SRC_URI[md5sum] = "012fa9209203ae4e5a61c2a668fd10e3"
 SRC_URI[sha256sum] = "f9b77e515334a751b2e60daab5db23499e26c9209f5e7b7443b05235ad0226f2"
 
diff --git a/meta/recipes-support/aspell/files/CVE-2019-25051.patch b/meta/recipes-support/aspell/files/CVE-2019-25051.patch
new file mode 100644
index 0000000000..8513f6de79
--- /dev/null
+++ b/meta/recipes-support/aspell/files/CVE-2019-25051.patch
@@ -0,0 +1,101 @@
+From 0718b375425aad8e54e1150313b862e4c6fd324a Mon Sep 17 00:00:00 2001
+From: Kevin Atkinson <kevina@gnu.org>
+Date: Sat, 21 Dec 2019 20:32:47 +0000
+Subject: [PATCH] objstack: assert that the alloc size will fit within a chunk
+ to prevent a buffer overflow
+
+Bug found using OSS-Fuze.
+
+Upstream-Status: Backport
+[https://github.com/gnuaspell/aspell/commit/0718b375425aad8e54e1150313b862e4c6fd324a]
+CVE: CVE-2019-25051
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ common/objstack.hpp | 18 ++++++++++++++----
+ 1 file changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/common/objstack.hpp b/common/objstack.hpp
+index 3997bf7..bd97ccd 100644
+--- a/common/objstack.hpp
++++ b/common/objstack.hpp
+@@ -5,6 +5,7 @@
+ #include "parm_string.hpp"
+ #include <stdlib.h>
+ #include <assert.h>
++#include <stddef.h>
+ 
+ namespace acommon {
+ 
+@@ -26,6 +27,12 @@ class ObjStack
+   byte * temp_end;
+   void setup_chunk();
+   void new_chunk();
++  bool will_overflow(size_t sz) const {
++    return offsetof(Node,data) + sz > chunk_size;
++  }
++  void check_size(size_t sz) {
++    assert(!will_overflow(sz));
++  }
+ 
+   ObjStack(const ObjStack &);
+   void operator=(const ObjStack &);
+@@ -56,7 +63,7 @@ class ObjStack
+   void * alloc_bottom(size_t size)  {
+     byte * tmp = bottom;
+     bottom += size;
+-    if (bottom > top) {new_chunk(); tmp = bottom; bottom += size;}
++    if (bottom > top) {check_size(size); new_chunk(); tmp = bottom; bottom += size;}
+     return tmp;
+   }
+   // This alloc_bottom will insure that the object is aligned based on the
+@@ -66,7 +73,7 @@ class ObjStack
+     align_bottom(align);
+     byte * tmp = bottom;
+     bottom += size;
+-    if (bottom > top) {new_chunk(); goto loop;}
++    if (bottom > top) {check_size(size); new_chunk(); goto loop;}
+     return tmp;
+   }
+   char * dup_bottom(ParmString str) {
+@@ -79,7 +86,7 @@ class ObjStack
+   // always be aligned as such.
+   void * alloc_top(size_t size) {
+     top -= size;
+-    if (top < bottom) {new_chunk(); top -= size;}
++    if (top < bottom) {check_size(size); new_chunk(); top -= size;}
+     return top;
+   }
+   // This alloc_top will insure that the object is aligned based on
+@@ -88,7 +95,7 @@ class ObjStack
+   {loop:
+     top -= size;
+     align_top(align);
+-    if (top < bottom) {new_chunk(); goto loop;}
++    if (top < bottom) {check_size(size); new_chunk(); goto loop;}
+     return top;
+   }
+   char * dup_top(ParmString str) {
+@@ -117,6 +124,7 @@ class ObjStack
+   void * alloc_temp(size_t size) {
+     temp_end = bottom + size;
+     if (temp_end > top) {
++      check_size(size);
+       new_chunk();
+       temp_end = bottom + size;
+     }
+@@ -131,6 +139,7 @@ class ObjStack
+     } else {
+       size_t s = temp_end - bottom;
+       byte * p = bottom;
++      check_size(size);
+       new_chunk();
+       memcpy(bottom, p, s);
+       temp_end = bottom + size;
+@@ -150,6 +159,7 @@ class ObjStack
+     } else {
+       size_t s = temp_end - bottom;
+       byte * p = bottom;
++      check_size(size);
+       new_chunk();
+       memcpy(bottom, p, s);
+       temp_end = bottom + size;
-- 
2.31.1

