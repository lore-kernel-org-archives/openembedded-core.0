Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EB26278371
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 12:35:22 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Nov 2017 04:35:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,364,1505804400"; 
   d="scan'208";a="5112480"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 08 Nov 2017 04:35:23 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id CD2215804B9;
	Wed,  8 Nov 2017 04:35:22 -0800 (PST)
Date: Wed, 8 Nov 2017 13:22:56 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Message-ID: <20171108112256.udvvxgccwdff7pkx@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20171108110409.19900-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20171108110409.19900-1-nicolas.dechesne@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20170421 (1.8.2)
Cc: akuster@mvista.com, openembedded-core@lists.openembedded.org
Subject: Re: [rocko][PATCH] wic: add 'part-name' argument for naming GPT partitions
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
X-List-Received-Date: Wed, 08 Nov 2017 12:35:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Nov 08, 2017 at 12:04:09PM +0100, Nicolas Dechesne wrote:
> From: Artur Mądrzak <artur@madrzak.eu>
> 
> The WIC's 'part' can now give a name for GPT partition in WKS file.
> It's similar to '--label', but is naming partintions instead file systems.
> It's required by some bootloaders to partitions have specified names.
> 
> Backport from master, without it WIC cannot be used on Qualcomm based machines.
> 

+1

Thanks for the patch!

> Signed-off-by: Artur Mądrzak <artur@madrzak.eu>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 9b60e3466ed7cff0cea10815851eb1304002eb52)
> ---
>  scripts/lib/wic/help.py                  |  2 ++
>  scripts/lib/wic/ksparser.py              |  1 +
>  scripts/lib/wic/partition.py             |  1 +
>  scripts/lib/wic/plugins/imager/direct.py | 11 +++++++++++
>  4 files changed, 15 insertions(+)
> 
> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> index bd9c62e2e8..2ac45e052e 100644
> --- a/scripts/lib/wic/help.py
> +++ b/scripts/lib/wic/help.py
> @@ -970,6 +970,8 @@ DESCRIPTION
>                              This option cannot be used with --fixed-size
>                              option.
>  
> +         --part-name: This option is specific to wic. It specifies name for GPT partitions.
> +
>           --part-type: This option is specific to wic. It specifies partition
>                        type GUID for GPT partitions.
>                        List of partition type GUIDS can be found here:
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 99b66eebc5..7850e81d2f 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -144,6 +144,7 @@ class KickStart():
>          part.add_argument('--no-table', action='store_true')
>          part.add_argument('--ondisk', '--ondrive', dest='disk', default='sda')
>          part.add_argument("--overhead-factor", type=overheadtype)
> +        part.add_argument('--part-name')
>          part.add_argument('--part-type')
>          part.add_argument('--rootfs-dir')
>  
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index b623bb9e6d..66e61ba70c 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -51,6 +51,7 @@ class Partition():
>          self.no_table = args.no_table
>          self.num = None
>          self.overhead_factor = args.overhead_factor
> +        self.part_name = args.part_name
>          self.part_type = args.part_type
>          self.rootfs_dir = args.rootfs_dir
>          self.size = args.size
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
> index 60317eed22..bdb8385620 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -366,6 +366,10 @@ class PartitionedImage():
>          for num in range(len(self.partitions)):
>              part = self.partitions[num]
>  
> +            if self.ptable_format == 'msdos' and part.part_name:
> +                raise WicError("setting custom partition name is not " \
> +                               "implemented for msdos partitions")
> +
>              if self.ptable_format == 'msdos' and part.part_type:
>                  # The --part-type can also be implemented for MBR partitions,
>                  # in which case it would map to the 1-byte "partition type"
> @@ -519,6 +523,13 @@ class PartitionedImage():
>              self._create_partition(self.path, part.type,
>                                     parted_fs_type, part.start, part.size_sec)
>  
> +            if part.part_name:
> +                logger.debug("partition %d: set name to %s",
> +                             part.num, part.part_name)
> +                exec_native_cmd("sgdisk --change-name=%d:%s %s" % \
> +                                         (part.num, part.part_name,
> +                                          self.path), self.native_sysroot)
> +
>              if part.part_type:
>                  logger.debug("partition %d: set type UID to %s",
>                               part.num, part.part_type)
> -- 
> 2.15.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
--
Regards,
Ed

