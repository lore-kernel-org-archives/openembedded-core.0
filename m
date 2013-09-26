Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C977F6CB65
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 22:45:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Sep 2013 15:41:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,989,1371106800"; d="scan'208";a="384123051"
Received: from dvhart-mobl4.jf.intel.com (HELO [10.7.201.176]) ([10.7.201.176])
	by orsmga001.jf.intel.com with ESMTP; 26 Sep 2013 15:45:04 -0700
Message-ID: <1380235504.32071.40.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Thu, 26 Sep 2013 15:45:04 -0700
In-Reply-To: <1380234850-27169-1-git-send-email-jason.wessel@windriver.com>
References: <1380234850-27169-1-git-send-email-jason.wessel@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mkefidisk.sh: Allow using a loopback mounted file
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
X-List-Received-Date: Thu, 26 Sep 2013 22:45:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-09-26 at 17:34 -0500, Jason Wessel wrote:
> There is no reason not allow writing of direct boot disk images for

Nit:                    ^ to

> testing with simulators.  The easy way is to add loop back writing
> capabilities.


Just note here that the /dev/loop device has the same partition prefix
as mmc devices and requires special mkfs arguments.

> Example:
>   qemu-img create -f raw bigdisk 4G
>   dev=`sudo losetup -f`
>   sudo losetup $dev bigdisk
>   mkefidisk.sh $dev tmp-eglibc/deploy/images/qemux86/core-image-minimal-qemux86.hddimg /dev/sda
>   sudo losetup -d $dev
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  scripts/contrib/mkefidisk.sh |    9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
> index af06b4b..224a146 100755
> --- a/scripts/contrib/mkefidisk.sh
> +++ b/scripts/contrib/mkefidisk.sh
> @@ -142,7 +142,7 @@ SWAP_START=$((ROOTFS_END))
>  
>  # MMC devices use a partition prefix character 'p'
>  PART_PREFIX=""
> -if [ ! "${DEVICE#/dev/mmcblk}" = "${DEVICE}" ]; then
> +if [ ! "${DEVICE#/dev/mmcblk}" = "${DEVICE}" ] || [ ! "${TARGET_DEVICE#/dev/loop}" = "${DEVICE}" ]; then

I think you meant to use "${DEVICE#/dev/loop}" here? Not TARGET_DEVICE?

--
Darren

>  	PART_PREFIX="p"
>  fi
>  BOOTFS=$DEVICE${PART_PREFIX}1
> @@ -197,7 +197,12 @@ unmount_device
>  #
>  echo ""
>  echo "Formatting $BOOTFS as vfat..."
> -mkfs.vfat $BOOTFS -n "efi"
> +if [ ! "${DEVICE#/dev/loop}" = "${DEVICE}" ]; then
> +	mkfs.vfat -I $BOOTFS -n "efi"
> +else
> +	mkfs.vfat $BOOTFS -n "efi"
> +
> +fi
>  
>  echo "Formatting $ROOTFS as ext3..."
>  mkfs.ext3 $ROOTFS -L "root"

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



