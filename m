Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 785AFC4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 14:06:55 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.12218.1705586806631321248
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 06:06:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jnLt4Hq5;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2cdb50d8982so57044751fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 06:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705586804; x=1706191604; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nx1EXtLAVjViNBwad5+BLOCy0IBsjycsQhVaoGdFC6g=;
        b=jnLt4Hq5P87P3zjjBF/fGs/3MmxsD2uG/UOgMRX20y4KPwagsVcXkxPmRgxQWga1uA
         iWIEilEA2o/SZ5S+fVTj/AxJU73rmVeUSPrqAm6ef4cWN1xDQ2nZd8Vqjvl4lNwWTC9f
         26UELIY6d00uIHPQ51/2Pi86ou2i/aZiSkyfBN0wkZxJd9Hybv9jf+urHCO9BAQmXZGc
         BUgSACL6ViVWBDOtLHnSBEh1h6SHxxMKqEU3MCtZTsr4UTfuHxeF97skA2UZS38h3oIK
         vnAvQYbnKg5hPeVCZdhR2W3Wv+gMshCplBeSZ4Qk0x3NHSc0d8g5PP0AKfQ3QsADRbBJ
         I38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705586804; x=1706191604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nx1EXtLAVjViNBwad5+BLOCy0IBsjycsQhVaoGdFC6g=;
        b=myXhvq8n/lpXtM1JrRiVlEoUOHIO+uhglSs9QrP88lLYOD7z23YLCoIV5v0Bz4i6zq
         ea3dpSB/fJX2w99aJx2Nef2MPp4zIkqzUakzmKkeHZapN2enlJG/5ItwRtVxJk+fWw+N
         ASt9qxk6e581WXS+sXvc+XOJ7qlyNyEKcfGdo5oYXex8s7/2TzPhGGrpzUXg7xbel6Iu
         NL5i5XDo/RpXIS1zUbvUc+1lyi6EVG3BESg5QFfDBAcqGtj7q69geQcaOfbS3R6TFuk/
         4K9YkvdrZaVMcjDz7/R6VGOWLhBmMWzDR7UMa87BR90UI2tg2fJGwBpkAFK8OO0BsueX
         DbXQ==
X-Gm-Message-State: AOJu0YyozC7qWZRmlyaMD+/hcHH8m5++mJdcpsgB5IlgCSsa5l4/UE3e
	wPDV1FDif8S3NZAJDnpzh05N+Cps+ef9T3RXV4/77M4uKtjHhyYEIp0cUFYz8cK939IN6lLClQ2
	eAUfJqJFTl4gTDvgbS8rAM322tTY=
X-Google-Smtp-Source: AGHT+IErAHtDNRSIDVB2eb+g3monMn1nZB7SKAKspUdHXV6GZxAGJyTl4WLP6Y44CZAIrd9T5IyLvAHv5Ok8w5ErSvI=
X-Received: by 2002:a2e:a681:0:b0:2cd:5409:8799 with SMTP id
 q1-20020a2ea681000000b002cd54098799mr439216lje.31.1705586804385; Thu, 18 Jan
 2024 06:06:44 -0800 (PST)
MIME-Version: 1.0
References: <dfcf7a4a-81b1-ff26-d14-923bf379025@crashcourse.ca>
 <CANNYZj9aG5qcpe6PksShW4W69uk7EZ+j7yxHb43tgfDrk8ygFQ@mail.gmail.com> <5610c776-f1d9-3543-9878-56fad23e776a@crashcourse.ca>
In-Reply-To: <5610c776-f1d9-3543-9878-56fad23e776a@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Jan 2024 15:06:32 +0100
Message-ID: <CANNYZj9swGJz6kc4ykCAOnw=ACc_4aCn1UODGZSKrhT4Rcpj4g@mail.gmail.com>
Subject: Re: [OE-core] want to confirm i'm using "externalsrc" and
 "bin_package" efficiently
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 14:06:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193984

On Thu, 18 Jan 2024 at 15:04, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>   i just tested, and the recipe does *not* rebuild unless i change
> something in the ("externalsrc") source directory, at which point,
> yes, it rebuilds. which is exactly what i'm after.

It only doesn't rebuild because you already have a build/tmp directory.

But as no sstate objects are created, if you wipe tmp/ or make a new
build directory, it will rebuild again even without any changes at
all. Try that!

Alex

