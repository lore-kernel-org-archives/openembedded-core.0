Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA8A5C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 19:38:09 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.1578.1737747485429544758
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 11:38:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eEiO4qcn;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6d8f75b31bfso25261936d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 11:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737747484; x=1738352284; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gXIsN/c3ts01aFclP384U7Y8jhJ40zgZqeWiKkSHybE=;
        b=eEiO4qcncCL4Tx06OxDSIWb3kGcuzrsTBH4Ak0AzFTPN1Mqmky/W1BJ0SO6iiS9kMu
         tjsyia0GJxMz46L3WfHlasQJ/0cwlG8Ex8B7/RXO6lOudPyumlMCuiIznrZVNRdwnsGc
         +DFv7q1N0vhyfToJ6Na3/kqAgDxYCN2mK+aIoA1mrVZtdthgxpy6VvN3pRo0TRO/2Ywp
         k+kANAZGr0QSw9oaXOACm6WVf6s17Ga/p5i59TYqkVBeu7CWfT51kNNEY4mLJ9wfjn85
         ELqTGCz2MHL/PTfEb+k5kjGFbXf/GHc7EXyUBjFwFxLriOcZG+WJ0QYUedLsl9Y1zddB
         Psjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737747484; x=1738352284;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXIsN/c3ts01aFclP384U7Y8jhJ40zgZqeWiKkSHybE=;
        b=W90V/ec9HocKAR1O1BoXvAUeWvNWNM2XN4Lm2ZboafeuoL2zxEOX+tegYA+rF6fi5D
         zonupXNqB7heZvtRJyztnsbEppi487GoIwkM+lyKeL3rEioPq9b2y2ggtuI70Q1Gr8fU
         6Yu9V1BwnY5cf8BRhXxvQP7XK7CwG41mwe4Ngu22EGLYiBsuRcE8Nls1lFIlSsDTcRhB
         kCkuh8gGF2ZoH4QqoxErNJwCGDkfd9Ras1V605kLhAYcLhis22GkvT+qg82UvsFpcXjz
         CM3s3AYS/vUTkjAnvNZ0qlvpSTJUSdgonGaZ4M/bmVBb8PXut2RRRzVbqQZvl2ntCStt
         DwjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXURCiDlb26NUUGLlbX5gf7xQ217Jp6ngT2tBO1xUyaCiR8zkjSTveUNisW3AlUhP3Fb9tWh3+rDA9GbLrEwXqxwA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YynEVF8p9vbTsItBSxVuNht4Cx0ooo/QucsvWp/DO8+s788CtHc
	UEA0fJDaUHhY8zNB8FnUBmbrgJlnIsty8N55XXf/a4UAMU7lF83WU0WuiRhwgyksRv6ksQOGYkb
	9xCxMipl+skUARl34/TPzP1pbdDI=
X-Gm-Gg: ASbGncvkc+8idYsz94gez0garFJ1s+O/jfrSWUnqiZ/U07vd37P7w3EtBxDQ8wWdMOZ
	GC5zC3UVbDc5AIx+1xr0I02gToO6TYatNp4g4kxHJFHoR4ZfFOFcDBYm5p6ZGGSelYYnfGB16zK
	von3ioZqfQulEl5eKUaYn8
X-Google-Smtp-Source: AGHT+IFsKkgztkwUbRTN2JUbbpdRBqP3eXqHpbcIxfATBIc06Cllz9cL4RzkeV8jBjB2f8+na6A/iGoJcbeRiQhWH1E=
X-Received: by 2002:a05:6214:408:b0:6df:b53c:7466 with SMTP id
 6a1803df08f44-6e1b22507bdmr454374846d6.43.1737747484475; Fri, 24 Jan 2025
 11:38:04 -0800 (PST)
MIME-Version: 1.0
References: <20250123201229.182266-1-marex@denx.de> <CAMKF1sohTGBUO0Lv3YWykjZg-6BB2Fcrd7x=g23iRxHe3TpqSg@mail.gmail.com>
 <a9914d2c-72c9-4cc0-b414-33d33d4c4f42@denx.de> <CANNYZj8XgBiaa9aqRPmETXzFgn1v-oeqN2-1zqugDAK6xuyYxQ@mail.gmail.com>
 <7adc6819-4e38-4dd0-b8fd-c80ed9f61d1c@kernel.crashing.org>
In-Reply-To: <7adc6819-4e38-4dd0-b8fd-c80ed9f61d1c@kernel.crashing.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Jan 2025 20:37:53 +0100
X-Gm-Features: AWEUYZl4YuCuVXUXr4W_Oc2m6s4_MYVriixfgSps9M1BqGBSbSO4bq1Fd8-8vcc
Message-ID: <CANNYZj_ALxpN0N5bLkAFJN3w+EkkLdO3TaejoL7rQMvcajEg0Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [RFC] bash: Drop /bin/sh from RPROVIDES
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: marex@denx.de, Khem Raj <raj.khem@gmail.com>, 
	openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 19:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210248

On Fri, 24 Jan 2025 at 18:58, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
> I'm more inclined to say that base-files depending on /bin/sh is the error.
> AFAIK nothing in base-files should require /bin/sh (or are there post-install
> scripts?).

There is a pre-install script, but it's for a long obsolete issue:

https://git.yoctoproject.org/poky/commit/?id=6f03a8d7ae383d63bfed8b85c06a697b86719004

Let's just drop it from the recipe, and then base-files won't depend on /bin/sh.

Alex

