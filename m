Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BFDC05027
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 16:49:44 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.793.1678812574389035622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 09:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wxh2s1Xt;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id j6so4486567ilr.7
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 09:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678812573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZXW1K43XI6Zg8rsN08LYpuxQDatk//KzLAzJwqGM0s=;
        b=Wxh2s1XtfWICGnGfxT5UDtAGp3JwsMrfUaKIoA5Ns/CsGbsNE3P68r3Sq/m4Sw1w8L
         2VQJpmiftvAQvAU5QifEgjUde0xR7GHNffQDtypMe+PAqqzB+whG1rBWvDjlrG/n2URw
         r/6q5zfxK3+JmZZd6APwDNsrz4heGaxVZnSHcQ9kkV2nN+j9ifBSHUBQXmV8cw6CCwpB
         4hrjZY1ZW4x3rXRuzP63gSEy92yemz3DamiDhA6qha9CyPP5HcrOe0aP1ALAGJp6+tOl
         lS11mh9rvyX8b2lBbsGR0sxAP/f7gFOpX484vnQzfRsKlm1PP/vKgMnizcjUTKNFCCSZ
         JmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678812573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZXW1K43XI6Zg8rsN08LYpuxQDatk//KzLAzJwqGM0s=;
        b=Gnlhh93BjG6znJLxHvi2OZFMkMGW/Auv7o38ay7vFQhuEk7suLAPmPFyRs/Evne3+d
         b5vHXKJVqCR5CfYyprbPSgFZaRqhCL7++CyDv+4+MGo6+DFxhTvaRTaPP96hl5VY+PjD
         n2DJcHI53Vjxc8zut5SzF9ChajElw8G3C1F8XklJnOQaIvVxk/4Im04UH3Sk41W2KypX
         +oKEQDB76YeQq9c5N1jEQfxlaXkPoZiKao74OfYlXkCDpMrZyz3ALF3dY50O7pcxiSXS
         7MEPHmLGUNEcki58fxj6QLHDLGYoLkNULuiWZMMpXbAe3LntfutBvrhUP8v+7pb8f1sA
         DGyA==
X-Gm-Message-State: AO0yUKWL/Kff3fdW7KgGRQGc/nhlB4rTBZwuupJYiJfXlq9gVPY0NecI
	Ghryq5a/Vgcyd+KzN6KRtL5WP7ln/3e0xYLq7sg=
X-Google-Smtp-Source: AK7set9VexqVXRGyPcqg6l4fSm7E3gBZuWugHQ7WXsv53NQxSEvWNfnFFUhd4HbphM1oRk+e2h64tRpgRy8kMF3rdA4=
X-Received: by 2002:a92:da8a:0:b0:313:cc98:7eee with SMTP id
 u10-20020a92da8a000000b00313cc987eeemr1928854iln.1.1678812573682; Tue, 14 Mar
 2023 09:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230312065517.61051-1-frederic.martinsons@gmail.com>
 <CANNYZj9ah1rO9FH3a_m2ftgrDik_NtcLa_15r6+sqD5iwBXsiw@mail.gmail.com>
 <CA+cAkeqZjC=L=_v-3K4VDtdWKxc3crDaqfwp_30B9KFAVrfJuw@mail.gmail.com>
 <CANNYZj9vyfkez+iL-EeeV0Yb3o1Fz9FDrbz+ZRjg5EjUHiAisA@mail.gmail.com>
 <CA+cAkepYqf_hJWe5HBpKcJrF37P7V81AWCZJJ_tUYtBH=BqHqg@mail.gmail.com>
 <CANNYZj-srm78_c6abE2WX8L6gGqW=GM0uqUyHiMkVmO+t0ZWwA@mail.gmail.com>
 <CAO5Uq5SaqUHzS93eyki1-3OGK2w_tGizJZmHMrJKGx5LdRZryA@mail.gmail.com>
 <CA+cAkeqLOVAT7bz+HXKyC7=vwyrRAfE76buQ7C9cog6WQ6k1gw@mail.gmail.com>
 <CAO5Uq5QnyWqi5_CaX7sHTrewVRhvT_SKdXTY7PvKe4dPryCQ6w@mail.gmail.com>
 <CA+cAkeowE7BUYie9rdFPpJ972DHK+d3WGXLKFPAKcYcVYy_AXA@mail.gmail.com>
 <CANNYZj_xAGD8x9=axLxDuEpaJF2K2yLUVH6VO1j0i5tKSvPi=g@mail.gmail.com>
 <CA+cAkeoP7ScYgbRG3eV1RR5R9bqEXm1b3cw7_gASG4uhJw=WfQ@mail.gmail.com>
 <CA+cAkerKf8yyHraJxWOyAQp91tVkgs08LSX4f3Navu1qJ+tV6w@mail.gmail.com> <CAO5Uq5RSduyH-4Rhxzn=L3yS+V1ogM5GNoakbP-sHB9w0Www2w@mail.gmail.com>
In-Reply-To: <CAO5Uq5RSduyH-4Rhxzn=L3yS+V1ogM5GNoakbP-sHB9w0Www2w@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 14 Mar 2023 16:49:22 +0000
Message-ID: <CAO5Uq5TQ8rpDc=m1UzXM_SwT=WD3Vvb82Afc4BvZ+L0crnvQaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 16:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178512

On Tue, Mar 14, 2023 at 12:22=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail.c=
om> wrote:
>
> On Tue, Mar 14, 2023 at 10:25=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > Moreover, I think we should add the `--offline` option to cargo build
> > because the error generated will be more clear:
> >
>
> Let me chuck that across our code base, I was fairly sure I'd seen
> different problems with it, but it may have been whilst I was
> debugging this first time around and am mis-remembering.
>

I'm wrong, seems to be fine.

--=20
Alex Kiernan

