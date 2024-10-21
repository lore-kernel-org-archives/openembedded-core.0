Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD763D0E6F1
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 10:55:57 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.43189.1729508150999311256
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 03:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D0r5XZUK;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so4364611e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 03:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729508149; x=1730112949; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ve+Kr+EF+BvimQydabdzNydq1w9zKu2zzUY1PVsryz8=;
        b=D0r5XZUKUbEse9/mF0rttcuQRbFtun+jts4gwBXq+Uj3m38rLmJEapJRa8Bsvxm7+o
         uIER+C5TL3OdoSFjHgVPSto5L1TwwSwGMSHfgI1q4sRcMopvxxSTz1M4Ji2ya7UatP7y
         GjptOxeyNB9wQRWPyIfSohBHWojVPLgijW4dP2PYTX2fMOlO1vMLNwVLNrXZTTFDJ+mv
         mMWpjk2ehse1WmtZnpaQfWC4DOuucuWiW87yxWTzDdYOtu0ZlrYBk7sVWQLlHv7UZC60
         CjjAP72zx34AYOvDkvp4ky4N2KOU9cMKvbrSz892V1+QwrNVJi93m5UDVtbPfBQ0qCrn
         QwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729508149; x=1730112949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ve+Kr+EF+BvimQydabdzNydq1w9zKu2zzUY1PVsryz8=;
        b=U2oUgAG1/HhhRRy6ACmRIokwymAVxRaHbJCcFcz9QMDrShEyo49NQ5a1eY9FsTIre4
         7DN7GomivEEue3Xxr6XHO+pYMokredgg23mU+T8uo6QPMG+VeXfzqE8Ka0aqBawhPsUo
         cIGql6eeWKCK/UgADprHMrnFMeHAPjs6UiYs0BG++O2gUUFcnLd9bTYFky0rhKF6bW+p
         afni10FAQU6tC9f7Mvsbpad4PG2XW2Of6482Rd29xG8pCKZtfgQiXG+gJShzSbmr6+a9
         bFU0h6fROYnKEOilTOFpgVA49ai4MaW+tn0uYqAx1ImbbKCWsPpLjdztv0nglBiqtf0y
         xJOA==
X-Gm-Message-State: AOJu0YxdZxUY/iLbZBFPaUxMW2d/ybtvqmK/mHAyLSJ6aVm6aBAEibig
	0mvFB6pw7XRi5gkgO17uaXpCB0MQCPRd1Gym7+k8esB/7TA9ScaIjCREQmNJlOkdt49DAPcx1/e
	/tpXEr1jaHDjJg1Z5QaCC4gZ+2os=
X-Google-Smtp-Source: AGHT+IGSl8YCjzsWm1RzYMXojOSFY3e1xDJb2fvpuBt8ZIj6Er29gmAhFWgukEs/AbZ5bF0ewt1UGcXnyfVzTp4eLi0=
X-Received: by 2002:ac2:4e06:0:b0:539:f37f:bef2 with SMTP id
 2adb3069b0e04-53a15468173mr4480728e87.17.1729508148905; Mon, 21 Oct 2024
 03:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <17FE0CA1425F2338.24631@lists.openembedded.org>
 <17FFD5DF016C394D.24795@lists.openembedded.org> <5afe4b6b2816613ac715bba3ee2f1e94c2a3cb0f.camel@linuxfoundation.org>
In-Reply-To: <5afe4b6b2816613ac715bba3ee2f1e94c2a3cb0f.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Oct 2024 12:55:37 +0200
Message-ID: <CANNYZj8ZrpWyObbQJReS-dLfjxY3QpyggqB53r_jcqFhTUvXdw@mail.gmail.com>
Subject: Re: [OE-core] Latest AB-INT unexplained mystery failure
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 10:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206112

On Sat, 19 Oct 2024 at 23:48, Richard Purdie via
lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:

> Creative ideas on further debugging welcome, I'm not sure where from
> here. I think it narrows down the issue to the host kernel or qemu and
> these qemu binaries are working on the other builders. The host is a
> 5.10.223 kernel:
>
> $ cat /proc/version
> Linux version 5.10.0-32-amd64 (debian-kernel@lists.debian.org) (gcc-10 (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP Debian 5.10.223-1 (2024-08-10)

There's an option to use 6.1 kernel on bullseye:
https://packages.debian.org/bullseye-backports/linux-image-amd64

so I'd give that a shot, if only to confirm (or refute) it's
definitely 5.10 on the host.

Alex

