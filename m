Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64385C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 18:52:43 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.1018.1657133560550211750
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 11:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pjdoMPpR;
 spf=pass (domain: gmail.com, ip: 209.85.216.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 t5-20020a17090a6a0500b001ef965b262eso6339023pjj.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 11:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cV4jUF6dDgmUHAMTaCZx3ZYvVVibODN7ErRGatb2MDw=;
        b=pjdoMPpReC70qhwIvDUJI0zJrvlEpgQNmF3bx2UUhakoGSQ8194nP0LEt3kcf7M1Cb
         WfW/JUJzrWnOzF2o4+cnTTMaAuORsLAXp3swILZA6BMySelE2XZQTSPFp3AQ5WDHZ+5R
         WzqPGFlpMMn/7odIBphkSkvY1okZe5RcY3q87xLZfso5eIkqq2TLZLfRj6Hk2ZPxJuhW
         4EFZWDDNO8gIoLYEvD6XRCAeHgrRxe7f0inkIAbFDB34lCcSMY+jIafdneVoI1eOroci
         gNOuBz3uefTvbZU57Tw9gmLgrjLEZsbMlPbu7VXnmUYXBjuiYrSdxiHSU7cfkg0Aq+34
         zWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cV4jUF6dDgmUHAMTaCZx3ZYvVVibODN7ErRGatb2MDw=;
        b=EUJnQVvt6gETu2Yg6BMwwcem0teO0mfEhRfg5njCKjEKQvDHDAz+Yq3LtptWtfywc6
         FEiAsyLUhskz1BxdcwuDtbsoe2RiGXx+Q/bZorUOXVw5ER17nlIYw6gXXz7Gk/ln8ddQ
         PxYA/Uk6q4IlGlyrV3rVYboe2P7Qaholmhwi2rwir3STjJe8t2BWTORxx9QU5EYCXQNn
         bEVQoNqtc4ib4RobqCd1jCOCe+hDjRc5NKoxTMXhYVStl33rpd8Fs3NsNu0aY0miJ3BX
         nZfvuGYusB0l5UW14eFs5bLK7bordeyu+BDmyxVziSVA0YzP+O+byrGwMYrA4zMP4OQe
         juvA==
X-Gm-Message-State: AJIora96Gi5fdQOdtgmgehXWx35QAreye6ORyReT2nHDshK67AYd5yGt
	mBglqOcax2MxVhlD6hOhkg+bnGc5q1G8KFbKm9g=
X-Google-Smtp-Source: 
 AGRyM1sXYR9oQJx5kdgPYsmMagY7yad7frzmjMUH+1ZLVx9Fe4QiQRs1H1gVZx0iqB23G9mNzfCn8trLwveA6g9ToiE=
X-Received: by 2002:a17:90b:1807:b0:1ef:8aa5:1158 with SMTP id
 lw7-20020a17090b180700b001ef8aa51158mr42463pjb.163.1657133559944; Wed, 06 Jul
 2022 11:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <16FE039DA287E43E.1980@lists.openembedded.org>
 <16FEA3B3CA900B93.1980@lists.openembedded.org>
 <16FEBD90A08F81A5.1980@lists.openembedded.org>
 <5b8c809573b0ecb0039333edcbeb1936b40db564.camel@linuxfoundation.org>
In-Reply-To: 
 <5b8c809573b0ecb0039333edcbeb1936b40db564.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 6 Jul 2022 14:52:27 -0400
Message-ID: 
 <CADkTA4MCU2o20k0s9LZ_co0rwurfEa-JNxvYpEK1XL8_8K20eg@mail.gmail.com>
Subject: Re: [OE-core] Build paths/reproduibility issues in master - help
 requested
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 18:52:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167743

On Wed, Jul 6, 2022 at 12:39 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2022-07-04 at 22:28 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Mon, 2022-07-04 at 14:34 +0100, Richard Purdie via
> > > > With docs enabled:
> > > > stdio: WARNING: lib32-vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/vapigen-wrapper in package lib32-vala contains reference to TMPDIR [buildpaths]
> > > > stdio: WARNING: rpm-1_4.17.0-r0 do_package_qa: QA Issue: File /usr/lib64/pkgconfig/rpm.pc in package rpm-dev contains reference to TMPDIR [buildpaths]
> > > > stdio: WARNING: lib32-gtk-doc-1.33.2-r0 do_package_qa: QA Issue: File /usr/share/gtk-doc/python/gtkdoc/config_data.py in package lib32-gtk-doc contains reference to TMPDIR [buildpaths]
> > > > stdio: WARNING: vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/vapigen-wrapper in package vala contains reference to TMPDIR [buildpaths]
> > > > stdio: WARNING: gtk-doc-1.33.2-r0 do_package_qa: QA Issue: File /usr/share/gtk-doc/python/gtkdoc/config_data.py in package gtk-doc contains reference to TMPDIR [buildpaths]
>
> I think I have fixes out for rpm (via lua) and vala. gtk-doc remains.
>
> > > These still remain. In addition we also have:
> > >
> > > A musl ltp issue:
> > > stdio: WARNING: ltp-20220527-r0 do_package_qa: QA Issue: File /opt/ltp/testcases/open_posix_testsuite/logfile.conformance-all in package ltp contains reference to TMPDIR [buildpaths]
>
> Still remaining.
>
> > >
> > > Some multilib issues:
> > > stdio: WARNING: lib32-vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/vapigen-wrapper in package lib32-vala contains reference to TMPDIR [buildpaths]
> > > stdio: WARNING: vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/vapigen-wrapper in package vala contains reference to TMPDIR [buildpaths]
> > > stdio: WARNING: rpm-1_4.17.0-r0 do_package_qa: QA Issue: File /usr/lib64/pkgconfig/rpm.pc in package rpm-dev contains reference to TMPDIR [buildpaths]
>
> These are probably fixed.
>
> > > qemuarm64:
> > > stdio: WARNING: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /lib/modules/5.15.44-yocto-standard/build/include/generated/.vdso-offsets.h.cmd in package kernel-devsrc contains reference to TMPDIR [buildpaths]
>
> Fix out from Bruce (thanks!)
>
> > >
> > > meta-gplv2 issue:
> > > stdio: WARNING: mc-4.7.5.2-r3 do_package_qa: QA Issue: File /usr/libexec/mc/extfs.d/iso9660 in package mc-helpers contains reference to TMPDIR [buildpaths]
> > > stdio: WARNING: tar-1.17-r3 do_package_qa: QA Issue: File /usr/src/debug/tar/1.17-r3/build/lib/string.h in package tar-src contains reference to TMPDIR
>
> This may be the end of meta-gplv2 since nobody cares.
>
> > >
> > > Christopher replied about meta-virt which is much appreciated!
> >
> > With the .debug checking patch applied, we also see an issue with
> > lttng-modules on beaglebone, edgerouter, and qemumips:
> >
> > stdio: WARNING: lttng-modules-2.13.4-r0 do_package_qa: QA Issue: File /lib/modules/5.15.36-yocto-standard/kernel/lttng-modules/lib/.debug/lttng-lib-ring-buffer.ko in package lttng-modules-dbg contains reference to TMPDIR

I'll have a go at this one as well, but I'll be out of the office on
Friday/Monday, so it'll be after hours and a bit slower than normal.

Bruce

>
> Still remaining.
>
> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

