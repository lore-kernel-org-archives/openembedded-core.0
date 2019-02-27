Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id E60597CBEC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 18:34:00 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id n19so6824137wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 10:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=SRsWXedVws204np9yBK78fqgQ1P0QbT+aqzyZSAEdcA=;
	b=nmqqcuei5zdZjz9iz63NxcyG9bRdGbR5azjCl28hfGpp/i0sjEo8cY78HMEX1E68Ng
	Bs+MYr3jPFSK5N0LzHBm+H6eG5r8ZaOt1tjc01zzzNSLAWaFJ3rkdW5jnTMUy6uJvN0b
	V5vJtKpVxLHqGlPSXkSdA1upBZxg/jBAXUBbi4ofLrnQlxWlQShsRgRywa9qZBLY4UGv
	Yp9ohObZ8BAux1IB+QW0FTFnCWTOVIH4pnWnZXlsudkHXkWTyIZHF5YIWADvjtq0ihBy
	/oSRoZvDjpAquKPeFEj1dCplhNWyBZyACL0QztHi73XpS6vY1E0l+SZnVzrti63NH5fD
	6ECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=SRsWXedVws204np9yBK78fqgQ1P0QbT+aqzyZSAEdcA=;
	b=IdTlcZzgzW8TryxV/6pm51hpk9ofk0cg1L9IihMz/RJZVVtl8wA26wlA5Wxp2dGQtw
	8TLAuP0qQhtGpJJCX4yPjplT3RDVLfQrkK3k7F1qQUxM42Z/EAEADlpOCZq02grVozh4
	DU7s3Y44SPyJsCEFcrj64UwcMpUv1ExA7ZiVOGwDtsX0xgILqEqxiScKDK62J80YhGyb
	I61SFxN9IGRTnH4SLpGDUjFIbdUnY9/xEhlqqCRNyuTCV1MRL/yge/TtUpAMC9bcr0EI
	vA3dnnLOABKRreyagrG16lwQHMJCn3cCBzDKoGvl5EiNhdVJ6a9DLQhsrbrjT1h7Ah5o
	G13Q==
X-Gm-Message-State: APjAAAXmCKZaMA4qBKFmrz2a+UjmrsMXV6SGJODq3C3SFwWk9WrdJ3vo
	TwYzPUCaLoh8eGc0KN4BDIpNnThtB5M=
X-Google-Smtp-Source: APXvYqxw4jYUgX1hKSzfBtAv1GgklJf+zVMdy7Pue6D+5LaxRjThTZ3QT7cIx0G6YtkXJTcHnapF4A==
X-Received: by 2002:a1c:6442:: with SMTP id y63mr431083wmb.31.1551292441089;
	Wed, 27 Feb 2019 10:34:01 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	w4sm26158366wrk.85.2019.02.27.10.33.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Feb 2019 10:34:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 18:33:54 +0000
Message-Id: <20190227183355.19346-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] libpcre: recipe cleanup
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
X-List-Received-Date: Wed, 27 Feb 2019 18:34:01 -0000

The following options are the defaults, so remove them:
--enable-newline-is-lf
--with-match-size=2
--with-match-limit=10000000

We don't appear to need to pass -D_REENTRANT anymore (added with no explanation
to oe-classic in 2006).

Explicitly adding -lstdc++ doesn't appear to be required anymore (added for
PowerPC in 2008).

This recipe has always rebuilt the character tables but back in PCRE 4.4 (first
added to OE) a copy of the tables wasn't distributed with the tarball so this
was required.  Since 2007 the tarball includes the tables for ASCII and
regeneration is only required if we wish to use EBCDIC, which we do not. Drop
the patch adding CC_FOR_BUILD support and remove --enable-rebuild-chartables

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libpcre/libpcre/pcre-cross.patch               | 48 ----------------------
 meta/recipes-support/libpcre/libpcre_8.43.bb       | 17 +-------
 2 files changed, 1 insertion(+), 64 deletions(-)
 delete mode 100644 meta/recipes-support/libpcre/libpcre/pcre-cross.patch

