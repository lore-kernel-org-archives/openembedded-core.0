Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD092C43458
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 17:29:19 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.134954.1783272554932125105
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 10:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Q6tA2Lo2;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493d3135f62so5097535e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 10:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783272553; x=1783877353; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HPwv/N/TkxIOru9MLQsaLWjMjObSX/S+YpdlyOoSm4=;
        b=Q6tA2Lo2oyD/3j4GKc9r9Wi5ii5Wk7VaEnfsSeI6PArkfcStOg6YZ1/kGhU0pSYGyg
         KVNVLbSDL0Fj9UDFJWQZ7aRkC9ogcTDtJFCQdvG6Vu7f4+KrAcro8Q3F/d8cMoo9gb2Q
         a224VVxbsQp/JH2agTOqTvOWv0Yfb2g+CsuKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783272553; x=1783877353;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2HPwv/N/TkxIOru9MLQsaLWjMjObSX/S+YpdlyOoSm4=;
        b=RK1IwrcG2YbYAtBK0qmRmhjLo9nLr0NLejOwE5V+z8+VJ6VnzoKqEuSUVSZBIuMso7
         qA9BLodb8QvmmZrBpaXybaUBETjzEpcStDGCMbZCE+vBHhcAaBLQOF+WD1sEjN/ek97L
         i+gMjmnsMa6CEEyuD6GcVxum8tzcce4Ebk1QdLkbGXx7RsIMVyEbzF12wzQgs4VDvwFm
         mIel2gHyvf67Jf0ROdA+b7zLXeOkpMa/DukV9FC7Tynhm7mq6Bj0TWB4H7IZjbEgqKc+
         oWaAWJXg51BZeWTHZApR1KHRBV8Pglqwsj3wcqrmKDjKYQEXW1J8QntY6xKXnX/1kFme
         EJ6g==
X-Forwarded-Encrypted: i=1; AHgh+RqRIvmHiR17CeB9nwb4vWX7Ajgv49uw/EEDqVo19NIYBo3kvPjbl5gylhbzNBNYvn2K6PoA+QQRM6ersE1EPNWdZA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyoz+oHp2GYp+t/Uv6VtEPjzgyPZULuZ5f/i1CEQtkEKErTnjUu
	CnMX45AEhuHPx1TnVlBgYfuEmFAsKM5Q1pCOyqAS2jasw3RZeehAse/Hto9gLDALAeUaT8q7cBf
	iWzpG7mA=
X-Gm-Gg: AfdE7cmmrQ5hs6oTcadswtqWTvEHxuGI5ryhn2fD6eWS+Cl3xxILR98R+elejV1dopw
	9dz6XGlM2COsgADmyDrf6JRra4ETyGE7nFW+5UweeH3kDmTWs6R9E/t33neiUwPJJNjTenZaS+A
	3N2KKyZ1SSqlJJcw0FkxCAyxDTv8hCTlnDACPJbs2oBAUeT2QG/3rf2heDDl/fLM3MBpvXcwUP5
	Ywx95oJTdUdD2Sl6zn5u08aTpxDujz5HBw0mFPFTG0G0sfoc/HZbUXa9PxXxsbH122loUUXbufk
	bDpvbDjCH8GDT7h/mym41DNDmoaGxZTkNc2eOpeucoO7UFKhxGaHL78i82s6+ByUJUIzAM6FPrl
	uY8xROfSRFCzqH9WaSo2MrZc8Z3b2H8mmo1migr/GJmcxZJbwlFeaPqttdaz+HbAa/O+6ahHx5o
	qpbVJvyOiEDEvhJxU=
X-Received: by 2002:a05:600c:3328:b0:493:cce0:3724 with SMTP id 5b1f17b1804b1-493d11d3d12mr52599405e9.4.1783272552820;
        Sun, 05 Jul 2026 10:29:12 -0700 (PDT)
Received: from localhost ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d780csm17757605f8f.11.2026.07.05.10.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 10:29:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 05 Jul 2026 19:29:11 +0200
Message-Id: <DJQTD0V57D7M.2UJBWEZBMPTQP@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH V2] gdb: Upgrade 17.1 -> 17.2
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Sundeep.Kokkonda@windriver.com>, <Deepesh.Varatharajan@windriver.com>
To: <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260630075003.1692482-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260630075003.1692482-1-Deepesh.Varatharajan@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 17:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240152

On Tue Jun 30, 2026 at 9:50 AM CEST, Deepesh via lists.openembedded.org Var=
atharajan wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> This is a corrective release over GDB 17.1, fixing the following issues:
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
>  * PR gdb/33768 (Loading compressed GDB scripts from .debug_gdb_scripts f=
ails)
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

