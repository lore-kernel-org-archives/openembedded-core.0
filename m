Return-Path: <saul.wold@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CD9BD606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 05:34:43 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP; 29 Aug 2016 22:34:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,254,1470726000"; 
   d="scan'208";a="2532200"
Received: from swold-mobl2.amr.corp.intel.com ([10.255.94.174])
	by fmsmga005.fm.intel.com with ESMTP; 29 Aug 2016 22:34:43 -0700
Message-ID: <1472535283.3508.60.camel@intel.com>
From: Saul Wold <saul.wold@intel.com>
To: Awais Belal <awais_belal@mentor.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 22:34:43 -0700
In-Reply-To: <1470816856-27919-1-git-send-email-awais_belal@mentor.com>
References: <1470816856-27919-1-git-send-email-awais_belal@mentor.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH] init-install*: only pick root mmc devices
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
X-List-Received-Date: Tue, 30 Aug 2016 05:34:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-08-10 at 13:14 +0500, Awais Belal wrote:
> Some eMMC devices show special sub-devices such as mmcblk0boot0
> etc. The installation script currently pick all of them up and
> displays it to the user which makes some confusions because these
> sub-devices are pretty small and complete installation including
> rootfs won't be possible in most cases.
> We simply now drop these sub-devices and only present the user
> with the root of such mmc devices.
> 
Hi Awais:

We recently ran a full QA pass and found a problem with installing
genericx86* machines files as Bug #10189 [1].  It appears it might be
related to this or another of your init-install patches.

Since we are approaching M3 closure today this would be a bad issue to
have following us into M3.  

Please review the bug and try to test with genericx86 likely without an
MMC device.

Thanks
  Sau!

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=10189

> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>  meta/recipes-core/initrdscripts/files/init-install-efi.sh | 8
> +++++++-
>  meta/recipes-core/initrdscripts/files/init-install.sh     | 8
> +++++++-
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/initrdscripts/files/init-install-
> efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> index f564f4e..776dcbb 100644
> --- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> @@ -29,7 +29,13 @@ esac
>  
>  echo "Searching for hard drives ..."
>  
> -for device in `ls /sys/block/`; do
> +# Some eMMC devices have special sub devices such as mmcblk0boot0
> etc
> +# we're currently only interested in the root device so pick them
> wisely
> +devices=`ls /sys/block/ | grep -v mmcblk`
> +mmc_devices=`ls /sys/block/ | grep "mmcblk[0-9]\{1,\}$"`
> +devices="$devices $mmc_devices"
> +
> +for device in $devices; do
>      case $device in
>          loop*)
>              # skip loop device
> diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh
> b/meta/recipes-core/initrdscripts/files/init-install.sh
> index 72ce92b..9c4189b 100644
> --- a/meta/recipes-core/initrdscripts/files/init-install.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-install.sh
> @@ -28,7 +28,13 @@ esac
>  
>  echo "Searching for hard drives ..."
>  
> -for device in `ls /sys/block/`; do
> +# Some eMMC devices have special sub devices such as mmcblk0boot0
> etc
> +# we're currently only interested in the root device so pick them
> wisely
> +devices=`ls /sys/block/ | grep -v mmcblk`
> +mmc_devices=`ls /sys/block/ | grep "mmcblk[0-9]\{1,\}$"`
> +devices="$devices $mmc_devices"
> +
> +for device in $devices; do
>      case $device in
>          loop*)
>              # skip loop device
> -- 
> 1.9.1
> 

