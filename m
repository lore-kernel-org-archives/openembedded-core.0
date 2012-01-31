Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Rs3s8-00017I-HC
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 03:55:04 +0100
Received: from localhost (c-76-115-40-64.hsd1.or.comcast.net [76.115.40.64])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 0746830476
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 21:47:02 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 18:47:02 -0800
Message-Id: <49669a254b8c474f791c55dabfa6348ea569c448.1327977970.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1327977970.git.scott.a.garman@intel.com>
References: <cover.1327977970.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1327977970.git.scott.a.garman@intel.com>
References: <cover.1327977970.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 0746830476.C2258
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/1] e2fsprogs: remove unneeded patch and re-enable PARALLEL_MAKE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jan 2012 02:55:04 -0000

From: Scott Garman <sgarman@zenlinux.com>

Koen Kooi suggested that the quotefix patch was not needed,
and the build of the recipe should now be multithread-safe.
My testing has confirmed this.

Signed-off-by: Scott Garman <sgarman@zenlinux.com>
---
 .../e2fsprogs/e2fsprogs-1.42/quotefix.patch        |   44 --------------------
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb  |    5 +--
 2 files changed, 1 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/quotefix.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/quotefix.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/quotefix.patch
deleted file mode 100644
index e576f35..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/quotefix.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Upstream-Status: Pending
-
-These macros are underquoted and break with recent autoconf+automake
-combinations. - RP 2010-01-02
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-diff -urN e2fsprogs-1.42.orig//configure.in e2fsprogs-1.42/configure.in
---- e2fsprogs-1.42.orig//configure.in	2011-11-28 09:28:22.000000000 -0800
-+++ e2fsprogs-1.42/configure.in	2012-01-12 14:42:54.820531407 -0800
-@@ -439,11 +439,11 @@
- 		AC_MSG_ERROR([pkg-config not installed; please install it.])
- 	fi
- 
--	AC_CHECK_LIB(uuid, uuid_generate,
-+	[AC_CHECK_LIB(uuid, uuid_generate,
- 		[LIBUUID=`$PKG_CONFIG --libs uuid`;
- 		 STATIC_LIBUUID=`$PKG_CONFIG --static --libs uuid`],
- 		[AC_MSG_ERROR([external uuid library not found])],
--		[$LIBUUID])
-+		[$LIBUUID])]
- 	UUID_CMT=#
- 	AC_MSG_RESULT([Disabling private uuid library])
- else
-@@ -939,15 +939,15 @@
- AH_TEMPLATE([HAVE_SEM_INIT], [Define to 1 if sem_init() exists])
- SEM_INIT_LIB=''
- AC_CHECK_FUNC(sem_init, ,
--  AC_CHECK_LIB(pthread, sem_init,
-+  [AC_CHECK_LIB(pthread, sem_init,
-   	AC_DEFINE(HAVE_SEM_INIT, 1)
-   	SEM_INIT_LIB=-lpthread,
--  AC_CHECK_LIB(rt, sem_init,
-+  [AC_CHECK_LIB(rt, sem_init,
-   	AC_DEFINE(HAVE_SEM_INIT, 1)
-   	SEM_INIT_LIB=-lrt,
--  AC_CHECK_LIB(posix4, sem_init,
-+  [AC_CHECK_LIB(posix4, sem_init,
-   	AC_DEFINE(HAVE_SEM_INIT, 1)
--  	SEM_INIT_LIB=-lposix4))))dnl
-+  	SEM_INIT_LIB=-lposix4)])])])dnl
- AC_SUBST(SEM_INIT_LIB)
- dnl
- dnl Check for unified diff
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
index f6759aa7..29e757d 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
@@ -2,15 +2,12 @@ require e2fsprogs.inc
 
 PR = "r1"
 
-SRC_URI += "file://quotefix.patch \
-            file://fallocate.patch \
+SRC_URI += "file://fallocate.patch \
             file://acinclude.m4"
 
 SRC_URI[md5sum] = "a3c4ffd7352310ab5e9412965d575610"
 SRC_URI[sha256sum] = "55b46db0cec3e2eb0e5de14494a88b01ff6c0500edf8ca8927cad6da7b5e4a46"
 
-PARALLEL_MAKE = ""
-
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-elf-shlibs --disable-libuuid --disable-uuidd"
 EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
 EXTRA_OECONF_darwin8 = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
-- 
1.7.5.4



