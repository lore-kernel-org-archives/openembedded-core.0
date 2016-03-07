Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC02601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 00:35:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u270Z3rT007554
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 6 Mar 2016 16:35:04 -0800 (PST)
Received: from yow-pgortmak-d1 (128.224.56.57) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 6 Mar 2016 16:35:02 -0800
Received: by yow-pgortmak-d1 (Postfix, from userid 1000)	id 8EB8A281B95; Sun,
	6 Mar 2016 19:35:02 -0500 (EST)
Date: Sun, 6 Mar 2016 19:35:02 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Toshi Kani <toshi.kani@hpe.com>
Message-ID: <20160307003501.GB26051@windriver.com>
References: <20160303205924.GA25222@windriver.com>
	<1457067768.15454.181.camel@hpe.com>
	<20160304183713.GA26051@windriver.com>
	<1457129560.15454.266.camel@hpe.com>
MIME-Version: 1.0
In-Reply-To: <1457129560.15454.266.camel@hpe.com>
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
X-List-Received-Date: Mon, 07 Mar 2016 00:35:22 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

[Re: runtime regression with "x86/mm/pat: Emulate PAT when it is disabled"] On 04/03/2016 (Fri 15:12) Toshi Kani wrote:

> On Fri, 2016-03-04 at 13:37 -0500, Paul Gortmaker wrote:
> > [Re: runtime regression with "x86/mm/pat: Emulate PAT when it is
> > disabled"] On 03/03/2016 (Thu 22:02) Toshi Kani wrote:
> > 
> > > On Thu, 2016-03-03 at 15:59 -0500, Paul Gortmaker wrote:
>  :
> > > > 
> > > > The stand alone reproducer is here; launched in 00-runme:
> > > > 
> > > > http://openlinux.wrs.com/pat-splat/reproducer.tar.bz2  
> > > > 
> > > > It is nothing fancy, just a generic yocto build of "sato" (gfx
> > > > enabled rootfs).  When it "works" it boots to a UI touchscreen
> > > > interface.  When
> > > > it fails, you get a black screen with a blinking cursor (as seen in
> > > > "vncviewer localhost:0").
> > > 
> > > Thanks for tracking down, and packaging the reproducer.  I simply
> > > untar'd and ran 00-runme, but was not able to connect with localhost:0.
> > >  I am not familiar with qemu, so I have not looked into why, though...
> > 
> > Maybe it was localhost:1 in your case?  The qemu should have indicated
> > what vncserver sessions it started.  Can you paste in the output from
> > the 00-runme?   I tested the reproducer on a machine that was physically
> > distinct from the build, and that was a generic ubuntu install, but with
> > no qemu support installed at all and it worked there.  Plus I got Bruce
> > to test it worked on his machine, so I'm rather surprised it did not
> > work for you.
> 
> I am not really sure what I am doing is correct.
> 
> On one window:
> # ./00-runme
> Warning: vlan 0 is not connected to host network
> VNC server running on '::1:5900'

Ah, it seems for some reason your system confuses qemu from using the
"normal"  IPv4 default.   Try editing ./00-runme and add an explicit
vnc option    "-vnc 127.0.0.1:5" in front of "-show-cursor" and then:

> 
> And another window on the same system:
> # vncviewer localhost:1

...connect to localhost:5  here.  I chose 5 just to not bump into
anything your system might have on :0 or :1 already.

> 
> TigerVNC Viewer 64-bit v1.6.0
> Built on: 2016-01-04 15:09
> Copyright (C) 1999-2015 TigerVNC Team and many others (see README.txt)
> See http://www.tigervnc.org for information on TigerVNC.
> Can't open display: 
> 

[snip analysis, leaving that for Richard to comment on.]

> 
> > > Also, can you send me a whole dmesg output?  I'd like to check how PAT
> > > is initialized.
> > 
> > I'll send the full file off list vs. spamming everyone with it.  I'm open
> > to booting the pre-fail commit with PAT specific bootargs and the post-
> > fail with the same and diffing the two dmesg if there are bootargs you'd
> > like me to test.  I'd also like to ensure you have a working reproducer
> > locally so maybe we should look at how that failed 1st.
> 
> Great.  Yes, two dmesg will be really helpful.

So I booted both with "debugpat" on the bootline; both being the last
working commit [v4.1-rc5-21-g9dac62909451]  and then the 1st failing
commit [v4.1-rc5-22-g9cd25aac1f44].  I captured the dmesg of each, then
stripped the timestamps and diffed them.


--- works.txt	2016-03-06 19:13:28.245836555 -0500
+++ fail.txt	2016-03-06 19:13:17.321836308 -0500
@@ -454,15 +454,38 @@
  8021q: 802.1Q VLAN Support v1.8
  8021q: adding VLAN 0 to HW filter on device eth0
  x86/PAT: Overlap at 0xfd000000-0xfe000000
- x86/PAT: reserve_memtype added [mem 0xfd000000-0xfdffffff], track write-combining, req write-combining, ret write-combining
- x86/PAT: Overlap at 0xfe000000-0xfe010000
- x86/PAT: reserve_memtype added [mem 0xfe000000-0xfe00ffff], track uncached-minus, req uncached-minus, ret uncached-minus
+ x86/PAT: reserve_memtype added [mem 0xfd000000-0xfdffffff], track write-combining, req uncached-minus, ret write-combining
  x86/PAT: free_memtype request [mem 0xfd000000-0xfdffffff]
- x86/PAT: free_memtype request [mem 0xfe000000-0xfe00ffff]
+ x86/PAT: Xorg:475 map pfn expected mapping type uncached-minus for [mem 0xfd000000-0xfdffffff], got write-combining
+ ------------[ cut here ]------------
+ WARNING: CPU: 0 PID: 475 at /home/paul/poky/build/tmp-glibc/work-shared/qemux86/kernel-source/arch/x86/mm/pat.c:938 untrack_pfn+0x9f/0xb0()
+ Modules linked in: 8021q parport_pc parport floppy uvesafb
+ CPU: 0 PID: 475 Comm: Xorg Not tainted 4.1.0-rc5-yocto-standard #1
+ Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.8.2-0-g33fbe13 by qemu-project.org 04/01/2014
+  00000000 00000000 cdf75db0 c1837711 00000000 cdf75de4 c104f0cb c1a39d10
+  00000000 000001db c1a38f54 000003aa c1049ddf 000003aa c1049ddf 00000000
+  c0108840 00000000 cdf75df4 c104f1a2 00000009 00000000 cdf75e18 c1049ddf
+ Call Trace:
+  [<c1837711>] dump_stack+0x4b/0x75
+  [<c104f0cb>] warn_slowpath_common+0x8b/0xc0
+  [<c1049ddf>] ? untrack_pfn+0x9f/0xb0
+  [<c1049ddf>] ? untrack_pfn+0x9f/0xb0
+  [<c104f1a2>] warn_slowpath_null+0x22/0x30
+  [<c1049ddf>] untrack_pfn+0x9f/0xb0
+  [<c104b9d3>] ? __kunmap_atomic+0x33/0xc0
+  [<c113c07f>] unmap_single_vma+0x49f/0x4b0
+  [<c113cdc3>] unmap_vmas+0x43/0x60
+  [<c11428ff>] exit_mmap+0x5f/0xf0
+  [<c1072d39>] ? get_parent_ip+0x9/0x40
+  [<c104cccd>] mmput+0x2d/0xa0
+  [<c104dfdd>] copy_process.part.45+0x10dd/0x14a0
+  [<c104e541>] do_fork+0xc1/0x390
+  [<c104e8d5>] SyS_clone+0x25/0x30
+  [<c183ef46>] syscall_call+0x7/0x7
+ ---[ end trace dbbf5a6b2dea64ff ]---
  x86/PAT: Overlap at 0xfd000000-0xfe000000
- x86/PAT: reserve_memtype added [mem 0xfd000000-0xfdffffff], track write-combining, req write-combining, ret write-combining
- x86/PAT: Overlap at 0xfe000000-0xfe010000
- x86/PAT: reserve_memtype added [mem 0xfe000000-0xfe00ffff], track uncached-minus, req uncached-minus, ret uncached-minus
+ x86/PAT: reserve_memtype added [mem 0xfd000000-0xfdffffff], track write-combining, req uncached-minus, ret write-combining
  x86/PAT: free_memtype request [mem 0xfd000000-0xfdffffff]
+ x86/PAT: Xorg:475 map pfn expected mapping type uncached-minus for [mem 0xfd000000-0xfdffffff], got write-combining
  x86/PAT: free_memtype request [mem 0xfe000000-0xfe00ffff]
- hrtimer: interrupt took 5057254 ns
+ x86/PAT: free_memtype request [mem 0xfd000000-0xfdffffff]

One obvious difference is the number of overlaps:

~$cat fail.txt |grep Overlap | wc -l
7
~$cat works.txt |grep Overlap | wc -l
9
~$

I'm assuming everyone here is used to reading diffs, but if someone
wants the full dmesg files let me know and I'll send them off-list.

Paul.

