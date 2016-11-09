Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3F19F605C2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 09:44:59 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 09 Nov 2016 01:45:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,465,1473145200"; d="scan'208";a="29233188"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 09 Nov 2016 01:45:01 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 857406A4006;
	Wed,  9 Nov 2016 01:44:22 -0800 (PST)
Date: Wed, 9 Nov 2016 11:44:51 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Maciej Borzecki <maciej.borzecki@rndity.com>
Message-ID: <20161109094451.GD10823@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1478619682.git.maciej.borzecki@rndity.com>
	<9d17d4a574a0a2b809f832b33a0af41fb7682ea4.1478619682.git.maciej.borzecki@rndity.com>
MIME-Version: 1.0
In-Reply-To: <9d17d4a574a0a2b809f832b33a0af41fb7682ea4.1478619682.git.maciej.borzecki@rndity.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] wic: check that filesystem is specified for a rootfs partition
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
X-List-Received-Date: Wed, 09 Nov 2016 09:45:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 08, 2016 at 04:56:09PM +0100, Maciej Borzecki wrote:
> Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
> ---
>  scripts/lib/wic/partition.py | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index 8adc698240c8e3bd9f4118663a5d7a167e0bb4a4..24e657592738dc7c5cdff78e3740d7c373021e9d 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -184,6 +184,10 @@ class Partition():
>          if os.path.isfile(rootfs):
>              os.remove(rootfs)
>  
> +        if not self.fstype:
> +            msger.error("File system for partition %s not specified in kickstart, " \
> +                        "use --fstype option" % (self.mountpoint))
> +
Would it make sense to make --fstype mandatory in ksparser?

>          for prefix in ("ext", "btrfs", "vfat", "squashfs"):
>              if self.fstype.startswith(prefix):
>                  method = getattr(self, "prepare_rootfs_" + prefix)
> -- 
> 2.5.0
> 

-- 
--
Regards,
Ed

