Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB56FC5CFEB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 13:06:52 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18726.1786626411140751142
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 06:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ibo47YgT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-471eeac43bfso606029f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 06:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786626409; x=1787231209; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9CpYPU03oV6yS4b+DQML3M3VR0nOnJvHjA4X2Pw0T0Q=;
        b=ibo47YgTizabUjEz/rgDqHZgqn9vSEjOo4xJNupDn5xsMZRhbSBKoT6ThsucF6Z9Hw
         rNYI/h0m0n/kzBXZwEtMYsnKFTcwCTLZ9QIejVsQurBW5hYNCOn2V18gE+a5EJtontU1
         lSV96eTi5FWBpSvQ84j1tO/bSKyNFV5O+NAzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786626409; x=1787231209;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9CpYPU03oV6yS4b+DQML3M3VR0nOnJvHjA4X2Pw0T0Q=;
        b=ChorKIP78FtcP0D2mDNqpNlAyUQcWWzDSoLPCrp1MU3hz2ujxdF8/RCr4yr7uNjLhj
         PA7Q027bFq2+f4ldP3kSYTLCWONvCL11XWXY7CjeeLRJMGmWQV+NxIWhEnUjFLo+5uI4
         Gux1oGqdSSab5+7q4fmwGj8gp3NsnBHIYbyxJIszeQiVRf/LWkHY4v7Qhl70ZkU5MbSG
         4OFwF62v9LnBXDuXWgjJGNZzo91aS4JeQqT1t1X5lGtzBSjhpo26hn22fpBOEIWG4F8h
         byvdo74YbHGKBpc1mb29TD53wcAvhtYjNLAv+5auyvMfxL4EIe46NT4TMJzpQmywhIhC
         HxJQ==
X-Gm-Message-State: AOJu0YyWcnPrJz8sJwzd2qaqIXOwV1Rj0SZM9SpEmNepSJiQL+c7cJYB
	NFZwC0qBAGozc2aAqQDndwHr1UPcSC3A2Nxge/uU7YFXLMcwLS3BkZScz7Bbjqy4ogI=
X-Gm-Gg: AR+sD10ubyONBXQV/O+qu9U2fjRiNnudjrsjk4uHXruShcA2Hr7M1d9yG066lcjKQbt
	9XvxrzhNd4W30rQNZzzvhLgElviS0O7Am5mHtuhdpwAqASA0IvirR0Xikmgwl3wpEIf+o3rJenp
	FJEDNXI0ID2Z0+zfH33c0UJXSn5A/2homkWZeOWZKolJXl1xEPMwinqkFJBfgHCy/hrqUOXqsEc
	8HohdMYv1+yVAt5cHwh62c3npLmTh1B1gyzuPUnhIoWGWeKJ6OQ2tP3BmTllngY7L3PHi9X8pzB
	PoAitOpb3H6CIsQwrGNVdblzgBIUe8HK561ef/fispWm+faSbKwzTqVQVd7nolyxZY3ZjiwGGCe
	4hEOmWbCvw050YWvo++lRomCtn8aWMBOLnCXq1ibtmWnL2dj5ZBd0NUxiyFn0w9JgWboRlgiDkQ
	kzbX3oVu7lZz5blRD7FMHyqSIb+cykZsb/V3zPJyze3RPdLccInA4phDRyTbIsBIRU68NB19Kpk
	OJt8kPxeAHeUDAbbYL2UnJWOnQczIC+OVo9g3se7sceUYoKvEQe/BXW4IjZEIh2
X-Received: by 2002:a05:6000:1a85:b0:481:57d6:c0f6 with SMTP id ffacd0b85a97d-48159fe4ec8mr8354693f8f.12.1786626409130;
        Thu, 13 Aug 2026 06:06:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e77b:339c:e0c2:6c8d? ([2001:8b0:aba:5f3c:e77b:339c:e0c2:6c8d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5b6b9bsm6015421f8f.29.2026.08.13.06.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:06:48 -0700 (PDT)
Message-ID: <9c1979b0f49ebd74a5fab309924a03b9d1875247.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] libpng: capture per-test ptest results
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, tgamblin@baylibre.com
Cc: openembedded-core@lists.openembedded.org, pratik.farkase@est.tech
Date: Thu, 13 Aug 2026 14:06:47 +0100
In-Reply-To: <CANNYZj-q_U58TP=EO9m9g_k9O57HswnZumEHMhnwTypU6zgNCw@mail.gmail.com>
References: <20260812185722.3994412-1-tgamblin@baylibre.com>
	 <CANNYZj-q_U58TP=EO9m9g_k9O57HswnZumEHMhnwTypU6zgNCw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 13:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243352

On Thu, 2026-08-13 at 12:56 +0200, Alexander Kanavin wrote:
> Ugh. This is invasive and difficult to support. Pretty much every
> other automake-based ptest does the same, so if you want to fix it,
> it's better to fix it upstream for all.
>=20
> Also, we can instead retrieve those individual log files in case of
> failure together with other ptest artefacts.

We're having particular problems in this case and we need the data. I'm
not thrilled with the patch but I think we carry it for now to see if
we can sort the issues out. We can remove it later if it becomes
problematic. If upstream change to have better test logging, that is
also a good outcome.

Cheers,

Richard

