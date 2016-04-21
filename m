Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0ACEC60017
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 09:23:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Apr 2016 02:23:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,512,1455004800"; d="scan'208";a="937088467"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 21 Apr 2016 02:23:23 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 0A05E6A4006;
	Thu, 21 Apr 2016 03:10:59 -0700 (PDT)
Date: Thu, 21 Apr 2016 10:03:31 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <20160421070331.GA24300@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1461164775-2983-1-git-send-email-adrian.ratiu@ni.com>
	<20160420180838.49f65959@adi-pc-linux.emea.corp.natinst.com>
MIME-Version: 1.0
In-Reply-To: <20160420180838.49f65959@adi-pc-linux.emea.corp.natinst.com>
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
X-List-Received-Date: Thu, 21 Apr 2016 09:23:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 20, 2016 at 06:08:38PM +0300, Ioan-Adrian Ratiu wrote:
> I forgot to mention this is v2... sorry.
> 
> On Wed, 20 Apr 2016 18:06:15 +0300
> Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> 
> > The latest wic kickstart refactoring introduced a bootloader option
> > "--configfile" which lets wks' specify a custom grub.cfg for use
> > while booting. This is very useful for creating stuff like boot menus.
> > 
> > This change lets isoimage-isohybrid use --configfile; if this option is
> > not specified in a wks, it generates a default cfg as before.
> > 
> > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > ---
> >  .../lib/wic/plugins/source/isoimage-isohybrid.py   | 53 +++++++++++++---------
> >  1 file changed, 32 insertions(+), 21 deletions(-)
> > 
> > diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> > index bc99283..8440581 100644
> > --- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> > +++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> > @@ -27,6 +27,7 @@ import glob
> >  
> >  from wic import msger
> >  from wic.pluginbase import SourcePlugin
> > +from wic.utils.misc import get_custom_config
> >  from wic.utils.oe.misc import exec_cmd, exec_native_cmd, get_bitbake_var
> >  
> >  class IsoImagePlugin(SourcePlugin):
> > @@ -94,33 +95,43 @@ class IsoImagePlugin(SourcePlugin):
> >          """
> >          Create loader-specific (grub-efi) config
> >          """
> > -        splash = os.path.join(cr_workdir, "/EFI/boot/splash.jpg")
> > -        if os.path.exists(splash):
> > -            splashline = "menu background splash.jpg"
> > +        configfile = creator.ks.bootloader.configfile
> > +        if configfile:
> > +            grubefi_conf = get_custom_config(configfile)
> > +            if grubefi_conf:
> > +                msger.debug("Using custom configuration file "
> > +                        "%s for grub.cfg" % configfile)
> > +            else:
> > +                msger.error("configfile is specified but failed to "
> > +                        "get it from %s." % configfile)
> >          else:
> > -            splashline = ""
> > +            splash = os.path.join(cr_workdir, "/EFI/boot/splash.jpg")
I know, it's not your code, but it looks like the result path(splash
variable) will not include workdir. Look:

In [2]: os.path.join('/path/to/workdir', '/EFI/boot/splash.jpg')
Out[2]: '/EFI/boot/splash.jpg'

In [3]: os.path.join('/path/to/workdir/', '/EFI/boot/splash.jpg')
Out[3]: '/EFI/boot/splash.jpg'

It works this way:
In [4]: os.path.join('/path/to/workdir/', 'EFI/boot/splash.jpg')
Out[4]: '/path/to/workdir/EFI/boot/splash.jpg'

> > +            if os.path.exists(splash):
> > +                splashline = "menu background splash.jpg"
> > +            else:
> > +                splashline = ""
> >  
> > -        bootloader = creator.ks.bootloader
> > +            bootloader = creator.ks.bootloader
> >  
> > -        grubefi_conf = ""
> > -        grubefi_conf += "serial --unit=0 --speed=115200 --word=8 "
> > -        grubefi_conf += "--parity=no --stop=1\n"
> > -        grubefi_conf += "default=boot\n"
> > -        grubefi_conf += "timeout=%s\n" % (bootloader.timeout or 10)
> > -        grubefi_conf += "\n"
> > -        grubefi_conf += "search --set=root --label %s " % part.label
> > -        grubefi_conf += "\n"
> > -        grubefi_conf += "menuentry 'boot'{\n"
> > +            grubefi_conf = ""
> > +            grubefi_conf += "serial --unit=0 --speed=115200 --word=8 "
> > +            grubefi_conf += "--parity=no --stop=1\n"
> > +            grubefi_conf += "default=boot\n"
> > +            grubefi_conf += "timeout=%s\n" % (bootloader.timeout or 10)
> > +            grubefi_conf += "\n"
> > +            grubefi_conf += "search --set=root --label %s " % part.label
> > +            grubefi_conf += "\n"
> > +            grubefi_conf += "menuentry 'boot'{\n"
> >  
> > -        kernel = "/bzImage"
> > +            kernel = "/bzImage"
> >  
> > -        grubefi_conf += "linux %s rootwait %s\n" \
> > -            % (kernel, bootloader.append)
> > -        grubefi_conf += "initrd /initrd \n"
> > -        grubefi_conf += "}\n"
> > +            grubefi_conf += "linux %s rootwait %s\n" \
> > +                            % (kernel, bootloader.append)
> > +            grubefi_conf += "initrd /initrd \n"
> > +            grubefi_conf += "}\n"
> >  
> > -        if splashline:
> > -            grubefi_conf += "%s\n" % splashline
> > +            if splashline:
> > +                grubefi_conf += "%s\n" % splashline
> >  
> >          msger.debug("Writing grubefi config %s/EFI/BOOT/grub.cfg" \
> >                          % cr_workdir)
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

