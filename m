Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D50E81BD4
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 14:58:10 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49037.1770649082490539954
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 06:58:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bsQQmv3D;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8947e6ffd20so65356756d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 06:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770649081; x=1771253881; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vWUjtPRAaxJ95ZCUotmosyWR6bStOAsnG8DHXFSubrI=;
        b=bsQQmv3D/yl3WAwywhYvW7lEXl0UmIK2As1Dza+gg/m1TLhR+wXIbCCf//bd6SL5Hp
         8YBc/Zb6Me19CSxBCTCChoWCo4d8okD2DGZv/jkvknPSJj9E/9V6L5bdUeWZu71ysB1B
         QN3IDrvphG7ugugydFsj52/1Blsa7vSLOLnGt+fraAe5qYt4uSlFYeko/BxCDSmn4+I8
         k9eeqXuPzNGYZOJG2v3Vuwaj3UANCHCS7w6waASHwQceMehgIZfbKsbhQRcxdwPuRALj
         CJPpjpGkc2O7yIr7QD9zYDI/Ia5saAVFK5zvFQsZ1BkaawRqssIz5Ut/q0RdyR7Yt3LA
         1pJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770649081; x=1771253881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vWUjtPRAaxJ95ZCUotmosyWR6bStOAsnG8DHXFSubrI=;
        b=lWgGHzMLYqKIGS5nOHctGjM4wZT392MZnHmEvnp6XcR1pZpNA+FznwKc/hFClAiqaX
         WdJmP1BRYm3c6N3uXw5/PzvAGQ4mFdZYCWcD1xdHOEc41lnOd1OLsr4yYp6jt07WMObW
         yhpE8BhQAbh1CVlBZRdpsAWBdx31ySjeuTuExhKAcnFS0tdRKTOjdMw8htndcsaNq6/2
         8p96ZuC3DMF+rZecDICPf3a6uOv6objetkB09UHlZpeGQbuTwRxRla6gfPf5YhBPJpLd
         R9BmczseB0IwTCWE5VgQa/G/bvQlmQp++svF5JazO12u0lfdDfYLnqOh8MSbVTsYAyb/
         dZDg==
X-Gm-Message-State: AOJu0YxYPJLUAzHys0hcAEEvP4oo5LG0m5pXnN0SwecFUO5BSKkWEmMD
	uyU8DOx19rCaw0DVhhqPuO1VibAKjn/HqyzPMeJLCeoxpVIrIhCesdmC
X-Gm-Gg: AZuq6aJwcayFPLw8iZc+7C9JUxyNo14X3pP35s0ZSz/8yfbOUgSHS8NjsrcQic2vyRP
	QU4GE4KoX1WilIs31C3dvZcrbtIfBSLWiYgw9W7tvmn+N6w6dLfOCdwg1qllku4VoNdcO4yIrjM
	crmXEe21zBeT6usO+FTCWHIDyRMJhQ2sUAdSyWgRQza+UkI0QKCsZbg3DYV8jdStGtxu6KPw598
	Sh+kDoAm006GHN7+NnCoqyC2idgMBLl85mpqodnxdlrFlF3Amy5cdOchlIx9BqAMwZys3E/HlJy
	FqG7gJb33j3U1cjnATXqUeBZCwX7En/LpAbThocmlgEeLQSpwNZiHJZ9G6AaJjKIOkn16XZGe1R
	0IJcIZClLlUu9xKcMOwKdBax/M3FNIGsGD5BIsDhVvCo/v5XAK+7msyoJXq8+B2G35JRg58YLsg
	RQGkizqnlQ/y9hK+rn6gDT5odw8Ni8u6QeGyTeU1P1EaMXfTF6uPjVuzMlOlfRZi0L
X-Received: by 2002:ad4:5cac:0:b0:890:33cf:c37b with SMTP id 6a1803df08f44-8953cb7dfcfmr158129586d6.52.1770649081421;
        Mon, 09 Feb 2026 06:58:01 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5064afde581sm53306571cf.25.2026.02.09.06.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 06:58:00 -0800 (PST)
Date: Mon, 9 Feb 2026 09:57:58 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/1] wic: remove
Message-ID: <aYn19rRt2I53-qrq@localhost.localdomain>
References: <20260209041637.2690868-1-twoerner@gmail.com>
 <DGA8RIOG0T4P.23RGH6T3W1KT3@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DGA8RIOG0T4P.23RGH6T3W1KT3@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 14:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230806

Hi Mathieu,

Thanks for looking at my patch!

On Mon 2026-02-09 @ 08:10:09 AM, Mathieu Dubois-Briand wrote:
> Hi Trevor,
> 
> Thanks for your patch. It is conflicting with a few changes I have in my
> mathieu/master-next branch currently, so I can not easily pick it right
> now:
> 
> 39c72286dab9 wic: extra-partition: introduce variable matching sourceparams
> 799346240452 oeqa/selftest: wic: improve extra-partition plugin tests
> 2a2085d1d1c2 wic/engine: warn about old host debugfs for standalone directory copy
> 
> My opinion is we should try to either drop or merge these patches
> quickly, so you can easily rebase on top of master. I will suggest this
> during the next patch review meeting, this evening.

I knew those were in the queue so I rebased on top of master before
sending in case one or more of them had been added. Either way is fine
with me, see you at the meeting :-)

> Thanks,
> Mathieu
> 
> -- 
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

