Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D57C77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 18:17:51 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.57828.1684347464495372905
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 11:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=teBs1aUi;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.54, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4f387d97dddso1358411e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 11:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684347462; x=1686939462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQmf/8JJOXv2IkHhM14d7dBtcCpSdRhzeK48ogkiOgo=;
        b=teBs1aUijzrVcMwfIXGqf82rZGn34CBgXWF2zuMuhX1Q7afSks+hC3rgFM0VoQK14p
         UBZ38DoMtExOOsMsn4yRac6ayHy4LPdfcA8QhA8Oy3f7P4dpLGjM0Z3/5K51bpQaCbb9
         znbDQoUzdhDxNe4qnbF2lwYJUFvl9zRZmgmiSayA+7CW6gzlIQ/PdAhx/SFrpUMjIhbM
         UTtZRg02aSfrjw743l4vDNp+g+Piixp0DpjZNzlae6IWmD0DVgQjTj8rJlb/sBeD1PNq
         S8kVEV2sgNYF6T0LWuIw7y+C9wwA9KPjd9RRNgySiYYceY+5lrbi2E5UCbhvHpRniAhA
         aa4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684347462; x=1686939462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQmf/8JJOXv2IkHhM14d7dBtcCpSdRhzeK48ogkiOgo=;
        b=D+QnD9qfZZkW+Ev3dmn2VWQnsI/Ta7H0MHizA3htzLPuMmKrDVHpAXnxLrsgIRqYOU
         TV8ZORU0NBMVB190g/JLAs/ORJMrIfEiE9yZlf0hajve61twMiS9uk/MDHfKAyRwuTz4
         To5ZGVj0nwv73E4rfwg1cAK8HqeGMlKFJpLf4lRuPpb9O5oRqzGfJ+hFLyIc6P6rSLII
         4xSbLU6jeQw8Y22oyFwdQ7GwhRL7jwTihcQQSdajPajV2l4RfNABSIazJRuirf8b4ivu
         QqCg55P7ewYb2ZRwE96tg5VESmU8uqnkX7QSpcvVz/OLLiET+G3SKb3bY5tgUz6htyLf
         NczQ==
X-Gm-Message-State: AC+VfDxea324TBmk509QKrHw69uS0jz+VPW5vPU2CHhJhuZEmc1+mANU
	ihJOT9g1EF1MG6KCZmpYbGfpcFGdlSpNrw3Pf8RdGA==
X-Google-Smtp-Source: ACHHUZ4KFU64DNQygjB4yEL0a3Y/Z0ZHHzB2fzGmXWOILiSvTf4ojrm/4ehzXUOgCjXTqmqKjQhWgo108SbCtDcAwPE=
X-Received: by 2002:a19:c503:0:b0:4f3:98b4:e45a with SMTP id
 w3-20020a19c503000000b004f398b4e45amr431434lfe.21.1684347462287; Wed, 17 May
 2023 11:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230517080639.9336-1-brgl@bgdev.pl> <20230517080639.9336-2-brgl@bgdev.pl>
 <b021da3e-d485-64db-a5b7-67e2cd4df372@baylibre.com>
In-Reply-To: <b021da3e-d485-64db-a5b7-67e2cd4df372@baylibre.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 17 May 2023 20:17:28 +0200
Message-ID: <CAMRc=MfNGvPzg+-LCTXMeMrhRgDsae614ZX8UoeBcNOVPHcC2A@mail.gmail.com>
Subject: Re: [OE-core][PATCH 01/20] python3-async: add missing run-time dependencies
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	openembedded-core@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 18:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181499

On Wed, May 17, 2023 at 6:15=E2=80=AFPM Trevor Gamblin <tgamblin@baylibre.c=
om> wrote:
>
>
> On 2023-05-17 04:06, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add missing RDEPENDS for this package.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >   meta/recipes-devtools/python/python-async.inc | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/python/python-async.inc b/meta/recip=
es-devtools/python/python-async.inc
> > index fde864601c..53f8d79361 100644
> > --- a/meta/recipes-devtools/python/python-async.inc
> > +++ b/meta/recipes-devtools/python/python-async.inc
> > @@ -9,6 +9,9 @@ inherit pypi
> >   SRC_URI[md5sum] =3D "9b06b5997de2154f3bc0273f80bcef6b"
> >   SRC_URI[sha256sum] =3D "ac6894d876e45878faae493b0cf61d0e28ec417334448=
ac0a6ea2229d8343051"
> >
> > -RDEPENDS:${PN} +=3D "${PYTHON_PN}-threading"
> > +RDEPENDS:${PN} +=3D " \
> > +    python3-logging \
> > +    python3-threading \
> > +"
> >
> >   BBCLASSEXTEND =3D "native nativesdk"
>
> This is an OK change, but the recipe should arguably be removed from
> oe-core instead, given that it 1) hasn't been updated in 9 years and has
> been abandoned in favor of alternatives by the maintainer, and 2)
> doesn't appear to be a dependency for anything else in oe-core or
> meta-openembedded.
>
> - Trevor
>

I admit I didn't really pay attention to how well maintained the
packages are, just fixed their run-time dependencies. I have nothing
against removing this. This is precisely why I split the series into
individual patches - some may be skipped while others go upstream.

Bart

