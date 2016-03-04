Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1BC726FF84
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 18:37:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u24IbFDa017831
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 4 Mar 2016 10:37:15 -0800 (PST)
Received: from yow-pgortmak-d1 (128.224.56.57) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 4 Mar 2016 10:37:14 -0800
Received: by yow-pgortmak-d1 (Postfix, from userid 1000)	id 31496281B89; Fri,
	4 Mar 2016 13:37:14 -0500 (EST)
Date: Fri, 4 Mar 2016 13:37:14 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Toshi Kani <toshi.kani@hpe.com>
Message-ID: <20160304183713.GA26051@windriver.com>
References: <20160303205924.GA25222@windriver.com>
	<1457067768.15454.181.camel@hpe.com>
MIME-Version: 1.0
In-Reply-To: <1457067768.15454.181.camel@hpe.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Toshi Kani <toshi.kani@hp.com>, linux-kernel@vger.kernel.org,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Bruce Ashfield <bruce.ashfield@windriver.com>, "Hart,
	Darren" <darren.hart@intel.com>, Borislav Petkov <bp@suse.de>,
	"saul.wold" <saul.wold@intel.com>
Subject: Re: runtime regression with "x86/mm/pat: Emulate PAT when it is disabled"
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
X-List-Received-Date: Fri, 04 Mar 2016 18:37:32 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

[Re: runtime regression with "x86/mm/pat: Emulate PAT when it is disabled"] On 03/03/2016 (Thu 22:02) Toshi Kani wrote:

> On Thu, 2016-03-03 at 15:59 -0500, Paul Gortmaker wrote:
> > So, the yocto folks moved from 4.1 to 4.4 and one of their automated
> > qemu x86-32 boot tests started failing.  None of the yocto details seem
> > to matter since I offered to help and I've repropduced it using 100%
> > mainline kernels and a generic distro toolchain as well.
> > 
> > The test case is slightly complicated, in that it relies on uvesafb
> > being modular, and so one has to juggle modules within an ext4 image
> > that qemu boots from.  We tried making uvesafb builtin, but that made
> > the issue magically vanish.  Given PAT, this isn't too surprising.
> > 
> > Richard did the preliminary investigation and analysis, and from that I
> > did a bisect, and found the commit in $SUBJECT to be the root cause, as
> > per the discussion here:
> > 
> > http://lists.openembedded.org/pipermail/openembedded-core/2016-March/1183
> > 97.html
> > 
> > I'd mentioned the above to bpetkov on IRC and after confirming it was
> > still an issue on 4.5-rc6, he'd asked if I had a portable reproducer.  
> > 
> > Not sure how complicated that would be, I set out to make one from my
> > build.   With a little LD_PRELOAD type magic and ensuring all the qemu
> > components are in ./  I have one that runs on an otherwise qemu-free
> > x86-64 box. 
> > 
> > The stand alone reproducer is here; launched in 00-runme:
> > 
> > http://openlinux.wrs.com/pat-splat/reproducer.tar.bz2  
> > 
> > It is nothing fancy, just a generic yocto build of "sato" (gfx enabled
> > rootfs).  When it "works" it boots to a UI touchscreen interface.  When
> > it fails, you get a black screen with a blinking cursor (as seen in
> > "vncviewer localhost:0").
> 
> Thanks for tracking down, and packaging the reproducer.  I simply untar'd
> and ran 00-runme, but was not able to connect with localhost:0.  I am not
> familiar with qemu, so I have not looked into why, though...

Maybe it was localhost:1 in your case?  The qemu should have indicated
what vncserver sessions it started.  Can you paste in the output from
the 00-runme?   I tested the reproducer on a machine that was physically
distinct from the build, and that was a generic ubuntu install, but with
no qemu support installed at all and it worked there.  Plus I got Bruce
to test it worked on his machine, so I'm rather surprised it did not
work for you.

> 
> Anyway, with regarding the error message:
>   "x86/PAT: Xorg:705 map pfn expected mapping type uncached-minus for [mem
> 0xfd000000-0xfdffffff], got write-combining"
> 
> Did it came from the following path during fork()?
>  copy_process
>   copy_mm
>    dup_mm
>     dup_mmap
>      copy_page_range
>       track_pfn_copy
>        reserve_pfn_range

The trace is consistent, and was already captured by Richard, as per:

http://lists.openembedded.org/pipermail/openembedded-core/2016-March/118397.html

