Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33077C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 13:43:46 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.51422.1720014218274323241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 06:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=f7AlKKo/;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.169, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6512866fa87so10007547b3.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 06:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720014217; x=1720619017; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/XckqHxcO2tbSKjGtGC31ze+UmeuhfT0ZBs9NiB1Ag=;
        b=f7AlKKo/ppV8Ire3Wth6daUfXjeuOY+tJYtVfp1/q0X1DaOs3jrVlAdMPQbwBCmMpn
         fT1oLqasRoMxiRyXBeIZTUCs0PpcOMB68o6yPwLPKJpQ0WBHb46jtNTIcVMfeJYudO7U
         LzyrQwauzhCluFM+4Sc8yOt0amD+lPiMZ2cehY847wzzfpMe7HJ+BLodUBh4IKcrSDUr
         fb9zrPY2M4ubr1pYPPeFRFZ+sT79ehPqIVGQe6yNeW3JELKu71lW+8tttNo8Plfs4qq7
         r4NHf065/lSZ5VyPoPzxYf0y9GEm8lUeA9g0e5nnjoGyscru9FJEq5zv5zN53JEXB97C
         OFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720014217; x=1720619017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/XckqHxcO2tbSKjGtGC31ze+UmeuhfT0ZBs9NiB1Ag=;
        b=lTOAGAm4n3vSJvWV/LJ7CAL1Aab0eRSEDHLGJ1/wu0JecdhIJDoCqSRJpepAky5bsy
         R/+7LmFnECuzwy3nPV26B6IEHcJe1FCRItAbI/JZT95K1k5TR6K/1GNhO0XuAiHpupCd
         YkTLfj4VlfCVQ+iSfGzY7zxxfbHStW7Kxv1ZYbo0J7x5Esy+i8F/2AIOQbU2yzmbmDnA
         6WgAmQnrFG1ZYYWkjgFffVkM6ifm5VpIpYsaB8oFv5ScaS4EXSV2eaui9tfctCM6lchA
         voFxn8AQrUmU4YdE4diUF7GNEvPpLaVCm16LsdrV+0hlDZmKwisw63D4v/XUEXv+2K1g
         uj+A==
X-Forwarded-Encrypted: i=1; AJvYcCVw/BnlPaL2Co5iM+lrDYF9OoGGKTylY+Iur9qWDg15rdLn0t6kV7zBYKrc4sb3j4TSyHIX6qM2xgUYUWSRH719GwMcAzJJysSW9kO7V9BUYCGcbJ87M2MQ
X-Gm-Message-State: AOJu0YyxCeVobOgUA3M3QI5halZ1XdtzcPpKAvBMTx87oR8Di4cCph89
	FrxDwHIqEjOPbmGNJkTHfqyU3Ejv1oWLw0B78G8gdQ8ovVB1oMKZVGYDAkSANOnKfQRD1g27sHO
	MqDjPtv/+2g881FYCYoiztnxWC0ULnqgN+Ru/xA==
X-Google-Smtp-Source: AGHT+IGVLNNmNzyGnmpy1pxSbxwZ66bIzv7daSteB5PmjnEfrFa5f9lHP23A5+0VHTDyLcx3gCYDPZ4NQdjAETzDN00=
X-Received: by 2002:a81:84c7:0:b0:64b:5cc7:bcbc with SMTP id
 00721157ae682-64c7350dae8mr100558157b3.32.1720014217443; Wed, 03 Jul 2024
 06:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240604070141.3609519-1-richard.purdie@linuxfoundation.org> <CANQUz1_ifXkZrycqrEBHQnLssMrdjvBpvM9fUQDbGbNNji0nsw@mail.gmail.com>
In-Reply-To: <CANQUz1_ifXkZrycqrEBHQnLssMrdjvBpvM9fUQDbGbNNji0nsw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 3 Jul 2024 06:43:26 -0700
Message-ID: <CAOSpxdYZbpu9NwFitFXXKnLE2DJOr6b4UN=LNWrX4JJtXtgSmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-jinja2: Upgrade 3.1.3 -> 3.1.4
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 13:43:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201478

I'll handle this.

Thanks!

Steve

On Tue, Jul 2, 2024 at 12:28=E2=80=AFAM Vijay Anusuri <vanusuri@mvista.com>=
 wrote:
>
> Hi Richard / Steve,
>
> Could you merge this patch to Scarthgap branch from Master. Upgrade to 3.=
1.4 fixes CVE-2024-34064 .
>
> Thanks & Regards,
> Vijay
>
> On Tue, Jun 4, 2024 at 12:31=E2=80=AFPM Richard Purdie via lists.openembe=
dded.org <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrot=
e:
>>
>> Switch to use flit core since upstream changed.
>>
>> They also changed the capitalisation under pypi.
>>
>> The license didn't change but the file was renamed, probably as it wasn'=
t
>> rst.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  .../{python3-jinja2_3.1.3.bb =3D> python3-jinja2_3.1.4.bb}  | 8 ++++---=
-
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>  rename meta/recipes-devtools/python/{python3-jinja2_3.1.3.bb =3D> pytho=
n3-jinja2_3.1.4.bb} (79%)
>>
>> diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb b/meta=
/recipes-devtools/python/python3-jinja2_3.1.4.bb
>> similarity index 79%
>> rename from meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
>> rename to meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
>> index 636fb35811b..2c020370113 100644
>> --- a/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
>> +++ b/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
>> @@ -2,17 +2,17 @@ SUMMARY =3D "Python Jinja2: A small but fast and easy =
to use stand-alone template
>>  HOMEPAGE =3D "https://pypi.org/project/Jinja2/"
>>
>>  LICENSE =3D "BSD-3-Clause"
>> -LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D5dc88300786f1c214c1e9827=
a5229462"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D5dc88300786f1c214c1e9827=
a5229462"
>>
>> -SRC_URI[sha256sum] =3D "ac8bd6544d4bb2c9792bf3a159e80bba8fda7f07e81bc3a=
ed565432d5925ba90"
>> +SRC_URI[sha256sum] =3D "4a3aee7acbbe7303aede8e9648d13b8bf88a429282aa612=
2a993f0ac800cb369"
>>
>> -PYPI_PACKAGE =3D "Jinja2"
>> +PYPI_PACKAGE =3D "jinja2"
>>
>>  CVE_PRODUCT =3D "jinja2 jinja"
>>
>>  CLEANBROKEN =3D "1"
>>
>> -inherit pypi setuptools3 ptest
>> +inherit pypi python_flit_core ptest
>>
>>  SRC_URI +=3D " \
>>         file://run-ptest \
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#200295): https://lists.openembedded.org/g/openembedd=
ed-core/message/200295
>> Mute This Topic: https://lists.openembedded.org/mt/106478262/7301997
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [v=
anusuri@mvista.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

