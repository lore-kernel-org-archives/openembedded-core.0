Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7275.1794460829649785660
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 21:20:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=psd5F3vX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IxeUKA6X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a1ce3343ea-b656d142-08da-4d94-9c62-9cfd821dd22e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794460828;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=i8xc/xesnSjK6PXJ8qphDgM/0mXJs3LEOOSrZ/bb76g=;
	b=psd5F3vXyZ+nLabxNQLwGCJJdfq/KqpmkrSmpNL37JxoPwuJuE3Iq7zDykaBIlhw
	QgSt6Cb4xkEE0EY1wU2tioUAckybK4zqV4FHl1CqdhOWDL9B8KrXjxB59yNarfDb49P
	pHMGO0vVbau0U81Mq8dqp+Oi54PrOtj4ZxYRrbus=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794460828;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=i8xc/xesnSjK6PXJ8qphDgM/0mXJs3LEOOSrZ/bb76g=;
	b=IxeUKA6XoB50mqfUHRNY95wqkpbTWRI7sPNWwnrsJ4a051fQIaf9fP+EGqHv2ArF
	YJX2mCHY98hu2C7VTutgZUncrXuN5Fr+g99IBYfDi4Cy/Q3Y2DLgQDKKWOy3Bz10s9H
	RS92a5lhDOvA5NJQVbYCCNbdeEl/y3tV6MTP8QBs=
Content-Type: multipart/mixed; boundary="===============1356254331101768528=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Aravind Bandari <Aravind.Bandari@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] autoconf-archive: upgrading to 2026.11.11 SUCCEEDED
Message-ID: <010101a1ce3343ea-b656d142-08da-4d94-9c62-9cfd821dd22e-000000@us-west-2.amazonses.com>
Date: Thu, 12 Nov 2026 05:20:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.12-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 05:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250066

--===============1356254331101768528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *autoconf-archive* to *2026.11.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-autoconf-archive-upgrade-2024.10.16-2026.11.11.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From c304b0376e79c6feff950b277148d951a277883a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 12 Nov 2026 05:15:07 +0000
Subject: [PATCH] autoconf-archive: upgrade 2024.10.16 -> 2026.11.11

# Copyright (c) 2026 Autoconf Archive Maintainers <autoconf-archive-
maintainers@gnu.org>

Merge pull request #318 from autoconf-archive/revert-288-luajit
Revert "Add LuaJIT support to AX_PROG_LUA macro"

Merge pull request #327 from rrthomas/code_coverage-doc
AX_CODE_COVERAGE: fix documentation

AX_PTHREAD: Fix pthread detection on Solaris 11.4
AX_PTHREAD fails to detect pthread support on Solaris 11.4.  This was
originally noticed with the copy of ax_pthread.m4 in the GCC source tree:

build: Fix ax_pthread.m4 on Solaris 11.4
https://gcc.gnu.org/pipermail/gcc-patches/2026-May/716850.html

It turns out the problem is that AX_PTHREAD expects _REENTRANT to be
defined on Solaris.  However, as described in

https://gcc.gnu.org/gcc-16/porting_to.html#solaris
and
Goodbye (And Good Riddance) to -mt -and -D_REENTRANT
https://www.linker-aliens.org/blogs/ali/entry/mtreentrant/

referenced from there, Solaris 11.4 removed references to _REENTRANT from
the Solaris system headers.  Given that, GCC 16 no longers defines it with
-pthread.

This started when libpthread was folded into libc in Solaris 11.

However, AX_PTHREAD expects _REENTRANT to be defined in multithreaded
programs on Solaris, which is no longer true.  To detect the situation,
this patch checks for XPG7 support which was introduced together with those
changes in Solaris 11.4.

However, the _REENTRANT check is dubious at best.  If a feature isn't
detected, this may be because the corresponding feature test macros isn't
defined.  However, the reverse is not true: a feature way well be available
be default without any feature test macro.

The fix was tested in the GCC tree as described above, and manually on
Solaris 11.3 where _REENTRANT is still referenced and needed.

Closes #341.

ax_lib_hdf5.m4:  fix "The macro 'AC_HAVE_LIBRARY' is obsolete."
- from
  https://www.gnu.org/software/autoconf/manual/autoconf-2.69/html_node/Obsolete-
  Macros.html replaced with AC_CHECK_LIB

Closes #342.

Merge pull request #323 from jas4711/avoid-timestamps
Don't embed build timestamp for AX_AM_MACROS*.

Merge pull request #325 from uckelman-sf/fix_ax_pkg_check_modules_whitespace
AX_PKG_CHECK_MODULES: Remove extra whitespace from PUBLIC-MODULES and PRIVATE-
MODULES arguments

Merge pull request #326 from Tropicao/patch-1
ax_python.m4: add new python version

Merge pull request #333 from DanielEScherzer/patch-1
ax_prog_bison_version.m4: fix incorrect description

Merge pull request #335 from bdrung/boost_python
ax_boost_python.m4: try versioned boost_python first

Merge pull request #336 from BrianAker/ax_check_compile_flag
AX_CHECK_COMPILE_FLAG incorrectly accepts warning flags with GNU compilers

AX_GCC_VAR_ATTRIBUTE: add a case for nonstring
Without one the attribute falls to the generic fallback, which declares
an int:

    int foo __attribute__((nonstring));

nonstring only applies to arrays and pointers of character type, so the
compiler ignores it there and warns:

    warning: 'nonstring' attribute ignored on objects of type 'int'
    [-Wattributes]

The macro reads any warning as the attribute being unsupported, so the
check answers no on every compiler, including the ones that support it.

Test it on a char array instead, which is what the attribute is for.
Checked against gcc 15, gcc 16 and clang 22.

ax_cxx_compile_stdcxx.m4: fix -Wunused issue with C++-17 feature test
Some projects may pass `-Wunused -Werror` in as CXX/CXXFLAGS, resulting
in a build failure when running the C++-17 feature tests that confirm that
`constexpr` lambdas are supported.

Use `static_assert` to test the value set in the test, muting the -Wunused
issue found by the compiler.

AX_CHECK_COMPILE_FLAG incorrectly accept unsupported warning flags with GNU
compilers
AX_CHECK_COMPILE_FLAG could incorrectly accept unsupported warning flags with
GNU compilers because it appended -Werror after the candidate flag being tested.
With GCC/G++, diagnostics for wrong-language or otherwise unsupported warning
options can be order-sensitive, so a warning emitted for the tested flag may not
be promoted to an error when -Werror appears later on the command line. As a
result, the probe could succeed even though the flag should have been rejected.

This change initializes add_gnu_werror explicitly and places -Werror before the
candidate flag in the probe command, so GNU compilers fail these checks
reliably. It fixes false positives during configure-time flag detection,
especially for warning options that are valid in C but not C++.

To highlight how the behavior correct here are two one liners:
printf 'int main(){return 0;}\n' | g++-15 -Wmissing-prototypes -Werror -x c++ -
printf 'int main(){return 0;}\n' | g++-15 -Werror -Wmissing-prototypes -x c++ -

ax_boost_python.m4: try versioned boost_python first
Multiple boot_python libraries might be installed on the system. As of
March 2026 Ubuntu resolute has libraries for Python 3.13 and 3.14:

