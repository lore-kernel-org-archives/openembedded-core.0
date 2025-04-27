Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80506C369D1
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 14:38:19 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.27392.1745764695486803332
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 07:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NWI7XWBs;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-60402c94319so2225733eaf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 07:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745764695; x=1746369495; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUA4XAXeJAHAVVLpv7jZXAU4BNojbijur80eCA0pv8k=;
        b=NWI7XWBs7INQvex6whA2Duc1lLaQKx4barbaTrAqIBPNzlWF72FCOjGeveJQsbhQLO
         WTZnCkTv9al6L9Qz6uTvNCJSG4c+DId0/kgI+uV0cO77jCvkn5bJ5FxakXbPCx3ypQxD
         DIycHnKW6FWbn0u66NRSnwvUfN1Y6XzNjr+nVuHjtkvpb0340gebqi/7Kk9FTJzg2SL+
         nu8HhFqvCKuNNotFbgFgd57x5TmODG8t85T5/DR5rtdJ1AOLTzdGVXmzgFGqdGE4lrqx
         wyk+EDnUIV1SPa1NT7KMuBZSZ3iEDIokOjc3KxxcmuVfh/baLnVyZcrqD3MPE8N0xglU
         AZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745764695; x=1746369495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUA4XAXeJAHAVVLpv7jZXAU4BNojbijur80eCA0pv8k=;
        b=w6mZtLQtliyzWpXq2NlKRQNFoZ+P0XMGa8ZUMRSgU6b6okEblGUsHG9N4yPRTtj0GW
         /b/P/yy+z6FzzYwTRGGw1NLuA6bChKic10EYUXNQvAI2hcElHgO+Pe8X+O3x0/xuEpb/
         YcyadBOmho+UbW892iOKiazkP8fWkMM4/f4dZeEc6mfbQJ6MZi1ywb7mYw7m07tx2DZI
         Wl5S3uP2oQOfRzdHh3RPpNKeBtGD/ubH5JtlQttWVkWQPBG8LMnMjCR2Fq7ewt6VSq2c
         rfBPRiHFufI/LapycJ58Dj5QIIJnlVxIKf/k4k4Ew1XlJcVl5xILuXpjx4bzt+mMdpl0
         8qyw==
X-Gm-Message-State: AOJu0YzbtL/vQUV+ZunoGKuJ5Jfdi+kyMtLyZh5JhnBVsxQeqU0OTfym
	CeMWvOF9wdcNMYFf4vbYfDXKXnd83JtGvpxxnIfwHwWSnLrWLA1nYher8QjHJLkos4impsOl6oO
	1Ib4v1mkwoVzIqQebj9t3t0bcWXo=
X-Gm-Gg: ASbGncvqeeugUArp06dkT2oTvHAN97egzkTXKhtg124geKjSigJB4RDWvuPWjkMemYe
	pUHv/oazZhMaa8+wFobggGWXMwqKKtQw/dpakpXDjAuNgB5rTL3o/B8AOStfKfnkaxw2GF+7WEH
	AvbS5YpivousBHPncbGN2w1MQdHMrYQhwS8SLV
X-Google-Smtp-Source: AGHT+IGDGFLyp5lIFVO8sCnzUIHEHX5pxVYIhH4qRMbUtqEULiQ94TybVqXCjDmqNPekAZn8EUiiGY2K+kaZnZJDoE4=
X-Received: by 2002:a05:6820:150f:b0:606:361b:52ad with SMTP id
 006d021491bc7-60652b98b02mr4704634eaf.3.1745764694691; Sun, 27 Apr 2025
 07:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250427023232.2771349-1-raj.khem@gmail.com> <ae942e51f15de3980e9e0ba7232d1a43eb6fce84.camel@linuxfoundation.org>
In-Reply-To: <ae942e51f15de3980e9e0ba7232d1a43eb6fce84.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Apr 2025 07:37:48 -0700
X-Gm-Features: ATxdqUFBtmptCCnU_2K2pNW2N784MvCOtRW6fAKDGlMP3ldoNRa2YqMGdeAsMKA
Message-ID: <CAMKF1srLy9LnEWS=r1vA3JmzAzP5QqjMjhd35co+H6=munrrKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] harfbuzz: Upgrade to 11.1.0 release
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 14:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215558

On Sun, Apr 27, 2025 at 2:14=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2025-04-26 at 19:32 -0700, Khem Raj via lists.openembedded.org wr=
ote:
> > Changes are:
> >
> > Include bidi mirroring variants of the requested codepoints when subset=
ting. The new HB_SUBSET_FLAGS_NO_BIDI_CLOSURE can be used to disable this b=
ehaviour.
> > Various bug fixes.
> > Various build fixes and improvements.
> > Various test suite improvements.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../harfbuzz/{harfbuzz_11.0.1.bb =3D> harfbuzz_11.1.0.bb}         | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-graphics/harfbuzz/{harfbuzz_11.0.1.bb =3D> harfbuz=
z_11.1.0.bb} (95%)
> >
> > diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb b/meta/r=
ecipes-graphics/harfbuzz/harfbuzz_11.1.0.bb
> > similarity index 95%
> > rename from meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb
> > rename to meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb
> > index 8945467a001..645e1e42163 100644
> > --- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb
> > +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb
> > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db98429b8e8e3=
c2a67cfef01e99e4893d \
> >                      "
> >
> >  SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
> > -SRC_URI[sha256sum] =3D "4a7890090538136db64742073af4b4d776ab8b50e68556=
76a8165eb8b7f60b7a"
> > +SRC_URI[sha256sum] =3D "477f0d48c34dc32093b45304178eb9733361ca1832b515=
9879c99e6d40227969"
> >
> >  DEPENDS +=3D "glib-2.0-native"
> >
>
> This doesn't seem to be quite enough to fix the compile issue:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/1485
>

I think its perhaps 32bit specific error, locally it works ok for
qemuarm64, I will see if I can reproduce it for qemuarm

> Cheers,
>
> Richard

