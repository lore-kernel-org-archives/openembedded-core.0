Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8EBD2127F
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 11:30:44 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.46231.1729164641000996373
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 04:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kgb5pf5p;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539fe02c386so1973674e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 04:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729164639; x=1729769439; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HGb5xNYTcfov69LTT+vefvA+JOpoPL+Y0zW9DNesuWs=;
        b=kgb5pf5pbWnTLs8r4jI9C6QM/wzk+ubGORi4Oy0a/PVfQO5FQ3sgSqV3fT1n3Qf7wn
         PjTmiQdNGAKX74k+sthZ/cNaZEnGeLsie0XI41V0V0ZTG/mMJjrJGX4arHe1REgfSNPy
         Z3WUmIneik3EWqmWio7+iS39JjtII100w6VmKJqxDrWYh32yQZVdh2Ad01FAVdeNAzzy
         wuRjT4wDVturtNrRQN+A9CYBcwcFqvDrWiUgauvMYmvWH7NSfhnV2dFUaAR4lufMFdx/
         RAjMIMyKECQvnuJTN3MiTxdveGoyFGWnKevk0JepsWqhKWp3BU2okjDCMN4UFnE1o72f
         m7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729164639; x=1729769439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGb5xNYTcfov69LTT+vefvA+JOpoPL+Y0zW9DNesuWs=;
        b=w/8w+UwY8v9eSRp1dJ9ngCoJxoIzruMU3DSAn2XZ9KTcHV7lxOggb1hMbSmJwX/3fb
         t4fit1On0xUfz2J3eP/JeYBeeS9dxHyAKe1IlrWPwx/CrgrItx8wbY3EC1lvNMPWS0Xt
         AojI4410p/ouA50wFlZEdxtj4aJgoWvSXyPGQxNBN9eI9DWg4oniQlgJZt4QrCe9ZOhY
         5EpRgYvLg6Ng74cG4pt4MQyU8nTfUqMO8CDJOalEnrFHpXrZBCqKZsNpMwGuk8Q4aQ8a
         9WfHQsg4liQlorOdS6K+BGc1B+g+0GCh90KNm+EJ0zfsW5mi9W/4OJ8p0VHYiemNcZdX
         bcSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLchOPTwTOiyyTtEgfyD0L5aNoGxcdScgYK/RcAOfG7xQ/GDP/wJJdlljBTbfTcQlodhfeLDtFi6TCdN8EcbSAGw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwGoEghIHD63zAOUKV87bNEzyf3lk+v8iwGfr1xiJ7Dj5mIRZtN
	Wf1/1Vku3xYvCRsfzC7qfTHRLerF6mf4XHvYY1PKQCfA9zYWd6+Lq3X/7x5aTheTm3xHR9J/UWd
	t06Gb0tonhJfvVxMytM5yOmHt7Z8=
X-Google-Smtp-Source: AGHT+IFAKG1Vd7lTz8/Bm4UBgvGfM8xdq+FSly8oift6fHxztLuUVeIOZ3sVdERwLXwQPMV3CaZGYo+6PRV53yFuq6c=
X-Received: by 2002:a05:6512:3511:b0:539:f539:73b2 with SMTP id
 2adb3069b0e04-53a0c6c6e32mr603255e87.12.1729164638815; Thu, 17 Oct 2024
 04:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241016193606.3459951-1-alex.kanavin@gmail.com>
 <20241016193606.3459951-2-alex.kanavin@gmail.com> <17FF097430B9CA8B.11625@lists.openembedded.org>
 <CANx9H-A+YJEcstXeh4N74m0N-xtm7AvWT621W18G9MtajG=a5g@mail.gmail.com>
 <CANNYZj-SK3jt365gTkjqh2kZXAqFG=L-vnQeZWPxXYY_0o67Mg@mail.gmail.com> <CAJo0Az5c_viUiQX+OHuDQ9vstsomi6YsCLxXia4qW2EMGNECfg@mail.gmail.com>
In-Reply-To: <CAJo0Az5c_viUiQX+OHuDQ9vstsomi6YsCLxXia4qW2EMGNECfg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Oct 2024 13:30:27 +0200
Message-ID: <CANNYZj9Z-W5a1BnFwxcukAS+F5z-LcTxjjesb6k3RV=U7mZkCQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/5] python3-cryptography: update 42.0.8 -> 43.0.1
To: Tom Geelen <t.f.g.geelen@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 11:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206014

On Thu, 17 Oct 2024 at 13:26, Tom Geelen <t.f.g.geelen@gmail.com> wrote:

> I don't really mind, the goal is that it is updated. For future
> reference, what did you change to the recipe that fixes the
> reproducibility problems we were having?

It's not in the cryptography recipe itself. It's this fix to python3-installer:
https://patchwork.yoctoproject.org/project/oe-core/patch/20241016193606.3459951-1-alex.kanavin@gmail.com/

Alex

