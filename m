Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D625CD6E57
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 16:09:41 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24202.1780502979023816468
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 09:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Nphumex5;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-660456349d9so6113929d50.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 09:09:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780502978; cv=none;
        d=google.com; s=arc-20240605;
        b=TtOxBOejf0YFPKeczyaMT7A36jdarSreuwGH6nftj1V34cZbtLwtT8zbL98eXyEeFt
         60TVpV0Bxy77qaY1dZGQLCFgHlVQGpz0QSKD04xFzAG93mlYpwqPV7lMltwNoGfQT1P0
         C/izrbYts1OKtXbfmcyf/269hzcioddyPbij3+c4fprLfXLLgBp1ECcPiQb1pvQ0nSel
         68LT9mQ+tBVRcyMESRJJ9PuzNkvwwG9gh78pccKFILbNbRJr4zvVn/VDxl1mkpHZtUCW
         96+GkDzkBHziwZxjsDwRfo9DUxNFpdGQJk0y/SENlUSIlreWgdTLf3TzsEEmuSGBAc4J
         QOcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UrYBUUTmLk2LS6eeiLv+dUTqK+6D4iIiH5wau7ej4y0=;
        fh=gW7nMd1utvq2RLz88DQRi6n8hSAWrxwvLMsyTsEy40s=;
        b=gmg8xGEQdqLlfrhiDlIJ5RZ4UDZQZJxZSvA8LZFmB8wmvA8ZBIMVhdd5Z/HqilAi1O
         xC7+emv2VvWme4eyRjDKPYzyMxBrvkCTNqV/qR4xyyWbvn8EM6P4KHn2xq+GCkuK388W
         YRzKkZ2XMDUz36J29S9s6nXNQqR1tcNoxTCAOo8Qk+rCIEz1VJd/IIZNcK13+4WoF1We
         OWvl52/iDTtqra7UnwhsX7AypxX0QXP+28QR0aorXs6D2VwhZyCdDpBRHO2TtsSjrhEi
         SITDrxeIDXvQ1SP3HO4a3vvJSZZIyRnTs2oesbC7RZgZZRhRecIC1KruqY4yeZkbdDrR
         TFqQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780502978; x=1781107778; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UrYBUUTmLk2LS6eeiLv+dUTqK+6D4iIiH5wau7ej4y0=;
        b=Nphumex5wPsnEWU/NUecPIb21CDNcuWMSGVaS5wiL+Kn9wd3MYqv+JnGF6/Uc2aMWx
         uBa0d9OE3ULqN1nJwCOt+uXYJYZ49f0wN3BNz49m1XGMqj1EtIHqgPJ9omJK/rSmvmVM
         bX7BCRSJfry0SL2/mLTFSeC2/KZD8ISs4mMefluQaB2u8wwmB1004dVmDNPUFB/58YOR
         PjepaoV4+jGbkUl2MXF1evUrQDCG2KwdQYx77XtnV9gvrys49+2KXDPljx0+v4phugn3
         OyjQdk6EuTvEZ+HrJoGynHpUs0F+BPnIyD2lSE33OJqTcz1PRRrLKAfYxFsf5pQOU2Za
         MJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780502978; x=1781107778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrYBUUTmLk2LS6eeiLv+dUTqK+6D4iIiH5wau7ej4y0=;
        b=fTH5ZbkdPRMwEn3cAqBmrA7wxRkmoKH83DmXu27eIxJMRwUy6Yk4qCKrLiFVqN7lQT
         OP3OYO/Slgg+ykLOL34LaoFXSrkRKCJbPqfxk6z6iKTC7h1eMXM44dVII3YBtsCGHn4H
         RkCSeifpUyR7suPuM4Vzd8oDO0P7siP+TzTAL+ta643BRwvAOrlKE0Q/RCUdkm35iSmb
         ThdQneAlgD8vMVFibOUhB14imBWqdx6GIWvYl+y2BYiZOkzQcvcJnJD1fHXL7XC0Q/SS
         +UKQEO6oBCyjQi2F6U3saT+g1PkzUXhWuGSGhA7Nd05T7DDZo/FizULYnh0h8QJV9vJC
         hN5g==
