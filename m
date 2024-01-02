Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1C6C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 17:49:39 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.34906.1704217771702121405
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 09:49:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eeZDLwwf;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.53, mailfrom: steve@sakoman.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e5a9bcec9so11531412e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 09:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704217770; x=1704822570; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9TS7wx8aX2UqvBOhS/pQ6AWNEokR/89oe6S0qbTE04=;
        b=eeZDLwwfCVIVizp+qmDEuul8uMSAoL0BLzUB5VO9bj2Mb3BHOLuqZmkVlwIBQ/dHQd
         mlCnrj/tkwWPex8D96/ql3EuGnbGltSjE2YnwZ8sR/QHPS4sR9e8yN8Icf7r3UcrWo7o
         j+FPDQZ7CY9Q98v2MPkKyOeNUP5AOuxXQd7bPd+fps2PEVK+B/E04g3T22MyrUnb9ZEF
         826gDkIfgtkuztJf3gH92ub3EbKeKXPNkPLdbEBN/4KgEA9cSRxx7TowLNGYHoSI41tM
         qYB9DI4yqodRgE8WVidjBHgivQRIdZZmqcqFD10TjY6kSr41nfUe3RTOS0TNpqbfbOuF
         Ns0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704217770; x=1704822570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9TS7wx8aX2UqvBOhS/pQ6AWNEokR/89oe6S0qbTE04=;
        b=Re8x8cP3B51bCGYCFWli+IjXwBaOut1iAsXAYfGjcPwmdl6CQJX9HKXn74HTVQ5jF+
         040h5+FWrQdNFQkRJOrOi6kyj7bbKbR3GsyrW3ZXDz9sOf5K0GkM5ggBEOobqtow890v
         7zlmFfjS+LgEfOLZtMPPM5eu3HIlK7YU9WXq63obVoZL3La7S7EmmwpAEglh1DiAX19H
         0PKNLBgw2edYTo2mP5YHaNzAQc0roEP7Oj9NH+2mWHonmP0V02uX2an7RiMK3IysxuAQ
         GqqU0fgU6ANbOkf3TizRo/Bugc4hkSGIEdzQ/mMK0RLEOHgGwOx5mMBi0nEC9gG2Jl1/
         BHuw==
X-Gm-Message-State: AOJu0YxI2q6AJmIKmpPg8x85WcyAG6nWJ4z9t1ApbhUFoDwuzhRii4Lp
	ZxRR1W1wsd6VEt7eYcpXMTsAkVIgUkJSmTrAemmhT1CQMOaHtA==
X-Google-Smtp-Source: AGHT+IHCeRViNGzlEqkTuNKK5EO/A+VzqrQb5uJ9FzapJbJw8uWZI6bhaRKy607rWgz0dneDkopJF2K5j1pR9D5vuBY=
X-Received: by 2002:a05:6512:23a2:b0:50e:464c:e9d with SMTP id
 c34-20020a05651223a200b0050e464c0e9dmr10308158lfv.101.1704217769639; Tue, 02
 Jan 2024 09:49:29 -0800 (PST)
MIME-Version: 1.0
References: <17A47110AD953EDF.18684@lists.openembedded.org>
 <CAKzga+y7yeFf95cP3qfkDpPTr0QXK+opNpCO0agT5EZu_EtdZA@mail.gmail.com>
 <CAOSpxdbCoxXa90ZskAAnJqHzofR7jN=PJ=f4udJRojDoLqimTQ@mail.gmail.com> <CAKzga+xx87rpLbCnAU4yaxfHr9DAOUBGQ75W8yEScxDxaQJ9RQ@mail.gmail.com>
In-Reply-To: <CAKzga+xx87rpLbCnAU4yaxfHr9DAOUBGQ75W8yEScxDxaQJ9RQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 2 Jan 2024 07:49:18 -1000
Message-ID: <CAOSpxdaW6Ku8d9h_Ce=ixB=UQEK_M+2UA=zFS54OkZL89vy-Jw@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] tzdata: Upgrade to 2023d
To: Shubham Kulkarni <skulkarni@mvista.com>
Cc: openembedded-core@lists.openembedded.org, 
	Armin Kuster <akuster@mvista.com>, Mahesh Mathapati <mmathapati@mvista.com>, 
	Jeremy Puhlman <jpuhlman@mvista.com>, Sam Kappen <skappen@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 17:49:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193251

