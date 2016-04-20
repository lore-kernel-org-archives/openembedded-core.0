Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 53D7A6E681
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 10:36:14 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 20 Apr 2016 03:36:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,509,1455004800"; d="scan'208";a="788542368"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 20 Apr 2016 03:36:15 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 0CA186A4083;
	Wed, 20 Apr 2016 04:23:51 -0700 (PDT)
Date: Wed, 20 Apr 2016 11:16:23 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <20160420081623.GA15596@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1461143852-2263-1-git-send-email-adrian.ratiu@ni.com>
MIME-Version: 1.0
In-Reply-To: <1461143852-2263-1-git-send-email-adrian.ratiu@ni.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: isoimage-isohybrid: add grubefi configfile support
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
X-List-Received-Date: Wed, 20 Apr 2016 10:36:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ioan-Adrian,

Thank you for the patch! My comment is below.
Please, make sure your change doesn't break wic tests.

On Wed, Apr 20, 2016 at 12:17:32PM +0300, Ioan-Adrian Ratiu wrote:
> The latest wic kickstart refactoring introduced a bootloader option
> "--configfile" which lets wks' specify a custom grub.cfg for use
> while booting. This is very useful for creating stuff like boot menus.
> 
> This change lets isoimage-isohybrid use --configfile; if this option is
> not specified in a wks, it generates a default cfg as before.
> 
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  .../lib/wic/plugins/source/isoimage-isohybrid.py   | 59 ++++++++++++++--------
>  1 file changed, 37 insertions(+), 22 deletions(-)
> 
> diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> index bc99283..37d2fc2 100644
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
> @@ -94,33 +95,47 @@ class IsoImagePlugin(SourcePlugin):
>          """
>          Create loader-specific (grub-efi) config
>          """
> -        splash = os.path.join(cr_workdir, "/EFI/boot/splash.jpg")
> -        if os.path.exists(splash):
> -            splashline = "menu background splash.jpg"
> -        else:
> -            splashline = ""
> +        configfile = creator.ks.bootloader.configfile
> +        custom_cfg = None
> +        if configfile:
> +            custom_cfg = get_custom_config(configfile)
> +            if custom_cfg:
> +                # Use a custom configuration for grub
> +                grubefi_conf = custom_cfg
> +                msger.debug("Using custom configuration file "
> +                        "%s for grub.cfg" % configfile)
> +            else:
> +                msger.error("configfile is specified but failed to "
> +                        "get it from %s." % configfile)
>  
> -        bootloader = creator.ks.bootloader
> +        if not custom_cfg:
Looks like you don't need custom_cfg variable here. This code can be put
into 'else' scope of 'if configfile' statement.
> +            splash = os.path.join(cr_workdir, "/EFI/boot/splash.jpg")
> +            if os.path.exists(splash):
> +                splashline = "menu background splash.jpg"
> +            else:
> +                splashline = ""
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
> +            bootloader = creator.ks.bootloader
>  
> -        kernel = "/bzImage"
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
> -        grubefi_conf += "linux %s rootwait %s\n" \
> -            % (kernel, bootloader.append)
> -        grubefi_conf += "initrd /initrd \n"
> -        grubefi_conf += "}\n"
> +            kernel = "/bzImage"
>  
> -        if splashline:
> -            grubefi_conf += "%s\n" % splashline
> +            grubefi_conf += "linux %s rootwait %s\n" \
> +                            % (kernel, bootloader.append)
> +            grubefi_conf += "initrd /initrd \n"
> +            grubefi_conf += "}\n"
> +
> +            if splashline:
> +                grubefi_conf += "%s\n" % splashline
>  
>          msger.debug("Writing grubefi config %s/EFI/BOOT/grub.cfg" \
>                          % cr_workdir)

--
Regards,
Ed

