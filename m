Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258B5C77B72
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 17:21:11 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.1920.1682011266754650906
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 10:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=JoTBbqoy;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id h8so3662095ljf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 10:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682011265; x=1684603265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUMUBRFfRIzoztO87fL5QNiqRkwSQ5RmGoQ7jtQ/Nlo=;
        b=JoTBbqoyOYs90nCFS1VAkcT2uxaaUp6WrcQ4tgZG+lMtNN7+l0JVAAW2fFRTAFElGz
         EsvawR3EQUaA3cTsyRUuSNPyG/EXJ1NN6GsfguzlAQXe0Ip+jYyM6bgTiBHzaERw0BTF
         jFMs2l96s9Kvy/wx3wNFrUG7ODLkYH0BwfVi0bGEeoNqr1Lzsuxrxw6eWN7L+7h2j99r
         KS6/bUVZwe3Vgg5UI+j0FDNPgzy4D06sQ6MvYiBzeIus/pp9jS34usfLG7W7wBQ8tqAm
         lAyV/hGhMYbJGfHRqo3yDu3IpT4OFotNWMWqfX5QHlAJ6pp9TA/0RxvcORha4KqunyA2
         5jGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682011265; x=1684603265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUMUBRFfRIzoztO87fL5QNiqRkwSQ5RmGoQ7jtQ/Nlo=;
        b=bc3B5cD6zG5nvnTPgudJwL2GiX9YNcboeKsSxrMvB2Lar8JfKI5jl/1234QCity4l4
         dp5h35U8A63wiXE7w0u+LV0OqfsBLNXS9egzVGU6d2R4s6TtHRgzLUjCIwFabKQ35bJV
         r3RVqpKevtF9wNkNNFHwmn6s7ZKGWCcufjiCCCSwWfzNcRQR7m6CxDEdTWAoO1b8r0fp
         L/KtD3i7E3vCA8X0jSy87mqtZ/VRJb8Z0fn80sE2aknLckphQK1YYjAXdkZG2x7/cAB/
         HOIO8XDRpGSJLJ5MDSPQJPElXUVwCiJhnklVuP1hw6XIJi05cT6nLzcPuvj8aPQu4x8y
         qjTA==
X-Gm-Message-State: AAQBX9eVdopb4o4gALsxSVbQmKemF50EWuW4LeZOXFeEgG/qF3hG97a8
	OzU/sCMAfijRtz7Ft4vGByeOL9X4h3nGgUo1jPQ=
X-Google-Smtp-Source: AKy350YN0yZo/TzwnJdz9z5hazIaLfWZpofn4JnenIA0DzkIXICS+xinqvKKaEh9h9tEWVXqFsHn+LmnrA+cCMIRO7o=
X-Received: by 2002:a2e:9cd4:0:b0:299:ac68:4806 with SMTP id
 g20-20020a2e9cd4000000b00299ac684806mr621297ljj.9.1682011264644; Thu, 20 Apr
 2023 10:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230420052442.16443-1-yang.xu@mediatek.com> <CANNYZj-C8ujMnqkZqyU8rgAF+rJ9Bwqc2bOLkuGu0d0cJpXfpg@mail.gmail.com>
 <90b1e25cde406898154a05d03babc739120e643c.camel@mediatek.com>
In-Reply-To: <90b1e25cde406898154a05d03babc739120e643c.camel@mediatek.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Apr 2023 19:20:53 +0200
Message-ID: <CANNYZj-0u9XVkCVHT+WjtFkQ_nYg9i4OUj311wK5GgRhp7ZZfA@mail.gmail.com>
Subject: Re: [PATCH] openssl: set package level PERL5LIB
To: =?UTF-8?B?WWFuZyBYdSAo5b6Q5omsKQ==?= <Yang.Xu@mediatek.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 17:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180256

Thank you, I understand this now. I'm fine with the fix, but can you
add this additional information to the commit message? So that it's
available in git history if anyone needs to understand it.

Alex

