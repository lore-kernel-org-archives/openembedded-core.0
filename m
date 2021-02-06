Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.4284.1612602262240352142
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 01:04:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M5SkgsS+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id q7so10394498wre.13
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 01:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wvrt/GmQK+kCYb8b15iZpDNU1ynwFW5vDLzaLjz/thA=;
        b=M5SkgsS+nrR8gFUhQi+Sp5DD2WSmnoJIew0EJstR77zdiQRVXbubz/iHB5eDhy50hp
         7PCLnQHHXNKBaCYwvN8QR5bPkc2xtmvSIsWYS0eQ7gowdZV1tJv8ZNXVuYFO606eiB1x
         Z7CSK/6Y3UddR+kWZgVvy37wWFG4X7NTQ6pg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wvrt/GmQK+kCYb8b15iZpDNU1ynwFW5vDLzaLjz/thA=;
        b=VzTDDdQwwBhXagl3RgxqKxbrNgAoeJNsKlQLRQyWY17A2dzowBY/ZErzvzi7ew1NHb
         0wxY/sQwAioULSWMY1B/w8PGL+TiP2QrLEwFleElUKj++70okRp8D6BDOEe+XOGC2tl0
         0kQ+ygVPzAfsaR4n3RsF5X0jUu/nT7E8Tio3qInVAYJWeXPWc8CCymuHzIBJ26HD4MbW
         4mo+JYhKqwNoEz3vDDX0b5nPeAFHfiu3QHecuvxIvfXSiEDaksRcl6NV0wyGqy+D4LF0
         xsfRYzByo9EW5rCQytvqNG+BrLMqXxX8owbrzH+7Rmz4vCtmobtJGmLx5b07QDqkkP+j
         /Xnw==
X-Gm-Message-State: AOAM5316dumbamzNr3hRBCSFndXo5b7ejVCCPq3ezju5//GLKdRntm6M
	BQXRYB0OrEb7Boo3RIh8dCbIWthOBtMDIg==
X-Google-Smtp-Source: ABdhPJxZvYsXPXmf4Pwi+nOKAtrDSPja4mSo5R1bsgUU9zZY3t7Z5qkgujdS49/qr0fzu8Npmc04iw==
X-Received: by 2002:adf:dd81:: with SMTP id x1mr9407393wrl.249.1612602259854;
        Sat, 06 Feb 2021 01:04:19 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:be75:a088:9c76:71df])
        by smtp.gmail.com with ESMTPSA id o124sm11332678wmb.5.2021.02.06.01.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 01:04:19 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 07/10] autoconf: upgrade to 2.7.1
Date: Sat,  6 Feb 2021 09:04:12 +0000
Message-Id: <20210206090415.1707868-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210206090415.1707868-1-richard.purdie@linuxfoundation.org>
References: <20210206090415.1707868-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

After too many years, autoconf has made a new release.  On the whole it
is compatible with previous releases, but some macros are more specific
about what they expose so minor tweaks to configure.ac may be required.

autoconf also now invokes intltoolize, gtkdocize, and copies
config.sub/guess, so there is less work for autotools.bbclass to do.

- AC_HEADER_MAJOR-port-to-glibc-2.25.patch
- add_musl_config.patch
- autoconf-replace-w-option-in-shebangs-with-modern-use-warnings.patch
- autoreconf-gnuconfigize.patch
- check-automake-cross-warning.patch
- config_site.patch
- fix_path_xtra.patch
- performance.patch
Drop a number of patches which have been integrated upstream.

- man-host-perl.patch
Don't use the target perl path when building documentation at build time:

- no-man.patch
Don't build documentation in native builds to avoid further build
dependencies.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../AC_HEADER_MAJOR-port-to-glibc-2.25.patch  | 101 ---------------
 .../autoconf/autoconf/add_musl_config.patch   |  26 ----
 ...in-shebangs-with-modern-use-warnings.patch | 120 ------------------
 .../autoconf/autoreconf-exclude.patch         | 113 +++++++----------
 .../autoconf/autoreconf-gnuconfigize.patch    |  38 ------
 .../autotest-automake-result-format.patch     |  32 ++---
 .../check-automake-cross-warning.patch        |  34 -----
 .../autoconf/autoconf/config_site.patch       |  40 ------
 .../autoconf/autoconf/fix_path_xtra.patch     | 120 ------------------
 .../autoconf/autoconf/man-host-perl.patch     |  24 ++++
 .../autoconf/autoconf/no-man.patch            |  21 +++
 .../autoconf/autoconf/performance.patch       |  60 ---------
 .../autoconf/autoconf/preferbash.patch        |  39 ++++--
 .../autoconf/autoconf/program_prefix.patch    |  36 +++---
 .../remove-usr-local-lib-from-m4.patch        |  28 ++--
 .../{autoconf_2.69.bb => autoconf_2.71.bb}    |  32 ++---
 16 files changed, 180 insertions(+), 684 deletions(-)
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/AC_HEADER_MAJOR-port-to-glibc-2.25.patch
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/add_musl_config.patch
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/autoconf-replace-w-option-in-shebangs-with-modern-use-warnings.patch
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/autoreconf-gnuconfigize.patch
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/check-automake-cross-warning.patch
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/config_site.patch
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/fix_path_xtra.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/no-man.patch
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/performance.patch
 rename meta/recipes-devtools/autoconf/{autoconf_2.69.bb => autoconf_2.71.bb} (69%)

