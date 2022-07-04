Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508C5C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 13:49:01 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.72152.1656942539376660310
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 06:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NuMXDF8G;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 68so8984772pgb.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 06:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VK1Uv4jXJUR+10659S4xYNKwPup6wo1noCqkMcByTNA=;
        b=NuMXDF8GYPzO58d4+s4lGLNR6TueGF+/bDV1W2gVBbK0cPVBjZfQwR5YVo8s/NKCEk
         kpzQ0YNOONpbXoL4Ej2zX1LNE+r57eAlTZaOahbKKJeU150iY5nV5lyWaBX+Ski+7H90
         HVHVngi1G/1MV1Ufd3I+vun0dEhbvAjsowUZl+MJJjJ1ttDIkSJTxgYq/CbRbQImuPSr
         OZvhdFjrgMN2QIKmt8ni061vekYTab/XBoDbcV3+rz3318Z1Au5U4DqA1+SG17xK3Fgm
         IrFpIPx2XW+0gOnsB41icdO+d2cUQcDEqO73J0FkSP9PlEAI8Tm8hK0E547RFyHrl8B6
         MFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VK1Uv4jXJUR+10659S4xYNKwPup6wo1noCqkMcByTNA=;
        b=W9/GDR6YZaHMM/NvhfKwDlzzyHIe5N9wbYuioVSP9bKSd5zrZGvWNQQJnl/0ISUco4
         /E/vy+Xfg46QnXO5j2aI00KeyRFdiORlgzUdqCV3vgyaWPgXGmjEKdlTFUE84geymemg
         qRmGgsGmF/4Dtwvg23qw/cgYi2vz+Nw7QeaQFjt7moc1G0G3utyI3kyCayQX9sWW9RTO
         GTdkscgYDap2RToXw2FvXS/0MdRZDGG2OEjhnRL4FUyDT2Fj1ucW+4WYFvKF6iNn01cr
         lq8zBa4Ms52uvIBorEbmnLVhQjcM8EKGGN/89lsxi4CGrq8C8krE+KZMM+DsyUq/Cppc
         eS8Q==
X-Gm-Message-State: AJIora+lm4230vuWW+/MNRrUThYGxXyOxYXSVN7jAQMNgh+++/HuUiDd
	cC1R0zATMkJU1cAcHdfPd94s6aWmHr9SCn0B5ug=
X-Google-Smtp-Source: 
 AGRyM1sms6DtYF4bUHh4wNQl5kJun0D0uDLwbgSLVXuYGkoFqdlk181qxczvr8iQ0eT7cGJOLvHvsjdhI/C4mkEsocU=
X-Received: by 2002:a63:4b0b:0:b0:411:7951:c9a1 with SMTP id
 y11-20020a634b0b000000b004117951c9a1mr26082624pga.450.1656942538568; Mon, 04
 Jul 2022 06:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <16FE039DA287E43E.1980@lists.openembedded.org>
 <4770b1475916c1c4e8b7118dab2ba934af604c03.camel@linuxfoundation.org>
In-Reply-To: 
 <4770b1475916c1c4e8b7118dab2ba934af604c03.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 4 Jul 2022 09:48:46 -0400
Message-ID: 
 <CADkTA4O+0EEvuP3TPy+umVaSm0-V8zOuX0H1ufHEz0HLcO2d7w@mail.gmail.com>
Subject: Re: [OE-core] Build paths/reproduibility issues in master - help
 requested
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 13:49:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167611

On Mon, Jul 4, 2022 at 9:35 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2022-07-02 at 13:41 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > Hi All,
> >
> > I tried enabling buildpaths in WARN_QA on the autobuilder. This in
> > theory should have built cleanly but it didn't as we don't test all the
> > autobuilder configurations for reproducibility. I think this proves the
> > value in enabling it however before we can there are a handful of
> > issues we need to fix:
> >
> > With oe-core (systemd enabled):
> > stdio: WARNING: go-helloworld-0.1-r0 do_package_qa: QA Issue: File /usr/bin/go-helloworld in package go-helloworld contains reference to TMPDIR [buildpaths]
> > stdio: WARNING: glibc-tests-2.35-r0 do_package_qa: QA Issue: File /usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-timer4-time64 in package glibc-tests contains reference to TMPDIR
> > stdio: WARNING: systemd-1_251.2-r0 do_package_qa: QA Issue: File /usr/src/debug/systemd/1_251.2-r0/build/src/login/logind-gperf.c in package systemd-src contains reference to TMPDIR
>
> I think I have patches sent out which should address the above issues.
>
> > With docs enabled:
> > stdio: WARNING: lib32-vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/vapigen-wrapper in package lib32-vala contains reference to TMPDIR [buildpaths]
> > stdio: WARNING: rpm-1_4.17.0-r0 do_package_qa: QA Issue: File /usr/lib64/pkgconfig/rpm.pc in package rpm-dev contains reference to TMPDIR [buildpaths]
> > stdio: WARNING: lib32-gtk-doc-1.33.2-r0 do_package_qa: QA Issue: File /usr/share/gtk-doc/python/gtkdoc/config_data.py in package lib32-gtk-doc contains reference to TMPDIR [buildpaths]
> > stdio: WARNING: vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/vapigen-wrapper in package vala contains reference to TMPDIR [buildpaths]
> > stdio: WARNING: gtk-doc-1.33.2-r0 do_package_qa: QA Issue: File /usr/share/gtk-doc/python/gtkdoc/config_data.py in package gtk-doc contains reference to TMPDIR [buildpaths]
>
> These still remain. In addition we also have:
>
> A musl ltp issue:
> stdio: WARNING: ltp-20220527-r0 do_package_qa: QA Issue: File /opt/ltp/testcases/open_posix_testsuite/logfile.conformance-all in package ltp contains reference to TMPDIR [buildpaths]
>
> Some multilib issues:
> stdio: WARNING: lib32-vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/vapigen-wrapper in package lib32-vala contains reference to TMPDIR [buildpaths]
> stdio: WARNING: vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/vapigen-wrapper in package vala contains reference to TMPDIR [buildpaths]
> stdio: WARNING: rpm-1_4.17.0-r0 do_package_qa: QA Issue: File /usr/lib64/pkgconfig/rpm.pc in package rpm-dev contains reference to TMPDIR [buildpaths]
>
> qemuarm64:
> stdio: WARNING: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /lib/modules/5.15.44-yocto-standard/build/include/generated/.vdso-offsets.h.cmd in package kernel-devsrc contains reference to TMPDIR [buildpaths]

I'm working on perf, and if no one else gets there first, I'll take a
look at the devsrc one.

Bruce

>
> meta-gplv2 issue:
> stdio: WARNING: mc-4.7.5.2-r3 do_package_qa: QA Issue: File /usr/libexec/mc/extfs.d/iso9660 in package mc-helpers contains reference to TMPDIR [buildpaths]
> stdio: WARNING: tar-1.17-r3 do_package_qa: QA Issue: File /usr/src/debug/tar/1.17-r3/build/lib/string.h in package tar-src contains reference to TMPDIR
>
> Christopher replied about meta-virt which is much appreciated!
>
> Cheers,
>
> Richard



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

