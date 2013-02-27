Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UAhUw-000254-RI
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 14:56:57 +0100
Message-ID: <512E0CC2.8060907@communistcode.co.uk>
Date: Wed, 27 Feb 2013 13:40:18 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1361914764-14522-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1361914764-14522-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH V2] binutils: Fix build with newer texinfo 5.0+
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 13:56:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 26/02/13 21:39, Khem Raj wrote:
> [Yocto #3943]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Tested-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

> ---
>   meta/recipes-devtools/binutils/binutils-2.23.1.inc |    4 +
>   ...ls.texi-elfedit-Fix-use-of-itemx-in-table.patch |   68 +++++++
>   ...-Replace-with-when-it-is-part-of-the-text.patch |  196 ++++++++++++++++++++
>   .../binutils/binutils-crosssdk_2.23.1.bb           |    3 -
>   4 files changed, 268 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0001-doc-binutils.texi-elfedit-Fix-use-of-itemx-in-table.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0001-ld.texinfo-Replace-with-when-it-is-part-of-the-text.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.23.1.inc b/meta/recipes-devtools/binutils/binutils-2.23.1.inc
> index 3396981..15811d7 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.23.1.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.23.1.inc
> @@ -1,3 +1,5 @@
> +PR = "r2"
> +
>   LIC_FILES_CHKSUM="\
>       file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
>       file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552\
> @@ -40,6 +42,8 @@ BACKPORT = "\
>        file://backport/0018-bfd.patch \
>        file://backport/0024-bfd.patch \
>        file://backport/0026-ld-testsuite.patch \
> +     file://backport/0001-doc-binutils.texi-elfedit-Fix-use-of-itemx-in-table.patch \
> +     file://backport/0001-ld.texinfo-Replace-with-when-it-is-part-of-the-text.patch \
>   "
>   SRC_URI[md5sum] = "33adb18c3048d057ac58d07a3f1adb38"
>   SRC_URI[sha256sum] = "2ab2e5b03e086d12c6295f831adad46b3e1410a3a234933a2e8fac66cb2e7a19"
> diff --git a/meta/recipes-devtools/binutils/binutils-2.23.1/backport/0001-doc-binutils.texi-elfedit-Fix-use-of-itemx-in-table.patch b/meta/recipes-devtools/binutils/binutils-2.23.1/backport/0001-doc-binutils.texi-elfedit-Fix-use-of-itemx-in-table.patch
> new file mode 100644
> index 0000000..97a40a2
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils-2.23.1/backport/0001-doc-binutils.texi-elfedit-Fix-use-of-itemx-in-table.patch
> @@ -0,0 +1,68 @@
> +From e02bf9359f6ef7fe4d341aa5ac4f397f541b9ac3 Mon Sep 17 00:00:00 2001
> +From: Andreas Schwab <schwab@linux-m68k.org>
> +Date: Fri, 4 Jan 2013 22:27:57 +0000
> +Subject: [PATCH] * doc/binutils.texi (elfedit): Fix use of @itemx in @table.
> +
> +---
> + binutils/ChangeLog         |    4 ++++
> + binutils/doc/binutils.texi |   14 +++++++-------
> + 2 files changed, 11 insertions(+), 7 deletions(-)
> +
> +Upstream-Status: Backport
> +Index: binutils-2.23.1/binutils/doc/binutils.texi
> +===================================================================
> +--- binutils-2.23.1.orig/binutils/doc/binutils.texi	2012-05-11 11:18:34.000000000 -0700
> ++++ binutils-2.23.1/binutils/doc/binutils.texi	2013-02-26 12:41:51.785114224 -0800
> +@@ -12,7 +12,7 @@
> + @c man begin COPYRIGHT
> + Copyright @copyright{} 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998,
> + 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009,
> +-2010, 2011, 2012
> ++2010, 2011, 2012, 2013
> + Free Software Foundation, Inc.
> +
> + Permission is granted to copy, distribute and/or modify this document
> +@@ -4375,7 +4375,7 @@
> +
> + @table @env
> +
> +-@itemx --input-mach=@var{machine}
> ++@item --input-mach=@var{machine}
> + Set the matching input ELF machine type to @var{machine}.  If
> + @option{--input-mach} isn't specified, it will match any ELF
> + machine types.
> +@@ -4383,21 +4383,21 @@
> + The supported ELF machine types are, @var{L1OM}, @var{K1OM} and
> + @var{x86-64}.
> +
> +-@itemx --output-mach=@var{machine}
> ++@item --output-mach=@var{machine}
> + Change the ELF machine type in the ELF header to @var{machine}.  The
> + supported ELF machine types are the same as @option{--input-mach}.
> +
> +-@itemx --input-type=@var{type}
> ++@item --input-type=@var{type}
> + Set the matching input ELF file type to @var{type}.  If
> + @option{--input-type} isn't specified, it will match any ELF file types.
> +
> + The supported ELF file types are, @var{rel}, @var{exec} and @var{dyn}.
> +
> +-@itemx --output-type=@var{type}
> ++@item --output-type=@var{type}
> + Change the ELF file type in the ELF header to @var{type}.  The
> + supported ELF types are the same as @option{--input-type}.
> +
> +-@itemx --input-osabi=@var{osabi}
> ++@item --input-osabi=@var{osabi}
> + Set the matching input ELF file OSABI to @var{osabi}.  If
> + @option{--input-osabi} isn't specified, it will match any ELF OSABIs.
> +
> +@@ -4407,7 +4407,7 @@
> + @var{FreeBSD}, @var{TRU64}, @var{Modesto}, @var{OpenBSD}, @var{OpenVMS},
> + @var{NSK}, @var{AROS} and @var{FenixOS}.
> +
> +-@itemx --output-osabi=@var{osabi}
> ++@item --output-osabi=@var{osabi}
> + Change the ELF OSABI in the ELF header to @var{osabi}.  The
> + supported ELF OSABI are the same as @option{--input-osabi}.
> +
> diff --git a/meta/recipes-devtools/binutils/binutils-2.23.1/backport/0001-ld.texinfo-Replace-with-when-it-is-part-of-the-text.patch b/meta/recipes-devtools/binutils/binutils-2.23.1/backport/0001-ld.texinfo-Replace-with-when-it-is-part-of-the-text.patch
> new file mode 100644
> index 0000000..83d27d3
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils-2.23.1/backport/0001-ld.texinfo-Replace-with-when-it-is-part-of-the-text.patch
> @@ -0,0 +1,196 @@
> +From 935f85422863b42b6fbca30885885e3fa28eea36 Mon Sep 17 00:00:00 2001
> +From: Nick Clifton <nickc@redhat.com>
> +Date: Mon, 7 Jan 2013 12:11:11 +0000
> +Subject: [PATCH] 	* ld.texinfo: Replace @ with @@ when it is part of
> + the text. 	Correct ordering of M68HC11 entry.
> +
> +	* doc/binutils.texi: Fix ordering of top level nodes.
> +	Replace erroneous uses of @itemx with @item.
> +
> +	* bfd.texinfo: Replace @ with @@ when it is part of the text.
> +---
> + bfd/doc/ChangeLog          |    4 ++++
> + bfd/doc/bfd.texinfo        |   12 +++++++-----
> + binutils/ChangeLog         |    5 +++++
> + binutils/doc/binutils.texi |    8 ++++----
> + ld/ChangeLog               |    5 +++++
> + ld/ld.texinfo              |   26 ++++++++++++++------------
> + 6 files changed, 39 insertions(+), 21 deletions(-)
> +
> +
> +Upstream-Status: Backport
> +Index: binutils-2.23.1/bfd/doc/bfd.texinfo
> +===================================================================
> +--- binutils-2.23.1.orig/bfd/doc/bfd.texinfo	2010-10-28 04:40:25.000000000 -0700
> ++++ binutils-2.23.1/bfd/doc/bfd.texinfo	2013-02-26 12:42:26.909115020 -0800
> +@@ -1,7 +1,7 @@
> + \input texinfo.tex
> + @setfilename bfd.info
> + @c Copyright 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1997, 2000,
> +-@c 2001, 2002, 2003, 2006, 2007, 2008, 2009
> ++@c 2001, 2002, 2003, 2006, 2007, 2008, 2009, 2013
> + @c Free Software Foundation, Inc.
> + @c
> + @synindex fn cp
> +@@ -16,7 +16,8 @@
> + @copying
> + This file documents the BFD library.
> +
> +-Copyright @copyright{} 1991, 2000, 2001, 2003, 2006, 2007, 2008 Free Software Foundation, Inc.
> ++Copyright @copyright{} 1991, 2000, 2001, 2003, 2006, 2007, 2008, 2013
> ++Free Software Foundation, Inc.
> +
> + Permission is granted to copy, distribute and/or modify this document
> + under the terms of the GNU Free Documentation License, Version 1.3 or
> +@@ -64,7 +65,8 @@
> + @end tex
> +
> + @vskip 0pt plus 1filll
> +-Copyright @copyright{} 1991, 2001, 2003, 2006, 2008 Free Software Foundation, Inc.
> ++Copyright @copyright{} 1991, 2001, 2003, 2006, 2008, 2013
> ++Free Software Foundation, Inc.
> +
> +       Permission is granted to copy, distribute and/or modify this document
> +       under the terms of the GNU Free Documentation License, Version 1.3
> +@@ -322,7 +324,7 @@
> + @printindex cp
> +
> + @tex
> +-% I think something like @colophon should be in texinfo.  In the
> ++% I think something like @@colophon should be in texinfo.  In the
> + % meantime:
> + \long\def\colophon{\hbox to0pt{}\vfill
> + \centerline{The body of this manual is set in}
> +@@ -333,7 +335,7 @@
> + \centerline{{\sl\fontname\tensl\/}}
> + \centerline{are used for emphasis.}\vfill}
> + \page\colophon
> +-% Blame: doc@cygnus.com, 28mar91.
> ++% Blame: doc@@cygnus.com, 28mar91.
> + @end tex
> +
> + @bye
> +Index: binutils-2.23.1/binutils/doc/binutils.texi
> +===================================================================
> +--- binutils-2.23.1.orig/binutils/doc/binutils.texi	2013-02-26 12:41:51.000000000 -0800
> ++++ binutils-2.23.1/binutils/doc/binutils.texi	2013-02-26 12:42:26.913115010 -0800
> +@@ -148,18 +148,18 @@
> + * objcopy::			Copy and translate object files
> + * objdump::                     Display information from object files
> + * ranlib::                      Generate index to archive contents
> +-* readelf::                     Display the contents of ELF format files
> + * size::                        List section sizes and total size
> + * strings::                     List printable strings from files
> + * strip::                       Discard symbols
> +-* elfedit::                     Update the ELF header of ELF files
> + * c++filt::			Filter to demangle encoded C++ symbols
> + * cxxfilt: c++filt.             MS-DOS name for c++filt
> + * addr2line::			Convert addresses to file and line
> + * nlmconv::                     Converts object code into an NLM
> +-* windres::			Manipulate Windows resources
> + * windmc::			Generator for Windows message resources
> ++* windres::			Manipulate Windows resources
> + * dlltool::			Create files needed to build and use DLLs
> ++* readelf::                     Display the contents of ELF format files
> ++* elfedit::                     Update the ELF header of ELF files
> + * Common Options::              Command-line options for all utilities
> + * Selecting the Target System:: How these utilities determine the target
> + * Reporting Bugs::              Reporting Bugs
> +@@ -2898,7 +2898,7 @@
> + @c man end
> + @end ignore
> +
> +-@node c++filt, addr2line, elfedit, Top
> ++@node c++filt, addr2line, strip, Top
> + @chapter c++filt
> +
> + @kindex c++filt
> +Index: binutils-2.23.1/ld/ld.texinfo
> +===================================================================
> +--- binutils-2.23.1.orig/ld/ld.texinfo	2013-02-19 14:26:56.571782665 -0800
> ++++ binutils-2.23.1/ld/ld.texinfo	2013-02-26 12:45:20.677119476 -0800
> +@@ -1,7 +1,8 @@
> + \input texinfo
> + @setfilename ld.info
> + @c Copyright 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000,
> +-@c 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012
> ++@c 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011,
> ++@c 2012, 2013
> + @c Free Software Foundation, Inc.
> + @syncodeindex ky cp
> + @c man begin INCLUDE
> +@@ -55,7 +56,8 @@
> + version @value{VERSION}.
> +
> + Copyright @copyright{} 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000,
> +-2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009 Free Software Foundation, Inc.
> ++2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2012, 2013
> ++Free Software Foundation, Inc.
> +
> + Permission is granted to copy, distribute and/or modify this document
> + under the terms of the GNU Free Documentation License, Version 1.3
> +@@ -93,8 +95,8 @@
> + @vskip 0pt plus 1filll
> + @c man begin COPYRIGHT
> + Copyright @copyright{} 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998,
> +-1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009 Free
> +-Software Foundation, Inc.
> ++1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009,
> ++2012, 2013 Free Software Foundation, Inc.
> +
> + Permission is granted to copy, distribute and/or modify this document
> + under the terms of the GNU Free Documentation License, Version 1.3
> +@@ -142,12 +144,12 @@
> + @ifset ARM
> + * ARM::				ld and the ARM family
> + @end ifset
> +-@ifset HPPA
> +-* HPPA ELF32::                  ld and HPPA 32-bit ELF
> +-@end ifset
> + @ifset M68HC11
> + * M68HC11/68HC12::              ld and the Motorola 68HC11 and 68HC12 families
> + @end ifset
> ++@ifset HPPA
> ++* HPPA ELF32::                  ld and HPPA 32-bit ELF
> ++@end ifset
> + @ifset M68K
> + * M68K::                        ld and Motorola 68K family
> + @end ifset
> +@@ -6003,6 +6005,9 @@
> + @ifset I960
> + * i960::                        @command{ld} and the Intel 960 family
> + @end ifset
> ++@ifset M68HC11
> ++* M68HC11/68HC12::		@code{ld} and the Motorola 68HC11 and 68HC12 families
> ++@end ifset
> + @ifset ARM
> + * ARM::				@command{ld} and the ARM family
> + @end ifset
> +@@ -6018,9 +6023,6 @@
> + @ifset MSP430
> + * MSP430::			@command{ld} and MSP430
> + @end ifset
> +-@ifset M68HC11
> +-* M68HC11/68HC12::		@code{ld} and the Motorola 68HC11 and 68HC12 families
> +-@end ifset
> + @ifset POWERPC
> + * PowerPC ELF32::		@command{ld} and PowerPC 32-bit ELF Support
> + @end ifset
> +@@ -7868,7 +7870,7 @@
> + @printindex cp
> +
> + @tex
> +-% I think something like @colophon should be in texinfo.  In the
> ++% I think something like @@colophon should be in texinfo.  In the
> + % meantime:
> + \long\def\colophon{\hbox to0pt{}\vfill
> + \centerline{The body of this manual is set in}
> +@@ -7879,7 +7881,7 @@
> + \centerline{{\sl\fontname\tensl\/}}
> + \centerline{are used for emphasis.}\vfill}
> + \page\colophon
> +-% Blame: doc@cygnus.com, 28mar91.
> ++% Blame: doc@@cygnus.com, 28mar91.
> + @end tex
> +
> + @bye
> diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.23.1.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.23.1.bb
> index c936549..8af407f 100644
> --- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.23.1.bb
> +++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.23.1.bb
> @@ -2,11 +2,8 @@ require binutils-cross_${PV}.bb
>   
>   inherit crosssdk
>   
> -PR = "r1"
> -
>   PROVIDES = "virtual/${TARGET_PREFIX}binutils-crosssdk"
>   
> -
>   SRC_URI += "file://relocatable_sdk.patch"
>   
>   do_configure_prepend () {


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



