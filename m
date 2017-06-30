Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4535C78247
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 08:51:17 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id t72so9530573lff.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 01:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=mpRhb/Il3USijePvTrrxDw+UOMtL+nqP1kHtZJGV4tk=;
	b=tj2S1yRkhpcknaycG+lujKWJIEbcaTwfypuBu16Jmp8bp5LBISgUSJL+psJFXyJ1LL
	8FuV9o74DV1VVyCIUi8144uaR/1nTAwoJlIQ6VSE+O2LHWRFkTZ4NKqk91sHYboLuUX9
	Ovs3Qu/exUbb7d5csgJb6U+frPIZAVXDc40gT+YRq74O7lk8Ylb28MQBWtl2xiNR3B6N
	jogu9cH/j0ZIqKiHBSK+3H+eisaG38YQsV75fujuR7qcQQBEE39s7G/I6g24fqq+PxQg
	4jJuUll8TmJj9KjB71aaBLsaBjiKAb0vsJQaXIw5DLsHUYB9TdChrnSOzyjC097XzWbg
	/61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mpRhb/Il3USijePvTrrxDw+UOMtL+nqP1kHtZJGV4tk=;
	b=stc7sTFoXxgXMKe7n+Xn+lP4bFBDOQtezm7KCYbbfVmtpw+fnzgfOiXMrUko3R2YQk
	qcA6ikUuI7rh9JdPrOvjUlUQ4RP8xedyLGK/su3SDCNBbdKSgr1eJatsbqX4fqEmx7wA
	5IfQx2cja9ovlci37XbvEFuvJ/PG4TWTSeUvFNZto8g73PmtOQbUPnBcaZmrBYeYay6S
	SKX8YhA6PaPNuyzrZkqK3pxvFSuxKqtDY3QKsn+L+RepuPX8KBw+jZRIIFeVAvVhlR2r
	N0QaCuYePVdiwgeUgSbdwHz1ncH2ez3Ghux1OEDXjXiJFxruzIe0fCEvwdU/239rybA9
	m5VQ==
X-Gm-Message-State: AKS2vOzvDuSk7Qu4N8bk9QsG4T0+MG8mB5F+2unuhuUX72hNEq8FuWq1
	Bb4VmISV5eV0+u9Up/U=
X-Received: by 10.25.115.85 with SMTP id o82mr5756661lfc.96.1498812678114;
	Fri, 30 Jun 2017 01:51:18 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	f46sm1883560lfh.51.2017.06.30.01.51.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 01:51:17 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jun 2017 10:51:12 +0200
Message-Id: <20170630085114.32050-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/3] gcc-6.3: Fix libgfortran build
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
X-List-Received-Date: Fri, 30 Jun 2017 08:51:18 -0000

Without this patch libbacktrace cannot be included/link during
libgfortran build.

libbtool: link: cannot find the library `../libbacktrace/libbacktrace.la'
or unhandled argument `../libbacktrace/libbacktrace.la'

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-6.3.inc              |  1 +
 .../gcc/gcc-6.3/0099-Fix-gfortran-build.patch      | 44 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)
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
index 000000000000..32b2f9a0567f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.3/0099-Fix-gfortran-build.patch
@@ -0,0 +1,44 @@
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


