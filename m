Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FD2ECAAD3
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 09:34:43 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web09.5789.1662543280217712168
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 02:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=onylPtPO;
 spf=pass (domain: gmail.com, ip: 209.85.208.174,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id p5so2227898ljc.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 02:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=Q8Q/VgN9fYnBYZWVXjojz5EswbwjuZJ6C5kF/yC1NDY=;
        b=onylPtPOX0vqNZxv9K0LjiXwDOPsjsDB6TUXZgy9E5f/wGsyn1N2UGd8rOF3lCf0W1
         3WrB66zYHuqPCpOmXIl0yQSN9YrTLwy4zBeQtAIOfkFVnlhYxrFG5KWOlGdR3587MC3y
         ZrT7qhkLy1qpdCURJmVtvYb/wva6sjxclrcJoaJNdDgwDkuzLHCNIfrh9LF7HCHR9PK1
         x283mk/B4ngVc6XLBfMhg3OKYHHk1sawr2wiYJ14kT1Q8iOQawmaQdFjFI0aWNUQ9/w+
         7gGPfqTXefrH4WeGaIz2Koh6niXPlZmt2wzrg69/g6l2ib1qCNijAyQUS1kXVyAYSTAe
         DNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Q8Q/VgN9fYnBYZWVXjojz5EswbwjuZJ6C5kF/yC1NDY=;
        b=ZFAZZdz+JAYqhdQCKkvst4A9pUiLAFmDxDXQyFNTIK7pMZ5GrSFdtB+ihlzwP0CbrU
         +jz9Ka0ze3Qg3nxw3KVKXo9BLOWkX8gsFjAbbayiy68w5aS+RtPnT0SXuTIIFcD8N+KC
         GYFoSJSglmifsjs8yKusYtcDEENlO7pLfPR1rulif1BpfWQc1fe2uI08Yfm/YLsZEzEd
         qd9Hno6pPsk2Wriem9MLCdlRndfxC31LFuSkVAA6iZMcioJLKH9aZb/Ni4ryeiCMvOIy
         6jOR3enb4Qt7FzfrrsYd2KNSI6idVtou81I4o+cmFsjYXsD1twAvjdh7ufoFRtFq5Bw4
         k5BA==
X-Gm-Message-State: ACgBeo1LFRVRF4uQYb7B/7axIBRsXcjmOHYX2MWFtWkVTT7PRXe9iQ4M
	CCGI63QQtMAWPYlp+mz+ALgxF/gW+PNeJnGVZRE=
X-Google-Smtp-Source: 
 AA6agR4IdvDDovAFvHqD/aAZxcl2IWoOZg+ZXmXeal7vxwDWHV/s2XOjiZ+qe0s1Tw9m2hCkv5FhOGkRpXSZeZ9x41M=
X-Received: by 2002:a2e:9415:0:b0:25e:477b:adc9 with SMTP id
 i21-20020a2e9415000000b0025e477badc9mr674335ljh.109.1662543278144; Wed, 07
 Sep 2022 02:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220907071155.2807336-1-niko.mauno@vaisala.com>
 <CANNYZj-8LsBC3B0ubeGXfKY4bVS8==-x=SQc60DhXY3N13u-Tw@mail.gmail.com>
 <9de9c193-56b7-da1e-f4f9-d43a111de0f1@vaisala.com>
In-Reply-To: <9de9c193-56b7-da1e-f4f9-d43a111de0f1@vaisala.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 7 Sep 2022 11:34:26 +0200
Message-ID: 
 <CANNYZj92jmRd3SF19r=o8aUfgpOJPxAL=AOQW=7EWW3px484wA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: Add 'default-dns-fallback'
 PACKAGECONFIG option
To: Niko Mauno <niko.mauno@vaisala.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 09:34:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170382

Thanks, I think it's more clear this way. PACKAGECONFIGs that do
nothing when on, and something when off are harder to grasp.

Alex

On Wed, 7 Sept 2022 at 11:28, Niko Mauno <niko.mauno@vaisala.com> wrote:
>
> Thanks, felt ambiguous first about using negation.
> Fixed in v3:
> https://patchwork.yoctoproject.org/project/oe-core/patch/20220907092333.3=
248421-1-niko.mauno@vaisala.com/
>
> -Niko
>
> On 7.9.2022 10.26, Alexander Kanavin wrote:
> > I would rather invert this, and define 'no-dns-fallback', off by defaul=
t.
> >
> > Alex
> >
> > On Wed, 7 Sept 2022 at 09:12, niko.mauno@vaisala.com via
> > lists.openembedded.org <niko.mauno=3Dvaisala.com@lists.openembedded.org=
>
> > wrote:
> >>
> >> systemd defines a default set of fallback DNS servers in
> >> https://github.com/systemd/systemd/blob/v251/meson_options.txt#L328-L3=
30
> >>
> >> By adding a PACKAGECONFIG knob providing a convenient way to opt out,
> >> and then removing that value from systemd's PACKAGECONFIG, the output
> >> from runtime 'resolvectl status' command no longer contains the
> >> following line:
> >>
> >>    Fallback DNS Servers: 1.1.1.1#cloudflare-dns.com 8.8.8.8#dns.google=
 1.0.0.1#cloudflare-dns.com 8.8.4.4#dns.google 2606:4700:4700::1111#cloudfl=
are-dns.com 2001:4860:4860::8888#dns.google 2606:4700:4700::1001#cloudflare=
-dns.com 2001:4860:4860::8844#dns.google
> >>
> >> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> >> ---
> >>   meta/recipes-core/systemd/systemd_251.4.bb | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta/recipes-core/systemd/systemd_251.4.bb b/meta/recipes=
-core/systemd/systemd_251.4.bb
> >> index 8497e24af9..0f30b7dbb3 100644
> >> --- a/meta/recipes-core/systemd/systemd_251.4.bb
> >> +++ b/meta/recipes-core/systemd/systemd_251.4.bb
> >> @@ -64,6 +64,7 @@ PACKAGECONFIG ??=3D " \
> >>       ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', 'link-ud=
ev-shared', d)} \
> >>       backlight \
> >>       binfmt \
> >> +    default-dns-fallback \
> >>       gshadow \
> >>       hibernate \
> >>       hostnamed \
> >> @@ -129,6 +130,7 @@ PACKAGECONFIG[coredump] =3D "-Dcoredump=3Dtrue,-Dc=
oredump=3Dfalse"
> >>   PACKAGECONFIG[cryptsetup] =3D "-Dlibcryptsetup=3Dtrue,-Dlibcryptsetu=
p=3Dfalse,cryptsetup,,cryptsetup"
> >>   PACKAGECONFIG[tpm2] =3D "-Dtpm2=3Dtrue,-Dtpm2=3Dfalse,tpm2-tss,tpm2-=
tss libtss2 libtss2-tcti-device"
> >>   PACKAGECONFIG[dbus] =3D "-Ddbus=3Dtrue,-Ddbus=3Dfalse,dbus"
> >> +PACKAGECONFIG[default-dns-fallback] =3D ",-Ddns-servers=3D"
> >>   PACKAGECONFIG[efi] =3D "-Defi=3Dtrue,-Defi=3Dfalse"
> >>   PACKAGECONFIG[gnu-efi] =3D "-Dgnu-efi=3Dtrue -Defi-libdir=3D${STAGIN=
G_LIBDIR} -Defi-includedir=3D${STAGING_INCDIR}/efi,-Dgnu-efi=3Dfalse,gnu-ef=
i"
> >>   PACKAGECONFIG[elfutils] =3D "-Delfutils=3Dtrue,-Delfutils=3Dfalse,el=
futils"
> >> --
> >> 2.35.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#170370): https://lists.openembedded.org/g/openembe=
dded-core/message/170370
> >> Mute This Topic: https://lists.openembedded.org/mt/93520181/1686489
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>

