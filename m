Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 018E1C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 07:32:41 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16050.1782804759458508424
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 00:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gw1Lm1+p;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-474303f3c72so1047488f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 00:32:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782804757; cv=none;
        d=google.com; s=arc-20260327;
        b=iRwXNEd2P+t73zQSGNCsU7Nqj0XHsPxXPLhYCCoDAFl27KjHLHRomUw23q0rqDJzV6
         puuyFgwxOBN9So+jNCQnKdm5NrDWsVUVKtTtHu+i2nwY6drtBRUBDyyUNpLRKDfzH3NT
         P10fcIOc1N0bFbP1sHOHdvnIQSnC1e0PPB3Omnn2O+c/1TD7zrJRbR+l0CAXAMXfzXGH
         SkHXjsjvKXOuRwumAMvzrTMIkmsvoQaKa09/1Uc+Sk78d6T1qbsqwy568ihG8QF+ZQD2
         hiRl9ZBukIHi1iS0SkHp2fqczMAP+tt74cVmmbnvqhY6IPlDOPzyuJo8Zhn2s3y8s3xN
         bLug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GnFIwHTy7XJYTlHom1vrO2VBEdRiMeSZA0kWRJd5F2k=;
        fh=EtlSLjsLd+d+BSasJA++D8xfpZxPsN7JKw2KbdS9cnQ=;
        b=aKUQnsPESyGwmIMrd5x8Hlmn6dFQsfYclAbOgUijlVRnuaqwnF2b5KhtkZlLOQ3lCh
         M9fFz29PFzELDn1a1HyaHYKDGZeshLTtuB21RJItgMUo9Xc0nvvGB86pRAFxeD531xgl
         xOPSpZR4fldyhzMvf6QkikPmOx5fBGQxtFvD8Ksfes6eI5Zeokv/54Qp5KhZ/EsMhrJ2
         QSV9jcRyQ3a/XM4Vs19s4Kc8PiF1mRdMxP8L9hkp+FnOM2cK/SHfBYeC7Ipn03HYTggA
         8jeMe2UTg/1vDqXsznlh0aKWgkDDhu6XaX5ohYWjWuqcTKbRoixhmEcGHRbXDafSz2pP
         9KEA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782804757; x=1783409557; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GnFIwHTy7XJYTlHom1vrO2VBEdRiMeSZA0kWRJd5F2k=;
        b=gw1Lm1+pNmMH0wFFrHdzLX43AhEJlFQfwoi9omsVs0Za73rGBddKpf6SnHrn7xfjLk
         IYYYFD5KgzWyqRTuQOp0WiN7YwEDjzNnCyWUoofLBDt4LIU8VvlS5/g6mVXsgRRA231G
         4rPca9nw/LqmWQIbPOjQZmJjbYlwH+6OUdycQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782804757; x=1783409557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnFIwHTy7XJYTlHom1vrO2VBEdRiMeSZA0kWRJd5F2k=;
        b=CxALAcuPAK3onBffVCJIVKGo5vb0Vt4AOJc+tHbRy8eHR2110zCueaACZhsum7Uey1
         Ec/JW0yB0L61phvIRGHxF/cxeWgicRPCSzRA323eMAZ4oDfatzJckBmvIyjxyqNXMIg2
         vUG2Y9T3TFk+I85XttLkixR/kbTtE2YNG1ON7965asVLjHbP/dWDMzSDdahZoy1cmMC6
         HH/TvWADJEtYXLWPpjs3Ws5wpyrBIfoinFlSmqd/JUKzpUL9f0IZLVpj7zPWjgqcppBY
         nvjJTlKFmrlQw8siIPAGSOLp2VCXBQ9dG9Lb4SGfALjppHFmssEmZXU1bV6Ro2vA4LBv
         lQ7w==
X-Gm-Message-State: AOJu0Yw1dkYKi2ATarjJKHQooO/Aw0z0m4nNG2UbDf6znswK1YMs2LN0
	sOuvp9C7i0oGu6ylp8YMPYU4UX/m3x6mUO8ox/bZmVpixlUi2vZ+d/sD0R30Q+SbJzTCSAC+fW1
	3t1pyEpdnzW6cw7A6nrdJ13h0N3NkzofFLyBbFxjQ3w==
X-Gm-Gg: AfdE7ckc7eZw6yN5ZHd6RRiUPgkdrlD8cxNuGEbvthAJWjoZjvDi4FoJ5/r08G8m/K7
	6DW6FE76VP2H1c5f7eC9SvSsvSUZz8zSlV7u8gzq0GuZkO7hYU2B6y1RtZkHdEgbsouSH/COIoo
	UqRLvWwypLNqkL7oKCx2llbOdjtIQJz4BbXwZ5X4mUdmYpRcuwvdA5Sm7m6ZImIg9/TvTEiPj23
	s6B5SDfDF1VcO14Nw45WAonP1QXY0hh27lbyGjAQX4k+cTWzuGp5HgxkqwrqlbpNh/U3kX59tX8
	tgcfnLBiilREVTGwLWdxqycirWH5lA==
X-Received: by 2002:a05:600c:c0c1:b0:490:b06a:649e with SMTP id
 5b1f17b1804b1-493b82b8b3emr30796645e9.25.1782804756898; Tue, 30 Jun 2026
 00:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260630071906.1274019-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260630071906.1274019-1-Deepesh.Varatharajan@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 30 Jun 2026 09:32:10 +0200
X-Gm-Features: AVVi8CeszaR5Yev_E-DPA_3x-nZgLDYoVrdrn9z50Utyq4sU8LaiEbYfxKYwtPk
Message-ID: <CAMSfU+5ynmjEwTpVh-N-+a-L1nF9hADu73QeKuBDeUX1-OtTMA@mail.gmail.com>
Subject: Re: [OE-core] [wrynose][PATCH] gdb: Upgrade 17.1 -> 17.2
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="0000000000003d412906557394e7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 07:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239859

--0000000000003d412906557394e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 30 juin 2026 =C3=A0 09:19, Varatharajan, Deepesh via
lists.openembedded.org <deepesh.varatharajan=3D
windriver.com@lists.openembedded.org> a =C3=A9crit :

> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> GDB 17.2 brings the following fixes and enhancements over GDB 17.1:
>
> https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dblob_plain=
;f=3Dgdb/NEWS;hb=3Dgdb-17.2-release


"enhancements" =3D> That sounds like something that is *not* acceptable und=
er
stable policy. Did you check?

