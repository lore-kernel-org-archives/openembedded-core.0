Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 54D0D76FF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 06:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9K6SqTS012879; Tue, 20 Oct 2015 07:28:52 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DrX64rH2Yxy9; Tue, 20 Oct 2015 07:28:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9K6Scpt012876
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 20 Oct 2015 07:28:50 +0100
Message-ID: <1445322518.17974.139.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Joya <alejandro.joya.cruz@intel.com>
Date: Tue, 20 Oct 2015 07:28:38 +0100
In-Reply-To: <1445288542-25427-1-git-send-email-alejandro.joya.cruz@intel.com>
References: <1445288542-25427-1-git-send-email-alejandro.joya.cruz@intel.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: add virtual reference instead
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
X-List-Received-Date: Tue, 20 Oct 2015 06:28:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-10-19 at 16:02 -0500, Alejandro Joya wrote:
> These recipes have a hardcoded dependency to busybox,
> in order to be able to have a flexible selection,
> instead of the hardcoded dependency, now it is point to  virtual reference
> base-utils.
> 
> Signed-off-by: Alejandro Joya <alejandro.joya.cruz@intel.com>
> ---
>  meta/conf/distro/include/default-providers.inc             | 4 +++-
>  meta/recipes-core/images/core-image-minimal-initramfs.bb   | 2 +-
>  meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 +-
>  meta/recipes-core/packagegroups/packagegroup-core-boot.bb  | 4 ++--
>  4 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
> index 9f84d5c..82a7100 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -13,6 +13,7 @@ PREFERRED_PROVIDER_virtual/mesa ?= "mesa"
>  PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg-utils"
>  PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-utils-native"
>  PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
> +PREFERRED_PROVIDER_virtual/base-utils ?= "busybox"
>  PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"
>  
>  #
> @@ -23,7 +24,8 @@ VIRTUAL-RUNTIME_apm ?= "apm"
>  VIRTUAL-RUNTIME_alsa-state ?= "alsa-state"
>  VIRTUAL-RUNTIME_getopt ?= "util-linux-getopt"
>  VIRTUAL-RUNTIME_wireless-tools ?= "iw wireless-tools"
> -
> +VIRTUAL-RUNTIME_base-utils ?= "busybox"
> +VIRTUAL-RUNTIME_base-utils-hwclock ?= "busybox-hwclock"
>  #
>  # Default recipe providers
>  #
> diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> index 1f0fa95..50eca53 100644
> --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
> +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Small image capable of booting a device. The kernel includes \
>  the Minimal RAM-based Initial Root Filesystem (initramfs), which finds the \
>  first 'init' program more efficiently."
>  
> -PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install initramfs-live-install-efi busybox udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
> +PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install initramfs-live-install-efi virtual/base-utils udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"

You mean ${VIRTUAL-RUNTIME_base-utils} here, right?

>  # Do not pollute the initrd image with rootfs features
>  IMAGE_FEATURES = ""
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> index 6c37b9a..0664a95 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Modular initramfs system"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -RDEPENDS_${PN} += "busybox"
> +RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_base-utils}"
>  
>  PR = "r2"
>  
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> index 09f5373..b3cf236 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> @@ -24,7 +24,7 @@ VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
>  VIRTUAL-RUNTIME_initscripts ?= "initscripts"
>  VIRTUAL-RUNTIME_keymaps ?= "keymaps"
>  
> -SYSVINIT_SCRIPTS = "${@bb.utils.contains('MACHINE_FEATURES', 'rtc', 'busybox-hwclock', '', d)} \
> +SYSVINIT_SCRIPTS = "${@bb.utils.contains('MACHINE_FEATURES', 'rtc','${VIRTUAL-RUNTIME_base-utils-hwclock}', '', d)} \
>                      modutils-initscripts \
>                      init-ifupdown \
>                      ${VIRTUAL-RUNTIME_initscripts} \
> @@ -33,7 +33,7 @@ SYSVINIT_SCRIPTS = "${@bb.utils.contains('MACHINE_FEATURES', 'rtc', 'busybox-hwc
>  RDEPENDS_${PN} = "\
>      base-files \
>      base-passwd \
> -    busybox \
> +    ${VIRTUAL-RUNTIME_base-utils \

Missing }

Unfortunately each issue like this I see with the patch makes me wonder
about the testing its had :(

Cheers,

Richard


>      ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "${SYSVINIT_SCRIPTS}", "", d)} \
>      ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
>      netbase \
> -- 
> 2.1.0
> 



