Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Soue0-0004SF-UI for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 12:59:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BAmVj6003063;
	Wed, 11 Jul 2012 11:48:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02807-05; Wed, 11 Jul 2012 11:48:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BAmNGR003057
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 11 Jul 2012 11:48:24 +0100
Message-ID: <1342003704.7934.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2012 11:48:24 +0100
In-Reply-To: <a5c0682f85ac03ea09346d504843d362ab153911.1341953258.git.mark.hatle@windriver.com>
References: <cover.1341953258.git.mark.hatle@windriver.com>
	<a5c0682f85ac03ea09346d504843d362ab153911.1341953258.git.mark.hatle@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: yocto@yoctoproject.org
Subject: Re: RFC: [PATCH 1/1] toolchain-scripts: Sync the SDK/ADT values to the build system
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
X-List-Received-Date: Wed, 11 Jul 2012 10:59:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-10 at 15:54 -0500, Mark Hatle wrote:
> The build system passes specific TUNE (fundamental) flag values to various
> tools instead of using a shell wrapper or similar.  It is important that the
> build system and ADT/SDK match the behaviors exactly, or we are likely to
> have differences in the way build-system and external components are built
> leading to configuration, compilation and/or run-time problems.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/toolchain-scripts.bbclass |   63 +++++++++++++++++++++++---------
>  1 files changed, 45 insertions(+), 18 deletions(-)

I'm all for merging this. Jessica, is this likely to cause any problems
for the ADT?

Cheers,

Richard


> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> index bedcd61..bf37ec9 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -14,9 +14,18 @@ toolchain_create_sdk_env_script () {
>  	echo 'export PKG_CONFIG_SYSROOT_DIR=${SDKTARGETSYSROOT}' >> $script
>  	echo 'export PKG_CONFIG_PATH=${SDKTARGETSYSROOT}${libdir}/pkgconfig' >> $script
>  	echo 'export CONFIG_SITE=${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS}' >> $script
> -	echo 'export CC=${TARGET_PREFIX}gcc' >> $script
> -	echo 'export CXX=${TARGET_PREFIX}g++' >> $script
> +	echo 'export CC="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
> +	echo 'export CXX="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
> +	echo 'export CPP="${TARGET_PREFIX}gcc -E ${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
> +	echo 'export AS="${TARGET_PREFIX}as ${TARGET_AS_ARCH}"' >> $script
> +	echo 'export LD="${TARGET_PREFIX}ld ${TARGET_LD_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
>  	echo 'export GDB=${TARGET_PREFIX}gdb' >> $script
> +	echo 'export STRIP=${TARGET_PREFIX}strip' >> $script
> +	echo 'export RANLIB=${TARGET_PREFIX}ranlib' >> $script
> +	echo 'export OBJCOPY=${TARGET_PREFIX}objcopy' >> $script
> +	echo 'export OBJDUMP=${TARGET_PREFIX}objdump' >> $script
> +	echo 'export AR=${TARGET_PREFIX}-ar' >> $script
> +	echo 'export NM=${TARGET_PREFIX}-nm' >> $script
>  	echo 'export TARGET_PREFIX=${TARGET_PREFIX}' >> $script
>  	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${SDK_ARCH}-linux --with-libtool-sysroot=${SDKTARGETSYSROOT}"' >> $script
>  	if [ "${TARGET_OS}" = "darwin8" ]; then
> @@ -26,10 +35,10 @@ toolchain_create_sdk_env_script () {
>  		cd ${SDK_OUTPUT}${SDKTARGETSYSROOT}/usr
>  		ln -s /usr/local local
>  	fi
> -	echo 'export CFLAGS="${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
> -	echo 'export CXXFLAGS="${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
> -	echo 'export LDFLAGS="${TARGET_LD_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
> -	echo 'export CPPFLAGS="${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
> +	echo 'export CFLAGS="${TARGET_CFLAGS}"' >> $script
> +	echo 'export CXXFLAGS="${TARGET_CXXFLAGS}"' >> $script
> +	echo 'export LDFLAGS="${TARGET_LDFLAGS}"' >> $script
> +	echo 'export CPPFLAGS="${TARGET_CPPFLAGS}"' >> $script
>  	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
>  	echo 'export OECORE_TARGET_SYSROOT="${SDKTARGETSYSROOT}"' >> $script
>  	echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/aclocal"' >> $script
> @@ -49,9 +58,18 @@ toolchain_create_tree_env_script () {
>  
>  	echo 'export CONFIG_SITE="${@siteinfo_get_files(d)}"' >> $script
>  
> -	echo 'export CC=${TARGET_PREFIX}gcc' >> $script
> -	echo 'export CXX=${TARGET_PREFIX}g++' >> $script
> +	echo 'export CC="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
> +	echo 'export CXX="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
> +	echo 'export CPP="${TARGET_PREFIX}gcc -E ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
> +	echo 'export AS="${TARGET_PREFIX}as ${TARGET_AS_ARCH}"' >> $script
> +	echo 'export LD="${TARGET_PREFIX}ld ${TARGET_LD_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
>  	echo 'export GDB=${TARGET_PREFIX}gdb' >> $script
> +	echo 'export STRIP=${TARGET_PREFIX}strip' >> $script
> +	echo 'export RANLIB=${TARGET_PREFIX}ranlib' >> $script
> +	echo 'export OBJCOPY=${TARGET_PREFIX}objcopy' >> $script
> +	echo 'export OBJDUMP=${TARGET_PREFIX}objdump' >> $script
> +	echo 'export AR=${TARGET_PREFIX}-ar' >> $script
> +	echo 'export NM=${TARGET_PREFIX}-nm' >> $script
>  	echo 'export TARGET_PREFIX=${TARGET_PREFIX}' >> $script
>  	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${BUILD_SYS} --with-libtool-sysroot=${STAGING_DIR_TARGET}"' >> $script
>  	if [ "${TARGET_OS}" = "darwin8" ]; then
> @@ -61,10 +79,10 @@ toolchain_create_tree_env_script () {
>  		cd ${SDK_OUTPUT}${SDKTARGETSYSROOT}/usr
>  		ln -s /usr/local local
>  	fi
> -	echo 'export CFLAGS="${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
> -	echo 'export CXXFLAGS="${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
> -	echo 'export LDFLAGS="${TARGET_LD_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
> -	echo 'export CPPFLAGS="${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
> +	echo 'export CFLAGS="${TARGET_CFLAGS}"' >> $script
> +	echo 'export CXXFLAGS="${TARGET_CXXFLAGS}"' >> $script
> +	echo 'export LDFLAGS="${TARGET_LDFLAGS}"' >> $script
> +	echo 'export CPPFLAGS="${TARGET_CPPFLAGS}"' >> $script
>  	echo 'export OECORE_NATIVE_SYSROOT="${STAGING_DIR_NATIVE}"' >> $script
>  	echo 'export OECORE_TARGET_SYSROOT="${STAGING_DIR_TARGET}"' >> $script
>  	echo 'export OECORE_ACLOCAL_OPTS="-I ${STAGING_DIR_NATIVE}/usr/share/aclocal"' >> $script
> @@ -83,9 +101,18 @@ toolchain_create_sdk_env_script_for_installer () {
>  	echo 'export PKG_CONFIG_SYSROOT_DIR=##SDKTARGETSYSROOT##' >> $script
>  	echo 'export PKG_CONFIG_PATH=##SDKTARGETSYSROOT##${target_libdir}/pkgconfig' >> $script
>  	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
> -	echo 'export CC=${TARGET_PREFIX}gcc' >> $script
> -	echo 'export CXX=${TARGET_PREFIX}g++' >> $script
> +	echo 'export CC="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
> +	echo 'export CXX="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
> +	echo 'export CPP="${TARGET_PREFIX}gcc -E ${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
> +	echo 'export AS="${TARGET_PREFIX}as ${TARGET_AS_ARCH}"' >> $script
> +	echo 'export LD="${TARGET_PREFIX}ld ${TARGET_LD_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
>  	echo 'export GDB=${TARGET_PREFIX}gdb' >> $script
> +	echo 'export STRIP=${TARGET_PREFIX}strip' >> $script
> +	echo 'export RANLIB=${TARGET_PREFIX}ranlib' >> $script
> +	echo 'export OBJCOPY=${TARGET_PREFIX}objcopy' >> $script
> +	echo 'export OBJDUMP=${TARGET_PREFIX}objdump' >> $script
> +	echo 'export AR=${TARGET_PREFIX}-ar' >> $script
> +	echo 'export NM=${TARGET_PREFIX}-nm' >> $script
>  	echo 'export TARGET_PREFIX=${TARGET_PREFIX}' >> $script
>  	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${SDK_ARCH}-linux --with-libtool-sysroot=##SDKTARGETSYSROOT##"' >> $script
>  	if [ "${TARGET_OS}" = "darwin8" ]; then
> @@ -95,10 +122,10 @@ toolchain_create_sdk_env_script_for_installer () {
>  		cd ${SDK_OUTPUT}${SDKTARGETSYSROOT}/usr
>  		ln -s /usr/local local
>  	fi
> -	echo 'export CFLAGS="${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
> -	echo 'export CXXFLAGS="${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
> -	echo 'export LDFLAGS="${TARGET_LD_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
> -	echo 'export CPPFLAGS="${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
> +	echo 'export CFLAGS="${TARGET_CFLAGS}"' >> $script
> +	echo 'export CXXFLAGS="${TARGET_CXXFLAGS}"' >> $script
> +	echo 'export LDFLAGS="${TARGET_LDFLAGS}"' >> $script
> +	echo 'export CPPFLAGS="${TARGET_CPPFLAGS}"' >> $script
>  	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
>  	echo 'export OECORE_TARGET_SYSROOT="##SDKTARGETSYSROOT##"' >> $script
>          echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/aclocal"' >> $script




