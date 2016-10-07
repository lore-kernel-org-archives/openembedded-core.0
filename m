Return-Path: <saul.wold@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 2C6AF60403
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2016 21:33:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 07 Oct 2016 14:33:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,456,1473145200"; d="scan'208";a="1061957550"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.21.249])
	by orsmga002.jf.intel.com with ESMTP; 07 Oct 2016 14:33:18 -0700
Message-ID: <1475875998.18115.234.camel@intel.com>
From: Saul Wold <saul.wold@intel.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 07 Oct 2016 14:33:18 -0700
In-Reply-To: <1475769473-8356-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1475769752.18115.206.camel@intel.com>
	<1475769473-8356-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [wic][PATCH] mkefidisk.wks: update kernel command line
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
X-List-Received-Date: Fri, 07 Oct 2016 21:33:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-10-06 at 18:57 +0300, Ed Bartosh wrote:
> Used ttyS0 console.
> Removed usage of ttyPCH0 (FRI2 leftover)
> Decreased bootloader timeout to 5 seconds
> Removed 'vmalloc=256MB snd-hda-intel.enable_msi=0' as it's not needed
> for any of reference BSPs.
> 
These changes are needed for newer hardware.

I further tested with and with out the GPT enabled and found that what
ever testing I did original was invalid and GPT is OK for both NUC and
MinnowboardMax.

So I think we can re-enable that for mkefidisk.wks.

These same changes should be applies to systemd-bootdisk.wks also.

Thanks
   Sau!

> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  scripts/lib/wic/canned-wks/mkefidisk.wks | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks
> b/scripts/lib/wic/canned-wks/mkefidisk.wks
> index 668ca92..7c287f7 100644
> --- a/scripts/lib/wic/canned-wks/mkefidisk.wks
> +++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
> @@ -8,4 +8,4 @@ part / --source rootfs --ondisk sda --fstype=ext4 --
> label platform --align 1024
>  
>  part swap --ondisk sda --size 44 --label swap1 --fstype=swap
>  
> -bootloader --timeout=10 --append="rootwait rootfstype=ext4
> console=ttyPCH0,115200 console=tty0 vmalloc=256MB snd-hda-
> intel.enable_msi=0"
> +bootloader --timeout=5 --append="rootfstype=ext4
> console=ttyS0,115200 console=tty0"
> -- 
> 2.1.4
> 

