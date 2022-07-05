Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29662C43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 13:00:48 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.84123.1657026044311946001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 06:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KYrIUwOx;
 spf=pass (domain: gmail.com, ip: 209.85.215.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id z14so11381852pgh.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 06:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JFFup7LOa69foBNjt7ko8Na0LJiKJy2XhT+H5fr1r/M=;
        b=KYrIUwOx6FUn3vSzbv8YHjJdsmS+rnU5kVaUoyvGaYhF/hba3VvLucQVPcQotUiHJz
         Elaj74G8NoGfQRtr5Ns3LAa9LCYNMfZ3mPS/dEo6qAOAJOflrvpThVkK3wxgSZH4XUQs
         yZOF2AH3eo/Y6s2surQnnXvCyldvEZFBe8VQ/npfuK9pIa30ZPb6BZyKfYDGH7dOW+La
         HK2bwVJbzPinnEX1BJQre3a8cqQDus9k7j85MZI/fHXjgU/ewp+FJOOdRAfhFkOdCN9w
         x9OnFrkkrelWdAaplLgmHkj7Qlt3SclH2wBth+d9gV0BJP0ZxxVryIANIPkILWx+4jUT
         r3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JFFup7LOa69foBNjt7ko8Na0LJiKJy2XhT+H5fr1r/M=;
        b=rMoG7NBr4SFvZz5eIxtcmCasjuDuXpo/GWXNvLFcx5ymw7WnB/UWfRPxTH0KPxPqLL
         Q41RNZDu19FRUDPfmkCu8oyi4ReFFzhl8XEi0nBgNrJPMI2cOH8l4kppwcnut4xEmcOf
         sUM7C4kqm3M6vMrKEo2iOq75e0qfBKDncpJC0HYLdgzZBtyWf+IZUUZ7rmXpmpCW6t2m
         RyKXf5CuBVSDPwEs87GnYby7ltmUUPMbD16GDSDmuX77n8W/iL4A1CgMOR6hGhJgaJKc
         y9WIdgBAP2g8U7nX9ssB8cCkJg1sf4i05A1Shx9m/WOb7kBnVMGfNu4C0GUlVr+Dn7bv
         MMTA==
X-Gm-Message-State: AJIora+6y80E9Mk96HgMk6epC295tNqOxm6kZH6YUJ0qGYlFXR6UyoZA
	imh8lQdBEvZgHSvkweBIa9BIquExcQWmVEdoPwk=
X-Google-Smtp-Source: 
 AGRyM1v2dpLZCTiWKZRnT1nmU9LEbhaVkccyVUDz1vsSbGsiXPIJiFeC+7lFYCEGOP7eqxxpujXd84YQRKxp3k0Jm1o=
X-Received: by 2002:a05:6a00:1c5c:b0:505:7469:134a with SMTP id
 s28-20020a056a001c5c00b005057469134amr41785986pfw.16.1657026043287; Tue, 05
 Jul 2022 06:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <16FE039DA287E43E.1980@lists.openembedded.org>
 <4770b1475916c1c4e8b7118dab2ba934af604c03.camel@linuxfoundation.org>
 <16FEA476019460F5.1980@lists.openembedded.org>
In-Reply-To: <16FEA476019460F5.1980@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 5 Jul 2022 09:00:31 -0400
Message-ID: 
 <CADkTA4NGgspk+CZRvMMObDdEJPg5cdJcZV=mQChPQPY3OwB0EA@mail.gmail.com>
Subject: Re: [OE-core] Build paths/reproduibility issues in master - help
 requested
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 13:00:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167651

On Mon, Jul 4, 2022 at 9:49 AM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> On Mon, Jul 4, 2022 at 9:35 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Sat, 2022-07-02 at 13:41 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > Hi All,
> > >
> > > I tried enabling buildpaths in WARN_QA on the autobuilder. This in
> > > theory should have built cleanly but it didn't as we don't test all the
> > > autobuilder configurations for reproducibility. I think this proves the
> > > value in enabling it however before we can there are a handful of
> > > issues we need to fix:
> > >
> > > With oe-core (systemd enabled):
> > > stdio: WARNING: go-helloworld-0.1-r0 do_package_qa: QA Issue: File /usr/bin/go-helloworld in package go-helloworld contains reference to TMPDIR [buildpaths]
> > > stdio: WARNING: glibc-tests-2.35-r0 do_package_qa: QA Issue: File /usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-timer4-time64 in package glibc-tests contains reference to TMPDIR
> > > stdio: WARNING: systemd-1_251.2-r0 do_package_qa: QA Issue: File /usr/src/debug/systemd/1_251.2-r0/build/src/login/logind-gperf.c in package systemd-src contains reference to TMPDIR
> >
> > I think I have patches sent out which should address the above issues.
> >
> > > With docs enabled:
> > > stdio: WARNING: lib32-vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/vapigen-wrapper in package lib32-vala contains reference to TMPDIR [buildpaths]
> > > stdio: WARNING: rpm-1_4.17.0-r0 do_package_qa: QA Issue: File /usr/lib64/pkgconfig/rpm.pc in package rpm-dev contains reference to TMPDIR [buildpaths]
> > > stdio: WARNING: lib32-gtk-doc-1.33.2-r0 do_package_qa: QA Issue: File /usr/share/gtk-doc/python/gtkdoc/config_data.py in package lib32-gtk-doc contains reference to TMPDIR [buildpaths]
> > > stdio: WARNING: vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/vapigen-wrapper in package vala contains reference to TMPDIR [buildpaths]
> > > stdio: WARNING: gtk-doc-1.33.2-r0 do_package_qa: QA Issue: File /usr/share/gtk-doc/python/gtkdoc/config_data.py in package gtk-doc contains reference to TMPDIR [buildpaths]
> >
> > These still remain. In addition we also have:
> >
> > A musl ltp issue:
> > stdio: WARNING: ltp-20220527-r0 do_package_qa: QA Issue: File /opt/ltp/testcases/open_posix_testsuite/logfile.conformance-all in package ltp contains reference to TMPDIR [buildpaths]
> >
> > Some multilib issues:
> > stdio: WARNING: lib32-vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/vapigen-wrapper in package lib32-vala contains reference to TMPDIR [buildpaths]
> > stdio: WARNING: vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/vapigen-wrapper in package vala contains reference to TMPDIR [buildpaths]
> > stdio: WARNING: rpm-1_4.17.0-r0 do_package_qa: QA Issue: File /usr/lib64/pkgconfig/rpm.pc in package rpm-dev contains reference to TMPDIR [buildpaths]
> >
> > qemuarm64:
> > stdio: WARNING: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /lib/modules/5.15.44-yocto-standard/build/include/generated/.vdso-offsets.h.cmd in package kernel-devsrc contains reference to TMPDIR [buildpaths]
>
> I'm working on perf, and if no one else gets there first, I'll take a
> look at the devsrc one.

I've reproduced the qemuarm64 kernel-devsrc issue, if no one else is
working on it, I'll have a go at it today.

Bruce

>
> Bruce
>
> >
> > meta-gplv2 issue:
> > stdio: WARNING: mc-4.7.5.2-r3 do_package_qa: QA Issue: File /usr/libexec/mc/extfs.d/iso9660 in package mc-helpers contains reference to TMPDIR [buildpaths]
> > stdio: WARNING: tar-1.17-r3 do_package_qa: QA Issue: File /usr/src/debug/tar/1.17-r3/build/lib/string.h in package tar-src contains reference to TMPDIR
> >
> > Christopher replied about meta-virt which is much appreciated!
> >
> > Cheers,
> >
> > Richard
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167611): https://lists.openembedded.org/g/openembedded-core/message/167611
> Mute This Topic: https://lists.openembedded.org/mt/92128673/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

