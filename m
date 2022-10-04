Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09B9C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 06:43:45 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.7648.1664865816825785686
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Oct 2022 23:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QLpcPURf;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id
 z9-20020a4a4909000000b0047651b95fbdso8204325ooa.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Oct 2022 23:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=9Bc06zEKYvYIcbuPrkihy+pudQ47klXqcEJnJpU4Ujg=;
        b=QLpcPURf1iuTCC/LgtOggFntZgDz1SFT0g+GgRa16P79liGr/jcSuJha9XvLHtE1TW
         ZL0BeG4trapIam4yT5EHArQrkoOmf20lQsP7axjAYyVsPZRiendw5s4DO2fGSGh9ZeCr
         mLCOtwL1TlgowpKuSTAIhjKwuq4NJOrgfKcg1qfEXWs1S53nCI3Ns8H0vE5IjkPJunNy
         pw0/kFwdEQZr1R/BhPWhC3gohBtsrBpTDZo/I23BAxWFphsxQUOdEq+yUiH6Kyy1c3es
         S5339Tr8UKKh11g6PCEuPwh3XWuSa9jZNIM8LNY++o9DNPvUKNAaNc5MpRUUTQc0WLXh
         Zl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9Bc06zEKYvYIcbuPrkihy+pudQ47klXqcEJnJpU4Ujg=;
        b=PViThZzd6eUyBwQryIAbX0Pr5nL20mAtbHeAQe/tUoWzB84xiCJDLWs0/l8PplnMpK
         Q57YkmZywNRODp/rN4sAhGqsXJL8adX13DNVt99jU7LCQ+l4Wiiy8JGnAXIFwhTMD7Bc
         D/ufl5ou2iU7RuUyZAfrz1Y1ZBSv2zRADmm1nmqKz9r6yHCMudEILiY7ObV0fGIkqcIF
         l+/izU9bdtMB0j4K0YaAHn25xXW030JrLP6FPmo0L4bKFC2MdJ+1iz+mluJMnFNk4GiJ
         iNtU19xHp2H5/sP+nRgQOReX33dsuEs8N7HEEMMhXzUOkig2zaGnYEmXyOhYSKkO0FQk
         gfMw==
X-Gm-Message-State: ACrzQf0cnzUUTTR3CynEDnUiMJ8vgcDBGVq3mZB9noapdNzD7He5HxQC
	FjRZGkEjj4DwmzxwnyWoCRjOxL8Rn1jk3nxsghg=
X-Google-Smtp-Source: 
 AMsMyM4UCaTTQmFu81pP/YY2OZ8SxA00diQRNcPyH87ZFry6B8L+z+6SPyqOVPcisRl6NnYuJJcIHPRE+BKne9UM7j8=
X-Received: by 2002:a9d:6b85:0:b0:660:bb8c:3ab9 with SMTP id
 b5-20020a9d6b85000000b00660bb8c3ab9mr2016620otq.55.1664865816008; Mon, 03 Oct
 2022 23:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220930041614.2704304-1-raj.khem@gmail.com>
 <C9A0CBAD-5373-4F4C-BB73-0AD10A2DF000@arm.com>
 <042F0314-BF16-49A5-AD68-81DFD17739E6@arm.com>
 <CAMKF1srZEorOx-hPiD1zZx1DMiJdZbHgknub04hfyfRFzEhNcg@mail.gmail.com>
 <EA0EFA99-9A83-4699-9D0D-AD5279C58B81@arm.com>
 <CAMKF1sqwQcT-vpk5Ycydd8BCk3OCmPP-zCKZ-MwRr0G+XPHHNA@mail.gmail.com>
 <01558808-3100-4CFA-98DB-244F487435D4@arm.com>
 <CAMKF1sp=ujH14XbTybycQkJWaL93OMfm0dS6FvM_XR+K71EQaw@mail.gmail.com>
 <CAMKF1sp1oqMEXLvXPJhquoFjuDrhc-rtEN5-b05b_FVtYo9w=Q@mail.gmail.com>
 <CAMKF1spSdO680G-gsNe5501L+f5CxcUYt-8eayt8-SwPkKcC1w@mail.gmail.com>
 <DF4844C5-BAA6-4C05-A803-BA1129C1722D@arm.com>
 <CAMKF1sqGKHpeQuDs9tufc7Eu2fnKwutrsuXYKT1bK5j93gC0ug@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqGKHpeQuDs9tufc7Eu2fnKwutrsuXYKT1bK5j93gC0ug@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Oct 2022 23:43:10 -0700
Message-ID: 
 <CAMKF1soJyR2raJv8P-gSHKzpe3FOw+=wuBJu+nmN16dgXSHwqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: Add missing perl module runtime
 dependencies for ptests
To: Ross Burton <ross.burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 06:43:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171374

On Sat, Oct 1, 2022 at 3:29 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Sat, Oct 1, 2022 at 1:01 PM Ross Burton <ross.burton@arm.com> wrote:
>>
>> > OK my RRECOMMENDS:perl-modules are fine similar to Ross, however they
>> > does not get pulled into final image when openssl-ptest is added to
>> > IMAGE_INSTALL
>>
>>
>> That=E2=80=99s definitely worth looking into. This isn=E2=80=99t the sol=
ution, assuming you=E2=80=99re not disabling recommendations in your image =
recipe.
>
>
> Core-image-ptest works so hmm I don=E2=80=99t know what=E2=80=99s wrong w=
ith my image
>

I think the issue seems with any image using opkg backend and adding

IMAGE_FEATURES +=3D "ptest-pkgs"

in local.conf

DISTRO_FEATURES +=3D "ptest"

It does not even bring ptest-runner which is in RRECOMMENDS of every
ptest package.

The core-image-ptest work perhaps because they explicitly specify
certain ptest packages and they bring in the needed deps


>>
>>
>> Ross
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#171349): https://lists.openembedded.org/g/openembedd=
ed-core/message/171349
>> Mute This Topic: https://lists.openembedded.org/mt/94010252/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [r=
aj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

