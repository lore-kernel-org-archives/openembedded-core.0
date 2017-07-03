Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 545AD7309A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 08:47:52 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jul 2017 01:47:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,302,1496127600"; d="scan'208";a="874244026"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Jul 2017 01:47:52 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id D1C3558056B;
	Mon,  3 Jul 2017 01:47:51 -0700 (PDT)
Date: Mon, 3 Jul 2017 11:36:02 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <20170703083602.GA5532@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20170630175330.33908-1-alejandro.hernandez@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20170630175330.33908-1-alejandro.hernandez@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bootimg-efi.py: Use IMGDEPLOYDIR instead of DEPLOY_DIR_IMAGE for initrd
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
X-List-Received-Date: Mon, 03 Jul 2017 08:47:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 30, 2017 at 10:53:30AM -0700, Alejandro Hernandez wrote:
> When using wic to create an image from a certain build, wic is expecting
> to find initrd at the final destination of our images (DEPLOY_DIR_IMAGE),
> which is wrong, since the initrd file has not been copied to the final
> directory yet,

Is it possible to ensure that initrd is deployed before wic is run by
making do_image_wic depend on initrd deploy task?

> so instead of trying to use an initrd file from 
> DEPLOY_DIR_IMAGE we get it from IMGDEPLOYDIR, which is the directory 
> where the resulting images are placed before their final destination, 
> and its where we can find the correct initrd file for our image.
> 
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
> index 9879cb9fceb..d1d445ecfe1 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -105,9 +105,9 @@ class BootimgEFIPlugin(SourcePlugin):
>  
>          if initrd:
>              # obviously we need to have a common common deploy var
> -            bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
> +            bootimg_dir = get_bitbake_var("IMGDEPLOYDIR")
>              if not bootimg_dir:
> -                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
> +                raise WicError("Couldn't find IMGDEPLOYDIR, exiting")
>  
>              cp_cmd = "cp %s/%s %s" % (bootimg_dir, initrd, hdddir)
>              exec_cmd(cp_cmd, True)
> -- 
> 2.12.0
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

