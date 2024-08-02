Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6691AC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 15:03:24 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.94984.1722611001426700896
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 08:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LlBTcAfl;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52efd855adbso11697184e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 08:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722610999; x=1723215799; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DG1GN6VWi0yACVqjZPTujT2CmDJ46bYmju8OLOf5xDo=;
        b=LlBTcAflgEqSKSFrzod+XCZmL3M+hZa+X84zTUhSEgZVhGIe3WhFJsmI7ZCuC1W7hX
         jj+q0OQz3Cb+34NpLS4Vmn72WeVOU+8L8DJeTQaSyggLRER93zBH4VBbaD8g/n9uwHa7
         5Qq/y6vODcSsUKJ0gVQ637C4VRH0u55mLzUbQqEA22AU/PG/MvRtPEDZWwlsK4seOJpH
         /62IMKQrjw8Mlz2HWGERVp/fWBITe+kEVjXbNGkjwMtRRYXazG9gBEDLgJ8CFvgu1uCI
         w146LLf/FWMnFNKf0Vy2IpTPRxDJ2EzULzTot9jAjvek3mp+g5m5tA0N6mG+bPG1NRDI
         NFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722610999; x=1723215799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DG1GN6VWi0yACVqjZPTujT2CmDJ46bYmju8OLOf5xDo=;
        b=bPSXGJ/Pvsy6CgYpwkLYMKJq2B0YJi+L8vIkfSA/1N9tdKixzIAtzqE45BX27kWAQu
         UENaJVVTe9ExCsxUfMPI7+SOMHpexmI+RgQXS5Mj3bxh1YOmD4jCDWP3kUo8n1gWFg40
         0IITXR50PxO8lHQsvMPE70/z27qdI8b6Ehto9ainjbMHMs0d1Hxgn9aNPBp8DaksO1bc
         uF2Jx/fW/yx6wwx9SCVBNw1N0saQPDciscYAYBGUcTqagiDmlAWH/aL6CFiSvgtVKnGM
         Uv/HW3vXRItacx2xQ47Z9r1Kw+JO/qW2RIpZwo2XLuNtznJ/C1Lk4mgKP0+Z3QK099P1
         aklQ==
X-Gm-Message-State: AOJu0YxsGDpxxbQIA0Cxt99D86yPN9uZUlDvOTI87BgTOwG1w7whe9+h
	YJCb3Es/DDQwTdS1HAbhJWpdtBW/bqQ/0TjMstQtZPlusHi1xpWFHy79lKMIWMKgOVuS8nnauui
	sfpNOfve4J8h8zLgGnXjC0Ea1zAI=
X-Google-Smtp-Source: AGHT+IFPAiQTPNzKcJXfLyn84QPWH+1jsDKFmJ82aGbtjKCzmk6QwG6QkgqAVZXa/vUkYJYLcgTONnVBDBCY5wi3JZ8=
X-Received: by 2002:ac2:4e10:0:b0:52c:d78b:d0b8 with SMTP id
 2adb3069b0e04-530bb3a3320mr2348343e87.39.1722610999052; Fri, 02 Aug 2024
 08:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240802121336.1642376-1-thomas.perrot@bootlin.com>
 <CANNYZj8XmjudNK_=O0ftKAw9pUHD2Ybc=ZoW_wLHjROiZQ7giA@mail.gmail.com> <4c6579a7ae6988005f628bbdbd686a4294bb8e99.camel@bootlin.com>
In-Reply-To: <4c6579a7ae6988005f628bbdbd686a4294bb8e99.camel@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 2 Aug 2024 17:03:07 +0200
Message-ID: <CANNYZj_6erc-5cRHnTYtc3yucs73DaTuJ3Hcaxdx_urcQEH=2Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH] opensbi: bump to 1.5.1
To: Thomas Perrot <thomas.perrot@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 15:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202918

On Fri, 2 Aug 2024 at 16:57, Thomas Perrot <thomas.perrot@bootlin.com> wrote:
> As for some recipes, like the kernel recipes, I only used the first two
> numbers of the release version.
> I can rename it to use all numbers if you prefer.

PV (set via file name) needs to exactly match the version tag in git
repo that matches the git revision in the recipe, it's not a
preference, but standard practice. Otherwise the recipe would be
packaging a random revision and not the actual PV.

Alex

