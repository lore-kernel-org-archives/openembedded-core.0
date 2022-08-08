Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B388C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 15:55:39 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.27464.1659974130492224975
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 08:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b4Wo/eyX;
 spf=pass (domain: gmail.com, ip: 209.85.208.41,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id z2so11933855edc.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 08:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=g4aYDrU4eoq85sK+gcFPF14oNkzS6dsy29CWn+EuC9g=;
        b=b4Wo/eyXhqinwv/a8rtso2RnH/9aqOa/MiLhOcSplwNMfYaRGZ5u17h3oPp5O0mIRN
         KUkzvUIq1UIssFkoEuxL8WsqCXZuGhgXvZiyWFIIH2tB/Zpl4F3eLgybyiKZdIKUR03M
         baMdALURvyfet/FYP1Npo/93ka7AdLP9sTsMMlb3WOS05VmT55OIMj1uyy/zCNcyn6e3
         U8gqgOhOatneC6XqmE7QdqGMfQhmYn/4wIX3HPWM7HGRY0cA0lnwEm6aNQd7TjpUUt/6
         4M0PK2qaOEy+HZNEr9pveE/ZXqX0vZ5Jatw2HuxqUqTN0hj75apVW3vSo9ujpQAI8jHi
         USXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=g4aYDrU4eoq85sK+gcFPF14oNkzS6dsy29CWn+EuC9g=;
        b=sU6SLUjhccenV4Urgp35ChBBnOCqWqkeyHOFx14GDNNqkTO7FE6OK4PkiJqfvlv72H
         flqqWujgAzQGvE2XSn8K3HXJlQhazixTfx7ltn01qFIBrhuRuvxri5PpvNboWaksRQRn
         2/Cid4mSUhg/I/6wqSyDM7538b7Dv1S4rR+2wAsAX/iLxaEX6s5UNgA04Iqkfs/u6eIk
         p2uNmrZwJ74pp0b5VpJgaaNJAYq6sARYUdaWWoaHek91nh766lMYJNWIQs0HzOYYf0To
         gaCeoYYZsSYVzq2KmIrUOI9AXE0/K3VDH6IDWWfpVYivqgcPoz2sc5hVsM8wUxgpTDZe
         /o7w==
X-Gm-Message-State: ACgBeo0dNdcRj6MywvSqyhjJW3U3ISEEqLyucg8wSlgj32py/kXiJALb
	I8uEXdbdNZptp4fwgJLezeeh8+zAtLw=
X-Google-Smtp-Source: 
 AA6agR4n+ygVJ5j3hR337qY/BsWdLplGAdwBC+O5QxsdMJ8fHZTEcA/v+cIPS2dZGLi8pWsb3p+gGw==
X-Received: by 2002:a05:6402:4028:b0:43a:8d67:faeb with SMTP id
 d40-20020a056402402800b0043a8d67faebmr18439064eda.90.1659974128710;
        Mon, 08 Aug 2022 08:55:28 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 w10-20020a170906d20a00b007262a1c8d20sm24569ejz.19.2022.08.08.08.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 08:55:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCHv2 2/2] glibc: fix new upstream build issue with DEBUG_BUILD
 build
Date: Mon,  8 Aug 2022 17:54:52 +0200
Message-Id: <20220808155452.3596326-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 15:55:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169095

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
 v2: refreshed the 2nd patch with the version which was Acked on
     libc-alpha ML https://sourceware.org/pipermail/libc-alpha/2022-August/=
141290.html

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
index 0000000000..2d14a4c619
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
index 0000000000..1b347b3322
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
index c64b65db3e..2db3994cf7 100644
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
2.35.1


