Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 256BF6010D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 18:00:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 23 Nov 2015 10:00:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,338,1444719600"; d="scan'208";a="605846769"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Nov 2015 10:00:09 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id ED5926A4087;
	Mon, 23 Nov 2015 09:59:01 -0800 (PST)
Date: Mon, 23 Nov 2015 19:28:54 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Mike Crowe <mac@mcrowe.com>
Message-ID: <20151123172854.GA17558@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1447932076-29848-1-git-send-email-mac@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <1447932076-29848-1-git-send-email-mac@mcrowe.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] image.py: Avoid creating empty .env file in _write_wic_env
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
X-List-Received-Date: Mon, 23 Nov 2015 18:00:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Looks good to me.

Acked-by: Ed Bartosh <ed.bartosh@linux.intel.com>

On Thu, Nov 19, 2015 at 11:21:16AM +0000, Mike Crowe wrote:
> Creating a file for every image containing a few variables isn't
> necessary if wic is not being used, so don't write the file if WICVARS
> is empty.
> 
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  meta/lib/oe/image.py | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
> index 8c797ec..ceaade7 100644
> --- a/meta/lib/oe/image.py
> +++ b/meta/lib/oe/image.py
> @@ -336,6 +336,10 @@ class Image(ImageDepGraph):
>          Write environment variables used by wic
>          to tmp/sysroots/<machine>/imgdata/<image>.env
>          """
> +        wicvars = self.d.getVar('WICVARS', True)
> +        if not wicvars:
> +            return
> +
>          stdir = self.d.getVar('STAGING_DIR_TARGET', True)
>          outdir = os.path.join(stdir, 'imgdata')
>          try:
> @@ -350,7 +354,7 @@ class Image(ImageDepGraph):
>                  raise
>          basename = self.d.getVar('IMAGE_BASENAME', True)
>          with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
> -            for var in self.d.getVar('WICVARS', True).split():
> +            for var in wicvars.split():
>                  value = self.d.getVar(var, True)
>                  if value:
>                      envf.write('%s="%s"\n' % (var, value.strip()))
> -- 
> 2.1.4
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

