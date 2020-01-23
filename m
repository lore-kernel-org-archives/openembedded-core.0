Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1F5409159B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 05:32:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jan 2020 21:32:18 -0800
X-IronPort-AV: E=Sophos;i="5.70,352,1574150400"; d="scan'208";a="220553973"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.20.185])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jan 2020 21:32:17 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 13:32:04 +0800
Message-Id: <20200123053204.24713-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [PATCH] libtirpc: upgrade 1.1.4 -> 1.2.5
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
X-List-Received-Date: Thu, 23 Jan 2020 05:32:17 -0000
Content-Transfer-Encoding: 8bit

Drop musl patch and backport a fix from upstream instead.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...r_float-do-not-include-bits-endian.h.patch | 34 +++++++++++++++++++
 .../libtirpc/libtirpc/musl.patch              | 30 ----------------
 .../{libtirpc_1.1.4.bb => libtirpc_1.2.5.bb}  |  6 ++--
 3 files changed, 37 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-xdr_float-do-not-include-bits-endian.h.patch
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/musl.patch
 rename meta/recipes-extended/libtirpc/{libtirpc_1.1.4.bb => libtirpc_1.2.5.bb} (81%)

diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-xdr_float-do-not-include-bits-endian.h.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-xdr_float-do-not-include-bits-endian.h.patch
new file mode 100644
index 0000000000..777bd5588c
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/0001-xdr_float-do-not-include-bits-endian.h.patch
@@ -0,0 +1,34 @@
+From d04f4d6f0e682f16b0ce96839ab4eadade591eb1 Mon Sep 17 00:00:00 2001
+From: Rosen Penev <rosenp@gmail.com>
+Date: Tue, 21 Jan 2020 11:51:16 -0500
+Subject: [PATCH] xdr_float: do not include bits/endian.h
+
+bits/endian.h is an internal header. endian.h should be included.
+
+Fixes compilation with recent musl.
+
+Signed-off-by: Rosen Penev <rosenp@gmail.com>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+
+Upstream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ src/xdr_float.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/xdr_float.c b/src/xdr_float.c
+index 26bc865..349d48f 100644
+--- a/src/xdr_float.c
++++ b/src/xdr_float.c
+@@ -83,7 +83,7 @@ static struct sgl_limits {
+ };
+ #else
+ 
+-#include <bits/endian.h>
++#include <endian.h>
+ #define IEEEFP
+ 
+ #endif /* vax */
+-- 
+2.21.1
+
diff --git a/meta/recipes-extended/libtirpc/libtirpc/musl.patch b/meta/recipes-extended/libtirpc/libtirpc/musl.patch
deleted file mode 100644
index 21cd9f9588..0000000000
--- a/meta/recipes-extended/libtirpc/libtirpc/musl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Consider musl provided built-in defines
-
-Helps compile libtirpc with musl
-bits/endian.h is not supposed to be included directly
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/tirpc/rpc/types.h
-+++ b/tirpc/rpc/types.h
-@@ -66,7 +66,7 @@ typedef   int32_t rpc_inline_t;
- #define mem_free(ptr, bsize)	free(ptr)
- 
- 
--#if defined __APPLE_CC__ || defined __FreeBSD__
-+#if defined __APPLE_CC__ || defined __FreeBSD__ || !defined(__GLIBC__)
- # define __u_char_defined
- # define __daddr_t_defined
- #endif
---- a/src/xdr_float.c
-+++ b/src/xdr_float.c
-@@ -83,7 +83,7 @@ static struct sgl_limits {
- };
- #else
- 
--#include <bits/endian.h>
-+#include <endian.h>
- #define IEEEFP
- 
- #endif /* vax */
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb b/meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
similarity index 81%
rename from meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
rename to meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
index 53ed5e81f7..fc66821ecc 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
@@ -10,12 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3 \
 PROVIDES = "virtual/librpc"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
-           file://musl.patch \
+           file://0001-xdr_float-do-not-include-bits-endian.h.patch \
            "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
-SRC_URI[md5sum] = "f5d2a623e9dfbd818d2f3f3a4a878e3a"
-SRC_URI[sha256sum] = "2ca529f02292e10c158562295a1ffd95d2ce8af97820e3534fe1b0e3aec7561d"
+SRC_URI[md5sum] = "688787ddff7c6a92ef15ae3f5dc4dfa1"
+SRC_URI[sha256sum] = "f3b6350c7e9c3cd9c58fc7a5e5f8e6be469cc571bb5eb31eb9790b3e675186ca"
 
 inherit autotools pkgconfig
 
-- 
2.21.1


