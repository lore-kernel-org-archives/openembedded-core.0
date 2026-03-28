Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31C610ED67F
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 08:37:35 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7523.1774687051039130576
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Mar 2026 01:37:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GDptgpul;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a12c310e8aso3180665e87.3
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 01:37:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774687049; cv=none;
        d=google.com; s=arc-20240605;
        b=EVG8b5AQ8m+4JZN2JQ2LyskjqMTNau8dMGvsbXnQk8Z1BCc2yeGJXrZUIfyWPEHj7T
         P1Zx7IrzBpsYmQ1LtmNJ9n3A1NMRJiDgNSWbLFqlocuRGleJP0WLz7Q7SpXMTI81H7in
         oT1VDDyBltTfZG7nIkqUlwPh6Hc+AXvuNF6HzR8G/O2KgZ8JWT1tsFJVnu0ROGVcyULa
         8Mcn1xc/XygQKjI1ALBjX1/uKqItVtFkrxHR0ngSWAO7XvqCAINzA4ZpAyZZi5Oe0nxa
         WlzH5u1YM/7cal8BUkZ4jZRq/+L7WxlvG6ftcAWzfqGreqz8tQAbFtPZMNS+x1mQDmod
         67Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4/VE3Q5lGJeK98SHVDOt73Lm3aolMfuhM6xmggRdd1U=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=UeCMGGUZBy/8reJ61Qnvwzk3bjZMN0vwTvHfSqUnrq48Hcx7qnXkCk10xlJZYfwC9W
         STww5wCdvOD0nND0u/E2zSnTaIM4Erc2NkcB++RIJw0fEe/51wFKS39gDKDUFqQubU6g
         5NqBxEaRMXt55qAxPPKCJ4OBXmz+50vt0UnVqyWNdyIfSlQNp+/xXu5dcP7UBdAOL5S1
         uqtZWAQmdDXxl2BYyIINCN+O2G2qqL7EyocqCVBGvXmNDxUoelLYmcJLueCAn2qgnYce
         ltM8W1A8i/Ll17StawFqCyyVDsy5oMW2CeS8NaDRmt/YDvxG9cu4OeHnT263CdPKwCO6
         jQCQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774687049; x=1775291849; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/VE3Q5lGJeK98SHVDOt73Lm3aolMfuhM6xmggRdd1U=;
        b=GDptgpulnPUXCDZSbtG/laWpxDp9Fb+B8pn0262aPz7HXAvtiorkecxFgB9YVquVnP
         ORvKdj+ow9dzJYZdtlYH59VIpQKtoNFUiHpxvnBHtmZM70ghgWX1jh2fe9Iwxw7Tdzrs
         OQQUtLThmoaTXYGPIL5uv6zBT6AWRkMRGrLzJ8Qf9dEalB3wi6Td0N0JsQuAZEjKMNAF
         U5jY3yOIxY2Pc0jRkEAh2lItfMNUZ37eHM+Ohzg5GVg+fNCE7kPXl7tSPOv5q5PLwSnA
         bmCpVYD3Qkvw2DDCm15SttvnUhdRdBxzqV/pjekpIo/4a47sR0jvS3HXEAUIXHeB2Wh7
         BAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774687049; x=1775291849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4/VE3Q5lGJeK98SHVDOt73Lm3aolMfuhM6xmggRdd1U=;
        b=VDjE+4NY/6sJb/WKlA7x+QAC8CzP1jfe6ThPm9A7k1a2u62bflIAGkYGyNFWNTSdlF
         MMuc2u2ONNrW0LtDH9cSgTlISmlVDBjwLAHYjqUnNSpGmBupnRfbEbmka07QimDuZ/1+
         nK+hJ+WKo2Na+8Tyu4O3mMLMAhIYg7BVOsYPlRPOeESKkoydS5MAOMOfpjBRtgV8+clQ
         IJMrM8i///5TrYjP2iIuaZp/evtWmTf1KlGAhgWDqALZ1/QGoz+EJZDEkySZX189KYF/
         XShA1D5SoS/52Gya1geyFc9H6srr+NFbKFAQgUlBLyTO19rmUTTXwhh6yO0eMkis+FbQ
         NZ8g==
X-Gm-Message-State: AOJu0YxQtzEMehCdNWy5ElVYtzI+DUcYW/nzTVUA6GSoizb0+UFG0W0/
	Z45xXmqUzZnWJzGx5y7HO0aXQc8hPDWL/+6N15jF+a145yCqYiDNrJriJa3XRdeI2aVZZlFsdmb
	EU1d4uHx3t/BS/QFbZGghON25EHy9Qww=
X-Gm-Gg: ATEYQzw7we79czi/4Shplj90e2wTq6ucNDZtm+ZxinI2dP/EJ9mGhaB49Do6IwFy793
	hLBJonblAl/OX8hLv0odGbLhT5ovPMpRXnez5Lt9eBusSgEibF9owPxfUKM+nYo7ndgov+BRdz5
	JfSTV8C4zIBUlIvUvKiJ5sLcnWh7RMTMTmrE3hZ78dtDbUoGSs81n6FkguXEd3XLekSoLng7wI8
	q5F/cEfYjSoXw8boziGqwIYAUES8Rve6vve338/cWYqFxx2ZXBbewpwB9HFFE1hy1HHpjd4+zVB
	Ib1rNxSf5A==
X-Received: by 2002:a05:6512:1084:b0:5a1:4473:bb44 with SMTP id
 2adb3069b0e04-5a2ab92d9e4mr2151155e87.33.1774687048500; Sat, 28 Mar 2026
 01:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260326181450.1262870-1-martin.jansa@gmail.com>
 <20260326181450.1262870-5-martin.jansa@gmail.com> <DHDZ7EG0XTX2.115YOC91NT8OQ@smile.fr>
In-Reply-To: <DHDZ7EG0XTX2.115YOC91NT8OQ@smile.fr>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 28 Mar 2026 09:37:17 +0100
X-Gm-Features: AQROBzANiVKaCDhZsgZ341IMhGOKa6oyPz-8yl3Nwv9rURYYQ5AgsW_r4_7bxc0
Message-ID: <CA+chaQeyZaJwrD+9qhDiEehcdkXZrWipoHonUsWO1Vi-=Erg8Q@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH 5/6] elfutils: don't add -Werror to
 avoid discarded-qualifiers
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 08:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234119

On Sat, Mar 28, 2026 at 1:07=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
> On Thu Mar 26, 2026 at 7:14 PM CET, Martin Jansa via lists.openembedded.o=
rg wrote:
> > From: Martin Jansa <martin.jansa@gmail.com>
> >
> > With glibc-2.43 on host elfutils-native fails with:
> > elfutils-0.191/libcpu/riscv_disasm.c:1259:46: error: initialization dis=
cards =C3=A2=E2=82=AC=CB=9Cconst=C3=A2=E2=82=AC=E2=84=A2 qualifier from poi=
nter target type [-Werror=3Ddiscarded-qualifiers]
> >
> > elfutils-0.194 in master doesn't have this issue thanks to this patch a=
voiding -Werror from:
> > https://git.openembedded.org/openembedded-core/commit/?id=3D1d6ac3c8117=
98732e6addc798656bbe104661d77
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
>
> Hello
>
> Isn't this patch (and 6/6) also needed on whinlatter?
> Can you send what is needed from series to whinlatter please?

Hi, I've asked about supporting hosts with glibc-2.43 in whinlatter
and Paul and Richard were concerned about the impact and whether it's
worth it considering that whinlatter will be EOL relatively soon.

I have some changes for whinlatter already, but it needs more fixes to
build image (m4 and gettext native are failing there), while with
these 6 in scarthgap I was able to build whole image already.

There is one more issue with latest ubuntu-26.04 (after updating
docker image to latest last week) which isn't solved by these 6
changes - libcrypt-dev is no longer installed as a dependency in my
minimal docker image, leading the python3-native failing to build
crypt and shadow-native failing to find libcrypt - I have explicitly
added it to Dockerfile to fix this one as virtual/crypt-native is in
ASSUME_PROVIDED and not sure if we want to use xcrypt-native to avoid
that.

Corresponding IRC log:
https://irc.yoctoproject.org/%23yocto.2026-03-25.log.html

JaMa paulbarker: Hi, any plans for supporting ubuntu-26.04 with glibc
2.43 on host? We will need at least new uninative from master,
m4-native, gettext-native fixes (instead of upgrades from master) and
probably more, I can help with that if there is consensus to get them
merged eventually 10:01

JaMa I mean for whinlatter branch, surprisingly older m4-native in
scarthgap doesn't fail with glibc 2.43 on host 10:02

paulbarker JaMa: I think it usually comes down to how invasive the
needed changes are 10:02

JaMa https://git.openembedded.org/openembedded-core/commit/?id=3D28552a7b6c=
94060c7ab3899619ab8afb74124d02
https://git.openembedded.org/openembedded-core/commit/?id=3D7d35b0e7929d666=
af783db835a3a809f8f6ce429
https://git.openembedded.org/openembedded-core/commit/?id=3Dc1fb515f2a88fa0=
a0e95529afc07a99db001af0e
would be the start, then I can extract just the glibc fix from 10:05
JaMa https://git.openembedded.org/openembedded-core/commit/?id=3D97dd558277=
ea48e2161f389d6458517da6e04e4a
 and similarly from
https://git.openembedded.org/openembedded-core/commit/?id=3D0ed7b56814d8337=
d1bd97cd2a4460065dba79207
that should be enough to build minimal image IIRC 10:05

RP paulbarker: I guess whinlatter is to be discontinued soon too which
is probably part of the reason for the question 10:05

paulbarker JaMa: I think we need to wait until 26.04 is out, then look
at whether we can easily support it in wrynose/scarthgap 10:06

paulbarker As RP says, whinlatter will be EOL, so will kirkstone 10:06

JaMa OK, won't offer my help until someone looks :) I can switch to
bit older 26.04 snapshot (the glibc was upgraded for 26.04 in last
week) 10:08

paulbarker JaMa: Sorry, I don't mean to sound dismissive. We're just
focused on the last features for the LTS release and I don't want us
to take on too much more until they're done 10:18

RP JaMa: your help is definitely welcome, it is just a question of how
much work we should do on whinlatter now 10:28

JaMa RP: paulbarker: thanks, I have started with scarthgap issues, m4
and gettext surprisingly doesn't fail there so it might be just the
first 3 commits I've mentioned, doing the rebuild from scratch now

Cheers,

