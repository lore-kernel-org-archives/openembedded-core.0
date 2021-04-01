Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.7703.1617283016282584677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 06:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=egh20L76;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a7so2844947ejs.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 06:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C3s42qNWSan5VrfeTr9U0cE/6EVaPFbb+xgkWCUJw24=;
        b=egh20L76U1qHNHYKsT+nm6hLBXc6agJOWIyBrL9YS/cG0QUea8WGVsGuSWAGw9+FIg
         CKSW2kjZXcOZmukYqt2knJ9ggmuQKWmP6CvM4vgXNAsd2bvcQnSAaF4T5pMLEuYDpBNO
         e4ZufeMvTuSE+HAu4XGKXprwKnjkfgU+tSmV0W4HxfYRXlceSMl6QTX0xHic3A/MJYnm
         vXtV6n4JdOASaWu43xk6akQgg0UXnpMjSks5rLZli3J1x4fw6aGbAhVgT1P+RgA6y400
         YmK6YlimUx//QrCxZS3ka6Zs7wkfjZUJuIY4kH41jolQ3CmHL4meJybLpbf+uakEAHkL
         wlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C3s42qNWSan5VrfeTr9U0cE/6EVaPFbb+xgkWCUJw24=;
        b=XKdlH84LZ+P1x/fDVZAYWRdlEwQ9TudEl/xTKMIXQ44+Dv9hE1+Av9VJ4uQJ7fPwS6
         O/uu9XLSz1BviO6uhI6WmUouHN6O+bRPH8u4qLlqRdxShH8vEEjSQdTpyAMjEyTbVRJO
         ULe+3AbLlWgBGJVMKak6xWdo6c5dkcmE0yo4mVDArKign1uPlD1zMbnAaqk/o5B/WtKA
         Jn/SQNKJuJYZ+Quf9CzdCbKkupTPLQXXpen/13+ngEa1UMSEXriKEZb8/ZM31aiVEJsC
         VAGkBrCEc0TVefW6l1eExgcQpUrPLzUV4aOghISI4SgJXjyLtnb3XazVP4wuqntxEcdR
         e43Q==
X-Gm-Message-State: AOAM533UOq/yTTq4f4aIRWFQngCbJEaznItpV97d+TINL0fKYJC/keoJ
	QhHbziaGvv4KUh9x5kSfgn8JxOsu6x6AwVxgUiw=
X-Google-Smtp-Source: ABdhPJxa/RePX/fL1knUkuYfE53MkHryk1LGcTsfiboQ8LeYVSW1uLuDrHWxCdXQyhSlncXLWgGHoKECxHhN+194MTw=
X-Received: by 2002:a17:906:110d:: with SMTP id h13mr9048263eja.357.1617283014471;
 Thu, 01 Apr 2021 06:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210326011304.25640-1-nm@ti.com> <CADkTA4M1+oP3nOnibE+AiLNn3gc9T84dgBzGTqjadW3Hd4+tpA@mail.gmail.com>
 <20210329140821.3i7sezuznurbuaqv@smokiness> <CADkTA4OH1OtPFCe+fsEe9S=ikSv0Bw-15cMPivGpFBt7zVLxTA@mail.gmail.com>
 <20210401000109.GM23013@denix.org>
