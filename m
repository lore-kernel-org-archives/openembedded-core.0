Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE42DE63F29
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 02:37:28 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11796.1771209441634818113
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 18:37:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nMbbgMfp;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8c7199e7f79so370099785a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 18:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771209441; x=1771814241; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BRvbCqJkgO6hps/t15EDb4u975cxkvtGivQ4+XAfC3k=;
        b=nMbbgMfputF99cmM+1uFsr78NA781qRHaxAjSV665VxpC2b+KkqE1p7AzZtnT0nKUz
         5zPxc5MYkeyBfCyB2Ilzynu59eSr0gT6I8gNygUOITbolfq9AEfB1Ldu6fQG9I2vfENt
         OIRmgKrQi88R74GXw789QziK3bFWzFyETX7RTNtDUgkSnRVqsnX5+CHv8gyllbrsgwPW
         LEp4sejfZttFUcSZfMlbJ88HCStjDJbwkxMjaRNysyTLnLzp9wMVnVttAomMQ+LuDy20
         8ufmcBXThYrP65kAIDjYS1BgROBumMFTprnR6o7V4Wzx2DGDZmvlrKKUWFnZ/fCHmgCI
         K0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771209441; x=1771814241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BRvbCqJkgO6hps/t15EDb4u975cxkvtGivQ4+XAfC3k=;
        b=d6vEuYqhI/44WBs7zhtBRGiq/lqn321YIptaCDt0REXnEPEe0xSR1+FTme4xKxiSol
         xKM/tH+eLdJ5em6zsl/OhzQZ5pmZlzLYYxSrKP1KqNA7GlavIHVD/6GPYbGp+WQvl7Y7
         Av0CE7K6sWgmQr+/oXpxBfPcrq/c2ZrsgFYaGSxfTPxwqzgQpbAcnRhu63upFTYI/Ed2
         SJqyl+dL9Wc4+UKjWYVEmOZClYSoH/jw8s7hyqsUJOf3XxjunPkb2gk3qJhE9mJaKAww
         WcfJjN+v7hxw06pqpGD4y3yAeTR81Wwxb/Cw4bgOu3k1kSCc6ftr8nb9/vxkZSM6DIiH
         m0Gw==
X-Gm-Message-State: AOJu0YxxoZnlgC6z0PXMsOag9YD6TOMA0k4EX5tJjbZsQM0oKXfDh8zN
	G0AQSSjQUno/41z3IBplOwX/EXwMTD4kBBHkkcNGkqb83DGGU+axiVB5
X-Gm-Gg: AZuq6aJNsaJCxD3/f/3IUMyMk7qwEVwesARTvdUFkMmq9iiGrJzop5Oea3DbtztF1Aa
	J3fSKnoWOe2zN6FWlVsnxSQPrud6J0n58ygJWBxrY3XvXnc/Di+jMkkeq+7LTPdWW7VRBFHTAx+
	YyQB6vGogkLLbaQtE5xC9+3m8t1MPc5DGzbsvZ17LNTrqwWNWiyKSzkgs7zsNf3bLr+nkaOiQEm
	2FzJJO+4yBXzEVzupot1eQXU3IR2ZRFA1G+Cd+dgKefg+OX1bf5uTM/2GRfKVxmjrML6rU34BM/
	7TZjgzIi0v/+JXszLX7dnYMWgJWrZEtsbM2SPYV3mTcHmxZZ4wMVzcYKSlggGO69MR+hc7PrTYH
	/H/LMiOCSAJampagYdI2IuxQqxvKvIMkY8zCbWzWPShP3235nT5TX5hWJRCtMg0FteRFerBNoAt
	5nQSSs7rkbwlVy0WrFgZysXURCBpeQrTyxUYhRoE2ETtcaAoK3izOnbH8Nhckh6Ynxkw==
X-Received: by 2002:a05:620a:4444:b0:8c7:3ff0:d484 with SMTP id af79cd13be357-8cb4c0143d9mr812043585a.75.1771209440648;
        Sun, 15 Feb 2026 18:37:20 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b214e4dsm1196108385a.46.2026.02.15.18.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 18:37:19 -0800 (PST)
Date: Sun, 15 Feb 2026 21:37:18 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] ufs image class: add
Message-ID: <aZKC3qO6_iAKDWlB@localhost.localdomain>
References: <20260213163646.4018896-1-twoerner@gmail.com>
 <20260213163646.4018896-2-twoerner@gmail.com>
 <DGFOO2LV5U6R.2BRXDT44USDKP@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DGFOO2LV5U6R.2BRXDT44USDKP@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 02:37:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231178

Hello!

On Sun 2026-02-15 @ 05:41:17 PM, Mathieu Dubois-Briand wrote:
> On Fri Feb 13, 2026 at 5:36 PM CET, Trevor Woerner via lists.openembedded.org wrote:
> > Add an image class and wks file that demonstrates generating a wic image
> > with a 4096-byte sector size.
> >
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> 
> Thanks for your patch.
> 
> 
> > +
> > +IMAGE_CMD:wic.ufs () {
> > +	out="${IMGDEPLOYDIR}/${IMAGE_NAME}"
> 
> IMAGE_CMD:wic_ufs ?
> 
> At least I believe this is the source of this warning:
> 
> WARNING: core-image-minimal-1.0-r0 do_image_wic_ufs: Function do_image_wic_ufs doesn't exist
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/3267
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/3157
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/3210

Thank you for your report! I had not noticed this warning since it only
appears when wic.ufs is *not* requested (and since I was adding this
new IMAGE_FSTYPE it did not occur to me to test without it).

I thought my v2 had fixed the problem, but it didn't; please ignore.

But I believe my v3 found the problem and fixed it.

Thanks and best regards,
	Trevor

