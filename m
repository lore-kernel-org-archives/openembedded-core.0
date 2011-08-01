Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QnsHO-0001OM-DA for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 15:11:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p71D7FK9007252
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 14:07:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04880-08 for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2011 14:07:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p71D78S6007246
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 14:07:08 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <180637fbdcbc29750f30bc493ce2891dd8318de6.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<180637fbdcbc29750f30bc493ce2891dd8318de6.1312182844.git.sgw@linux.intel.com>
Date: Mon, 01 Aug 2011 14:06:55 +0100
Message-ID: <1312204015.2344.434.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 16/22] populate_sdk: Fix the introduction of sdknative packages
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
X-List-Received-Date: Mon, 01 Aug 2011 13:11:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 00:36 -0700, Saul Wold wrote:
> From: Mark Hatle <mark.hatle@windriver.com>
> 
> The sdknative packages were not being introduced into the list of available
> packages properly.  Fix this by always introducing it and avoiding a sed of
> one type to another.
> 
> Also fix a number of minor issues with the RPM behavior when building sdk
> images.

I'm afraid this change looks wrong to me. Firstly, all arch packages are
"all", not "all-nativesdk". You're also cutting down the arch list to a
single sdk entry rather than the intended package_archs list.

"all" == "all-nativesdk" as things stand might be wrong for various
other reasons I can think of but it is what would currently be
generated.

All things considered, this issue needs more work.

Cheers,

Richard



> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/package_rpm.bbclass      |   19 +++++++++----------
>  meta/classes/populate_sdk_deb.bbclass |   11 ++---------
>  meta/classes/populate_sdk_rpm.bbclass |   11 ++---------
>  3 files changed, 13 insertions(+), 28 deletions(-)
> 
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 0377100..856dfb0 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -32,14 +32,12 @@ package_update_index_rpm () {
>  		eval archs=\${${archvar}}
>  		packagedirs=""
>  		packagedirs_sdk=""
> -		for arch in $archs; do
> -			sdkarch=`echo $arch | sed -e 's/${HOST_ARCH}/${SDK_ARCH}/'`
> -			extension="-nativesdk"
> -			if [ "$sdkarch" = "all" -o "$sdkarch" = "any" -o "$sdkarch" = "noarch" ]; then
> -			    extension=""
> -			fi
> +		if [ "${SDK_ARCH}-nativesdk" != "-nativesdk" ]; then
> +			packagedirs_sdk="${DEPLOY_DIR_RPM}/${SDK_ARCH}-nativesdk"
> +		fi
> +		for arch in $archs ; do
>  			packagedirs="${DEPLOY_DIR_RPM}/$arch $packagedirs"
> -			packagedirs_sdk="${DEPLOY_DIR_RPM}/$sdkarch$extension $packagedirs_sdk"
> +			packagedirs_sdk="${DEPLOY_DIR_RPM}/$arch $packagedirs_sdk"
>  
>  			rm -rf ${DEPLOY_DIR_RPM}/$arch/solvedb
>  			rm -rf ${DEPLOY_DIR_RPM}/$sdkarch$extension/solvedb
> @@ -95,6 +93,7 @@ package_update_index_rpm () {
>  #
>  package_generate_rpm_conf () {
>  	printf "_solve_dbpath " > ${RPMCONF_TARGET_BASE}.macro
> +	printf "_solve_dbpath " > ${RPMCONF_HOST_BASE}.macro
>  	o_colon_t=false
>  	o_colon_h=false
>  
> @@ -238,7 +237,7 @@ package_install_internal_rpm () {
>  					echo "Unable to find package $pkg ($ml_pkg)!"
>  					exit 1
>  				fi
> -				echo $pkg_name >> ${IMAGE_ROOTFS}/install/install.manifest
> +				echo $pkg_name >> ${target_rootfs}/install/install.manifest
>  			done
>  		fi
>  	fi
> @@ -258,7 +257,7 @@ package_install_internal_rpm () {
>  				echo "Unable to find package $pkg ($ml_pkg)!"
>  				exit 1
>  			fi
> -			echo $pkg_name >> ${IMAGE_ROOTFS}/install/install.manifest
> +			echo $pkg_name >> ${target_rootfs}/install/install.manifest
>  		done
>  	fi
>  
> @@ -303,7 +302,7 @@ package_install_internal_rpm () {
>  		# Dump the full set of recommends...
>  		${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
>  			--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
> -			-D "_dbpath ${IMAGE_ROOTFS}/install" -D "`cat ${confbase}.macro`" \
> +			-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}.macro`" \
>  			-D "__dbi_txn create nofsync private" \
>  			-qa --qf "[%{RECOMMENDS}\n]" | sort -u > ${target_rootfs}/install/recommend
>  		# Did we add more to the list?
> diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
> index a5b6384..9acc52d 100644
> --- a/meta/classes/populate_sdk_deb.bbclass
> +++ b/meta/classes/populate_sdk_deb.bbclass
> @@ -34,16 +34,9 @@ fakeroot populate_sdk_deb () {
>  	export INSTALL_ROOTFS_DEB="${SDK_OUTPUT}"
>  	export INSTALL_BASEARCH_DEB="${SDK_ARCH}"
>  	export INSTALL_PACKAGES_NORMAL_DEB="${TOOLCHAIN_HOST_TASK}"
> -	INSTALL_ARCHS_DEB=""
> +	INSTALL_ARCHS_DEB="${SDK_ARCH}-nativesdk"
>  	for arch in ${PACKAGE_ARCHS}; do
> -		sdkarch=`echo $arch | sed -e 's/${HOST_ARCH}/${SDK_ARCH}/'`
> -		extension="-nativesdk"
> -		if [ "$sdkarch" = "all" -o "$sdkarch" = "any" -o "$sdkarch" = "noarch" ]; then
> -		    extension=""
> -		fi
> -		if [ -e ${DEPLOY_DIR_DEB}/$sdkarch$extension ]; then
> -			INSTALL_ARCHS_DEB="$INSTALL_ARCHS_DEB $sdkarch$extension"
> -		fi
> +		INSTALL_ARCHS_DEB="$INSTALL_ARCHS_DEB $arch"
>  	done
>  	export INSTALL_ARCHS_DEB
>  
> diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
> index da308c1..8196542 100644
> --- a/meta/classes/populate_sdk_rpm.bbclass
> +++ b/meta/classes/populate_sdk_rpm.bbclass
> @@ -53,16 +53,9 @@ fakeroot populate_sdk_rpm () {
>  	export INSTALL_PLATFORM_RPM="${SDK_ARCH}"
>  	export INSTALL_CONFBASE_RPM="${RPMCONF_HOST_BASE}"
>  	export INSTALL_PACKAGES_NORMAL_RPM="${TOOLCHAIN_HOST_TASK}"
> -	export INSTALL_PLATFORM_EXTRA_RPM=""
> +	export INSTALL_PLATFORM_EXTRA_RPM="${SDK_ARCH}-nativesdk"
>  	for arch in ${PACKAGE_ARCHS}; do
> -		sdkarch=`echo $arch | sed -e 's/${HOST_ARCH}/${SDK_ARCH}/'`
> -		extension="-nativesdk"
> -		if [ "$sdkarch" = "all" -o "$sdkarch" = "any" -o "$sdkarch" = "noarch" ]; then
> -		    extension=""
> -		fi
> -		if [ -e ${DEPLOY_DIR_RPM}/$sdkarch$extension ]; then
> -			INSTALL_PLATFORM_EXTRA_RPM="$sdkarch $INSTALL_PLATFORM_EXTRA_RPM"
> -		fi
> +		INSTALL_PLATFORM_EXTRA_RPM="$arch $INSTALL_PLATFORM_EXTRA_RPM"
>  	done
>  	export INSTALL_PLATFORM_EXTRA_RPM
>  




