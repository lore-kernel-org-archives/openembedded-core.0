Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B2070731D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 11:13:36 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 28 Apr 2016 04:13:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,546,1455004800"; d="scan'208";a="693679014"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Apr 2016 04:13:36 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 497B16A4007
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 05:01:12 -0700 (PDT)
Date: Thu, 28 Apr 2016 11:53:27 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160428085327.GA4269@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1461827697-16934-1-git-send-email-ed.bartosh@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1461827697-16934-1-git-send-email-ed.bartosh@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [wic][PATCH 1/6] wic: use truncate utility to create sparse file
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
X-List-Received-Date: Thu, 28 Apr 2016 11:13:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Please, igrnore. I'll send updated patchset today.

On Thu, Apr 28, 2016 at 10:14:52AM +0300, Ed Bartosh wrote:
> Used truncate instead of dd to create wic image for the
> following reasons:
>  - truncate syntax is much more clear
>  - dd requires additional calculations of the image size
>    in blocks
>  - the way dd was used in the code is not entirely correct.
>    It was still writing one block to the file, which made it not
>    100% sparse.
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  scripts/lib/wic/utils/fs_related.py | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/scripts/lib/wic/utils/fs_related.py b/scripts/lib/wic/utils/fs_related.py
> index 2e74461..2658dcf 100644
> --- a/scripts/lib/wic/utils/fs_related.py
> +++ b/scripts/lib/wic/utils/fs_related.py
> @@ -71,14 +71,8 @@ class DiskImage(Disk):
>      def create(self):
>          if self.device is not None:
>              return
> -
> -        blocks = self.size / 1024
> -        if self.size - blocks * 1024:
> -            blocks += 1
> -
> -        # create disk image
> -        dd_cmd = "dd if=/dev/zero of=%s bs=1024 seek=%d count=1" % \
> -            (self.image_file, blocks)
> -        exec_cmd(dd_cmd)
> +        # create sparse disk image
> +        cmd = "truncate %s -s %s" % (self.image_file, self.size)
> +        exec_cmd(cmd)
>  
>          self.device = self.image_file
> -- 
> 2.1.4
> 

-- 
--
Regards,
Ed

