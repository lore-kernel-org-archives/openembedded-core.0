Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 361C6770EF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 21:18:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u23LI5gS008530
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 Mar 2016 13:18:05 -0800 (PST)
Received: from yow-pgortmak-d1 (128.224.56.57) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 3 Mar 2016 13:18:03 -0800
Received: by yow-pgortmak-d1 (Postfix, from userid 1000)	id A8409281B6A; Thu,
	3 Mar 2016 16:18:03 -0500 (EST)
Date: Thu, 3 Mar 2016 16:18:03 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Borislav Petkov <bp@suse.de>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Toshi Kani <toshi.kani@hp.com>
Message-ID: <20160303211803.GC25222@windriver.com>
References: <20160303205924.GA25222@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20160303205924.GA25222@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>, "Hart,
	Darren" <darren.hart@intel.com>,
	"saul.wold" <saul.wold@intel.com>, linux-kernel@vger.kernel.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 03 Mar 2016 21:18:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

[runtime regression with "x86/mm/pat: Emulate PAT when it is disabled"] On 03/03/2016 (Thu 15:59) Paul Gortmaker wrote:

> So, the yocto folks moved from 4.1 to 4.4 and one of their automated
> qemu x86-32 boot tests started failing.  None of the yocto details seem
> to matter since I offered to help and I've repropduced it using 100%
> mainline kernels and a generic distro toolchain as well.
> 
> The test case is slightly complicated, in that it relies on uvesafb
> being modular, and so one has to juggle modules within an ext4 image
> that qemu boots from.  We tried making uvesafb builtin, but that made
> the issue magically vanish.  Given PAT, this isn't too surprising.
> 
> Richard did the preliminary investigation and analysis, and from that I
> did a bisect, and found the commit in $SUBJECT to be the root cause, as
> per the discussion here:
> 
> http://lists.openembedded.org/pipermail/openembedded-core/2016-March/118397.html
> 
> I'd mentioned the above to bpetkov on IRC and after confirming it was
> still an issue on 4.5-rc6, he'd asked if I had a portable reproducer.  
> 
> Not sure how complicated that would be, I set out to make one from my
> build.   With a little LD_PRELOAD type magic and ensuring all the qemu
> components are in ./  I have one that runs on an otherwise qemu-free
> x86-64 box. 
> 
> The stand alone reproducer is here; launched in 00-runme:
> 
> http://openlinux.wrs.com/pat-splat/reproducer.tar.bz2  

Apologies, I'd used an internal DNS abbreviation here that isn't global.
Replace the wrs with windriver and everything should be good.

P.
--

> 
> It is nothing fancy, just a generic yocto build of "sato" (gfx enabled
> rootfs).  When it "works" it boots to a UI touchscreen interface.  When
> it fails, you get a black screen with a blinking cursor (as seen in
> "vncviewer localhost:0").
> 
> Upon failure, you can do <Ctrl>-<Alt>-<2> to get to a passwd-less root
> login ; there you can run dmesg and see the splat.  The image is
> currently using 4.5-rc6 ; but any kernel can be inserted; "make
> modules_install INSTALL_MOD_PATH=here" and then populating those modules
> from "here" into /lib/modules of the loopback mounted image. And of
> course updating the bzImage on the qemu cmdline.    Currently it
> contains a bzImage and modules for 4.5-rc6 as I last tested that.
> 
> Also note that vncviewer will disconnect when it goes from early boot
> 80x25 to a higer res gfx mode; just reconnect and continue observing the
> target.
> 
> I've ruled out yocto kernel changes, and yocto toolchain -- but maybe it
> is a qemu issue this commit triggers ; who knows at this point.
> 
> Since I've NFI what component(s) cause this, I wanted to have the qemu
> binary, all libraries etc as part of the reproducer and nothing left to
> chance, and I've tested the reproducer on an ancient dual core w/o vmx
> and w/o any qemu binaries installed.  Bruce also tested it on a slightly
> more modern dual socket xeon with vmx and confirmed it failed there..
> 
> Inside there is a 00-runme ; mostly a copy of qemu args the yocto
> automated tests were using.  There is also everything the qemu binaries
> need to run ; toplevel dir is noisy since qemu only looks in ./ it
> seems.  There is also an ext4.img ; as mentioned earlier, this only
> happens when uvesafb.ko is a module, so one has to loopback mount that
> image and repopulate /lib/modules/  for each boot test/bisect step.
> 
> I've also included 00-bisect.txt as the output of git bisect log.  And
> there is also 00-configs/ dir that has the ".config" kernel file for
> each build (dir names are "git describe" in here for easy correlation)
> done for the bisect (plus the latest mainline build).  The failing commit
> in the subject is v4.1-rc5-22-g9cd25aac1f44 .
> 
> My contribution here is largely a bisect that can be relied on and
> providing a portable reproducer of the regression; I am by no means a
> PAT expert ; Richard invested more time into actually understanding the
> problem than I did, so I'm going to totally throw him under the bus on
> this when it comes to considering the ultimate root cause and possible
> fixes.  :)
> 
> Paul.
> --

