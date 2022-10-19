Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE06C433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 16:05:14 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web09.10098.1666195503418804405
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 09:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JKeOBITC;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id by36so22792477ljb.4
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 09:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UU6iM0kv7DOPidM27Dh4Wf2YC4uLTzr+NzQef3rmCE=;
        b=JKeOBITCiQb7E0lhfEK/aLTHpg71VydH0hKO0lWxopy0uBG4eVZvozfBZeKy47p9MK
         pCsZ5VBsc4Vo0IcrhFGH98d5q/SELtQxlZhWFc4FoRuOyuqZNVdAFCi44QFR3V0zEQCs
         Er88l3fl7tMXHoytCmphgjsyPXxzAJgsUCEkMsOhDjQt5KKuTgVL2SjkIzJHOGyXW1N3
         5VNiwAiqxF8zREpioOQrHRbylrFiNExYwFVSXyUgNYC15JFfVDNLBNt9YW87+idA8IPz
         29dsNJPp/W5Y3dO3ZA4Mm2Uz9yqIFmG7MYycaG1KyKJFWk6mQ0wLpPtpGyXzJPQSAyno
         I/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3UU6iM0kv7DOPidM27Dh4Wf2YC4uLTzr+NzQef3rmCE=;
        b=OtOrS4Htv/d1HKLCHlr3WzBbVFNuXvZNcCjFeJZTWjmVx2GzEuj9Uo21A3V16pUhkN
         3V1/c8d5cJhCzz7wZmNwkqHfZg/O+RPNvj3breA6jiCmcdKNdavh/RugzeXrPzaS2yTq
         SBoC6LhoSdlLa7yrj07Nss4l2s2/vTw4/S9cotKshMUvk/aemOqpfkZqhZaqkUjRf00L
         uLnqZVvLU9P0T1ya6yj4np1ACjQ1CBpiO7PmbO4AbYUNvBaFc4odSsM9JZdH1Yy2040o
         R/DINWnTJjdfCEXLlAqYHdafhltSaL0LC+X2IxAqnLq6oDRHIbM5Xd7MYEThHwbnnc73
         87Ow==
X-Gm-Message-State: ACrzQf2WtPwIBS4xra9CHUd94Eo3i4I2Xd764eXbQq/kDYxRXBZBhLPh
	AlgGa+cLhj1ST45s36WKi4MzP4OgvWdx4oaHpUI=
X-Google-Smtp-Source: AMsMyM4Y7EEyRBbYLHYENg6OwKW57j+NKusuhtRMOkjrwRipIB1OSQB3uAZ02uHm/TfB/mbutrsQwQzDWpaK7PBxeE0=
X-Received: by 2002:a05:651c:1950:b0:26f:e54b:8c54 with SMTP id
 bs16-20020a05651c195000b0026fe54b8c54mr3022249ljb.108.1666195500107; Wed, 19
 Oct 2022 09:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20221018230820.2385167-1-raj.khem@gmail.com> <CANNYZj-r7G4y3ma8NkrgmKm-vgoXjvMEWYAUh=bOE0z80DrxkA@mail.gmail.com>
 <CAMKF1srnBDVj5ig2ZF_fX+-UZ5jtp0U89uG8qE5cuW1SjX0AfQ@mail.gmail.com> <E6C978BA-94B2-43D9-9275-29EC0323CDC1@arm.com>
In-Reply-To: <E6C978BA-94B2-43D9-9275-29EC0323CDC1@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Oct 2022 18:04:47 +0200
Message-ID: <CANNYZj_f6tNzH-DjZ+R3Az0v3LzU7x9fu87+u+gwX9+QW0psEg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mesa: Add native patch via a variable
To: Ross Burton <Ross.Burton@arm.com>
Cc: "raj.khem@gmail.com" <raj.khem@gmail.com>, Kai Kang <kai.kang@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 16:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171973

Khem, sorry but no. We have well defined mechanisms for reuse, and
including bits and pieces of recipes from completely different layers
is not one of them. I do not want to hear even more complaints about
'breaking' things than I already do when trying to make things better,
simpler and more maintainable, and I do not want to be paralysed by
fear of invisible breakage in custom layers when doing so.

If you *really* want to make bits of mesa recipe 'public', put them in
a bbclass.

Alex

On Wed, 19 Oct 2022 at 17:29, Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 19 Oct 2022, at 07:34, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > On Tue, Oct 18, 2022 at 10:42 PM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> >>
> >> Can you show examples where this is needed? Custom variable does not s=
eem a good idea. I also worry that it=E2=80=99ll break automated updates (i=
t=E2=80=99s bad enough with mesa-gl, this might make it worse).
> >
> > https://github.com/ndechesne/meta-qcom/blob/master/recipes-graphics/mes=
a/mesa_git.bb
>
> That is, well, horrible.
>
> *If* we=E2=80=99re going to expose a mesa.inc that people outside of core=
 can use to package up their own random Mesa SHA then mesa.inc should just =
be the packaging logic.
>
> However, I don=E2=80=99t understand something about the patch.
>
> Why do we only need to apply it on native builds?  It=E2=80=99s a backpor=
t from upstream, so should be the fix.  If it breaks when applied to target=
 builds, is there a bug upstream for that?
>
> Ross

