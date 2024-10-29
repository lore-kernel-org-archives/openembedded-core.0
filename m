Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C71D3A68D
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 19:00:34 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.1980.1730228427857577705
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 12:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2aq66UYP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7ea7e250c54so4360696a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 12:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730228427; x=1730833227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7JDPfFY5PglOxXiWujcaA1eSKC7jqokqzkFhaE9mSA0=;
        b=2aq66UYPIb1Wczu/G7AcsMKZV4gs3Wwm+isH2iWhgsSZQIyenJXsiNraYX2JK1b+Az
         jA737NzO4B1ldOIHzWkOPcWiuyUq25RVbc54WPb5Ic+V8m5K5pEnzMWirV3xVr8cBYKs
         dtgrMZpATC80S1P+NTf2cRbyZHVDWAP1Osagdty3W4EO2NdQ1qW/ZBU6JYHvMSUGuou2
         X90sBBiWozitJwyWH7kO7s7IMXQxWWuK5X+kJWBYMoycv91gyMlkB9P4cqOzVSLf8f1E
         yzZTqwDlhfFMCLXndNqWKBhN2l07Zn2ShEi/cG/0kIqvBXJWMS94PY6EOqFpB0QL+4Gk
         C1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730228427; x=1730833227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JDPfFY5PglOxXiWujcaA1eSKC7jqokqzkFhaE9mSA0=;
        b=SC65ROCrPyT8TyYEhS5eG052Sx6+g1VFsBQME9YNBplKhu8ok6ck8hIeWBj1Fi2/fl
         db6+bYbHQTq+LUeXb2ncivdfw4anL4UBrxiCBA5V84xyyGYxW35WWYrnos+tuRZBNN+3
         p8sP99yN+O4FifwkzywQchDeB5a0mb8kGStz+2ctigeipRALrDyDark5gEWy2d8/bQMt
         wOAE/S9i8Mp1wK1ioV6QE7QvG1xFtS4c4tdgkwklf2UgKcuxDRMux05bzYMI5GCHM8wF
         I43WW2VQB8DHxzwZ72P4G0ScQxcojFIJa55kt6QC5Nc8IpjU6Em6Z74dYeIcYZmh1+rA
         ujYg==
X-Gm-Message-State: AOJu0YyEWJQ+4+k64YpMGDc0VWx25e0t8a6MPNTYd0EiEQw5hKGX9K7s
	JlgRs71+r6F+4r4vl3PkG14tfj0xx24C8hqM2WgYR43wRmAKreL9F1dYj8BVlRBprckNBXyO1PG
	n
X-Google-Smtp-Source: AGHT+IFMKbGEr2QbzWrCUZaTQLh86yAeEVZF9/FLr5sQQgwA9G/eJNineCATV2HJXhVsTr4VtejcVg==
X-Received: by 2002:a05:6a21:3947:b0:1d9:3456:b71e with SMTP id adf61e73a8af0-1d9a83c1926mr16746182637.12.1730228426825;
        Tue, 29 Oct 2024 12:00:26 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205793273csm7835439b3a.74.2024.10.29.12.00.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:00:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/19] zip: Make configure checks to be more robust
Date: Tue, 29 Oct 2024 11:59:46 -0700
Message-Id: <03b7a44e2ff4364cb85758f91d78efa0cf85682d.1730228268.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730228268.git.steve@sakoman.com>
References: <cover.1730228268.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 19:00:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206523

From: Khem Raj <raj.khem@gmail.com>

