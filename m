Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 558D378483
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 15:29:29 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id w23so3042561lfd.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 07:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wjBPhyhNHvo2XJWCLaHKMELzk0aBnI3Suc4lVmYsclk=;
	b=mfDPQQo9qJ2A74o0LHvEvKt54fbfcc6BHWJSsZz+ORV4y3DzdowBzVRfGPU5hsfLTY
	/Q+b1OsvsW5FTxO9DPYl2qUudtGAQgbrtnmPTC238bPy67nWqE/RN8F/RvGXRkVnuYQs
	b/t+NLNs3Z7nTulLr+M/8hPs7NrKdApKlkYyvaze13tltGQIOBUs4rto/sl2h+D1JaB7
	xWFTDciOLoDaMykBMYIHJCdt4XSkcmoFvXRXMgGXxnAY3eC8vYwIWZunZVZ9jTwUs63I
	sTo9YtwaDw6amh6A0dTkUopCKnxAOmQo1oLLbZ4Rw6xgclPsBKasXlY3hiDolqhC5aJz
	S9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wjBPhyhNHvo2XJWCLaHKMELzk0aBnI3Suc4lVmYsclk=;
	b=m69x2a//UlLBGiiODyUHTiI613OdsSdJud736sE9FA0xFF7IpOQvpbG+53r5yM0N60
	uqS5Nm/2CTuhsZgsOHO8zruABcMXKEL704OVoixpG2DU1akjdC7Nw+OKNpc2suq/PYWF
	d28dSDYtj2kQNLnfWfBCsSqQ7RoMv5JDbsnCX6V82b4yN4saSuqptN/TVPHouCXP9I5i
	zmjW5DkE/N6sRlXFQfO+SuHVgmItQNGuzdhxyF97Y35eujIju2QYnPbBIpXEKyJQIz5D
	aM4yZA7dVXGnMdqMU7f5aaVqCtrpzdUmBU8bSFXXVlIscbqkmXTySSUzDwT9AFUlAyVU
	4oew==
X-Gm-Message-State: AJaThX4/M8Qjqtcis3hctXQTEmQevsniYz2q/WuvcmSFlvXMrgZMQN7p
	R+4zwBGDPG/y/KaAbbpMX5am0tKs
X-Google-Smtp-Source: AGs4zMaEtmxH42RwG6N5UZ7s15+WfFbuL/3SJYQWKEj8fXaopVtMy+XgXqJcWWsndx+7kTkrfeB87w==
X-Received: by 10.46.88.77 with SMTP id x13mr1011214ljd.80.1510759769942;
	Wed, 15 Nov 2017 07:29:29 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id k68sm4429218lje.8.2017.11.15.07.29.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Nov 2017 07:29:28 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Date: Wed, 15 Nov 2017 16:29:18 +0100
Message-Id: <20171115152918.677-2-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171115152918.677-1-ricardo.ribalda@gmail.com>
References: <20171115152918.677-1-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v2 2/2] gcc-7.2: Fix libgfortran build
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
X-List-Received-Date: Wed, 15 Nov 2017 15:29:29 -0000

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


