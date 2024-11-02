Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F78E677F4
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 09:15:08 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.13836.1730538898139243103
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Nov 2024 02:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MQ8YSFNf;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so41555341fa.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 02:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730538896; x=1731143696; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCq96D45Tm8xvX+kciy6JiAjhUczJCypJgAiBVsFBME=;
        b=MQ8YSFNfk+g0BSgOX1kO87NEtUxqOOU3Wou/v99LTcQU32aSlSygT8vloFDE4y0BIc
         dPfItJ7Wisdv2/x4wjKg2hFXlMKJVLjzLlYMQuPVFN3mT8nkNLdW+jPMExyJS4xsPMXa
         Jvpd/bCVZONw4xQ4sv36ZZTPXuOyTBzVWjm3Pon81+Tj6InhACmxiYaUPFP/ivdno6WC
         EJtwu0Y8TLbpj1z4X5BVt/JQGYeIOQrLHheQ+DjgPuFpldnBuu3sc4n+oNEjCX1ZbGzf
         ZMAubqT8JYubeV4a+2ajqhfqr9b9+L53Arb6Z3QPnND4Pf2RfEZZigDBLqrofedCzD3k
         8xqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730538896; x=1731143696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCq96D45Tm8xvX+kciy6JiAjhUczJCypJgAiBVsFBME=;
        b=Oyzlgz3FH2ELnBbP1CJyXo9HmEKj+MqL6n5FlF5YxKPf97Ml3sAAsfMYGM2IIgOHlb
         CbVGAsiwPLr9VyU0JghPm0eExOJ5FByYlBy6tefgmiCLJv2GldvnkoYgVAYltYT9iw+I
         jviq93R2mNMI9JGPAuuMmU4zuTPPHoYPLcwobJjRzRTQ8prdBdDwZl8SE053wka1TkkS
         bmIHNBfeRf3rmSEe1KVZkAG44nZRLW0KBweMXTFEU2fXvKX9BacbaJagtENTvWKKiRG5
         sFhptos3CNCOdN9DzwM3469rPCzBEqS7X66hl51LRV1FoxmF5X8Qw0ebdZYmz0gf25ex
         2ffg==
X-Gm-Message-State: AOJu0Yx15EpCGY/vN0eFPkLd3XheasSW5OFp45sNDqItnkhMuBzIx3Ug
	D7mSwQQSE2wyrntzZskO2tJXMtuj9TRjKaY9HUNQs+0+55qtgYdzPUR7QfoaWfn3w4lXs5E3mjE
	cD55ANACMcT0r82quPX4hwLlCTOQ=
X-Google-Smtp-Source: AGHT+IESNidacrPHXF1BZ9TJBVcmtt6t4aIiWKVQWsl68tavO5/k2XRCpjergjYHgEUgQXZSHynWFchKWj5NvtrcemU=
X-Received: by 2002:a05:651c:1510:b0:2fc:9674:60b5 with SMTP id
 38308e7fff4ca-2fedb7cc8f6mr52687991fa.25.1730538895586; Sat, 02 Nov 2024
 02:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <20241101193811.2068211-1-chris.laplante@agilent.com>
 <CANNYZj-_8+EH51Nk2tj+o7a2PpscSO2bi8e-ak8g5fnUhADULg@mail.gmail.com>
 <DM8PR12MB5430BF49467783C0051229C68B562@DM8PR12MB5430.namprd12.prod.outlook.com>
 <DM8PR12MB54306736B03571231E94A9498B562@DM8PR12MB5430.namprd12.prod.outlook.com>
In-Reply-To: <DM8PR12MB54306736B03571231E94A9498B562@DM8PR12MB5430.namprd12.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 2 Nov 2024 10:14:43 +0100
Message-ID: <CANNYZj8rn3ocAAbCRYF-YKea8=DtVjcUv3vU+wbpCskzQ3JC=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] devtool: modify: add DEVTOOL_PREFER_BRANCH support
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 09:15:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206649

On Sat, 2 Nov 2024 at 00:15, chris.laplante@agilent.com
<chris.laplante@agilent.com> wrote:

> > I just tested 'devtool finish' and 'devtool update-recipe', and both ar=
e broken
> > (not by this patch) for recipes with SRCREV =3D "${AUTOREV}" in general=
. So I
> > wonder if devtool needs to be taught to handle recipes using AUTOREV. I=
n
> > which case, perhaps it should just automatically do the
> > "DEVTOOL_PREFER_BRANCH" behavior...
>
> Thinking a little bit more about this, I think I just want 'finish' and '=
update-recipe' to be mostly no-op in this case. When I'm developing a recip=
e under devtool that uses DEVTOOL_PREFER_BRANCH and SRCREV =3D "${AUTOREV}"=
, I'm just using it for the edit-compile-test cycle using 'devtool build' a=
nd 'devtool deploy-target'. The only helpful thing I could foresee 'finish'=
 or 'update-recipe' doing is maybe slap my hand if I have commits that I fo=
rgot to push. Otherwise, those subcommands are not useful here.
>
> Even if we take DEVTOOL_PREFER_BRANCH out of the equation, I think that's=
 also true for a recipe that just uses SRCREV =3D "${AUTOREV}".

I was also wondering if this new variable is really needed. Perhaps
devtool should just do the logical thing automatically when it sees
AUTOREV.

Alex

