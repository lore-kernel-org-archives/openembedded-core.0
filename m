Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB2BCC77B7D
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 12:25:16 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.15600.1684412711553906150
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 May 2023 05:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Egpzsgc9;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-33818ccd411so15433055ab.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 05:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684412711; x=1687004711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOPulvyfMfiusNjCFGBcPpG8DvizqCsCmWXyIM0NPa4=;
        b=Egpzsgc9RPCdP+6rvVuUAYfiw/4J83fB2zn+9+2Z9WrU1nMvRHAoOxkRdFD8sNyKAl
         lLKBb8cl18lVqAkOrAj4Sr/Y02uPuT9o9l1yyRP0z7pqQQi1BikbACEZqmxX7qjMZNZC
         8AIagYR/25bTVAnRBgtbJbmnb/S6UYCvKhd5tDnlHsOmdc5H1xTkzUIviZO+8jbYFdFP
         LJdMkGD9a8uk6Dz2uqZqD4ASOlU/EUMIl7aKKQGNGnrNM89YRRWc4CXW3kVffUMGy9Ol
         nklntgcQY9tIJXI2bOafHJDfnb65uOSLv/Yj/be5SqrqKcHO2LBbrKuMMzDi7l3729TI
         8mJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684412711; x=1687004711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOPulvyfMfiusNjCFGBcPpG8DvizqCsCmWXyIM0NPa4=;
        b=kYf71TBkyVpco2z6HiTbucv1c7yIS3S9WzUOg+Jjn4loweWpTYRQ6bCQSiZv4G2vcl
         UjTCpRdVN+2feHIDr8GcpsztlRy10s+sueu/o8DF5V6YdRQyxwRVzX26d7ebF2TIwkgD
         kH+G9Rub0doQgPjBfO1WXj6FGfgxpOKsEGW2TINiEJ41BXiJsKtOI/WkufwQyk8Jxvtd
         HP+82rMot0FTKhUPqn5myYrohiYS0ZwWcOQe8BKYQ9V2rO0lK1/EsByLS7Ne6jRrV8FU
         WenVK0LfywvOA+8P9NfmzzsNXTeiJINj2wsTwzXDOfX52w/7xuX00NRzcgFZH9OiLOkb
         CkQg==
X-Gm-Message-State: AC+VfDzUiIcqCLyOkdIRXXVlYlXWgrOaXjEOZQWa8pdCncOAfeyCTzir
	TPv8W/mWPUT4gNbc2gr4Pwy3ApTJQYqC6sMstjJePzgmPWqwJw==
X-Google-Smtp-Source: ACHHUZ75ALYqTZf02S0DysVKkytmNPP1Td/PU+cn2vULFhKok78wd03v297rarECdPYcJDbohAJf/5EwcFid/qlEAeg=
X-Received: by 2002:a92:d212:0:b0:32a:e399:b984 with SMTP id
 y18-20020a92d212000000b0032ae399b984mr5387454ily.7.1684412710405; Thu, 18 May
 2023 05:25:10 -0700 (PDT)
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
 <175FEE462A2C05DA.26562@lists.openembedded.org> <CADkTA4On1kDngpaGcMSdZN7Djmn5ZQXJFQmYF7oXBDVZ-=_Kgw@mail.gmail.com>
 <d0986c48-c689-83f9-8c78-653110799eaa@windriver.com>
In-Reply-To: <d0986c48-c689-83f9-8c78-653110799eaa@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 18 May 2023 08:25:06 -0400
Message-ID: <CADkTA4MKhaA2M2u_WgYNQsGWOiLFxUkDgWM5kS99Wuqmeu_44Q@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 12:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181521

