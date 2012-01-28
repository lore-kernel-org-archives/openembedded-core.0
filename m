Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RrF0C-0005Lf-25
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jan 2012 21:36:00 +0100
Received: by dakf10 with SMTP id f10so2006467dak.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jan 2012 12:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/tPRzMAYmvQiYtu/6TU1k+19eHoHwBom1fQmsz1fpWA=;
	b=PTNsX6Lpnqa+Drryi5rFDvZ6gpFjRxgsPcEu33kXoxHRWsGM3FjD+l/qII1uoc3qlQ
	fVHUO7oPJygcsvTGxfopnl8IJ+TwKaL9zRV0a8qSPvUxY/E1jHABlxYctqE+YcxX5hqL
	Tvu+vbaJ6Tfu7nmCml/GiyDWFHRxcu+hcRR5Y=
Received: by 10.68.199.38 with SMTP id jh6mr25871516pbc.77.1327782488452;
	Sat, 28 Jan 2012 12:28:08 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id e10sm1519893pbv.0.2012.01.28.12.28.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Jan 2012 12:28:07 -0800 (PST)
Date: Sat, 28 Jan 2012 12:28:01 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120128202801.GF22106@sakrah.homelinux.org>
References: <cover.1327684024.git.chris_larson@mentor.com>
	<08cc6aa12fba6bcdb28c68edf3fe2e32dd5f52ca.1327684024.git.chris_larson@mentor.com>
MIME-Version: 1.0
In-Reply-To: <08cc6aa12fba6bcdb28c68edf3fe2e32dd5f52ca.1327684024.git.chris_larson@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 07/10] external-csl-toolchain: support mips/ppc/arm
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
X-List-Received-Date: Sat, 28 Jan 2012 20:36:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (27/01/12 11:13), Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> - Rather than adjusting TARGET_VENDOR, which results in our TARGET_SYS
>   matching the external toolchain, override TARGET_PREFIX to match external,
>   and leave TARGET_SYS alone
> - Grab the optimized files out of the toolchain if available
> - Create a symlink in sysroot to ensure the sysroot layout matches toolchain
>   expectations (optimized files in a subdir)
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/conf/distro/include/tcmode-external-csl.inc |   27 +++++++++++++++++-
>  meta/recipes-core/meta/external-csl-toolchain.bb |   32 +++++++++++++++++-----
>  2 files changed, 50 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/conf/distro/include/tcmode-external-csl.inc b/meta/conf/distro/include/tcmode-external-csl.inc
> index 0af3a45..1d82ca1 100644
> --- a/meta/conf/distro/include/tcmode-external-csl.inc
> +++ b/meta/conf/distro/include/tcmode-external-csl.inc
> @@ -2,12 +2,20 @@
>  # Configuration to use external CSL toolchain
>  #
>  
> -TARGET_VENDOR = "-none"
> -
>  EXTERNAL_TOOLCHAIN ?= "/usr/local/csl/${TARGET_ARCH}"
>  
>  PATH =. "${EXTERNAL_TOOLCHAIN}/bin:"
>  
> +CSL_TARGET_SYS_powerpc = "powerpc-linux-gnu"
> +CSL_TARGET_SYS_powerpc64 = "powerpc-linux-gnu"

hmm is it using powerpc-linux-gnu canonical name to do both ppc32
and ppc64

> +CSL_TARGET_SYS_arm = "arm-none-linux-gnueabi"
> +CSL_TARGET_SYS_mips = "mips-linux-gnu"
> +CSL_TARGET_SYS_mipsel = "mips-linux-gnu"


> +CSL_TARGET_SYS_mips64 = "mips-linux-gnu"

same as above

