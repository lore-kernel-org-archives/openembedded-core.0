Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912FDC25B79
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 14:23:11 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.18399.1716474182898140624
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 07:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WrsH4XFl;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e45c0a8360so68425301fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 07:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716474181; x=1717078981; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dP7Dtfs29cLXVoI6H4kmVs3mUlzt84tBVCecK9WGI2o=;
        b=WrsH4XFldlgYSJZEuf3aexdt13SnTweZbjDzOEeDx02ktdVbbnMPQCBggFvO2ELrUY
         RKw/Yktg38xH4ChTRUTw6U+XzQSNLXhJNWoIiFnZOIkblcONYHsL9u67r+//GRCcro23
         HWts0M658n5TfxFisiPVEsA/1AGAUJmG92+xWSpQBXaQg+Rjc4YL+vhu33OUH9In6oHG
         91i2pvmlanCyVJ1tiFDkc4vrXxZIa022DyBPeME1Vlmaby5eek7N49SfI0wvHQJz+IXY
         CghVmPppInFbzOGIXIaWNP63sdlElvbqPIYQWhxVDX9drkj3t/HkFZeSPlxiqTJFU03j
         B0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716474181; x=1717078981;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dP7Dtfs29cLXVoI6H4kmVs3mUlzt84tBVCecK9WGI2o=;
        b=xBXxXCRfDIMIrOfWpi7DTyL4O9bWghTP3YBCwaO654o9s/sidO76JWzB1c+ufKrni0
         y12KojKihBkGCnYzw9zjnSuO0SkeiGBo7CVLd/byDC7uvkUf+tgYR18BE2c72KvxmKwv
         QrG6iO34qaqtiuByoiomYWpCQZRAY9XflOCmwkZaK6VSvVi36fBretehXGjBR/xDfkeq
         bJ1tDmWJNng4Ilm9ru3BJXlNHKaor88Gave1efnsDabOR3rbh9Qgf1iaUMCG1nUoYOaK
         7VqQZ64zojxC32/5xtkHwU5aEFu5us4YsanmFFxu11RLTVlOLqPjDqddA/v6p4jCxOfG
         rDAg==
X-Forwarded-Encrypted: i=1; AJvYcCUqiGYUYJr8epKeOWXABMR7jLNwbXVviqFkWVAPgMSqKm8CTLpQs4efxqsb0PwWKogCXu6XVLw4D6pqJxUKyhL1qzEkmwX0mJZz3bLAUAWQpauGk5OW2oti
X-Gm-Message-State: AOJu0YwyVtBl3g9+I4CHErtpHMCQOgu26IpJOcA2HGCc1KL6fHy4O61r
	Kz6/jpe1lJvft89nd2jVCwziiYh0c2b3m19O5eX3Gl/OPombs9gWW28O8UZKF4V44/sZuOsSRDh
	ZwBqMF7Eb5KdXpTDu9pwoVOySDmI=
X-Google-Smtp-Source: AGHT+IHsYNFTJoBmH15SpPGsJqRI+k+/OpCAg2OLO1AGYKzUh1CWk1JHq5UfBVwFl+42glxEYrw00Kwpa2OgPp1Sshg=
X-Received: by 2002:a2e:860c:0:b0:2e6:f33f:4199 with SMTP id
 38308e7fff4ca-2e94943fca2mr31823221fa.5.1716474180743; Thu, 23 May 2024
 07:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAO5Uq5Q4f4Q+3yR6JZcxhXOP_mpmyzJ0yYtO5SO1_6ZOwdHEzw@mail.gmail.com>
 <6447.1712221622103634934@lists.openembedded.org> <CAO5Uq5Qd63-mJWhQpdP28kXVtHWjk-607c_RK8xm2dshyfHWJw@mail.gmail.com>
 <a5b121fb-b530-4242-a786-1e7b54655ba9@windriver.com> <CANNYZj_gjybr8x2zxN5zSWQjoXRxHv43-vZW6ME_E7hhkqJVcg@mail.gmail.com>
 <533e019b57c5acd6ebb35163fb1794cd28166052.camel@rpsys.net>
 <CANNYZj_yRH35hb4UBVXQNeZ0CTteUu5-abGXL=itgF67yjj_VQ@mail.gmail.com>
 <0d334189-293b-4a11-846d-a0ffd96b2624@windriver.com> <17CFF314D55865EC.16299@lists.openembedded.org>
 <CANNYZj-SeRHU-JWCQ8wrVt2LCObB4aDmmz4icxSoYrBv=3KyVg@mail.gmail.com>
 <1714f7c2-b7b0-4fe4-8232-247f1df55a8f@windriver.com> <CANNYZj_YxWmOVzRYrY9biWkP7kmUsPfLbdVKTp7=njkQwWeckA@mail.gmail.com>
 <310e6d7e-bab4-4907-ae1c-af909de0df3f@windriver.com>
In-Reply-To: <310e6d7e-bab4-4907-ae1c-af909de0df3f@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 May 2024 16:22:48 +0200
Message-ID: <CANNYZj8wg42t7vKrtadb7N3ot2Xgo2R594XQRWemRpa3RXm+BQ@mail.gmail.com>
Subject: Re: [OE-core] Debugging rust oe-selftest failures
To: Yash Shinde <Yash.Shinde@windriver.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, randy.macleod@windriver.com, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, Steve Sakoman <steve@sakoman.com>, 
	alex.kiernan@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 14:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199805

On Thu, 23 May 2024 at 16:16, Yash Shinde <Yash.Shinde@windriver.com> wrote:
> I applied the v2 patchset and still the test suite executes successfully.
> I am not sure what's the difference between our testings.
>
> I did the same steps as you mentioned above.
>
> Are you changing build configurations or anything else?
> Please let me know, if any.

The issue might be intermittent. It did pass for me once, but then
started failing again. Perhaps we need to see how v2 does on the
autobuilder as well.

Do you have a different machine to try on?

Alex

