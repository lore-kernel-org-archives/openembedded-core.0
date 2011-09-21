Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R6SUN-0003AV-So
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 21:29:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8LJORpx022998
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 12:24:27 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 21 Sep 2011 12:24:26 -0700
Message-ID: <4E7A39EA.4040604@windriver.com>
Date: Wed, 21 Sep 2011 14:24:26 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1316631873.git.dongxiao.xu@intel.com>
	<ea5aa20a9c0bf3dbaadd97a3186cefdc97dadbbc.1316631873.git.dongxiao.xu@intel.com>
In-Reply-To: <ea5aa20a9c0bf3dbaadd97a3186cefdc97dadbbc.1316631873.git.dongxiao.xu@intel.com>
Subject: Re: [PATCH 1/1] rootfs_rpm: two step installation
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
X-List-Received-Date: Wed, 21 Sep 2011 19:29:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 9/21/11 2:06 PM, Dongxiao Xu wrote:
> Firstly we install a base image.
> Then install those multilib packages listed in MULTILIB_IMAGE_INSTALL.
> 
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>

I worked with Dongxiao on this solution.

Acked-by: Mark Hatle <mark.hatle@windriver.com>

> ---
>  meta/classes/package_rpm.bbclass |   54 +++++++++++++++++++++++++++++++++++---
>  1 files changed, 50 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index d822b54..775d525 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -166,7 +166,8 @@ package_install_internal_rpm () {
>  	local platform="${INSTALL_PLATFORM_RPM}"
>  	local platform_extra="${INSTALL_PLATFORM_EXTRA_RPM}"
>  	local confbase="${INSTALL_CONFBASE_RPM}"
> -	local package_to_install="${INSTALL_PACKAGES_NORMAL_RPM} ${INSTALL_PACKAGES_MULTILIB_RPM}"
> +	local package_to_install="${INSTALL_PACKAGES_NORMAL_RPM}"
> +	local multilib_to_install="${INSTALL_PACKAGES_MULTILIB_RPM}"
>  	local package_attemptonly="${INSTALL_PACKAGES_ATTEMPTONLY_RPM}"
>  	local package_linguas="${INSTALL_PACKAGES_LINGUAS_RPM}"
>  	local providename="${INSTALL_PROVIDENAME_RPM}"
> @@ -253,11 +254,13 @@ package_install_internal_rpm () {
>  		done
>  	fi
>  
> +	# Normal package installation
> +
>  	# Generate an install solution by doing a --justdb install, then recreate it with
>  	# an actual package install!
>  	${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
>  		--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
> -		-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}.macro`" \
> +		-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}-base_archs.macro`" \
>  		-D "__dbi_txn create nofsync" \
>  		-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
>  		${target_rootfs}/install/install.manifest
> @@ -351,14 +354,57 @@ package_install_internal_rpm () {
>  		-D "__dbi_txn create nofsync private" \
>  		| grep -i 'Packageorigin' | cut -d : -f 2 > ${target_rootfs}/install/install_solution.manifest
>  
> +	if [ ! -z "${multilib_to_install}" ]; then
> +		for pkg in ${multilib_to_install} ; do
> +			echo "Processing $pkg..."
> +
> +			archvar=base_archs
> +			ml_prefix=`echo ${pkg} | cut -d'-' -f1`
> +			ml_pkg=$pkg
> +			for i in ${MULTILIB_PREFIX_LIST} ; do
> +				if [ ${ml_prefix} == ${i} ]; then
> +					ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
> +					archvar=ml_archs
> +					break
> +				fi
> +			done
> +
> +			pkg_name=$(resolve_package_rpm ${confbase}-${archvar}.conf ${ml_pkg})
> +			if [ -z "$pkg_name" ]; then
> +				echo "Unable to find package $pkg ($ml_pkg)!"
> +				exit 1
> +			fi
> +			echo $pkg_name >> ${target_rootfs}/install/install_multilib.manifest
> +		done
> +	fi
> +
> +	# multilib package installation
> +
> +	# Generate an install solution by doing a --justdb install, then recreate it with
> +	# an actual package install!
> +	${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
> +		--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
> +		-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}-ml_archs.macro`" \
> +		-D "__dbi_txn create nofsync" \
> +		-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
> +		${target_rootfs}/install/install_multilib.manifest
> +
> +	# Now that we have a solution, pull out a list of what to install...
> +	echo "Manifest: ${target_rootfs}/install/install_multilib.manifest"
> +	${RPM} -D "_dbpath ${target_rootfs}/install" -qa --yaml \
> +		-D "__dbi_txn create nofsync private" \
> +		| grep -i 'Packageorigin' | cut -d : -f 2 > ${target_rootfs}/install/install_multilib_solution.manifest
> +
> +
>  	# Attempt install
>  	${RPM} --root ${target_rootfs} \
>  		--predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
>  		--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
>  		-D "_dbpath ${rpmlibdir}" \
> -		--noscripts --notriggers --noparentdirs --nolinktos \
> +		--noscripts --notriggers --noparentdirs --nolinktos --replacepkgs \
>  		-D "__dbi_txn create nofsync private" \
> -		-Uhv ${target_rootfs}/install/install_solution.manifest
> +		-Uhv ${target_rootfs}/install/install_solution.manifest \
> +		${target_rootfs}/install/install_multilib_solution.manifest
>  }
>  
>  python write_specfile () {



