Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RO3gy-0007tZ-Uu
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 09:39:33 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Nov 2011 00:33:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,483,1315206000"; d="scan'208";a="87815589"
Received: from unknown (HELO [10.255.12.14]) ([10.255.12.14])
	by fmsmga002.fm.intel.com with ESMTP; 09 Nov 2011 00:33:16 -0800
Message-ID: <4EBA3ACC.3000907@linux.intel.com>
Date: Wed, 09 Nov 2011 00:33:16 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320779076.git.dvhart@linux.intel.com>
	<6e5f3af0ae4f9f99f27bf2c909eef951599ff381.1320779076.git.dvhart@linux.intel.com>
In-Reply-To: <6e5f3af0ae4f9f99f27bf2c909eef951599ff381.1320779076.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>, tom_rini@mentor.com
Subject: Re: [PATCH 1/1] ncurses: refactor configure to avoid configuring widec when disabled
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
X-List-Received-Date: Wed, 09 Nov 2011 08:39:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/08/2011 11:08 AM, Darren Hart wrote:
> The ENABLE_WIDEC variable can be used to disable ncurses wide character support
> when your C library doesn't support it. Currently, the do_configure step
> configures for both narrow and wide characters regardless and only checks
> ENABLE_WIDEC during compilation. This leads to QA failures with host
> contamination during configure if the C library doesn't support wide characters.
>
> Refactor do_configure with a new ncurses_configure helper function and only
> configure for wide character support if ENABLE_WIDEC is true.
>
> Ensure that configure errors are propogated back through to do_configure.
>
> Tested with ENABLE_WIDEC as true and false via an ncurses bbappend on i586,
> including basic error injection.
>
> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
> ---
>   meta/recipes-core/ncurses/ncurses.inc |   64 +++++++++++++++++---------------
>   1 files changed, 34 insertions(+), 30 deletions(-)
>
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
> index be7d387..d3a9b1c 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -26,6 +26,36 @@ ENABLE_WIDEC = "true"
>   # builds.
>   BUILD_CPPFLAGS += "-D_GNU_SOURCE"
>
No PR Bump!

Sau!

> +# Helper function for do_configure to allow multiple configurations
> +# $1 the directory to run configure in
> +# $@ the arguments to pass to configure
> +ncurses_configure() {
> +	mkdir -p $1
> +	cd $1
> +	shift
> +	oe_runconf \
> +	        --disable-static \
> +	        --without-debug \
> +	        --without-ada \
> +	        --without-gpm \
> +	        --enable-hard-tabs \
> +	        --enable-xmc-glitch \
> +	        --enable-colorfgbg \
> +	        --with-termpath='${sysconfdir}/termcap:${datadir}/misc/termcap' \
> +	        --with-terminfo-dirs='${sysconfdir}/terminfo:${datadir}/terminfo' \
> +	        --with-shared \
> +	        --disable-big-core \
> +	        --program-prefix= \
> +	        --with-ticlib \
> +	        --with-termlib=tinfo \
> +	        --enable-sigwinch \
> +	        --enable-pc-files \
> +	        --disable-rpath-hack \
> +	        --with-manpage-format=normal \
> +	        "$@" || return 1
> +	cd ..
> +}
> +
>   # Override the function from the autotools class; ncurses requires a
>   # patched autoconf213 to generate the configure script. This autoconf
>   # is not available so that the shipped script will be used.
> @@ -35,36 +65,10 @@ do_configure() {
>           # not the case for /dev/null redirections)
>           export cf_cv_working_poll=yes
>
> -        for i in \
> -        'narrowc' \
> -        'widec   --enable-widec --without-progs'; do
> -                set -- $i
> -                mkdir -p $1
> -                cd $1
> -                shift
> -
> -                oe_runconf \
> -                        --disable-static \
> -                        --without-debug \
> -                        --without-ada \
> -                        --without-gpm \
> -                        --enable-hard-tabs \
> -                        --enable-xmc-glitch \
> -                        --enable-colorfgbg \
> -                        --with-termpath='${sysconfdir}/termcap:${datadir}/misc/termcap' \
> -                        --with-terminfo-dirs='${sysconfdir}/terminfo:${datadir}/terminfo' \
> -                        --with-shared \
> -                        --disable-big-core \
> -                        --program-prefix= \
> -                        --with-ticlib \
> -                        --with-termlib=tinfo \
> -                        --enable-sigwinch \
> -                        --enable-pc-files \
> -                        --disable-rpath-hack \
> -                        --with-manpage-format=normal \
> -                        "$@"
> -                cd ..
> -        done
> +	ncurses_configure "narrowc" || \
> +		return 1
> +	! ${ENABLE_WIDEC} || \
> +		ncurses_configure "widec" "--enable-widec" "--without-progs"
>   }
>
>   do_compile() {