X-Forwarded-Encrypted: i=1; AFNElJ9d4bnKoEGpU4rwaheDCG2a8MXVmH7qTQ4g97Aiu2zzW1sA3/leLk0BWkBnJ7+aHRWJY1aAgQ79D0foVWw0KYZgpQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyWZ92PrfwxdQqTavnu9jCNUsm7j7xj8CdT2hzj4Ci9cV2xHnSY
	wCtZnj3gkIy9UE/0ebPcgJcHKHi6oaxGtsHn1Wcv7JbevSnx2wilOfd4cS8iQpd6l0rOqu+84aY
	iamflvDDvKPg59cjabrpC+oMNdYy0gq4=
X-Gm-Gg: Acq92OHtpCBoFb7A7KAEXTzJfJgLEeVIC0mkI86Uyx+aoBsv7QosqT/sDL539X7+BPY
	CYc80HbFW+rfv2F8MDieDSwVKTjfBG/NKNflErKqTi8O+ieJPxYg2N+Ts2OSAlg7glCPcTmelZ0
	7sKgCcVntSq33l3T6FRLJXLJaKPXVYljEVih2W2/lR2GMI/7CMQQ5EYGAbT2Gjl8pGiNFcPuBIL
	W9ySwwGr3QDo+l+R2VY3ZTv0au8WIF4Ml/c00sWB7pao1jexs3H9a6ayklVgATUnAikqrwCp+Xs
	JQp9mUMxFj/m2a6/M9BpJk1FpouVaBkxQTgCoqxowLl7PuHb8qEReDe6R3jN+Q3As6mLgEhr49I
	AcDiCHQ6FzDs88UepqK3UBqjib7fAYNG8rz3paiGXopJ/CYQGfpOimHsTt4vNPKQdygsYhHDu33
	LAs3lfLn9tzBwn+r/G
X-Received: by 2002:a53:ea82:0:b0:660:7865:9bc6 with SMTP id
 956f58d0204a3-660dc504768mr2817400d50.51.1780502977815; Wed, 03 Jun 2026
 09:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260514133748.219486-1-ross.burton@arm.com> <CAMKF1soV8G-LLutq=9Ba-pkz=XyEJ=5812eQnaYOP834pvBNDg@mail.gmail.com>
 <8FD4DA19-AA50-430F-9B77-0B79D6E70F26@arm.com> <CANNYZj_2Ky4KYra153oe85KSArHOe5Uawi4aK=SZe+-c5zvuaA@mail.gmail.com>
 <77901880-9008-468E-9FD3-07408FFA9310@arm.com> <CAMKF1sopgUP2e=_GroM9H4WWZ1TBdViLx0egROwhYYBiM=4YVQ@mail.gmail.com>
 <E1BF746A-2230-46B2-ACC0-E4A07E631EC6@arm.com>
In-Reply-To: <E1BF746A-2230-46B2-ACC0-E4A07E631EC6@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Jun 2026 18:09:10 +0200
X-Gm-Features: AVHnY4KZXr9OJXTrAPkvYi11O_u1LN5Ndjci_DTkZvsArdI7unxi9dHBUl8du8I
Message-ID: <CAMKF1soOOXjtc6e_4LYnA03XtS5HQiEQJ2w5_rdGKKkCCUSCig@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] avahi: upgrade 0.8 -> 0.9-rc4
To: Ross Burton <Ross.Burton@arm.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000083a92706535ba791"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 16:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238100

--00000000000083a92706535ba791
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

all good.

On Wed, Jun 3, 2026 at 2:56=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> wr=
ote:

> On 3 Jun 2026, at 12:38, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Hi Ross,
> >
> > Do we know if other distributions are already shipping 0.9-rc4? If they
> are, then we are likely in a safer position.
>
> Gentoo has -rc3, Arch has -rc4, so we wouldn=E2=80=99t be alone.  And I r=
eally
> hope that they release a proper 0.9 before we ship our next release!
>
> Ross

--00000000000083a92706535ba791
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">all good.</div><br><div class=3D"gmail_quote gmail_quote_c=
ontainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 3, 2026 at 2:56=
=E2=80=AFPM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Bur=
ton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 3 Jun 2026, at 12:38, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; Hi Ross,<br>
&gt; <br>
&gt; Do we know if other distributions are already shipping 0.9-rc4? If the=
y are, then we are likely in a safer position.<br>
<br>
Gentoo has -rc3, Arch has -rc4, so we wouldn=E2=80=99t be alone.=C2=A0 And =
I really hope that they release a proper 0.9 before we ship our next releas=
e!<br>
<br>
Ross</blockquote></div>

--00000000000083a92706535ba791--

