Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0499FC83F34
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 10:08:26 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.10289.1753265300639001108
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jul 2025 03:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nk3syIiF;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6fd0a3cd326so69109576d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 03:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753265299; x=1753870099; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=laeLao6UoX17yiTLVbI9IPdtdXyv2+iL5Uub7KjV8F8=;
        b=Nk3syIiFHdZdB9ek3mOQHcn2X4Cz8gcjLmIKPonEr6KWpU9x1NBilCOQpfpt1bmn3T
         iHZSzGBKR92j+d+54NG08NvC+huv0hb0xmOtw5wn/Y6jtk42Wl6LNIFVgoDSbiesfnn3
         mYc+A3SOrfMH55Pv4E0htJIfBKXRiRa+eBZY+RGBjgiroqvcnuGmPWjN2fJ+SCZiQOw/
         gacJ7kMNEeuHFg9GUxibys700IR115AGiVg12wVTjfopniqFum9AsXKfSSRleONvg+42
         FLYsEJ9jIrJm2zYrAtR5I81tO5ZrIKsX7NW080he7ctQvuWqWzHEdGHFHUpd+KQk5d2k
         H+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753265299; x=1753870099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=laeLao6UoX17yiTLVbI9IPdtdXyv2+iL5Uub7KjV8F8=;
        b=RGTmpY5R1ZITE/MOW2qCmaPxhJv5db9LIjKGz+AgcT48hT7BgvPdAVPLEEs6RbCACu
         ZwVNqrXJge8wcf5sBgCbbnKjgIELS9GZHUqucjvNXd7bV/nmqr13h/yeggEJTXvNb/Xk
         LwSHur7VrEx7OBwBDPSJz8P+8n1r5MK+3Bwlm6gaFxRtyB7bdjsjZeqxoQw8NoLicTpX
         V87FO6KtetCt3pYc/JZeYiFZcZWfXIptqMICLum3n37PSVrbSZFjFmtrwr0A/8ssGJMo
         q2pdEggED8WlEQzv/pDTXxVVc4lVlDiqiq+ILsTYALY8Lq/SGi52uwwST9tVa9IYNUOG
         NOUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2a4/0344ScOs/CEHM/lIhtZS/DpIZ9rAqeM9Ut+KP5fzT6TDYSlmcOxuXa3bx01VnFlRGL5HF4b+nwGqFC5WLnA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwttcWdV3DRjuQZNtEIfseLX9SB8RpjloRoPoiunv2U3oWey5Jb
	XPXQTp6CLJSFerUiluRZTDVMXpOBQ5QO8ue6qlaZprxkSWKO7y4Yzv0xraEYb7a3n0sNERAgl3/
	O/CzZM/ORmc7NKmb8DJoIdYJBPe+CqJ4=
X-Gm-Gg: ASbGnctrW1reC+RaH82BXl+czi8ngczUKpxJ6PPJdynzJ+Z0ZglOLwvWLrmL2cR28ii
	wDyClvKINTJe9Axyr4thydbOFtpRbgQYDXc5AVmB62Wof6uc5cbJvciuYVvzK3C45+RLEqRsb2e
	nOPkJHoQMn3nBXIzkfAkH71pAOenE2yNPo6wrpy9tIhnjgCvyTyEFc1V0u+bLbu8QP8qpHEPnwz
	Eu6NMI=
X-Google-Smtp-Source: AGHT+IFjWaINwg1gZ16Tv1eF//k7RXlVE3Ie7U51SM4hDQwRwGfe6nm1Omo7ygyb9ubSgzOeCUkbkze2oHBsSkQJbQs=
X-Received: by 2002:a05:6214:20a7:b0:704:e0a9:f815 with SMTP id
 6a1803df08f44-707004ad000mr32492286d6.10.1753265299409; Wed, 23 Jul 2025
 03:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250720090010.3122861-1-mingli.yu@eng.windriver.com>
 <20250720090010.3122861-4-mingli.yu@eng.windriver.com> <CANNYZj9f__cZUjYT38jyYPiVTFtwiP1bWCwNt1H4mWXBwUMh+A@mail.gmail.com>
 <8ad50cbc-ca25-4253-ad02-411db0f8f234@windriver.com>
In-Reply-To: <8ad50cbc-ca25-4253-ad02-411db0f8f234@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Jul 2025 12:08:07 +0200
X-Gm-Features: Ac12FXy0EAbFNOCDX4_etjeai6dT4MSJII67MS7prqv8uMyABGY1SuxrPANtjX8
Message-ID: <CANNYZj-m_=3knEP_4L7KMXqxrWWm5tHMV2AcD2kAGQV0_cghoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 4/4] lttng-tools: Remove the scope resolution
 operator with musl
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: mingli.yu@eng.windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 10:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220800

On Wed, 23 Jul 2025 at 04:13, Yu, Mingli <mingli.yu@windriver.com> wrote:
> >> +Upstream-Status: Pending
> >
> > Please no Pending patches without a clear reason. Submit upstream
> > first, or at least report the issue.
> >
> >> +SRC_URI:append:libc-musl = " file://0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch"
> >
> > Why is it conditional to musl? This will cause complications on future
> > version updates.
>
> The build failure seems only occur on musl.
>
> I will report the issue to upstream once my account on
> https://bugs.lttng.org/projects/lttng-tools is activated.

Per Khem's review it's ok to apply the patch unconditionally and
submit it upstream.

Also please use
Upstream-Status: Pending [account activation on
https://bugs.lttng.org/projects/lttng-tools]

Pending should include a reason. That is not enforced yet due to a
mass of legacy patches, but eventually it will be.

Alex

