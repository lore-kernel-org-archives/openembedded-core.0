Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F0EC25B0E
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 05:54:47 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.3216.1660197278735178280
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 22:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RLwr8+xV;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 o3-20020a17090a0a0300b001f7649cd317so4386987pjo.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 22:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=DfIj4QbU1CoGNRpI1+Gd4fXva7ElV7CREoanEXNHMOk=;
        b=RLwr8+xVsp8u1wx/BtqqLaV1tTkPMJAXpeePNG5Ce09mdAsp6ziAqYsb/bOzLXoap5
         KNxRf44wviXXnlqDha6wdPZEqVySOnkereYtBpEwfvrMIH3bKW8n4HketXmEmB6nlmu0
         mErwVIlqb2hPtfeHadOc8b4kUYPSJGY3x4Q18aapb7391eclseG8PQjKyHNcEVaus8Wv
         IDCm7NDg9sDaJKliHvTfrh2DYdeubz5AXGAg3s8sj4zB1ThngTb8X38lhx2I4WDtZinp
         /ywWDbdhcF9vrQIRNyo3L34t595BLglzuwgQR0LlEva0A2TciAKPwZgPhLZhl8C5Uq4X
         xmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=DfIj4QbU1CoGNRpI1+Gd4fXva7ElV7CREoanEXNHMOk=;
        b=ugDUa11T7BPaVetqissFPimt/EbPP2N8Omn5z9Vt5/zjQFf0EIA9f8Dy933YsFE5TO
         nyDUCPkqKigeFvic+5wByUvb4AUG2NUOMho2lon9nXAAdC1QHOdhyz4PmlT4fmEo9DDb
         1w1eVBtqcx0hFzsUWd7zLYQJItPIDQk+vSx9NTuK12cILANnkGMjsbZrrWul9PVxjxwV
         ck9T7Iyb4njqxdbCaMYJbae6dRuAYv9DskfDzZlONtrJDz6TXu7vKAYVjkPFPkmZfWpq
         aR065CzQhnxGDt1kyOU5Bx9BVdYKYkj90NUat8RSfLDeu+zOBbU2J7gxWhvEXNxKY78h
         a5tw==
X-Gm-Message-State: ACgBeo0eMy0FSy7FORLyy5OEwrSQgtxdBydafg9QUvlTKOWDpJEoYe4L
	T1NU3iGvkHC2HdiZFsKDaLCjK5BnTlE=
X-Google-Smtp-Source: 
 AA6agR69SseyrY0Lg7tsejuZzrOuzm8mYoTaeJED+7KaRzJ6uwjF2aHiXeMJJLKymYAoYfVv8cpBJA==
X-Received: by 2002:a17:902:9005:b0:16d:1ffd:cf56 with SMTP id
 a5-20020a170902900500b0016d1ffdcf56mr30939980plp.119.1660197277582;
        Wed, 10 Aug 2022 22:54:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 e11-20020a17090301cb00b0016db6bd77f4sm14290483plh.117.2022.08.10.22.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 22:54:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/5] zip: Make configure checks to be more robust
Date: Wed, 10 Aug 2022 22:54:30 -0700
Message-Id: <20220811055433.819522-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220811055433.819522-1-raj.khem@gmail.com>
References: <20220811055433.819522-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 05:54:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169228

Newer compilers are strict and have turned some warnings into hard
errors which results in subtle configure check failures. Therefore fix
these tests and also enable largefile support via cflags when its
desired

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...y-correct-function-signatures-and-de.patch | 134 ++++++++++++++++++
 ...2-unix.c-Do-not-redefine-DIR-as-FILE.patch |  35 +++++
 meta/recipes-extended/zip/zip_3.0.bb          |   2 +
 3 files changed, 171 insertions(+)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-configure-Specify-correct-function-signatures-and-de.patch
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-redefine-DIR-as-FILE.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/0001-configure-Specify-correct-function-signatures-and-de.patch b/meta/recipes-extended/zip/zip-3.0/0001-configure-Specify-correct-function-signatures-and-de.patch
new file mode 100644
index 00000000000..a4f83826257
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
index 00000000000..a86e03e6203
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
index d560c83464b..65d9b0995bf 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -17,6 +17,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.
            file://0001-configure-use-correct-CPP.patch \
            file://0002-configure-support-PIC-code-build.patch \
            file://0001-configure-Use-CFLAGS-and-LDFLAGS-when-doing-link-tes.patch \
+           file://0001-configure-Specify-correct-function-signatures-and-de.patch \
+           file://0002-unix.c-Do-not-redefine-DIR-as-FILE.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.37.1


