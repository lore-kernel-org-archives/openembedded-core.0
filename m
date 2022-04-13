Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AE4C38162
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:07 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.3510.1649834315235273077
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 00:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=Z8EB78vb;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from [10.88.0.104]
 (dslb-084-057-071-010.084.057.pools.vodafone-ip.de [84.57.71.10])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id C19B1810E6;
	Wed, 13 Apr 2022 09:18:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1649834312;
	bh=0b/r6uQ4A2NLZDzXMc3lYvDO+hqywfJgEH+BCOKwLv8=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
	b=Z8EB78vbFmUaur4krLRIz9kqWt1a8CC46Fwygqako7T8rIOwvy7lKGz6YtQQ0JpeT
	 VLA5WIVT4din5y0bYUz6wlMV2NA0uORgxEGThOpl6J2CQJNUS3bqH90SBvGyRK8XMR
	 zof7AeyQPAtHDVRyCBXpyqRgg3KV6JlfChsCZBO2ntTX5TevXkMGf72e3+a51nbT2m
	 0hrej9c61d0D2MBWslN/s3g+m/lpCrb6K8XXSiG6KUd0+V5LmClE/Kx41cg3ez8yjd
	 4IQtzgDt6ewAETKaYN6gJS7CpUwfqOwodaKkSvc9F0eWMkraba7KpymYBMckeee/CC
	 uQF3k2JzOwvdQ==
Message-ID: <ec096923-51a9-5407-9836-689c3ac2d4d2@denx.de>
Date: Wed, 13 Apr 2022 09:18:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 1/1] kernel: add kernel-image-fitimage-initramfs
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220330091522.795083-1-ch@denx.de>
 <20220330091522.795083-2-ch@denx.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
From: Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
In-Reply-To: <20220330091522.795083-2-ch@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164305

Hi,

On 2022-03-30 11:15, Claudius Heine wrote:
> When creating an initramfs bundled into a kernel fitimage, the resulting
> fitimage will only be placed into the deploy directory and not packaged
> by the kernel recipe/class.
> 
> Changing the kernel recipe/class to produce a package with the fitimage
> containing the initramfs is not possible, because build dependencies
> require the kernel packages to be already build before the initramfs can
> be created.
> 
> The kernel-image-fitimage-initramfs recipe solves this dependency cycle
> by packaging the fitimage with the embedded initramfs from the deploy
> directory and replaces the `kernel-image` and `kernel-image-fitimage`
> packages from the kernel recipe/class.

This patch was on master-next for a short while, any feedback on it?

In the cover letter I stated the only downside of this solution is, that 
in case of package based updating, it would require manually changing 
the version of this recipe.

Is this an acceptable downside, or is there a good way to fix this?

regards,
Claudius

> 
> Signed-off-by: Claudius Heine <ch@denx.de>
> ---
>   .../kernel-image-fitimage-initramfs_0.1.0.bb  | 50 +++++++++++++++++++
>   1 file changed, 50 insertions(+)
>   create mode 100644 meta/recipes-kernel/kernel-image-fitimage-initramfs/kernel-image-fitimage-initramfs_0.1.0.bb
> 
> diff --git a/meta/recipes-kernel/kernel-image-fitimage-initramfs/kernel-image-fitimage-initramfs_0.1.0.bb b/meta/recipes-kernel/kernel-image-fitimage-initramfs/kernel-image-fitimage-initramfs_0.1.0.bb
> new file mode 100644
> index 0000000000..c25168301b
> --- /dev/null
> +++ b/meta/recipes-kernel/kernel-image-fitimage-initramfs/kernel-image-fitimage-initramfs_0.1.0.bb
> @@ -0,0 +1,50 @@
> +# Copyright (C) 2022 Claudius Heine <ch@denx.de>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "Packages the fitimage with embedded initramfs"
> +LICENSE = "GPL-2.0-only"
> +DEPENDS = "virtual/kernel"
> +
> +SRC_URI = ""
> +
> +inherit kernel-artifact-names
> +INITRAMFS_IMAGE_NAME ?= "${@['${INITRAMFS_IMAGE}-${MACHINE}', ''][d.getVar('INITRAMFS_IMAGE') == '']}"
> +KERNEL_PACKAGE_NAME ?= "kernel"
> +
> +PN = "${KERNEL_PACKAGE_NAME}-image-fitimage-initramfs"
> +
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
> +
> +do_install[deptask] = "do_deploy"
> +do_install() {
> +    fitimage="$(readlink "${DEPLOY_DIR_IMAGE}/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}")"
> +    install -d ${D}/boot
> +    install -m 0644 \
> +        ${DEPLOY_DIR_IMAGE}/${fitimage} \
> +        ${D}/boot/
> +    ln -snf \
> +        ${fitimage} \
> +        ${D}/boot/fitImage
> +}
> +
> +PACKAGES += "${KERNEL_PACKAGE_NAME}-image-initramfs"
> +
> +FILES:${PN} = "/boot/fitImage /boot/fitImage-*"
> +RPROVIDES:${PN} = "${KERNEL_PACKAGE_NAME}-image-fitimage"
> +RCONFLICTS:${PN} = "${KERNEL_PACKAGE_NAME}-image-fitimage"
> +RREPLACES:${PN} = "${KERNEL_PACKAGE_NAME}-image-fitimage"
> +
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-image-initramfs = "${KERNEL_PACKAGE_NAME}-image-fitimage-initramfs (= ${EXTENDPGKV})"
> +RPROVIDES:${KERNEL_PACKAGE_NAME}-image-initramfs = "${KERNEL_PACKAGE_NAME}-image"
> +RCONFLICTS:${KERNEL_PACKAGE_NAME}-image-initramfs = "${KERNEL_PACKAGE_NAME}-image"
> +RREPLACES:${KERNEL_PACKAGE_NAME}-image-initramfs = "${KERNEL_PACKAGE_NAME}-image"
> +ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image-initramfs = "1"
> +
> +python() {
> +    if (not 'fitImage' in d.getVar('KERNEL_IMAGETYPES') or
> +            bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE'))):
> +        raise bb.parse.SkipRecipe('Requires generation of fitImage and bundled initramfs.')
> +    if not d.getVar('KERNEL_FIT_LINK_NAME'):
> +        raise bb.parse.SkipRecipe('Requires generation of fitImage symlink in deploy dir.')
> +}

