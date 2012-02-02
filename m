Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rt0xN-0000n3-WC
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 19:00:26 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2012 09:52:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113364567"
Received: from unknown (HELO [10.255.14.238]) ([10.255.14.238])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2012 09:52:28 -0800
Message-ID: <4F2ACD5C.6000409@linux.intel.com>
Date: Thu, 02 Feb 2012 09:52:28 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1327561790-10307-1-git-send-email-andrea.adami@gmail.com>
In-Reply-To: <1327561790-10307-1-git-send-email-andrea.adami@gmail.com>
Subject: Re: [PATCH 2/2] image_types.bbclass: refactor cpio images generation.
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
X-List-Received-Date: Thu, 02 Feb 2012 18:00:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/25/2012 11:09 PM, Andrea Adami wrote:
> * Add common check for the presence of an /init
> * symlink, being 'touch' would fail with it
> * and 'touch -h' is not yet generally supported
> * (depends on distro on build host).
>
> Signed-off-by: Andrea Adami<andrea.adami@gmail.com>
> ---
>   meta/classes/image_types.bbclass |   21 +++++++++++++++++----
>   1 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 4908ed9..eef554d 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -115,16 +115,29 @@ IMAGE_CMD_tar = "cd ${IMAGE_ROOTFS}&&  tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME
>   IMAGE_CMD_tar.gz = "cd ${IMAGE_ROOTFS}&&  tar -zcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.gz ."
>   IMAGE_CMD_tar.bz2 = "cd ${IMAGE_ROOTFS}&&  tar -jcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.bz2 ."
>   IMAGE_CMD_tar.xz = "cd ${IMAGE_ROOTFS}&&  tar --xz -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.xz ."
> -IMAGE_CMD_cpio () {
> +
> +CPIO_TOUCH_INIT () {
> +	if [ ! -L ${IMAGE_ROOTFS}/init ]
> +	then
>   	touch ${IMAGE_ROOTFS}/init
> +	fi
> +}
> +IMAGE_CMD_cpio () {
> +	${CPIO_TOUCH_INIT}
>   	cd ${IMAGE_ROOTFS}&&  (find . | cpio -o -H newc>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
>   }
>   IMAGE_CMD_cpio.gz () {
> -	touch ${IMAGE_ROOTFS}/init
> +	${CPIO_TOUCH_INIT}
>   	cd ${IMAGE_ROOTFS}&&  (find . | cpio -o -H newc | gzip -c -9>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz)
>   }
> -IMAGE_CMD_cpio.xz = "type cpio>/dev/null; cd ${IMAGE_ROOTFS}&&  (find . | cpio -o -H newc | xz -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK}>  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.xz) ${EXTRA_IMAGECMD}"
> -IMAGE_CMD_cpio.lzma = "type cpio>/dev/null; cd ${IMAGE_ROOTFS}&&  (find . | cpio -o -H newc | xz --format=lzma -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK}>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}"
> +IMAGE_CMD_cpio.xz () {
> +	${CPIO_TOUCH_INIT}
> +	cd ${IMAGE_ROOTFS}&&  (find . | cpio -o -H newc | xz -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK}>  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.xz) ${EXTRA_IMAGECMD}
> +}
> +IMAGE_CMD_cpio.lzma () {
> +	${CPIO_TOUCH_INIT}
> +	cd ${IMAGE_ROOTFS}&&  (find . | cpio -o -H newc | xz --format=lzma -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK}>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}
> +}
>
>   UBI_VOLNAME ?= "${MACHINE}-rootfs"
>

Merged into OE-core

Thanks
	Sau!


