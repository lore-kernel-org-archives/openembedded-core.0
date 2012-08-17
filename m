Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1T2MPe-0005mr-Nc
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 15:16:31 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Aug 2012 06:04:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,784,1336374000"; 
	d="scan'208,217";a="182211071"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by azsmga001.ch.intel.com with ESMTP; 17 Aug 2012 06:04:30 -0700
Message-ID: <502E41E3.4020903@intel.com>
Date: Fri, 17 Aug 2012 16:06:43 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1345208727-3029-1-git-send-email-radu.moisan@intel.com>
In-Reply-To: <1345208727-3029-1-git-send-email-radu.moisan@intel.com>
Subject: Re: [PATCH][RFC] coreutils: Upgrade to upstream version 8.17
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2012 13:16:31 -0000
Content-Type: multipart/alternative;
	boundary="------------000403090100000301050406"

--------------000403090100000301050406
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The problem:

The new version of coreutils, adds use of canonicalize_file_name() 
function defined in canonicalize.h The problem I encountered is at 
compile time, the function is redefined to rpl_canonicalize_file_name by 
means of a macro, and I get an undefined reference error.

//-- stdlib.in.h

#if @GNULIB_CANONICALIZE_FILE_NAME@
# if @REPLACE_CANONICALIZE_FILE_NAME@
#  if !(defined __cplusplus && defined GNULIB_NAMESPACE)
#   define canonicalize_file_name rpl_canonicalize_file_name
#  endif

I've looked for REPLACE_CANONICALIZE_FILE_NAME and found out that is 
being set in configure, which is generated from canonicalize.m4

# canonicalize.m4 serial 24

dnl Copyright (C) 2003-2007, 2009-2012 Free Software Foundation, Inc.

dnl This file is free software; the Free Software Foundation
dnl gives unlimited permission to copy and/or distribute it,
dnl with or without modifications, as long as this notice is preserved.

# Provides canonicalize_file_name and canonicalize_filename_mode, but does
# not provide or fix realpath.
AC_DEFUN([gl_FUNC_CANONICALIZE_FILENAME_MODE],
[
   AC_REQUIRE([gl_USE_SYSTEM_EXTENSIONS])
   AC_CHECK_FUNCS_ONCE([canonicalize_file_name])
   AC_REQUIRE([gl_DOUBLE_SLASH_ROOT])
   AC_REQUIRE([gl_FUNC_REALPATH_WORKS])
   if test $ac_cv_func_canonicalize_file_name = no; then
     HAVE_CANONICALIZE_FILE_NAME=0
   elif test "$gl_cv_func_realpath_works" != yes; then
     REPLACE_CANONICALIZE_FILE_NAME=1
   fi
])

# Provides canonicalize_file_name and realpath.
AC_DEFUN([gl_CANONICALIZE_LGPL],
[
   AC_REQUIRE([gl_STDLIB_H_DEFAULTS])
   AC_REQUIRE([gl_CANONICALIZE_LGPL_SEPARATE])
   if test $ac_cv_func_canonicalize_file_name = no; then
     HAVE_CANONICALIZE_FILE_NAME=0
     if test $ac_cv_func_realpath = no; then
       HAVE_REALPATH=0
     elif test "$gl_cv_func_realpath_works" != yes; then
       REPLACE_REALPATH=1
     fi
   elif test "$gl_cv_func_realpath_works" != yes; then
     REPLACE_CANONICALIZE_FILE_NAME=1
     REPLACE_REALPATH=1
   fi
])

Then I followed gl_cv_func_realpath_works and found it to be set to 
"guessing yes"

# canonicalize.m4 serial 24

      [case "$host_os" in
                 # Guess yes on glibc systems.
         *-gnu*) gl_cv_func_realpath_works="guessing yes" ;;
                 # If we don't know, assume the worst.
         *)      gl_cv_func_realpath_works="guessing no" ;;
       esac

Being set this way it looked to me like it was always assumed to be "no" 
and thus assumed real path didn't work. In fact, I could not make a 
logic for "guessing yes" and "quessing no" because to me it looks like 
they are not verified against and thus I'm missing the reason of their 
usage. However, I'm assuming I missed something because they are used 
quite heavily.

I don't have experience with autoconf so I may have missed the "right 
way" to fix this.
Any comments well apreciated.

