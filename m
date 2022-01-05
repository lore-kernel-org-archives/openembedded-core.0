Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89753C433EF
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 16:14:49 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.2566.1641399288264096831
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 08:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mLo8j40g;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id w16so164200778edc.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 08:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EPXbwv5ydbussQMSX7ybf4L8WzHQ0EQlg8CszAkflZs=;
        b=mLo8j40gPPCGtAW759zXGAWd+EgUd17mct48PcDuqsagPJuE9eQq5WM8puIVOmt08X
         5nosP6RKk8tJclG+YZkrChyDXd97fqMJKb6rxC50ynkTQvv6SrrfDTt4CSCEPrQTr3c3
         1IcXYT2INDbVZh8T98LCITjR5+FOm3pKMyx1vMTeOhHqet4G5bCd0UJvI04I5a6XNtcT
         ilpLyzK8Tvafymm/Srojm+zpVM72F9Qf3r8SEUBWmsKf2dWpX1+EOLv1UlohNtxQZxhJ
         dtzeiR8h2XEhUIRVrCcMCNHIHiJSqAmDnkmhhTWegJI0l1uUlrHPUeBpqRnx78NZIKRO
         sBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EPXbwv5ydbussQMSX7ybf4L8WzHQ0EQlg8CszAkflZs=;
        b=PXu++Zgo2zehXmM7UhiIhfCCrMJ5621mJ8j9tI3SYL1J61AjDuGzgNX3tdmQiIlFED
         mygqvraFmMAsMMTXEf4zAaS84dIcUQzAh5IhR1hzRfI+ap27ZW78aZDoRdheVzeWMwSp
         td4ZU84PS/RdWPvPQhwS1odR2Xb6yc5IuONZTUZRaCfp8PDDC+5zz9ZgD4HROSQmCrUL
         uaYH85R/ojYs3fBleIaOJVYizscaw8evkIrHdMY0aN7WWZ6NgqIBWvwkhc96eSwqGsGD
         zh8lv8OUDuoCbnODzL6N9llTG+Ujcml1p6FTWmuMu4ZarALs+teBrJtf3l8IQFZ5ijr4
         uQ8A==
X-Gm-Message-State: AOAM5319OBkfTg8oD92c9IziXlUtGgx5K5WXgTMTqtoF0sRhfCaip3nA
	Uxna3UuLEKCqNLVp7bFKd3vom39auKwcMyBoE+k=
X-Google-Smtp-Source: 
 ABdhPJwe+mBVJeVP71Y/UhEK4/MQbORMlyXfDUYou0u/fHxRTBn0M3REYePGXsaqoXvSPwubnPnCckap2SF4PonbDfk=
X-Received: by 2002:a17:906:5048:: with SMTP id
 e8mr16663345ejk.651.1641399286390;
 Wed, 05 Jan 2022 08:14:46 -0800 (PST)
MIME-Version: 1.0
References: <20211221190809.89882-1-saul.wold@windriver.com>
 <20211221190809.89882-3-saul.wold@windriver.com>
 <0137a7550504afc03ed41d8bc7e7fe26e7dba9d5.camel@linuxfoundation.org>
 <b90b0597-15e4-f19d-2431-9afe77d6c33c@windriver.com>
In-Reply-To: <b90b0597-15e4-f19d-2431-9afe77d6c33c@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 5 Jan 2022 11:14:35 -0500
Message-ID: 
 <CADkTA4OJb5hgHNTiQ0udeH2Q34ME+rhH=PtBxfoxNQQFfCkRdg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] package.bbclass: don't skip kernel and
 kernel modules
To: Saul Wold <Saul.Wold@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Joshua Watt <JPEWhacker@gmail.com>,
 Bruce Ashfield <bruce.ashfield@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 16:14:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160210