diff --git a/meta/recipes-support/libpcre/libpcre/pcre-cross.patch b/meta/recipes-support/libpcre/libpcre/pcre-cross.patch
deleted file mode 100644
index 83880f70983..00000000000
--- a/meta/recipes-support/libpcre/libpcre/pcre-cross.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Upstream-Status: Pending
-
---- pcre-8.32.orig/Makefile.am
-+++ pcre-8.32/Makefile.am
-@@ -197,8 +197,18 @@ bin_SCRIPTS = pcre-config
- 
-+CC_FOR_BUILD = @CC_FOR_BUILD@
-+CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
-+CCLD_FOR_BUILD = @CCLD_FOR_BUILD@
-+LDFLAGS_FOR_BUILD = @LDFLAGS_FOR_BUILD@
-+
- if WITH_REBUILD_CHARTABLES
- 
- noinst_PROGRAMS += dftables
- dftables_SOURCES = dftables.c
-+dftables_LINK = $(CCLD_FOR_BUILD) -o $@
-+dftables_LDFLAGS = $(LDFLAGS_FOR_BUILD)
-+
-+dftables.o: $(srcdir)/dftables.c
-+	$(CC_FOR_BUILD) -c $(CFLAGS_FOR_BUILD) -o $@ $(srcdir)/dftables.c
- 
- pcre_chartables.c: dftables$(EXEEXT)
- 	./dftables$(EXEEXT) $@
---- pcre-8.32.orig/configure.ac
-+++ pcre-8.32/configure.ac
-@@ -72,6 +72,22 @@ then
-   fi
- fi
- 
-+if test x"$cross_compiling" = xyes; then
-+    CC_FOR_BUILD="${CC_FOR_BUILD-gcc}"
-+    CCLD_FOR_BUILD="${CCLD_FOR_BUILD-gcc}"
-+    CFLAGS_FOR_BUILD="${CFLAGS_FOR_BUILD}"
-+    LDFLAGS_FOR_BUILD="${LDFLAGS_FOR_BUILD}"
-+else
-+    CC_FOR_BUILD="${CC_FOR_BUILD-\$(CC)}"
-+    CCLD_FOR_BUILD="${CCLD_FOR_BUILD-\$(CCLD)}"
-+    CFLAGS_FOR_BUILD="${CFLAGS_FOR_BUILD-\$(CFLAGS)}"
-+    LDFLAGS_FOR_BUILD="${LDFLAGS_FOR_BUILD-\$(LDFLAGS)}"
-+fi
-+AC_ARG_VAR(CC_FOR_BUILD, [build system C compiler])
-+AC_ARG_VAR(CCLD_FOR_BUILD, [build system C linker frontend])
-+AC_ARG_VAR(CFLAGS_FOR_BUILD, [build system C compiler arguments])
-+AC_ARG_VAR(LDFLAGS_FOR_BUILD, [build system C linker frontend arguments])
-+
- # AC_PROG_CXX will return "g++" even if no c++ compiler is installed.
- # Check for that case, and just disable c++ code if g++ doesn't run.
- AC_LANG_PUSH(C++)
diff --git a/meta/recipes-support/libpcre/libpcre_8.43.bb b/meta/recipes-support/libpcre/libpcre_8.43.bb
index d54b3941976..e28615a8ba7 100644
--- a/meta/recipes-support/libpcre/libpcre_8.43.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.43.bb
@@ -8,7 +8,6 @@ SECTION = "devel"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=91bee59d1b327eb1599b4c673e2fb3d1"
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar.bz2 \
-           file://pcre-cross.patch \
            file://fix-pcre-name-collision.patch \
            file://run-ptest \
            file://Makefile \
@@ -36,21 +35,7 @@ BINCONFIG = "${bindir}/pcre-config"
 
 inherit autotools binconfig-disabled ptest
 
-EXTRA_OECONF = "\
-    --enable-newline-is-lf \
-    --enable-rebuild-chartables \
-    --enable-utf \
-    --with-link-size=2 \
-    --with-match-limit=10000000 \
-"
-
-# Set LINK_SIZE in BUILD_CFLAGS given that the autotools bbclass use it to
-# set CFLAGS_FOR_BUILD, required for the libpcre build.
-BUILD_CFLAGS =+ "-DLINK_SIZE=2 -I${B}"
-CFLAGS += "-D_REENTRANT"
-CXXFLAGS_append_powerpc = " -lstdc++"
-
-export CCLD_FOR_BUILD ="${BUILD_CCLD}"
+EXTRA_OECONF = "--enable-utf"
 
 PACKAGES =+ "libpcrecpp libpcreposix pcregrep pcregrep-doc pcretest pcretest-doc"
 
-- 
2.11.0


