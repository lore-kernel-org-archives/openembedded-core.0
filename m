Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71683C433EF
	for <webhook@archiver.kernel.org>; Sat,  9 Jul 2022 01:55:13 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web08.2389.1657331712714962563
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 18:55:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XNvGZ3F/;
 spf=pass (domain: gmail.com, ip: 209.85.217.53,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id d187so220352vsd.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 18:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z47WwF2kuhi2njLYV8GFTPhfssMjBW6sE1RPfoH8FfY=;
        b=XNvGZ3F/wWbGKFnYmf/GbcvQXZ9x7TNDVazc1+r6qMgtdY7er7xpf0XyeuuZql/8zG
         k8Kh4TDwiZKnDxygAEKZqX32LkWhjzVhRPDr1ksWkp34CcMqm+0K2WFh6IXiC7TNVp6B
         E+hyW/GEBCUrY26k4QARlcnSnJaqzfhMGW6hwQ5JZrjGfiO/LFyqtCOFtzNperQhcReR
         csfJecAvdJaAVyhwalxQtXTUieuSrMaZkeZKhNDIh9GTxmSKIiEkb4kbo7Um5M5OGoat
         SD/z00z2RnN+OHK64ArgnWhiUwdPo48fH/FmhSLim47OSHNhPiVCkSU5EPSH5lHuXt+v
         i4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z47WwF2kuhi2njLYV8GFTPhfssMjBW6sE1RPfoH8FfY=;
        b=VzwHyMZ/JkLomnZTiGl1KHbC+q/G0Hn2ySGffbAkWA3TE99OyM0xEu5f/0iPqWzb0c
         XYlc0vqeQBFomZ6yJT0UB4kz5JTHx8oAB1otPdZWj0uczO3vWbsqA7aYT6nFZdkhsvmT
         GXTsDcA+iTV+GSIk/+nQRJUSugr+ipONrygtu7lqVgqffGSOBIn/nsvrvWYPwMApWBQ5
         mviAaYWjlwwsOluV7yswfZdkB+1vLC9Y2UW76cJNnm11IzhVRH3oZAtXvN0CRPydCGhy
         LaqyJX3fYl63O9Uso5yPzizJfrpcjE/ig4bXoaSf0UB5ALb6MLL5rt1PuUPY4nORGcgN
         ruMQ==
X-Gm-Message-State: AJIora+Wf0sJ7Mc25W40pA9LL4xTOjflgPlIqCFiYfcJkxVwleticP6z
	nU02j1w0Y2eWxLiuEERkb1C9qAvqyDsrnJxfHjk=
X-Google-Smtp-Source: 
 AGRyM1tXf0LZq0/xGzTMOu7HrIH75G8hkTSdBZzYrDOg/D5FvC3SragFDFTpZfrHWJxn0giI69uN0tD4A/TCHskP30g=
X-Received: by 2002:a67:1a86:0:b0:356:ef19:c851 with SMTP id
 a128-20020a671a86000000b00356ef19c851mr2978526vsa.84.1657331711680; Fri, 08
 Jul 2022 18:55:11 -0700 (PDT)
MIME-Version: 1.0
References: 
 <7140b61c92f4f9d79b8c8b8d9be68f127512b758.camel@linuxfoundation.org>
 <CADkTA4O0Ej3HKMPtwoq_iBue2P43gicwx8rfFKyLY5d3jNTP_A@mail.gmail.com>
In-Reply-To: 
 <CADkTA4O0Ej3HKMPtwoq_iBue2P43gicwx8rfFKyLY5d3jNTP_A@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Fri, 8 Jul 2022 18:55:00 -0700
Message-ID: 
 <CACMJ4GZQNx5WCscejF9nHcsPL2+sO_o77fU_rwTi6+Ex53obtQ@mail.gmail.com>
Subject: Re: [OE-core] Reproducible build issues with buildpaths - take 2
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Jul 2022 01:55:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167834

On Fri, Jul 8, 2022 at 6:37 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Fri, Jul 8, 2022 at 7:07 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > Hi All,
> >
> > We've made good progress and I appreciate the help from people. I ran a
> > fresh build on the autobuilder and I forced it to rerun the QA checks
> > for all recipes. The tricky bit about warnings is that they don't show
> > up for objects from sstate and the addition of the buildpaths QA check
> > doesn't cause the checks to rerun. Due to that a few more previsouly
> > unseen issues cropped up.
> >
> > The list of issues now stands are:
> >
> > qemuppc:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5428
> > WARNING: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /lib/modules/5.15.48-yocto-standard/build/include/generated/.vdso32-offsets.h.cmd in package kernel-devsrc contains reference to TMPDIR [buildpaths]
>
> I'll take this one. My fix was only for arch/arm, but I'll expand it
> to cover ppc32.
>
> >
> > meta-arm:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/2629
> > stdio: WARNING: perl-5.36.0-r0 do_package_qa: QA Issue: File /usr/lib/perl/ptest/dist/threads-shared/Makefile.old in package perl-ptest contains reference to TMPDIR
> >
> > meta-gplv2:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/5460
> > WARNING: bash-3.2.57-r0 do_package_qa: QA Issue: File /usr/bin/bashbug in package bash contains reference to TMPDIR [buildpaths]
> > WARNING: tar-1.17-r3 do_package_qa: QA Issue: File /usr/src/debug/tar/1.17-r3/build/lib/string.h in package tar-src contains reference to TMPDIR
> > WARNING: diffutils-2.8.1-r7.0 do_package_qa: QA Issue: File /usr/bin/diff.diffutils in package diffutils contains reference to TMPDIR [buildpaths]
> > WARNING: findutils-4.2.31-r4 do_package_qa: QA Issue: File /usr/bin/updatedb in package findutils contains reference to TMPDIR [buildpaths]
> > WARNING: mc-4.7.5.2-r3 do_package_qa: QA Issue: File /usr/libexec/mc/extfs.d/iso9660 in package mc-helpers contains reference to TMPDIR [buildpaths]
> >
> > There is a proposal on the oe-architecture list about simply disabling
> > this layer going forward. The increased number of issues reinforces my
> > view on that.
> >
> > meta-virt:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/292
> > WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/lib/xen/boot/xen-shim in package xen-tools-shim contains reference to TMPDIR [buildpaths]
> > WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/src/debug/xen-tools/4.16+stableAUTOINC+f265444922-r0/git/tools/libs/light/dsdt_pvh.c in package xen-tools-src contains reference to TMPDIR [buildpaths]
> > WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/lib/libxenlight.so.4.16.0 in package xen-tools-libxenlight contains reference to TMPDIR [buildpaths]
> > WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/lib/libxenlight.a in package xen-tools-staticdev contains reference to TMPDIR [buildpaths]
> > WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/lib/debug/usr/lib/xen/boot/xen-shim-syms in package xen-tools-dbg contains reference to TMPDIR [buildpaths]
> >
>
> Hopefully Christopher can chime in here. If not, I'll have a look
> early next week (or over the weekend).

Ack - I will be working on this over this weekend and will let you know.

Christopher

>
> > There is also still the lttng-modules issue if we enable .debug
> > checking. I disabled that for these tests to reduce the noise.
>
> This is one I can pick up as well, if no one else gets there first.
>
> Bruce
>
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167824): https://lists.openembedded.org/g/openembedded-core/message/167824
> Mute This Topic: https://lists.openembedded.org/mt/92248896/3619037
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [christopher.w.clark@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

