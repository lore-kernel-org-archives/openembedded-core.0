Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QnCOF-0006MR-Se
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 18:27:52 +0200
Received: by iyj12 with SMTP id 12so5660337iyj.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2011 09:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:organization:user-agent
	:in-reply-to:references:mime-version:content-transfer-encoding
	:content-type; bh=KVbqlVDTvBEPD0ktRC5mdK+Ku34Gl5XTA0/E6WgB0Wc=;
	b=Htrlbd8bA+ZWTLhvvmDQGue1O9DhsbuywW9WtwP10pAS6AQbPuvu2LLh4kEY19HoaB
	LDCPD1/LgDHqp9wdQNpnEcwLjNUmXvFPClVhuugZS6u3hxKjrRqOxApwgAMgAeZq2pGG
	5X4hbCcgIQEjU4ptu+N6rC3t7tG6lt3JPaS1k=
Received: by 10.142.254.21 with SMTP id b21mr1710382wfi.249.1312043012668;
	Sat, 30 Jul 2011 09:23:32 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id t7sm1912351wfl.14.2011.07.30.09.23.31
	(version=SSLv3 cipher=OTHER); Sat, 30 Jul 2011 09:23:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 30 Jul 2011 09:23:26 -0700
Message-ID: <4953517.rmrrWIv0Tx@perseus>
Organization: Sakrah
User-Agent: KMail/4.7.0  (Linux/2.6.38-10-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <98d2970ed91756d79ee3903dc0fd3d907d9bdf65.1311720062.git.richard.purdie@linuxfoundation.org>
References: <bfe5838302fbcfe989e3c26c9e04c927c4755e65.1311720062.git.richard.purdie@linuxfoundation.org>
	<98d2970ed91756d79ee3903dc0fd3d907d9bdf65.1311720062.git.richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] package(rootfs)_ipk.bbclass: support multilib in opkg backend.
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
X-List-Received-Date: Sat, 30 Jul 2011 16:27:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, July 26, 2011 11:50:26 PM Richard Purdie wrote:
> From: Lianhao Lu <lianhao.lu@intel.com>
> 
> Support install multiple multilib in opkg backend.
> 
> The installation is done in 3 phases.
> 
> Phase 1: install normal packages to IMAGE_ROOTFS.
> 
> Phase 2: install multilib packages under MULTILIB_TEMP_ROOTFS. Packages
> belongs to the same multilib arch would be installed to a unique
> directory.
> 
> Phase 3: check file confliction between IMAGE_ROOTFS and
> MULTILIB_TEMP_ROOTFS, install multilib packages to IMAGE_ROOTFS only if
> the sanity check passed.
> 
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  meta/classes/package_ipk.bbclass |   51
> ++++++++++++++++++++++++++++++++++++++ meta/classes/rootfs_ipk.bbclass  |  
>  2 +
>  2 files changed, 53 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/package_ipk.bbclass
> b/meta/classes/package_ipk.bbclass index 0c0f00d..b7afa83 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -61,6 +61,28 @@ python package_ipk_install () {
>  		raise bb.build.FuncFailed
>  }
> 
> +package_tryout_install_multilib_ipk() {
> +	#try install multilib
> +	multilib_tryout_dirs=""
> +	for arch in ${MULTILIB_ARCHS}; do
> +		local target_rootfs="${MULTILIB_TEMP_ROOTFS}/${arch}"
> +		local ipkg_args="-f ${INSTALL_CONF_IPK} -o ${target_rootfs}
> --force_overwrite" +		local selected_pkg=""
> +		#strip the "ml" from package_arch
> +		local pkgarch_prefix="${arch:2}-"
> +		for pkg in "${INSTALL_PACKAGES_MULTILIB_IPK}"; do
> +			if [ ${pkg:0:${#pkgarch_prefix}} == ${pkgarch_prefix} ]; then
> +			    selected_pkg="${selected_pkg} ${pkg}"
> +			fi
> +		done
> +		if [ ! -z "${selected_pkg}" ]; then
> +			mkdir -p ${target_rootfs}/${opkglibdir}
> +			opkg-cl ${ipkg_args} update
> +			opkg-cl ${ipkg_args} install ${selected_pkg}
> +			multilib_tryout_dirs="${multilib_tryout_dirs} ${target_rootfs}"
> +		fi
> +	done
> +}

we use --force-overwrite and if mistakenly if a multilib package installs into
standard paths will opkg inform about it ?

>  #
>  # install a bunch of packages using opkg
>  # the following shell variables needs to be set before calling this func:
> @@ -78,6 +100,7 @@ package_install_internal_ipk() {
>  	local package_to_install="${INSTALL_PACKAGES_NORMAL_IPK}"
>  	local package_attemptonly="${INSTALL_PACKAGES_ATTEMPTONLY_IPK}"
>  	local package_lingusa="${INSTALL_PACKAGES_LINGUAS_IPK}"
> +	local package_multilib="${INSTALL_PACKAGES_MULTILIB_IPK}"
>  	local task="${INSTALL_TASK_IPK}"
> 
>  	mkdir -p ${target_rootfs}${localstatedir}/lib/opkg/
> @@ -102,6 +125,14 @@ package_install_internal_ipk() {
>  	if [ ! -z "${package_attemptonly}" ]; then
>  		opkg-cl ${ipkg_args} install ${package_attemptonly} >
> "${WORKDIR}/temp/log.do_${task}_attemptonly.${PID}" || true fi
> +
> +	package_tryout_install_multilib_ipk
> +	#sanity check
> +	multilib_sanity_check  ${target_rootfs} ${multilib_tryout_dirs}|| exit 1
> +
> +	if [ ! -z "${package_multilib}" ]; then
> +		opkg-cl ${ipkg_args} install ${package_multilib}
> +	fi
>  }
> 
>  ipk_log_check() {
> @@ -142,6 +173,11 @@ package_update_index_ipk () {
>  		packagedirs="$packagedirs ${DEPLOY_DIR_IPK}/$arch
> ${DEPLOY_DIR_IPK}/$sdkarch-nativesdk" done
> 
> +	multilib_archs="${MULTILIB_ARCHS}"
> +	for arch in $multilib_archs; do
> +		packagedirs="$packagedirs ${DEPLOY_DIR_IPK}/$arch"
> +	done
> +
>  	for pkgdir in $packagedirs; do
>  		if [ -e $pkgdir/ ]; then
>  			touch $pkgdir/Packages
> @@ -173,6 +209,13 @@ package_generate_ipkg_conf () {
>  		        echo "src oe-$sdkarch$extension
> file:${DEPLOY_DIR_IPK}/$sdkarch$extension" >> ${IPKGCONF_SDK} fi
>  	done
> +
> +	multilib_archs="${MULTILIB_ARCHS}"
> +	for arch in $multilib_archs; do
> +		if [ -e ${DEPLOY_DIR_IPK}/$arch/Packages ] ; then
> +		        echo "src oe-$arch file:${DEPLOY_DIR_IPK}/$arch" >>
> ${IPKGCONF_TARGET} +		fi
> +	done
>  }
> 
>  package_generate_archlist () {
> @@ -188,6 +231,14 @@ package_generate_archlist () {
>  		echo "arch $sdkarch$extension $priority" >> ${IPKGCONF_SDK}
>  		priority=$(expr $priority + 5)
>  	done
> +
> +	multilib_archs="${MULTILIB_ARCHS}"
> +	for arch in $multilib_archs; do
> +		echo "arch $arch $priority" >> ${IPKGCONF_TARGET}
> +		priority=$(expr $priority + 5)
> +	done
> +
> +
>  }
> 
>  python do_package_ipk () {
> diff --git a/meta/classes/rootfs_ipk.bbclass
> b/meta/classes/rootfs_ipk.bbclass index 4fcacc6..695bee0 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -22,6 +22,7 @@ opkglibdir = "${localstatedir}/lib/opkg"
> 
>  # Which packages to not install on the basis of a recommendation
>  BAD_RECOMMENDATIONS ?= ""
> +MULTILIBRE_ALLOW_REP = "${opkglibdir}"
> 
>  fakeroot rootfs_ipk_do_rootfs () {
>  	set -x
> @@ -58,6 +59,7 @@ fakeroot rootfs_ipk_do_rootfs () {
>  	export INSTALL_ROOTFS_IPK="${IMAGE_ROOTFS}"
>  	export INSTALL_CONF_IPK="${IPKGCONF_TARGET}"
>  	export INSTALL_PACKAGES_NORMAL_IPK="${PACKAGE_INSTALL}"
> +	export INSTALL_PACKAGES_MULTILIB_IPK="${MULTILIB_PACKAGE_INSTALL}"
> 
>  	package_install_internal_ipk
-- 
Khem Raj


