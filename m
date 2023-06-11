Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D945C77B7A
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 15:16:57 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.37978.1686496608026573484
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 08:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=o+G/UrJZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4f62b512fe2so4175181e87.1
        for <Openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 08:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686496606; x=1689088606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcnl4u3SD3MlcXrFcQ5IDO5+3L7mLBt5C4WM7adeboE=;
        b=o+G/UrJZ5sknjCC10OVFwDjIYiSahLcW+O7+IvdbmytKotI5AbK/oDwjnhmURID8Xe
         KphNFr0LRZoGw9B2BLCyr/IFJKk2SlZ3mYpZuQRnZnarDMMXrIc1x/vw0vcmoUsZRPNN
         VDVTFZda2nMSDjXZm6/TJJ7pR6GQjVSpIWeBzDPe/2QeOojP8pwszeK927ts74PBgp4v
         R45CSvwG7CM4reIfXfAQUXKYTrUqZNcevv0QN88JLLmCKsqB7amxjLTQqfFHXEWXa/Ei
         2Ku2pl4pUGxpRvpGJHhHE+kMFYmtCCqiBQzJ5dUhLDhpS1f0T30DVwwIBHCV+aZjBj7H
         4ntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686496606; x=1689088606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jcnl4u3SD3MlcXrFcQ5IDO5+3L7mLBt5C4WM7adeboE=;
        b=LsaTnx64gkItZdGdbFtaj20U02Y9R/uqO5Xxp9bOUxuiokg8TMswL/nQfBAUtyLea8
         Y+WwcrzYqDsDAU/9ESWvaI+azIQ4qQCixZbLMSjBp2EJI0KqEh6VyCwA/HuWFLe9oJoa
         tLPy4NEQDDwRsMVn3OWB1VzJxlg6mkHKV6048p0Rq5HZVoDB+FU1A1RvJS7JFMCR1Tfm
         XMutvONeo+/WJvCRlUdZVe8HX+/uVNgmX3AwqAqBVCm/+lu6DzoZGJG6CR3+33cFyRBK
         zF8jxT+ZscRQ+CPQm5nFO/lnHEL1XRBJoKNwakvlnxgKRbgRo4nKgHlf3kwOl/iEjy3e
         NGVw==
X-Gm-Message-State: AC+VfDx5n43FxY6MufJZBDzn3vIU9cYHA/bKd3qnD3Zz0lyaM+rgF0B9
	u3o46uyYBLiFkNud4E9yx2jlKOU6/rq/TONihAs=
X-Google-Smtp-Source: ACHHUZ4qelWY7t34H9EWBbxKG75i9QlsrLaRZi9z8oT1SthIRIoTY9wmFpePZ2lQ/dr6XswaYN+XREgKPcrNGO/3npc=
X-Received: by 2002:a19:8c52:0:b0:4f3:baf9:8f8e with SMTP id
 i18-20020a198c52000000b004f3baf98f8emr2556234lfj.4.1686496606022; Sun, 11 Jun
 2023 08:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230609064802.11777-1-alexis.lothore@bootlin.com>
 <20230609064802.11777-5-alexis.lothore@bootlin.com> <ZILME/DYo6hUkXv0@nuoska> <212cdfaa-12a2-e292-ea51-7432efaef913@bootlin.com>
In-Reply-To: <212cdfaa-12a2-e292-ea51-7432efaef913@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 11 Jun 2023 17:16:34 +0200
Message-ID: <CANNYZj91ma6TFrZGsYegK6ZpQMRKudN_K6hqSW-o81MA2srntQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v3 4/4] core-image-ptest: append ptest directory
 to artifacts list
To: alexis.lothore@bootlin.com
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, Openembedded-core@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 15:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182620

Doesn't +=3D override the earlier ?=3D (or ??=3D), so you lose what was in
the weak assignment and end up only with the value in +=3D ? Yes, I'm
still uncertain about this after all the years :)


Alex

On Fri, 9 Jun 2023 at 09:23, Alexis Lothor=C3=A9 via lists.openembedded.org
<alexis.lothore=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Hi Mikko,
>
> On 6/9/23 08:52, Mikko Rapeli wrote:
> > Hi,
> >
> > On Fri, Jun 09, 2023 at 08:48:02AM +0200, Alexis Lothor=C3=A9 via lists=
.openembedded.org wrote:
> >> From: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
> >>
> >> TESTIMAGE_FAILED_QA_ARTIFACTS is defined in testimage.bbclass with a
> >> minimal list of files to retrieve when a test fail. By appending the p=
test
> >> directory only in core-image-ptest.bb, thanks to multiconfig feature u=
sed
> >> in the recipe, only failing ptests will lead to corresponding ptest
> >> artifacts retrieval, instead of all ptests artifacts retrieval.
> >>
> >> Signed-off-by: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
> >> ---
> >>  meta/recipes-core/images/core-image-ptest.bb | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recip=
es-core/images/core-image-ptest.bb
> >> index 90c26641ba3a..e1be81bb2666 100644
> >> --- a/meta/recipes-core/images/core-image-ptest.bb
> >> +++ b/meta/recipes-core/images/core-image-ptest.bb
> >> @@ -28,6 +28,7 @@ QB_MEM:virtclass-mcextend-lttng-tools =3D "-m 4096"
> >>  QB_MEM:virtclass-mcextend-python3-cryptography =3D "-m 4096"
> >>
> >>  TEST_SUITES =3D "ping ssh parselogs ptest"
> >> +TESTIMAGE_FAILED_QA_ARTIFACTS:append=3D" ${libdir}/${MCNAME}/ptest"
> >
> > Why not +=3D ? Also, spaces around =3D.
> >
> > If :append is used, bbappend in other layers can not easily override
> > this variable.
>
> Good catch, thanks, I'll wait a bit for any more reviews and send a new v=
ersion
> with this point fixed.
>
> Thanks,
> Alexis
>
> >
> > Cheers,
> >
> > -Mikko
> >
> >
> >
> >
> >
>
> --
> Alexis Lothor=C3=A9, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182541): https://lists.openembedded.org/g/openembedde=
d-core/message/182541
> Mute This Topic: https://lists.openembedded.org/mt/99423382/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