```
$ ls -1 /usr/lib/x86_64-linux-gnu/libboost_python*.so*
/usr/lib/x

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...daa3da0eb1a256fda631867e19345d5f6e3a.patch | 33 ----------------
 ...226a2fe3980388abffd6de25ed6b9591cce3.patch | 39 -------------------
 ...8d9e3ead52f998535b86c763065c5b45cc59.patch | 38 ------------------
 ...0.16.bb => autoconf-archive_2026.11.11.bb} |  5 +--
 4 files changed, 1 insertion(+), 114 deletions(-)
 delete mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-archive/3a23daa3da0eb1a256fda631867e19345d5f6e3a.patch
 delete mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-archive/427e226a2fe3980388abffd6de25ed6b9591cce3.patch
 delete mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-archive/e25f8d9e3ead52f998535b86c763065c5b45cc59.patch
 rename meta/recipes-devtools/autoconf-archive/{autoconf-archive_2024.10.16.bb => autoconf-archive_2026.11.11.bb} (64%)

diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive/3a23daa3da0eb1a256fda631867e19345d5f6e3a.patch b/meta/recipes-devtools/autoconf-archive/autoconf-archive/3a23daa3da0eb1a256fda631867e19345d5f6e3a.patch
deleted file mode 100644
index 64d73781d3..0000000000
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive/3a23daa3da0eb1a256fda631867e19345d5f6e3a.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 3a23daa3da0eb1a256fda631867e19345d5f6e3a Mon Sep 17 00:00:00 2001
-From: Eli Schwartz <eschwartz93@gmail.com>
-Date: Sat, 19 Oct 2024 21:58:52 -0400
-Subject: [PATCH] ax_switch_flags.m4: properly quote m4_fatal
-
-It needs to only run as an argument of m4_if, not all the time.
-
-Fixes: 2adff78e224c908fd58df91852c8301c25777a8f
-
-Upstream-Status: Backport [https://github.com/autoconf-archive/autoconf-archive/commit/3a23daa3da0eb1a256fda631867e19345d5f6e3a]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- m4/ax_switch_flags.m4 | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/m4/ax_switch_flags.m4 b/m4/ax_switch_flags.m4
-index dc79d1e9..777aeb0b 100644
---- a/m4/ax_switch_flags.m4
-+++ b/m4/ax_switch_flags.m4
-@@ -36,10 +36,10 @@
- #   and this notice are preserved. This file is offered as-is, without any
- #   warranty.
- 
--#serial 5
-+#serial 6
- 
- AC_DEFUN([AX_SWITCH_FLAGS], [
--  m4_if($1, [], m4_fatal([$0: namespace is empty]))
-+  m4_if($1, [], [m4_fatal([$0: namespace is empty])])
-   AC_REQUIRE(AX_SAVE_FLAGS)
-   AC_REQUIRE(AX_RESTORE_FLAGS)
-   AX_SAVE_FLAGS($1[])
diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive/427e226a2fe3980388abffd6de25ed6b9591cce3.patch b/meta/recipes-devtools/autoconf-archive/autoconf-archive/427e226a2fe3980388abffd6de25ed6b9591cce3.patch
deleted file mode 100644
index 8a86d0a4d8..0000000000
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive/427e226a2fe3980388abffd6de25ed6b9591cce3.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 427e226a2fe3980388abffd6de25ed6b9591cce3 Mon Sep 17 00:00:00 2001
-From: Eli Schwartz <eschwartz93@gmail.com>
-Date: Sat, 19 Oct 2024 21:51:30 -0400
-Subject: [PATCH] ax_check_gl.m4: properly quote m4_fatal
-
-It needs to only run as an argument of m4_if, not all the time.
-
-Fixes: 753493bf7e251997f02559b98fc599d4a337d8cd
-Bug: https://bugs.gentoo.org/941845
-
-Upstream-Status: Backport [https://github.com/autoconf-archive/autoconf-archive/commit/427e226a2fe3980388abffd6de25ed6b9591cce3]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- m4/ax_check_gl.m4 | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/m4/ax_check_gl.m4 b/m4/ax_check_gl.m4
-index 850d407d..4c2e4efb 100644
---- a/m4/ax_check_gl.m4
-+++ b/m4/ax_check_gl.m4
-@@ -85,7 +85,7 @@
- #   modified version of the Autoconf Macro, you may extend this special
- #   exception to the GPL to apply to your modified version as well.
- 
--#serial 23
-+#serial 24
- 
- # example gl program
- m4_define([_AX_CHECK_GL_PROGRAM],
-@@ -187,7 +187,7 @@ AC_DEFUN([_AX_CHECK_GL_LINK_CV],
- AC_DEFUN([_AX_CHECK_GL_MANUAL_LIBS_GENERIC], [
-   AS_IF([test -n "$GL_LIBS"],[], [
-     ax_check_gl_manual_libs_generic_extra_libs="$1"
--    m4_if($1, [], m4_fatal([$0: argument must not be empty]))
-+    m4_if($1, [], [m4_fatal([$0: argument must not be empty])])
- 
-     _AX_CHECK_GL_SAVE_FLAGS([CFLAGS])
-     AC_SEARCH_LIBS([glBegin],[$ax_check_gl_manual_libs_generic_extra_libs], [
diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive/e25f8d9e3ead52f998535b86c763065c5b45cc59.patch b/meta/recipes-devtools/autoconf-archive/autoconf-archive/e25f8d9e3ead52f998535b86c763065c5b45cc59.patch
deleted file mode 100644
index 9e2689010f..0000000000
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive/e25f8d9e3ead52f998535b86c763065c5b45cc59.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From e25f8d9e3ead52f998535b86c763065c5b45cc59 Mon Sep 17 00:00:00 2001
-From: Eli Schwartz <eschwartz93@gmail.com>
-Date: Sat, 19 Oct 2024 21:57:16 -0400
-Subject: [PATCH] ax_check_glx.m4: properly quote m4_fatal
-
-It needs to only run as an argument of m4_if, not all the time.
-
-Fixes: 40ca66e7e52bb63e3eee2514855fcf3ad2df7673
-
-Upstream-Status: Backport [https://github.com/autoconf-archive/autoconf-archive/commit/e25f8d9e3ead52f998535b86c763065c5b45cc59]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- m4/ax_check_glx.m4 | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/m4/ax_check_glx.m4 b/m4/ax_check_glx.m4
-index c7890d9c..b5027f9b 100644
---- a/m4/ax_check_glx.m4
-+++ b/m4/ax_check_glx.m4
-@@ -61,7 +61,7 @@
- #   modified version of the Autoconf Macro, you may extend this special
- #   exception to the GPL to apply to your modified version as well.
- 
--#serial 9
-+#serial 10
- 
- # example program
- m4_define([_AX_CHECK_GLX_PROGRAM],
-@@ -183,7 +183,7 @@ AC_DEFUN([_AX_CHECK_GLX_HEADERS],
- AC_DEFUN([_AX_CHECK_GLX_MANUAL_LIBS_GENERIC],
- [dnl
-  ax_check_glx_manual_libs_generic_extra_libs="$1"
-- m4_if($1, [], m4_fatal([$0: argument must not be empty]))
-+ m4_if($1, [], [m4_fatal([$0: argument must not be empty])])
- 
-  AC_LANG_PUSH([C])
-  _AX_CHECK_GLX_SAVE_FLAGS()
diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2026.11.11.bb
similarity index 64%
rename from meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb
rename to meta/recipes-devtools/autoconf-archive/autoconf-archive_2026.11.11.bb
index c243d632c3..abecffba0c 100644
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2026.11.11.bb
@@ -6,10 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=11cc2d3ee574f9d6b7ee797bdce4d423 \
     file://COPYING.EXCEPTION;md5=fdef168ebff3bc2f13664c365a5fb515"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI += "file://427e226a2fe3980388abffd6de25ed6b9591cce3.patch"
-SRC_URI += "file://3a23daa3da0eb1a256fda631867e19345d5f6e3a.patch"
-SRC_URI += "file://e25f8d9e3ead52f998535b86c763065c5b45cc59.patch"
-SRC_URI[sha256sum] = "7bcd5d001916f3a50ed7436f4f700e3d2b1bade3ed803219c592d62502a57363"
+SRC_URI[sha256sum] = "2c18f15e2b3bb79e09622b27391df07d8608ce9f07fbfc7c1143fa683891ab26"
 
 inherit autotools allarch texinfo
 
-- 
2.47.1


--===============1356254331101768528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="autoconf-archive-changelog.txt"

# Copyright (c) 2026 Autoconf Archive Maintainers <autoconf-archive-
maintainers@gnu.org>

Merge pull request #318 from autoconf-archive/revert-288-luajit
Revert "Add LuaJIT support to AX_PROG_LUA macro"

Merge pull request #327 from rrthomas/code_coverage-doc
AX_CODE_COVERAGE: fix documentation

AX_PTHREAD: Fix pthread detection on Solaris 11.4
AX_PTHREAD fails to detect pthread support on Solaris 11.4.  This was
originally noticed with the copy of ax_pthread.m4 in the GCC source tree:

build: Fix ax_pthread.m4 on Solaris 11.4
https://gcc.gnu.org/pipermail/gcc-patches/2026-May/716850.html

It turns out the problem is that AX_PTHREAD expects _REENTRANT to be
defined on Solaris.  However, as described in

https://gcc.gnu.org/gcc-16/porting_to.html#solaris
and
Goodbye (And Good Riddance) to -mt -and -D_REENTRANT
https://www.linker-aliens.org/blogs/ali/entry/mtreentrant/

referenced from there, Solaris 11.4 removed references to _REENTRANT from
the Solaris system headers.  Given that, GCC 16 no longers defines it with
-pthread.

This started when libpthread was folded into libc in Solaris 11.

However, AX_PTHREAD expects _REENTRANT to be defined in multithreaded
programs on Solaris, which is no longer true.  To detect the situation,
this patch checks for XPG7 support which was introduced together with those
changes in Solaris 11.4.

However, the _REENTRANT check is dubious at best.  If a feature isn't
detected, this may be because the corresponding feature test macros isn't
defined.  However, the reverse is not true: a feature way well be available
be default without any feature test macro.

The fix was tested in the GCC tree as described above, and manually on
Solaris 11.3 where _REENTRANT is still referenced and needed.

Closes #341.

ax_lib_hdf5.m4:  fix "The macro 'AC_HAVE_LIBRARY' is obsolete."
- from
  https://www.gnu.org/software/autoconf/manual/autoconf-2.69/html_node/Obsolete-
  Macros.html replaced with AC_CHECK_LIB

Closes #342.

Merge pull request #323 from jas4711/avoid-timestamps
Don't embed build timestamp for AX_AM_MACROS*.

Merge pull request #325 from uckelman-sf/fix_ax_pkg_check_modules_whitespace
AX_PKG_CHECK_MODULES: Remove extra whitespace from PUBLIC-MODULES and PRIVATE-
MODULES arguments

Merge pull request #326 from Tropicao/patch-1
ax_python.m4: add new python version

Merge pull request #333 from DanielEScherzer/patch-1
ax_prog_bison_version.m4: fix incorrect description

Merge pull request #335 from bdrung/boost_python
ax_boost_python.m4: try versioned boost_python first

Merge pull request #336 from BrianAker/ax_check_compile_flag
AX_CHECK_COMPILE_FLAG incorrectly accepts warning flags with GNU compilers

AX_GCC_VAR_ATTRIBUTE: add a case for nonstring
Without one the attribute falls to the generic fallback, which declares
an int:

    int foo __attribute__((nonstring));

nonstring only applies to arrays and pointers of character type, so the
compiler ignores it there and warns:

    warning: 'nonstring' attribute ignored on objects of type 'int'
    [-Wattributes]

The macro reads any warning as the attribute being unsupported, so the
check answers no on every compiler, including the ones that support it.

Test it on a char array instead, which is what the attribute is for.
Checked against gcc 15, gcc 16 and clang 22.

ax_cxx_compile_stdcxx.m4: fix -Wunused issue with C++-17 feature test
Some projects may pass `-Wunused -Werror` in as CXX/CXXFLAGS, resulting
in a build failure when running the C++-17 feature tests that confirm that
`constexpr` lambdas are supported.

Use `static_assert` to test the value set in the test, muting the -Wunused
issue found by the compiler.

AX_CHECK_COMPILE_FLAG incorrectly accept unsupported warning flags with GNU
compilers
AX_CHECK_COMPILE_FLAG could incorrectly accept unsupported warning flags with
GNU compilers because it appended -Werror after the candidate flag being tested.
With GCC/G++, diagnostics for wrong-language or otherwise unsupported warning
options can be order-sensitive, so a warning emitted for the tested flag may not
be promoted to an error when -Werror appears later on the command line. As a
result, the probe could succeed even though the flag should have been rejected.

This change initializes add_gnu_werror explicitly and places -Werror before the
candidate flag in the probe command, so GNU compilers fail these checks
reliably. It fixes false positives during configure-time flag detection,
especially for warning options that are valid in C but not C++.

To highlight how the behavior correct here are two one liners:
printf 'int main(){return 0;}\n' | g++-15 -Wmissing-prototypes -Werror -x c++ -
printf 'int main(){return 0;}\n' | g++-15 -Werror -Wmissing-prototypes -x c++ -

ax_boost_python.m4: try versioned boost_python first
Multiple boot_python libraries might be installed on the system. As of
March 2026 Ubuntu resolute has libraries for Python 3.13 and 3.14:

```
$ ls -1 /usr/lib/x86_64-linux-gnu/libboost_python*.so*
/usr/lib/x86_64-linux-gnu/libboost_python313.so.1.90.0
/usr/lib/x86_64-linux-gnu/libboost_python314.so.1.90.0
```

This results in picking the wrong version:

```
checking for Python include path... -I/usr/include/python3.14
checking for Python library path... -L/usr/lib/x86_64-linux-gnu -lpython3.14
checking for Python site-packages path... /usr/lib/python3.14/site-packages
checking for Python platform specific site-packages path...
/usr/lib/python3.14/site-packages
checking python extra libraries... -ldl -lm
checking python extra linking flags... -Xlinker -export-dynamic -Wl,-O1
-Wl,-Bsymbolic-functions
checking consistency of all components of python development environment... yes
checking whether the Boost::Python library is available... yes
checking whether boost_python is the correct library... no
checking whether boost_python313 is the correct library... yes
```

So try a versioned boost_python version first before trying all
available. The for loop will try `boost_python` last anyway.

Bug-Ubuntu: https://launchpad.net/bugs/2143679

ax_prog_bison_version.m4: fix incorrect description
If the bison version is greater than or equal to the version indicated,
commands in `ACTION-IF-TRUE` are executed, otherwise commands in
`ACTION-IF-FALSE` are executed. Update serial to 4.

ax_code_coverage: use --coverage
This GCC option has been available for 20 years, so no need to use the
low-level options it implies.

As a result, switch (back) to using CODE_COVERAGE_LDFLAGS, retaining
CODE_COVERAGE_LIBS for backwards compatibility with earlier versions of this
macro.

AX_CODE_COVERAGE: fix documentation
For automake, we add libraries (*_LIBS variables) to my_program_LDADD or
my_library_LIBADD (not my_program_LIBS).

AX_LIB_READLINE: remove a spurious line from the example usage code

ax_python.m4: add new python version
Projects depending on ax_python detection may fail on systems with latest python
version (3.13)

Add this new version to the list of searched versions

AX_PKG_CHECK_MODULES: Remove extra whitespace from PUBLIC-MODULES and PRIVATE-
MODULES arguments so it doesn't appear in the configure output.

Don't embed build timestamp for AX_AM_MACROS*.
Revert "Add LuaJIT support to AX_PROG_LUA macro"

Merge pull request #317 from rmenke/rmenke/libgcov-check
Make use of libgcov conditional.

Merge pull request #316 from hoodmane/float-words-emscripten-fix
AX_C_FLOAT_WORDS_BIGENDIAN: fix bug with Emscripten target

Make use of libgcov conditional.
Not all operating systems have libgcov as a separate library.  Only
add the library flag if the symbol is not already available.

AX_C_FLOAT_WORDS_BIGENDIAN: fix bug with Emscripten target
Commit 23be7ccd7f306fbc73b3f33e2f5ead716d120eef "Fix AX_C_FLOAT_WORDS_BIGENDIAN
fails whenever interprocedural optimization is enabled." introduced a regression
on the Emscripten target because it switched from grepping the object file where
the float definitely will live, to grepping conftest$EXEEXT which in the case of
Emscripten will be conftest.js but the float is in conftest.wasm. This problem
is unique to Emscripten, it is not present on any other webassembly platform.

To fix, grep `conftest*` for the float.

Merge pull request #291 from eli-schwartz/which-hunt
patch #10416: Drop unreliable dependency on `which` program, publicize settable
variables in --help

ax_switch_flags.m4: properly quote m4_fatal
It needs to only run as an argument of m4_if, not all the time.

Fixes: 2adff78e224c908fd58df91852c8301c25777a8f

ax_check_glx.m4: properly quote m4_fatal
It needs to only run as an argument of m4_if, not all the time.

Fixes: 40ca66e7e52bb63e3eee2514855fcf3ad2df7673

ax_check_gl.m4: properly quote m4_fatal
It needs to only run as an argument of m4_if, not all the time.

Fixes: 753493bf7e251997f02559b98fc599d4a337d8cd
Bug: https://bugs.gentoo.org/941845

Merge pull request #311 from ojwb/AX_CXX_COMPILE_STDCXX-add-missing-quoting
AX_CXX_COMPILE_STDCXX: Add missing quoting

AX_CXX_COMPILE_STDCXX: Add missing quoting
5b0d43b767bf3f800f97892905b6d1ba50150f1a added quoting to the
definitions of _AX_CXX_COMPILE_STDCXX_testbody_11, etc
but _AX_CXX_COMPILE_STDCXX_testbody_23 was missed.  I haven't found
a situation in which this quoting actually makes a difference, but it
does seem more correct to quote here and it really should be done
consistently for all the _AX_CXX_COMPILE_STDCXX_testbody_* definitions.

See #308

Fix AX_CPU_FREQ
- Cache variables must contain _cv_ to be cached otherwise this warning
  is emitted when generating configure script:

  AC_CACHE_VAL(ax_cpu_freq, ...): suspicious cache-id, must contain _cv_
  to be cached

- Arguments quoted
- CPU_FREQ defined to CPU frequency only when it could be determined to
  avoid defining the preprocessor macro to value unknown.
- Files with conftest in their name are already automatically removed by
  Autoconf when finishing the test, so redundant rm -f removed.

Merge pull request #296 from Explorer09/ax-prog-cc-for-build
AX_PROG_CC_FOR_BUILD patches that fix BUILD_{EXE,OBJ}EXT (Autoconf 2.70)

ax_prog_cc_for_build: Support ac_{,cv_}build_prog_cc_stdc
Improve compatibility with Autoconf 2.70 and later. Add support for
these variables for indicating build compiler capabilities:

ax_prog_cc_for_build: Fix ac_cv_prog_cc_c{99,11} regression
Fix regression where the ac_cv_prog_cc_c99 and ac_cv_prog_cc_c11 macros
are not popped after the AX_PROG_CC_FOR_BUILD call. This can cause
subsequents calls of AC_PROG_CC to use wrong cache variables to
indicate C standard support.

(Regression from serial 19 (16790f97456a6c9b4319dd6ef7b73c9ebc8cae84).
Note: It's unlikely for projects to call AC_PROG_CC again after
AX_PROG_CC_FOR_BUILD, but such usage is valid.)

ax_prog_cc_for_build: Tweak ac_cv_c_compiler_gnu code
Adjust the code of setting ac_cv_c_compiler_gnu to align with the code
of ac_cv_exeext and ac_cv_objext. The solution is now permanent rather
than just a workaround.

ax_prog_cc_for_build: Fix BUILD_{EXE,OBJ}EXT for Autoconf 2.70
Autoconf 2.70 introduced a change in AC_SUBST behavior that the variable
name in AC_SUBST no longer gets macro expanded. This breaks the rename
syntaxes of BUILD_EXEEXT and BUILD_OBJEXT in AX_PROG_CC_FOR_BUILD.
Change to an alternative approach of assigning BUILD_EXEEXT and
BUILD_OBJEXT manually. The values of EXEEXT and OBJEXT have to be fixed
too at the end of the AX_PROG_CC_FOR_BUILD code.

Revert broken part of commit 5b0d43b767bf3f800f97892905b6d1ba50150f1a
This commit breaks AX_CXX_COMPILE_STDCXX noext/ext option handling, which
caused
"AX_CXX_COMPILE_STDCXX(20, [noext], [optional])"
to result in
"checking whether g++ supports C++20 features with -std=gnu++20... yes"
which is not the desired outcome when using "noext".
It should check for "-std=c++20" instead for "-std=gnu++20", as it did before.

See
< #issuecomment-2416443298>
and
<https://github.com/autoconf-archive/autoconf-
archive/commit/5b0d43b767bf3f800f97892905b6d1ba50150f1a#commitcomment-147999469>
.

ax_have_qt: migrate from hand-rolled path lookups with `which` to AC_PATH_PROG
The "which" utility is not guaranteed to be installed either, and if it
is, its behavior is not portable either. This means that when Qt is
installed, the `which` check will report a fatal error because the which
tool did not exist and the shell returned a nonzero status when
attempting to fork+exec. If it did exist, it might not be an
implementation of `which` that returns nonzero when commands do not
exist.

The general scripting suggestion is to use the "command -v" shell
builtin is required to exist in all POSIX 2008 compliant shells, and is
thus guaranteed to work everywhere.

For some in-depth discussions on the topic, see:
- https://mywiki.wooledge.org/BashFAQ/081
- https://unix.stackexchange.com/questions/85249/why-not-use-which-what-to-use-
  then/85250#85250

Examples of open-source shells likely to be installed as /bin/sh on
Linux, which implement the 15-year-old standard: ash, bash, busybox,
dash, ksh, mksh and zsh.

Since this is an autoconf extension, however, autoconf provides its own
guarantees: you are always supposed to use AC_PATH_PROG, which is
guaranteed to generate code which does the right thing, and in
particular tends to work even on systems which predate POSIX. It
officially becomes autoconf's job to make sure path detection works.

This has some convenient knock-on effects. In particular, we now permit
users to specify the path via $QT_* variables, which are documented
inline as being set and are now documented as publicly settable too.
This was even already the case with qmake.

ax_have_qt: fix documentation bug for QMAKE description
Fallout from commit c76565884702b1ef663e66a17023b42032d397d3. Using
shell quotes around autoconf macro parameters leads to literal
double-quote chars appearing in ./configure --help output, in this case.

ax_llvm: migrate from hand-rolled path lookups with `which` to AC_PATH_PROG
The "which" utility is not guaranteed to be installed either, and if it
is, its behavior is not portable either. This means that when
llvm-config is installed, the `which` check will report a fatal error
because the which tool did not exist and the shell returned a nonzero
status when attempting to fork+exec. If it did exist, it might not be an
implementation of `which` that returns nonzero when commands do not
exist.

The general scripting suggestion is to use the "command -v" shell
builtin is required to exist in all POSIX 2008 compliant shells, and is
thus guaranteed to work everywhere.

For some in-depth discussions on the topic, see:
- https://mywiki.wooledge.org/BashFAQ/081
- https://unix.stackexchange.com/questions/85249/why-not-use-which-what-to-use-
  then/85250#85250

Examples of open-source shells likely to be installed as /bin/sh on
Linux, which implement the 15-year-old standard: ash, bash, busybox,
dash, ksh, mksh and zsh.

Since this is an autoconf extension, however, autoconf provides its own
guarantees: you are always supposed to use AC_PATH_PROG, which is
guaranteed to generate code which does the right thing, and in
particular tends to work even on systems which predate POSIX. It
officially becomes autoconf's job to make sure path detection works.

This has some convenient knock-on effects. In particular, we now permit
users to specify the path via $LLVM_CONFIG, which is a somewhat standard
approach, and we document it as well.

ax_llvm: fix longstanding documentation bug for --with-llvm=DIR
It accepts a filename, not a directory name, so say that.

--===============1356254331101768528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/autoconf-archive/autoconf-archive-doc: PKGSIZE changed from 1187439 to 1187640 (+0%)
packages/all-poky-linux/autoconf-archive/autoconf-archive-doc: PV changed from "2024.10.16" to "2026.11.11"
packages/all-poky-linux/autoconf-archive/autoconf-archive-doc: PKGV changed from 2024.10.16 [default] to 2026.11.11 [default]
packages/all-poky-linux/autoconf-archive/autoconf-archive-src: PV changed from "2024.10.16" to "2026.11.11"
packages/all-poky-linux/autoconf-archive/autoconf-archive-src: PKGV changed from 2024.10.16 [default] to 2026.11.11 [default]
packages/all-poky-linux/autoconf-archive/autoconf-archive: PKGSIZE changed from 2157884 to 2157319 (-0%)
packages/all-poky-linux/autoconf-archive/autoconf-archive: PV changed from "2024.10.16" to "2026.11.11"
packages/all-poky-linux/autoconf-archive/autoconf-archive: PKGV changed from 2024.10.16 [default] to 2026.11.11 [default]
packages/all-poky-linux/autoconf-archive: PV changed from "2024.10.16" to "2026.11.11"
packages/all-poky-linux/autoconf-archive: SRC_URI changed from "https://ftpmirror.gnu.org//autoconf-archive/autoconf-archive-2024.10.16.tar.xz file://427e226a2fe3980388abffd6de25ed6b9591cce3.patch file://3a23daa3da0eb1a256fda631867e19345d5f6e3a.patch file://e25f8d9e3ead52f998535b86c763065c5b45cc59.patch" to "https://ftpmirror.gnu.org//autoconf-archive/autoconf-archive-2026.11.11.tar.xz"
packages/all-poky-linux/autoconf-archive: PKGV changed from 2024.10.16 [default] to 2026.11.11 [default]

--===============1356254331101768528==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-autoconf-archive-upgrade-2024.10.16-2026.11.11.patch"

RnJvbSBjMzA0YjAzNzZlNzljNmZlZmY5NTBiMjc3MTQ4ZDk1MWEyNzc4ODNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTIgTm92IDIwMjYgMDU6MTU6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
dXRvY29uZi1hcmNoaXZlOiB1cGdyYWRlIDIwMjQuMTAuMTYgLT4gMjAyNi4xMS4xMQoKIyBDb3B5
cmlnaHQgKGMpIDIwMjYgQXV0b2NvbmYgQXJjaGl2ZSBNYWludGFpbmVycyA8YXV0b2NvbmYtYXJj
aGl2ZS0KbWFpbnRhaW5lcnNAZ251Lm9yZz4KCk1lcmdlIHB1bGwgcmVxdWVzdCAjMzE4IGZyb20g
YXV0b2NvbmYtYXJjaGl2ZS9yZXZlcnQtMjg4LWx1YWppdApSZXZlcnQgIkFkZCBMdWFKSVQgc3Vw
cG9ydCB0byBBWF9QUk9HX0xVQSBtYWNybyIKCk1lcmdlIHB1bGwgcmVxdWVzdCAjMzI3IGZyb20g
cnJ0aG9tYXMvY29kZV9jb3ZlcmFnZS1kb2MKQVhfQ09ERV9DT1ZFUkFHRTogZml4IGRvY3VtZW50
YXRpb24KCkFYX1BUSFJFQUQ6IEZpeCBwdGhyZWFkIGRldGVjdGlvbiBvbiBTb2xhcmlzIDExLjQK
QVhfUFRIUkVBRCBmYWlscyB0byBkZXRlY3QgcHRocmVhZCBzdXBwb3J0IG9uIFNvbGFyaXMgMTEu
NC4gIFRoaXMgd2FzCm9yaWdpbmFsbHkgbm90aWNlZCB3aXRoIHRoZSBjb3B5IG9mIGF4X3B0aHJl
YWQubTQgaW4gdGhlIEdDQyBzb3VyY2UgdHJlZToKCmJ1aWxkOiBGaXggYXhfcHRocmVhZC5tNCBv
biBTb2xhcmlzIDExLjQKaHR0cHM6Ly9nY2MuZ251Lm9yZy9waXBlcm1haWwvZ2NjLXBhdGNoZXMv
MjAyNi1NYXkvNzE2ODUwLmh0bWwKCkl0IHR1cm5zIG91dCB0aGUgcHJvYmxlbSBpcyB0aGF0IEFY
X1BUSFJFQUQgZXhwZWN0cyBfUkVFTlRSQU5UIHRvIGJlCmRlZmluZWQgb24gU29sYXJpcy4gIEhv
d2V2ZXIsIGFzIGRlc2NyaWJlZCBpbgoKaHR0cHM6Ly9nY2MuZ251Lm9yZy9nY2MtMTYvcG9ydGlu
Z190by5odG1sI3NvbGFyaXMKYW5kCkdvb2RieWUgKEFuZCBHb29kIFJpZGRhbmNlKSB0byAtbXQg
LWFuZCAtRF9SRUVOVFJBTlQKaHR0cHM6Ly93d3cubGlua2VyLWFsaWVucy5vcmcvYmxvZ3MvYWxp
L2VudHJ5L210cmVlbnRyYW50LwoKcmVmZXJlbmNlZCBmcm9tIHRoZXJlLCBTb2xhcmlzIDExLjQg
cmVtb3ZlZCByZWZlcmVuY2VzIHRvIF9SRUVOVFJBTlQgZnJvbQp0aGUgU29sYXJpcyBzeXN0ZW0g
aGVhZGVycy4gIEdpdmVuIHRoYXQsIEdDQyAxNiBubyBsb25nZXJzIGRlZmluZXMgaXQgd2l0aAot
cHRocmVhZC4KClRoaXMgc3RhcnRlZCB3aGVuIGxpYnB0aHJlYWQgd2FzIGZvbGRlZCBpbnRvIGxp
YmMgaW4gU29sYXJpcyAxMS4KCkhvd2V2ZXIsIEFYX1BUSFJFQUQgZXhwZWN0cyBfUkVFTlRSQU5U
IHRvIGJlIGRlZmluZWQgaW4gbXVsdGl0aHJlYWRlZApwcm9ncmFtcyBvbiBTb2xhcmlzLCB3aGlj
aCBpcyBubyBsb25nZXIgdHJ1ZS4gIFRvIGRldGVjdCB0aGUgc2l0dWF0aW9uLAp0aGlzIHBhdGNo
IGNoZWNrcyBmb3IgWFBHNyBzdXBwb3J0IHdoaWNoIHdhcyBpbnRyb2R1Y2VkIHRvZ2V0aGVyIHdp
dGggdGhvc2UKY2hhbmdlcyBpbiBTb2xhcmlzIDExLjQuCgpIb3dldmVyLCB0aGUgX1JFRU5UUkFO
VCBjaGVjayBpcyBkdWJpb3VzIGF0IGJlc3QuICBJZiBhIGZlYXR1cmUgaXNuJ3QKZGV0ZWN0ZWQs
IHRoaXMgbWF5IGJlIGJlY2F1c2UgdGhlIGNvcnJlc3BvbmRpbmcgZmVhdHVyZSB0ZXN0IG1hY3Jv
cyBpc24ndApkZWZpbmVkLiAgSG93ZXZlciwgdGhlIHJldmVyc2UgaXMgbm90IHRydWU6IGEgZmVh
dHVyZSB3YXkgd2VsbCBiZSBhdmFpbGFibGUKYmUgZGVmYXVsdCB3aXRob3V0IGFueSBmZWF0dXJl
IHRlc3QgbWFjcm8uCgpUaGUgZml4IHdhcyB0ZXN0ZWQgaW4gdGhlIEdDQyB0cmVlIGFzIGRlc2Ny
aWJlZCBhYm92ZSwgYW5kIG1hbnVhbGx5IG9uClNvbGFyaXMgMTEuMyB3aGVyZSBfUkVFTlRSQU5U
IGlzIHN0aWxsIHJlZmVyZW5jZWQgYW5kIG5lZWRlZC4KCkNsb3NlcyAjMzQxLgoKYXhfbGliX2hk
ZjUubTQ6ICBmaXggIlRoZSBtYWNybyAnQUNfSEFWRV9MSUJSQVJZJyBpcyBvYnNvbGV0ZS4iCi0g
ZnJvbQogIGh0dHBzOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvYXV0b2NvbmYvbWFudWFsL2F1dG9j
b25mLTIuNjkvaHRtbF9ub2RlL09ic29sZXRlLQogIE1hY3Jvcy5odG1sIHJlcGxhY2VkIHdpdGgg
QUNfQ0hFQ0tfTElCCgpDbG9zZXMgIzM0Mi4KCk1lcmdlIHB1bGwgcmVxdWVzdCAjMzIzIGZyb20g
amFzNDcxMS9hdm9pZC10aW1lc3RhbXBzCkRvbid0IGVtYmVkIGJ1aWxkIHRpbWVzdGFtcCBmb3Ig
QVhfQU1fTUFDUk9TKi4KCk1lcmdlIHB1bGwgcmVxdWVzdCAjMzI1IGZyb20gdWNrZWxtYW4tc2Yv
Zml4X2F4X3BrZ19jaGVja19tb2R1bGVzX3doaXRlc3BhY2UKQVhfUEtHX0NIRUNLX01PRFVMRVM6
IFJlbW92ZSBleHRyYSB3aGl0ZXNwYWNlIGZyb20gUFVCTElDLU1PRFVMRVMgYW5kIFBSSVZBVEUt
Ck1PRFVMRVMgYXJndW1lbnRzCgpNZXJnZSBwdWxsIHJlcXVlc3QgIzMyNiBmcm9tIFRyb3BpY2Fv
L3BhdGNoLTEKYXhfcHl0aG9uLm00OiBhZGQgbmV3IHB5dGhvbiB2ZXJzaW9uCgpNZXJnZSBwdWxs
IHJlcXVlc3QgIzMzMyBmcm9tIERhbmllbEVTY2hlcnplci9wYXRjaC0xCmF4X3Byb2dfYmlzb25f
dmVyc2lvbi5tNDogZml4IGluY29ycmVjdCBkZXNjcmlwdGlvbgoKTWVyZ2UgcHVsbCByZXF1ZXN0
ICMzMzUgZnJvbSBiZHJ1bmcvYm9vc3RfcHl0aG9uCmF4X2Jvb3N0X3B5dGhvbi5tNDogdHJ5IHZl
cnNpb25lZCBib29zdF9weXRob24gZmlyc3QKCk1lcmdlIHB1bGwgcmVxdWVzdCAjMzM2IGZyb20g
QnJpYW5Ba2VyL2F4X2NoZWNrX2NvbXBpbGVfZmxhZwpBWF9DSEVDS19DT01QSUxFX0ZMQUcgaW5j
b3JyZWN0bHkgYWNjZXB0cyB3YXJuaW5nIGZsYWdzIHdpdGggR05VIGNvbXBpbGVycwoKQVhfR0ND
X1ZBUl9BVFRSSUJVVEU6IGFkZCBhIGNhc2UgZm9yIG5vbnN0cmluZwpXaXRob3V0IG9uZSB0aGUg
YXR0cmlidXRlIGZhbGxzIHRvIHRoZSBnZW5lcmljIGZhbGxiYWNrLCB3aGljaCBkZWNsYXJlcwph
biBpbnQ6CgogICAgaW50IGZvbyBfX2F0dHJpYnV0ZV9fKChub25zdHJpbmcpKTsKCm5vbnN0cmlu
ZyBvbmx5IGFwcGxpZXMgdG8gYXJyYXlzIGFuZCBwb2ludGVycyBvZiBjaGFyYWN0ZXIgdHlwZSwg
c28gdGhlCmNvbXBpbGVyIGlnbm9yZXMgaXQgdGhlcmUgYW5kIHdhcm5zOgoKICAgIHdhcm5pbmc6
ICdub25zdHJpbmcnIGF0dHJpYnV0ZSBpZ25vcmVkIG9uIG9iamVjdHMgb2YgdHlwZSAnaW50Jwog
ICAgWy1XYXR0cmlidXRlc10KClRoZSBtYWNybyByZWFkcyBhbnkgd2FybmluZyBhcyB0aGUgYXR0
cmlidXRlIGJlaW5nIHVuc3VwcG9ydGVkLCBzbyB0aGUKY2hlY2sgYW5zd2VycyBubyBvbiBldmVy
eSBjb21waWxlciwgaW5jbHVkaW5nIHRoZSBvbmVzIHRoYXQgc3VwcG9ydCBpdC4KClRlc3QgaXQg
b24gYSBjaGFyIGFycmF5IGluc3RlYWQsIHdoaWNoIGlzIHdoYXQgdGhlIGF0dHJpYnV0ZSBpcyBm
b3IuCkNoZWNrZWQgYWdhaW5zdCBnY2MgMTUsIGdjYyAxNiBhbmQgY2xhbmcgMjIuCgpheF9jeHhf
Y29tcGlsZV9zdGRjeHgubTQ6IGZpeCAtV3VudXNlZCBpc3N1ZSB3aXRoIEMrKy0xNyBmZWF0dXJl
IHRlc3QKU29tZSBwcm9qZWN0cyBtYXkgcGFzcyBgLVd1bnVzZWQgLVdlcnJvcmAgaW4gYXMgQ1hY
L0NYWEZMQUdTLCByZXN1bHRpbmcKaW4gYSBidWlsZCBmYWlsdXJlIHdoZW4gcnVubmluZyB0aGUg
QysrLTE3IGZlYXR1cmUgdGVzdHMgdGhhdCBjb25maXJtIHRoYXQKYGNvbnN0ZXhwcmAgbGFtYmRh
cyBhcmUgc3VwcG9ydGVkLgoKVXNlIGBzdGF0aWNfYXNzZXJ0YCB0byB0ZXN0IHRoZSB2YWx1ZSBz
ZXQgaW4gdGhlIHRlc3QsIG11dGluZyB0aGUgLVd1bnVzZWQKaXNzdWUgZm91bmQgYnkgdGhlIGNv
bXBpbGVyLgoKQVhfQ0hFQ0tfQ09NUElMRV9GTEFHIGluY29ycmVjdGx5IGFjY2VwdCB1bnN1cHBv
cnRlZCB3YXJuaW5nIGZsYWdzIHdpdGggR05VCmNvbXBpbGVycwpBWF9DSEVDS19DT01QSUxFX0ZM
QUcgY291bGQgaW5jb3JyZWN0bHkgYWNjZXB0IHVuc3VwcG9ydGVkIHdhcm5pbmcgZmxhZ3Mgd2l0
aApHTlUgY29tcGlsZXJzIGJlY2F1c2UgaXQgYXBwZW5kZWQgLVdlcnJvciBhZnRlciB0aGUgY2Fu
ZGlkYXRlIGZsYWcgYmVpbmcgdGVzdGVkLgpXaXRoIEdDQy9HKyssIGRpYWdub3N0aWNzIGZvciB3
cm9uZy1sYW5ndWFnZSBvciBvdGhlcndpc2UgdW5zdXBwb3J0ZWQgd2FybmluZwpvcHRpb25zIGNh
biBiZSBvcmRlci1zZW5zaXRpdmUsIHNvIGEgd2FybmluZyBlbWl0dGVkIGZvciB0aGUgdGVzdGVk
IGZsYWcgbWF5IG5vdApiZSBwcm9tb3RlZCB0byBhbiBlcnJvciB3aGVuIC1XZXJyb3IgYXBwZWFy
cyBsYXRlciBvbiB0aGUgY29tbWFuZCBsaW5lLiBBcyBhCnJlc3VsdCwgdGhlIHByb2JlIGNvdWxk
IHN1Y2NlZWQgZXZlbiB0aG91Z2ggdGhlIGZsYWcgc2hvdWxkIGhhdmUgYmVlbiByZWplY3RlZC4K
ClRoaXMgY2hhbmdlIGluaXRpYWxpemVzIGFkZF9nbnVfd2Vycm9yIGV4cGxpY2l0bHkgYW5kIHBs
YWNlcyAtV2Vycm9yIGJlZm9yZSB0aGUKY2FuZGlkYXRlIGZsYWcgaW4gdGhlIHByb2JlIGNvbW1h
bmQsIHNvIEdOVSBjb21waWxlcnMgZmFpbCB0aGVzZSBjaGVja3MKcmVsaWFibHkuIEl0IGZpeGVz
IGZhbHNlIHBvc2l0aXZlcyBkdXJpbmcgY29uZmlndXJlLXRpbWUgZmxhZyBkZXRlY3Rpb24sCmVz
cGVjaWFsbHkgZm9yIHdhcm5pbmcgb3B0aW9ucyB0aGF0IGFyZSB2YWxpZCBpbiBDIGJ1dCBub3Qg
QysrLgoKVG8gaGlnaGxpZ2h0IGhvdyB0aGUgYmVoYXZpb3IgY29ycmVjdCBoZXJlIGFyZSB0d28g
b25lIGxpbmVyczoKcHJpbnRmICdpbnQgbWFpbigpe3JldHVybiAwO31cbicgfCBnKystMTUgLVdt
aXNzaW5nLXByb3RvdHlwZXMgLVdlcnJvciAteCBjKysgLQpwcmludGYgJ2ludCBtYWluKCl7cmV0
dXJuIDA7fVxuJyB8IGcrKy0xNSAtV2Vycm9yIC1XbWlzc2luZy1wcm90b3R5cGVzIC14IGMrKyAt
CgpheF9ib29zdF9weXRob24ubTQ6IHRyeSB2ZXJzaW9uZWQgYm9vc3RfcHl0aG9uIGZpcnN0Ck11
bHRpcGxlIGJvb3RfcHl0aG9uIGxpYnJhcmllcyBtaWdodCBiZSBpbnN0YWxsZWQgb24gdGhlIHN5
c3RlbS4gQXMgb2YKTWFyY2ggMjAyNiBVYnVudHUgcmVzb2x1dGUgaGFzIGxpYnJhcmllcyBmb3Ig
UHl0aG9uIDMuMTMgYW5kIDMuMTQ6CgpgYGAKJCBscyAtMSAvdXNyL2xpYi94ODZfNjQtbGludXgt
Z251L2xpYmJvb3N0X3B5dGhvbiouc28qCi91c3IvbGliL3gKCltDaGFuZ2Vsb2cgdHJ1bmNhdGVk
IGFzIGl0IGV4Y2VlZHMgNTAwMCBjaGFyYWN0ZXJzOwp0aGUgZnVsbCBjaGFuZ2Vsb2cgY2FuIGJl
IGZvdW5kIGluIGFuIGF0dGFjaG1lbnQgdG8gdGhlIEFVSCBlbWFpbF0KLS0tCiAuLi5kYWEzZGEw
ZWIxYTI1NmZkYTYzMTg2N2UxOTM0NWQ1ZjZlM2EucGF0Y2ggfCAzMyAtLS0tLS0tLS0tLS0tLS0t
CiAuLi4yMjZhMmZlMzk4MDM4OGFiZmZkNmRlMjVlZDZiOTU5MWNjZTMucGF0Y2ggfCAzOSAtLS0t
LS0tLS0tLS0tLS0tLS0tCiAuLi44ZDllM2VhZDUyZjk5ODUzNWI4NmM3NjMwNjVjNWI0NWNjNTku
cGF0Y2ggfCAzOCAtLS0tLS0tLS0tLS0tLS0tLS0KIC4uLjAuMTYuYmIgPT4gYXV0b2NvbmYtYXJj
aGl2ZV8yMDI2LjExLjExLmJifSB8ICA1ICstLQogNCBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMTE0IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9hdXRvY29uZi1hcmNoaXZlL2F1dG9jb25mLWFyY2hpdmUvM2EyM2RhYTNkYTBlYjFh
MjU2ZmRhNjMxODY3ZTE5MzQ1ZDVmNmUzYS5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9hdXRvY29uZi1hcmNoaXZlL2F1dG9jb25mLWFyY2hpdmUvNDI3ZTIy
NmEyZmUzOTgwMzg4YWJmZmQ2ZGUyNWVkNmI5NTkxY2NlMy5wYXRjaAogZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9hdXRvY29uZi1hcmNoaXZlL2F1dG9jb25mLWFyY2hp
dmUvZTI1ZjhkOWUzZWFkNTJmOTk4NTM1Yjg2Yzc2MzA2NWM1YjQ1Y2M1OS5wYXRjaAogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9hdXRvY29uZi1hcmNoaXZlL3thdXRvY29uZi1hcmNoaXZl
XzIwMjQuMTAuMTYuYmIgPT4gYXV0b2NvbmYtYXJjaGl2ZV8yMDI2LjExLjExLmJifSAoNjQlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hdXRvY29uZi1hcmNoaXZlL2F1dG9j
b25mLWFyY2hpdmUvM2EyM2RhYTNkYTBlYjFhMjU2ZmRhNjMxODY3ZTE5MzQ1ZDVmNmUzYS5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hdXRvY29uZi1hcmNoaXZlL2F1dG9jb25mLWFyY2hp
dmUvM2EyM2RhYTNkYTBlYjFhMjU2ZmRhNjMxODY3ZTE5MzQ1ZDVmNmUzYS5wYXRjaApkZWxldGVk
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNjRkNzM3ODFkMy4uMDAwMDAwMDAwMAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvYXV0b2NvbmYtYXJjaGl2ZS9hdXRvY29uZi1hcmNoaXZlLzNhMjNk
YWEzZGEwZWIxYTI1NmZkYTYzMTg2N2UxOTM0NWQ1ZjZlM2EucGF0Y2gKKysrIC9kZXYvbnVsbApA
QCAtMSwzMyArMCwwIEBACi1Gcm9tIDNhMjNkYWEzZGEwZWIxYTI1NmZkYTYzMTg2N2UxOTM0NWQ1
ZjZlM2EgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBFbGkgU2Nod2FydHogPGVzY2h3
YXJ0ejkzQGdtYWlsLmNvbT4KLURhdGU6IFNhdCwgMTkgT2N0IDIwMjQgMjE6NTg6NTIgLTA0MDAK
LVN1YmplY3Q6IFtQQVRDSF0gYXhfc3dpdGNoX2ZsYWdzLm00OiBwcm9wZXJseSBxdW90ZSBtNF9m
YXRhbAotCi1JdCBuZWVkcyB0byBvbmx5IHJ1biBhcyBhbiBhcmd1bWVudCBvZiBtNF9pZiwgbm90
IGFsbCB0aGUgdGltZS4KLQotRml4ZXM6IDJhZGZmNzhlMjI0YzkwOGZkNThkZjkxODUyYzgzMDFj
MjU3NzdhOGYKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29t
L2F1dG9jb25mLWFyY2hpdmUvYXV0b2NvbmYtYXJjaGl2ZS9jb21taXQvM2EyM2RhYTNkYTBlYjFh
MjU2ZmRhNjMxODY3ZTE5MzQ1ZDVmNmUzYV0KLQotU2lnbmVkLW9mZi1ieTogTWFya3VzIFZvbGsg
PGZfbF9rQHQtb25saW5lLmRlPgotLS0tCi0gbTQvYXhfc3dpdGNoX2ZsYWdzLm00IHwgNCArKy0t
Ci0gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKLQotZGlm
ZiAtLWdpdCBhL200L2F4X3N3aXRjaF9mbGFncy5tNCBiL200L2F4X3N3aXRjaF9mbGFncy5tNAot
aW5kZXggZGM3OWQxZTkuLjc3N2FlYjBiIDEwMDY0NAotLS0tIGEvbTQvYXhfc3dpdGNoX2ZsYWdz
Lm00Ci0rKysgYi9tNC9heF9zd2l0Y2hfZmxhZ3MubTQKLUBAIC0zNiwxMCArMzYsMTAgQEAKLSAj
ICAgYW5kIHRoaXMgbm90aWNlIGFyZSBwcmVzZXJ2ZWQuIFRoaXMgZmlsZSBpcyBvZmZlcmVkIGFz
LWlzLCB3aXRob3V0IGFueQotICMgICB3YXJyYW50eS4KLSAKLS0jc2VyaWFsIDUKLSsjc2VyaWFs
IDYKLSAKLSBBQ19ERUZVTihbQVhfU1dJVENIX0ZMQUdTXSwgWwotLSAgbTRfaWYoJDEsIFtdLCBt
NF9mYXRhbChbJDA6IG5hbWVzcGFjZSBpcyBlbXB0eV0pKQotKyAgbTRfaWYoJDEsIFtdLCBbbTRf
ZmF0YWwoWyQwOiBuYW1lc3BhY2UgaXMgZW1wdHldKV0pCi0gICBBQ19SRVFVSVJFKEFYX1NBVkVf
RkxBR1MpCi0gICBBQ19SRVFVSVJFKEFYX1JFU1RPUkVfRkxBR1MpCi0gICBBWF9TQVZFX0ZMQUdT
KCQxW10pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXV0b2NvbmYtYXJjaGl2
ZS9hdXRvY29uZi1hcmNoaXZlLzQyN2UyMjZhMmZlMzk4MDM4OGFiZmZkNmRlMjVlZDZiOTU5MWNj
ZTMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXV0b2NvbmYtYXJjaGl2ZS9hdXRvY29u
Zi1hcmNoaXZlLzQyN2UyMjZhMmZlMzk4MDM4OGFiZmZkNmRlMjVlZDZiOTU5MWNjZTMucGF0Y2gK
ZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDhhODZkMGE0ZDguLjAwMDAwMDAwMDAKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2F1dG9jb25mLWFyY2hpdmUvYXV0b2NvbmYtYXJjaGl2
ZS80MjdlMjI2YTJmZTM5ODAzODhhYmZmZDZkZTI1ZWQ2Yjk1OTFjY2UzLnBhdGNoCisrKyAvZGV2
L251bGwKQEAgLTEsMzkgKzAsMCBAQAotRnJvbSA0MjdlMjI2YTJmZTM5ODAzODhhYmZmZDZkZTI1
ZWQ2Yjk1OTFjY2UzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogRWxpIFNjaHdhcnR6
IDxlc2Nod2FydHo5M0BnbWFpbC5jb20+Ci1EYXRlOiBTYXQsIDE5IE9jdCAyMDI0IDIxOjUxOjMw
IC0wNDAwCi1TdWJqZWN0OiBbUEFUQ0hdIGF4X2NoZWNrX2dsLm00OiBwcm9wZXJseSBxdW90ZSBt
NF9mYXRhbAotCi1JdCBuZWVkcyB0byBvbmx5IHJ1biBhcyBhbiBhcmd1bWVudCBvZiBtNF9pZiwg
bm90IGFsbCB0aGUgdGltZS4KLQotRml4ZXM6IDc1MzQ5M2JmN2UyNTE5OTdmMDI1NTliOThmYzU5
OWQ0YTMzN2Q4Y2QKLUJ1ZzogaHR0cHM6Ly9idWdzLmdlbnRvby5vcmcvOTQxODQ1Ci0KLVVwc3Ry
ZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0aHViLmNvbS9hdXRvY29uZi1hcmNoaXZl
L2F1dG9jb25mLWFyY2hpdmUvY29tbWl0LzQyN2UyMjZhMmZlMzk4MDM4OGFiZmZkNmRlMjVlZDZi
OTU5MWNjZTNdCi0KLVNpZ25lZC1vZmYtYnk6IE1hcmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5k
ZT4KLS0tLQotIG00L2F4X2NoZWNrX2dsLm00IHwgNCArKy0tCi0gMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL200L2F4X2NoZWNr
X2dsLm00IGIvbTQvYXhfY2hlY2tfZ2wubTQKLWluZGV4IDg1MGQ0MDdkLi40YzJlNGVmYiAxMDA2
NDQKLS0tLSBhL200L2F4X2NoZWNrX2dsLm00Ci0rKysgYi9tNC9heF9jaGVja19nbC5tNAotQEAg
LTg1LDcgKzg1LDcgQEAKLSAjICAgbW9kaWZpZWQgdmVyc2lvbiBvZiB0aGUgQXV0b2NvbmYgTWFj
cm8sIHlvdSBtYXkgZXh0ZW5kIHRoaXMgc3BlY2lhbAotICMgICBleGNlcHRpb24gdG8gdGhlIEdQ
TCB0byBhcHBseSB0byB5b3VyIG1vZGlmaWVkIHZlcnNpb24gYXMgd2VsbC4KLSAKLS0jc2VyaWFs
IDIzCi0rI3NlcmlhbCAyNAotIAotICMgZXhhbXBsZSBnbCBwcm9ncmFtCi0gbTRfZGVmaW5lKFtf
QVhfQ0hFQ0tfR0xfUFJPR1JBTV0sCi1AQCAtMTg3LDcgKzE4Nyw3IEBAIEFDX0RFRlVOKFtfQVhf
Q0hFQ0tfR0xfTElOS19DVl0sCi0gQUNfREVGVU4oW19BWF9DSEVDS19HTF9NQU5VQUxfTElCU19H
RU5FUklDXSwgWwotICAgQVNfSUYoW3Rlc3QgLW4gIiRHTF9MSUJTIl0sW10sIFsKLSAgICAgYXhf
Y2hlY2tfZ2xfbWFudWFsX2xpYnNfZ2VuZXJpY19leHRyYV9saWJzPSIkMSIKLS0gICAgbTRfaWYo
JDEsIFtdLCBtNF9mYXRhbChbJDA6IGFyZ3VtZW50IG11c3Qgbm90IGJlIGVtcHR5XSkpCi0rICAg
IG00X2lmKCQxLCBbXSwgW200X2ZhdGFsKFskMDogYXJndW1lbnQgbXVzdCBub3QgYmUgZW1wdHld
KV0pCi0gCi0gICAgIF9BWF9DSEVDS19HTF9TQVZFX0ZMQUdTKFtDRkxBR1NdKQotICAgICBBQ19T
RUFSQ0hfTElCUyhbZ2xCZWdpbl0sWyRheF9jaGVja19nbF9tYW51YWxfbGlic19nZW5lcmljX2V4
dHJhX2xpYnNdLCBbCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXV0b2NvbmYt
YXJjaGl2ZS9hdXRvY29uZi1hcmNoaXZlL2UyNWY4ZDllM2VhZDUyZjk5ODUzNWI4NmM3NjMwNjVj
NWI0NWNjNTkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXV0b2NvbmYtYXJjaGl2ZS9h
dXRvY29uZi1hcmNoaXZlL2UyNWY4ZDllM2VhZDUyZjk5ODUzNWI4NmM3NjMwNjVjNWI0NWNjNTku
cGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDllMjY4OTAxMGYuLjAwMDAwMDAw
MDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2F1dG9jb25mLWFyY2hpdmUvYXV0b2NvbmYt
YXJjaGl2ZS9lMjVmOGQ5ZTNlYWQ1MmY5OTg1MzViODZjNzYzMDY1YzViNDVjYzU5LnBhdGNoCisr
KyAvZGV2L251bGwKQEAgLTEsMzggKzAsMCBAQAotRnJvbSBlMjVmOGQ5ZTNlYWQ1MmY5OTg1MzVi
ODZjNzYzMDY1YzViNDVjYzU5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogRWxpIFNj
aHdhcnR6IDxlc2Nod2FydHo5M0BnbWFpbC5jb20+Ci1EYXRlOiBTYXQsIDE5IE9jdCAyMDI0IDIx
OjU3OjE2IC0wNDAwCi1TdWJqZWN0OiBbUEFUQ0hdIGF4X2NoZWNrX2dseC5tNDogcHJvcGVybHkg
cXVvdGUgbTRfZmF0YWwKLQotSXQgbmVlZHMgdG8gb25seSBydW4gYXMgYW4gYXJndW1lbnQgb2Yg
bTRfaWYsIG5vdCBhbGwgdGhlIHRpbWUuCi0KLUZpeGVzOiA0MGNhNjZlN2U1MmJiNjNlM2VlZTI1
MTQ4NTVmY2YzYWQyZGY3NjczCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8v
Z2l0aHViLmNvbS9hdXRvY29uZi1hcmNoaXZlL2F1dG9jb25mLWFyY2hpdmUvY29tbWl0L2UyNWY4
ZDllM2VhZDUyZjk5ODUzNWI4NmM3NjMwNjVjNWI0NWNjNTldCi0KLVNpZ25lZC1vZmYtYnk6IE1h
cmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5kZT4KLS0tLQotIG00L2F4X2NoZWNrX2dseC5tNCB8
IDQgKystLQotIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Ci0KLWRpZmYgLS1naXQgYS9tNC9heF9jaGVja19nbHgubTQgYi9tNC9heF9jaGVja19nbHgubTQK
LWluZGV4IGM3ODkwZDljLi5iNTAyN2Y5YiAxMDA2NDQKLS0tLSBhL200L2F4X2NoZWNrX2dseC5t
NAotKysrIGIvbTQvYXhfY2hlY2tfZ2x4Lm00Ci1AQCAtNjEsNyArNjEsNyBAQAotICMgICBtb2Rp
ZmllZCB2ZXJzaW9uIG9mIHRoZSBBdXRvY29uZiBNYWNybywgeW91IG1heSBleHRlbmQgdGhpcyBz
cGVjaWFsCi0gIyAgIGV4Y2VwdGlvbiB0byB0aGUgR1BMIHRvIGFwcGx5IHRvIHlvdXIgbW9kaWZp
ZWQgdmVyc2lvbiBhcyB3ZWxsLgotIAotLSNzZXJpYWwgOQotKyNzZXJpYWwgMTAKLSAKLSAjIGV4
YW1wbGUgcHJvZ3JhbQotIG00X2RlZmluZShbX0FYX0NIRUNLX0dMWF9QUk9HUkFNXSwKLUBAIC0x
ODMsNyArMTgzLDcgQEAgQUNfREVGVU4oW19BWF9DSEVDS19HTFhfSEVBREVSU10sCi0gQUNfREVG
VU4oW19BWF9DSEVDS19HTFhfTUFOVUFMX0xJQlNfR0VORVJJQ10sCi0gW2RubAotICBheF9jaGVj
a19nbHhfbWFudWFsX2xpYnNfZ2VuZXJpY19leHRyYV9saWJzPSIkMSIKLS0gbTRfaWYoJDEsIFtd
LCBtNF9mYXRhbChbJDA6IGFyZ3VtZW50IG11c3Qgbm90IGJlIGVtcHR5XSkpCi0rIG00X2lmKCQx
LCBbXSwgW200X2ZhdGFsKFskMDogYXJndW1lbnQgbXVzdCBub3QgYmUgZW1wdHldKV0pCi0gCi0g
IEFDX0xBTkdfUFVTSChbQ10pCi0gIF9BWF9DSEVDS19HTFhfU0FWRV9GTEFHUygpCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXV0b2NvbmYtYXJjaGl2ZS9hdXRvY29uZi1hcmNo
aXZlXzIwMjQuMTAuMTYuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXV0b2NvbmYtYXJjaGl2
ZS9hdXRvY29uZi1hcmNoaXZlXzIwMjYuMTEuMTEuYmIKc2ltaWxhcml0eSBpbmRleCA2NCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2F1dG9jb25mLWFyY2hpdmUvYXV0b2NvbmYt
YXJjaGl2ZV8yMDI0LjEwLjE2LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXV0
b2NvbmYtYXJjaGl2ZS9hdXRvY29uZi1hcmNoaXZlXzIwMjYuMTEuMTEuYmIKaW5kZXggYzI0M2Q2
MzJjMy4uYWJlY2ZmYmEwYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2F1dG9j
b25mLWFyY2hpdmUvYXV0b2NvbmYtYXJjaGl2ZV8yMDI0LjEwLjE2LmJiCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9hdXRvY29uZi1hcmNoaXZlL2F1dG9jb25mLWFyY2hpdmVfMjAyNi4xMS4x
MS5iYgpAQCAtNiwxMCArNiw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PTExY2MyZDNlZTU3NGY5ZDZiN2VlNzk3YmRjZTRkNDIzIFwKICAgICBmaWxlOi8vQ09QWUlO
Ry5FWENFUFRJT047bWQ1PWZkZWYxNjhlYmZmM2JjMmYxMzY2NGMzNjVhNWZiNTE1IgogCiBTUkNf
VVJJID0gIiR7R05VX01JUlJPUn0vJHtCUE59LyR7QlBOfS0ke1BWfS50YXIueHoiCi1TUkNfVVJJ
ICs9ICJmaWxlOi8vNDI3ZTIyNmEyZmUzOTgwMzg4YWJmZmQ2ZGUyNWVkNmI5NTkxY2NlMy5wYXRj
aCIKLVNSQ19VUkkgKz0gImZpbGU6Ly8zYTIzZGFhM2RhMGViMWEyNTZmZGE2MzE4NjdlMTkzNDVk
NWY2ZTNhLnBhdGNoIgotU1JDX1VSSSArPSAiZmlsZTovL2UyNWY4ZDllM2VhZDUyZjk5ODUzNWI4
NmM3NjMwNjVjNWI0NWNjNTkucGF0Y2giCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2JjZDVkMDAx
OTE2ZjNhNTBlZDc0MzZmNGY3MDBlM2QyYjFiYWRlM2VkODAzMjE5YzU5MmQ2MjUwMmE1NzM2MyIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyYzE4ZjE1ZTJiM2JiNzllMDk2MjJiMjczOTFkZjA3ZDg2
MDhjZTlmMDdmYmZjN2MxMTQzZmE2ODM4OTFhYjI2IgogCiBpbmhlcml0IGF1dG90b29scyBhbGxh
cmNoIHRleGluZm8KIAotLSAKMi40Ny4xCgo=

--===============1356254331101768528==--
