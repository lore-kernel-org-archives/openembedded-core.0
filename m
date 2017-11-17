Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 648E47884D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 14:42:38 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id 8so6571494qtv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 06:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6KuFSkpMInaiWsOxFDjjA1VMLiTieRcOOCkAXCCK71s=;
	b=IHZyQjnF59k3Rm4mbX5CUWpZnY7y2PyTmjxFdch1fr9u+8NMN3q+lSwWHgl8hyb0q4
	y7SQLDiapMOPGxxORiwvsTtSBzlMj7A2pDMCGyQ1TGKN4fkXw1DeS+255zrHXaDyZTUx
	DiTSoK/uQ/+ErETLAQ3+P8AkU1uaZeQdwrIOD7gfh6lRZUeheBFZNUjXlZdYMbYHiwEF
	rzVuyQznWYqIMHYu9XWwxO3h/Qgu0svIfM56kTVa0J4X5c/h5+LCUlGU5oYNhc4Qp/vF
	LBKaacYKFTY0kLD26ACu93yMpW3Cj4qiW4ZMODn0FykCy861LE+W7NrYZpEcAr5+uIwN
	qTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6KuFSkpMInaiWsOxFDjjA1VMLiTieRcOOCkAXCCK71s=;
	b=D8CHvZvIeGjXjOwCMEAlYhR+19ASJOkjYPhYaDcds/7GefKcql+RfKiSXF2/ss8Q1U
	zqTbFAsmr2mc5l6tg+6Gqjuo6KAAfnAkosJx3MNFYd2CtABXxzGQNe7TgS0unaeGQ/qB
	eWf+7q2mGXqFhGco6f0rYGpYDHaJHm9B9rb/UoMjhA9SUSpjFHz7XxId8Tnpb9E04w5s
	68IToH5uLNKuXhSgKjo67nRFmrxaU2mjL10UbJVosuSp/yGSUM1uPcxPeOsDwfYJG1Xh
	AaT9xrbXD3CcTlVT2BXLqwhPBQm9DtNo91F1rjWHLIEIANdKlbY+TITQInpruTA5A4yX
	lUEQ==
X-Gm-Message-State: AJaThX7r2LEkUNSXaen3OublmvWjEQ6MBltgpK58OMttwIcae7QN6RFJ
	dAFkQjbP6jlInRN1kYaokPYo/Q==
X-Google-Smtp-Source: AGs4zMbTjbWrJQH2xR+dVbz+0ft+jf9hYIvYwxdIoNjL5iGeNBVHsRNTrH33cBtq93IMVn03Cftomg==
X-Received: by 10.55.15.18 with SMTP id z18mr8636995qkg.200.1510929760033;
	Fri, 17 Nov 2017 06:42:40 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8882:b8c::a4a])
	by smtp.gmail.com with ESMTPSA id 13sm2604199qtv.67.2017.11.17.06.42.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Nov 2017 06:42:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Nov 2017 06:42:27 -0800
Message-Id: <7a5b0244a949459aa948359412369900394a8ddc.1510807196.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1510807196.git.raj.khem@gmail.com>
References: <cover.1510807196.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] gcc-6.4: Fix libgfortran build
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
X-List-Received-Date: Fri, 17 Nov 2017 14:42:39 -0000

From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Without this patch libbacktrace cannot be included/link during
libgfortran build.

libbtool: link: cannot find the library `../libbacktrace/libbacktrace.la'
or unhandled argument `../libbacktrace/libbacktrace.la'

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-6.4.inc              |  1 +
 .../gcc/gcc-6.4/0057-Fix-gfortran-build.patch      | 53 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0057-Fix-gfortran-build.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.4.inc b/meta/recipes-devtools/gcc/gcc-6.4.inc
index 37e996afb7..f2b01699f1 100644
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
index 0000000000..30b135b978
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


