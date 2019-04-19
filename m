Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E9BBC7D26B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 19:02:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3JJ1pOH001767
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 12:02:01 -0700
Received: from fidler.wrs.com (172.25.44.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 19 Apr 2019 12:01:40 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Apr 2019 15:01:39 -0400
Message-ID: <20190419190139.26106-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH] valgrind: update from 3.14.0 to 3.15.0
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
X-List-Received-Date: Fri, 19 Apr 2019 19:02:11 -0000
Content-Type: text/plain

The SRC_URI moved.
Two local patches are now fixed upstream so remove them.

The glibc ptest results are essentially the same.

             3.14  3.15
TOTAL:        579   589
PASSED:       297   301
FAILED:       251   254
SKIPPED:       31    34
DURATION:    1312  1171

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...-between-libcoregrind-.a-and-m_main..patch | 45 -------------------
 ...ts-amd64-Do-not-clobber-rsp-register.patch | 37 ---------------
 ...{valgrind_3.14.0.bb => valgrind_3.15.0.bb} |  8 ++--
 3 files changed, 3 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Fix-dependencies-between-libcoregrind-.a-and-m_main..patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-tests-amd64-Do-not-clobber-rsp-register.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.14.0.bb => valgrind_3.15.0.bb} (94%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Fix-dependencies-between-libcoregrind-.a-and-m_main..patch b/meta/recipes-devtools/valgrind/valgrind/0001-Fix-dependencies-between-libcoregrind-.a-and-m_main..patch
deleted file mode 100644
index bedf1c1274..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-Fix-dependencies-between-libcoregrind-.a-and-m_main..patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 7820fc268fae4353118b6355f1d4b9e1b7eeebec Mon Sep 17 00:00:00 2001
-From: Philippe Waroquiers <philippe.waroquiers@skynet.be>
-Date: Sun, 28 Oct 2018 18:35:11 +0100
-Subject: [PATCH] Fix dependencies between libcoregrind*.a and
- *m_main.o/*m_libcsetjmp.o
-
-The primary and secondary coregrind libraries must be updated
-when m_main.c or m_libcsetjmp.c are changed.
-
-A dependency was missing between libcoregrind*.a and libnolto_coregrind*.a,
-and so tools were not relinked when m_main.c or m_libcsetjmp.c were
-changed.
-
-Upstream-Status: Backport[git://sourceware.org/git/valgrind.git 7820fc268fae4353118b6355f1d4b9e1b7eeebec]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- coregrind/Makefile.am | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/coregrind/Makefile.am b/coregrind/Makefile.am
-index 914a270..8de1996 100644
---- a/coregrind/Makefile.am
-+++ b/coregrind/Makefile.am
-@@ -511,6 +511,8 @@ libcoregrind_@VGCONF_ARCH_PRI@_@VGCONF_OS@_a_CFLAGS += \
- endif
- libcoregrind_@VGCONF_ARCH_PRI@_@VGCONF_OS@_a_LIBADD = \
-     $(libnolto_coregrind_@VGCONF_ARCH_PRI@_@VGCONF_OS@_a_OBJECTS)
-+libcoregrind_@VGCONF_ARCH_PRI@_@VGCONF_OS@_a_DEPENDENCIES = \
-+    libnolto_coregrind-@VGCONF_ARCH_PRI@-@VGCONF_OS@.a
- 
- if VGCONF_HAVE_PLATFORM_SEC
- libcoregrind_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_SOURCES = \
-@@ -531,6 +533,8 @@ libcoregrind_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_CFLAGS += \
- endif
- libcoregrind_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_LIBADD = \
-     $(libnolto_coregrind_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_OBJECTS)
-+libcoregrind_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_DEPENDENCIES = \
-+    libnolto_coregrind-@VGCONF_ARCH_SEC@-@VGCONF_OS@.a
- endif
- 
- #----------------------------------------------------------------------------
--- 
-2.10.2
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-tests-amd64-Do-not-clobber-rsp-register.patch b/meta/recipes-devtools/valgrind/valgrind/0001-tests-amd64-Do-not-clobber-rsp-register.patch
deleted file mode 100644
index 657f80335d..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-tests-amd64-Do-not-clobber-rsp-register.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 8c1ebb564f5eca2baeedc27a703200786d1abb0b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 22 Dec 2018 15:28:40 -0800
-Subject: [PATCH] tests/amd64: Do not clobber %rsp register
-
-This is seen with gcc-9.0 compiler now which is fix that gcc community
-did recently
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52813
-
-Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=402480]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- none/tests/amd64-linux/bug345887.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/none/tests/amd64-linux/bug345887.c b/none/tests/amd64-linux/bug345887.c
-index 0f9237d..4b07fe1 100644
---- a/none/tests/amd64-linux/bug345887.c
-+++ b/none/tests/amd64-linux/bug345887.c
-@@ -20,13 +20,14 @@ static void inner(void)
-       "movq $0x10d, %%r14\n"
-       "movq $0x10e, %%r15\n"
-       // not %rbp as mdb is then not able to reconstruct stack trace
--      "movq $0x10f, %%rsp\n"
-+      // not %rsp since gcc ignores it and since gcc >= 9.0 errors about it
-+      // see https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52813
-       "movq $0x1234, (%%rax)\n"  // should cause SEGV here
-       "ud2"                      // should never get here
-       : // no output registers
-       : // no input registers
-       : "memory", "%rax", "%rbx", "%rcx", "%rdx", "%rsi", "%rdi",
--        "%r8", "%r9", "%r10", "%r11", "%r12", "%r13", "%r14", "%r15", "%rsp");
-+        "%r8", "%r9", "%r10", "%r11", "%r12", "%r13", "%r14", "%r15");
- }
- 
- __attribute__((noinline))
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
similarity index 94%
rename from meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index db1bd9fc5b..3159f32230 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -12,7 +12,7 @@ DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'boost', '', d)} \
         "
 
-SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
+SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://fixed-perl-path.patch \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
            file://run-ptest \
@@ -36,11 +36,9 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://0001-fix-opcode-not-supported-on-mips32-linux.patch \
            file://0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch \
            file://0001-Make-local-functions-static-to-avoid-assembler-error.patch \
-           file://0001-tests-amd64-Do-not-clobber-rsp-register.patch \
-           file://0001-Fix-dependencies-between-libcoregrind-.a-and-m_main..patch \
            "
-SRC_URI[md5sum] = "74175426afa280184b62591b58c671b3"
-SRC_URI[sha256sum] = "037c11bfefd477cc6e9ebe8f193bb237fe397f7ce791b4a4ce3fa1c6a520baa5"
+SRC_URI[md5sum] = "46e5fbdcbc3502a5976a317a0860a975"
+SRC_URI[sha256sum] = "417c7a9da8f60dd05698b3a7bc6002e4ef996f14c13f0ff96679a16873e78ab1"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
-- 
2.17.0


