Return-Path: <saul.wold@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 13A7560722
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 01:01:40 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 30 Mar 2016 18:01:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,419,1455004800"; d="scan'208";a="76253603"
Received: from jdiei-mobl4.amr.corp.intel.com ([10.254.184.42])
	by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2016 18:01:42 -0700
Message-ID: <1459386101.18406.168.camel@intel.com>
From: Saul Wold <saul.wold@intel.com>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 30 Mar 2016 18:01:41 -0700
In-Reply-To: <9050734f9f9baec08caa67948dd70f9389a93a6e.1458640034.git.liezhi.yang@windriver.com>
References: <cover.1458640034.git.liezhi.yang@windriver.com>
	<9050734f9f9baec08caa67948dd70f9389a93a6e.1458640034.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.18.5.1 (3.18.5.1-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH 3/3] bootimg.bbclass: only inherit syslinux when pcbios
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
X-List-Received-Date: Thu, 31 Mar 2016 01:01:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-03-22 at 02:48 -0700, Robert Yang wrote:
> syslinux.bbclass should not be seen when use efi.
> 
That's not completely true, there is a case which still requires the
ioslinux.bin binary when EFI is used.  In the build_iso() function
there is a workaround that is still required and uses isolinux.bin

This change breaks building EFI only machines (intel-quark for example)

Please check into this.
Thanks

Sau!

> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/boot-directdisk.bbclass |    1 -
>  meta/classes/bootimg.bbclass         |    9 +++++++--
>  meta/classes/image-live.bbclass      |    1 -
>  meta/classes/syslinux.bbclass        |    7 +++----
>  4 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/classes/boot-directdisk.bbclass
> b/meta/classes/boot-directdisk.bbclass
> index c6ada47..46f88ac 100644
> --- a/meta/classes/boot-directdisk.bbclass
> +++ b/meta/classes/boot-directdisk.bbclass
> @@ -59,7 +59,6 @@ inherit ${EFI_CLASS}
>  
>  DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
>  ROOT_VM ?= "root=/dev/sda2"
> -SYSLINUX_CFG_VM  ?= "${S}/syslinux_vm.cfg"
>  
>  boot_direct_populate() {
>  	dest=$1
> diff --git a/meta/classes/bootimg.bbclass
> b/meta/classes/bootimg.bbclass
> index 70ce070..d9ed7db 100644
> --- a/meta/classes/bootimg.bbclass
> +++ b/meta/classes/bootimg.bbclass
> @@ -40,6 +40,11 @@ EFIIMGDIR = "${S}/efi_img"
>  COMPACT_ISODIR = "${S}/iso.z"
>  COMPRESSISO ?= "0"
>  
> +ISOLINUXDIR ?= "/isolinux"
> +ISO_BOOTIMG = "isolinux/isolinux.bin"
> +ISO_BOOTCAT = "isolinux/boot.cat"
> +MKISOFS_OPTIONS = "-no-emul-boot -boot-load-size 4 -boot-info-table"
> +
>  BOOTIMG_VOLUME_ID   ?= "boot"
>  BOOTIMG_EXTRA_SPACE ?= "512"
>  
> @@ -59,10 +64,10 @@ def pcbios(d):
>      return pcbios
>  
>  PCBIOS = "${@pcbios(d)}"
> +PCBIOS_CLASS = "${@['','syslinux'][d.getVar('PCBIOS', True) ==
> '1']}"
>  
> -# The syslinux is required for the isohybrid command and boot
> catalog
> -inherit syslinux
>  inherit ${EFI_CLASS}
> +inherit ${PCBIOS_CLASS}
>  
>  populate() {
>  	DEST=$1
> diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-
> live.bbclass
> index 504725d..05e416a 100644
> --- a/meta/classes/image-live.bbclass
> +++ b/meta/classes/image-live.bbclass
> @@ -3,7 +3,6 @@ INITRD_IMAGE_LIVE ?= "core-image-minimal-initramfs"
>  INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-
> ${MACHINE}.cpio.gz"
>  ROOT_LIVE ?= "root=/dev/ram0"
>  LABELS_LIVE ?= "boot install"
> -SYSLINUX_CFG_LIVE ?= "${S}/syslinux_live.cfg"
>  
>  ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext4"
>  
> diff --git a/meta/classes/syslinux.bbclass
> b/meta/classes/syslinux.bbclass
> index 6de656b..7d324c3 100644
> --- a/meta/classes/syslinux.bbclass
> +++ b/meta/classes/syslinux.bbclass
> @@ -20,7 +20,7 @@
>  do_bootimg[depends] += "${MLPREFIX}syslinux:do_populate_sysroot \
>                          syslinux-native:do_populate_sysroot"
>  
> -ISOLINUXDIR = "/isolinux"
> +ISOLINUXDIR ?= "/isolinux"
>  SYSLINUXDIR = "/"
>  # The kernel has an internal default console, which you can override
> with
>  # a console=...some_tty...
> @@ -30,10 +30,9 @@ SYSLINUX_SERIAL_TTY ?= "console=ttyS0,115200"
>  SYSLINUX_PROMPT ?= "0"
>  SYSLINUX_TIMEOUT ?= "50"
>  AUTO_SYSLINUXMENU ?= "1"
> -ISO_BOOTIMG = "isolinux/isolinux.bin"
> -ISO_BOOTCAT = "isolinux/boot.cat"
> -MKISOFS_OPTIONS = "-no-emul-boot -boot-load-size 4 -boot-info-table"
>  SYSLINUX_ROOT ?= "${ROOT}"
> +SYSLINUX_CFG_VM  ?= "${S}/syslinux_vm.cfg"
> +SYSLINUX_CFG_LIVE ?= "${S}/syslinux_live.cfg"
>  APPEND_prepend = " ${SYSLINUX_ROOT} "
>  
>  # Need UUID utility code.
> -- 
> 1.7.9.5
> 