> +CSL_TARGET_SYS = "${TARGET_SYS}"
> +
> +TARGET_PREFIX = "${CSL_TARGET_SYS}-"
> +
>  PREFERRED_PROVIDER_linux-libc-headers = "external-csl-toolchain"
>  PREFERRED_PROVIDER_linux-libc-headers-dev = "external-csl-toolchain"
>  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-csl-toolchain"
> @@ -28,3 +36,18 @@ TARGET_CPPFLAGS_prepend = " -isystem${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/include
>  TARGET_LDFLAGS_prepend = " -L${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/lib -Wl,-rpath-link,${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/lib "
>  
>  TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
> +
> +# Translate to CodeSourcery's names for their optimized files in the toolchain
> +def csl_target_core(d):
> +    coredata = {
> +        'armv7a-vfp-neon': 'armv7-a-neon',
> +        'mips': 'mips32',
> +        'mipsel': 'el',
> +        'ppce500': 'te500v1',
> +        'ppce500mc': 'te500mc',
> +        'ppce500v2': 'te500v2',
> +        'ppce600': 'te600'
> +    }
> +    return coredata.get(d.getVar('TUNE_PKGARCH', True), '')
> +
> +CSL_TARGET_CORE = "${@csl_target_core(d)}"
> diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/recipes-core/meta/external-csl-toolchain.bb
> index f1e5332..37ea271 100644
> --- a/meta/recipes-core/meta/external-csl-toolchain.bb
> +++ b/meta/recipes-core/meta/external-csl-toolchain.bb
> @@ -25,25 +25,43 @@ PROVIDES = "\
>  	virtual/linux-libc-headers "
>  RPROVIDES = "glibc-utils libsegfault glibc-thread-db"
>  PACKAGES_DYNAMIC = "glibc-gconv-*"
> -PR = "r2"
> +PR = "r3"
>  
> -#SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/${TARGET_SYS}/arm-${PV}-${TARGET_PREFIX}i686-pc-linux-gnu.tar.bz2"
> +#SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/${CSL_TARGET_SYS}/arm-${PV}-${TARGET_PREFIX}i686-pc-linux-gnu.tar.bz2"
>  
>  SRC_URI = "file://SUPPORTED"
>  
>  do_install() {
>  	install -d ${D}${sysconfdir} ${D}${bindir} ${D}${sbindir} ${D}${base_bindir} ${D}${libdir}
> -	install -d ${D}${base_libdir} ${D}${base_sbindir} ${D}${datadir}
> +	install -d ${D}${base_libdir} ${D}${base_sbindir} ${D}${datadir} ${D}/usr
>  
> -	cp -a ${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/libc/lib/*  ${D}${base_libdir}
> -	cp -a ${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/libc/etc/*  ${D}${sysconfdir}
> -	cp -a ${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/libc/sbin/* ${D}${base_sbindir}
> -	cp -a ${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/libc/usr/*  ${D}/usr
> +	if [ -d ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE} ]; then
> +		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/lib/.  ${D}${base_libdir}
> +		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/etc/.  ${D}${sysconfdir}
> +		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/sbin/. ${D}${base_sbindir}
> +		if [ ! -e ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/usr/include ]; then
> +			cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/usr/include  ${D}/usr/
> +		fi
> +		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/usr/.  ${D}/usr/
> +	else
> +		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/lib/.  ${D}${base_libdir}
> +		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/etc/.  ${D}${sysconfdir}
> +		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/sbin/. ${D}${base_sbindir}
> +		cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/usr/.  ${D}/usr/
> +	fi
>  
>  	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
>  	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libpthread.so
>  }
>  
> +SYSROOT_PREPROCESS_FUNCS += "external_toolchain_sysroot_adjust"
> +external_toolchain_sysroot_adjust() {
> +       if [ -n "${CSL_TARGET_CORE}" ]; then
> +               rm -f ${SYSROOT_DESTDIR}/${CSL_TARGET_CORE}
> +               ln -s . ${SYSROOT_DESTDIR}/${CSL_TARGET_CORE}
> +       fi
> +}
> +
>  GLIBC_INTERNAL_USE_BINARY_LOCALE ?= "compile"
>  
>  PACKAGES += "libgcc libgcc-dev libstdc++ libstdc++-dev linux-libc-headers linux-libc-headers-dev"
> -- 
> 1.7.8.rc4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


