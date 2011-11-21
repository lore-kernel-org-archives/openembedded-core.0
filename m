Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RSatD-0000HL-B9
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Nov 2011 21:54:55 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RSamx-0005vh-MU
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Nov 2011 21:48:27 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1321906980-16016-1-git-send-email-raj.khem@gmail.com>
References: <1321906980-16016-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 21 Nov 2011 20:48:20 +0000
Message-ID: <1321908500.3347.4.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] alsa-lib: Unbreak native build when using TCLIBC=uclibc
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
X-List-Received-Date: Mon, 21 Nov 2011 20:54:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-11-21 at 12:23 -0800, Khem Raj wrote:
> A recent change introduced EXTRA_OECONF_append_libc-uclibc = "
> --with-versioned=no " this change has a side effect when
> building alsa-lib-native using TCLIBC=uclibc the override
> kicks in uninvited and hence build the native package without symbol
> version information. This mean libasound.so which is needed by other
> packages from build host e.g. libSDL.so does not have required symbols
> and linking with libSDL fails, one such case ends in SDL support
> in qemu-native being silently disabled.
> 
> We make sure that override is only enabled for target recipe

This seems like the wrong solution to the problem.  Shouldn't you be
inhibiting the libc-uclibc OVERRIDE at source for native builds
(assuming the host system isn't using uClibc)?

It also seems as though there ought to be a more generic place to encode
the knowledge that uClibc doesn't do symbol versioning.  Having to hack
it into EXTRA_OECONF for every recipe seems... suboptimal.

p.

> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb |   10 ++++++----
>  1 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
> index 83e663d..fa96998 100644
> --- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
> @@ -14,7 +14,7 @@ BBCLASSEXTEND = "native nativesdk"
>  #FIXME: remove the following
>  ARM_INSTRUCTION_SET = "arm"
>  
> -PR = "r1"
> +PR = "r2"
>  
>  SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/alsa-lib-${PV}.tar.bz2 \
>             file://fix-tstamp-declaration.patch"
> @@ -27,10 +27,12 @@ inherit autotools pkgconfig
>  require alsa-fpu.inc
>  EXTRA_OECONF += "${@get_alsa_fpu_setting(bb, d)} "
>  
> -EXTRA_OECONF = "--with-cards=pdaudiocf --with-oss=yes --disable-python"
> -
> -EXTRA_OECONF_append_libc-uclibc = " --with-versioned=no "
> +EXTRA_OECONF = "--with-cards=pdaudiocf --with-oss=yes --disable-python ${VERSIONEDSYMS}"
>  
> +VERSIONEDSYMS = ""
> +VERSIONEDSYMS_libc-uclibc = "--with-versioned=no"
> +VERSIONEDSYMS_virtclass-native = ""
> +VERSIONEDSYMS_virtclass-nativesdk = ""
>  PKGSUFFIX = ""
>  PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
>  




