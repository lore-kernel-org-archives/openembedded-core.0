Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T1u4N-0007UQ-Io
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 09:00:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7G6mei1025612
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 23:48:41 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 15 Aug 2012 23:48:40 -0700
Message-ID: <502C97C7.70706@windriver.com>
Date: Thu, 16 Aug 2012 14:48:39 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1345044352.git.liezhi.yang@windriver.com>
	<e6e85bbbbde402b1e55def41837ccbcc20667c1f.1345044352.git.liezhi.yang@windriver.com>
In-Reply-To: <e6e85bbbbde402b1e55def41837ccbcc20667c1f.1345044352.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/3] rpm: install external binary packages
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
X-List-Received-Date: Thu, 16 Aug 2012 07:00:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 08/15/2012 11:32 PM, Robert Yang wrote:
>
> diff --git a/meta/classes/external_package.bbclass b/meta/classes/external_package.bbclass
> new file mode 100644
> index 0000000..c6d87bb
> --- /dev/null
> +++ b/meta/classes/external_package.bbclass
> @@ -0,0 +1,41 @@
> +#
> +# ex:ts=4:sw=4:sts=4:et
> +# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
> +#
> +# Add external binary pkg to the repo and install them:
> +#
> +# Specify where are the external binary pkg dir
> +#EXTERNAL_PACKAGE_DIR = "<path1> <path2> ..."
> +# Specify which pkg will be installed
> +#EXTERNAL_INSTALL_PACKAGE = "<pkg1> <pkg2> ..."
> +
> +#
> +# Add the external binary rpm into the repo, copy the binary rpm files
> +# from EXTERNAL_PACKAGE_DIR to ${DEPLOY_DIR_RPM}/external, and put them
> +# to the relevant arch dir.
> +#
> +add_external_rpm () {
> +    local supported_archs="$@"
> +

I updated this patch and the "PATCH 2/3" a little since the "dash" doesn't
support the local var="$@", so changed it to:

local supported_archs
supported_archs="$@"

and pushed to the repo:

   git://git.pokylinux.org/poky-contrib robert/external_install
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/external_install

// Robert

> +    # Clean the EXTERNAL_DIR_RPM dir and re-copy
> +    [ ! -d "${EXTERNAL_DIR_RPM}" ] || rm -fr ${EXTERNAL_DIR_RPM}
> +
> +    if [ -n "${EXTERNAL_PACKAGE_DIR}" -a -n "${EXTERNAL_INSTALL_PACKAGE}" ]; then
> +        echo "Adding external binary rpms to the repo ..."
> +        for f in `find ${EXTERNAL_PACKAGE_DIR} -type f  -name '*.rpm'`; do
> +            arch="`echo $f | awk -F\. '{print $(NF-1)}'`"
> +            found=""
> +            for archvar in $supported_archs; do
> +                # Only pick up the supported arch's rpm
> +                if [ "$arch" == "$archvar" ]; then
> +                    [ -d "${EXTERNAL_DIR_RPM}/$arch" ] || mkdir -p ${EXTERNAL_DIR_RPM}/$arch
> +                    cp -f $f ${EXTERNAL_DIR_RPM}/$arch/
> +                    found="1"
> +                    break
> +                fi
> +            done
> +            [ -n "$found" ] || echo "Uknown arch $arch"
> +        done
> +    fi
> +}
> +
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 72720f1..283688a 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -5,6 +5,8 @@ inherit imagetest-${IMAGETEST}
>
>   inherit populate_sdk_base
>
> +inherit external_package
> +
>   TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
>   TOOLCHAIN_TARGET_TASK_ATTEMPTONLY += "${PACKAGE_INSTALL_ATTEMPTONLY}"
>   POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_install_complementary populate_sdk; "
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index b58ae85..bd2c9a2 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -7,6 +7,7 @@ RPMBUILD="rpmbuild"
>
>   PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
>   PKGWRITEDIRSRPM = "${DEPLOY_DIR}/sources/deploy-srpm"
> +EXTERNAL_DIR_RPM = "${DEPLOY_DIR_RPM}/external"
>
>   python package_rpm_fn () {
>       d.setVar('PKGFN', d.getVar('PKG'))
> @@ -26,6 +27,9 @@ package_update_index_rpm () {
>   		return
>   	fi
>
> +	# Add external binary pkgs
> +	add_external_rpm ${PACKAGE_ARCHS} ${MULTILIB_PACKAGE_ARCHS} ${SDK_PACKAGE_ARCHS}
> +
>   	# Update target packages
>   	base_archs="${PACKAGE_ARCHS}"
>   	ml_archs="${MULTILIB_PACKAGE_ARCHS}"
> @@ -44,9 +48,11 @@ package_update_index_rpm_common () {
>   	for archvar in "$@"; do
>   		eval archs=\${${archvar}}
>   		packagedirs=""
> -		for arch in $archs; do
> -			packagedirs="${DEPLOY_DIR_RPM}/$arch $packagedirs"
> -			rm -rf ${DEPLOY_DIR_RPM}/$arch/solvedb.done
> +		for d in ${DEPLOY_DIR_RPM} ${EXTERNAL_DIR_RPM}; do
> +			for arch in $archs; do
> +				packagedirs="$d/$arch $packagedirs"
> +				rm -rf $d/$arch/solvedb.done
> +			done
>   		done
>
>   		cat /dev/null > ${rpmconf_base}-${archvar}.conf
> diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
> index c0207d8..7ce694c 100644
> --- a/meta/classes/rootfs_rpm.bbclass
> +++ b/meta/classes/rootfs_rpm.bbclass
> @@ -51,7 +51,7 @@ fakeroot rootfs_rpm_do_rootfs () {
>   	export INSTALL_ROOTFS_RPM="${IMAGE_ROOTFS}"
>   	export INSTALL_PLATFORM_RPM="${TARGET_ARCH}"
>   	export INSTALL_CONFBASE_RPM="${RPMCONF_TARGET_BASE}"
> -	export INSTALL_PACKAGES_RPM="${PACKAGE_INSTALL}"
> +	export INSTALL_PACKAGES_RPM="${PACKAGE_INSTALL} ${EXTERNAL_INSTALL_PACKAGE}"
>   	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${PACKAGE_INSTALL_ATTEMPTONLY}"
>   	export INSTALL_PACKAGES_LINGUAS_RPM="${LINGUAS_INSTALL}"
>   	export INSTALL_PROVIDENAME_RPM=""
>


