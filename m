Return-Path: <wes@mitsi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA9EC433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 15:23:35 +0000 (UTC)
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by mx.groups.io with SMTP id smtpd.web10.458.1651591405272759947
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 08:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@mitsi.com header.s=mesmtp
 header.b=HYUAQ78M;
 spf=pass (domain: mitsi.com, ip: 64.147.108.70, mailfrom: wes@mitsi.com)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id A07E3110D16
	for <openembedded-core@lists.openembedded.org>;
 Tue,  3 May 2022 11:23:21 -0400 (EDT)
	(envelope-from wes@mitsi.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=
	mime-version:references:in-reply-to:from:date:message-id:subject
	:to:cc:content-type:content-transfer-encoding; s=sasl; bh=kUgT07
	ifQWNeRYbsMXIuirlmjeGoLZTLQjciLmwoSLQ=; b=NcjPo3Ry4OqIYrpoJrW70o
	zjNDcL7Bsabdr9lgEbaVRsQXEDs+oe3B0qNnMxdgDURSfrr9HBVGe3U0dvzH6Ppi
	ButFbLGOox18kCtniSKjUz3X/+bbrVxiK2pXzIHbnKhetJtARM1Aqv0EhTIiaQzb
	OCsmb27USeUTUOiY4OoKM=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id 921FA110D14
	for <openembedded-core@lists.openembedded.org>;
 Tue,  3 May 2022 11:23:21 -0400 (EDT)
	(envelope-from wes@mitsi.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=mitsi.com;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to:cc:content-type:content-transfer-encoding;
 s=mesmtp; bh=kUgT07ifQWNeRYbsMXIuirlmjeGoLZTLQjciLmwoSLQ=;
 b=HYUAQ78MIy5TccppmpG9fNyOES5NKhpfsoqEz2M6AYDC+rfvi0/ikZ5tqs/ETmgRj+JyCELHwKkc1ZRRT8wXod9De8OVouIA1laerfB6k1YvDTtESLran+kWZETrugggBzfFoMLH3XQrtGp9//GAJLssOsNTRq6TdSugVIlcyYw=
Received: from mail-yb1-f177.google.com (unknown [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 0494C110D11
	for <openembedded-core@lists.openembedded.org>;
 Tue,  3 May 2022 11:23:21 -0400 (EDT)
	(envelope-from wes@mitsi.com)
Received: by mail-yb1-f177.google.com with SMTP id f38so31707265ybi.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 08:23:20 -0700 (PDT)
X-Gm-Message-State: AOAM531r+Lf4AZ8i0hN2/+AYCALLRPu2DFn8aH9Kn0xS1i0dEnnOZfER
	kx/Zu1+G87bTL4IknV0E/Po1zs3ulJaMt5yWT7U=
X-Google-Smtp-Source: 
 ABdhPJyGbaPZGbmQkq1ZN4qjlJtKYwzuSM1RBZpTWXLxlPgDRgyt1fggLjgaXZ9EEp8VrxzrvlSwpHFATNCcQ1BXq1U=
X-Received: by 2002:a25:3458:0:b0:649:b8e1:86e2 with SMTP id
 b85-20020a253458000000b00649b8e186e2mr5180479yba.268.1651591400132; Tue, 03
 May 2022 08:23:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220502211001.4183095-1-wes@mitsi.com>
 <20220502211001.4183095-2-wes@mitsi.com>
 <CAPnigKkL5LeyUj5NGwb0iYOeEBGSvm0FAO25zmVD2G9KATEijg@mail.gmail.com>
 <CANNYZj-19bZmShcS4ws_3hDKpxiir7-abo5M-_WEiEUUCCK25Q@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-19bZmShcS4ws_3hDKpxiir7-abo5M-_WEiEUUCCK25Q@mail.gmail.com>
From: Wes Malone <wes@mitsi.com>
Date: Tue, 3 May 2022 10:22:53 -0500
X-Gmail-Original-Message-ID: 
 <CADqWEoSCJay3HL8iDU5yM4McJ1M7JLnfRJWFt7sm1kGQfuU_Fg@mail.gmail.com>
Message-ID: 
 <CADqWEoSCJay3HL8iDU5yM4McJ1M7JLnfRJWFt7sm1kGQfuU_Fg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rng-tools: disable libjitterentropy due to cpu
 usage
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: wak@google.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Pobox-Relay-ID: 
 F73B32E2-CAF4-11EC-A12E-5E84C8D8090B-78235051!pb-smtp1.pobox.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 May 2022 15:23:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165204

> Isn't this desirable if you don't have an hwrng?
Perhaps what's needed then is a 'hwrng' in MACHINE_FEATURES?

> Can=E2=80=99t rng-tools figure out the right sources at run time?
rng-tools enables jitter by default if it's built in, even if hwrng is
available. Maybe it's faster to do this on more powerful machines but
it's disruptive to run the cpu at max for so long on my pi's.

We could also disable it with the /etc/defaults file with `-x jitter`.


On Mon, May 2, 2022 at 11:47 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Yes, I wonder why this needs to be disabled altogether at build time. Can=
=E2=80=99t rng-tools figure out the right sources at run time?
>
> Alex
>
> On Mon 2. May 2022 at 23.33, William A. Kennington III via lists.openembe=
dded.org <wak=3Dgoogle.com@lists.openembedded.org> wrote:
>>
>> Isn't this desirable if you don't have an hwrng? We want to generate
>> entropy so we can perform cryptographic operations by default if we
>> bring in rng-tools.
>>
>> On Mon, May 2, 2022 at 2:10 PM Wes Malone <wes@mitsi.com> wrote:
>> >
>> > After boot rngd maxes out the processor initializing JITTER entropy fo=
r
>> > some minutes. Here we disable libjitterentropy in favor of only using
>> > the hardware random source via config.
>> >
>> > Signed-off-by: Wes Malone <wes@mitsi.com>
>> > ---
>> >  meta/recipes-support/rng-tools/rng-tools_6.15.bb | 1 -
>> >  1 file changed, 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb b/meta/r=
ecipes-support/rng-tools/rng-tools_6.15.bb
>> > index 0696351903..4eed060960 100644
>> > --- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
>> > +++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
>> > @@ -21,7 +21,6 @@ inherit autotools update-rc.d systemd pkgconfig
>> >
>> >  EXTRA_OECONF =3D "--without-rtlsdr"
>> >
>> > -PACKAGECONFIG ??=3D "libjitterentropy"
>> >  PACKAGECONFIG:libc-musl =3D "libargp libjitterentropy"
>> >
>> >  PACKAGECONFIG[libargp] =3D "--with-libargp,--without-libargp,argp-sta=
ndalone,"
>> > --
>> > 2.36.0
>> >
>> >
>> >
>> >
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#165177): https://lists.openembedded.org/g/openembedd=
ed-core/message/165177
>> Mute This Topic: https://lists.openembedded.org/mt/90845997/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [a=
lex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

