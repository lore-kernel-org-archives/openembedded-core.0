Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A36C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 14:21:45 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.14002.1747318902282016769
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 07:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NtKUu6wK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so10066315e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 07:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747318901; x=1747923701; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i2BeTeG4AhIH81FGVcz5hAeZv5C2ltIGYl3wc/7fVqY=;
        b=NtKUu6wKSnxbVDbqr2eTVccvO303Vzqu9Nz96J37ht8T91b+1WGoX1ZFzDt74wDz/l
         FjVAoDYzmi5bj2KXdUk3cl21+PeJS5cuPEuKbYav5+mSW53F+kuv/N1Wy8W+mdx678+F
         WUJLpkhh1owrsTQKTjNxqkGRN9yXeMDQGuc2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747318901; x=1747923701;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i2BeTeG4AhIH81FGVcz5hAeZv5C2ltIGYl3wc/7fVqY=;
        b=tOPy2yVQ/g4zkuYFOrqPJZNcM9ULGLqh4kQUyRE37lpsebeKr6yTTGJO/k5McHLYu+
         QuatiozT90Mx9OK77SE1nPz2oHgqHFRkQ8VQwCd9TOb7eBIBXbWCRxCXOYfibnuwZhY8
         ByVK3WtE7nyu20aNr3z0GmgNh2PsV2Y+P6p5lA5Z4Ccirv34zehE25d7BSkakMejpynb
         TtgDaAX9kdpiICttm586jlZ17LSpD/LA60jio7/bWylsyOP9LQ8mzVQ3q38nDyQu1hg6
         YJNb+fiLFEUA8XzaXVuNR4++E5weQ7hLKhasAQ89G2KxRrPrWNY6s9NqnHCs3gv6ChJP
         plbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQopf+EeEoqmYWQMCoIVFt/9CSudYipLeLpWhuzpiTcX3byr2uc1P33AVvNVSIAgNEK6U6uojjHB7oM6QgIumPRA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyZq60BFSeYaABifXl7kRQZitwyw+hSSIdgC6naEQMzgFC2j9s5
	f5TmOr/BU/izrA8Hl0IxMY6Cf8LRbB/W80EIEKB8wScQGN/S5OVE1ZreoXOZVAM=
X-Gm-Gg: ASbGncuu/+GtYsBZtUT1uLggRQrTEFcfRrfUOM+9BdGuXfH9+z2j4BGSFDaYHTWiuqK
	AoHip3wgL/w84VNULP/Hp0wbBmeYpAFF4WKjBAroG+1jDHh6bnmP4c0CKnEpkke3Ue8vp5apJVz
	69IvNqJszfFp7vCaQTXdMKWW4YOrSZPFXUmUbfQ/WHnl7XldRY8dCdvMKqmnMftIXoC6gk6/xKg
	47lCC5pcpTMjTICZJltCOIM9UcMPvKCu/YoClyOIDx1lPzNoSPM8FzELwrDEkaP9PTMFFIDGiQ6
	NEbcJbI+bpVxxztYdroqcC4YaMwXtOtr+BOLqTu32W61Ah5+8tErFlreuuJlnq2kXaS/8+igL1Q
	139fS4NMtkDRZrOcNzfYhqfNWos2URRCwoCtsNA==
X-Google-Smtp-Source: AGHT+IFQTobXHl21B+SEMX8B6TyBcWxToA810udAutxWYrPdlaB6BbfA9Vv7iTkP24az0biCoBJVHw==
X-Received: by 2002:a05:600c:3f16:b0:43c:e305:6d50 with SMTP id 5b1f17b1804b1-442f2168adamr74528935e9.24.1747318900627;
        Thu, 15 May 2025 07:21:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7c21:701d:240:45b5? ([2001:8b0:aba:5f3c:7c21:701d:240:45b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c7b2sm23148264f8f.93.2025.05.15.07.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:21:39 -0700 (PDT)
Message-ID: <1d1da24017b74ea7861d208dbbe3daa03391b898.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 1/3] spdx: add option to include only
 compiled sources
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel Turull <daniel.turull@ericsson.com>, Quentin Schulz
	 <quentin.schulz@cherry.de>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>, Peter Marko <peter.marko@siemens.com>
Date: Thu, 15 May 2025 15:21:39 +0100
In-Reply-To: <PR3PR07MB6666EF14AE5F8BE55787B29B8A90A@PR3PR07MB6666.eurprd07.prod.outlook.com>
References: <20250514125706.495571-1-daniel.turull@ericsson.com>
		 <20250514125706.495571-2-daniel.turull@ericsson.com>
		 <07ef3a4c-265a-40d2-939b-d3843662df38@cherry.de>
		 <PR3PR07MB666678F2C4E5BA67075D490D8A90A@PR3PR07MB6666.eurprd07.prod.outlook.com>
	 <d3de733ea61431156cf005cf3533d2bf4c733bb1.camel@linuxfoundation.org>
	 <PR3PR07MB6666EF14AE5F8BE55787B29B8A90A@PR3PR07MB6666.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 14:21:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216686

On Thu, 2025-05-15 at 14:09 +0000, Daniel Turull wrote:
> Thanks for the pointer Richard. I'll look into it, I clearly missed
> it.
>=20
> I want to have the patches as less intrusive as possible and if the
> data is there, the less code we need to extract the used source code.

Have a look at:

./meta/recipes-devtools/dwarfsrcfiles/files/dwarfsrcfiles.c

and how do_package ends up using that.

Cheers,

Richard

