Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 44E2B773FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 14:48:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 16 Dec 2016 06:47:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,358,1477983600"; d="scan'208";a="798729672"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Dec 2016 06:47:41 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 912226A4080;
	Fri, 16 Dec 2016 06:46:52 -0800 (PST)
Date: Fri, 16 Dec 2016 16:47:28 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Christopher Larson <kergoth@gmail.com>
Message-ID: <20161216144728.GC6398@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1481830959-24831-1-git-send-email-kergoth@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1481830959-24831-1-git-send-email-kergoth@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: obey the rootfs size from the metadata
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
X-List-Received-Date: Fri, 16 Dec 2016 14:48:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christopher,

Thank you for the patch!

+1

On Thu, Dec 15, 2016 at 12:42:39PM -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> When no --size is specified for the rootfs in the .wks, we want to obey the
> rootfs size from the metadata, otherwise the defined IMAGE_ROOTFS_EXTRA_SPACE
> and IMAGE_OVERHEAD_FACTOR will not be obeyed. In some cases, this can result
> in image construction failure, if the size determined by du was insufficient
> to hold the files without the aforementioned extra space.
> 
> This fallback from --size to ROOTFS_SIZE was already implemented when
> --rootfs-dir is specified in the .wks, but it did not occur otherwise, neither
> when --rootfs-dir= was passed to `wic create` nor when IMAGE_ROOTFS was used.
> This made a certain amount of sense, as this fallback logic happened at such
> a level that it wasn't able to identify which partitions were rootfs
> partitions otherwise. Rather than doing it at that level, we can do it in
> prepare_rootfs(), which is run by the rootfs source plugins.
> 
> Note that IMAGE_OVERHEAD_FACTOR and a --overhead-factor in the .wks will now
> both be applied when --size isn't specified in the .wks. A warning is added
> about this, though a user won't see it unless wic fails or they examine the
> do_image_wic log.
> 
> Fixes [YOCTO #10815]
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  scripts/lib/wic/partition.py | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index ac4c836..b191cde 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -28,7 +28,7 @@ import os
>  import tempfile
>  
>  from wic.utils.oe.misc import msger, parse_sourceparams
> -from wic.utils.oe.misc import exec_cmd, exec_native_cmd
> +from wic.utils.oe.misc import exec_cmd, exec_native_cmd, get_bitbake_var
>  from wic.plugin import pluginmgr
>  
>  partition_methods = {
> @@ -194,6 +194,17 @@ class Partition():
>              msger.error("File system for partition %s not specified in kickstart, " \
>                          "use --fstype option" % (self.mountpoint))
>  
> +        # Get rootfs size from bitbake variable if it's not set in .ks file
> +        if not self.size:
> +            # Bitbake variable ROOTFS_SIZE is calculated in
> +            # Image._get_rootfs_size method from meta/lib/oe/image.py
> +            # using IMAGE_ROOTFS_SIZE, IMAGE_ROOTFS_ALIGNMENT,
> +            # IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE
> +            rsize_bb = get_bitbake_var('ROOTFS_SIZE')
> +            if rsize_bb:
> +                msger.warning('overhead-factor was specified, but size was not, so bitbake variables will be used for the size. In this case both IMAGE_OVERHEAD_FACTOR and --overhead-factor will be applied')
> +                self.size = int(round(float(rsize_bb)))
> +
>          for prefix in ("ext", "btrfs", "vfat", "squashfs"):
>              if self.fstype.startswith(prefix):
>                  method = getattr(self, "prepare_rootfs_" + prefix)
> -- 
> 2.8.0
> 

-- 
--
Regards,
Ed

