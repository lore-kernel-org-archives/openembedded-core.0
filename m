Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F801CDB465
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 11:13:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.60713.1697282036362470198
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 04:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KSjxuqiU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40651a72807so29325175e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 04:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697282035; x=1697886835; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7Hoabk9LgDG7AVtJ/9VbI0K4NvP7rAaguGPxnfhSPGw=;
        b=KSjxuqiUZeN3Zi0lXt7TvQryMQ90HN78pgE8H/WsKrzqRiaVMK884NRR0Fh+t2db3q
         UFPRJNq08crQPPk+tR64s0lWZYhN4PRZNqQMIpWUR8LguEOmFh38zyTIqaw/opUo+BKx
         YSdOccX/aVJRhDvqcVTQm4ewJfhk8p+f04H1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697282035; x=1697886835;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Hoabk9LgDG7AVtJ/9VbI0K4NvP7rAaguGPxnfhSPGw=;
        b=sy9XSwFJJzhS8AIi1o+aLvqkdXhi1EqmIbVO1J6DCBd/60/ahl+yxPigfEnYxpkQAz
         LVgrJbd8FnTonoF0eDFNh0hEqV7fzXBmKb9SLr6Ts4cC8UW0m4kBwEHEV4HVtc6dorEf
         7DbYyebxSj8vjrmjvYQbyblaMu6MezruUu8Z7+aa0ISYHr0eS62XKJBJAAfYSYGT42Ek
         MOKmbv3a3cso+SQpmDgcSz77vp5+OK1ewNRsDp4z/Q4iOXOZNezghHIim2sN75MR6M/1
         rCvD/xh1xFweA+Pu/7nXhO3AZiJiu/mfMvEa08jHU7W8J7nnIjlSH6uroAflf82vQYYk
         z/2Q==
X-Gm-Message-State: AOJu0YwPWIS6XhSDTvKrkMX36AmErNi5K7NVk2mGHQBrd5/CsLGvJ/5L
	NyBPLpLohDVOERrc602TAjdt2Q==
X-Google-Smtp-Source: AGHT+IETk0aw9hqoEn4tFp5lP32SpVPRyTIgWwiZ+OYJ6SOoh93lN/8euNp27nFtrND9kctMy4PDrw==
X-Received: by 2002:a7b:c387:0:b0:3f9:b430:199b with SMTP id s7-20020a7bc387000000b003f9b430199bmr25481496wmj.15.1697282034719;
        Sat, 14 Oct 2023 04:13:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:66ae:9f57:4dbd:827d? ([2001:8b0:aba:5f3c:66ae:9f57:4dbd:827d])
        by smtp.gmail.com with ESMTPSA id s19-20020a05600c45d300b0040648217f4fsm1745278wmo.39.2023.10.14.04.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 04:13:54 -0700 (PDT)
Message-ID: <c85ab969826989c27402711155ec086fd81574fb.camel@linuxfoundation.org>
Subject: Re: Kernel 6.5 ttyS1 hang with qemu (was Re: [OE-core] Summary of
 the remaining 6.5 kernel serial issue (and 6.5 summary)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, linux-serial@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tony Lindgren
 <tony@atomide.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Bruce
 Ashfield <bruce.ashfield@gmail.com>, Randy MacLeod
 <randy.macleod@windriver.com>, Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Sat, 14 Oct 2023 12:13:53 +0100
In-Reply-To: <1520ecb5f4b6959af835a7781b94694913f76912.camel@linuxfoundation.org>
References: <178BF2895FF685E6.5378@lists.openembedded.org>
	 <a2ad67a0575548b6d5d8d187e597dcd72ae07f64.camel@linuxfoundation.org>
	 <ZSPQY6UYg21Z0PnN@nuoska>
	 <1520ecb5f4b6959af835a7781b94694913f76912.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 11:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189113

On Sat, 2023-10-14 at 10:41 +0100, Richard Purdie wrote:
> Brief summary:
>=20
> We're seeing an issue on x86_64 with 6.5.X where data appears to be
> left in the transmission buffer and not sent to the port on the second
> serial port (ttyS1) until we trigger it with intervention.
>=20
> Paul Gortmaker did some painful bisection over a few days down to:
>=20
> serial: core: Start managing serial controllers to enable runtime PM
> https://lore.kernel.org/linux-serial/1431f5b4-fb39-483b-9314-ed2b7c118c11=
@gmail.com/T/#t

Having poked around a bit and knowing nothing about any of this, should
this bit of new code added in the above commit to __uart_start() in
serial_core.c:

	/*
	 * Start TX if enabled, and kick runtime PM. If the device is not
	 * enabled, serial_port_runtime_resume() calls start_tx()
again
	 * after enabling the device.
	 */
	if (pm_runtime_active(&port_dev->dev))
		port->ops->start_tx(port);


actually be something like:


	if (pm_runtime_active(&port_dev->dev) || !pm_runtime_enabled(&port_dev->de=
v))
		port->ops->start_tx(port);


since there are uarts that don't enable runtime PM?

I notice that 16550A I'm using doesn't set UART_CAP_RPM and since we
have data left in the xmit buffer (I managed to confirm that), it is as
if during init, there is a race between the serial probing and the
getty putting data in the buffer? If it weren't statrted, that would
explain things...

Keep in mind I know nothing about pm_runtime or serial/uarts so this is
guesswork on my part.

Cheers,

Richard


