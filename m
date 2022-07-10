Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03F3C433EF
	for <webhook@archiver.kernel.org>; Sun, 10 Jul 2022 05:54:31 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web12.14315.1657432463945753853
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Jul 2022 22:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QGeP6PQY;
 spf=pass (domain: gmail.com, ip: 209.85.217.44,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id o185so2286059vsc.7
        for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Jul 2022 22:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jd81KQ2MbTvDuB4vm07JNaUgY85q0QfRgHU2jK/SVCQ=;
        b=QGeP6PQYW5j+QWitQThv8tWTMfOx8xIdfU27G1B6SOsA7UIcnPjqOlqLl2vwrRSbrL
         3yPiTLvPBld5M4HIoV7B9FjnMeeYB2eNhxqvBxcnlHKBao6sKECtl8HyXmdYPIOw/oHn
         t3+xejvCS/EOkNEiz69td1V+Cfdl5WUhvPX1ecWImg0vaz3fdMszroEpCmPg3s93uTpG
         LRUgyZPsWRoNkDLdDdO48+5SumhUopMa921byNO9ChUpeTN9RPQ1/Kz930M+TnUeV4E2
         xpX5rFVxMN/VTriU8k2WlW3Y3eVAxAW+XwNOPByeyzZkf+7c9I6kgVMLVYgcsgIE5Uc1
         MhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jd81KQ2MbTvDuB4vm07JNaUgY85q0QfRgHU2jK/SVCQ=;
        b=IWmiqcOrRr1jDeiR4AaJe+7Fmn6bjn6STpoCDjAKdsNFtrwhH51hSriVEiNGKobJGx
         /HNHy4dw7hV18gJED59HdUz9w/07kqge+lijDPNtxGsfHBKgUdWeTJq2KlqkhNUVoXSY
         PABvkz5PjkQuPZgwEdL++PkdDA4x6zIyP552d77GoJdhUIJoMvWV0Gq0jqQwIN2+4XPu
         xtDQnd7SDvoEeMAs+39WVqs8KPXWNqjMzD++Go5Gnk4dVa0Nj5gVuYxDc/rXskpDuz6+
         4ZkJ+f/ffaoCAU6y9dnwSS0mOPQl3tr7HkHZLoq9jRUACdiag4KMwtHYgh7B4S4DS+3Z
         /Ufw==
X-Gm-Message-State: AJIora/vKhbLpPjO27Z2U4HCtq5ooEV8XtRpfVxVP+TGMcqW5B8Hl0lF
	gjhMHPEJGCsdKDlVstCVtzodWhrnPrj7SdgO6v0=
X-Google-Smtp-Source: 
 AGRyM1t9GGYLZkHAk3yl3ssCGmHgGEjWb/JcHYpabgANVkzd4tE3s7XsRyZc+z6/lVbMsfumkGdieB6CF2ekq8COXbA=
X-Received: by 2002:a67:f74c:0:b0:354:5c29:aad7 with SMTP id
 w12-20020a67f74c000000b003545c29aad7mr3912599vso.40.1657432462879; Sat, 09
 Jul 2022 22:54:22 -0700 (PDT)
MIME-Version: 1.0
References: 
 <7140b61c92f4f9d79b8c8b8d9be68f127512b758.camel@linuxfoundation.org>
 <CADkTA4O0Ej3HKMPtwoq_iBue2P43gicwx8rfFKyLY5d3jNTP_A@mail.gmail.com>
 <170006698A73A72B.21011@lists.openembedded.org>
In-Reply-To: <170006698A73A72B.21011@lists.openembedded.org>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Sat, 9 Jul 2022 22:54:11 -0700
Message-ID: 
 <CACMJ4Gac31vrekYcD7+vooVtp5pd24kCVtAocNM4yjzjXCHNaA@mail.gmail.com>
Subject: Re: [OE-core] Reproducible build issues with buildpaths - take 2
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Jul 2022 05:54:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167843

On Fri, Jul 8, 2022 at 6:55 PM Christopher Clark via
lists.openembedded.org
<christopher.w.clark=gmail.com@lists.openembedded.org> wrote:
>
> On Fri, Jul 8, 2022 at 6:37 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Fri, Jul 8, 2022 at 7:07 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > Hi All,
> > >
> > > We've made good progress and I appreciate the help from people. I ran a
> > > fresh build on the autobuilder and I forced it to rerun the QA checks
> > > for all recipes. The tricky bit about warnings is that they don't show
> > > up for objects from sstate and the addition of the buildpaths QA check
> > > doesn't cause the checks to rerun. Due to that a few more previsouly
> > > unseen issues cropped up.
> > >
> > > The list of issues now stands are:
> > >
> > > qemuppc:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5428
> > > WARNING: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /lib/modules/5.15.48-yocto-standard/build/include/generated/.vdso32-offsets.h.cmd in package kernel-devsrc contains reference to TMPDIR [buildpaths]
> >
> > I'll take this one. My fix was only for arch/arm, but I'll expand it
> > to cover ppc32.
> >
> > >
> > > meta-arm:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/2629
> > > stdio: WARNING: perl-5.36.0-r0 do_package_qa: QA Issue: File /usr/lib/perl/ptest/dist/threads-shared/Makefile.old in package perl-ptest contains reference to TMPDIR
> > >
> > > meta-gplv2:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/5460
> > > WARNING: bash-3.2.57-r0 do_package_qa: QA Issue: File /usr/bin/bashbug in package bash contains reference to TMPDIR [buildpaths]
> > > WARNING: tar-1.17-r3 do_package_qa: QA Issue: File /usr/src/debug/tar/1.17-r3/build/lib/string.h in package tar-src contains reference to TMPDIR
> > > WARNING: diffutils-2.8.1-r7.0 do_package_qa: QA Issue: File /usr/bin/diff.diffutils in package diffutils contains reference to TMPDIR [buildpaths]
> > > WARNING: findutils-4.2.31-r4 do_package_qa: QA Issue: File /usr/bin/updatedb in package findutils contains reference to TMPDIR [buildpaths]
> > > WARNING: mc-4.7.5.2-r3 do_package_qa: QA Issue: File /usr/libexec/mc/extfs.d/iso9660 in package mc-helpers contains reference to TMPDIR [buildpaths]
> > >
> > > There is a proposal on the oe-architecture list about simply disabling
> > > this layer going forward. The increased number of issues reinforces my
> > > view on that.
> > >
> > > meta-virt:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/292
> > > WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/lib/xen/boot/xen-shim in package xen-tools-shim contains reference to TMPDIR [buildpaths]
> > > WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/src/debug/xen-tools/4.16+stableAUTOINC+f265444922-r0/git/tools/libs/light/dsdt_pvh.c in package xen-tools-src contains reference to TMPDIR [buildpaths]
> > > WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/lib/libxenlight.so.4.16.0 in package xen-tools-libxenlight contains reference to TMPDIR [buildpaths]
> > > WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/lib/libxenlight.a in package xen-tools-staticdev contains reference to TMPDIR [buildpaths]
> > > WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/lib/debug/usr/lib/xen/boot/xen-shim-syms in package xen-tools-dbg contains reference to TMPDIR [buildpaths]
> > >
> >
> > Hopefully Christopher can chime in here. If not, I'll have a look
> > early next week (or over the weekend).
>
> Ack - I will be working on this over this weekend and will let you know.

ok, I've just posted a patch for this with what I've found so far this
weekend -- it fixes all the warnings that I can see in testing with
both x86 and Arm builds, so hopefully it's OK now.

thanks,

Christopher

>
> >
> > > There is also still the lttng-modules issue if we enable .debug
> > > checking. I disabled that for these tests to reduce the noise.
> >
> > This is one I can pick up as well, if no one else gets there first.
> >
> > Bruce
> >
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> > >
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167834): https://lists.openembedded.org/g/openembedded-core/message/167834
> Mute This Topic: https://lists.openembedded.org/mt/92248896/3619037
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [christopher.w.clark@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

