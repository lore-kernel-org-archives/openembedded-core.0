Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD1DC77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 12:32:59 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web11.48085.1684326770531265936
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 05:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=BwBijU+W;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-76c636b6306so60384739f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 05:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684326770; x=1686918770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OoVmuhdDMKBTwM0uiPrtfyaCcksBB3Nm10Zjz7rFVFU=;
        b=BwBijU+WAekhHYi1EADgE9D8oC+6ehST8a5VAyOWcvJCBoGCcotpmpc6AM5ukp7N0+
         PFlp+D2IxjsXTqp9mteITWIRM63AZpzCdOeiiM+bbZcOkhZV+cJKUkqBTYMB8d7p2JOI
         uRkmpmyXxajE7jVoU9i+ugsZdii3eTJ4pKMHc/pS+maFCAyhmuvUhz/GvI9iwz/mcBBO
         5ozjD3G9ssVhzOktN6a2ji4qFVqwNcVWT+ZlSKGxekNejK2NfjeQC24xIl39I4+YsmOz
         We8Li7LGXgF5Olh04icVpLiBDm61Bl8QrqEzcyNDC4rLAfJg5qUAF0N7HdkJ6uhBmIFX
         RUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684326770; x=1686918770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OoVmuhdDMKBTwM0uiPrtfyaCcksBB3Nm10Zjz7rFVFU=;
        b=fnSOIFAr3vhh7AV+Yi+M2rpqtdVcVbT26SwjU2R0QN0jgOk08aePXMlEiMi2Vl29A9
         XguNwpjZ47/hzmTgWy283ag/mT7CoiF6AzJ3wmSQ7v+BhfKzQ3xzBBvAaN/BkgGRmR8D
         c3QxkNbb3GiXSipuCGAVD3OTPjXIIjZZVPLYYpJWp1X3AhDZKNounTL3DdwbXRzZ4Mo9
         2RYrr12znl8ENDXIpMGx7ppY2SlwHIdxhbq2pZ+QKEFR/xsG3wAIGieG5wwePu9sSLVR
         JwL2Y5BGcaIRb5N1tKnFE3EqmXJeJMXvFiUKryd72CpiPefUZ8w7k33v2+4FFQsc/qQU
         QV2Q==
X-Gm-Message-State: AC+VfDzDh69Lo5f213k+IloMSTfc1kBoV6LK61j8imyKaJJwAB/o7Cou
	fGpk+rHwv22tsbJR2P5ekFIZN+XMVa7a3JsN83A=
X-Google-Smtp-Source: ACHHUZ7oHLNmSUAqVVEcEoTqmF8fW97woPkc3b4GRfNVC1rxGeRPJeVOVKRiprl0x5l4d67FrF2iNN+MhIbKgYMQv7c=
X-Received: by 2002:a92:dc8a:0:b0:335:4c33:dd25 with SMTP id
 c10-20020a92dc8a000000b003354c33dd25mr2148891iln.23.1684326769512; Wed, 17
 May 2023 05:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230508013317.3937457-1-xiangyu.chen@eng.windriver.com>
 <015d196800fc8046575b7a6a9a1e38e893f2b1fa.camel@linuxfoundation.org>
 <CADkTA4OkMJOkA+JD1AOJOpt9pLwPJ0jFwpsg4gNZSC99zwPsmA@mail.gmail.com>
 <fa9f7858-af5c-7d48-d9b6-51ba874f25a1@windriver.com> <175E6CB55C617FA5.27409@lists.openembedded.org>
 <CADkTA4M5JnHLpea+EEWG9gD2SPEG_R9KDjr6zGVEvRHusV9upQ@mail.gmail.com>
 <312184e0-32cb-ab57-50c0-7a8c5519a0c7@windriver.com> <175F5136C3E93ABB.30531@lists.openembedded.org>
 <CADkTA4M5ZodLTjZ1EF0CFt4zzvywrg9rW-CZkexV_1pNgAdwgg@mail.gmail.com>
 <70bd8fc7-34b3-a435-cd88-2c39987cb547@windriver.com> <CADkTA4Pk5y-QHZ_d7UJwqn_Q6rCCt_y2EGpr7WpW-Lt+SByJNw@mail.gmail.com>
 <175FCA67A69FDE7A.26562@lists.openembedded.org> <ec56df62-485f-9814-bbec-6d58e272d822@windriver.com>
