Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F21DF6BA11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 09:02:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBS92BEf004349
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 01:02:11 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 28 Dec 2018 01:02:10 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Dec 2018 01:01:47 -0800
Message-ID: <265b83e973b38982365f810b240e403f966ea465.1545987662.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1545987662.git.liezhi.yang@windriver.com>
References: <cover.1545987662.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] valgrind: Fix a race issue for libcoregrind.a
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
X-List-Received-Date: Fri, 28 Dec 2018 09:02:10 -0000
Content-Type: text/plain

The libnolto_coregrind_a_OBJECTS is in libcoregrind_a_LIBADD, so the objects
should be ready before generate libcoregrind.a, otherwise there would be
failures:

i586-poky-linux-ar: libnolto_coregrind_x86_linux_a-m_libcsetjmp.o: No such file or directory
make[3]: *** [libcoregrind-x86-linux.a] Error 1

Add libnolto_coregrind_a_OBJECTS to EXTRA_libcoregrind_DEPENDENCIES to fix the
problem.

This is a race issue during parallel build.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...ncies-between-libcoregrind-.a-and-m_main..patch | 45 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.14.0.bb  |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Fix-dependencies-between-libcoregrind-.a-and-m_main..patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Fix-dependencies-between-libcoregrind-.a-and-m_main..patch b/meta/recipes-devtools/valgrind/valgrind/0001-Fix-dependencies-between-libcoregrind-.a-and-m_main..patch
new file mode 100644
index 0000000..bedf1c1
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Fix-dependencies-between-libcoregrind-.a-and-m_main..patch
@@ -0,0 +1,45 @@
+From 7820fc268fae4353118b6355f1d4b9e1b7eeebec Mon Sep 17 00:00:00 2001
+From: Philippe Waroquiers <philippe.waroquiers@skynet.be>
+Date: Sun, 28 Oct 2018 18:35:11 +0100
+Subject: [PATCH] Fix dependencies between libcoregrind*.a and
+ *m_main.o/*m_libcsetjmp.o
+
+The primary and secondary coregrind libraries must be updated
+when m_main.c or m_libcsetjmp.c are changed.
+
+A dependency was missing between libcoregrind*.a and libnolto_coregrind*.a,
+and so tools were not relinked when m_main.c or m_libcsetjmp.c were
+changed.
+
+Upstream-Status: Backport[git://sourceware.org/git/valgrind.git 7820fc268fae4353118b6355f1d4b9e1b7eeebec]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ coregrind/Makefile.am | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/coregrind/Makefile.am b/coregrind/Makefile.am
+index 914a270..8de1996 100644
+--- a/coregrind/Makefile.am
++++ b/coregrind/Makefile.am
+@@ -511,6 +511,8 @@ libcoregrind_@VGCONF_ARCH_PRI@_@VGCONF_OS@_a_CFLAGS += \
+ endif
+ libcoregrind_@VGCONF_ARCH_PRI@_@VGCONF_OS@_a_LIBADD = \
+     $(libnolto_coregrind_@VGCONF_ARCH_PRI@_@VGCONF_OS@_a_OBJECTS)
++libcoregrind_@VGCONF_ARCH_PRI@_@VGCONF_OS@_a_DEPENDENCIES = \
++    libnolto_coregrind-@VGCONF_ARCH_PRI@-@VGCONF_OS@.a
+ 
+ if VGCONF_HAVE_PLATFORM_SEC
+ libcoregrind_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_SOURCES = \
+@@ -531,6 +533,8 @@ libcoregrind_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_CFLAGS += \
+ endif
+ libcoregrind_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_LIBADD = \
+     $(libnolto_coregrind_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_OBJECTS)
++libcoregrind_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_DEPENDENCIES = \
++    libnolto_coregrind-@VGCONF_ARCH_SEC@-@VGCONF_OS@.a
+ endif
+ 
+ #----------------------------------------------------------------------------
+-- 
+2.10.2
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
index bbbc3bf..4d15a50 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch \
            file://0001-Make-local-functions-static-to-avoid-assembler-error.patch \
            file://0001-tests-amd64-Do-not-clobber-rsp-register.patch \
+           file://0001-Fix-dependencies-between-libcoregrind-.a-and-m_main..patch \
            "
 SRC_URI[md5sum] = "74175426afa280184b62591b58c671b3"
 SRC_URI[sha256sum] = "037c11bfefd477cc6e9ebe8f193bb237fe397f7ce791b4a4ce3fa1c6a520baa5"
-- 
2.10.2


