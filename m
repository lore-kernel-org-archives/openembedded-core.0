Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC5770018
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 07:51:44 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jul 2017 00:51:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,414,1496127600"; d="scan'208";a="112091204"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 26 Jul 2017 00:51:46 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 77AAF58011C;
	Wed, 26 Jul 2017 00:51:45 -0700 (PDT)
Date: Wed, 26 Jul 2017 10:29:09 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20170726072909.GC13291@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1501012702-2723-1-git-send-email-trini@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <1501012702-2723-1-git-send-email-trini@konsulko.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: Switch to using --use-uuid by default
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
X-List-Received-Date: Wed, 26 Jul 2017 07:51:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 25, 2017 at 03:58:22PM -0400, Tom Rini wrote:
> The most portable way to specifiy a root device in a disk image that we
> create is to use PARTUUID rather than /dev/sda2.  As background, both
> GPT and MBR tables provide valid UUID values for each partition and the
> Linux Kernel contains the logic to parse this value.  With this change
> we can now boot the default disk images when used as any valid block
> device that the included kernel uses.  This for example means that
> VirtualBox can be used to run vmdk without changes as it uses IDE for
> the virtual disk controller.
>
I suspect oe-selftest needs to be adjusted for this change.

Please run "oe-selftest -r wic" to ensure all tests pass.

> Cc: Ed Bartosh <ed.bartosh@linux.intel.com>
> Cc: Matt Porter <mporter@konsulko.com>
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
>  scripts/lib/wic/canned-wks/common.wks.inc                   | 2 +-
>  scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg | 8 ++++----
>  scripts/lib/wic/canned-wks/qemux86-directdisk.wks           | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/lib/wic/canned-wks/common.wks.inc b/scripts/lib/wic/canned-wks/common.wks.inc
> index 5cf2fd1..89880b4 100644
> --- a/scripts/lib/wic/canned-wks/common.wks.inc
> +++ b/scripts/lib/wic/canned-wks/common.wks.inc
> @@ -1,3 +1,3 @@
>  # This file is included into 3 canned wks files from this directory
>  part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
> -part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
> +part / --source rootfs --use-uuid --fstype=ext4 --label platform --align 1024
> diff --git a/scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg b/scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg
> index d5a07d2..c58e74a 100644
> --- a/scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg
> +++ b/scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg
> @@ -12,16 +12,16 @@ DEFAULT Graphics console boot
>  
>  LABEL Graphics console boot
>  KERNEL /vmlinuz
> -APPEND label=boot root=/dev/sda2 rootwait
> +APPEND label=boot rootwait
>  
>  LABEL Serial console boot
>  KERNEL /vmlinuz
> -APPEND label=boot root=/dev/sda2 rootwait console=ttyS0,115200
> +APPEND label=boot rootwait console=ttyS0,115200
>  
>  LABEL Graphics console install
>  KERNEL /vmlinuz
> -APPEND label=install root=/dev/sda2 rootwait
> +APPEND label=install rootwait
>  
>  LABEL Serial console install
>  KERNEL /vmlinuz
> -APPEND label=install root=/dev/sda2 rootwait console=ttyS0,115200
> +APPEND label=install rootwait console=ttyS0,115200
> diff --git a/scripts/lib/wic/canned-wks/qemux86-directdisk.wks b/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
> index db30bbc..1f8466a 100644
> --- a/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
> +++ b/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
> @@ -4,5 +4,5 @@
>  
>  include common.wks.inc
>  
> -bootloader  --timeout=0  --append="vga=0 uvesafb.mode_option=640x480-32 root=/dev/sda2 rw mem=256M ip=192.168.7.2::192.168.7.1:255.255.255.0 oprofile.timer=1 rootfstype=ext4 "
> +bootloader  --timeout=0  --append="vga=0 uvesafb.mode_option=640x480-32 rw mem=256M ip=192.168.7.2::192.168.7.1:255.255.255.0 oprofile.timer=1 rootfstype=ext4 "
>  
> -- 
> 2.1.4
> 

-- 
--
Regards,
Ed

