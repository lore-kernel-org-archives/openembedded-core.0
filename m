Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4684C771D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 06:40:10 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id p66so17444897pga.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2016 22:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UZGbddDkZ8nbxN/Ws34nbBZH8fppRcQ177eSyYKE3Eg=;
	b=ekQUgkpeHPX25Ukdf23nNgDPXRNhhNVwUJTGUsTu83OwHswShRLtphxScenGfisurG
	LkI0/briMZTHKVWWA2L1CFC589D5Y2mZWuTQDTdE5FCK+t7NNqceIXWCFa3SH/S7XO5s
	JMG0HBgzPIdHW6r+q5MB1iewm5cnVhEz6AQzJ2NFvgfNE4gr8HSe6p8p7yEKUhc38hr/
	QCyNVC/cOX06Z6Eq1wY3ezL8pRWH/hiwGI1VHzD9tp/s0B8DF5sNqcoAnogoD3f/axl7
	DoOfaCHscqppOcx0J8ahmgatn79abWG/DyyY5HAQ/cFoBw/VJN4XMu4+I50rl0zps8Ta
	rQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UZGbddDkZ8nbxN/Ws34nbBZH8fppRcQ177eSyYKE3Eg=;
	b=Fv7FRPCgcs+V77iULOulBZyLRHb3vdFDMjlQUA8X+hz/xQ9msIkxPdy2HuLxXEMOWC
	8POthKrJApjZMWh7s4Ih+I0U7vJY2QeSfZ2k76n2vWe8L3EhMUfj61h+0E4Qf4XgTlqe
	78cd0U04dzxc6SqBPKh35FG/0B2N7+uZEnUJtlGDjLG9ZEBIY2HiALknGWejOMNHiqsS
	9sI4l9rJ6qI+aGt/V0tOSR112eFepZxvrdDuBUW7ySv6HVSZOngWQLdT6RMTqrJiuJ6V
	SceI8I2aImvOQgNLG8JaVnc63ma5XciMOoCgo4uQMtPc//drF/67T7IsHNkTVLs5FWgS
	xljA==
X-Gm-Message-State: AKaTC02dlRfrhZ798fCQvy16AKHBtrNyPWJDMVzlVx9k+5SFcATlBChFuDRNTWfh54fRbw==
X-Received: by 10.84.206.37 with SMTP id f34mr31901298ple.127.1482129611688;
	Sun, 18 Dec 2016 22:40:11 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	72sm28238304pfw.37.2016.12.18.22.40.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Dec 2016 22:40:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2016 22:39:55 -0800
Message-Id: <20161219063957.18716-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161219063957.18716-1-raj.khem@gmail.com>
References: <20161219063957.18716-1-raj.khem@gmail.com>
Subject: [V2 08/10] autoconf: Fix AC_HEADER_MAJOR with glibc 2.25
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
X-List-Received-Date: Mon, 19 Dec 2016 06:40:10 -0000

Backport the patch from master for 2.69

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../AC_HEADER_MAJOR-port-to-glibc-2.25.patch       | 162 +++++++++++++++++++++
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |   1 +
 2 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/AC_HEADER_MAJOR-port-to-glibc-2.25.patch

