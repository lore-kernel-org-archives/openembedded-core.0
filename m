Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 879017C130
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 02:06:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4D26slW003564
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 May 2019 19:06:54 -0700 (PDT)
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 12 May 2019 19:06:54 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <bunk@stusta.de>
References: <d9870b9a-a7f1-96ac-27c0-c165e933ea3f@windriver.com>
	<1557713080-27730-1-git-send-email-hongxu.jia@windriver.com>
Message-ID: <2347acd3-a5ae-c267-6dc7-945f9285369a@windriver.com>
Date: Mon, 13 May 2019 10:06:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557713080-27730-1-git-send-email-hongxu.jia@windriver.com>
Subject: Re: [PATCH V2] groff: upgrade 1.22.3 -> 1.22.4
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
X-List-Received-Date: Mon, 13 May 2019 02:06:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

It seems the patch has been merged to master,
so I will send a fix rebased on that, please drop this V2,
sorry for the noisy

//Hongxu

On 5/13/19 10:04 AM, Hongxu Jia wrote:
> - Drop groff-1.22.2-correct-man.local-install-path.patch and
>    0001-Unset-need_charset_alias-when-building-for-musl.patch
>
> - Inherit bbclass pkgcnofig to fix `undefined macro: AC_DEFINE'
>    ...
>    | configure:20010: error: possibly undefined macro: AC_DEFINE
>    ...
>
> - Use autotools-brokensep to replace autotools to workaround failure
>    caused by out of tree
>    ...
>    | rm -f lib/alloca.h-t lib/alloca.h && \
>    | { echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
>    |   cat ../groff-1.22.4/lib/alloca.in.h; \
>    | } > lib/alloca.h-t && \
>    | mv -f lib/alloca.h-t lib/alloca.h
>    | /bin/sh: line 4: lib/alloca.h-t: No such file or directory
>    | Makefile:10407: recipe for target 'lib/alloca.h' failed
>    ...
>
> - Add `--without-doc' to not use target groff to generate doc at build time,
>    since upstream commit [cfe916e Support of configure option to build the
>    documentation.]
>
> - Remove groff depends groff-native, and add DEPENDS bison-native
>
> - Add 0001-fix-shebang-for-taget.patch
>
> - Add 0001-support-musl.patch
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   .../groff/files/0001-fix-shebang-for-taget.patch   | 31 ++++++++++++++++
>   .../0001-replace-perl-w-with-use-warnings.patch    | 34 ++++++++++--------
>   .../groff/files/0001-support-musl.patch            | 41 ++++++++++++++++++++++
>   .../groff-not-search-fonts-on-build-host.patch     | 20 ++++++++---
>   ...need_charset_alias-when-building-for-musl.patch | 30 ----------------
>   ...off-1.22.2-correct-man.local-install-path.patch | 34 ------------------
>   .../groff/{groff_1.22.3.bb => groff_1.22.4.bb}     | 36 ++++---------------
>   7 files changed, 114 insertions(+), 112 deletions(-)
>   create mode 100644 meta/recipes-extended/groff/files/0001-fix-shebang-for-taget.patch
>   rename meta/recipes-extended/groff/{groff-1.22.3 => files}/0001-replace-perl-w-with-use-warnings.patch (76%)
>   create mode 100644 meta/recipes-extended/groff/files/0001-support-musl.patch
>   rename meta/recipes-extended/groff/{groff-1.22.3 => files}/groff-not-search-fonts-on-build-host.patch (42%)
>   delete mode 100644 meta/recipes-extended/groff/groff-1.22.3/0001-Unset-need_charset_alias-when-building-for-musl.patch
>   delete mode 100644 meta/recipes-extended/groff/groff-1.22.3/groff-1.22.2-correct-man.local-install-path.patch
>   rename meta/recipes-extended/groff/{groff_1.22.3.bb => groff_1.22.4.bb} (62%)
>
> diff --git a/meta/recipes-extended/groff/files/0001-fix-shebang-for-taget.patch b/meta/recipes-extended/groff/files/0001-fix-shebang-for-taget.patch
> new file mode 100644
> index 0000000..1b94e8a
> --- /dev/null
> +++ b/meta/recipes-extended/groff/files/0001-fix-shebang-for-taget.patch
> @@ -0,0 +1,31 @@
> +From 54c795c8a3c7356294007b5a4eed1dd47ed6411d Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Sat, 11 May 2019 19:19:27 +0800
> +Subject: [PATCH] fix shebang for target
> +
> +...
> +|ERROR: groff-1.22.4-r0 do_package_qa: QA Issue: /usr/bin/gdiffmk contained in
> +package groff requires tmp-glibc/hosttools/bash, but no providers found in
> +RDEPENDS_groff? [file-rdeps]
> +...
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + contrib/gdiffmk/gdiffmk.sh | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/contrib/gdiffmk/gdiffmk.sh b/contrib/gdiffmk/gdiffmk.sh
> +index 5ce931e..10f2300 100644
> +--- a/contrib/gdiffmk/gdiffmk.sh
> ++++ b/contrib/gdiffmk/gdiffmk.sh
> +@@ -1,4 +1,4 @@
> +-#!@BASH_PROG@
> ++#!/bin/sh
> + # Copyright (C) 2004-2018 Free Software Foundation, Inc.
> + # Written by Mike Bianchi <MBianchi@Foveal.com <mailto:MBianchi@Foveal.com>>
> + # Thanks to Peter Bray for debugging.
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-extended/groff/groff-1.22.3/0001-replace-perl-w-with-use-warnings.patch b/meta/recipes-extended/groff/files/0001-replace-perl-w-with-use-warnings.patch
> similarity index 76%
> rename from meta/recipes-extended/groff/groff-1.22.3/0001-replace-perl-w-with-use-warnings.patch
> rename to meta/recipes-extended/groff/files/0001-replace-perl-w-with-use-warnings.patch
> index f1db5b0..eda6a40 100644
> --- a/meta/recipes-extended/groff/groff-1.22.3/0001-replace-perl-w-with-use-warnings.patch
> +++ b/meta/recipes-extended/groff/files/0001-replace-perl-w-with-use-warnings.patch
> @@ -1,7 +1,7 @@
> -From 5b574542070db286c89b3827e8f15ed4b3b39034 Mon Sep 17 00:00:00 2001
> +From 6821a23e6cf34df37c351b45be413a8da9115f9f Mon Sep 17 00:00:00 2001
>   From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Thu, 6 Apr 2017 01:46:00 -0700
> -Subject: [PATCH] replace "perl -w" with "use warnings"
> +Date: Sat, 11 May 2019 17:03:03 +0800
> +Subject: [PATCH 1/2] replace "perl -w" with "use warnings"
>   
>   The shebang's max length is usually 128 as defined in
>   /usr/include/linux/binfmts.h:
> @@ -18,6 +18,10 @@ So replace "perl -w" with "use warnings" to make it work.
>   Upstream-Status: Pending
>   
>   Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +
> +Rebase to 1.22.4.
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   ---
>    font/devpdf/util/BuildFoundries.pl | 3 ++-
>    src/devices/gropdf/gropdf.pl       | 3 ++-
> @@ -26,7 +30,7 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>    4 files changed, 8 insertions(+), 4 deletions(-)
>   
>   diff --git a/font/devpdf/util/BuildFoundries.pl b/font/devpdf/util/BuildFoundries.pl
> -index 39f2f0d..a2bfd8e 100644
> +index f8af826..9584e28 100644
>   --- a/font/devpdf/util/BuildFoundries.pl
>   +++ b/font/devpdf/util/BuildFoundries.pl
>   @@ -1,4 +1,4 @@
> @@ -36,15 +40,15 @@ index 39f2f0d..a2bfd8e 100644
>    #   BuildFoundries   : Given a Foundry file generate groff and download files
>    #   Deri James       : Monday 07 Feb 2011
>   @@ -22,6 +22,7 @@
> - # along with this program. If not, see <http://www.gnu.org/licenses/>.
> + # along with this program.  If not, see <http://www.gnu.org/licenses/>.
>    
>    use strict;
>   +use warnings;
>    
> + (my $progname = $0) =~s @.*/@@;
>    my $where=shift||'';
> - my $devps=shift||'../devps';
>   diff --git a/src/devices/gropdf/gropdf.pl b/src/devices/gropdf/gropdf.pl
> -index 035d123..b933b32 100644
> +index 2ec52d0..ce5a06f 100644
>   --- a/src/devices/gropdf/gropdf.pl
>   +++ b/src/devices/gropdf/gropdf.pl
>   @@ -1,4 +1,4 @@
> @@ -59,10 +63,10 @@ index 035d123..b933b32 100644
>    use strict;
>   +use warnings;
>    use Getopt::Long qw(:config bundling);
> - use Compress::Zlib;
>    
> + use constant
>   diff --git a/src/devices/gropdf/pdfmom.pl b/src/devices/gropdf/pdfmom.pl
> -index beec820..4b46ea4 100644
> +index c9b08b2..61124f3 100644
>   --- a/src/devices/gropdf/pdfmom.pl
>   +++ b/src/devices/gropdf/pdfmom.pl
>   @@ -1,4 +1,4 @@
> @@ -71,8 +75,8 @@ index beec820..4b46ea4 100644
>    #
>    #	pdfmom		: Frontend to run groff -mom to produce PDFs
>    #	Deri James	: Friday 16 Mar 2012
> -@@ -24,6 +24,7 @@
> - # along with this program. If not, see <http://www.gnu.org/licenses/>.
> +@@ -23,6 +23,7 @@
> + # along with this program.  If not, see <http://www.gnu.org/licenses/>.
>    
>    use strict;
>   +use warnings;
> @@ -80,17 +84,17 @@ index beec820..4b46ea4 100644
>    my @cmd;
>    my $dev='pdf';
>   diff --git a/src/utils/afmtodit/afmtodit.pl b/src/utils/afmtodit/afmtodit.pl
> -index 4f2ce83..5c078ff 100644
> +index 954c58e..81a6c97 100644
>   --- a/src/utils/afmtodit/afmtodit.pl
>   +++ b/src/utils/afmtodit/afmtodit.pl
>   @@ -1,4 +1,4 @@
>   -#! /usr/bin/perl -w
>   +#! /usr/bin/perl
>    # -*- Perl -*-
> - # Copyright (C) 1989-2014  Free Software Foundation, Inc.
> + # Copyright (C) 1989-2018 Free Software Foundation, Inc.
>    #      Written by James Clark (jjc@jclark.com)
>   @@ -19,6 +19,7 @@
> - # along with this program. If not, see <http://www.gnu.org/licenses/>.
> + # along with this program.  If not, see <http://www.gnu.org/licenses/>.
>    
>    use strict;
>   +use warnings;
> @@ -98,5 +102,5 @@ index 4f2ce83..5c078ff 100644
>    @afmtodit.tables@
>    
>   --
> -2.10.2
> +2.7.4
>   
> diff --git a/meta/recipes-extended/groff/files/0001-support-musl.patch b/meta/recipes-extended/groff/files/0001-support-musl.patch
> new file mode 100644
> index 0000000..a837b11
> --- /dev/null
> +++ b/meta/recipes-extended/groff/files/0001-support-musl.patch
> @@ -0,0 +1,41 @@
> +From 695965c27be74acb5968f19d51af86065c4b71a9 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 13 May 2019 09:48:14 +0800
> +Subject: [PATCH] support musl
> +
> +...
> +|./lib/math.h:2877:1: error: 'int signbit(float)' conflicts with a previous declaration
> +| _GL_MATH_CXX_REAL_FLOATING_DECL_2 (signbit)
> +| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +|In file included from recipe-sysroot/usr/include/c++/8.3.0/math.h:36,
> +|                 from ./lib/math.h:27,
> +|                 from ./src/include/driver.h:27,
> +|                 from src/devices/grodvi/dvi.cpp:20:
> +|recipe-sysroot/usr/include/c++/8.3.0/cmath:661:3: note: previous declaration 'constexpr bool std::signbit(float)'
> +|   signbit(float __x)
> +|   ^~~~~~~
> +...
> +
> +Upstream-Status: Backport [http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=commit;h=453ff940449bbbde9ec00f0bbf82a359c5598fc7]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + gnulib_m4/signbit.m4 | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/gnulib_m4/signbit.m4 b/gnulib_m4/signbit.m4
> +index 9e7884d..8b9c70c 100644
> +--- a/gnulib_m4/signbit.m4
> ++++ b/gnulib_m4/signbit.m4
> +@@ -31,6 +31,8 @@ AC_DEFUN([gl_SIGNBIT],
> +         [case "$host_os" in
> +                           # Guess yes on glibc systems.
> +            *-gnu* | gnu*) gl_cv_func_signbit="guessing yes" ;;
> ++                          # Guess yes on musl systems.
> ++           *-musl*)       gl_cv_func_signbit="guessing yes" ;;
> +                           # Guess yes on native Windows.
> +            mingw*)        gl_cv_func_signbit="guessing yes" ;;
> +                           # If we don't know, assume the worst.
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-extended/groff/groff-1.22.3/groff-not-search-fonts-on-build-host.patch b/meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-host.patch
> similarity index 42%
> rename from meta/recipes-extended/groff/groff-1.22.3/groff-not-search-fonts-on-build-host.patch
> rename to meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-host.patch
> index ff8f320..c80a2a5 100644
> --- a/meta/recipes-extended/groff/groff-1.22.3/groff-not-search-fonts-on-build-host.patch
> +++ b/meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-host.patch
> @@ -1,20 +1,32 @@
> -groff searchs fonts which are provided by ghostscript on build host.
> -It causes non-determinism issue. So not search font dirs on host.
> +From 75761ae7adc88412de4379d1cf5484b055cd5f18 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Sat, 11 May 2019 17:06:29 +0800
> +Subject: [PATCH 2/2] groff searchs fonts which are provided by ghostscript on
> + build host. It causes non-determinism issue. So not search font dirs on host.
>   
>   Upstream-Status: Inappropriate [cross build specific]
>   
>   Signed-off-by: Kai Kang <kai.kang@windriver.com>
>   
> +Rebase to 1.22.4
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + font/devpdf/Foundry.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
>   diff --git a/font/devpdf/Foundry.in b/font/devpdf/Foundry.in
> -index a6e968f..8094642 100644
> +index 93e9b66..235b23b 100644
>   --- a/font/devpdf/Foundry.in
>   +++ b/font/devpdf/Foundry.in
>   @@ -65,7 +65,7 @@ ZD|Y||||Dingbats!d050000l.pfb
>    #======================================================================
>    
>    #Foundry|Name|Searchpath
> --foundry|U|(gs):/usr/share/fonts/type1/gsfonts :/opt/local/share/fonts/urw-fonts # the URW fonts delivered with ghostscript (may be different)
> +-foundry|U|(gs):@urwfontsdir@ :/usr/share/fonts/type1/gsfonts :/opt/local/share/fonts/urw-fonts # the URW fonts delivered with ghostscript (may be different)
>   +foundry|U|(gs) # the URW fonts delivered with ghostscript (may be different)
>    #Define Flags for afmtodit
>    
>    r=-i 0 -m
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-extended/groff/groff-1.22.3/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/groff/groff-1.22.3/0001-Unset-need_charset_alias-when-building-for-musl.patch
> deleted file mode 100644
> index b61b432..0000000
> --- a/meta/recipes-extended/groff/groff-1.22.3/0001-Unset-need_charset_alias-when-building-for-musl.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 13 Apr 2015 17:02:13 -0700
> -Subject: [PATCH] Unset need_charset_alias when building for musl
> -
> -localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
> -which actually shoudl be fixed in gnulib and then all downstream
> -projects will get it eventually. For now we apply the fix to
> -coreutils
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - lib/gnulib.mk | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -Index: groff-1.22.3/src/libs/gnulib/lib/Makefile.am
> -===================================================================
> ---- groff-1.22.3.orig/src/libs/gnulib/lib/Makefile.am
> -+++ groff-1.22.3/src/libs/gnulib/lib/Makefile.am
> -@@ -113,7 +113,7 @@ install-exec-localcharset: all-local
> - 	  case '$(host_os)' in \
> - 	    darwin[56]*) \
> - 	      need_charset_alias=true ;; \
> --	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
> -+	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
> - 	      need_charset_alias=false ;; \
> - 	    *) \
> - 	      need_charset_alias=true ;; \
> diff --git a/meta/recipes-extended/groff/groff-1.22.3/groff-1.22.2-correct-man.local-install-path.patch b/meta/recipes-extended/groff/groff-1.22.3/groff-1.22.2-correct-man.local-install-path.patch
> deleted file mode 100644
> index c73328a..0000000
> --- a/meta/recipes-extended/groff/groff-1.22.3/groff-1.22.2-correct-man.local-install-path.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -Correct the install path of man.local to fix following error:
> -    /yocto/build/tmp/sysroots/x86_64-linux/usr/share/groff/1.22.2/tmac/an-old.tmac:690: warning: can't find macro file `man.local'
> -
> -Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> -Upstream-Status: Pending
> -
> -diff --git a/tmac/Makefile.sub b/tmac/Makefile.sub
> -index 1506232..f1468c5 100644
> ---- a/tmac/Makefile.sub
> -+++ b/tmac/Makefile.sub
> -@@ -121,9 +121,9 @@ install_data: $(NORMALFILES) $(SPECIALFILES) man.local \
> - 	  $(RM) $(DESTDIR)$(mdocdir)/$$f; \
> - 	  $(INSTALL_DATA) $$f-s $(DESTDIR)$(mdocdir)/$$f; \
> - 	done
> --	-test -f $(DESTDIR)$(localtmacdir)/man.local \
> -+	-test -f $(DESTDIR)$(tmacdir)/man.local \
> - 	  || $(INSTALL_DATA) $(srcdir)/man.local \
> --	       $(DESTDIR)$(localtmacdir)/man.local
> -+	       $(DESTDIR)$(tmacdir)/man.local
> - 	-test -f $(DESTDIR)$(localtmacdir)/mdoc.local \
> - 	  || $(INSTALL_DATA) mdoc.local-s $(DESTDIR)$(localtmacdir)/mdoc.local
> -
> -@@ -164,9 +164,9 @@ uninstall_sub:
> - 	$(RM) $(DESTDIR)$(tmacdir)/$(tmac_s_prefix)s.tmac
> - 	$(RM) $(DESTDIR)$(tmacdir)/$(tmac_an_prefix)an.tmac
> - 	$(RM) $(DESTDIR)$(tmacdir)/www.tmac
> --	-if cmp -s $(DESTDIR)$(localtmacdir)/man.local \
> -+	-if cmp -s $(DESTDIR)$(tmacdir)/man.local \
> - 	           $(srcdir)/man.local; then \
> --	  $(RM) $(DESTDIR)$(localtmacdir)/man.local; \
> -+	  $(RM) $(DESTDIR)$(tmacdir)/man.local; \
> - 	fi
> - 	-if cmp -s $(DESTDIR)$(localtmacdir)/mdoc.local \
> - 	           $(srcdir)/mdoc.local; then \
> diff --git a/meta/recipes-extended/groff/groff_1.22.3.bb b/meta/recipes-extended/groff/groff_1.22.4.bb
> similarity index 62%
> rename from meta/recipes-extended/groff/groff_1.22.3.bb
> rename to meta/recipes-extended/groff/groff_1.22.4.bb
> index ba90cad..37eee9a 100644
> --- a/meta/recipes-extended/groff/groff_1.22.3.bb
> +++ b/meta/recipes-extended/groff/groff_1.22.4.bb
> @@ -8,49 +8,27 @@ LICENSE = "GPLv3"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>   
>   SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
> -	file://groff-1.22.2-correct-man.local-install-path.patch \
> -	file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
>   	file://0001-replace-perl-w-with-use-warnings.patch \
>   	file://groff-not-search-fonts-on-build-host.patch \
> +	file://0001-fix-shebang-for-taget.patch \
> +	file://0001-support-musl.patch \
>   "
>   
> -SRC_URI[md5sum] = "cc825fa64bc7306a885f2fb2268d3ec5"
> -SRC_URI[sha256sum] = "3a48a9d6c97750bfbd535feeb5be0111db6406ddb7bb79fc680809cda6d828a5"
> +SRC_URI[md5sum] = "08fb04335e2f5e73f23ea4c3adbf0c5f"
> +SRC_URI[sha256sum] = "e78e7b4cb7dec310849004fa88847c44701e8d133b5d4c13057d876c1bad0293"
>   
> -DEPENDS = "groff-native"
> -DEPENDS_class-native = ""
> +DEPENDS = "bison-native"
>   RDEPENDS_${PN} += "perl sed"
>   
> -inherit autotools texinfo multilib_script
> +inherit autotools-brokensep texinfo multilib_script pkgconfig
>   
>   MULTILIB_SCRIPTS = "${PN}:${bindir}/gpinyin ${PN}:${bindir}/groffer ${PN}:${bindir}/grog"
>   
> -EXTRA_OECONF = "--without-x"
> +EXTRA_OECONF = "--without-x --without-doc"
>   PARALLEL_MAKE = ""
>   
>   CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
>   
> -do_configure_prepend() {
> -	if [ "${BUILD_SYS}" != "${HOST_SYS}" ]; then
> -		sed -i \
> -		    -e '/^GROFFBIN=/s:=.*:=${STAGING_BINDIR_NATIVE}/groff:' \
> -		    -e '/^TROFFBIN=/s:=.*:=${STAGING_BINDIR_NATIVE}/troff:' \
> -		    -e '/^GROFF_BIN_PATH=/s:=.*:=${STAGING_BINDIR_NATIVE}:' \
> -		    -e '/^GROFF_BIN_DIR=/s:=.*:=${STAGING_BINDIR_NATIVE}:' \
> -		    ${S}/contrib/*/Makefile.sub \
> -		    ${S}/doc/Makefile.in \
> -		    ${S}/doc/Makefile.sub
> -	fi
> -}
> -
> -do_configure_append() {
> -    # generate gnulib configure script
> -    olddir=`pwd`
> -    cd ${S}/src/libs/gnulib/
> -    ACLOCAL="$ACLOCAL" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || die "autoreconf execution failed."
> -    cd ${olddir}
> -}
> -
>   do_install_append() {
>   	# Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
>   	# for target as /usr/bin/perl, so fix it to /usr/bin/perl.



