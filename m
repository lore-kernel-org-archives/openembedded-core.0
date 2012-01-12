Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RlQ0g-0008M4-Kf
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 20:08:26 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Jan 2012 11:00:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="97701321"
Received: from btwarden-mobl1.amr.corp.intel.com (HELO envy.home)
	([10.7.199.156])
	by orsmga002.jf.intel.com with ESMTP; 12 Jan 2012 11:00:54 -0800
Message-ID: <4F0F2DD2.9040808@linux.intel.com>
Date: Thu, 12 Jan 2012 11:00:34 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326221405.git.dexuan.cui@intel.com>
	<020d54ed54c0ad9a1a7cc63ca8660f5b5451b361.1326221405.git.dexuan.cui@intel.com>
In-Reply-To: <020d54ed54c0ad9a1a7cc63ca8660f5b5451b361.1326221405.git.dexuan.cui@intel.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [RFC PATCH 1/1] self-hosted-image: generate the .hdddirect and .vmdk image files
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
X-List-Received-Date: Thu, 12 Jan 2012 19:08:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/10/2012 10:53 AM, Dexuan Cui wrote:
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>

A couple additional thoughts about the boot-directdisk class in general:

So build_boot_dd needs a careful audit to ensure the various dd commands do not
stomp on eachother iirc, the dd of syslinux/mbr.bin was stomping on the
partition table or some such.

Also note that it uses "mkdosfs -d" which we have purged (and it aint coming
back if my NACK is worth anything ;-). Sounds like we need to abstract building
msdos images into an msdosfs.bbclass. No reason to duplicate all the fatfs
overhead calculations I did yesterday (See the patch I sent yesterday to
bootimg.bbclass).

--
Darren


> ---
>  meta/classes/boot-directdisk.bbclass          |   10 +++++++++-
>  meta/recipes-core/images/self-hosted-image.bb |   11 +++++++++--
>  2 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
> index 8879ba8..83ec929 100644
> --- a/meta/classes/boot-directdisk.bbclass
> +++ b/meta/classes/boot-directdisk.bbclass
> @@ -24,6 +24,7 @@ do_bootdirectdisk[depends] += "dosfstools-native:do_populate_sysroot \
>                                 syslinux-native:do_populate_sysroot \
>                                 parted-native:do_populate_sysroot \
>                                 mtools-native:do_populate_sysroot "
> +do_bootdirectdisk[depends] += "qemu-native:do_populate_sysroot"
>  
>  PACKAGES = " "
>  EXCLUDE_FROM_WORLD = "1"
> @@ -38,7 +39,7 @@ BOOTDD_EXTRA_SPACE ?= "16384"
>  
>  AUTO_SYSLINUXCFG = "1"
>  LABELS = "boot"
> -APPEND = "root=/dev/sda2"
> +APPEND = "root=/dev/hda2"
>  TIMEOUT = "10"
>  SYSLINUXCFG  = "${HDDDIR}/syslinux.cfg"
>  SYSLINUXMENU = "${HDDDIR}/menu"
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


