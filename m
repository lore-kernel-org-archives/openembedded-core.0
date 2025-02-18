Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F5AC021AA
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 08:36:19 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.15303.1739867771028207583
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 00:36:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qj5hVK7r;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e66a7e2754so26231676d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 00:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867770; x=1740472570; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgjfDlYqousRmzXCNk5+boRtPjd3mBd8WTYXZQkQevQ=;
        b=Qj5hVK7rQFhP4wWmb3U1bCFVdIo+wxTjKGaBGDy6CXdyjh7xdW8H4wZA3aCBr1O8Fj
         pWR0teEUIx3AC4AHg3XRoB+Otc5uuGrurZxj1FeIkvR67vBUIDXa8LH2wg+0KE/UhcuJ
         Ar2KGsqiuUaaMaED2wajWBR12ddFxeVHCiVwNXAIunE6xixft71gHbS8lxrRXKzrSVaF
         1KvGMkqm6v85vM3YQ5dKAgCXfuaadGzbz8PoUQEDOl7Na3XtU2lE7WmVKzNrSPHnRNg5
         JeM8CSARrWsT6j83zPrQPTPopTJch5/vM6KhuBFyVHM4v4+HtgS9Nnpy5cGvs3p074gt
         wudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867770; x=1740472570;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgjfDlYqousRmzXCNk5+boRtPjd3mBd8WTYXZQkQevQ=;
        b=VWAD+fxkSE2BZnxRMvb1LR0hBWecN9cb0YHCvXdykrVeSo0LqVxYiDor6ss4CxPiRi
         l1YuwubCD3Vaqtf5gBkwugmS52d/HZXO77YyCuhp4mp/oKxGhE6JCUlktjZqzxAfnCfM
         ounhk2e0ValjuJX4tHWcvVf79U30X5RYjcjAf2QjjmlATElTHy6Fgv0g+oki4jw1vd10
         y5YQ9wWmEZoxDbsDKP6sDGCJXBAfSsTBqy884GTBRk0lrhl9epWJVSoTxQcC8bR/6mpP
         LRc+2GzzoAnNwZbdpWV1LMAcOLBINpewC11gsY9wSjsxl6Vz8hS4W3wmwd7MVAd0TGSD
         alQg==
X-Gm-Message-State: AOJu0YwC4czR75uO1BmtEXd9Kxqr5cLxINm9jSt4b/D9vcAf10tgROj6
	Un42oPYs/P+PDCXIpxP1c23L85gR0P0Yu+dMfijH/RU7tbeDXa4LnU3LO/VLC0oFuOkWHTCFZ3K
	tValOpBV4wZkgkb0J0A9NJsZpWuKPew==
X-Gm-Gg: ASbGncsNBJbytGIhzrZrLipblYD143OUyGp3lBfHGaI2wszpXKAGz3XyN61DUYObhr3
	UlyJE+sjMz2zZ/Zp9dQtLxcmQZ/p2D8J+gW/qK5F2EAdA+vvJ1+oCNf/NBOrcCGT3wjfVCjb4Tv
	5bUfMgr5cehu8Klwu+gAl0AdEA+HwfguY=
X-Google-Smtp-Source: AGHT+IEiKICzpD/SBISfnTGoOC4nBn32bFs+z0suF7YjPH7ZV9WcDyKcAb7IXnbFtdC1avpo2HQU3EdKa0sWXeuLV/U=
X-Received: by 2002:ad4:5f8b:0:b0:6e4:2cfa:307d with SMTP id
 6a1803df08f44-6e66cd20ff3mr201909396d6.32.1739867770122; Tue, 18 Feb 2025
 00:36:10 -0800 (PST)
MIME-Version: 1.0
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com> <1739864375-21394-8-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1739864375-21394-8-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Feb 2025 09:35:58 +0100
X-Gm-Features: AWEUYZl25zcgWu7SBnb15xuF7K3ONjzBcBu43fjFeSDu_rQL_OZnqIsdwkk2uSQ
Message-ID: <CANNYZj_BC-40W7tJiL39T1tMH0znb4rQfw82qWvJ6vgp80Nu9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/32] libpcre2: upgrade 10.44 -> 10.45
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 08:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211599

On Tue, 18 Feb 2025 at 08:41, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
> License-Update: LICENCE renamed to LICENCE.md
> -LIC_FILES_CHKSUM = "file://LICENCE;md5=321a5eb46acae6b6c1ff2c7a866d836a"
> +LIC_FILES_CHKSUM = "file://LICENCE.md;md5=8446a1fd12e40d9d64c79234fbb1f812"

There is also a difference in checksum, so something else has changed?

Alex

