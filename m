Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5CC2C55160
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 12:39:46 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10749.1785415184831141049
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 05:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cpQjCOXy;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-471eeac43bfso1906365f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 05:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785415183; x=1786019983; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UzRW6PfHBt4xM0nlZVeUPaNA4PDjK7vcHtNmHhz5biQ=;
        b=cpQjCOXy9qkoyLOrJzDAykcUNTV7yo6QkILiuZiWR9sjTntVd/rP9czJ6U/Qu6UXz5
         V/DUSqgnUO8AHe5tTmm7OxdS+G4TW6EoJyAIVPBReTxfJnb5mqz89J7yNk6xS6a5Kkbt
         3jbiCNbeBdrTFRR4L6YqsIqk6umUc+AGmFOXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785415183; x=1786019983;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UzRW6PfHBt4xM0nlZVeUPaNA4PDjK7vcHtNmHhz5biQ=;
        b=WL+QVTroylihA87dMhmtj8mZdEp+p7+B1ntLTlK+zZGZ9ie81hFCiQCYPRq+JdTDLE
         wpdSVJAmn4yIqlYehX0zbQKBBGf2aqWWf7/EFAcyjLaFGr+NQIEkw30cKTFHcUSkBeVz
         0kju8ScYS9I5riziRg/N4iSFZ5XLHiNlnCbp4tyIRWjDOqv/QoVC7U28lCqqfXJ/Uez2
         +wkRGZpxTZG/mtjRpGSQ6smHUyVnhrn+szybacifdSoQTiYk1p+/7qk0U73JBX/o+Pvx
         yIzFXje/a2tvagfb5VR5fNE/0lFV4CXnJk1zeCVJXZPLNYt62DFM6Mfs5HC+CWnpfbmi
         I/KA==
X-Forwarded-Encrypted: i=1; AHgh+RoP0CSuaoX47h6UCxuJaRQPPnVFj+7+lOsoJH1iyvzbd1d9GegtoQzIGXspiQHkZdtg6T80EEXIx6ekFoAwWbf9Bw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzP9CdN5hBWFGtVoa5vEMKWAfE7YOOVnBXlGZuRAz1BbqJCQEDo
	AZ9tp6nUcokz88WO/vuQko6MQ1QYdxKt/Jn+oECwlQa5AvAQ0L1rz2DFpJTYaBJLEzw=
X-Gm-Gg: AR+sD10V9hQog+EaRGkJNdCfRA4tmxU6jDvcFPhhK3VMrGBznL7O4pU7K2U+UIdxqYy
	8NOwOqgoX1CWqyccadqxDBFJ4h9Hn5z22FbYIuXRvsSfl48JlEhaaoJD6jAy8KygRxJ3ePLflrY
	yE8R+BzAoERIZEl+1GnnFz1yawBlDXjkqqhXmqG4djrLUUiVOXkHE2w0wzm9Tvm4ZgdoU0e19I6
	vFrlpBtHjsfq07ooyMcsaeF1n6Ux6ieYqLDAmFVRFMyKDHuGT0TdDUcsLdVip1t6XXJWtRXQZmf
	YmHeBJFmeJpjLRafH9XIEGQbqrwkaf8ATq2uWykgiNuoqd2rdSjcwJy77eb5Q0eth0b9v/QMZ83
	7n0/nbGFI9b8jFCr1QwzLYhHKraMz3p7yM04hOjEszfdk+aqjQmcgs2+45HJy8TAzWBP+ytbjHX
	4Q49XGm/DPgE4ydVk8Lx8FYovjzhO+z9wdFPJOPGqRKpQKLGl/AqB4hF3lhUzukpYP2mQf3BVVt
	zua4rj0Ie9U+pOoOK7/4yNK8I9iFzFleAiD8J2Lo8FzC884cXoT0w==
X-Received: by 2002:a05:6000:2dc4:b0:47f:c62e:9cca with SMTP id ffacd0b85a97d-47fc81c43d9mr3489738f8f.22.1785415182925;
        Thu, 30 Jul 2026 05:39:42 -0700 (PDT)
Received: from localhost (2a01cb001331aa00dd417ef569a828a8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:dd41:7ef5:69a8:28a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc877dafasm5596926f8f.0.2026.07.30.05.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 05:39:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Jul 2026 14:39:42 +0200
Message-Id: <DKBWUZLGTNVG.ZNWPY3U22BE8@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH] kernel-fit-image.bbclass: Do not
 include kernel property in DTBO config subnodes
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Ryan Eatmon" <reatmon@ti.com>
To: <adrian.freihofer@gmail.com>, "Marek Vasut" <marek.vasut@mailbox.org>,
 "Freihofer, Adrian" <adrian.freihofer@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260630074356.10265-1-marek.vasut@mailbox.org>
 <6fb0c748f9cbdeb15dc583483486e12af1c7f397.camel@siemens.com>
 <91b15fcf-715b-40cc-8f77-ff4571946725@mailbox.org>
 <DJO1RET2JWA2.2H0HY5TPUI2T5@smile.fr>
 <84bd480810d947c860b95c3cc10f66fced3cdedf.camel@gmail.com>
 <e4369955-eae6-4c45-b00c-01ca18d94fa2@mailbox.org>
 <2304e3c8-1b90-4bbf-8022-80f19d1447a7@mailbox.org>
 <DK3HZYI7OV4C.YF3JS912EHFG@smile.fr>
 <868f8648-d45f-4ba5-a6e5-7eb5fadb2516@mailbox.org>
 <a84070f4-290c-4ada-86ce-7f601bb8870b@mailbox.org>
 <DKBQEXTZ79PI.3DFEPYRHXLBNB@smile.fr>
 <2327c8bd-c465-43ad-bb56-ac571eadafc8@mailbox.org>
 <0be60525b600137c0f723c7faa7ab5c2f04934ae.camel@gmail.com>
