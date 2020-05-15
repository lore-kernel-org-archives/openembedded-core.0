Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.5859.1589507563488042773
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 18:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04F1qBME023166
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 18:52:32 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 14 May 2020 18:52:22 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] bison: fix the parallel build
Date: Fri, 15 May 2020 09:52:15 +0800
Message-ID: <20200515015215.39152-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Explicitly make the BUILT_SOURCES which
are the generated headers such as stdio.h,
fcntl.h and etc to be the dependencies of
the gl_LIBOBJS such as libbison_a-sprintf.o,
libbison_a-printf.o and etc to guarantee the
BUILT_SOURCES is generated before begin to
compile EXTRA_lib_libbison_a_SOURCES such as
fprintf.c in parallel builid, otherwise there
may come below error:
 | muscle-tab.c:(.text+0x77a): undefined reference to `rpl_sprintf'

It does the same for src_bison_OBJECTS and
lib_libbison_a_OBJECTS to make sure BUILT_SOURCES
generated before begin to compile src_bison_SOURCES
which contains AnnotationList.c and etc.

BTW, the MOSTLYCLEANFILES also contains the
generated header needs to be created early
in the build process, so add it also in to
avoid below error:
 | ./lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No such file or directory

[YOCTO #13825]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0001-bison-fix-the-parallel-build.patch   | 63 +++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.5.4.bb    |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch

diff --git a/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch b/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
new file mode 100644
index 0000000000..cfe6e60f96
--- /dev/null
+++ b/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
@@ -0,0 +1,63 @@
+From e0dbcee6e25b3c0cb11a627bbfe3af45ef67ec30 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 14 May 2020 15:23:16 +0800
+Subject: [PATCH] bison: fix the parallel build
+
+Explicitly make the BUILT_SOURCES which
+are the generated headers such as stdio.h,
+fcntl.h and etc to be the dependencies of
+the gl_LIBOBJS such as libbison_a-sprintf.o,
+libbison_a-printf.o and etc to guarantee the
+BUILT_SOURCES is generated before begin to
+compile EXTRA_lib_libbison_a_SOURCES such as
+fprintf.c in parallel builid, otherwise there
+may come below error:
+ | muscle-tab.c:(.text+0x77a): undefined reference to `rpl_sprintf'
+
+It does the same for src_bison_OBJECTS and
+lib_libbison_a_OBJECTS to make sure BUILT_SOURCES
+generated before begin to compile src_bison_SOURCES
+which contains AnnotationList.c and etc.
+
+BTW, the MOSTLYCLEANFILES also contains the
+generated header needs to be created early
+in the build process, so add it also in to
+avoid below error:
+ | ./lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No such file or directory
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bison-patches/2020-05/msg00055.html]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/gnulib.mk | 2 ++
+ src/local.mk  | 1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/lib/gnulib.mk b/lib/gnulib.mk
+index c21c656..27fb3dc 100644
+--- a/lib/gnulib.mk
++++ b/lib/gnulib.mk
+@@ -120,6 +120,8 @@ lib_libbison_a_SOURCES =
+ lib_libbison_a_LIBADD = $(gl_LIBOBJS)
+ lib_libbison_a_DEPENDENCIES = $(gl_LIBOBJS)
+ EXTRA_lib_libbison_a_SOURCES =
++$(lib_libbison_a_OBJECTS): $(BUILT_SOURCES) $(MOSTLYCLEANFILES:%.h)
++$(gl_LIBOBJS): $(BUILT_SOURCES) $(MOSTLYCLEANFILES:%.h)
+ 
+ lib_libbison_a_CPPFLAGS = $(AM_CPPFLAGS) -DDEFAULT_TEXT_DOMAIN=\"bison-gnulib\"
+ 
+diff --git a/src/local.mk b/src/local.mk
+index 61dc573..b5b9079 100644
+--- a/src/local.mk
++++ b/src/local.mk
+@@ -24,6 +24,7 @@ if RELOCATABLE_VIA_LD
+   src_bison_LDFLAGS = `$(RELOCATABLE_LDFLAGS) $(bindir)`
+ endif
+ 
++$(src_bison_OBJECTS): $(BUILT_SOURCES) $(MOSTLYCLEANFILES:%.h)
+ src_bison_CFLAGS = $(AM_CFLAGS) $(WERROR_CFLAGS)
+ src_bison_SOURCES =                             \
+   src/AnnotationList.c                          \
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/bison/bison_3.5.4.bb b/meta/recipes-devtools/bison/bison_3.5.4.bb
index 59c34f7297..124bc41d3e 100644
--- a/meta/recipes-devtools/bison/bison_3.5.4.bb
+++ b/meta/recipes-devtools/bison/bison_3.5.4.bb
@@ -12,6 +12,7 @@ DEPENDS = "bison-native flex-native"
 SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://dont-depend-on-help2man.patch.patch \
            file://add-with-bisonlocaledir.patch \
+           file://0001-bison-fix-the-parallel-build.patch \
 "
 SRC_URI[sha256sum] = "4c17e99881978fa32c05933c5262457fa5b2b611668454f8dc2a695cd6b3720c"
 
-- 
2.24.1

