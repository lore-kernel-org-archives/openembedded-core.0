Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B09CD98F8
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 09:07:24 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38867.1781860039823353368
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 02:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rKqUbE6w;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4908b92904fso23960975e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 02:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781860038; x=1782464838; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YVfuh7WKbqbyipvqOlUDfemCf4kizGMG36D1ilQ4e0=;
        b=rKqUbE6wEQPpszBH5KlXj5t7i7gSWQ0O/PfQbgPmRCQVzZKgCBj/hfuTqRQfVQfGlp
         lB9nEmMaSCB4+bnSXkejD5AGUZZBbFn7mEGwTbJlRCiu52sEPbQvpTMHSs+jYr74MFXf
         +O98Nb8Mjp6oaaV8/tFC2vt8ICnOUuRuh2oYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781860038; x=1782464838;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1YVfuh7WKbqbyipvqOlUDfemCf4kizGMG36D1ilQ4e0=;
        b=DD41suOgzgW0apcvtZpPTicgcP2yjfc/Yl0hek1sHZL0QBjbHN1LpbTXJZH4xavuvz
         d+3lzx/idRosuasdDXGRv1NvcDr/M6acNn6TFWi78s06NLhAALSudPlxedeyCXuB/NCn
         bLmVZgkI6yV5R9OVM6ppG/sHhQih86Jdt0qkChI8dTkWhj8fCQfpze4icfE+trFpWUm2
         4MU7R6v9cg9JYIeLkhNfYjXBpgA/CHpLrlzyMyggaA8fTIqKDNtau27QKBAfjUhONcvV
         A5WTWLmWRY8LDXKuMBryb4L0D2P9+o04P0wte5cTihO8vJ52PEIt1UuZw4mQhd79PbbW
         gMtg==
X-Gm-Message-State: AOJu0Yy2H4yHX+GqdrxPjmLvwoxSNIAsXXcrJrqceJ4/s/kgg/UnFZbA
	AFUa41ngn35IBUkQeuQPW0Q7Fxq5Y9qiGjW4VIPtG/Eioa8EZfQP9eki3+W1/cMLu6k=
X-Gm-Gg: AfdE7cmfAwsGrzkAvt8kopELcrpPPZIeADuUUnja6rKSkR994wCxIUfNh3mItDWWPJ0
	sKAACyRfQ64pgkMuQJyRvdaA7+TN76OYn5KR6SoWANk6bmzUOStzcqgt6sV7Ck7H7/63uR2z4fv
	V7tEyUykCLL78hBwXwyMBVrVNLyZkaUArM2zuDwv+VQKYisCAb+DwJrf3WOuW30ff+PrSqg37nq
	9PArWyKwuwkXL+g5eDSiKQqAmqz0D6T+BXoD9+iNaZjOr2owg8MWZwx/+c3pStwlFga9UZGicTz
	/wSpnrc/S7Gmik4LIWc/85mhEoa9xJWg6HghUIwXNvVwDnFpELQUXghZIKaW+FXB+iHMErA/Mlj
	QE+3FkI57EAWhMI4X3C2YuPkvLz2da19N5APCj7wV05hKQuzjSmU1DjPUch2IrwF7j+w64MpeGM
	6m/ExsorPChEstYBEouCpchuOilQ+LRJPoaJvIy6VcF4/Pd5UejAsviey1qDrh295X4Nu0CQvGV
	JZg
X-Received: by 2002:a05:600c:a40f:b0:492:432b:d78b with SMTP id 5b1f17b1804b1-492432bdad3mr19963525e9.15.1781860037875;
        Fri, 19 Jun 2026 02:07:17 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fcf74b4sm56102665e9.6.2026.06.19.02.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 02:07:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Jun 2026 11:07:16 +0200
Message-Id: <DJCWO0FKMMJQ.257GXC23HD9CC@smile.fr>
Subject: Re: [OE-core][wrynose][patch 2/5] scripts: Fix typo in
 pull-spdx-licenses script name
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>, "Antonin Godard"
 <antonin.godard@bootlin.com>
To: "Vijay Anusuri" <vanusuri@mvista.com>
X-Mailer: aerc 0.20.0
References: <20260618070328.650509-1-vanusuri@mvista.com>
 <20260618070328.650509-2-vanusuri@mvista.com>
 <DJCV1YSQQZEZ.2A0D7446B7SLQ@smile.fr>
 <CANQUz1_g5aVAWkP5U1f=fEBz-4v9B8FM1nPv=Ua6=77PSHCu1A@mail.gmail.com>
In-Reply-To: <CANQUz1_g5aVAWkP5U1f=fEBz-4v9B8FM1nPv=Ua6=77PSHCu1A@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 09:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239154

On Fri Jun 19, 2026 at 10:51 AM CEST, Vijay Anusuri wrote:
> Hi Yoann,
>
> The reason for the backport is that we are upgrading xwayland to 24.1.11 =
on
> the stable branch. As part of that upgrade, the license was changed to
> include X11-no-permit-persons by commit
> 91ecfdcc1da3fdfee670244c90da0ab4eb296453.
>
> Without commit e0f53fa1d09bd175766b3fa1582794ea008f4e1c, which adds
> X11-no-permit-persons to the common license set, the build fails during
> license validation/compliance checks when building xwayland 24.1.11.
>
> Therefore, this backport is not intended as a standalone cleanup. It is
> required to support the xwayland upgrade and ensure the associated licens=
e
> metadata is correctly recognized by the build system.

Sorry but I don't understand how changing the script name helps with
what you said above.
To be clear, I only have doubt about this patch:
2/5 "scripts: Fix typo in pull-spdx-licenses script name"
I took the others in the series to the review series including the
licence updates that are needed for the xwayland upgrade.

This is a work in progress but you can see what I intend to keep of this
series at the bottom:
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/wryn=
ose-nut

Would that work for you?

>
> Thanks & Regards,
> Vijay
>
> On Fri, Jun 19, 2026 at 1:21=E2=80=AFPM Yoann Congal <yoann.congal@smile.=
fr> wrote:
>
>> On Thu Jun 18, 2026 at 9:03 AM CEST, Vijay Anusuri via
>> lists.openembedded.org wrote:
>> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
>> >
>> > Fix the typo in the script name since I can't unsee it now!
>> >
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > (cherry picked from commit 2776008404eebb58bb24e02140ed18760492752b)
>> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> > ---
>>
>> Hello,
>>
>> That kind of cleanup is not generally suitable for stable branches. Is
>> there a particular reason to backport this?
>>
>> Thanks!
>>
>> >  scripts/{pull-sdpx-licenses.py =3D> pull-spdx-licenses.py} | 0
>> >  1 file changed, 0 insertions(+), 0 deletions(-)
>> >  rename scripts/{pull-sdpx-licenses.py =3D> pull-spdx-licenses.py} (10=
0%)
>> >
>> > diff --git a/scripts/pull-sdpx-licenses.py
>> b/scripts/pull-spdx-licenses.py
>> > similarity index 100%
>> > rename from scripts/pull-sdpx-licenses.py
>> > rename to scripts/pull-spdx-licenses.py
>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>>
>>


--=20
Yoann Congal
Smile ECS


