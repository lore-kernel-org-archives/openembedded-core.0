Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F4BC28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 20:20:58 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.5158.1741810849740076906
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 13:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TWrrU+Yy;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3f9eeca67c5so94047b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 13:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741810849; x=1742415649; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AvtHmmTaco7ajzz5FTqrVQoY0Zeomzx/JerihhDzH88=;
        b=TWrrU+YyFxu6/A0fKKfgX87TXK1ubsQ/pTzZHbyj6BSW7mMvBXMw46svRjux+L9YYp
         TDE6YfYx3dFL1LyFFY7RBOyb2FXtiRrUTaJszIkyXmaoFmBL5fb5AjhLM8WcqQ0ik7fo
         O6IEjf1K3Km+vHb4uMXxUwE/hqUUGHssyuk9AF5vy9wNGwOnuDyyPhvyQXBnTlXkjYAC
         fxuDemeI8objw1ESn9+bHvTnTPh5I0MBRHnoSdeVZbSws5KrVAOq+2o4ImQ6dHHHwHm/
         u9cpza64sGuhp40Zx8e6dvg9dxXTg813I5c1nqps7itEoxUgKN/02gdZrRRr7DLy9GRv
         JMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741810849; x=1742415649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AvtHmmTaco7ajzz5FTqrVQoY0Zeomzx/JerihhDzH88=;
        b=i5FBCqSTnuIH+u4qJhwiASDscJkgLs/46c17fLJmBQJRkra1D7h/sA+MLVJXJrGLI8
         WaE3CtVOyxgm7ZomACC94OZcnhwNavF0SizGaVmG1VnuAlSaBiEjIA82pXrG0Bca5s2V
         DpUPKhPLXWFgjIC+K7FI3Pd4DmVhDi8isBWO87nPQwLizucKQ1GKGQ/G0DdaRI70AuoV
         5QyDQYe2dzE4G0uWMiisXj8vQQSMqjgLmO7J35IZBAr7tQ0O/AQiq71LEly/s2dPi+Sm
         iQfIMCURZ1acWhziH0S7jMu4faDjf/Dqqjm04K4OA0HrkqeTyRula1CrnnNZOVe6i70/
         aAgg==
X-Forwarded-Encrypted: i=1; AJvYcCU0q2ylN1ZnZDAMtI+UY+Q5QscLgZaFP3C3aFPVqIMDIqK1mTuyUjIbciiT/smugwVV0/YQOTW9/sQ/sZaLVuvfBQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwAszAGTN7e2rt9C+C1AgwC29ugREnRO3GyQZbec4xkHlpVnhny
	Wpe8GwnHvg3Yz5jQkdrQRJsRJw0IizPKpJR358asDtVWm3tVUCnbfQWoZvbJnAKIlGRUW8JLD9R
	xlJ5PJMXzhprTv+nRvDazC761hPE=
X-Gm-Gg: ASbGncumMS/24IdNkcYc3YZourqMFG+IiFMyiUZ2W8pDR2tlSL81XKLGIxyvZuXAKI+
	jvoWa077CTYi8yM01o69Y2Ff3BvDn87JArDvqUciFiXvUiwDdSIjs3xT434OMrmIdtrW+5LBNfI
	ZrmYD2OlxcPdlVsENCqKQBRToCeTBd2zslUtdVa/1iAYwm2ZLOI9j4A6w=
X-Google-Smtp-Source: AGHT+IFi3YWt23tk9tXr7XY7ncBFDDpui2PJCB6Y7VDPpqlxASwhkR+8xqhfQ8eNr3BFHo05oH4urDHs4tT60BLKaJs=
X-Received: by 2002:a05:6808:2511:b0:3fa:adc7:1ec with SMTP id
 5614622812f47-3faadc705bamr4066163b6e.18.1741810848781; Wed, 12 Mar 2025
 13:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250312123610.4018764-1-alex.kanavin@gmail.com>
 <20250312123610.4018764-2-alex.kanavin@gmail.com> <ad57ccc7a58787ef153e08802fbcaacc1119b0f8.camel@linuxfoundation.org>
In-Reply-To: <ad57ccc7a58787ef153e08802fbcaacc1119b0f8.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Mar 2025 13:20:22 -0700
X-Gm-Features: AQ5f1Jpxt2es_m-Mq5gZ1m84i7Ndzi4C6k_hXd1iKz2lKPsZWC1156ZbJFX_FKE
Message-ID: <CAMKF1spKOca7kCEGZiSRXmWOdGVk7Lz79RDo43t7e_tQVLK2Fg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] glib-2.0: address ptest failures
To: richard.purdie@linuxfoundation.org
Cc: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 20:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212728

On Wed, Mar 12, 2025 at 10:35=E2=80=AFAM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> On Wed, 2025-03-12 at 13:36 +0100, Alexander Kanavin via lists.openembedd=
ed.org wrote:
> > From: Alexander Kanavin <alex@linutronix.de>
> >
> > Particularly:
> > - one of the tests requires a C.utf-8 locale
> > - another needs .gir files to be installed
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/recipes-core/glib-2.0/glib.inc | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/gl=
ib-2.0/glib.inc
> > index c6e2d6e1a0a..1e22a59ffa7 100644
> > --- a/meta/recipes-core/glib-2.0/glib.inc
> > +++ b/meta/recipes-core/glib-2.0/glib.inc
> > @@ -157,7 +157,8 @@ CODEGEN_PYTHON_RDEPENDS:mingw32 =3D ""
> >
> >  RDEPENDS:${PN}-codegen +=3D "${CODEGEN_PYTHON_RDEPENDS}"
> >
> > -RDEPENDS:${PN}-ptest +=3D "${PN}-utils"
> > +RDEPENDS:${PN}-ptest +=3D "${PN}-utils ${PN}-dev locale-base-c"
> > +INSANE_SKIP:${PN}-ptest =3D "dev-deps"
> >
>
> Probably needs a libc override as it breaks musl:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/1183

Does it work with locale-base-en-us ? if so then we can use that
across both libcs

>
> Cheers,
>
> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212661): https://lists.openembedded.org/g/openembedde=
d-core/message/212661
> Mute This Topic: https://lists.openembedded.org/mt/111658599/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

