Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.21888.1617026906815390977
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 07:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=w05xT/iU;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12TE8L0E035344;
	Mon, 29 Mar 2021 09:08:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617026901;
	bh=Rc0exXr63aD56giZtCYhXQVcqRom6tRRl7kyJbwck98=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=w05xT/iUI3S6sfLttp29Q1fSnDGDAJX7/jt/jd+O85zQMfSPJz3RY/3EymsLAdPRI
	 BLfe0LUiPsux8me0QpvicVXgWgCijfV0Sb9CE/JvFRNvflQSA/njZAE/QJCVF/3WW9
	 lRK/Iw/f4SUyMMp/x+IMD/ISNpuojfl8TXqcQavM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12TE8L1W116954
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Mar 2021 09:08:21 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 29
 Mar 2021 09:08:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 29 Mar 2021 09:08:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12TE8LAJ052365;
	Mon, 29 Mar 2021 09:08:21 -0500
Date: Mon, 29 Mar 2021 09:08:21 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
        <praneeth@ti.com>, Denys
 Dmytriyenko <denis@denix.org>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: Provide the correct objcopy to kernel make
Message-ID: <20210329140821.3i7sezuznurbuaqv@smokiness>
References: <20210326011304.25640-1-nm@ti.com>
 <CADkTA4M1+oP3nOnibE+AiLNn3gc9T84dgBzGTqjadW3Hd4+tpA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4M1+oP3nOnibE+AiLNn3gc9T84dgBzGTqjadW3Hd4+tpA@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 13:31-20210327, Bruce Ashfield wrote:
> On Thu, Mar 25, 2021 at 9:13 PM Nishanth Menon via
> lists.openembedded.org <nm=ti.com@lists.openembedded.org> wrote:
> >
> > When cross-compiling with v5.12-rc3, prepare fails[1] build of vdso at
> > the objcopy stage since it seems to be using the local host's objcopy
> > rather than the cross-compile version we want it to use.
> >
> > This can be trivially reproduced in a localbuild of the kernel
> > following the build parameters provided in the process[2]
> >
> > Lets fix this by passing OBJCOPY over to the kernel.
> >
> 
> As I mentioned to Denys, I hadn't seen this. Consulting the
> maintainers file would have found me as a good addition to the cc'.
> 

Sure. understood. Thanks..

> I'm doing some other work on make-mod-scripts dependencies right now,
> so I've pulled this in and will re-test against all of the active
> kernel versions in master.
> 


Thanks.

> But I don't think that make-mod-scripts is the only place we'd need
> this, if it is indeed happening on the tip of all the supported
> versions.  There are routes to have the prepare steps run, without a
> make-mod-scripts dependency.
> 
> We've already made the mistake of letting the make-mod-scrips and
> kernel build parameters diverge (see AR=${KERNEL_AR}), so I need to
> spend a few minutes getting them back in sync.
> 
> I was just able to build and boot qemuarm64 on 5.12-rc4, so there's
> something different about your config than my setup. We need to figure
> that out. It could be a .config triggering different components to be
> built, but unlikely given vdso being involved.
> 
> qemuarm64 login: root
> root@qemuarm64:~# uname -a
> Linux qemuarm64 5.12.0-rc4-yoctodev-standard #1 SMP PREEMPT Mon Mar 22
> 18:46:22 UTC 2021 aarch64 aarch64 aarch64 GNU/Linux
> root@qemuarm64:~#

Hmm... only thing I have done is cross compile - see the pastebins.
> 
> > [1] https://pastebin.ubuntu.com/p/pNcQtb93wr/
> > [2] https://pastebin.ubuntu.com/p/vZGqgh9Sq5/
> > Signed-off-by: Nishanth Menon <nm@ti.com>

[...]
> > diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
> > index 07ec242e63bb..3d25fc7ac531 100644
> > --- a/meta/classes/kernel-arch.bbclass
> > +++ b/meta/classes/kernel-arch.bbclass
> > @@ -60,9 +60,12 @@ TARGET_LD_KERNEL_ARCH ?= ""
> >  HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
> >  TARGET_AR_KERNEL_ARCH ?= ""
> >  HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
> > +TARGET_OBJCOPY_KERNEL_ARCH ?= ""
> > +HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
> >
> 
> We shouldn't need this TARGET_OBJCOPY_KERNEL_ARCH ->
> HOST_OBJCOPY_KERNEL_ARCH, I can't think of how objcopy would be using
> them.

> 
> Are you setting them to some value in your builds ?

No, I am not. I decided to maintain consistency of usage from LD and AR.
I could'nt think of a usage either, true.


> 
> >  KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH}"
> >  KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
> >  KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
> > +KERNEL_OBJCOPY = "${CCACHE}${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
> 
> The main kernel Makefile already defines, and the standard env should
> already have both CROSS_COMPILE and OBJCOPY defined to be the target
> version.
> 
> Makefile:OBJCOPY                = $(CROSS_COMPILE)objcopy

OK this is what is confusing me -> I dont see CROSS_COMPILE being set -
which is what I had expected in the first place. other than
meta/recipes-kernel/perf/perf.bb, I dont see it set else where -> I was
really wondering why all the specific usage, when CROSS_COMPILE would
have just done the job.. Then I was guessing maybe the rationale is for
some ancient kernel where CROSS_COMPILE is'nt set right?

> 
> So we really have to pass this, when fundamentally it is the same
> definition as what the defaults give us.
> 
> What does that resolve to in your builds ? In mine, when I dump the
> objcopy value from within the kernel build, I get:
> 
> | /opt/poky/build/tmp/work-shared/qemuarm64/kernel-source/Makefile:443:
> *** objcopy: aarch64-poky-linux-objcopy.  Stop.
> 
> Which should be doing the job.

x86's objcopy - which is why I was trying to figure out what the heck
went on..

> 
> Are you building arm on arm ? or something else like that ?


Nothing fancy.. x86 PC cross compiling for arm. honestly, 5.11 build
went fine. What makes me wonder is how does it even build for you? how
does OBJCOPY variable even point to aarch64-poky-linux-objcopy

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
