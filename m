Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A399E77180
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 12:45:29 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.9533.1733834722388906544
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 04:45:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ab73zMdh;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5cf6f367f97so8085765a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 04:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733834721; x=1734439521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oYkLWEiUESkEOqAXCWRGJtYM5jIbz8q9HCz6sqgdMm8=;
        b=Ab73zMdhtA4md2Wm7L/H85P9k5nZ5tDl1WsIyDBqnMYkVvoStMDdULI0+IKCzlplTi
         l6uP99EDU4c7l4/BPSeg042kdqQDOGXbVS7QXw3ugW7ryNACEkQwPN140hn3T0AyFhRz
         2HEEJzPdA0I/N7waVjZRNY5sUA29709gvBShdYCj8jeN5YJGtyfL2ywuidccSjG1LaFO
         NwDIl2kUQwlWhMCJcIcjSn0M4ToAggkjHgy2BY2kr2lHWGAXa2wj4d0jqSFyJtM5V0aG
         fqxP9NFSneGJi+9p/QRSUXzhescLxOzpYDuJakklrFLd/vWL/a6+jQBzzxUbKyM7JL9u
         h8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733834721; x=1734439521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYkLWEiUESkEOqAXCWRGJtYM5jIbz8q9HCz6sqgdMm8=;
        b=Y623KxFXoPIzWNCb69my0oZMI4JQEkJ9fsDWnkIVbTs4e3leF2FOM0fbvu17gFufil
         1own+YfVo5uAIevQmx6Xbzh3qb5dLKmiQ/eDoOGOWHA/6tQYjwTclEjEsJAILNAMVvUB
         raeeRWeeF36kjtEgp9ehCvbzI8LbWeZ0njugDCwE1oosxuC3aQvTn2YDGb3DVMgFpg5x
         JMgqMyiYYayEsmQlZrSmz0DJJFRIhrjWQTkNV7BSRLr2ksrtV/ZxbdlOmz62gUGwU9VH
         NsZIKCzmY8xgRGMUPg1OJGuOkBUBDNYhJWnr7380fyLvikg3ku/ghJvc+3jXf4FVhtFh
         dPBw==
X-Gm-Message-State: AOJu0Yz9fUmX2Epk9HHgJb63xqeCWKgjuW6IhjZei0PRphThQ/I6WE/M
	OtyfvkJLLUhrcNy1KGbJHx3zY9nK/bIxYgU6BqSGEJPEuSpAFweikAFCww==
X-Gm-Gg: ASbGncsYYe5kYBbtGxM8pkwOGWoR/R1+nv2MrmzUxTpsfg0IoQcfyoGMqQI/Br17HpG
	+qR1Ont3hrZzF9pVU8WIJYZpOqR2zk09ZHlom5DKSE8y1CyncWmog6C/jejGxaoxXPGB3ClF5FC
	/RMqoUrlFd/h8ooZgxulm5P7k2CtLle04SyGNSQ4QtaN4nNo2ZFsZyla4MvvLILsFayxyoO0NWc
	N+3+3njJR47e662FF53xN4CvKHBq8nkIp5YlkdvCviP6yfQaXZMbKvXsW+70yAql4kwMNGQY9M1
	z1Padujx/+k=
X-Google-Smtp-Source: AGHT+IG0YR3iW9o9Z0PGH/nilibS1yJ9B7e7aCWIYs2GJX+iM/pBH9a1auYNT9ELNWoinHLxTTx9PA==
X-Received: by 2002:a05:6402:13d1:b0:5d3:e8d1:a43 with SMTP id 4fb4d7f45d1cf-5d4185fe039mr5258316a12.27.1733834720405;
        Tue, 10 Dec 2024 04:45:20 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3c4019675sm6237454a12.50.2024.12.10.04.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 04:45:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [kirkstone][PATCH] unzip: Fix configure tests to use modern C
Date: Tue, 10 Dec 2024 13:45:15 +0100
Message-ID: <20241210124515.3286524-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 12:45:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208532

From: Khem Raj <raj.khem@gmail.com>

Newer compilers end up with errors while compiling these test snippets
and build results in failures.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...rrect-system-headers-and-prototypes-.patch | 112 ++++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/0001-configure-Add-correct-system-headers-and-prototypes-.patch

