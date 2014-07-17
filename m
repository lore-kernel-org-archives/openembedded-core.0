Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 50DF070637
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 21:44:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Jul 2014 14:38:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,680,1400050800"; d="scan'208";a="574887348"
Received: from fear.jf.intel.com (HELO rage.localnet) ([10.7.201.149])
	by orsmga002.jf.intel.com with ESMTP; 17 Jul 2014 14:44:34 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jul 2014 14:44:33 -0700
Message-ID: <12558457.OAARH0HRUX@rage>
User-Agent: KMail/4.12.4 (Linux/3.14-1-amd64; KDE/4.13.1; x86_64; ; )
In-Reply-To: <c41e55b6a7ec02343c546642c931fde671f47718.1405520111.git.dvhart@linux.intel.com>
References: <cover.1405520111.git.dvhart@linux.intel.com>
	<c41e55b6a7ec02343c546642c931fde671f47718.1405520111.git.dvhart@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 3/8] mkefidisk.sh: Add gummiboot support
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
X-List-Received-Date: Thu, 17 Jul 2014 21:44:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, July 16, 2014 02:15:59 PM Darren Hart wrote:
> Fixes [YOCTO 6295]
> 
> Add gummiboot support for images built using:
> 
> EFI_PROVIDER="gummiboot"
> 
> Add conditional configuration for GRUB and gummiboot. Provide some
> messaging about which is being performed.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> ---
>  scripts/contrib/mkefidisk.sh | 53
> ++++++++++++++++++++++++++++++++++---------- 1 file changed, 41
> insertions(+), 12 deletions(-)
> 
> diff --git a/scripts/contrib/mkefidisk.sh
> b/scripts/contrib/mkefidisk.sh index 0d0674b..9b13041 100755
> --- a/scripts/contrib/mkefidisk.sh
> +++ b/scripts/contrib/mkefidisk.sh
> @@ -265,31 +265,60 @@ umount $HDDIMG_ROOTFS_MNT
>  echo "Preparing boot partition..."
>  EFIDIR="$BOOTFS_MNT/EFI/BOOT"
>  mkdir -p $EFIDIR
> -GRUBCFG="$EFIDIR/grub.cfg"
> 
>  cp $HDDIMG_MNT/vmlinuz $BOOTFS_MNT
> -# Copy the efi loader and config (booti*.efi and grub.cfg)
> +# Copy the efi loader and configs (booti*.efi and grub.cfg if it
> exists) cp $HDDIMG_MNT/EFI/BOOT/* $EFIDIR
> +# Silently ignore a missing gummiboot loader dir (we might just be a
> GRUB image) +cp -r $HDDIMG_MNT/loader $BOOTFS_MNT 2> /dev/null
> 
> -# Update grub config for the installed image
> -# Delete the install entry
> -sed -i "/menuentry 'install'/,/^}/d" $GRUBCFG
> -# Delete the initrd lines
> -sed -i "/initrd /d" $GRUBCFG
> -# Delete any LABEL= strings
> -sed -i "s/ LABEL=[^ ]*/ /" $GRUBCFG
> +# Update the boot loaders configurations for an installed image
>  # Remove any existing root= kernel parameters and:
>  # o Add a root= parameter with the target rootfs
>  # o Specify ro so fsck can be run during boot
>  # o Specify rootwait in case the target media is an asyncronous block
> device #   such as MMC or USB disks
>  # o Specify "quiet" to minimize boot time when using slow serial
> consoles -sed -i "s@ root=[^ ]*@ @" $GRUBCFG
> -sed -i "s@vmlinuz @vmlinuz root=$TARGET_ROOTFS ro rootwait quiet @"
> $GRUBCFG +
> +# Look for a GRUB installation
> +GRUB_CFG="$EFIDIR/grub.cfg"
> +if [ -e "$GRUB_CFG" ]; then
> +	echo "Configuring GRUB"
> +	# Delete the install entry
> +	sed -i "/menuentry 'install'/,/^}/d" $GRUB_CFG
> +	# Delete the initrd lines
> +	sed -i "/initrd /d" $GRUB_CFG
> +	# Delete any LABEL= strings
> +	sed -i "s/ LABEL=[^ ]*/ /" $GRUB_CFG
> +
> +	sed -i "s@ root=[^ ]*@ @" $GRUB_CFG
> +	sed -i "s@vmlinuz @vmlinuz root=$TARGET_ROOTFS ro rootwait quiet 
@"
> $GRUB_CFG +fi
> +
> +# Look for a gummiboot installation
> +GUMMI_ENTRIES="$BOOTFS_MNT/loader/entries"
> +GUMMI_CFG="$GUMMI_ENTRIES/boot.conf"
> +if [ -d "$GUMMI_ENTRIES" ]; then
> +	echo "Configuring Gummiboot"
> +	# remove the install target if it exists
> +	rm $GUMMI_ENTRIES/install.conf &> /dev/null
> +
> +	if [ ! -e "$GUMMI_CFG" ]; then
> +		echo "ERROR: $GUMMI_CFG not found"
> +	fi
> +

Oops, this is missing:

 +	sed -i "/initrd /d" $GUMMI_CFG

I have updated this git branch with this change.

--
Darren

> +	sed -i "s@ root=[^ ]*@ @" $GUMMI_CFG
> +	sed -i "s@options *LABEL=boot @options LABEL=Boot
> root=$TARGET_ROOTFS ro rootwait quiet @" $GUMMI_CFG +fi
> +
> +# Ensure we have at least one EFI bootloader configured
> +if [ ! -e $GRUB_CFG ] && [ ! -e $GUMMI_CFG ]; then
> +	echo "ERROR: No EFI bootloader configuration found"
> +fi
> 
>  umount $BOOTFS_MNT
>  umount $HDDIMG_MNT
>  rm -rf $TMPDIR
>  sync
> 
> -echo "Installation complete."
> +echo "Installation complete"

-- 
Darren Hart
Intel Open Source Technology Center

