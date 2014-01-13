Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id C13C06B5FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 17:26:56 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id cc10so1392556wib.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 09:26:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=TdS83XMCGosZU5qSmnt3JCcHrr82PzwVONhpoxh1XoY=;
	b=BZR08lDr5Fj/D010sCaIpEAnzJDEXtKcbLNHI5sV7yXBfbHxhrIW3OKcFs/Iwz7wN9
	+REGl+MLnq42MWVSput8THIraHMQx9TJiNt0n1t3V/c8keFB1/zX3R9wPFYIZKZMulrf
	rR+Rq044zwGQze/c3qGOitBp2PaUd8SObR7niAvZpQNIjF/Ucly8G0w0qmNX/rkf6QuK
	CS7xaFxMUH1BuO6DEYt3WragZG+pgCNetg5Kqb1E3C+mle68f0CFlM2EXk13oyxLNW0+
	4pTmMOL/4lqIMlRNN12VdUHJUGEWa/LdBztBE1Nocg/sxJatXloAtQuAzmm64Zjjsqfs
	oThw==
X-Gm-Message-State: ALoCoQmasHlFGAfWNYbnwQQ2XoYpSMCqXxpeMVcnBn6l0dD075TjQnG9ukSmcVWR98oDHHBfdLUe
X-Received: by 10.180.90.79 with SMTP id bu15mr16202879wib.33.1389634017255;
	Mon, 13 Jan 2014 09:26:57 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id cx3sm19648143wib.0.2014.01.13.09.26.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Jan 2014 09:26:56 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jan 2014 17:26:51 +0000
Message-Id: <1389634011-6904-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] grub-efi: remove configure patch, simply seed the cache
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Jan 2014 17:26:59 -0000

grub-2.00-disable-help2man patches configure.ac to disable the help2man check
because we don't need the man pages.  It also then patches configure itself so
that autogen.sh doesn't have to be called for performance reasons.  However,
do_configure causes a full autoreconf so this optimisation is moot, and can
cause patch failures when an existing build tree is re-used.

Instead, simply use CACHED_CONFIGUREVARS to tell configure that it can't find
help2man.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../grub/files/grub-2.00-disable-help2man.patch    |  148 --------------------
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |    2 +-
 2 files changed, 1 insertion(+), 149 deletions(-)
 delete mode 100644 meta/recipes-bsp/grub/files/grub-2.00-disable-help2man.patch

