Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9828C433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 14:07:38 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web09.6935.1651673249879222413
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 07:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=YBQHWG2m;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.180,
 mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f180.google.com with SMTP id w187so2572987ybe.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 07:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+JPRlxgkDml+fR5URhLJrovrJhcMgojYsdhTvHI5LL0=;
        b=YBQHWG2mcg4QDf0E4Luf1fnHzPVptAXQHuCz7nMgDuA2y6fnRMea9NvuzE2OqEzeTY
         3EF4iQ0ycFpx3/Z95Vlx4G2AyvFYmnuons61yU+2R6BHjl6RwKu7jbP1eSOKthhZCD5p
         dntwkgWJCqrTYpj+1J/3yA9Hz8Q9HOfLK2lR3iXoOUlfh7UdXtq7ZheyOvpc3zkgc5D8
         54YigBFazSknl559B37BEXCAO+fXGFHMoBPqHm9uGg37ljbL3Od5sV+r5J+t3c0f++u2
         gXGazQi7jXZR660AncE7J9ynNirhhpbJFqrmzEQhErQu4JAZhslNl2fNdQYNr/kusnZM
         AWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+JPRlxgkDml+fR5URhLJrovrJhcMgojYsdhTvHI5LL0=;
        b=7CajjO/TOoORO5qwdvoRe/a+46hj8LprRAExIp/iMbKU8KBnCe3nl5G+bfyVu9il1a
         N3uAkPmoJ0aFuTsIo/wmCJ24YyofOVkpjQPPYuz4BqVL76t+i8MkUossldanDnNJxClm
         maMzFxSDRwHaJeg6YEkoO9jxqAs3yNVWDfIi7bV19xP/q70LBwTZqh3D73GlCVNXVqGI
         Vis6R03xb9vJvtFBVnaF8xRTjFIe8ES8/slu1eWn8ocPrZfaf0cWNx6XqRuyzRc/8JjW
         W9CE1O7oahJ3+wR7JSZsgdBKMuV59b0INY2SVBaRae36xs1QcHfRcjFYMOI4082Ey+vt
         AFDg==
X-Gm-Message-State: AOAM531kiHIhygF3oskCP0uYM1sWARpeaHsWz1yE2fBK62VMJQ2fIvde
	MHcc45otm7+px97/5FDumo8Y4/qXqUDN2XZYbVCuqQ==
X-Google-Smtp-Source: 
 ABdhPJxicqlvREBUSSpLl8vbuf5Wq/JQSMLbDXFqrOUMkYGgNReg1+s7rGbfMriYvI/I0YzXMBIg/gUMsZtBCEC6EWA=
X-Received: by 2002:a25:2d68:0:b0:649:6cb:c141 with SMTP id
 s40-20020a252d68000000b0064906cbc141mr17444373ybe.173.1651673249040; Wed, 04
 May 2022 07:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651153370.git.bruce.ashfield@gmail.com>
 <821e6cab4677b71af00197cf2be80680d57aa4ea.camel@linuxfoundation.org>
 <16EA5E7263695663.11702@lists.openembedded.org>
 <16EA76835C38B7CA.4798@lists.openembedded.org>
 <16EA920E59E6B6F1.28542@lists.openembedded.org>
 <CADkTA4M6NzCMVtEhiu+Hyaqp4gMZViP1XRH1qP1t2Ds3S6TL1w@mail.gmail.com>
 <f52bff6a24a5c2a015ed595ab09da89b2e249e75.camel@linuxfoundation.org>
 <CAP71WjzwwV00BAeG6BtVD49fVrCe8rKvToEsKMi0hahxER4PVA@mail.gmail.com>
 <CADkTA4MaYGsgaK-hY15yU2V+BTHL7mr=QRWM0z2v3qt-_FvCUQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MaYGsgaK-hY15yU2V+BTHL7mr=QRWM0z2v3qt-_FvCUQ@mail.gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Wed, 4 May 2022 10:07:18 -0400
Message-ID: 
 <CAPoiz9xQn3zx3RDsqYNL=8zP3yA8rUBCSe-y8rLM5i98pDADQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/15] kernel-yocto: consolidated pull request
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 May 2022 14:07:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165219

