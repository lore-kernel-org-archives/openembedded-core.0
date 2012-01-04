Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiEVA-0002a3-Ov
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 01:14:44 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jan 2012 16:07:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102881309"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jan 2012 16:07:09 -0800
Message-ID: <4F03982D.1080601@linux.intel.com>
Date: Tue, 03 Jan 2012 16:07:09 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <fbed4e9f94ed9bd1bb5a9c8fa37113e325f89371.1325115602.git.dvhart@linux.intel.com>
	<4EFBAC18.3040909@intel.com>
In-Reply-To: <4EFBAC18.3040909@intel.com>
Cc: Darren Hart <darren.hart@intel.com>
Subject: Re: [PATCH] image_types: Ensure /init exists for cpio rootfs archives
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
X-List-Received-Date: Wed, 04 Jan 2012 00:14:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/28/2011 03:54 PM, Darren Hart wrote:
> <I sent this to the yocto list by mistake, forwarding here for comment>
>
> In order for the kernel to accept an initramfs as a rootfs,
> it must have /init - even if it is an empty file. Touch /init
> to ensure it exists for cpio and cpio.gz image types.
>
> When used with initrd and rootfs=/dev/ram0, this allows the
> cpio and cpio.gz images to be used as the rootfs.
>
> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
> ---
>   meta/classes/image_types.bbclass |   10 ++++++++--
>   1 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 6893e38..ebff0ba 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -110,8 +110,14 @@ IMAGE_CMD_tar = "cd ${IMAGE_ROOTFS}&&  tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME
>   IMAGE_CMD_tar.gz = "cd ${IMAGE_ROOTFS}&&  tar -zcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.gz ."
>   IMAGE_CMD_tar.bz2 = "cd ${IMAGE_ROOTFS}&&  tar -jcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.bz2 ."
>   IMAGE_CMD_tar.xz = "cd ${IMAGE_ROOTFS}&&  tar --xz -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.xz ."
> -IMAGE_CMD_cpio = "cd ${IMAGE_ROOTFS}&&  (find . | cpio -o -H newc>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)"
> -IMAGE_CMD_cpio.gz = "cd ${IMAGE_ROOTFS}&&  (find . | cpio -o -H newc | gzip -c -9>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz)"
> +IMAGE_CMD_cpio () {
> +	touch ${IMAGE_ROOTFS}/init
> +	cd ${IMAGE_ROOTFS}&&  (find . | cpio -o -H newc>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
> +}
> +IMAGE_CMD_cpio.gz () {
> +	touch ${IMAGE_ROOTFS}/init
> +	cd ${IMAGE_ROOTFS}&&  (find . | cpio -o -H newc | gzip -c -9>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz)
> +}
>   IMAGE_CMD_cpio.xz = "type cpio>/dev/null; cd ${IMAGE_ROOTFS}&&  (find . | cpio -o -H newc | xz -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK}>  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.xz) ${EXTRA_IMAGECMD}"
>   IMAGE_CMD_cpio.lzma = "type cpio>/dev/null; cd ${IMAGE_ROOTFS}&&  (find . | cpio -o -H newc | xz --format=lzma -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK}>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}"
>

This merged as is to OE-Core.

Based on other emails, I will expect some update patch to address 
Andrea's comments.

Thanks
	Sau!


