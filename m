Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1FEC46FF64
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 16:29:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1EGTYNd006213
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 14 Feb 2016 08:29:34 -0800
Received: from yow-pgortmak-d1 (128.224.56.57) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 14 Feb 2016 08:29:33 -0800
Received: by yow-pgortmak-d1 (Postfix, from userid 1000)	id 03B852811E4; Sun,
	14 Feb 2016 11:29:32 -0500 (EST)
Date: Sun, 14 Feb 2016 11:29:32 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160214162932.GL31661@windriver.com>
References: <cover.1455203562.git.bruce.ashfield@windriver.com>
	<2e6d2b75837731be983d888eaa82a9cfcf660e85.1455203562.git.bruce.ashfield@windriver.com>
	<1455287765.16142.321.camel@linuxfoundation.org>
	<1455291157.16142.323.camel@linuxfoundation.org>
	<1455352317.16142.344.camel@linuxfoundation.org>
	<1455383832.16142.365.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1455383832.16142.365.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>, "Hart,
	Darren" <darren.hart@intel.com>,
	"saul.wold" <saul.wold@intel.com>, poky@yoctoproject.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 1/1] poky: update qemu* to prefer 4.4 kernel
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
X-List-Received-Date: Sun, 14 Feb 2016 16:29:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

[Re: [poky] [PATCH 1/1] poky: update qemu* to prefer 4.4 kernel] On 13/02/2016 (Sat 17:17) Richard Purdie wrote:

> I'm moving the discussion to OE-Core and pulling in some kernel people.
> I think I understand what is wrong and how to fix it but I could use
> someone who actually knows this code.
> 
> To summarise the story so far, on qemux86, X doesn't start and there is
> a backtrace in the logs:
> 
> x86/PAT: Xorg:705 map pfn expected mapping type uncached-minus for [mem 0xfd000000-0xfdffffff], got write-combining
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 705 at /media/build1/poky/build/tmp/work-shared/qemux86/kernel-source/arch/x86/mm/pat.c:985 untrack_pfn+0xaf/0xc0()
> Modules linked in: uvesafb
> CPU: 0 PID: 705 Comm: Xorg Not tainted 4.4.1-yocto-standard #1
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.8.2-0-g33fbe13 by qemu-project.org 04/01/2014
>  00000000 00000000 cf14dd78 c1397ab2 00000000 cf14dda8 c1051477 c1aa4f6c
>  00000000 000002c1 c1a9fa4c 000003d9 c104b98f c104b98f cf244000 b6355000
>  00000000 cf14ddb8 c1051552 00000009 00000000 cf14dde0 c104b98f cf14ddd0
> Call Trace:
>  [<c1397ab2>] dump_stack+0x4b/0x79
>  [<c1051477>] warn_slowpath_common+0x87/0xc0
>  [<c104b98f>] ? untrack_pfn+0xaf/0xc0
>  [<c104b98f>] ? untrack_pfn+0xaf/0xc0
>  [<c1051552>] warn_slowpath_null+0x22/0x30
>  [<c104b98f>] untrack_pfn+0xaf/0xc0
>  [<c104d54c>] ? kmap_atomic_prot+0x3c/0xf0
>  [<c114e17f>] unmap_single_vma+0x4ef/0x500
>  [<c114f007>] unmap_vmas+0x37/0x50
>  [<c1154f8f>] exit_mmap+0x5f/0xf0
>  [<c104eedd>] mmput+0x2d/0xb0
>  [<c105009c>] copy_process+0xd2c/0x13c0
>  [<c1050892>] _do_fork+0x82/0x340
>  [<c105f2d1>] ? SyS_rt_sigaction+0x51/0xa0
>  [<c1050c3c>] SyS_clone+0x2c/0x30
>  [<c1001a03>] do_syscall_32_irqs_on+0x53/0xb0
>  [<c189a94a>] entry_INT80_32+0x2a/0x2a
> ---[ end trace be3e0a61097feddc ]---
> x86/PAT: Xorg:705 map pfn expected mapping type uncached-minus for [mem 0xfd000000-0xfdffffff], got write-combining
> 
> The entry in question is setup by uvesafb which in its
> uvesafb_ioremap() function calls ioremap_wc().
> 
> It appears that Xorg mmaps this from userspace, then later does a
> fork() to execute a utility. At this point, when creating the vmas for
> the new process, the pat code says "eeek!" as the protection mode for
> the new vmas don't match the old one, returns -EINVAL, the process dies
> and X goes with it.
> 
> There are a few hammers we can hit this with, we can boot with "nopat"
> option which makes the problem go away, or turn off CONFIG_X86_PAT. No
> surprises there. Changing uvesafb to use mtrr=0 doesn't help since the
> ioremap_wc call still happens.

Disabling PAT for qemu wouldn't be some horrible crime in the end; the
help text for the Kconfig option itself says:

     Say N here if you see bootup problems (boot crash, boot hang,
     spontaneous reboots) or a non-working video driver.

