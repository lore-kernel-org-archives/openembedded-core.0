Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B81C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 22:33:45 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.1862.1750804417512824189
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 15:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KuZ7z51H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45348bff79fso63899265e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 15:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750804416; x=1751409216; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PV2tBPcFQc7sw12SXC57TWihoNX19H1ZbEqBkg9Vi/E=;
        b=KuZ7z51HtxCxvnvTxKcl2mCG+NdJYAueeYPKj+2O26rgxh5TPaflztas6vwRqzaCe5
         6f3gEjZbDNbpBRJSkUwrCjthEbAvrshqPSfCJX4+J1pWR+61AI8DH2Yqv1eCz84FFg45
         tYU86nyOL6/CKubLJQihaBg6dtN4QVDuZJuh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750804416; x=1751409216;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PV2tBPcFQc7sw12SXC57TWihoNX19H1ZbEqBkg9Vi/E=;
        b=Zkrhe9lPXGjsSSv91vCmQIM7nL178x9SEpi+orI98+Kf2II2kL4kW/DL3Ox6sFaPHe
         luH9FmXlcQLVpBfMUNgUAhqpxchZ61XoXLBcTnQwZ25Pck+LvrhkAPBgCYXgrpYZ/V4r
         G7S+80ToPjFETEtGXwDNa3g7H1UYRkADuJjPQD36JLIirUd9SAF+bJhQ/CZF3jJRg2bm
         WB4jWzqy3S4NAuEBKmXC8ZcaGsUZsrWUGL3ykkfrnAnycE7dkDhLlT5oVmiBeHe1MiZN
         jeEXHDrOicfgsr9bI9wOwxbdj1hOwmLzMcEFUFjr6XZQRC3bI/mpa4KH96/ecZLMG8Ee
         Jdiw==
X-Forwarded-Encrypted: i=1; AJvYcCV0sgAowFRRVeQKWkM2IrIlZxCUmmd/UKmAFsmweYtxheHy7mKextrxV9/3L5Me+WZ2F31Ati4WKvKp7oEA7NRPIA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzn7x8eDLW+0DU4+LCJsxG6IwRowu0r/mQaGjCHda5NVzwTYgtt
	I8CRjNqD3L02Tgwf8WpLK6NiGn1QQcv5mVWDheQbIY6cTRPFQtoZYCnic+wv0unseuw=
X-Gm-Gg: ASbGnct5fNWuB7dJoLRuaPvG2GMdQCvNt7DySXWBuGZmVZWAxjkZDHT+FsuGfM0O5Pj
	4QqcOgs1hWOOWOKg84LqH323aKB+5a85DYzDQ0shTeLOaeCV98PvjZSMRztI7+c9lflvEfCPmvy
	yP2cl/akr2GjP8y057+eSdMhDf2CY6WSVuThaOfqp0txWLGK0EXUffxODu1APIlHbxIJF8rio9h
	5aNnQ+0/fuPeq1kUujRVmDeOPOZHzS8YSKH1MSu3YcZvoiWt8VCZDICT2xONO0vv9LTdapc1wjI
	Mpg7Mlo7IhmRtZBJgv/hNC64RApksz+wud5KW2uxe9gpLq2CONLzYh4GTq30d94Zspr8SRkscnc
	76heoAVUsAYBArvWM0gnwhFuYDR/jIs0nR9i+5POnRcJKBZpWmqs=
X-Google-Smtp-Source: AGHT+IEu5BmnZLE4DCHp4BbhifstYeTyLk+Tv53yfsKBDXs/B6LTuLwSw3EWa4a1Mx96YUSkLBCY5A==
X-Received: by 2002:a05:600c:37ca:b0:450:cf42:7565 with SMTP id 5b1f17b1804b1-45381ae5157mr5095115e9.23.1750804415902;
        Tue, 24 Jun 2025 15:33:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2382:c379:cbb0:17a7? ([2001:8b0:aba:5f3c:2382:c379:cbb0:17a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234f11fsm1791225e9.16.2025.06.24.15.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:33:35 -0700 (PDT)
Message-ID: <993b2a5898a5e788f21624180dc71666cb91e206.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] host_dmesg_logger: dmesg diff on
 BuildStarted and BuildCompleted
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: gavrosc@yahoo.com, openembedded-core@lists.openembedded.org
Date: Tue, 24 Jun 2025 23:33:34 +0100
In-Reply-To: <9005.1750799643434791617@lists.openembedded.org>
References: 
	<cdb51b9a5a1aaff3c5dfcd4fec89a97135e8afd6.camel@linuxfoundation.org>
	 <9005.1750799643434791617@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 22:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219287

On Tue, 2025-06-24 at 14:14 -0700, Christos Gavros via
lists.openembedded.org wrote:
> I have read the comment with the links but I didn't dig through them.
> I was thinking that maybe we need data from more builds in order to
> decide how to filter out.
> Then, if this data is sufficient, shall we filter using "dmesg --
> level=3Derr,crit,alert,emerg" ?

I don't know what level the error messages in question were so it is
hard for me to say.

I'm not convinced running more builds generating those warnings is
going to help unless someone actually goes through them. It seems you
don't want to (I can't blame you) and I have done my best to try and at
least help others through them and put what time I can in to try and
help.

Personally, rather than log levels, I think it may be better to filter
out the known things which we consider "noise", then run another build
and see what messages we're getting that we do care about. We could
then work out their log levels if we still think that kind of filtering
would help.

Cheers,

Richard


