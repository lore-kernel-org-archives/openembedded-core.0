Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0138C78D26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 14:00:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6RE0Wsw026478
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 27 Jul 2018 07:00:33 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Fri, 27 Jul 2018 07:00:31 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Fri, 27 Jul 2018 22:10:47 +0800
Message-ID: <1532700647-3563-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] valgrind: fix compile ptest failure on mips32
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
X-List-Received-Date: Fri, 27 Jul 2018 14:00:34 -0000
Content-Type: text/plain

- Pass mips32's CFLAGS to tests

- Fix broken inline asm in tests on mips32-linux

- Build mips n32 successfully, support it.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-fix-opcode-not-supported-on-mips32-linux.patch | 82 ++++++++++++++++++++++
 ...roken-inline-asm-in-tests-on-mips32-linux.patch | 47 +++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.13.0.bb  |  3 +-
 3 files changed, 131 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-fix-opcode-not-supported-on-mips32-linux.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-fix-broken-inline-asm-in-tests-on-mips32-linux.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-fix-opcode-not-supported-on-mips32-linux.patch b/meta/recipes-devtools/valgrind/valgrind/0001-fix-opcode-not-supported-on-mips32-linux.patch
new file mode 100644
index 0000000..39b624d
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-fix-opcode-not-supported-on-mips32-linux.patch
@@ -0,0 +1,82 @@
+From fb5362f205b37c5060fcd764a7ed393abe4f2f3d Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 27 Jul 2018 17:39:37 +0800
+Subject: [PATCH 1/2] fix opcode not supported on mips32-linux
+
+While build tests(`make check') on mips32-linux, there are
+serial failures such as:
+[snip]
+| mips-wrsmllib32-linux-gcc  -meb -mabi=32 -mhard-float -c
+-o atomic_incs-atomic_incs.o `test -f 'atomic_incs.c' || echo
+'../../../valgrind-3.13.0/memcheck/tests/'`atomic_incs.c
+| /tmp/ccqrmINN.s: Assembler messages:
+| /tmp/ccqrmINN.s:247: Error: opcode not supported on this
+processor: mips1 (mips1) `ll $t3,0($t1)'
+| /tmp/ccqrmINN.s:249: Error: opcode not supported on this
+processor: mips1 (mips1) `sc $t3,0($t1)'
+[snip]
+
+Since the following commit applied, it defines CLFAGS for mips32,
+but missed to pass them to tests which caused the above failure
+...
+3e344c57f Merge in a port for mips32-linux
+...
+
+Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=396905]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ helgrind/tests/Makefile.am    | 5 +++++
+ memcheck/tests/Makefile.am    | 5 +++++
+ none/tests/mips32/Makefile.am | 4 ++++
+ 3 files changed, 14 insertions(+)
+
+diff --git a/helgrind/tests/Makefile.am b/helgrind/tests/Makefile.am
+index ad1af191a..6209d35a7 100644
+--- a/helgrind/tests/Makefile.am
++++ b/helgrind/tests/Makefile.am
+@@ -214,6 +214,11 @@ check_PROGRAMS += annotate_rwlock
+ endif
+ 
+ AM_CFLAGS   += $(AM_FLAG_M3264_PRI)
++
++if VGCONF_PLATFORMS_INCLUDE_MIPS32_LINUX
++AM_CFLAGS   += $(AM_CFLAGS_MIPS32_LINUX)
++endif
++
+ AM_CXXFLAGS += $(AM_FLAG_M3264_PRI)
+ 
+ LDADD = -lpthread
+diff --git a/memcheck/tests/Makefile.am b/memcheck/tests/Makefile.am
+index 84e49405f..aff861a32 100644
+--- a/memcheck/tests/Makefile.am
++++ b/memcheck/tests/Makefile.am
+@@ -443,6 +443,11 @@ check_PROGRAMS += reach_thread_register
+ endif
+ 
+ AM_CFLAGS   += $(AM_FLAG_M3264_PRI)
++
++if VGCONF_PLATFORMS_INCLUDE_MIPS32_LINUX
++AM_CFLAGS   += $(AM_CFLAGS_MIPS32_LINUX)
++endif
++
+ AM_CXXFLAGS += $(AM_FLAG_M3264_PRI)
+ 
+ if VGCONF_PLATFORMS_INCLUDE_ARM_LINUX
+diff --git a/none/tests/mips32/Makefile.am b/none/tests/mips32/Makefile.am
+index d11591d45..602cd26f6 100644
+--- a/none/tests/mips32/Makefile.am
++++ b/none/tests/mips32/Makefile.am
+@@ -99,6 +99,10 @@ check_PROGRAMS = \
+ 	round_fpu64 \
+ 	fpu_branches
+ 
++if VGCONF_PLATFORMS_INCLUDE_MIPS32_LINUX
++AM_CFLAGS   += $(AM_CFLAGS_MIPS32_LINUX)
++endif
++
+ AM_CFLAGS    += @FLAG_M32@
+ AM_CXXFLAGS  += @FLAG_M32@
+ AM_CCASFLAGS += @FLAG_M32@
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/0002-fix-broken-inline-asm-in-tests-on-mips32-linux.patch b/meta/recipes-devtools/valgrind/valgrind/0002-fix-broken-inline-asm-in-tests-on-mips32-linux.patch
new file mode 100644
index 0000000..6df295f
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0002-fix-broken-inline-asm-in-tests-on-mips32-linux.patch
@@ -0,0 +1,47 @@
+From 63ce36396348e7c4c021cffa652d2e3d20f7963a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 27 Jul 2018 17:51:54 +0800
+Subject: [PATCH 2/2] fix broken inline asm in tests on mips32-linux
+
+While build tests(`make check') with gcc 8.1.0 on mips32-linux,
+there is a failure
+[snip]
+|mips-wrsmllib32-linux-gcc  -meb -mabi=32 -mhard-float -march=mips32
+-c -o tc08_hbl2-tc08_hbl2.o `test -f 'tc08_hbl2.c' || echo '../../../
+valgrind-3.13.0/helgrind/tests/'`tc08_hbl2.c
+|/tmp/cc37aJxQ.s: Assembler messages:
+|/tmp/cc37aJxQ.s:275: Error: symbol `L1xyzzy1main' is already defined
+|Makefile:1323: recipe for target 'tc08_hbl2-tc08_hbl2.o' failed
+[snip]
+
+Remove the duplicated L1xyzzy1main, and use local symbol to replace.
+http://tigcc.ticalc.org/doc/gnuasm.html#SEC46
+
+Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=396906]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ helgrind/tests/tc08_hbl2.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/helgrind/tests/tc08_hbl2.c b/helgrind/tests/tc08_hbl2.c
+index 2a757a008..f660d82dd 100644
+--- a/helgrind/tests/tc08_hbl2.c
++++ b/helgrind/tests/tc08_hbl2.c
+@@ -121,12 +121,12 @@
+ #elif defined(PLAT_mips32_linux) || defined(PLAT_mips64_linux)
+ #  define INC(_lval,_lqual)                         \
+      __asm__ __volatile__ (                         \
+-      "L1xyzzy1" _lqual":\n"                        \
++      "1:\n"                                        \
+       "        move  $t0, %0\n"                     \
+       "        ll    $t1, 0($t0)\n"                 \
+       "        addiu $t1, $t1, 1\n"                 \
+       "        sc    $t1, 0($t0)\n"                 \
+-      "        beqz  $t1, L1xyzzy1" _lqual          \
++      "        beqz  $t1, 1b\n"                     \
+       : /*out*/ : /*in*/ "r"(&(_lval))              \
+       : /*trash*/ "t0", "t1", "memory"              \
+         )
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
index d3af35e..39ec6f5 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
@@ -37,6 +37,8 @@ SRC_URI = "ftp://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://link-gz-tests.patch \
            file://ppc-headers.patch \
            file://mask-CPUID-support-in-HWCAP-on-aarch64.patch \
+           file://0001-fix-opcode-not-supported-on-mips32-linux.patch \
+           file://0002-fix-broken-inline-asm-in-tests-on-mips32-linux.patch \
            "
 SRC_URI[md5sum] = "817dd08f1e8a66336b9ff206400a5369"
 SRC_URI[sha256sum] = "d76680ef03f00cd5e970bbdcd4e57fb1f6df7d2e2c071635ef2be74790190c3b"
@@ -54,7 +56,6 @@ COMPATIBLE_HOST_linux-gnux32 = 'null'
 COMPATIBLE_HOST_linux-muslx32 = 'null'
 
 # Disable for some MIPS variants
-COMPATIBLE_HOST_mipsarchn32 = 'null'
 COMPATIBLE_HOST_mipsarchr6 = 'null'
 
 inherit autotools ptest multilib_header
-- 
2.7.4