diff --git a/meta/recipes-devtools/autoconf/autoconf/AC_HEADER_MAJOR-port-to-glibc-2.25.patch b/meta/recipes-devtools/autoconf/autoconf/AC_HEADER_MAJOR-port-to-glibc-2.25.patch
deleted file mode 100644
index b2d7dc0e249..00000000000
--- a/meta/recipes-devtools/autoconf/autoconf/AC_HEADER_MAJOR-port-to-glibc-2.25.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From b859ab1b211d348b46eca9158b7742f050c8115e Mon Sep 17 00:00:00 2001
-From: Eric Blake <eblake@redhat.com>
-Date: Wed, 14 Sep 2016 08:17:06 -0500
-Subject: [PATCH] AC_HEADER_MAJOR: port to glibc 2.25
-
-glibc 2.25 is deprecating the namespace pollution of <sys/types.h>
-injecting major(), minor(), and makedev() into the compilation
-environment, with a warning that insists that users include
-<sys/sysmacros.h> instead.  However, because the expansion of
-AC_HEADER_MAJOR didn't bother checking sys/sysmacros.h until
-after probing whether sys/types.h pollutes the namespace, it was
-not defining MAJOR_IN_SYSMACROS, with the result that code
-compiled with -Werror chokes on the deprecation warnings because
-it was not including sysmacros.h.
-
-In addition to fixing autoconf (which only benefits projects
-that rebuild configure after this fix is released), we can also
-give a hint to distros on how they can populate config.site with
-a cache variable to force pre-existing configure scripts without
-the updated macro to behave sanely in the presence of glibc 2.25
-(the documentation is especially useful since that cache variable
-is no longer present in autoconf after this patch).
-
-Note that mingw lacks major/minor/makedev in any of its standard
-headers; for that platform, the behavior of this macro is unchanged
-(code using the recommended include formula will get a compile error
-when trying to use major(), whether before or after this patch); but
-for now, it is assumed that programs actually concerned with
-creating devices are not worried about portability to mingw.  If
-desired, a later patch could tighten AC_HEADER_MAJOR to fail at
-configure time if the macros are unavailable in any of the three
-system headers, but that semantic change is not worth mixing into
-this patch.
-
-* lib/autoconf/headers.m4 (AC_HEADER_MAJOR): Drop check for
-major within sys/types.h; it interferes with the need to check
-sysmacros.h first.
-
-Signed-off-by: Eric Blake <eblake@redhat.com>
-
-Remove the documentation change from the patch
-Upstream-Status: Backport
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- lib/autoconf/headers.m4 | 30 ++++++++++++++----------------
- 1 file changed, 14 insertions(+), 16 deletions(-)
-
-diff --git a/lib/autoconf/headers.m4 b/lib/autoconf/headers.m4
-index 81a7fa2..a57d0d3 100644
---- a/lib/autoconf/headers.m4
-+++ b/lib/autoconf/headers.m4
-@@ -502,31 +502,29 @@ fi
- 
- # AC_HEADER_MAJOR
- # ---------------
-+# Thanks to glibc 2.25 deprecating macros in sys/types.h, coupled with
-+# back-compat to autoconf 2.69, we need the following logic:
-+# Check whether <sys/types.h> compiles.
-+# If <sys/mkdev.h> compiles, assume it provides major/minor/makedev.
-+# Otherwise, if <sys/sysmacros.h> compiles, assume it provides the macros.
-+# Otherwise, either the macros were provided by <sys/types.h>, or do
-+# not exist on the platform.  Code trying to use these three macros is
-+# assumed to not care about platforms that lack the macros.
- AN_FUNCTION([major],     [AC_HEADER_MAJOR])
- AN_FUNCTION([makedev],   [AC_HEADER_MAJOR])
- AN_FUNCTION([minor],     [AC_HEADER_MAJOR])
- AN_HEADER([sys/mkdev.h], [AC_HEADER_MAJOR])
- AC_DEFUN([AC_HEADER_MAJOR],
--[AC_CACHE_CHECK(whether sys/types.h defines makedev,
--		ac_cv_header_sys_types_h_makedev,
--[AC_LINK_IFELSE([AC_LANG_PROGRAM([[@%:@include <sys/types.h>]],
--				 [[return makedev(0, 0);]])],
--		[ac_cv_header_sys_types_h_makedev=yes],
--		[ac_cv_header_sys_types_h_makedev=no])
--])
--
--if test $ac_cv_header_sys_types_h_makedev = no; then
-+[AC_CHECK_HEADERS_ONCE([sys/types.h])
- AC_CHECK_HEADER(sys/mkdev.h,
- 		[AC_DEFINE(MAJOR_IN_MKDEV, 1,
- 			   [Define to 1 if `major', `minor', and `makedev' are
- 			    declared in <mkdev.h>.])])
--
--  if test $ac_cv_header_sys_mkdev_h = no; then
--    AC_CHECK_HEADER(sys/sysmacros.h,
--		    [AC_DEFINE(MAJOR_IN_SYSMACROS, 1,
--			       [Define to 1 if `major', `minor', and `makedev'
--				are declared in <sysmacros.h>.])])
--  fi
-+if test $ac_cv_header_sys_mkdev_h = no; then
-+  AC_CHECK_HEADER(sys/sysmacros.h,
-+		  [AC_DEFINE(MAJOR_IN_SYSMACROS, 1,
-+			     [Define to 1 if `major', `minor', and `makedev'
-+			      are declared in <sysmacros.h>.])])
- fi
- ])# AC_HEADER_MAJOR
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/autoconf/autoconf/add_musl_config.patch b/meta/recipes-devtools/autoconf/autoconf/add_musl_config.patch
deleted file mode 100644
index a9094d2128e..00000000000
--- a/meta/recipes-devtools/autoconf/autoconf/add_musl_config.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-backport http://git.savannah.gnu.org/cgit/config.git/commit/config.sub?id=062587eaa891396c936555ae51f7e77eeb71a5fe
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport
-Index: autoconf-2.69/build-aux/config.sub
-===================================================================
---- autoconf-2.69.orig/build-aux/config.sub
-+++ autoconf-2.69/build-aux/config.sub
-@@ -123,7 +123,7 @@ esac
- maybe_os=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\2/'`
- case $maybe_os in
-   nto-qnx* | linux-gnu* | linux-android* | linux-dietlibc | linux-newlib* | \
--  linux-uclibc* | uclinux-uclibc* | uclinux-gnu* | kfreebsd*-gnu* | \
-+  linux-musl* | linux-uclibc* | uclinux-uclibc* | uclinux-gnu* | kfreebsd*-gnu* | \
-   knetbsd*-gnu* | netbsd*-gnu* | \
-   kopensolaris*-gnu* | \
-   storm-chaos* | os2-emx* | rtmk-nova*)
-@@ -1360,7 +1360,7 @@ case $os in
- 	      | -chorusos* | -chorusrdb* | -cegcc* \
- 	      | -cygwin* | -msys* | -pe* | -psos* | -moss* | -proelf* | -rtems* \
- 	      | -mingw32* | -linux-gnu* | -linux-android* \
--	      | -linux-newlib* | -linux-uclibc* \
-+	      | -linux-newlib* | -linux-musl* | -linux-uclibc* \
- 	      | -uxpv* | -beos* | -mpeix* | -udk* \
- 	      | -interix* | -uwin* | -mks* | -rhapsody* | -darwin* | -opened* \
- 	      | -openstep* | -oskit* | -conix* | -pw32* | -nonstopux* \
diff --git a/meta/recipes-devtools/autoconf/autoconf/autoconf-replace-w-option-in-shebangs-with-modern-use-warnings.patch b/meta/recipes-devtools/autoconf/autoconf/autoconf-replace-w-option-in-shebangs-with-modern-use-warnings.patch
deleted file mode 100644
index ae0e3825f69..00000000000
--- a/meta/recipes-devtools/autoconf/autoconf/autoconf-replace-w-option-in-shebangs-with-modern-use-warnings.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From 236552ff5b9f1ebf666d8d0e9850007dcce03d26 Mon Sep 17 00:00:00 2001
-From: Serhii Popovych <spopovyc@cisco.com>
-Date: Wed, 10 Feb 2016 16:32:44 +0000
-Subject: [PATCH] perl: Replace -w option in shebangs with modern "use
- warnings"
-
-In some builds we might provide ac_cv_path_PERL as /usr/bin/env perl
-to use newer version of the perl from users PATH rather than
-older from standard system path.
-
-However using /usr/bin/env perl -w from shebang line isn't
-possible because it translates to something like
-/usr/bin/env -w perl and env complains about illegal option.
-
-To address this we can remove -w option from perl shebang
-line and add "use warnings" statement.
-
-Upstream-Status: Pending
-Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
----
- bin/autom4te.in                                          | 3 ++-
- bin/autoreconf.in                                        | 3 ++-
- bin/autoscan.in                                          | 3 ++-
- bin/autoupdate.in                                        | 3 ++-
- bin/ifnames.in                                           | 3 ++-
- 5 files changed, 10 insertions(+), 5 deletions(-)
-
-diff --git a/bin/autom4te.in b/bin/autom4te.in
-index 11773c9..a8f5e41 100644
---- a/bin/autom4te.in
-+++ b/bin/autom4te.in
-@@ -1,4 +1,4 @@
--#! @PERL@ -w
-+#! @PERL@
- # -*- perl -*-
- # @configure_input@
- 
-@@ -42,6 +42,7 @@ use Autom4te::General;
- use Autom4te::XFile;
- use File::Basename;
- use strict;
-+use warnings;
- 
- # Data directory.
- my $pkgdatadir = $ENV{'AC_MACRODIR'} || '@pkgdatadir@';
-diff --git a/bin/autoreconf.in b/bin/autoreconf.in
-index e245db4..1a318cb 100644
---- a/bin/autoreconf.in
-+++ b/bin/autoreconf.in
-@@ -1,4 +1,4 @@
--#! @PERL@ -w
-+#! @PERL@
- # -*- perl -*-
- # @configure_input@
- 
-@@ -45,6 +45,7 @@ use Autom4te::XFile;
- # Do not use Cwd::chdir, since it might hang.
- use Cwd 'cwd';
- use strict;
-+use warnings;
- 
- ## ----------- ##
- ## Variables.  ##
-diff --git a/bin/autoscan.in b/bin/autoscan.in
-index a67c48d..b931249 100644
---- a/bin/autoscan.in
-+++ b/bin/autoscan.in
-@@ -1,4 +1,4 @@
--#! @PERL@ -w
-+#! @PERL@
- # -*- perl -*-
- # @configure_input@
- 
-@@ -43,6 +43,7 @@ use Autom4te::XFile;
- use File::Basename;
- use File::Find;
- use strict;
-+use warnings;
- 
- use vars qw(@cfiles @makefiles @shfiles @subdirs %printed);
- 
-diff --git a/bin/autoupdate.in b/bin/autoupdate.in
-index 9737d49..92cb147 100644
---- a/bin/autoupdate.in
-+++ b/bin/autoupdate.in
-@@ -1,4 +1,4 @@
--#! @PERL@ -w
-+#! @PERL@
- # -*- perl -*-
- # @configure_input@
- 
-@@ -44,6 +44,7 @@ use Autom4te::General;
- use Autom4te::XFile;
- use File::Basename;
- use strict;
-+use warnings;
- 
- # Lib files.
- my $autom4te = $ENV{'AUTOM4TE'} || '@bindir@/@autom4te-name@';
-diff --git a/bin/ifnames.in b/bin/ifnames.in
-index ba2cd05..74b0278 100644
---- a/bin/ifnames.in
-+++ b/bin/ifnames.in
-@@ -1,4 +1,4 @@
--#! @PERL@ -w
-+#! @PERL@
- # -*- perl -*-
- # @configure_input@
- 
-@@ -44,6 +44,7 @@ BEGIN
- use Autom4te::General;
- use Autom4te::XFile;
- use Autom4te::FileUtils;
-+use warnings;
- 
- # $HELP
- # -----
--- 
-2.3.0
-
diff --git a/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch b/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch
index d1bd3a2a313..374b9394041 100644
--- a/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch
+++ b/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch
@@ -1,32 +1,36 @@
-Upstream-Status: Pending
+From 0071d28e304745a16871561f23117fdb00dd2559 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Thu, 12 Mar 2020 17:25:23 +0000
+Subject: [PATCH 4/7] autoreconf-exclude.patch
 
