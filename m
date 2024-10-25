Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B8C4D149EB
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 19:52:13 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.4384.1729885926124449841
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 12:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oo3asvhL;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539eb97f26aso2595113e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 12:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729885924; x=1730490724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ERLtrDuiHDvYZ3OGM/zKz4InCOd2MEo8PIBnS1wWE2c=;
        b=Oo3asvhLciuWQTGlRQovfg/btewsoz0IjqCOY6jVwW4RfKJ0UePwxbR6gKlA2HqZRj
         pc+1+JKO0os/7IzlCbbS1ndon1UU10R6kCB4ueWdgNXykXImBRwQt5hfUItTOm3LPyOM
         M/vBbyef4jeXRwVr5rcUp8Ql3bnI1y/b0PDVXu2gOIxUZYHXX+l0NgcHFgDlSLzcSAFW
         wIuWSJAEpv6+R1kTbIYlUSLTHZE+Exc2sLuuJv/xZ/RV6Dw35vRB5kkKgnO4PD5nQKBE
         1YAMOINo+exkZ+YjZXAYv251rowzYtbFWab6hC/xa2lr4zG1TTV0mq3OF4k2Zvw1qDQV
         uhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729885924; x=1730490724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERLtrDuiHDvYZ3OGM/zKz4InCOd2MEo8PIBnS1wWE2c=;
        b=EZc+lrj8Zi5BgeECEspnkEWr2mZXdByCrunSwrjLvX652lEx1JeuUMBVKMvOjEQ6Mw
         IRXi0HI2dh0XR/EQX6tDoQts+fjGw8tUbkFdVdQIuaDXfIRgPB5koknmgvxW4Isyi0Bc
         P9pBG33GJMIl/NJp6ocOTGvTJ2Be3yDOo0KlJn2HbZLoj4SiBWexvFESxSmf7CIVVo6r
         iF95EMkXuoWc1CjObtVoo7e9xYI92aqrQoTN2rirGqUi75/x/QoIuP5JPlln44eE0Snd
         6V6MSvlrRa3JenQNkChv8kmJAJH+rVHtAE2crSuGfBkwYHdx1+vy6PLHjlOIojGwbEuG
         BiGw==
X-Gm-Message-State: AOJu0YzpoLEEdf9sdE1BVem9yHsK5TqasUjGHCZHdAZ8HTDWwl6jOg0G
	ejFPbh+3tCtZXc3qZOiJH9OZ+EGTSnD5GkkSRWwdMOxA4U+/s9vfMeLzqg==
X-Google-Smtp-Source: AGHT+IFZEoiI4P2xowhpDv9DKbikeOVVPN7qVl2hk/pCaC23+QzRbzmbl0ScTLJixZGpA/sbhgzolA==
X-Received: by 2002:a05:6512:3984:b0:53a:125:8fa1 with SMTP id 2adb3069b0e04-53b348cb708mr238043e87.14.1729885923616;
        Fri, 25 Oct 2024 12:52:03 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431935a3ea8sm26958975e9.21.2024.10.25.12.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 12:52:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [kirkstone][PATCH 1/2] zip: Make configure checks to be more robust
Date: Fri, 25 Oct 2024 21:51:53 +0200
Message-ID: <20241025195154.1186400-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 19:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206372

From: Khem Raj <raj.khem@gmail.com>

Newer compilers are strict and have turned some warnings into hard
errors which results in subtle configure check failures. Therefore fix
these tests and also enable largefile support via cflags when its
desired

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
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
2.47.0


