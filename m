Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web11.5023.1630049101268045508
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 00:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=F3SrXM1N;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mJWEU-0006Md-Kl; Fri, 27 Aug 2021 09:24:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YnEZMLrie625Z9hgizxdVSrH+8190vdyIvlDb8lntyw=; b=F3SrXM1Nn2q85MpWd7SspKZRrH
	ND9fqLQOcTag0VGItZWaciguaN5aVcG21y0bE2Crmw00NO/jSzhEg5xERB9pTUuH3lRn24VanvvvS
	smPpqiznxZ8oAKZgzJr8dIxFmLh7ARd0s2hPOMxeVT79nXRfwzFVG2xKCvJYjBhuUa0h1TUuJeao6
	6ow4FJyQdVy4HvAhX9y6l0wtEyQYWNDYC0ZgLRGI+4lBPRDFXW8jPt/2Km/lvZ3WX9g3iKgaEaTw/
	hA2ueCHDe309UCOjiVJKgNbiqHjScCx4BMsOrROZEVBFEctq8QAyc0SyRI5dPS/IKEWapPuivuEce
	pmyv0dHg==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mJWEQ-0002BT-4q; Fri, 27 Aug 2021 09:24:56 +0200
Subject: Re: [OE-core] [PATCH v3 4/4] Support zstd-compressed squashfs and cpio initramfs
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: zboszor@gmail.com
References: <20210823144712.101597-1-zboszor@pr.hu>
 <20210823145450.103319-1-zboszor@pr.hu>
 <20210823145450.103319-6-zboszor@pr.hu>
 <a789a2eaa7233e3a92e9409793d431e70c2ff5b7.camel@linuxfoundation.org>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Message-ID: <fc432aa2-2ee8-743d-5b1b-fac6349ae878@pr.hu>
Date: Fri, 27 Aug 2021 09:24:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a789a2eaa7233e3a92e9409793d431e70c2ff5b7.camel@linuxfoundation.org>
X-Spam-Score: -1.1 (-)
X-Scan-Signature: f74a0229e285e288c9f021a176fb3ee2
X-Spam-Tracer: backend.mail.pr.hu -1.1 20210827072456Z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Yeah, squashfs-tools needs PACKAGECONFIG = "zstd" by default.
I will send an updated series soon with this patch updated.

