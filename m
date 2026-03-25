Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E5CFEA83C
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 09:27:08 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18282.1774430824563348275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 02:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KwSWOTWS;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b94a19fdso4521838f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 02:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774430823; x=1775035623; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCgQAR5TOITwX8HHrlAzjpVMorwXE0PSrEkipd1oZBE=;
        b=KwSWOTWScYCkns0qjGnifgAZyh/bLcxys39o9E03qQ4XQi6l939BNaaZeQEJ/Sm9sG
         KFQ5BvkfcXbUqeQiKC17CqluxVQjWiuZNiFx31ijgMsGmg7zyXSsJ4+x7aQ4kaUTTUT3
         iQhx6G2MC70ioCi0THYgzXIx4g/nkQH/iPZYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774430823; x=1775035623;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tCgQAR5TOITwX8HHrlAzjpVMorwXE0PSrEkipd1oZBE=;
        b=jPRpcTTDj2CZtvCAzgIHkYZDj3gKCBLnZ0POfocYZVQMWditLNB9TM22UFcBoGsas1
         AdwS0c85NKk1ICYDTMIYfiNVQr+vL6D/XDuw4T0jgFq4lT/GKH8YWl2DksmsxLjZxL2r
         oXWM+I9XCyr0zezX+MmN+A2B7cw+/FMgmW3VRhIUVOlso99cJpvRd1LVlard5Rz/Enp0
         7+CqP1bIiH7iZRs1RfuN4kGEiCbmIwdYcTKDBRJ7sMYjIjzf+ZsReW9FgJiLrUVCI49d
         hKqsIQ0srna1zmx8jEohJ4sq3xTLJT/R5FlfgTZdb2cc0EVPv8Z7nv1X+TT8PsHuEd16
         KxyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3vQB81wCc3B4p5ZHsy/0AkBKQBsaeV4msMcoXeVoJtQM9sN+cNH0s8d/Qwx/2weW41H+0FjGMjhjN5D4pm0/cOQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyZ2LagyAQZDB/rXDMwhjVJMu9D2tAeQhsperlLXDQcH9rRGMrn
	75Zw0Fm/FAfdjXlMGjO3+3vhYOHlXo6bDGn22pK6lrFgVOlzgd6tfEbSmE2vEFmCjAg=
X-Gm-Gg: ATEYQzzcwBn3CkvhzvxPY3Wg6/eNuYWl3qtGJsIsw1wYFjOuXIEE19Tq0q880Z4kYie
	mTVjyLzPQfp6C7As5EzS9vxEbUqgyEM41FJ3RdXgrrnhFLaXyVIz98gXr/RT5vNDmvq5Rmf2Th4
	myjGcv8TDkQbr1TlnQ+7XxRKrLWKndD9P2yf2R/0Z1H2GZ3E5iKpURr/FcQoWjoe5yUa+xkdouC
	79PUR2AQSRzhxqfXatoWet0hwXc4vK3HBi9FrLN+NKmC4U+3gPsZ+QbvJE6x00HVZcjYZhk4OPm
	UFsxmU+dlThQpfuxc7i27znGH9Cxkw194SnAiobByQDKMrt8NWeTpQm53SJLg/Brd96Le/byqSA
	OqE+KKUSAqZXQu/WavZDgfVt3hNEgnKtgemPxFuMsFJP3BZ7PD8vnWYhvwlZUkoXVYv/bUZ8QlH
	bbGTooiPvRRf3SI0xMZBtHbUpoeRKLcr7L0sptTjRyQV31Hik8EdR3k0PY8KVB45pt3s1obhDQM
	rhJdPZAikTaSA==
X-Received: by 2002:a5d:464b:0:b0:43b:8fa4:1957 with SMTP id ffacd0b85a97d-43b8fa41abbmr428852f8f.15.1774430822793;
        Wed, 25 Mar 2026 02:27:02 -0700 (PDT)
