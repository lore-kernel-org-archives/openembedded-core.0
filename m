Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B26E7718E
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 11:13:13 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.11703.1734952383889071103
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 03:13:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K3E8noMh;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d896be3992so23167106d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 03:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734952383; x=1735557183; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DsjnBA+ZIAN1sVcyU09/nzPtQjwyZX/swZK9FDJ1AfI=;
        b=K3E8noMhd6NmXBn0T+OMFaanmZvevDuVbbaG0P9SwIiFa7tkV7+czjAO41GM/Ay/xB
         ISgYMGKUi5ppPQfYf8fShlGKm/YUjlXB1BkyLLHzyhM57YPK+elVotVgEBufESKy4cc3
         UsHDI/RoUuCk4CXgDwgYUhW0cQcqP4M3cijZe2XJwEWb6NC8uIKRdcY4V0xvZMeqo2PC
         MwLKx/sIj4HpMyM+/QIEnVI15dgL1ewXKAsPXZHxnb0BI0MULBiWV5pQ9vUNmpguMriA
         0gcAw5TcOuhJM0zgwPgE+rrcDPydRbawaJAQ2uwQaCYHiv84fwQtJL39x0OEnKpA680s
         uX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734952383; x=1735557183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DsjnBA+ZIAN1sVcyU09/nzPtQjwyZX/swZK9FDJ1AfI=;
        b=mePTu1JEkkPkVoXTAb4EjdhOlVsMadwQnIJkCykKVlMDJ3m3EohAcdj/Rn5IUpL+V/
         tYQbOzJd4WmhXnkMX/+RMbieT5hADdK6QyqBO2ft02SGkf1BfPFg0Zqu/XfzF0KIM9Ga
         5EZiusDjaydkngZZq8bBnQvk7u0j25Y25Xb/BrM46VaEk1wnkzQywFdsFkXZjetSEVbR
         FODQpgs7Lwct7wWP3GQQ90/liI64pF+gZIzH6bssOkp2ycHC3SLedjfrX1io4r76RFmt
         lzTk0V9T+g4NNuz43OZeh/bBUhr9Rf8MN1CxJ9lbDW4C2lno/+WNyzU0Zy1hmV/YiY7E
         LxDA==
X-Gm-Message-State: AOJu0Ywmo9HWKP0xxznODr3MOxpr10frBfdm9S66ROXTdsseDYZw8JtD
	jWyRUT0niDuvCQojvqezkzNa1Dmi6fMJF+nRu50jmX4EI/f5Fc0VfcFK7eAaudoqJWjYPbmJDKC
	FTwz0p0ZfsYXNwdiXCWEXsCmM5RORB2Iy
X-Gm-Gg: ASbGncs90Cc0zMs5zNWJMU4oDoL6HqSTOq7N+rH0+HN/Lh9lRlMc3ShMF0jBRbwHTfc
	xaN0IECva4MskQP/zDM4zG2LHPsZSWkbyCPa3K9Rs1HtpgQqNy1mnPND+VorHv2hMB8hwoS0E
X-Google-Smtp-Source: AGHT+IF1+oAifLocVpt6C3H+x2oGbXj+tzlvhH/ZMEwmIp47/QsQ+Vh0dEjPOz35c4y0Ey0Zh2SkY73gwhfPjUqOEao=
X-Received: by 2002:a05:6214:1306:b0:6d8:ac5d:b83e with SMTP id
 6a1803df08f44-6dd233a8284mr202252096d6.47.1734952382830; Mon, 23 Dec 2024
 03:13:02 -0800 (PST)
MIME-Version: 1.0
References: <20241219144255.3366730-1-tgamblin@baylibre.com>
 <CANNYZj_0CBdCpCxcTfUUjRy+AHfN=gn-dxG-PvoFDpTYdnJSQg@mail.gmail.com>
 <edabfbc7-8c32-4765-b7d8-972b27c38127@baylibre.com> <1812A90A888793D8.26783@lists.openembedded.org>
In-Reply-To: <1812A90A888793D8.26783@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 Dec 2024 12:12:51 +0100
Message-ID: <CANNYZj-Zv8e6n_c2vBKG5VTC8M310YgwgyyY2PNsKmESWBQAJg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3: upgrade 3.13.0 -> 3.13.1
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 11:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209039

On Thu, 19 Dec 2024 at 19:57, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> That's been there before the update too, so it's not the actual error.
>
> dnf is written in python, and -11 return code indicates that 'dnf
> repoquery' is crashing in the python executable itself.

It was mentioned on irc that the crash is in one of libdnf's
libraries, so I went to see if there are any relevant commits, and
indeed this should fix the crash:
https://github.com/rpm-software-management/libdnf/commit/f3302a865b230e021e9defbcea978ed1290a9b2f

Alex