On Mon, Jan 1, 2024 at 8:26=E2=80=AFAM Shubham Kulkarni <skulkarni@mvista.c=
om> wrote:
>
> Hi Steve,
>
> Thanks for your response. Will it be possible to merge this patch in dunf=
ell-nut till Jan 02, if there are no issues with the patch.

Yes, it is now merged in stable/dunfell-nut

Steve

> On Sat, Dec 30, 2023 at 9:03=E2=80=AFPM Steve Sakoman <steve@sakoman.com>=
 wrote:
>>
>> On Sat, Dec 30, 2023 at 4:37=E2=80=AFAM Shubham Kulkarni <skulkarni@mvis=
ta.com> wrote:
>> >
>> > Hi Steve,
>> >
>> > I have sent this patch to upgrade tzdata to the latest version "2023d"=
 for dunfell branch.
>> > The mailing list link for the same: https://lists.openembedded.org/g/o=
penembedded-core/message/192913
>> >
>> > Can you please check if this patch can be accepted in the dunfell-nut =
branch of oe-core-contrib.
>>
>> I can take it now that it has been merged to the master branch.
>>
>> Steve
>>
>>
>> > On Tue, Dec 26, 2023 at 10:44=E2=80=AFPM Shubham Kulkarni via lists.op=
enembedded.org <skulkarni=3Dmvista.com@lists.openembedded.org> wrote:
>> >>
>> >> From: Shubham Kulkarni <skulkarni@mvista.com>
>> >>
>> >> Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
>> >> ---
>> >>  meta/recipes-extended/timezone/timezone.inc | 6 +++---
>> >>  1 file changed, 3 insertions(+), 3 deletions(-)
>> >>
>> >> diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recip=
es-extended/timezone/timezone.inc
>> >> index 2960bfefe3..75f13cfc94 100644
>> >> --- a/meta/recipes-extended/timezone/timezone.inc
>> >> +++ b/meta/recipes-extended/timezone/timezone.inc
>> >> @@ -6,7 +6,7 @@ SECTION =3D "base"
>> >>  LICENSE =3D "PD & BSD-3-Clause"
>> >>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc679c9d6b02bc2757b3eaf8f5=
3c43fba"
>> >>
>> >> -PV =3D "2023c"
>> >> +PV =3D "2023d"
>> >>
>> >>  SRC_URI =3D" http://www.iana.org/time-zones/repository/releases/tzco=
de${PV}.tar.gz;name=3Dtzcode \
>> >>             http://www.iana.org/time-zones/repository/releases/tzdata=
${PV}.tar.gz;name=3Dtzdata \
>> >> @@ -14,5 +14,5 @@ SRC_URI =3D" http://www.iana.org/time-zones/reposit=
ory/releases/tzcode${PV}.tar.gz
>> >>
>> >>  UPSTREAM_CHECK_URI =3D "http://www.iana.org/time-zones"
>> >>
>> >> -SRC_URI[tzcode.sha256sum] =3D "46d17f2bb19ad73290f03a203006152e0fa0d=
7b11e5b71467c4a823811b214e7"
>> >> -SRC_URI[tzdata.sha256sum] =3D "3f510b5d1b4ae9bb38e485aa302a776b317fb=
3637bdb6404c4adf7b6cadd965c"
>> >> +SRC_URI[tzcode.sha256sum] =3D "e9a5f9e118886d2de92b62bb05510a28cc6c0=
58d791c93bd6b84d3292c3c161e"
>> >> +SRC_URI[tzdata.sha256sum] =3D "dbca21970b0a8b8c0ceceec1d7b91fa903be0=
f6eca5ae732b5329672232a08f3"
>> >> --
>> >> 2.42.0
>> >>
>> >>
>> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> Links: You receive all messages sent to this group.
>> >> View/Reply Online (#192913): https://lists.openembedded.org/g/openemb=
edded-core/message/192913
>> >> Mute This Topic: https://lists.openembedded.org/mt/103372051/7032091
>> >> Group Owner: openembedded-core+owner@lists.openembedded.org
>> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [skulkarni@mvista.com]
>> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >>

