Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 80DA978237
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 09:25:51 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id n136so9546785lfn.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 02:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2sRhe+HEApWgE1Y6Yg/u5y6NMbpcUH6MD7xfKx+/d1k=;
	b=rXiYp5ZUFp3zkMiEb1q3x5SGfksV9mBhNFdL3nRwd1rTHFUQ14dk/RdnjruAeVT/QJ
	MRgKCnXo4sCxQ4JrAJXdw2lgGeN806CpvGjluw8o96LLKgYrKcZFN72/L1bmgxwirqUW
	P3pOqPcfhYcRFN2AjVZASUMimGS52Qp+ef8gaJdcAYTSFTwwA18dtYlstvKQwP0HdnRi
	AMEWJLcL5dRdiQwFSSX6oYtNyuBgp87q3eRWPtYRavOsIOwxwpYF8QZT+GaBZfA7QnGr
	wAPWuis7A3+7/Q7/ixDlVavdiu61oP2CNPf4USADzROWbRRCVVf7CAPNC/rcccDOOiOl
	ZCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2sRhe+HEApWgE1Y6Yg/u5y6NMbpcUH6MD7xfKx+/d1k=;
	b=C/Kyu2m0epu9yMSMLnm9qDhygWjtmcOjzuAvzU/lDWIbvSjPKeRhFSNpm4yqvAXarV
	DH/rWhGw06kZtKp2auyR+WAUQSlrSDiue7r39QxTLTgd7JLHGNYLhc1IXcUvSL9bc6Om
	fHRg6dcY0YBfjW7CCM5KGPqDk3Adbz4IyDH68WcSE0Izko9fbsq9GivGpDtmp8ik+ar8
	XmA8VWX8wmzoa5rzIRA+epxu07sM5owMjEplYRNBNfBxJag+dqODBZVWVkszJGvlTjou
	GHNDpCl7z2NmzL8eiugHtmc9CsZl5eB/PY+9+6BBJP2EYndDkkixRHn5mRN5rxV5toIo
	Q71g==
X-Gm-Message-State: AKS2vOwNnFxFeXEGq11LR5LgLUs2WgcScGnP9ihO5CoVWbvSUFrwZjWg
	GgC7Z9i7R7LG0HidxNU=
X-Received: by 10.25.28.70 with SMTP id c67mr7384890lfc.130.1498814751682;
	Fri, 30 Jun 2017 02:25:51 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	g133sm1891377lfe.40.2017.06.30.02.25.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 02:25:50 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jun 2017 11:25:41 +0200
Message-Id: <20170630092543.3151-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v2 1/3] gcc-6.3: Fix libgfortran build
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
X-List-Received-Date: Fri, 30 Jun 2017 09:25:52 -0000

Without this patch libbacktrace cannot be included/link during
libgfortran build.

libbtool: link: cannot find the library `../libbacktrace/libbacktrace.la'
or unhandled argument `../libbacktrace/libbacktrace.la'

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-6.3.inc              |  1 +
 .../gcc/gcc-6.3/0099-Fix-gfortran-build.patch      | 53 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0099-Fix-gfortran-build.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.3.inc b/meta/recipes-devtools/gcc/gcc-6.3.inc
index 86b3e9ff19a4..36a116d48fb4 100644
--- a/meta/recipes-devtools/gcc/gcc-6.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
@@ -74,6 +74,7 @@ SRC_URI = "\
            file://0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
            file://0048-sync-gcc-stddef.h-with-musl.patch \
            file://0054_all_nopie-all-flags.patch \
+           file://0099-Fix-gfortran-build.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0099-Fix-gfortran-build.patch b/meta/recipes-devtools/gcc/gcc-6.3/0099-Fix-gfortran-build.patch
new file mode 100644
index 000000000000..30b135b9780f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.3/0099-Fix-gfortran-build.patch
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