2021. 08. 26. 14:04 keltezéssel, Richard Purdie írta:
> On Mon, 2021-08-23 at 16:54 +0200, Zoltan Boszormenyi via lists.openembedded.org
> wrote:
>> From: Zoltán Böszörményi <zboszor@gmail.com>
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   meta/classes/base.bbclass            |  4 ++++
>>   meta/classes/image_types.bbclass     |  6 ++++--
>>   meta/classes/kernel-fitimage.bbclass |  2 +-
>>   meta/classes/kernel.bbclass          | 10 ++++++++--
>>   4 files changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>> index 11b65171d9..340ebe7d78 100644
>> --- a/meta/classes/base.bbclass
>> +++ b/meta/classes/base.bbclass
>> @@ -631,6 +631,10 @@ python () {
>>           if path.endswith('.lz4'):
>>               d.appendVarFlag('do_unpack', 'depends', ' lz4-native:do_populate_sysroot')
>>   
>> +        # *.zst should DEPEND on zstd-native for unpacking
>> +        elif path.endswith('.zst'):
>> +            d.appendVarFlag('do_unpack', 'depends', ' zstd-native:do_populate_sysroot')
>> +
>>           # *.lz should DEPEND on lzip-native for unpacking
>>           elif path.endswith('.lz'):
>>               d.appendVarFlag('do_unpack', 'depends', ' lzip-native:do_populate_sysroot')
>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
>> index e0eb06c1e3..32d4cd4c76 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -107,6 +107,7 @@ IMAGE_CMD:squashfs = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${
>>   IMAGE_CMD:squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-xz ${EXTRA_IMAGECMD} -noappend -comp xz"
>>   IMAGE_CMD:squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-lzo ${EXTRA_IMAGECMD} -noappend -comp lzo"
>>   IMAGE_CMD:squashfs-lz4 = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-lz4 ${EXTRA_IMAGECMD} -noappend -comp lz4"
>> +IMAGE_CMD:squashfs-zst = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-zst ${EXTRA_IMAGECMD} -noappend -comp zstd"
>>   
>>   IMAGE_CMD:erofs = "mkfs.erofs ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs ${IMAGE_ROOTFS}"
>>   IMAGE_CMD:erofs-lz4 = "mkfs.erofs -zlz4 ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs-lz4 ${IMAGE_ROOTFS}"
>> @@ -244,6 +245,7 @@ do_image_squashfs[depends] += "squashfs-tools-native:do_populate_sysroot"
>>   do_image_squashfs_xz[depends] += "squashfs-tools-native:do_populate_sysroot"
>>   do_image_squashfs_lzo[depends] += "squashfs-tools-native:do_populate_sysroot"
>>   do_image_squashfs_lz4[depends] += "squashfs-tools-native:do_populate_sysroot"
>> +do_image_squashfs_zst[depends] += "squashfs-tools-native:do_populate_sysroot"
>>   do_image_ubi[depends] += "mtd-utils-native:do_populate_sysroot"
>>   do_image_ubifs[depends] += "mtd-utils-native:do_populate_sysroot"
>>   do_image_multiubi[depends] += "mtd-utils-native:do_populate_sysroot"
>> @@ -262,10 +264,10 @@ IMAGE_TYPES = " \
>>       btrfs \
>>       iso \
>>       hddimg \
>> -    squashfs squashfs-xz squashfs-lzo squashfs-lz4 \
>> +    squashfs squashfs-xz squashfs-lzo squashfs-lz4 squashfs-zst \
>>       ubi ubifs multiubi \
>>       tar tar.gz tar.bz2 tar.xz tar.lz4 tar.zst \
>> -    cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
>> +    cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 cpio.zst \
>>       wic wic.gz wic.bz2 wic.lzma wic.zst \
>>       container \
>>       f2fs \
>> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
>> index 2ef8f06b14..38e05153e3 100644
>> --- a/meta/classes/kernel-fitimage.bbclass
>> +++ b/meta/classes/kernel-fitimage.bbclass
>> @@ -576,7 +576,7 @@ fitimage_assemble() {
>>   	#
>>   	if [ "x${ramdiskcount}" = "x1" ] && [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
>>   		# Find and use the first initramfs image archive type we find
>> -		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz ext2.gz cpio; do
>> +		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst cpio.gz ext2.gz cpio; do
>>   			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.${img}"
>>   			echo "Using $initramfs_path"
>>   			if [ -e "${initramfs_path}" ]; then
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 9ec7daa17a..ab60e060c6 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -9,6 +9,7 @@ PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel
>>   DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native bison-native"
>>   DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lzop-native", "", d)}"
>>   DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"
>> +DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.zst", "zstd-native", "", d)}"
>>   PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
>>   
>>   do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot gzip-native:do_populate_sysroot"
>> @@ -237,7 +238,7 @@ copy_initramfs() {
>>   	mkdir -p ${B}/usr
>>   	# Find and use the first initramfs image archive type we find
>>   	rm -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
>> -	for img in cpio cpio.gz cpio.lz4 cpio.lzo cpio.lzma cpio.xz; do
>> +	for img in cpio cpio.gz cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst; do
>>   		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img" ]; then
>>   			cp ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img ${B}/usr/.
>>   			case $img in
>> @@ -266,12 +267,17 @@ copy_initramfs() {
>>   				xz -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
>>   				break
>>   				;;
>> +			*zst)
>> +				echo "zst decompressing image"
>> +				zstd -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
>> +				break
>> +				;;
>>   			esac
>>   			break
>>   		fi
>>   	done
>>   	# Verify that the above loop found a initramfs, fail otherwise
>> -	[ -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio ] && echo "Finished copy of initramfs into ./usr" || die "Could not find any ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.cpio{.gz|.lz4|.lzo|.lzma|.xz) for bundling; INITRAMFS_IMAGE_NAME might be wrong."
>> +	[ -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio ] && echo "Finished copy of initramfs into ./usr" || die "Could not find any ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.cpio{.gz|.lz4|.lzo|.lzma|.xz|.zst) for bundling; INITRAMFS_IMAGE_NAME might be wrong."
>>   }
> 
> Failed in testing:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2467/steps/14/logs/stdio
> 
> "mksquashfs: Compressor "zstd" is not supported!"
> 
> Cheers,
> 
> Richard
> 
> 
> 
> 
> 

