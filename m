Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D5A376FF56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 12:35:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 19 Apr 2016 05:35:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,506,1455004800"; d="scan'208";a="961875011"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 19 Apr 2016 05:35:28 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 175B36A4006;
	Tue, 19 Apr 2016 06:23:04 -0700 (PDT)
Date: Tue, 19 Apr 2016 13:15:36 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <20160419101536.GA7585@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1460983582-15284-1-git-send-email-adrian.ratiu@ni.com>
	<20160418132411.GA27403@linux.intel.com>
	<20160419151756.65c09607@adi-pc-linux.emea.corp.natinst.com>
MIME-Version: 1.0
In-Reply-To: <20160419151756.65c09607@adi-pc-linux.emea.corp.natinst.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: isoimage-isohybrid: implement grubefi menu logic
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
X-List-Received-Date: Tue, 19 Apr 2016 12:35:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ioan-Adrian,

It's my fault as I've rewritten ks parser and missed --menu implementation.
Let me know if you need my help with this.

It would be great if you also add test case for this feature to wic oe-selftest suite.

Regards,
Ed

On Tue, Apr 19, 2016 at 03:17:56PM +0300, Ioan-Adrian Ratiu wrote:
> Hello Ed,
> 
> I've tested it on Jethro. Sorry about this. I'll look at the changes in wic's kickstart and redo/resubmit.
> 
> Thank you,
> Ioan
> 
> On Mon, 18 Apr 2016 16:24:11 +0300
> Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> 
> > Hi Ioan-Adrian,
> > 
> > Did you test if this patch works on master?
> > From the first look I'd say it will not work as --menu bootloader
> > option is not implemented there.
> > 
> > On Mon, Apr 18, 2016 at 03:46:22PM +0300, Ioan-Adrian Ratiu wrote:
> > > Right now isoimage-isohybrid creates a single boot menu entry "boot"
> > > and passes it the arguments supplied with "--append". There is logic
> > > for creating custom grub menus, but it is sadly not used. "boot" is
> > > hardcoded.
> > > 
> > > This change makes isoimage use the wic bootloader "--menu" argument to
> > > create its menus. The syntax used for menu specification was chosen so
> > > it does not conflict with the kernel parameter syntax (you can pass
> > > custom kernel arguments from the generated grub menu entries, like for
> > > example silent booting, thread affinity etc.).
> > > 
> > > The "--menu" argument syntax is as following. The argument supplies a
> > > collection of menu entry names and kernel parameters. Menu name entries
> > > can contain any ASCII character except | or : which are separators.
> > > Kernel parameters obey the syntax defined by the kernel documentation.
> > > | is the menu separator and : is the separator between the menu names
> > > and parameters.
> > > 
> > > Example for use in wks files:
> > >   --menu "Menu Name:firstarg,secondard|Menu Name 2:anotherarg,otherarg"
> > > 
> > > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > > ---
> > >  .../lib/wic/plugins/source/isoimage-isohybrid.py   | 35 ++++++++++++++++------
> > >  1 file changed, 26 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> > > index bc99283..4b0b035 100644
> > > --- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> > > +++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> > > @@ -101,23 +101,40 @@ class IsoImagePlugin(SourcePlugin):
> > >              splashline = ""
> > >  
> > >          bootloader = creator.ks.bootloader
> > > +        kernel = "/bzImage"
> > > +        default_options = bootloader.append
> > > +        default_menu_to_boot = "Default boot"
> > > +        grub_menus = ""
> > > +
> > > +        # menu separators are '|', custom boot args separated by ':', ex.
> > > +        # --menu "Menu Name:firstarg,secondard|Menu Name 2:anotherarg,otherarg"
> > > +        for menu in bootloader.menus.split('|'):
> > > +            menu_list = menu.split(":")
> > > +            menu_name = menu_list[0]
> > > +            grub_menu_options = ""
> > > +
> > > +            if (len(menu_list) > 1):
> > > +                menu_params = menu_list[1]
> > > +                for param in menu_params.split(','):
> > > +                    if param.lower() == "default":
> > > +                        default_menu_to_boot = menu_name
> > > +                    else: grub_menu_options += " " + param
> > > +
> > > +            grub_menus += "menuentry '%s' {\n" % menu_name
> > > +            grub_menus += "linux %s rootwait %s %s\n" % \
> > > +                (kernel, default_options, grub_menu_options)
> > > +            grub_menus += "initrd /initrd \n"
> > > +            grub_menus += "}\n"
> > >  
> > >          grubefi_conf = ""
> > >          grubefi_conf += "serial --unit=0 --speed=115200 --word=8 "
> > >          grubefi_conf += "--parity=no --stop=1\n"
> > > -        grubefi_conf += "default=boot\n"
> > > +        grubefi_conf += "default=%s\n" % default_menu_to_boot
> > >          grubefi_conf += "timeout=%s\n" % (bootloader.timeout or 10)
> > >          grubefi_conf += "\n"
> > >          grubefi_conf += "search --set=root --label %s " % part.label
> > >          grubefi_conf += "\n"
> > > -        grubefi_conf += "menuentry 'boot'{\n"
> > > -
> > > -        kernel = "/bzImage"
> > > -
> > > -        grubefi_conf += "linux %s rootwait %s\n" \
> > > -            % (kernel, bootloader.append)
> > > -        grubefi_conf += "initrd /initrd \n"
> > > -        grubefi_conf += "}\n"
> > > +        grubefi_conf += grub_menus
> > >  
> > >          if splashline:
> > >              grubefi_conf += "%s\n" % splashline  
> > 
> > --
> > Regards,
> > Ed
> 

-- 
--
Regards,
Ed