In-Reply-To: <ec56df62-485f-9814-bbec-6d58e272d822@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 17 May 2023 08:32:43 -0400
Message-ID: <CADkTA4PSwFRxBuZT6fsCkB-rZkEr+N6aa7zcir-qkCygLjYbiQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] linux-yocto: fix missing pahole and elfutils
 when CONFIG_DEBUG_INFO_BTF enabled in devshell
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 12:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181487

On Wed, May 17, 2023 at 1:24=E2=80=AFAM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
>
> On 5/17/23 09:35, Xiangyu Chen wrote:
> >
> > On 5/16/23 20:55, Bruce Ashfield wrote:
> >> CAUTION: This email comes from a non Wind River email account!
> >> Do not click links or open attachments unless you recognize the
> >> sender and know the content is safe.
> >>
> >> On Tue, May 16, 2023 at 4:56=E2=80=AFAM Xiangyu Chen
> >> <xiangyu.chen@eng.windriver.com> wrote:
> >>> Hi Bruce,
> >>>
> >>>
> >>> On 5/15/23 21:11, Bruce Ashfield wrote:
> >>>> CAUTION: This email comes from a non Wind River email account!
> >>>> Do not click links or open attachments unless you recognize the
> >>>> sender and know the content is safe.
> >>>>
> >>>> On Mon, May 15, 2023 at 8:34=E2=80=AFAM Bruce Ashfield via
> >>>> lists.openembedded.org
> >>>> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >>>>> On Mon, May 15, 2023 at 6:04=E2=80=AFAM Xiangyu Chen
> >>>>> <xiangyu.chen@eng.windriver.com> wrote:
> >>>>>> Hi Bruce,
> >>>>>>
> >>>>>>
> >>>>>> Sorry for being late..
> >>>>>>
> >>>>>>
> >>>>>> On 5/13/23 09:16, Bruce Ashfield wrote:
> >>>>>>
> >>>>>> CAUTION: This email comes from a non Wind River email account!
> >>>>>> Do not click links or open attachments unless you recognize the
> >>>>>> sender and know the content is safe.
> >>>>>>
> >>>>>> On Fri, May 12, 2023 at 10:47=E2=80=AFAM Bruce Ashfield via
> >>>>>> lists.openembedded.org
> >>>>>> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >>>>>>
> >>>>>> On Wed, May 10, 2023 at 10:23=E2=80=AFPM Xiangyu Chen
> >>>>>> <xiangyu.chen@eng.windriver.com> wrote:
> >>>>>>
> >>>>>> Hi Richard and Bruce,
> >>>>>>
> >>>>>>
> >>>>>> Thanks for your suggestion,
> >>>>>>
> >>>>>>
> >>>>>> On 5/11/23 00:25, Bruce Ashfield wrote:
> >>>>>>
> >>>>>> CAUTION: This email comes from a non Wind River email account!
> >>>>>> Do not click links or open attachments unless you recognize the
> >>>>>> sender and know the content is safe.
> >>>>>>
> >>>>>> On Wed, May 10, 2023 at 12:16=E2=80=AFPM Richard Purdie
> >>>>>> <richard.purdie@linuxfoundation.org> wrote:
> >>>>>>
> >>>>>> On Mon, 2023-05-08 at 09:33 +0800, Xiangyu Chen wrote:
> >>>>>>
> >>>>>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> >>>>>>
> >>>>>> after enable the kernel CONFIG_DEBUG_INFO_BTF in devshell, the
> >>>>>> make would report some
> >>>>>> errors due to pahole and elfuitls is missing, since this is a
> >>>>>> debug option, so conditionally
> >>>>>> add an option named "btf" in KERNEL_DEBUG_OPTIONS, if someone
> >>>>>> need enable CONFIG_DEBUG_INFO_BTF
> >>>>>> option in devshell, they can add KERNEL_DEBUG_OPTIONS +=3D "btf" i=
n
> >>>>>> local.conf to solve the pahole
> >>>>>> and elfutils dependency.
> >>>>>>
> >>>>>> Is this a defined workflow somewhere? Is KERNEL_DEBUG_OPTIONS
> >>>>>> with this
> >>>>>> option documented somewhere?
> >>>>>>
> >>>>>> I also think the mention of devshell in the commit message is
> >>>>>> misleading, this issue happens regardless of how you enable the
> >>>>>> option.
> >>>>>> There are also other ways of enabling this than local.conf, you'd
> >>>>>> likely not want people doing that at the end of development.
> >>>>>>
> >>>>>> I'm curious on Bruce's opinion but to me this at the very least
> >>>>>> needs a
> >>>>>> commit message rewrite and I'd question whether the docs elsewhere
> >>>>>> would allow someone to discover this workflow anyway.
> >>>>>>
> >>>>>> I missed this entirely, thanks for replying to it, or I never woul=
d
> >>>>>> have noticed.
> >>>>>>
> >>>>>> This mechanism isn't appropriate for these dependencies. I only
> >>>>>> added
> >>>>>> it to work around pkgconfig issues (which we can more cleanly
> >>>>>> solve in
> >>>>>> newer kernels  (see what I've been doing with make-mod-scripts)
> >>>>>> .. so
> >>>>>> it can eventually be dropped).
> >>>>>>
> >>>>>> We are already enabling elfutils-native conditionally on a
> >>>>>> per-architecture basis (currently only x86-64).
> >>>>>>
> >>>>>> If we need it on more arches now, we should enable it in the versi=
on
> >>>>>> specific recipes, or actually, we have moved far enough into newer
> >>>>>> kernel's that it could be in the .inc now.
> >>>>>>
> >>>>>> This commit's background was some kernel debug options needs
> >>>>>> elfutils
> >>>>>> and pahole native package, since the issue happens on enabling
> >>>>>> kernel
> >>>>>> debug options and not all people needs it, so I conditionally add
> >>>>>> the
> >>>>>> dependency in KERNEL_DEBUG_OPTION.
> >>>>>>
> >>>>>> If possible we can enable it in .inc because newer kernel tools
> >>>>>> like btf
> >>>>>> are support using pkg-config to locate the libelf instead of
> >>>>>> finding it
> >>>>>> from /usr/ folder, so we can use elfutils-natvie instead of
> >>>>>> installing
> >>>>>> elfutils package on host PC.
> >>>>>>
> >>>>>> Similarly, we should enable the pahole-native dependency on a
> >>>>>> per-arch basis.
> >>>>>>
> >>>>>> As Richard mentioned, what's the reproducer to see the errors ? it
> >>>>>> must be more than devshell.
> >>>>>>
> >>>>>> Yes, this happens on devshell and normal world if some kernel debu=
g
> >>>>>> options are enabled. We can reproduce this issue with following
> >>>>>> steps(I
> >>>>>> have found the issue with kernel 5.15):
> >>>>>>
> >>>>>> 1. enable kernel option CONFIG_DEBUG_KERNEL CONFIG_DEBUG_INFO and
> >>>>>> CONFIG_DEBUG_INFO_BTF
> >>>>>>
> >>>>>> 2. build the kernel image, the compiler would report missing
> >>>>>> libelf.h
> >>>>>> and gelf.h which contains in elfutils-native(this step not
> >>>>>> happens on
> >>>>>> x86-64 due to it has been enabled).
> >>>>>>
> >>>>>> 3. enable elfutils-native by manual, the kernel source code can be
> >>>>>> compiled successfully but failed in final step due to missing
> >>>>>> pahole.
> >>>>>>
> >>>>>>
> >>>>>> If you can follow up with the steps to reproduce, I can take on th=
e
> >>>>>> refactoring and broader dependency cleanup question, since I can
> >>>>>> test
> >>>>>> the wider matrix at the same time.
> >>>>>>
> >>>>>> Thanks, my local setup might missing some corner case, this is
> >>>>>> another
> >>>>>> reason I enable those native packages limit in
> >>>>>> KERNEL_DEBUG_OPTION :).
> >>>>>>
> >>>>>> I've been thinking about this, and I've come to the following
> >>>>>> suggestion:
> >>>>>>
> >>>>>> I plan on moving the elfutils-native to linux-yocto.inc, out of th=
e
> >>>>>> version specific
> >>>>>> recipes.  I'll also drop the architecture specific nature of the
> >>>>>> current DEPENDS.
> >>>>>> The need for this is much more common now, and all of the
> >>>>>> reference kernels
> >>>>>> in master are new enough. The elfutils-native build dependency is
> >>>>>> not
> >>>>>> significant
> >>>>>> enough to worry about adding it for all architectures. If it does
> >>>>>> become a problem,
> >>>>>> there are options to make it conditional again.
> >>>>>>
> >>>>>> I can drop the HOST_LIBELF_LIBS work around in the
> >>>>>> linux-yocto.inc, as
> >>>>>> we can now properly detect libelf via pkg-config. I didn't need
> >>>>>> it in any of
> >>>>>> my testing. Again, if this proves to be wrong, I'd enable it in a
> >>>>>> different way now
> >>>>>> (using what I've learned from fixing make-mod-scripts).
> >>>>>>
> >>>>>> As for the pahole-native dependency, there's been a "developer"
> >>>>>> kernel-type
> >>>>>> for quite some time. The design intention behind it was to enable
> >>>>>> options like
> >>>>>> this, and not make the "standard" or "production" kernel's too
> >>>>>> large by default.
> >>>>>> So the dependency could be conditional on that kernel type ...
> >>>>>> but we don't
> >>>>>> want to break other kernels just because they've enabled that
> >>>>>> option. We also
> >>>>>> don't (and won't) get into the game of looking for individual
> >>>>>> options in the
> >>>>>> .config to enable something, since a) it is too late b) it is a
> >>>>>> moving target.
> >>>>>>
> >>>>>> So that leaves the following options: a) enable pahole-native
> >>>>>> unconditionally
> >>>>>> on the arches that support it (x86-64, aarch64) (and also move
> >>>>>> the pahole
> >>>>>> recipe into oe-core) b) make the KERNEL_DEBUG_OPTIONS less specifi=
c,
> >>>>>> and simply call it KERNEL_DEBUG, when enabled, we could
> >>>>>> conditionally
> >>>>>> add pahole-native (I'd also submit documentation for the
> >>>>>> functionality
> >>>>>> c) something I haven't thought about ...
> >>>>>>
> >>>>>> I'm moving on the implementation now, but will adjust course if
> >>>>>> there's something
> >>>>>> I've missed.
> >>>>>>
> >>>>>> I have my implementation done, but I'm wondering what your
> >>>>>> configuration
> >>>>>> was for testing pahole ?
> >>>>>>
> >>>>> My reply will be hard to read, as plain text reply to the html
> >>>>> doesn't
> >>>>> give us proper
> >>>>> context indenting.
> >>>>>
> >>>>>> I have tested on a devshell, with oe-master branch, the kernel
> >>>>>> version using 5.15
> >>>>>>
> >>>>>> 1. enable pahole-native and elfutils-native in linux-yocto.inc as
> >>>>>> a dependency.
> >>>>>>
> >>>>>> 2. enable CONFIG_DEBUG_KERNEL  CONFIG_DEBUG_INFO and
> >>>>>> CONFIG_DEBUG_INFO_BTF under menuconfig
> >>>>>>
> >>>>>> 3. using "export PKG_CONFIG_SYSROOT_DIR=3D""" cleanning
> >>>>>> PKG_CONFIG_SYSROOT_DIR
> >>>>>>
> >>>>>> 4, make
> >>>>>>
> >>>>>>
> >>>>>> If the test environment using bitbake, then we need to remove
> >>>>>> PAHOLE=3Dfalse flag in kernel EXTRA_OEMAKE in
> >>>>>> classes-recipe/kernel.bbclass, otherwise, bitbake would report
> >>>>>> missing pahole error.
> >>>>>>
> >>>>> That's the same as my patch series (I've also changed PAHOLE=3Dfals=
e to
> >>>>> a conditional in my series).
> >>>>>
> >>>>>> I'm seeing the following in qemux86-64 at the end of the build:
> >>>>>>
> >>>>>> | Unsupported DW_TAG_unspecified_type(0x3b)
> >>>>>> | Encountered error while encoding BTF.
> >>>>>> |   LD      .tmp_vmlinux.kallsyms1
> >>>>>> |   NM      .tmp_vmlinux.kallsyms1.syms
> >>>>>> |   KSYMS   .tmp_vmlinux.kallsyms1.S
> >>>>>> |   AS      .tmp_vmlinux.kallsyms1.S
> >>>>>> |   LD      .tmp_vmlinux.kallsyms2
> >>>>>> |   NM      .tmp_vmlinux.kallsyms2.syms
> >>>>>> |   KSYMS   .tmp_vmlinux.kallsyms2.S
> >>>>>> |   AS      .tmp_vmlinux.kallsyms2.S
> >>>>>> |   LD      vmlinux
> >>>>>> |   BTFIDS  vmlinux
> >>>>>> | FAILED: load BTF from vmlinux: No such file or directory
> >>>>>> | make[1]: ***
> >>>>>> [/opt/poky/build/tmp/work-shared/qemux86-64/kernel-source/scripts/=
Makefile.vmlinux:34:
> >>>>>> vmlinux] Error 255
> >>>>>> | make[1]: *** Deleting file 'vmlinux'
> >>>>>> | make: ***
> >>>>>> [/opt/poky/build/tmp/work-shared/qemux86-64/kernel-source/Makefile=
:1255:
> >>>>>>
> >>>>>> vmlinux] Error 2
> >>>>>>
> >>>>>> I haven't looked into it at all yet (but will do so over the
> >>>>>> weekend)
> >>>>>> .. but I thought
> >>>>>>
> >>>>>> I haven't seen this problem yet(i'll pull the latest oe-core and
> >>>>>> meta-oe code and try again), if possible, could you share a patch
> >>>>>> with me so that we can test it together? thanks.
> >>>>>>
> >>>>> I'm on oe-core master, with qemux86-64.
> >>>>>
> >>>>> I'll do a bit more work on the patch today, and can share it if I
> >>>>> can't figure out where that unsupported tag is coming from.
> >>>> It seems like it is a known issue, I found both a lkml thread and
> >>>> debian bug from October 2022.
> >>>>
> >>>> Your 5.15 kernel wouldn't show the issue.
> >>> Yes, this should not happens on 5.15 kernel.
> >>>
> >>>
> >>> Today I synced the oe-core/poky to latest master version, removed the
> >>> build dir and run oe-init-build-env again and switched to use default
> >>> linux 6.1.25 instead of 5.15.
> >>>
> >>> Some kernel config has been updated, there is no CONFIG_DEBUG_INFO, I
> >>> used CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT.
> >>>
> >>> So, currently my local setup kernel config is enabled
> >>> CONFIG_DEBUG_KERNEL CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT and
> >>> CONFIG_DEBUG_INFO_BTF, in order to make a easy test, I enabled
> >>> elfutils-native and pahole-native as DEPEND directly in linux-yocto.i=
n,
> >>> and remove the PAHOLE=3Dfalse in EXTRA_OEMAKE.
> >>>
> >>> my oe-core rev: 35e5d29a7d654fc79bdb898d0f1fb277270dbfd5
> >>>
> >>> my meta-oe rev:b7aa66d734b911737b61610c1c47778e14b15c55
> >>>
> >>>
> >>> When I ran bitbake linux-yocto -v -D, I have met the same issue,
> >>>
> >>> | Unsupported DW_TAG_unspecified_type(0x3b)
> >>> | Encountered error while encoding BTF.
> >>>
> >>> It's bit strange that the I removed my local OS(ubuntu)'s pahole and
> >>> the
> >>> code can be compiled without error:
> >>>
> >>>
> >>>     CC      init/version-timestamp.o
> >>>     LD      .tmp_vmlinux.btf
> >>>     BTF     .btf.vmlinux.bin.o
> >>>     LD      .tmp_vmlinux.kallsyms1
> >>>     NM      .tmp_vmlinux.kallsyms1.syms
> >>>     KSYMS   .tmp_vmlinux.kallsyms1.S
> >>>     AS      .tmp_vmlinux.kallsyms1.S
> >>>     LD      .tmp_vmlinux.kallsyms2
> >>>     NM      .tmp_vmlinux.kallsyms2.syms
> >>>     KSYMS   .tmp_vmlinux.kallsyms2.S
> >>>     AS      .tmp_vmlinux.kallsyms2.S
> >>>     LD      vmlinux
> >>>     BTFIDS  vmlinux
> >>>     NM      System.map
> >>>     SORTTAB vmlinux
> >>>
> >> Indeed!
> >>
> >> What's the toolchain version on your ubuntu install ?
> >
> > My local ubuntu's default pahole version is 1.22,seems some data
> > structure not line up with new kernel, the yocto pahole package is
> > 1.24 is working well.
> >
> > $ pahole --version
> > v1.22
> >
> >
> >> It is likely
> >> either our toolchain version or configuration in combination with the
> >> kernel version that is adding the section that pahole can't
> >> understand/decode.
> > Yes, perhaps this is a limitation, we have to use PAHOLE in
> > EXTRA_OEMAKE to tell the make using pahole from the yocto native-sdk
> > instead of local host OS's /usr/bin/pahole when building the kernel.
> >> If you want to work with my patches, you can find my branch here:
> >>
> >> https://git.yoctoproject.org/poky-contrib/log/?h=3Dzedd/kernel
> >>
> >> (you also need the linux-yocto bumps on that branch as they'll contain
> >> the kernel-cache SRCREV bumps to pick up the fragments for BTF, etc).
> >
> > Thanks, I will sync the branch today and feedback later :)
> >
> Hi Bruce,
>
>
> I used the zedd/kernel branch build a qmemux86-64 kernel image,
> everything goes well.
>
> Shall we set the PAHOLE to native-sdk in EXTRA_OEMAKE to make sure
> kernel make use pahole from yocto not from host pc?