In-Reply-To: <20210401000109.GM23013@denix.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 1 Apr 2021 09:16:43 -0400
Message-ID: <CADkTA4MA9Quz_LtSt4LuR+4v7qXfwb4ctcjigca7=vTr1W89ow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: Provide the correct objcopy to kernel make
To: Denys Dmytriyenko <denis@denix.org>
Cc: Nishanth Menon <nm@ti.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, praneeth@ti.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 31, 2021 at 8:01 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Mon, Mar 29, 2021 at 11:14:13AM -0400, Bruce Ashfield wrote:
> > On Mon, Mar 29, 2021 at 10:08 AM Nishanth Menon <nm@ti.com> wrote:
> > >
> > > On 13:31-20210327, Bruce Ashfield wrote:
> > > > On Thu, Mar 25, 2021 at 9:13 PM Nishanth Menon via
> > > > lists.openembedded.org <nm=ti.com@lists.openembedded.org> wrote:
> > > > >
> > > > > When cross-compiling with v5.12-rc3, prepare fails[1] build of vdso at
> > > > > the objcopy stage since it seems to be using the local host's objcopy
> > > > > rather than the cross-compile version we want it to use.
> > > > >
> > > > > This can be trivially reproduced in a localbuild of the kernel
> > > > > following the build parameters provided in the process[2]
> > > > >
> > > > > Lets fix this by passing OBJCOPY over to the kernel.
> > > > >
> > > >
> > > > As I mentioned to Denys, I hadn't seen this. Consulting the
> > > > maintainers file would have found me as a good addition to the cc'.
> > > >
> > >
> > > Sure. understood. Thanks..
> > >
> > > > I'm doing some other work on make-mod-scripts dependencies right now,
> > > > so I've pulled this in and will re-test against all of the active
> > > > kernel versions in master.
> > > >
> > >
> > >
> > > Thanks.
> > >
> > > > But I don't think that make-mod-scripts is the only place we'd need
> > > > this, if it is indeed happening on the tip of all the supported
> > > > versions.  There are routes to have the prepare steps run, without a
> > > > make-mod-scripts dependency.
> > > >
> > > > We've already made the mistake of letting the make-mod-scrips and
> > > > kernel build parameters diverge (see AR=${KERNEL_AR}), so I need to
> > > > spend a few minutes getting them back in sync.
> > > >
> > > > I was just able to build and boot qemuarm64 on 5.12-rc4, so there's
> > > > something different about your config than my setup. We need to figure
> > > > that out. It could be a .config triggering different components to be
> > > > built, but unlikely given vdso being involved.
> > > >
> > > > qemuarm64 login: root
> > > > root@qemuarm64:~# uname -a
> > > > Linux qemuarm64 5.12.0-rc4-yoctodev-standard #1 SMP PREEMPT Mon Mar 22
> > > > 18:46:22 UTC 2021 aarch64 aarch64 aarch64 GNU/Linux
> > > > root@qemuarm64:~#
> > >
> > > Hmm... only thing I have done is cross compile - see the pastebins.
> > > >
> > > > > [1] https://pastebin.ubuntu.com/p/pNcQtb93wr/
> > > > > [2] https://pastebin.ubuntu.com/p/vZGqgh9Sq5/
> > > > > Signed-off-by: Nishanth Menon <nm@ti.com>
> > >
> > > [...]
> > > > > diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
> > > > > index 07ec242e63bb..3d25fc7ac531 100644
> > > > > --- a/meta/classes/kernel-arch.bbclass
> > > > > +++ b/meta/classes/kernel-arch.bbclass
> > > > > @@ -60,9 +60,12 @@ TARGET_LD_KERNEL_ARCH ?= ""
> > > > >  HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
> > > > >  TARGET_AR_KERNEL_ARCH ?= ""
> > > > >  HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
> > > > > +TARGET_OBJCOPY_KERNEL_ARCH ?= ""
> > > > > +HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
> > > > >
> > > >
> > > > We shouldn't need this TARGET_OBJCOPY_KERNEL_ARCH ->
> > > > HOST_OBJCOPY_KERNEL_ARCH, I can't think of how objcopy would be using
> > > > them.
> > >
> > > >
> > > > Are you setting them to some value in your builds ?
> > >
> > > No, I am not. I decided to maintain consistency of usage from LD and AR.
> > > I could'nt think of a usage either, true.
> >
> > That's what I figured. I was worried I was missing some sort of
> > usecase. No harm in copying the existing pattern, I didn't introduce
> > it either, so I wanted to make sure there wasn't something going on
> > that I didn't see.
> >
> > >
> > >
> > > >
> > > > >  KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH}"
> > > > >  KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
> > > > >  KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
> > > > > +KERNEL_OBJCOPY = "${CCACHE}${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
> > > >
> > > > The main kernel Makefile already defines, and the standard env should
> > > > already have both CROSS_COMPILE and OBJCOPY defined to be the target
> > > > version.
> > > >
> > > > Makefile:OBJCOPY                = $(CROSS_COMPILE)objcopy
> > >
> > > OK this is what is confusing me -> I dont see CROSS_COMPILE being set -
> > > which is what I had expected in the first place. other than
> > > meta/recipes-kernel/perf/perf.bb, I dont see it set else where -> I was
> > > really wondering why all the specific usage, when CROSS_COMPILE would
> > > have just done the job.. Then I was guessing maybe the rationale is for
> > > some ancient kernel where CROSS_COMPILE is'nt set right?
> > >
> >
> > It could be, we also wanted to tack on the CCACHE stuff, but generally
> > speaking .. it is all kind of redundant with new kernels.
> >
> > > >
> > > > So we really have to pass this, when fundamentally it is the same
> > > > definition as what the defaults give us.
> > > >
> > > > What does that resolve to in your builds ? In mine, when I dump the
> > > > objcopy value from within the kernel build, I get:
> > > >
> > > > | /opt/poky/build/tmp/work-shared/qemuarm64/kernel-source/Makefile:443:
> > > > *** objcopy: aarch64-poky-linux-objcopy.  Stop.
> > > >
> > > > Which should be doing the job.
> > >
> > > x86's objcopy - which is why I was trying to figure out what the heck
> > > went on..
> >
> > That is indeed strange.
> >
> > What does bitbake -e tell you ?
> >
> > CROSS_COMPILE should be exported by kernel.bbclass itself,
> > it definitely is in my environment dump.
>
> Bruce,
>
> Looks like make-mod-scripts does not inherit kernel.bbclass, but only
> kernel-arch.bbclass and hence doesn't do "export CROSS_COMPILE" that is
> in kernel.bbclass
>
> Since make-mod-scripts is not used for the kernel, only for out-of-tree
> modules, you have to either build it directly or e.g. cryptodev-module.
>
> I got it easily reproducible with Poky master by adding these to
> local.conf:
>
> MACHINE = "qemuarm64"
> PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-dev"
>
> $ bitbake make-mod-scripts
>
> One easy way to fix it is to pass CROSS_COMPILE explicitly in
> make-mod-scripts. See the patch I just sent.

