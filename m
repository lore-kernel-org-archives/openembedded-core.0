Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.40972.1590446244027273662
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 15:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Ep8vG/a5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 5so411853pjd.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 15:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=iiqw6HQqw5cTZJuI/cwLgxGMnqdEjI/0eV6B1uTQrP4=;
        b=Ep8vG/a5MFJ5ANmLx/OuToqth8Ey5/3kwAjZJc4RXnbHee1qcJg1rXRCUd5FepYT9J
         LCLAbZCsjCjRTuBeGrYjjqSxVyeORFpVVwgtVmsCrQB5XN++iO6Xt94AOmkizZH72w0K
         RcAJMAvaZtgZNlB9vS4+H1BsqQCqW5UwMAaduM52N2B/3wG4XwiSNowhvADuLDPAH37L
         4vBIVz443IAzvevG/NAX3RHE2uh9oKTEdKTlRc7fAVNzZc3PmCmItXc6cA6E6wFZyiw3
         Emj+b6M2/ZnbxnsDP5ged+GybyY75rqjS4029EQHVvz1XbEXtWaWYTsPJQr0PgXDlKK0
         mJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=iiqw6HQqw5cTZJuI/cwLgxGMnqdEjI/0eV6B1uTQrP4=;
        b=hAW/DocNJT2FbZAi+DA18cvHK5MJqkdJm8avuL5wworb5ScY8N0npm6UbJMzZabKE3
         DkfuGH+nVplehG9TUp0Sg0NZ8uA7vQynJYJ7QNsPZe7/sBjRYgWQAqV8xMakEvLAvpyL
         tZYcCyWrl7qfrNdzTDLKeU1oq+pjrFLlLtEBOXEhsMcNdhR8KJ86irxeFjjKbF1vCV7D
         F8MyTqZmI52o3EgKoMR8Zey4bCG7gMtDll+4yN/gVsH5wwQcqwAMlUu/0CwoP2rTngkf
         7/BzG8Q7GykN1L6aB7Gb/tyRTVHupsqgedinFb2M5TSpO4494ebqSlAL4c8rFkcc9+PR
         pevw==
X-Gm-Message-State: AOAM532nu1KEvSv2jOpj5GtLPd+bXIpY/iHA86tbRZg4QaP13q37fzue
	HzukPRNqMtOmz4E9TTo7AApX++YhE4c=
X-Google-Smtp-Source: ABdhPJyQJO/djdNNl+OT0SMCnCWIq85/p9asEY98n0n3y1SJzAJGE+hNOMPIJUNqJ5z5qzDRkr9pcQ==
X-Received: by 2002:a17:902:50d:: with SMTP id 13mr22491964plf.76.1590446243039;
        Mon, 25 May 2020 15:37:23 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y23sm1990432pje.3.2020.05.25.15.37.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 15:37:22 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/17] bison: fix the parallel build
Date: Mon, 25 May 2020 12:36:48 -1000
Message-Id: <99ddfee2a2434d282749e2062987067f70b0ef54.1590445868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590445868.git.steve@sakoman.com>
References: <cover.1590445868.git.steve@sakoman.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 43d74b11095092b13f94074785d0306484fabea6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-bison-fix-the-parallel-build.patch   | 63 +++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.5.3.bb    |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch

diff --git a/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch b/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
new file mode 100644
index 0000000000..c3be91a109
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
+Upstream-Status: Submitted [bison-patches@gnu.org maillist]
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
diff --git a/meta/recipes-devtools/bison/bison_3.5.3.bb b/meta/recipes-devtools/bison/bison_3.5.3.bb
index 27e09434f8..36c29fe4df 100644
--- a/meta/recipes-devtools/bison/bison_3.5.3.bb
+++ b/meta/recipes-devtools/bison/bison_3.5.3.bb
@@ -12,6 +12,7 @@ DEPENDS = "bison-native flex-native"
 SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://dont-depend-on-help2man.patch.patch \
            file://add-with-bisonlocaledir.patch \
+           file://0001-bison-fix-the-parallel-build.patch \
 "
 SRC_URI[sha256sum] = "2bf85b5f88a5f2fa8069aed2a2dfc3a9f8d15a97e59c713e3906e5fdd982a7c4"
 
-- 
2.17.1