>
>
>  * PR dap/33228 ([gdb/dap] error while listing register children)
>
>  * PR gdb/33737 (gdb --help says 'For more information, type "stream"
>    from within GDB', but "stream" is not a defined command)
>
>  * PR build/33747 (Incompatible with MUSL libc: no member named 'c_ospeed=
'
>    in 'termios')
>
>  * PR gdb/33748 (gdb17 regression with displaying ANSI colors)
>
>  * PR gdb/33753 (Out-of-bounds writes in string_{v}printf -- threads
>    and static data don't mix)
>
>  * PR cli/33761 (Setting style colors is broken on MS-Windows)
>
>  * PR gdb/33768 (Loading compressed GDB scripts from .debug_gdb_scripts
> fails)
>
>  * PR symtab/33775 ([gdb/symtab] data race in
>    dwarf2_per_cu::{set_addr_size,set_offset_size,set_ref_addr_size})
>
>  * PR symtab/33777 ([gdb/symtab] dw2_get_file_names doesn't cache result
>    for dummy CU)
>
>  * PR symtab/33825 ([dwz] Extremely slow symbol lookup with DWZ-compresse=
d
>    debug info (thousands of partial units))
>
>  * PR testsuite/33845 (gdb: There are 4 unexpected failures in
>    breakpoint-in-ro-region.exp)
>
>  * PR gdb/33872 (`skip -gfile` has inverted logic)
>
>  * PR gdb/33926 (GDB 17.1 AArch64: redefinition of user_gcs struct on mus=
l)
>
>  * PR breakpoints/34112 (rbreak `file:regex` sets breakpoints for matches
>    outside of `file` [reproducer attached])
>
> Drop patches merged upstream:
>   * 0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
>   * 0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  ...ian_17.1.bb =3D> gdb-cross-canadian_17.2.bb} |   0
>  .../{gdb-cross_17.1.bb =3D> gdb-cross_17.2.bb}  |   0
>  meta/recipes-devtools/gdb/gdb.inc             |   4 +-
>  ...-ser-unix-modernize-Linux-custom-bau.patch | 248 ------------------
>  ...ux-Fix-build-failure-on-musl-systems.patch | 196 --------------
>  .../gdb/{gdb_17.1.bb =3D> gdb_17.2.bb}          |   0
>  6 files changed, 1 insertion(+), 447 deletions(-)
>  rename meta/recipes-devtools/gdb/{gdb-cross-canadian_17.1.bb =3D>
> gdb-cross-canadian_17.2.bb} (100%)
>  rename meta/recipes-devtools/gdb/{gdb-cross_17.1.bb =3D> gdb-cross_17.2.=
bb}
> (100%)
>  delete mode 100644
> meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Li=
nux-custom-bau.patch
>  delete mode 100644
> meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on=
-musl-systems.patch
>  rename meta/recipes-devtools/gdb/{gdb_17.1.bb =3D> gdb_17.2.bb} (100%)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb
> b/meta/recipes-devtools/gdb/gdb-cross-canadian_17.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb
> rename to meta/recipes-devtools/gdb/gdb-cross-canadian_17.2.bb
> diff --git a/meta/recipes-devtools/gdb/gdb-cross_17.1.bb
> b/meta/recipes-devtools/gdb/gdb-cross_17.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross_17.1.bb
> rename to meta/recipes-devtools/gdb/gdb-cross_17.2.bb
> diff --git a/meta/recipes-devtools/gdb/gdb.inc
> b/meta/recipes-devtools/gdb/gdb.inc
> index d367486d02..cbb5885459 100644
> --- a/meta/recipes-devtools/gdb/gdb.inc
> +++ b/meta/recipes-devtools/gdb/gdb.inc
> @@ -13,7 +13,5 @@ SRC_URI =3D "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
>             file://0006-Fix-invalid-sigprocmask-call.patch \
>
> file://0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
>
> file://0008-Add-fix-for-packages-that-are-not-compatible-with-C2.patch \
> -
>  file://0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch \
> -
>  file://0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "14996f5f74c9f68f5a543fdc45bca7800207f91f92aeea6c2e791822c7c6d876"
> +SRC_URI[sha256sum] =3D
> "1c036c0d72e4b3d1fb5c94c88632add6f9d76f4d7c4d2ea793c12a9f19a3228c"
> diff --git
> a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-=
Linux-custom-bau.patch
> b/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-=
Linux-custom-bau.patch
> deleted file mode 100644
> index 30d22b21f9..0000000000
> ---
> a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-=
Linux-custom-bau.patch
> +++ /dev/null
> @@ -1,248 +0,0 @@
> -From 1a77c71303b552140613d49595baebdff1a4716e Mon Sep 17 00:00:00 2001
> -From: Sunil Dora <sunilkumar.dora@windriver.com>
> -Date: Tue, 17 Mar 2026 01:58:55 -0700
> -Subject: [PATCH] PR gdb/33747: gdb/ser-unix: modernize Linux custom baud
> rate
> - support
> -
> -The Linux custom baud rate implementation previously accessed the
> -struct termios members c_ispeed and c_ospeed directly. These fields
> -exist in glibc but are not exposed by musl, causing builds to fail on
> -musl-based systems.
> -
> -Update set_custom_baudrate_linux to use a capability-based approach,
> -with three distinct code paths:
> -
> -1) If POSIX cfsetispeed/cfsetospeed accept arbitrary baud rates
> -   (HAVE_CFSETSPEED_ARBITRARY), use them to set input and output
> -   speeds.
> -
> -2) Else if Linux termios2 interface is available (TCGETS2/BOTHER),
> -   use it to support arbitrary baud rates.
> -
> -3) Else if legacy struct termios supports c_ispeed/c_ospeed, use
> -   the TCGETS/TCSETS fallback (primarily for glibc on older
> -   architectures).
> -
> -4) Otherwise, emit an error indicating that custom baud rates are
> -   unsupported on this platform.
> -
> -This preserves existing behavior on glibc systems while restoring
> -build compatibility with musl and other libc implementations.
> -
> -Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=3D33747
> -
> -Upstream-Status: Submitted [
> https://sourceware.org/pipermail/gdb-patches/2026-March/225952.html]
> -
> -Suggested-by: Kevin Buettner <kevinb@redhat.com>
> -Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
> -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ----
> - gdb/config.in    |  6 ++++++
> - gdb/configure    | 52 +++++++++++++++++++++++++++++++++++++++++++++
> - gdb/configure.ac | 22 +++++++++++++++++++
> - gdb/ser-unix.c   | 55 ++++++++++++++++++++++++++++++++++--------------
> - 4 files changed, 119 insertions(+), 16 deletions(-)
> -
> -diff --git a/gdb/config.in b/gdb/config.in
> -index efc3100cb9e..b2469c8dabd 100644
> ---- a/gdb/config.in
> -+++ b/gdb/config.in
> -@@ -110,6 +110,9 @@
> -    the CoreFoundation framework. */
> - #undef HAVE_CFPREFERENCESCOPYAPPVALUE
> -
> -+/* Define if cfsetispeed/cfsetospeed accept arbitrary baud rates */
> -+#undef HAVE_CFSETSPEED_ARBITRARY
> -+
> - /* Define if compiling support to gdb compile. */
> - #undef HAVE_COMPILE
> -
> -@@ -517,6 +520,9 @@
> - /* Define to 1 if `st_blocks' is a member of `struct stat'. */
> - #undef HAVE_STRUCT_STAT_ST_BLOCKS
> -
> -+/* Define to 1 if `c_ospeed' is a member of `struct termios'. */
> -+#undef HAVE_STRUCT_TERMIOS_C_OSPEED
> -+
> - /* Define to 1 if `td_pcb' is a member of `struct thread'. */
> - #undef HAVE_STRUCT_THREAD_TD_PCB
> -
> -diff --git a/gdb/configure b/gdb/configure
> -index d0bdba6eb36..8a0e2fa2771 100755
> ---- a/gdb/configure
> -+++ b/gdb/configure
> -@@ -27336,6 +27336,58 @@ if test "$ac_res" !=3D no; then :
> - fi
> -
> -
> -+# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rates.
> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether
> cfsetispeed/cfsetospeed accept arbitrary baud rates" >&5
> -+$as_echo_n "checking whether cfsetispeed/cfsetospeed accept arbitrary
> baud rates... " >&6; }
> -+if ${gdb_cv_cfsetspeed_arbitrary+:} false; then :
> -+  $as_echo_n "(cached) " >&6
> -+else
> -+
> -+  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> -+/* end confdefs.h.  */
> -+#include <termios.h>
> -+int
> -+main ()
> -+{
> -+
> -+       #if B9600 !=3D 9600
> -+       #error B-constants are not numeric symbols
> -+       #endif
> -+
> -+  ;
> -+  return 0;
> -+}
> -+_ACEOF
> -+if ac_fn_c_try_compile "$LINENO"; then :
> -+  gdb_cv_cfsetspeed_arbitrary=3Dyes
> -+else
> -+  gdb_cv_cfsetspeed_arbitrary=3Dno
> -+fi
> -+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> -+
> -+fi
> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result:
> $gdb_cv_cfsetspeed_arbitrary" >&5
> -+$as_echo "$gdb_cv_cfsetspeed_arbitrary" >&6; }
> -+
> -+if test "$gdb_cv_cfsetspeed_arbitrary" =3D yes; then
> -+
> -+$as_echo "#define HAVE_CFSETSPEED_ARBITRARY 1" >>confdefs.h
> -+
> -+fi
> -+
> -+# Check for members required by the legacy Linux custom baud rate path.
> -+ac_fn_c_check_member "$LINENO" "struct termios" "c_ospeed"
> "ac_cv_member_struct_termios_c_ospeed" "#include <termios.h>
> -+"
> -+if test "x$ac_cv_member_struct_termios_c_ospeed" =3D xyes; then :
> -+
> -+cat >>confdefs.h <<_ACEOF
> -+#define HAVE_STRUCT_TERMIOS_C_OSPEED 1
> -+_ACEOF
> -+
> -+
> -+fi
> -+
> -+
> -
> -
> - # Check whether --with-jit-reader-dir was given.
> -diff --git a/gdb/configure.ac b/gdb/configure.ac
> -index 52924106bca..26e8d1ee276 100644
> ---- a/gdb/configure.ac
> -+++ b/gdb/configure.ac
> -@@ -733,6 +733,28 @@ AC_CONFIG_FILES([jit-reader.h:jit-reader.in])
> -
> - AC_SEARCH_LIBS(dlopen, dl)
> -
> -+# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rates.
> -+AC_CACHE_CHECK([whether cfsetispeed/cfsetospeed accept arbitrary baud
> rates],
> -+  [gdb_cv_cfsetspeed_arbitrary], [
> -+  AC_COMPILE_IFELSE(
> -+    [AC_LANG_PROGRAM([[#include <termios.h>]],
> -+      [[
> -+       #if B9600 !=3D 9600
> -+       #error B-constants are not numeric symbols
> -+       #endif
> -+      ]])],
> -+    [gdb_cv_cfsetspeed_arbitrary=3Dyes],
> -+    [gdb_cv_cfsetspeed_arbitrary=3Dno])
> -+])
> -+
> -+if test "$gdb_cv_cfsetspeed_arbitrary" =3D yes; then
> -+  AC_DEFINE([HAVE_CFSETSPEED_ARBITRARY], [1],
> -+           [Define if cfsetispeed/cfsetospeed accept arbitrary baud
> rates])
> -+fi
> -+
> -+# Check for members required by the legacy Linux custom baud rate path.
> -+AC_CHECK_MEMBERS([struct termios.c_ospeed], [], [], [[#include
> <termios.h>]])
> -+
> - GDB_AC_WITH_DIR([JIT_READER_DIR], [jit-reader-dir],
> -                 [directory to load the JIT readers from],
> -                 [${libdir}/gdb])
> -diff --git a/gdb/ser-unix.c b/gdb/ser-unix.c
> -index 6f2766518be..fbd73970dbb 100644
> ---- a/gdb/ser-unix.c
> -+++ b/gdb/ser-unix.c
> -@@ -508,36 +508,59 @@ set_baudcode_baudrate (struct serial *scb, int
> baud_code)
> -
> - #if HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(BOTHER)
> -
> --/* Set a custom baud rate using the termios BOTHER.  */
> -+/* Set a custom baud rate.
> -+
> -+   Prefer the POSIX cfsetispeed/cfsetospeed interface when it accepts
> -+   arbitrary baud rates.  Otherwise fall back to Linux-specific termios=
2
> -+   (BOTHER) or legacy termios interfaces.  */
> -
> - static void
> - set_custom_baudrate_linux (int fd, int rate)
> - {
> --#ifdef TCGETS2
> --  struct termios2 tio;
> --  const unsigned long req_get =3D TCGETS2;
> --  const unsigned long req_set =3D TCSETS2;
> --#else
> -+#if defined(HAVE_CFSETSPEED_ARBITRARY)
> -   struct termios tio;
> --  const unsigned long req_get =3D TCGETS;
> --  const unsigned long req_set =3D TCSETS;
> --#endif
> -+  if (tcgetattr (fd, &tio) < 0)
> -+    perror_with_name (_("Cannot get current baud rate"));
> -+
> -+  cfsetispeed (&tio, rate);
> -+  cfsetospeed (&tio, rate);
> -+
> -+  if (tcsetattr (fd, TCSANOW, &tio) < 0)
> -+    perror_with_name (_("Cannot set custom baud rate"));
> -+
> -+#elif defined(TCGETS2)
> -+  struct termios2 tio2;
> -+  if (ioctl (fd, TCGETS2, &tio2) < 0)
> -+    perror_with_name (_("Cannot get current baud rate"));
> -+
> -+  tio2.c_cflag &=3D ~CBAUD;
> -+  tio2.c_cflag |=3D BOTHER;
> -+  tio2.c_ospeed =3D rate;
> -+  tio2.c_cflag &=3D ~(CBAUD << IBSHIFT);
> -+  tio2.c_cflag |=3D BOTHER << IBSHIFT;
> -+  tio2.c_ispeed =3D rate;
> -
> --  if (ioctl (fd, req_get, &tio) < 0)
> --    perror_with_name (_("Can not get current baud rate"));
> -+  if (ioctl (fd, TCSETS2, &tio2) < 0)
> -+    perror_with_name (_("Cannot set custom baud rate"));
> -+
> -+#elif defined(HAVE_STRUCT_TERMIOS_C_OSPEED)
> -+  struct termios tio;
> -+  if (ioctl (fd, TCGETS, &tio) < 0)
> -+    perror_with_name (_("Cannot get current baud rate"));
> -
> --  /* Clear the current output baud rate and fill a new value.  */
> -   tio.c_cflag &=3D ~CBAUD;
> -   tio.c_cflag |=3D BOTHER;
> -   tio.c_ospeed =3D rate;
> --
> --  /* Clear the current input baud rate and fill a new value.  */
> -   tio.c_cflag &=3D ~(CBAUD << IBSHIFT);
> -   tio.c_cflag |=3D BOTHER << IBSHIFT;
> -   tio.c_ispeed =3D rate;
> -
> --  if (ioctl (fd, req_set, &tio) < 0)
> --    perror_with_name (_("Can not set custom baud rate"));
> -+  if (ioctl (fd, TCSETS, &tio) < 0)
> -+    perror_with_name (_("Cannot set custom baud rate"));
> -+
> -+#else
> -+  error (_("Custom baud rate not supported on this platform"));
> -+#endif
> - }
> -
> - #elif HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(IOSSIOSPEED)
> ---
> -2.49.0
> -
> diff --git
> a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-=
on-musl-systems.patch
> b/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-=
on-musl-systems.patch
> deleted file mode 100644
> index 2d91a351d2..0000000000
> ---
> a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-=
on-musl-systems.patch
> +++ /dev/null
> @@ -1,196 +0,0 @@
> -From 654223c799910837c80d0964a971fbdf7808864a Mon Sep 17 00:00:00 2001
> -From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> -Date: Tue, 17 Mar 2026 02:24:48 -0700
> -Subject: [PATCH] GDB: aarch64-linux: Fix build failure on musl systems
> -
> -(cherry picked from commit 02090062127d59978ccc312dabf63c6ea838cd85)
> -
> -When building against musl (e.g. on Alpine Linux), the following error
> -happens:
> -
> -    CXX    linux-aarch64-low.o
> -  In file included from
> /home/bauermann/src/binutils-gdb/gdbserver/linux-aarch64-low.cc:42:
> -
> /home/bauermann/src/binutils-gdb/gdbserver/../gdb/arch/aarch64-gcs-linux.=
h:35:8:
> error: redefinition of 'struct user_gcs'
> -     35 | struct user_gcs
> -        |        ^~~~~~~~
> -  In file included from
> /home/bauermann/src/binutils-gdb/gdbserver/linux-aarch64-low.cc:35:
> -  /usr/include/asm/ptrace.h:329:8: note: previous definition of 'struct
> user_gcs'
> -    329 | struct user_gcs {
> -        |        ^~~~~~~~
> -  make[2]: *** [Makefile:565: linux-aarch64-low.o] Error 1
> -
> -aarch64-linux-tdep.c fails to build in the same way.  This happens becau=
se
> -aarch64-gcs-linux.h uses GCS_MAGIC to see whether the system headers
> -have GCS-related definitions.  The problem is that GCS_MAGIC is defined =
in
> -<asm/sigcontext.h> while struct gcs_user is defined in <asm/ptrace.h>.
> -It's fine on glibc systems because in the set of system headers that
> -linux-aarch64-low.cc and aarch64-linux-tdep.c include, <asm/sigcontext.h=
>
> -ends up being included implicitly as well.  This doesn't happen when usi=
ng
> -musl's headers though.
> -
> -There isn't a macro in <asm/ptrace.h> whose presence is correlated with
> -the presence of the struct user_gcs definition, so a configure check is
> -needed to detect it and conditionally define the struct.
> -
> -Also, this change requires aarch64-linux-tdep.c to stop using
> -struct user_gcs because target-dependent code can't include <asm/ptrace.=
h>
> -and thus even if HAVE_STRUCT_USER_GCS is set, the file won't have the
> -struct definition available. To fix this problem, also backport the
> -definition of AARCH64_LINUX_SIZEOF_GCS_REGSET and use it there.
> -
> -Note that there's another build issue with musl, described in
> -PR gdb/33747 affecting compilation of gdb/ser-unix.c.  In order to be
> -able to test this patch, I applied the patch in comment 11 there.
> -
> -Tested with a native build on an Alpine Linux aarch64 system, and also
> -verified that all gdb.arch/aarch64-gcs*.exp tests pass on it.
> -
> -Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=3D33926
> -
> -Upstream-Status: Submitted [
> https://sourceware.org/pipermail/gdb-patches/2026-March/226049.html]
> -
> -Co-authored-by: Chris Packham <judge.packham@gmail.com>
> -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ----
> - gdb/aarch64-linux-tdep.c     |  5 +++--
> - gdb/arch/aarch64-gcs-linux.h |  8 +++++---
> - gdbsupport/config.in         |  3 +++
> - gdbsupport/configure         | 36 ++++++++++++++++++++++++++++++++++++
> - gdbsupport/configure.ac      | 19 +++++++++++++++++++
> - 5 files changed, 66 insertions(+), 5 deletions(-)
> -
> -diff --git a/gdb/aarch64-linux-tdep.c b/gdb/aarch64-linux-tdep.c
> -index 76bde85188b..6c402e7ecdd 100644
> ---- a/gdb/aarch64-linux-tdep.c
> -+++ b/gdb/aarch64-linux-tdep.c
> -@@ -1684,8 +1684,9 @@ aarch64_linux_iterate_over_regset_sections (struct
> gdbarch *gdbarch,
> -         gcs_regmap, regcache_supply_regset, regcache_collect_regset
> -       };
> -
> --      cb (".reg-aarch-gcs", sizeof (user_gcs), sizeof (user_gcs),
> --        &aarch64_linux_gcs_regset, "GCS registers", cb_data);
> -+      cb (".reg-aarch-gcs", AARCH64_LINUX_SIZEOF_GCS_REGSET,
> -+        AARCH64_LINUX_SIZEOF_GCS_REGSET, &aarch64_linux_gcs_regset,
> -+        "GCS registers", cb_data);
> -     }
> - }
> -
> -diff --git a/gdb/arch/aarch64-gcs-linux.h b/gdb/arch/aarch64-gcs-linux.h
> -index 018ca37a522..632823a8120 100644
> ---- a/gdb/arch/aarch64-gcs-linux.h
> -+++ b/gdb/arch/aarch64-gcs-linux.h
> -@@ -27,8 +27,7 @@
> - #define HWCAP_GCS (1ULL << 32)
> - #endif
> -
> --/* Make sure we only define these if the kernel header doesn't.  */
> --#ifndef GCS_MAGIC
> -+#ifndef HAVE_STRUCT_USER_GCS
> -
> - /* GCS state (NT_ARM_GCS).  */
> -
> -@@ -39,6 +38,9 @@ struct user_gcs
> -   uint64_t gcspr_el0;
> - };
> -
> --#endif /* GCS_MAGIC */
> -+#endif /* HAVE_STRUCT_USER_GCS */
> -+
> -+/* The GCS regset consists of 3 64-bit registers.  */
> -+#define AARCH64_LINUX_SIZEOF_GCS_REGSET (3 * 8)
> -
> - #endif /* GDB_ARCH_AARCH64_GCS_LINUX_H */
> -diff --git a/gdbsupport/config.in b/gdbsupport/config.in
> -index 0beacf22c05..2957ee0f030 100644
> ---- a/gdbsupport/config.in
> -+++ b/gdbsupport/config.in
> -@@ -271,6 +271,9 @@
> - /* Define to 1 if `st_blocks' is a member of `struct stat'. */
> - #undef HAVE_STRUCT_STAT_ST_BLOCKS
> -
> -+/* Define to 1 if your system has struct user_gcs. */
> -+#undef HAVE_STRUCT_USER_GCS
> -+
> - /* Define to 1 if you have the <sys/param.h> header file. */
> - #undef HAVE_SYS_PARAM_H
> -
> -diff --git a/gdbsupport/configure b/gdbsupport/configure
> -index 133ddfa7f6c..66135791aa5 100755
> ---- a/gdbsupport/configure
> -+++ b/gdbsupport/configure
> -@@ -14307,6 +14307,42 @@ ac_compiler_gnu=3D$ac_cv_c_compiler_gnu
> -
> -
> -
> -+# Check for `struct user_gcs`
> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for struct user_gcs"
> >&5
> -+$as_echo_n "checking for struct user_gcs... " >&6; }
> -+if ${gdb_cv_struct_user_gcs+:} false; then :
> -+  $as_echo_n "(cached) " >&6
> -+else
> -+  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> -+/* end confdefs.h.  */
> -+#include <sys/ptrace.h>
> -+       #include <asm/ptrace.h>
> -+int
> -+main ()
> -+{
> -+struct user_gcs u;
> -+
> -+  ;
> -+  return 0;
> -+}
> -+_ACEOF
> -+if ac_fn_c_try_compile "$LINENO"; then :
> -+  gdb_cv_struct_user_gcs=3Dyes
> -+else
> -+  gdb_cv_struct_user_gcs=3Dno
> -+
> -+fi
> -+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> -+
> -+fi
> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result:
> $gdb_cv_struct_user_gcs" >&5
> -+$as_echo "$gdb_cv_struct_user_gcs" >&6; }
> -+if test "$gdb_cv_struct_user_gcs" =3D yes; then
> -+
> -+$as_echo "#define HAVE_STRUCT_USER_GCS 1" >>confdefs.h
> -+
> -+fi
> -+
> - # Set the 'development' global.
> - . $srcdir/../bfd/development.sh
> -
> -diff --git a/gdbsupport/configure.ac b/gdbsupport/configure.ac
> -index b7ccfabd6c6..d3b4c05daeb 100644
> ---- a/gdbsupport/configure.ac
> -+++ b/gdbsupport/configure.ac
> -@@ -68,6 +68,25 @@ GDB_AC_PTRACE
> - AM_GDB_COMPILER_TYPE
> - AM_GDB_WARNINGS
> -
> -+# Check for `struct user_gcs`
> -+AC_CACHE_CHECK(
> -+  [for struct user_gcs],
> -+  [gdb_cv_struct_user_gcs],
> -+  [AC_COMPILE_IFELSE(
> -+     [AC_LANG_PROGRAM(
> -+      [#include <sys/ptrace.h>
> -+       #include <asm/ptrace.h>],
> -+      [struct user_gcs u;]
> -+      )],
> -+     [gdb_cv_struct_user_gcs=3Dyes],
> -+     [gdb_cv_struct_user_gcs=3Dno]
> -+  )]
> -+)
> -+if test "$gdb_cv_struct_user_gcs" =3D yes; then
> -+  AC_DEFINE(HAVE_STRUCT_USER_GCS, 1,
> -+          [Define to 1 if your system has struct user_gcs.])
> -+fi
> -+
> - # Set the 'development' global.
> - . $srcdir/../bfd/development.sh
> -
> ---
> -2.49.0
> -
> diff --git a/meta/recipes-devtools/gdb/gdb_17.1.bb
> b/meta/recipes-devtools/gdb/gdb_17.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb_17.1.bb
> rename to meta/recipes-devtools/gdb/gdb_17.2.bb
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239857):
> https://lists.openembedded.org/g/openembedded-core/message/239857
> Mute This Topic: https://lists.openembedded.org/mt/120043435/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000003d412906557394e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 30=
 juin 2026 =C3=A0=C2=A009:19, Varatharajan, Deepesh via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;deepesh.varatharajan=
