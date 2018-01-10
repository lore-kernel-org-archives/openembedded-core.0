Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BE81177E9C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 13:39:47 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jan 2018 05:39:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,340,1511856000"; d="scan'208";a="192392006"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 10 Jan 2018 05:39:44 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 28588580255;
	Wed, 10 Jan 2018 05:39:42 -0800 (PST)
Date: Wed, 10 Jan 2018 13:58:29 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Dogukan Ergun <dogukan.ergun@gmail.com>
Message-ID: <20180110115829.i3ff7rc2f4vyc5px@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1515504924-28160-1-git-send-email-dogukan.ergun@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1515504924-28160-1-git-send-email-dogukan.ergun@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20170421 (1.8.2)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] wic: if we can't get from ioctl, try from os.stat()
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
X-List-Received-Date: Wed, 10 Jan 2018 13:39:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 09, 2018 at 04:35:24PM +0300, Dogukan Ergun wrote:
> Under some conditions, ioctl FIGETBSZ can't return real value.
> We can try to use fallback via os.stat() to get block size.
> 

Thank you for the patch!

+1


> Source of patch:
> https://github.com/intel/bmap-tools/commit/17365f4fe9089df7ee9800a2a0ced177ec4798a4
> 
> Signed-off-by: Dogukan Ergun <dogukan.ergun@gmail.com>
> ---
>  scripts/lib/wic/filemap.py | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
> index 77e32b9..a72fa09 100644
> --- a/scripts/lib/wic/filemap.py
> +++ b/scripts/lib/wic/filemap.py
> @@ -37,7 +37,15 @@ def get_block_size(file_obj):
>      # Get the block size of the host file-system for the image file by calling
>      # the FIGETBSZ ioctl (number 2).
>      binary_data = fcntl.ioctl(file_obj, 2, struct.pack('I', 0))
> -    return struct.unpack('I', binary_data)[0]
> +    bsize = struct.unpack('I', binary_data)[0]
> +    if not bsize:
> +        import os
> +        stat = os.fstat(file_obj.fileno())
> +        if hasattr(stat, 'st_blksize'):
> +            bsize = stat.st_blksize
> +        else:
> +            raise IOError("Unable to determine block size")
> +    return bsize
>  
>  class ErrorNotSupp(Exception):
>      """
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

