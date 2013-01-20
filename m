Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Twv5d-0003fW-3f for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 14:37:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0KDM9ns008784;
	Sun, 20 Jan 2013 13:22:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04712-05; Sun, 20 Jan 2013 13:22:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0KDM33o008777
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sun, 20 Jan 2013 13:22:04 GMT
Message-ID: <1358688124.14265.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mike.looijmans@topic.nl
Date: Sun, 20 Jan 2013 13:22:04 +0000
In-Reply-To: <1358587906-24240-1-git-send-email-mike.looijmans@topic.nl>
References: <1358587906-24240-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc: Enable OpenMP compiling and library
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
X-List-Received-Date: Sun, 20 Jan 2013 13:37:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-01-19 at 10:31 +0100, mike.looijmans@topic.nl wrote:
> From: Mike Looijmans <mike.looijmans@topic.nl>
> 
> Multicore embedded systems are getting more and more common.
> 
> Remove "--disable-openmp" from the GCC configuration options and
> always build libgomp. This only creates a "bigger" compiler but
> has no effect on the compiled binaries that don't use openmp.
> 
> Tested a clean build on mips32el and arm7a, no problems encountered.
> 
> Autoconf will not detect OpenMP after this change, because it will
> build and run a target binary on the build system. In order to use
> OpenMP, the variable ac_cv_prog_c_openmp=-fopenmp must be set.
> ---
>  meta/recipes-devtools/gcc/gcc-4.7.inc              |    9 +++------
>  .../recipes-devtools/gcc/gcc-configure-runtime.inc |    4 +---
>  .../recipes-devtools/gcc/gcc-cross-canadian_4.7.bb |    2 +-
>  3 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
> index 08a0103..a7aa4a4 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
> @@ -88,7 +88,6 @@ JAVA = ""
>  EXTRA_OECONF_BASE = " --enable-lto \
>  			--enable-libssp \
>  			--disable-bootstrap \
> -			--disable-libgomp \
>  			--disable-libmudflap \
>  			--with-system-zlib \
>  			--with-linker-hash-style=${LINKER_HASH_STYLE} \
> @@ -99,7 +98,6 @@ EXTRA_OECONF_BASE = " --enable-lto \
>  			--enable-cheaders=c_global "
>  
>  EXTRA_OECONF_INITIAL = "--disable-libmudflap \
> -			--disable-libgomp \
>  			--disable-libssp \
>  			--disable-libquadmath \
>  			--with-system-zlib \
> @@ -108,7 +106,6 @@ EXTRA_OECONF_INITIAL = "--disable-libmudflap \
>  			--enable-decimal-float=no"
>  
>  EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap \
> -				--disable-libgomp \
>  				--disable-libquadmath \
>  				--with-system-zlib \
>  				--disable-lto \


I nearly took this however you still want this disabled in the
INITIAL/INTERMEDIATE versions, you're just wasting compile time there sa
nothing would use it.




> @@ -117,9 +114,9 @@ EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap \
>  
>  EXTRA_OECONF_append_libc-uclibc = " --disable-decimal-float "
>  
> -EXTRA_OECONF_PATHS = " \ 
> -                      --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++ \ 
> -                      --with-sysroot=${STAGING_DIR_TARGET} \ 
> +EXTRA_OECONF_PATHS = " \
> +                      --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++ \
> +                      --with-sysroot=${STAGING_DIR_TARGET} \


What changed here?

>                        --with-build-sysroot=${STAGING_DIR_TARGET}"
>  
>  do_configure_prepend () {
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
> index d40383c..1c9155f 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
> @@ -7,9 +7,7 @@ EXTRA_OECONF_PATHS = " \
>      --with-sysroot=${STAGING_DIR_TARGET} \
>      --with-build-sysroot=${STAGING_DIR_TARGET}"
>  
> -RUNTIMETARGET = "libssp libstdc++-v3"
> -RUNTIMETARGET_append_powerpc = " libgomp"
> -RUNTIMETARGET_append_powerpc64 = " libgomp"
> +RUNTIMETARGET = "libssp libstdc++-v3 libgomp"
>  #  ?
>  # libiberty
>  # libmudflap
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
> index 53c4632..6c048c0 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
> @@ -13,7 +13,7 @@ SYSTEMLIBS = "${target_base_libdir}/"
>  SYSTEMLIBS1 = "${target_libdir}/"
>  
>  EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
> -		--disable-libgomp --disable-libmudflap \
> +		--disable-libmudflap \


Again, I'm wondering if you mean this here. The library would have been
built as part of the target build? Does the library need gcc support as
well as its presence?

Cheers,

Richard