I agree that make-mod-scripts doesn't have CROSS_COMPILE set
(I just dumped the env to confirm).

It is still odd that I can build for that very same machine without
any issues though. There's still something lurking that is filling in
the required dependencies and making the build not necessary.

I've built and booted qemuarm64 on the tip of poky master with
5.12+ hundreds of times already, and have never seen that.

BUT .. I switched to my second builder, used my exact same
configuration and it did in fact show the issue. I have some
local patches on my primary builder, so one of them may have
been bolting everything together (not relevant here, but I'll
go back and look at them later).

I like this simpler fix, and will follow up directly on the patch you
sent.

Bruce

>
>
> > > > Are you building arm on arm ? or something else like that ?
> > >
> > >
> > > Nothing fancy.. x86 PC cross compiling for arm. honestly, 5.11 build
> > > went fine. What makes me wonder is how does it even build for you? how
> > > does OBJCOPY variable even point to aarch64-poky-linux-objcopy
> >
> > Indeed. I've done a full set of tests on all the arches for 5.12-rc+ (as
> > you can see by the lttng/perf/devsrc patches that I've been sending
> > in the past week), so something odd is going on here.
> >
> > Are the layers you are building public ? if so, I can try with your exact
> > setup and see if I can reproduce the issue.
> >
> > Bruce
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
