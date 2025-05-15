Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBA7C3ABC9
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 14:03:44 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.13445.1747317814860562782
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 07:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WSH0yPr0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-440685d6afcso10725845e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 07:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747317813; x=1747922613; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Oh4AYpOwltxyXt/J7AA882i7J+xyeYcbOX/68K+UlYo=;
        b=WSH0yPr0JJuwYAC6E1eez7PDubY8+aZKJTIoXUN7FOeHKThgftz9W6wRre5zLB4ZPx
         x+rY1p87HMvxnuxteOfKbr65jNoS9mOZRFosOLQnLM7DJ3ajdvQUJ8lrVqJCCjlezO5B
         nqOIj3xP6+acXPcQpMnkZD0wJpFl2LtHexFLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747317813; x=1747922613;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oh4AYpOwltxyXt/J7AA882i7J+xyeYcbOX/68K+UlYo=;
        b=P/FRPDlIVJ5IH3wpM4StG8edRd4wiq5Ao2AbRfW34e4bLLCJKRKFzn5PkBxAHwSEv9
         kPiD1vMrjYoGvwwW6GhiEx9GSv1L8YiiQqbGgyTdAjQAoacTLd0cd4JO6gU5h9eyykHb
         FUPpItTQGHJg24xCjLUf8aI73TqEd447TTjoSPCfyD5TbUjCIwlHIA4mShGyY6mkKcnE
         1wYSdk7r/qjsTDbhVQqJUvYk/r7SmWiI43D62UfGPvNhvK6olCiFqQrlWYfvbGK8B8zi
         NCOKzlW7oA6V+0f7Ov/9ISYU6AOgPLrJSdJtJO9U+7CbscTPSRTMM4jiolftLc7qchSU
         PidQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0RZsEzIaIGACdogus6mQsoAryI/Q7MlmWn31A5izzAxtNG8dhEd4bGp/S1WrQHEgqT4heraFFIuizYwUd8fXF4g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyrwaqkJxGbiNWSvwOMDqrCYp4Tdas/oYwrnSEWxa0VxsNi2SkA
	/eadlDXhTmEnZoBmG8gQQkpMYCnoMXadQcbrihPujhNCoiElm9WW6YE5ZTj3gpM=
X-Gm-Gg: ASbGncsfx7nUp1ahKxSvpqXP2wl3//5hMBnOlVgKX/7GRxWblNymjiGFA0CgPDDWCQw
	uiaCAk+Fhp8+AS+vIj9KoOcC0f9lHFz6tMVLeFicAlTfFknkDYR4vTTg8FhH7qwfzHJqo3wRo2D
	hLugepMCxtBH/bQFxqpAudZnLq45trU5oAFwx0h686+hQSigPzbAn1SXKj5fjuXwVFUeHHEPnoh
	mxUt4W5iFMfajkoc0qBpOaWvggnDLa4Z1ePQ7QWdCG6tdLimpHuAFt1pTFwi4k64hs4DnlXjuET
	o1RqJGEuu2Pelo6RUB6VuslKPOXyOsgQk0sApLiXHoAgBzT7yLn0Xr7Df0WEnndwdZ7mU55NF78
	ZkJ36h0snrTDK/ezeVBonPQlVQXfw1MmI2159pA==
X-Google-Smtp-Source: AGHT+IEXVEF+Ca9N1MxxdYuMbifDRip3wjyGi6Yy+HjnwVoH99QjeJjzLgcxYfyqtJiW94GYU7VEHQ==
X-Received: by 2002:a05:600c:a014:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-442f970aa63mr22737495e9.21.1747317812103;
        Thu, 15 May 2025 07:03:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7c21:701d:240:45b5? ([2001:8b0:aba:5f3c:7c21:701d:240:45b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm56343845e9.3.2025.05.15.07.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:03:31 -0700 (PDT)
Message-ID: <d3de733ea61431156cf005cf3533d2bf4c733bb1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 1/3] spdx: add option to include only
 compiled sources
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: daniel.turull@ericsson.com, Quentin Schulz <quentin.schulz@cherry.de>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>, Peter Marko <peter.marko@siemens.com>
Date: Thu, 15 May 2025 15:03:29 +0100
In-Reply-To: <PR3PR07MB666678F2C4E5BA67075D490D8A90A@PR3PR07MB6666.eurprd07.prod.outlook.com>
References: <20250514125706.495571-1-daniel.turull@ericsson.com>
	 <20250514125706.495571-2-daniel.turull@ericsson.com>
	 <07ef3a4c-265a-40d2-939b-d3843662df38@cherry.de>
	 <PR3PR07MB666678F2C4E5BA67075D490D8A90A@PR3PR07MB6666.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 14:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216683

On Thu, 2025-05-15 at 13:12 +0000, Daniel Turull via lists.openembedded.org=
 wrote:
> Hi Quentin,
> Thanks for the feedback. That's a good point for the header files and
> the rust files. I'll need to find a better way to extract them, since
> scripts/clang-tools/gen_compile_commands.py only extracts the
> commands and includes only the c files. So unless we don't have
> better info on the files used, we should not exclude any header file.
> Do you know any better script to extract the compiled files from the
> kernel?
>=20
> The current code in the spdx class is supposed to only ignore the c
> files that are not compiled, (so been conservative on what to remove)
> but probably the script that I have in [PATCH v4 3/3]
> improve_kernel_cve_report: add script for postprocesing of kernel CVE
> data.
>=20
> Needs to be updated, that if the CVE is not in a c file is not
> ignored, unless we have the header files in the list of compiled
> files.
>=20
> I'll correct the minor things in a newer patch, and probably needs
> another iteration to have it more generic and flexible.

Don't we already have tooling which look at the debug data and extract
the list of source files from that as part of do_package? This is how
we know what to put into the source debug packages?

Cheers,

Richard

