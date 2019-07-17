Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 265BF7ED17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 09:50:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6H9oecZ026718
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 02:50:40 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 17 Jul 2019 02:50:39 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jul 2019 02:50:39 -0700
Message-ID: <20190717095039.121044-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] ltp: getrlimit03: adjust-a-bit-of-code-to-compatiable-with mips32
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
X-List-Received-Date: Wed, 17 Jul 2019 09:50:43 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Error info:
getrlimit03.c:104: FAIL: __NR_prlimit64(0) had rlim_cur =
ffffffffffffffff but __NR_getrlimit(0) had rlim_cur = 7fffffff

According to kernel code: [arch/mips/include/uapi/asm/resource.h]
RLIM_INFINITY is set to 0x7fffffffUL instead of ULONG_MAX on mips32.

 /*
 * SuS says limits have to be unsigned.
 * Which makes a ton more sense anyway,
 * but we keep the old value on MIPS32,
 * for compatibility:
 */
 #ifndef __mips64
 # define RLIM_INFINITY      0x7fffffffUL
 #endif

Adding conditional statement about mips to fix this.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 ...-adjust-a-bit-of-code-to-compatiable-with.patch | 62 ++++++++++++++++++
 ...efine-TST_ABI-32-64-to-detect-target-type.patch | 74 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20190115.bb          |  2 +
 3 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-lapi-Define-TST_ABI-32-64-to-detect-target-type.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch b/meta/recipes-extended/ltp/ltp/0001-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch
new file mode 100644
index 0000000..7b66229
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch
@@ -0,0 +1,62 @@
+From e79652a3839869b1983d65999e5d5dcb50bc9cd7 Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Mon, 15 Jul 2019 03:39:06 -0400
+Subject: [PATCH] getrlimit03: adjust a bit of code to compatiable with mips32
+
+Error info:
+getrlimit03.c:104: FAIL: __NR_prlimit64(0) had rlim_cur =
+ffffffffffffffff but __NR_getrlimit(0) had rlim_cur = 7fffffff
+
+According to kernel code: [arch/mips/include/uapi/asm/resource.h]
+RLIM_INFINITY is set to 0x7fffffffUL instead of ULONG_MAX on mips32.
+
+ /*
+ * SuS says limits have to be unsigned.
+ * Which makes a ton more sense anyway,
+ * but we keep the old value on MIPS32,
+ * for compatibility:
+ */
+ #ifndef __mips64
+ # define RLIM_INFINITY      0x7fffffffUL
+ #endif
+
+Adding conditional statement about mips to fix this.
+
+Signed-off-by: Jan Stancek <jstancek@redhat.com>
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+
+Upstream-Status: Backport
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+---
+ testcases/kernel/syscalls/getrlimit/getrlimit03.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/syscalls/getrlimit/getrlimit03.c b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
+index e4d56c4..03bd821 100644
+--- a/testcases/kernel/syscalls/getrlimit/getrlimit03.c
++++ b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
+@@ -26,6 +26,7 @@
+ 
+ #include "tst_test.h"
+ #include "lapi/syscalls.h"
++#include "lapi/abisize.h"
+ 
+ /**
+  * Linux provides an "old" getrlimit syscall handler that uses signed long,
+@@ -61,7 +62,12 @@ struct rlimit_ulong {
+ 	unsigned long rlim_cur;
+ 	unsigned long rlim_max;
+ };
+-const unsigned long RLIM_INFINITY_UL = ULONG_MAX;
++
++#if defined(__mips__) && defined(TST_ABI32)
++	const unsigned long RLIM_INFINITY_UL = 0x7fffffffUL;
++#else
++	const unsigned long RLIM_INFINITY_UL = ULONG_MAX;
++#endif
+ 
+ static int getrlimit_ulong(int resource, struct rlimit_ulong *rlim)
+ {
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/ltp/ltp/0001-lapi-Define-TST_ABI-32-64-to-detect-target-type.patch b/meta/recipes-extended/ltp/ltp/0001-lapi-Define-TST_ABI-32-64-to-detect-target-type.patch
new file mode 100644
index 0000000..a6129d3
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-lapi-Define-TST_ABI-32-64-to-detect-target-type.patch
@@ -0,0 +1,74 @@
+From d5293d73b760268a6b200ab7d9323e37700e6a8c Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Thu, 28 Mar 2019 07:11:25 +0100
+Subject: [PATCH] lapi: Define TST_ABI{,32,64} to detect target type
+
+This is meant to be a replacement of __WORDSIZE definition.
+
+Motivation was instead of finding, where all libc define
+__WORDSIZE, which is usually used for detecting target type
+(at least MUSL defines it in different place than other libc)
+we define our own constant.
+
+Suggested-by: Cyril Hrubis <chrubis@suse.cz>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+
+Upstream-Status: Backport
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+---
+ include/lapi/abisize.h | 29 +++++++++++++----------------
+ 1 file changed, 13 insertions(+), 16 deletions(-)
+
+diff --git a/include/lapi/abisize.h b/include/lapi/abisize.h
+index 897bdfd..9e6622c 100644
+--- a/include/lapi/abisize.h
++++ b/include/lapi/abisize.h
+@@ -1,25 +1,22 @@
++// SPDX-License-Identifier: GPL-2.0-or-later
+ /*
+- * Copyright (c) 2014 Linux Test Project
++ * Copyright (c) 2014-2019 Linux Test Project
+  *  Cyril Hrubis <chrubis@suse.cz>
+- *
+- * This program is free software; you can redistribute it and/or
+- * modify it under the terms of the GNU General Public License as
+- * published by the Free Software Foundation; either version 2 of
+- * the License, or (at your option) any later version.
+- *
+- * This program is distributed in the hope that it would be useful,
+- * but WITHOUT ANY WARRANTY; without even the implied warranty of
+- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+- * GNU General Public License for more details.
+- *
+- * You should have received a copy of the GNU General Public License
+- * along with this program; if not, write the Free Software Foundation,
+- * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
++ *  Petr Vorel <petr.vorel@gmail.com>
+  */
+ 
+ #ifndef ABISIZE_H__
+ #define ABISIZE_H__
+ 
++/* __WORDSIZE replacement */
++#if defined(__LP64__) || defined(_LP64)
++# define TST_ABI64
++# define TST_ABI 64
++#else
++# define TST_ABI32
++# define TST_ABI 32
++#endif
++
+ /*
+  * Determines if we have to split up 64 bit arguments or not
+  *
+@@ -29,6 +26,6 @@
+      (defined(__mips__) && _MIPS_SIM == _ABIN32) || \
+      (defined(__x86_64__) && defined(__ILP32__)) || \
+      (defined(__aarch64__) && defined(__ILP32__)) || \
+-     __WORDSIZE == 64
++     defined(TST_ABI64)
+ 
+ #endif /* ABISIZE_H__ */
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20190115.bb b/meta/recipes-extended/ltp/ltp_20190115.bb
index b7b581f..f208b71 100644
--- a/meta/recipes-extended/ltp/ltp_20190115.bb
+++ b/meta/recipes-extended/ltp/ltp_20190115.bb
@@ -53,6 +53,8 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch \
            file://0001-diotest4-Let-kernel-pick-an-address-when-calling-mma.patch \
            file://0001-file01.sh-Fix-in-was-not-recognized.patch \
+           file://0001-lapi-Define-TST_ABI-32-64-to-detect-target-type.patch \
+           file://0001-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.8.1


