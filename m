Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E7EB27871B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 09:39:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2017 01:39:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,436,1505804400"; 
   d="scan'208";a="4586562"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Nov 2017 01:39:58 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 38D5E580329;
	Wed, 22 Nov 2017 01:39:57 -0800 (PST)
Date: Wed, 22 Nov 2017 10:26:45 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Dogukan Ergun <dogukan.ergun@gmail.com>
Message-ID: <20171122082645.qhfyyus754ft6pca@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1510832983-801-1-git-send-email-dogukan.ergun@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1510832983-801-1-git-send-email-dogukan.ergun@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20170421 (1.8.2)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: fallback to dd, if sparse_copy does not work
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
X-List-Received-Date: Wed, 22 Nov 2017 09:40:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 16, 2017 at 02:49:43PM +0300, Dogukan Ergun wrote:
> Docker's aufs filesystem doesn't support file ioctl operations like FIGETBSZ
> or FIEMAP.
> Sparse_copy operation will fail if those ioctls are not supported.
> If sparse_copy fails while generating wic images, fallback to dd for copying
> filesystems on final image.
> 

You can make sparse_copy to use SEEK_HOLE / SEEK_DATA instead of FIEMAP.
This can be done by using 'api' parameter. If AUFS supports it this
there is no need to fall back to using dd.

> Signed-off-by: Dogukan Ergun <dogukan.ergun@gmail.com>
> ---
>  scripts/lib/wic/plugins/imager/direct.py | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
> index da1c061..70f93ee 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -577,8 +577,14 @@ class PartitionedImage():
>          for part in self.partitions:
>              source = part.source_file
>              if source:
> -                # install source_file contents into a partition
> -                sparse_copy(source, self.path, seek=part.start * self.sector_size)
> +                try:
> +                    # install source_file contents into a partition
> +                    sparse_copy(source, self.path, seek=part.start * self.sector_size)
> +                except:

sparse_copy raises ErrorNotSupp if some ioctl is not supported. Please,
catch this particular exception instead of any exception.

> +                    # Sparse_copy failed, fallback to dd method
> +                    dd_cmd = "dd if=%s of=%s bs=%d seek=%d count=%d conv=notrunc" % \
> +                        (source, self.path, self.sector_size, part.start, part.size_sec)
> +                    exec_cmd(dd_cmd)
>  
>                  logger.debug("Installed %s in partition %d, sectors %d-%d, "
>                               "size %d sectors", source, part.num, part.start,
> -- 
> 2.7.4
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

