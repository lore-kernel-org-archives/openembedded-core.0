Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30DBC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 20:21:50 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.43681.1701894107689649563
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 12:21:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZK3fZ94o;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50bf32c0140so241256e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 12:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701894106; x=1702498906; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+mVEuKweNHqdutFrgbKsi3iIhb1FHr4lc4cNDYkqZr4=;
        b=ZK3fZ94oVip2cR/G8QnzQoJNbHgWd6JTIsMI0wL8kiIptN+jfTvvolP2+MhMagsLoC
         kbyFIzbYreWXjcMBNFlHXM1W8Unrv5l71o7Su53SUZKs1w+1iS6xOZn1aDhLZsjS1uJs
         lJgzcIkFirfpvD0CZs25bNBneZihWyeCIxGuVrWRjLnCVB9HvnqHME6DbFYiwkrXxrLe
         TpsIB+yKSTmfpug/de1malJvc6UpTe2guUnPkCebtw+0y4s1kwgx7Y2lYMm81LF3iUM5
         6mq57cDjiTUVhovHMbeURMuqo8rWincGI5W/Mkx+R9+Z4KloMMkFbjGJd1EdoJIGoXYs
         hs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701894106; x=1702498906;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+mVEuKweNHqdutFrgbKsi3iIhb1FHr4lc4cNDYkqZr4=;
        b=VQAE+I1zvXEvFscne9LpunHasmUgT+2uq8nP0YvHlvgszaicz9SnNsoRaA7Kc1wfTt
         L1c35F8R6esUj7x3fZGFF+xgWrUZdf8p3+JJN6S8MJuyQ3yzq9cdc+9XCH1k/m9XBFfo
         CHrXKlJtZ2rW4H+jUUUqOMUCbhOri8VrW7DgZM3WRDZfaexNvio2GklE3ASQWNUfblRi
         sr7vqUZl687IBJok+J6QqJNRAm60rTbcRQOEyb07rOfOBpBGUiBOXrnsjPbscKKFeGGH
         MVUcdnw3FROwbl8hQHvfuHW/K5gu3gUIwhREVdFw1MNJpPT1EelHXluZSHiM2y0JhfAJ
         wvcg==
X-Gm-Message-State: AOJu0Yzzrc9CxyiEe1Aidy/klQ/qIipRhG52JRJI8yVRglaG18pD3bZo
	YGeQ5NCo5jYFHBfVuaSHA5IPwlk6pmHgaYtuAcc=
X-Google-Smtp-Source: AGHT+IFBVBMe+/2bR7tB9FGnBBfvaHKgQNqrzu+N89XKovnrkvRn9aFr0mK2oJBv61btSNKQbqLadCL7hTDIzW4oELE=
X-Received: by 2002:ac2:58fc:0:b0:50b:f08d:4391 with SMTP id
 v28-20020ac258fc000000b0050bf08d4391mr800962lfo.137.1701894105548; Wed, 06
 Dec 2023 12:21:45 -0800 (PST)
MIME-Version: 1.0
References: <20231206192207.2838077-1-pkj@axis.com> <20231206192207.2838077-9-pkj@axis.com>
 <CANNYZj9OBN=911raynt6_47+kbyWBh_TH_JhZjBc==oq8G-VXQ@mail.gmail.com>
 <CANNYZj8ZoyW5F9oZ7x-=pmBo4eL28DAzuD7jpUJegCY=bRN+-Q@mail.gmail.com> <DB5PR02MB1021386CF9AC7FCEB3C82D009EF84A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB1021386CF9AC7FCEB3C82D009EF84A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Dec 2023 21:21:34 +0100
Message-ID: <CANNYZj95LaWZ2p1xd1CTtOaH6fFCxrJ-7aHjRHpuXTBe5f4HyQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 8/9] devtool: upgrade: Update all existing
 checksums for the SRC_URI
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 20:21:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191921

On Wed, 6 Dec 2023 at 20:46, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> Will changing that to:
>
> In addition to updating the sha256sum and removing the md5sum, update
> all other existing checksums. If the only existing checksum is md5sum, then
> replace it with the default expected checksums (currently only sha256sum).
>
> make it clearer?

Thanks, yes that is fine.

Alex