We shouldn't have to explicitly pass pahole like that, as our SDK and
native-sysroot paths
should be found first.

But if you were able to have it succeed and mine didn't ... that could
be the issue.

Thanks for the suggestion, I'll test it today and if so, I'll update
the patch accordingly
and add your sign-off.

Bruce

>
> I tried to attached a patch as below, it has been tested on my local
> setup, from log we can see the PAHOLE point to native-sdk:
>
> -O2 -pipe
> PAHOLE=3D/local/upstream/poky-contrib/build/tmp/work/qemux86_64-poky-linu=
x/linux-yocto/6.1.28+gitAUTOINC+76f7fbdf33_c5c0c7ccfe-r0/recipe-sysroot-nat=
ive/usr/bin/pahole
> -j 20 bzImage
>
> and the image build without error:
>
>    LD      .tmp_vmlinux.btf
>    BTF     .btf.vmlinux.bin.o
>    LD      .tmp_vmlinux.kallsyms1
>    NM      .tmp_vmlinux.kallsyms1.syms
>    KSYMS   .tmp_vmlinux.kallsyms1.S
>    AS      .tmp_vmlinux.kallsyms1.S
>    LD      .tmp_vmlinux.kallsyms2
>    NM      .tmp_vmlinux.kallsyms2.syms
>    KSYMS   .tmp_vmlinux.kallsyms2.S
>    AS      .tmp_vmlinux.kallsyms2.S
>    LD      vmlinux
>    BTFIDS  vmlinux
>    NM      System.map
>
>
>  From da4cbdb517f28f1b4254376c4f1d091a5ebca76c Mon Sep 17 00:00:00 2001
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> Date: Wed, 17 May 2023 13:15:17 +0800
> Subject: [PATCH] set the PAHOLE to native-sdk when KERNEL_DEBUG =3D True
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> b/meta/recipes-kernel/linux/linux-yocto.inc
> index 04a8105e17..90be616363 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -66,7 +66,7 @@ DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86",
> "arm64" ], "elfutils-nativ
>   DEPENDS +=3D "openssl-native util-linux-native"
>   DEPENDS +=3D "gmp-native libmpc-native"
>   DEPENDS +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True",
> "pahole-native", "", d)}'
> -EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True", "",
> "PAHOLE=3Dfalse", d)}'
> +EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True",
> "PAHOLE=3D${STAGING_DIR_NATIVE}/usr/bin/pahole", "PAHOLE=3Dfalse", d)}'
>
>   do_devshell:prepend() {
>       # setup native pkg-config variables (kconfig scripts call
> pkg-config directly, cannot generically be overriden to pkg-config-native=
)
> --
> 2.34.1
>
>
> Br,
>
> Xiangyu
>
> >
> > Br,
> >
> > Xiangyu
> >
> >> Bruce
> >>
> >>>
> >>>> You can find a link to the lkml thread from the debian bug:
> >>>> https://www.mail-archive.com/debian-bugs-dist@lists.debian.org/msg18=
73553.html
> >>>>
> >>>> I'll clean up my patch, since this isn't something I can fix
> >>>> immediately.
> >>>>
> >>>> If you do track down patches in the latest kernel that haven't been
> >>>> sent to -stable, we can backport them to fix the linux-yocto builds
> >>>> with pahole.
> >>>>
> >>>> Bruce
> >>>>
> >>> Br,
> >>>
> >>> Xiangyu
> >>>
> >>>>> Bruce
> >>>>>
> >>>>>> I should check with you first to get the details on how you were
> >>>>>> testing pahole
> >>>>>> functionality.
> >>>>>>
> >>>>>> Bruce
> >>>>>>
> >>>>>>
> >>>>>> Br,
> >>>>>>
> >>>>>> Xiangyu
> >>>>>>
> >>>>>> Bruce
> >>>>>>
> >>>>>>
> >>>>>> Xiangyu
> >>>>>>
> >>>>>> Bruce
> >>>>>>
> >>>>>> Cheers,
> >>>>>>
> >>>>>> Richard
> >>>>>>
> >>>>>> --
> >>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness
> >>>>>> await
> >>>>>> thee at its end
> >>>>>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>>>>
> >>>>>> --
> >>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness
> >>>>>> await
> >>>>>> thee at its end
> >>>>>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> --
> >>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness
> >>>>>> await
> >>>>>> thee at its end
> >>>>>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>>>
> >>>>> --
> >>>>> - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
> >>>>> thee at its end
> >>>>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>>>
> >>>>>
> >>>>>
> >>>> --
> >>>> - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
> >>>> thee at its end
> >>>> - "Use the force Harry" - Gandalf, Star Trek II
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#181426): https://lists.openembedded.org/g/openembed=
ded-core/message/181426
> > Mute This Topic: https://lists.openembedded.org/mt/98753313/7175143
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
xiangyu.chen@eng.windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

