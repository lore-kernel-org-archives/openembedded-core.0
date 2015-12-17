Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B9C197316E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 12:52:45 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 17 Dec 2015 04:52:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,441,1444719600"; d="scan'208";a="619546483"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Dec 2015 04:52:46 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id CA4036A4087;
	Thu, 17 Dec 2015 05:40:46 -0800 (PST)
Date: Thu, 17 Dec 2015 14:21:21 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <20151217122121.GB30559@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1450283593-26774-1-git-send-email-joshua.lock@collabora.co.uk>
MIME-Version: 1.0
In-Reply-To: <1450283593-26774-1-git-send-email-joshua.lock@collabora.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic/utils/partitionedfs.py: assemble .wic images as sparse files
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
X-List-Received-Date: Thu, 17 Dec 2015 12:52:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Joshua,

Thank you for the patch! I like the change. It's a first step towards
supporting bmaptool, which is in my TODO list.

Would you be willing to write or modify wic test case to test this?

On Wed, Dec 16, 2015 at 04:33:13PM +0000, Joshua Lock wrote:
> The individual partitions created by wic are sparse but without
> this change the assembled image is written as one (potentially
> very) large file.
> 
> Preserve sparseness in the assembled image by passing the sparse
> conversion symbol.
> 
> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
> ---
>  scripts/lib/wic/utils/partitionedfs.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
> index 5a103bb..3e2b420 100644
> --- a/scripts/lib/wic/utils/partitionedfs.py
> +++ b/scripts/lib/wic/utils/partitionedfs.py
> @@ -340,7 +340,7 @@ class Image(object):
>              source = part['source_file']
>              if source:
>                  # install source_file contents into a partition
> -                cmd = "dd if=%s of=%s bs=%d seek=%d count=%d conv=notrunc" % \
> +                cmd = "dd if=%s of=%s bs=%d seek=%d count=%d conv=notrunc,sparse" % \
>                        (source, image_file, self.sector_size,
>                         part['start'], part['size'])
>                  exec_cmd(cmd)
> -- 
> 2.5.0
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

