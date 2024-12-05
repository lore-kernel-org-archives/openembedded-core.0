Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8411AE7716C
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 10:11:52 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.7339.1733393502530878156
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 02:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rg+KaSJP;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ffd6882dcbso5383551fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 02:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733393500; x=1733998300; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vqs+m3OrzER1eG25075YZ9pGKtDacpN4Pf0jl7G2zXA=;
        b=rg+KaSJPpuoS8jzo9YaWK3G6sqcZ7rAqK3tU31eU9OUKRr//Ei3G0nas5Tm2WhVRqO
         7PnLdscFRz+hVyviKQ2Z9HNgXwjQujhZSMgxkVnYvQCUiMttuNoUp0328y/R7f3vgUbi
         KaXZvmeQ97fxflu1WulGMEr/J1TbBnoTzq5df28owc6DlQxQ4hdCY6LBM09jJSBVY5vV
         hdhcUPuxR7iFJd6QAtIit6bnNz6feaZf3gnGzK0c1TWzzsiNZklZyRy4BTIIM1RaFHmq
         /B1hrZUbHKbMqKoshYYubzjaJkkIDWcUVMWuajELJhVZjQYkdsSApY3Qv9N4iCRdlY/N
         A7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733393500; x=1733998300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vqs+m3OrzER1eG25075YZ9pGKtDacpN4Pf0jl7G2zXA=;
        b=Il5G1sWG2tJ07QNHqEG5M1clTm+5y0tVYS7d//S/Whgt1KBCuDC+GhA+DQW9Zi9Dr9
         EAJ8JvqAcpXOSdXMeZd6mAo4pXv4ltdJe3Kktp9gF38zropZbhFw6oM8Q9BgUEnBquNa
         rq64BFxmT6t5aTbwCo8CkvPVHMu73eI5R8WsE9TGtPmMNeX4J52nNyLp7oIne01iz9E1
         jeriWBJXTR3qbkjxLve0WBp+kZNRx3OkCkBQIfq5Dh2xyFVMew1jsf8bFV1POL7qvbGb
         clUCImuQN1VHD4hmtTp9G8kOem2mxL9j1rFjNgdWcboPp9dZxY4at+xw0gSsBu3CoDs3
         OyLQ==
X-Gm-Message-State: AOJu0YzBFaxfvMZvf+uws/h5Qft529bNIpBj4Dvo4BUj8oOszBE8sDup
	ko0FvDrGrMKnTPL1f1ZTmwNv5JW6R6lDuisP0OZU+8wkAVNkKeW8ALXmbSnJlfRoKKP49fM95BM
	Z
X-Gm-Gg: ASbGnctE/+f33HyYdtcQrvPXbMEfsn2ruW7qJjN/Ef8GMrV0BcVGYeCo3yzz2jPJhGv
	MaVBnvCseNgwgyiaLgo5Os1B7AQn+H6GoD9hlcImeGPIV1cIp8XZtS3OAl6xbdIr+L70gzE9akH
	nWfDZVxMIuyQ1M4HmrN6jqSA+MX0pTX0QjphK9YulSf62VX23WfleLaXaydwuRR3O0gSBPlgrvG
	Zket6WyXn8z/I/ejUctrriZrF0DqVm3ZQ3Wr+aunaeFJBqMUWdSaC1Z2RU/4HWmoplxdBe7/htK
	Gek=
X-Google-Smtp-Source: AGHT+IH1SonMfipexz1sS34NEhtW3jjdZeU6P402MhHjtSfAYyjA9lGjSqGrFgLR6znyBTf0VMCRAw==
X-Received: by 2002:a2e:a881:0:b0:300:264f:d002 with SMTP id 38308e7fff4ca-300264fd11amr4027571fa.27.1733393500533;
        Thu, 05 Dec 2024 02:11:40 -0800 (PST)
Received: from nuoska (2001-14ba-490-c700--133.rev.dnainternet.fi. [2001:14ba:490:c700::133])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020e205cfsm1738551fa.85.2024.12.05.02.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 02:11:38 -0800 (PST)
Date: Thu, 5 Dec 2024 12:11:37 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/3] swig: update from 4.2.1 to 4.3.0
Message-ID: <Z1F8WTH18m_fzyxQ@nuoska>
References: <20241205093237.333818-1-mikko.rapeli@linaro.org>
 <CA+chaQfkLvTfv5o30LZzuBHJ42Yo_q1MHkg55HJbcZTw+SdqDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+chaQfkLvTfv5o30LZzuBHJ42Yo_q1MHkg55HJbcZTw+SdqDQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 10:11:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208373

Hi,

On Thu, Dec 05, 2024 at 10:43:19AM +0100, Martin Jansa wrote:
> Does this swig upgrade fix the issue with work around added in:
> https://git.openembedded.org/meta-openembedded/commit/?id=f9158ce32fffa6f18eed4008c3295146c81d55ea
> if yes, can you please send revert of this work around to meta-oe?

Unfortunately no. Without f9158ce32fffa6f18eed4008c3295146 in meta-openembedded
python3-m2crypto fails:

| src/SWIG/_m2crypto_wrap.c: In function '_wrap_fd_set___fds_bits_set':
| src/SWIG/_m2crypto_wrap.c:11826:88: error: 'fd_set' has no member named '__fds_bits'; did you mean 'fds_bits'?
| 11826 |       for (; ii < (size_t)1024/(8*(int) sizeof(__fd_mask)); ++ii) *(__fd_mask *)&arg1->__fds_bits[ii] = *((__fd_mask
 *)arg2 + ii);
|       |                                                                                        ^~~~~~~~~~
|       |                                                                                        fds_bits
| src/SWIG/_m2crypto_wrap.c: In function '_wrap_fd_set___fds_bits_get':
| src/SWIG/_m2crypto_wrap.c:11851:48: error: 'fd_set' has no member named '__fds_bits'; did you mean 'fds_bits'?
| 11851 |   result = (__fd_mask *)(__fd_mask *) ((arg1)->__fds_bits);
|       |                                                ^~~~~~~~~~
|       |                                                fds_bits

With workaround f9158ce32fffa6f18eed4008c3295146c build passes.

Cheers,

-Mikko

