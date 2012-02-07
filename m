Received: from smtpout.karoo.kcom.com ([212.50.160.34])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mac@mcrowe.com>) id 1RuiUe-00019K-Rl
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 11:41:48 +0100
X-IronPort-AV: E=Sophos;i="4.73,376,1325462400"; d="scan'208";a="593285812"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 07 Feb 2012 10:31:41 +0000
Received: from mac by deneb.mcrowe.com with local (Exim 4.72)
	(envelope-from <mac@mcrowe.com>) id 1RuiKr-0007xZ-3r
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 10:31:41 +0000
Date: Tue, 7 Feb 2012 10:31:41 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120207103141.GA30500@mcrowe.com>
References: <1321488805.18905.5.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1321488805.18905.5.camel@ted>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] libtool-cross: Upbreak and actually use more of it
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
X-List-Received-Date: Tue, 07 Feb 2012 10:41:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 17, 2011 at 12:13:25AM +0000, Richard Purdie wrote:
> We should be using libtool-cross for cross compiling but
> were not. This patch sets datadir so libtoolize ends up
> containing correct paths. It then installs libtoolize.

I have a recipe that no longer works after this (or perhaps the other
changes Richard mentions later in the thread.) It's a pretty
straightforward recipe that inherits from autotools. Judging by the
number of warnings from autoconf the package was probably expecting an
older version of automake/autoconf. The configure task fails with:

 libtoolize: `config/compile' not found in `/home/mac/src/oe/build/tmp-eglibc/sysroots/panther/usr/share/libtool'

(continued inside patch)

> The path ltmain.sh was installed to was incorrect and this is fixed.
> 
> We also now install all the libtool m4 macros.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
> index 596528a..4e6e3f2 100644
> --- a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
> +++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
> @@ -1,10 +1,13 @@
>  require libtool-${PV}.inc
>  
> -PR = "r5"
> +PR = "r7"
>  PACKAGES = ""
>  SRC_URI += "file://prefix.patch"
>  SRC_URI += "file://fixinstall.patch"
>  
> +target_datadir := "${datadir}"
> +datadir = "${STAGING_DIR_TARGET}${target_datadir}"
> +
>  do_configure_prepend () {
>  	# Remove any existing libtool m4 since old stale versions would break
>  	# any upgrade
> @@ -13,20 +16,21 @@ do_configure_prepend () {
>  }
>  
>  do_install () {
> -	install -d ${D}${bindir}/
> -	install -m 0755 ${HOST_SYS}-libtool ${D}${bindir}/${HOST_SYS}-libtool
> -	install -d ${D}${datadir}/libtool/
> -	install -d ${D}${datadir}/aclocal/
> -	install -c ${S}/libltdl/config/config.guess ${D}${datadir}/libtool/
> -	install -c ${S}/libltdl/config/config.sub ${D}${datadir}/libtool/
> -	install -c -m 0644 ${S}/libltdl/config/ltmain.sh ${D}${datadir}/libtool/
> -	install -c -m 0644 ${S}/libltdl/m4/libtool.m4 ${D}${datadir}/aclocal/
> -	install -c -m 0644 ${S}/libltdl/m4/ltdl.m4 ${D}${datadir}/aclocal/
> +	install -d ${D}${bindir_crossscripts}/
> +	install -m 0755 ${HOST_SYS}-libtool ${D}${bindir_crossscripts}/${HOST_SYS}-libtool
> +	install -d ${D}${bindir_crossscripts}/
> +	install -m 0755 libtoolize ${D}${bindir_crossscripts}/
> +	install -d ${D}${target_datadir}/libtool/config/
> +	install -d ${D}${target_datadir}/aclocal/
> +	install -c ${S}/libltdl/config/config.guess ${D}${target_datadir}/libtool/
> +	install -c ${S}/libltdl/config/config.sub ${D}${target_datadir}/libtool/

If I also install "compile", "depcomp" and "missing" here then this
solves the immediate problem but then it looks like I also need to add
"COPYING.LIB" and probably many other files to
${D}{$target_datadir}/libtool/libltdl too which leads me to think that
I'm swimming against the tide and might be going about this the wrong
way. Is this the correct approach? If so why not just call "make
install" rather than installing everything by hand?

> +	install -c -m 0644 ${S}/libltdl/config/ltmain.sh ${D}${target_datadir}/libtool/config/
> +	install -c -m 0644 ${S}/libltdl/m4/*.m4 ${D}${target_datadir}/aclocal/
>  }
>  
>  SYSROOT_PREPROCESS_FUNCS += "libtoolcross_sysroot_preprocess"
>  
>  libtoolcross_sysroot_preprocess () {
> -	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
> -	install -m 755 ${D}${bindir}/${HOST_SYS}-libtool ${SYSROOT_DESTDIR}${bindir_crossscripts}/${HOST_SYS}-libtool
> +	sysroot_stage_dir ${D}${bindir_crossscripts} ${SYSROOT_DESTDIR}${bindir_crossscripts}
> +	sysroot_stage_dir ${D}${target_datadir} ${SYSROOT_DESTDIR}${target_datadir}
>  }

TIA

Mike.


