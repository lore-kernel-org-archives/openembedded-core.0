Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1D3D075C51
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 17:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1DHFQ3l019286; Sat, 13 Feb 2016 17:17:17 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id drZeCSrRHq8F; Sat, 13 Feb 2016 17:17:17 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1DHHCKB019314
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 13 Feb 2016 17:17:13 GMT
Message-ID: <1455383832.16142.365.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>, "Hart, Darren"
	<darren.hart@intel.com>, "saul.wold" <saul.wold@intel.com>, Paul Gortmaker
	<paul.gortmaker@windriver.com>
Date: Sat, 13 Feb 2016 17:17:12 +0000
In-Reply-To: <1455352317.16142.344.camel@linuxfoundation.org>
References: <cover.1455203562.git.bruce.ashfield@windriver.com>
	<2e6d2b75837731be983d888eaa82a9cfcf660e85.1455203562.git.bruce.ashfield@windriver.com>
	<1455287765.16142.321.camel@linuxfoundation.org>
	<1455291157.16142.323.camel@linuxfoundation.org>
	<1455352317.16142.344.camel@linuxfoundation.org>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: poky@yoctoproject.org
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
X-List-Received-Date: Sat, 13 Feb 2016 17:17:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'm moving the discussion to OE-Core and pulling in some kernel people.
I think I understand what is wrong and how to fix it but I could use
someone who actually knows this code.

To summarise the story so far, on qemux86, X doesn't start and there is
a backtrace in the logs:

x86/PAT: Xorg:705 map pfn expected mapping type uncached-minus for [mem 0xfd000000-0xfdffffff], got write-combining
------------[ cut here ]------------
WARNING: CPU: 0 PID: 705 at /media/build1/poky/build/tmp/work-shared/qemux86/kernel-source/arch/x86/mm/pat.c:985 untrack_pfn+0xaf/0xc0()
Modules linked in: uvesafb
CPU: 0 PID: 705 Comm: Xorg Not tainted 4.4.1-yocto-standard #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.8.2-0-g33fbe13 by qemu-project.org 04/01/2014
 00000000 00000000 cf14dd78 c1397ab2 00000000 cf14dda8 c1051477 c1aa4f6c
 00000000 000002c1 c1a9fa4c 000003d9 c104b98f c104b98f cf244000 b6355000
 00000000 cf14ddb8 c1051552 00000009 00000000 cf14dde0 c104b98f cf14ddd0
Call Trace:
 [<c1397ab2>] dump_stack+0x4b/0x79
 [<c1051477>] warn_slowpath_common+0x87/0xc0
 [<c104b98f>] ? untrack_pfn+0xaf/0xc0
 [<c104b98f>] ? untrack_pfn+0xaf/0xc0
 [<c1051552>] warn_slowpath_null+0x22/0x30
 [<c104b98f>] untrack_pfn+0xaf/0xc0
 [<c104d54c>] ? kmap_atomic_prot+0x3c/0xf0
 [<c114e17f>] unmap_single_vma+0x4ef/0x500
 [<c114f007>] unmap_vmas+0x37/0x50
 [<c1154f8f>] exit_mmap+0x5f/0xf0
 [<c104eedd>] mmput+0x2d/0xb0
 [<c105009c>] copy_process+0xd2c/0x13c0
 [<c1050892>] _do_fork+0x82/0x340
 [<c105f2d1>] ? SyS_rt_sigaction+0x51/0xa0
 [<c1050c3c>] SyS_clone+0x2c/0x30
 [<c1001a03>] do_syscall_32_irqs_on+0x53/0xb0
 [<c189a94a>] entry_INT80_32+0x2a/0x2a
---[ end trace be3e0a61097feddc ]---
x86/PAT: Xorg:705 map pfn expected mapping type uncached-minus for [mem 0xfd000000-0xfdffffff], got write-combining

The entry in question is setup by uvesafb which in its
uvesafb_ioremap() function calls ioremap_wc().

It appears that Xorg mmaps this from userspace, then later does a
fork() to execute a utility. At this point, when creating the vmas for
the new process, the pat code says "eeek!" as the protection mode for
the new vmas don't match the old one, returns -EINVAL, the process dies
and X goes with it.

There are a few hammers we can hit this with, we can boot with "nopat"
option which makes the problem go away, or turn off CONFIG_X86_PAT. No
surprises there. Changing uvesafb to use mtrr=0 doesn't help since the
ioremap_wc call still happens.

The real issue is the "expected mapping type uncached-minus for got
write-combining" message, it all goes wrong from there.

Upon looking at the code and scratching my head for a long while, I
notice that there are two ways of representing the protection mode
data, "enum page_cache_mode" and "pgprot_t & _PAGE_CACHE_MASK".

The exact meaning of pgprot_t depends on which CPU you're running,
older CPUs have errata meaning only a small number of bits can be used.
The exact mapping table is determined by __cachemode2pte_tbl and is
updated at boot by calls from update_cache_mode_entry().

The result of this if you map enum -> pgprot_t, then try to do pgprot_t
-> enum, you can get different values since its not a 1:1 mapping.

This means the comparison in reserve_pfn_range() where it does "pcm !=
want_pcm" isn't correct and can trigger even in cases where there isn't
a problem.

This can be "fixed" by doing cachemode2protval(pcm) !=
cachemode2protval(want_pcm) and checking whether the protection bits
match, rather than the enum values, since in reality this is what we
really care about.

I can confirm that if I make that change, X boots up just fine.

The problem is I really have no idea what I'm doing :).

Could someone who understands this code have a look and see whether the
above makes sense and if it does, perhaps open a discussion with
upstream about how to fix this properly (assuming my change isn't
actually the correct fix)?

We don't see this on qemux86-64 since that has more PAT bits working
and hence the values map correctly.

Bruce: Would you accept a patch doing the above for now?

Cheers,

Richard



