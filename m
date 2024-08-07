Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D542C3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 15:43:50 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.36796.1723045425169681742
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 08:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=UFOjMFE/;
 spf=pass (domain: baylibre.com, ip: 209.85.160.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-45006bcb482so23661cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 08:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723045424; x=1723650224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6f/+p32slsHFDE8Wx/u+y0LpTVHi8hWkkzHD29Oiv8M=;
        b=UFOjMFE/wZI66PIS0UcwVmHPOYR/lovaKrxXwu/mjE2W4pii3osNt/E/iksGelgMG4
         12/fv3dfraOjAwKDdSqpjMxLRFxjR9tl5tRM0LV6ldDdD4X0NHKrZdDVNIKkAnJv+joK
         IqxYMBuEgM0Eii/BHshXLKU2kMzCGBPz5p2Yc6r64qToB3UCTOgI3Yzw5JsQ/xDLzSD2
         VH+SWtxnVEgRlW0+CsX/acIzjLoU/xAtw8h5bwc7cHCIlDcZiYgDFfnD0r/p1ji/zW3y
         TwhR2LWhm/zzqnTPD6ivsK3l8uuIjsUv09RKLqb1GlEdLGRCFXRLEjGnlJ2ElwHbV70C
         d4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723045424; x=1723650224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6f/+p32slsHFDE8Wx/u+y0LpTVHi8hWkkzHD29Oiv8M=;
        b=e9A5bOAF4SEmYYXnHGbQRt6QkmpbfTRZbqlwahn7enRvL9mSlotI25xBLmUWO06aOQ
         jsOl/EgomYKFNaHwGkVSAYeEwIuE2VgpkLB6anppQSXstm9LoMJnsISj3D4c3JXqTTE9
         AwgcoDqMyNQzeBet2kqw4uHWqRuH7RG3VrDzrk37aq1GFIu3P/yzkFJzK4MG2ngIy/3j
         np3/Gmx9dywpiVE13QZZiy88tlAJDepkcdxYXgTySlBwY5apFGftkd3Wpp9fS7myYrn1
         O1aYJPU5YiREkZ7H7gCAoNLo7L3EQLjzCPbSaH6hk3D1wSqNgwAPMG5svatmLFtoCwVz
         js6A==
X-Gm-Message-State: AOJu0Ywvrg5jibvqLOeRgvY4TibV2jNbwin7W5VRYYP5/e/wNkGrae0J
	CdXvRbLpKMzvz5zTPIEK2uKvg2Bg9UIPYAyUmyFCTcn7ojr387vvndybhwli0OuU5/OKUQ0IIsB
	H
X-Google-Smtp-Source: AGHT+IHzKgHFpaFr0CD6mN/pHksSfbAeeKX1dllKz0gSOMDlwBO/wtQj9CfNK0g0Dv4fsCX4XC7uSQ==
X-Received: by 2002:ac8:5dc6:0:b0:440:536a:5915 with SMTP id d75a77b69052e-45189245666mr265985241cf.30.1723045423909;
        Wed, 07 Aug 2024 08:43:43 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-451c86ffe9asm5770661cf.3.2024.08.07.08.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 08:43:43 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH 9/9] libassuan: upgrade 2.5.7 -> 3.0.1
Date: Wed,  7 Aug 2024 11:43:33 -0400
Message-Id: <20240807154333.533180-9-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240807154333.533180-1-tgamblin@baylibre.com>
References: <20240807154333.533180-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 15:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203088

Patch 'libassuan-add-pkgconfig-support.patch' had to be adjusted to
apply on top of 3.0.1. While doing so, the format was updated so that
it'll work more easily with git.

Changelog (git log --oneline libassuan-2.5.7..libassuan-3.0.1):

