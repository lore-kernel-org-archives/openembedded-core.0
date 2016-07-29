Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 62959607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 15:35:06 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 29 Jul 2016 08:35:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,440,1464678000"; d="scan'208";a="855913187"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 29 Jul 2016 08:35:04 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 5A59B6A4006;
	Fri, 29 Jul 2016 08:34:52 -0700 (PDT)
Date: Fri, 29 Jul 2016 17:58:34 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160729145834.GA18680@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1469799731.git.ed.bartosh@linux.intel.com>
	<6b6fbba91ea7ac508bc8f8c53287ac90bdcff1b7.1469799731.git.ed.bartosh@linux.intel.com>
	<1469802570.9142.74.camel@linuxfoundation.org>
	<1469802972.9142.77.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1469802972.9142.77.camel@linuxfoundation.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5 1/2] image creation: support converting masked types
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
X-List-Received-Date: Fri, 29 Jul 2016 15:35:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 29, 2016 at 03:36:12PM +0100, Richard Purdie wrote:
> On Fri, 2016-07-29 at 15:29 +0100, Richard Purdie wrote:
> > On Fri, 2016-07-29 at 16:44 +0300, Ed Bartosh wrote:
> > > From: Patrick Ohly <patrick.ohly@intel.com>
> > > 
> > > Conversion to vmdk/vdi/qcow2 is also useful for other base images
> > > types, not just for .hdddirect. This can be achieved by definining
> > > them as conversion commands and relying on the conversion chaining
> > > to convert arbitrary base images.
> > > 
> > > For this to work when the base image gets created by a masked image
> > > type, the additional conversion commands now get executed in a
> > > do_image_complete prefunc.
> > > 
> > > With all of that in place it becomes possible to remove the special
> > > purpose code for vmdk/vdi/qcow2 types from image-vm.bbclass and
> > > several other classes. This has (intentional!) implications on the
> > > valid IMAGE_FSTYPES and the file suffices: now
> > > "hdddirect.vmdk/vdi/qcow2" must be used as IMAGE_FSTYPES to select
> > > the
> > > former special-case types "vmdk/vdi/qcow2", and the image files and
> > > links will also have the extra .hdddirect suffix.
> > > 
> > > This is intentional because it makes it makes it possible to
> > > distinguish between virtual machine images created from .hdddirect
> > > and
> > > those created from other base images.
> > > 
> > > The new support for virtual machine images can also be combined
> > > with
> > > compression, thus making it possible to create image files for
> > > publication in compressed format, for example with:
> > >   IMAGE_FSTYPES = "hdddirect.vdi.xz"
> > 
> > I'm afraid I really don't like this. The direction this code has
> > taken
> > is to separate out the different steps into clearly identifiable
> > tasks.
> > This was due to strong user feedback that nobody could figure out
> > what
> > was going on. This change starts to merge them all back together,
> > hiding them in a prefunc of a task which is just horrible.
> > 
> > I haven't looked in detail at the problem thats being attempted to be
> > solved here but this doesn't look like a good approach at all and
> > takes
> > us backwards rather than forwards.
> > 
> > So, sorry, but no.
> 
> Staring at and thinking about this some more, I think the description
> doesn't do this patch any favours. I'd phrase this as:
> 
> "Make the vmdk/vdi/qcow2 image types behave more as compression type
> post processes".
> 
> I'm more than fine with that and it makes sense. I don't however think
> the "masked" bits of this patch look right. These should be able to
> become compression types without the masked changes.
> 
> Its possible there is another step this patch is trying to make, such
> as supporting chained compression. If that is the case it should be a
> separate patch.
> 

Thank you for reviewing this.

OK, I'll drop this one too. I'll send only one COMPRESSION->CONVERSION
patch as it fixes 2.2M3 bug.

--
Regards,
Ed