diff --git a/meta/recipes-extended/unzip/unzip/0001-configure-Add-correct-system-headers-and-prototypes-.patch b/meta/recipes-extended/unzip/unzip/0001-configure-Add-correct-system-headers-and-prototypes-.patch
new file mode 100644
index 0000000000..f7e0854cd9
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/0001-configure-Add-correct-system-headers-and-prototypes-.patch
@@ -0,0 +1,112 @@
+From 5ac5885d35257888d0e4a9dda903405314f9fc84 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 10 Aug 2022 17:53:13 -0700
+Subject: [PATCH] configure: Add correct system headers and prototypes to tests
+
+Newer compilers e.g. clang-15+ have turned stricter towards these
+warnings and turned them into errors which results in subtle failures
+during build, therefore make the testcases use the needed headers and
+modern C
+
+Upstream-Status: Inactive-Upstream
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ unix/configure | 51 +++++++++++++++++++++++++++++++++++++++-----------
+ 1 file changed, 40 insertions(+), 11 deletions(-)
+
+diff --git a/unix/configure b/unix/configure
+index 49579f3..8fd82dd 100755
+--- a/unix/configure
++++ b/unix/configure
+@@ -379,14 +379,37 @@ $CC $CFLAGS -c conftest.c >/dev/null 2>/dev/null
+ 
+ # Check for missing functions
+ # add NO_'function_name' to flags if missing
+-for func in fchmod fchown lchown nl_langinfo
+-do
+-  echo Check for $func
+-  echo "int main(){ $func(); return 0; }" > conftest.c
+-  $CC $BFLAG $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
+-  [ $? -ne 0 ] && CFLAGSR="${CFLAGSR} -DNO_`echo $func | tr '[a-z]' '[A-Z]'`"
+-done
++echo Check for fchmod
++cat > conftest.c << _EOF_
++#include <sys/stat.h>
++int main(){ fchmod(0,0); return 0; }
++_EOF_
++$CC $BFLAG $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
++[ $? -ne 0 ] && CFLAGSR="${CFLAGSR} -DNO_FCHMOD"
+ 
++echo Check for fchown
++cat > conftest.c << _EOF_
++#include <unistd.h>
++int main(){ fchown(0,0,0); return 0; }
++_EOF_
++$CC $BFLAG $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
++[ $? -ne 0 ] && CFLAGSR="${CFLAGSR} -DNO_FCHOWN"
++
++echo Check for lchown
++cat > conftest.c << _EOF_
++#include <unistd.h>
++int main(){ lchown(NULL,0,0); return 0; }
++_EOF_
++$CC $BFLAG $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
++[ $? -ne 0 ] && CFLAGSR="${CFLAGSR} -DNO_LCHOWN"
++
++echo Check for nl_langinfo
++cat > conftest.c << _EOF_
++#include <langinfo.h>
++int main(){ nl_langinfo(0); return 0; }
++_EOF_
++$CC $BFLAG $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
++[ $? -ne 0 ] && CFLAGSR="${CFLAGSR} -DNO_NL_LANGINFO"
+ # Check (seriously) for a working lchmod.
+ echo 'Check for lchmod'
+ temp_file="/tmp/unzip_test_$$"
+@@ -401,14 +424,17 @@ ln -s "${temp_link}" "${temp_file}" && \
+ rm -f "${temp_file}"
+ 
+ echo Check for memset
+-echo "int main(){ char k; memset(&k,0,0); return 0; }" > conftest.c
++cat > conftest.c << _EOF_
++#include <string.h>
++int main(){ char k; memset(&k,0,0); return 0; }
++_EOF_
+ $CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
+ [ $? -ne 0 ] && CFLAGSR="${CFLAGSR} -DZMEM"
+ 
+ echo Check for errno declaration
+ cat > conftest.c << _EOF_
+ #include <errno.h>
+-main()
++int main()
+ {
+   errno = 0;
+   return 0;
+@@ -419,6 +445,8 @@ $CC $CFLAGS -c conftest.c >/dev/null 2>/dev/null
+ 
+ echo Check for directory libraries
+ cat > conftest.c << _EOF_
++#include <sys/types.h>
++#include <dirent.h>
+ int main() { return closedir(opendir(".")); }
+ _EOF_
+ 
+@@ -523,10 +551,11 @@ fi
+ # needed for AIX (and others ?) when mmap is used
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
+ }
+ _EOF_
+-- 
+2.37.1
+
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index cf532c09d6..0f73cfaa22 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -32,6 +32,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
         file://CVE-2022-0529.patch \
         file://CVE-2022-0530.patch \
         file://0001-unix-configure-fix-detection-for-cross-compilation.patch \
+        file://0001-configure-Add-correct-system-headers-and-prototypes-.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.47.1