On Tue, Jan 4, 2022 at 5:08 PM Saul Wold <Saul.Wold@windriver.com> wrote:
>
>
>
> On 12/22/21 01:09, Richard Purdie wrote:
> > On Tue, 2021-12-21 at 11:08 -0800, Saul Wold wrote:
> >> Stop ignoring or skipping the kernel and kernel modules code in the
> >> split debug and striping functions, this will allow create_spdx to
> >> process the kernel and modules.
> >>
> >> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> >> ---
> >>   meta/classes/package.bbclass | 8 ++------
> >>   1 file changed, 2 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> >> index 84eafbd529..4b7fe4f1e1 100644
> >> --- a/meta/classes/package.bbclass
> >> +++ b/meta/classes/package.bbclass
> >> @@ -390,10 +390,6 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
> >>       dvar = d.getVar('PKGD')
> >>       objcopy = d.getVar("OBJCOPY")
> >>
> >> -    # We ignore kernel modules, we don't generate debug info files.
> >> -    if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
> >> -        return (file, sources)
> >> -
> >>       newmode = None
> >>       if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
> >>           origmode = os.stat(file)[stat.ST_MODE]
> >> @@ -1147,7 +1143,7 @@ python split_and_strip_files () {
> >>
> >>                   if file.endswith(".ko") and file.find("/lib/modules/") != -1:
> >>                       kernmods.append(file)
> >> -                    continue
> >> +
> >>                   if oe.package.is_static_lib(file):
> >>                       staticlibs.append(file)
> >>                       continue
> >> @@ -1165,7 +1161,7 @@ python split_and_strip_files () {
> >>                       continue
> >>                   # Check its an executable
> >>                   if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
> >> -                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)):
> >> +                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)) or (f.startswith('vmlinux') or ".ko" in f):
> >>
> >>                       if cpath.islink(file):
> >>                           checkelflinks[file] = ltarget
> >
> > edgerouter:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/4513
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/2507/steps/11/logs/stdio
> >
> So I have been digging into this and it seems that an option was added a
> decade ago or so to strip the kernel/vmlinux when it's too big, this was
> done for at least the routerstationpro according to bug #3515 [0], and
> persists with the edgerouter, although I am not sure if it would still
> actually be required as the edgerouter also uses the
> KERNEL_ALT_IMAGETYPE to create a smaller binary kernel image.

I recall when we added that! It was used for some other boards as
well, but most of them aren't around anymore.

>
> The change I proposed causes the all kernels to be stripped all the time
> as part of the split_and_strip_files(). As I see it there few different
> options:

Having some way to have a custom set of sections to strip (along with
skipping stripping (but that can be done via the standard inhibit)) is
something I'd suggest we preserve. But I suppose if you inhibit stripping,
you'll stop both the packaging one and the kernel custom one ?

>
> 1) Set KERNEL_IMAGE_EXTRA_STRIP_SECTIONS = "" in create_spdx.bbclass
>    - This solves the problem with create_spdx.bbclass is in use, but not
> the general case

What are you considering the general case in this instance ? Meaning a
non-spdx user of that same board, will run into issues with the already
stripped ? If they can inhibit the do_package stripping, there is a way around
it.

>
> 2) Remove the KERNEL_IMAGE_EXTRA_STRIP_SECTIONS from edgerouter.conf
>    - Will solve the edgerouter case but may not solve other usages
> unknown to me.
>    - Does anyone know of other machines/layers usage of this variable?
>

See above. There are some machines, and even if not common, it is
something I'd like to preserve.

> 3) deprecate the kernel.bbclass:do_strip function in favor of using the
> split_and_strip_files() of package.bbclass
>

I'd prefer to not do #3.

> 4) Change error to warning in packaging.bbclass for the kernel only
>    - This would explain that a kernel image (vmlinux) is already
> stripped and extended package data would not be available for for SPDX
> creation.

#4 is what came to mind for me. We already have special cases for the
kernel, so this isn't making things more complex .. or maybe there's a
more elegant "co-operative" section removal flag that the kernel bbclass
can set, and then the packaging not error or automatically inhibit the
QA check ?

But #1 is my second choice.

Bruce

>
> RP, Bruce, Joshua: Thoughts?
>
> Sau!
>
> [0] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3515
>
>
> > qemux86 musl cryptodev:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/4512/steps/11/logs/stdio
> >
> > qemux86-64 musl cryptodev:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/4526
> >
> > qemux86 cryptodev:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/4476/steps/11/logs/stdio
> >
> I tried these and have not been able to reproduce the failure.
>
>
>
> > selftest failure in linux-yocto:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/2981/steps/14/logs/stdio
> > (file truncated makes it sound like a race?)
> >
> > stap kernel module failure:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/3395/steps/13/logs/stdio
> > (race/intermittent?)
> >
> > another kernel module race:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4480/steps/16/logs/stdio
> >
> Might need to try this on the AB once I resolve the kernel stripping
> issue above.
>
> Sau!
>
> > Cheers,
> >
> > Richard
> >
> >
> >
>
> --
> Sau!
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160172): https://lists.openembedded.org/g/openembedded-core/message/160172
> Mute This Topic: https://lists.openembedded.org/mt/87884056/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

