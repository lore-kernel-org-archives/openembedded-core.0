Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B63C44509
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 16:37:13 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1849.1783701423897572460
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 09:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=t0Gv/ORE;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so8414835e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783701422; x=1784306222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zXY9HEBPIXXxf+Hf7T5eH9vLsSEqbQSEa5VBsdUq3sw=;
        b=t0Gv/ORE3S8J5PZyRweucZdOKeV9MJA2HcMA+HPUi3OHIB+MXokqQEVt7Dn9DoEw2G
         AbtNlnqfF6ZeVPOBWZIFPCHkrI2is+KzG31KKzlbAA4RfP+GajYCvy8lzCUjAifKWAcj
         MpMyO4+thED6pmMCkzitQh58PEGWjrLR7+gqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701422; x=1784306222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zXY9HEBPIXXxf+Hf7T5eH9vLsSEqbQSEa5VBsdUq3sw=;
        b=guFXhoHkSboQ0DbQAds816jul4b8kR1xq3Q76MSh2Y4ZFQyef+G2sibSjym8Z0LCGU
         7qC+MqEvgL2AcvHArQyHMqQCHB51+XebaS8VFT+cB3U9TVl+YNiujU62XJJ7596yDk87
         AJ8LTU0EWYE4R9UpBSUU4g53FawJXi7pTucyYALmuvnawNL1vn9STlt3JQZNAl5DAe5M
         RBe+zbdrvoqE3Vjv1PSvYVpoDzv2THvoUihUaWdIFuU/SE5XbarlzM2z22SSGdZfOfB0
         0zPKYr0JToKlNW+XOEupFsVxYIxOTSG3yP0WKR7VHQNCs5MttxVEUJIAH+2HoV4Vlz2B
         /qkQ==
X-Gm-Message-State: AOJu0Yxrene8YgEbPQKtcwd5YxGn7H1OMNq/h6fniEs4PWUgzqbE7mmJ
	QB1VQGshFeJISObWtnZYHMwcIGMRgbJ9SoQIZmi3W4wWpcTanpCmT9dTWGldMs28ilrkLjl8tdm
	vYvPW/rE=
X-Gm-Gg: AfdE7ck9PJ8gz6xVJwDp0tHQRXPBSgm+/InnKJ3ibGe4Zc1csKlrzImJBPjzsIbkyxD
	0wDk8JmLEjzoT0gAec289ApGCCsw/ACZOYEJTn5WafqvnioNXGCrAsDzlfoGp9Jc0cP4BSV3Q0P
	r6pzDypOa+NpQ1J2pdT/rG+WPlcubUM5L5LUbGSGyy219xGKepfI59L6u/pY6wbMvgzSVOqZYAB
	+RVGK67xU5CxaWyfzPJLv8iqJ3pTmrvhGgfetw7EuEfCB+K2u4zQud98V6ww92kqKm9AYnMfGPw
	6y32fm13oO5Ziq+MHwz/2FDZyAtFTabtDwBx3J3avnhuCSj2xmRYTP3Ng0LSdmLAOaetQ7jTKDR
	H2n51jwX8c3p/Dn7aSsbXd1hyHSkNcOpDS4e/Oueej+Uorn4FdQgNPf/cECXay8pio5QLw9Kj7e
	bxVw6Zv7J+VObd5SW0KOa71fWiBWrg3nIa55BmoOd+7+rKNt3d2E7rtsGUzzdntpxdHTp6hxclm
	gDILCUsyuJpGvyYH0s=
X-Received: by 2002:a05:600c:1914:b0:493:bcba:46a4 with SMTP id 5b1f17b1804b1-493e68df746mr119940605e9.20.1783701421590;
        Fri, 10 Jul 2026 09:37:01 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-2608-8c5f-3a92-eb6f-dc01-ac58.rev.sfr.net. [2a02:8440:2608:8c5f:3a92:eb6f:dc01:ac58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d4f9fsm150758695e9.4.2026.07.10.09.37.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:37:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 01/18] gdb: Upgrade 17.1 -> 17.2
