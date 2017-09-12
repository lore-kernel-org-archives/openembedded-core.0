Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 496A5783DB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 11:49:26 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Sep 2017 04:49:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,383,1500966000"; d="scan'208";a="310723290"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 12 Sep 2017 04:49:27 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id B5D5A5800E6;
	Tue, 12 Sep 2017 04:49:26 -0700 (PDT)
Date: Tue, 12 Sep 2017 14:48:37 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20170912114837.ytzatxdw2cqcwsyz@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20170908173303.29634-1-enrico.scholz@sigma-chemnitz.de>
	<20170908173303.29634-4-enrico.scholz@sigma-chemnitz.de>
	<20170911134150.6jpsypaj4dgjv67t@linux.intel.com>
	<lyzia1fi13.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20170912085301.rfsiwojqn2nr6md5@linux.intel.com>
	<lymv60fdzx.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <lymv60fdzx.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Tue, 12 Sep 2017 11:49:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 12, 2017 at 11:44:02AM +0200, Enrico Scholz wrote:
> Ed Bartosh <ed.bartosh@linux.intel.com> writes:
> 
> >> >> The --extra-space and --overhead option did not had an effect to squashfs
> >> >> partitions.  Although squashfs is read-only, it can be useful to allocate
> >> >> more space for the on-disk partition to avoid repartitioning of the whole
> >> >> disk when a new (and larger) squashfs image is written on later updates.
> >> >
> >> > Is it possible to just use --size or --fixed-size in .wks to allocate
> >> > partition of certain size?
> >> 
> >> --fixed-size works with this patch (tested); --size should work.
> >
> > Sorry for not being clear. Why do we need this if we can use --size to
> > explicity specify partition size?
> 
> --size and --fixed-size did not had an effect for squashfs with the old
> code.
>

I'd propose to fix this instead of applying extra space and overhead
factor to the filesystems that don't support this by design.

The idea is to make size and fixed-size parameters to set partition size
and use extra-space and overhead-factor to extend filesystem size as
they're currently used.

> 
> > --extra-space and --overhead have the same meaning as
> > IMAGE_ROOTFS_EXTRA_SPACE and IMAGE_OVERHEAD_SIZE variables. From my
> > point of view their purpose is to allocate additional space on the
> > file system. This doesn't make sense for squashfs. That's the reason
> > those options are not used for squashfs. Using them to implicitly make
> > bigger partition is a questionable and possible confusing approach.
> 
> I want/need it to allow updates of the running system without complete
> repartitioning.  E.g. at wic creation time, the squashfs has a certain
> size.  Sometime in the future, there are needed e.g. 5 MiB more because
> a new package was added or so.
>

Yep, I understood what you want. I think it's better achieved by setting
partition size with --size option than artificially apply extra-space and
overhead factor to the filesystem that doesn't support this.

> I need to reserve space in the partition so that I can 'dd' the new
> image without a complete repartitioning.
> 
> --extra-space/--overhead has the meaning which I want (e.g. to say
> "reserve +20% for changes in the future").
> 

So far extra-space and overhead factor were used to allocate additional
space on the file system. This is different from the way you want to use
them. You're not allocating space on squashfs, you're allocating
unformatted space on the partition. It's better to use --size for this.

> >> I would keep it as is.  It is a non trivial function which is reusable.
> >> Perhaps, somebody adds CRAMFS or another file system which does not
> >> support extending its size.
> >> 
> >
> > I personally find this much more understandable and logical:
> 
> me not ;) As I said, functionality is perfect for putting into an extra
> method and it makes code much more readable.  When somebody implements
> CRAMFS he can use this method instead of copy&pasting the code.
> 

When somebody implements something that would require this functionality
he/she can create this method instead of copy&pasting the code. Let's
not try to solve problems before they arise as they may never arise :)

> > Then introducing a method that will be called for all supported
> > filesystems except squashfs without any effect.
> 
> You mean, function should be called at the end of prepare_rootfs()
> (after "method(...)")?  Yes, it would reduce code duplication but other
> methods needs to be touch too (to give information whether rootfs size
> has been adjusted already).
> 

I mean that method is called for all possible filesystems, but makes
sense only for squashfs. It makes code less understandable for no
reason. When code is used in the only place it's much more easy to
understand from my point of view.

--
Regards,
Ed

