Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SI5SN-0002OY-Nk
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 23:52:04 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3BLgbs5018216
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Apr 2012 14:42:37 -0700 (PDT)
Received: from msp-dhcp19.wrs.com (172.25.34.19) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 11 Apr 2012 14:42:36 -0700
Message-ID: <4F85FACB.8080205@windriver.com>
Date: Wed, 11 Apr 2012 16:42:35 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1334179880.31685.12.camel@ted>
In-Reply-To: <1334179880.31685.12.camel@ted>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_rpm: Fix useradd preinst ordering issues
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
X-List-Received-Date: Wed, 11 Apr 2012 21:52:04 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/12 4:31 PM, Richard Purdie wrote:
> We were already having occasional ordering issues with package_rpm.
> Fixing the ldconfig postinstall issue pushed rpm over the cliff and
> totally broke rpm builds with the packages getting installed in
> effectively a random order and the useradd preinstalls getting executed
> out of order and breaking.
>
> The only explanation I can find for this is that rpm is special. It will
> happily run a preinst for a package without any of that package's
> dependencies being present regardless of whether there are any circular
> dependency issues or not. I attempted various ways of solving this such
> as ordering the total_solution.manifest in creative ways but the bottom
> line is RPM ignores this. It takes little account of any request to
> ignore /bin/sh dependencies for the purposes of constructing the final
> image.
>
> The end result is we're having to install the base-passwd, base-files
> and shadow packages first (if there is a request to install them), then
> install any other packages.
>
> It this wasn't in the middle of a release I'd be rewriting this bbclass
> file, its horrible.
>
> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>

I've reviewed this.  I don't see anything wrong with this, other then the pain 
of having to do this.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

--Mark

>
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 16a2c87..1b0f6f2 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -166,22 +167,23 @@ rpm_common_comand () {
>   # install or remove the pkg
>   rpm_update_pkg () {
>
> +    manifest=$1
> +    btmanifest=$manifest.bt
>       local target_rootfs="${INSTALL_ROOTFS_RPM}"
>
>       # Save the rpm's build time for incremental image generation, and the file
>       # would be moved to ${T}
> -    rm -f ${target_rootfs}/install/total_solution_bt.manifest
> -    for i in `cat ${target_rootfs}/install/total_solution.manifest`; do
> +    rm -f $btmanifest
> +    for i in `cat $manifest`; do
>           # Use "rpm" rather than "${RPM}" here, since we don't need the
>           # '--dbpath' option
> -        echo "$i `rpm -qp --qf '%{BUILDTIME}\n' $i`">>  \
> -            ${target_rootfs}/install/total_solution_bt.manifest
> +        echo "$i `rpm -qp --qf '%{BUILDTIME}\n' $i`">>  $btmanifest
>       done
>
>       # Only install the different pkgs if incremental image generation is set
>       if [ "${INC_RPM_IMAGE_GEN}" = "1" -a -f ${T}/total_solution_bt.manifest -a \
>           "${IMAGE_PKGTYPE}" = "rpm" ]; then
> -        cur_list="${target_rootfs}/install/total_solution_bt.manifest"
> +        cur_list="$btmanifest"
>           pre_list="${T}/total_solution_bt.manifest"
>           sort -u $cur_list -o $cur_list
>           sort -u $pre_list -o $pre_list
> @@ -203,8 +205,7 @@ rpm_update_pkg () {
>               -Uvh ${target_rootfs}/install/incremental.manifest
>       else
>           # Attempt to install
> -        rpm_common_comand --replacepkgs \
> -            -Uhv ${target_rootfs}/install/total_solution.manifest
> +        rpm_common_comand --replacepkgs -Uhv $manifest
>       fi
>   }
>
> @@ -440,14 +441,7 @@ package_install_internal_rpm () {
>
>   	fi
>
> -	# If base-passwd or shadow are in the list of packages to install,
> -	# ensure they are installed first to support later packages that
> -	# may create custom users/groups (fixes Yocto bug #2127)
> -	infile=${target_rootfs}/install/install_solution.manifest
> -	outfile=${target_rootfs}/install/total_solution.manifest
> -	cat $infile | grep /base-passwd-[0-9]>  $outfile || true
> -	cat $infile | grep /shadow-[0-9]>>  $outfile || true
> -	cat $infile | grep -v /shadow-[0-9] | grep -v /base-passwd-[0-9]>>  $outfile || true
> +	cat ${target_rootfs}/install/install_solution.manifest>  ${target_rootfs}/install/total_solution.manifest
>   	cat ${target_rootfs}/install/install_multilib_solution.manifest>>  ${target_rootfs}/install/total_solution.manifest
>
>   	# Construct install scriptlet wrapper
> @@ -474,8 +468,45 @@ EOF
>
>   	chmod 0755 ${WORKDIR}/scriptlet_wrapper
>
> -    rpm_update_pkg
> +	# RPM is special. It can't handle dependencies and preinstall scripts correctly. Its
> +	# probably a feature. The only way to convince rpm to actually run the preinstall scripts
> +	# for base-passwd and shadow first before installing packages that depend on these packages
> +	# is to do two image installs, installing one set of packages, then the other.
> +	if [ "${INC_RPM_IMAGE_GEN}" = "1" -a -f ${T}/total_solution_bt.manifest ]; then
> +		echo "Skipping pre install due to exisitng image"
> +	else
> +		echo "# Intial Install manifest">  ${target_rootfs}/install/initial_install.manifest
> +		echo "Installing base dependencies first (base-passwd, base-files and shadow) since rpm is special"
> +		grep /base-passwd-[0-9] ${target_rootfs}/install/total_solution.manifest>>  ${target_rootfs}/install/initial_install.manifest || true
> +		grep /base-files-[0-9] ${target_rootfs}/install/total_solution.manifest>>  ${target_rootfs}/install/initial_install.manifest || true		
> +		grep /shadow-[0-9] ${target_rootfs}/install/total_solution.manifest>>  ${target_rootfs}/install/initial_install.manifest || true
> +
> +		# Generate an install solution by doing a --justdb install, then recreate it with
> +		# an actual package install!
> +		mkdir -p ${target_rootfs}/initial
> +
> +		${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
> +			--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
> +			-D "_dbpath ${target_rootfs}/initial" -D "`cat ${confbase}-base_archs.macro`" \
> +			-D "__dbi_txn create nofsync" \
> +			-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
> +			${target_rootfs}/install/initial_install.manifest
> +
> +		${RPM} -D "_dbpath ${target_rootfs}/initial" -qa --yaml \
> +			-D "__dbi_txn create nofsync private" \
> +			| grep -i 'Packageorigin' | cut -d : -f 2>  ${target_rootfs}/install/initial_solution.manifest
> +
> +		rpm_update_pkg ${target_rootfs}/install/initial_solution.manifest
> +		
> +		grep -Fv -f ${target_rootfs}/install/initial_solution.manifest ${target_rootfs}/install/total_solution.manifest>  ${target_rootfs}/install/total_solution.manifest.new
> +		mv ${target_rootfs}/install/total_solution.manifest.new ${target_rootfs}/install/total_solution.manifest
> +		
> +		rm -rf ${target_rootfs}/initial
> +	fi
> +
> +	echo "Installing main solution manifest (${target_rootfs}/install/total_solution.manifest)"
>
> +	rpm_update_pkg ${target_rootfs}/install/total_solution.manifest
>   }
>
>   python write_specfile () {
>



