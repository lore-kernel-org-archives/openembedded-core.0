Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SquGt-0003or-6W
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 01:00:07 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2012 15:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193615231"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2012 15:48:47 -0700
Message-ID: <50049A4F.2040100@linux.intel.com>
Date: Mon, 16 Jul 2012 15:48:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1340682796-11569-1-git-send-email-b19537@freescale.com>
In-Reply-To: <1340682796-11569-1-git-send-email-b19537@freescale.com>
Subject: Re: linux-dtb: add multi-dtb build support
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
X-List-Received-Date: Mon, 16 Jul 2012 23:00:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/25/2012 08:53 PM, b19537@freescale.com wrote:
> From: Zhenhua Luo <b19537@freescale.com>
>
>      including following enhancement:
>      * support multi-dtb build
>      * skip dtb build and install when KERNEL_DEVICETREE is empty
>      * print a warning message when specified dts file is not available
>
> Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> ---
>   meta/recipes-kernel/linux/linux-dtb.inc |   36 +++++++++++++++++++++++++------
>   1 files changed, 29 insertions(+), 7 deletions(-)
>
This patch appears to rename the .dtb file different than it did before 
this change.  Is that correct?

Seem to change it from:

uImage-mpc8315e-rdb.dtb

to

uImage-mpc8315erdb.dtb

While the .bin file is still: uImage-mpc8315e-rdb.bin

Inquiring minds??  This was filed as bug 2769

https://bugzilla.yoctoproject.org/show_bug.cgi?id=2769

Thanks
Sau!


> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
> index 9188cee..8aa1458 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -15,13 +15,35 @@ python __anonymous () {
>
>   do_install_append() {
>       if test -n "${KERNEL_DEVICETREE}"; then
> -	dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree ${KERNEL_DEVICETREE}
> -	install -m 0644 devicetree ${D}/boot/devicetree-${KERNEL_VERSION}
> -	install -d ${DEPLOYDIR}
> -	install -m 0644 devicetree ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.dtb
> -	cd ${DEPLOYDIR}
> -	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
> -	ln -sf ${KERNEL_IMAGE_BASE_NAME}.dtb ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
> +        for DTS_FILE in ${KERNEL_DEVICETREE}; do
> +            if [ ! -f ${DTS_FILE} ]; then
> +                echo "Warning: ${DTS_FILE} is not available!"
> +                continue
> +            fi
> +            DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
> +            DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> +            DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> +            dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o ${DTS_BASE_NAME} ${DTS_FILE}
> +            install -m 0644 ${DTS_BASE_NAME} ${D}/boot/devicetree-${DTB_SYMLINK_NAME}.dtb
> +        done
>       fi
>   }
>
> +do_deploy_append() {
> +    if test -n "${KERNEL_DEVICETREE}"; then
> +        for DTS_FILE in ${KERNEL_DEVICETREE}; do
> +            if [ ! -f ${DTS_FILE} ]; then
> +                echo "Warning: ${DTS_FILE} is not available!"
> +                continue
> +            fi
> +            DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
> +            DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> +            DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> +            install -d ${DEPLOYDIR}
> +            install -m 0644 ${B}/${DTS_BASE_NAME} ${DEPLOYDIR}/${DTB_NAME}.dtb
> +            cd ${DEPLOYDIR}
> +            ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
> +            cd -
> +        done
> +    fi
> +}
>



