Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A70ECD986
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 16:23:32 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24887.1770308606319790676
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 08:23:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VAufZ6IM;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4362507f396so663037f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 08:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770308605; x=1770913405; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKOq6RD6mPDMh8/do5WpxXkEseGnKaD5fvgihaLbwgE=;
        b=VAufZ6IMI2r1pPPAj2B6Ax0cdrU8ZFrWLOXao5iLAJtq3LDMaqGJhxvlH8cWMnY20W
         OKaAFrKDfCxteqB1/+FFNMHmKO82L5J2dsLtT1bAsrPjz+WcvDllpKG2Ici4XGpWySmk
         +0K4pELg4Uc/TXBN/JvGrY9jPvlK+sKVkM68g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770308605; x=1770913405;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KKOq6RD6mPDMh8/do5WpxXkEseGnKaD5fvgihaLbwgE=;
        b=NrvLai7m0geDt/HIPxNBGiH1Jw1s+DyzZxUPlyN3LnpkgZHwGf8JBKdvMkQUlJsr5m
         8312vOMyfJw5CMWsfAsghRP5+lvKPmU6u+bURUPXXKEq6uAGnfCQHs3FXjJlwPYVUO3o
         FwBTK1ZLJjB1Kb1oTbCbv8xrksrSWDE+tefvrPbxkVJzOlnZ1TwKBBQHspfSMAOKzH2A
         CAEjNHtwJZgwCSsKu0WKf/t6Fy4qWUo47SUmq3xYughIN+rL8nMazq/0DOGG7DmSTV4L
         BNQnd6YLU7evtvkmPjl9sJQFCJHeBrhuk3sGNS+rh9oZ/OARa2vW/JS3mA7+y5sYixpg
         kKxg==
X-Forwarded-Encrypted: i=1; AJvYcCVpTPgDCzQDOlxRrGrTKPsuzkqL1/MTDxGl1DV4Fh9+L+x8VU2hln/YkO9AECzAweyxsUxjBg8AtUMyWt+YHlZZVA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyZpQKOzcxpKPd9eKG5zUmFdp4QXVrD6tFryPmnS+yYuc2ycZdY
	Hoys/wvn6x1NmpLisFyXvln6iCZXULin1ANo9hxwJ+aRuTVi2YM/DBB1Ij6S0C3mpP0=
X-Gm-Gg: AZuq6aI0pj2QL59+GB6tHU6SbCv4X3jtCxjm07CGX9ohf9gBQIOxIaewsTecaMZF5xA
	ffMVR0wCh54HBqZbDI6KFqg2VkW5bjyNmFTIIgWrirobKBV6qN6kRZpP5ukUpBmZ6eXVPqhG/be
	JbAN4CM8ZW6RR+b5R4hMTUbQ1ZbmJ5cYx+0uNfRoXe31RUTCfyBUt4oyw/mX/YPLO8wHoA9+r8p
	uRBlQ2ZYqUAyN9Q/xuzjkq1hwjQeWjIIuG1cDEIuVChAeaaEfpbrpETR+dwrNcLxs7ZzCIJkW2J
	Gq9tmODTFXOjGGU9dA8QeLMAxkj6ixrAi59jhfFGclEoqXtl3WZgvRGN0uGl6K4opovfJ/TnkYs
	59skeXg6P5Pck2pv/jEKF3+wzn1qPS2HduaebY3ndO1pbr5jPwLQjzIMTVClqHET6FX530A3Wfp
	xUtlgcXTZSjbETwKv7R7fEFvqFs3P8C1PeMw6UPCUdQqgkKkzTnif43dqXPIQFOSyuGzne83C3S
	bShHuF/shMnMA==
X-Received: by 2002:a05:6000:2210:b0:435:907f:e429 with SMTP id ffacd0b85a97d-43617e30439mr10648156f8f.3.1770308604594;
        Thu, 05 Feb 2026 08:23:24 -0800 (PST)
Received: from localhost (2a01cb001331aa008fabb4f40b3eded6.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8fab:b4f4:b3e:ded6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e3a546sm17622694f8f.17.2026.02.05.08.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 08:23:24 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 17:23:24 +0100
Message-Id: <DG760XEKBDL5.3KDK67MAK7VWH@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] mobile-broadband-provider-info:
 upgrade 20240407 -> 20251101
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <ankur.tyagi85@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260113045923.402096-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20260113045923.402096-1-ankur.tyagi85@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 16:23:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230585

On Tue Jan 13, 2026 at 5:59 AM CET, Ankur Tyagi via lists.openembedded.org =
wrote:
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Changelog:
> https://gitlab.gnome.org/GNOME/mobile-broadband-provider-info/-/blob/2025=
1101/NEWS?ref_type=3Dtags
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../mobile-broadband-provider-info_git.bb                     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Hello,

Thank you for this patch.
Whinlatter also needs this upgrade, you already sent it (but it was
lost):
[OE-core][whinlatter][PATCH 61/67] mobile-broadband-provider-info: upgrade =
20250613 -> 20251101
https://lore.kernel.org/openembedded-core/20251213095931.2571498-61-ankur.t=
yagi85@gmail.com/

I'll queue the whinlatter patch for review/test. The scarthgap patch
will have to wait.

Regards,
--=20
Yoann Congal
Smile ECS


