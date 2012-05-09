Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SSGS5-0002fc-Gi
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 01:37:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 May 2012 16:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141123082"
Received: from unknown (HELO [10.255.12.218]) ([10.255.12.218])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2012 16:27:55 -0700
Message-ID: <4FAAFD7A.7060702@linux.intel.com>
Date: Wed, 09 May 2012 16:27:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1336365869-12720-1-git-send-email-b28495@freescale.com>
In-Reply-To: <1336365869-12720-1-git-send-email-b28495@freescale.com>
Subject: Re: [PATCH] image_types.bbclass: redefine EXTRA_IMAGECMD_jffs2 to leverage siteinfo
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
X-List-Received-Date: Wed, 09 May 2012 23:37:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/06/2012 09:44 PM, b28495@freescale.com wrote:
> From: Ting Liu<b28495@freescale.com>
>
> Signed-off-by: Ting Liu<b28495@freescale.com>
> ---
>   meta/classes/image_types.bbclass |    7 ++++++-
>   1 files changed, 6 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index b590ae1..55f122e 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -188,7 +188,12 @@ IMAGE_CMD_ubi () {
>   IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}"
>
>   EXTRA_IMAGECMD = ""
> -EXTRA_IMAGECMD_jffs2 ?= "--pad --little-endian --eraseblock=0x40000"
> +
> +inherit siteinfo
> +JFFS2_ENDIANNESS ?= "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--little-endian', '--big-endian', d)}"
> +JFFS2_ERASEBLOCK ?= "0x40000"
> +EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
> +
>   # Change these if you want default genext2fs behavior (i.e. create minimal inode number)
>   EXTRA_IMAGECMD_ext2 ?= "-i 8192"
>   EXTRA_IMAGECMD_ext3 ?= "-i 8192"

Merged into OE-Core

Thanks
	Sau!


