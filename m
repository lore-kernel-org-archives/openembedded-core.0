Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 46F13719A8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 20:32:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jan 2017 12:32:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,317,1477983600"; d="scan'208";a="1079231355"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 04 Jan 2017 12:32:49 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id F2BDA6A4006;
	Wed,  4 Jan 2017 12:31:55 -0800 (PST)
Date: Wed, 4 Jan 2017 22:19:37 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <20170104201937.GA28348@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20170104190443.25931-1-adrian.ratiu@ni.com>
	<20170104201255.GA28112@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20170104201255.GA28112@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: ken.sharp@ni.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] wic/isoimage-isohybrid: check for grub-mkimage
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
X-List-Received-Date: Wed, 04 Jan 2017 20:32:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 04, 2017 at 10:12:55PM +0200, Ed Bartosh wrote:
> On Wed, Jan 04, 2017 at 09:04:43PM +0200, Ioan-Adrian Ratiu wrote:
> > The isohybrid plugin uses grub-mkimage but doesn't make sure it gets built.
> > Add a check to avoid the following error:
> > 
> > Error: A native program grub-mkimage required to build the image was not found (see details above).
> > 
> > Wic failed to find a recipe to build native grub-mkimage. Please file a bug against wic.
> > 
> > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > ---
> >  scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> > index 849fd8bea3..d616316d61 100644
> > --- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> > +++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> > @@ -242,6 +242,11 @@ class IsoImagePlugin(SourcePlugin):
> >              msger.info("Building mtools-native...\n")
> >              exec_cmd("bitbake mtools-native")
> >  
> > +        # Make sure grub-mkimage is available in native sysroot
> > +        if not os.path.isfile("%s/usr/bin/grub-mkimage" % native_sysroot):
> > +            msger.info("Building grub-native...\n")
> > +            exec_cmd("bitbake grub-native")
> > +
> >      @classmethod
> >      def do_configure_partition(cls, part, source_params, creator, cr_workdir,
> >                                 oe_builddir, bootimg_dir, kernel_dir,
> 
> Unfortunately this approach will not work if wic is run from bitbake.
> 
> I'd suggest to simply add grub-native to NATIVE_RECIPES dictionary in
> scripts/lib/wic/utils/oe/misc.py
> It will make error message more informative and useful.
> 
The same should probably be done with the rest of native tools called from
this module. It's better to avoid building them implicitly.

--
Regards,
Ed

