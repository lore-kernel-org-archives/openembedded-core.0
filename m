Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF45FC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 05:43:45 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web12.8502.1660023825211399766
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 22:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eWONFPzw;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id p18so10432220plr.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 22:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=qx3Uynr+jpU2AMCMO83cw3RpFIZFU571CPzESJ963QQ=;
        b=eWONFPzw4cRYn3ucQb3nLGinFcwdPZY/Aq8cNJy4YD+8am6Xz0WyRe9CPiWT6sqjT5
         HiVSZnulsqrWdMi5HZjgs3vJEwvgY4rOZHCMievp+C8c3grreAyJArTTncq0J2bMvwLO
         Etil9G7z33FkTwmp0YOTZRLa8mpnFk41qQu/knY+hTJdwWerKUfhJMOoy1gdl8uiU05U
         PAxvisXwADtr0vaLnYRyGRuMVZ8RD2MlMUn5COvokBeYmOjJEoR0D26Bs+218U7FamPJ
         tZbK+X9wyLxnMBqYZLR5wigM9dXyjcXiLqi5xFFDer25NaENKOlpZIZg7eZuIvvQBPG2
         2dNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=qx3Uynr+jpU2AMCMO83cw3RpFIZFU571CPzESJ963QQ=;
        b=5/45p7KE70ULPj2VhgxpWDOUApbkJIhlrRyH4Ib/ic6bZjP9S+Xrfwr8ooD9nNAmzZ
         gbTKlckiKo6C1NTaEPsiknejSNeUhbzTCeopOgXyQMUaU4VH6BA26DzSZEgtpXhfeL+5
         nM9JmF3JqhvBt7kqslw60HpTmcXTI5RWIm/yiwUo2OnFMsnEhaLgOmNxldfKfQIMKI2Z
         gqGuDxb+3oLobQy18sjiGEzJTEQYhPQuLPFWAGseSISfl8YNPFU2NMvOvWTorQZrfyO8
         pXivDo2nl7rkhpEQIN4GUtQCPA1o6TtnGzaLKMhBKu9/mOsb9K7X6+ZKgRDavZAr5TPp
         uGPg==
X-Gm-Message-State: ACgBeo0yHPIuKBevXX51WOxGlzA12hAew0d4KGXnOdG+LtcmoTCfxiMz
	z0w6WcSUDS8Dm8jnE6kvhZYb2Zy/2/E=
X-Google-Smtp-Source: 
 AA6agR5XyMuLs4YOMAnLZ6Y84VKHMoRbpwMCZAMVOt+6zgqgGfPExqBm3RRRVQKjujHa3Ukqxi4jwQ==
X-Received: by 2002:a17:90a:af82:b0:1f5:5727:d43 with SMTP id
 w2-20020a17090aaf8200b001f557270d43mr23859282pjq.20.1660023824181;
        Mon, 08 Aug 2022 22:43:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 x64-20020a17090a6c4600b001f7a4ea4fd5sm273155pjj.39.2022.08.08.22.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 22:43:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V3 2/2] glibc: fix new upstream build issue with DEBUG_BUILD
 build
Date: Mon,  8 Aug 2022 22:43:40 -0700
Message-Id: <20220809054340.822999-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220809054340.822999-1-raj.khem@gmail.com>
References: <20220809054340.822999-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 05:43:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169136

From: Martin Jansa <martin.jansa@gmail.com>

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: Rebased, no code changes

 ...define-STRCPY-guard-in-strcpy-sse2.S.patch | 28 ++++++++++++++++
 ...ace-strcpy-call-with-memcpy-BZ-29454.patch | 32 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.36.bb         |  4 ++-
 3 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCP=
Y-guard-in-strcpy-sse2.S.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-c=
all-with-memcpy-BZ-29454.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard=
-in-strcpy-sse2.S.patch b/meta/recipes-core/glibc/glibc/0026-x86-Fix-define=
-STRCPY-guard-in-strcpy-sse2.S.patch
new file mode 100644
index 00000000000..2d14a4c6196
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-str=
cpy-sse2.S.patch
@@ -0,0 +1,28 @@
+From 1d4d09d9dff96f46674262534ce1f0e51a8252cb Mon Sep 17 00:00:00 2001
+From: Noah Goldstein <goldstein.w.n@gmail.com>
+Date: Sun, 7 Aug 2022 22:42:30 +0800
+Subject: [PATCH] x86: Fix `#define STRCPY` guard in strcpy-sse2.S
+
+`#ifndef STPCPY` is incorrect for checking if `STRCPY` is already
+defined.  It doesn't end up mattering as the whole check is
+guarded by `#if IS_IN (libc)` but is incorrect none the less.
+
+Upstream-Status: Submitted [https://sourceware.org/bugzilla/show_bug.cgi?i=
d=3D29454 https://sourceware.org/pipermail/libc-alpha/2022-August/141289.ht=
ml]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
diff --git a/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-wit=
h-memcpy-BZ-29454.patch b/meta/recipes-core/glibc/glibc/0027-elf-Replace-st=
rcpy-call-with-memcpy-BZ-29454.patch
new file mode 100644
index 00000000000..1b347b33226
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcp=
y-BZ-29454.patch
@@ -0,0 +1,32 @@
+From f0e36cf0b348dbc990af9f869196710ca89c28c2 Mon Sep 17 00:00:00 2001
+From: Noah Goldstein <goldstein.w.n@gmail.com>
+Date: Sun, 7 Aug 2022 23:54:19 +0800
+Subject: [PATCH] elf: Replace `strcpy` call with `memcpy` [BZ #29454]
+
+GCC normally does this optimization for us in
+strlen_pass::handle_builtin_strcpy but only for optimized
+build. To avoid needing to include strcpy.S in the rtld build to
+support the debug build, just do the optimization by hand.
+
+Upstream-Status: Submitted [https://sourceware.org/bugzilla/show_bug.cgi?i=
d=3D29454 https://sourceware.org/pipermail/libc-alpha/2022-August/141290.ht=
ml]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ elf/dl-cache.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/elf/dl-cache.c b/elf/dl-cache.c
+index c02a95d9b5..03a6d236e8 100644
+--- a/elf/dl-cache.c
++++ b/elf/dl-cache.c
+@@ -513,8 +513,9 @@ _dl_load_cache_lookup (const char *name)
+      we are accessing. Therefore we must make the copy of the
+      mapping data without using malloc.  */
+   char *temp;
+-  temp =3D alloca (strlen (best) + 1);
+-  strcpy (temp, best);
++  size_t best_len =3D strlen (best) + 1;
++  temp =3D alloca (best_len);
++  memcpy (temp, best, best_len);
+   return __strdup (temp);
+ }
+=20
diff --git a/meta/recipes-core/glibc/glibc_2.36.bb b/meta/recipes-core/glib=
c/glibc_2.36.bb
index c64b65db3e3..2db3994cf7b 100644
--- a/meta/recipes-core/glibc/glibc_2.36.bb
+++ b/meta/recipes-core/glibc/glibc_2.36.bb
@@ -51,7 +51,9 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=
=3Dglibc \
            file://0023-fix-create-thread-failed-in-unprivileged-process-BZ=
-.patch \
            file://0024-Avoid-hardcoded-build-time-paths-in-the-output-bina=
r.patch \
            file://0025-Revert-Linux-Implement-a-useful-version-of-_startup=
_.patch \
-           "
+           file://0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch \
+           file://0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch \
+"
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
=20
--=20
2.37.1