=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@li=
sts.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Deepesh Varatharajan &lt;<a href=3D"=
mailto:Deepesh.Varatharajan@windriver.com" target=3D"_blank">Deepesh.Varath=
arajan@windriver.com</a>&gt;<br>
<br>
GDB 17.2 brings the following fixes and enhancements over GDB 17.1:<br>
<a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Db=
lob_plain;f=3Dgdb/NEWS;hb=3Dgdb-17.2-release" rel=3D"noreferrer" target=3D"=
_blank">https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dblob=
_plain;f=3Dgdb/NEWS;hb=3Dgdb-17.2-release</a></blockquote><div><br></div><d=
iv>&quot;enhancements&quot; =3D&gt; That sounds like something that is *not=
* acceptable under stable policy. Did you check?</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><br>
<br>
=C2=A0* PR dap/33228 ([gdb/dap] error while listing register children)<br>
<br>
=C2=A0* PR gdb/33737 (gdb --help says &#39;For more information, type &quot=
;stream&quot;<br>
=C2=A0 =C2=A0from within GDB&#39;, but &quot;stream&quot; is not a defined =
command)<br>
<br>
=C2=A0* PR build/33747 (Incompatible with MUSL libc: no member named &#39;c=
_ospeed&#39;<br>
=C2=A0 =C2=A0in &#39;termios&#39;)<br>
<br>
=C2=A0* PR gdb/33748 (gdb17 regression with displaying ANSI colors)<br>
<br>
=C2=A0* PR gdb/33753 (Out-of-bounds writes in string_{v}printf -- threads<b=
r>
=C2=A0 =C2=A0and static data don&#39;t mix)<br>
<br>
=C2=A0* PR cli/33761 (Setting style colors is broken on MS-Windows)<br>
<br>
=C2=A0* PR gdb/33768 (Loading compressed GDB scripts from .debug_gdb_script=
s fails)<br>
<br>
=C2=A0* PR symtab/33775 ([gdb/symtab] data race in<br>
=C2=A0 =C2=A0dwarf2_per_cu::{set_addr_size,set_offset_size,set_ref_addr_siz=
e})<br>
<br>
=C2=A0* PR symtab/33777 ([gdb/symtab] dw2_get_file_names doesn&#39;t cache =
result<br>
=C2=A0 =C2=A0for dummy CU)<br>
<br>
=C2=A0* PR symtab/33825 ([dwz] Extremely slow symbol lookup with DWZ-compre=
ssed<br>
=C2=A0 =C2=A0debug info (thousands of partial units))<br>
<br>
=C2=A0* PR testsuite/33845 (gdb: There are 4 unexpected failures in<br>
=C2=A0 =C2=A0breakpoint-in-ro-region.exp)<br>
<br>
=C2=A0* PR gdb/33872 (`skip -gfile` has inverted logic)<br>
<br>
=C2=A0* PR gdb/33926 (GDB 17.1 AArch64: redefinition of user_gcs struct on =
musl)<br>
<br>
=C2=A0* PR breakpoints/34112 (rbreak `file:regex` sets breakpoints for matc=
hes<br>
=C2=A0 =C2=A0outside of `file` [reproducer attached])<br>
<br>
Drop patches merged upstream:<br>
=C2=A0 * 0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch<br=
>
=C2=A0 * 0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch<br>
<br>
Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Varathara=
jan@windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.com</a>=
&gt;<br>
---<br>
=C2=A0...<a href=3D"http://ian_17.1.bb" rel=3D"noreferrer" target=3D"_blank=
">ian_17.1.bb</a> =3D&gt; <a href=3D"http://gdb-cross-canadian_17.2.bb" rel=
=3D"noreferrer" target=3D"_blank">gdb-cross-canadian_17.2.bb</a>} |=C2=A0 =
=C2=A00<br>
=C2=A0.../{<a href=3D"http://gdb-cross_17.1.bb" rel=3D"noreferrer" target=
=3D"_blank">gdb-cross_17.1.bb</a> =3D&gt; <a href=3D"http://gdb-cross_17.2.=
bb" rel=3D"noreferrer" target=3D"_blank">gdb-cross_17.2.bb</a>}=C2=A0 |=C2=
=A0 =C2=A00<br>
=C2=A0meta/recipes-devtools/gdb/gdb.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0...-ser-unix-modernize-Linux-custom-bau.patch | 248 -----------------=
-<br>
=C2=A0...ux-Fix-build-failure-on-musl-systems.patch | 196 --------------<br=
>
=C2=A0.../gdb/{<a href=3D"http://gdb_17.1.bb" rel=3D"noreferrer" target=3D"=
_blank">gdb_17.1.bb</a> =3D&gt; <a href=3D"http://gdb_17.2.bb" rel=3D"noref=
errer" target=3D"_blank">gdb_17.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A00<br>
=C2=A06 files changed, 1 insertion(+), 447 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/gdb/{<a href=3D"http://gdb-cross-canadia=
n_17.1.bb" rel=3D"noreferrer" target=3D"_blank">gdb-cross-canadian_17.1.bb<=
/a> =3D&gt; <a href=3D"http://gdb-cross-canadian_17.2.bb" rel=3D"noreferrer=
" target=3D"_blank">gdb-cross-canadian_17.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gdb/{<a href=3D"http://gdb-cross_17.1.bb=
" rel=3D"noreferrer" target=3D"_blank">gdb-cross_17.1.bb</a> =3D&gt; <a hre=
f=3D"http://gdb-cross_17.2.bb" rel=3D"noreferrer" target=3D"_blank">gdb-cro=
ss_17.2.bb</a>} (100%)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gd=
b-ser-unix-modernize-Linux-custom-bau.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-lin=
ux-Fix-build-failure-on-musl-systems.patch<br>
=C2=A0rename meta/recipes-devtools/gdb/{<a href=3D"http://gdb_17.1.bb" rel=
=3D"noreferrer" target=3D"_blank">gdb_17.1.bb</a> =3D&gt; <a href=3D"http:/=
/gdb_17.2.bb" rel=3D"noreferrer" target=3D"_blank">gdb_17.2.bb</a>} (100%)<=
br>
<br>
diff --git a/meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross-canadian=
_17.1.bb" rel=3D"noreferrer" target=3D"_blank">gdb-cross-canadian_17.1.bb</=
a> b/meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross-canadian_17.2.bb=
" rel=3D"noreferrer" target=3D"_blank">gdb-cross-canadian_17.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross-canadian_=
17.1.bb" rel=3D"noreferrer" target=3D"_blank">gdb-cross-canadian_17.1.bb</a=
><br>
rename to meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross-canadian_17=
.2.bb" rel=3D"noreferrer" target=3D"_blank">gdb-cross-canadian_17.2.bb</a><=
br>
diff --git a/meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross_17.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">gdb-cross_17.1.bb</a> b/meta/recipes-=
devtools/gdb/<a href=3D"http://gdb-cross_17.2.bb" rel=3D"noreferrer" target=
=3D"_blank">gdb-cross_17.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross_17.1.bb" =
rel=3D"noreferrer" target=3D"_blank">gdb-cross_17.1.bb</a><br>
rename to meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross_17.2.bb" re=
l=3D"noreferrer" target=3D"_blank">gdb-cross_17.2.bb</a><br>
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/=
gdb.inc<br>
index d367486d02..cbb5885459 100644<br>
--- a/meta/recipes-devtools/gdb/gdb.inc<br>
+++ b/meta/recipes-devtools/gdb/gdb.inc<br>
@@ -13,7 +13,5 @@ SRC_URI =3D &quot;${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0006-Fix-invalid-sigprocma=
sk-call.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0007-Define-alignof-using-=
_Alignof-when-using-C11-or-newe.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0008-Add-fix-for-packages-=
that-are-not-compatible-with-C2.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-PR-gdb-33747-gdb-ser-=
unix-modernize-Linux-custom-bau.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0010-GDB-aarch64-linux-Fix=
-build-failure-on-musl-systems.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;14996f5f74c9f68f5a543fdc45bca7800207f91f92aee=
a6c2e791822c7c6d876&quot;<br>
+SRC_URI[sha256sum] =3D &quot;1c036c0d72e4b3d1fb5c94c88632add6f9d76f4d7c4d2=
ea793c12a9f19a3228c&quot;<br>
diff --git a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-m=
odernize-Linux-custom-bau.patch b/meta/recipes-devtools/gdb/gdb/0009-PR-gdb=
-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch<br>
deleted file mode 100644<br>
index 30d22b21f9..0000000000<br>
--- a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-moderniz=
e-Linux-custom-bau.patch<br>
+++ /dev/null<br>
@@ -1,248 +0,0 @@<br>
-From 1a77c71303b552140613d49595baebdff1a4716e Mon Sep 17 00:00:00 2001<br>
-From: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windriver.com" targ=
et=3D"_blank">sunilkumar.dora@windriver.com</a>&gt;<br>
-Date: Tue, 17 Mar 2026 01:58:55 -0700<br>
-Subject: [PATCH] PR gdb/33747: gdb/ser-unix: modernize Linux custom baud r=
ate<br>
- support<br>
-<br>
-The Linux custom baud rate implementation previously accessed the<br>
-struct termios members c_ispeed and c_ospeed directly. These fields<br>
-exist in glibc but are not exposed by musl, causing builds to fail on<br>
-musl-based systems.<br>
-<br>
-Update set_custom_baudrate_linux to use a capability-based approach,<br>
-with three distinct code paths:<br>
-<br>
-1) If POSIX cfsetispeed/cfsetospeed accept arbitrary baud rates<br>
-=C2=A0 =C2=A0(HAVE_CFSETSPEED_ARBITRARY), use them to set input and output=
<br>
-=C2=A0 =C2=A0speeds.<br>
-<br>
-2) Else if Linux termios2 interface is available (TCGETS2/BOTHER),<br>
-=C2=A0 =C2=A0use it to support arbitrary baud rates.<br>
-<br>
-3) Else if legacy struct termios supports c_ispeed/c_ospeed, use<br>
-=C2=A0 =C2=A0the TCGETS/TCSETS fallback (primarily for glibc on older<br>
-=C2=A0 =C2=A0architectures).<br>
-<br>
-4) Otherwise, emit an error indicating that custom baud rates are<br>
-=C2=A0 =C2=A0unsupported on this platform.<br>
-<br>
-This preserves existing behavior on glibc systems while restoring<br>
-build compatibility with musl and other libc implementations.<br>
-<br>
-Bug: <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D33747" r=
el=3D"noreferrer" target=3D"_blank">https://sourceware.org/bugzilla/show_bu=
g.cgi?id=3D33747</a><br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://sourceware.org/pipermail/gd=
b-patches/2026-March/225952.html" rel=3D"noreferrer" target=3D"_blank">http=
s://sourceware.org/pipermail/gdb-patches/2026-March/225952.html</a>]<br>
-<br>
-Suggested-by: Kevin Buettner &lt;<a href=3D"mailto:kevinb@redhat.com" targ=
et=3D"_blank">kevinb@redhat.com</a>&gt;<br>
-Suggested-by: Maciej W. Rozycki &lt;<a href=3D"mailto:macro@orcam.me.uk" t=
arget=3D"_blank">macro@orcam.me.uk</a>&gt;<br>
-Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windriver.=
com" target=3D"_blank">sunilkumar.dora@windriver.com</a>&gt;<br>
----<br>
- gdb/<a href=3D"http://config.in" rel=3D"noreferrer" target=3D"_blank">con=
fig.in</a>=C2=A0 =C2=A0 |=C2=A0 6 ++++++<br>
- gdb/configure=C2=A0 =C2=A0 | 52 +++++++++++++++++++++++++++++++++++++++++=
++++<br>
- gdb/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">=
configure.ac</a> | 22 +++++++++++++++++++<br>
- gdb/ser-unix.c=C2=A0 =C2=A0| 55 ++++++++++++++++++++++++++++++++++-------=
-------<br>
- 4 files changed, 119 insertions(+), 16 deletions(-)<br>
-<br>
-diff --git a/gdb/<a href=3D"http://config.in" rel=3D"noreferrer" target=3D=
"_blank">config.in</a> b/gdb/<a href=3D"http://config.in" rel=3D"noreferrer=
" target=3D"_blank">config.in</a><br>
-index efc3100cb9e..b2469c8dabd 100644<br>
---- a/gdb/<a href=3D"http://config.in" rel=3D"noreferrer" target=3D"_blank=
">config.in</a><br>
-+++ b/gdb/<a href=3D"http://config.in" rel=3D"noreferrer" target=3D"_blank=
">config.in</a><br>
-@@ -110,6 +110,9 @@<br>
-=C2=A0 =C2=A0 the CoreFoundation framework. */<br>
- #undef HAVE_CFPREFERENCESCOPYAPPVALUE<br>
- <br>
-+/* Define if cfsetispeed/cfsetospeed accept arbitrary baud rates */<br>
-+#undef HAVE_CFSETSPEED_ARBITRARY<br>
-+<br>
- /* Define if compiling support to gdb compile. */<br>
- #undef HAVE_COMPILE<br>
- <br>
-@@ -517,6 +520,9 @@<br>
- /* Define to 1 if `st_blocks&#39; is a member of `struct stat&#39;. */<br=
>
- #undef HAVE_STRUCT_STAT_ST_BLOCKS<br>
- <br>
-+/* Define to 1 if `c_ospeed&#39; is a member of `struct termios&#39;. */<=
br>
-+#undef HAVE_STRUCT_TERMIOS_C_OSPEED<br>
-+<br>
- /* Define to 1 if `td_pcb&#39; is a member of `struct thread&#39;. */<br>
- #undef HAVE_STRUCT_THREAD_TD_PCB<br>
- <br>
-diff --git a/gdb/configure b/gdb/configure<br>
-index d0bdba6eb36..8a0e2fa2771 100755<br>
---- a/gdb/configure<br>
-+++ b/gdb/configure<br>
-@@ -27336,6 +27336,58 @@ if test &quot;$ac_res&quot; !=3D no; then :<br>
- fi<br>
- <br>
- <br>
-+# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rates.<br>
-+{ $as_echo &quot;$as_me:${as_lineno-$LINENO}: checking whether cfsetispee=
d/cfsetospeed accept arbitrary baud rates&quot; &gt;&amp;5<br>
-+$as_echo_n &quot;checking whether cfsetispeed/cfsetospeed accept arbitrar=
y baud rates... &quot; &gt;&amp;6; }<br>
-+if ${gdb_cv_cfsetspeed_arbitrary+:} false; then :<br>
-+=C2=A0 $as_echo_n &quot;(cached) &quot; &gt;&amp;6<br>
-+else<br>
-+<br>
-+=C2=A0 cat confdefs.h - &lt;&lt;_ACEOF &gt;conftest.$ac_ext<br>
-+/* end confdefs.h.=C2=A0 */<br>
-+#include &lt;termios.h&gt;<br>
-+int<br>
-+main ()<br>
-+{<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0#if B9600 !=3D 9600<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0#error B-constants are not numeric symbols<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0#endif<br>
-+<br>
-+=C2=A0 ;<br>
-+=C2=A0 return 0;<br>
-+}<br>
-+_ACEOF<br>
-+if ac_fn_c_try_compile &quot;$LINENO&quot;; then :<br>
-+=C2=A0 gdb_cv_cfsetspeed_arbitrary=3Dyes<br>
-+else<br>
-+=C2=A0 gdb_cv_cfsetspeed_arbitrary=3Dno<br>
-+fi<br>
-+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext<br>
-+<br>
-+fi<br>
-+{ $as_echo &quot;$as_me:${as_lineno-$LINENO}: result: $gdb_cv_cfsetspeed_=
arbitrary&quot; &gt;&amp;5<br>
-+$as_echo &quot;$gdb_cv_cfsetspeed_arbitrary&quot; &gt;&amp;6; }<br>
-+<br>
-+if test &quot;$gdb_cv_cfsetspeed_arbitrary&quot; =3D yes; then<br>
-+<br>
-+$as_echo &quot;#define HAVE_CFSETSPEED_ARBITRARY 1&quot; &gt;&gt;confdefs=
.h<br>
-+<br>
-+fi<br>
-+<br>
-+# Check for members required by the legacy Linux custom baud rate path.<b=
r>
-+ac_fn_c_check_member &quot;$LINENO&quot; &quot;struct termios&quot; &quot=
;c_ospeed&quot; &quot;ac_cv_member_struct_termios_c_ospeed&quot; &quot;#inc=
lude &lt;termios.h&gt;<br>
-+&quot;<br>
-+if test &quot;x$ac_cv_member_struct_termios_c_ospeed&quot; =3D xyes; then=
 :<br>
-+<br>
-+cat &gt;&gt;confdefs.h &lt;&lt;_ACEOF<br>
-+#define HAVE_STRUCT_TERMIOS_C_OSPEED 1<br>
-+_ACEOF<br>
-+<br>
-+<br>
-+fi<br>
-+<br>
-+<br>
- <br>
- <br>
- # Check whether --with-jit-reader-dir was given.<br>
-diff --git a/gdb/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a> b/gdb/<a href=3D"http://configure.ac" rel=3D"n=
oreferrer" target=3D"_blank">configure.ac</a><br>
-index 52924106bca..26e8d1ee276 100644<br>
---- a/gdb/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_bl=
ank">configure.ac</a><br>
-+++ b/gdb/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_bl=
ank">configure.ac</a><br>
-@@ -733,6 +733,28 @@ AC_CONFIG_FILES([jit-reader.h:<a href=3D"http://jit-r=
eader.in" rel=3D"noreferrer" target=3D"_blank">jit-reader.in</a>])<br>
- <br>
- AC_SEARCH_LIBS(dlopen, dl)<br>
- <br>
-+# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rates.<br>
-+AC_CACHE_CHECK([whether cfsetispeed/cfsetospeed accept arbitrary baud rat=
es],<br>
-+=C2=A0 [gdb_cv_cfsetspeed_arbitrary], [<br>
-+=C2=A0 AC_COMPILE_IFELSE(<br>
-+=C2=A0 =C2=A0 [AC_LANG_PROGRAM([[#include &lt;termios.h&gt;]],<br>
-+=C2=A0 =C2=A0 =C2=A0 [[<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0#if B9600 !=3D 9600<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0#error B-constants are not numeric symbols<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0#endif<br>
-+=C2=A0 =C2=A0 =C2=A0 ]])],<br>
-+=C2=A0 =C2=A0 [gdb_cv_cfsetspeed_arbitrary=3Dyes],<br>
-+=C2=A0 =C2=A0 [gdb_cv_cfsetspeed_arbitrary=3Dno])<br>
-+])<br>
-+<br>
-+if test &quot;$gdb_cv_cfsetspeed_arbitrary&quot; =3D yes; then<br>
-+=C2=A0 AC_DEFINE([HAVE_CFSETSPEED_ARBITRARY], [1],<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[Define if cfsetispeed/cfsetospe=
ed accept arbitrary baud rates])<br>
-+fi<br>
-+<br>
-+# Check for members required by the legacy Linux custom baud rate path.<b=
r>
-+AC_CHECK_MEMBERS([struct termios.c_ospeed], [], [], [[#include &lt;termio=
s.h&gt;]])<br>
-+<br>
- GDB_AC_WITH_DIR([JIT_READER_DIR], [jit-reader-dir],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[directory t=
o load the JIT readers from],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[${libdir}/g=
db])<br>
-diff --git a/gdb/ser-unix.c b/gdb/ser-unix.c<br>
-index 6f2766518be..fbd73970dbb 100644<br>
---- a/gdb/ser-unix.c<br>
-+++ b/gdb/ser-unix.c<br>
-@@ -508,36 +508,59 @@ set_baudcode_baudrate (struct serial *scb, int baud_=
code)<br>
- <br>
- #if HAVE_CUSTOM_BAUDRATE_SUPPORT &amp;&amp; defined(BOTHER)<br>
- <br>
--/* Set a custom baud rate using the termios BOTHER.=C2=A0 */<br>
-+/* Set a custom baud rate.<br>
-+<br>
-+=C2=A0 =C2=A0Prefer the POSIX cfsetispeed/cfsetospeed interface when it a=
ccepts<br>
-+=C2=A0 =C2=A0arbitrary baud rates.=C2=A0 Otherwise fall back to Linux-spe=
cific termios2<br>
-+=C2=A0 =C2=A0(BOTHER) or legacy termios interfaces.=C2=A0 */<br>
- <br>
- static void<br>
- set_custom_baudrate_linux (int fd, int rate)<br>
- {<br>
--#ifdef TCGETS2<br>
--=C2=A0 struct termios2 tio;<br>
--=C2=A0 const unsigned long req_get =3D TCGETS2;<br>
--=C2=A0 const unsigned long req_set =3D TCSETS2;<br>
--#else<br>
-+#if defined(HAVE_CFSETSPEED_ARBITRARY)<br>
-=C2=A0 =C2=A0struct termios tio;<br>
--=C2=A0 const unsigned long req_get =3D TCGETS;<br>
--=C2=A0 const unsigned long req_set =3D TCSETS;<br>
--#endif<br>
-+=C2=A0 if (tcgetattr (fd, &amp;tio) &lt; 0)<br>
-+=C2=A0 =C2=A0 perror_with_name (_(&quot;Cannot get current baud rate&quot=
;));<br>
-+<br>
-+=C2=A0 cfsetispeed (&amp;tio, rate);<br>
-+=C2=A0 cfsetospeed (&amp;tio, rate);<br>
-+<br>
-+=C2=A0 if (tcsetattr (fd, TCSANOW, &amp;tio) &lt; 0)<br>
-+=C2=A0 =C2=A0 perror_with_name (_(&quot;Cannot set custom baud rate&quot;=
));<br>
-+<br>
-+#elif defined(TCGETS2)<br>
-+=C2=A0 struct termios2 tio2;<br>
-+=C2=A0 if (ioctl (fd, TCGETS2, &amp;tio2) &lt; 0)<br>
-+=C2=A0 =C2=A0 perror_with_name (_(&quot;Cannot get current baud rate&quot=
;));<br>
-+<br>
-+=C2=A0 tio2.c_cflag &amp;=3D ~CBAUD;<br>
-+=C2=A0 tio2.c_cflag |=3D BOTHER;<br>
-+=C2=A0 tio2.c_ospeed =3D rate;<br>
-+=C2=A0 tio2.c_cflag &amp;=3D ~(CBAUD &lt;&lt; IBSHIFT);<br>
-+=C2=A0 tio2.c_cflag |=3D BOTHER &lt;&lt; IBSHIFT;<br>
-+=C2=A0 tio2.c_ispeed =3D rate;<br>
- <br>
--=C2=A0 if (ioctl (fd, req_get, &amp;tio) &lt; 0)<br>
--=C2=A0 =C2=A0 perror_with_name (_(&quot;Can not get current baud rate&quo=
t;));<br>
-+=C2=A0 if (ioctl (fd, TCSETS2, &amp;tio2) &lt; 0)<br>
-+=C2=A0 =C2=A0 perror_with_name (_(&quot;Cannot set custom baud rate&quot;=
));<br>
-+<br>
-+#elif defined(HAVE_STRUCT_TERMIOS_C_OSPEED)<br>
-+=C2=A0 struct termios tio;<br>
-+=C2=A0 if (ioctl (fd, TCGETS, &amp;tio) &lt; 0)<br>
-+=C2=A0 =C2=A0 perror_with_name (_(&quot;Cannot get current baud rate&quot=
;));<br>
- <br>
--=C2=A0 /* Clear the current output baud rate and fill a new value.=C2=A0 =
*/<br>
-=C2=A0 =C2=A0tio.c_cflag &amp;=3D ~CBAUD;<br>
-=C2=A0 =C2=A0tio.c_cflag |=3D BOTHER;<br>
-=C2=A0 =C2=A0tio.c_ospeed =3D rate;<br>
--<br>
--=C2=A0 /* Clear the current input baud rate and fill a new value.=C2=A0 *=
/<br>
-=C2=A0 =C2=A0tio.c_cflag &amp;=3D ~(CBAUD &lt;&lt; IBSHIFT);<br>
-=C2=A0 =C2=A0tio.c_cflag |=3D BOTHER &lt;&lt; IBSHIFT;<br>
-=C2=A0 =C2=A0tio.c_ispeed =3D rate;<br>
- <br>
--=C2=A0 if (ioctl (fd, req_set, &amp;tio) &lt; 0)<br>
--=C2=A0 =C2=A0 perror_with_name (_(&quot;Can not set custom baud rate&quot=
;));<br>
-+=C2=A0 if (ioctl (fd, TCSETS, &amp;tio) &lt; 0)<br>
-+=C2=A0 =C2=A0 perror_with_name (_(&quot;Cannot set custom baud rate&quot;=
));<br>
-+<br>
-+#else<br>
-+=C2=A0 error (_(&quot;Custom baud rate not supported on this platform&quo=
t;));<br>
-+#endif<br>
- }<br>
- <br>
- #elif HAVE_CUSTOM_BAUDRATE_SUPPORT &amp;&amp; defined(IOSSIOSPEED)<br>
--- <br>
-2.49.0<br>
-<br>
diff --git a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build=
-failure-on-musl-systems.patch b/meta/recipes-devtools/gdb/gdb/0010-GDB-aar=
ch64-linux-Fix-build-failure-on-musl-systems.patch<br>
deleted file mode 100644<br>
index 2d91a351d2..0000000000<br>
--- a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failur=
e-on-musl-systems.patch<br>
+++ /dev/null<br>
@@ -1,196 +0,0 @@<br>
-From 654223c799910837c80d0964a971fbdf7808864a Mon Sep 17 00:00:00 2001<br>
-From: Thiago Jung Bauermann &lt;<a href=3D"mailto:thiago.bauermann@linaro.=
org" target=3D"_blank">thiago.bauermann@linaro.org</a>&gt;<br>
-Date: Tue, 17 Mar 2026 02:24:48 -0700<br>
-Subject: [PATCH] GDB: aarch64-linux: Fix build failure on musl systems<br>
-<br>
-(cherry picked from commit 02090062127d59978ccc312dabf63c6ea838cd85)<br>
-<br>
-When building against musl (e.g. on Alpine Linux), the following error<br>
-happens:<br>
-<br>
-=C2=A0 =C2=A0 CXX=C2=A0 =C2=A0 linux-aarch64-low.o<br>
-=C2=A0 In file included from /home/bauermann/src/binutils-gdb/gdbserver/li=
nux-aarch64-low.cc:42:<br>
-=C2=A0 /home/bauermann/src/binutils-gdb/gdbserver/../gdb/arch/aarch64-gcs-=
linux.h:35:8: error: redefinition of &#39;struct user_gcs&#39;<br>
-=C2=A0 =C2=A0 =C2=A035 | struct user_gcs<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~<br>
-=C2=A0 In file included from /home/bauermann/src/binutils-gdb/gdbserver/li=
nux-aarch64-low.cc:35:<br>
-=C2=A0 /usr/include/asm/ptrace.h:329:8: note: previous definition of &#39;=
struct user_gcs&#39;<br>
-=C2=A0 =C2=A0 329 | struct user_gcs {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~<br>
-=C2=A0 make[2]: *** [Makefile:565: linux-aarch64-low.o] Error 1<br>
-<br>
-aarch64-linux-tdep.c fails to build in the same way.=C2=A0 This happens be=
cause<br>
-aarch64-gcs-linux.h uses GCS_MAGIC to see whether the system headers<br>
-have GCS-related definitions.=C2=A0 The problem is that GCS_MAGIC is defin=
ed in<br>
-&lt;asm/sigcontext.h&gt; while struct gcs_user is defined in &lt;asm/ptrac=
e.h&gt;.<br>
-It&#39;s fine on glibc systems because in the set of system headers that<b=
r>
-linux-aarch64-low.cc and aarch64-linux-tdep.c include, &lt;asm/sigcontext.=
h&gt;<br>
-ends up being included implicitly as well.=C2=A0 This doesn&#39;t happen w=
hen using<br>
-musl&#39;s headers though.<br>
-<br>
-There isn&#39;t a macro in &lt;asm/ptrace.h&gt; whose presence is correlat=
ed with<br>
-the presence of the struct user_gcs definition, so a configure check is<br=
>
-needed to detect it and conditionally define the struct.<br>
-<br>
-Also, this change requires aarch64-linux-tdep.c to stop using<br>
-struct user_gcs because target-dependent code can&#39;t include &lt;asm/pt=
race.h&gt;<br>
-and thus even if HAVE_STRUCT_USER_GCS is set, the file won&#39;t have the<=
br>
-struct definition available. To fix this problem, also backport the<br>
-definition of AARCH64_LINUX_SIZEOF_GCS_REGSET and use it there.<br>
-<br>
-Note that there&#39;s another build issue with musl, described in<br>
-PR gdb/33747 affecting compilation of gdb/ser-unix.c.=C2=A0 In order to be=
<br>
-able to test this patch, I applied the patch in comment 11 there.<br>
-<br>
-Tested with a native build on an Alpine Linux aarch64 system, and also<br>
-verified that all gdb.arch/aarch64-gcs*.exp tests pass on it.<br>
-<br>
-Bug: <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D33926" r=
el=3D"noreferrer" target=3D"_blank">https://sourceware.org/bugzilla/show_bu=
g.cgi?id=3D33926</a><br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://sourceware.org/pipermail/gd=
b-patches/2026-March/226049.html" rel=3D"noreferrer" target=3D"_blank">http=
s://sourceware.org/pipermail/gdb-patches/2026-March/226049.html</a>]<br>
-<br>
-Co-authored-by: Chris Packham &lt;<a href=3D"mailto:judge.packham@gmail.co=
m" target=3D"_blank">judge.packham@gmail.com</a>&gt;<br>
-Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windriver.=
com" target=3D"_blank">sunilkumar.dora@windriver.com</a>&gt;<br>
----<br>
- gdb/aarch64-linux-tdep.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +++--<br>
- gdb/arch/aarch64-gcs-linux.h |=C2=A0 8 +++++---<br>
- gdbsupport/<a href=3D"http://config.in" rel=3D"noreferrer" target=3D"_bla=
nk">config.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
- gdbsupport/configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 36 ++++++++++++++=
++++++++++++++++++++++<br>
- gdbsupport/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a>=C2=A0 =C2=A0 =C2=A0 | 19 +++++++++++++++++++<br>
- 5 files changed, 66 insertions(+), 5 deletions(-)<br>
-<br>
-diff --git a/gdb/aarch64-linux-tdep.c b/gdb/aarch64-linux-tdep.c<br>
-index 76bde85188b..6c402e7ecdd 100644<br>
---- a/gdb/aarch64-linux-tdep.c<br>
-+++ b/gdb/aarch64-linux-tdep.c<br>
-@@ -1684,8 +1684,9 @@ aarch64_linux_iterate_over_regset_sections (struct g=
dbarch *gdbarch,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcs_regmap, regcache_supply_regset, regc=
ache_collect_regset<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 cb (&quot;.reg-aarch-gcs&quot;, sizeof (user_gcs), s=
izeof (user_gcs),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;aarch64_linux_gcs_regset, &quot;GCS regi=
sters&quot;, cb_data);<br>
-+=C2=A0 =C2=A0 =C2=A0 cb (&quot;.reg-aarch-gcs&quot;, AARCH64_LINUX_SIZEOF=
_GCS_REGSET,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 AARCH64_LINUX_SIZEOF_GCS_REGSET, &amp;aarch64=
_linux_gcs_regset,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;GCS registers&quot;, cb_data);<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- }<br>
- <br>
-diff --git a/gdb/arch/aarch64-gcs-linux.h b/gdb/arch/aarch64-gcs-linux.h<b=
r>
-index 018ca37a522..632823a8120 100644<br>
---- a/gdb/arch/aarch64-gcs-linux.h<br>
-+++ b/gdb/arch/aarch64-gcs-linux.h<br>
-@@ -27,8 +27,7 @@<br>
- #define HWCAP_GCS (1ULL &lt;&lt; 32)<br>
- #endif<br>
- <br>
--/* Make sure we only define these if the kernel header doesn&#39;t.=C2=A0=
 */<br>
--#ifndef GCS_MAGIC<br>
-+#ifndef HAVE_STRUCT_USER_GCS<br>
- <br>
- /* GCS state (NT_ARM_GCS).=C2=A0 */<br>
- <br>
-@@ -39,6 +38,9 @@ struct user_gcs<br>
-=C2=A0 =C2=A0uint64_t gcspr_el0;<br>
- };<br>
- <br>
--#endif /* GCS_MAGIC */<br>
-+#endif /* HAVE_STRUCT_USER_GCS */<br>
-+<br>
-+/* The GCS regset consists of 3 64-bit registers.=C2=A0 */<br>
-+#define AARCH64_LINUX_SIZEOF_GCS_REGSET (3 * 8)<br>
- <br>
- #endif /* GDB_ARCH_AARCH64_GCS_LINUX_H */<br>
-diff --git a/gdbsupport/<a href=3D"http://config.in" rel=3D"noreferrer" ta=
rget=3D"_blank">config.in</a> b/gdbsupport/<a href=3D"http://config.in" rel=
=3D"noreferrer" target=3D"_blank">config.in</a><br>
-index 0beacf22c05..2957ee0f030 100644<br>
---- a/gdbsupport/<a href=3D"http://config.in" rel=3D"noreferrer" target=3D=
"_blank">config.in</a><br>
-+++ b/gdbsupport/<a href=3D"http://config.in" rel=3D"noreferrer" target=3D=
"_blank">config.in</a><br>
-@@ -271,6 +271,9 @@<br>
- /* Define to 1 if `st_blocks&#39; is a member of `struct stat&#39;. */<br=
>
- #undef HAVE_STRUCT_STAT_ST_BLOCKS<br>
- <br>
-+/* Define to 1 if your system has struct user_gcs. */<br>
-+#undef HAVE_STRUCT_USER_GCS<br>
-+<br>
- /* Define to 1 if you have the &lt;sys/param.h&gt; header file. */<br>
- #undef HAVE_SYS_PARAM_H<br>
- <br>
-diff --git a/gdbsupport/configure b/gdbsupport/configure<br>
-index 133ddfa7f6c..66135791aa5 100755<br>
---- a/gdbsupport/configure<br>
-+++ b/gdbsupport/configure<br>
-@@ -14307,6 +14307,42 @@ ac_compiler_gnu=3D$ac_cv_c_compiler_gnu<br>
- <br>
- <br>
- <br>
-+# Check for `struct user_gcs`<br>
-+{ $as_echo &quot;$as_me:${as_lineno-$LINENO}: checking for struct user_gc=
s&quot; &gt;&amp;5<br>
-+$as_echo_n &quot;checking for struct user_gcs... &quot; &gt;&amp;6; }<br>
-+if ${gdb_cv_struct_user_gcs+:} false; then :<br>
-+=C2=A0 $as_echo_n &quot;(cached) &quot; &gt;&amp;6<br>
-+else<br>
-+=C2=A0 cat confdefs.h - &lt;&lt;_ACEOF &gt;conftest.$ac_ext<br>
-+/* end confdefs.h.=C2=A0 */<br>
-+#include &lt;sys/ptrace.h&gt;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0#include &lt;asm/ptrace.h&gt;<br>
-+int<br>
-+main ()<br>
-+{<br>
-+struct user_gcs u;<br>
-+<br>
-+=C2=A0 ;<br>
-+=C2=A0 return 0;<br>
-+}<br>
-+_ACEOF<br>
-+if ac_fn_c_try_compile &quot;$LINENO&quot;; then :<br>
-+=C2=A0 gdb_cv_struct_user_gcs=3Dyes<br>
-+else<br>
-+=C2=A0 gdb_cv_struct_user_gcs=3Dno<br>
-+<br>
-+fi<br>
-+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext<br>
-+<br>
-+fi<br>
-+{ $as_echo &quot;$as_me:${as_lineno-$LINENO}: result: $gdb_cv_struct_user=
_gcs&quot; &gt;&amp;5<br>
-+$as_echo &quot;$gdb_cv_struct_user_gcs&quot; &gt;&amp;6; }<br>
-+if test &quot;$gdb_cv_struct_user_gcs&quot; =3D yes; then<br>
-+<br>
-+$as_echo &quot;#define HAVE_STRUCT_USER_GCS 1&quot; &gt;&gt;confdefs.h<br=
>
-+<br>
-+fi<br>
-+<br>
- # Set the &#39;development&#39; global.<br>
- . $srcdir/../bfd/development.sh<br>
- <br>
-diff --git a/gdbsupport/<a href=3D"http://configure.ac" rel=3D"noreferrer"=
 target=3D"_blank">configure.ac</a> b/gdbsupport/<a href=3D"http://configur=
e.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
-index b7ccfabd6c6..d3b4c05daeb 100644<br>
---- a/gdbsupport/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
-+++ b/gdbsupport/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
-@@ -68,6 +68,25 @@ GDB_AC_PTRACE<br>
- AM_GDB_COMPILER_TYPE<br>
- AM_GDB_WARNINGS<br>
- <br>
-+# Check for `struct user_gcs`<br>
-+AC_CACHE_CHECK(<br>
-+=C2=A0 [for struct user_gcs],<br>
-+=C2=A0 [gdb_cv_struct_user_gcs],<br>
-+=C2=A0 [AC_COMPILE_IFELSE(<br>
-+=C2=A0 =C2=A0 =C2=A0[AC_LANG_PROGRAM(<br>
-+=C2=A0 =C2=A0 =C2=A0 [#include &lt;sys/ptrace.h&gt;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0#include &lt;asm/ptrace.h&gt;],<br>
-+=C2=A0 =C2=A0 =C2=A0 [struct user_gcs u;]<br>
-+=C2=A0 =C2=A0 =C2=A0 )],<br>
-+=C2=A0 =C2=A0 =C2=A0[gdb_cv_struct_user_gcs=3Dyes],<br>
-+=C2=A0 =C2=A0 =C2=A0[gdb_cv_struct_user_gcs=3Dno]<br>
-+=C2=A0 )]<br>
-+)<br>
-+if test &quot;$gdb_cv_struct_user_gcs&quot; =3D yes; then<br>
-+=C2=A0 AC_DEFINE(HAVE_STRUCT_USER_GCS, 1,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [Define to 1 if your system has struct=
 user_gcs.])<br>
-+fi<br>
-+<br>
- # Set the &#39;development&#39; global.<br>
- . $srcdir/../bfd/development.sh<br>
- <br>
--- <br>
-2.49.0<br>
-<br>
diff --git a/meta/recipes-devtools/gdb/<a href=3D"http://gdb_17.1.bb" rel=
=3D"noreferrer" target=3D"_blank">gdb_17.1.bb</a> b/meta/recipes-devtools/g=
db/<a href=3D"http://gdb_17.2.bb" rel=3D"noreferrer" target=3D"_blank">gdb_=
17.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gdb/<a href=3D"http://gdb_17.1.bb" rel=3D=
"noreferrer" target=3D"_blank">gdb_17.1.bb</a><br>
rename to meta/recipes-devtools/gdb/<a href=3D"http://gdb_17.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">gdb_17.2.bb</a><br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#239857): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/239857" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/239857</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120043435/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120043435/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000003d412906557394e7--

