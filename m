Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD4EC44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:20:13 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46835.1784722807599418996
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vSwQOy1c;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-476a130c138so8964747f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784722806; x=1785327606; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vgmmx+jXCl7SBAupiSCIwV3SSQacdAU1xNZlZBoEby4=;
        b=vSwQOy1ck1ql5l+IxhAFeUv0uQbFO9/M0m3OUi/2QLy+UDlmlI71twBTyiRlvz4iMx
         pR0EtWsDfDXp+4TLQgRCLlY0meqRXBbtc7xGvJ1yHk+IeVcNny+szYxkG+ewbtxr+xYv
         TZuM3QGtav/W7OO337w6RGn04CVIGXSvGEXRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784722806; x=1785327606;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vgmmx+jXCl7SBAupiSCIwV3SSQacdAU1xNZlZBoEby4=;
        b=AI1Kc5y1w/Gy4fIz6bsNUHxDLNfVvqHbedCULouu3IZ+6KIoKar/OyQtIxJAzoGJoX
         /GSUcA9Ir8QwiMQc8Etek24ncYjKIfdrG5Ncx7Fnf12g9ERN7j8CYNLiswjPHGSoFzJi
         xKmh71j7RdkrBcaWt6eDnefV/CUUBpG4rmgC9BXlPPSlpVsvXWWzuErz4fs6EOWLJS2t
         x7PgF0+Vppw/maxK013GA36DnKK0RzkKhRP9FQfOAaxS/WJB5f78AesED+WPCagC3ypV
         BMYYEHw1gir7QqKB+qLrmOUV89CGFl1igThOYZljuXbouFdd0KUiqk2+FYidDhVV/crT
         14OA==
X-Forwarded-Encrypted: i=1; AHgh+RpPiD6VkBi4xe71Dy/JuLCyigzPzx9uuYn6syc7peoKtHFAKNDSrsRGjZ/x54+1k4W29QiPxhZH/LBFOT3DvWBPhg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzT86LkJnUjv2PkOOqGkeOKqcBvpHDnUBI+noaru/8eAaWH8wI8
	amFQNi8BvpfETmGdQT6l0ZjMgQqlXiezh56ODO5umwKJLm27kFMqDtsqBD6C2/tcRz0=
X-Gm-Gg: AR+sD12VuR38w3iQI/p4gjTbfw0ydWaFFnUjBJfSOqJ8bvzX4ITSb4kVeYHvpiO6kjr
	YPKhm+YKO/bB4AP6M+lYD9dzdrqJpUv7HYKlYVx3mUOPyGBNqNMpoa5b4MO2ovuqTiE9MToSt6K
	FBHyCR26BHz1d0SelzQ0QlG/x7pCw8U+H2V3bIwCdIfkMOyaoxTVzbN3qNxdQTHMkz7kuPwUIZA
	8EMjJvZD/5dqffv1q2dFS1YtCWOaXB2RHHbV9HI2Aewprr0U5x8PoXARZkPaz0imUY7i+lrTqY3
	HLQ8ilCQQS9FPhwEHjQhj2BkiRlnAJCHZdubzZJ9rD2M5GjP+7MhOr48Z2kWGopiy2bYwu4XcYR
	BdIzdsrES9fXPWJv7muUUz1SNZQq1AuIMxV/uhkp4p/7I79XDhPJGPYsiqkN7I8CJy26VGUmOmC
	dXrTHdSj86q8N7Vvdy5NWPr7S6JgBMOUETvuRBryWUpo/xpSL6U0zt81eajHOVQQ==
X-Received: by 2002:a05:6000:4025:b0:47f:7c50:2222 with SMTP id ffacd0b85a97d-47f7c50261fmr12759127f8f.24.1784722805546;
        Wed, 22 Jul 2026 05:20:05 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c531afsm5287188f8f.24.2026.07.22.05.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 05:20:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Jul 2026 14:20:04 +0200
Message-Id: <DK53FLV3KVRE.3GAZN2WD4XNY9@smile.fr>
To: <ashishkumar.mishra@bmwtechworks.in>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] package.bbclass: fix execution
 order bug in emit_pkgdata
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260722121119.888611-1-emailaddress.ashish@gmail.com>
 <978937.1784722525653637859@lists.openembedded.org>
In-Reply-To: <978937.1784722525653637859@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:20:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241665

On Wed Jul 22, 2026 at 2:15 PM CEST, AshishKumar Mishra via lists.openembed=
ded.org wrote:
> Hi Yoann ,
>
> This is an bug fix patch which fixes the emit_pkgdata order
> The same have been merged in master at https://git.openembedded.org/opene=
mbedded-core-contrib/commit/?h=3Dross/wip/nasm&id=3Daa85baff9ebdd3f932811c3=
b43d1918c38373cb9
>
> Request to take this patch in scarthgap

Hello,

This also need backporting to wrynose, right?
If that's the case, please send a cherry-pick request (if trivial) or a
backported patch.

Thanks!
--=20
Yoann Congal
Smile ECS


