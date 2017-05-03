Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0F169607F8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 10:46:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 May 2017 03:46:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,283,1491289200"; d="scan'208";a="1163982427"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 03 May 2017 03:46:35 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 1857E6A4082;
	Wed,  3 May 2017 03:46:20 -0700 (PDT)
Date: Wed, 3 May 2017 13:32:52 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Andreas Reichel <Andreas.Reichel@tngtech.com>
Message-ID: <20170503103252.GA20927@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20170421121145.9797-1-andreas.reichel@tngtech.com>
	<20170421121145.9797-2-andreas.reichel@tngtech.com>
	<20170502125638.GA17260@linux.intel.com>
	<20170503084552.GA1431@tng>
MIME-Version: 1.0
In-Reply-To: <20170503084552.GA1431@tng>
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
X-List-Received-Date: Wed, 03 May 2017 10:46:35 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, May 03, 2017 at 10:45:52AM +0200, Andreas Reichel wrote:
> On Tue, May 02, 2017 at 03:56:38PM +0300, Ed Bartosh wrote:
> > On Fri, Apr 21, 2017 at 02:11:41PM +0200, Andreas J. Reichel wrote:
> > > Handle exception if a file could not be deleted during clean-up of
> > > unwanted files, thus preventing a failure of wic in this case.
> > 
> > Can you explain why partition images can't be deleted?
> > As wic creates them it's not obvious why it can't remove them.
> > 
> As part of our internal project, we generate artifacts to be packaged
> in further archives and only contain one single partition image. The
> image generation process is solely done by wic and post-processing
> scripts, therefore we always used the .p2 file for the root partition,
> that had already peen patched (for example fstab by wic). Suddenly the
> file was missing and CI was not working anymore.
I'd suggest to investigate this further and find out why it disappeared.

> Here, instead of
> just stating, that *nobody* needs these files, my idea was to
> introduce a parameter, so that people can chose if they want them or
> not.
This makes sense to do. However, it doesn't explain nor justify this
particual change.

> We do not want to generate any image artifacts with bitbake to keep
> things separated better.
> Just saving space is not a valid argument to me because building
> a system with bitbake needs up to 50 GB and if you do it for several
> machines, a few hundred MB should not matter. However, no problem for me
> to delete them per standard, if you say *most* people don' use them.
I'm ok with the option to preserve partition files. I don't understand
the reason for this change though. It looks like a workaround to me.
It's better to find a real reason and fix it.


> > > Signed-off-by: Andreas Reichel <andreas.reichel.ext@siemens.com>
> > > Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> > > Signed-off-by: Daniel Wagner <daniel.wagner@siemens.com>
> > > 
> > > ---
> > >  scripts/lib/wic/plugins/imager/direct.py | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
> > > index f2e6127331..d6b47ff0bb 100644
> > > --- a/scripts/lib/wic/plugins/imager/direct.py
> > > +++ b/scripts/lib/wic/plugins/imager/direct.py
> > > @@ -541,7 +541,12 @@ class PartitionedImage():
> > >      def cleanup(self):
> > >          # remove partition images
> > >          for image in set(self.partimages):
> > > -            os.remove(image)
> > > +            try:
> > > +                os.remove(image)
> > > +            except IOError as e:
> > > +                logger.warning(
> > > +                    "Could not delete file. {0}: I/O error ({1}): {2}\n".format(
> > > +                    image, e.errno, e.strerror))
> > >  
> > >      def assemble(self):
> > >          logger.debug("Installing partitions")
> > > -- 
> > > 2.11.0
> > > 
> > > -- 
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > 
> > -- 
> > --
> > Regards,
> > Ed
> 
> -- 
> Andreas Reichel 
> Dipl.-Phys. (Univ.) 
> Software Consultant
> 
> Andreas.Reichel@tngtech.com 
> +49-174-3180074
> 
> TNG Technology Consulting GmbH, Betastr. 13a, 85774 Unterföhring
> Geschäftsführer: Henrik Klagges, Christoph Stock, Dr. Robert Dahlke
> Sitz: Unterföhring * Amtsgericht München * HRB 135082



-- 
--
Regards,
Ed