-Index: autoconf-2.63/bin/autoreconf.in
-===================================================================
---- autoconf-2.63.orig/bin/autoreconf.in	2008-12-31 17:39:01.000000000 +0000
-+++ autoconf-2.63/bin/autoreconf.in	2008-12-31 17:43:38.000000000 +0000
-@@ -76,6 +76,7 @@
-   -i, --install            copy missing auxiliary files
+---
+ bin/autoreconf.in | 26 ++++++++++++++++++++++++++
+ 1 file changed, 26 insertions(+)
+
+diff --git a/bin/autoreconf.in b/bin/autoreconf.in
+index bb9f316d..7da3005b 100644
+--- a/bin/autoreconf.in
++++ b/bin/autoreconf.in
+@@ -82,6 +82,7 @@ Operation modes:
+   -i, --install            copy missing standard auxiliary files
        --no-recursive       don't rebuild sub-packages
    -s, --symlink            with -i, install symbolic links instead of copies
 +  -x, --exclude=STEPS      steps we should not run
    -m, --make               when applicable, re-run ./configure && make
    -W, --warnings=CATEGORY  report the warnings falling in CATEGORY [syntax]
  
-@@ -136,6 +137,13 @@
+@@ -141,6 +142,10 @@ my $run_make = 0;
  # Recurse into subpackages
  my $recursive = 1;
  
 +# Steps to exclude
 +my @exclude;
 +my @ex;
-+
-+my $uses_gettext;
-+my $configure_ac;
 +
  ## ---------- ##
  ## Routines.  ##
  ## ---------- ##
-@@ -153,6 +161,7 @@
+@@ -161,6 +166,7 @@ sub parse_args ()
  	  'B|prepend-include=s'	 => \@prepend_include,
  	  'i|install'            => \$install,
  	  's|symlink'            => \$symlink,
@@ -34,106 +38,85 @@ Index: autoconf-2.63/bin/autoreconf.in
  	  'm|make'               => \$run_make,
  	  'recursive!'           => \$recursive);
  
-@@ -162,6 +171,8 @@
+@@ -170,6 +176,8 @@ sub parse_args ()
    parse_WARNINGS;
