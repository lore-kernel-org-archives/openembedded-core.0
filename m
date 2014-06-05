Return-Path: <Yanjun.Zhu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 11EC36B232
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jun 2014 05:11:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s555BFCc016400
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Jun 2014 22:11:15 -0700 (PDT)
Received: from [128.224.162.201] (128.224.162.201) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Wed, 4 Jun 2014 22:11:15 -0700
Message-ID: <538FFBF2.4010301@windriver.com>
Date: Thu, 5 Jun 2014 13:11:14 +0800
From: yzhu1 <Yanjun.Zhu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>, <joaohf@gmail.com>
References: <1390459814-15764-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1390459814-15764-1-git-send-email-sgw@linux.intel.com>
X-Originating-IP: [128.224.162.201]
Subject: Re: [PATCH] boot-directdisk: fix the support of vmdk
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jun 2014 05:11:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Saul

Sorry. I do not understand. What does the patch fix? After this patch is 
applied, what is the difference?

Zhu Yanjun
On 01/23/2014 02:50 PM, Saul Wold wrote:
> From: Joao Henrique Ferreira de Freitas <joaohf@gmail.com>
>
> Previous change (086ce22b88f5ef5f75a83119a32c8b3fdcfa296d) broke
> the creating of vmdk images. This protects shell expansion variables
> and let dd generate the image to be transformed to vmdk by image-vmdk.class.
>
> Signed-off-by: Joao Henrique Ferreira de Freitas <joaohf@gmail.com>
>
> [edit to change the usage of IMAGE_FSTYPE to IS_VMDK]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/classes/boot-directdisk.bbclass | 18 ++++++++----------
>   1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
> index 3277666..afab843 100644
> --- a/meta/classes/boot-directdisk.bbclass
> +++ b/meta/classes/boot-directdisk.bbclass
> @@ -61,6 +61,8 @@ DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
>   SYSLINUX_ROOT ?= "root=/dev/sda2"
>   SYSLINUX_TIMEOUT ?= "10"
>   
> +IS_VMDK = '${@base_contains("IMAGE_FSTYPES", "vmdk", "true", "false", d)}'
> +
>   boot_direct_populate() {
>   	dest=$1
>   	install -d $dest
> @@ -88,10 +90,10 @@ build_boot_dd() {
>   		grubefi_hddimg_populate $HDDDIR
>   	fi
>   
> -	if [ ${IMAGE_FSTYPE} = "vmdk" ]; then
> -		if [ x${AUTO_SYSLINUXMENU} = x1 ] ; then
> +	if [ "${IS_VMDK}" ]; then
> +		if [ "x${AUTO_SYSLINUXMENU}" = "x1" ] ; then
>   			install -m 0644 ${STAGING_DIR}/${MACHINE}/usr/share/syslinux/vesamenu.c32 ${HDDDIR}${SYSLINUXDIR}/vesamenu.c32
> -			if [ x${SYSLINUX_SPLASH} != x ] ; then
> +			if [ "x${SYSLINUX_SPLASH}" != "x" ] ; then
>   				install -m 0644 ${SYSLINUX_SPLASH} ${HDDDIR}${SYSLINUXDIR}/splash.lss
>   			fi
>   		fi
> @@ -129,9 +131,7 @@ build_boot_dd() {
>   	parted $IMAGE unit B mkpart primary ext2 ${END2}B ${END3}B
>   	parted $IMAGE set 1 boot on
>   
> -	if [ ${IMAGE_FSTYPE} != "vmdk" ]; then
> -		parted $IMAGE print
> -	fi
> +	parted $IMAGE print
>   
>   	awk "BEGIN { printf \"$(echo ${DISK_SIGNATURE} | fold -w 2 | tac | paste -sd '' | sed 's/\(..\)/\\x&/g')\" }" | \
>   		dd of=$IMAGE bs=1 seek=440 conv=notrunc
> @@ -141,10 +141,8 @@ build_boot_dd() {
>   		dd if=${STAGING_DATADIR}/syslinux/mbr.bin of=$IMAGE conv=notrunc
>   	fi
>   
> -	if [ ${IMAGE_FSTYPE} != "vmdk" ]; then
> -		dd if=$HDDIMG of=$IMAGE conv=notrunc seek=1 bs=512
> -		dd if=${ROOTFS} of=$IMAGE conv=notrunc seek=$OFFSET bs=512	
> -	fi
> +	dd if=$HDDIMG of=$IMAGE conv=notrunc seek=1 bs=512
> +	dd if=${ROOTFS} of=$IMAGE conv=notrunc seek=$OFFSET bs=512
>   
>   	cd ${DEPLOY_DIR_IMAGE}
>   	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect


