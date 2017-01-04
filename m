Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2365371985
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 18:23:16 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP; 04 Jan 2017 10:23:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,459,1477983600"; d="scan'208";a="49300237"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.142])
	([10.219.128.142])
	by orsmga005.jf.intel.com with ESMTP; 04 Jan 2017 10:23:16 -0800
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
	<3c231bd33344c04a46cd146c411a039913399ee9.1482363237.git.alejandro.hernandez@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <7f5bfd87-9f66-e2d3-81e8-07af8f57fb9e@linux.intel.com>
Date: Wed, 4 Jan 2017 12:29:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <3c231bd33344c04a46cd146c411a039913399ee9.1482363237.git.alejandro.hernandez@linux.intel.com>
Subject: Re: [PATCH 2/6] core-image-tiny-initramfs: Add and image creating image artifacts only
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
X-List-Received-Date: Wed, 04 Jan 2017 18:23:17 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Alex, the patch requires to be signed off.


On 01/03/2017 04:30 PM, Alejandro Hernandez wrote:
> From: Tom Zanussi <tom.zanussi@linux.intel.com>
>
> Add an image that simply creates image artifacts using
> image-live-artifacts support instead of creating an actual image.
>
> The image artifacts can then be subsequently assembled by an external
> tool such as wic to create an actual image.
>
> This eliminates redundant image creation when using such tools.
> ---
>   .../images/core-image-tiny-initramfs.bb            | 31 ++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
>   create mode 100644 meta/recipes-core/images/core-image-tiny-initramfs.bb
>
> diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta/recipes-core/images/core-image-tiny-initramfs.bb
> new file mode 100644
> index 0000000..216f3e0
> --- /dev/null
> +++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
> @@ -0,0 +1,31 @@
> +# Simple initramfs image artifact generation for tiny images.
> +DESCRIPTION = "Tiny image capable of booting a device. The kernel includes \
> +the Minimal RAM-based Initial Root Filesystem (initramfs), which finds the \
> +first 'init' program more efficiently.  core-image-tiny-initramfs doesn't \
> +actually generate an image but rather generates boot and rootfs artifacts \
> +into a common location that can subsequently be picked up by external image \
> +generation tools such as wic."
> +
> +PACKAGE_INSTALL = "initramfs-live-boot packagegroup-core-boot dropbear ${VIRTUAL-RUNTIME_base-utils} udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
> +
> +# Do not pollute the initrd image with rootfs features
> +IMAGE_FEATURES = ""
> +
> +export IMAGE_BASENAME = "core-image-tiny-initramfs"
> +IMAGE_LINGUAS = ""
> +
> +LICENSE = "MIT"
> +
> +# don't actually generate an image, just the artifacts needed for one
> +ARTIFACTS_ONLY ?= "1"
> +
> +IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
> +inherit core-image
> +
> +IMAGE_ROOTFS_SIZE = "8192"
> +IMAGE_ROOTFS_EXTRA_SPACE = "0"
> +
> +BAD_RECOMMENDATIONS += "busybox-syslog"
> +
> +# Use the same restriction as initramfs-live-install
> +COMPATIBLE_HOST = "(i.86|x86_64).*-linux"


