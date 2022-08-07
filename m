Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E6EC19F2A
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 16:05:32 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web08.14889.1659888327032507909
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 09:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jsKBjHG9;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id w19so12598572ejc.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 09:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=nLYw13WYaRp/n6EuybdVJqzUTlkxdu7CfShsjdLC1nA=;
        b=jsKBjHG92K2rIbHQBGiBTy+1tbEzqSoIBJgFQy7Wo7FdWGr/DYowTvTdJU7glLxapj
         G+aM31rQD3n/pwmbKB3smRsyTDPi1QMcg+Vxgi2IadeJntDfphEhAyikGrcZyCqo/7QP
         8zYk4fjr64BJ3Ks0C9pajjgX177ENNJ8hbtlL1JnxvvU7wxToTChRNEsARY9iLDoiy83
         mpXO5CV9KhEQjJsRdwPbe/Afw61qDyEceKBud55pUEqXDYgFHub9IGwgGfjlPAVMYe33
         tT1SIGzppWNF79CfyP0rulWrzo6rmllamjzlxPUF0R40nPiTAinEHIAeI9lHGltpVJxJ
         4AcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=nLYw13WYaRp/n6EuybdVJqzUTlkxdu7CfShsjdLC1nA=;
        b=1QKIokkw4coMFUZ2U+HSJjd4mfuchPJGToRTMSyZ2CBB2j+Lq4sbhzKo9t5PpP3D5D
         +Wk0rE1rzn/Q4CIf0JsmMS/kYQY/lyRXqhSpXWzfeidZDK4/t257381AidAtqf+p5ze0
         b2vlHNvpcMqsraBcv2LK9po0Bxtlw9fxXSUo+xDCROmgoofOGx+O79vFYD4b93TPcxwf
         4CrT/5ZtOxbOEVxZ6PXQyoAJTjSSXZchW98jvuvS+3QA9r0I9KM9G1MPzMQjv1y6QGsB
         yiv+mrSNXl6XvPKStiqR1/oJw3Khmb0ccIhhceE6ifH29is0NiG+oqXy1PJAxN6E82TP
         CDJg==
X-Gm-Message-State: ACgBeo3hOfkTTRxTYQKeXt0mu7YiB4WQiPfO2d3xMcgeFZjS3Konguhp
	ouMDsbfapD+6GRwmSIOZUcFfRqLaeNU=
X-Google-Smtp-Source: 
 AA6agR5RRQe3ZfhsOcxqTpqz6njKbTwXQj9T1nLTOrfJ0LaVXPFVqVuO3wgEGzNFy4vveTthcaqhhA==
X-Received: by 2002:a17:907:8a04:b0:730:baa1:ac82 with SMTP id
 sc4-20020a1709078a0400b00730baa1ac82mr11051426ejc.737.1659888325354;
        Sun, 07 Aug 2022 09:05:25 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 a17-20020a170906275100b0072af2460cd6sm3910761ejd.30.2022.08.07.09.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 09:05:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] glibc: fix new upstream build issue with DEBUG_BUILD build
Date: Sun,  7 Aug 2022 18:04:45 +0200
Message-Id: <20220807160445.2446821-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <1709153253BBC9C9.7816@lists.openembedded.org>
References: <1709153253BBC9C9.7816@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 16:05:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168997

* fix SRCREV to match with glibc-2.36 tag
* refresh 0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
  (just different commit SHA in master and 2.35 branch)

* add proposed fixes for build failure with DEBUG_BUILD:
  http://errors.yoctoproject.org/Errors/Details/663898/

86_64-oe-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dss=
e  --sysroot=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/recipe=
-sysroot -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=
=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0=3D/usr/src/debug/g=
libc/2.36-r0                      -fdebug-prefix-map=3DTOPDIR/tmp-glibc/wor=
k/core2-64-oe-linux/glibc/2.36-r0=3D/usr/src/debug/glibc/2.36-r0           =
           -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/gli=
bc/2.36-r0/recipe-sysroot=3D                      -fdebug-prefix-map=3DTOPD=
IR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/recipe-sysroot-native=3D =
 -Wl,-z,relro,-z,now -fuse-ld=3Dbfd  -nostdlib -nostartfiles -r -o TOPDIR/t=
