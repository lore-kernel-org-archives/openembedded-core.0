Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.23346.1617030866972008769
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 08:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HqaTu+Eb;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id u21so19991245ejo.13
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Mar 2021 08:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QBeLK2V2tA3nOMAVH7CihLGw0u39gyRQMOKexywWcGk=;
        b=HqaTu+EbgFcm3ieJaIawoKFJHTKrOmPQYvJ9rjIqRJGm4PPURHkkx2wQb1qOgWjOFo
         Yan4NGsP0tkSigbaOqJ2YFsnb7PHZrvC3f4dyeWxQUt1Qy+DQrkiTekTzKNuUY96NrxF
         Mgu4ga8mb+AR7hj+h5g6lsFolWatwL/7AH4YP43MoQ4Pa9fdxB2cJnfmcUjCS96FAKiF
         2jPtTKfI5TWdtHqqv7PGfKFY+pQGWQaPn2tDw4sPHqwAZPdfPnBOX+jKR3sX4IO1IWKF
         ztC/+55RpBlW4HPE2pfs/wLdk0bcVeQyhwhJ34qrNXWrYpbecGGJpo8Ebhy22st5bWNJ
         AL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QBeLK2V2tA3nOMAVH7CihLGw0u39gyRQMOKexywWcGk=;
        b=XK0FozTkIpH6f4NSDxw6sN745OyXNzbHjtYaKq6NnUXJplRg+GP2fG8/XiH0d7juZc
         ThWyTboN4nibiuVZFELPXBf1Kg96YHiHt4wqSMTg23nu/wqRKxZg/45p4jERV99ZsIiP
         pKLg3/ipXpBc/6bdj7mVCPSvK1monI7D5mXhCuXpK+ITBeSsKMVcRMEKIVGj5Y1FYvSw
         h8XqOTc2RMEhbDTsX+eYXptofFmHoQ4EdfUqnZf5R6g5teUuYdod+IUeUdI1CLA11mU2
         i8e4v+nt3JiM+keel3VKkDxhsz40iwDUyvYt+2uu/jDWIYcijHs9dJyZ1ca32K9/5AGc
         7s5w==
X-Gm-Message-State: AOAM530s77Aeg/iu5uwrEss7H6aMjDw/L+5SOAGxh9DLCNpCyif3ckSc
	XfjQX3E6yxmqXO8uK7GBVu9oxcvGUvhtFSVcAX4=
X-Google-Smtp-Source: ABdhPJzIGJ7hz/MLOb0u5dBg4hhG3wlZ+Sk+DwCcGtnL7QhCyW0GhvmUQ9gWt5zabn8QG+q7LKcs7X9kAl/1xo4CTLY=
X-Received: by 2002:a17:906:11d1:: with SMTP id o17mr29028450eja.517.1617030865365;
 Mon, 29 Mar 2021 08:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210326011304.25640-1-nm@ti.com> <CADkTA4M1+oP3nOnibE+AiLNn3gc9T84dgBzGTqjadW3Hd4+tpA@mail.gmail.com>
 <20210329140821.3i7sezuznurbuaqv@smokiness>
In-Reply-To: <20210329140821.3i7sezuznurbuaqv@smokiness>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 29 Mar 2021 11:14:13 -0400
Message-ID: <CADkTA4OH1OtPFCe+fsEe9S=ikSv0Bw-15cMPivGpFBt7zVLxTA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: Provide the correct objcopy to kernel make
To: Nishanth Menon <nm@ti.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, praneeth@ti.com, 
	Denys Dmytriyenko <denis@denix.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 29, 2021 at 10:08 AM Nishanth Menon <nm@ti.com> wrote:
