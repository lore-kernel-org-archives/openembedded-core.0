Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5CEC531DC
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 17:24:57 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.501.1724174690640574750
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 10:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qum+4FM7;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f025b94e07so63579161fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 10:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724174689; x=1724779489; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u0MkHCM0usdLXpxiqwEpMdDtgiBLui6nAGAufBbauxQ=;
        b=Qum+4FM7V+MOb+M62gHupHWyaVp7BaGEOPhGGf04kzyNYfjgbVh0WNsEa4/g94TGLw
         TjHVsgXvElO8TbYUzwAXXMrimkm3mBwTEyWO3JOG2uv7gxPdve30MVt3sozO+0+S6CHd
         OHcsFcvfqTmr2TjtjNfhOHMjeMZ4zuD303vf8fCZed7jzFGNn/cpcdzsHhLncas/jLfS
         ql3vQBW0bCdP8zXLM8TdMJCIX+kZNPNPSB0KbmECli/BgDBTfe94F8KoWGakQ4FJE5hj
         KRrJvD53RRmXCs59FBWY4E48jrAM0BcisbmA4SpbbrLYkc4uAbij1jrRRoEDBrarN+Zg
         /XiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724174689; x=1724779489;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u0MkHCM0usdLXpxiqwEpMdDtgiBLui6nAGAufBbauxQ=;
        b=Ww7QLsw/4GJO3GcArLPbkb8M6tRTz7WgYSC4sus2xvR1ilPGJAn6sJJZuuvCSvNT6l
         e/V4lpPxfvxMjBFodSD5YMzeF2ATv11SEMOmOlHsJytgYsn9qCiK03pTVsPVtXSt2eaw
         RIfd2xKakWQ9L+ua+h6hTqX8NP2rmgzBsBhO3CSyhLQXGF807xsw9EqvMZdEwl5hR8UQ
         HWGn5Xpt5HmGZ7R2iLe+dNcRO3o//v1Tgd9UDBbS8qmjn7AGGETz1vgNEX375zO2GM8G
         koxKwJAGdIl+xEn5W6FDmP/RiRrRLauMLoy7JE0YuZUya8M4vtTDrechZugucoACmntI
         rObg==
X-Forwarded-Encrypted: i=1; AJvYcCWC3DuADKDdfWKj6xuDCMUKuGxs7DgjXuxstlbM6DMyT4ZRqJZznjLMuEPudxOqMVxS39piNNn1uzjmZqaCh4jDYg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwR362woXXd53YHxRmHIXqHV5U3VUZNx16lKoQn8jTvu6PH/0xd
	XQIIEYxxvxBT5QDpUrhNZZu/MoNr1cbc98VGH1aELgY8XHQL4n/kTOn6FqrveN+2IF0yWK1W3cN
	y3o9etkT7xFHgPqjw0QhglFwdqF0=
X-Google-Smtp-Source: AGHT+IHdVndtVRXJb6fyJ4bozmFcTzSWHnjxlOsOUL6OEfkyd2xjlyHvL9y0QCb5B/hVGq7h0EWSn1MGVIHgzTHcRjw=
X-Received: by 2002:a2e:812:0:b0:2f3:abca:8b0f with SMTP id
 38308e7fff4ca-2f3be5b168amr92457551fa.27.1724174688231; Tue, 20 Aug 2024
 10:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240815140736.3189704-1-tgamblin@baylibre.com>
 <2024082016241749789ab3@mail.local> <4a465e4d-9cb5-462c-929b-1107e5e227c0@baylibre.com>
 <17ED7F9EA2077539.18027@lists.openembedded.org>
In-Reply-To: <17ED7F9EA2077539.18027@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 20 Aug 2024 19:24:37 +0200
Message-ID: <CANNYZj_=bBn1tuTjuL3Setj=CyJX56g4qRc2FoFXpj+0-XR=jg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] piglit: upgrade 22eaf6a91c -> c11c9374c1
To: alex.kanavin@gmail.com
Cc: tgamblin@baylibre.com, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 17:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203562

I looked. There is a condition:

https://gitlab.freedesktop.org/mesa/piglit/-/blob/main/CMakeLists.txt?ref_type=heads#L108

if(PIGLIT_USE_X11)
find_package(X11 REQUIRED)
set(PIGLIT_HAS_X11 True)
add_definitions(-DPIGLIT_HAS_X11)
endif()

Alex

On Tue, 20 Aug 2024 at 19:22, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> On Tue, 20 Aug 2024 at 19:18, Trevor Gamblin via
> lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org>
> wrote:
> >
> >
> > On 2024-08-20 12:24 p.m., Alexandre Belloni wrote:
> >
> > Unfortunately, this doesn't build on the AB:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/9383/steps/11/logs/stdio
> >
> > Seems to be because of this line in the config:
> >
> > DISTRO_FEATURES:remove = 'x11'
> >
> > I see that consolekit has REQUIRED_DISTRO_FEATURES = "x11" in the recipe. Is this the right approach then for piglit?
>
> Only if the X11 support is unconditional. You first need to look at
> the failure log that says:
>
> |   Could NOT find X11 (missing: X11_X11_INCLUDE_PATH X11_X11_LIB)
>
> And then check piglit source code and its cmake configuration files to
> see where that particular check is performed and whether it's wrapped
> into a condition that we can tweak via cmake subject to x11 in
> DISTRO_FEATURES.
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203561): https://lists.openembedded.org/g/openembedded-core/message/203561
> Mute This Topic: https://lists.openembedded.org/mt/107914101/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

