Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F526CD4F52
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 12:26:20 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7210.1779107176441998914
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 05:26:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wzHwOdlo;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44c350a5b87so1250244f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 05:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779107175; x=1779711975; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPem43jHUH6vJeR5Ki4rt0fekj8rUa3HnBSTlNTURWc=;
        b=wzHwOdlouQpq6JjnzRJx4FoJZv8aWkxwq1XcTq85keyA34YZxe0NZ7mYu130GUeYfl
         C48XZVVQywyy0wiMXKkGXuwTM54kAgjkBYNZHuerZIcyCBIdGlGA7xfGKlpC6mEdASbI
         soeamAqdUard1FvIzEZZyv0CzZhjfZbeDet1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779107175; x=1779711975;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SPem43jHUH6vJeR5Ki4rt0fekj8rUa3HnBSTlNTURWc=;
        b=DP5xCUn9TngSvyJM/LVeYp3FC6XP2rMAhAphb89qxl0B03QQEPPd8e4YYqb1ly1c8E
         NCGd+tuj9MTrfs0nHN/KFVNSY8YfZ27dfNMZ7PblvpOREzGfhP7+b8sDVWNnTLKUFNeN
         QV+69ag2GbQiYqokgky4FHgNdMqXzHRrsbTVwzfRHcKpQ38U4vFXRTxjDtH6pxWoVChi
         g/FnDvh80iZRPwJl+sudIG8n5bj8Gkptb0/ozTDoIdMKo7Dc7iowGu7BfrdhT0QHgJI6
         yTcPOTtDU3BiY00C7MV8U4AZIBKgnTqEMMWPl+Bea4xw3FJIM9H3P19PfPLLuEaPozvK
         An0A==
X-Forwarded-Encrypted: i=1; AFNElJ9/xB0wGMJiMoqnsenB8TLZjJevGCjtMY1MqQVpLue9rs2StWWrTK0SDyIkb6L7rEYXKckjhN8QrS88JAxHvsfGGw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxZVf9MtydLuR2Oc/QRSKiEm/HqfBHFCQvAEzZY+XHeJKxnmnjH
	4OyflNM/qVXz9tYgY3qevTSzv+LwhzFHmbMNC0scyrxoYN/OLm/W+Jx75TNfAsJhtRQ=
X-Gm-Gg: Acq92OH3CvrhQENd5jDP5bn+pa+YSII8qGniAh60X0bF2zTT0BwYgv42fLT/9staNf2
	UbVpys4a95lE923L8y4jMHd0pVYCM+o/O+ThZGA8fgkLC72QX4yFmFboidylgwIPx+1LL2XUj6Z
	5V002kkIg0AZePqzPnurKrEYzRFbZjHzMNISvzh37MCtvc9f7gRR1cvRg1ZMx7KccpN4TrPrQUT
	I+NPvJLAP+mwchIR9YNUIcorgsjrl622MWTf2HmcR47IRykMypPMouAC8hyIpAaJRYmwyyZ3d1I
	1Ad/OXbA9tpSVQUUwwLnS0+OdtbL8eZg5k21kC3uTr8tftiiQKiPClUeMgHSPzhYBbfB35oGYCw
	0XejmMn3A2P6XP3EUQz0VFjFg6RmjkGO5NRuIF8mQgEF7eXhEv0EZgxazta8CF9N5Grv+Rws0KS
	dIso/oAfYUGXrXOQWBa0k/qJFrkU+YqKwBzxh4pt+6zFqJAvsbEDcccTNWwUgh13sk+TkERxtqs
	KK49Uo9m3RPym44nyijPQ==
X-Received: by 2002:adf:f64c:0:b0:45e:73b3:4515 with SMTP id ffacd0b85a97d-45e73b34553mr7354247f8f.35.1779107174682;
        Mon, 18 May 2026 05:26:14 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45e7c22d8b7sm7862102f8f.6.2026.05.18.05.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 05:26:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 14:26:13 +0200
Message-Id: <DILSUWH1SPZX.1OX8ZCTTGJJ7X@smile.fr>
Subject: Re: [scarthgap] SPDX3, lz4 and avahi: Patches status
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Joao Costa" <joaomarcos.costa@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
To: "Benjamin Robin" <benjamin.robin@bootlin.com>
X-Mailer: aerc 0.20.0
References: <Mj30OkfVRxGpGbLR46KjAA@bootlin.com>
In-Reply-To: <Mj30OkfVRxGpGbLR46KjAA@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 12:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237236

On Fri May 8, 2026 at 2:57 PM CEST, Benjamin Robin wrote:
> Hello Yoann,
>
> Today I checked the status on patchwork of all the patches that I sent.
> I noticed that 3 patches, which I forgot to monitor, are currently stuck =
in
> the following state: Awaiting Upstream.
>
> Do you have any information about it?

Hello,

When I received them, I couldn't use these patches because they where
missing for whinlatter (This is why I use the "Awaiting Upstream" status
for).

I must admit that I have lost track of those since then, but following
this mail I've added them to my branch under review. You can expect them
in the next patch review series.

Thanks!

>
> meta: fix generation of kernel CONFIG_ in SPDX3
>  - https://patchwork.yoctoproject.org/project/oe-core/patch/20260303-back=
port-fixes-scarthgap-v1-3-2dc803f921a9@bootlin.com/
>  - https://lore.kernel.org/all/20260303-backport-fixes-scarthgap-v1-3-2dc=
803f921a9@bootlin.com/
>
> lz4: Remove a reference to the rejected CVE-2025-62813
>  - https://patchwork.yoctoproject.org/project/oe-core/patch/20260303-back=
port-fixes-scarthgap-v1-2-2dc803f921a9@bootlin.com/
>  - https://lore.kernel.org/all/20260303-backport-fixes-scarthgap-v1-2-2dc=
803f921a9@bootlin.com/
>
> avahi: Remove a reference to the rejected CVE-2021-36217
>  - https://patchwork.yoctoproject.org/project/oe-core/patch/20260303-back=
port-fixes-scarthgap-v1-1-2dc803f921a9@bootlin.com/
>  - https://lore.kernel.org/all/20260303-backport-fixes-scarthgap-v1-1-2dc=
803f921a9@bootlin.com/
>
> Best regards,


--=20
Yoann Congal
Smile ECS


