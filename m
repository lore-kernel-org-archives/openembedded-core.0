Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB390E70700
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 09:51:19 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.12303.1695289877150616912
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 02:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DJDDsLKZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c00c0f11b2so11583001fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 02:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695289875; x=1695894675; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsc4m2HwpZqV5TRytAVbFjEM7LpMh1mujW6cApbj9sA=;
        b=DJDDsLKZvt05uCM2Ndrm3aVpEI9GsFD/ugDRQwD25kNbiywmZlWjGCNfvNF3K+Z8Rc
         pmaRoaQKYEyJR0vvteeHzwzHIMZlwEIRFQLnL3xsxuwXMkcga0BehT95Bf0giVUUXocY
         Bwmy36Ch7kmx1DNqxypQ86qS20+tV+1y+UQTGJ//VuyLKL7J7u6ZB96tl3FCQYrMHHBZ
         uLl2NliVm7LAyjnVlCTLKk/SaKkchlqJnWvyFgo5vQ+O0yshq1ZIRCPmE8PieWBRSoZk
         aECdHBaP/y9GjAoA5Iqs+6kSqxTBtR0QBrV5+jz5tPUHzFsoe8HYWeWvY6ATD03t5TTG
         Oneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695289875; x=1695894675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsc4m2HwpZqV5TRytAVbFjEM7LpMh1mujW6cApbj9sA=;
        b=Q6fkokWtie7XddIIlRavhIEuu5itWsPGk6WgMJEYSJmFLbidAEFPQSaSzvUoNfl226
         4QkxWBjOpZvOSl/dvd+IrzlEcIwQUnCrgFyxktva02mzXu1lmKOsfb5HkVlhvzviWVTi
         WWar0Ktddgnn0vM1nySxE65bNErXx6Pc7C3hFynwdRTIL6tAdBXxR82st0KUO4qMdDCu
         5+aZe2r7zyd1bGcFqcAi65sLLnHTkJlRxjNM1Nm8/5fZmoMc+cITO14zsAPtKGy0aUuC
         j7CWD7t4GhxPQnyiv8gLem0xQsgTmI9wYIRSxDrq+zzQc84FMnRxOjq5VJ+XkrT/6tvb
         qafQ==
X-Gm-Message-State: AOJu0Yyq71CMAMbFvqKDST2/fD5wK1ke5KTWr24TSwFQp3jqfLpioT6k
	x2AA9+QGDuviSYIGBV2Ya/fhCRZRSOy58qkanVg=
X-Google-Smtp-Source: AGHT+IHqtLKbYg1NqggQRTxLKtusSt5X76lLp3TYDVhjHyZ2SBiXilkWeDhN4NHnti1MofeqSweTQvVHE6ziogBUYds=
X-Received: by 2002:a2e:97d8:0:b0:2bb:985f:8479 with SMTP id
 m24-20020a2e97d8000000b002bb985f8479mr4332492ljj.48.1695289874793; Thu, 21
 Sep 2023 02:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230921064727.1260198-1-kai.kang@windriver.com>
 <CANNYZj8wjdTa=thJu9sKzjnvmofbYx7xCHTOz-azeccq=0PFfQ@mail.gmail.com>
 <f43296e9-d416-8697-198b-fd24a491f0f9@windriver.com> <VGUB1S.EQNLFG4U297D@t-online.de>
 <CANNYZj-Hv9fRO4rVW4h_R3DdHiNPYQUeQuRcvVdKaBMoYrVqmg@mail.gmail.com> <3SXB1S.VJD0PU0SDSPS1@t-online.de>
In-Reply-To: <3SXB1S.VJD0PU0SDSPS1@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Sep 2023 11:51:03 +0200
Message-ID: <CANNYZj_zWqLUdoO7PNWJU139y4T6icZeaFOfxUFVK1D-PzihBQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] adwaita-icon-theme: 43 -> 45.0
To: Markus Volk <f_l_k@t-online.de>
Cc: Kai Kang <kai.kang@eng.windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 09:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187986

Markus, please. This is shotgun debugging. If you'd like to help, it
would be more productive to take the patch and build it locally to
have first hand evidence of what is happening. The failing test
doesn't actually require a heavy rebuild, as it works only from task
signatures.

Alex


On Thu, 21 Sept 2023 at 11:45, Markus Volk <f_l_k@t-online.de> wrote:
>
> GTKIC_VERSION =3D "4"
> this line might be added to use gtk4 update-gtk-icon-cache ?
>
> and probably also the DEPENDS line could be removed ?
>
> On Thu, Sep 21 2023 at 10:40:49 AM +02:00:00, Alexander Kanavin <alex.kan=
avin@gmail.com> wrote:
>
> On Thu, 21 Sept 2023 at 10:34, Markus Volk <f_l_k@t-online.de> wrote:
>
> Maybe it is somehow related to ${prefix}/share and replacing by ${datadir=
} would help? This fixed an issue I had with gnome-themes-extra https://git=
.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=3Dab1f6ee8bf=
4835fabdf02cb0e30b20e4ff11e5fb
>
> Things diverge much earlier: - 'adwaita-icon-theme/do_write_config': 'cdb=
1f880efd08a498798793a1cbc51e48272a71b2ec48b71f263b7af9c8b8ca9', + 'adwaita-=
icon-theme/do_write_config': '690686d4d2721c21520f4736e3718e414f70366bea48b=
2df805b37a6a5193a1b', Something in that task is contaminated by target-spec=
ific value. Alex

