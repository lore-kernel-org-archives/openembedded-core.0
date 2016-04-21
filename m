Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AADC16FF9B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 16:56:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 21 Apr 2016 09:56:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,513,1455004800"; d="scan'208";a="950099752"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 21 Apr 2016 09:56:56 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 97CB86A4006;
	Thu, 21 Apr 2016 10:44:32 -0700 (PDT)
Date: Thu, 21 Apr 2016 17:37:04 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <20160421143704.GA30824@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <36d7622248270bd13e2701d7a8c8caf66c67a128.1461233389.git.adrian.ratiu@ni.com>
MIME-Version: 1.0
In-Reply-To: <36d7622248270bd13e2701d7a8c8caf66c67a128.1461233389.git.adrian.ratiu@ni.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 1/2] wic: isoimage-isohybrid: add grubefi configfile support
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
X-List-Received-Date: Thu, 21 Apr 2016 16:56:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ioan-Adrian,

Great! Thank you!

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

On Thu, Apr 21, 2016 at 01:10:12PM +0300, Ioan-Adrian Ratiu wrote:
> The latest wic kickstart refactoring introduced a bootloader option
> "--configfile" which lets wks' specify a custom grub.cfg for use
> while booting. This is very useful for creating stuff like boot menus.
> 
> This change lets isoimage-isohybrid use --configfile; if this option is
> not specified in a wks, it generates a default cfg as before.
> 
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  .../lib/wic/plugins/source/isoimage-isohybrid.py   | 53 +++++++++++++---------
>  1 file changed, 32 insertions(+), 21 deletions(-)
> 
> diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> index bc99283..8440581 100644
> --- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> +++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> @@ -27,6 +27,7 @@ import glob
>  
>  from wic import msger
>  from wic.pluginbase import SourcePlugin
> +from wic.utils.misc import get_custom_config
>  from wic.utils.oe.misc import exec_cmd, exec_native_cmd, get_bitbake_var
>  
>  class IsoImagePlugin(SourcePlugin):
> @@ -94,33 +95,43 @@ class IsoImagePlugin(SourcePlugin):
>          """
>          Create loader-specific (grub-efi) config
>          """
> -        splash = os.path.join(cr_workdir, "/EFI/boot/splash.jpg")
> -        if os.path.exists(splash):
> -            splashline = "menu background splash.jpg"
> +        configfile = creator.ks.bootloader.configfile
> +        if configfile:
> +            grubefi_conf = get_custom_config(configfile)
> +            if grubefi_conf:
> +                msger.debug("Using custom configuration file "
> +                        "%s for grub.cfg" % configfile)
> +            else:
> +                msger.error("configfile is specified but failed to "
> +                        "get it from %s." % configfile)
>          else:
> -            splashline = ""
> +            splash = os.path.join(cr_workdir, "/EFI/boot/splash.jpg")
> +            if os.path.exists(splash):
> +                splashline = "menu background splash.jpg"
> +            else:
> +                splashline = ""
>  
> -        bootloader = creator.ks.bootloader
> +            bootloader = creator.ks.bootloader
>  
> -        grubefi_conf = ""
> -        grubefi_conf += "serial --unit=0 --speed=115200 --word=8 "
> -        grubefi_conf += "--parity=no --stop=1\n"
> -        grubefi_conf += "default=boot\n"
> -        grubefi_conf += "timeout=%s\n" % (bootloader.timeout or 10)
> -        grubefi_conf += "\n"
> -        grubefi_conf += "search --set=root --label %s " % part.label
> -        grubefi_conf += "\n"
> -        grubefi_conf += "menuentry 'boot'{\n"
> +            grubefi_conf = ""
> +            grubefi_conf += "serial --unit=0 --speed=115200 --word=8 "
> +            grubefi_conf += "--parity=no --stop=1\n"
> +            grubefi_conf += "default=boot\n"
> +            grubefi_conf += "timeout=%s\n" % (bootloader.timeout or 10)
> +            grubefi_conf += "\n"
> +            grubefi_conf += "search --set=root --label %s " % part.label
> +            grubefi_conf += "\n"
> +            grubefi_conf += "menuentry 'boot'{\n"
>  
> -        kernel = "/bzImage"
> +            kernel = "/bzImage"
>  
> -        grubefi_conf += "linux %s rootwait %s\n" \
> -            % (kernel, bootloader.append)
> -        grubefi_conf += "initrd /initrd \n"
> -        grubefi_conf += "}\n"
> +            grubefi_conf += "linux %s rootwait %s\n" \
> +                            % (kernel, bootloader.append)
> +            grubefi_conf += "initrd /initrd \n"
> +            grubefi_conf += "}\n"
>  
> -        if splashline:
> -            grubefi_conf += "%s\n" % splashline
> +            if splashline:
> +                grubefi_conf += "%s\n" % splashline
>  
>          msger.debug("Writing grubefi config %s/EFI/BOOT/grub.cfg" \
>                          % cr_workdir)
> -- 
> 2.8.0
> 

-- 
--
Regards,
Ed