Newer compilers are strict and have turned some warnings into hard
errors which results in subtle configure check failures. Therefore fix
these tests and also enable largefile support via cflags when its
desired

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...y-correct-function-signatures-and-de.patch | 134 ++++++++++++++++++
 ...2-unix.c-Do-not-redefine-DIR-as-FILE.patch |  35 +++++
 meta/recipes-extended/zip/zip_3.0.bb          |   2 +
 3 files changed, 171 insertions(+)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-configure-Specify-correct-function-signatures-and-de.patch
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-redefine-DIR-as-FILE.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/0001-configure-Specify-correct-function-signatures-and-de.patch b/meta/recipes-extended/zip/zip-3.0/0001-configure-Specify-correct-function-signatures-and-de.patch
new file mode 100644
index 0000000000..a4f8382625
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/0001-configure-Specify-correct-function-signatures-and-de.patch
@@ -0,0 +1,134 @@
+From 8810f2643c9372a8083272dc1fc157427646d961 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 10 Aug 2022 17:16:23 -0700
+Subject: [PATCH 1/2] configure: Specify correct function signatures and
+ declarations
+
+Include needed system headers in configure tests, this is needed because
+newer compilers are getting stricter about the C99 specs and turning
+-Wimplicit-function-declaration into hard error e.g. clang-15+
+
+Upstream-Status: Inactive-Upstream
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ unix/configure | 79 +++++++++++++++++++++++++++++++++++++++++---------
+ 1 file changed, 66 insertions(+), 13 deletions(-)
+
+diff --git a/unix/configure b/unix/configure
+index 1d9a9bb..f2b3d02 100644
+--- a/unix/configure
++++ b/unix/configure
+@@ -513,21 +513,70 @@ $CC $CFLAGS -c conftest.c >/dev/null 2>/dev/null
+ # Check for missing functions
+ # add NO_'function_name' to flags if missing
+ 
+-for func in rmdir strchr strrchr rename mktemp mktime mkstemp
+-do
+-  echo Check for $func
+-  echo "int main(){ $func(); return 0; }" > conftest.c
+-  $CC $CFLAGS $LDFLAGS $BFLAG -o conftest conftest.c >/dev/null 2>/dev/null
+-  [ $? -ne 0 ] && CFLAGS="${CFLAGS} -DNO_`echo $func | tr '[a-z]' '[A-Z]'`"
+-done
++echo Check for rmdir
++cat > conftest.c << _EOF_
++#include <unistd.h>
++int main(){ rmdir(NULL); return 0; }
++_EOF_
++$CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
++[ $? -ne 0 ] && CFLAGS="${CFLAGS} -DNO_RMDIR"
++
++echo Check for strchr
++cat > conftest.c << _EOF_
++#include <string.h>
++int main(){ strchr(NULL,0); return 0; }
++_EOF_
++$CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
++[ $? -ne 0 ] && CFLAGS="${CFLAGS} -DNO_STRCHR"
+ 
++echo Check for strrchr
++cat > conftest.c << _EOF_
++#include <string.h>
++int main(){ strrchr(NULL,0); return 0; }
++_EOF_
++$CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
++[ $? -ne 0 ] && CFLAGS="${CFLAGS} -DNO_STRRCHR"
++
++echo Check for rename
++cat > conftest.c << _EOF_
++#include <stdio.h>
++int main(){ rename(NULL,NULL); return 0; }
++_EOF_
++$CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
++[ $? -ne 0 ] && CFLAGS="${CFLAGS} -DNO_RENAME"
++
++echo Check for mktemp
++cat > conftest.c << _EOF_
++#include <stdlib.h>
++int main(){ mktemp(NULL); return 0; }
++_EOF_
++$CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
++[ $? -ne 0 ] && CFLAGS="${CFLAGS} -DNO_MKTEMP"
++
++echo Check for mktime
++cat > conftest.c << _EOF_
++#include <time.h>
++int main(){ mktime(NULL); return 0; }
++_EOF_
++$CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
++[ $? -ne 0 ] && CFLAGS="${CFLAGS} -DNO_MKTIME"
++
++echo Check for mkstemp
++cat > conftest.c << _EOF_
++#include <stdlib.h>
++int main(){ return mkstemp(NULL); }
++_EOF_
++$CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
++[ $? -ne 0 ] && CFLAGS="${CFLAGS} -DNO_MKSTEMP"
+ 
+ echo Check for memset
+-echo "int main(){ char k; memset(&k,0,0); return 0; }" > conftest.c
++cat > conftest.c << _EOF_
++#include <string.h>
++int main(){ char k; memset(&k,0,0); return 0; }
++_EOF_
+ $CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
+ [ $? -ne 0 ] && CFLAGS="${CFLAGS} -DZMEM"
+ 
+-
+ echo Check for memmove
+ cat > conftest.c << _EOF_
+ #include <string.h>
+@@ -548,7 +597,7 @@ $CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
+ echo Check for errno declaration
+ cat > conftest.c << _EOF_
+ #include <errno.h>
+-main()
++int main()
+ {
+   errno = 0;
+   return 0;
+@@ -625,14 +674,18 @@ CFLAGS="${CFLAGS} ${OPT}"
+ 
+ echo Check for valloc
+ cat > conftest.c << _EOF_
+-main()
++#include <stdlib.h>
++int main()
+ {
+ #ifdef MMAP
+-    valloc();
++    valloc(0);
+ #endif
++    return 0;
+ }
+ _EOF_
+-$CC ${CFLAGS} -c conftest.c > /dev/null 2>/dev/null
++#$CC ${CFLAGS} -c conftest.c > /dev/null 2>/dev/null
++$CC ${CFLAGS} -c conftest.c
++echo "==========================================="
+ [ $? -ne 0 ] && CFLAGS="${CFLAGS} -DNO_VALLOC"
+ 
+ 
+-- 
+2.37.1
+
diff --git a/meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-redefine-DIR-as-FILE.patch b/meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-redefine-DIR-as-FILE.patch
new file mode 100644
index 0000000000..a86e03e620
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-redefine-DIR-as-FILE.patch
@@ -0,0 +1,35 @@
+From 76f5bf3546d826dcbc03acbefcf0b10b972bf136 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 10 Aug 2022 17:19:38 -0700
+Subject: [PATCH 2/2] unix.c: Do not redefine DIR as FILE
+
+DIR is already provided on Linux via
+/usr/include/dirent.h system header
+
+Upstream-Status: Inactive-Upstream
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ unix/unix.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/unix/unix.c b/unix/unix.c
+index ba87614..6e6f4d2 100644
+--- a/unix/unix.c
++++ b/unix/unix.c
+@@ -61,13 +61,11 @@ local time_t label_utim = 0;
+ /* Local functions */
+ local char *readd OF((DIR *));
+ 
+-
+ #ifdef NO_DIR                    /* for AT&T 3B1 */
+ #include <sys/dir.h>
+ #ifndef dirent
+ #  define dirent direct
+ #endif
+-typedef FILE DIR;
+ /*
+ **  Apparently originally by Rich Salz.
+ **  Cleaned up and modified by James W. Birdsall.
+-- 
+2.37.1
+
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index e1e6be6225..b6ec3cd9ad 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -17,6 +17,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.
            file://0001-configure-use-correct-CPP.patch \
            file://0002-configure-support-PIC-code-build.patch \
            file://0001-configure-Use-CFLAGS-and-LDFLAGS-when-doing-link-tes.patch \
+           file://0001-configure-Specify-correct-function-signatures-and-de.patch \
+           file://0002-unix.c-Do-not-redefine-DIR-as-FILE.patch \
            file://0001-unix-configure-use-_Static_assert-to-do-correct-dete.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


