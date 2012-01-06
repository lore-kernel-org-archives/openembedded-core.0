Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RjBkC-0008NV-RW for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 16:30:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06FMlNA022155;
	Fri, 6 Jan 2012 15:22:47 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21013-10; Fri,  6 Jan 2012 15:22:44 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06FMcWP022149
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 6 Jan 2012 15:22:39 GMT
Message-ID: <1325863359.20759.127.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 06 Jan 2012 15:22:39 +0000
In-Reply-To: <47d6afe044383d6ca97c3972a25663eda145a56c.1325318523.git.liezhi.yang@windriver.com>
References: <cover.1325318523.git.liezhi.yang@windriver.com>
	<47d6afe044383d6ca97c3972a25663eda145a56c.1325318523.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] V2 Incremental image generation(rpm based rootfs)
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
X-List-Received-Date: Fri, 06 Jan 2012 15:30:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-12-31 at 16:10 +0800, Robert Yang wrote:
> Incremental image generation, the rootfs would be totally removed and
> re-created in the second generation by default, but with INC_IMAGE_GEN =
> "1", the rootfs would be kept, and will do update(remove/add some pkgs)
> on it.
> NOTE: This is not suggested when you want to create a productive rootfs
> 
> For example:
>   1) Add the follow config option to a conf file:
>      INC_IMAGE_GEN = "1"
> 
>   2) bitbake core-image-sato
>      modify a package
>      bitbake core-image-sato
> 
> The rootfs would not be totally removed and re-created in the second
> generation, it would be simply updated based on the "package".
> 
> Implatation:
> 1) Figure out the pkg which need to be removed or re-installed, then use
> 'rpm -e to remove the old one. Use the rpm's BUILDTIME to determine
> which pkg has been rebuilt.
> 
> 2) Figure out the pkg which is newly added, and use 'rpm -U' to install
> it.
> 
> This only for the rpm based rootfs, I don't know whether we also need
> this for ipk or deb  based rootfs.

As Koen points out, this should be called INC_RPM_IMAGE_GEN since it
only works for rpm at present. It would be good to make this work on the
other package backends. If we keep the generic variable name, the other
package backends could error out saying they don't support it.

> [YOCTO #1651]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/image.bbclass       |   11 +++++-
>  meta/classes/package_rpm.bbclass |   72 ++++++++++++++++++++++++++++++++-----
>  2 files changed, 71 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 865d430..71b60f3 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -134,15 +134,22 @@ do_rootfs[umask] = 022
>  
>  fakeroot do_rootfs () {
>  	#set -x
> -	rm -rf ${IMAGE_ROOTFS}
> +    # When use the incremental image generation, don't remove the rootfs
> +    if [ "${INC_IMAGE_GEN}" != "1" ]; then
> +        rm -rf ${IMAGE_ROOTFS}
> +    fi
>  	rm -rf ${MULTILIB_TEMP_ROOTFS}
>  	mkdir -p ${IMAGE_ROOTFS}
>  	mkdir -p ${DEPLOY_DIR_IMAGE}
>  
>  	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOY_DIR_IMAGE}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
>  
> -	if [ "${USE_DEVFS}" != "1" ]; then
> +    # If "${IMAGE_ROOTFS}/dev" exists, then the device had been made by
> +    # the previous build
> +	if [ "${USE_DEVFS}" != "1" -a ! -r "${IMAGE_ROOTFS}/dev" ]; then
>  		for devtable in ${@get_devtable_list(d)}; do
> +            # Always return ture since there maybe already one when use the
> +            # incremental image generation
>  			makedevs -r ${IMAGE_ROOTFS} -D $devtable
>  		done
>  	fi
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index d03dc3f..541d351 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -147,6 +147,66 @@ resolve_package_rpm () {
>  	echo $pkg_name
>  }
>  
> +# rpm common command and options
> +rpm_common_comand () {
> +
> +    local target_rootfs="${INSTALL_ROOTFS_RPM}"
> +    local extra_args="$@"
> +
> +    ${RPM} --root ${target_rootfs} \
> +        --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
> +        --predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
> +        -D "_var ${localstatedir}" \
> +        -D "_dbpath ${rpmlibdir}" \
> +        --noparentdirs --nolinktos \
> +        -D "__dbi_txn create nofsync private" \
> +        -D "_cross_scriptlet_wrapper ${WORKDIR}/scriptlet_wrapper" $extra_args
> +}
> +
> +# install or remove the pkg
> +rpm_update_pkg () {
> +
> +    local target_rootfs="${INSTALL_ROOTFS_RPM}"
> +
> +    # Save the rpm's build time for incremental image generation, and the file
> +    # would be moved to ${T}
> +    rm -f ${target_rootfs}/install/total_solution_bt.manifest
> +    for i in `cat ${target_rootfs}/install/total_solution.manifest`; do
> +        # Use "rpm" rather than "${RPM}" here, since we don't need the
> +        # '--dbpath' option
> +        echo "$i `rpm -qp --qf '%{BUILDTIME}\n' $i`" >> \
> +            ${target_rootfs}/install/total_solution_bt.manifest
> +    done
> +
> +    # Only install the different pkgs if incremental image generation is set
> +    if [ "${INC_IMAGE_GEN}" = "1" -a -f ${T}/total_solution_bt.manifest ]; then
> +        cur_list="${target_rootfs}/install/total_solution_bt.manifest"
> +        pre_list="${T}/total_solution_bt.manifest"
> +        sort -u $cur_list -o $cur_list
> +        sort -u $pre_list -o $pre_list
> +        comm -1 -3 $cur_list $pre_list | sed 's#.*/\(.*\)\.rpm .*#\1#' > \
> +            ${target_rootfs}/install/remove.manifest
> +        comm -2 -3 $cur_list $pre_list | awk '{print $1}' > \
> +            ${target_rootfs}/install/incremental.manifest
> +
> +        # Attempt to remove unwanted pkgs, the scripts(pre, post, etc.) has not
> +        # been run by now, so don't have to run them(preun, postun, etc.) when
> +        # erase the pkg

Really? I'd have thought it possible the scripts have run during the
previous do_rootfs?

Otherwise the patch looks reasonable to me.

Cheers,

Richard




