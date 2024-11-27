Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC255D6D23B
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 20:43:32 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.81565.1732740205072071044
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 12:43:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WG3Ro1nc;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6d4241457b7so1282996d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 12:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732740204; x=1733345004; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FClUOMtfEOicj4yRxCHLA/5vHjUUnV9kOutPOhOrOJ4=;
        b=WG3Ro1ncwLoB07YTcNHHg0+ispHUan63dQacrKCFaHsxkKOr2OCZPjxB0YiT+GUUv6
         WZRA4DfBvVu0ojOXOVd4R7BRWHNNCf5W5+z09An/jkkhJRAlE20w1MpkMVOaocsho0B5
         CXGHhBIFIXbggyj68OF8PRX9hHnb/FWOnNQt0tpbH/YQ2JVaHztGWzOZ1hYeXlaA/Gsy
         GRoKzUa1yLbNuVbcdlF5cVPknyrZmOt2xH9ruregrtwXwqnwW9hPzuA3RQMHJq+NyKlx
         7F5y+8N2tVJ2henvJsoQjk6vwxGjd+PPSNV4IEl0LSKb+jKd8yaT1MAmdReQ3ecnwbXY
         1IGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732740204; x=1733345004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FClUOMtfEOicj4yRxCHLA/5vHjUUnV9kOutPOhOrOJ4=;
        b=fYDgVXY5Rj5Ic7euOCEB5Yp90soFI1tsbBo2XVUqYjVFZPAOnwaaB5oSuNxaU9g/Tt
         Q5c9VLDZ6NekpaiTZqsX+dR9KU1pyM1bo4CPKxwuS0y++e2HBUOj21y8f2q0gQnfMMhR
         7Bf8BvjykbQv5d+mHbz5kXQ3j1N1qQ9TauwErit7+l1hbJXTCWZrKD2dKLLi0NeM5kaa
         2Lz0CLSEvMwTyoMNsAPG1sZdMJFFiQqw+UP6NSN1MR9rZvYMp81q/jSgd7AKmiIMhBQk
         mkUJNtnLXhTUboQqqAjKiy1pkBf2bPlLjPM7fm09NAv0ZVepUcRXpPuj3d7PvqFWd7ag
         rNPw==
X-Gm-Message-State: AOJu0YzV5hljndnljrbREr/i9pJ0ly2ZpGD0XnqV0Dp8tC+STGR71A9x
	sxABoOYdzi2FPdri/aoG4ptJz+nzBD1RmXd64yTNoc5dANN7Mw1hR7DbSpomLBy5ZxgjbXUUCMO
	wtO3GKRTefZpoL7Ya1rVAUDdZpiNYDwr+
X-Gm-Gg: ASbGnctdqPrd4NqvEmTq79kaYPCTv/7yniNzA/ztRoLiT27Lz++L85lIV7epGAZ2ULf
	TN3HtGW3H2ib2e3HRZe817Cp0zJS4JnxmwVwAe8MHCSse2XniNY6ZS4FWsosE8pPPCw==
X-Google-Smtp-Source: AGHT+IElG6dd1MO2wR/d8SwNQEHZ7hextFkuhmLrqRf9u8hoVErSrN3aAxR/RpeWa6iNfXNyu0LVjiZFBQRpo2QGdRE=
X-Received: by 2002:a05:6214:1948:b0:6d4:2044:e93e with SMTP id
 6a1803df08f44-6d864cfdb42mr56870256d6.3.1732740204023; Wed, 27 Nov 2024
 12:43:24 -0800 (PST)
MIME-Version: 1.0
References: <7c42e340baae4038324e250583e9395fb8d90463.1732725209.git.joerg.sommer@navimatix.de>
 <180BE0EF5E9B4D74.18476@lists.openembedded.org>
In-Reply-To: <180BE0EF5E9B4D74.18476@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 Nov 2024 21:43:13 +0100
Message-ID: <CANNYZj9=1uvN04NsKFJyn2yS5MGDc_6AFqAaJU13Lpiv9DjSQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lib/oe/utils.cpu_count: Raise maximum count
 from 64 to 192
To: joerg.sommer@navimatix.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 20:43:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207965

On Wed, 27 Nov 2024 at 17:43, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> Please read the original rationale for picking 64, and provide benchmarks that actually show better completion times with the new setting.

This was the rationale:
https://git.yoctoproject.org/poky/commit/?id=c6f23f1f0fad29da4dee27a9cb8219ae05a8bfd5

Alex

