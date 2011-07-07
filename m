Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QeyDU-0002mp-EH for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 01:42:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67Ncsgg012810
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 00:38:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12733-03 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 00:38:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67NcfV7012804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 00:38:41 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <c55e57619344a0ddff4444e1a4403c9516089e5b.1310081443.git.sgw@linux.intel.com>
References: <cover.1310081443.git.sgw@linux.intel.com>
	<c55e57619344a0ddff4444e1a4403c9516089e5b.1310081443.git.sgw@linux.intel.com>
Date: Fri, 08 Jul 2011 00:38:02 +0100
Message-ID: <1310081883.20015.862.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/8] rootfs_rpm: Add 50Meg to image size for zypper
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
X-List-Received-Date: Thu, 07 Jul 2011 23:42:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-07 at 16:31 -0700, Saul Wold wrote:
> [YOCTO #1171]
> 
> Add /var space for zypper due to its space usage for db maintence

This hasn't been tested for opkg/deb and is missing something like:

ZYPPER_VAR_DB_SPACE ??= 0

I'd suggest we just change this to append " + 51200" to
IMAGE_ROOTFS_EXTRA_SPACE. I'd also like this only to happen when we're
actually installing zypper so the minimal images are unaffected...

Cheers,

Richard





> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/image_types.bbclass |    2 +-
>  meta/classes/rootfs_rpm.bbclass  |    5 +++++
>  2 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 8c86227..505342d 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -13,7 +13,7 @@ def get_imagecmds(d):
>  
>  runimagecmd () {
>  	# Image generation code for image type ${type}
> -	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = $1 * ${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_EXTRA_SPACE}; OFMT = "%.0f" ; print (size > ${IMAGE_ROOTFS_SIZE} ? size : ${IMAGE_ROOTFS_SIZE}) }'`
> +	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = $1 * ${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_EXTRA_SPACE} + ${ZYPPER_VAR_DB_SPACE}; OFMT = "%.0f" ; print (size > ${IMAGE_ROOTFS_SIZE} ? size : ${IMAGE_ROOTFS_SIZE}) }'`
>  	${cmd}
>  	cd ${DEPLOY_DIR_IMAGE}/
>  	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${type}
> diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
> index 3a11858..67c547f 100644
> --- a/meta/classes/rootfs_rpm.bbclass
> +++ b/meta/classes/rootfs_rpm.bbclass
> @@ -3,6 +3,10 @@
>  #
>  
>  ROOTFS_PKGMANAGE = "rpm zypper"
> +
> +# Add 50Meg of extra space for zypper database space
> +ZYPPER_VAR_DB_SPACE = "51200"
> +
>  # Postinstalls on device are handled within this class at present
>  ROOTFS_PKGMANAGE_BOOTSTRAP = ""
>  
> @@ -101,6 +105,7 @@ EOF
>  	export IPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
>  	export OPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
>  
> +
>  	${ROOTFS_POSTINSTALL_COMMAND}
>  
>  	mkdir -p ${IMAGE_ROOTFS}/etc/rpm-postinsts/