radu



On 08/17/2012 04:05 PM, Radu Moisan wrote:
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>   .../coreutils-8.17/realpath-works-yes.patch        |   13 +++++++++++++
>   .../remove-gets.patch                              |   20 +++++++++++---------
>   .../remove-usr-local-lib-from-m4.patch             |    0
>   .../{coreutils_8.14.bb => coreutils_8.17.bb}       |    9 +++++----
>   4 files changed, 29 insertions(+), 13 deletions(-)
>   create mode 100644 meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch
>   rename meta/recipes-core/coreutils/{coreutils-8.14 => coreutils-8.17}/remove-gets.patch (47%)
>   rename meta/recipes-core/coreutils/{coreutils-8.14 => coreutils-8.17}/remove-usr-local-lib-from-m4.patch (100%)
>   rename meta/recipes-core/coreutils/{coreutils_8.14.bb => coreutils_8.17.bb} (91%)
>
> diff --git a/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch b/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch
> new file mode 100644
> index 0000000..6bbe7ee
> --- /dev/null
> +++ b/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch
> @@ -0,0 +1,13 @@
> +Index: coreutils-8.17/m4/canonicalize.m4
> +===================================================================
> +--- coreutils-8.17.orig/m4/canonicalize.m4	2012-05-08 12:05:23.000000000 +0300
> ++++ coreutils-8.17/m4/canonicalize.m4	2012-08-17 14:20:22.000000000 +0300
> +@@ -95,7 +95,7 @@
> +      [gl_cv_func_realpath_works=no],
> +      [case "$host_os" in
> +                 # Guess yes on glibc systems.
> +-        *-gnu*) gl_cv_func_realpath_works="guessing yes" ;;
> ++        *-gnu*) gl_cv_func_realpath_works="yes" ;;
> +                 # If we don't know, assume the worst.
> +         *)      gl_cv_func_realpath_works="guessing no" ;;
> +       esac
> diff --git a/meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch b/meta/recipes-core/coreutils/coreutils-8.17/remove-gets.patch
> similarity index 47%
> rename from meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
> rename to meta/recipes-core/coreutils/coreutils-8.17/remove-gets.patch
> index 4f61c92..eaadf7e 100644
> --- a/meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
> +++ b/meta/recipes-core/coreutils/coreutils-8.17/remove-gets.patch
> @@ -3,19 +3,21 @@ use gets iff its defined. eglibc 2.16 removed gets
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   Upstream-Status: Pending
>   
> -Index: coreutils-8.14/lib/stdio.in.h
> +Index: coreutils-8.17/lib/stdio.in.h
>   ===================================================================
> ---- coreutils-8.14.orig/lib/stdio.in.h	2011-09-24 04:20:48.000000000 -0700
> -+++ coreutils-8.14/lib/stdio.in.h	2012-07-03 10:36:19.886296576 -0700
> -@@ -713,11 +713,13 @@
> - _GL_CXXALIAS_SYS (gets, char *, (char *s));
> - #  undef gets
> +--- coreutils-8.17.orig/lib/stdio.in.h
> ++++ coreutils-8.17/lib/stdio.in.h
> +@@ -698,13 +698,14 @@ _GL_WARN_ON_USE (getline, "getline is un
> +                  "use gnulib module getline for portability");
>    # endif
> + #endif
> +-
>   +# if defined gets
> - _GL_CXXALIASWARN (gets);
>    /* It is very rare that the developer ever has full control of stdin,
> -    so any use of gets warrants an unconditional warning.  Assume it is
> -    always declared, since it is required by C89.  */
> +    so any use of gets warrants an unconditional warning; besides, C11
> +    removed it.  */
> + #undef gets
> + #if HAVE_RAW_DECL_GETS
>    _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
>   +# endif
>    #endif
> diff --git a/meta/recipes-core/coreutils/coreutils-8.14/remove-usr-local-lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils-8.17/remove-usr-local-lib-from-m4.patch
> similarity index 100%
> rename from meta/recipes-core/coreutils/coreutils-8.14/remove-usr-local-lib-from-m4.patch
> rename to meta/recipes-core/coreutils/coreutils-8.17/remove-usr-local-lib-from-m4.patch
> diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.17.bb
> similarity index 91%
> rename from meta/recipes-core/coreutils/coreutils_8.14.bb
> rename to meta/recipes-core/coreutils/coreutils_8.17.bb
> index 9a714a9..9d8170e 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.14.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.17.bb
> @@ -6,8 +6,8 @@ HOMEPAGE = "http://www.gnu.org/software/coreutils/"
>   BUGTRACKER = "http://debbugs.gnu.org/coreutils"
>   LICENSE = "GPLv3+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
> -                    file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
> -PR = "r5"
> +                    file://src/ls.c;startline=5;endline=16;md5=30c84fd2942cad91041e5e2dcd19ced6"
> +PR = "r0"
>   DEPENDS = "gmp libcap"
>   DEPENDS_virtclass-native = ""
>   
> @@ -16,9 +16,10 @@ inherit autotools gettext
>   SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>              file://remove-usr-local-lib-from-m4.patch \
>              file://remove-gets.patch \
> +           file://realpath-works-yes.patch \
>             "
> -SRC_URI[md5sum] = "bcb135ce553493a45aba01b39eb3920a"
> -SRC_URI[sha256sum] = "0d120817c19292edb19e92ae6b8eac9020e03d51e0af9cb116cf82b65d18b02d"
> +SRC_URI[md5sum] = "bbda656ce8ca2c6903948f9faa204ba3"
> +SRC_URI[sha256sum] = "4e075a0d238072a5bd079046e1f024dc5e0d9133d43a39c73d0b86b0d1e2c5e5"
>   
>   EXTRA_OECONF_virtclass-native = "--without-gmp"
>   


