Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id A5EE471DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:06:17 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id w68so852888pgw.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2016 19:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xv6ooZ+QQragLwHli4HST83nRF4Wt9xOH+Srox+lm8w=;
	b=tgselQonmcOoqohNCv9WHP9GdBKeUreEJGohB5ObwU7aNv59kEYtG0DjawkkzZzUMW
	nyIloYyp3D0EkT2kiXiy88nYYtRjPcPqSCfVGgLITuuyo4ltudeEAPFrD07peTiaH7lb
	b5eXr/w7khLOpAawGPMWc0l5mWsnGBccsqn6rTq/gtXd0IKL/sL1TewUqpzglpaoCzfl
	Z933oZvWIewx3Mdjbke6M3N6TJ9iyHZ3oWUhAsxrKOA4EHZS/anQ+AEf8mDisOiIzdfH
	VKsmWmQT19rFMrhlZUyXD7elvbQvhDtHuHwapepNH/8+2pxhalP1wpxtdIkYFPCy1jyX
	/5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xv6ooZ+QQragLwHli4HST83nRF4Wt9xOH+Srox+lm8w=;
	b=cA1nk9zlbZ+eqcbKiamAHUyXBo0HAsGUKriWFdZGBFuGnPg7cnnjFU2NvGtvrOFJ0/
	yV83556ya5mh/LRKsNpSlR1ZekWSJlphtIgpgTE/5MrLdWjwHyE68afxg3wHu0NqHBWK
	pMSESiViC5A00/QMTTG2+7uaqYY7N+SW2okuJaf28cicAQxD9dG75DYZOcLNDKYdAbmi
	eyb0vEuwoZWP84Fkqxh9JyLUNZrtwroSvGrMoL0sSi662cSTJ7jhZzI8e7QPRot9iEPQ
	t6DAJ37hc0khZ+yw4IrMlLNtyEUAQM/BYk2fQdWGAnKYLdHihreZz1qOJW41NXVX+iZI
	ULzA==
X-Gm-Message-State: AKaTC00yWRYGC+REAYJ2IugzSyLZGWGohNooNc02CqtxajOSEwr00Ffs/VZxdYcL2PyXtw==
X-Received: by 10.98.133.9 with SMTP id u9mr12969530pfd.137.1482116779207;
	Sun, 18 Dec 2016 19:06:19 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	65sm26830276pfn.12.2016.12.18.19.06.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Dec 2016 19:06:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2016 19:06:00 -0800
Message-Id: <20161219030600.1284-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161219030600.1284-1-raj.khem@gmail.com>
References: <20161219030600.1284-1-raj.khem@gmail.com>
Subject: [PATCH 8/8] autoconf: Fix AC_HEADER_MAJOR with glibc 2.25
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
X-List-Received-Date: Mon, 19 Dec 2016 03:06:17 -0000

Backport the patch from master for 2.69

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../AC_HEADER_MAJOR-port-to-glibc-2.25.patch       | 147 +++++++++++++++++++++
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |   1 +
 2 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/AC_HEADER_MAJOR-port-to-glibc-2.25.patch

diff --git a/meta/recipes-devtools/autoconf/autoconf/AC_HEADER_MAJOR-port-to-glibc-2.25.patch b/meta/recipes-devtools/autoconf/autoconf/AC_HEADER_MAJOR-port-to-glibc-2.25.patch
new file mode 100644
index 0000000000..8af6c0fdca
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/AC_HEADER_MAJOR-port-to-glibc-2.25.patch
@@ -0,0 +1,147 @@
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
+diff --git a/doc/autoconf.texi b/doc/autoconf.texi
+index 9ad7dc1..4f041bd 100644
+--- a/doc/autoconf.texi
++++ b/doc/autoconf.texi
+@@ -5970,10 +5970,37 @@ Also see @code{AC_STRUCT_DIRENT_D_INO} and
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
+diff --git a/lib/autoconf/headers.m4 b/lib/autoconf/headers.m4
+index 0c44973..72262c1 100644
+--- a/lib/autoconf/headers.m4
++++ b/lib/autoconf/headers.m4
+@@ -427,31 +427,29 @@ fi
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
+-- 
+1.7.10.4
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