diff --git a/meta/recipes-bsp/grub/files/grub-2.00-disable-help2man.patch b/meta/recipes-bsp/grub/files/grub-2.00-disable-help2man.patch
deleted file mode 100644
index a2e42c2..0000000
--- a/meta/recipes-bsp/grub/files/grub-2.00-disable-help2man.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-Upstream-Status: Inappropriate (Bitbake build environment)
-
-We do not need the man pages when building just the EFI payload for the target,
-all the tools are built for the host. This does not trigger GRUB's built-in
-cross-compilation check, so force it. After the change to configure.ac,
-autogen.sh was run in devshell and the resulting configure was used to generate
-the configure diff. The configure diff was included to avoid having to add
-autogen.sh to a do_configure_prepend() routine which would slow down the build
-unnecessarily.
-
-Signed-off-by: Darren Hart <dvhart@linux.intel.com>
-
-Index: grub-2.00/configure.ac
-===================================================================
---- grub-2.00.orig/configure.ac
-+++ grub-2.00/configure.ac
-@@ -310,11 +310,12 @@ if test x$USE_NLS = xno; then
-   HOST_CFLAGS="$HOST_CFLAGS -fno-builtin-gettext"
- fi
- 
--if test "x$cross_compiling" = xyes; then
--  AC_MSG_WARN([cannot generate manual pages while cross compiling])
--else
--  AC_PATH_PROG(HELP2MAN, help2man)
--fi
-+# Force behaving as though we are cross-compiling with respect to HELP2MAN
-+#if test "x$cross_compiling" = xyes; then
-+AC_MSG_WARN([cannot generate manual pages while cross compiling])
-+#else
-+#  AC_PATH_PROG(HELP2MAN, help2man)
-+#fi
- 
- # Check for functions and headers.
- AC_CHECK_FUNCS(posix_memalign memalign asprintf vasprintf getextmntent)
-Index: grub-2.00/configure
-===================================================================
---- grub-2.00.orig/configure
-+++ grub-2.00/configure
-@@ -1215,7 +1215,6 @@ GL_COND_LIBTOOL_FALSE
- GL_COND_LIBTOOL_TRUE
- BUILD_CC
- LIBUTIL
--HELP2MAN
- POSUB
- LTLIBINTL
- LIBINTL
-@@ -3069,7 +3068,6 @@ _ACEOF
- # Let the site file select an alternate cache file if it wants to.
- # Prefer an explicitly selected file to automatically selected ones.
- ac_site_file1=NONE
--ac_site_file2=NONE
- if test -n "$CONFIG_SITE"; then
-   # We do not want a PATH search for config.site.
-   case $CONFIG_SITE in #((
-@@ -3077,14 +3075,8 @@ if test -n "$CONFIG_SITE"; then
-     */*) ac_site_file1=$CONFIG_SITE;;
-     *)   ac_site_file1=./$CONFIG_SITE;;
-   esac
--elif test "x$prefix" != xNONE; then
--  ac_site_file1=$prefix/share/config.site
--  ac_site_file2=$prefix/etc/config.site
--else
--  ac_site_file1=$ac_default_prefix/share/config.site
--  ac_site_file2=$ac_default_prefix/etc/config.site
- fi
--for ac_site_file in "$ac_site_file1" "$ac_site_file2"
-+for ac_site_file in $ac_site_file1
- do
-   test "x$ac_site_file" = xNONE && continue
-   if test /dev/null != "$ac_site_file" && test -r "$ac_site_file"; then
-@@ -3371,8 +3363,9 @@ case $target_os in *\ *) target_os=`echo
- # The aliases save the names the user supplied, while $host etc.
- # will get canonicalized.
- test -n "$target_alias" &&
--  test "$program_prefix$program_suffix$program_transform_name" = \
--    NONENONEs,x,x, &&
-+  test "$target_alias" != "$host_alias" &&
-+    test "$program_prefix$program_suffix$program_transform_name" = \
-+      NONENONEs,x,x, &&
-   program_prefix=${target_alias}-
- 
- am__api_version='1.11'
-@@ -9633,51 +9626,13 @@ if test x$USE_NLS = xno; then
-   HOST_CFLAGS="$HOST_CFLAGS -fno-builtin-gettext"
- fi
- 
--if test "x$cross_compiling" = xyes; then
--  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: cannot generate manual pages while cross compiling" >&5
-+# Force behaving as though we are cross-compiling with respect to HELP2MAN
-+#if test "x$cross_compiling" = xyes; then
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: cannot generate manual pages while cross compiling" >&5
- $as_echo "$as_me: WARNING: cannot generate manual pages while cross compiling" >&2;}
--else
--  # Extract the first word of "help2man", so it can be a program name with args.
--set dummy help2man; ac_word=$2
--{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
--$as_echo_n "checking for $ac_word... " >&6; }
--if ${ac_cv_path_HELP2MAN+:} false; then :
--  $as_echo_n "(cached) " >&6
--else
--  case $HELP2MAN in
--  [\\/]* | ?:[\\/]*)
--  ac_cv_path_HELP2MAN="$HELP2MAN" # Let the user override the test with a path.
--  ;;
--  *)
--  as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
--for as_dir in $PATH
--do
--  IFS=$as_save_IFS
--  test -z "$as_dir" && as_dir=.
--    for ac_exec_ext in '' $ac_executable_extensions; do
--  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
--    ac_cv_path_HELP2MAN="$as_dir/$ac_word$ac_exec_ext"
--    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
--    break 2
--  fi
--done
--  done
--IFS=$as_save_IFS
--
--  ;;
--esac
--fi
--HELP2MAN=$ac_cv_path_HELP2MAN
--if test -n "$HELP2MAN"; then
--  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $HELP2MAN" >&5
--$as_echo "$HELP2MAN" >&6; }
--else
--  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
--$as_echo "no" >&6; }
--fi
--
--
--fi
-+#else
-+#  AC_PATH_PROG(HELP2MAN, help2man)
-+#fi
- 
- # Check for functions and headers.
- for ac_func in posix_memalign memalign asprintf vasprintf getextmntent
-@@ -20477,6 +20432,7 @@ $as_echo_n "checking whether \`$CC' gene
- cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
- 
-+void g (int);
- void f (int (*p) (void));
- void g (int i)
- {
diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index deb9514..e02def3 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -22,7 +22,6 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://cfg \
            file://grub-2.00-fpmath-sse-387-fix.patch \
            file://grub-2.00-fix-enable_execute_stack-check.patch \
-           file://grub-2.00-disable-help2man.patch \
            file://check-if-liblzma-is-disabled.patch \
            file://grub-no-unused-result.patch \
            file://grub-2.00-ignore-gnulib-gets-stupidity.patch \
@@ -56,6 +55,7 @@ inherit autotools
 inherit gettext
 inherit deploy
 
+CACHED_CONFIGUREVARS += "ac_cv_path_HELP2MAN="
 EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
                 --enable-efiemu=no --program-prefix='' \
                 --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
-- 
1.7.10.4


