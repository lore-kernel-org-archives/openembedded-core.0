Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrPEt-0005j7-6z
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 10:04:07 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Jul 2012 00:52:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="194322309"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jul 2012 00:52:45 -0700
Message-ID: <50066B4D.2000002@linux.intel.com>
Date: Wed, 18 Jul 2012 00:52:45 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341953258.git.mark.hatle@windriver.com>
	<a5c0682f85ac03ea09346d504843d362ab153911.1341953258.git.mark.hatle@windriver.com>
In-Reply-To: <a5c0682f85ac03ea09346d504843d362ab153911.1341953258.git.mark.hatle@windriver.com>
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
X-List-Received-Date: Wed, 18 Jul 2012 08:04:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2012 01:54 PM, Mark Hatle wrote:
> The build system passes specific TUNE (fundamental) flag values to various
> tools instead of using a shell wrapper or similar.  It is important that the
> build system and ADT/SDK match the behaviors exactly, or we are likely to
> have differences in the way build-system and external components are built
> leading to configuration, compilation and/or run-time problems.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>   meta/classes/toolchain-scripts.bbclass |   63 +++++++++++++++++++++++---------
>   1 files changed, 45 insertions(+), 18 deletions(-)
>
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> index bedcd61..bf37ec9 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -14,9 +14,18 @@ toolchain_create_sdk_env_script () {
>   	echo 'export PKG_CONFIG_SYSROOT_DIR=${SDKTARGETSYSROOT}' >> $script
>   	echo 'export PKG_CONFIG_PATH=${SDKTARGETSYSROOT}${libdir}/pkgconfig' >> $script
>   	echo 'export CONFIG_SITE=${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS}' >> $script
> -	echo 'export CC=${TARGET_PREFIX}gcc' >> $script
> -	echo 'export CXX=${TARGET_PREFIX}g++' >> $script
> +	echo 'export CC="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
> +	echo 'export CXX="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
> +	echo 'export CPP="${TARGET_PREFIX}gcc -E ${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
> +	echo 'export AS="${TARGET_PREFIX}as ${TARGET_AS_ARCH}"' >> $script
> +	echo 'export LD="${TARGET_PREFIX}ld ${TARGET_LD_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
>   	echo 'export GDB=${TARGET_PREFIX}gdb' >> $script
> +	echo 'export STRIP=${TARGET_PREFIX}strip' >> $script
> +	echo 'export RANLIB=${TARGET_PREFIX}ranlib' >> $script
> +	echo 'export OBJCOPY=${TARGET_PREFIX}objcopy' >> $script
> +	echo 'export OBJDUMP=${TARGET_PREFIX}objdump' >> $script
> +	echo 'export AR=${TARGET_PREFIX}-ar' >> $script
> +	echo 'export NM=${TARGET_PREFIX}-nm' >> $script
>   	echo 'export TARGET_PREFIX=${TARGET_PREFIX}' >> $script
>   	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${SDK_ARCH}-linux --with-libtool-sysroot=${SDKTARGETSYSROOT}"' >> $script
>   	if [ "${TARGET_OS}" = "darwin8" ]; then
> @@ -26,10 +35,10 @@ toolchain_create_sdk_env_script () {
>   		cd ${SDK_OUTPUT}${SDKTARGETSYSROOT}/usr
>   		ln -s /usr/local local
>   	fi
> -	echo 'export CFLAGS="${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
> -	echo 'export CXXFLAGS="${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
> -	echo 'export LDFLAGS="${TARGET_LD_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
> -	echo 'export CPPFLAGS="${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
> +	echo 'export CFLAGS="${TARGET_CFLAGS}"' >> $script
> +	echo 'export CXXFLAGS="${TARGET_CXXFLAGS}"' >> $script
> +	echo 'export LDFLAGS="${TARGET_LDFLAGS}"' >> $script
> +	echo 'export CPPFLAGS="${TARGET_CPPFLAGS}"' >> $script
>   	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
>   	echo 'export OECORE_TARGET_SYSROOT="${SDKTARGETSYSROOT}"' >> $script
>   	echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/aclocal"' >> $script
> @@ -49,9 +58,18 @@ toolchain_create_tree_env_script () {
>
>   	echo 'export CONFIG_SITE="${@siteinfo_get_files(d)}"' >> $script
>
> -	echo 'export CC=${TARGET_PREFIX}gcc' >> $script
> -	echo 'export CXX=${TARGET_PREFIX}g++' >> $script
> +	echo 'export CC="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
> +	echo 'export CXX="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
> +	echo 'export CPP="${TARGET_PREFIX}gcc -E ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
> +	echo 'export AS="${TARGET_PREFIX}as ${TARGET_AS_ARCH}"' >> $script
> +	echo 'export LD="${TARGET_PREFIX}ld ${TARGET_LD_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
>   	echo 'export GDB=${TARGET_PREFIX}gdb' >> $script
> +	echo 'export STRIP=${TARGET_PREFIX}strip' >> $script
> +	echo 'export RANLIB=${TARGET_PREFIX}ranlib' >> $script
> +	echo 'export OBJCOPY=${TARGET_PREFIX}objcopy' >> $script
> +	echo 'export OBJDUMP=${TARGET_PREFIX}objdump' >> $script
> +	echo 'export AR=${TARGET_PREFIX}-ar' >> $script
> +	echo 'export NM=${TARGET_PREFIX}-nm' >> $script
>   	echo 'export TARGET_PREFIX=${TARGET_PREFIX}' >> $script
>   	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${BUILD_SYS} --with-libtool-sysroot=${STAGING_DIR_TARGET}"' >> $script
>   	if [ "${TARGET_OS}" = "darwin8" ]; then
> @@ -61,10 +79,10 @@ toolchain_create_tree_env_script () {
>   		cd ${SDK_OUTPUT}${SDKTARGETSYSROOT}/usr
>   		ln -s /usr/local local
>   	fi
> -	echo 'export CFLAGS="${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
> -	echo 'export CXXFLAGS="${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
> -	echo 'export LDFLAGS="${TARGET_LD_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
> -	echo 'export CPPFLAGS="${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"' >> $script
> +	echo 'export CFLAGS="${TARGET_CFLAGS}"' >> $script
> +	echo 'export CXXFLAGS="${TARGET_CXXFLAGS}"' >> $script
> +	echo 'export LDFLAGS="${TARGET_LDFLAGS}"' >> $script
> +	echo 'export CPPFLAGS="${TARGET_CPPFLAGS}"' >> $script
>   	echo 'export OECORE_NATIVE_SYSROOT="${STAGING_DIR_NATIVE}"' >> $script
>   	echo 'export OECORE_TARGET_SYSROOT="${STAGING_DIR_TARGET}"' >> $script
>   	echo 'export OECORE_ACLOCAL_OPTS="-I ${STAGING_DIR_NATIVE}/usr/share/aclocal"' >> $script
> @@ -83,9 +101,18 @@ toolchain_create_sdk_env_script_for_installer () {
>   	echo 'export PKG_CONFIG_SYSROOT_DIR=##SDKTARGETSYSROOT##' >> $script
>   	echo 'export PKG_CONFIG_PATH=##SDKTARGETSYSROOT##${target_libdir}/pkgconfig' >> $script
>   	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
> -	echo 'export CC=${TARGET_PREFIX}gcc' >> $script
> -	echo 'export CXX=${TARGET_PREFIX}g++' >> $script
> +	echo 'export CC="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
> +	echo 'export CXX="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
> +	echo 'export CPP="${TARGET_PREFIX}gcc -E ${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
> +	echo 'export AS="${TARGET_PREFIX}as ${TARGET_AS_ARCH}"' >> $script
> +	echo 'export LD="${TARGET_PREFIX}ld ${TARGET_LD_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
>   	echo 'export GDB=${TARGET_PREFIX}gdb' >> $script
> +	echo 'export STRIP=${TARGET_PREFIX}strip' >> $script
> +	echo 'export RANLIB=${TARGET_PREFIX}ranlib' >> $script
> +	echo 'export OBJCOPY=${TARGET_PREFIX}objcopy' >> $script
> +	echo 'export OBJDUMP=${TARGET_PREFIX}objdump' >> $script
> +	echo 'export AR=${TARGET_PREFIX}-ar' >> $script
> +	echo 'export NM=${TARGET_PREFIX}-nm' >> $script
>   	echo 'export TARGET_PREFIX=${TARGET_PREFIX}' >> $script
>   	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${SDK_ARCH}-linux --with-libtool-sysroot=##SDKTARGETSYSROOT##"' >> $script
>   	if [ "${TARGET_OS}" = "darwin8" ]; then
> @@ -95,10 +122,10 @@ toolchain_create_sdk_env_script_for_installer () {
>   		cd ${SDK_OUTPUT}${SDKTARGETSYSROOT}/usr
>   		ln -s /usr/local local
>   	fi
> -	echo 'export CFLAGS="${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
> -	echo 'export CXXFLAGS="${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
> -	echo 'export LDFLAGS="${TARGET_LD_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
> -	echo 'export CPPFLAGS="${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
> +	echo 'export CFLAGS="${TARGET_CFLAGS}"' >> $script
> +	echo 'export CXXFLAGS="${TARGET_CXXFLAGS}"' >> $script
> +	echo 'export LDFLAGS="${TARGET_LDFLAGS}"' >> $script
> +	echo 'export CPPFLAGS="${TARGET_CPPFLAGS}"' >> $script
>   	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
>   	echo 'export OECORE_TARGET_SYSROOT="##SDKTARGETSYSROOT##"' >> $script
>           echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/aclocal"' >> $script
>

Merged into OE-Core

Thanks
	Sau!



