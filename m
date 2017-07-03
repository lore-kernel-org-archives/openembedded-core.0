Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6D7E671A62
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 21:57:50 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u23so22887433wma.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 14:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YDR32QPeceDSAgQ1JNkp8ymvFFsfTzvFZPBfEROPZhk=;
	b=rznwS2KBoPx11WKZDO+2u/mkQ/A9UT/DPbSgYckq62benk8dTR3tp9T8WmQFtjTqVs
	dXETe+bbbrCd44zWAOFjgFpdFh2pzj1dLheLxMJOVY6SaydQ5fBgbkpynj3L5dOwDDbs
	MIMwxvV3HIbl6RgOt6Um1B5LygbHozr9jS4vraw95CEa4V68sJiXrHtKamev1juZpNxR
	mZ3xYUzAeLIBZQhd5ksSju1dJHOefjLei2MwS4VQgUegf6lvKovSIC+a5bF9PcQCTbUJ
	poFr4pcAhKuMA3yhQzof0rsFHTXLPuaNc21YsH2AQCf5eLpT6dRGvyW/jgo0mZqCZPcy
	zcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YDR32QPeceDSAgQ1JNkp8ymvFFsfTzvFZPBfEROPZhk=;
	b=hJ95D28PgEZxvkJhFsT7zaPlgVmSWXIENGJXIEGve8i9pVr0y/D3eS0hG09vLDpa/E
	/rpTsQ5KcMDEFuEhHOrP2YDZjqAbyxCDnIqxBNTQH0nJMLr40TZUgWMqLizRgG4lhy3P
	BPaNtqMtLZWS1jJzroubPRk72dgGR9cVzXTngBIFs6ZQN3XxHmwaJwB6dw9Sz12E0aIR
	s4YRlGHFn0gHkgwd+hVFXGYiroj4P9vbxpS0Wh9C6fm3prQwdmTBnjCyT8O6bNuZV2MA
	FjFb3ZfCRYi9BMXJrYGloBeQ2JhSjljlljge+pP6MguRx6JJ8KhxeNhuTeLkdUkbiWMF
	IGOg==
X-Gm-Message-State: AKS2vOzrH2NdXwF2qWaMF5/AaIs4U7sPm0aeyPgsONX/YrTjcJFfBlFW
	d3fvZ2OZ1byzubXHQ5c=
X-Received: by 10.80.165.164 with SMTP id a33mr15586367edc.53.1499119071870;
	Mon, 03 Jul 2017 14:57:51 -0700 (PDT)
Received: from localhost.localdomain (80-71-134-83.u.parknet.dk.
	[80.71.134.83])
	by smtp.gmail.com with ESMTPSA id g38sm8985515edc.7.2017.07.03.14.57.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jul 2017 14:57:50 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jul 2017 23:57:41 +0200
Message-Id: <20170703215744.19096-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v3 1/4] gcc-6.3: Fix libgfortran build
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
X-List-Received-Date: Mon, 03 Jul 2017 21:57:51 -0000

Without this patch libbacktrace cannot be included/link during
libgfortran build.

libbtool: link: cannot find the library `../libbacktrace/libbacktrace.la'
or unhandled argument `../libbacktrace/libbacktrace.la'

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-6.3.inc              |  1 +
 .../gcc/gcc-6.3/0055-Fix-gfortran-build.patch      | 53 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0055-Fix-gfortran-build.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.3.inc b/meta/recipes-devtools/gcc/gcc-6.3.inc
index 86b3e9ff19a4..2595dbd0ee8b 100644
--- a/meta/recipes-devtools/gcc/gcc-6.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
@@ -74,6 +74,7 @@ SRC_URI = "\
            file://0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
            file://0048-sync-gcc-stddef.h-with-musl.patch \
            file://0054_all_nopie-all-flags.patch \
+           file://0055-Fix-gfortran-build.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0055-Fix-gfortran-build.patch b/meta/recipes-devtools/gcc/gcc-6.3/0055-Fix-gfortran-build.patch
new file mode 100644
index 000000000000..30b135b9780f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.3/0055-Fix-gfortran-build.patch
@@ -0,0 +1,53 @@
+Without this patch libbacktrace cannot be included/link during
+libgfortran build.
+
+libbtool: link: cannot find the library `../libbacktrace/libbacktrace.la'
+or unhandled argument `../libbacktrace/libbacktrace.la'
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+
+diff --git a/libgfortran/Makefile.am b/libgfortran/Makefile.am
+index 39d3e11d223c..b5efe6dfe195 100644
+--- a/libgfortran/Makefile.am
++++ b/libgfortran/Makefile.am
+@@ -37,7 +37,7 @@ toolexeclib_LTLIBRARIES = libgfortran.la
+ toolexeclib_DATA = libgfortran.spec
+ libgfortran_la_LINK = $(LINK) $(libgfortran_la_LDFLAGS)
+ libgfortran_la_LDFLAGS = -version-info `grep -v '^\#' $(srcdir)/libtool-version` \
+-	$(LTLDFLAGS) $(LIBQUADLIB) ../libbacktrace/libbacktrace.la \
++	$(LTLDFLAGS) $(LIBQUADLIB) ../../libbacktrace/libbacktrace.la \
+ 	-lm $(extra_ldflags_libgfortran) \
+ 	$(version_arg) -Wc,-shared-libgcc
+ libgfortran_la_DEPENDENCIES = $(version_dep) libgfortran.spec $(LIBQUADLIB_DEP)
+@@ -63,7 +63,7 @@ AM_CPPFLAGS = -iquote$(srcdir)/io -I$(srcdir)/$(MULTISRCTOP)../gcc \
+ 	      -I$(MULTIBUILDTOP)../libgcc \
+ 	      -I$(srcdir)/$(MULTISRCTOP)../libbacktrace \
+ 	      -I$(MULTIBUILDTOP)../libbacktrace \
+-	      -I../libbacktrace
++	      -I../../libbacktrace
+ 
+ # Fortran rules for complex multiplication and division
+ AM_CFLAGS += -fcx-fortran-rules
+diff --git a/libgfortran/Makefile.in b/libgfortran/Makefile.in
+index 7ed080cf7b0d..d197fbd6b683 100644
+--- a/libgfortran/Makefile.in
++++ b/libgfortran/Makefile.in
+@@ -598,7 +598,7 @@ toolexeclib_LTLIBRARIES = libgfortran.la
+ toolexeclib_DATA = libgfortran.spec
+ libgfortran_la_LINK = $(LINK) $(libgfortran_la_LDFLAGS)
+ libgfortran_la_LDFLAGS = -version-info `grep -v '^\#' $(srcdir)/libtool-version` \
+-	$(LTLDFLAGS) $(LIBQUADLIB) ../libbacktrace/libbacktrace.la \
++	$(LTLDFLAGS) $(LIBQUADLIB) ../../libbacktrace/libbacktrace.la \
+ 	-lm $(extra_ldflags_libgfortran) \
+ 	$(version_arg) -Wc,-shared-libgcc
+ 
+@@ -618,7 +618,7 @@ AM_CPPFLAGS = -iquote$(srcdir)/io -I$(srcdir)/$(MULTISRCTOP)../gcc \
+ 	      -I$(MULTIBUILDTOP)../libgcc \
+ 	      -I$(srcdir)/$(MULTISRCTOP)../libbacktrace \
+ 	      -I$(MULTIBUILDTOP)../libbacktrace \
+-	      -I../libbacktrace
++	      -I../../libbacktrace
+ 
+ gfor_io_src = io/size_from_kind.c $(am__append_2)
+ gfor_io_headers = \
-- 
2.11.0


