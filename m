Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0435F73025
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 13:42:06 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 09 Mar 2017 05:42:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,268,1486454400"; d="scan'208";a="234150785"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2017 05:42:07 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id C2C326A4006;
	Thu,  9 Mar 2017 05:42:03 -0800 (PST)
Date: Thu, 9 Mar 2017 15:28:20 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <20170309132820.GA9232@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1489044316-14196-1-git-send-email-kristian.amlie@mender.io>
MIME-Version: 1.0
In-Reply-To: <1489044316-14196-1-git-send-email-kristian.amlie@mender.io>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic/direct.py: Avoid exception if using multiple rawcopy/no-table entries.
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
X-List-Received-Date: Thu, 09 Mar 2017 13:42:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 09, 2017 at 08:25:16AM +0100, Kristian Amlie wrote:
> If we are both having a bootloader and a U-Boot environment file, we
> can end up with two entries using "--source rawcopy" and "--no-table",
> and since they reuse the same file [1], their cleanup handlers will
> try to delete the same file twice. So just ignore the error if the
> file doesn't exist.
> 
> [1] Although they reuse the same file, the resulting output is
> correct, so it appears the file is accessed in properly sequential
> order.
> 
> Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
> ---
>  scripts/lib/wic/plugins/imager/direct.py | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
> index b7e324a..0e8d436 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -548,7 +548,10 @@ class PartitionedImage():
>      def cleanup(self):
>          # remove partition images
>          for image in self.partimages:
> -            os.remove(image)
> +            try:
> +                os.remove(image)
> +            except FileNotFoundError:
> +                pass
>  
>      def assemble(self):
>          logger.debug("Installing partitions")
Would it be better to just skip removing files that have already been
removed?

# remove partition images
for image in set(self.partimages):
    os.remove(image)

--
Regards,
Ed

