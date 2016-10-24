Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id DBFE0719F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 16:06:19 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 24 Oct 2016 09:06:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,542,1473145200"; d="scan'208";a="23118008"
Received: from besquive-mobl2.zpn.intel.com ([10.219.5.36])
	by orsmga005.jf.intel.com with ESMTP; 24 Oct 2016 09:06:20 -0700
Message-ID: <1477325215.5778.2.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Reply-To: benjamin.esquivel@linux.intel.com
To: Ed Bartosh <ed.bartosh@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
In-Reply-To: <1477317281-19518-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1477317281-19518-1-git-send-email-ed.bartosh@linux.intel.com>
Organization: Intel Corporation
Date: Mon, 24 Oct 2016 11:06:55 -0500
Mime-Version: 1.0
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Subject: Re: [wic][PATCH] systemd-bootdisk.wks: use PARTUUID
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
X-List-Received-Date: Mon, 24 Oct 2016 16:06:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-10-24 at 16:54 +0300, Ed Bartosh wrote:
> Root device name in systemd-bootdisk.wks is 'sda'. This can cause
> images, produced using this wks to refuse booting if real device
> name is not 'sda'. For example, when booting MinnowBoard MAX from
> MicroSD card the boot process stucks with this message on the boot
> console output: Waiting for root device /dev/sda2...
> This happens because real device name of MicroSD card on this device
> is mmcblk1.
> 
> Used --use-uuid option for root partition. This should make
> wic to put partiion UUID instead of device name into kernel command
> line.
This change worked just fine, I tried it both in Minnowboard and Joule
and both boot to login prompt.
> 
> [YOCTO #10485]
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  scripts/lib/wic/canned-wks/systemd-bootdisk.wks | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
> b/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
> index b900023..4bd9d6a 100644
> --- a/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
> +++ b/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
> @@ -4,7 +4,7 @@
>  
>  part /boot --source bootimg-efi --sourceparams="loader=systemd-boot" 
> --ondisk sda --label msdos --active --align 1024
>  
> -part / --source rootfs --ondisk sda --fstype=ext4 --label platform
> --align 1024
> +part / --source rootfs --ondisk sda --fstype=ext4 --label platform
> --align 1024 --use-uuid
>  
>  part swap --ondisk sda --size 44 --label swap1 --fstype=swap
>  
> -- 
> 2.1.4
> 

