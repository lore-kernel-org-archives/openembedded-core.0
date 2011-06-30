Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QcEEW-0002Tc-I8 for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 12:12:28 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QcEAs-0000cH-BB
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 12:08:42 +0200
From: Phil Blundell <pb@pbcl.net>
To: oe-core <openembedded-core@lists.openembedded.org>
In-Reply-To: <1309189876.21613.327.camel@phil-desktop>
References: <1309189876.21613.327.camel@phil-desktop>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 30 Jun 2011 11:08:41 +0100
Message-ID: <1309428521.2551.105.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] binutils: allow distro to select gold as default linker
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
X-List-Received-Date: Thu, 30 Jun 2011 10:12:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Ping?

p.

On Mon, 2011-06-27 at 16:51 +0100, Phil Blundell wrote:
> But ensure that gcc-cross-intermediate always uses ld.bfd since 
> (e)glibc won't build with gold.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/recipes-devtools/binutils/binutils-cross.inc  |    3 ++-
>  .../gcc/gcc-cross-intermediate.inc                 |    7 ++++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
> index 4b90972..5a41970 100644
> --- a/meta/recipes-devtools/binutils/binutils-cross.inc
> +++ b/meta/recipes-devtools/binutils/binutils-cross.inc
> @@ -5,7 +5,8 @@ EXTRA_OECONF = "--with-sysroot=${STAGING_DIR_TARGET} \
>                  --program-prefix=${TARGET_PREFIX} \
>                  --disable-install-libbfd \
>                  --disable-werror \
> -                --enable-poison-system-directories"
> +                --enable-poison-system-directories \
> +		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default', '', d)}"
>  
>  do_install () {
>  	oe_runmake 'DESTDIR=${D}' install
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> index 92c3ce2..05b5dbc 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> @@ -7,6 +7,10 @@ CROSS_TARGET_SYS_DIR_append = ".${PN}"
>  
>  # This is intended to be a -very- basic config
>  # sysroot is needed in case we use libc-initial
> +#
> +# Glibc won't compile with gold, and building glibc is the whole point of
> +# this recipe.   So we select ld.bfd explicitly here if gold is the distro's 
> +# preferred linker.
>  EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
>  		--enable-shared \
>  		--disable-multilib \
> @@ -17,7 +21,8 @@ EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
>  		--with-sysroot=${STAGING_DIR_TCBOOTSTRAP} \
>  		--with-build-sysroot=${STAGING_DIR_TCBOOTSTRAP} \
>  		${EXTRA_OECONF_INTERMEDIATE} \
> -		${@get_gcc_fpu_setting(bb, d)}"
> +		${@get_gcc_fpu_setting(bb, d)} \
> +		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)}"
>  
>  do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_HOST} ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}/${target_base_libdir}"
>  do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_HOST} ${STAGING_DIR_TCBOOTSTRAP}/${target_base_libdir}"




