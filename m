Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647A1C531C7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 08:50:39 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19186.1784796631638584310
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 01:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bo3gVz/F;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so2825475e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 01:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784796630; x=1785401430; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93jtCHnq/YihWcjm4Qk/3+Opbf3OM5BARJEtvnkFK/8=;
        b=bo3gVz/F7cnmahXX5Cb6s17RmfaeL6jT6ikIx7mNj4dYvDEGTJUEvYh2G75/61USAG
         jFkcORBWc0Os5zRTOkk7K1zO6VbuTLT2y54n+4/UhSKRg5HrX7wqMSN2l6HApZHAZApZ
         JsoH4SemoiHLfRpGbOkwmkrRWAV6WIfo4umYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784796630; x=1785401430;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=93jtCHnq/YihWcjm4Qk/3+Opbf3OM5BARJEtvnkFK/8=;
        b=plMhE7kb7Vjr/ydxmW94lI92MoPmr6OOm3GELm+dS7zSVgr29jJSkOqp1yDPfUNYUN
         EqG2UbARn2aIdNm0RXYAuYsqYYxRfG0mQiw7YNe5B3bzotvijha2V2SLmRvO+sX0GGgZ
         uZIjUj9NUNVECMD6JrLH3Nu/OAmHwBKKf+NvdqCadaV0Bv5W0SaR8u1bj605KZ/hF02R
         P6XOGNF76euS5qEUcqIhv0q119so1JbFn6KsULtvt3rEKIR+TJVr5jhsI/GA44cyQKln
         Zf1c888j3dTYkdMqSHcCbxayFt+EY8zX0cdsX8vErRHMgJvWFG1rwqKAPDF4+XZ8GDnu
         NxhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1XSawAq7bRBJUHvwE+eDIOkgZeXG/BULcuGjrVi7EYWg0R9Pwy6UoYPzuiRIdNpHFqImR3gjVmvsX9jUbZDCpPA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzxlfq7N7SrRqBKTEU7UJPuridPWCNhgFOlSLGXKSvnFLd/mMY+
	COSZ4+eeU8uKXw4jFtxIcGYP8zMU7ZmRhqBq38BdE4jF3JDf3rnEMKvTZjN4l3wHedl1CHiaSiD
	tS2lm/OE=
X-Gm-Gg: AR+sD13KnWU4YnArDTCQPRcRQ7wwiaUrc2hHrw/D3hGdHEDIuIaX7KGWMyt3spJ3zFQ
	VV9JczOepZ7bDQLhjJzQYnwXfKR3WKPkFY0FyZLBJ7V5Mwqvt7PC4dwcoLwR1bs/hw+6cN7OZD+
	VRkK5P9uvp4pzEdYLlhbNXhRFc6Y430q1tDhIX3E9TEaQJ/QFPOWwF71io2r+90dKap0glIG524
	adqmiaKbgOaa3uxCC3mUdHmIhdqMl1EUDdMThybz1mAsHmkGlMubOKrBrUeNUAuM4q7yL6bwb72
	Rv5InpbIbhdEyl6UkhU62gFQVqsODto/xpCiEiAnCCCq4JSJ6b5EU2dXOORUO+p1zstbiJUY8m7
	cS6ZcTJnfkV2HdjTr1uGVctuf1oo+O/nA42y6trH/MukFCV7bgtclTNq3qm6Gxz/sOgqRg03T7L
	AA/CYwKEabkrT+9OPZKzu7gB6LrzWk4dlQ3zxeAmu11xlRPMEUp2TSRrkregynP94bOg==
X-Received: by 2002:a05:600c:630d:b0:495:4b00:1bab with SMTP id 5b1f17b1804b1-49573cfa2a9mr18156355e9.21.1784796629800;
        Thu, 23 Jul 2026 01:50:29 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a4f25b6sm123675795e9.2.2026.07.23.01.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 01:50:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 10:50:29 +0200
Message-Id: <DK5TLOAWFTUS.2E74MPTWN4DYX@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCHv2] dropbear: Disable DSS correctly
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <mac@mcrowe.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260710085450.2656702-1-mac@mcrowe.com>
In-Reply-To: <20260710085450.2656702-1-mac@mcrowe.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 08:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241800

On Fri Jul 10, 2026 at 10:54 AM CEST, Mike Crowe via lists.openembedded.org=
 wrote:
> From: Mike Crowe <mac@mcrowe.com>
>
> Take upstream patch that stops sysoptions.h unconditionally turning
> DROPBEAR_DSS back on even when it has been disabled (which is the
> default).
>
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>
>  ...PBEAR_DSS-is-only-forced-for-fuzzing.patch | 30 +++++++++++++++++++
>  .../recipes-core/dropbear/dropbear_2022.83.bb |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta/recipes-core/dropbear/dropbear/0001-Fix-so-DROPB=
EAR_DSS-is-only-forced-for-fuzzing.patch
>
> Since v1 at https://lists.openembedded.org/g/openembedded-core/topic/1200=
33783 :
>   Add Signed-off-by to patch file

Hello,

Following up on Paul's review:
https://lore.kernel.org/all/333e485ec6c7e75b8bdbbd18d85398afb8079828.camel@=
pbarker.dev/T/#m22cf49ca44c68152fdd48c027afafced0da03ffd

Ultimately, we can not accept this patch, sorry.
We can't change the default behavior and risk breaking existing
configuration that uses DSS.

Regards,
--=20
Yoann Congal
Smile ECS