When looking at the commit log:
   $ git log --format=3Doneline --abbrev-commit gdb-17.1-release..gdb-17.2-=
release |grep -v "Automatic date update in version.in"
  7adf9fa6b1c Set GDB version number to 17.2.
  063b0d3f0b3 [gdb/breakpoints] Don't ignore <file> in rbreak <file>:<regex=
p>
  17d05df7da1 gdb/ser-unix: add POSIX cfsetispeed/cfsetospeed support for c=
ustom baud rates
  56c4ba5d7b5 gdb/ser-unix: fix musl build failure when setting custom baud=
 rates
  1ccc3f6a2e2 GDB: aarch64-linux: Fix build failure on musl systems
  a4477520f93 gdb: Fix unexpected failures in breakpoint-in-ro-region.exp
  eaf673ca75c gdb: Make test result accurate in breakpoint-in-ro-region.exp
  91080fe0d50 Revert "skip -gfile: call fnmatch without FNM_FILE_NAME"
  36356c77b89 [gdb/symtab] Fix slow symbol lookup with dwz
  07e542a3bd0 gdb/
  101b318a6a6 gdb: fix handling of raw ANSI escape sequences printed from P=
ython
  0ac91006f95 [gdb/symtab] Cache dw2_get_file_names result for dummy CU
  32adc7212e4 gdb/dwarf: make dwarf2_per_cu size fields atomic
  59ffbefc0ee [gdbsupport] Fix get_print_cell use in threads
  0926b8b8339 gdb: fix loading compressed scripts from `.debug_gdb_scripts`=
-section
  8e246f43277 Change handling of over-long DAP variables requests
  4393da33773 Fix --help output
  35880717849 Bump GDB's version number to 17.1.90.DATE-git.

... one commit stands out: "17d05df7da1 gdb/ser-unix: add POSIX cfsetispeed=
/cfsetospeed support for custom baud rates".
This look like feature addition (e.g new config option). But, in this
case, if I understood correctly, this is the merged version of the
removed patch "0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.pa=
tch",
so this should be okay to merge but I think the commit message must
include this explanation.

I wonder why this particular change was not part of the changelog you
added...

Can you send a new version with all the above elements?

Thanks!

