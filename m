Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1SDGGy-0002AS-BE
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 16:24:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2TEFEFV017248
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Mar 2012 07:15:14 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 29 Mar 2012 07:15:15 -0700
Message-ID: <4F746E6D.2070703@windriver.com>
Date: Thu, 29 Mar 2012 10:15:09 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333028738.git.Martin.Jansa@gmail.com>
	<95ae402382812a107254fa222cf9694f502927b3.1333028738.git.Martin.Jansa@gmail.com>
In-Reply-To: <95ae402382812a107254fa222cf9694f502927b3.1333028738.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCHv2 1/2] kernel.bbclass: merge uboot_mkimage improvements from meta-oe
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
X-List-Received-Date: Thu, 29 Mar 2012 14:24:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-03-29 10:08 AM, Martin Jansa wrote:
> * allows to detect ENTRYPOINT from kernel binary marked with UBOOT_ENTRYSYMBOL
>    used e.g. by ben-nanonote

Nice to see the big benefit called out, definitely helps the
casual reader :)

Looks like we've got all the use cases preserved, so I have no objections.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Cheers,

Bruce

>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/classes/kernel.bbclass |   41 +++++++++++++++++++++++++----------------
>   1 files changed, 25 insertions(+), 16 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 3519e7c..0ae9bed 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -507,28 +507,37 @@ KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}-${DATETIME
>   KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
>   KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
>
> +do_uboot_mkimage() {
> +	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then
> +		if test ! -e arch/${ARCH}/boot/uImage ; then
> +			ENTRYPOINT=${UBOOT_ENTRYPOINT}
> +			if test -n "${UBOOT_ENTRYSYMBOL}"; then
> +				ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
> +					awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
> +			fi
> +			if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
> +				${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
> +				uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
> +				rm -f linux.bin
> +			else
> +				${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
> +				rm -f linux.bin.gz
> +				gzip -9 linux.bin
> +				uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
> +				rm -f linux.bin.gz
> +			fi
> +		fi
> +	fi
> +}
> +
> +addtask uboot_mkimage before do_install after do_compile
> +
>   kernel_do_deploy() {
>   	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
>   	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
>   		tar -cvzf ${DEPLOYDIR}/modules-${KERNEL_VERSION}-${PR}-${MACHINE}.tgz -C ${D} lib
>   	fi
>
> -	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then
> -		if test -e arch/${ARCH}/boot/uImage ; then
> -			cp arch/${ARCH}/boot/uImage ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
> -		elif test -e arch/${ARCH}/boot/compressed/vmlinux ; then
> -			${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
> -			uboot-mkimage -A ${ARCH} -O linux -T kernel -C none -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
> -			rm -f linux.bin
> -		else
> -			${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
> -			rm -f linux.bin.gz
> -			gzip -9 linux.bin
> -			uboot-mkimage -A ${ARCH} -O linux -T kernel -C gzip -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
> -			rm -f linux.bin.gz
> -		fi
> -	fi
> -
>   	cd ${DEPLOYDIR}
>   	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
>   	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin



