Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8E1C71159
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 14:46:33 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.13259.1692369983392374916
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 07:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fukZzzQ1;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b9a828c920so15173651fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 07:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692369981; x=1692974781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4DVkzBRN+38yZsmh1dZsHoUQLIcrzKOhPf6Rbmk/OX8=;
        b=fukZzzQ1pEtt4jeEHJBztbjD9J0RlYPGomCFmuMqZ8ZwDm2grvdfPVSupxem6Z+ebw
         VhBJmZRwHM8rF37Y0Exdcv12Py382NL69yJsdhU3YwYICWf8Mh5vnBh3yudrk6IRYmLu
         Wb+NiU7PnW1CkD8rFDT4R+GmDbp6EcmS4yJgkI1lFXJ0YuXAYGwiR8ttfFay9tpmxVYi
         AuwaBl+9TPGVK0yTDz443F4kJ1Gn9EZFoO92F7OB0v4THXSoSj1bz9J4MtK38jJRiY+g
         bOhBbsYQCLuYN5P3D5WcmUsgWTciMog7IWG+TZIVc9znxSU05F5apjhC3A49GW5Z3BYl
         L3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692369981; x=1692974781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4DVkzBRN+38yZsmh1dZsHoUQLIcrzKOhPf6Rbmk/OX8=;
        b=EGQ7lE4k4GIsJgCYJX2pnZn/PtdaLpgrgXq4Wdeh8dEiDmYrEfurbJtV13e574B4F9
         /xGEpymrKHhgA85mtXYGUsz9LwjAWCgu2fDx9TlDH8lw2oF8uKeGFwofn4MypZdfSPLS
         FI2IA4btD1IKNvrfTYFXNEoG77iWXahKnzbGKRRGZ2ow7pgZ8GpQf9kk1H2bpfRDSqwy
         488KtD7obUl3i3raHFKiZ9VNGD/QJTtvyObM2ide8GvvPxKkb+k6AMC4BPACsEVBdChH
         FKZ64aaIiuTNkL+ixsNBAh/jp4S2gxr9cyNmCuxDhZeeMIhOMzls5cnMUeIQSjHKO1gk
         lbKw==
X-Gm-Message-State: AOJu0YwtsKrHnBTJWUI2LIePFtCYJQ/q/AHJizjh+/kkX4sxWbSGZC4x
	n1kzLDdYcGmAUYa8E0btVDJ3EFdAETPF7ovDbXI=
X-Google-Smtp-Source: AGHT+IG9A3EZuTK4jt2AzitS3BatLD2Wpf0nFxnZp7xUKP1slkXrnmyEz8AzUGcZTXprltaAxD7dIXavvJxXdtjPtKU=
X-Received: by 2002:a2e:6e02:0:b0:2b4:47ad:8c70 with SMTP id
 j2-20020a2e6e02000000b002b447ad8c70mr1939244ljc.11.1692369981308; Fri, 18 Aug
 2023 07:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230818105008.16113-1-dmitry.baryshkov@linaro.org>
 <3a0c57f2682fa8f1326be4f11ef4bad443cccf99.camel@linuxfoundation.org> <CANNYZj98KRAWHjoQR9BYib+N=ZS=2La+KxvaCMhO5b0b8QSgZA@mail.gmail.com>
In-Reply-To: <CANNYZj98KRAWHjoQR9BYib+N=ZS=2La+KxvaCMhO5b0b8QSgZA@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Fri, 18 Aug 2023 17:46:10 +0300
Message-ID: <CALT56yNgZH1KmcMXvUcnp=kb47X8PFMPDNYQLUnDi7QJ35vWmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mdadm: disable strace on rv32 arch
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 14:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186375

On Fri, 18 Aug 2023 at 14:00, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Upstream however should be made aware of the issue, so there should be
> either a link to the patch submission, or a link to an upstream ticket
> as well.

There is no issue tracker for mdadm. And granted all test.broken files
in OE's patchset I doubt that mdadm / linux-raid people are really
interested in these reports.

>
> Alex
>
> On Fri, 18 Aug 2023 at 12:56, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Fri, 2023-08-18 at 13:50 +0300, Dmitry Baryshkov wrote:
> > > strace program is not yet ported to RiscV 32 arch. Disable corresponding
> > > dependency and test to remove dependency on the non-existing package,
> > > which otherwise breaks building of core images:
> > >
> > > ERROR: Nothing RPROVIDES 'strace' (but /oe/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb RDEPENDS on or otherwise requires it)
> > > strace was skipped: incompatible with host riscv32-poky-linux (not in COMPATIBLE_HOST)
> > > NOTE: Runtime target 'strace' is unbuildable, removing...
> > > Missing or unbuildable dependency chain was: ['strace']
> > > NOTE: Runtime target 'mdadm' is unbuildable, removing...
> > > Missing or unbuildable dependency chain was: ['mdadm', 'strace']
> > > NOTE: Runtime target 'matchbox-terminal' is unbuildable, removing...
> > > Missing or unbuildable dependency chain was: ['matchbox-terminal', 'gtk+3', 'glib-2.0', 'util-linux', 'mdadm', 'strace']
> > > ERROR: Required build target 'core-image-weston' has no buildable providers.
> > > Missing or unbuildable dependency chain was: ['core-image-weston', 'matchbox-terminal', 'gtk+3', 'glib-2.0', 'util-linux', 'mdadm', 'strace']
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  .../mdadm/files/broken-strace-rv32.patch               | 10 ++++++++++
> > >  meta/recipes-extended/mdadm/mdadm_4.2.bb               |  4 ++++
> > >  2 files changed, 14 insertions(+)
> > >  create mode 100644 meta/recipes-extended/mdadm/files/broken-strace-rv32.patch
> > >
> > > diff --git a/meta/recipes-extended/mdadm/files/broken-strace-rv32.patch b/meta/recipes-extended/mdadm/files/broken-strace-rv32.patch
> > > new file mode 100644
> > > index 000000000000..a58495008605
> > > --- /dev/null
> > > +++ b/meta/recipes-extended/mdadm/files/broken-strace-rv32.patch
> > > @@ -0,0 +1,10 @@
> > > +Index: mdadm-4.2/tests/07revert-inplace.broken
> > > +===================================================================
> > > +--- /dev/null
> > > ++++ mdadm-4.2/tests/07revert-inplace.broken
> > > +@@ -0,0 +1,5 @@
> > > ++fails on RiscV32
> > > ++
> > > ++Fails with the following message:
> > > ++    strace -o /tmp/str ./mdadm -A /dev/md0 --update=revert-reshape /dev/<...>
> > > ++    tests/07revert-inplace: line 40: strace: command not found
> > > diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
> > > index fa50325f1f71..3085222061f0 100644
> > > --- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
> > > +++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
> > > @@ -126,3 +126,7 @@ RRECOMMENDS:${PN}-ptest += " \
> > >  "
> > >
> > >  FILES:${PN} += "${systemd_unitdir}/*"
> > > +
> > > +# strace is not yet ported to rv32
> > > +SRC_URI:riscv32 += "broken-strace-rv32.patch"
> > > +RDEPENDS:${PN}-ptest:remove:riscv32 = "strace"
> >
> > The patch has no Upstream-Status: entry which makes me wonder how it
> > was tested as this should have given warnings.
> >
> > I also suspect it may be easier to just write a
> > do_install:append:riscv32 that creates the file instead of a patch?
> >
> > Cheers,
> >
> > Richard
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#186358): https://lists.openembedded.org/g/openembedded-core/message/186358
> > Mute This Topic: https://lists.openembedded.org/mt/100817941/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >



-- 
With best wishes
Dmitry