> ---
>  ...ian_17.1.bb =3D> gdb-cross-canadian_17.2.bb} |   0
>  .../{gdb-cross_17.1.bb =3D> gdb-cross_17.2.bb}  |   0
>  meta/recipes-devtools/gdb/gdb.inc             |   4 +-
>  ...-ser-unix-modernize-Linux-custom-bau.patch | 248 ------------------
>  ...ux-Fix-build-failure-on-musl-systems.patch | 196 --------------
>  .../gdb/{gdb_17.1.bb =3D> gdb_17.2.bb}          |   0
>  6 files changed, 1 insertion(+), 447 deletions(-)
>  rename meta/recipes-devtools/gdb/{gdb-cross-canadian_17.1.bb =3D> gdb-cr=
oss-canadian_17.2.bb} (100%)
>  rename meta/recipes-devtools/gdb/{gdb-cross_17.1.bb =3D> gdb-cross_17.2.=
bb} (100%)
>  delete mode 100644 meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-s=
er-unix-modernize-Linux-custom-bau.patch
>  delete mode 100644 meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-=
Fix-build-failure-on-musl-systems.patch
>  rename meta/recipes-devtools/gdb/{gdb_17.1.bb =3D> gdb_17.2.bb} (100%)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb b/meta/=
recipes-devtools/gdb/gdb-cross-canadian_17.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb
> rename to meta/recipes-devtools/gdb/gdb-cross-canadian_17.2.bb
> diff --git a/meta/recipes-devtools/gdb/gdb-cross_17.1.bb b/meta/recipes-d=
evtools/gdb/gdb-cross_17.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross_17.1.bb
> rename to meta/recipes-devtools/gdb/gdb-cross_17.2.bb
> diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gd=
b/gdb.inc
> index d367486d02..cbb5885459 100644
> --- a/meta/recipes-devtools/gdb/gdb.inc
> +++ b/meta/recipes-devtools/gdb/gdb.inc
> @@ -13,7 +13,5 @@ SRC_URI =3D "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
>             file://0006-Fix-invalid-sigprocmask-call.patch \
>             file://0007-Define-alignof-using-_Alignof-when-using-C11-or-n=
ewe.patch \
>             file://0008-Add-fix-for-packages-that-are-not-compatible-with=
-C2.patch \
> -           file://0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-=
bau.patch \
> -           file://0010-GDB-aarch64-linux-Fix-build-failure-on-musl-syste=
ms.patch \
>             "
> -SRC_URI[sha256sum] =3D "14996f5f74c9f68f5a543fdc45bca7800207f91f92aeea6c=
2e791822c7c6d876"
> +SRC_URI[sha256sum] =3D "1c036c0d72e4b3d1fb5c94c88632add6f9d76f4d7c4d2ea7=
93c12a9f19a3228c"
> diff --git a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix=
-modernize-Linux-custom-bau.patch b/meta/recipes-devtools/gdb/gdb/0009-PR-g=
db-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
> deleted file mode 100644
> index 30d22b21f9..0000000000
> --- a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modern=
ize-Linux-custom-bau.patch
> +++ /dev/null
> @@ -1,248 +0,0 @@
> -From 1a77c71303b552140613d49595baebdff1a4716e Mon Sep 17 00:00:00 2001
> -From: Sunil Dora <sunilkumar.dora@windriver.com>
> -Date: Tue, 17 Mar 2026 01:58:55 -0700
> -Subject: [PATCH] PR gdb/33747: gdb/ser-unix: modernize Linux custom baud=
 rate
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
> -Upstream-Status: Submitted [https://sourceware.org/pipermail/gdb-patches=
/2026-March/225952.html]
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
> -=20
> -+/* Define if cfsetispeed/cfsetospeed accept arbitrary baud rates */
> -+#undef HAVE_CFSETSPEED_ARBITRARY
> -+
> - /* Define if compiling support to gdb compile. */
> - #undef HAVE_COMPILE
> -=20
> -@@ -517,6 +520,9 @@
> - /* Define to 1 if `st_blocks' is a member of `struct stat'. */
> - #undef HAVE_STRUCT_STAT_ST_BLOCKS
> -=20
> -+/* Define to 1 if `c_ospeed' is a member of `struct termios'. */
> -+#undef HAVE_STRUCT_TERMIOS_C_OSPEED
> -+
> - /* Define to 1 if `td_pcb' is a member of `struct thread'. */
> - #undef HAVE_STRUCT_THREAD_TD_PCB
> -=20
> -diff --git a/gdb/configure b/gdb/configure
> -index d0bdba6eb36..8a0e2fa2771 100755
> ---- a/gdb/configure
> -+++ b/gdb/configure
> -@@ -27336,6 +27336,58 @@ if test "$ac_res" !=3D no; then :
> - fi
> -=20
> -=20
> -+# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rates.
> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether cfsetispeed/c=
fsetospeed accept arbitrary baud rates" >&5
> -+$as_echo_n "checking whether cfsetispeed/cfsetospeed accept arbitrary b=
aud rates... " >&6; }
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
> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $gdb_cv_cfsetspeed_arb=
itrary" >&5
> -+$as_echo "$gdb_cv_cfsetspeed_arbitrary" >&6; }
> -+
> -+if test "$gdb_cv_cfsetspeed_arbitrary" =3D yes; then
> -+
> -+$as_echo "#define HAVE_CFSETSPEED_ARBITRARY 1" >>confdefs.h
> -+
> -+fi
> -+
> -+# Check for members required by the legacy Linux custom baud rate path.
> -+ac_fn_c_check_member "$LINENO" "struct termios" "c_ospeed" "ac_cv_membe=
r_struct_termios_c_ospeed" "#include <termios.h>
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
> -=20
> -=20
> - # Check whether --with-jit-reader-dir was given.
> -diff --git a/gdb/configure.ac b/gdb/configure.ac
> -index 52924106bca..26e8d1ee276 100644
> ---- a/gdb/configure.ac
> -+++ b/gdb/configure.ac
> -@@ -733,6 +733,28 @@ AC_CONFIG_FILES([jit-reader.h:jit-reader.in])
> -=20
> - AC_SEARCH_LIBS(dlopen, dl)
> -=20
> -+# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rates.
> -+AC_CACHE_CHECK([whether cfsetispeed/cfsetospeed accept arbitrary baud r=
ates],
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
> -+           [Define if cfsetispeed/cfsetospeed accept arbitrary baud rat=
es])
> -+fi
> -+
> -+# Check for members required by the legacy Linux custom baud rate path.
> -+AC_CHECK_MEMBERS([struct termios.c_ospeed], [], [], [[#include <termios=
.h>]])
> -+
> - GDB_AC_WITH_DIR([JIT_READER_DIR], [jit-reader-dir],
> -                 [directory to load the JIT readers from],
> -                 [${libdir}/gdb])
> -diff --git a/gdb/ser-unix.c b/gdb/ser-unix.c
> -index 6f2766518be..fbd73970dbb 100644
> ---- a/gdb/ser-unix.c
> -+++ b/gdb/ser-unix.c
> -@@ -508,36 +508,59 @@ set_baudcode_baudrate (struct serial *scb, int bau=
d_code)
> -=20
> - #if HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(BOTHER)
> -=20
> --/* Set a custom baud rate using the termios BOTHER.  */
> -+/* Set a custom baud rate.
> -+
> -+   Prefer the POSIX cfsetispeed/cfsetospeed interface when it accepts
> -+   arbitrary baud rates.  Otherwise fall back to Linux-specific termios=
2
> -+   (BOTHER) or legacy termios interfaces.  */
> -=20
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
> -=20
> --  if (ioctl (fd, req_get, &tio) < 0)
> --    perror_with_name (_("Can not get current baud rate"));
> -+  if (ioctl (fd, TCSETS2, &tio2) < 0)
> -+    perror_with_name (_("Cannot set custom baud rate"));
> -+
> -+#elif defined(HAVE_STRUCT_TERMIOS_C_OSPEED)
> -+  struct termios tio;
> -+  if (ioctl (fd, TCGETS, &tio) < 0)
> -+    perror_with_name (_("Cannot get current baud rate"));
> -=20
> --  /* Clear the current output baud rate and fill a new value.  */
> -   tio.c_cflag &=3D ~CBAUD;
> -   tio.c_cflag |=3D BOTHER;
> -   tio.c_ospeed =3D rate;
> --
> --  /* Clear the current input baud rate and fill a new value.  */
> -   tio.c_cflag &=3D ~(CBAUD << IBSHIFT);
> -   tio.c_cflag |=3D BOTHER << IBSHIFT;
> -   tio.c_ispeed =3D rate;
> -=20
> --  if (ioctl (fd, req_set, &tio) < 0)
> --    perror_with_name (_("Can not set custom baud rate"));
> -+  if (ioctl (fd, TCSETS, &tio) < 0)
> -+    perror_with_name (_("Cannot set custom baud rate"));
> -+
> -+#else
> -+  error (_("Custom baud rate not supported on this platform"));
> -+#endif
> - }
> -=20
> - #elif HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(IOSSIOSPEED)
> ---=20
> -2.49.0
> -
> diff --git a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-bui=
ld-failure-on-musl-systems.patch b/meta/recipes-devtools/gdb/gdb/0010-GDB-a=
arch64-linux-Fix-build-failure-on-musl-systems.patch
> deleted file mode 100644
> index 2d91a351d2..0000000000
> --- a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-fail=
ure-on-musl-systems.patch
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
> -  In file included from /home/bauermann/src/binutils-gdb/gdbserver/linux=
-aarch64-low.cc:42:
> -  /home/bauermann/src/binutils-gdb/gdbserver/../gdb/arch/aarch64-gcs-lin=
ux.h:35:8: error: redefinition of 'struct user_gcs'
> -     35 | struct user_gcs
> -        |        ^~~~~~~~
> -  In file included from /home/bauermann/src/binutils-gdb/gdbserver/linux=
-aarch64-low.cc:35:
> -  /usr/include/asm/ptrace.h:329:8: note: previous definition of 'struct =
user_gcs'
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
> -Upstream-Status: Submitted [https://sourceware.org/pipermail/gdb-patches=
/2026-March/226049.html]
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
> -@@ -1684,8 +1684,9 @@ aarch64_linux_iterate_over_regset_sections (struct=
 gdbarch *gdbarch,
> - 	  gcs_regmap, regcache_supply_regset, regcache_collect_regset
> - 	};
> -=20
> --      cb (".reg-aarch-gcs", sizeof (user_gcs), sizeof (user_gcs),
> --	  &aarch64_linux_gcs_regset, "GCS registers", cb_data);
> -+      cb (".reg-aarch-gcs", AARCH64_LINUX_SIZEOF_GCS_REGSET,
> -+	  AARCH64_LINUX_SIZEOF_GCS_REGSET, &aarch64_linux_gcs_regset,
> -+	  "GCS registers", cb_data);
> -     }
> - }
> -=20
> -diff --git a/gdb/arch/aarch64-gcs-linux.h b/gdb/arch/aarch64-gcs-linux.h
> -index 018ca37a522..632823a8120 100644
> ---- a/gdb/arch/aarch64-gcs-linux.h
> -+++ b/gdb/arch/aarch64-gcs-linux.h
> -@@ -27,8 +27,7 @@
> - #define HWCAP_GCS (1ULL << 32)
> - #endif
> -=20
> --/* Make sure we only define these if the kernel header doesn't.  */
> --#ifndef GCS_MAGIC
> -+#ifndef HAVE_STRUCT_USER_GCS
> -=20
> - /* GCS state (NT_ARM_GCS).  */
> -=20
> -@@ -39,6 +38,9 @@ struct user_gcs
> -   uint64_t gcspr_el0;
> - };
> -=20
> --#endif /* GCS_MAGIC */
> -+#endif /* HAVE_STRUCT_USER_GCS */
> -+
> -+/* The GCS regset consists of 3 64-bit registers.  */
> -+#define AARCH64_LINUX_SIZEOF_GCS_REGSET (3 * 8)
> -=20
> - #endif /* GDB_ARCH_AARCH64_GCS_LINUX_H */
> -diff --git a/gdbsupport/config.in b/gdbsupport/config.in
> -index 0beacf22c05..2957ee0f030 100644
> ---- a/gdbsupport/config.in
> -+++ b/gdbsupport/config.in
> -@@ -271,6 +271,9 @@
> - /* Define to 1 if `st_blocks' is a member of `struct stat'. */
> - #undef HAVE_STRUCT_STAT_ST_BLOCKS
> -=20
> -+/* Define to 1 if your system has struct user_gcs. */
> -+#undef HAVE_STRUCT_USER_GCS
> -+
> - /* Define to 1 if you have the <sys/param.h> header file. */
> - #undef HAVE_SYS_PARAM_H
> -=20
> -diff --git a/gdbsupport/configure b/gdbsupport/configure
> -index 133ddfa7f6c..66135791aa5 100755
> ---- a/gdbsupport/configure
> -+++ b/gdbsupport/configure
> -@@ -14307,6 +14307,42 @@ ac_compiler_gnu=3D$ac_cv_c_compiler_gnu
> -=20
> -=20
> -=20
> -+# Check for `struct user_gcs`
> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for struct user_gcs" =
>&5
> -+$as_echo_n "checking for struct user_gcs... " >&6; }
> -+if ${gdb_cv_struct_user_gcs+:} false; then :
> -+  $as_echo_n "(cached) " >&6
> -+else
> -+  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> -+/* end confdefs.h.  */
> -+#include <sys/ptrace.h>
> -+	 #include <asm/ptrace.h>
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
> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $gdb_cv_struct_user_gc=
s" >&5
> -+$as_echo "$gdb_cv_struct_user_gcs" >&6; }
> -+if test "$gdb_cv_struct_user_gcs" =3D yes; then
> -+
> -+$as_echo "#define HAVE_STRUCT_USER_GCS 1" >>confdefs.h
> -+
> -+fi
> -+
> - # Set the 'development' global.
> - . $srcdir/../bfd/development.sh
> -=20
> -diff --git a/gdbsupport/configure.ac b/gdbsupport/configure.ac
> -index b7ccfabd6c6..d3b4c05daeb 100644
> ---- a/gdbsupport/configure.ac
> -+++ b/gdbsupport/configure.ac
> -@@ -68,6 +68,25 @@ GDB_AC_PTRACE
> - AM_GDB_COMPILER_TYPE
> - AM_GDB_WARNINGS
> -=20
> -+# Check for `struct user_gcs`
> -+AC_CACHE_CHECK(
> -+  [for struct user_gcs],
> -+  [gdb_cv_struct_user_gcs],
> -+  [AC_COMPILE_IFELSE(
> -+     [AC_LANG_PROGRAM(
> -+	[#include <sys/ptrace.h>
> -+	 #include <asm/ptrace.h>],
> -+	[struct user_gcs u;]
> -+      )],
> -+     [gdb_cv_struct_user_gcs=3Dyes],
> -+     [gdb_cv_struct_user_gcs=3Dno]
> -+  )]
> -+)
> -+if test "$gdb_cv_struct_user_gcs" =3D yes; then
> -+  AC_DEFINE(HAVE_STRUCT_USER_GCS, 1,
> -+	    [Define to 1 if your system has struct user_gcs.])
> -+fi
> -+
> - # Set the 'development' global.
> - . $srcdir/../bfd/development.sh
> -=20
> ---=20
> -2.49.0
> -
> diff --git a/meta/recipes-devtools/gdb/gdb_17.1.bb b/meta/recipes-devtool=
s/gdb/gdb_17.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb_17.1.bb
> rename to meta/recipes-devtools/gdb/gdb_17.2.bb


--=20
Yoann Congal
Smile ECS


