Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF29C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 11:14:44 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.4304.1657192478899528974
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 04:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iEUzgpb8;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id r18so22677539edb.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 04:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d1dOI3RpvYD9xjW2MgPFCTCQ8Tz8ffZ++Iyr0FSmuxM=;
        b=iEUzgpb8NQNTn5sLAOTDe6+YcGwepVuyyEItIB8Gi354KqCzjgM6XT0tBk9v3OyvZw
         KJW/Zi9JUBB5BIerNu4lW/UTf3BLqj6zjRiYnSaGeW7Td/NF0/I0CvcyMqDWHjNhXUjU
         JsPtUr1/88vzuVRb65U4mPnNx5vb6Nmph+fiaNucyBujD/9O9vGsq2fYL0s0XWqjDQL1
         KGZ1KeZ628B6R65QDLpnbT17rt0A79deq6F2hpaMY9WVX5k8+GEek6zdklJKZvUGGOlG
         xC89NNI4AbHemiNDdV6s6f05W5rjt0yUMDFLicC0Cz0qWFSN3AiXsbrrs329/Vpf4uc9
         22/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d1dOI3RpvYD9xjW2MgPFCTCQ8Tz8ffZ++Iyr0FSmuxM=;
        b=fEpytoRREmMADO1PcAD9fou9twFXW1jx/avWEJzPnJz8AdYoI9sK2DfT+30XunS6gi
         pO1YflW1hj/u6AzSqp1cveCZyWB9pt+bNhehGbbSjfoyZ0MvrtA6tAj/CzMVfWCLmSt7
         pfyzUKm+Yscny72yOhkRUPCEsXcQrVktDKjeBqiZQwTkndHZUQFkUDShXLtnJb6Ne6cb
         EGxUaxCfFfKL9wvMsdc2dr9mK9RQZEbyQwrhKPdOybkk6Gs9q5nDerj0FH0+anc2GDOh
         5tPNPTv5kjUrMJpKQc2w5ynxswVUzo9wxt2Da4qILy9EM4PZR38C5gdeDOrFEG1/PhaT
         fAWg==
X-Gm-Message-State: AJIora/kDmEIQYDZ1+xZzYDlbAJgunonmA+CcaqiRENvNNMoP50HSHu8
	4Tfu8ex3UH/MCiXkhLdIHiowGL5R30NhnOpoXT0=
X-Google-Smtp-Source: 
 AGRyM1uj0XVgAnoctn44P+siA8drp1/RBQNOizn4bLdyeWqLPORBpKn1ISr5Dmgf0BA/wJOBibvrqbBb2m/EZmb930Y=
X-Received: by 2002:aa7:c2d7:0:b0:43a:78af:6e57 with SMTP id
 m23-20020aa7c2d7000000b0043a78af6e57mr18128730edp.163.1657192477271; Thu, 07
 Jul 2022 04:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <16FE039DA287E43E.1980@lists.openembedded.org>
 <16FEA3B3CA900B93.1980@lists.openembedded.org>
 <16FEBD90A08F81A5.1980@lists.openembedded.org>
 <5b8c809573b0ecb0039333edcbeb1936b40db564.camel@linuxfoundation.org>
In-Reply-To: 
 <5b8c809573b0ecb0039333edcbeb1936b40db564.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 7 Jul 2022 12:14:23 +0100
Message-ID: 
 <CAO5Uq5SPMd3FZwF8StQ6ofSustJiVFC2LLOe8RLTzMyyHXK5pQ@mail.gmail.com>
Subject: Re: [OE-core] Build paths/reproduibility issues in master - help
 requested
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 11:14:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167770

On Wed, Jul 6, 2022 at 5:40 PM Richard Purdie
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

Much as I'd rather this just wasn't necessary, I'm taking a look.

> > >
> > > Christopher replied about meta-virt which is much appreciated!
> >
> > With the .debug checking patch applied, we also see an issue with
> > lttng-modules on beaglebone, edgerouter, and qemumips:
> >
> > stdio: WARNING: lttng-modules-2.13.4-r0 do_package_qa: QA Issue: File /lib/modules/5.15.36-yocto-standard/kernel/lttng-modules/lib/.debug/lttng-lib-ring-buffer.ko in package lttng-modules-dbg contains reference to TMPDIR
>
> Still remaining.
>
> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167736): https://lists.openembedded.org/g/openembedded-core/message/167736
> Mute This Topic: https://lists.openembedded.org/mt/92128673/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kiernan@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
Alex Kiernan

