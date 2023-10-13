Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D70ACDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 15:44:41 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.42183.1697211873324320735
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 08:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mbQ+O1J4;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6c4d625da40so1496269a34.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 08:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697211872; x=1697816672; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jyeva/01J1fXo3DpwsuEwr6kNnAiKGEYQny00qQTAU8=;
        b=mbQ+O1J49GMMbXXQkBEgX0qJi1tAUXTfSzhyrE75AgGowlrrPMUX1yA5eTEvsjwJqh
         GIlt35cgOHS7kRfOJBlphbDxuhDC9HQoFg5yCjdno39te5LlATSlRm1Kl031OKZIk6Sn
         JAkPnb1ZklJ7ic4hZ2DbjLMMRFC1fNeEhTK6xwyxYHM66dOqYY6WTgMqxNUupFbfUqZE
         ajcbN4B6q4cBsNApHQR2yIZBPDRuuAUEzIAZGKDbvX9u/D0EwmyP6wYiegcJfQfiLIFZ
         ABie7sMlNV58fdUchA/brAV9K5RrFOBNvuR8zDiD7EKE/LieHWohmSXGVHhE4YgY2MpT
         BGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697211872; x=1697816672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jyeva/01J1fXo3DpwsuEwr6kNnAiKGEYQny00qQTAU8=;
        b=oQsHA/pGe7n/tiqmOTCm7UaXDnhqKgE9xhkDggJO84kltGzuNaEF2XOvk6kAuoS1zD
         tIvHuamNb6F/VnxjKuixh859he6Sn5/uRyg15TnX28MszMJAIEwjdkElYPMKY3SXOEy9
         0rH207JqZx/Cvwfzw8kBGcvw65G/V38uMzdzrIy0JdVB3AjMGaHwuyhHHGYYxEvqQ/4L
         uEceRd4P4DlVHDDPRzYTshhq5bo5D+Dm/F/j+GTpXhJvjUFYg9F6/pw9kZWSk08bZBhv
         nwHv/Hhx/4YLW+Ue4l1ViKerP4doGlU6zz+ywc2AYa3Hbs0Xbsy1HxkdVH85omA8o1B1
         5OzA==
X-Gm-Message-State: AOJu0Yw8aGBmgKsNVROdGcZ9dhFRDCJBwhWGCTRKsfByKVyqkWhKAYAv
	2nktXcsDg5Yrw/A9ze0huRd6IeQAZU0sQ7bu2nI=
X-Google-Smtp-Source: AGHT+IEM7m7MjGRdwhSqTTo8qUorIaMxVuBIFh0U67pW8g96k8kE2kkPEniBR8Dc5O3ynAd6HOGsMf/jGbH4eky7LR8=
X-Received: by 2002:a05:6871:592:b0:1d5:5659:4730 with SMTP id
 u18-20020a056871059200b001d556594730mr36175934oan.37.1697211872608; Fri, 13
 Oct 2023 08:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <178D69637BC0FE4A.21112@lists.openembedded.org>
 <VI1PR0102MB3136ED4E889CF9917E846BABFCD3A@VI1PR0102MB3136.eurprd01.prod.exchangelabs.com>
 <CACS+7ZSSvH5=H0j2EENJ0wYR5p0rsGNEwWLyVYQq-++dfBjuSg@mail.gmail.com> <VI1PR0102MB31364AA647984179332621E5FCD2A@VI1PR0102MB3136.eurprd01.prod.exchangelabs.com>
In-Reply-To: <VI1PR0102MB31364AA647984179332621E5FCD2A@VI1PR0102MB3136.eurprd01.prod.exchangelabs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Oct 2023 08:44:05 -0700
Message-ID: <CAMKF1sq+STYJK8q1K6NmvpNtY0wyx-kVtWMAOe-w=FZ_w4b5+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] libtirpc: Support ipv6 in DISTRO_FEATURES
To: joerg.sommer@navimatix.de
Cc: Dan McGregor <danismostlikely@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 15:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189072

On Fri, Oct 13, 2023 at 2:55=E2=80=AFAM J=C3=B6rg Sommer via lists.openembe=
dded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
>
> On 12 October 2023 21:13, Dan McGregor wrote:
> > On Thu, 12 Oct 2023 at 11:10, J=C3=B6rg Sommer via lists.openembedded.o=
rg
> > <joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
> > >
> > > This is only a minor change, because oelint-adv had warned about the =
space after " of PACKAGECONFIG.
> > >
> > > ________________________________
> > > From: openembedded-core@lists.openembedded.org <openembedded-core@lis=
ts.openembedded.org> on behalf of J=C3=B6rg Sommer via lists.openembedded.o=
rg <joerg.sommer=3Dnavimatix.de@lists.openembedded.org>
> > > Sent: Thursday, 12 October 2023 18:34
> > > To: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org>
> > > Cc: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> > > Subject: [OE-core] [PATCH v3] libtirpc: Support ipv6 in DISTRO_FEATUR=
ES
> > >
> > > If the ipv6 feature for the distribution is not set, the package shou=
ld not
> > > contain settings for ipv6. This makes rpcbind doesn't try to bind to =
a IPv6
> > > socket, and complain that this fails.
>
> > > +PACKAGECONFIG ??=3D "\
> > > +    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
> > > +"
> > > +PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6"
> >
> > Looks like this will conflict with recent changes I made to master, so
> > hopefully those can be resolved automatically.
>
> I'm happy to provide a new version that applies on master, if it's needed=
. Let me know if I should create it.

Yes please rebase and send again.

>
> --
> Navimatix GmbH
> Tatzendpromenade 2
> 07745 Jena
> Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
> Registergericht: Amtsgericht Jena, HRB 501480
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189057): https://lists.openembedded.org/g/openembedde=
d-core/message/189057
> Mute This Topic: https://lists.openembedded.org/mt/101921995/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