--------------000403090100000301050406
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    The problem:<br>
    <br>
    The new version of coreutils, adds use of canonicalize_file_name()
    function defined in canonicalize.h The problem I encountered is at
    compile time, the function is redefined to
    rpl_canonicalize_file_name by means of a macro, and I get an
    undefined reference error. <br>
    <br>
    <small><font face="Droid Sans Mono">//-- stdlib.in.h<br>
        <br>
        #if @GNULIB_CANONICALIZE_FILE_NAME@<br>
        # if @REPLACE_CANONICALIZE_FILE_NAME@<br>
        #&nbsp; if !(defined __cplusplus &amp;&amp; defined GNULIB_NAMESPACE)<br>
        #&nbsp;&nbsp; define canonicalize_file_name rpl_canonicalize_file_name<br>
        #&nbsp; endif<br>
      </font></small><br>
    I've looked for REPLACE_CANONICALIZE_FILE_NAME and found out that is
    being set in configure, which is generated from canonicalize.m4<br>
    <br>
    <small><font face="Droid Sans Mono"># canonicalize.m4 serial 24<br>
        <br>
        dnl Copyright (C) 2003-2007, 2009-2012 Free Software Foundation,
        Inc.<br>
        <br>
        dnl This file is free software; the Free Software Foundation<br>
        dnl gives unlimited permission to copy and/or distribute it,<br>
        dnl with or without modifications, as long as this notice is
        preserved.<br>
        <br>
        # Provides canonicalize_file_name and
        canonicalize_filename_mode, but does<br>
        # not provide or fix realpath.<br>
        AC_DEFUN([gl_FUNC_CANONICALIZE_FILENAME_MODE],<br>
        [<br>
        &nbsp; AC_REQUIRE([gl_USE_SYSTEM_EXTENSIONS])<br>
        &nbsp; AC_CHECK_FUNCS_ONCE([canonicalize_file_name])<br>
        &nbsp; AC_REQUIRE([gl_DOUBLE_SLASH_ROOT])<br>
        &nbsp; AC_REQUIRE([gl_FUNC_REALPATH_WORKS])<br>
        &nbsp; if test $ac_cv_func_canonicalize_file_name = no; then<br>
        &nbsp;&nbsp;&nbsp; HAVE_CANONICALIZE_FILE_NAME=0<br>
        &nbsp; elif test "$gl_cv_func_realpath_works" != yes; then<br>
        &nbsp;&nbsp;&nbsp; REPLACE_CANONICALIZE_FILE_NAME=1<br>
        &nbsp; fi<br>
        ])<br>
        <br>
        # Provides canonicalize_file_name and realpath.<br>
        AC_DEFUN([gl_CANONICALIZE_LGPL],<br>
        [<br>
        &nbsp; AC_REQUIRE([gl_STDLIB_H_DEFAULTS])<br>
        &nbsp; AC_REQUIRE([gl_CANONICALIZE_LGPL_SEPARATE])<br>
        &nbsp; if test $ac_cv_func_canonicalize_file_name = no; then<br>
        &nbsp;&nbsp;&nbsp; HAVE_CANONICALIZE_FILE_NAME=0<br>
        &nbsp;&nbsp;&nbsp; if test $ac_cv_func_realpath = no; then<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HAVE_REALPATH=0<br>
        &nbsp;&nbsp;&nbsp; elif test "$gl_cv_func_realpath_works" != yes; then<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REPLACE_REALPATH=1<br>
        &nbsp;&nbsp;&nbsp; fi<br>
        &nbsp; elif test "$gl_cv_func_realpath_works" != yes; then<br>
        &nbsp;&nbsp;&nbsp; REPLACE_CANONICALIZE_FILE_NAME=1<br>
        &nbsp;&nbsp;&nbsp; REPLACE_REALPATH=1<br>
        &nbsp; fi<br>
        ])<br>
        <br>
      </font><big>Then I followed </big></small><small><font
        face="Droid Sans Mono">gl_cv_func_realpath_works </font><big>and
        found it to be set to "guessing yes"</big></small><small><br>
      <br>
      # canonicalize.m4 serial 24<br>
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp; [case "$host_os" in<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Guess yes on glibc systems.<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *-gnu*) gl_cv_func_realpath_works="guessing yes" ;;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # If we don't know, assume the worst.<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gl_cv_func_realpath_works="guessing no" ;;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; esac<br>
      <br>
    </small>Being set this way it looked to me like it was always
    assumed to be "no" and thus assumed real path didn't work. In fact,
    I could not make a logic for "guessing yes" and "quessing no"
    because to me it looks like they are not verified against and thus
    I'm missing the reason of their usage. However, I'm assuming I
    missed something because they are used quite heavily. <br>
    <br>
    I don't have experience with autoconf so I may have missed the
    "right way" to fix this.<br>
    Any comments well apreciated.<br>
    <br>
    radu<br>
    <br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 08/17/2012 04:05 PM, Radu Moisan
      wrote:<br>
    </div>
    <blockquote
      cite="mid:1345208727-3029-1-git-send-email-radu.moisan@intel.com"
      type="cite">
      <pre wrap="">Signed-off-by: Radu Moisan <a class="moz-txt-link-rfc2396E" href="mailto:radu.moisan@intel.com">&lt;radu.moisan@intel.com&gt;</a>
