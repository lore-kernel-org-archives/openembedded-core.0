Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7CCC77B7C
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 18:40:47 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.53757.1682793644522534673
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 11:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ExwJPVJF;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-187de655f15so513276fac.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 11:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682793644; x=1685385644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10XygvcI0NFKu1oObcj6nzpYORE4rQV7spaVTf5Ad0w=;
        b=ExwJPVJFWlzp4/tig+/wJ9zpxeSTNM0f71i+2tsUzHDRPVOQiPcQS34X1tDrueMHae
         dTRTGS00ZJUhHc+izm82f7kJW6DN5ba/cCfFzOzmDiK6vw8eqndWv2qNDJHG4yYUwxPw
         ADI89xALOtl9wqL4itytPQnsN4EmsfrnblmIAuZpOKOw7pch8f/xQKWTHxf9ifToi9AB
         izbdkfujgEI+ZeT3dPUqfjaWjzxrsFSTb04R22/RpCzEX0F5kZepK7PxuBuBQAG+42Wn
         joANHUjOuUdczWeJA0ORto0w0JSvPV7L+iPm8mVLeuV7R/OxFELOi2qJaBGScSinZ0Ai
         JvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682793644; x=1685385644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10XygvcI0NFKu1oObcj6nzpYORE4rQV7spaVTf5Ad0w=;
        b=LdoGFARCZXQjme7q+y9kSwDON3bGFoZeFm+XSIzoRm4/2fcO/ENrOhqKx1QdhA5VQV
         UwIqP1nst20zmQre2UhZPrL3CzO3FSbHiD+hBbLZvgpZDy94jZUCxa/F+SXCPyW5Orcp
         oy2yb0+KR74xPP8WrRiA/vPue1iJ21sUonxiX0uIXwd7IdBI0lRzUA/3rUIRXaPgmAJL
         2MyUPuNr6HL8pvX/oYeSByu6uZZwtF6EsWZ+T/jdrJbRTKxxfOti+l++zMvkl8AiVHlV
         kT3hgEQ5v2/MRzVAQi4dVIwRCcMsSxEBIBKUFXT+mk37G8+St0qgNij7EQ5jK61SlCdX
         KfLw==
X-Gm-Message-State: AC+VfDwmKvyz3hxNJ+tWIskXSqQ52aBs1/Kp25A7cmGw6wxJMNquXi5L
	+Opp1//4rZQCMc73rF36NEhP/BQYi8XOq1I+Oks=
X-Google-Smtp-Source: ACHHUZ5IeirMwk0Inp6JHpKvpLpBkkRdPVPz2E5fIQXt4EuzYqLaQD9GHhL8f6vQcPWRMOIImAIGSvg46DnN01FAWdU=
X-Received: by 2002:a05:6870:5a87:b0:18b:19b7:aa5a with SMTP id
 dt7-20020a0568705a8700b0018b19b7aa5amr4659233oab.14.1682793643613; Sat, 29
 Apr 2023 11:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230429150611.1521134-1-raj.khem@gmail.com> <CANNYZj-xUm84mDJch71_MS4GeAMd3EjMCh-whN9K3yOHvVnHmQ@mail.gmail.com>
In-Reply-To: <CANNYZj-xUm84mDJch71_MS4GeAMd3EjMCh-whN9K3yOHvVnHmQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 29 Apr 2023 11:40:17 -0700
Message-ID: <CAMKF1soJF2-5ikQSxjOSKMYvB2dgC_YYu1pGihSZaTUbiU++jw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] apt: Use a valid download location for 2.4.5
 release tarball
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 18:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180557

On Sat, Apr 29, 2023 at 8:21=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Does the upstream version check still work?
>

yes, eventually when apt is upgraded to 2.6.0+ it should be falling to
debian mirror again. 2.4.5 has disappeared from it

> Alex
>
> On Sat 29. Apr 2023 at 17.06, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Fixes
>> WARNING: apt-2.4.5-r0 do_fetch: Failed to fetch URL http://ftp.debian.or=
g/debian/pool/main/a/apt/apt_2.4.5.tar.xz, attempting MIRRORS if available
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-devtools/apt/apt_2.4.5.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb b/meta/recipes-devto=
ols/apt/apt_2.4.5.bb
>> index 429cf6e659..b2b41ab661 100644
>> --- a/meta/recipes-devtools/apt/apt_2.4.5.bb
>> +++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
>> @@ -5,7 +5,7 @@ LICENSE =3D "GPL-2.0-or-later"
>>  SECTION =3D "base"
>>
>>  # Triehash script taken from https://github.com/julian-klode/triehash
>> -SRC_URI =3D "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
>> +SRC_URI =3D "https://launchpad.net/debian/+archive/primary/+sourcefiles=
/${BPN}/${PV}/${BPN}_${PV}.tar.xz \
>>             file://triehash \
>>             file://0001-Disable-documentation-directory-altogether.patch=
 \
>>             file://0001-Fix-musl-build.patch \
>> --
>> 2.40.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#180541): https://lists.openembedded.org/g/openembedd=
ed-core/message/180541
>> Mute This Topic: https://lists.openembedded.org/mt/98578451/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [a=
lex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

