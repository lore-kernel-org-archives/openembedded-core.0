Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752FECD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 14:29:29 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21830.1781101765944471835
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 07:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Sfj+iNT+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bebc80100efso738247166b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 07:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781101764; x=1781706564; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O6f8r5B7eE5VGzTUeO/nPjaKO1ZGU8Sr3Fy0WeuQLzc=;
        b=Sfj+iNT+LVmYer91TxTXuIeGzecEwBK21UVztJbwg2OVEFM8gTMDmyUfY34wxASIuS
         EXAgGz2dwsmiiVEuKMKxWB5VFulX/IBZbmgnjnhxgfZIouGWn1gMGBqNkQNVZDmu/CUM
         iz3qJL0ESgVC32CHvQ1MLBwtAL4yVS0zxIl9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781101764; x=1781706564;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O6f8r5B7eE5VGzTUeO/nPjaKO1ZGU8Sr3Fy0WeuQLzc=;
        b=aNYy4I55h8cI4aSehT40f2mrGfA4rfCz9Sc/yPJow3Sxmj3BfGriKceBLapb4tlSn4
         yyH+FEQHF1Ll5uVgU7Nsqo9CIui5X28B+IBxKGWy1oTyZ7ziRdIg8R92vCd9TlT5Jh0A
         m5r/a+pcGXcTuew6fBWthTJErAyY87Mc+RzVlhdDiCqPq3BT7tgkHmNLekmOHlzXM7+y
         ugS4Zg9S4pBsMsBssJga2a0nQtMDEbt/MWsTZyz/VRHblTxrBT+RDvuHIxzKdSY2Ohyr
         a7yUdsnookbnRoWGB7UJpYjP8amZl3nleAtGjaFdv2pdMfFbvJp+8Z4zg7h6eR0b+nM2
         34Zg==
X-Forwarded-Encrypted: i=1; AFNElJ98KvdvNSIi6q2c8vWdFJokhkEDf6Uf9otBPmyrHAc0+wGPKDBxVJ4F3fnR7ZghNFLjplQa3mCXAhhXioAO+0eotg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwY8V8kYxcH2/I6oZfSbQvltl4e9At5f9qxfC2GJYMAKdPPocVy
	VwLT9KQFNLXGRGi6k/rLRjuaOS6LeHQs+SgDTWdM57IAcht/KFbxmEAF4FZCJ0K9In4=
X-Gm-Gg: Acq92OFowjVf+H709uWWTbAYawXKopnMDSTWRI+pltQM3DPVDLQn6WpbUbS/rrWR1j8
	Z1KfLbPvdQVq8UV+gixNMv9SBn4wqPpmuhvG3sODG9Q7Qb4IQoMIbHd2yJp/XR2lz8tRZgjbei7
	osxHvovmXAgiPjT29NU+393lFYXtb5EBU9+yYxovQTlE24qads0+WDnmmEnNA+CBCL8UUJwnpuS
	zA9u1XAjKMDtklhs+/8cNGm4hq3HP0oaJ7yw7piEP7r9oTVsanUZNk37S0VprlgQuYKD6wLnZnl
	CmvLoQRHPMnCkkR2GUWKgG9Ykz9xIi4mozOIIjChfbgkdOSeEJbwZJSwwVvXZEwUepYvQ24wu1U
	SA2GvMzaDd4oIHmfAubcxf2fcEc/hRzgGpQsHgLPyi/GNkqyYmxYsE05CSCyWSajybwJX50UTr5
	VL9xsQ4Cr9YUOgeh3rnw3pjSWXk2ZUw/MW7uza9lpY1NpYWwMC5J/TgeDq+nvaNSNEzQj0uX5L1
	UUPTuhXoJN6M+C6yQyXRlHE
X-Received: by 2002:a17:907:9405:b0:bee:4c9f:187d with SMTP id a640c23a62f3a-bf372d29ad2mr1198890966b.39.1781101764303;
        Wed, 10 Jun 2026 07:29:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e996:5a7:2609:813f? ([2001:8b0:aba:5f3c:e996:5a7:2609:813f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e0280asm1198441466b.33.2026.06.10.07.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 07:29:23 -0700 (PDT)
Message-ID: <870e79aa60c3bb8f5872189afc89e74f6e8c283b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] npm: Convert to list-based commands for
 NpmEnvironment.run()
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: eric.meyers15310@gmail.com, openembedded-core@lists.openembedded.org
Cc: Eric Meyers <eric.meyers@arthrex.com>
Date: Wed, 10 Jun 2026 15:29:22 +0100
In-Reply-To: <20260610133444.29699-1-eric.meyers@arthrex.com>
References: <20260610133444.29699-1-eric.meyers@arthrex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 14:29:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238366

On Wed, 2026-06-10 at 08:34 -0500, Eric Meyers via lists.openembedded.org w=
rote:
> This only affects those who have bypassed npm being disabled in
> bitbake (post commit 355cd226)

I am curious if you plan to help fix/maintain the npm fetcher?

If nobody actually steps up and fixes it, I will remove it. I'm getting
a bit tired of maintaining things I have no interest in with no help
from the people who actually use it.

Cheers,

Richard

