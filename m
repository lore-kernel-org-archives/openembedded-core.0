Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJ0bU-0008D5-I5 for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 13:25:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92BCWfl015048;
	Tue, 2 Oct 2012 12:12:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14357-04; Tue,  2 Oct 2012 12:12:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92BCMds015041
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 2 Oct 2012 12:12:23 +0100
Message-ID: <1349176346.15753.139.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Tue, 02 Oct 2012 12:12:26 +0100
In-Reply-To: <1349169606.32611.73.camel@phil-desktop>
References: <1349169606.32611.73.camel@phil-desktop>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rootfs_ipk, image: Add debug capture support
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
X-List-Received-Date: Tue, 02 Oct 2012 11:25:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-10-02 at 10:20 +0100, Phil Blundell wrote:
> If ${IMAGE_BUILD_DEBUG} is set, construct a parallel tree containing
> the debug data for the packages that have been installed in the
> rootfs, then tar it up and deploy it alongside the rootfs images.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/classes/image.bbclass      |    9 +++++++++
>  meta/classes/rootfs_ipk.bbclass |   15 +++++++++++++++
>  meta/conf/bitbake.conf          |    1 +
>  3 files changed, 25 insertions(+)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index ab212b3..c82fba1 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -445,3 +445,12 @@ do_package_write_deb[noexec] = "1"
>  do_package_write_rpm[noexec] = "1"
>  
>  addtask rootfs before do_build
> +
> +fakeroot do_capture_debug() {
> +	if [ "${IMAGE_BUILD_DEBUG}" = "1" -a -n "${IMAGE_ROOTFS_DBG}" -a -d "${IMAGE_ROOTFS_DBG}" ]; then
> +		tar czf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.debug.tar.gz -C ${IMAGE_ROOTFS_DBG} .
> +		[ "${IMAGE_NAME}" == "${IMAGE_LINK_NAME}" ] || ln -sf ${IMAGE_NAME}.debug.tar.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.debug.tar.gz
> +	fi
> +}
> +
> +addtask capture_debug before do_build after do_rootfs
> diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
> index 46e8d60..e4e74dd 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -9,6 +9,8 @@ EXTRAOPKGCONFIG ?= ""
>  ROOTFS_PKGMANAGE = "opkg opkg-collateral ${EXTRAOPKGCONFIG}"
>  ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
>  
> +IMAGE_BUILD_DEBUG ?= "0"
> +
>  do_rootfs[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
>  do_rootfs[recrdeptask] += "do_package_write_ipk"
>  
> @@ -17,6 +19,7 @@ do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
>  IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} --force-overwrite"
>  # The _POST version also works when constructing the matching SDK
>  IPKG_ARGS_POST = "-f ${IPKGCONF_TARGET} -o $INSTALL_ROOTFS_IPK --force-overwrite"
> +IPKG_ARGS_DBG = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS_DBG} --force-overwrite"
>  
>  OPKG_PREPROCESS_COMMANDS = "package_update_index_ipk; package_generate_ipkg_conf"
>  
> @@ -88,6 +91,18 @@ fakeroot rootfs_ipk_do_rootfs () {
>  		fi
>  	fi
>  
> +	if [ "${IMAGE_BUILD_DEBUG}" = "1" -a -n "${IMAGE_ROOTFS_DBG}" ]; then
> +		all_pkgs=`opkg-cl ${IPKG_ARGS} list-installed | awk '{ print $1 }'`
> +		[ "${IMAGE_ROOTFS_DBG}" -ef "${IMAGE_ROOTFS}" ] || rm -rf ${IMAGE_ROOTFS_DBG}
> +		mkdir -p ${IMAGE_ROOTFS_DBG}${opkglibdir}
> +		opkg-cl ${IPKG_ARGS_DBG} update
> +		for p in $all_pkgs; do
> +	    		if [ "`opkg-cl ${IPKG_ARGS_DBG} info $p-dbg`" != "" ]; then
> +	    			opkg-cl ${IPKG_ARGS_DBG} --nodeps install $p-dbg
> +			fi
> +		done
> +	fi
> +
>  	install -d ${IMAGE_ROOTFS}/${sysconfdir}
>  	echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
>  

Hasn't Paul added a general mechanism for doing this so we could add
this feature a level higher so that it could be used by all packaging
formats?

I'm a little concerned that the different backends are getting totally
different sets of features at this point. In some cases we have very
good reasons for it but that doesn't appear to be the case here.

Cheers,

Richard




