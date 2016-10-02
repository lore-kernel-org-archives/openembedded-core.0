Return-Path: <saul.wold@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C679460720
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Oct 2016 20:47:46 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 02 Oct 2016 13:47:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,434,1473145200"; d="scan'208";a="886013844"
Received: from swold-mobl2.amr.corp.intel.com ([10.255.86.96])
	by orsmga003.jf.intel.com with ESMTP; 02 Oct 2016 13:47:47 -0700
Message-ID: <1475441266.18115.116.camel@intel.com>
From: Saul Wold <saul.wold@intel.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 02 Oct 2016 13:47:46 -0700
In-Reply-To: <1475249810-1235-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1475249810-1235-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [wic][PATCH] mkefidisk.wks: use partition UUID and GPT partition table
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
X-List-Received-Date: Sun, 02 Oct 2016 20:47:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-09-30 at 18:36 +0300, Ed Bartosh wrote:
> This is a preparation to use mkefidisk as a default wks for
> genericx86* BSPs. This change enables usage of partition UUID
> instead of device name to specify root partition in kernel
> command line. It should make images to boot on devices with
> boot device names that differ from what's mentioned in wks file.
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  scripts/lib/wic/canned-wks/mkefidisk.wks | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks
> b/scripts/lib/wic/canned-wks/mkefidisk.wks
> index 696e94e..73886ab 100644
> --- a/scripts/lib/wic/canned-wks/mkefidisk.wks
> +++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
> @@ -4,8 +4,8 @@
>  
>  part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --
> ondisk sda --label msdos --active --align 1024
>  
> -part / --source rootfs --ondisk sda --fstype=ext4 --label platform
> --align 1024
> +part / --source rootfs --ondisk sda --fstype=ext4 --label platform
> --align 1024 --use-uuid
>  
>  part swap --ondisk sda --size 44 --label swap1 --fstype=swap
>  
> -bootloader  --timeout=10  --append="rootwait rootfstype=ext4
> console=ttyPCH0,115200 console=tty0 vmalloc=256MB snd-hda-
> intel.enable_msi=0"
> +bootloader --ptable gpt --timeout=10 --append="rootwait
> rootfstype=ext4 console=ttyPCH0,115200 console=tty0 vmalloc=256MB
> snd-hda-intel.enable_msi=0"
NAK!

Not all devices can handle GPT correct it seems, I can't use this
version to boot a Turobot for example, where is was usable before.

The use-uuid works.

Sau!

> -- 
> 2.1.4
> 

