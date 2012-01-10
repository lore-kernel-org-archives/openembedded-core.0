Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RkUbZ-0003Wg-6X
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 06:50:41 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2012 21:43:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105361338"
Received: from unknown (HELO [10.255.13.28]) ([10.255.13.28])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jan 2012 21:43:11 -0800
Message-ID: <4F0BCFEF.7000207@linux.intel.com>
Date: Mon, 09 Jan 2012 21:43:11 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326080274-1998-1-git-send-email-b19537@freescale.com>
In-Reply-To: <1326080274-1998-1-git-send-email-b19537@freescale.com>
Subject: Re: [PATCH oe-core v6] linux-dtb: add multi-dtb build support and keep dtb in deploy cache package
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
X-List-Received-Date: Tue, 10 Jan 2012 05:50:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/08/2012 07:37 PM, b19537@freescale.com wrote:
> From: Zhenhua Luo<b19537@freescale.com>
>
> Signed-off-by: Zhenhua Luo<b19537@freescale.com>
> ---
>   meta/recipes-kernel/linux/linux-dtb.inc |   24 +++++++++++++++---------
>   1 files changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
> index 7ec7584..fc29d14 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -13,15 +13,21 @@ python __anonymous () {
>   	d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
>   }
>
I am not sure how this worked, I am seeing a problem with building rootfs.
| 	

kernel-devicetree is needed by 
kernel-modules-3.0.14+git1+6ae3d992cf546184010e87a0349810198f1d167c_1+58ffdb8000e34d2ba7c3ef278b26680b0886e8b5-r2.mpc8315e_rdb

This might be a PR Bump issue?

Sau!

> -do_install_append() {
> +kernel_do_deploy_append() {
>       if test -n "${KERNEL_DEVICETREE}"; then
> -	dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree ${KERNEL_DEVICETREE}
> -	install -m 0644 devicetree ${D}/boot/devicetree-${KERNEL_VERSION}
> -	install -d ${DEPLOY_DIR_IMAGE}
> -	install -m 0644 devicetree ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.dtb
> -	cd ${DEPLOY_DIR_IMAGE}
> -	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
> -	ln -sf ${KERNEL_IMAGE_BASE_NAME}.dtb ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
> +        for DTS_FILE in ${KERNEL_DEVICETREE}; do
> +            DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
> +            DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> +            DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> +            dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree ${DTS_FILE}
> +            install -m 0644 devicetree ${D}/boot/devicetree-${DTS_BASE_NAME}-${KERNEL_VERSION}
> +
> +            install -d ${DEPLOYDIR}
> +            install -m 0644 devicetree ${DEPLOYDIR}/${DTB_NAME}.dtb
> +            rm -f devicetree
> +            cd ${DEPLOYDIR}
> +            ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
> +            cd -
> +        done
>       fi
>   }
> -


