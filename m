Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9A9C87FCE
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 13:05:45 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.19001.1753448743037801359
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 06:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Lky0YxHO;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.171, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e8d2c331bb5so2447580276.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 06:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753448742; x=1754053542; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcFF1PZycZcclxiXPCSGdmQI9K8EUj+6AHTM9/TvWmM=;
        b=Lky0YxHO7z83qT2ySuqTFOWz9p9tTCaYpWqawFKihqRqiP5M9XOTdYCRUELseJWjbg
         98PMTxh6IMopMCG175J+5Cc/EgqusGFOV6pszW1hmGE47WbGOQRCf1QXUGWqifwAMK36
         6Yjdys8tFUgKSokgS3rmaOQCpZc0GSsNFak93gi0Yzs4+obgdXywwl3mKZwrCpvWMo6B
         0n54s/yu4rfCVLevSFr6SPBceA5GAU3KXyOGJQazcUTZ8A09O8C4qdp4hn/L/rwRWniP
         /mP7TJwchI1DNqdxy8N+O6po9hkELQuum1ON0Zt8XwB0+mLkBdDS3F3aeJOnyocxD2ri
         dNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753448742; x=1754053542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcFF1PZycZcclxiXPCSGdmQI9K8EUj+6AHTM9/TvWmM=;
        b=LuMn05m7b5Gk/q0SqTJEHYg/Y+ww92TMcKSjiLdIFAHGS1XH7RCbZX00U0IYiqbcw9
         eTCIygcIoOZYD16FvEgRDHQ0wIbgLJwpeYweOubdkj15GeLMzeQBv58s3NIuO1kgYZYx
         01dsyGm+lt7Gjx+b7J03h5sX1PmTGQzuPVTO8LA7Yahy6roTWLyYnHZy+UYenY05Tu0q
         uuM1F+Ym/BA6mAgznkTxnVj976jd33rgY7zpQe1Ql9VjXLeTxSFii3Vz0zGMN7B1z2u8
         zOdDYl8IYh0hfri47vDKsdNGlasuYa7fi5xmEEs4Q3YtU6IOOQhzy1mWDbG0Deqf26G7
         Ck1w==
X-Gm-Message-State: AOJu0YyfSQRlAOgkEaJHpyeCHU/ZUipwFa5x2mbn018JYoNC6JImT1wx
	qrzjNEz5SAeL+BzBZi6uuHxZCMa5N3DLyWiYacejuMsZWnUT83gD/cSAX93Vd6BvMRYYFwsynqy
	PQYUH1YGPujf2ras8GdFquyDOk0AQwwTn5i1MZN4bYw==
X-Gm-Gg: ASbGncvM62EN2xSKBd0W+Exy147UGWAxpFO8G/k9Oj0i10z+1IPxgtD1iYmbaVUKG7u
	GFPsGMdMpyqCDAvuQhpEqS2OSRZBEhTfmlZbLgNaaEis5y+VzRyls3//qGwMFjV8q8PWAxFUT1a
	B59IDQ9q0cKm+MGE7ZuRfO3ZzwTaHxcTJYKxkEvP0XuIKDg3aNWlhFnNQcmaWBwzHG4Ct0iqVPj
	wW6cjO8xv14QfL502K3/WUT1+8+Whtp49d7m09OppMp7JfpIA==
X-Google-Smtp-Source: AGHT+IF5xUkW0W+XDIAUkBfSwZ3BGD3bmHwEVkUhVDx1GShbO9T3HWKwPZUYUbi7zDf/BLRpFqpceSQf8VY541f0I+w=
X-Received: by 2002:a05:6902:983:b0:e84:1f8d:da4b with SMTP id
 3f1490d57ef6-e8de1f97890mr6900805276.7.1753448741728; Fri, 25 Jul 2025
 06:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753392770.git.steve@sakoman.com> <5c0c7058484fd8b1a82c2c810f7bccf016ea482b.1753392770.git.steve@sakoman.com>
 <cdf6356e-44b0-4151-aedc-5375355e164a@gmail.com>
In-Reply-To: <cdf6356e-44b0-4151-aedc-5375355e164a@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 25 Jul 2025 06:05:29 -0700
X-Gm-Features: Ac12FXykaYeE79Nsdu72rORy0SegbXXjgyQ-2aqWLLiwYvdag0gbXzUdu9cIQRA
Message-ID: <CAOSpxdYWiM7dwo52Mee+qbTOm3QuZT+i7HrgpyCCy=_5TPwzzg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 03/16] binutils: Fix CVE-2025-7545
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 13:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220912

On Thu, Jul 24, 2025 at 10:10=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.=
com> wrote:
>
> On 7/24/25 23:35, Steve Sakoman via lists.openembedded.org wrote:
> > --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
> > +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
> > @@ -53,6 +53,10 @@ SRC_URI =3D "\
> >       file://CVE-2025-1179.patch \
> >       file://0022-CVE-2025-5245.patch \
> >       file://0022-CVE-2025-5244.patch \
> > +<<<<<<< HEAD
> >       file://0023-CVE-2025-7546.patch \
> > +=3D=3D=3D=3D=3D=3D=3D
> > +     file://0023-CVE-2025-7545.patch \
> > +>>>>>>> binutils: Fix CVE-2025-7545
> >  "
>
> This looks like a merge conflict.

Hmmm . . . I remember fixing that!

I'll send a V2 of the series.

Thanks so much for reviewing!

Steve

