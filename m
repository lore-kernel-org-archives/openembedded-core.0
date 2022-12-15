Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E0B0C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 22:33:47 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.147666.1671143625449066777
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 14:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qUQyUzLw;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id n63so407452iod.7
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 14:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYRngIonRt2RXRouwHoLrRu4jAEIQVzp+DicV5442eA=;
        b=qUQyUzLwB//LAQjeoeIYHNyO2gSoezXKr6e3Gj5xJVPJduLXdMiMXchQxmdsfyGuQl
         rNx6Zc6M9eRWKzdxbyfvjdKpkPh9xq3Jks0QD+s9146nKphYnrvjv7jEFRp96XSXYQbe
         3w52VTURtbqSBpoFztzg05meNDlOeNlms2JqZHxGb+wJjHnLcc/aLduzICGMe46H3oqI
         7x3z8U8s/jPoWozsn4ZmoXNhuqP0CG3RV9EqavxugWGp8MFQ6iAY8qJtWMg9ljYmmSk/
         ETgL8lFQJ4aI7Xv1jVAsyVx23U5hgyjUkC3NaNJ58IQsC1Bbwi9owCjZ62enL2g5J6UO
         qEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zYRngIonRt2RXRouwHoLrRu4jAEIQVzp+DicV5442eA=;
        b=UAeDoK5EaEsfFb4hSOmSW836YsretGQnDGuQWMYQzGq0Vx0sZc+IAn8PuWytH4YDEQ
         e02y0H5eBaCFDdysc8vUcWUWIhQ7aYJYXyKc+IqofNKqjx+7rPVQnSx+0rN4X4aBISEo
         GxXOcX1tFLENuS+u5F8qJUgeYyfXykdKE4b2JXPnJ6gj9Y7mJ3Rg8CXcRZpmADSOCJ4/
         7jDcJfCcH4LY+2ZvpZTp2Q9U88yiRQTwqMqhVI0NS+fZ4BaJla2bM0maH8lcbdXtmAj9
         suuOWHGfqGZojAvioUH9Dqld9SbYMGwJEIbDBHnCeSScGcR8LnIcEvSm/AFHcisaof9w
         tsNA==
X-Gm-Message-State: ANoB5pngTH83vDzn+mCTTP1/ltQRlkTZ7YbaQMZdFV6hgq7BKDn3M0Dz
	sSXBfyGS05hxktHofWFhmse2RKUP2pq2wtbVH0U=
X-Google-Smtp-Source: AA0mqf6zaGNGknbCC84/AsvjkDRWI2iMaExpYOwPQpP0Ya5MCQlmxf1QSaHciqB5I24o1K5t6ELgLfQTY795bHpfILE=
X-Received: by 2002:a5d:9684:0:b0:6de:18b2:1025 with SMTP id
 m4-20020a5d9684000000b006de18b21025mr46053602ion.102.1671143624681; Thu, 15
 Dec 2022 14:33:44 -0800 (PST)
MIME-Version: 1.0
References: <20221215073224.3061128-1-alejandro@enedino.org>
 <CANNYZj9qbT+fGQ=18hjLkzR4D=eyr1amX2qxpwM5u_XQTqLo3g@mail.gmail.com>
 <CAHMutrae2sCtGqa-aXVYz1_kDkCtnY2qjKLhGunA-U3-ZxthnA@mail.gmail.com>
 <CAO5Uq5S2reaaVJe7hZwL2okWjKBbVhU_=g6bMjguQ7T9UNC-Vw@mail.gmail.com>
 <CAHMutrZnL2e4_7AuPkacEb-Rgyw0cb7eaErjWRuXZYXu_fUZgw@mail.gmail.com>
 <1731096B411C6A99.9432@lists.openembedded.org> <CANNYZj9BmxffYxhd1gWy6dUBcsjHi6kXgswC=4LVXUnePSOo1w@mail.gmail.com>
 <CAHMutrZhNPdLoiFTfOVvHiqqeYwSOyPB3v2qmmy7BUoraj=GZg@mail.gmail.com>
 <CAHMutrbJo2ocWz88UbQsRjBDccXr0yVDC60SZ35bdMaXHw8LAw@mail.gmail.com>
 <CAO5Uq5QT1zg1jC0wHFMxv0T+m7y_GSS2Wdg_vbuG3Yi5hOZpgQ@mail.gmail.com> <CAHMutrYvqcZ806jGpOYwgNrQJKUhoRicf_6M+9REPV5L2Mttxw@mail.gmail.com>
