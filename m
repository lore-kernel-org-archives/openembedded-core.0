Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09129EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 16:40:00 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.63067.1688488791552708030
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 09:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rHwfM6JW;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6b8decf09e1so495403a34.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 09:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688488791; x=1691080791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjDoYCNBC9bGhd9Kf2TkDMjsTGkkGT5iVmTAZwPrhAg=;
        b=rHwfM6JW8fybKXqOEEZICBy/izEFonxuVqKo7hA9Wm7mCrTiVPdrB5iEG8KNpNiNHc
         DbVDTDnUHG/oczPWgYb8FQ/eQaOd4Y82409GwyzyugVLXIpEvKQsiQp/UJ68m/qaCFnA
         6/htgSU3ObxgiOCPzpW4RkWus705hZevaHWi4j2GdiFvsuQQ183b5xjDp8Sl1EzatYfE
         gRPJSXrZW/++DIsOuaqHBj57/33BmpD2CvTn3TzTgifnutHlrCTuV6Oyz1YCTwqDsUXE
         08+syGL2hsV+rri8Xnmj6qVynbX+bd7Wu1eIrv2wUW9LvwpOZpe9k2u+l4GIe9m5a4Av
         7pOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688488791; x=1691080791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjDoYCNBC9bGhd9Kf2TkDMjsTGkkGT5iVmTAZwPrhAg=;
        b=d0QC2MkvPZlTLvvMSsCiDenI7Qbbe8PuMnjRSuAohnj5+M3eSCWxifiIm/Bn8a/ao2
         UFcFE+8K90KxhcWi+LCkHQAAbw/QHM19Y+9zOecKpfFdcBfcLeEwXUBufkje5ZOsQyBD
         TbyWNqwmbcBKtiXPUVi0vICQFxomatoNnCvQZLxXwi91Ya6UUMMOWWdIq+Gc/MrVKtJN
         0gjVCmJ1C+rngzVWBl++0NPVaCnOon3x+bOb7BKvCbqj6KyTiQGecg52/XpLQpnlM7iA
         2tvea1jE++Zz26XUmc8RqzhqVhtJfA8tcEQXa34i3MKPzWw9EC/6etuDAw6btwFp3Qs4
         EqQw==
X-Gm-Message-State: AC+VfDzgCrUcWqcz1SHa8fxpRkkbGkJnwZ8+Oa+2DG48qfixLPXZ6vzp
	kKoD4cXjMludi/8n2BIOaLnc1EsVfb6WRLPl820=
X-Google-Smtp-Source: ACHHUZ6ZHJ1munHA9aotx04IvQ8OjXMb69++oC04KsGi2Oa/unlGcswgqI87R0mcf1707ksJ7bASF2yWmRPoLOewu3s=
X-Received: by 2002:a05:6808:2197:b0:3a1:b941:fb4b with SMTP id
 be23-20020a056808219700b003a1b941fb4bmr17854902oib.3.1688488790642; Tue, 04
 Jul 2023 09:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230624053223.228117-1-raj.khem@gmail.com> <20230624053223.228117-2-raj.khem@gmail.com>
 <20230630133051db39352e@mail.local> <47BAE092-A229-4277-9452-309EB327B0E8@arm.com>
In-Reply-To: <47BAE092-A229-4277-9452-309EB327B0E8@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Jul 2023 09:39:24 -0700
Message-ID: <CAMKF1sq_02EBHEHUc10GJ3oZnjdfnHsFGGyon2X-0UpT6zeQ6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] libxcrypt: Limit to enabling strong hash
 algos only
To: Ross Burton <Ross.Burton@arm.com>
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 16:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183867

On Tue, Jul 4, 2023 at 3:54=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wr=
ote:
>
> On 30 Jun 2023, at 14:30, Alexandre Belloni via lists.openembedded.org <a=
lexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
> >
> > Hello Khem,
> >
> > This causes python ptest failures:
> >
> > {'python3': ['test_crypt', 'test_methods', 'test_sha2_rounds']}
> >
> > We should probably disable those
>
> I would say to send a patch upstream to make those tests not depend on th=
e unsafe algorithms existing, but the entire module has been removed in the=
 next release of Python=E2=80=A6
>

crypt is already deprecated in python 11 and will be removed from
python 13. [1] some packages have opened issues to track it
e.g. [2]

[1] https://peps.python.org/pep-0594/#crypt
[2] https://github.com/saltstack/salt/issues/64263

This is good but perhaps a bit early for us to act upon it, since this
would require packages to migrate away from it to use hashlib or
some such equivalent module.

> Ross