which is the link given earlier.  When I say consistent, I mean that I
get essentially the same thing when booting 4.5-rc6:

[   30.098100] x86/PAT: Xorg:509 map pfn expected mapping type uncached-minus for [mem 0xfd000000-0xfdffffff], got write-combining
[   30.106782] ------------[ cut here ]------------
[   30.107093] WARNING: CPU: 0 PID: 509 at /home/paul/poky/build/tmp-glibc/work-shared/qemux86/kernel-source/arch/x86/mm/pat.c:986 untrack_pfn+0x9f/0xb0()
[   30.112553] Modules linked in: 8021q parport_pc parport floppy uvesafb
[   30.113766] CPU: 0 PID: 509 Comm: Xorg Not tainted 4.5.0-rc6-yocto-standard #1
[   30.113806] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.8.2-0-g33fbe13 by qemu-project.org 04/01/2014
[   30.114078]  00000000 00003286 c0149d78 c13a6c7f 00000000 00000000 c0149dac c1052bcb
[   30.114214]  c1ac7544 00000000 000001fd c1ac1ea4 000003da c104cbdf 000003da c104cbdf
[   30.114214]  00000000 cdcf0528 00000000 c0149dbc c1052ca2 00000009 00000000 c0149de0
[   30.114214] Call Trace:
[   30.114214]  [<c13a6c7f>] dump_stack+0x58/0x79
[   30.114214]  [<c1052bcb>] warn_slowpath_common+0x8b/0xc0
[   30.114214]  [<c104cbdf>] ? untrack_pfn+0x9f/0xb0
[   30.114214]  [<c104cbdf>] ? untrack_pfn+0x9f/0xb0
[   30.114214]  [<c1052ca2>] warn_slowpath_null+0x22/0x30
[   30.114214]  [<c104cbdf>] untrack_pfn+0x9f/0xb0
[   30.114214]  [<c104ecf4>] ? __kunmap_atomic+0x54/0x110
[   30.114214]  [<c114f1cf>] unmap_single_vma+0x56f/0x580
[   30.114214]  [<c11321d0>] ? pagevec_move_tail_fn+0xa0/0xa0
[   30.114214]  [<c1150123>] unmap_vmas+0x43/0x60
[   30.114214]  [<c1154d5f>] exit_mmap+0x5f/0xf0
[   30.114214]  [<c10507bd>] mmput+0x2d/0xa0
[   30.114214]  [<c1051c19>] copy_process.part.47+0x1229/0x1430
[   30.114214]  [<c1051fb4>] _do_fork+0xb4/0x3b0
[   30.114214]  [<c105239c>] SyS_clone+0x2c/0x30
[   30.114214]  [<c1001a04>] do_syscall_32_irqs_on+0x54/0xb0
[   30.114214]  [<c18b06ca>] entry_INT80_32+0x2a/0x2a
[   30.124383] ---[ end trace f7c8a5d94542f94e ]---

> 
> If so, track_pfn_copy() obtained pgprot from a PTE, and called
> reserve_pfn_range() with it.  So, the error message indicates that previous
> ioremap_wc() (i.e. pcm WC) resulted in creating UC- map (i.e. pgprot UC-).
>  pcm is a logical cache type and pgprot is a HW cache type.  They can be
> different when CPU does not have support for a given logical type.  This WC
> to UC- conversion happens when CPU does not support PAT.
> 
> Richard's change, which compares with pgprot values in reserve_pfn_range()
> is a good one, but I do not understand how we get into this mess.  We do
> not have this check when PAT is disabled, and WC is supported when PAT is
> enabled.
> 
> Commit 9cd25aac1 changed the initial values of the pcm<->pgrot conversion
> tables.  The tables should be initialized with the same values after
> pat_init() is called.  Is there any possibility that ioremap_wc() was
> called before pat_init()..?

I don't think it is an initcall ordering thing; recall that I said the
problem seems to go away when built-in vs uvesafb as module.  So given
that, I think it is more related to where the code lands.

> 
> Also, can you send me a whole dmesg output?  I'd like to check how PAT is
> initialized.

I'll send the full file off list vs. spamming everyone with it.  I'm open
to booting the pre-fail commit with PAT specific bootargs and the post-fail
with the same and diffing the two dmesg if there are bootargs you'd like
me to test.  I'd also like to ensure you have a working reproducer locally
so maybe we should look at how that failed 1st.

Thanks,
Paul.
--

> 
> Thanks!
> -Toshi