In-Reply-To: <0be60525b600137c0f723c7faa7ab5c2f04934ae.camel@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 12:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242347

On Thu Jul 30, 2026 at 2:19 PM CEST, adrian.freihofer wrote:
> Hello Marek, hello Yoann
>
> On Thu, 2026-07-30 at 13:52 +0200, Marek Vasut wrote:
>> On 7/30/26 9:36 AM, Yoann Congal wrote:
>>=20
>> Hello Yoann,
>>=20
>> > > > > > > [1] https://patchwork.yoctoproject.org/project/oe-core/
>> > > > > > > patch/20260704214812.365483-1-marek.vasut@mailbox.org/
>> > > > > > > [2] https://patchwork.yoctoproject.org/project/oe-core/
>> > > > > > > patch/20260630074356.10265-1-marek.vasut@mailbox.org/
>> > > > > > > [3] https://patchwork.yoctoproject.org/project/oe-core/
>> > > > > > > patch/20260630074423.10306-1-marek.vasut@mailbox.org/
>> > > > > >=20
>> > > > > > Do you think those three backports can be picked up for OE
>> > > > > > wrynose ?
>> > > > > >=20
>> > > > > > Thank you for your help !
>> > > > >=20
>> > > > > Sure! They even are in the branch I sent for review:
>> > > > > https://lore.kernel.org/all/cover.1784364567.git.yoann.congal@sm=
ile.fr/
>> > > >=20
>> > > > Oh, that's nice.
>> > > >=20
>> > > > > Following Paul's review, I will most likely hold it for one
>> > > > > cycle in
>> > > > > order to merge
>> > > > > the test at the same time.
>> > > > > See: https://lore.kernel.org/all/
>> > > > > c791b1b82e236039c614ab41402844c965fdc6c5.camel@pbarker.dev/
>> > >=20
>> > > Are there any news on getting the fitImage fixes into the wrynose
>> > > branch, is this still on your radar ?
>> > >=20
>> > > Thank you, and I'm sorry for the push.
>> >=20
>> > Hello,
>> >=20
>> > I don't mind the push, it's fair :)
>> >=20
>> > This series is still on my radar but blocked on a wrynose test
>> > patch:
>> > Basically this:
>> > https://lore.kernel.org/openembedded-core/20260706221933.4026508-2-rea=
tmon@ti.com/
>> > ... but backported to wrynose.
>> > Ryan was working on it but did not sent the patch, I don't know
>> > what
>> > happened.
>>=20
>> Do you think the fitImage fixes could be backported without the test=20
>> patch, or would that make some test suite fail? Please pardon my
>> ignorance.

The series of patches (without test) did not break the autotbuilder
tests.

>> The fitimage fixes landed in oe-core master 6 weeks ago and they fix=20
>> fitImage usability issues which block me from updating to wrynose in=20
>> multiple projects, that's why I keep monitoring this thread so, but=20
>> again, please do not read this as a push.
>
> I think going with the four patches from
> https://lore.kernel.org/all/cover.1784364567.git.yoann.congal@smile.fr/
> without a fifth patch which adds test coverage for this fairly isolated
> detail is fine.

This is where I disagree. Last time I reviewed this series it looked
good but I had no way to check it actually worked once backported to
wrynose. That is why I asked Ryan to backport the test from master to
wrynose.

>
> Important is: We need 4 not only 3 patches:
>
> Adrian Freihofer (1):
>   oe-selftest: fitimage: Do not expect kernel property in DTBO config
>     subnodes
>
> Marek Vasut (2):
>   kernel-fit-image.bbclass: Do not include kernel property in DTBO
>     config subnodes
>   kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDORED =3D "1"
>
> Ryan Eatmon (1):
>   kernel-fit-image: Add KERNEL_DTBVENDORED support for
>     FIT_CONF_DEFAULT_DTB

Yes. This is the patches I have for this work.=20

> And also important is: We need time for testing on master before back-
> porting to stable. Six weeks is probably enough. But the exact same
> pattern ended up with a broken stable branch maybe one year ago. And
> also this time there was a state on master which was at least
> incomplete (three instead of four patches). But still, I think this is
> ready for stable now.

I agree on the series needing testing. One more argument for waiting for
a wrynose test.
See https://lore.kernel.org/all/DK3HWGV0JCOP.14DJEFKWLP67L@smile.fr/
(from the same thread you linked)

Regards,
--=20
Yoann Congal
Smile ECS