---
 .../coreutils-8.17/realpath-works-yes.patch        |   13 +++++++++++++
 .../remove-gets.patch                              |   20 +++++++++++---------
 .../remove-usr-local-lib-from-m4.patch             |    0
 .../{coreutils_8.14.bb =&gt; coreutils_8.17.bb}       |    9 +++++----
 4 files changed, 29 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch
 rename meta/recipes-core/coreutils/{coreutils-8.14 =&gt; coreutils-8.17}/remove-gets.patch (47%)
 rename meta/recipes-core/coreutils/{coreutils-8.14 =&gt; coreutils-8.17}/remove-usr-local-lib-from-m4.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils_8.14.bb =&gt; coreutils_8.17.bb} (91%)

diff --git a/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch b/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch
new file mode 100644
index 0000000..6bbe7ee
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch
@@ -0,0 +1,13 @@
+Index: coreutils-8.17/m4/canonicalize.m4
+===================================================================
+--- coreutils-8.17.orig/m4/canonicalize.m4	2012-05-08 12:05:23.000000000 +0300
++++ coreutils-8.17/m4/canonicalize.m4	2012-08-17 14:20:22.000000000 +0300
+@@ -95,7 +95,7 @@
+      [gl_cv_func_realpath_works=no],
+      [case "$host_os" in
+                 # Guess yes on glibc systems.
+-        *-gnu*) gl_cv_func_realpath_works="guessing yes" ;;
++        *-gnu*) gl_cv_func_realpath_works="yes" ;;
+                 # If we don't know, assume the worst.
+         *)      gl_cv_func_realpath_works="guessing no" ;;
+       esac
diff --git a/meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch b/meta/recipes-core/coreutils/coreutils-8.17/remove-gets.patch
similarity index 47%
rename from meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
rename to meta/recipes-core/coreutils/coreutils-8.17/remove-gets.patch
index 4f61c92..eaadf7e 100644
--- a/meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
+++ b/meta/recipes-core/coreutils/coreutils-8.17/remove-gets.patch
@@ -3,19 +3,21 @@ use gets iff its defined. eglibc 2.16 removed gets
 Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
 Upstream-Status: Pending
 
