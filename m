Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T0oZw-0003ja-6H
	for openembedded-core@lists.linuxtogo.org;
	Mon, 13 Aug 2012 08:56:44 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 12 Aug 2012 23:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,758,1336374000"; d="scan'208";a="180239274"
Received: from unknown (HELO [10.255.12.224]) ([10.255.12.224])
	by azsmga001.ch.intel.com with ESMTP; 12 Aug 2012 23:43:43 -0700
Message-ID: <5028A21E.5050207@linux.intel.com>
Date: Mon, 13 Aug 2012 09:43:42 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344530637-29330-1-git-send-email-koen@dominion.thruhere.net>
	<1344530637-29330-2-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1344530637-29330-2-git-send-email-koen@dominion.thruhere.net>
Cc: openembedded-core@lists.linuxtogo.org,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 2/2] man: make man actually work by installing custom man.config
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
X-List-Received-Date: Mon, 13 Aug 2012 06:56:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Can you please rebase this on Javier's changes

Thanks
	Sau!

On 08/09/2012 07:43 PM, Koen Kooi wrote:
> The default man.conf is named wrong and doesn't work. It references gtbl, while groff installs tbl and other things. This man.conf is imported from OE classic and runtime tested on angstrom.
>
> Before:
>
> root@beaglebone:~# man man
> sh: /usr/bin/gtbl: No such file or directory
> sh: line 0: echo: write error: Broken pipe
> gunzip: write: Broken pipe
> gunzip: error inflating
> sh: line 0: echo: write error: Broken pipe
> sh: line 0: echo: write error: Broken pipe
>
> After:
>
> root@beaglebone:~# man man
> MAN(1)                        Manual pager utils                        MAN(1)
>
> NAME
>         man - an interface to the on-line reference manuals
>
> SYNOPSIS
>         man  [-C  file]  [-d]  [-D]  [--warnings[=warnings]]  [-R encoding] [-L
>         locale] [-m system[,...]] [-M path] [-S list]  [-e  extension]  [-i|-I]
>         [--regex|--wildcard]   [--names-only]  [-a]  [-u]  [--no-subpages]  [-P
>         pager] [-r prompt] [-7] [-E encoding] [--no-hyphenation] [--no-justifi-
>         cation]  [-p  string]  [-t]  [-T[device]]  [-H[browser]] [-X[dpi]] [-Z]
>         [[section] page ...] ...
>         man -k [apropos options] regexp ...
>         man -K [-w|-W] [-S list] [-i|-I] [--regex] [section] term ...
>         man -f [whatis options] page ...
>         man -l [-C file] [-d] [-D] [--warnings[=warnings]]  [-R  encoding]  [-L
>         locale]  [-P  pager]  [-r  prompt]  [-7] [-E encoding] [-p string] [-t]
>         [-T[device]] [-H[browser]] [-X[dpi]] [-Z] file ...
>         man -w|-W [-C file] [-d] [-D] page ...
>         man -c [-C file] [-d] [-D] page ...
>         man [-hV]
>
> Check for config name:
>
> root@beaglebone:~# rm /etc/man.config
> root@beaglebone:~# man man
> Warning: cannot open configuration file /etc/man.config
> No manual entry for man
>
> As a bonus a bunch of references to the buildhost get removed from the config file.
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>   meta/recipes-extended/man/man-1.6f/man.conf |  140 +++++++++++++++++++++++++++
>   meta/recipes-extended/man/man_1.6f.bb       |    6 +-
>   2 files changed, 143 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-extended/man/man-1.6f/man.conf
>
> diff --git a/meta/recipes-extended/man/man-1.6f/man.conf b/meta/recipes-extended/man/man-1.6f/man.conf
> new file mode 100644
> index 0000000..bb3c697
> --- /dev/null
> +++ b/meta/recipes-extended/man/man-1.6f/man.conf
> @@ -0,0 +1,140 @@
> +#
> +# Generated automatically from man.conf.in by the
> +# configure script.
> +#
> +# man.conf from man-1.5p
> +#
> +# For more information about this file, see the man pages man(1)
> +# and man.conf(5).
> +#
> +# This file is read by man to configure the default manpath (also used
> +# when MANPATH contains an empty substring), to find out where the cat
> +# pages corresponding to given man pages should be stored,
> +# and to map each PATH element to a manpath element.
> +# It may also record the pathname of the man binary. [This is unused.]
> +# The format is:
> +#
> +# MANBIN		pathname
> +# MANPATH		manpath_element	[corresponding_catdir]
> +# MANPATH_MAP		path_element	manpath_element
> +#
> +# If no catdir is given, it is assumed to be equal to the mandir
> +# (so that this dir has both man1 etc. and cat1 etc. subdirs).
> +# This is the traditional Unix setup.
> +# Certain versions of the FSSTND recommend putting formatted versions
> +# of /usr/.../man/manx/page.x into /var/catman/.../catx/page.x.
> +# The keyword FSSTND will cause this behaviour.
> +# Certain versions of the FHS recommend putting formatted versions of
> +# /usr/.../share/man/[locale/]manx/page.x into
> +# /var/cache/man/.../[locale/]catx/page.x.
> +# The keyword FHS will cause this behaviour (and overrides FSSTND).
> +# Explicitly given catdirs override.
> +#
> +# FSSTND
> +FHS
> +#
> +# This file is also read by man in order to find how to call nroff, less, etc.,
> +# and to determine the correspondence between extensions and decompressors.
> +#
> +# MANBIN		/usr/local/bin/man
> +#
> +# Every automatically generated MANPATH includes these fields
> +#
> +MANPATH	/usr/man
> +MANPATH	/usr/share/man
> +MANPATH	/usr/local/man
> +MANPATH	/usr/local/share/man
> +MANPATH	/usr/X11R6/man
> +#
> +# Uncomment if you want to include one of these by default
> +#
> +# MANPATH	/opt/*/man
> +# MANPATH	/usr/lib/*/man
> +# MANPATH	/usr/share/*/man
> +# MANPATH	/usr/kerberos/man
> +#
> +# Set up PATH to MANPATH mapping
> +#
> +# If people ask for "man foo" and have "/dir/bin/foo" in their PATH
> +# and the docs are found in "/dir/man", then no mapping is required.
> +#
> +# The below mappings are superfluous when the right hand side is
> +# in the mandatory manpath already, but will keep man from statting
> +# lots of other nearby files and directories.
> +#
> +MANPATH_MAP	/bin			/usr/share/man
> +MANPATH_MAP	/sbin			/usr/share/man
> +MANPATH_MAP	/usr/bin		/usr/share/man
> +MANPATH_MAP	/usr/sbin		/usr/share/man
> +MANPATH_MAP	/usr/local/bin		/usr/local/share/man
> +MANPATH_MAP	/usr/local/sbin		/usr/local/share/man
> +MANPATH_MAP	/usr/X11R6/bin		/usr/X11R6/man
> +MANPATH_MAP	/usr/bin/X11		/usr/X11R6/man
> +MANPATH_MAP	/usr/bin/mh		/usr/share/man
> +#
> +# NOAUTOPATH keeps man from automatically adding directories that look like
> +# manual page directories to the path.
> +#
> +#NOAUTOPATH
> +#
> +# NOCACHE keeps man from creating cache pages ("cat pages")
> +# (generally one enables/disable cat page creation by creating/deleting
> +# the directory they would live in - man never does mkdir)
> +#
> +#NOCACHE
> +#
> +# Useful paths - note that COL should not be defined when
> +# NROFF is defined as "groff -Tascii" or "groff -Tlatin1";
> +# not only is it superfluous, but it actually damages the output.
> +# For use with utf-8, NROFF should be "nroff -mandoc" without -T option.
> +# (Maybe - but today I need -Tlatin1 to prevent double conversion to utf8.)
> +#
> +# If you have a new troff (version 1.18.1?) and its colored output
> +# causes problems, add the -c option to TROFF, NROFF, JNROFF.
> +#
> +TROFF		/usr/bin/groff -Tps -mandoc
> +NROFF		/usr/bin/nroff -Tlatin1 -mandoc
> +JNROFF		/usr/bin/groff -Tnippon -mandocj
> +EQN		/usr/bin/eqn -Tps
> +NEQN		/usr/bin/eqn -Tlatin1
> +JNEQN		/usr/bin/eqn -Tnippon
> +TBL		/usr/bin/tbl
> +# COL		/usr/bin/col
> +REFER		/usr/bin/refer
> +PIC		/usr/bin/pic
> +VGRIND		
> +GRAP		
> +PAGER		/usr/bin/less -isR
> +CAT		/bin/cat
> +#
> +# The command "man -a xyzzy" will show all man pages for xyzzy.
> +# When CMP is defined man will try to avoid showing the same
> +# text twice. (But compressed pages compare unequal.)
> +#
> +CMP		/usr/bin/cmp -s
> +#
> +# Compress cat pages
> +#
> +COMPRESS	/bin/bzip2
> +COMPRESS_EXT	.bz2
> +#
> +# Default manual sections (and order) to search if -S is not specified
> +# and the MANSECT environment variable is not set.
> +#
> +MANSECT		1:1p:8:2:3:3p:4:5:6:7:9:0p:tcl:n:l:p:o
> +#
> +# Default options to use when man is invoked without options
> +# This is mainly for the benefit of those that think -a should be the default
> +# Note that some systems have /usr/man/allman, causing pages to be shown twice.
> +#
> +#MANDEFOPTIONS	-a
> +#
> +# Decompress with given decompressor when input file has given extension
> +# The command given must act as a filter.
> +#
> +.gz		/bin/gunzip -c
> +.bz2		/bin/bzip2 -c -d
> +.z		
> +.Z		/bin/zcat
> +.F		
> +.Y		
> diff --git a/meta/recipes-extended/man/man_1.6f.bb b/meta/recipes-extended/man/man_1.6f.bb
> index b35621a..3a36a5b 100644
> --- a/meta/recipes-extended/man/man_1.6f.bb
> +++ b/meta/recipes-extended/man/man_1.6f.bb
> @@ -5,7 +5,7 @@ HOMEPAGE = "http://primates.ximian.com/~flucifredi/man"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>
> -PR = "r3"
> +PR = "r4"
>
>   DEPENDS = "groff less"
>
> @@ -54,7 +54,7 @@ do_install_append(){
>   	mkdir -p  ${D}/etc/
>           mkdir -p ${D}${datadir}/man/man5
>           mkdir -p ${D}${datadir}/man/man7
> -	cp ${S}/src/man.conf ${D}/etc/
> +	cp ${WORKDIR}/man.conf ${D}/etc/man.config
>           cp ${WORKDIR}/man.1.gz ${D}${datadir}/man/man1/
>           cp ${WORKDIR}/man.7.gz ${D}${datadir}/man/man7/
>           cp ${WORKDIR}/manpath.5.gz ${D}${datadir}/man/man5/
> @@ -62,4 +62,4 @@ do_install_append(){
>
>
>   RDEPENDS_${PN} = "less groff"
> -FILES_${PN} += "${datadir}/locale ${sysconfdir}/man.conf"
> +FILES_${PN} += "${datadir}/locale ${sysconfdir}/man.config"
>