On Wed, May 4, 2022 at 8:45 AM Bruce Ashfield <bruce.ashfield@gmail.com> wr=
ote:
>
> On Wed, May 4, 2022 at 3:18 AM Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
> >
> > hey Bruce,
> >
> > On Sun, May 1, 2022 at 6:59 AM Richard Purdie <richard.purdie@linuxfoun=
dation.org> wrote:
> >>
> >> On Sat, 2022-04-30 at 17:35 -0400, Bruce Ashfield wrote:
> >> > On Sat, Apr 30, 2022 at 12:26 AM Bruce Ashfield via
> >> > lists.openembedded.org
> >> > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >> > >
> >> > > On Fri, Apr 29, 2022 at 4:02 PM Bruce Ashfield via
> >> > > lists.openembedded.org
> >> > > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >> > > >
> >> > > > On Fri, Apr 29, 2022 at 8:41 AM Bruce Ashfield via
> >> > > > lists.openembedded.org
> >> > > > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >> > > > >
> >> > > > >
> >> > > > > I'll see about running the strace locally today. Hopefully it =
pops up
> >> > > > > here so I can debug.
> >> > > >
> >> > > > FYI: I have the landlock test case passing here, there's just an
> >> > > > output difference from the kernel. The test is passing.
> >> > >
> >> > > I have located the exact kernel commit that changed the output, he=
nce
> >> > > why the test is failing.
> >> > >
> >> > > strace upstream hasn't adjusted yet, so I'll spin up a patch, and =
get
> >> > > send patches to the list over the weekend.
> >> >
> >> > The two patches that fix the strace ptest fail, and qemuarm graphica=
l
> >> > boot are on the list.
> >>
> >> Thanks Bruce! I've queued it and started it running through testing.
> >
> >
> > Since this patch, qemuarmv5 fails to build with:
> >
> > 00:01:47 NOTE: Running task 899 of 5734 (virtual:native:/home/tuxbake/o=
e/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_deploy_source_date_epoch)
> > 00:01:47 ERROR: linux-yocto-5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0=
 do_kernel_metadata: Could not locate BSP definition for qemuarm/standard a=
nd no defconfig was provided
> > 00:01:47 ERROR: linux-yocto-5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0=
 do_kernel_metadata: ExecutionError('/home/tuxbake/oe/build/tmp/work/qemuar=
mv5-poky-linux-gnueabi/linux-yocto/5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9=
-r0/temp/run.do_kernel_metadata.98856', 1, None, None)
> > 00:01:47 ERROR: Logfile of failure stored in: /home/tuxbake/oe/build/tm=
p/work/qemuarmv5-poky-linux-gnueabi/linux-yocto/5.15.36+gitAUTOINC+fcf48627=
ea_ebfb1822e9-r0/temp/log.do_kernel_metadata.98856
> > 00:01:47 Log data follows:
> > 00:01:47 | DEBUG: Executing python function extend_recipe_sysroot
> > 00:01:47 | NOTE: Direct dependencies are ['/home/tuxbake/oe/poky/meta/r=
ecipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot']
> > 00:01:47 | NOTE: Installed into sysroot: []
> > 00:01:47 | NOTE: Skipping as already exists in sysroot: ['kern-tools-na=
tive']
> > 00:01:47 | DEBUG: Python function extend_recipe_sysroot finished
> > 00:01:47 | DEBUG: Executing shell function do_kernel_metadata
> > 00:01:47 | NOTE: do_kernel_metadata: for summary/debug, set KCONF_AUDIT=
_LEVEL > 0
> > 00:01:47 | ERROR: Could not locate BSP definition for qemuarm/standard =
and no defconfig was provided
> > 00:01:47 | WARNING: /home/tuxbake/oe/build/tmp/work/qemuarmv5-poky-linu=
x-gnueabi/linux-yocto/5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0/temp/run.=
do_kernel_metadata.98856:404 exit 1 from 'exit 1'
> > 00:01:47 | WARNING: Backtrace (BB generated script):
> > 00:01:47 | #1: bbfatal_log, /home/tuxbake/oe/build/tmp/work/qemuarmv5-p=
oky-linux-gnueabi/linux-yocto/5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0/t=
emp/run.do_kernel_metadata.98856, line 404
> > 00:01:47 | #2: do_kernel_metadata, /home/tuxbake/oe/build/tmp/work/qemu=
armv5-poky-linux-gnueabi/linux-yocto/5.15.36+gitAUTOINC+fcf48627ea_ebfb1822=
e9-r0/temp/run.do_kernel_metadata.98856, line 272
> > 00:01:47 | #3: main, /home/tuxbake/oe/build/tmp/work/qemuarmv5-poky-lin=
ux-gnueabi/linux-yocto/5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0/temp/run=
.do_kernel_metadata.98856, line 435
> > 00:01:47 NOTE: recipe linux-yocto-5.15.36+gitAUTOINC+fcf48627ea_ebfb182=
2e9-r0: task do_kernel_metadata: Failed
> > 00:01:47 ERROR: Task (/home/tuxbake/oe/poky/meta/recipes-kernel/linux/l=
inux-yocto_5.15.bb:do_kernel_metadata) failed with exit code '1'
> >
>
> It's fallout from Jon's re-org. I'll have a look today and send
> patches as appropriate.
>
> Bruce

Patching coming!

>
> > see full build log
> > https://oebuilds.tuxbuild.com/28f9WxOsIhBeAgIbQH3DsCwyQCc/build-debug.l=
og
> >
> >
> >
> >>
> >> Cheers,
> >>
> >> Richard
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#165076): https://lists.openembedded.org/g/openembe=
dded-core/message/165076
> >> Mute This Topic: https://lists.openembedded.org/mt/90753174/1279857
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[nicolas.dechesne@linaro.org]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