mp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/build-x86_64-oe-linux/elf/lib=
rtld.os '-Wl,-(' TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/buil=
d-x86_64-oe-linux/elf/dl-allobjs.os TOPDIR/tmp-glibc/work/core2-64-oe-linux=
/glibc/2.36-r0/build-x86_64-oe-linux/elf/rtld-libc.a -lgcc '-Wl,-)' \
	  -Wl,-Map,TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/build-x86=
_64-oe-linux/elf/librtld.os.map
x86_64-oe-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Ds=
se  --sysroot=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/recip=
e-sysroot -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=
=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0=3D/usr/src/debug/g=
libc/2.36-r0                      -fdebug-prefix-map=3DTOPDIR/tmp-glibc/wor=
k/core2-64-oe-linux/glibc/2.36-r0=3D/usr/src/debug/glibc/2.36-r0           =
           -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/gli=
bc/2.36-r0/recipe-sysroot=3D                      -fdebug-prefix-map=3DTOPD=
IR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/recipe-sysroot-native=3D =
 -Wl,-z,relro,-z,now -fuse-ld=3Dbfd  -nostdlib -nostartfiles -shared -o TOP=
DIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/build-x86_64-oe-linux/el=
f/ld.so.new		\
	  -Wl,-z,relro -Wl,-z,defs -Wl,-z,now	\
	  -Wl,-z,pack-relative-relocs \
	  TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/build-x86_64-oe-li=
nux/elf/librtld.os -Wl,--version-script=3DTOPDIR/tmp-glibc/work/core2-64-oe=
-linux/glibc/2.36-r0/build-x86_64-oe-linux/ld.map		\
	  -Wl,-soname=3Dld-linux-x86-64.so.2
TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/recipe-sysroot-native=
/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/=
12.1.0/ld.bfd: TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/build-=
x86_64-oe-linux/elf/librtld.os: in function `_dl_load_cache_lookup':
/usr/src/debug/glibc/2.36-r0/git/elf/dl-cache.c:513: undefined reference to=
 `strcpy'
collect2: error: ld returned 1 exit status

  introduced in 2.36 version, with:
  https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff;h=3D6b9006bfb0

  upstream report with this fix proposed:
  https://sourceware.org/bugzilla/show_bug.cgi?id=3D29454

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc     |  2 +-
 ...lement-a-useful-version-of-_startup_.patch |  8 ++---
 .../0002-x86-Fix-STRCPY-symbol-name.patch     | 23 ++++++++++++
 .../glibc/0003-Add-RTLD-hook-for-strcpy.patch | 35 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.36.bb         |  2 ++
 5 files changed, 65 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0002-x86-Fix-STRCPY-symbo=
l-name.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0003-Add-RTLD-hook-for-st=
rcpy.patch

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/=
glibc/glibc-version.inc
index b6da2c345d..0fa6ac39c4 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?=3D "release/2.36/master"
 PV =3D "2.36"
-SRCREV_glibc ?=3D "c74bb93cfdb04d49155b0e30983a3c866167bbca"
+SRCREV_glibc ?=3D "c804cd1c00adde061ca51711f63068c103e94eef"
 SRCREV_localedef ?=3D "794da69788cbf9bf57b59a852f9f11307663fa87"
=20
 GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-us=
eful-version-of-_startup_.patch b/meta/recipes-core/glibc/glibc/0001-Revert=
-Linux-Implement-a-useful-version-of-_startup_.patch
index 2421a63605..befac35e84 100644
--- a/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-ve=
rsion-of-_startup_.patch
+++ b/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-ve=
rsion-of-_startup_.patch
@@ -1,13 +1,13 @@
-From 6b8959add09e425df262bf9178b39ca35bc4003c Mon Sep 17 00:00:00 2001
+From 464f0a4f53fc68758760a34199a257d0ec0775d4 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sun, 24 Jul 2022 19:41:41 +0200
+Date: Sun, 7 Aug 2022 12:51:48 +0200
 Subject: [PATCH] Revert "Linux: Implement a useful version of _startup_fat=
