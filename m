Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A43C46CD2
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 15:33:26 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.186387.1703950399525634657
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Dec 2023 07:33:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cr48NxIE;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.45, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a2335d81693so1322340666b.0
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 07:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703950398; x=1704555198; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6peNooDeU9LLAm2EX6pF7+mq8/at2tNEOQQksOKS/2M=;
        b=cr48NxIEwASOJVVKL+0mQjCi+r6/OEo1OveivJGHHRInUuyELay2mR+0PAgv78R7vZ
         2k6BLyYfU/GnV6N+IiCMzIfDO6Z8F7eEiaFXUHVbAqEm+Xt9jTg+qrWpejDFZVAp9QgV
         XitihYMpjvnGZsvYi4rsLsCHrVBgIffNu/3fXPt/w70uxzgEDA/8Zc+gVKLwnsIF3gi3
         cO9mOTHUtXQOWw1V8qvH7vvw/3foNlJnDJnSCUCJtn+LqQYPmMoTsS9bfmrgRROQqNby
         dO+OS8q0QcQA9G/KfXtGY5puwqnGaOvQr+0XqxoCvnj9Ieoo9jDMmkBmnnJWBrxQIhfK
         R+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703950398; x=1704555198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6peNooDeU9LLAm2EX6pF7+mq8/at2tNEOQQksOKS/2M=;
        b=KmMJZcip7dp9wGN6pDHOeNsQ00rC712ffW5bO2LKFmojnMeHj5lfZGCJgKbl0wkAW9
         aq9dhug26WTNOIBoIANkKdI9dSlFqd25rscmv/VlyMvLmkcHNH17bKFBleTgzFNIjBTf
         ldW3gg7/dZ3Z3gHOVXqha0+u5eKW0efVxTwaA3/ahcDtzQnnET88doNfEQzXTKVN7eZJ
         ccGrdoiq4VwKK5ydsH9Rw4ro7elloh00uU9V7rAz+KOyRqFOpqmXWMAFdmVWh/1hm/wI
         Js8qqu2rKvhhx4VOGQjsDIGtvfz48gojqULZQNRHjYJmLbDkpDBOBTSkCAv0cFbrNsoT
         aCYw==
X-Gm-Message-State: AOJu0YwwUNSPexXv6/L9+WkVGl2V6N3oR01QBswn9oZciyuvkOsY/+PA
	Cf+C3+mbVn6aXh8yyTsy3WZWL7c60xcdTlTmSrTC9fCaqxl/6w==
X-Google-Smtp-Source: AGHT+IGrQnKFMooCImPsKKzBlb6C3E+whV8gkmuxPI4jvBoveyvoOstj1fFQR/JOYcsP1FmFpmu9+68y8TB0LDbrjYQ=
X-Received: by 2002:a17:906:6894:b0:a27:b67b:6a17 with SMTP id
 n20-20020a170906689400b00a27b67b6a17mr1419079ejr.46.1703950397438; Sat, 30
 Dec 2023 07:33:17 -0800 (PST)
MIME-Version: 1.0
References: <17A47110AD953EDF.18684@lists.openembedded.org> <CAKzga+y7yeFf95cP3qfkDpPTr0QXK+opNpCO0agT5EZu_EtdZA@mail.gmail.com>
In-Reply-To: <CAKzga+y7yeFf95cP3qfkDpPTr0QXK+opNpCO0agT5EZu_EtdZA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sat, 30 Dec 2023 05:33:06 -1000
Message-ID: <CAOSpxdbCoxXa90ZskAAnJqHzofR7jN=PJ=f4udJRojDoLqimTQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] tzdata: Upgrade to 2023d
To: Shubham Kulkarni <skulkarni@mvista.com>
Cc: openembedded-core@lists.openembedded.org, 
	Armin Kuster <akuster@mvista.com>, Mahesh Mathapati <mmathapati@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 15:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193073

On Sat, Dec 30, 2023 at 4:37=E2=80=AFAM Shubham Kulkarni <skulkarni@mvista.=
com> wrote:
>
> Hi Steve,
>
> I have sent this patch to upgrade tzdata to the latest version "2023d" fo=
r dunfell branch.
> The mailing list link for the same: https://lists.openembedded.org/g/open=
embedded-core/message/192913
>
> Can you please check if this patch can be accepted in the dunfell-nut bra=
nch of oe-core-contrib.

I can take it now that it has been merged to the master branch.

Steve


> On Tue, Dec 26, 2023 at 10:44=E2=80=AFPM Shubham Kulkarni via lists.opene=
mbedded.org <skulkarni=3Dmvista.com@lists.openembedded.org> wrote:
>>
>> From: Shubham Kulkarni <skulkarni@mvista.com>
>>
>> Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
>> ---
>>  meta/recipes-extended/timezone/timezone.inc | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-=
extended/timezone/timezone.inc
>> index 2960bfefe3..75f13cfc94 100644
>> --- a/meta/recipes-extended/timezone/timezone.inc
>> +++ b/meta/recipes-extended/timezone/timezone.inc
>> @@ -6,7 +6,7 @@ SECTION =3D "base"
>>  LICENSE =3D "PD & BSD-3-Clause"
>>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc679c9d6b02bc2757b3eaf8f53c4=
3fba"
>>
>> -PV =3D "2023c"
>> +PV =3D "2023d"
>>
>>  SRC_URI =3D" http://www.iana.org/time-zones/repository/releases/tzcode$=
{PV}.tar.gz;name=3Dtzcode \
>>             http://www.iana.org/time-zones/repository/releases/tzdata${P=
V}.tar.gz;name=3Dtzdata \
>> @@ -14,5 +14,5 @@ SRC_URI =3D" http://www.iana.org/time-zones/repository=
/releases/tzcode${PV}.tar.gz
>>
>>  UPSTREAM_CHECK_URI =3D "http://www.iana.org/time-zones"
>>
>> -SRC_URI[tzcode.sha256sum] =3D "46d17f2bb19ad73290f03a203006152e0fa0d7b1=
1e5b71467c4a823811b214e7"
>> -SRC_URI[tzdata.sha256sum] =3D "3f510b5d1b4ae9bb38e485aa302a776b317fb363=
7bdb6404c4adf7b6cadd965c"
>> +SRC_URI[tzcode.sha256sum] =3D "e9a5f9e118886d2de92b62bb05510a28cc6c058d=
791c93bd6b84d3292c3c161e"
>> +SRC_URI[tzdata.sha256sum] =3D "dbca21970b0a8b8c0ceceec1d7b91fa903be0f6e=
ca5ae732b5329672232a08f3"
>> --
>> 2.42.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#192913): https://lists.openembedded.org/g/openembedd=
ed-core/message/192913
>> Mute This Topic: https://lists.openembedded.org/mt/103372051/7032091
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [s=
kulkarni@mvista.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

