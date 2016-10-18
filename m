Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 147C3719A9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 09:53:14 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 18 Oct 2016 02:53:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,361,1473145200"; d="scan'208";a="20820326"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 18 Oct 2016 02:53:15 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id D47AA6A4006;
	Tue, 18 Oct 2016 02:52:42 -0700 (PDT)
Date: Tue, 18 Oct 2016 12:27:48 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Maciej =?utf-8?B?Qm9yesSZY2tp?= <maciej.borzecki@rndity.com>
Message-ID: <20161018092748.GA18050@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <30a5ef699fb1b575baf95b986a755f509e9e747e.1476706733.git.maciej.borzecki@rndity.com>
	<20161017132234.GA14510@linux.intel.com>
	<CAD4b0_K2KcaZ_pwO0yfJPF8NNzgjm8cYFD-24E3k8_DdUaAO3A@mail.gmail.com>
	<20161018073138.GA17569@linux.intel.com>
	<CAD4b0_LjLzKRYACNx8tOAyrdsfeTQdAGMBKvotkj4Ah6w=PGJw@mail.gmail.com>
	<20161018083842.GA17823@linux.intel.com>
	<CAD4b0_LVGC5mJ72MXytQ+4Kovve1=ca8HVohfju8CPe+BzpjfA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD4b0_LVGC5mJ72MXytQ+4Kovve1=ca8HVohfju8CPe+BzpjfA@mail.gmail.com>
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
X-List-Received-Date: Tue, 18 Oct 2016 09:53:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Oct 18, 2016 at 11:24:14AM +0200, Maciej Borzęcki wrote:
> On Tue, Oct 18, 2016 at 10:38 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> > On Tue, Oct 18, 2016 at 10:37:22AM +0200, Maciej Borzęcki wrote:
> >> On Tue, Oct 18, 2016 at 9:31 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> >> > On Mon, Oct 17, 2016 at 04:46:00PM +0200, Maciej Borzęcki wrote:
> >> >> On Mon, Oct 17, 2016 at 3:22 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> >> >> > Hi Maciej,
> >> >> >
> >> >> > There is already --size and --extra-space options.
> >> >> > Can we get the same or similar result by just using them? Do we really
> >> >> > need new option for similar purpose?
> >> >>
> >> >> --reserved-size serves a different purpose, it establishes an upper
> >> >> bound on the size of a partition during layout. Unlike
> >> >> --size/--extra-space does not depend on the size of the filesystem
> >> >> image.
> >> >>
> >> >> For instance, assume I'm creating an image for SD card/eMMC with a
> >> >> fixed partition layout (something simple: boot partition, primary &
> >> >> secondary rootfs partitions, some data partition). Because future
> >> >> system updates are delivered as filesystem image, I want to make sure
> >> >> that there is exactly xxx MBs for my current and future rootfs images
> >> >> (regardless of current image size). Neither --size nor --extra-space
> >> >> can do that. I could use, say `--size 200 --overhead-factor 1`, but
> >> >> this will needlessly create a 200MB rootfs image and if I happen to
> >> >> cross the 200MB boundary I will not get an error.
> >> >>
> >> >> I had a private patch that added --fixed-size to enforce --size, but
> >> >> that would still end up creating filesystem image to fill the whole
> >> >> space.
> >> > I didn't get the difference between enforcing partition size and below
> >> > implementation. Can you elaborate a bit?
> >>
> >> `--fixed-size` was something that I had added to my fork back in 2014,
> >> even before `--overhead-factor` came in. The problem is that depending
> >> on a project you might want to have more control over how partitions
> >> are laid out, or even need to have a fixed layout. Adding
> >> `--fixed-size` would had a similar effect to what `--overhead-factor
> >> 1` does right now. Combined with `--size` would ensure that rootfs is
> >> say, 200MB large. The downside was that wic would actually create a
> >> 200MB rootfs, something that is not really necessary. In fact, I only
> >> wanted to have 200MB gap so that I have some spare space for future
> >> updates (where update is just a rootfs image you dd to the partition).
> >>
> > Thanks for the explanations. Now I got it - reserved size is not a part
> > of partition, it's a gap between partitions.
> 
> I might have not been clear enough when explaining. It's not a gap,
> it's just a container of size --reserved-size listed in MBR/GPT.
> There's probably a filesystem inside but not necessarily.
> Graphically it looks as like this:
> 
>                          --reserved-size
>                       |----------------------|
>                       v                      v
>     +-----------------+----------------------+---------------------+
>     |..... stuff .....|xxxxxxxxxx            |..... stuff .........|
>     +-----------------+----------------------+---------------------+
>                       ^         ^            ^
>                       |---------|------------|
>                        --size    --extra-space
> 
> 
Ah, I'm wrong again. It's a partition size limit, but it's not necessary
formatted, right? It's only formatted if size == reserved_size.

> >
> > What's the advantage of creating unusable gap over creating partition of
> > the same size that can be used?
> 
> Just convenience.
>
What's the convenience of having extra space on partition that can't be
used for data over having it formatted and used?

> > Even if that space is not needed it doesn't harm to have it, does it?
> 
> I have not seen any negative side effects.
>
I do. If user needs that reserved space it's impossible to get it without
reformatting partition. The free space exists, but can't be used.

--
Regards,
Ed

