Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RnYYW-0007Fd-Rq
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 17:40:14 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Jan 2012 08:32:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="100019256"
Received: from unknown (HELO envy.home) ([10.255.13.210])
	by orsmga002.jf.intel.com with ESMTP; 18 Jan 2012 08:32:33 -0800
Message-ID: <4F16F40B.8080706@linux.intel.com>
Date: Wed, 18 Jan 2012 08:32:11 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Dexuan Cui <dexuan.cui@intel.com>
References: <cover.1326894448.git.dexuan.cui@intel.com>
	<84776a87449ee57fcf3a568562cb0957da04f8bc.1326894448.git.dexuan.cui@intel.com>
In-Reply-To: <84776a87449ee57fcf3a568562cb0957da04f8bc.1326894448.git.dexuan.cui@intel.com>
X-Enigmail-Version: 1.3.4
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/1][v2] self-hosted-image: generate the .hdddirect and .vmdk image files
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
X-List-Received-Date: Wed, 18 Jan 2012 16:40:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/18/2012 06:18 AM, Dexuan Cui wrote:
> The self-hosted-image work needs a live-bootable and r/w-able image format.
> The existing .iso isn't ok since it's readonly.
> The existing .hddimg is not a good choice, since it has a two-option(boot,
> install) syslinux function that we don't need: we don't hope a user to be
> potentially able to "install", and I think it may be not suitble to hack
> build_hddimg to hide the "install"?

bootimg.bbclass should probably be renamed liveimg.bbclass to keep it's
meaning clear.

> Moreever, .hddimg is not that
> compatibible with some devices and we hope to have the most compatibility.
> 
> So I think the .hdddirect format is a good choice and I made this patch to
> adopt it and also enhanced boot-directdisk.bbclass to generate .vmdk image so
> we can run it on vmware, too.
> BTW, currently self-hosted-image is the only user of boot-directdisk.bbclass;
> with the adoption of .hdddirect and .vmdk formats, a user can still use
> "IMAGE_FSTYPES += 'live'" to generate the .iso and .hddimg format.
> 
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> ---
>  meta/classes/boot-directdisk.bbclass          |    8 ++++++++
>  meta/conf/machine/include/qemu.inc            |    2 ++
>  meta/recipes-core/images/self-hosted-image.bb |   11 +++++++++--
>  3 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
> index 8879ba8..7f14225 100644
> --- a/meta/classes/boot-directdisk.bbclass
> +++ b/meta/classes/boot-directdisk.bbclass
> @@ -24,6 +24,7 @@ do_bootdirectdisk[depends] += "dosfstools-native:do_populate_sysroot \
>                                 syslinux-native:do_populate_sysroot \
>                                 parted-native:do_populate_sysroot \
>                                 mtools-native:do_populate_sysroot "
> +do_bootdirectdisk[depends] += "qemu-native:do_populate_sysroot"

As a point of style, just add the new dependencies to the preceding
assignment rather than creating a new assignment.

>  
>  PACKAGES = " "
>  EXCLUDE_FROM_WORLD = "1"
> @@ -50,6 +51,7 @@ build_boot_dd() {
>  
>  	install -d ${HDDDIR}
>  	install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage ${HDDDIR}/vmlinuz
> +	install -m 0644 ${S}/syslinux.cfg ${HDDDIR}/syslinux.cfg
>  	install -m 444 ${STAGING_LIBDIR}/syslinux/ldlinux.sys ${HDDDIR}/ldlinux.sys
>  
>  	BLOCKS=`du -bks ${HDDDIR} | cut -f 1`
> @@ -83,6 +85,12 @@ build_boot_dd() {
>  	cd ${DEPLOY_DIR_IMAGE}
>  	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect
>  	ln -s ${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect
> +
> +	if [ "${NOVMDK}" != "1" ] ; then
> +		${STAGING_BINDIR_NATIVE}/qemu-img convert -O vmdk   \
> +			${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect \
> +			${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk
> +	fi
>  } 
>  
>  python do_bootdirectdisk() {
> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
> index 3cebfab..a5b563b 100644
> --- a/meta/conf/machine/include/qemu.inc
> +++ b/meta/conf/machine/include/qemu.inc
> @@ -5,6 +5,8 @@ MACHINE_FEATURES = "kernel26 apm alsa pcmcia bluetooth irda usbgadget screen"
>  
>  IMAGE_FSTYPES ?= "tar.bz2 ext3"
>  
> +APPEND_${MACHINE} = "root=/dev/hda2"
> +

This concerns me. How does this interact with other recipes and configs
that may set this? What happens if the machine config adds a console
parameter to the APPEND? For example, the meta-intel n450 does the
following:

APPEND += "console=ttyS0,115200 console=tty0"

If I understand correctly, your assignment above will override this.

>  ROOT_FLASH_SIZE = "280"
>  
>  # Don't include kernels in standard images
> diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
> index 111c057..df6c81f 100644
> --- a/meta/recipes-core/images/self-hosted-image.bb
> +++ b/meta/recipes-core/images/self-hosted-image.bb
> @@ -6,6 +6,13 @@ POKY_EXTRA_INSTALL = "\
>  
>  IMAGE_FEATURES += "x11-mini"
>  
> -inherit core-image
> +# Needed by boot-directdisk
> +ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
>  
> -PR = "r2"
> +inherit core-image boot-directdisk
> +
> +do_bootimg[depends] += "${INITRD_IMAGE}:do_rootfs"
> +do_bootimg[depends] += "${IMAGE_BASENAME}:do_rootfs"
> +do_bootdirectdisk[depends] += "${PN}:do_rootfs"
> +
> +PR = "r3"

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


