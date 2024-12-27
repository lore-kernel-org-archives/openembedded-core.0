Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BACBE7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 18:44:52 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.17493.1735325083442150037
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Dec 2024 10:44:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SdbIgSv8;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6dd1962a75bso54846656d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 10:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735325082; x=1735929882; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KzrWN5t4WWniELhxtkTL+1brOeJoeMTzBfaaz2tEOE4=;
        b=SdbIgSv8pKKdK82kAV/T8Y7l2Fw5G4r35A68UwOtLT+Y0eI8y7FtYXBw36PVhYLGE5
         R+6NKrN0M2ck2V5erDkm3PO8eY1dY9TWM8lSKULX5lR/oFLcWyWZnozDf06qCsmJCG8j
         s+MKdFRX3cplW6i3+jcBlbRTKUkRJg/6sL8LEBIQcydfX8GSRiA4EGodQEm7dhHbjBDQ
         9zuaX/DWiBEkanM5EkoPzQyUocz+7tXm2YZnsofA/Jhy8TDo97dCaNqwtrxfg6jVbJ46
         a3WoBk5C3p1tGqGB291Cc/lJQjML+Ydt8/MBntOgU8cTGIJIMSin3B++gxfmGQLxOVbh
         /9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735325082; x=1735929882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KzrWN5t4WWniELhxtkTL+1brOeJoeMTzBfaaz2tEOE4=;
        b=dMbIe9seYdR+0jxOFgAZEdsS0hyQeINDC+ewL2FAf4jQZ58kZWyI1gkJppm7PGei0U
         oJ9R0n5D/euuOXx+ZBbKgSihYRgNvI1J5uqczU03GC5EgG4ZlWW3YW6R6fscSWcrcYfq
         gYxJKYI5jb7LvcIFIjMC1RTZz62Mh+XYSA2Tx5ZleQdqBIEdPgA0jB6yMcx7+FQB2WIG
         bAkGntpBIX1dpIYylJ/ZM1apoP5IhQ25UrEHamk5dU4aj1ceEi9An/6nFbsTqBG1Bnca
         VRylsjPOO8qaxEJ+OT12tICfsR4KXoLqGKwwrIW/DFm+DdN15YYkq/zKJmohPMJKWZbv
         J+8A==
X-Forwarded-Encrypted: i=1; AJvYcCU2bwZp8c7gPXiJ0fmPzCnxGDe+/wgWKJlhq+4d0WWyxHo2UoZVVOUfI8ayr7H3dw8KfPFtcULdlGPGbUThzAgEhg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz4buKk2lLusqegegiensao3Le4r9UwlzeJUfsVv4twHBWFRDAZ
	jF5Cwzoqyh52/OIGFy1nFKF3Zjf6kt+QWm1T3XhqQM+GMkHh+P2oo0UjvGZfLYBLB0Flx0FjTXY
	mDdDmMS+MxrspPGP/B/MKEA3KK28=
X-Gm-Gg: ASbGnct/lagBlHCL21gUpFGSTbN0nWTFRMUMQIRboijA6KUm2aEBXZriiSDBA/HVsMK
	h9Q7XlT1X8zQYesWPyMtO2QKOUUnstFa1Z5ouXohoJciazvYLV+ryq7FDeZNAxAhpiF6kLJ49
X-Google-Smtp-Source: AGHT+IGIh3uPSwzf6WCxrAS85ffRVB+va04JClru2uoVtaUDj8H9Xf3bbAzZObFFHwykyf+qtX4GxvKAWuB4equT5qQ=
X-Received: by 2002:ad4:5ae9:0:b0:6d8:8fdd:9791 with SMTP id
 6a1803df08f44-6dd23357fd8mr552405126d6.25.1735325082456; Fri, 27 Dec 2024
 10:44:42 -0800 (PST)
MIME-Version: 1.0
References: <20241118162643.1423409-1-alex.kanavin@gmail.com>
 <20241118162643.1423409-3-alex.kanavin@gmail.com> <c799588bada27abdf2b412115868c5b84c24a0e2.camel@linuxfoundation.org>
 <CANNYZj_ONOGam=9um4qqqAc_D0gQHrQML3a9eXBEgHLCiRtM1A@mail.gmail.com>
 <4254d23ae9ad100e70f199fa4949ce00bfe7063c.camel@linuxfoundation.org>
 <CANNYZj-Ox6t8yV7Bh2NePmseYCW843Z5ozq50y2Tyoa=GeDPyg@mail.gmail.com>
 <1647f808543a0851f5a1a17e293f1a68970f7c0e.camel@linuxfoundation.org>
 <CAJdd5GYwyLGFs_nreXDNV6F8_GAiTBMhWOe6V_TiO9aw+MCOng@mail.gmail.com>
 <CANNYZj8_OShX4sPqhGpb3HSbN0quMKUcoFtKhLrcGTLtG1d-Qw@mail.gmail.com>
 <CAJdd5GbRf731WsnMZujR3SUCVUhm080f=F_iZsFTuZxt1kQH=A@mail.gmail.com> <CAJdd5GZwku_0yGY0qb82tnmHopj_D9xH=_vYMfPnKtcYuJdz3A@mail.gmail.com>
In-Reply-To: <CAJdd5GZwku_0yGY0qb82tnmHopj_D9xH=_vYMfPnKtcYuJdz3A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 27 Dec 2024 19:44:31 +0100
Message-ID: <CANNYZj-8UeVrF6qrcwud4MG-+7x_pkxU2k0jnnCL1_svPGtJcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 3/3] bitbake-config-build: add a plugin for
 config fragments
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 18:44:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209108

On Fri, 27 Dec 2024 at 19:12, Joshua Watt <jpewhacker@gmail.com> wrote:
> Ok, I tried it again, and it didn't work for me (or at least, didn't
> do what I would have liked). You can set MACHINE and DISTRO in config
> fragments, *but* it doesn't affect the machine or distro include in
> bitbake.conf. This means you can't really specify MACHINE or DISTRO in
> a fragment, or you're likely to get really strange results. You can
> see this pretty easily in the environment output; the MACHINE variable
> proper may be set to whatever is in the fragment, but the included
> machine file is not the one that is specified and thus the actual
> machine settings will be really weird (same for DISTRO).

I have sent a patch for it, can you please try it? It does solve the
issue on my side.

Alex

