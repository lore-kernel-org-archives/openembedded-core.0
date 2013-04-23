Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UUgrP-0006XH-TA for Openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 19:18:34 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3NH1okb019147; Tue, 23 Apr 2013 18:01:50 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TIi0OCKGOHYu; Tue, 23 Apr 2013 18:01:50 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3NH1iqw019138
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 23 Apr 2013 18:01:46 +0100
Message-ID: <1366736437.23738.66.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Tue, 23 Apr 2013 18:00:37 +0100
In-Reply-To: <1366733299-14804-1-git-send-email-jason.wessel@windriver.com>
References: <1366733299-14804-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libpcre, ncurses: Fix problems expanding the IMAGE_INSTALL package groups
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Apr 2013 17:18:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-04-23 at 11:08 -0500, Jason Wessel wrote:
> The ncurses and libpcre packages were generating the following errors
> as a result of not specifing the PACKAGES_DYNAMIC correctly.  These
> errors only appear when using the IMAGE_INSTALL list that has been
> expanded by the hob or from the pkgdata.
> 
> ERROR: Nothing RPROVIDES 'ncurses-libtinfo'
> ERROR: Nothing RPROVIDES 'libpcreposix'
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/recipes-core/ncurses/ncurses.inc        |    2 ++
>  meta/recipes-support/libpcre/libpcre_8.32.bb |    2 ++
>  2 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
> index bcb9c94..78ff153 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -42,6 +42,8 @@ EXCONFIG_ARGS_virtclass-nativesdk = " \
>  		--with-chtype='long' \
>  		--with-mmask-t='long'"
>  
> +PACKAGES_DYNAMIC = "^${PN}-.*"
> +
>  # Fall back to the host termcap / terminfo for -nativesdk and -native
>  # The reality is a work around for strange problems with things like
>  # "bitbake -c menuconfig busybox" where it cannot find the terminfo

This makes sense since its doing dynamic package splitting.

> diff --git a/meta/recipes-support/libpcre/libpcre_8.32.bb b/meta/recipes-support/libpcre/libpcre_8.32.bb
> index 4d17741..71cc119 100644
> --- a/meta/recipes-support/libpcre/libpcre_8.32.bb
> +++ b/meta/recipes-support/libpcre/libpcre_8.32.bb
> @@ -26,6 +26,8 @@ inherit autotools binconfig
>  
>  PARALLEL_MAKE = ""
>  
> +PACKAGES_DYNAMIC = "^${PN}.*"
> +
>  EXTRA_OECONF = "\
>      --enable-newline-is-lf \
>      --enable-rebuild-chartables \

However this does not. libpcreposix is clearly listed in PACKAGES. Was
this based on an older recipe and can someone check this is needed on
master?

Cheers,

Richard



