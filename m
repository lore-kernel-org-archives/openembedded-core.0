Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F89CD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:34:38 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.35644.1725273271847652517
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:34:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DxQtQxSD;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f50ca18a13so47917951fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 03:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725273270; x=1725878070; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pz/7jAZyFgHiNreC7NzEWUE8Cyp+eP9vZs/Ht5CHGyY=;
        b=DxQtQxSDy7h1xnhpYnC9uA54B7Q0f7wb3f6IW0DtmDjm/1sLuOM5vsEBIBGZe7t5TY
         GchW1qyBX6f1Gx4zEA/BRmLuvDg9/Lpbo0sUtWpcksixlBgcsu8s+Xlo6xGKeCDmaFw6
         3TRWgFtxhp/cxxF7+Q8+lX0cCImlOaTAxInwKQItTq3cEjXqkM9qWScp32rmxzt8oj0q
         PdQUrnDc5MTANUrSIRpEiFDksrGe/Yxjo25UWmQ2LGKTbx64F91OXl/1lDoF6HsnnP6Q
         HY4Q8ICL61rZoKjB+QiF79K9q/ZYlIGilOfjXw4O8c975x9pnwxP3fkZH7BnGrifQe7S
         TY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725273270; x=1725878070;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pz/7jAZyFgHiNreC7NzEWUE8Cyp+eP9vZs/Ht5CHGyY=;
        b=jZTdsAydFjied0+kixlwOJrkftQRFyBo7MQPjeaAbtNgEdYuVcExjlMKAc6TpWMWoS
         mR3y07BD+3ERuL44I6vK52SGIckCYxIESAQCOphw4bhQoIgm9Za7XZYs29/cPOqZHNhD
         l67lFvnjIcouv2uNz19afG6Cyeclu920DCVZVtvc4pMjCdTyWW/h4caT+LYpdJodvAwP
         t2fMJjhOfYfEOzE7u6yBMsMkgntv7K0d+P0u2CZBSUc7IPOVy9klf9TosNY9AaRcIbI1
         JuQhDfmvz4rVr1GpdNgMBNfxN7mE5OSy05g8ZbSv7cnBO2GW2kMX1L8vadsZdwIYQyDn
         1Gvg==
X-Forwarded-Encrypted: i=1; AJvYcCVBLRx3eWcYNiM0JT+sNzupefvQsMwLAYD4KmhQKAcsjC3PL8xW3lQ4kr7MkCDvV62GZ4R23rbNc/aJZh+wfT6+WA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzYlkegkyhOkQEiDJ0JM2fJTXABMQluxpO8yKhjJcGuRkNTV/48
	kLez1MlrTW/9mNH3x1k8nw53HvvpdJN96BaTNRqyGCaqpqtuanB9qHi71qx32tbnZKMVoJGWVFV
	tE16h8+AkVGtd4u/hA/MCL2B7LYQ=
X-Google-Smtp-Source: AGHT+IGxK9rIEbfHh7PPtXKgSwxJXcYiKoHWOeZ00qWFwMqL4KYYhLUNA+Ub84Pxq3XG27Q3UvVNDfz63J9W+CPCMmQ=
X-Received: by 2002:a05:6512:3f0a:b0:534:5453:ecda with SMTP id
 2adb3069b0e04-53546b048f8mr6588916e87.23.1725273269111; Mon, 02 Sep 2024
 03:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240902094117.31156-1-mikko.rapeli@linaro.org>
 <20240902094117.31156-3-mikko.rapeli@linaro.org> <DB5PR02MB1021356397EAB4F11F18E3EE0EF922@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CANNYZj_7Q6j1k2bFS3oSa2cjmp9EGd3QWT0HOUtecKE3spLCfQ@mail.gmail.com> <ZtWS-QhOBS3l6dCA@nuoska>
In-Reply-To: <ZtWS-QhOBS3l6dCA@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 2 Sep 2024 12:34:17 +0200
Message-ID: <CANNYZj89ZjwAPF-PrDVm_VE47cos2J9afqn_Vqr1-zP-c0akBA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] bitbake.conf: add getopt to HOSTTOOLS
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: peter.kjellerstedt@axis.com, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204084

On Mon, 2 Sept 2024 at 12:27, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> On Debian/Ubuntu getent is part of libc-bin package which is marked
> essential so installed basically everywhere by default. The systemd
> side meson build script was failing without it. I can try to check
> if there some config etc way to disable the dependency.
>
> Or if this causes problems then I can move this to "usage instructions"
> of ukify.bbclass.

getent is obtaining host-specific information and before we even allow
it, it would be good to know how and why it's used in the build. Would
it result in host contamination?

I'm also curious to know why we even need to run the build process, if
do_install only copies a script out of ${S}? I guess all these points
should be addressed when you switch over to existing recipe (which
indeed is only a trivial script copy).

Alex