On Wed, May 17, 2023 at 10:08=E2=80=AFPM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
>
> On 5/17/23 22:35, Bruce Ashfield wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On Wed, May 17, 2023 at 8:32=E2=80=AFAM Bruce Ashfield via
> > lists.openembedded.org
> > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >> On Wed, May 17, 2023 at 1:24=E2=80=AFAM Xiangyu Chen
> >> <xiangyu.chen@eng.windriver.com> wrote:
> >>>
> >>> On 5/17/23 09:35, Xiangyu Chen wrote:
> >>>> On 5/16/23 20:55, Bruce Ashfield wrote:
> >>>>> CAUTION: This email comes from a non Wind River email account!
> >>>>> Do not click links or open attachments unless you recognize the
> >>>>> sender and know the content is safe.
> >>>>>
> >>>>> On Tue, May 16, 2023 at 4:56=E2=80=AFAM Xiangyu Chen
> >>>>> <xiangyu.chen@eng.windriver.com> wrote:
> >>>>>> Hi Bruce,
> >>>>>>
> >>>>>>
> >>>>>> On 5/15/23 21:11, Bruce Ashfield wrote:
> >>>>>>> CAUTION: This email comes from a non Wind River email account!
> >>>>>>> Do not click links or open attachments unless you recognize the
> >>>>>>> sender and know the content is safe.
> >>>>>>>
> >>>>>>> On Mon, May 15, 2023 at 8:34=E2=80=AFAM Bruce Ashfield via
> >>>>>>> lists.openembedded.org
> >>>>>>> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >>>>>>>> On Mon, May 15, 2023 at 6:04=E2=80=AFAM Xiangyu Chen
> >>>>>>>> <xiangyu.chen@eng.windriver.com> wrote:
> >>>>>>>>> Hi Bruce,
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Sorry for being late..
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> On 5/13/23 09:16, Bruce Ashfield wrote:
> >>>>>>>>>
> >>>>>>>>> CAUTION: This email comes from a non Wind River email account!
> >>>>>>>>> Do not click links or open attachments unless you recognize the
> >>>>>>>>> sender and know the content is safe.
> >>>>>>>>>
> >>>>>>>>> On Fri, May 12, 2023 at 10:47=E2=80=AFAM Bruce Ashfield via
> >>>>>>>>> lists.openembedded.org
> >>>>>>>>> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >>>>>>>>>
> >>>>>>>>> On Wed, May 10, 2023 at 10:23=E2=80=AFPM Xiangyu Chen
> >>>>>>>>> <xiangyu.chen@eng.windriver.com> wrote:
> >>>>>>>>>
> >>>>>>>>> Hi Richard and Bruce,
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Thanks for your suggestion,
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> On 5/11/23 00:25, Bruce Ashfield wrote:
> >>>>>>>>>
> >>>>>>>>> CAUTION: This email comes from a non Wind River email account!
> >>>>>>>>> Do not click links or open attachments unless you recognize the
> >>>>>>>>> sender and know the content is safe.
> >>>>>>>>>
> >>>>>>>>> On Wed, May 10, 2023 at 12:16=E2=80=AFPM Richard Purdie
> >>>>>>>>> <richard.purdie@linuxfoundation.org> wrote:
> >>>>>>>>>
> >>>>>>>>> On Mon, 2023-05-08 at 09:33 +0800, Xiangyu Chen wrote:
> >>>>>>>>>
> >>>>>>>>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> >>>>>>>>>
> >>>>>>>>> after enable the kernel CONFIG_DEBUG_INFO_BTF in devshell, the
> >>>>>>>>> make would report some
> >>>>>>>>> errors due to pahole and elfuitls is missing, since this is a
> >>>>>>>>> debug option, so conditionally
> >>>>>>>>> add an option named "btf" in KERNEL_DEBUG_OPTIONS, if someone
> >>>>>>>>> need enable CONFIG_DEBUG_INFO_BTF
> >>>>>>>>> option in devshell, they can add KERNEL_DEBUG_OPTIONS +=3D "btf=
" in
> >>>>>>>>> local.conf to solve the pahole
> >>>>>>>>> and elfutils dependency.
> >>>>>>>>>
> >>>>>>>>> Is this a defined workflow somewhere? Is KERNEL_DEBUG_OPTIONS
> >>>>>>>>> with this
> >>>>>>>>> option documented somewhere?
> >>>>>>>>>
> >>>>>>>>> I also think the mention of devshell in the commit message is
> >>>>>>>>> misleading, this issue happens regardless of how you enable the
> >>>>>>>>> option.
> >>>>>>>>> There are also other ways of enabling this than local.conf, you=
'd
> >>>>>>>>> likely not want people doing that at the end of development.
> >>>>>>>>>
> >>>>>>>>> I'm curious on Bruce's opinion but to me this at the very least
> >>>>>>>>> needs a
> >>>>>>>>> commit message rewrite and I'd question whether the docs elsewh=
ere
> >>>>>>>>> would allow someone to discover this workflow anyway.
> >>>>>>>>>
> >>>>>>>>> I missed this entirely, thanks for replying to it, or I never w=
ould
> >>>>>>>>> have noticed.
> >>>>>>>>>
> >>>>>>>>> This mechanism isn't appropriate for these dependencies. I only
> >>>>>>>>> added
> >>>>>>>>> it to work around pkgconfig issues (which we can more cleanly
> >>>>>>>>> solve in
> >>>>>>>>> newer kernels  (see what I've been doing with make-mod-scripts)
> >>>>>>>>> .. so
> >>>>>>>>> it can eventually be dropped).
> >>>>>>>>>
> >>>>>>>>> We are already enabling elfutils-native conditionally on a
> >>>>>>>>> per-architecture basis (currently only x86-64).
> >>>>>>>>>
> >>>>>>>>> If we need it on more arches now, we should enable it in the ve=
rsion
> >>>>>>>>> specific recipes, or actually, we have moved far enough into ne=
wer
> >>>>>>>>> kernel's that it could be in the .inc now.
> >>>>>>>>>
> >>>>>>>>> This commit's background was some kernel debug options needs
> >>>>>>>>> elfutils
> >>>>>>>>> and pahole native package, since the issue happens on enabling
> >>>>>>>>> kernel
> >>>>>>>>> debug options and not all people needs it, so I conditionally a=
dd
> >>>>>>>>> the
> >>>>>>>>> dependency in KERNEL_DEBUG_OPTION.
> >>>>>>>>>
> >>>>>>>>> If possible we can enable it in .inc because newer kernel tools
> >>>>>>>>> like btf
> >>>>>>>>> are support using pkg-config to locate the libelf instead of
> >>>>>>>>> finding it
> >>>>>>>>> from /usr/ folder, so we can use elfutils-natvie instead of
> >>>>>>>>> installing
> >>>>>>>>> elfutils package on host PC.
> >>>>>>>>>
> >>>>>>>>> Similarly, we should enable the pahole-native dependency on a
> >>>>>>>>> per-arch basis.
> >>>>>>>>>
> >>>>>>>>> As Richard mentioned, what's the reproducer to see the errors ?=
 it
> >>>>>>>>> must be more than devshell.
> >>>>>>>>>
> >>>>>>>>> Yes, this happens on devshell and normal world if some kernel d=
ebug
> >>>>>>>>> options are enabled. We can reproduce this issue with following
> >>>>>>>>> steps(I
> >>>>>>>>> have found the issue with kernel 5.15):
> >>>>>>>>>
> >>>>>>>>> 1. enable kernel option CONFIG_DEBUG_KERNEL CONFIG_DEBUG_INFO a=
nd
> >>>>>>>>> CONFIG_DEBUG_INFO_BTF
> >>>>>>>>>
> >>>>>>>>> 2. build the kernel image, the compiler would report missing
> >>>>>>>>> libelf.h
> >>>>>>>>> and gelf.h which contains in elfutils-native(this step not
> >>>>>>>>> happens on
> >>>>>>>>> x86-64 due to it has been enabled).
> >>>>>>>>>
> >>>>>>>>> 3. enable elfutils-native by manual, the kernel source code can=
 be
> >>>>>>>>> compiled successfully but failed in final step due to missing
> >>>>>>>>> pahole.
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> If you can follow up with the steps to reproduce, I can take on=
 the
> >>>>>>>>> refactoring and broader dependency cleanup question, since I ca=
n
> >>>>>>>>> test
> >>>>>>>>> the wider matrix at the same time.
> >>>>>>>>>
> >>>>>>>>> Thanks, my local setup might missing some corner case, this is
> >>>>>>>>> another
> >>>>>>>>> reason I enable those native packages limit in
> >>>>>>>>> KERNEL_DEBUG_OPTION :).
> >>>>>>>>>
> >>>>>>>>> I've been thinking about this, and I've come to the following
> >>>>>>>>> suggestion:
> >>>>>>>>>
> >>>>>>>>> I plan on moving the elfutils-native to linux-yocto.inc, out of=
 the
