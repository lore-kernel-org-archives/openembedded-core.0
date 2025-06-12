Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED92C61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 08:44:23 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.8021.1749717860225495627
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 01:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XaYSpfqj;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c59e7039eeso97041185a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 01:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749717859; x=1750322659; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PUoAAgnD/V1XimchYjXRlj7CXREZMQOELr3nBLjsb+A=;
        b=XaYSpfqjIlcBI/fAEpi5OzCIHjsMT0ncnchSMbCrA/Ih5M0t0AAyl9PKlnXGZH7rc+
         9RkrBOu4UlFvmpjgrUudlYwPcn/XKd3438I0fsSc9LA1WHzBBDQvKzm3SB9tl2z1ikI7
         xk5leTzkzAKZ13YIWHC6GhdbfcE364XlxXmj03AaDwYGmaqoDcfDEbCG0cJdawaTOyzG
         PU+NMZSINvFjXLj8h2yJ63L/yz+P9fk7hkH5N9MY0D2aNY6fQvj507MFNYzZL9ZDkbjL
         GCr+EyEos1p0CM19Tx9BkdwcjETZWIBZIASmcSAJoeNRQIFNvDYAZ2bEXOR1PtpnTdm2
         CSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749717859; x=1750322659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUoAAgnD/V1XimchYjXRlj7CXREZMQOELr3nBLjsb+A=;
        b=CBT8MuAhoXI3i4maXQ+peSygld9/5ar/aa14RUQUWtw7ed9HZrEtcd4hMjaqn17tZB
         /7YXjQXUZxhv2WjEhtxHBW49GfjKH1/2VPrmNwBkeSIGq7J47Zxp+tsuBFifAUrhZAhE
         NDxyNgShzr3ZCprmgIhTWyRnOOZfVScX0TFObS17waqBBrQ8HaT9BCGi7yksSVFNfMy3
         EP4ls+wCB2LjQzjZW5te5YoAgw8z6bEiZwvu0C+2NZgnHgVV7Z7CjAIhNHV+kz5qzEYW
         X33BHiQTllxjB7Fm5NSJy/ihxoUx7ubO1lFD7ZpBEJyaC3nCGj3W33lOjZALUrqoFOyP
         Ppig==
X-Gm-Message-State: AOJu0YygWip1aiNXY6ytuGO/HDb5/xjPQ9ZFjg4x2JPeGqN2ZH9IZvJY
	6z9NWiH68qXkNTD5HkydqFJk9CBOwTK/M3iRBUEhdr2SRwqYwwpoMczU5MOWHWCZD3XGh2pZEWL
	X0dISrM8ncGEkLnG1RM/Gqn1GJD+7H066qY47
X-Gm-Gg: ASbGnctPvHFcYmWc7I2NEpNAoOu8ncm9uZqzn+BLcdz8ii374swwRX7NahUOckKqoHT
	Q+AMurlbmdRtWn2N/RgZyFMEks8oVJsJQAIKhN5VbEYhaylgBlLR+tikCs8I745FhC34XRR6xhY
	msvlfoeGaVxN84dCEW2OKs9mSCgkonwiYEMuZzDJRmLAyGoEkEBq+0P375RvKhvPHUIdvQXXi/n
	0g6cA==
X-Google-Smtp-Source: AGHT+IGHmLBw0pLO71x1QJwnE7zvEPw7ejJwgIGuFIsFQaFe+9p9LxNlyTnuAC4dRBMEpi3jTN8YTA/3sM7t49whzBo=
X-Received: by 2002:a05:620a:2615:b0:7c0:c046:7c6b with SMTP id
 af79cd13be357-7d3b2a8c89cmr455930185a.53.1749717859004; Thu, 12 Jun 2025
 01:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250610094400.1653931-1-alex.kanavin@gmail.com> <DB5PR02MB10213988D0EE8B84F66840730EF75A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213988D0EE8B84F66840730EF75A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Jun 2025 10:44:07 +0200
X-Gm-Features: AX0GCFtFYVS-b6rUj9_dmuG1jvQWJLQnDcvz531WsP1ZZwzYaddDKqRXrVB6EO8
Message-ID: <CANNYZj_n=_VtVHC6tZCR6y2Fj+HwSrLLw9NoNaBzeBvpvoJh2Q@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 1/9] bitbake.conf: set BB_GIT_DEFAULT_DESTSUFFIX
 to match default S value
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 08:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218487

On Wed, 11 Jun 2025 at 19:51, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> > Subject: [OE-core] [RFC PATCH 1/9] bitbake.conf: set BB_GIT_DEFAULT_DESTSUFFIX to match default S value
>
> This change does a huge amount more than that subject indicates.
> Would it be possible to give it a subject that reflects this?

Yes, how about "meta: eliminate S in recipes that fetch from git via
setting BB_GIT_DEFAULT_DESTSUFFIX" ?

> >
> > -S = "${WORKDIR}/git"
> >
> >  # xattr support creates an additional compile-time dependency on acl because
> >  # the sys/acl.h header is needed. libacl is not needed and thus enabling xattr
>
> While not technically a problem, this introduces double empty lines to
> many recipes.

Yes, I'll see if I can trim these out. Normally I find it hard to care
about whitespace, but this wastes precious vertical space.

Alex

