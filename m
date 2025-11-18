Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C869CEE33E
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 16:56:30 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1906.1763484989804352985
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 08:56:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LIFwsch2;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8823e39c581so79836426d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 08:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763484989; x=1764089789; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0D9jz4I6V+IvK2BkJLFuZSvg2GFVjC8fzKBb/sYr3+8=;
        b=LIFwsch2MI6tOT+osffQoxfo2u3ec2xkF3VeRjri+PYf+fVCrayJnjefRyHVDiDChJ
         Th70ZLQspobfDIeYvvR4Io5te6t+rHPP+dk0m5Vlz28NBEIKxhs8Jg20SDLlblAb32aA
         /kPaQe+YJPFhuDM80ES3w5Lkv7mJSZita6GEuIFWLCiBtcR49mhCe3zSYC9KgCezO67g
         TKu9d7osmUcCj1wRZl4AG6gDSWkiqas2DGzDAy+1/EiVAOESLC63LNQeEc117FJsBmUC
         +ny3hOCxEWFrF9HQ6jOtgv25Yuk2pBxrTVnnGeI2TZizp8sH5M0q7RmWeS+uGv4fKOZC
         2oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763484989; x=1764089789;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D9jz4I6V+IvK2BkJLFuZSvg2GFVjC8fzKBb/sYr3+8=;
        b=xTeo9mivFSSaaAzyaHcSc5moRH1IXVbxm7CzEAhm1orNC7gKHA9/vVZxuc+YEj5aS8
         Bb9Rw8kBUQToz2ky3HsPxL2X0r5jfWqCIYrRoGVuwINQ2i9K1aD9k8y+8TkexPCeFHb+
         PJ6iDG2DVWf9/vXH6xRrZdSb/j5Gg9ebyufs00zILorQr6Qf7UX/OVoyamddPX3m0QjV
         zw8yZDfOeJvma3C8QyYZ/pjY4KbHGZ9euEHeHtzu237rD/hGethtT+VgDuZGLoWvO2Ug
         s/SxFwUO47+jdQoSxVoS8r6FN4Q+WZyOY5ocW3raQm8tR6zEJdI0aMlYcIpBZ9/8OLkS
         i8tw==
X-Forwarded-Encrypted: i=1; AJvYcCXuLkSAzC8XGhNTdY1nLACESrAxTJ3Puf46vZzgtKiujxQVbDHOZUcLhGQ/dgenMgaef7Cm4xtEiwkD7fYSH4l4EQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzUzWO2S5W7pciZh7ThS+Gt6RaxPmysL6dZe3aAiJeqWoZr9gnb
	n9pMMwOU0+9nMNbHGHOsoT+PNsVtogQUv+X4PSovYiRXGGJzawI7pSLRwMG34koguYgsIp6IHA4
	4tl2cQ+Lx4hvhvxyHwNgVG/YbjYLZvNU=
X-Gm-Gg: ASbGncuR8RNwvzNZtxXb1O60zy3pb84k2l+hWWhtFTQyjnTades0iU8jNhrBHAMAjoa
	PmeqyXlPj3U2phKfTu8BwU4DJV86Uh/m5g+8SuzC3oI5oedZGYehY+JfSCfFNsaGF+6rkHsMUWq
	YbLlq0U9WoN9C4ltkYYSoLtAQ4Jm2M7cmadLWdZSCO/OLrDQw11P2M/C7GLh6Qcn0XoGpWwpwfr
	s3zmkNPr8Fl7LK4IPaTxj4Ludxo88J+G3hQ5WeeGiknP06QaxGdR7b+aWcC+Sw2ocJIiKoLB1oU
	cBvaNEc3BiIM/0h716rVNTGhk0YQntTl0n8ou3mJ
X-Google-Smtp-Source: AGHT+IHZlPxgpbT2Q3/kElg8YQgwZ3vXkxMKj4ZusSHC+puu0et+icDeyA3sE7I94CGk/jj37inhtaeY90DI8GJZSgo=
X-Received: by 2002:ad4:5c66:0:b0:87c:2206:2e3d with SMTP id
 6a1803df08f44-88292608356mr201442006d6.25.1763484988789; Tue, 18 Nov 2025
 08:56:28 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb8SJ79GDs5aGpz0MGuNNdKf26Z7nw81yNtAsUr9VNq01A@mail.gmail.com>
In-Reply-To: <CAK5yBb8SJ79GDs5aGpz0MGuNNdKf26Z7nw81yNtAsUr9VNq01A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Nov 2025 17:56:17 +0100
X-Gm-Features: AWmQ_bkuE6AaWWA5avengI4U9gI6ucRMjKRTJlULWefjcytgLpzSa_8pzBkoCB8
Message-ID: <CANNYZj-=_OYQsfqUKoMcSU3m5whK=XwTB3anD0-8XykfqbE5Hw@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 18 November 2025 (WW46)
To: sjolley.yp.pm@gmail.com
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 16:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226531

On Tue, 18 Nov 2025 at 16:55, Stephen Jolley via
lists.openembedded.org
<sjolley.yp.pm=gmail.com@lists.openembedded.org> wrote:
> Patches in the Pending State: 175 (16%) [last week 153 (14%)]
>
> https://autobuilder.yocto.io/pub/non-release/patchmetrics/

These both seem to have rolled back to about one year ago and show
situation as of 2024-10.

Alex

