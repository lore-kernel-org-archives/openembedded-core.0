Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12A4C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 13:02:24 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.5255.1657198941236055667
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 06:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bhB9YrVK;
 spf=pass (domain: gmail.com, ip: 209.85.218.53,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id os14so2054884ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 06:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I8qNe77sMF/HY8LtBiROq06ORLKSCe6fjDyMM2VbjBI=;
        b=bhB9YrVK2LN5taxjte2x+Z92gEK5qP3oQGnBuG/5AdY48p4vSqe+Ncb6IRMSPiT/4k
         DVQnsjMz3Tv8MKSnrzosZ7CTI0VBS97fWOdSvlCoNnHxCFmyHIDvmBkPDIPg/xQHLbgg
         b4uIZG/3V+cEfQhV7OXZN8Pzsi0GUOL5zqwSf2rHjIBMFl0zlQ/cKrjEZe4/J/eaWDhJ
         QBOFFBbOSe7eLZjKOguBLivS/t6BscqaHqB9NF/lI8h8tExrdHB6yVLb9A/8hgBH3SoN
         WMP+db2ZaYhODMFJugepdciBpQYtQOWHOT2iqErFiVsiQhdEhUU4gPrcIl+j0Qki1DCZ
         lKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I8qNe77sMF/HY8LtBiROq06ORLKSCe6fjDyMM2VbjBI=;
        b=ORAGIVZ1FjZqJ78+tJikE5H10LcHL3U6JmpCGkxta5W5x2bWkycDfuxBwsExk9l7y/
         mg17pS6MjyYGKsZKaA4kjzv5xC72LUbCO9RICNJl2PmPv05ayr3tbuthrsxwSCBYjTTp
         4HHQqtGz9AXvTYEKTeJ95uy1jOTYzopBPL8g0lVzIUpta5BX+aRvHuLIvsDQ2prqAIpK
         K70xHLobfaSRuizi2TCQznJ7iVxyDckx7/1X2dsjo9SsnfamDd7AhGIMr9R443H+OfIp
         caKAwQ33VK/D0QkZB0X/tM4ryW6EJu5NLZ7Q9cpx75FCGuJ+V7M7CBOiiNnqeL+uVRPA
         a+sg==
X-Gm-Message-State: AJIora9z99fjTwPck/aC3xNFZn3/V0FJ5W4A8zWpzPSDdmkpzQLvF0SM
	EuH64TVPS1xd1rSv1dpTIBfN5I+VVybdmgbsiQM=
X-Google-Smtp-Source: 
 AGRyM1sCKIZaZhtLNits5cwqZtYmyx3h728mfCWZUpZJkMkZwXg9swkGjdLy66Sm7p+gh/SxUH+hFonHJLvRPn+yDVU=
X-Received: by 2002:a17:906:ce:b0:718:bff8:58c3 with SMTP id
 14-20020a17090600ce00b00718bff858c3mr43300240eji.512.1657198939650; Thu, 07
 Jul 2022 06:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <16FE039DA287E43E.1980@lists.openembedded.org>
 <16FEA3B3CA900B93.1980@lists.openembedded.org>
 <16FEBD90A08F81A5.1980@lists.openembedded.org>
 <5b8c809573b0ecb0039333edcbeb1936b40db564.camel@linuxfoundation.org>
 <CAO5Uq5SPMd3FZwF8StQ6ofSustJiVFC2LLOe8RLTzMyyHXK5pQ@mail.gmail.com>
 <6b201cfd12ceade39184c42c898210bdc466791b.camel@linuxfoundation.org>
In-Reply-To: 
 <6b201cfd12ceade39184c42c898210bdc466791b.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 7 Jul 2022 14:02:06 +0100
Message-ID: 
 <CAO5Uq5RWouUf6CNGLj+kh69fHXJDUfeS-jbrxSTyDH5oQrvDxw@mail.gmail.com>
Subject: Re: [OE-core] Build paths/reproduibility issues in master - help
 requested
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 13:02:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167776

On Thu, Jul 7, 2022 at 1:21 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2022-07-07 at 12:14 +0100, Alex Kiernan wrote:
> > On Wed, Jul 6, 2022 at 5:40 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Mon, 2022-07-04 at 22:28 +0100, Richard Purdie via
> > > lists.openembedded.org wrote:
> > > > On Mon, 2022-07-04 at 14:34 +0100, Richard Purdie via
> > > > > > With docs enabled:
> > > > > > stdio: WARNING: lib32-vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/vapigen-wrapper in package lib32-vala contains reference to TMPDIR [buildpaths]
> > > > > > stdio: WARNING: rpm-1_4.17.0-r0 do_package_qa: QA Issue: File /usr/lib64/pkgconfig/rpm.pc in package rpm-dev contains reference to TMPDIR [buildpaths]
> > > > > > stdio: WARNING: lib32-gtk-doc-1.33.2-r0 do_package_qa: QA Issue: File /usr/share/gtk-doc/python/gtkdoc/config_data.py in package lib32-gtk-doc contains reference to TMPDIR [buildpaths]
> > > > > > stdio: WARNING: vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/vapigen-wrapper in package vala contains reference to TMPDIR [buildpaths]
> > > > > > stdio: WARNING: gtk-doc-1.33.2-r0 do_package_qa: QA Issue: File /usr/share/gtk-doc/python/gtkdoc/config_data.py in package gtk-doc contains reference to TMPDIR [buildpaths]
> > >
> > > I think I have fixes out for rpm (via lua) and vala. gtk-doc remains.
> > >
> > > > > These still remain. In addition we also have:
> > > > >
> > > > > A musl ltp issue:
> > > > > stdio: WARNING: ltp-20220527-r0 do_package_qa: QA Issue: File /opt/ltp/testcases/open_posix_testsuite/logfile.conformance-all in package ltp contains reference to TMPDIR [buildpaths]
> > >
> > > Still remaining.
> > >
> > > > >
> > > > > Some multilib issues:
> > > > > stdio: WARNING: lib32-vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/vapigen-wrapper in package lib32-vala contains reference to TMPDIR [buildpaths]
> > > > > stdio: WARNING: vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/vapigen-wrapper in package vala contains reference to TMPDIR [buildpaths]
> > > > > stdio: WARNING: rpm-1_4.17.0-r0 do_package_qa: QA Issue: File /usr/lib64/pkgconfig/rpm.pc in package rpm-dev contains reference to TMPDIR [buildpaths]
> > >
> > > These are probably fixed.
> > >
> > > > > qemuarm64:
> > > > > stdio: WARNING: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /lib/modules/5.15.44-yocto-standard/build/include/generated/.vdso-offsets.h.cmd in package kernel-devsrc contains reference to TMPDIR [buildpaths]
> > >
> > > Fix out from Bruce (thanks!)
> > >
> > > > >
> > > > > meta-gplv2 issue:
> > > > > stdio: WARNING: mc-4.7.5.2-r3 do_package_qa: QA Issue: File /usr/libexec/mc/extfs.d/iso9660 in package mc-helpers contains reference to TMPDIR [buildpaths]
> > > > > stdio: WARNING: tar-1.17-r3 do_package_qa: QA Issue: File /usr/src/debug/tar/1.17-r3/build/lib/string.h in package tar-src contains reference to TMPDIR
> > >
> > > This may be the end of meta-gplv2 since nobody cares.
> > >
> >
> > Much as I'd rather this just wasn't necessary, I'm taking a look.
>
> Ross has linked to some discussion about it.  I'd just delete mc to be
> honest, I can't see it being useful there.
>
> I think we need data on the use cases people are using it for and
> seeing whether it really is still necessary or just an easy way out.
>

gnutls/gmp/nettle is the only set of dependencies I actually care
about and having spent some time just now staring at the most recent
licenses on them, I'm beginning to wonder if my need of the meta-gplv2
versions is only because meta-gplv2 exists as all three seem to have
licenses now which don't give me a problem.

-- 
Alex Kiernan

