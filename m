Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5A6C28B2F
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 14:17:00 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.38373.1741789018067845619
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 07:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OyBASk9h;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.174, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e589c258663so6048454276.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 07:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741789017; x=1742393817; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7swaIyqXeTRaMTUF9BMmKsq02xQqqXw6MQdwhk+Mwr0=;
        b=OyBASk9haeQ2fTLFKCjj+pG5E22Bn4sZ1KEI5VcNaSJPiwuuSkFGpRawZsaHCtpHfb
         dsKX4u/BB9Lf7Nh6B99QswRfp5TM99Rw5A3DGo6G7lR2Sr1pjF6fsN6JN/tlSGJntL9N
         r+qxqqKFFIprAmkfQj3pkFkq698cF/uvLaZq+BlHCa7Xior6JtQ39KANsdWwdLeu8mc9
         jui8FDQ21LgVP+J1acQc6TouyYWoDjooq5hEviGNxZZ6qLsbxTOFTE5BEMl6Hk+yYEoU
         T30ndBRGieLf0AgASE1mYr8yBl1v0sA6yJYo3eJcSi/ta1u43BcXzvj0oSkTOoQx7hAH
         dqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741789017; x=1742393817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7swaIyqXeTRaMTUF9BMmKsq02xQqqXw6MQdwhk+Mwr0=;
        b=eFgjHoM7x9uSsbqn2Jd1/jHnAlx+lbsq8FMxSh06pA2uuMGO9hAobwW26i65vnE4Hv
         U74n/Bf2lfd5AleM52C+P86MY+Y6fnR1G2JdiQxIh6QtIjJAhWNFAg0SmxcGCI1TaVmr
         O5r1h/oudvIjjecl6NtflgHh+RShiXNHKqBoNKfodYWPYcq2MS5YgeHUTCpiFvQ7UiIv
         3ajJ2OA+G/bJ89YDFMw77VoCFwH9wl8/FTPpjr8b37MIw7GLSshW1UkbQYEtyz1JMrdM
         2bsZloz+CZAaMg23SmqoG2jMw7/6AMOT1kr3ovh9B2cpQ2SkykF5ly/1YpSmnfD1Chfj
         FCtg==
X-Forwarded-Encrypted: i=1; AJvYcCUqGvvpWbP41EMoD0+/7eptcuz6d5Dyt+fJGfdZtq9/o6Z9Z3KFQ0Mpvi4x10bsz2JJ5dl095y7wxY70+Z6fIhzSw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyp70GKbm9wslPfh2Xb7rUqiKLAKvDG/e8RFi9FqNFSTKc58G9F
	orcD7DbFepnieygsOO7PdCfsaXWDuudOcLuZqlIYxzYROQm5RkHvWQzTil1OeAgB1eNcsIIlUiQ
	I34hty6OsjLHlxoDSx0xgGJjPUGYsc/bNDg8H70uehIiBRVNU
X-Gm-Gg: ASbGnct2ZjxSKuUJaYC7rjzcFhiGllc9rHudFVaLopetp2jz9JibRsxg3ZUFu3HvtaR
	r4LKQ6Mui41JXdj8sdFgBBb7ghKj3iM/zie6Db/1gst+5CFtpqNFyMxHwVXWwtYKhS/w0ZBNtkA
	bVDOfXUhYDx0vK1LY/SE2mu8qOTHqhb11oabcgQ7FmvL9IIoURrSR0g97WvOQ2U0E0ZGs=
X-Google-Smtp-Source: AGHT+IHZbcYujhsnxGXrWhFUbsod+0glb/v5mVAigK/7KsaTh+MBV2ittfaMk5tnnJFyZ5xRsHZoEKqQXjqsWSp01zw=
X-Received: by 2002:a05:6902:18d0:b0:e5d:d4e3:ad8 with SMTP id
 3f1490d57ef6-e635c1a4928mr25754945276.28.1741789017149; Wed, 12 Mar 2025
 07:16:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250311112242.1750761-1-ross.burton@arm.com> <20250311112242.1750761-3-ross.burton@arm.com>
 <CANQUz19SxyTRsA1je40oVM0qoFS2nGznrDV1cvYG55gMB6hxhQ@mail.gmail.com>
In-Reply-To: <CANQUz19SxyTRsA1je40oVM0qoFS2nGznrDV1cvYG55gMB6hxhQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 12 Mar 2025 07:16:45 -0700
X-Gm-Features: AQ5f1JoUvQEXtyV_ToNrXI1YYWTraOSTtbUbEOdaSTd07fzeIwF8p4HouXpzm4w
Message-ID: <CAOSpxdZzqKRH_zc=ccRzx09vMLtUw1-BQ5jYmKp31gws15xFOQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] xserver-xorg: upgrade 21.1.15 -> 21.1.16
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 14:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212656

On Tue, Mar 11, 2025 at 10:19=E2=80=AFPM Vijay Anusuri <vanusuri@mvista.com=
> wrote:
>
> Thanks Ross.
>
> Hi Steve,
>
> Can you please merge this patch series to stable branch scarthgap along w=
ith below commit
>
> https://git.openembedded.org/openembedded-core/commit/?id=3Dba94110d70ebf=
b1b4798ecf05389f7ea602b1f55

OK, added to my test queue.

Steve

> On Tue, Mar 11, 2025 at 4:52=E2=80=AFPM Ross Burton via lists.openembedde=
d.org <ross.burton=3Darm.com@lists.openembedded.org> wrote:
>>
>> From: Vijay Anusuri <vanusuri@mvista.com>
>>
>> Includes security fix
>>
>>   * CVE-2025-26594
>>   * CVE-2025-26595
>>   * CVE-2025-26596
>>   * CVE-2025-26597
>>   * CVE-2025-26598
>>   * CVE-2025-26599
>>   * CVE-2025-26600
>>   * CVE-2025-26601
>>
>> Ref: https://lists.x.org/archives/xorg-announce/2025-February/003584.htm=
l
>>      https://lists.x.org/archives/xorg-announce/2025-February/003585.htm=
l
>>
>> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> ---
>>  .../{xserver-xorg_21.1.15.bb =3D> xserver-xorg_21.1.16.bb}        | 2 +=
-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.15.bb =3D>=
 xserver-xorg_21.1.16.bb} (92%)
>>
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb =
b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
>> similarity index 92%
>> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
>> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
>> index 080e6d220ed..38c81f2372d 100644
>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
>> @@ -3,7 +3,7 @@ require xserver-xorg.inc
>>  SRC_URI +=3D "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-=
hardwar.patch \
>>             file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch =
\
>>             "
>> -SRC_URI[sha256sum] =3D "841c82901282902725762df03adbbcd68153d4cdfb0d61d=
f0cfd73ad677ae089"
>> +SRC_URI[sha256sum] =3D "b14a116d2d805debc5b5b2aac505a279e69b217dae2fae2=
dfcb62400471a9970"
>>
>>  # These extensions are now integrated into the server, so declare the m=
igration
>>  # path for in-place upgrades.
>> --
>> 2.43.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#212562): https://lists.openembedded.org/g/openembedd=
ed-core/message/212562
>> Mute This Topic: https://lists.openembedded.org/mt/111637850/7301997
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [v=
anusuri@mvista.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

