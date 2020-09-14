Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.56898.1600072527025897670
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 01:35:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 08E8ZPgU007045
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 01:35:25 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Mon, 14 Sep 2020
 01:35:07 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] bison: remove the parallel build patch
Date: Mon, 14 Sep 2020 01:35:07 -0700
Message-ID: <20200914083507.36978-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Remove the parallel build patch as the issue have already been
fixed in bison 3.7.2(f7b642cf build: fix incorrect dependencies).

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0001-bison-fix-the-parallel-build.patch   | 63 -------------------
 meta/recipes-devtools/bison/bison_3.7.2.bb    |  1 -
 2 files changed, 64 deletions(-)
 delete mode 100644 meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch

diff --git a/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch b/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
deleted file mode 100644
index c3be91a109..0000000000
--- a/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From e0dbcee6e25b3c0cb11a627bbfe3af45ef67ec30 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Thu, 14 May 2020 15:23:16 +0800
-Subject: [PATCH] bison: fix the parallel build
-
-Explicitly make the BUILT_SOURCES which
-are the generated headers such as stdio.h,
-fcntl.h and etc to be the dependencies of
-the gl_LIBOBJS such as libbison_a-sprintf.o,
-libbison_a-printf.o and etc to guarantee the
-BUILT_SOURCES is generated before begin to
-compile EXTRA_lib_libbison_a_SOURCES such as
-fprintf.c in parallel builid, otherwise there
-may come below error:
- | muscle-tab.c:(.text+0x77a): undefined reference to `rpl_sprintf'
-
-It does the same for src_bison_OBJECTS and
-lib_libbison_a_OBJECTS to make sure BUILT_SOURCES
-generated before begin to compile src_bison_SOURCES
-which contains AnnotationList.c and etc.
-
-BTW, the MOSTLYCLEANFILES also contains the
-generated header needs to be created early
-in the build process, so add it also in to
-avoid below error:
- | ./lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No such file or directory
-
-Upstream-Status: Submitted [bison-patches@gnu.org maillist]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- lib/gnulib.mk | 2 ++
- src/local.mk  | 1 +
- 2 files changed, 3 insertions(+)
-
-diff --git a/lib/gnulib.mk b/lib/gnulib.mk
-index c21c656..27fb3dc 100644
---- a/lib/gnulib.mk
-+++ b/lib/gnulib.mk
-@@ -120,6 +120,8 @@ lib_libbison_a_SOURCES =
- lib_libbison_a_LIBADD = $(gl_LIBOBJS)
- lib_libbison_a_DEPENDENCIES = $(gl_LIBOBJS)
- EXTRA_lib_libbison_a_SOURCES =
-+$(lib_libbison_a_OBJECTS): $(BUILT_SOURCES) $(MOSTLYCLEANFILES:%.h)
-+$(gl_LIBOBJS): $(BUILT_SOURCES) $(MOSTLYCLEANFILES:%.h)
- 
- lib_libbison_a_CPPFLAGS = $(AM_CPPFLAGS) -DDEFAULT_TEXT_DOMAIN=\"bison-gnulib\"
- 
-diff --git a/src/local.mk b/src/local.mk
-index 61dc573..b5b9079 100644
---- a/src/local.mk
-+++ b/src/local.mk
-@@ -24,6 +24,7 @@ if RELOCATABLE_VIA_LD
-   src_bison_LDFLAGS = `$(RELOCATABLE_LDFLAGS) $(bindir)`
- endif
- 
-+$(src_bison_OBJECTS): $(BUILT_SOURCES) $(MOSTLYCLEANFILES:%.h)
- src_bison_CFLAGS = $(AM_CFLAGS) $(WERROR_CFLAGS)
- src_bison_SOURCES =                             \
-   src/AnnotationList.c                          \
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/bison/bison_3.7.2.bb b/meta/recipes-devtools/bison/bison_3.7.2.bb
index f7bf70fff3..efc426376d 100644
--- a/meta/recipes-devtools/bison/bison_3.7.2.bb
+++ b/meta/recipes-devtools/bison/bison_3.7.2.bb
@@ -11,7 +11,6 @@ DEPENDS = "bison-native flex-native"
 
 SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://add-with-bisonlocaledir.patch \
-           file://0001-bison-fix-the-parallel-build.patch \
            "
 SRC_URI[sha256sum] = "7948d193104d979c0fb0294a1854c73c89d72ae41acfc081826142578a78a91b"
 
-- 
2.17.1

