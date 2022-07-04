Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D6D6C43334
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 21:20:03 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.77072.1656969593237895266
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 14:19:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EKOChY7C;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id k129so6029977wme.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 14:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=bFr9fUbjQmrWLeGaGzWTOVd4nwlk7WG5Y9iTRGj0ZSU=;
        b=EKOChY7CYs3e3uWLu2Lf1CEHIxOiFWBVTGsG6NBol2ERpfNtk6UPaTSqZvPk0pznpw
         jOEdiNYcxvKN6Ai6UZ58VVKNcXRS5/2qZMLH43Yb0AiVsEPZZrMVZSIVajeRjLh5yMCZ
         eeuTgkD4Ocd5KrJXFs2Pne9Kdg5BCEYADdzwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=bFr9fUbjQmrWLeGaGzWTOVd4nwlk7WG5Y9iTRGj0ZSU=;
        b=SEwszYnMOey0E0R6TaT9wEkFSNVoniEtOPFqTkeYeh0SDg2XPR6rR+GU3LZK+0XtPg
         4R4GDB5Tsfoh86N/DOcwzZePVAlxcR9c37UsIu9b2KtwheaCuLZmu4hVwKTsCKf6pD7U
         tT+KSTvzTLMXUKu+4f9i/tI+SpjRrNEZTX/jHzLqv4XT+oKJG5DJSkrzcncqpQQYWCR4
         QFg0FD73MLj+wzqPVLXOW9Gv0UbjTv64EVDKXqUBaY1IbBV5DiNI5eMpyjpjkaSInjjm
         0OEix5nZN0alT7wqciuOxm/bX3vETQJ8mkfPbY91V8gNuWKIwGAEfNDj8BZFvuHiDX/B
         iTxg==
X-Gm-Message-State: AJIora95CzcWmbiWh9iRa5gw/U5VNv1OPJ0zDxF0Jy7JA59MFLWGVcKf
	xS1ClN4hxciIN2a469i7Z0kpZg==
X-Google-Smtp-Source: 
 AGRyM1sLiIkA0k1xXZyfy4fW5HAJzQF8eILALBcWtQ6tApLg+72+202qBGI39PHlMKcRdraf6f72mg==
X-Received: by 2002:a7b:cd94:0:b0:3a1:7c5c:b11d with SMTP id
 y20-20020a7bcd94000000b003a17c5cb11dmr27495856wmj.87.1656969591410;
        Mon, 04 Jul 2022 14:19:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7dad:6fff:75bd:1ad8?
 ([2001:8b0:aba:5f3c:7dad:6fff:75bd:1ad8])
        by smtp.gmail.com with ESMTPSA id
 c8-20020a7bc848000000b0039c457cea21sm20223814wml.34.2022.07.04.14.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 14:19:50 -0700 (PDT)
Message-ID: 
 <1e70783f1bef049e15d5a5e75a336f9c97011373.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 3/3] oeqa/sysroot.py: Check bitbake return
 status
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paulo Neves <ptsneves@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 04 Jul 2022 22:19:48 +0100
In-Reply-To: <20220704144653.2490662-3-ptsneves@gmail.com>
References: <20220704144653.2490662-1-ptsneves@gmail.com>
	 <20220704144653.2490662-3-ptsneves@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 21:20:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167626

On Mon, 2022-07-04 at 16:46 +0200, Paulo Neves wrote:
> bitbake ran but we incorrectly did not check the exit status needs to
> be non 0. Now all sysroot tests commands expected to fail are verified
> to do so.

This caused a series of failures on the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3775/step=
s/15/logs/stdio

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3786/step=
s/14/logs/stdio
(and a couple of others)

Not sure what happened at this point.

Cheers,

Richard




