Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30C0C7114A
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 16:49:06 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.2046.1749833343537044989
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 09:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bIHyT3LG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so27474865e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 09:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749833342; x=1750438142; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zOkROKIIysoXVHkasQ81NhC1PZtsx97p87b75KbBa9M=;
        b=bIHyT3LGMohsV9HBtW9SFIRzhYlCmO9h0U0PiQE+WGPbIk8zZZp+G7LIwvXTl1VMoe
         syJLkY9BkWvgVNMEexn2hU6L1/bdCAjTGH6ULSW0XMj1x5blR+bRm4oVOmuLcCaFzEo1
         CHH6XkLWJOOw6enABaXpO/jC0Rc8+bbLU8HaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749833342; x=1750438142;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zOkROKIIysoXVHkasQ81NhC1PZtsx97p87b75KbBa9M=;
        b=thdrTQR4GGbua5a3tP7m0rXFS0UXxJcyZmj+oSluxerOOuKNNvAyjkevemYQZ4ceAO
         9Bj45iu46qoXPjdAzuKkdzeOcgZkgve8jwCLbhFTN/8N+IKcJxndjHVxWSbBdN1UX5EN
         jtaU99gPP15DgkidLbA9cJD+xZAUP4k0kuQ32vR8YQPyewI6PZdB0e7vryIjPOtrdSG8
         +oSPz07I4Kt10RVYC3A5X8rPYJap48x30CrTjAn2L4kLPqxilzuDwS6TZ7UXvLObEb5H
         h0DvPo0w4XNquRzSmhfG3oILo+X407iy9vRPSUOla426AY6gkX3c+6qS8Aam7FXdrIb3
         5XKA==
X-Forwarded-Encrypted: i=1; AJvYcCWvEtdMeOP0f7hN1Q7OJ/h03zh7X7KrbD0t9VRHyfTzcYMU/tgvch3IjddINmCHPOerWovjnXFHgKtHGGyHML3NUA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxUAIdxQxgioGMrxhS0KCHfyP2ScYsOshRqNIzjU/Nz7E7xURpZ
	exK/+LdNMiCobYll5sln6WPrxliZBh0TNe1QYrF8WzC/VYsYYV8l/dWXyLZPofx5Iahmn8PWQMF
	VNXxFOBI=
X-Gm-Gg: ASbGncuTXLy/4cnbTQ6is01+u70OhcBMki7hrWFW6UbvbqTMeT8ZWBybHK6DjaX5rBk
	ALgQFAfAwcwJP+im0SLljO5jhvF9RuQUmMUaNMTtFBJ6qigq8jTKbLJQs72iAc7DQsD8q/lccFz
	Mb9sEg4ZWDwc7xmGaTY4y18Pp6EVTdqpGFMd94w+WWmXctTTvsu8QQUT5uyDdsKfOuzzLgETvx0
	86wmGFyCtGYweUvcHLsBGUzjTwIfj+rkBDEC5UoAX/erH+8lDPaT+aUfiSynBsijV7Yec80UkiM
	qTYKXgNj0NvaQ4aCW7UuaqITU3gRqn38Gkhsebo5HZA5PKgM4X3z0WZwx7xg416qfktLNrj+Zwe
	u++1vON5NyIXB46jQBZgePoQnOlvbc3qe5B+PouzoUMS3vTFZ8jw=
X-Google-Smtp-Source: AGHT+IHGzF8qvybgR0giEpAFthcovLtW9QUyWrvtD1ffDe9TfqSZZvRofuYZk/CsdGJIlmCbCUdwWQ==
X-Received: by 2002:a05:6000:430c:b0:3a4:f787:9b58 with SMTP id ffacd0b85a97d-3a572e9c412mr513030f8f.58.1749833341905;
        Fri, 13 Jun 2025 09:49:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3ba4:44fa:9d9b:3977? ([2001:8b0:aba:5f3c:3ba4:44fa:9d9b:3977])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a800d9sm2829401f8f.45.2025.06.13.09.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 09:49:01 -0700 (PDT)
Message-ID: <b3c7b67408f7279eb75766f8d4f9430b273059ec.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/3] wic: pluginbase workaround on invalid module
 filenames
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anibal Limon <anibal@limonsoftware.com>, 
	openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com, bruce.ashfield@gmail.com, Trevor Woerner
	 <twoerner@gmail.com>
Date: Fri, 13 Jun 2025 17:49:00 +0100
In-Reply-To: <20250611153319.54778-1-anibal@limonsoftware.com>
References: <20250611153319.54778-1-anibal@limonsoftware.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 16:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218620

On Wed, 2025-06-11 at 15:33 +0000, Anibal Limon wrote:
> Apply a workaround on invalid identifiers replace '-' to '_' to load
> the module with valid identifier.
>=20
> Let the user know (warning) about plugin doesn't has a valid module
> identifier to encourage fix, it gives time before rename oe-core wic
> plugins and drop workaround.
>=20
> Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
> ---
> =C2=A0scripts/lib/wic/pluginbase.py | 25 +++++++++++++++++++++----
> =C2=A01 file changed, 21 insertions(+), 4 deletions(-)

I think there was a bit of a misunderstanding about what Ross/I were
suggesting. I've sent out an alternative patch showing what I was
thinking of, basically just renaming the plugin names passed in into
the correct format.

We could put warnings in the code about old naming too, I've not done
that but perhaps we should, maybe as a function alongside
get_plugins().

Cheers,

Richard

