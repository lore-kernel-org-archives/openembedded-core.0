Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 623946FF7F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 03:27:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAS3RJr3022869
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Nov 2017 19:27:19 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 27 Nov 2017 19:27:18 -0800
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20170915182244.27986-1-alejandro.hernandez@linux.intel.com>
From: wenzong fan <wenzong.fan@windriver.com>
Message-ID: <697a752f-f550-55b3-951e-042c8e779d6a@windriver.com>
Date: Tue, 28 Nov 2017 11:29:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20170915182244.27986-1-alejandro.hernandez@linux.intel.com>
Subject: Re: [PATCH] core-image-tiny-initramfs: initramfs recipes should not generate an actual image file
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
X-List-Received-Date: Tue, 28 Nov 2017 03:27:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Alex,

Do you have a case that generating an image with wic + tiny initramfs? 
If so could you please show me that?

I tried to create an image with below commands directly, I'm not sure if 
this is a proper test case:
$ wic create mkefidisk -e core-image-tiny-initramfs

While I booting it with USB + Intel NUC, it hangs at finding rootfs.

Thanks
Wenzong

On 09/16/2017 02:22 AM, Alejandro Hernandez wrote:
> core-image-tiny-initramfs was used to generate a wic image, which was conceptually wrong
> since initrafms recipes should only generate the boot artifacts that can later be used
> by another recipe to generate an image using the tool of their choice.
> 
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>   meta/recipes-core/images/core-image-tiny-initramfs.bb | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta/recipes-core/images/core-image-tiny-initramfs.bb
> index 184727ddf7a..a8893d1e53e 100644
> --- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
> +++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
> @@ -1,10 +1,9 @@
>   # Simple initramfs image artifact generation for tiny images.
>   DESCRIPTION = "Tiny image capable of booting a device. The kernel includes \
>   the Minimal RAM-based Initial Root Filesystem (initramfs), which finds the \
> -first 'init' program more efficiently.  core-image-tiny-initramfs doesn't \
> +first 'init' program more efficiently. core-image-tiny-initramfs doesn't \
>   actually generate an image but rather generates boot and rootfs artifacts \
> -into a common location that can subsequently be picked up by external image \
> -generation tools such as wic."
> +that can subsequently be picked up by external image generation tools such as wic."
>   
>   PACKAGE_INSTALL = "initramfs-live-boot packagegroup-core-boot dropbear ${VIRTUAL-RUNTIME_base-utils} udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
>   
> @@ -17,7 +16,7 @@ IMAGE_LINGUAS = ""
>   LICENSE = "MIT"
>   
>   # don't actually generate an image, just the artifacts needed for one
> -IMAGE_FSTYPES = "${INITRAMFS_FSTYPES} wic"
> +IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
>   
>   inherit core-image
>   
> 