>
> On 13:31-20210327, Bruce Ashfield wrote:
> > On Thu, Mar 25, 2021 at 9:13 PM Nishanth Menon via
> > lists.openembedded.org <nm=ti.com@lists.openembedded.org> wrote:
> > >
> > > When cross-compiling with v5.12-rc3, prepare fails[1] build of vdso at
> > > the objcopy stage since it seems to be using the local host's objcopy
> > > rather than the cross-compile version we want it to use.
> > >
> > > This can be trivially reproduced in a localbuild of the kernel
> > > following the build parameters provided in the process[2]
> > >
> > > Lets fix this by passing OBJCOPY over to the kernel.
> > >
> >
> > As I mentioned to Denys, I hadn't seen this. Consulting the
> > maintainers file would have found me as a good addition to the cc'.
> >
>
> Sure. understood. Thanks..
>
> > I'm doing some other work on make-mod-scripts dependencies right now,
> > so I've pulled this in and will re-test against all of the active
> > kernel versions in master.
> >
>
>
> Thanks.
>
> > But I don't think that make-mod-scripts is the only place we'd need
> > this, if it is indeed happening on the tip of all the supported
> > versions.  There are routes to have the prepare steps run, without a
> > make-mod-scripts dependency.
> >
> > We've already made the mistake of letting the make-mod-scrips and
> > kernel build parameters diverge (see AR=${KERNEL_AR}), so I need to
> > spend a few minutes getting them back in sync.
> >
> > I was just able to build and boot qemuarm64 on 5.12-rc4, so there's
> > something different about your config than my setup. We need to figure
> > that out. It could be a .config triggering different components to be
> > built, but unlikely given vdso being involved.
> >
> > qemuarm64 login: root
> > root@qemuarm64:~# uname -a
> > Linux qemuarm64 5.12.0-rc4-yoctodev-standard #1 SMP PREEMPT Mon Mar 22
> > 18:46:22 UTC 2021 aarch64 aarch64 aarch64 GNU/Linux
> > root@qemuarm64:~#
>
> Hmm... only thing I have done is cross compile - see the pastebins.
> >
> > > [1] https://pastebin.ubuntu.com/p/pNcQtb93wr/
> > > [2] https://pastebin.ubuntu.com/p/vZGqgh9Sq5/
> > > Signed-off-by: Nishanth Menon <nm@ti.com>
>
> [...]
> > > diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
> > > index 07ec242e63bb..3d25fc7ac531 100644
> > > --- a/meta/classes/kernel-arch.bbclass
> > > +++ b/meta/classes/kernel-arch.bbclass
> > > @@ -60,9 +60,12 @@ TARGET_LD_KERNEL_ARCH ?= ""
> > >  HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
> > >  TARGET_AR_KERNEL_ARCH ?= ""
> > >  HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
> > > +TARGET_OBJCOPY_KERNEL_ARCH ?= ""
> > > +HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
> > >
> >
> > We shouldn't need this TARGET_OBJCOPY_KERNEL_ARCH ->
> > HOST_OBJCOPY_KERNEL_ARCH, I can't think of how objcopy would be using
> > them.
>
> >
> > Are you setting them to some value in your builds ?
>
> No, I am not. I decided to maintain consistency of usage from LD and AR.
> I could'nt think of a usage either, true.

That's what I figured. I was worried I was missing some sort of
usecase. No harm in copying the existing pattern, I didn't introduce
it either, so I wanted to make sure there wasn't something going on
that I didn't see.

>
>
> >
> > >  KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH}"
> > >  KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
> > >  KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
> > > +KERNEL_OBJCOPY = "${CCACHE}${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
> >
> > The main kernel Makefile already defines, and the standard env should
> > already have both CROSS_COMPILE and OBJCOPY defined to be the target
> > version.
> >
> > Makefile:OBJCOPY                = $(CROSS_COMPILE)objcopy
>
> OK this is what is confusing me -> I dont see CROSS_COMPILE being set -
> which is what I had expected in the first place. other than
> meta/recipes-kernel/perf/perf.bb, I dont see it set else where -> I was
> really wondering why all the specific usage, when CROSS_COMPILE would
> have just done the job.. Then I was guessing maybe the rationale is for
> some ancient kernel where CROSS_COMPILE is'nt set right?
>

It could be, we also wanted to tack on the CCACHE stuff, but generally
speaking .. it is all kind of redundant with new kernels.

> >
> > So we really have to pass this, when fundamentally it is the same
> > definition as what the defaults give us.
> >
> > What does that resolve to in your builds ? In mine, when I dump the
> > objcopy value from within the kernel build, I get:
> >
> > | /opt/poky/build/tmp/work-shared/qemuarm64/kernel-source/Makefile:443:
> > *** objcopy: aarch64-poky-linux-objcopy.  Stop.
> >
> > Which should be doing the job.
>
> x86's objcopy - which is why I was trying to figure out what the heck
> went on..

That is indeed strange.

What does bitbake -e tell you ?

CROSS_COMPILE should be exported by kernel.bbclass itself,
it definitely is in my environment dump.

>
> >
> > Are you building arm on arm ? or something else like that ?
>
>
> Nothing fancy.. x86 PC cross compiling for arm. honestly, 5.11 build
> went fine. What makes me wonder is how does it even build for you? how
> does OBJCOPY variable even point to aarch64-poky-linux-objcopy

Indeed. I've done a full set of tests on all the arches for 5.12-rc+ (as
you can see by the lttng/perf/devsrc patches that I've been sending
in the past week), so something odd is going on here.

Are the layers you are building public ? if so, I can try with your exact
setup and see if I can reproduce the issue.

Bruce

>
> --
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
