Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Paul.Gortmaker@windriver.com>) id 1SDGyO-00035a-P1
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 17:09:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2TDB6NY004030
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Mar 2012 06:11:06 -0700 (PDT)
Received: from [128.224.146.65] (128.224.146.65) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 29 Mar 2012 06:11:07 -0700
Message-ID: <4F745F68.1090306@windriver.com>
Date: Thu, 29 Mar 2012 09:11:04 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.27) Gecko/20120216 Thunderbird/3.1.19
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333001415.git.Martin.Jansa@gmail.com>
	<4b37a73d52ca39e73b4d8230269af5d9e2d88c52.1333001415.git.Martin.Jansa@gmail.com>
In-Reply-To: <4b37a73d52ca39e73b4d8230269af5d9e2d88c52.1333001415.git.Martin.Jansa@gmail.com>
X-Originating-IP: [128.224.146.65]
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 1/2] kernel.bbclass: merge uboot_mkimage improvements from meta-oe
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
X-List-Received-Date: Thu, 29 Mar 2012 15:09:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 12-03-29 02:24 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

A commit log here would have been nice. Since it isn't apparently
clear what the improvements are to myself or others.

I especially don't understand these cases where people start manually
running mkimage vs. taking the uImage from the kernel build. If there
is magic address foo needed to make a useful uImage for the platform,
then why isn't this data in the kernel Makefiles, vs. being squirrelled
off in some recipe? At a minimum, some comments in the recipe indicating
what the need for the custom mkimage call was about, and why it differed
from the default kernel uImage would be good.

Thanks,
Paul.


> ---
>  meta/classes/kernel.bbclass |   39 +++++++++++++++++++++++----------------
>  1 files changed, 23 insertions(+), 16 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 3519e7c..8cd5fc7 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -502,32 +502,39 @@ do_sizecheck() {
>  
>  addtask sizecheck before do_install after do_compile
>  
> -KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
> -# Don't include the DATETIME variable in the sstate package signatures
> -KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
> -KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
> -
> -kernel_do_deploy() {
> -	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
> -	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
> -		tar -cvzf ${DEPLOYDIR}/modules-${KERNEL_VERSION}-${PR}-${MACHINE}.tgz -C ${D} lib
> -	fi
> -
> +do_uboot_mkimage() {
>  	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
> -		if test -e arch/${ARCH}/boot/uImage ; then
> -			cp arch/${ARCH}/boot/uImage ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
> -		elif test -e arch/${ARCH}/boot/compressed/vmlinux ; then
> +		ENTRYPOINT=${UBOOT_ENTRYPOINT}
> +		if test -n "${UBOOT_ENTRYSYMBOL}"; then
> +			ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
> +				awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
> +		fi
> +		if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
>  			${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
> -			uboot-mkimage -A ${ARCH} -O linux -T kernel -C none -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
> +			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
>  			rm -f linux.bin
>  		else
>  			${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
>  			rm -f linux.bin.gz
>  			gzip -9 linux.bin
> -			uboot-mkimage -A ${ARCH} -O linux -T kernel -C gzip -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
> +			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
>  			rm -f linux.bin.gz
>  		fi
>  	fi
> +}
> +
> +addtask uboot_mkimage before do_install after do_compile
> +
> +KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
> +# Don't include the DATETIME variable in the sstate package signatures
> +KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
> +KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
> +
> +kernel_do_deploy() {
> +	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
> +	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
> +		tar -cvzf ${DEPLOYDIR}/modules-${KERNEL_VERSION}-${PR}-${MACHINE}.tgz -C ${D} lib
> +	fi
>  
>  	cd ${DEPLOYDIR}
>  	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin


