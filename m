Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0E8E171BC7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 09:04:08 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 18 Oct 2016 02:04:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,361,1473145200"; d="scan'208";a="20700936"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 18 Oct 2016 02:04:09 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id ADED96A4006;
	Tue, 18 Oct 2016 02:03:36 -0700 (PDT)
Date: Tue, 18 Oct 2016 11:38:42 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Maciej =?utf-8?B?Qm9yesSZY2tp?= <maciej.borzecki@rndity.com>
Message-ID: <20161018083842.GA17823@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <30a5ef699fb1b575baf95b986a755f509e9e747e.1476706733.git.maciej.borzecki@rndity.com>
	<20161017132234.GA14510@linux.intel.com>
	<CAD4b0_K2KcaZ_pwO0yfJPF8NNzgjm8cYFD-24E3k8_DdUaAO3A@mail.gmail.com>
	<20161018073138.GA17569@linux.intel.com>
	<CAD4b0_LjLzKRYACNx8tOAyrdsfeTQdAGMBKvotkj4Ah6w=PGJw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD4b0_LjLzKRYACNx8tOAyrdsfeTQdAGMBKvotkj4Ah6w=PGJw@mail.gmail.com>
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
X-List-Received-Date: Tue, 18 Oct 2016 09:04:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Oct 18, 2016 at 10:37:22AM +0200, Maciej Borzęcki wrote:
> On Tue, Oct 18, 2016 at 9:31 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> > On Mon, Oct 17, 2016 at 04:46:00PM +0200, Maciej Borzęcki wrote:
> >> On Mon, Oct 17, 2016 at 3:22 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> >> > Hi Maciej,
> >> >
> >> > There is already --size and --extra-space options.
> >> > Can we get the same or similar result by just using them? Do we really
> >> > need new option for similar purpose?
> >>
> >> --reserved-size serves a different purpose, it establishes an upper
> >> bound on the size of a partition during layout. Unlike
> >> --size/--extra-space does not depend on the size of the filesystem
> >> image.
> >>
> >> For instance, assume I'm creating an image for SD card/eMMC with a
> >> fixed partition layout (something simple: boot partition, primary &
> >> secondary rootfs partitions, some data partition). Because future
> >> system updates are delivered as filesystem image, I want to make sure
> >> that there is exactly xxx MBs for my current and future rootfs images
> >> (regardless of current image size). Neither --size nor --extra-space
> >> can do that. I could use, say `--size 200 --overhead-factor 1`, but
> >> this will needlessly create a 200MB rootfs image and if I happen to
> >> cross the 200MB boundary I will not get an error.
> >>
> >> I had a private patch that added --fixed-size to enforce --size, but
> >> that would still end up creating filesystem image to fill the whole
> >> space.
> > I didn't get the difference between enforcing partition size and below
> > implementation. Can you elaborate a bit?
> 
> `--fixed-size` was something that I had added to my fork back in 2014,
> even before `--overhead-factor` came in. The problem is that depending
> on a project you might want to have more control over how partitions
> are laid out, or even need to have a fixed layout. Adding
> `--fixed-size` would had a similar effect to what `--overhead-factor
> 1` does right now. Combined with `--size` would ensure that rootfs is
> say, 200MB large. The downside was that wic would actually create a
> 200MB rootfs, something that is not really necessary. In fact, I only
> wanted to have 200MB gap so that I have some spare space for future
> updates (where update is just a rootfs image you dd to the partition).
>
Thanks for the explanations. Now I got it - reserved size is not a part
of partition, it's a gap between partitions.

What's the advantage of creating unusable gap over creating partition of
the same size that can be used? Even if that space is not needed it
doesn't harm to have it, does it?

> >> >>
> >> >> +         --reserved-size: This option specifies that there should be
> >> >> +                          at least that many bytes reserved for
> > According to the code if partition size > reserved size wic will throw
> > an error. This somehow conflicts with 'at least that many bytes' part of the
> > description in my opinion.
> >
> > As far as I uderstood your code this parameter specifies hard upper
> > limit for partition size, right?
> 
> Thanks, the wording is a bit off. I should rephrase it to 'that many
> bytes' or just state that it's an upper limit.
>
Upper limit is a wrong term here. I'm sorry for confusing you.
I proposed it because I misunderstood that it's not a partition size but a reserved
space after partition. Anyway, I think above description should be
modified to explain the option in a clear way. Using ascii picture of
the partition layout would probably help to show what this option means.

> >> >>              msger.debug("Assigned %s to %s%d, sectors range %d-%d size %d "
> >> >> -                        "sectors (%d bytes)." \
> >> >> +                        "sectors (%d bytes), reserved %d bytes." \
> >> >>                              % (part['mountpoint'], part['disk_name'], part['num'],
> >> >> -                               part['start'], part['start'] + part['size'] - 1,
> >> >> -                               part['size'], part['size'] * self.sector_size))
> >> >> +                               part['start'], disk['offset'] - 1,
> >> >> +                               part['size'], part['size'] * self.sector_size,
> >> >> +                               part['reserved_size'] * self.sector_size))
> > This will produce incorrect output about partition size as in reality partition size will
> > be set to part['reserved_size'].
> 
> I tried to avoid confusing the reader here. Partition size is one
> thing and reservation is another. That is why reservation is logged
> explicitly. Logging just the size would raise questions about why the
> partition has grown.
> 
> Perhaps it makes sense to log reservation like this instead?
> 
What about using 'reserved %d bytes of space after partition' or
something like that?

>    part['reserved_size'] * self.sector_size if part['reserved_size']
> else part['size'] * self.sector_size
> 
> >
> > "reserved 0 bytes" message will be produced if --reserved-size option
> > is not used. It's a bit confusing as 'reserved' is too generic word. Can
> > we use 'reserved size' instead?
> 
> Yes, 'reserved size' sounds much better.
We can also skip this part if reserved size is 0.

> >> >> @@ -288,17 +303,21 @@ class Image():
> >> >>                  # Type for ext2/ext3/ext4/btrfs
> >> >>                  parted_fs_type = "ext2"
> >> >>
> >> >> +            psize = part['size']
> >> >> +            if part['reserved_size']:
> >> >> +                psize = part['reserved_size']
> >> >> +
> > Here I'm getting confused. How this new parameters differs from --size if it behaves
> > the same way, i.e. partition size is set to its value.
> 
> That's intentional, Partition.prepare() is not be affected by the
> reservation. I just want to reserve some space during layout, but not
> necessarily enlarge the rootfs right now.

This made the whole thing clear for me! Thank you.

> > The only
> > difference I see is that if rootfs size is greater than reserved size
> > wic will fail to create partition. Would it make sense to name it
> > --max-size in this case?
> 
> Just wording, reservation seems more fitting, but I'm open to suggestions.
>
I agree. --max-size would suggest that wic will make partition with this
size.

I'm still wondering what's the benefit of having unused space between
partitions though.

> >> >>              self.__create_partition(disk['disk'].device, part['type'],
> >> >> -                                    parted_fs_type, part['start'], part['size'])
> >> >> +                                    parted_fs_type, part['start'], psize)
> >> >>
> >> >>              if part['part_type']:
> >> >>                  msger.debug("partition %d: set type UID to %s" % \
> >
> > Can you cover this functionality(and may be other size-related
> > functionality too) with tests? You can add testcases to existing
> > oe-selftest wic module.
> 
> I'll take a look at it.
Thanks.

--
Regards,
Ed

