Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44CCC25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 19:31:39 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.5211.1716319893958630151
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 12:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iBT/f4mz;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e271acb015so74525501fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 12:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716319892; x=1716924692; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vwh0lvIk37LwOfrMdpRtabXBJyWslxj/0WXC9U94cYE=;
        b=iBT/f4mzATAoGKe9gLrW/7GZ++2tHIR6ARmEpOtbbRQQwlQD7KC+Z3Q2HtuaWCoxVK
         G36dVH8A8cvSXiYfTHATCfc+Qd+eq5MFiNzSWRmv3uDFhzyIUKJa40/PNfNjeAkfWmXT
         yggEcBn4sKu0yqT+i6Iv5gaXw0GUjCobaflAvycEmPsdld9FU7L07CJ2pq5XczCgZqkF
         wv2JJ6tfwghKjEoH1ixX0Ed4YyJ6F+lETM++SbXujyEsX3RXMqFXg8HlxOZWOOgpEx4a
         AxczkHzWg2qA/ViON991qgAii5sboq47i9t1CtMO45wRiPQ4c79IEC6/VINn+MsKYBny
         QDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716319892; x=1716924692;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vwh0lvIk37LwOfrMdpRtabXBJyWslxj/0WXC9U94cYE=;
        b=jm6G2OktnYGav2zMUOONwq3sbguG7r78fmnLvpQxle/9/gvuVlqdrwFwUft/yGxGkt
         2XbgwFnEukgbJJQq2KO0d9B0FKc3Uxc5E8cYAKU2RfkAn15+HQ6SKjdGLgseQ4Ld2ZFR
         nf54ljjq+MWy4Pw/yCaY3TB9nZxso/JF95B+aYeMDEHrO6yRCF4DQan4JXNbWV1LTAtT
         S27aNMDdgacwLSVUpXaxNVchJpwQ6IF4Za2dD/ucLVkXZ3YaaAIDTEIHEhml/TAbn15l
         dA8klG5AShv0a4PsN/My0WxH24XCYn/5oUGuTNAeoRzvTM4LkESY3wMQ9O0kDGmhw/7a
         1m8g==
X-Gm-Message-State: AOJu0YxK05L23oON+/3Hx/ygh58Jbeuux/pmwOs7iEfKpY5Dtn5Zzsp0
	2AFkc9Cq8G0pz3YDyL/on1t8oyieEeRXz15xvZGczw9X6YrySSODzrgOjDbcDTBHqulWnm7EloX
	YhNuqVuDQUE3pnRt87mnhRcHyRww=
X-Google-Smtp-Source: AGHT+IGOiMjddsbxduQQqkf7Y345hSxwAYuteKnIhkUnf1jd3oKYRJ/jKtK1OhQHnHziUvKuDdziPo6aBsvKcgUtuwg=
X-Received: by 2002:a19:5206:0:b0:51b:6296:8d1a with SMTP id
 2adb3069b0e04-5220fb773e4mr18937498e87.29.1716319891578; Tue, 21 May 2024
 12:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240518212954.788524-1-peter.marko@siemens.com>
 <CANNYZj9H16P4fPcphNiXV_8Wx3eapUeCQu+f5uL+4HGKRGrzBw@mail.gmail.com> <AS1PR10MB5697E1CD2E2A7DD06150D96BFDEA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697E1CD2E2A7DD06150D96BFDEA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 May 2024 21:31:19 +0200
Message-ID: <CANNYZj-OYGdScmGziYkH=QrCu0sCVkE4K1dv6fQy-mgPpuLk6g@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] ncurses: switch to new mirror
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 19:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199672

On Tue, 21 May 2024 at 21:17, Marko, Peter <Peter.Marko@siemens.com> wrote:
> I already thought about the xz situation before submitting my patch.
> One of the reasons why I did not go back to tarball was that I didn't know how to configure AUH regex.
> If you know how to do that, switching to it may be an option even if that would mean having to change the URL on lts branches from time to time...

Can you tell me where the tarballs are? Then I can check if the regex
is even needed, and what it should be if so.

And, this is kinda obvious, but maybe you could email the maintainer
and ask if the new github URI is really them?

Alex