-Index: coreutils-8.14/lib/stdio.in.h
+Index: coreutils-8.17/lib/stdio.in.h
 ===================================================================
---- coreutils-8.14.orig/lib/stdio.in.h	2011-09-24 04:20:48.000000000 -0700
-+++ coreutils-8.14/lib/stdio.in.h	2012-07-03 10:36:19.886296576 -0700
-@@ -713,11 +713,13 @@
- _GL_CXXALIAS_SYS (gets, char *, (char *s));
- #  undef gets
+--- coreutils-8.17.orig/lib/stdio.in.h
++++ coreutils-8.17/lib/stdio.in.h
+@@ -698,13 +698,14 @@ _GL_WARN_ON_USE (getline, "getline is un
+                  "use gnulib module getline for portability");
  # endif
+ #endif
+-
 +# if defined gets
- _GL_CXXALIASWARN (gets);
  /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
+    so any use of gets warrants an unconditional warning; besides, C11
+    removed it.  */
+ #undef gets
+ #if HAVE_RAW_DECL_GETS
  _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
 +# endif
  #endif
diff --git a/meta/recipes-core/coreutils/coreutils-8.14/remove-usr-local-lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils-8.17/remove-usr-local-lib-from-m4.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.14/remove-usr-local-lib-from-m4.patch
rename to meta/recipes-core/coreutils/coreutils-8.17/remove-usr-local-lib-from-m4.patch
diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.17.bb
similarity index 91%
rename from meta/recipes-core/coreutils/coreutils_8.14.bb
rename to meta/recipes-core/coreutils/coreutils_8.17.bb
index 9a714a9..9d8170e 100644
--- a/meta/recipes-core/coreutils/coreutils_8.14.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.17.bb
@@ -6,8 +6,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.gnu.org/software/coreutils/">"http://www.gnu.org/software/coreutils/"</a>
 BUGTRACKER = <a class="moz-txt-link-rfc2396E" href="http://debbugs.gnu.org/coreutils">"http://debbugs.gnu.org/coreutils"</a>
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=d32239bcb673463ab874e80d47fae504\-file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad">"file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
-                    file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"</a>
-PR = "r5"
+                    <a class="moz-txt-link-freetext" href="file://src/ls.c;startline=5;endline=16;md5=30c84fd2942cad91041e5e2dcd19ced6">file://src/ls.c;startline=5;endline=16;md5=30c84fd2942cad91041e5e2dcd19ced6</a>"
+PR = "r0"
 DEPENDS = "gmp libcap"
 DEPENDS_virtclass-native = ""
 
@@ -16,9 +16,10 @@ inherit autotools gettext
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            <a class="moz-txt-link-freetext" href="file://remove-usr-local-lib-from-m4.patch">file://remove-usr-local-lib-from-m4.patch</a> \
            <a class="moz-txt-link-freetext" href="file://remove-gets.patch">file://remove-gets.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://realpath-works-yes.patch">file://realpath-works-yes.patch</a> \
           "
-SRC_URI[md5sum] = "bcb135ce553493a45aba01b39eb3920a"
-SRC_URI[sha256sum] = "0d120817c19292edb19e92ae6b8eac9020e03d51e0af9cb116cf82b65d18b02d"
+SRC_URI[md5sum] = "bbda656ce8ca2c6903948f9faa204ba3"
+SRC_URI[sha256sum] = "4e075a0d238072a5bd079046e1f024dc5e0d9133d43a39c73d0b86b0d1e2c5e5"
 
 EXTRA_OECONF_virtclass-native = "--without-gmp"
 
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------000403090100000301050406--
