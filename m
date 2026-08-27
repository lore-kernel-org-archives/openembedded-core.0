Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD91C61DC2
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 13:50:45 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36878.1787838638405774155
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 06:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Hph5n90J;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so4262985e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 06:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787838637; x=1788443437; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37N3JO9tqbp/FoSGoKr1hBKopWMVZ+oVdera2kcvvvY=;
        b=Hph5n90Jkd/b/YBJ7KHTR3HWj30VvB5ikK0x71S8/OQdIDY/2N/4vygPXgbH2MwlQN
         N0OTgubGfveKqW/8ANKatXgMEn8byAP5G8iPv1KhqwI2zcmQhjIUIyGyAy9EBmHsW+AQ
         DljFIhJRg3dp6bMCI6svOrfOrkGhII3FHJs0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787838637; x=1788443437;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=37N3JO9tqbp/FoSGoKr1hBKopWMVZ+oVdera2kcvvvY=;
        b=Tjl+PFFyLevWS8KNkXNxr92SlmbgI76ayjl0x4FgLaAk581CeLlTf/PcvgzXr6bqLO
         TiB0fZdK7d6Ec8gWfnF4tLpDSOGYVn/OHMzjhIMxIY+YRCbwC6stkRMya/FqZaC4BlKr
         cRu+SX51NYyZL3M6h4T7o+viY8L1Yf3YbaARvALXuK7mFV5I1v3JzmTBC0yAq0f72esf
         95PwHmnSvny5YNSriIWLWuidsHLyO8+U32dZnHmlq9rhgjUViaSmNCU3KoriFgoND1dw
         16vlFevn++84Y4pX9lhCW2bLCNJedlq3jOl495kyrBx/K+iDUU08rD2XHSry4057U9Gv
         EJTw==
X-Forwarded-Encrypted: i=1; AHgh+RrjB8m1GlRmyhMN0Avch4oRVqidpIj6SLzVES4rAqftuBWZb1SSoEkK1iYY44kStgTxXerWhpICL3i9b9n63RdrPA==@lists.openembedded.org
X-Gm-Message-State: AFuF++mpy06dS/QlKHT6WhT3So6CqN0OG+RShGqIPpQYPwdvsW9TO16r
	nAZGY/n6KjVXfAqRAO4YKKzED73smAp2depGLm46PB5J8XpL3DOBeeG8x5c6nbXy3is=
X-Gm-Gg: AR+sD11QdW3ilOEWuvMijqP5N9vm9aVdDrznzveDCV1hruArvHr4Yq+OTduqxlJwvlN
	4E4dd7pJXmkekYeIisq8HdxYzQoEn4CYc6g5OuI7y3GuZmDHWMk/i1VNbOosqgtAEyAa2MVLRT+
	omNS0Iq3i49Z1SU51SHCjiRHfu3xzJVQx4s9BpIxIC0T8sSPwScJ2+Q/8pqUS3I46neoqILlmMK
	WHAqXkt4xiAdxHxP1ZLwT/pnZpLIVffmwufSgAPD/NBVtNLEHXpuOyqRDq5J+As7H76+xLVgCdE
	UUZMB8e12tCkGy4VyoXl9w1vA1w82TYiS/hlWUM5xmIStl1owgFzi7ANaH8TZgl73jA6BZmuHW7
	EV4vtospU/q4QtUoB8RuWDadZtojDZjL9db3bKTtbAd2BiBFSltDfm9DY49NyDZFYw9RPey7sGU
	DaruWDXVZecUQqfmBh48oWgmvblszgM5ifdVXzLaX7erOQnWBYOgPtpIeznqzsg7Y19AuMqWZTz
	y7ngrjmPsCSZoBQVQrgWCsqn14Dt6e60BJQkJh7RSYfCpZlmqIT
X-Received: by 2002:a05:600c:8518:b0:493:e451:a9e1 with SMTP id 5b1f17b1804b1-499dc6e40acmr191575905e9.2.1787838636593;
        Thu, 27 Aug 2026 06:50:36 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49cc61cfsm56453785e9.6.2026.08.27.06.50.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 06:50:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 15:50:35 +0200
Message-Id: <DKZRWIN340Q2.2ZUHT9JGBHM16@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH] python3: fix CVE-2026-15308
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260723134023.2501442-1-deeratho@cisco.com>
In-Reply-To: <20260723134023.2501442-1-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 13:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244491

On Thu Jul 23, 2026 at 3:40 PM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> This patch applies the upstream v3.14 backport for CVE-2026-15308.
> The upstream fix commit is referenced in [1], and the public CVE
> advisory is referenced in [2]. The individual backported commit link is
> recorded in the embedded patch header.
>
> [1] https://github.com/python/cpython/commit/07efb08123ba9367a7107325adb9=
d5626dca1ca9
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-15308
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
>  .../python/python3/CVE-2026-15308.patch       | 116 ++++++++++++++++++
>  .../recipes-devtools/python/python3_3.14.6.bb |   1 +
>  2 files changed, 117 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-15308.p=
atch

Hello,

In this case, I think we can consider upgrading to 3.14.7 (like master).
Can you look into this?

I'll hold this patch for now.

Regards,
--=20
Yoann Congal
Smile ECS


