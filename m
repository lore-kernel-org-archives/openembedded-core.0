Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7F8D41D74
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 11:35:54 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46574.1765798550965889249
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 03:35:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MGODeFry;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-88a37cb5afdso9364506d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 03:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765798550; x=1766403350; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Xr+w7dpz9FVfnRMsuWMpcgV1HwkuBx3EKsQPvxCbLE=;
        b=MGODeFry6rn2QFMA9UALIM3vD7x7We8JYe0gzWTsRMPDyqtK5kSfg/x7nYT3QzeUP9
         pu9uIubG7LUTa6xA8BoXItIoaO57QVxqTFzUaKgLbl0QYIDmJrzfKoaT7jpSnlzpJ2Jl
         7FObVwv1VvB/mIkleqainEK5BtGQGSyj3lnUtYoGgYDJj/k8CuR1uIouvE5ePaqeGm+d
         7m9jYR3quY31kGH2cReQPYpriYUte8LqTu4zlVEcIJN4PN3lw+XFlF0S4q4Z+DclTNvV
         6GgLDMsjoRSMB8YUAHs3AmFsWVazkcdnrEWmcvG8a8bOGh3kwMXeVNPS2pCs7V5773bG
         RoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765798550; x=1766403350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Xr+w7dpz9FVfnRMsuWMpcgV1HwkuBx3EKsQPvxCbLE=;
        b=sxTFzIydT74KZf9M5wdB1ybMVhHGELEyhJhvZ02kA2jVa+Kd449xlPSf0p6kY1XI7b
         miyHqb8EazIVo/kLTEWMC6WRF2cVuwUnXRTUCpLtogRnJWxVZugrPdjjciWLditeh1/6
         R3B+K8Kt9IINJ/6iXEJ7mQey3459hBxkN2J72L/ci1QY1CNEKy9thLofJEX1jxhSnMoj
         K11p9CoR8Ct61YqMhbMsRBlaZzaCoXoBw8dhIRvt0FTIHs8jsGxLFj3rNkT8qGs+B8rk
         oDFfkmDInmXppsgZM88WBZP3ch1aSYk9h5YbmXrHQGWKZyr21EYqZWUD3JuIN5dVyojp
         MJyg==
X-Gm-Message-State: AOJu0YwNbFfva2wK5oI+0DD3K1mL2Q0XE1ft8pLP0fMlwR/HTnmeF65g
	YLH/V2Qb8Hh+uV/km+t8uvssQ70KykpGEHNgBcak24c2+8fS0gTzlDyVTKH8qcQElSDKZJnkqPZ
	FFiMPMjsaAL9tDbOFLSzC+iE2aujfDpUidVTF
X-Gm-Gg: AY/fxX62n3apymarHyVMoeiX2vaLegn7NU2YJgd4e6PBo4DN5N4zI4KAkpndL9rx1Dd
	w53RP3TBNnb0I00+rfRfnOZqo5o0ybOZFG5RyGPyURNrSgYQeKDTUyz8jHI1P99txnqFqvk1kUc
	40lG5gGHQ0C61DS/CLukKlnoTALpt4/lgFlluUdFrrbtG3V3L+YzlQbXkNtExXtCBdqiVGoQDnQ
	mTL/bRRvDYygYgzaNCSqQTOErTe3c9FklSFuUjGJvL89WmYSe0GcMoWAZctHFJqo0bS4wFIJq1B
	K9AfHZZ/IKIGL26bqYPaarD+H8fYENY2DaegjnKY
X-Google-Smtp-Source: AGHT+IGijZ67CsV2hk6JC0d+LD3nu9REiD0dbW3iAqVCwhQNlL0ekRWpWsMSXjNr0wtl3PtkblSeA0BtqKPnF5J+UGM=
X-Received: by 2002:a05:6214:d67:b0:88a:2ed6:252 with SMTP id
 6a1803df08f44-88a2ed60350mr60955436d6.5.1765798549848; Mon, 15 Dec 2025
 03:35:49 -0800 (PST)
MIME-Version: 1.0
References: <20251215103312.902774-1-corentin.guillevic@smile.fr>
In-Reply-To: <20251215103312.902774-1-corentin.guillevic@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Dec 2025 12:35:37 +0100
X-Gm-Features: AQt7F2ozlSrMGIeZ0fZ2ugJhPaEwZQOewSGqnqHaDX9tKX0GdIdjs9qEo-t42tM
Message-ID: <CANNYZj99ijSrB2C+Wu3W+aVZ1paxx87ZgFL0parXzsYCtzwNfw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] oe-setup-layers: support inline URI
To: corentin.guillevic@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 11:35:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227729

On Mon, 15 Dec 2025 at 11:33, Corentin Guillevic via
lists.openembedded.org
<corentin.guillevic=smile.fr@lists.openembedded.org> wrote:
> +    if 'uri' in r_remote:
> +        r_name = ''
> +
> +        if 'remotes' in r_remote:
> +            if not 'bitbake-setup-uri' in r_remote['remotes']:
> +                r_name = 'bitbake-setup-uri'
> +            else:
> +                idx = 1
> +                while 'bitbake-setup-uri_{}'.format(idx) in r_remote['remotes']:
> +                    idx += 1
> +                r_name = 'bitbake-setup-uri_{}'.format(idx)
> +        else:
> +            r_name = 'bitbake-setup-uri'

This should not be using 'bitbake-setup-uri-xxx', just 'origin-xxx'.

Also I think it would be more pythonic to avoid incrementing an
integer by hand as shown here:

https://stackoverflow.com/questions/9884213/looping-from-1-to-infinity-in-python

e.g.

import itertools
for i in itertools.count(start=1):
    if there_is_a_reason_to_break(i):
        break

Alex

