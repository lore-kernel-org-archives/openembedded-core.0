Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2461F6FF25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 08:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3T8J6DJ002785; Fri, 29 Apr 2016 09:19:06 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kHFU6ceUBP-D; Fri, 29 Apr 2016 09:19:06 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3T8J0O4002778
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 29 Apr 2016 09:19:02 +0100
Message-ID: <1461917940.5465.74.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ian Reinhart Geiser <geiseri@geekcentral.pub>,
	openembedded-core@lists.openembedded.org
Date: Fri, 29 Apr 2016 09:19:00 +0100
In-Reply-To: <1461871306-2466-1-git-send-email-geiseri@geekcentral.pub>
References: <1461871306-2466-1-git-send-email-geiseri@geekcentral.pub>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] Allow different filesystems to be used for VM images.
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
X-List-Received-Date: Fri, 29 Apr 2016 08:19:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-04-28 at 15:21 -0400, Ian Reinhart Geiser wrote:
> This allows for things like btrfs to be used vs just ext4.
> The default value of ext4 is kept so there is no functional
> change unless ROOTFS_TYPE is set in the inherting recipe.
> 
> Signed-off-by: Ian Reinhart Geiser <geiseri@geekcentral.pub>
> ---
>  meta/classes/image-vm.bbclass | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)


This seems reasonable but could I ask you to use a variable name with
"VM" in the name please?

I appreciate some of the existing ones don't do this but moving forward
we need to try and better namespace some of these class specific
variables and this seems like a good place to start.

VM_ROOTFS_TYPE would be better for example (or VMIMG_ROOTFS_TYPE).

Cheers,

Richard

> diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image
> -vm.bbclass
> index 47f7326..50d93d5 100644
> --- a/meta/classes/image-vm.bbclass
> +++ b/meta/classes/image-vm.bbclass
> @@ -23,16 +23,17 @@ do_bootdirectdisk[depends] += "dosfstools
> -native:do_populate_sysroot \
>                                 syslinux-native:do_populate_sysroot \
>                                 parted-native:do_populate_sysroot \
>                                 mtools-native:do_populate_sysroot \
> -                               ${PN}:do_image_ext4 \
> +                               ${PN}:do_image_${ROOTFS_TYPE} \
>                                 "
>  
> -IMAGE_TYPEDEP_vmdk = "ext4"
> -IMAGE_TYPEDEP_vdi = "ext4"
> -IMAGE_TYPEDEP_qcow2 = "ext4"
> -IMAGE_TYPEDEP_hdddirect = "ext4"
> +IMAGE_TYPEDEP_vmdk = "${ROOTFS_TYPE}"
> +IMAGE_TYPEDEP_vdi = "${ROOTFS_TYPE}"
> +IMAGE_TYPEDEP_qcow2 = "${ROOTFS_TYPE}"
> +IMAGE_TYPEDEP_hdddirect = "${ROOTFS_TYPE}"
>  IMAGE_TYPES_MASKED += "vmdk vdi qcow2 hdddirect"
>  
> -ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext4"
> +ROOTFS_TYPE ?= "ext4"
> +ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${ROOTFS_TYPE}"
>  
>  # Used by bootloader
>  LABELS_VM ?= "boot"
> -- 
> 2.8.0.rc3
> 
> 