...and in theory PAT and the older MTRR are supposed to be performance
enhancements but not critical to have present.  I find it hard to get
excited about qemu video performance through the vesa driver.  :)
That said, it would be nice to fully understand what went pear shaped.

> 
> The real issue is the "expected mapping type uncached-minus for got
> write-combining" message, it all goes wrong from there.
> 
> Upon looking at the code and scratching my head for a long while, I
> notice that there are two ways of representing the protection mode
> data, "enum page_cache_mode" and "pgprot_t & _PAGE_CACHE_MASK".
> 
> The exact meaning of pgprot_t depends on which CPU you're running,
> older CPUs have errata meaning only a small number of bits can be used.
> The exact mapping table is determined by __cachemode2pte_tbl and is
> updated at boot by calls from update_cache_mode_entry().
> 
> The result of this if you map enum -> pgprot_t, then try to do pgprot_t
> -> enum, you can get different values since its not a 1:1 mapping.
> 
> This means the comparison in reserve_pfn_range() where it does "pcm !=
> want_pcm" isn't correct and can trigger even in cases where there isn't
> a problem.
> 
> This can be "fixed" by doing cachemode2protval(pcm) !=
> cachemode2protval(want_pcm) and checking whether the protection bits
> match, rather than the enum values, since in reality this is what we
> really care about.
> 
> I can confirm that if I make that change, X boots up just fine.
> 
> The problem is I really have no idea what I'm doing :).

I know the feeling.  :)   Usually I find that being able to pinpoint the
exact commit where things failed adds that final bit of information
needed to get to the bottom of things.  Bruce and I fought with disks
disappearing on qemu versatile a while back and with a bisect traced it
down to some cryptic PCI swizzle mess.  But without the bisect pointing
us at where it went wrong, I'm not sure what we'd have done.  This case
is probably not that bad; it sounds like you've got 95% of it figured
out already.

Anyway to that end, I'm assuming here if we insert the 4.1 kernel
(presumably which also has PAT enabled) and leave X11 and qemu alone,
things work.  If so, we can use "debugpat" bootarg or debugfs to compare
the 4.1 and 4.4 PAT entries (as per Documentation/x86/pat.txt) to see
where things differ between the two kernels.

And/or we can look at some of the relevant changes between the two
versions (see below) and spot test reverts of any that look suspect.
Or, just jump to a brute force bisect, while keeping an eye on the
.config file along the way to ensure it remains consistent as we go.

If this is still unresolved Tues when I'm back in the office and
more easily able to test gfx issues, I'll look at doing bisection.

P.
--

Note: below listing does not account for gregKH stable or yocto changes!

paul@acer:~/git/linux-head$ git log --oneline ^v4.1 v4.4 arch/x86/mm/pat.c 
35a5a10 x86/mm/pat: Extend set_page_memtype() to support Write-Through type
d1b4bfb x86/mm/pat: Add pgprot_writethrough()
0d69bdf x86/mm/pat: Change reserve_memtype() for Write-Through type
d79a40c x86/mm/pat: Use 7th PAT MSR slot for Write-Through PAT type
7202fdb x86/mm/pat: Remove pat_enabled() checks
9cd25aa x86/mm/pat: Emulate PAT when it is disabled
9dac629 x86/mm/pat: Untangle pat_init()
fbe7193 x86/mm/pat: Export pat_enabled()
cb32edf x86/mm/pat: Wrap pat_enabled into a function API
9e76561 x86/mm/pat: Convert to pr_*() usage
b73522e x86/mm/mtrr: Enhance MTRR checks in kernel mapping helpers

paul@acer:~/git/linux-head$ git log --oneline ^v4.1 v4.4 arch/x86/include/asm/pgtable_types.h
70f15287 x86/mm: Fix regression with huge pages on PAE
f70abb0 x86/asm: Fix pud/pmd interfaces to handle large PAT bit
4be4c1f x86/asm: Add pud/pmd mask interfaces to handle large PAT bit
d1b4bfb x86/mm/pat: Add pgprot_writethrough()

paul@acer:~/git/linux-head$ git log --oneline ^v4.1 v4.4 drivers/video/fbdev/uvesafb.c
9c27847 kernel/params: constify struct kernel_param_ops uses

paul@acer:~/git/linux-head$ git log --no-merges --oneline ^v4.1 v4.4 arch/x86/mm/ioremap*
8a0a5da x86/mm: Fix newly introduced printk format warnings
9a58eeb x86/mm: Remove region_is_ram() call from ioremap
1c9cf9b x86/mm: Move warning from __ioremap_check_ram() to the call site
623dffb x86/mm/pat: Add set_memory_wt() for Write-Through type
d838270 x86/mm, asm-generic: Add ioremap_wt() for creating Write-Through mappings
7202fdb x86/mm/pat: Remove pat_enabled() checks
1e6277d x86/mm: Mark arch_ioremap_p{m,u}d_supported() __init
cb32edf x86/mm/pat: Wrap pat_enabled into a function API
e4b6be3 x86/mm: Add ioremap_uc() helper to map memory uncacheable (not UC-)
562bfca x86/mm: Clean up types in xlate_dev_mem_ptr() some more