> >>>>>>>>> version specific
> >>>>>>>>> recipes.  I'll also drop the architecture specific nature of th=
e
> >>>>>>>>> current DEPENDS.
> >>>>>>>>> The need for this is much more common now, and all of the
> >>>>>>>>> reference kernels
> >>>>>>>>> in master are new enough. The elfutils-native build dependency =
is
> >>>>>>>>> not
> >>>>>>>>> significant
> >>>>>>>>> enough to worry about adding it for all architectures. If it do=
es
> >>>>>>>>> become a problem,
> >>>>>>>>> there are options to make it conditional again.
> >>>>>>>>>
> >>>>>>>>> I can drop the HOST_LIBELF_LIBS work around in the
> >>>>>>>>> linux-yocto.inc, as
> >>>>>>>>> we can now properly detect libelf via pkg-config. I didn't need
> >>>>>>>>> it in any of
> >>>>>>>>> my testing. Again, if this proves to be wrong, I'd enable it in=
 a
> >>>>>>>>> different way now
> >>>>>>>>> (using what I've learned from fixing make-mod-scripts).
> >>>>>>>>>
> >>>>>>>>> As for the pahole-native dependency, there's been a "developer"
> >>>>>>>>> kernel-type
> >>>>>>>>> for quite some time. The design intention behind it was to enab=
le
> >>>>>>>>> options like
> >>>>>>>>> this, and not make the "standard" or "production" kernel's too
> >>>>>>>>> large by default.
> >>>>>>>>> So the dependency could be conditional on that kernel type ...
> >>>>>>>>> but we don't
> >>>>>>>>> want to break other kernels just because they've enabled that
> >>>>>>>>> option. We also
> >>>>>>>>> don't (and won't) get into the game of looking for individual
> >>>>>>>>> options in the
> >>>>>>>>> .config to enable something, since a) it is too late b) it is a
> >>>>>>>>> moving target.
> >>>>>>>>>
> >>>>>>>>> So that leaves the following options: a) enable pahole-native
> >>>>>>>>> unconditionally
> >>>>>>>>> on the arches that support it (x86-64, aarch64) (and also move
> >>>>>>>>> the pahole
> >>>>>>>>> recipe into oe-core) b) make the KERNEL_DEBUG_OPTIONS less spec=
ific,
> >>>>>>>>> and simply call it KERNEL_DEBUG, when enabled, we could
> >>>>>>>>> conditionally
> >>>>>>>>> add pahole-native (I'd also submit documentation for the
> >>>>>>>>> functionality
> >>>>>>>>> c) something I haven't thought about ...
> >>>>>>>>>
> >>>>>>>>> I'm moving on the implementation now, but will adjust course if
> >>>>>>>>> there's something
> >>>>>>>>> I've missed.
> >>>>>>>>>
> >>>>>>>>> I have my implementation done, but I'm wondering what your
> >>>>>>>>> configuration
> >>>>>>>>> was for testing pahole ?
> >>>>>>>>>
> >>>>>>>> My reply will be hard to read, as plain text reply to the html
> >>>>>>>> doesn't
> >>>>>>>> give us proper
> >>>>>>>> context indenting.
> >>>>>>>>
> >>>>>>>>> I have tested on a devshell, with oe-master branch, the kernel
> >>>>>>>>> version using 5.15
> >>>>>>>>>
> >>>>>>>>> 1. enable pahole-native and elfutils-native in linux-yocto.inc =
as
> >>>>>>>>> a dependency.
> >>>>>>>>>
> >>>>>>>>> 2. enable CONFIG_DEBUG_KERNEL  CONFIG_DEBUG_INFO and
> >>>>>>>>> CONFIG_DEBUG_INFO_BTF under menuconfig
> >>>>>>>>>
> >>>>>>>>> 3. using "export PKG_CONFIG_SYSROOT_DIR=3D""" cleanning
> >>>>>>>>> PKG_CONFIG_SYSROOT_DIR
> >>>>>>>>>
> >>>>>>>>> 4, make
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> If the test environment using bitbake, then we need to remove
> >>>>>>>>> PAHOLE=3Dfalse flag in kernel EXTRA_OEMAKE in
> >>>>>>>>> classes-recipe/kernel.bbclass, otherwise, bitbake would report
> >>>>>>>>> missing pahole error.
> >>>>>>>>>
> >>>>>>>> That's the same as my patch series (I've also changed PAHOLE=3Df=
alse to
> >>>>>>>> a conditional in my series).
> >>>>>>>>
> >>>>>>>>> I'm seeing the following in qemux86-64 at the end of the build:
> >>>>>>>>>
> >>>>>>>>> | Unsupported DW_TAG_unspecified_type(0x3b)
> >>>>>>>>> | Encountered error while encoding BTF.
> >>>>>>>>> |   LD      .tmp_vmlinux.kallsyms1
> >>>>>>>>> |   NM      .tmp_vmlinux.kallsyms1.syms
> >>>>>>>>> |   KSYMS   .tmp_vmlinux.kallsyms1.S
> >>>>>>>>> |   AS      .tmp_vmlinux.kallsyms1.S
> >>>>>>>>> |   LD      .tmp_vmlinux.kallsyms2
> >>>>>>>>> |   NM      .tmp_vmlinux.kallsyms2.syms
> >>>>>>>>> |   KSYMS   .tmp_vmlinux.kallsyms2.S
> >>>>>>>>> |   AS      .tmp_vmlinux.kallsyms2.S
> >>>>>>>>> |   LD      vmlinux
> >>>>>>>>> |   BTFIDS  vmlinux
> >>>>>>>>> | FAILED: load BTF from vmlinux: No such file or directory
> >>>>>>>>> | make[1]: ***
> >>>>>>>>> [/opt/poky/build/tmp/work-shared/qemux86-64/kernel-source/scrip=
ts/Makefile.vmlinux:34:
> >>>>>>>>> vmlinux] Error 255
> >>>>>>>>> | make[1]: *** Deleting file 'vmlinux'
> >>>>>>>>> | make: ***
> >>>>>>>>> [/opt/poky/build/tmp/work-shared/qemux86-64/kernel-source/Makef=
ile:1255:
> >>>>>>>>>
> >>>>>>>>> vmlinux] Error 2
> >>>>>>>>>
> >>>>>>>>> I haven't looked into it at all yet (but will do so over the
> >>>>>>>>> weekend)
> >>>>>>>>> .. but I thought
> >>>>>>>>>
> >>>>>>>>> I haven't seen this problem yet(i'll pull the latest oe-core an=
d
> >>>>>>>>> meta-oe code and try again), if possible, could you share a pat=
ch
> >>>>>>>>> with me so that we can test it together? thanks.
> >>>>>>>>>
> >>>>>>>> I'm on oe-core master, with qemux86-64.
> >>>>>>>>
> >>>>>>>> I'll do a bit more work on the patch today, and can share it if =
I
> >>>>>>>> can't figure out where that unsupported tag is coming from.
> >>>>>>> It seems like it is a known issue, I found both a lkml thread and
> >>>>>>> debian bug from October 2022.
> >>>>>>>
> >>>>>>> Your 5.15 kernel wouldn't show the issue.
> >>>>>> Yes, this should not happens on 5.15 kernel.
> >>>>>>
> >>>>>>
> >>>>>> Today I synced the oe-core/poky to latest master version, removed =
the
> >>>>>> build dir and run oe-init-build-env again and switched to use defa=
ult
> >>>>>> linux 6.1.25 instead of 5.15.
> >>>>>>
> >>>>>> Some kernel config has been updated, there is no CONFIG_DEBUG_INFO=
, I
> >>>>>> used CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT.
> >>>>>>
> >>>>>> So, currently my local setup kernel config is enabled
> >>>>>> CONFIG_DEBUG_KERNEL CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT and
> >>>>>> CONFIG_DEBUG_INFO_BTF, in order to make a easy test, I enabled
> >>>>>> elfutils-native and pahole-native as DEPEND directly in linux-yoct=
o.in,
> >>>>>> and remove the PAHOLE=3Dfalse in EXTRA_OEMAKE.
> >>>>>>
> >>>>>> my oe-core rev: 35e5d29a7d654fc79bdb898d0f1fb277270dbfd5
> >>>>>>
> >>>>>> my meta-oe rev:b7aa66d734b911737b61610c1c47778e14b15c55
> >>>>>>
> >>>>>>
> >>>>>> When I ran bitbake linux-yocto -v -D, I have met the same issue,
> >>>>>>
> >>>>>> | Unsupported DW_TAG_unspecified_type(0x3b)
> >>>>>> | Encountered error while encoding BTF.
> >>>>>>
> >>>>>> It's bit strange that the I removed my local OS(ubuntu)'s pahole a=
nd
> >>>>>> the
> >>>>>> code can be compiled without error:
> >>>>>>
> >>>>>>
> >>>>>>      CC      init/version-timestamp.o
> >>>>>>      LD      .tmp_vmlinux.btf
> >>>>>>      BTF     .btf.vmlinux.bin.o
> >>>>>>      LD      .tmp_vmlinux.kallsyms1
> >>>>>>      NM      .tmp_vmlinux.kallsyms1.syms
> >>>>>>      KSYMS   .tmp_vmlinux.kallsyms1.S
> >>>>>>      AS      .tmp_vmlinux.kallsyms1.S
> >>>>>>      LD      .tmp_vmlinux.kallsyms2
> >>>>>>      NM      .tmp_vmlinux.kallsyms2.syms
> >>>>>>      KSYMS   .tmp_vmlinux.kallsyms2.S
> >>>>>>      AS      .tmp_vmlinux.kallsyms2.S
> >>>>>>      LD      vmlinux
> >>>>>>      BTFIDS  vmlinux
> >>>>>>      NM      System.map
> >>>>>>      SORTTAB vmlinux
> >>>>>>
> >>>>> Indeed!
> >>>>>
> >>>>> What's the toolchain version on your ubuntu install ?
> >>>> My local ubuntu's default pahole version is 1.22,seems some data
> >>>> structure not line up with new kernel, the yocto pahole package is
> >>>> 1.24 is working well.
> >>>>
> >>>> $ pahole --version
> >>>> v1.22
> >>>>
> >>>>
> >>>>> It is likely
> >>>>> either our toolchain version or configuration in combination with t=
he
> >>>>> kernel version that is adding the section that pahole can't
> >>>>> understand/decode.
> >>>> Yes, perhaps this is a limitation, we have to use PAHOLE in
> >>>> EXTRA_OEMAKE to tell the make using pahole from the yocto native-sdk
> >>>> instead of local host OS's /usr/bin/pahole when building the kernel.
> >>>>> If you want to work with my patches, you can find my branch here:
> >>>>>
> >>>>> https://git.yoctoproject.org/poky-contrib/log/?h=3Dzedd/kernel
> >>>>>
> >>>>> (you also need the linux-yocto bumps on that branch as they'll cont=
ain
> >>>>> the kernel-cache SRCREV bumps to pick up the fragments for BTF, etc=
).
> >>>> Thanks, I will sync the branch today and feedback later :)
> >>>>
> >>> Hi Bruce,
> >>>
> >>>
> >>> I used the zedd/kernel branch build a qmemux86-64 kernel image,
> >>> everything goes well.
> >>>
> >>> Shall we set the PAHOLE to native-sdk in EXTRA_OEMAKE to make sure
> >>> kernel make use pahole from yocto not from host pc?
> >> We shouldn't have to explicitly pass pahole like that, as our SDK and
> >> native-sysroot paths
> >> should be found first.
> >>
> >> But if you were able to have it succeed and mine didn't ... that could
> >> be the issue.
> >>
> >> Thanks for the suggestion, I'll test it today and if so, I'll update
> >> the patch accordingly
> >> and add your sign-off.
> > I instrumented the scripts to echo the pahole binary being used, and
> > as expected, the build environment is setup to prefer our sysroot
> > binaries (without that setup, we'd have all sorts of host
> > contamination).
> >
> > |   GEN     Makefile
> > |   DESCEND objtool
> > |   DESCEND bpf/resolve_btfids
> > |   CALL    /opt/poky/build/tmp/work-shared/qemux86-64/kernel-source/sc=
ripts/checksyscalls.sh
> > | /opt/poky/build/tmp/work/qemux86_64-poky-linux/linux-yocto/6.1.28+git=
AUTOINC+a18c55d2fc_c5c0c7ccfe-r0/recipe-sysroot-native/usr/bin/pahole
> > |   LD      .tmp_vmlinux.btf
> > |   BTF     .btf.vmlinux.bin.o
> > | Unsupported DW_TAG_unspecified_type(0x3b)
> > | Encountered error while encoding BTF.
> > | /opt/poky/build/tmp/work/qemux86_64-poky-linux/linux-yocto/6.1.28+git=
AUTOINC+a18c55d2fc_c5c0c7ccfe-r0/recipe-sysroot-native/usr/bin/pahole
> > |   LD      .tmp_vmlinux.kallsyms1
> > |   NM      .tmp_vmlinux.kallsyms1.syms
> > |   KSYMS   .tmp_vmlinux.kallsyms1.S
> > |   AS      .tmp_vmlinux.kallsyms1.S
> > | /opt/poky/build/tmp/work/qemux86_64-poky-linux/linux-yocto/6.1.28+git=
AUTOINC+a18c55d2fc_c5c0c7ccfe-r0/recipe-sysroot-native/usr/bin/pahole
> > |   LD      .tmp_vmlinux.kallsyms2
> > |   NM      .tmp_vmlinux.kallsyms2.syms
> > |   KSYMS   .tmp_vmlinux.kallsyms2.S
> > |   AS      .tmp_vmlinux.kallsyms2.S
> > | /opt/poky/build/tmp/work/qemux86_64-poky-linux/linux-yocto/6.1.28+git=
AUTOINC+a18c55d2fc_c5c0c7ccfe-r0/recipe-sysroot-native/usr/bin/pahole
> > |   LD      vmlinux
> > |   BTFIDS  vmlinux
> > | FAILED: load BTF from vmlinux: No such file or directory
> >
> > But as you can see, I still get the DW_TAG issues.
> >
> > My fragments are setting CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT,
> > and the required debug
> > options.  Those are enabled by the following in local.conf:
> >
> > KERNEL_FEATURES:append =3D "ktypes/developer/developer.cfg
> > features/debug/debug-stack.scc features/debug/debug-btf.scc"
> >
> > Can you confirm that your success run used both the yocto/bitbake
> > build and my fragments for configuration ?
> >
> > There must still be something different that I'm missing.
>
> Hi Bruce,
>
>
> I have verified add "KERNEL_FEATURES:append =3D
> "ktypes/developer/developer.cfg features/debug/debug-stack.scc
> features/debug/debug-btf.scc" "
>
> in local.conf today, I cleaned the source with bitbake linux-yocto -c
> cleanall and rebuilt, the result the same as before, BTF information was
> generated
>
> without any error, in order to add more information, I uploaded the full
> log as following link:
>
> https://raw.githubusercontent.com/chenxy1988/sync/main/oe-core-181487/1/l=
inux-yocto-build.log
>
>
> and my host pc os information:
>
> PRETTY_NAME=3D"Ubuntu 22.04.2 LTS"
> NAME=3D"Ubuntu"
> VERSION_ID=3D"22.04"
> VERSION=3D"22.04.2 LTS (Jammy Jellyfish)"
> VERSION_CODENAME=3Djammy
> ID=3Dubuntu
> ID_LIKE=3Ddebian
> HOME_URL=3D"https://www.ubuntu.com/"
> SUPPORT_URL=3D"https://help.ubuntu.com/"
> BUG_REPORT_URL=3D"https://bugs.launchpad.net/ubuntu/"
> PRIVACY_POLICY_URL=3D"https://www.ubuntu.com/legal/terms-and-policies/pri=
vacy-policy"
> UBUNTU_CODENAME=3Djammy
>
>
> If possible, could you share the local.conf with me so that I can test
> in my setup? And, there is another clue,
>
> i am not sure this is a right way to locate the root cause, since this
> issue happens on pahole, can we exchange the
>
> pahole native binary which was generated by yocto to replace
> linux-yocto/6.1.28+gitAUTOINC+76f7fbdf33_c5c0c7ccfe-r0/recipe-sysroot-nat=
ive/usr/bin/pahole
>
>
> if something wrong with pahole-native, my setup should also report the
> DW_TAG_unspecified_type issue.
>
>
> The following link is the pahole native binary that was generated by
> yocto in my local environment:
>
> https://github.com/chenxy1988/sync/blob/main/oe-core-181487/1/pahole-nati=
ve-yocto.tar.gz
>

