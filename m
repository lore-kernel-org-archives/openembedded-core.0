Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2596D78480
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 15:29:27 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id w21so26653841lfc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 07:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=L9Gwu68lx7ZgBhnYc9ZZRc2tjZthuafGq/LxvTrmiRo=;
	b=d+CuiM2u+Q7TWcTmZ3KYwcINy5vdcsRYiGUVC1+9ggS+5lyRDhCn2R39PkaS13qBvm
	mdMuAg+BtkICY0kMEoY6XlKbvhz50zgNJcHc/INBpOU2FlvvgsxTjK5MueN9AW2Uhbne
	Hpi+Sq3ZvhHlEMXtHmoUcmuorVn9JVYYFCPnUXtcJAYT5nIKFFn1mMa1mZ8WcXDSRCSV
	gjDmklwHtGQFteX/yD/qAKaHz3GNSvlogPWdcjRkts0KHqlfGud69rg4XUyFKCcTzSeu
	lZO+4cFfDBrPhgwSGpaDRgnrkJ29/AUKEWkZu40TxiF1nhSa1OeSitf/2xIK9E88m2US
	8+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=L9Gwu68lx7ZgBhnYc9ZZRc2tjZthuafGq/LxvTrmiRo=;
	b=pk3bFNiA55k6sFE213CGMlim7Y4XUkCovtsYv7idtwQ4SrXoaLBRcgbaMY84y8s7YT
	cuAtXGsvQXF05zuJ+yFUqzzEAs7k+Jq8ujtQltp3zbNSF+H2WlHYryFtA6G/R6sZZwyv
	cpxmQUe977V5Ioce6suGn3c+Nqnxdvlq72M7tBEIegkDSvlWu7LrIPMVZ+eikCMTRwjs
	oTgF5iL2KgwM7CkA9ZGsDMrNPaqK6FB7rN4f4kEQPF0sV3CqRK1/b2IO0nGP64UVrvWx
	AFcJJNaU5zxd4APj59hQbW071T7K0bkc0uX/rq/x/ztbQ/ydC9BeSqbsb3VxhJKF32vM
	vSyQ==
X-Gm-Message-State: AJaThX5Z3/xbYdHX9MYM2Yz0nsWcRGap0YW8G82g7LeWY3C75WnfN/SI
	iRciaU4swqom4/P6MmMeLitvfzwb
X-Google-Smtp-Source: AGs4zMZpBKMSeZLMOToQlFR91fwN9aJE+UWyPgTpAZFqRauLJc+pF6meWTLxNFNNlFE1vhbwB5AJrw==
X-Received: by 10.25.23.165 with SMTP id 37mr2662815lfx.127.1510759768475;
	Wed, 15 Nov 2017 07:29:28 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id k68sm4429218lje.8.2017.11.15.07.29.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Nov 2017 07:29:27 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Date: Wed, 15 Nov 2017 16:29:17 +0100
Message-Id: <20171115152918.677-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.15.0
Subject: [meta-oe][PATCH v2 1/2] gcc-6.4: Fix libgfortran build
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
X-List-Received-Date: Wed, 15 Nov 2017 15:29:28 -0000

Without this patch libbacktrace cannot be included/link during
libgfortran build.

libbtool: link: cannot find the library `../libbacktrace/libbacktrace.la'
or unhandled argument `../libbacktrace/libbacktrace.la'

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-6.4.inc              |  1 +
 .../gcc/gcc-6.4/0057-Fix-gfortran-build.patch      | 53 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0057-Fix-gfortran-build.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.4.inc b/meta/recipes-devtools/gcc/gcc-6.4.inc
index 37e996afb706..f2b01699f157 100644
--- a/meta/recipes-devtools/gcc/gcc-6.4.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.4.inc
@@ -76,6 +76,7 @@ SRC_URI = "\
            file://0054_all_nopie-all-flags.patch \
            file://0055-unwind_h-glibc26.patch \
            file://0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch \
+           file://0057-Fix-gfortran-build.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0057-Fix-gfortran-build.patch b/meta/recipes-devtools/gcc/gcc-6.4/0057-Fix-gfortran-build.patch
new file mode 100644
index 000000000000..30b135b9780f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/0057-Fix-gfortran-build.patch
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
2.15.0