Date: Fri, 10 Jul 2026 18:36:16 +0200
Message-ID: <c85083efc86e2fd120d314bf0de32342894dc8d2.1783697455.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783697455.git.yoann.congal@smile.fr>
References: <cover.1783697455.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 16:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240662

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

This is a corrective release over GDB 17.1, fixing the following issues:

 * PR dap/33228 ([gdb/dap] error while listing register children)

 * PR gdb/33737 (gdb --help says 'For more information, type "stream"
   from within GDB', but "stream" is not a defined command)

 * PR build/33747 (Incompatible with MUSL libc: no member named 'c_ospeed'
   in 'termios')

 * PR gdb/33748 (gdb17 regression with displaying ANSI colors)

 * PR gdb/33753 (Out-of-bounds writes in string_{v}printf -- threads
   and static data don't mix)

 * PR cli/33761 (Setting style colors is broken on MS-Windows)

 * PR gdb/33768 (Loading compressed GDB scripts from .debug_gdb_scripts fails)

 * PR symtab/33775 ([gdb/symtab] data race in
   dwarf2_per_cu::{set_addr_size,set_offset_size,set_ref_addr_size})

 * PR symtab/33777 ([gdb/symtab] dw2_get_file_names doesn't cache result
   for dummy CU)

 * PR symtab/33825 ([dwz] Extremely slow symbol lookup with DWZ-compressed
   debug info (thousands of partial units))

 * PR testsuite/33845 (gdb: There are 4 unexpected failures in
   breakpoint-in-ro-region.exp)

 * PR gdb/33872 (`skip -gfile` has inverted logic)

 * PR gdb/33926 (GDB 17.1 AArch64: redefinition of user_gcs struct on musl)

 * PR breakpoints/34112 (rbreak `file:regex` sets breakpoints for matches
   outside of `file` [reproducer attached])

Although gdb 17.2 includes the commit 17d05df7da1
("gdb/ser-unix: add POSIX cfsetispeed/cfsetospeed support for custom baud rates"),
which appears to be a feature addition, it is actually the upstream integration of
the previously carried patch
0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch for PR build/33747.
As such, it is appropriate for this corrective release.

Drop patches merged upstream:
  * 0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
      * PR build/33747 (Incompatible with MUSL libc: no member named 'c_ospeed'
        in 'termios')
  * 0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
      * PR gdb/33926 (GDB 17.1 AArch64: redefinition of user_gcs struct on musl)

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ian_17.1.bb => gdb-cross-canadian_17.2.bb} |   0
 .../{gdb-cross_17.1.bb => gdb-cross_17.2.bb}  |   0
 meta/recipes-devtools/gdb/gdb.inc             |   4 +-
 ...-ser-unix-modernize-Linux-custom-bau.patch | 248 ------------------
 ...ux-Fix-build-failure-on-musl-systems.patch | 196 --------------
 .../gdb/{gdb_17.1.bb => gdb_17.2.bb}          |   0
 6 files changed, 1 insertion(+), 447 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_17.1.bb => gdb-cross-canadian_17.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_17.1.bb => gdb-cross_17.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
 rename meta/recipes-devtools/gdb/{gdb_17.1.bb => gdb_17.2.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_17.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_17.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_17.1.bb b/meta/recipes-devtools/gdb/gdb-cross_17.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_17.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_17.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index d367486d026..cbb58854598 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -13,7 +13,5 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0006-Fix-invalid-sigprocmask-call.patch \
            file://0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            file://0008-Add-fix-for-packages-that-are-not-compatible-with-C2.patch \
-           file://0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch \
-           file://0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch \
            "
-SRC_URI[sha256sum] = "14996f5f74c9f68f5a543fdc45bca7800207f91f92aeea6c2e791822c7c6d876"
+SRC_URI[sha256sum] = "1c036c0d72e4b3d1fb5c94c88632add6f9d76f4d7c4d2ea793c12a9f19a3228c"
diff --git a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch b/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
deleted file mode 100644
index 30d22b21f92..00000000000
--- a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
+++ /dev/null
@@ -1,248 +0,0 @@
-From 1a77c71303b552140613d49595baebdff1a4716e Mon Sep 17 00:00:00 2001
-From: Sunil Dora <sunilkumar.dora@windriver.com>
-Date: Tue, 17 Mar 2026 01:58:55 -0700
-Subject: [PATCH] PR gdb/33747: gdb/ser-unix: modernize Linux custom baud rate
- support
-
-The Linux custom baud rate implementation previously accessed the
-struct termios members c_ispeed and c_ospeed directly. These fields
-exist in glibc but are not exposed by musl, causing builds to fail on
-musl-based systems.
-
-Update set_custom_baudrate_linux to use a capability-based approach,
-with three distinct code paths:
-
-1) If POSIX cfsetispeed/cfsetospeed accept arbitrary baud rates
-   (HAVE_CFSETSPEED_ARBITRARY), use them to set input and output
-   speeds.
-
-2) Else if Linux termios2 interface is available (TCGETS2/BOTHER),
-   use it to support arbitrary baud rates.
-
-3) Else if legacy struct termios supports c_ispeed/c_ospeed, use
-   the TCGETS/TCSETS fallback (primarily for glibc on older
-   architectures).
-
-4) Otherwise, emit an error indicating that custom baud rates are
-   unsupported on this platform.
-
-This preserves existing behavior on glibc systems while restoring
-build compatibility with musl and other libc implementations.
-
-Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=33747
-
-Upstream-Status: Submitted [https://sourceware.org/pipermail/gdb-patches/2026-March/225952.html]
-
-Suggested-by: Kevin Buettner <kevinb@redhat.com>
-Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- gdb/config.in    |  6 ++++++
- gdb/configure    | 52 +++++++++++++++++++++++++++++++++++++++++++++
- gdb/configure.ac | 22 +++++++++++++++++++
- gdb/ser-unix.c   | 55 ++++++++++++++++++++++++++++++++++--------------
- 4 files changed, 119 insertions(+), 16 deletions(-)
-
-diff --git a/gdb/config.in b/gdb/config.in
-index efc3100cb9e..b2469c8dabd 100644
---- a/gdb/config.in
-+++ b/gdb/config.in
-@@ -110,6 +110,9 @@
-    the CoreFoundation framework. */
- #undef HAVE_CFPREFERENCESCOPYAPPVALUE
- 
-+/* Define if cfsetispeed/cfsetospeed accept arbitrary baud rates */
-+#undef HAVE_CFSETSPEED_ARBITRARY
-+
- /* Define if compiling support to gdb compile. */
- #undef HAVE_COMPILE
- 
-@@ -517,6 +520,9 @@
- /* Define to 1 if `st_blocks' is a member of `struct stat'. */
- #undef HAVE_STRUCT_STAT_ST_BLOCKS
- 
-+/* Define to 1 if `c_ospeed' is a member of `struct termios'. */
-+#undef HAVE_STRUCT_TERMIOS_C_OSPEED
-+
- /* Define to 1 if `td_pcb' is a member of `struct thread'. */
- #undef HAVE_STRUCT_THREAD_TD_PCB
- 
-diff --git a/gdb/configure b/gdb/configure
-index d0bdba6eb36..8a0e2fa2771 100755
---- a/gdb/configure
-+++ b/gdb/configure
-@@ -27336,6 +27336,58 @@ if test "$ac_res" != no; then :
- fi
- 
- 
-+# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rates.
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether cfsetispeed/cfsetospeed accept arbitrary baud rates" >&5
-+$as_echo_n "checking whether cfsetispeed/cfsetospeed accept arbitrary baud rates... " >&6; }
-+if ${gdb_cv_cfsetspeed_arbitrary+:} false; then :
-+  $as_echo_n "(cached) " >&6
-+else
-+
-+  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-+/* end confdefs.h.  */
-+#include <termios.h>
-+int
-+main ()
-+{
-+
-+       #if B9600 != 9600
-+       #error B-constants are not numeric symbols
-+       #endif
-+
-+  ;
-+  return 0;
-+}
-+_ACEOF
-+if ac_fn_c_try_compile "$LINENO"; then :
-+  gdb_cv_cfsetspeed_arbitrary=yes
-+else
-+  gdb_cv_cfsetspeed_arbitrary=no
-+fi
-+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-+
-+fi
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $gdb_cv_cfsetspeed_arbitrary" >&5
-+$as_echo "$gdb_cv_cfsetspeed_arbitrary" >&6; }
-+
-+if test "$gdb_cv_cfsetspeed_arbitrary" = yes; then
-+
-+$as_echo "#define HAVE_CFSETSPEED_ARBITRARY 1" >>confdefs.h
-+
-+fi
-+
-+# Check for members required by the legacy Linux custom baud rate path.
-+ac_fn_c_check_member "$LINENO" "struct termios" "c_ospeed" "ac_cv_member_struct_termios_c_ospeed" "#include <termios.h>
-+"
-+if test "x$ac_cv_member_struct_termios_c_ospeed" = xyes; then :
-+
-+cat >>confdefs.h <<_ACEOF
-+#define HAVE_STRUCT_TERMIOS_C_OSPEED 1
-+_ACEOF
-+
-+
-+fi
-+
-+
- 
- 
- # Check whether --with-jit-reader-dir was given.
-diff --git a/gdb/configure.ac b/gdb/configure.ac
-index 52924106bca..26e8d1ee276 100644
---- a/gdb/configure.ac
-+++ b/gdb/configure.ac
-@@ -733,6 +733,28 @@ AC_CONFIG_FILES([jit-reader.h:jit-reader.in])
- 
- AC_SEARCH_LIBS(dlopen, dl)
- 
-+# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rates.
-+AC_CACHE_CHECK([whether cfsetispeed/cfsetospeed accept arbitrary baud rates],
-+  [gdb_cv_cfsetspeed_arbitrary], [
-+  AC_COMPILE_IFELSE(
-+    [AC_LANG_PROGRAM([[#include <termios.h>]],
-+      [[
-+       #if B9600 != 9600
-+       #error B-constants are not numeric symbols
-+       #endif
-+      ]])],
-+    [gdb_cv_cfsetspeed_arbitrary=yes],
-+    [gdb_cv_cfsetspeed_arbitrary=no])
-+])
-+
-+if test "$gdb_cv_cfsetspeed_arbitrary" = yes; then
-+  AC_DEFINE([HAVE_CFSETSPEED_ARBITRARY], [1],
-+           [Define if cfsetispeed/cfsetospeed accept arbitrary baud rates])
-+fi
-+
-+# Check for members required by the legacy Linux custom baud rate path.
-+AC_CHECK_MEMBERS([struct termios.c_ospeed], [], [], [[#include <termios.h>]])
-+
- GDB_AC_WITH_DIR([JIT_READER_DIR], [jit-reader-dir],
-                 [directory to load the JIT readers from],
-                 [${libdir}/gdb])
-diff --git a/gdb/ser-unix.c b/gdb/ser-unix.c
-index 6f2766518be..fbd73970dbb 100644
---- a/gdb/ser-unix.c
-+++ b/gdb/ser-unix.c
-@@ -508,36 +508,59 @@ set_baudcode_baudrate (struct serial *scb, int baud_code)
- 
- #if HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(BOTHER)
- 
--/* Set a custom baud rate using the termios BOTHER.  */
-+/* Set a custom baud rate.
-+
-+   Prefer the POSIX cfsetispeed/cfsetospeed interface when it accepts
-+   arbitrary baud rates.  Otherwise fall back to Linux-specific termios2
-+   (BOTHER) or legacy termios interfaces.  */
- 
- static void
- set_custom_baudrate_linux (int fd, int rate)
- {
--#ifdef TCGETS2
--  struct termios2 tio;
--  const unsigned long req_get = TCGETS2;
--  const unsigned long req_set = TCSETS2;
--#else
-+#if defined(HAVE_CFSETSPEED_ARBITRARY)
-   struct termios tio;
--  const unsigned long req_get = TCGETS;
--  const unsigned long req_set = TCSETS;
--#endif
-+  if (tcgetattr (fd, &tio) < 0)
-+    perror_with_name (_("Cannot get current baud rate"));
-+
-+  cfsetispeed (&tio, rate);
-+  cfsetospeed (&tio, rate);
-+
-+  if (tcsetattr (fd, TCSANOW, &tio) < 0)
-+    perror_with_name (_("Cannot set custom baud rate"));
-+
-+#elif defined(TCGETS2)
-+  struct termios2 tio2;
-+  if (ioctl (fd, TCGETS2, &tio2) < 0)
-+    perror_with_name (_("Cannot get current baud rate"));
-+
-+  tio2.c_cflag &= ~CBAUD;
-+  tio2.c_cflag |= BOTHER;
-+  tio2.c_ospeed = rate;
-+  tio2.c_cflag &= ~(CBAUD << IBSHIFT);
-+  tio2.c_cflag |= BOTHER << IBSHIFT;
-+  tio2.c_ispeed = rate;
- 
--  if (ioctl (fd, req_get, &tio) < 0)
--    perror_with_name (_("Can not get current baud rate"));
-+  if (ioctl (fd, TCSETS2, &tio2) < 0)
-+    perror_with_name (_("Cannot set custom baud rate"));
-+
-+#elif defined(HAVE_STRUCT_TERMIOS_C_OSPEED)
-+  struct termios tio;
-+  if (ioctl (fd, TCGETS, &tio) < 0)
-+    perror_with_name (_("Cannot get current baud rate"));
- 
--  /* Clear the current output baud rate and fill a new value.  */
-   tio.c_cflag &= ~CBAUD;
-   tio.c_cflag |= BOTHER;
-   tio.c_ospeed = rate;
--
--  /* Clear the current input baud rate and fill a new value.  */
-   tio.c_cflag &= ~(CBAUD << IBSHIFT);
-   tio.c_cflag |= BOTHER << IBSHIFT;
-   tio.c_ispeed = rate;
- 
--  if (ioctl (fd, req_set, &tio) < 0)
--    perror_with_name (_("Can not set custom baud rate"));
-+  if (ioctl (fd, TCSETS, &tio) < 0)
-+    perror_with_name (_("Cannot set custom baud rate"));
-+
-+#else
-+  error (_("Custom baud rate not supported on this platform"));
-+#endif
- }
- 
- #elif HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(IOSSIOSPEED)
--- 
-2.49.0
-
diff --git a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch b/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
deleted file mode 100644
index 2d91a351d2b..00000000000
--- a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
+++ /dev/null
@@ -1,196 +0,0 @@
-From 654223c799910837c80d0964a971fbdf7808864a Mon Sep 17 00:00:00 2001
-From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
-Date: Tue, 17 Mar 2026 02:24:48 -0700
-Subject: [PATCH] GDB: aarch64-linux: Fix build failure on musl systems
-
-(cherry picked from commit 02090062127d59978ccc312dabf63c6ea838cd85)
-
-When building against musl (e.g. on Alpine Linux), the following error
-happens:
-
-    CXX    linux-aarch64-low.o
-  In file included from /home/bauermann/src/binutils-gdb/gdbserver/linux-aarch64-low.cc:42:
-  /home/bauermann/src/binutils-gdb/gdbserver/../gdb/arch/aarch64-gcs-linux.h:35:8: error: redefinition of 'struct user_gcs'
-     35 | struct user_gcs
-        |        ^~~~~~~~
-  In file included from /home/bauermann/src/binutils-gdb/gdbserver/linux-aarch64-low.cc:35:
-  /usr/include/asm/ptrace.h:329:8: note: previous definition of 'struct user_gcs'
-    329 | struct user_gcs {
-        |        ^~~~~~~~
-  make[2]: *** [Makefile:565: linux-aarch64-low.o] Error 1
-
-aarch64-linux-tdep.c fails to build in the same way.  This happens because
-aarch64-gcs-linux.h uses GCS_MAGIC to see whether the system headers
-have GCS-related definitions.  The problem is that GCS_MAGIC is defined in
-<asm/sigcontext.h> while struct gcs_user is defined in <asm/ptrace.h>.
-It's fine on glibc systems because in the set of system headers that
-linux-aarch64-low.cc and aarch64-linux-tdep.c include, <asm/sigcontext.h>
-ends up being included implicitly as well.  This doesn't happen when using
-musl's headers though.
-
-There isn't a macro in <asm/ptrace.h> whose presence is correlated with
-the presence of the struct user_gcs definition, so a configure check is
-needed to detect it and conditionally define the struct.
-
-Also, this change requires aarch64-linux-tdep.c to stop using
-struct user_gcs because target-dependent code can't include <asm/ptrace.h>
-and thus even if HAVE_STRUCT_USER_GCS is set, the file won't have the
-struct definition available. To fix this problem, also backport the
-definition of AARCH64_LINUX_SIZEOF_GCS_REGSET and use it there.
-
-Note that there's another build issue with musl, described in
-PR gdb/33747 affecting compilation of gdb/ser-unix.c.  In order to be
-able to test this patch, I applied the patch in comment 11 there.
-
-Tested with a native build on an Alpine Linux aarch64 system, and also
-verified that all gdb.arch/aarch64-gcs*.exp tests pass on it.
-
-Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=33926
-
-Upstream-Status: Submitted [https://sourceware.org/pipermail/gdb-patches/2026-March/226049.html]
-
-Co-authored-by: Chris Packham <judge.packham@gmail.com>
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- gdb/aarch64-linux-tdep.c     |  5 +++--
- gdb/arch/aarch64-gcs-linux.h |  8 +++++---
- gdbsupport/config.in         |  3 +++
- gdbsupport/configure         | 36 ++++++++++++++++++++++++++++++++++++
- gdbsupport/configure.ac      | 19 +++++++++++++++++++
- 5 files changed, 66 insertions(+), 5 deletions(-)
-
-diff --git a/gdb/aarch64-linux-tdep.c b/gdb/aarch64-linux-tdep.c
-index 76bde85188b..6c402e7ecdd 100644
---- a/gdb/aarch64-linux-tdep.c
-+++ b/gdb/aarch64-linux-tdep.c
-@@ -1684,8 +1684,9 @@ aarch64_linux_iterate_over_regset_sections (struct gdbarch *gdbarch,
- 	  gcs_regmap, regcache_supply_regset, regcache_collect_regset
- 	};
- 
--      cb (".reg-aarch-gcs", sizeof (user_gcs), sizeof (user_gcs),
--	  &aarch64_linux_gcs_regset, "GCS registers", cb_data);
-+      cb (".reg-aarch-gcs", AARCH64_LINUX_SIZEOF_GCS_REGSET,
-+	  AARCH64_LINUX_SIZEOF_GCS_REGSET, &aarch64_linux_gcs_regset,
-+	  "GCS registers", cb_data);
-     }
- }
- 
-diff --git a/gdb/arch/aarch64-gcs-linux.h b/gdb/arch/aarch64-gcs-linux.h
-index 018ca37a522..632823a8120 100644
---- a/gdb/arch/aarch64-gcs-linux.h
-+++ b/gdb/arch/aarch64-gcs-linux.h
-@@ -27,8 +27,7 @@
- #define HWCAP_GCS (1ULL << 32)
- #endif
- 
--/* Make sure we only define these if the kernel header doesn't.  */
--#ifndef GCS_MAGIC
-+#ifndef HAVE_STRUCT_USER_GCS
- 
- /* GCS state (NT_ARM_GCS).  */
- 
-@@ -39,6 +38,9 @@ struct user_gcs
-   uint64_t gcspr_el0;
- };
- 
--#endif /* GCS_MAGIC */
-+#endif /* HAVE_STRUCT_USER_GCS */
-+
-+/* The GCS regset consists of 3 64-bit registers.  */
-+#define AARCH64_LINUX_SIZEOF_GCS_REGSET (3 * 8)
- 
- #endif /* GDB_ARCH_AARCH64_GCS_LINUX_H */
-diff --git a/gdbsupport/config.in b/gdbsupport/config.in
-index 0beacf22c05..2957ee0f030 100644
---- a/gdbsupport/config.in
-+++ b/gdbsupport/config.in
-@@ -271,6 +271,9 @@
- /* Define to 1 if `st_blocks' is a member of `struct stat'. */
- #undef HAVE_STRUCT_STAT_ST_BLOCKS
- 
-+/* Define to 1 if your system has struct user_gcs. */
-+#undef HAVE_STRUCT_USER_GCS
-+
- /* Define to 1 if you have the <sys/param.h> header file. */
- #undef HAVE_SYS_PARAM_H
- 
-diff --git a/gdbsupport/configure b/gdbsupport/configure
-index 133ddfa7f6c..66135791aa5 100755
---- a/gdbsupport/configure
-+++ b/gdbsupport/configure
-@@ -14307,6 +14307,42 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
- 
- 
- 
-+# Check for `struct user_gcs`
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for struct user_gcs" >&5
-+$as_echo_n "checking for struct user_gcs... " >&6; }
-+if ${gdb_cv_struct_user_gcs+:} false; then :
-+  $as_echo_n "(cached) " >&6
-+else
-+  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-+/* end confdefs.h.  */
-+#include <sys/ptrace.h>
-+	 #include <asm/ptrace.h>
-+int
-+main ()
-+{
-+struct user_gcs u;
-+
-+  ;
-+  return 0;
-+}
-+_ACEOF
-+if ac_fn_c_try_compile "$LINENO"; then :
-+  gdb_cv_struct_user_gcs=yes
-+else
-+  gdb_cv_struct_user_gcs=no
-+
-+fi
-+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-+
-+fi
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $gdb_cv_struct_user_gcs" >&5
-+$as_echo "$gdb_cv_struct_user_gcs" >&6; }
-+if test "$gdb_cv_struct_user_gcs" = yes; then
-+
-+$as_echo "#define HAVE_STRUCT_USER_GCS 1" >>confdefs.h
-+
-+fi
-+
- # Set the 'development' global.
- . $srcdir/../bfd/development.sh
- 
-diff --git a/gdbsupport/configure.ac b/gdbsupport/configure.ac
-index b7ccfabd6c6..d3b4c05daeb 100644
---- a/gdbsupport/configure.ac
-+++ b/gdbsupport/configure.ac
-@@ -68,6 +68,25 @@ GDB_AC_PTRACE
- AM_GDB_COMPILER_TYPE
- AM_GDB_WARNINGS
- 
-+# Check for `struct user_gcs`
-+AC_CACHE_CHECK(
-+  [for struct user_gcs],
-+  [gdb_cv_struct_user_gcs],
-+  [AC_COMPILE_IFELSE(
-+     [AC_LANG_PROGRAM(
-+	[#include <sys/ptrace.h>
-+	 #include <asm/ptrace.h>],
-+	[struct user_gcs u;]
-+      )],
-+     [gdb_cv_struct_user_gcs=yes],
-+     [gdb_cv_struct_user_gcs=no]
-+  )]
-+)
-+if test "$gdb_cv_struct_user_gcs" = yes; then
-+  AC_DEFINE(HAVE_STRUCT_USER_GCS, 1,
-+	    [Define to 1 if your system has struct user_gcs.])
-+fi
-+
- # Set the 'development' global.
- . $srcdir/../bfd/development.sh
- 
--- 
-2.49.0
-
diff --git a/meta/recipes-devtools/gdb/gdb_17.1.bb b/meta/recipes-devtools/gdb/gdb_17.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_17.1.bb
rename to meta/recipes-devtools/gdb/gdb_17.2.bb