Received: from localhost (2a02-8440-250d-6bb6-81dd-d0a0-a5de-9ff8.rev.sfr.net. [2a02:8440:250d:6bb6:81dd:d0a0:a5de:9ff8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64717e97sm47971379f8f.35.2026.03.25.02.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 02:27:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 10:27:01 +0100
Message-Id: <DHBR89UA0L0Y.1VCP8O1ZLSPCE@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/3] tzdata,tzcode-native: Upgrade
 2025b -> 2025c
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Paul Barker" <paul@pbarker.dev>, "Mathieu Dubois-Briand"
 <mathieu.dubois-briand@bootlin.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>, <ankur.tyagi85@gmail.com>
To: "Vijay Anusuri" <vanusuri@mvista.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260307064540.1257672-1-ankur.tyagi85@gmail.com>
 <CANQUz18HPaT0d=QO6ZcENZUbZbxqODKDXGJUYkzEopGJ0NAK0g@mail.gmail.com>
In-Reply-To: <CANQUz18HPaT0d=QO6ZcENZUbZbxqODKDXGJUYkzEopGJ0NAK0g@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 09:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233866

On Wed Mar 25, 2026 at 3:16 AM CET, Vijay Anusuri wrote:
> Hi Team,
>
> Any update on this ?

Hello Vijay,

I took 2/3 and 3/3 in this series and they should merge shortly.

For this tzdata,tzcode-native upgrade, I'm looking into it because the
changes in tzcode-native are not trivial and should be carefully
evaluated. My current thinking is that we need to split tzcode-native
and tzdata but this is not easy because, right now, they each need each
other to build.

I've started to look at what other distros are doing: For example,
Debian uses the tzcode vendored in GNU libc[0].

It early for me in my thinking about how to handle this, I'm open to
ideas/patches!

[0]: https://elixir.bootlin.com/glibc/glibc-2.43.9000/source/timezone

Regards,

>
> Thanks & Regards,
> Vijay
>
> On Sat, Mar 7, 2026 at 12:15=E2=80=AFPM Ankur Tyagi via lists.openembedde=
d.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
>> From: Paul Barker <paul@pbarker.dev>
>>
>> This release mostly changes code and commentary. The only changed data
>> are leap second table expiration and pre-1976 time in Baja California.
>>
>> Full release notes:
>>
>> https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXK=
YLMAQRZRFTERQ33CEKOW7KRJVAK/
>>
>> Signed-off-by: Paul Barker <paul@pbarker.dev>
>> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (cherry picked from commit 452334219309793ad74abd6ff390dcb06cab929b)
>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> ---
>>  meta/recipes-extended/timezone/timezone.inc | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-extended/timezone/timezone.inc
>> b/meta/recipes-extended/timezone/timezone.inc
>> index f21bedf4fc..35f22d5a15 100644
>> --- a/meta/recipes-extended/timezone/timezone.inc
>> +++ b/meta/recipes-extended/timezone/timezone.inc
>> @@ -6,7 +6,7 @@ SECTION =3D "base"
>>  LICENSE =3D "PD & BSD-3-Clause"
>>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc679c9d6b02bc2757b3eaf8f53c4=
3fba"
>>
>> -PV =3D "2025b"
>> +PV =3D "2025c"
>>
>>  SRC_URI =3D"
>> http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;na=
me=3Dtzcode;subdir=3Dtz
>> \
>>
>> http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;na=
me=3Dtzdata;subdir=3Dtz
>> \
>> @@ -16,5 +16,5 @@ S =3D "${WORKDIR}/tz"
>>
>>  UPSTREAM_CHECK_URI =3D "http://www.iana.org/time-zones"
>>
>> -SRC_URI[tzcode.sha256sum] =3D
>> "05f8fedb3525ee70d49c87d3fae78a8a0dbae4fe87aa565c65cda9948ae135ec"
>> -SRC_URI[tzdata.sha256sum] =3D
>> "11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474"
>> +SRC_URI[tzcode.sha256sum] =3D
>> "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
>> +SRC_URI[tzdata.sha256sum] =3D
>> "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#232604):
>> https://lists.openembedded.org/g/openembedded-core/message/232604
>> Mute This Topic: https://lists.openembedded.org/mt/118185146/7301997
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> vanusuri@mvista.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>


--=20
Yoann Congal
Smile ECS


