Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E55CD6E44
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 08:51:20 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.12226.1697014270013907884
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 01:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ElkvnC00;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-313e742a787so407273f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 01:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697014268; x=1697619068; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wFborPMgn+k4qyULgdUKZkx3FRtPNL3JvAkedvPPWSM=;
        b=ElkvnC00r6BYdNpPfC/EPtTADl8rsfSonLJQRuuKaxoD9710ZubBuxUJV3oODmKqqD
         gbwpzl5Rgn7EYzF0yAr0WwE1wPOmlN7rgSypPF+RP5YvWD6L/Uk49I/kfEsbS+BgY0pZ
         raWYm6GMrShgq9QC7Vo/TgHqb1bTXG08QymAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697014268; x=1697619068;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wFborPMgn+k4qyULgdUKZkx3FRtPNL3JvAkedvPPWSM=;
        b=qWtILATa5O8sLbiWwYrx8lkEDAnq6qPsBLHhbqTzBgTixvtpzvYRJyMerDemnfxAkJ
         XeFUrdA5LX1r+LWfo7BwnqyinNzT20eOdw5lTEODwLMC+Kd+lVllc3nLbRQg/pNMwPgB
         Au0udWghDXywys35NPt16my4O8z5VrY8Gx8rIGXWMVp+yo2zydLypv7y6CNU4OlnQYSF
         qUQY1EzSBRh6wW0a4Mat095vzkwnXTPZnZyADASVj55I/UF74d1m3tWg3olNiq6ajSN8
         +Y7qMbjYo/uIGVXg3Xp+SuqvGrL2PStUa+BXuMsHepKzxMuNUabZj1tOhY+2JYEiGRAZ
         DEnQ==
X-Gm-Message-State: AOJu0YwVHQNaXj+n/BW201P4TtQ/hXDygECM3piL0JYqzUG/0OvcFl6G
	GxWwfe/fiBPbUyHTFM/9dTQKMw==
X-Google-Smtp-Source: AGHT+IFhxn75roevyPB99QqauDnExxxmJ8gwGj/Q6OuvKMibMoOoy30HrXuBOoBWYLEzIIMQMqV0tg==
X-Received: by 2002:adf:e48d:0:b0:31f:fa48:2056 with SMTP id i13-20020adfe48d000000b0031ffa482056mr14809029wrm.27.1697014268290;
        Wed, 11 Oct 2023 01:51:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:af0b:dd0f:66a6:9b90? ([2001:8b0:aba:5f3c:af0b:dd0f:66a6:9b90])
        by smtp.gmail.com with ESMTPSA id c16-20020a5d4f10000000b00324ae863ac1sm14865296wru.35.2023.10.11.01.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 01:51:08 -0700 (PDT)
Message-ID: <9a8fa3e3c4ef3eb9ca4c48684c4cd5a139d5afa2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V2] strace: skip so_peerpidfd test
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, randy.macleod@windriver.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2023 09:51:07 +0100
In-Reply-To: <CANNYZj_HMEeL97CQaZfY0gGca+7CvkazbYsR+xJMO5-V=x74Fg@mail.gmail.com>
References: <20231006211404.4161211-1-Randy.MacLeod@windriver.com>
	 <CANNYZj_HMEeL97CQaZfY0gGca+7CvkazbYsR+xJMO5-V=x74Fg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 08:51:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188952

On Wed, 2023-10-11 at 10:06 +0200, Alexander Kanavin wrote:
> Is this a recent regression tied to some other commit or is this
> intermittent? What does the output look like? Is there an upstream
> ticket?
>=20
> How the failure occurs to be better documented, and upstreams do need
> to be notified, please don't just add pending patches to quickly
> resolve AB fails.

In the v3 a note was added that this is a 6.5 kernel issue. I suspect
upstream can and will resolve it when they get to that kernel version,
we're just not there yet. In the meantime we have a ton of other issues
with 6.5 so having this noise removed is extremely helpful.

I appreciate it isn't ideal but we do need to pull all the loose ends
together and get our 4.3 release happening at this point.

The commit that merged does mention the kernel version element.

Cheers,

Richard



