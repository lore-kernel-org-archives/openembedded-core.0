Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3AED7773B9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 13:10:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 May 2017 06:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,405,1488873600"; d="scan'208";a="963447071"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 02 May 2017 06:10:18 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id AEA0C6A4006;
	Tue,  2 May 2017 06:10:04 -0700 (PDT)
Date: Tue, 2 May 2017 15:56:38 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: "Andreas J. Reichel" <andreas.reichel@tngtech.com>
Message-ID: <20170502125638.GA17260@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20170421121145.9797-1-andreas.reichel@tngtech.com>
	<20170421121145.9797-2-andreas.reichel@tngtech.com>
MIME-Version: 1.0
In-Reply-To: <20170421121145.9797-2-andreas.reichel@tngtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Andreas Reichel <andreas.reichel.ext@siemens.com>,
	Daniel Wagner <daniel.wagner@siemens.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [wic patch 1/5] wic: Catch errors during image files clean-up
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
X-List-Received-Date: Tue, 02 May 2017 13:10:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 21, 2017 at 02:11:41PM +0200, Andreas J. Reichel wrote:
> Handle exception if a file could not be deleted during clean-up of
> unwanted files, thus preventing a failure of wic in this case.

Can you explain why partition images can't be deleted?
As wic creates them it's not obvious why it can't remove them.

> Signed-off-by: Andreas Reichel <andreas.reichel.ext@siemens.com>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> Signed-off-by: Daniel Wagner <daniel.wagner@siemens.com>
> 
> ---
>  scripts/lib/wic/plugins/imager/direct.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
> index f2e6127331..d6b47ff0bb 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -541,7 +541,12 @@ class PartitionedImage():
>      def cleanup(self):
>          # remove partition images
>          for image in set(self.partimages):
> -            os.remove(image)
> +            try:
> +                os.remove(image)
> +            except IOError as e:
> +                logger.warning(
> +                    "Could not delete file. {0}: I/O error ({1}): {2}\n".format(
> +                    image, e.errno, e.strerror))
>  
>      def assemble(self):
>          logger.debug("Installing partitions")
> -- 
> 2.11.0
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

