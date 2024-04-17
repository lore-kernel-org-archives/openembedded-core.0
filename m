Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C104BC4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 22:57:14 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.910.1713394631842104450
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 15:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MjCeehb1;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.170, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-61149e50602so2566197b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 15:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713394631; x=1713999431; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5J33k4Etq8DRJPp5B15r5eNtBnzlmCdDJmpeBk0EcM=;
        b=MjCeehb1Jm0xPZxVh2XaWQb6k/4oNX8CILWTetQaMRGBvohkDuY64fiJjzsa//bL6C
         oZBrLDk9s6oeEtlQOkpvbnPc2pHpHG5cXdc4W3SrsSucSi27pfO4b+WbS2QYBbDd6kiS
         yN+Hrv92UDJMm9tLesrbaW6ZXB5KWZfb77G1EqLradZLB5IVHcbunlmu8WP3zV3Idhx6
         sH7e6daRQdvtEfe9eTjX2VCAMnIvY7NnQbY/YIlYEDuOqyor3N2MNfKkfSquijCpnQSc
         bhiVpZCl7tGF9D/mplwQIpwmE+IamdAyWVgCStwiBJ6KWEX3UPzfJlklKnp8o35w9wFD
         1rIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713394631; x=1713999431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5J33k4Etq8DRJPp5B15r5eNtBnzlmCdDJmpeBk0EcM=;
        b=GuzhY4p2ztKT2CnecApKj2XloB2/VDyjHlvRoemvlRRDP4OX6HSzKgC0cMDmKvPeVt
         acwPp1RHt1gNCffeypETtWZtBG5xbdwX5IYsbcJQvisPLKLBiGgeZOdY1hy2s3QkllLE
         ALgrUeaFXvuYkEyQtfFrBQXPFRqG9L73J/g7TJn0XCQISaZU5V0eQDYsJEXbcJ5fiwqJ
         Jw/LomrSrHhdejzMzJ9FtUfooflUt8SOPWeXR/wYyL6oG3L1FDdyep5HlOEzaAVDt8Fn
         VqMMwcILwNriNixq58+brfi+NKFEgNbQeEIiPn5D8xOChvKtD3QgdlqNit1xFeeRQSM9
         G+ng==
X-Forwarded-Encrypted: i=1; AJvYcCWVSQTviot821MZR2TJazy2ELkTrn0LAZj/9BjyB4qR8p5TGR7HZ7mNziFXFNU7dvISEkXAmiawhJIBvAmHqMnambrNvR6RmiAQJoD8fcogh6cQDiPrFUT6
X-Gm-Message-State: AOJu0YzBI1hbMQ3EmUO1cv8p/eUfkmCYiPnIIwkcDez/xZXwgLfByFCs
	HjM6KSWp935ablCJIi4tltcoNA7OKurVysfkuP2fObC5hVLyXMa/cX88G2rdB7RijQQYdzqABFy
	rDgOMyiPx4Qhk2I5v6fN72O188fw9n99nPZMepw==
X-Google-Smtp-Source: AGHT+IFAvTeeAKPPX2AsVK4LJLR6LFHK8WtHfXp7wRwANikrzsJsNvGXzGxty5FAyufn1h7GsAlSSx7b3JJwYXiebOM=
X-Received: by 2002:a0d:e84c:0:b0:61a:d0d8:75f6 with SMTP id
 r73-20020a0de84c000000b0061ad0d875f6mr455767ywe.24.1713394630979; Wed, 17 Apr
 2024 15:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1713385733.git.steve@sakoman.com> <915df62abd2986b2f9d73718e702cc6ce088d52b.1713385733.git.steve@sakoman.com>
 <7b6c45a05dde783826b5a73b1bdb0a821efd0701.camel@linuxfoundation.org> <17C7320A63076F69.11286@lists.openembedded.org>
In-Reply-To: <17C7320A63076F69.11286@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 17 Apr 2024 15:57:00 -0700
Message-ID: <CAOSpxdZYQ0ivC6qe49G5ESQ9t=1ZkhtTxu3aX-+zF8HCG1kL_w@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 6/7] ppp: Add RSA-MD in LICENSE
To: steve@sakoman.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 22:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198491

On Wed, Apr 17, 2024 at 3:33=E2=80=AFPM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
>
>
> On Wed, Apr 17, 2024, 2:33=E2=80=AFPM Richard Purdie <richard.purdie@linu=
xfoundation.org> wrote:
>>
>> On Wed, 2024-04-17 at 13:35 -0700, Steve Sakoman via lists.openembedded.=
org wrote:
>> > From: Poonam Jadhav <ppjadhav456@gmail.com>
>> >
>> > ppp package has "RSA Data Security" license text
>> > in Message-Digest Algorithm source file md5.c and md4.c
>> > Add RSA-MD in LICENSE field for ppp package
>> >
>> > Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
>> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> > ---
>> >  meta/recipes-connectivity/ppp/ppp_2.4.9.bb | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb b/meta/recipes=
-connectivity/ppp/ppp_2.4.9.bb
>> > index 7e3ae43b58..b7f71b673d 100644
>> > --- a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
>> > +++ b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
>> > @@ -5,7 +5,7 @@ SECTION =3D "console/network"
>> >  HOMEPAGE =3D "http://samba.org/ppp/"
>> >  BUGTRACKER =3D "http://ppp.samba.org/cgi-bin/ppp-bugs"
>> >  DEPENDS =3D "libpcap openssl virtual/crypt"
>> > -LICENSE =3D "BSD-3-Clause & BSD-3-Clause-Attribution & GPL-2.0-or-lat=
er & LGPL-2.0-or-later & PD"
>> > +LICENSE =3D "BSD-3-Clause & BSD-3-Clause-Attribution & GPL-2.0-or-lat=
er & LGPL-2.0-or-later & PD & RSA-MD"
>> >  LIC_FILES_CHKSUM =3D "file://pppd/ccp.c;beginline=3D1;endline=3D29;md=
5=3De2c43fe6e81ff77d87dc9c290a424dea \
>> >                      file://pppd/plugins/passprompt.c;beginline=3D1;en=
dline=3D10;md5=3D3bcbcdbf0e369c9a3e0b8c8275b065d8 \
>> >                      file://pppd/tdb.c;beginline=3D1;endline=3D27;md5=
=3D4ca3a9991b011038d085d6675ae7c4e6 \
>> >
>>
>> This isn't in master yet!
>
>
> Good catch! I'll text this patch and request that out be sent for master.

Heh, drop not text :-)   And I see that he has already submitted for master=
.

Steve

