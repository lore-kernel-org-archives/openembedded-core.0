Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B59AF60746
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 14:49:50 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 18 Oct 2016 07:49:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,362,1473145200"; d="scan'208";a="181045731"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 18 Oct 2016 07:49:36 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 05D0D6A4006;
	Tue, 18 Oct 2016 07:49:03 -0700 (PDT)
Date: Tue, 18 Oct 2016 17:24:09 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Maciej =?utf-8?B?Qm9yesSZY2tp?= <maciej.borzecki@rndity.com>
Message-ID: <20161018142409.GA10576@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20161018073138.GA17569@linux.intel.com>
	<CAD4b0_LjLzKRYACNx8tOAyrdsfeTQdAGMBKvotkj4Ah6w=PGJw@mail.gmail.com>
	<20161018083842.GA17823@linux.intel.com>
	<CAD4b0_LVGC5mJ72MXytQ+4Kovve1=ca8HVohfju8CPe+BzpjfA@mail.gmail.com>
	<20161018092748.GA18050@linux.intel.com>
	<CAD4b0_Ji4ai5XXEdiiO87ELxwEuZRrYfG=Vg6aOyebc9ZBqtGw@mail.gmail.com>
	<20161018101703.GA18747@linux.intel.com>
	<CAD4b0_Ky2N44v8XJXoF0LZm04PKpp6=r9PKk-Y4nHd_YZe7DgQ@mail.gmail.com>
	<20161018110557.GA12819@linux.intel.com>
	<CAD4b0_LAjiTOdma6TCcuAm09G3bNNg3sTGyRbf6o+wV_XjVsZg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD4b0_LAjiTOdma6TCcuAm09G3bNNg3sTGyRbf6o+wV_XjVsZg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: add --reserved-size wks option
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
X-List-Received-Date: Tue, 18 Oct 2016 14:49:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Oct 18, 2016 at 03:59:23PM +0200, Maciej Borzęcki wrote:
> >> >> >> > What's the advantage of creating unusable gap over creating partition of
> >> >> >> > the same size that can be used?
> >> >> >>
> >> >> >> Just convenience.
> >> >> >>
> >> >> > What's the convenience of having extra space on partition that can't be
> >> >> > used for data over having it formatted and used?
> >> >> >
> >> >> >> > Even if that space is not needed it doesn't harm to have it, does it?
> >> >> >>
> >> >> >> I have not seen any negative side effects.
> >> >> >>
> >> >> > I do. If user needs that reserved space it's impossible to get it without
> >> >> > reformatting partition. The free space exists, but can't be used.
> >> >>
> >> >> That's not the point and is not aligned with use case I'm trying to solve.
> >> >>
> >> >> My case is rather simple, I'm creating an image for SD card that is
> >> >> deployed in the field. In that particular case, there's a primary and
> >> >> a secondary (aka. active and inactive) rootfs partitions that are
> >> >> switched whenever a system update comes in. The update is a file
> >> >> system image that is copied over to the inactive partition, followed
> >> >> by a system reboot.
> >> >>
> >> >> What I need is the ability to set a certain size of a partition (say
> >> >> 100MB), regardless of current rootfs size (which may be, say 70MB).
> >> >> The remaining unused space sets an upper limit on how much the rootfs
> >> >> may grow in the future (in this example case, it's 30MB). RIght now
> >> >> the best I can do is to describe a partition like this: `part /
> >> >> --source rootfs --size 100MB --overhead-factor 1`, hoping that if
> >> >> rootfs grows beyond 100MB I will somehow still be able to catch that
> >> >> and that the future images remain size compatible.
> >> >>
> >> >> The resulting filesystem inside the partition is larger than what
> >> >> IMAGE_CMD (ex. IMAGE_CMD_ext4) would give me, because of explicit
> >> >> --size in kickstart. I would prefer to have something comparable in
> >> >> size just to avoid later surprises, what implies using defaults.
> >> >> However, using defaults, means that I cannot control the layout
> >> >> because it will likely change each time rootfs size gets changed.
> >> >> There is no `--fixed-size` or other option to enforce specific size.
> >> >>
> >> >> Summing up, a simple use case that cannot be currently solved using wic.
> >> >>
> >> >> BTW. actually we're missing an ability to enforce --size (i.e.
> >> >> --fixed-size?) and a method passing an explicit partition offset
> >> >> inside the disk image (something useful for `--source rawcopy
> >> >> --no-table` partitions, currently solved with `--align`).
> >> >>
> >> > I undertood the problem and I agree that wic doesn't provide a solution.
> >> >
> >> > However, instead of making unformatted space I'd propose to format it,
> >> > i.e. to have --max-size option that would confict with --size and
> >> > specify upper size limit for the partition. All partition will be
> >> > formatted and available for data. This is identical to --fixed-size option
> >> > you've described. This approach would solve the problem you're
> >> > addressing and it would also make additional space usable.
> >> >
> >> > I'd also suggest to rename --size to --min-size and make --size deprecated.
> >> >
> >> > Does this make sense to you?
> >>
> >> No strong opinions here, just that deprecating --size might current
> >> users uneasy.
> >>
> > By deprecting --size I didn't mean removing it completely. We can just
> > print a warning suggesting usage of other options.
> >
> >> Perhaps --max-size could be a boolean switch? We could just name it
> >> --fixed-size (bool, defaults to False), with semantics that if
> >> --fixed-size is provided, the partition will have size --size,
> >> occurrence of --overhead-factor or --extra-space will raise an error.
> >>
> > That would work too, but it looks a bit confusing to me to have 2 different
> > types of size-related options.
> 
> Ok, but now we would have --min-size (previously known as --size) and
> --size (or --max-size?). That's still 2 size related options plus a
> deprecation warning.
> 

I agree, it doesn't look good. Moreover --max-size doesn't make it
clear that partition will be this size. It rather suggests that partition
can be this size or less.

So, we have --size which is actually minimum partition size, we have
couple of options to extend partition size (--overhead-factor and
--extra-space), but we don't have ability to set upper limit for partition
size.

OK, let's agree on using --fixed-size(int)
Using --fixed-size with any of --size or --overhead-factor or --extra-space
options should raise ks parser error. If rootfs size is bigger than
--fixed-size wic should raise an error too.

Any other opinions?

--
Regards,
Ed