c9e9027 (tag: libassuan-3.0.1) Release 3.0.1
9e90c79 Post release updates
0351ecf (tag: libassuan-3.0.0) Release 3.0.0
1fe7aa3 Add release targets
6bef35b Update copyright notices
87f92fe Add new socket flags "linger" and "reuseaddr".
24f05d6 Spell fix in gpg-error.m4 from GnuPG.
577c1cd m4: Update gpg-error.m4.
db27c94 libassuan.m4: Fix setting/using GPG_ERROR_CONFIG.
ee9167c Always append the process identification to hello line.
d5e0aa3 Modify documentation for new release.
c1bbbe8 Fix the previous commit.
1c27538 m4: Include _AM_PATH_GPGRT_CONFIG definition.
6756482 tests: Cleanup mention of removed variable
a8c38df doc: Minor style fixes.
76816b1 build: Change the default for --with-libtool-modification.
d63bf50 build: Update libtool-patch.sed from libgpg-error.
9bb7a2a build: New configure option --with-libtool-modification.
ce35bd9 Add NEWS entries for 2.5.6 from libassuan 2.5 branch.
b975f9a Fix for v2 support: ASSUAN_REALLY_REQUIRE_V2_NPTH_SYSTEM_HOOKS
bb7aa0e New function: assuan_control.
9ce1b41 libassuan.m4: Allow use of libassuan 3 for API of version 2.
c6ae222 Update NEWS.
bf25d0e Add new pipe functions to control its server process.
c14409b socket: Don't call pre/post_syscall for bind.
dd7e0c5 build: Prepare release with API change.
c4687db Update NEWS.
782d5f8 Expose assuan_sock_accept function.
703b410 Add _assuan_pre_syscall / _assuan_post_syscall to _assuan_sock_*.
5de5774 Support larger greeting message.
413b294 Next release will be 3.0
049b800 Flush data before clearing the confidential flag.
2f0232b w32: Fix closing for non-socket HANDLE.
592f6bb w32: Fix hello_line parsing for fd passing.
c69578b w32: Always include process information in HELLO.
efccdb3 w32: Fix error return for sending fd.
8d83aea Allow use of global system hooks with API version 2.
af34d84 doc: Update documentation for the method spawn and waitpid.
316fae4 w32: File handle passing to server is now supported.
5d1cdaa Don't use ASSUAN_INVALID_PID for assuan_pid_t value.
6350f79 w32: Cleaner semantics for PID and Process handle.
f3b3ddf Fix comments.
18edc4f Fix wrong return type for functions.
6957813 tests: Use -no-fast-install LDFLAGS for Windows.
9ecbd8e Deprecate ASSUAN_SYSTEM_NPTH.
1eb66ef Allow NULL for system_hooks.
620acf6 Fix the previous commit.
223cc95 Fix calling gpgrt_get_syscall_clamp.
fb5d02d tests: Fix for POSIX machine.
7191c12 w32: Fix test header file for 64-bit Windows.
f2d829e w32: Fix pipeconnect test program for Windows.
295e334 w32: Minor fixes for ifdef/endif for W32 and W64.
17055e1 w32: Fix the semantics of sending FD, it's Windows HANDLE.
9110945 Implement timeout in assuan_sock_connect_byname.
3d8195e build: Update gpg-error.m4.
e4e54fb w32: Fix assuan_socket_connect.
a720b6c Fix make dist target
523e3cb w32: Fix confusion between process ID and process HANDLE.
05eb70c doc: Update the description about pkg-config.
ba84b78 w32: Have PROCESS_HANDLE in struct assuan_context_s.
7e6f3f0 tests: Use common code for Windows.
8962c1e tests: Add fdpassing-socket.sh script.
3297e45 w32: Support fd passing through socket.
a1f4804 w32: Support fd passing through pipe.
07adf41 Show the pid of listening process in the hello line.
870fdcf w32: Support sendfd/recvfd through pipe connection.
ce794a0 w32: Add SENDFD internal command.
27acee6 client: Only call _assuan_waitpid when it's not socket.
d769ec2 build: Prefer gpgrt-config when available.
62547ec w32: Fix make dist
6d5a2b1 Fix an explanation for socket on Windows.
0c22952 build: Update gpg-error.m4.
df6aec5 build: Remove WindowsCE support from mkheader.
6bc8a10 Silence compiler warnings.
e3b1e38 Drop WindowsCE support.
6da6a3d build: Update config.guess, config.sub, and config.rpath.
3156f29 build: Update gpg-error.m4.
5277f24 Fix the previous commit.
97516d6 Don't access NULL by wipememory.
2e310bb tests: Remove dead code
850f404 config: Remove 18 years unused variable
70b465e tests: Avoid leaking file descriptors on errors
2a5550b client: Handle inquiry from server with CONFIDENTIAL.
aafbde9 struct assuan_context_s: Move boolean fields to flags.
fd1ac5c client: Wipe the inbound buffer when CONFIDENTIAL.
89e8f26 server,client: Wipe the outbound buffer when CONFIDENTIAL.
d812e28 server: Wipe out the memory used by assuan_inquire if CONFIDENTIAL.
84ae2b1 Add assuan_sock_accept function.
c93eb90 w32: Store a flag if it's socket or not in Assuan CTX.
5b77d39 Fix API break.
9260fb1 build: Remove unused putc_unlocked.c.
0fae582 Take advantage of gpgrt_get_syscall_clamp function.
a43090e build: Fix listing m4 files.
28a40a2 w32: Fix assuan_socket_connect_fd to be usable.
a054a0a build: Better cross build support.
a8125eb Fix internal socket API to be consistent for SOCKET.
9de02ca build: When no gpg-error-config, not install libassuan-config.
eeda9ac Remove GNU Pth support.
564e0d9 w32: Fix definition of type to be generated into assuan.h.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../libassuan-add-pkgconfig-support.patch     | 35 +++++++++++--------
 ...{libassuan_2.5.7.bb => libassuan_3.0.1.bb} |  2 +-
 2 files changed, 22 insertions(+), 15 deletions(-)
 rename meta/recipes-support/libassuan/{libassuan_2.5.7.bb => libassuan_3.0.1.bb} (93%)

