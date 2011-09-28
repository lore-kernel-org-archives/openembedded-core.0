Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8uSz-00063Z-Hm for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 15:46:29 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SDlOZl007264 for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 14:47:24 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zSLTyfNc3b6W
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 14:47:24 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SDlHGt007259
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 14:47:19 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 14:40:52 +0100
In-Reply-To: <fd038ffaa07466c14dc983049a9a99989d33be9b.1317094542.git.raj.khem@gmail.com>
References: <cover.1317094542.git.raj.khem@gmail.com>
	<fd038ffaa07466c14dc983049a9a99989d33be9b.1317094542.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317217259.12332.0.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 1/4] conf, recipes: Add new variable LINKER_HASH_STYLE
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
X-List-Received-Date: Wed, 28 Sep 2011 13:46:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-09-26 at 20:39 -0700, Khem Raj wrote:
> LINKER_HASH_STYLE in OE is set to either 'sysv' or 'gnu'
> depending upon processor architecture e.g. mips does not support
> gnu hash style so is uses sysv
> 
> besides 'sysv' and 'gnu' third option is to set it to 'both' we do
> not do that by default but user can still set it
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/bitbake.conf                      |    3 ++-
>  meta/conf/distro/include/tcmode-default.inc |    6 +++++-
>  meta/recipes-core/uclibc/uclibc.inc         |    2 +-
>  3 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 730439c..47e8547 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -476,7 +476,8 @@ BUILDSDK_LDFLAGS = "-L${STAGING_LIBDIR} \
>                      -Wl,-rpath-link,${STAGING_DIR_HOST}${base_libdir} \
>                      -Wl,-rpath,${base_libdir} -Wl,-O1"
>  
> -TARGET_LINK_HASH_STYLE ??= ""
> +LINKER_HASH_STYLE ??= "gnu"
> +TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('LINKER_HASH_STYLE', d, True) == 'gnu']}"
>  export LDFLAGS = "${TARGET_LDFLAGS}"
>  export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
>  #export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${libdir} \
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 2857215..1ddfbce 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -63,5 +63,9 @@ PREFERRED_VERSION_gzip-native ?= "1.4"
>  
>  # Setup suitable toolchain flags
>  require conf/distro/include/as-needed.inc
> -TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH', d, True) in ['mips', 'mipsel', 'mips64', 'mips64el']]}"
>  
> +# mips does not support GNU hash style therefore we hard assign them
> +LINKER_HASH_STYLE_mips = "sysv"
> +LINKER_HASH_STYLE_mipsel = "sysv"
> +LINKER_HASH_STYLE_mips64 = "sysv"
> +LINKER_HASH_STYLE_mips64el = "sysv"

Lets move these to bitbake.conf with the other entries since the other
part of this is now in the global config. It doesn't make sense to
require anyone replacing this file add these entries (and there is
currently no other setting that would make sense on mips).

> diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
> index 222c34f..f104114 100644
> --- a/meta/recipes-core/uclibc/uclibc.inc
> +++ b/meta/recipes-core/uclibc/uclibc.inc
> @@ -201,5 +201,5 @@ do_configure() {
>  
>  do_install() {
>          oe_runmake PREFIX=${D} install
> -        oe_runmake PREFIX=${D} "SSP_ALL_CFLAGS=${TARGET_LINK_HASH_STYLE}" install_utils
> +	oe_runmake PREFIX=${D} "SSP_ALL_CFLAGS=${TARGET_LINK_HASH_STYLE}" install_utils
>  }

I don't think this was meant to be here...

With those two teaks I'll take this patch. 

For the gcc/glibc upgrade, I'd like a positive pass test result from the
autobuilder to verify the changes. I'll talk to Beth/Saul to see when we
can fit a test run in.

Cheers,

Richard