On Thu, 20 Apr 2023 at 15:42, Yang Xu (=E5=BE=90=E6=89=AC) <Yang.Xu@mediate=
k.com> wrote:
>
> Dear Alexander,
>
> Sorry, let me explain the problem we met.
>
> The simplified environment and scenarios is:
> 1) User A, his home directory is /home/A, generate one sstate cache
> under /home/A.
> 2) This sstate cache moved to /home/Public, act as shared sstate cache
> 3) User B, his home directory is /home/B, using sstate cache in
> /home/Public and build yocto.
> 4) User B has no permission to access /home/A.
>
> The problem we met is while openssl built from scratch but perl using
> cache,
> it will be aborted at do_configure stage,
> error message is "Can not locate Text/Template.pm at /home/A/[build
> path]/[perl module path]/Text/Template.pm : Permission Denied".
>
> There are some information about perl:
> 1. perl will hardcode buildtime path in @INC in binary (module search
> directories)
> 2. when "use MODULE", perl will search @INC from begin to end until it
> found MODULE.
> 3. when perl search module through directories in @INC
>    3.1 if [directory]/MODULE.pm is not exist, search in next directory
> in @INC.
>    3.2 if [directory]/MODULE.pm has no permission to access, perl will
> ABORT.
>
> While build openssl from from scratch with perl using cache, @INC
> directory order is:
> 1.<PERL5LIB>
> 2.<default module path in ${WORKDIR}/recipe-sysroot-native>
> 3.<hardcode module path in binary, which point to /home/A/XXX/YYY>
> 4.<module found by FindBin, module Text-Template can be found by it>
>
> Q:What makes PERL5LIB setting inappropriate? Why is perl that has been
> built by a different user (and placed into sstate) not suitable?
> A:
> There is no path external/perl/Text-Template-1.46/lib/ exists,
> openssl has upgraded to external/perl/Text-Template-1.56/lib/.
> With current recipe, highest priority folder <PERL5LIB> pointed to an
> non-exist folder and meaningless.
> Lowest priority folder "<module found by FindBin>" includes modules in
> openssl source code.
>
> While perl search "Text/Template.pm", it can not found it in <PERL5LIB>
> and <default module path>.
> And then perl search module in <hardcode module path in binary>,
> *if /home/A is not existed, perl will search in <module found by
> FindBin> and found Text/Template.pm finally. (OK case)
> *if /home/A is existed but has no permission access, perl will ABORT
> immediately. (NG case, case we met)
>
> So my fixup is
> 1) set appropriate PERL5LIB to make perl can found Text/Tempalte.pm at
> highest priority folder <PERL5LIB>.
> 2) add other perl module directories needed by openssl build in
> PERL5LIB
> 3) set PERL5LIB as package environment variable
>
> Q: Doesn't this mean that perl from sstate can be broken in certain
> scenarios, and that needs to be fixed instead?
> A:
> I think it is a module/mechanisms co-work problem because I think
> sstate cache and perl is behavior normally.
> Caller of perl has response to prepare appropriate module setting.
>
> Sorry, I hope I explain the situation clearly.
>
> Thank you
>
> On Thu, 2023-04-20 at 11:22 +0200, Alexander Kanavin wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > On Thu, 20 Apr 2023 at 07:30, Yang Xu <yang.xu@mediatek.com> wrote:
> > >
> > > Build openssl with shared state cache may meet problem under below
> > > conditions:
> > > 1. sstate cache generated by another user on same machine
> > > 2. inappropriate PERL5LIB setting
> > > 3. openssl build from scratch but perl using cache
> > >
> > > When building openssl, without appropriate PERL5LIB setting, perl
> > > tries
> > > to search Text::Template in no permission path and abort.
> > >
> > > This patch does three things:
> > > 1. openssl upgrade external Text-Template from 1.46 to 1.56,
> > > correct perl module path.
> > > 2. add necessary module path while openssl build
> > > 3. set package level PERL5LIB to make perl found module in S
> >
> > I'm not sure I understand the description of the problem, or the fix.
> > What makes PERL5LIB setting inappropriate? Why is perl that has been
> > built by a different user (and placed into sstate) not suitable?
> > Doesn't this mean that perl from sstate can be broken in certain
> > scenarios, and that needs to be fixed instead?
> >
> > Alex

