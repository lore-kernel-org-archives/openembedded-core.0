Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0951EC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 14:05:31 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.55178.1699279523720159081
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 06:05:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IQk2x+rK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.178, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c6ef6c1ec2so55261521fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 06:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699279522; x=1699884322; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=86Akz38iOrb6Ehc/s+QYmNzYkVmkpBdDsdMuxeQGUZQ=;
        b=IQk2x+rKFZbVBtISToPpt/FFxkBnN/dkSg0uDnfkTih2FUpjeeSjSmd/EDzJIdoNDU
         6X1zslbh0YwYxWnXdxGEdEmoydMBzGmYCrP3KJvqrQRX2FB/Qx5vvOzFqnbsP+7EvFZY
         EuulpRJBL1Bkst6zZ5WcdKa592D2S4SS77hog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699279522; x=1699884322;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=86Akz38iOrb6Ehc/s+QYmNzYkVmkpBdDsdMuxeQGUZQ=;
        b=vsuz7Nmvou9+1KQ8Mvtzh1ORyE4SvgBQcR3SIzVeLOrt6tDoGltcYqePb8gbcdAxen
         HNW1dYyI7YBQvgQN6q43yjhQ2RK7eXVTZeQnz90Zpdr/FE5foybSSv0eWYMYiZ7TVZQ6
         0LLBzXaalZwjCUunSF3jKq+U5RfqSiiGZ9kuRMVVGU5kQ+5Ii4iCn/e/kSy+6/bUs3SQ
         hqAt1JoKPWzv08DAXTpQ6HIdrugi2K1kbz0O/Lu0UuUF7yoisABY6VnAgLVLmgZvdl+p
         9NPiAU+e87hDoBZJ3eOg3NTFhkDxqSaX5Gh9/rMeV+DiWtkzmLxEX+qE+efbjf01YLRx
         5HyA==
X-Gm-Message-State: AOJu0YwxusouS+O1FdmLD+Nrb6Ftj37rJBrQGt326/V7TO7+xK+z17bI
	16nyydO0ZSygQlYuD71CLe3DAQ==
X-Google-Smtp-Source: AGHT+IGBUFre7S4nmsg3P6oVCZwHQ9PRsA2OFXflYljpiV6dbbiXkavh7aIlRg991kc9rF0/xohaCw==
X-Received: by 2002:a2e:9f08:0:b0:2bc:dab2:c7dc with SMTP id u8-20020a2e9f08000000b002bcdab2c7dcmr23036412ljk.47.1699279521833;
        Mon, 06 Nov 2023 06:05:21 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1ccc:c310:74c7:1597? ([2001:8b0:aba:5f3c:1ccc:c310:74c7:1597])
        by smtp.gmail.com with ESMTPSA id r13-20020a05600c458d00b00406443c8b4fsm12248708wmo.19.2023.11.06.06.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 06:05:21 -0800 (PST)
Message-ID: <cbb90c77c8553d2c4d1b41c1458aaca264064a26.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v8 5/8] devtool: refactor deploy-target
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Freihofer <adrian.freihofer@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Mon, 06 Nov 2023 14:05:20 +0000
In-Reply-To: <20231101110129.647878-6-adrian.freihofer@siemens.com>
References: <20231101110129.647878-1-adrian.freihofer@siemens.com>
	 <20231101110129.647878-6-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 14:05:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190218

On Wed, 2023-11-01 at 12:01 +0100, Adrian Freihofer wrote:
> Make the deploy function independent from d. This allows to call the
> function also from Python code not running in bitbake.
> This is needed to for the devtool ide plugin which will call the
> do_install task and the code from devtool deploy-target independently
> from a bitbake server. This allows a much quicker workflow.
>=20
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  scripts/lib/devtool/__init__.py |   5 +-
>  scripts/lib/devtool/deploy.py   | 230 +++++++++++++++++---------------
>  2 files changed, 124 insertions(+), 111 deletions(-)

This is much better than some previous versions. The question is=20
whether it is easy to review and the answer is that it is still pretty
hard and we're being asked to the the changes on faith that nothing got
broken functionality wise.

For a change like this, ideally it needs to be really clear what the
actual changes are. The way to do that is probably two commits, one
moving the code into a new function but leaving it basically unchanged.
The second commit can then make the functional changes.

The other option might be to force diff to show the change differently,
not sure if that would work or not.

Cheers,

Richard

