Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S3Gjt-0007na-Oq
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 01:52:53 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Mar 2012 16:44:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113582863"
Received: from unknown (HELO [10.255.15.82]) ([10.255.15.82])
	by azsmga001.ch.intel.com with ESMTP; 01 Mar 2012 16:44:21 -0800
Message-ID: <4F5017E5.1020501@linux.intel.com>
Date: Thu, 01 Mar 2012 16:44:21 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1330635344-27411-1-git-send-email-ken.werner@linaro.org>
In-Reply-To: <1330635344-27411-1-git-send-email-ken.werner@linaro.org>
Cc: Ken Werner <ken.werner@linaro.org>
Subject: Re: [PATCH] image_types: add IMAGE_ROOTFS_ALIGNMENT
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
X-List-Received-Date: Fri, 02 Mar 2012 00:52:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2012 12:55 PM, Ken Werner wrote:
> Introduce a new variable called IMAGE_ROOTFS_ALIGNMENT that allows to control
> the aligment of the size of the rootfs. Its default value is set to 1KiB so
> that the existing behaviour is not changed. In case the SD card emulation of
> a QEMU system emulator gets used you may set the alignment to 2MiB.
> ---
>   meta/classes/image_types.bbclass |   12 +++++++++++-
>   1 files changed, 11 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index f756c39..314d6d1 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -55,9 +55,19 @@ def get_imagecmds(d):
>           cmds += "\n" + localdata.getVar("runimagecmd", True)
>       return cmds
>
> +# The default aligment of the size of the rootfs is set to 1KiB. In case
> +# you're using the SD card emulation of a QEMU system simulator you may
> +# set this value to 2048 (2MiB alignment).
> +IMAGE_ROOTFS_ALIGNMENT ?= "1"
> +
>   runimagecmd () {
>   	# Image generation code for image type ${type}
> -	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{base_size = ($1 * ${IMAGE_OVERHEAD_FACTOR});  OFMT = "%.0f" ; print ((base_size>  ${IMAGE_ROOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) + ${IMAGE_ROOTFS_EXTRA_SPACE}) }'`
> +	# The base_size gets calculated:
> +	#  - initial size determined by `du -ks` of the IMAGE_ROOTFS
> +	#  - then multiplied by the IMAGE_OVERHEAD_FACTOR
> +	#  - then rounded up to IMAGE_ROOTFS_ALIGNMENT
> +	#  - finally tested against IMAGE_ROOTFS_SIZE
> +	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{base_size = $1 * ${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_ALIGNMENT} - 1; base_size -= base_size % ${IMAGE_ROOTFS_ALIGNMENT}; print ((base_size>  ${IMAGE_ROOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) + ${IMAGE_ROOTFS_EXTRA_SPACE}) }'`
>   	${cmd}
Is there a reason you removed the OFMT from this line?

Sau!

>   	# Now create the needed compressed versions
>   	cd ${DEPLOY_DIR_IMAGE}/


