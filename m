Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE977E8FDB1
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 11:33:21 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41683.1767007996396221091
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 03:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FuVRn6Ba;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-88a34450f19so99807476d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 03:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767007995; x=1767612795; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6TNll0BaUbhogSxQMcf45oKXumMhNyHFU5qSKQTgeXE=;
        b=FuVRn6Ba6qJP0oTvVW037mPg41Bz17KRwqs/P0amP44ERr+zucehj2btIdf4tIKxH0
         tIOWDqX9VQ17B7OwfHULcF3tRsPVcyDgTNpr5Io6d7e9dfOfJS0F77qA5jSiBdE3ySBF
         V1rOC9TpkChvpcK038CElAw0USnkZlo5Q8HEm5TtAi+0UiKYHs+kk/nBCIM69ZeQuPZB
         e+lMkgayqFsVKcOcGqm1Eqklow8z0Xmp1jhyDJWZ2RLb1sjth17WMkVwwVX2cINZNow9
         20KEe5Ec7jwjWmsM3xh6v3Ph0ppYh7mWdVoVuztvubY/AkBYT/F6Jxr/AuroyOAGl9bs
         wZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767007995; x=1767612795;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TNll0BaUbhogSxQMcf45oKXumMhNyHFU5qSKQTgeXE=;
        b=M34HQy2t1+P16+neeNjPROHDNDUYtNN9zUDHffPNIEfXlvmh41aYRuFTHRUmVyuXTg
         TvEfFaRWxQT6PKiiCRzy09R8rakYHWuqkb24EbJDckJF0IUoHg1BnJTGRVJ+Kh6bsgYK
         vqiYXDO7j6TfZF+aQl7zv/6NhXEVgtkG1OeFa2WxjkRBSkHfKDiu5GNe/cHAqqwuINAL
         phf/K/tf4vpdOScxUjsRCiMr7JjUZSxPH4pS+G21Z17vctcZPIG8fSMlYBUBtIo0kCY7
         krilk0i0j2KJL1IaIh6r47gUwjDkq0iu3uXwed9z3Q0xrsuBsnZqKRSxZCvEabn3WbaR
         fBqw==
X-Gm-Message-State: AOJu0YyRo0v52nrl/4Ar0l5orMwFRdHn0+Sw6aVdpjaGppojxzJXEzvp
	vg9aX+58YMv1m9B8MhlSAgUd4e6DD8ABksUOrHrubo7OHyAG74Di05R2YXEOglP/Ok8a49j+q+d
	KZIhJ8ezKCr9FjcDSCzTaAlijOHurO5E=
X-Gm-Gg: AY/fxX7Knkws7xVNpKvXk2/y0iZoxoF7Kwzccju3jIkZ9UH2boNyAlNNYlY1Ov+q8Zt
	ymEi06r1y4U4hoGqsJK51L/eKlXUF1fzmLS8bP2nQr9kt83UNHzrTbQXKcNPXhea9LYHRqMP3DD
	ZcaKGdmzQeJoiFADSyhIhRIgrFlN60rPf7Xj3liiCPgumNMi/uToX4QKy3KaMRwVHLyDcYfYeVL
	xZgPYe2euoylVKJ0VlQ7JKW/jhLgSrAkPPjgt1oPU0YGlfmtr6bjEX6Gx6UfWp3BoE7lA6gHWER
	pzGMHtLM5aTGmUXpw52pLGTnv3NK8g==
X-Google-Smtp-Source: AGHT+IFfmYO4Ve+XlXA/ol9YF4YPEk951TrVZuUROdJswmz+lb+/z+3bZRn9zBO5Mz7ZQlSZXltCq5tYLZT4CIiDnEg=
X-Received: by 2002:a05:6214:e66:b0:88a:3ff1:5fba with SMTP id
 6a1803df08f44-88d83792f11mr513521126d6.35.1767007995349; Mon, 29 Dec 2025
 03:33:15 -0800 (PST)
MIME-Version: 1.0
References: <20251227172301.1967831-1-adrian.freihofer@siemens.com>
 <CANNYZj_S_korZ_5ywcBwdSugFqMbWLarUJDHwfs9qGU_bs8WGQ@mail.gmail.com> <8db22a1126b788f871bec4f24b9ecd53ff8739bf.camel@gmail.com>
In-Reply-To: <8db22a1126b788f871bec4f24b9ecd53ff8739bf.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Dec 2025 12:33:04 +0100
X-Gm-Features: AQt7F2pE9ctwqOB2O8uHBM7Ve9gbOqdz8NDqqO3fEZhmbrs0pMn0iznDSlc3Mak
Message-ID: <CANNYZj-s497xnuC5xvSZGZbtOMZEp0qXuhAQR9HvaXkBf0OVCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] fragments: add a 'devtool-ide-sdk' fragment
To: adrian.freihofer@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 11:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228599

On Sun, 28 Dec 2025 at 16:17, <adrian.freihofer@gmail.com> wrote:
> > I would much rather take an opportunity to set up proper key-based
> > authentication or something else better than simply not having a
> > password. There was already reluctance to having the original
> > empty-password fragment (because it's the easy way out that only
> > delays solving the problem properly), and spreading these settings to
> > other fragments makes the situation worse.
>
> I think we are aiming for different goals: security versus usability
> and reproducibility. All are important. We need to find implementations
> where the sstate-cache, packages, MACHINE parts, and DISTRO parts are
> secure by default, while still allowing developers to quickly generate
> images suitable for development and testing tasks. That's what this
> fragment basically does: it converts a secure-by-default image into a
> developer image.

I fundamentally disagree with the notion that security and usability
for product development are at odds with each other. They're not. We
can arrive at a default that can reasonably fulfill both goals, it
just takes careful thought and design.

Given that, I am strongly against introducing nomenclature that
codifies 'secure' and 'insecure' into variables, class names, and so
on.

Alex