-   parse_warnings '--warnings', @warning;
+   parse_warnings @warning;
  
 +  @exclude = map { split /,/ } @exclude;
 +
    # Even if the user specified a configure.ac, trim to get the
    # directory, and look for configure.ac again.  Because (i) the code
    # is simpler, and (ii) we are still able to diagnose simultaneous
-@@ -255,6 +266,11 @@
- {
-   my ($aclocal, $flags) = @_;
- 
-+  @ex = grep (/^aclocal$/, @exclude);
-+  if ($#ex != -1) {
-+    return;
-+  }
-+
-   # aclocal 1.8+ does all this for free.  It can be recognized by its
-   # --force support.
-   if ($aclocal_supports_force)
-@@ -368,7 +384,10 @@
+@@ -493,8 +501,11 @@ sub autoreconf_current_directory ($)
      }
    else
      {
--      xsystem_hint ("autopoint is needed because this package uses Gettext", "$autopoint");
 +      @ex = grep (/^autopoint$/, @exclude);
 +      if ($#ex == -1) {
-+        xsystem_hint ("autopoint is needed because this package uses Gettext", "$autopoint");
+       xsystem_hint ("autopoint is needed because this package uses Gettext",
+                     $autopoint);
 +      }
      }
  
  
-@@ -532,16 +551,17 @@
+@@ -687,9 +698,12 @@ sub autoreconf_current_directory ($)
  	{
  	  $libtoolize .= " --ltdl";
  	}
--      xsystem_hint ("libtoolize is needed because this package uses Libtool", $libtoolize);
--      $rerun_aclocal = 1;
 +      @ex = grep (/^libtoolize$/, @exclude);
 +      if ($#ex == -1) {
-+        xsystem_hint ("libtoolize is needed because this package uses Libtool", $libtoolize);
-+        $rerun_aclocal = 1;
+       xsystem_hint ("libtoolize is needed because this package uses Libtool",
+ 		    $libtoolize);
+       $rerun_aclocal = 1;
 +      }
      }
    else
      {
-       verb "$configure_ac: not running libtoolize: --install not given";
+@@ -726,8 +740,11 @@ sub autoreconf_current_directory ($)
      }
- 
--
--
-   # ------------------- #
-   # Rerunning aclocal.  #
-   # ------------------- #
-@@ -572,7 +592,10 @@
+   elsif ($install)
+     {
++      @ex = grep (/^gtkdocize$/, @exclude);
++      if ($#ex == -1) {
+       xsystem_hint ("gtkdocize is needed because this package uses Gtkdoc",
+ 		    $gtkdocize);
++      }
+     }
+   else
+     {
+@@ -765,7 +782,10 @@ sub autoreconf_current_directory ($)
    # latter runs the former, and (ii) autoconf is stricter than
    # autoheader.  So all in all, autoconf should give better error
    # messages.
--  xsystem ($autoconf);
 +  @ex = grep (/^autoconf$/, @exclude);
 +  if ($#ex == -1) {
-+    xsystem ("$autoconf");
+   xsystem ($autoconf);
 +  }
  
  
    # -------------------- #
-@@ -593,7 +616,10 @@
+@@ -786,7 +806,10 @@ sub autoreconf_current_directory ($)
      }
    else
      {
--      xsystem ($autoheader);
 +      @ex = grep (/^autoheader$/, @exclude);
 +      if ($#ex == -1) {
-+        xsystem ("$autoheader");
+       xsystem ($autoheader);
 +      }
      }
  
  
-@@ -610,7 +636,10 @@
+@@ -803,7 +826,10 @@ sub autoreconf_current_directory ($)
        # We should always run automake, and let it decide whether it shall
-       # update the file or not.  In fact, the effect of `$force' is already
-       # included in `$automake' via `--no-force'.
--      xsystem ($automake);
+       # update the file or not.  In fact, the effect of '$force' is already
+       # included in '$automake' via '--no-force'.
 +      @ex = grep (/^automake$/, @exclude);
 +      if ($#ex == -1) {
-+        xsystem ("$automake");
+       xsystem ($automake);
 +      }
      }
  
