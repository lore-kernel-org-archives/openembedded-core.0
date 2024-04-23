Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F05AC4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 13:01:52 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.17831.1713877307777993282
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 06:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NKf4V1gF;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516d2b9cd69so6876903e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 06:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713877306; x=1714482106; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Md4tLVvPbojimt7wd1s4nFDDMVry33a6Ds5vVWya3ew=;
        b=NKf4V1gFeiZM2XFUwArZDVsP/lwTKB4yuSWb+3OYGBHPDc1KZyt6UFRkUJyoXu1fa1
         HdzM0FFREvhKuFlamn14QSRLzj8nJVo6sCBtrL2ZO53U6gmbezg+YixREeJbiYwlUY2I
         Ml67q/afqs2oyq0mlJlnY1Vo7f8ngust2nNPH8qFgNtgJjIelwSx9hF62FDGIXjP66gl
         wRLQsDK6cABgDzdKE2GViCE+S28frpMEp+MJVncavJ1QF8dvXhQ9KUfUzy/9B2HAPAtz
         Jjgqu4Xodh1PpRTIV0y/kU6GLxmNvYqU9bE2YEU7wv8Sc63hjr6268NpTtxCzihA6rEe
         VebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713877306; x=1714482106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Md4tLVvPbojimt7wd1s4nFDDMVry33a6Ds5vVWya3ew=;
        b=OR+2zMV+RXn/2AisbZAbjnks3npNC8ykTDe0j02xrM+0wzO8iq8BbFLPedHDxfjs/W
         9U1Sv2VsYV93WCKEBwfH5Oaw4770arFt9yKFMh6lZzYe1s9JA5+y1LLLaIz9kQqh4ajG
         n1FOfNi1iBlswaWSi+dFnDr22+VsFEBmjO3/rmkphZ6DJvhkKeT5QdZcTDNVSS0jB8xS
         VuzmvkN1TvyogtV5zBdjTHlvy8jxKxBkKlDzPOJ4xonJ9VFe4HSrEhvu7qYyW9anIThm
         Fp5ySfOAStNULogqz4kFYVf2hLTUDVUI9GyaHUd/7/iv8ApzGJawPs+jA1NjR5QzFtNq
         BN8Q==
X-Gm-Message-State: AOJu0Yw1juIWkhaCrMUIqmWMTcUPYp1Zddkj8E6OfEsHKkm010DlsUIS
	m0/NIzVsi40qTnmY5YETFGAHmQqqy5Po3j385p7OiWGxgFPHIeJLwGZh/CBv2vy265cwG6IAzR7
	druWpy3Xme9r9f7mSsHQjZO6xv6Y=
X-Google-Smtp-Source: AGHT+IHSk7Ka+TppC/Y2gDQzCwSLEVxMXrn/+8KJ1lMz7stYcKHp2UgDuBU05m5bJHGjGCHh4KpnCU8ggptrwfc5LSI=
X-Received: by 2002:a05:6512:b96:b0:51a:d1dd:281c with SMTP id
 b22-20020a0565120b9600b0051ad1dd281cmr10857489lfv.26.1713877305576; Tue, 23
 Apr 2024 06:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <e574884f-d13f-4e57-b55f-4ffdd9fe3103@gmail.com>
In-Reply-To: <e574884f-d13f-4e57-b55f-4ffdd9fe3103@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Apr 2024 15:01:33 +0200
Message-ID: <CANNYZj8De8ufESxPOFGodeaq8Lvu4-S-46NMNOzNVYuZUU+D_g@mail.gmail.com>
Subject: Re: [OE-core] Set the CMake BUILD_TESTING option to OFF as the
 default setting
To: fbberton@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 13:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198624

I'm not sure I like the idea. This is going to break ptests or other
usage of CTest in cmake-based recipes that aren't under our control.
Building tests is also a test in itself even if you don't run them.
I'd say unless this adds significantly to build times we should leave
it as it is.

Alex

On Tue, 23 Apr 2024 at 14:31, Fabio Berton via lists.openembedded.org
<fbberton=3Dgmail.com@lists.openembedded.org> wrote:
>
> I've noticed that some recipes, like json-c [1], which use the cmake bbcl=
ass, are generating files that aren't being used. This is because CMake set=
s the BUILD_TESTING option to ON by default. According to the CMake documen=
tation [2], when CTest is included, as json-c does here [3], the module aut=
omatically creates a BUILD_TESTING option. This option determines whether t=
o enable testing support, and it is ON by default.
>
> In the json-c example, the tests used by the do_install_ptest task are al=
ways generated. Thus, ${B}/tests/ exists even when ptests are not included =
in DISTRO_FEATURES.
>
> As the behavior of CTest/CMake to build tests by default is rather surpri=
sing, we are wondering whether disabling this option by default is feasible=
 in the OpenEmbedded context. Recipes expecting tests to be built (e.g. bec=
ause of ptest support) would then turn on the flag explicitly.
>
> For example, adding this to cmake.bbclass:
>
> OECMAKE_BUILD_TESTING ??=3D "false"
>
> EXTRA_OECMAKE:append =3D "\\
>     ${@bb.utils.contains('OECMAKE_BUILD_TESTING', 'false', '-DBUILD_TESTI=
NG=3DOFF', '', d)} \\
> "
>
> and then set the OECMAKE_BUILD_TESTING in the recipe that requires BUILD_=
TESTING=3DON
>
> Do you have any suggestions on which steps we should take to verify that =
this does not introduce any regressions?
>
>
> 1 - https://git.openembedded.org/openembedded-core/tree/meta/recipes-devt=
ools/json-c/json-c_0.17.bb?h=3Dmaster
>
> 2 - https://cmake.org/cmake/help/latest/module/CTest.html
>
> 3 - https://github.com/json-c/json-c/blob/master/CMakeLists.txt#L19
>
>
> Regards,
>
> Fabio Berton
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198621): https://lists.openembedded.org/g/openembedde=
d-core/message/198621
> Mute This Topic: https://lists.openembedded.org/mt/105688417/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

