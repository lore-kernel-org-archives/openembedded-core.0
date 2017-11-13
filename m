Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 430817866D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 12:57:17 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id 73so3884661lfu.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 04:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wjBPhyhNHvo2XJWCLaHKMELzk0aBnI3Suc4lVmYsclk=;
	b=lW0Y6W5B93ArGEY4iDsnUG2Tz3ZBqfZGJM7+P4KgLOB9xEbaSqA/KIo3XDOV2xLi3S
	b8ZdH1L7IhxeY9/ELT2lpB0SbPeel7HLwBwEWxoYg1QOpiRMo+wziXdTL93f4GCMKQwg
	9+V0fpkdSERshcUlmHINXzDIg3Cq+9MLSKfXpaGfqzmySS5iOoueFHz7DQn58PPti9ND
	pUvH4qMvjd8PsMN5KLelAL8+lfFcU5lLSEscuA/zjyQBS2x/PD4W6/lS3DnaZiNbWqVi
	UV0nHVl6eT7yZc7LOXZafJVf5mTzmdBFA2J3MNj2eeuNoR8E3zTShc3lna7jpZt2rors
	gRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wjBPhyhNHvo2XJWCLaHKMELzk0aBnI3Suc4lVmYsclk=;
	b=Ot0BcM13sx+cyplXPZzmu0pbTFNCsJsSXD7afkBvI6k2VOk3TPzDGZH/ehmeOt1ida
	5DrN162rK+JG8T8LZ6qqNp37to6jGjifODQUuVm3E7yDABwNr1CvRaslzfopo/FL2j8n
	M5c5zpb9iqcHCiqZlissxo1JUmJrHUByNkVOSB891Q83/B4IrUfkh+3nL8glt11NdkvF
	Ov+7y2cT0lOpJRXzdbz1mNzbM8iM+lgTm3JCjvRvOhQuYDs++CvTajkaOQ4HKWbsApov
	eu8t8Ytxy6u0hL2yWDUM03xFdvoUitTYwqAY5216CJWhAb+WhY824wwXmBHN49xYIs9d
	LTbA==
X-Gm-Message-State: AJaThX4Ptj07NyqT45n8EmtquwqAXjU5RIrouZY6w8+JQLjuArdi8Ndi
	hVBqmX1taBCDjG2kAIiXpt8S3+IU
X-Google-Smtp-Source: AGs4zMatNy8j4eD5MLpaw21QMg/bClPs0v5VjhXOw5V1yBDLclEVTHp6s7pnHU0NNT4+X7G9ECbbeQ==
X-Received: by 10.46.16.76 with SMTP id j73mr2967057lje.170.1510577838296;
	Mon, 13 Nov 2017 04:57:18 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	c132sm2900297lfe.37.2017.11.13.04.57.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Nov 2017 04:57:17 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2017 13:57:14 +0100
Message-Id: <20171113125714.21427-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.15.0
Subject: [PATCH] gcc-7.2: Fix libgfortran build
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
X-List-Received-Date: Mon, 13 Nov 2017 12:57:18 -0000

Without this patch libbacktrace cannot be included/link during
libgfortran build.

libbtool: link: cannot find the library
`../libbacktrace/libbacktrace.la'
or unhandled argument `../libbacktrace/libbacktrace.la

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-7.2.inc              |  1 +
 .../gcc/gcc-7.2/0051-Fix-gfortran-build.patch      | 53 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc b/meta/recipes-devtools/gcc/gcc-7.2.inc
index 1d40cba73175..ae3ed02d6ce3 100644
--- a/meta/recipes-devtools/gcc/gcc-7.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
@@ -75,6 +75,7 @@ SRC_URI = "\
            file://0048-gcc-Enable-static-PIE.patch \
            file://fix-segmentation-fault-precompiled-hdr.patch \
            file://0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch \
+	   file://0051-Fix-gfortran-build.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch b/meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch
new file mode 100644
index 000000000000..a71b6b0bee0e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch
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
2.15.0