- 
-@@ -634,7 +663,10 @@
- 	    }
- 	  else
- 	    {
--	      xsystem ("$make");
-+              @ex = grep (/^make$/, @exclude);
-+              if ($#ex == -1) {
-+	        xsystem ("$make");
-+              }
- 	    }
- 	}
-     }
+   # ---------------------------------------------------- #
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/autoreconf-gnuconfigize.patch b/meta/recipes-devtools/autoconf/autoconf/autoreconf-gnuconfigize.patch
deleted file mode 100644
index 5ff18c2350f..00000000000
--- a/meta/recipes-devtools/autoconf/autoconf/autoreconf-gnuconfigize.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Upstream-Status: Pending
-
-#
-# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-#
-
-Index: autoconf-2.63/bin/autoreconf.in
-===================================================================
---- autoconf-2.63.orig/bin/autoreconf.in	2008-12-31 17:43:55.000000000 +0000
-+++ autoconf-2.63/bin/autoreconf.in	2008-12-31 17:46:16.000000000 +0000
-@@ -58,7 +58,7 @@
- $help = "Usage: $0 [OPTION]... [DIRECTORY]...
- 
- Run `autoconf' (and `autoheader', `aclocal', `automake', `autopoint'
--(formerly `gettextize'), and `libtoolize' where appropriate)
-+(formerly `gettextize'), `libtoolize', and `gnu-configize' where appropriate)
- repeatedly to remake the GNU Build System files in specified
- DIRECTORIES and their subdirectories (defaulting to `.').
- 
-@@ -115,6 +115,7 @@
- my $libtoolize = $ENV{'LIBTOOLIZE'} || 'libtoolize';
- my $autopoint  = $ENV{'AUTOPOINT'}  || 'autopoint';
- my $make       = $ENV{'MAKE'}       || 'make';
-+my $gnuconfigize = $ENV{'GNUCONFIGIZE'}       || 'gnu-configize';
- 
- # --install -- as --add-missing in other tools.
- my $install = 0;
-@@ -644,6 +645,10 @@
-       }
-     }
- 
-+  @ex = grep (/^gnu-configize$/, @exclude);
-+  if ($#ex == -1) {
-+    xsystem ("$gnuconfigize");
-+  }
- 
-   # -------------- #
-   # Running make.  #
diff --git a/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch b/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch
index b5e8174efdc..de048d23d7a 100644
--- a/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch
+++ b/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch
@@ -1,22 +1,14 @@
-From a7e722f974e2529d3e564d8d94c86cc8bdbc40e7 Mon Sep 17 00:00:00 2001
-From: Radu Patriu <radu.patriu@enea.com>
-Date: Mon, 24 Mar 2014 16:33:19 +0200
-Subject: [PATCH] autotest: new testsuite option to enable automake test
- result format
+From 8c0f24404bebffdaf3132d81e2b9560d34ff1677 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Thu, 12 Mar 2020 17:25:45 +0000
+Subject: [PATCH 6/7] autotest-automake-result-format.patch
 
-* lib/autotest/general.m4: added "--am-fmt | -A" command line
-parameter for testsuite script to enable "RESULT: testname" output;
-will be used by yocto ptest packages.
-
-Upstream-Status: Pending
-
-Signed-off-by: Radu Patriu <radu.patriu@enea.com>
 ---
- lib/autotest/general.m4 |   39 +++++++++++++++++++++++++++++----------
+ lib/autotest/general.m4 | 39 +++++++++++++++++++++++++++++----------
  1 file changed, 29 insertions(+), 10 deletions(-)
 
 diff --git a/lib/autotest/general.m4 b/lib/autotest/general.m4
-index 60c0352..c1f5a9b 100644
+index 0c0e3c5b..17590e96 100644
 --- a/lib/autotest/general.m4
 +++ b/lib/autotest/general.m4
 @@ -412,6 +412,9 @@ at_recheck=
@@ -29,7 +21,7 @@ index 60c0352..c1f5a9b 100644
  # The directory we run the suite in.  Default to . if no -C option.
  at_dir=`pwd`
  # An absolute reference to this testsuite script.
-@@ -530,6 +533,10 @@ do
+@@ -525,6 +528,10 @@ do
  	at_check_filter_trace=at_fn_filter_trace
  	;;
  
@@ -40,7 +32,7 @@ index 60c0352..c1f5a9b 100644
      [[0-9] | [0-9][0-9] | [0-9][0-9][0-9] | [0-9][0-9][0-9][0-9]])
  	at_fn_validate_ranges at_option
  	AS_VAR_APPEND([at_groups], ["$at_option$as_nl"])
-@@ -718,10 +725,10 @@ m4_divert_push([HELP_MODES])dnl
+@@ -713,10 +720,10 @@ m4_divert_push([HELP_MODES])dnl
  cat <<_ATEOF || at_write_fail=1
  
  Operation modes:
@@ -55,7 +47,7 @@ index 60c0352..c1f5a9b 100644
  _ATEOF
  m4_divert_pop([HELP_MODES])dnl
  m4_wrap([m4_divert_push([HELP_TUNING_BEGIN])dnl
-@@ -747,6 +754,7 @@ Execution tuning:
+@@ -742,6 +749,7 @@ Execution tuning:
    -d, --debug    inhibit clean up and top-level logging
  [                 default for debugging scripts]
    -x, --trace    enable tests shell tracing
@@ -63,7 +55,7 @@ index 60c0352..c1f5a9b 100644
  _ATEOF
  m4_divert_pop([HELP_TUNING_BEGIN])])dnl
  m4_divert_push([HELP_END])dnl
-@@ -1162,7 +1170,9 @@ at_fn_group_banner ()
+@@ -1129,7 +1137,9 @@ at_fn_group_banner ()
      [*])          at_desc_line="$[1]: "  ;;
    esac
    AS_VAR_APPEND([at_desc_line], ["$[3]$[4]"])
@@ -74,7 +66,7 @@ index 60c0352..c1f5a9b 100644
    echo "#                             -*- compilation -*-" >> "$at_group_log"
  }
  
-@@ -1188,42 +1198,51 @@ _ATEOF
+@@ -1155,42 +1165,51 @@ _ATEOF
    case $at_xfail:$at_status in
      yes:0)
  	at_msg="UNEXPECTED PASS"
@@ -132,5 +124,5 @@ index 60c0352..c1f5a9b 100644
    at_log_msg="$at_group. $at_desc ($at_setup_line): $at_msg"
    case $at_status in
 -- 
-1.7.9.5
+2.25.1
 
diff --git a/meta/recipes-devtools/autoconf/autoconf/check-automake-cross-warning.patch b/meta/recipes-devtools/autoconf/autoconf/check-automake-cross-warning.patch
deleted file mode 100644
index 73394d7d52a..00000000000
--- a/meta/recipes-devtools/autoconf/autoconf/check-automake-cross-warning.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Use --warning=cross only if supported by automake
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-
---- a/bin/autoreconf.in
-+++ b/bin/autoreconf.in
-@@ -127,6 +127,8 @@ my $aclocal_supports_warnings = 0;
- my $automake_supports_force_missing = 0;
- # Does automake support -Wfoo?
- my $automake_supports_warnings = 0;
-+# Does automake support --warning=cross
-+my $automake_supports_cross_warning = 0;
- 
- my @prepend_include;
- my @include;
-@@ -191,6 +193,7 @@ sub parse_args ()
-   $aclocal_supports_warnings = $aclocal_help =~ /--warnings/;
-   $automake_supports_force_missing = $automake_help =~ /--force-missing/;
-   $automake_supports_warnings = $automake_help =~ /--warnings/;
-+  $automake_supports_cross_warning = $automake_help =~ /cross/;
- 
-   # Dispatch autoreconf's option to the tools.
-   # --include;
-@@ -244,6 +247,8 @@ sub parse_args ()
-       $libtoolize .= ' --debug';
-     }
-   # --warnings;
-+  @warning = grep { $_ ne "cross" } @warning
-+    if ! $automake_supports_cross_warning;
-   if (@warning)
-     {
-       my $warn = ' --warnings=' . join (',', @warning);
diff --git a/meta/recipes-devtools/autoconf/autoconf/config_site.patch b/meta/recipes-devtools/autoconf/autoconf/config_site.patch
deleted file mode 100644
index 9f044404ddd..00000000000
--- a/meta/recipes-devtools/autoconf/autoconf/config_site.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Upstream-Status: Pending
-
-Poky provides a list of site files in CONFIG_SITE whereas autoconf 
-only expects one file. This patch changes autoconf to accept a list of 
-them.
-
-RP 1/2/10
-
-Updated for 2.68 version: the CONFIG_SITE var was not getting used at all
-fixed the 2.68 code 
-Nitin A Kamble <nitin.a.kamble@intel.com> 2011/05/27
-
-Index: autoconf-2.68/lib/autoconf/general.m4
-===================================================================
---- autoconf-2.68.orig/lib/autoconf/general.m4
-+++ autoconf-2.68/lib/autoconf/general.m4
-@@ -1878,7 +1878,6 @@ AU_DEFUN([AC_VALIDATE_CACHED_SYSTEM_TUPL
- m4_define([AC_SITE_LOAD],
- [# Prefer an explicitly selected file to automatically selected ones.
- ac_site_file1=NONE
--ac_site_file2=NONE
- if test -n "$CONFIG_SITE"; then
-   # We do not want a PATH search for config.site.
-   case $CONFIG_SITE in @%:@((
-@@ -1886,14 +1885,8 @@ if test -n "$CONFIG_SITE"; then
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
diff --git a/meta/recipes-devtools/autoconf/autoconf/fix_path_xtra.patch b/meta/recipes-devtools/autoconf/autoconf/fix_path_xtra.patch
deleted file mode 100644
index 65df88f8f98..00000000000
--- a/meta/recipes-devtools/autoconf/autoconf/fix_path_xtra.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-Upstream-Status: Pending
-
-We don't build xmkmf so any values returned from it are going to be wrong.
-Using any paths in /usr/ for x headers/libs is a bad idea when cross compiling.
-This patch removes them to stop any confusion.
-
-RP - 20071115
-
-Index: autoconf-2.68/lib/autoconf/libs.m4
-===================================================================
---- autoconf-2.68.orig/lib/autoconf/libs.m4
-+++ autoconf-2.68/lib/autoconf/libs.m4
-@@ -159,53 +159,6 @@ m4_popdef([AC_Lib_Name])dnl
- # --------------------- #
- 
- 
--# _AC_PATH_X_XMKMF
--# ----------------
--# Internal subroutine of _AC_PATH_X.
--# Set ac_x_includes and/or ac_x_libraries.
--m4_define([_AC_PATH_X_XMKMF],
--[AC_ARG_VAR(XMKMF, [Path to xmkmf, Makefile generator for X Window System])dnl
--rm -f -r conftest.dir
--if mkdir conftest.dir; then
--  cd conftest.dir
--  cat >Imakefile <<'_ACEOF'
--incroot:
--	@echo incroot='${INCROOT}'
--usrlibdir:
--	@echo usrlibdir='${USRLIBDIR}'
--libdir:
--	@echo libdir='${LIBDIR}'
--_ACEOF
--  if (export CC; ${XMKMF-xmkmf}) >/dev/null 2>/dev/null && test -f Makefile; then
--    # GNU make sometimes prints "make[1]: Entering ...", which would confuse us.
--    for ac_var in incroot usrlibdir libdir; do
--      eval "ac_im_$ac_var=\`\${MAKE-make} $ac_var 2>/dev/null | sed -n 's/^$ac_var=//p'\`"
--    done
--    # Open Windows xmkmf reportedly sets LIBDIR instead of USRLIBDIR.
--    for ac_extension in a so sl dylib la dll; do
--      if test ! -f "$ac_im_usrlibdir/libX11.$ac_extension" &&
--	 test -f "$ac_im_libdir/libX11.$ac_extension"; then
--	ac_im_usrlibdir=$ac_im_libdir; break
--      fi
--    done
--    # Screen out bogus values from the imake configuration.  They are
--    # bogus both because they are the default anyway, and because
--    # using them would break gcc on systems where it needs fixed includes.
--    case $ac_im_incroot in
--	/usr/include) ac_x_includes= ;;
--	*) test -f "$ac_im_incroot/X11/Xos.h" && ac_x_includes=$ac_im_incroot;;
--    esac
--    case $ac_im_usrlibdir in
--	/usr/lib | /usr/lib64 | /lib | /lib64) ;;
--	*) test -d "$ac_im_usrlibdir" && ac_x_libraries=$ac_im_usrlibdir ;;
--    esac
--  fi
--  cd ..
--  rm -f -r conftest.dir
--fi
--])# _AC_PATH_X_XMKMF
--
--
- # _AC_PATH_X_DIRECT
- # -----------------
- # Internal subroutine of _AC_PATH_X.
-@@ -213,44 +166,7 @@ fi
- m4_define([_AC_PATH_X_DIRECT],
- [# Standard set of common directories for X headers.
- # Check X11 before X11Rn because it is often a symlink to the current release.
--ac_x_header_dirs='
--/usr/X11/include
--/usr/X11R7/include
--/usr/X11R6/include
--/usr/X11R5/include
--/usr/X11R4/include
--
--/usr/include/X11
--/usr/include/X11R7
--/usr/include/X11R6
--/usr/include/X11R5
--/usr/include/X11R4
--
--/usr/local/X11/include
--/usr/local/X11R7/include
--/usr/local/X11R6/include
--/usr/local/X11R5/include
--/usr/local/X11R4/include
--
--/usr/local/include/X11
--/usr/local/include/X11R7
--/usr/local/include/X11R6
--/usr/local/include/X11R5
--/usr/local/include/X11R4
--
--/usr/X386/include
--/usr/x386/include
--/usr/XFree86/include/X11
--
--/usr/include
--/usr/local/include
--/usr/unsupported/include
--/usr/athena/include
--/usr/local/x11r5/include
--/usr/lpp/Xamples/include
--
--/usr/openwin/include
--/usr/openwin/share/include'
-+ac_x_header_dirs=''
- 
- if test "$ac_x_includes" = no; then
-   # Guess where to find include files, by looking for Xlib.h.
-@@ -299,7 +215,6 @@ AC_DEFUN([_AC_PATH_X],
- [AC_CACHE_VAL(ac_cv_have_x,
- [# One or both of the vars are not set, and there is no cached value.
- ac_x_includes=no ac_x_libraries=no
--_AC_PATH_X_XMKMF
- _AC_PATH_X_DIRECT
- case $ac_x_includes,$ac_x_libraries in #(
-   no,* | *,no | *\'*)
diff --git a/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch b/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch
new file mode 100644
index 00000000000..c6c135625db
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch
@@ -0,0 +1,24 @@
+Don't use the target perl when regenerating the man pages.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/man/local.mk b/man/local.mk
+index e69858b1..78c68ab5 100644
+--- a/man/local.mk
++++ b/man/local.mk
+@@ -67,13 +67,12 @@ SUFFIXES += .w .1
+ 	@echo "Updating man page $@"
+ 	$(MKDIR_P) $(@D)
+ 	PATH="$(top_srcdir)/man$(PATH_SEPARATOR)$$PATH"; \
+-	PERL="$(PERL)"; \
+ 	PACKAGE_NAME="$(PACKAGE_NAME)"; \
+ 	VERSION="$(VERSION)"; \
+ 	RELEASE_YEAR="$(RELEASE_YEAR)"; \
+ 	top_srcdir="$(top_srcdir)"; \
+ 	channeldefs_pm="$(channeldefs_pm)"; \
+-	export PATH PERL PACKAGE_NAME VERSION RELEASE_YEAR; \
++	export PATH PACKAGE_NAME VERSION RELEASE_YEAR; \
+ 	export top_srcdir channeldefs_pm; \
+ 	$(HELP2MAN) \
+ 	    --include=$(srcdir)/$*.x \
diff --git a/meta/recipes-devtools/autoconf/autoconf/no-man.patch b/meta/recipes-devtools/autoconf/autoconf/no-man.patch
new file mode 100644
index 00000000000..2c44375f43e
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/no-man.patch
@@ -0,0 +1,21 @@
+For native builds we don't care about the documentation, and this would
+otherwise pull in a dependency on help2man.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/Makefile.in b/Makefile.in
+index 146e8e3..a1827c1 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -763,10 +762,0 @@ dist_buildaux_SCRIPTS = \
+-dist_man_MANS = \
+-  man/autoconf.1 \
+-  man/autoheader.1 \
+-  man/autom4te.1 \
+-  man/autoreconf.1 \
+-  man/autoscan.1 \
+-  man/autoupdate.1 \
+-  man/ifnames.1
+-
+-
diff --git a/meta/recipes-devtools/autoconf/autoconf/performance.patch b/meta/recipes-devtools/autoconf/autoconf/performance.patch
deleted file mode 100644
index 1842fe92b78..00000000000
--- a/meta/recipes-devtools/autoconf/autoconf/performance.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-The check for solaris 'print' causes significant problems on a linux machine
-with dash as /bin/sh since it triggers the execution of "print" which on some 
-linux systems is a perl script which is part of mailcap. Worse, this perl 
-script calls "which file" and if successful ignores the path file was found 
-in and just runs "file" without a path. Each exection causes PATH to be searched.
-
-Simply assuming the shell's printf function works cuts out all the fork overhead
-and when parallel tasks are running, this overhead appears to be significant.
-
-RP
-2015/11/28
-Upstream-Status: Inappropriate
-
-Index: autoconf-2.69/lib/m4sugar/m4sh.m4
-===================================================================
---- autoconf-2.69.orig/lib/m4sugar/m4sh.m4
-+++ autoconf-2.69/lib/m4sugar/m4sh.m4
-@@ -1045,40 +1045,8 @@ m4_defun([_AS_ECHO_PREPARE],
- [[as_nl='
- '
- export as_nl
--# Printing a long string crashes Solaris 7 /usr/bin/printf.
--as_echo='\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'
--as_echo=$as_echo$as_echo$as_echo$as_echo$as_echo
--as_echo=$as_echo$as_echo$as_echo$as_echo$as_echo$as_echo
--# Prefer a ksh shell builtin over an external printf program on Solaris,
--# but without wasting forks for bash or zsh.
--if test -z "$BASH_VERSION$ZSH_VERSION" \
--    && (test "X`print -r -- $as_echo`" = "X$as_echo") 2>/dev/null; then
--  as_echo='print -r --'
--  as_echo_n='print -rn --'
--elif (test "X`printf %s $as_echo`" = "X$as_echo") 2>/dev/null; then
--  as_echo='printf %s\n'
--  as_echo_n='printf %s'
--else
--  if test "X`(/usr/ucb/echo -n -n $as_echo) 2>/dev/null`" = "X-n $as_echo"; then
--    as_echo_body='eval /usr/ucb/echo -n "$][1$as_nl"'
--    as_echo_n='/usr/ucb/echo -n'
--  else
--    as_echo_body='eval expr "X$][1" : "X\\(.*\\)"'
--    as_echo_n_body='eval
--      arg=$][1;
--      case $arg in @%:@(
--      *"$as_nl"*)
--	expr "X$arg" : "X\\(.*\\)$as_nl";
--	arg=`expr "X$arg" : ".*$as_nl\\(.*\\)"`;;
--      esac;
--      expr "X$arg" : "X\\(.*\\)" | tr -d "$as_nl"
--    '
--    export as_echo_n_body
--    as_echo_n='sh -c $as_echo_n_body as_echo'
--  fi
--  export as_echo_body
--  as_echo='sh -c $as_echo_body as_echo'
--fi
-+as_echo='printf %s\n'
-+as_echo_n='printf %s'
- ]])# _AS_ECHO_PREPARE
- 
- 
diff --git a/meta/recipes-devtools/autoconf/autoconf/preferbash.patch b/meta/recipes-devtools/autoconf/autoconf/preferbash.patch
index fa76ee9bdd3..3979e83f70c 100644
--- a/meta/recipes-devtools/autoconf/autoconf/preferbash.patch
+++ b/meta/recipes-devtools/autoconf/autoconf/preferbash.patch
@@ -1,25 +1,36 @@
-This value is used to determine CONFIG_SHELL and SHELL which may get exported into
-scripts shared via sstate onto other systems.
+From 0aac3047cd7681d610b22d79501c297fa3433148 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Thu, 12 Mar 2020 17:25:41 +0000
+Subject: [PATCH 2/7] m4sh: prefer bash over sh
 
-Some systems have /bin/sh -> dash and others /bin/sh -> bash. Bash is preferred 
-but sometimes we can sometimes end up exporting /bin/sh yet use bashisms.
+_AS_DETECT_BETTER_SHELL looks for a good shell to use, and tries to look for
+'sh' before 'bash'.  Whilst for many systems sh is a symlink to bash,
+there are many where sh is a symlink to a more minimal sh implementation.
 
-This patch puts bash first in the search results which avoids the bash/dash confusion.
+For example, Debian by default has /bin/sh -> /bin/dash: dash is a faster
+shell to start (which makes a notable difference to boot speed) but is not
+as fast as bash at executing long scripts (and configure scripts are not
+known for their conciseness).
 
-RP 2012/9/23
+Change the search order to bash then sh, so that a known-good shell (bash)
+is used if available over something which is merely POSIX compliant.
+---
+ lib/m4sugar/m4sh.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Upstream-Status: Inappropriate [OE specific configuration]
-
-Index: autoconf-2.69/lib/m4sugar/m4sh.m4
-===================================================================
---- autoconf-2.69.orig/lib/m4sugar/m4sh.m4	2012-03-07 17:35:26.000000000 +0000
-+++ autoconf-2.69/lib/m4sugar/m4sh.m4	2013-09-23 16:12:38.853597515 +0000
-@@ -229,7 +229,7 @@
+diff --git a/lib/m4sugar/m4sh.m4 b/lib/m4sugar/m4sh.m4
+index 9d543952..84ef84a9 100644
+--- a/lib/m4sugar/m4sh.m4
++++ b/lib/m4sugar/m4sh.m4
+@@ -230,7 +230,7 @@ dnl Remove any tests from suggested that are also required
      [_AS_PATH_WALK([/bin$PATH_SEPARATOR/usr/bin$PATH_SEPARATOR$PATH],
        [case $as_dir in @%:@(
  	 /*)
 -	   for as_base in sh bash ksh sh5; do
 +	   for as_base in bash sh ksh sh5; do
  	     # Try only shells that exist, to save several forks.
- 	     as_shell=$as_dir/$as_base
+ 	     as_shell=$as_dir$as_base
  	     AS_IF([{ test -f "$as_shell" || test -f "$as_shell.exe"; } &&
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch b/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch
index 978a401f0a7..4ff535fc155 100644
--- a/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch
+++ b/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch
@@ -1,20 +1,26 @@
-Upstream-Status: Pending
+From f4f19a5c03e8ae3b9cc93d24b76694f4b7b2eb76 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Thu, 12 Mar 2020 17:28:38 +0000
+Subject: [PATCH 3/7] program_prefix.patch
 
-#
-# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-#
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ lib/autoconf/general.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
---- autoconf-2.57/lib/autoconf/general.m4~program_prefix
-+++ autoconf-2.57/lib/autoconf/general.m4
-@@ -1676,8 +1676,9 @@
+diff --git a/lib/autoconf/general.m4 b/lib/autoconf/general.m4
+index 16f0d074..4c5e0b36 100644
+--- a/lib/autoconf/general.m4
++++ b/lib/autoconf/general.m4
+@@ -2070,7 +2070,7 @@ _AC_CANONICAL_SPLIT([target])
+ 
  # The aliases save the names the user supplied, while $host etc.
  # will get canonicalized.
- test -n "$target_alias" &&
--  test "$program_prefix$program_suffix$program_transform_name" = \
--    NONENONEs,x,x, &&
-+  test "$target_alias" != "$host_alias" &&
-+    test "$program_prefix$program_suffix$program_transform_name" = \
-+      NONENONEs,x,x, &&
+-test -n "$target_alias" &&
++test -n "$target_alias" && test "$target_alias" != "$host_alias" &&
+   test "$program_prefix$program_suffix$program_transform_name" = \
+     NONENONEs,x,x, &&
    program_prefix=${target_alias}-[]dnl
- ])# AC_CANONICAL_TARGET
- 
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch b/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch
index 55d2e2fe7ef..b842f14f4fc 100644
--- a/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch
+++ b/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch
@@ -1,17 +1,18 @@
-We have problem using hardcoded directories like /usr/local here
-which will be checked for cross builds. This is a special case which
-is valid for AIX only. We do not have AIX as one of our supported
-build host or target. Therefore we get rid of the hardcoded paths
-and make life easier for cross compilation process.
+From a08643ac3fef884900d6cfa161f0acec3ef104d1 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Thu, 12 Mar 2020 17:25:37 +0000
+Subject: [PATCH 1/7] remove-usr-local-lib-from-m4.patch
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ lib/autoconf/functions.m4 | 9 ---------
+ 1 file changed, 9 deletions(-)
 
-Upstream-Status: Inappropriate [Upstream does care for AIX while we may not]
-Index: autoconf-2.68/lib/autoconf/functions.m4
-===================================================================
---- autoconf-2.68.orig/lib/autoconf/functions.m4	2010-09-22 14:52:19.000000000 -0700
-+++ autoconf-2.68/lib/autoconf/functions.m4	2011-08-03 11:57:05.822199513 -0700
-@@ -749,15 +749,6 @@ if test $ac_have_func = no; then
+diff --git a/lib/autoconf/functions.m4 b/lib/autoconf/functions.m4
+index 12f60b99..07da7941 100644
+--- a/lib/autoconf/functions.m4
++++ b/lib/autoconf/functions.m4
+@@ -801,15 +801,6 @@ if test $ac_have_func = no; then
      [LIBS="-lutil $LIBS" ac_have_func=yes ac_cv_func_getloadavg_setgid=yes])
  fi
  
@@ -27,3 +28,6 @@ Index: autoconf-2.68/lib/autoconf/functions.m4
  # Make sure it is really in the library, if we think we found it,
  # otherwise set up the replacement function.
  AC_CHECK_FUNCS(getloadavg, [],
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.69.bb b/meta/recipes-devtools/autoconf/autoconf_2.71.bb
similarity index 69%
rename from meta/recipes-devtools/autoconf/autoconf_2.69.bb
rename to meta/recipes-devtools/autoconf/autoconf_2.71.bb
index e30536a2213..3202a872738 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.71.bb
@@ -5,32 +5,23 @@ file that lists the operating system features that the package can use, in the f
 LICENSE = "GPLv3+"
 HOMEPAGE = "http://www.gnu.org/software/autoconf/"
 SECTION = "devel"
-DEPENDS = "m4-native gnu-config-native"
+DEPENDS = "m4-native autoconf-native automake-native gnu-config-native help2man-native"
+DEPENDS_remove_class-native = "autoconf-native automake-native help2man-native"
 
-PR = "r11"
+LIC_FILES_CHKSUM = "file://COPYING;md5=cc3f3a7596cb558bbd9eb7fbaa3ef16c \
+		    file://COPYINGv3;md5=1ebbd3e34237af26da5dc08a4e440464"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-		    file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504"
-
-SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/autoconf/${BP}.tar.gz \
            file://program_prefix.patch \
-           file://check-automake-cross-warning.patch \
            file://autoreconf-exclude.patch \
-           file://autoreconf-gnuconfigize.patch \
-           file://config_site.patch \
            file://remove-usr-local-lib-from-m4.patch \
            file://preferbash.patch \
            file://autotest-automake-result-format.patch \
-           file://add_musl_config.patch \
-           file://performance.patch \
-           file://AC_HEADER_MAJOR-port-to-glibc-2.25.patch \
-           file://autoconf-replace-w-option-in-shebangs-with-modern-use-warnings.patch \
+           file://man-host-perl.patch \
            "
+SRC_URI_append_class-native = " file://no-man.patch"
 
-SRC_URI[md5sum] = "82d05e03b93e45f5a39b828dc9c6c29b"
-SRC_URI[sha256sum] = "954bd69b391edc12d6a4a51a2dd1476543da5c6bbf05a95b59dc0dd6fd4c2969"
-
-SRC_URI_append_class-native = " file://fix_path_xtra.patch"
+SRC_URI[sha256sum] = "431075ad0bf529ef13cb41e9042c542381103e80015686222b8a9d4abef42a1c"
 
 RDEPENDS_${PN} = "m4 gnu-config \
 		  perl \
@@ -69,11 +60,14 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PERL='${PERL}'"
 
 EXTRA_OECONF += "ac_cv_path_M4=m4 ac_cv_prog_TEST_EMACS=no"
 
-do_configure() {
-	# manually install a newer config.guess/.sub
+# As autoconf installs its own config.* files, ensure that they're always up to date.
+update_gnu_config() {
 	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/build-aux
 	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/build-aux
+}
+do_configure[prefuncss] += "update_gnu_config"
 
+do_configure_class-native() {
 	oe_runconf
 }
 
-- 
2.27.0

