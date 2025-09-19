Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5134ECAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 10:21:26 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.12934.1758277285672443699
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 03:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kgqS56WF;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-7639af4c4acso22127196d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 03:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758277284; x=1758882084; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jt8pTJikc+MPVsy+5/OEHglEvwwd/THQ4K0bHj0nMiM=;
        b=kgqS56WFYjkVIqWzM7dPf5T7Fj4z6RrbCaLuoMqHzEUAKXIscEfZqtV3iiGWA5cF3a
         uBWsB0yw72mVirlJ6YUIZ8t88+OgeNJsujGF33thDLdnMfTb5Xf4eL+16ia5STh8a4Fw
         DCU/IC4doqDfGCDopRfuPP3IvLw/XCrK6Tn402BpFDp5lZOzgu0LKEIzJU8jkb1hYXCO
         2Qqkib6itnAEEBvgThwGuPubf4vdXZu2tCShMBTKryy7YEiAgR+w6z9uBj6jEsmz/ESs
         9x1Y7frS0Q2Xa9Ds5p8Gb9kRlDPB5S9gLeoi0qmmb1fnD/cKVZlsETDHLEEWSLWKZ9Fb
         cMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758277284; x=1758882084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jt8pTJikc+MPVsy+5/OEHglEvwwd/THQ4K0bHj0nMiM=;
        b=Eo93U6gYOjIo3LnMF31jhh2qgTpFQWeZ2obQmvpgcFfxSu+cL/TABAmUy9UEJMzKvJ
         tkMw2U447IrUdtXmml6kyDLm9TdRdP7wqI1tUrJ4hI+5b6S30O+APG64faxp2XqdGj9Y
         AMkWu/xNQAVy6IIw+MWwcZEmARFiMp407vXFioV4YxAl5/mTlZjzb3r+dutUTbR7q78T
         g5KWNJXVFHQ/dpDxPkvL3N9xFqESJmhJCF5LEA78yMUcSrqXawrAvej//0Fz6CB2lnib
         cqR7L/ZLugDk1OSg+9rO6xEMrqsS8KDKt3/RRYepWwUQK+w7vWm6Aga/OdqlNwn/BaXu
         9Wjw==
X-Gm-Message-State: AOJu0YzsLfCy0F1UqvSm/S70Fs9bRHrLEWgYtzP/wyY5BABRcYBF4c1k
	yxM5Ww9q38dVsaS+ac0hKZ2cBigwpObpLrYpywgnZkb4EV3Sxpm5BeoLtDwrNsDAGz0ApV7BAyZ
	EpFMkA/ZhOMtdYv7ckk83RPkAuNj0VEsYtA==
X-Gm-Gg: ASbGncurrIH3ouxOVH/5BVCb4Lg5njpqFOHP/fw7uEXYZxFlbuzoxJK0l1ZvHg2snss
	DzZQjbed5Ogd9wJRKpk6gCdyf/GiIiCXe8K2uParn2X6Z9Xm+G7ETlHpj8G2anjYG2iQ3PLNkW+
	4Nk0mWcfrIDwJWR1sKA9jobkeP8beCW+EmdthPDMUNhLElM0gaAe9NzJo5oW8vzxMKX1os0ulTY
	CjXcUSW5VEFyPxQSGAx5Q/UDXntp4rdVdHJ8ySw4B9flZP3dDQyTEGq586kd0MXhmFM/4k9XViH
	61Xv
X-Google-Smtp-Source: AGHT+IGT5P2249jq/S20h8qYA0nm78vuQUuACD8z2WazRJcX+QCJvcnmS6QT1CHZIpgUnembqYoTOHJNIWvCO5jAXjQ=
X-Received: by 2002:a05:6214:5191:b0:791:c933:ad15 with SMTP id
 6a1803df08f44-7991db0b982mr26400546d6.57.1758277284318; Fri, 19 Sep 2025
 03:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1758250424.git.liezhi.yang@windriver.com> <c33930b39db477506067200c5c4f19cec0079b95.1758250424.git.liezhi.yang@windriver.com>
In-Reply-To: <c33930b39db477506067200c5c4f19cec0079b95.1758250424.git.liezhi.yang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 19 Sep 2025 12:21:13 +0200
X-Gm-Features: AS18NWC329JxXg6enGSrVnqnTFDpS2yo5tI0ts11jGfy8XQBFay2IwKjJiOvy_Y
Message-ID: <CANNYZj8_iTg7ukB=Zhimh5cDuUKs520AojDta3UyM7jDHFscNQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] openssl: 3.4.2 -> 3.5.2
To: liezhi.yang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 10:21:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223737

On Fri, 19 Sept 2025 at 04:55, Robert Yang via lists.openembedded.org
<liezhi.yang=windriver.com@lists.openembedded.org> wrote:
> The benefit of OpenSSL 3.5 is that it is an LTS supported to 2030, which can
> save the maintenance time in the long run.

Yes, and it also add new features, breaking the promise the project
makes to its users.

This update cannot be done without TSC approval. You need to get that first.

Alex

