Return-Path: <california.l.sullivan@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 743967859F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 18:13:55 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Dec 2017 10:13:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,373,1508828400"; d="scan'208";a="182251044"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga005.jf.intel.com with ESMTP; 07 Dec 2017 10:13:57 -0800
To: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, akuster808@gmail.com
References: <CA+chaQe+qJCwz3dyYh51Pr8Gum5L0wt3VDqrTxs+a36cbOyzYQ@mail.gmail.com>
	<1512165201-51-1-git-send-email-Martin.Jansa@gmail.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <af2b02f4-2f8b-4db1-e448-2d9755eec4b4@intel.com>
Date: Thu, 7 Dec 2017 10:13:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512165201-51-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [PATCH] initramfs-module-install: Remove allarch and FILESEXTRAPATHS
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
X-List-Received-Date: Thu, 07 Dec 2017 18:13:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Ack'd.

We need this in master so it can be backported to rocko along with my 
patches.

Thanks,
Cal

On 12/01/2017 01:53 PM, Martin Jansa wrote:
> * files is already included in default FILESPATH
> * it cannot inherit allarch as it RDEPENDS on bunch of TUNE_PKGARCH packages
> * use the same COMPATIBLE_HOST restrictions as grub has to prevent ERRORs in
>    bitbake world
>    ERROR: Nothing RPROVIDES 'grub' (but oe-core/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb RDEPENDS on or otherwise requires it)
>    grub was skipped: incompatible with host arm-oe-linux-gnueabi (not in COMPATIBLE_HOST)
>    grub was skipped: incompatible with host arm-oe-linux-gnueabi (not in COMPATIBLE_HOST)
>    NOTE: Runtime target 'grub' is unbuildable, removing...
>    Missing or unbuildable dependency chain was: ['grub']
>    ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   .../initrdscripts/initramfs-module-install-efi_1.0.bb             | 3 ---
>   meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb   | 8 +++++---
>   2 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
> index 24b53a8..1e7f76f 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
> @@ -5,9 +5,6 @@ RDEPENDS_${PN} = "initramfs-framework-base parted e2fsprogs-mke2fs dosfstools ut
>   
>   PR = "r4"
>   
> -inherit allarch
> -
> -FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
>   SRC_URI = "file://init-install-efi.sh"
>   
>   S = "${WORKDIR}"
> diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
> index ce7f165..02b69f3 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
> @@ -3,11 +3,13 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>   RDEPENDS_${PN} = "initramfs-framework-base grub parted e2fsprogs-mke2fs util-linux-blkid"
>   
> -PR = "r1"
> +# The same restriction as grub
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
> +COMPATIBLE_HOST_armv7a = 'null'
> +COMPATIBLE_HOST_armv7ve = 'null'
>   
> -inherit allarch
> +PR = "r1"
>   
> -FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
>   SRC_URI = "file://init-install.sh"
>   
>   S = "${WORKDIR}"


