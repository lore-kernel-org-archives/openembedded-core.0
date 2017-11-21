Return-Path: <sgw@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 018167871D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 22:27:52 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2017 14:27:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,432,1505804400"; 
   d="scan'208";a="4969361"
Received: from swold-mobl2.jf.intel.com ([10.24.10.203])
	by orsmga003.jf.intel.com with ESMTP; 21 Nov 2017 14:27:53 -0800
Message-ID: <1511303273.11515.2.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: California Sullivan <california.l.sullivan@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 21 Nov 2017 14:27:53 -0800
In-Reply-To: <20171121214703.11109-2-california.l.sullivan@intel.com>
References: <20171121214703.11109-1-california.l.sullivan@intel.com>
	<20171121214703.11109-2-california.l.sullivan@intel.com>
X-Mailer: Evolution 3.24.5 (3.24.5-1.fc26) 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] install*.sh: add short sleep after parted commands
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
X-List-Received-Date: Tue, 21 Nov 2017 22:27:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-11-21 at 13:47 -0800, California Sullivan wrote:
> I wasn't able to install to my Optane SSD due to the following error:
> 
> Formatting /dev/nvme0n1p1 to vfat...
> mkfs.fat 4.1 (2017-01-24)
> mkfs.vfat: unable to open /dev/nvme0n1p1: No such file or directory
> Target install-efi failed
> 
> A couple lines later I see:
> 
> [    10.265401]  nvme0n1: p1 p2 p3
> 
> Then looking at the device itself after booting from a USB stick:
> 
> root@intel-corei7-64: ~# ls /dev/nvme0n1*
> /dev/nvme0n1 /dev/nvme0n1p1 /dev/nvme0n1p2 /dev/nvme0n1p3
> 
> So it looks like the parted commands return before the device node is
> actually created.
> 
> Work around this issue by adding a short sleep before doing the mkfs
> commands.
> 
Not advisable to just add the sleep, maybe a check before to see if the
device exists and then sleep (or usleep, if we have it) and do this in
a while loop with a counter to actually timeout after some number of
sleeps.

Yes more work, but more appropriate if the settle time is not actually
needed or a longer settle time is required.

Thanks
Sau!

> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
> ---
>  meta/recipes-core/initrdscripts/files/init-install-efi.sh | 2 ++
>  meta/recipes-core/initrdscripts/files/init-install.sh     | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-core/initrdscripts/files/init-install-
> efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> index 5ad3a60..118bf08 100644
> --- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> @@ -186,6 +186,8 @@ parted ${device} mkpart swap linux-swap
> $swap_start 100%
>  
>  parted ${device} print
>  
> +sleep 1
> +
>  echo "Formatting $bootfs to vfat..."
>  mkfs.vfat $bootfs
>  
> diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh
> b/meta/recipes-core/initrdscripts/files/init-install.sh
> index 1cac806..606317d 100644
> --- a/meta/recipes-core/initrdscripts/files/init-install.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-install.sh
> @@ -211,6 +211,8 @@ parted ${device} mkpart $pname linux-swap
> $swap_start 100%
>  
>  parted ${device} print
>  
> +sleep 1
> +
>  echo "Formatting $bootfs to ext3..."
>  mkfs.ext3 $bootfs
>  
> -- 
> 2.9.5
> 