I have it working on my builder.

I didn't realize, but I was on one of my machines with an older
meta-openembedded, so my
pahole native binary was just a bit too old!

Which is a reason to consider moving pahole to oe-core.

For now, I'll leave pahole where it is, and complete testing.

I'm away all of next week, so I won't submit my queue for merging
until I return. But I
will keep my zedd/kernel contrib branch up to date with the latest set
of patches.

Bruce

>
>
> Br,
>
> Xiangyu
>
>
> >
> > Bruce
> >
> >> Bruce
> >>
> >>> I tried to attached a patch as below, it has been tested on my local
> >>> setup, from log we can see the PAHOLE point to native-sdk:
> >>>
> >>> -O2 -pipe
> >>> PAHOLE=3D/local/upstream/poky-contrib/build/tmp/work/qemux86_64-poky-=
linux/linux-yocto/6.1.28+gitAUTOINC+76f7fbdf33_c5c0c7ccfe-r0/recipe-sysroot=
-native/usr/bin/pahole
> >>> -j 20 bzImage
> >>>
> >>> and the image build without error:
> >>>
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
> >>>
> >>>
> >>>   From da4cbdb517f28f1b4254376c4f1d091a5ebca76c Mon Sep 17 00:00:00 2=
001
> >>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> >>> Date: Wed, 17 May 2023 13:15:17 +0800
> >>> Subject: [PATCH] set the PAHOLE to native-sdk when KERNEL_DEBUG =3D T=
rue
> >>>
> >>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> >>> ---
> >>>    meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> >>> b/meta/recipes-kernel/linux/linux-yocto.inc
> >>> index 04a8105e17..90be616363 100644
> >>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> >>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> >>> @@ -66,7 +66,7 @@ DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x=
86",
> >>> "arm64" ], "elfutils-nativ
> >>>    DEPENDS +=3D "openssl-native util-linux-native"
> >>>    DEPENDS +=3D "gmp-native libmpc-native"
> >>>    DEPENDS +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True",
> >>> "pahole-native", "", d)}'
> >>> -EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True", "",
> >>> "PAHOLE=3Dfalse", d)}'
> >>> +EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True",
> >>> "PAHOLE=3D${STAGING_DIR_NATIVE}/usr/bin/pahole", "PAHOLE=3Dfalse", d)=
}'
> >>>
> >>>    do_devshell:prepend() {
> >>>        # setup native pkg-config variables (kconfig scripts call
> >>> pkg-config directly, cannot generically be overriden to pkg-config-na=
tive)
> >>> --
> >>> 2.34.1
> >>>
> >>>
> >>> Br,
> >>>
> >>> Xiangyu
> >>>
> >>>> Br,
> >>>>
> >>>> Xiangyu
> >>>>
> >>>>> Bruce
> >>>>>
> >>>>>>> You can find a link to the lkml thread from the debian bug:
> >>>>>>> https://www.mail-archive.com/debian-bugs-dist@lists.debian.org/ms=
g1873553.html
> >>>>>>>
> >>>>>>> I'll clean up my patch, since this isn't something I can fix
> >>>>>>> immediately.
> >>>>>>>
> >>>>>>> If you do track down patches in the latest kernel that haven't be=
en
> >>>>>>> sent to -stable, we can backport them to fix the linux-yocto buil=
ds
> >>>>>>> with pahole.
> >>>>>>>
> >>>>>>> Bruce
> >>>>>>>
> >>>>>> Br,
> >>>>>>
> >>>>>> Xiangyu
> >>>>>>
> >>>>>>>> Bruce
> >>>>>>>>
> >>>>>>>>> I should check with you first to get the details on how you wer=
e
> >>>>>>>>> testing pahole
> >>>>>>>>> functionality.
> >>>>>>>>>
> >>>>>>>>> Bruce
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Br,
> >>>>>>>>>
> >>>>>>>>> Xiangyu
> >>>>>>>>>
> >>>>>>>>> Bruce
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Xiangyu
> >>>>>>>>>
> >>>>>>>>> Bruce
> >>>>>>>>>
> >>>>>>>>> Cheers,
> >>>>>>>>>
> >>>>>>>>> Richard
> >>>>>>>>>
> >>>>>>>>> --
> >>>>>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness
> >>>>>>>>> await
> >>>>>>>>> thee at its end
> >>>>>>>>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>>>>>>>
> >>>>>>>>> --
> >>>>>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness
> >>>>>>>>> await
> >>>>>>>>> thee at its end
> >>>>>>>>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> --
> >>>>>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness
> >>>>>>>>> await
> >>>>>>>>> thee at its end
> >>>>>>>>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>>>>>> --
> >>>>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness =
await
> >>>>>>>> thee at its end
> >>>>>>>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>> --
> >>>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness a=
wait
> >>>>>>> thee at its end
> >>>>>>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>>>
> >>>>> --
> >>>>> - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
> >>>>> thee at its end
> >>>>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>>
> >>>>
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#181487): https://lists.openembedded.org/g/openembe=
dded-core/message/181487
> >> Mute This Topic: https://lists.openembedded.org/mt/98753313/1050810
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[bruce.ashfield@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

