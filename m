Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id EF92371B9E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 08:59:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="36021524"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jan 2018 16:59:55 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id E696B49F19B1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 16:59:55 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 26 Jan 2018 16:59:55 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jan 2018 17:00:07 +0800
Message-ID: <1516957210-15531-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: E696B49F19B1.A906E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libunwind: 1.2 -> 1.2.1
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
X-List-Received-Date: Fri, 26 Jan 2018 08:59:59 -0000
Content-Type: text/plain

1.Upgrade libunwind from 1.2 to 1.2.1.
2.Delete fix-mips.patch, since it is integrated upstream.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../libunwind/libunwind/fix-mips.patch             | 134 ---------------------
 .../{libunwind_1.2.bb => libunwind_1.2.1.bb}       |   5 +-
 2 files changed, 2 insertions(+), 137 deletions(-)
 delete mode 100644 meta/recipes-support/libunwind/libunwind/fix-mips.patch
 rename meta/recipes-support/libunwind/{libunwind_1.2.bb => libunwind_1.2.1.bb} (84%)

diff --git a/meta/recipes-support/libunwind/libunwind/fix-mips.patch b/meta/recipes-support/libunwind/libunwind/fix-mips.patch
deleted file mode 100644
index 0022237..0000000
--- a/meta/recipes-support/libunwind/libunwind/fix-mips.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 5f354cb7b9c84dae006f0ebd8ad7a78d7e2aad0c Mon Sep 17 00:00:00 2001
-From: Dave Watson <davejwatson@fb.com>
-Date: Wed, 25 Jan 2017 16:18:02 -0800
-Subject: [PATCH] mips/tilegx: Add missing unwind_i.h header file
-
-reported-by: John Knight <John.Knight@belkin.com>
----
- src/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 5d874755..7de4c425 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -280,7 +280,7 @@ libunwind_hppa_la_SOURCES_hppa = $(libunwind_la_SOURCES_hppa_common)	\
- 	hppa/Gresume.c hppa/Gstep.c
- 
- # The list of files that go info libunwind and libunwind-mips:
--noinst_HEADERS += mips/init.h mips/offsets.h
-+noinst_HEADERS += mips/init.h mips/offsets.h mips/unwind_i.h
- libunwind_la_SOURCES_mips_common = $(libunwind_la_SOURCES_common)	    \
- 	mips/is_fpreg.c mips/regname.c
- 
-@@ -299,7 +299,7 @@ libunwind_mips_la_SOURCES_mips = $(libunwind_la_SOURCES_mips_common)	    \
- 	mips/Gis_signal_frame.c mips/Gregs.c mips/Gresume.c mips/Gstep.c
- 
- # The list of files that go info libunwind and libunwind-tilegx:
--noinst_HEADERS += tilegx/init.h tilegx/offsets.h
-+noinst_HEADERS += tilegx/init.h tilegx/offsets.h tilegx/unwind_i.h
- libunwind_la_SOURCES_tilegx_common = $(libunwind_la_SOURCES_common)	    \
- 	tilegx/is_fpreg.c tilegx/regname.c
- 
-diff --git a/src/mips/unwind_i.h b/src/mips/unwind_i.h
-new file mode 100644
-index 0000000..3382dcf
---- /dev/null
-+++ b/src/mips/unwind_i.h
-@@ -0,0 +1,43 @@
-+/* libunwind - a platform-independent unwind library
-+   Copyright (C) 2008 CodeSourcery
-+
-+This file is part of libunwind.
-+
-+Permission is hereby granted, free of charge, to any person obtaining
-+a copy of this software and associated documentation files (the
-+"Software"), to deal in the Software without restriction, including
-+without limitation the rights to use, copy, modify, merge, publish,
-+distribute, sublicense, and/or sell copies of the Software, and to
-+permit persons to whom the Software is furnished to do so, subject to
-+the following conditions:
-+
-+The above copyright notice and this permission notice shall be
-+included in all copies or substantial portions of the Software.
-+
-+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-+NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
-+LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-+OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
-+WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
-+
-+#ifndef unwind_i_h
-+#define unwind_i_h
-+
-+#include <stdint.h>
-+
-+#include <libunwind-mips.h>
-+
-+#include "libunwind_i.h"
-+
-+#define mips_lock                       UNW_OBJ(lock)
-+#define mips_local_resume               UNW_OBJ(local_resume)
-+#define mips_local_addr_space_init      UNW_OBJ(local_addr_space_init)
-+
-+extern int mips_local_resume (unw_addr_space_t as, unw_cursor_t *cursor,
-+                             void *arg);
-+
-+extern void mips_local_addr_space_init (void);
-+
-+#endif /* unwind_i_h */
-diff --git a/src/tilegx/unwind_i.h b/src/tilegx/unwind_i.h
-new file mode 100644
-index 0000000..aac7be3
---- /dev/null
-+++ b/src/tilegx/unwind_i.h
-@@ -0,0 +1,44 @@
-+/* libunwind - a platform-independent unwind library
-+   Copyright (C) 2008 CodeSourcery
-+
-+This file is part of libunwind.
-+
-+Permission is hereby granted, free of charge, to any person obtaining
-+a copy of this software and associated documentation files (the
-+"Software"), to deal in the Software without restriction, including
-+without limitation the rights to use, copy, modify, merge, publish,
-+distribute, sublicense, and/or sell copies of the Software, and to
-+permit persons to whom the Software is furnished to do so, subject to
-+the following conditions:
-+
-+The above copyright notice and this permission notice shall be
-+included in all copies or substantial portions of the Software.
-+
-+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-+NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
-+LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-+OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
-+WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
-+
-+#ifndef unwind_i_h
-+#define unwind_i_h
-+
-+#include <memory.h>
-+#include <stdint.h>
-+
-+#include <libunwind-tilegx.h>
-+
-+#include "libunwind_i.h"
-+
-+#define tilegx_local_resume            UNW_OBJ(local_resume)
-+#define tilegx_local_addr_space_init   UNW_OBJ(local_addr_space_init)
-+
-+extern int tilegx_local_resume (unw_addr_space_t as,
-+                                unw_cursor_t *cursor,
-+                                void *arg);
-+
-+extern void tilegx_local_addr_space_init (void);
-+
-+#endif /* unwind_i_h */
diff --git a/meta/recipes-support/libunwind/libunwind_1.2.bb b/meta/recipes-support/libunwind/libunwind_1.2.1.bb
similarity index 84%
rename from meta/recipes-support/libunwind/libunwind_1.2.bb
rename to meta/recipes-support/libunwind/libunwind_1.2.1.bb
index c6312f2..37a7624 100644
--- a/meta/recipes-support/libunwind/libunwind_1.2.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.2.1.bb
@@ -1,7 +1,7 @@
 require libunwind.inc
 
-SRC_URI[md5sum] = "eefcb5d7f78fdc8f1ed172a26ea4202f"
-SRC_URI[sha256sum] = "1de38ffbdc88bd694d10081865871cd2bfbb02ad8ef9e1606aee18d65532b992"
+SRC_URI[md5sum] = "06ba9e60d92fd6f55cd9dadb084df19e"
+SRC_URI[sha256sum] = "3f3ecb90e28cbe53fba7a4a27ccce7aad188d3210bb1964a923a731a27a75acb"
 
 SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV}.tar.gz \
            file://Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch \
@@ -11,7 +11,6 @@ SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV
            file://0001-add-knobs-to-disable-enable-tests.patch \
            file://0001-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
            file://libunwind-1.1-x32.patch \
-           file://fix-mips.patch \
            "
 
 SRC_URI_append_libc-musl = " file://musl-header-conflict.patch"
-- 
2.7.4




