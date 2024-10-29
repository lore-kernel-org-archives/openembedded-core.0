Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB90D2AB28
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 11:57:01 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.17431.1730203011718696497
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 04:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lPmr7aYg;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb3110b964so42214631fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 04:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730203010; x=1730807810; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xvg5NhkZKBCM6pi68E9S7vX3rXeK40z375c/7OF/FeI=;
        b=lPmr7aYgqSpD9DQK3GlncdE3HW7Qjle/3Ba406HYhvETWRhYIm6jzwb/reZsWEaBRT
         DRwJ4Lww8Id29eemseEo3xwy7tKoJ+UnA9CjOQgyWCCYDeJyli6S3MOCk02vWczHdfzA
         wD66bLVJ0PRacP2ksGvZdQbjaw9LA/bZL2Ha2emmSqOyOfVSS/PSne0cSLYNG1rRsUEn
         LgXel+RmYvRDXtmxpBFK6m2sueaqJEz+ByEMBKO42omf8E8EvRE0yjsMJxOj7jdLrZz6
         eNe8tc1jD9vFdA+WIhKHZ47TTLAsnulDuK2+K3mHv3ctODUl7QtUNIsxZhxkLc4/jvHz
         dfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730203010; x=1730807810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvg5NhkZKBCM6pi68E9S7vX3rXeK40z375c/7OF/FeI=;
        b=O1QnvCIY/TFE5Rg1BzU90pOl8bksOB0wB4igRSrjZSllcRnLh6xZKIqJW7rhxX6m9e
         EWARawHKKINebsEZokzBCeiZuvHNw8hVBOfFDniuECV9cQ1a6ycd0/2Hji11bW/hK0bs
         bbiKANSdfnF0k4KOEfye7wsv9YDCj7cf0vEqzH//SbIMv8Aj3IJDAlnd1qxdbJG0pqti
         PiMEK01+dTwXfDGXX/m0XjddPA9dJt7qiAjMwqOMX95kOhyxE3+f1x83EE8ysG/2lJXq
         zTXrj/hMAZUAUpRFa0yfheHHImoN3AbArmLmXGPdW/CtiP7yzCVIOwaU/EoXBzr2gPyn
         qHtA==
X-Gm-Message-State: AOJu0Yw9Fft9NTDlv7K/N5Urms0xHi3ZX4D6++C0MR+ZD066FP+z8BIa
	me4JdTMoKKLDvdxaaQkARq8lumdxIrNiAqzza2eKdetwJGOZc/BWn5my9rShRCcr7VV5flyBtod
	j7FDXkrT8nG735wi2iaK8hePOQRc=
X-Google-Smtp-Source: AGHT+IFjRi9tjbUhTHdTdsYoau91Zng6qGDmrkAzSUFLhoySExouh71oDL2fBZ9AMFxHX1m4Lgrdd5ts73n/keQH1bo=
X-Received: by 2002:a05:651c:1026:b0:2f7:53b8:ca57 with SMTP id
 38308e7fff4ca-2fcbdfd5ae1mr39748531fa.19.1730203009519; Tue, 29 Oct 2024
 04:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
 <1729834769-4717-14-git-send-email-wangmy@fujitsu.com> <CANNYZj_BGyi_Gz=h_62x2QSU+BWE2Ae-UB_fmbTP6BnVuccscg@mail.gmail.com>
 <TYWPR01MB11861A53BDFF03E210AFB60E6DC492@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <1802B5823947D89C.18751@lists.openembedded.org>
In-Reply-To: <1802B5823947D89C.18751@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 29 Oct 2024 12:56:38 +0100
Message-ID: <CANNYZj89yS92RVWiu1q+AXpfCdBL7e1RF8MkQxybHY+2qhObZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 14/22] ptest-runner: upgrade 2.4.5 -> 2.5.1
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 11:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206494

On Mon, 28 Oct 2024 at 20:46, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> On Sun, 27 Oct 2024 at 04:12, Mingyu Wang (Fujitsu) <wangmy@fujitsu.com> wrote:
> > It was indeed done using devtool upgrade, but the version number of the resulting bb file is 2.5.1.
> > Although the version number is recorded as 2.4.5.1 in the bb file, I deleted that line when modifying the content of the bb file.
> > When modifying the patch, I forgot that the actual version number was 2.4.5.1, so I made a mistake.
>
> That's fine. But why did you have to modify the file? Did devtool
> change something that you had to fix afterwards?

This has now merged in master :( I'll send a quick fixup.

Alex

