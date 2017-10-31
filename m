Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1CDC260123
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 14:34:52 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Oct 2017 07:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,324,1505804400"; d="scan'208";a="144290374"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 31 Oct 2017 07:34:51 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 8C4A15803F3;
	Tue, 31 Oct 2017 07:34:50 -0700 (PDT)
Date: Tue, 31 Oct 2017 15:33:24 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Artur =?utf-8?Q?M=C4=85drzak?= <artur@madrzak.eu>
Message-ID: <20171031133324.5hdzhtu7kop7um4b@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <123c3e3f-4ba4-43f6-957f-530a69e81712@madrzak.eu>
MIME-Version: 1.0
In-Reply-To: <123c3e3f-4ba4-43f6-957f-530a69e81712@madrzak.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20170421 (1.8.2)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: add 'part-name' argument for naming GPT partitions
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
X-List-Received-Date: Tue, 31 Oct 2017 14:34:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Oct 30, 2017 at 08:53:09PM +0100, Artur Mądrzak wrote:
> The WIC's 'part' can now give a name for GPT partition in WKS file.
> It's similar to '--label', but is naming partitions instead file systems.
> It's required by some bootloaders to partitions have specified names.
> 

Thank you for the patch!

+1

> Signed-off-by: Artur Mądrzak <artur@madrzak.eu>
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
> +         --part-name: This option is specific to wic. It specifies name for
> GPT partitions.
> +
>           --part-type: This option is specific to wic. It specifies
> partition
>                        type GUID for GPT partitions.
>                        List of partition type GUIDS can be found here:
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 99b66eebc5..7850e81d2f 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -144,6 +144,7 @@ class KickStart():
>          part.add_argument('--no-table', action='store_true')
>          part.add_argument('--ondisk', '--ondrive', dest='disk',
> default='sda')
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
> diff --git a/scripts/lib/wic/plugins/imager/direct.py
> b/scripts/lib/wic/plugins/imager/direct.py
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
>                  # The --part-type can also be implemented for MBR
> partitions,
>                  # in which case it would map to the 1-byte "partition type"
> @@ -519,6 +523,13 @@ class PartitionedImage():
>              self._create_partition(self.path, part.type,
>                                     parted_fs_type, part.start,
> part.size_sec)
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
> 2.13.6
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