diff --git a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
index fe811254d3..d67087f4ac 100644
--- a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
@@ -1,6 +1,7 @@
-Add pkgconfig support to libassuan.
-This patch is rejected by upstream for the reason below:
-They think pkgconfig adds no portability and maintaining them is not worthwhile.
+From 9d28122b7e7ae3f17364e1ab97355cf5eaf14cb8 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Wed, 7 Aug 2024 11:36:26 -0400
+Subject: [PATCH] libassuan: add pkgconfig support
 
 Upstream-Status: Denied
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
@@ -8,18 +9,23 @@ Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
 forward ported to 2.4.4
 Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Refactor to apply on top of 3.0.1, including reformatting as an mbox for
+easier use.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- src/libassuan.m4 | 81 ++----------------------------------------------
- 1 file changed, 3 insertions(+), 78 deletions(-)
+ src/libassuan.m4 | 82 ++----------------------------------------------
+ 1 file changed, 3 insertions(+), 79 deletions(-)
 
 diff --git a/src/libassuan.m4 b/src/libassuan.m4
-index df50484..380a48a 100644
+index 2e98b39..404796f 100644
 --- a/src/libassuan.m4
 +++ b/src/libassuan.m4
-@@ -17,27 +17,6 @@ dnl Returns ok set to yes or no.
- dnl
+@@ -103,27 +103,6 @@ dnl
  AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
- [ AC_REQUIRE([AC_CANONICAL_HOST])
+ [ AC_REQUIRE([AC_CANONICAL_HOST])dnl
+   AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
 -  AC_ARG_WITH(libassuan-prefix,
 -              AS_HELP_STRING([--with-libassuan-prefix=PFX],
 -                             [prefix where LIBASSUAN is installed (optional)]),
@@ -31,7 +37,7 @@ index df50484..380a48a 100644
 -  fi
 -
 -  use_gpgrt_config=""
--  if test x"${LIBASSUAN_CONFIG}" = x -a x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-  if test x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
 -    if $GPGRT_CONFIG libassuan --exists; then
 -      LIBASSUAN_CONFIG="$GPGRT_CONFIG libassuan"
 -      AC_MSG_NOTICE([Use gpgrt-config as libassuan-config])
@@ -44,7 +50,7 @@ index df50484..380a48a 100644
  
    tmp=ifelse([$1], ,1:0.9.2,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
-@@ -47,59 +26,11 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
+@@ -133,60 +112,11 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
      req_libassuan_api=0
      min_libassuan_version="$tmp"
    fi
@@ -90,6 +96,7 @@ index df50484..380a48a 100644
 -
 -  if test $ok = yes; then
 -    AC_MSG_RESULT([yes ($libassuan_config_version)])
+-    AC_DEFINE(LIBASSUAN_API_REQUESTED, $req_libassuan_api, Requested API version for libassuan)
 -  else
 -    AC_MSG_RESULT(no)
 -  fi
@@ -106,7 +113,7 @@ index df50484..380a48a 100644
        if test "$tmp" -gt 0 ; then
          AC_MSG_CHECKING([LIBASSUAN API version])
          if test "$req_libassuan_api" -eq "$tmp" ; then
-@@ -115,9 +46,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
+@@ -204,9 +134,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
    if test $ok = yes; then
      if test x"$host" != x ; then
        if test -z "$use_gpgrt_config"; then
@@ -117,7 +124,7 @@ index df50484..380a48a 100644
        fi
        if test x"$libassuan_config_host" != xnone ; then
          if test x"$libassuan_config_host" != x"$host" ; then
-@@ -159,12 +88,8 @@ dnl
+@@ -248,12 +176,8 @@ dnl
  AC_DEFUN([AM_PATH_LIBASSUAN],
  [ _AM_PATH_LIBASSUAN_COMMON($1)
    if test $ok = yes; then
@@ -131,5 +138,5 @@ index df50484..380a48a 100644
    fi
    AC_SUBST(LIBASSUAN_CFLAGS)
 -- 
-2.25.1
+2.39.2
 
diff --git a/meta/recipes-support/libassuan/libassuan_2.5.7.bb b/meta/recipes-support/libassuan/libassuan_3.0.1.bb
similarity index 93%
rename from meta/recipes-support/libassuan/libassuan_2.5.7.bb
rename to meta/recipes-support/libassuan/libassuan_3.0.1.bb
index d1e622635f..0518ed75aa 100644
--- a/meta/recipes-support/libassuan/libassuan_2.5.7.bb
+++ b/meta/recipes-support/libassuan/libassuan_3.0.1.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libassuan/libassuan-${PV}.tar.bz2 \
            file://libassuan-add-pkgconfig-support.patch \
           "
 
-SRC_URI[sha256sum] = "0103081ffc27838a2e50479153ca105e873d3d65d8a9593282e9c94c7e6afb76"
+SRC_URI[sha256sum] = "c8f0f42e6103dea4b1a6a483cb556654e97302c7465308f58363778f95f194b1"
 
 BINCONFIG = "${bindir}/libassuan-config"
 
-- 
2.39.2


