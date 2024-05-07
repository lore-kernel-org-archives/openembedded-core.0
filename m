Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B95C25B4F
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 10:07:25 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.7965.1715076439643912466
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 03:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HglMCPRO;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e1fa2ff499so43443101fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 03:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715076438; x=1715681238; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TGAvYnn4N1mkEDAVG1WyNf8ZmRyIdgELzKH3U4kJxhc=;
        b=HglMCPROghaifIOcVVl0Rct0loMcbD+IUvj/CObKMKM4OFtrnLGX5gc3oUGgeNoeKt
         y6Rx98FS5bjDPfggesw1NhT4H+ppgH2tP89d8edu/lrZqaplz6gbqbm/VuktiCvu4UPQ
         b/sdwJiUGs7cR4BNo24y9PBw1LyO+Xj5lgJj/EQnr6XCIKdRCEhDokGtXfu57vd5+5iy
         zHqid9GaWxRz6Y+Nr6t5Ve3gYZKESGoFwsRxiRsXZb+OrGGnaqW87u8LnQfcHE3tQ7hl
         eN3r5VqGK6AJpHtn2Mf1FPxo0ctTmaEz8YSOZf3UlB4FNVURy5THlimawUfYsHGx8Bup
         zM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715076438; x=1715681238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGAvYnn4N1mkEDAVG1WyNf8ZmRyIdgELzKH3U4kJxhc=;
        b=kLLfu51aAR+n2UdjwW+bygDEnubGNOEDz4fFulmEJorfo53Zitkr+LAWEv1KgkI0E2
         PVx0F7oCXpSIy+wp9uYk3FvvESIH6bvIunMkrd/CDbFPhJruZKEnpoJGJjvlulDoD1r7
         nhnKGuZ5FfZ4OvOfMoGA9TQFbHll8byVVb8EzsJd1NiFyvNdFXYvUtsJynl6B0eJ5ATH
         V0twLknCpoCe11Ak/eQPxTJkY1o9/7DtmutGaENtuFbvlgoROHnGRAAwpBKkRMC3eK7J
         TXMdN2XwnlEDePvgaGZfNx4kaJvzkqlG80hHyYwE16WDwoEvRGpcZQCQXTFDqLloGTKJ
         EEZg==
X-Gm-Message-State: AOJu0YzGq7scgNL3mLyxKhjSxqZHyg6rEdxw24AqzRCMsPv6IeKnIAn8
	It2Ka0cyZN2zYJiEz1Fh25pSxVVlJOR9Pbsg6J1DS4633EHTZKnO0v2h1MHhMTnKhKBFer/rbB4
	S5srzDauWoife3FUUfj+TseBUD8iPrw==
X-Google-Smtp-Source: AGHT+IHa1K27DDCbZ9mB9nhIpbfKi5L5qnVpNZbowhhbTvOqVWd9aaZOL6p7sltD8DHmzTApKkkm3lKfbuDFHdVmnUg=
X-Received: by 2002:a2e:3210:0:b0:2dc:f188:9945 with SMTP id
 38308e7fff4ca-2e3d9cb3cc7mr5721901fa.25.1715076437610; Tue, 07 May 2024
 03:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240507011455.313230-1-raj.khem@gmail.com> <20240507011455.313230-7-raj.khem@gmail.com>
In-Reply-To: <20240507011455.313230-7-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 May 2024 12:07:06 +0200
Message-ID: <CANNYZj88eZpAJCNC5gk1DdOZe5N5Hzs2iLeFN1XP9QXn9AeKmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 07/10] kea: Remove -fvisibility-inlines-hidden
 from C++ flags
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Martin Jansa <martin.jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 10:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199082

On Tue, 7 May 2024 at 03:15, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:

> +CXXFLAGS:remove = "-fvisibility-inlines-hidden"

This seems like the wrong way around. Why do we have it as a global
glibc/musl setting in the first place? Shouldn't we just remove it
from there? I did some digging and this line was imported from
oe-classic in 2010 with eglibc definition, so most likely whatever
reasons there used to be are long obsolete.

Alex