al"
=20
-This reverts commit 2d05ba7f8ef979947e910a37ae8115a816eb4d08.
+This reverts commit a2a6bce7d7e52c1c34369a7da62c501cc350bc31.
+
 Upstream-Status: Inappropriate [temporary work around]
=20
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
 ---
  sysdeps/unix/sysv/linux/i386/startup.h | 23 ++++++++++++---
  sysdeps/unix/sysv/linux/ia64/startup.h | 22 ---------------
diff --git a/meta/recipes-core/glibc/glibc/0002-x86-Fix-STRCPY-symbol-name.=
patch b/meta/recipes-core/glibc/glibc/0002-x86-Fix-STRCPY-symbol-name.patch
new file mode 100644
index 0000000000..326aca6e0c
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0002-x86-Fix-STRCPY-symbol-name.patch
@@ -0,0 +1,23 @@
+From 67aa386a4b5ff54994e157875f3abe99763b5bf7 Mon Sep 17 00:00:00 2001
+From: Noah Goldstein <goldstein.w.n@gmail.com>
+Date: Sun, 7 Aug 2022 22:42:30 +0800
+Subject: [PATCH] x86: Fix STRCPY symbol name
+
+Upstream-Status: Submitted [https://sourceware.org/bugzilla/show_bug.cgi?i=
d=3D29454]
+---
+ sysdeps/x86_64/multiarch/strcpy-sse2.S | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysdeps/x86_64/multiarch/strcpy-sse2.S b/sysdeps/x86_64/multi=
arch/strcpy-sse2.S
+index e29b411314..d6b9bae5f8 100644
+--- a/sysdeps/x86_64/multiarch/strcpy-sse2.S
++++ b/sysdeps/x86_64/multiarch/strcpy-sse2.S
+@@ -22,7 +22,7 @@
+=20
+ # include <sysdep.h>
+=20
+-# ifndef STPCPY
++# ifndef STRCPY
+ #  define STRCPY __strcpy_sse2
+ # endif
+=20
diff --git a/meta/recipes-core/glibc/glibc/0003-Add-RTLD-hook-for-strcpy.pa=
tch b/meta/recipes-core/glibc/glibc/0003-Add-RTLD-hook-for-strcpy.patch
new file mode 100644
index 0000000000..64a7a307fe
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0003-Add-RTLD-hook-for-strcpy.patch
@@ -0,0 +1,35 @@
+From 64351e4b48a02c453ca9ed667d358ad44df6bf93 Mon Sep 17 00:00:00 2001
+From: Noah Goldstein <goldstein.w.n@gmail.com>
+Date: Sun, 7 Aug 2022 23:54:19 +0800
+Subject: [PATCH] Add RTLD hook for strcpy
+
+Upstream-Status: Submitted [https://sourceware.org/bugzilla/show_bug.cgi?i=
d=3D29454]
+---
+ sysdeps/x86_64/multiarch/rtld-strcpy.S | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+ create mode 100644 sysdeps/x86_64/multiarch/rtld-strcpy.S
+
+diff --git a/sysdeps/x86_64/multiarch/rtld-strcpy.S b/sysdeps/x86_64/multi=
arch/rtld-strcpy.S
+new file mode 100644
+index 0000000000..19439c553d
+--- /dev/null
++++ b/sysdeps/x86_64/multiarch/rtld-strcpy.S
+@@ -0,0 +1,18 @@
++/* Copyright (C) 2022 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include "../strcpy.S"
diff --git a/meta/recipes-core/glibc/glibc_2.36.bb b/meta/recipes-core/glib=
c/glibc_2.36.bb
index f4504282f6..97bab9c381 100644
--- a/meta/recipes-core/glibc/glibc_2.36.bb
+++ b/meta/recipes-core/glibc/glibc_2.36.bb
@@ -52,6 +52,8 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=
=3Dglibc \
            file://0024-Avoid-hardcoded-build-time-paths-in-the-output-bina=
r.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup=
_.patch \
+           file://0002-x86-Fix-STRCPY-symbol-name.patch \
+           file://0003-Add-RTLD-hook-for-strcpy.patch \
            "
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
--=20
2.35.1