In-Reply-To: <CAHMutrYvqcZ806jGpOYwgNrQJKUhoRicf_6M+9REPV5L2Mttxw@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 15 Dec 2022 22:33:32 +0000
Message-ID: <CAO5Uq5RTVPLuTS8JePuTy2jgGq6troObiMiPcoUg0VMzbq=geg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust: Enable building rust from stable,
 beta and nightly channels
To: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 22:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174729

On Thu, Dec 15, 2022 at 9:45 PM Alejandro Enedino Hernandez Samaniego
<alejandro@enedino.org> wrote:
>
>
>
> On Thu, Dec 15, 2022, 3:36 PM Alex Kiernan <alex.kiernan@gmail.com> wrote=
:
>>
>> On Thu, Dec 15, 2022 at 6:24 PM Alejandro Enedino Hernandez Samaniego
>> <alejandro@enedino.org> wrote:
>> >
>> >
>> >
>> > On Thu, 15 Dec 2022 at 11:11, Alejandro Enedino Hernandez Samaniego <a=
lejandro@enedino.org> wrote:
>> >>
>> >>
>> >> On Thu, 15 Dec 2022 at 11:03, Alexander Kanavin <alex.kanavin@gmail.c=
om> wrote:
>> >>>
>> >>> On Thu, 15 Dec 2022 at 19:01, Alexander Kanavin via
>> >>> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.=
org>
>> >>> wrote:
>> >>> > Ok, I think what we should do first is to actually drop the versio=
n
>> >>> > from all of the .bb file names, and set it once, inside some .inc,=
 and
>> >>> > probably next to SRC_URI and tarball checksum. Then this should al=
low
>> >>> > a convenient scheme for including and overriding things.
>> >>> >
>> >>> > rust_1.65.0.bb - > rust.bb, and so on.
>> >>>
>> >>> Oh, and upstream version checks must be kept functional. It needs to
>> >>> both correctly report a newer version, and match the recipe version
>> >>> with upstream if it is already the latest.
>> >>>
>> >>> Alex
>> >>
>> >>
>> >> How should I test that upstream checks are still functional?
>> >>
>> >>
>> > Actually how would this make it any simpler?, if we remove PV from the=
 filenames, the correct place to put the variable is in rust-source.inc sin=
ce all others include it (rust-cross-canadian, rust, rust-llvm), if like I =
said, rust-source.inc gets included from somewhere else, wouldnt that overr=
ide PV for the other recipe as well? beating the whole purpose of the chang=
e, this, or creating a new .inc file just for this seems too convoluted IMO=
.
>> >
>> > If changing RUST_VERSION is too problematic on every upgrade I think a=
pproach #2 its a lot simpler just specifying RUST_VERSION on other recipes =
since it would be very seldom used and it wont conflict with upgrades
>> >
>>
>> Actually changing it is clearly straightforward, the problem is that
>> upgrading the rust version is already tricky because of the need to
>> regenerate the cargo checksums, so every extra step is something that
>> you have to remember to do.
>>
>> Which leaves me wondering how introducing nightly/beta actually work
>> with those patches?
>
>
> I understand that , the checksums/patches shouldn't cause any problem sin=
ce as its explained in the commit message beta/nightly builds from the exac=
t same sources, hence patches should apply and checksums wouldn't change.
>

Sorry, now I'm properly confused, if the sources don't change, how is
this beta/nightly?

cargo-checksum.json is basically completely non-patch friendly, you
have to fix it up every time as its based on the vendored sources in
the tarball.

--=20
Alex Kiernan

