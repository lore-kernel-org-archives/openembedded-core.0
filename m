Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348B7D13C36
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 15:28:48 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22705.1769441324352953469
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 07:28:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cCzijoBm;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-88a3d2f3299so50667466d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 07:28:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769441323; cv=none;
        d=google.com; s=arc-20240605;
        b=QTXPDSc3AZuQIdRgfduJEFmifrLtXP+Cp+8B8JoYATtEA/iQnb/jsZInHFnxbtUQYm
         AZUAromO90nYjZtXEt6M9Vy0nLFgYqqAWUBZ9lh7FjscRz5fQSUaQEJhKqLKfoFZA4Mi
         1PsaDfLr+8UFeVlXKte6xQqHFPtua5fZfZGjzem4BlKKjHzPxqOLG7Ah5RxSaNq0GoJE
         AOBJGe/yaeOWjGiRDjlpucHoRDmuwIUeQwpvNUVUswdTRs3olVhoFFJBqkSQFyE7xQ8q
         sP6G3JvfNqtpm0P9UH6325gfLpUdGOx+gPUdEWniz0YCBrVInWtGTH2BLxPiphaHTuHb
         ZU/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RaSWFZCO4h1JHS4cwsQx0Hv2fI8siqJ6Sc3QcGxOIVQ=;
        fh=m5E4IPcc9Zn28HhBP4rya3nknwZwVCgfX+x+WYBhka4=;
        b=fSHQunDIoXWEw2QBBGkmrTUIeRIsFQ7vORs6LFMWIOa1viIN6Lsnjcn958ekslSlx+
         2F4JZz+CqlaSXzyJ03zfWPMftQ4FpmxOg33QynH7M+E6Ztj2MFYd+w4QoFYkaFq/mJfz
         J9pczNCsUpSsL/aYzfbG45Gz+4JAxhDrYTVJBs9D2Nu+gh3C4IbRdxy5KazCK7xotRac
         LAEPeSKeArzh7wbH3UB8sWvcyr5DdSwA4leY/lqiJtduLBJw5Bkas/vq9+U82c4EJ6D5
         l+v1k7pwNZtJETTXKKsJMYVZzsbGcLnwDC7lOlfJlBRp52Es2bvDsHhutkJlftRMTn3w
         0czg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769441323; x=1770046123; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RaSWFZCO4h1JHS4cwsQx0Hv2fI8siqJ6Sc3QcGxOIVQ=;
        b=cCzijoBmlc4PIBKewyHDPm+WDdGLOVAIUHsC6TCvWPDwrnPqjayFHBOXICsQpcSdpy
         DJkp1RHudGjXWYMYGq498rTP96jwEOBMmAyYEeSed4QbFAUqjXiK3PMvWC4Q6v92L+OS
         SE+CfW4Mr5K+mY0f8ohV1Bowt8+3WuWQhZHyBCZI6VgddQPZ97dqCQGNznz+2VjPhkGh
         sz+XpOzWY8Fqxra9q57RNh6f4ti2fWdKZgDo3McLfAu70eevE4XJOGJAaexzat1Dl0DV
         V0KzVWW72QGHrLgA33fv0baenvhU4VY37POZtFaBoQcRs7h7jJd4RaTqvrdXzHdYlzQH
         hkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769441323; x=1770046123;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaSWFZCO4h1JHS4cwsQx0Hv2fI8siqJ6Sc3QcGxOIVQ=;
        b=VCom+BN176F8CUr2JYk6ZoMR3d/6edswsReHyfU1m2Yg1C+9lVqNKLzUllFmEci197
         Oc7GSB0jJKHsZW73uSKLIxKPBvkfSdBEkrS6cUbcUJ+p9GYo7Vy9mG3QSKiHXxYHaf6Q
         jPFGV95yXEYKdpDYojuEkB+AoHuo3y5aVCXthnIMo5MChUxk6JEXHZ4YlZ5c4+tcIg44
         S4l+jXnADLHYrVmTXIVsfmw/Wp5B5adUfEugKYbwzmnTgtr8TZNGB9UFkVJZmM/by/lD
         LoKPIcnPZsVO861zzfa/k5ndF5ZckKso3R2MMRYMRTwC8nqILNNTDqoVuubfMB+5ILfZ
         zPOw==
X-Gm-Message-State: AOJu0Yz0ESwi4J5+sj1xVTPyptqG9Nhg8rZnKBLLxBSevOdNqIufutKo
	UXLUSBWwIGnIhREexuZGW7QDFaY2bFiu2YqPDP70CnQYFF0+6e7rx0eBrB/6/8CQd09M4XzDHjj
	ycMkGyaCn+G/pD7iUi0kEikxe2DSeB8x5nw==
X-Gm-Gg: AZuq6aLqMDf7qBUkqsrAXsCfSqT8CZPAdB80GmzKJwrNJ0CG+V7mhA8Lbr5uUizbysS
	7M1mb1M9LqWDauSO3BxNHrFU8eagZGFYCdozFyZ3gLuIR/JGNw64HypJ4GYYq0zfOZQYU9jX0DY
	d/uJDf2IPUYa0auYL3sAakl3BOn63j5BWwXHRk+X1VE7F+rBQijzDWfVDRVqGnrv/ZrDNoPDxd0
	i3mkAqebqFf4brWxMk0GFg/P9En1+aLcdrGtNCa+VXDtRWpAoSkk8NEHUDCVBMK/Q87OlM4ogqU
	wFAqBzKrb2/cYn5yhAvDqBKRYcuZYA==
X-Received: by 2002:a05:620a:3184:b0:8b2:989b:efe6 with SMTP id
 af79cd13be357-8c6f95c73d9mr572160185a.26.1769441323251; Mon, 26 Jan 2026
 07:28:43 -0800 (PST)
MIME-Version: 1.0
References: <20260126140414.11731-1-liu.ming50@gmail.com>
In-Reply-To: <20260126140414.11731-1-liu.ming50@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 26 Jan 2026 16:28:31 +0100
X-Gm-Features: AZwV_QhxABENI_YCBI2LSVp8MGlCCiYcEcERgmDZFaR1j0tUPQtJ7UThdFpOBoM
Message-ID: <CANNYZj_6oyX5kXUvdL018JhcrQPO4QER9zHfaUKYT_X+XrvWkw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] elfutils: fix a compilation race issue
To: liu.ming50@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 15:28:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230019

On Mon, 26 Jan 2026 at 15:04, Ming Liu via lists.openembedded.org
<liu.ming50=gmail.com@lists.openembedded.org> wrote:
> A following error was observed occasionally:
>
> | in function `_start':
> | /usr/src/debug/lib32-glibc/2.39+git/csu/../sysdeps/arm/start.S:118:(.text+0x40): undefined reference to `main'
>
> the issue due to build/src/readelf.o is zero size.
>
> it can be fixed by inheriting autotools-brokensep per test.

I don't understand. If something is racing around creating and
accessing some .o file, it will continue to race regardless of where
the build directory is located.

This needs a proper investigation and fix.

Alex

