Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C13F3605BA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 21:58:02 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id j85so22854879wmj.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 14:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZvistHRLSTyGmCFmjnLe4fe9RDsOq/Vhnjn5CI1DSMg=;
	b=hg7Cthsx2uQW9o13fsWUUU8Hh/vG7EZACtW6F8Nzp5X/yWBsBCMMttI8ZMGfKUonBb
	/bPrz3bDiLWOpW4FPE0AxvHziO9+OeNXKMpy+C+rGvcqgzfCPVX1BmdlBfmJ4dEEvu9G
	kdHAnn66teUJFsNwS6VS4rOq3ODyygGEyDqwvQgC48QZAoqWQOMnwwhNjmKomUVJWX1j
	wZ9oLGjdh9SrMkQZWBgkTZCJkzp4qnwwS3Wz6o5UA9G1XC0A/2ww4kTHmjkMwmVyQnmw
	DLQMigh0XwZiJO8AM5e9d7PvnCGQ1QDMDsxx3iv+NHpAWLp1zXGTADaKBr7Gd8G1LbHN
	dN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZvistHRLSTyGmCFmjnLe4fe9RDsOq/Vhnjn5CI1DSMg=;
	b=tKOOx/txclgfL8yoF1nqD3cYitlk1TR+TaoADnFnERlqlvbeFvqK9LLpvuzoc36zqG
	n+/QehnZlR1lH7tkxoVkG8EJUBxyb1Ms5FwUSVYYspYA44wtuU4YS3t+XaFWFhGiInny
	OWz4ImmOnmZQ11sT8mW6S6vU4QKw7nTJLqEqd1cRhBKgtVRhN0JPj3wcMrxEH5dIyrtk
	dqvJxFoDrJrwhY9BxfFCWZx4j54Zo45GYr9A8knw+OS4oPO9bCSlpY01urkPNaZXOG3N
	IrJx53C9VrOmoLj0MRkgSP0f1LotDNHWk+sGc8LqhXhyVK9k+1Qr4lxmvm5Xs4oNwwuC
	4Iug==
X-Gm-Message-State: AKS2vOwxDNxJgCcwq9ATsI1ExTzNmV5ATy+al1b8o2GosSFpZsqQ5dx2
	oSZlLhTGIuRCtIiKGNU=
X-Received: by 10.80.173.27 with SMTP id y27mr16338161edc.5.1499119083134;
	Mon, 03 Jul 2017 14:58:03 -0700 (PDT)
Received: from localhost.localdomain (80-71-134-83.u.parknet.dk.
	[80.71.134.83])
	by smtp.gmail.com with ESMTPSA id g38sm8985515edc.7.2017.07.03.14.58.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jul 2017 14:58:02 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jul 2017 23:57:44 +0200
Message-Id: <20170703215744.19096-4-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170703215744.19096-1-ricardo.ribalda@gmail.com>
References: <20170703215744.19096-1-ricardo.ribalda@gmail.com>
Subject: [PATCH v3 4/4] gcc-7.1: Fix libgfortran build
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
X-List-Received-Date: Mon, 03 Jul 2017 21:58:03 -0000

Without this patch libbacktrace cannot be included/link during
libgfortran build.

libbtool: link: cannot find the library
`../libbacktrace/libbacktrace.la'
or unhandled argument `../libbacktrace/libbacktrace.la

Suggested-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-7.1.inc              |  1 +
 .../gcc/gcc-7.1/0048-Fix-gfortran-build.patch      | 53 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0048-Fix-gfortran-build.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.1.inc b/meta/recipes-devtools/gcc/gcc-7.1.inc
index 4098d6a2c1e0..e142cdf79433 100644
--- a/meta/recipes-devtools/gcc/gcc-7.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.1.inc
@@ -72,6 +72,7 @@ SRC_URI = "\
            file://0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
            file://0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
            file://0047-sync-gcc-stddef.h-with-musl.patch \
+           file://0048-Fix-gfortran-build.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0048-Fix-gfortran-build.patch b/meta/recipes-devtools/gcc/gcc-7.1/0048-Fix-gfortran-build.patch
new file mode 100644
index 000000000000..a71b6b0bee0e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.1/0048-Fix-gfortran-build.patch
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
+index 2857af5943f9..e07760069a3c 100644
+--- a/libgfortran/Makefile.am
++++ b/libgfortran/Makefile.am
+@@ -37,7 +37,7 @@ toolexeclib_LTLIBRARIES = libgfortran.la
+ toolexeclib_DATA = libgfortran.spec
+ libgfortran_la_LINK = $(LINK) $(libgfortran_la_LDFLAGS)
+ libgfortran_la_LDFLAGS = -version-info `grep -v '^\#' $(srcdir)/libtool-version` \
+-	$(LTLDFLAGS) $(LIBQUADLIB) ../libbacktrace/libbacktrace.la \
++	$(LTLDFLAGS) $(LIBQUADLIB) ../../libbacktrace/libbacktrace.la \
+ 	$(HWCAP_LDFLAGS) \
+ 	-lm $(extra_ldflags_libgfortran) \
+ 	$(version_arg) -Wc,-shared-libgcc
+@@ -64,7 +64,7 @@ AM_CPPFLAGS = -iquote$(srcdir)/io -I$(srcdir)/$(MULTISRCTOP)../gcc \
+ 	      -I$(MULTIBUILDTOP)../libgcc \
+ 	      -I$(srcdir)/$(MULTISRCTOP)../libbacktrace \
+ 	      -I$(MULTIBUILDTOP)../libbacktrace \
+-	      -I../libbacktrace
++	      -I../../libbacktrace
+ 
+ # Fortran rules for complex multiplication and division
+ AM_CFLAGS += -fcx-fortran-rules
+diff --git a/libgfortran/Makefile.in b/libgfortran/Makefile.in
+index 05b183dcadb0..c9e0280e412c 100644
+--- a/libgfortran/Makefile.in
++++ b/libgfortran/Makefile.in
+@@ -581,7 +581,7 @@ toolexeclib_LTLIBRARIES = libgfortran.la
+ toolexeclib_DATA = libgfortran.spec
+ libgfortran_la_LINK = $(LINK) $(libgfortran_la_LDFLAGS)
+ libgfortran_la_LDFLAGS = -version-info `grep -v '^\#' $(srcdir)/libtool-version` \
+-	$(LTLDFLAGS) $(LIBQUADLIB) ../libbacktrace/libbacktrace.la \
++	$(LTLDFLAGS) $(LIBQUADLIB) ../../libbacktrace/libbacktrace.la \
+ 	$(HWCAP_LDFLAGS) \
+ 	-lm $(extra_ldflags_libgfortran) \
+ 	$(version_arg) -Wc,-shared-libgcc
+@@ -602,7 +602,7 @@ AM_CPPFLAGS = -iquote$(srcdir)/io -I$(srcdir)/$(MULTISRCTOP)../gcc \
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


