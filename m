Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36559C531D4
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 14:50:22 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25342.1784818213121550459
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 07:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UNKN8MWX;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso281665f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 07:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784818211; x=1785423011; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CY+X2TDHbjgTL4Mv6uydWKIruYmub7nbZnMwjPAA6Eo=;
        b=UNKN8MWXXExOtn3GhauVGIstluOKnMhzg5LdEFn+5FU89923bL6yj57yn+nR1+NtV4
         XUc0o65lvO0KxSjnQ/b0wu7tF7YvWCuI7/sM+SBBgSKKJ6BmeeGttLTBZhfDikMUxTz6
         5oMbNGQ5x8571b0lMeelJUoKBsvkCDLR48DlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784818211; x=1785423011;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CY+X2TDHbjgTL4Mv6uydWKIruYmub7nbZnMwjPAA6Eo=;
        b=WnmruH+KoCPg3cgPTxUjumRZ2SOAyTwhWqWjmLlN4dNIEH+JoOQVl8wLq//JsVBbKI
         cYW0neGGGTPO7kMyxKei4IKiAYLdQY8tr5vy2v/qlyM8AJVxbCPD+vGA5CTzJcxU52ph
         mfIrzTJqC7im5fnwVJ29/VT7RlAVhaFdlUwnySqpLe/A5NQkGGzTY25+q/K59/ROgHs5
         vsBBBg4WNMeVIVNdzFGpHXoloyGRVmrla7MbDqL0LBVZYRo5VLk8fxolSyE4Jw2wJaQZ
         iYlWPBeKM+XZnCB9C6FxPfaZvqqlXva9mS25EAS8h0kumHvm3sFQVWhfbCExRmZc1x/B
         IZbg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2A7HbpMPBFH7w9pQg41FD9NR3Fi9mAl6nlSPCw3Jr4q/9qwwdSWYi9QNDpNLo+C3pifW6xTSiS4nApGzP9gkiGQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyVyILrpvxL2rL/j1rH+kwAqT9PGRrIwm7v/pm1eSm7CtZonD+A
	oG7+pGO97Lar3GmTd1WuFn/VMaaoe66Vrt1rRmE4j1x6Pxj21xShJnwGhKiTV7kDCC0=
X-Gm-Gg: AR+sD10Ob0sDPH5FTRusRG+S60YRgJ/HVdpiiPPv3TKaz6vAlzsCzgWPBNM89OFdGNA
	Uz8Xa5wE4VkI2izYzpg0qH18vBeN4ow6s04snP/vsLJOdcCO8i0cAvHl2jh6gtS+LBUG3uvTFDT
	A6LitGcIBtoMUWolEUoauHH5DbG7uJQRcC43tXafUi3cFOxyLnTIJviDfj5rphx6PTFhpIgqFEH
	ZURw1PYZ84T8y2QH+5LbSFbyAb1kkFM1VPVBDz4hvjw+fiNhic5PatpgpvnyEsbwzQKaJcgHUtv
	ptBKa0htKXokFnKF8o6nBxoVT+d/K8LUyRIBVQTZ0aeh/E9Sr98Yazvk8eTm8s1/Wjy74WuSH2j
	n/YreMovyRyo6Jo0YTuVYbvAvCt/ioG2/CW7loOWmRqaGUGti7bsO8cMkW1ilfPIHzW0xpbDHpY
	oThaGvRcwuTmJOaRnxRNXS3K9hycIT+GHcG6kjWCWGMDvlsam/2L0EMKxp43c4lAkG7Q==
X-Received: by 2002:a05:6000:220e:b0:47f:7114:7d6c with SMTP id ffacd0b85a97d-47f8dca50e8mr4592449f8f.44.1784818211216;
        Thu, 23 Jul 2026 07:50:11 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c532d4sm15598871f8f.22.2026.07.23.07.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 07:50:10 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 16:50:09 +0200
Message-Id: <DK61927PZM4C.2UUP8BSKKC6NY@smile.fr>
Cc: <sebastian@centricular.com>, <nirbheek@centricular.com>,
 <jan@centricular.com>
To: <tarun@centricular.com>, "Mathieu Dubois-Briand"
 <mathieu.dubois-briand@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5 2/2] gstreamer1.0-plugins-rs: add new
 package
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260707081701.1525114-1-tarun@centricular.com>
 <20260714105541.2812170-1-tarun@centricular.com>
 <20260714105541.2812170-2-tarun@centricular.com>
 <DJZ45A2IL6XB.172T8CGXQUIPH@bootlin.com>
 <DJZ6ZB5JTYSV.ZUCFUNHW05GN@bootlin.com>
 <d460480501e19d59ac2a7bec0f15020692f0b855.camel@centricular.com>
 <DJZTA3XYAG4T.1DDQE4ASD7JPI@bootlin.com>
 <4d95a8c8b8bcb0e1f5e01576466301f69eb2aa9b.camel@centricular.com>
 <DK54RIOEU340.33ALWQ7AGPKEJ@bootlin.com>
 <613be9d21a4a0f6fbec1c71aeca3a5874fbe4e60.camel@centricular.com>
In-Reply-To: <613be9d21a4a0f6fbec1c71aeca3a5874fbe4e60.camel@centricular.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 14:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241851

On Wed Jul 22, 2026 at 5:13 PM CEST, Taruntej Kanakamalla via lists.openemb=
edded.org wrote:
> Hi Mathieu,
>
> On Wed, 2026-07-22 at 15:22 +0200, Mathieu Dubois-Briand wrote:
>
>> We do have issues with freedesktop gits, I hope to discuss this
>> during
>> the next patch review meeting. No change needed on your side so far.
>
> Thanks for the confirmation.
>
> Regards,
> Tarun

Hello,

"issues with freedesktop gits" were a red-herring.

The root cause is that the submitted recipe gstreamer1.0-plugins-rs is
"floating": ie has not SRCREV value to anchor it to a particular git
commit.

Please send a new version with the appropriate SRCREV value.

Thanks!
--=20
Yoann Congal
Smile ECS