diff --git a/meta/recipes-devtools/autoconf/autoconf/AC_HEADER_MAJOR-port-to-glibc-2.25.patch b/meta/recipes-devtools/autoconf/autoconf/AC_HEADER_MAJOR-port-to-glibc-2.25.patch
new file mode 100644
index 0000000000..fc37236bf8
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/AC_HEADER_MAJOR-port-to-glibc-2.25.patch
@@ -0,0 +1,162 @@
+From e17a30e987d7ee695fb4294a82d987ec3dc9b974 Mon Sep 17 00:00:00 2001
+From: Eric Blake <eblake@redhat.com>
+Date: Wed, 14 Sep 2016 08:17:06 -0500
+Subject: [PATCH] AC_HEADER_MAJOR: port to glibc 2.25
+
+glibc 2.25 is deprecating the namespace pollution of <sys/types.h>
+injecting major(), minor(), and makedev() into the compilation
+environment, with a warning that insists that users include
+<sys/sysmacros.h> instead.  However, because the expansion of
+AC_HEADER_MAJOR didn't bother checking sys/sysmacros.h until
+after probing whether sys/types.h pollutes the namespace, it was
+not defining MAJOR_IN_SYSMACROS, with the result that code
+compiled with -Werror chokes on the deprecation warnings because
+it was not including sysmacros.h.
+
+In addition to fixing autoconf (which only benefits projects
+that rebuild configure after this fix is released), we can also
+give a hint to distros on how they can populate config.site with
+a cache variable to force pre-existing configure scripts without
+the updated macro to behave sanely in the presence of glibc 2.25
+(the documentation is especially useful since that cache variable
+is no longer present in autoconf after this patch).
+
+Note that mingw lacks major/minor/makedev in any of its standard
+headers; for that platform, the behavior of this macro is unchanged
+(code using the recommended include formula will get a compile error
+when trying to use major(), whether before or after this patch); but
+for now, it is assumed that programs actually concerned with
+creating devices are not worried about portability to mingw.  If
+desired, a later patch could tighten AC_HEADER_MAJOR to fail at
+configure time if the macros are unavailable in any of the three
+system headers, but that semantic change is not worth mixing into
+this patch.
+
+* lib/autoconf/headers.m4 (AC_HEADER_MAJOR): Drop check for
+major within sys/types.h; it interferes with the need to check
+sysmacros.h first.
+* doc/autoconf.texi (Particular Headers) <AC_HEADER_MAJOR>: Expand
+details on usage, and on workarounds for non-updated projects.
+
+Signed-off-by: Eric Blake <eblake@redhat.com>
+---
+Upstream-Status: Backport
+
+ doc/autoconf.texi       |   35 +++++++++++++++++++++++++++++++----
+ lib/autoconf/headers.m4 |   30 ++++++++++++++----------------
+ 2 files changed, 45 insertions(+), 20 deletions(-)
+
+Index: autoconf-2.69/doc/autoconf.texi
+===================================================================
+--- autoconf-2.69.orig/doc/autoconf.texi
++++ autoconf-2.69/doc/autoconf.texi
+@@ -15,7 +15,7 @@
+ @c The ARG is an optional argument.  To be used for macro arguments in
+ @c their documentation (@defmac).
+ @macro ovar{varname}
+-@r{[}@var{\varname\}@r{]}@c
++@r{[}@var{\varname\}@r{]}
+ @end macro
+ 
+ @c @dvar(ARG, DEFAULT)
+@@ -23,7 +23,7 @@
+ @c The ARG is an optional argument, defaulting to DEFAULT.  To be used
+ @c for macro arguments in their documentation (@defmac).
+ @macro dvar{varname, default}
+-@r{[}@var{\varname\} = @samp{\default\}@r{]}@c
++@r{[}@var{\varname\} = @samp{\default\}@r{]}
+ @end macro
+ 
+ @c Handling the indexes with Texinfo yields several different problems.
+@@ -5926,10 +5926,37 @@ Also see @code{AC_STRUCT_DIRENT_D_INO} a
+ @cvindex MAJOR_IN_SYSMACROS
+ @hdrindex{sys/mkdev.h}
+ @hdrindex{sys/sysmacros.h}
+-If @file{sys/types.h} does not define @code{major}, @code{minor}, and
+-@code{makedev}, but @file{sys/mkdev.h} does, define
+-@code{MAJOR_IN_MKDEV}; otherwise, if @file{sys/sysmacros.h} does, define
+-@code{MAJOR_IN_SYSMACROS}.
++Detect the headers required to use @code{makedev}, @code{major}, and
++@code{minor}.  These functions may be defined by @file{sys/mkdev.h},
++@code{sys/sysmacros.h}, or @file{sys/types.h}.
++
++@code{AC_HEADER_MAJOR} defines @code{MAJOR_IN_MKDEV} if they are in
++@file{sys/mkdev.h}, or @code{MAJOR_IN_SYSMACROS} if they are in
++@file{sys/sysmacros.h}.  If neither macro is defined, they are either in
++@file{sys/types.h} or unavailable.
++
++To properly use these functions, your code should contain something
++like:
++
++@verbatim
++#include <sys/types.h>
++#ifdef MAJOR_IN_MKDEV
++# include <sys/mkdev.h>
++#elif defined MAJOR_IN_SYSMACROS
++# include <sys/sysmacros.h>
++#endif
++@end verbatim
++
++Note: Configure scripts built with Autoconf 2.69 or earlier will not
++detect a problem if @file{sys/types.h} contains definitions of
++@code{major}, @code{minor}, and/or @code{makedev} that trigger compiler
++warnings upon use.  This is known to occur with GNU libc 2.25, where
++those definitions are being deprecated to reduce namespace pollution.
++If it is not practical to use Autoconf 2.70 to regenerate the configure
++script of affected software, you can work around the problem by setting
++@samp{ac_cv_header_sys_types_h_makedev=no}, as an argument to
++@command{configure} or as part of a @file{config.site} site default file
++(@pxref{Site Defaults}).
+ @end defmac
+ 
+ @defmac AC_HEADER_RESOLV
+Index: autoconf-2.69/lib/autoconf/headers.m4
+===================================================================
+--- autoconf-2.69.orig/lib/autoconf/headers.m4
++++ autoconf-2.69/lib/autoconf/headers.m4
+@@ -502,31 +502,29 @@ fi
+ 
+ # AC_HEADER_MAJOR
+ # ---------------
++# Thanks to glibc 2.25 deprecating macros in sys/types.h, coupled with
++# back-compat to autoconf 2.69, we need the following logic:
++# Check whether <sys/types.h> compiles.
++# If <sys/mkdev.h> compiles, assume it provides major/minor/makedev.
++# Otherwise, if <sys/sysmacros.h> compiles, assume it provides the macros.
++# Otherwise, either the macros were provided by <sys/types.h>, or do
++# not exist on the platform.  Code trying to use these three macros is
++# assumed to not care about platforms that lack the macros.
+ AN_FUNCTION([major],     [AC_HEADER_MAJOR])
+ AN_FUNCTION([makedev],   [AC_HEADER_MAJOR])
+ AN_FUNCTION([minor],     [AC_HEADER_MAJOR])
+ AN_HEADER([sys/mkdev.h], [AC_HEADER_MAJOR])
+ AC_DEFUN([AC_HEADER_MAJOR],
+-[AC_CACHE_CHECK(whether sys/types.h defines makedev,
+-		ac_cv_header_sys_types_h_makedev,
+-[AC_LINK_IFELSE([AC_LANG_PROGRAM([[@%:@include <sys/types.h>]],
+-				 [[return makedev(0, 0);]])],
+-		[ac_cv_header_sys_types_h_makedev=yes],
+-		[ac_cv_header_sys_types_h_makedev=no])
+-])
+-
+-if test $ac_cv_header_sys_types_h_makedev = no; then
++[AC_CHECK_HEADERS_ONCE([sys/types.h])
+ AC_CHECK_HEADER(sys/mkdev.h,
+ 		[AC_DEFINE(MAJOR_IN_MKDEV, 1,
+ 			   [Define to 1 if `major', `minor', and `makedev' are
+ 			    declared in <mkdev.h>.])])
+-
+-  if test $ac_cv_header_sys_mkdev_h = no; then
+-    AC_CHECK_HEADER(sys/sysmacros.h,
+-		    [AC_DEFINE(MAJOR_IN_SYSMACROS, 1,
+-			       [Define to 1 if `major', `minor', and `makedev'
+-				are declared in <sysmacros.h>.])])
+-  fi
++if test $ac_cv_header_sys_mkdev_h = no; then
++  AC_CHECK_HEADER(sys/sysmacros.h,
++		  [AC_DEFINE(MAJOR_IN_SYSMACROS, 1,
++			     [Define to 1 if `major', `minor', and `makedev'
++			      are declared in <sysmacros.h>.])])
+ fi
+ ])# AC_HEADER_MAJOR
+ 
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.69.bb b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
index aa1877a1fb..fd01585441 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
@@ -14,6 +14,7 @@ SRC_URI += "file://check-automake-cross-warning.patch \
             file://autotest-automake-result-format.patch \
             file://add_musl_config.patch \
             file://performance.patch \
+            file://AC_HEADER_MAJOR-port-to-glibc-2.25.patch \
            "
 
 SRC_URI[md5sum] = "82d05e03b93e45f5a39b828dc9c6c29b"
-- 
2.11.0


