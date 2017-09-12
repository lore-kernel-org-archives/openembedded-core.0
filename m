Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC716012A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 12:58:09 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Sep 2017 05:58:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,383,1500966000"; d="scan'208";a="127951529"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 12 Sep 2017 05:58:10 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 8E5635800E6;
	Tue, 12 Sep 2017 05:58:09 -0700 (PDT)
Date: Tue, 12 Sep 2017 15:57:20 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20170912125720.lj6rwuclmbrd6fx2@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20170908173303.29634-1-enrico.scholz@sigma-chemnitz.de>
	<20170908173303.29634-4-enrico.scholz@sigma-chemnitz.de>
	<20170911134150.6jpsypaj4dgjv67t@linux.intel.com>
	<lyzia1fi13.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20170912085301.rfsiwojqn2nr6md5@linux.intel.com>
	<lymv60fdzx.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20170912114837.ytzatxdw2cqcwsyz@linux.intel.com>
	<lya820f6u6.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <lya820f6u6.fsf@ensc-virt.intern.sigma-chemnitz.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20170421 (1.8.2)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] wic: apply --extra-space + --overhead to squashfs
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
X-List-Received-Date: Tue, 12 Sep 2017 12:58:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 12, 2017 at 02:18:41PM +0200, Enrico Scholz wrote:
> Ed Bartosh <ed.bartosh@linux.intel.com> writes:
> 
> >> >> >> The --extra-space and --overhead option did not had an effect to squashfs
> >> >> >> partitions.  Although squashfs is read-only, it can be useful to allocate
> >> >> >> more space for the on-disk partition to avoid repartitioning of the whole
> >> >> >> disk when a new (and larger) squashfs image is written on later updates.
> >> >> >
> >> >> > Is it possible to just use --size or --fixed-size in .wks to allocate
> >> >> > partition of certain size?
> >> >> 
> >> >> --fixed-size works with this patch (tested); --size should work.
> >> >
> >> > Sorry for not being clear. Why do we need this if we can use --size to
> >> > explicity specify partition size?
> >> 
> >> --size and --fixed-size did not had an effect for squashfs with the old
> >> code.
> >>
> >
> > I'd propose to fix this instead of applying extra space and overhead
> > factor to the filesystems that don't support this by design.
> >
> > The idea is to make size and fixed-size parameters to set partition size
> > and use extra-space and overhead-factor to extend filesystem size as
> > they're currently used.
> 
> For what is this overhead to be used?  In most cases, to allow future
> updates.  And this is required for squashfs too.
> 

It depends on the usage scenario. Additional space may be required
for other purposes too. It may me needed for the system to be able to
boot and perform what it was built for.

> Only difference is, that updates for squashfs are to be applied on
> partition level and these for other file systems on file system level.
> But the need for extra space exists in both cases.
> 
> 
> >> I want/need it to allow updates of the running system without complete
> >> repartitioning.  E.g. at wic creation time, the squashfs has a certain
> >> size.  Sometime in the future, there are needed e.g. 5 MiB more because
> >> a new package was added or so.
> >>
> >
> > Yep, I understood what you want. I think it's better achieved by setting
> > partition size with --size option than artificially apply extra-space and
> > overhead factor to the filesystem that doesn't support this.
> 
> It really does not matter for me whether the filesystem itself can be
> extended or whether I need a larger partition to apply future updates.
> 

It matters for me. I think I explained why.

> I just need a partition which provides an absolute or relative amount of
> additional space.
> 
> 
> >> I need to reserve space in the partition so that I can 'dd' the new
> >> image without a complete repartitioning.
> >> 
> >> --extra-space/--overhead has the meaning which I want (e.g. to say
> >> "reserve +20% for changes in the future").
> >
> > So far extra-space and overhead factor were used to allocate additional
> > space on the file system. This is different from the way you want to
> > use them. You're not allocating space on squashfs, you're allocating
> > unformatted space on the partition. It's better to use --size for this.
> 
> No; --size is not what I want. --size (or --fixed-size) assume that I
> know the absolute size.
> 
> Of course, I can get this size empirically.  But it is highly inflexible
> and requires different wks files for different image types.
> 
> I want to reserve an extra percentage for future updates.  And these
> percentages can be in the range of 1 - 5 MB (for small images with
> only test tools) or several hundred MB (for large image types with
> e.g. desktop environments).
> 
> --size or --fixed-size for these image types would be in completely
> different ranges while --extra-space/--overhead fits to all.
> 

I agree. --size is less suitable for your needs than extra space and
overhead factor. I still don't like the idea of using them to reserve
non-formatted space. Any other ideas how to do it?

--
Regards,
Ed

