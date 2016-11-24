Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A0DA560069
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 14:52:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 24 Nov 2016 06:52:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,543,1473145200"; d="scan'208";a="790345857"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Nov 2016 06:52:07 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 980346A4080;
	Thu, 24 Nov 2016 06:51:24 -0800 (PST)
Date: Thu, 24 Nov 2016 16:51:36 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <20161124145136.GA31813@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1479813004.3239.19.camel@intel.com>
	<6913e4bf-96dc-eefa-d214-9df5cde181b8@mender.io>
	<20161123120816.GC12545@linux.intel.com>
	<5064cacc-e724-c7b8-9631-3d961c5a29f6@mender.io>
	<20161123132229.GA13863@linux.intel.com>
	<1479916616.31880.48.camel@intel.com>
	<20161124061543.e2xpgh7zjir3oynk@pengutronix.de>
	<fa1edaed-1498-160e-2015-8b7882c04877@mender.io>
	<20161124132315.GA14497@linux.intel.com>
	<1e1a7126-15dc-33be-a863-ea93063b554f@mender.io>
MIME-Version: 1.0
In-Reply-To: <1e1a7126-15dc-33be-a863-ea93063b554f@mender.io>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Contents of non-rootfs partitions
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
X-List-Received-Date: Thu, 24 Nov 2016 14:52:06 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Nov 24, 2016 at 03:43:18PM +0100, Kristian Amlie wrote:
> On 24/11/16 14:23, Ed Bartosh wrote:
> > On Thu, Nov 24, 2016 at 08:38:46AM +0100, Kristian Amlie wrote:
> >> On 24/11/16 07:15, Ulrich Ölmann wrote:
> >>> Hi,
> >>>
> >>> On Wed, Nov 23, 2016 at 04:56:56PM +0100, Patrick Ohly wrote:
> >>>> On Wed, 2016-11-23 at 15:22 +0200, Ed Bartosh wrote:
> >>>>> On Wed, Nov 23, 2016 at 02:08:28PM +0100, Kristian Amlie wrote:
> >>>>>> On 23/11/16 13:08, Ed Bartosh wrote:
> >>>>>>> On Tue, Nov 22, 2016 at 12:54:52PM +0100, Kristian Amlie wrote:
> >>>>>>> [...]
> >>>>>>> This can be done by extending existing rootfs plugin. It should be able
> >>>>>>> to do 2 things:
> >>>>>>>
> >>>>>>> - populate content of one rootfs directory to the partition. We can
> >>>>>>>   extend syntax of --rootfs-dir parameter to specify optional directory path to use
> >>>>>>>
> >>>>>>> - exclude rootfs directories when populating partitions. I'd propose to
> >>>>>>>   introduce --exclude-dirs wks parser option to handle this.
> >>>>>>>
> >>>>>>> Example of wks file with proposed new options:
> >>>>>>> part /     --source rootfs --rootfs-dir=core-image-minimal       --ondisk sda --fstype=ext4 --label root --align 1024 --exclude-dirs data --exclude-dirs home
> >>>>>>> part /data --source rootfs --rootfs-dir=core-image-minimal:/home --ondisk sda --fstype=ext4 --label data --align 1024
> >>>>>>> part /home --source rootfs --rootfs-dir=core-image-minimal:/data --ondisk sda --fstype=ext4 --label data --align 1024
> >>>>>>>
> >>>>>>> Does this make sense?
> >>>>>>
> >>>>>> Looks good. The only thing I would question is that, in the interest of
> >>>>>> reducing redundancy, maybe we should omit --exclude-dirs and have wic
> >>>>>> figure this out by combining all the entries, since "--exclude-dirs
> >>>>>> <dir>" and the corresponding "part <dir>" will almost always come in
> >>>>>> pairs. Possibly we could mark the "/" partition with one single
> >>>>>> --no-overlapping-dirs to force wic to make this consideration. Or do you
> >>>>>> think that's too magical?
> >>>>>>
> >>>>> Tt's quite implicit from my point of view. However, if people like it we
> >>>>> can implement it this way.
> >>>>
> >>>> I prefer the explicit --exclude-dirs. It's less surprising and perhaps
> >>>> there are usages for having the same content in different partitions
> >>>> (redundancy, factory reset, etc.).
> >>>>
> >>>> Excluding only the directory content but not the actual directory is
> >>>> indeed a good point. I'm a bit undecided. When excluding only the
> >>>> directory content, there's no way of building a rootfs without that
> >>>> mount point, if that's desired. OTOH, when excluding also the directory,
> >>>> the data would have to be staged under a different path in the rootfs
> >>>> and the mount point would have to be a separate, empty directory.
> >>>>
> >>>> I'm leaning towards excluding the directory content and keeping the
> >>>> directory.
> >>>
> >>> what about having both possibilities by leaning against the syntax that rsync
> >>> uses to specify if a whole source directory or only it's contents shall be
> >>> synced to some destination site (see [1])?
> >>>
> >>> In analogy to this to exclude only the contents of the directory named 'data'
> >>> you would use
> >>>
> >>>   --exclude-dirs data/
> >>>
> >>> but to additionally exclude the dir itself as well it would read
> >>>
> >>>   --exclude-dirs data
> >>
> >> This is creative, but ultimately too unintuitive IMHO. Rsync is the only
> >> tool which uses this syntax AFAIK, and it's a constant source of
> >> confusion, especially when mixed with cp or similar commands.
> >>
> > 
> > Would this way be less intuitive?
> > --exclude-path data/*
> > --exclude-path data
> > 
> > We can go even further with it allowing any level of directories:
> > --exclude-path data/tmp/*
> > --exclude-path data/db/tmp
> > ...
> 
> I agree, this is pretty unambiguous and easy to understand.
> 
> But this raises the question: Should we go all the way and support
> wildcards? Which might make it a bit complicated. Maybe support only
> pure '*' for now?

As it shouldn't be hard to implement I'd go for it.

--
Regards,
Ed

