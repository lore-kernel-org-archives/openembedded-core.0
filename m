Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40330C87FDA
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 09:41:04 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.14241.1754300454133267586
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 02:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XGU6AElh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-459d44d286eso3361005e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 02:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1754300452; x=1754905252; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rb9sChkhonNl+vfWgAmcLKRtPrjo8udrzV+8ofVaDk=;
        b=XGU6AElh5xRcAWZwYzKG+4Mihj9K9ckbs4dANcM/uy8lfj5wTpy9XyUoyaob7HkZIH
         8Mb92T35e9htd0Tl6i08Yqh5ldFlia2DXoeqMg9aEhHGvFs9Q/5LHVqr6ybMthoDoUwa
         xpA+uNVUD+qMjBBQ+VyBFiV6NlDykTa0mQ4Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754300452; x=1754905252;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/rb9sChkhonNl+vfWgAmcLKRtPrjo8udrzV+8ofVaDk=;
        b=B0o3VDslmgkxVAEcmian3njFpAZpq9Sz4CH+BXGzV80APcs9v1d3WM5VGogc2uZzTl
         jvq45U8ydwi/+oPxlPtGK64H4U7w7Mhy9/rsI8xqsc7M+kn+ShV/MG9R0//iK8UVqS6N
         exTdmnGG8ayZVNESxQIQ0xIOqqFjGoEaBJxiquTDygCtBdYzpuPSt1kFiN1soIvslwp6
         doXxftEZu/qcS0KiGIRCRtJ/9c+kE+VacRXblnXCFYTJVBnRrKiS1+z4qCxj+8E7fWco
         HDi/4UeGd89QDh6Y7qAYvWlRS3SlAq7w4akru/YLMMLycaUF+a7b9koM2l5sZgfjE47P
         RVjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjncmycDExEkURL1GnnNmJABT6X44CpPno//uInbQ/HoFCoRL8v3nPODbo79Dh8QzKA4iawvt0tmxJbtiFvGazUg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx7MwFaYbJZaTcyQ+LzmD2tfaaNPj5AsuAX2hRe3HeqRiIOknzB
	NZ+c36GTiwEiNVo6d6cgYnKWuUPS71dcklB+WLt4dgOb5KTgQW7oevrootr3B0xOVc0=
X-Gm-Gg: ASbGncstwWustxLaAW10Sm8AFFlRwIGDu2jQRB2TUWcCOI9bzTbQIKkDX36FNy8XtTI
	4BdoIPt8EZ1C/bMJqmA61w07mUDcuj7yOy2unkjie0eGDO7Bx1knjXCvU+UYsryM/k2dnf/JvSA
	q9pCzGnxYY2jmluXsBP4Iqw56PmamlCHeYDA80+vMpG5D3xBoDgOQFk0/+cBEfkb8Uhuf9i1e0l
	MhAEfKztkEqkLidSBYXFt4dibKZQjUCWTZ+yIbHoyz0PgyrBNHP9H9dP1cOW8nT5HJKf9GHZ53f
	rqs6Ng3E/oMCssgwEnTfobd/9J4iJc6QgnDYeoziRq/NYBop2FLN5N/+YQz65yaYdL9p7D4fwA9
	+w5LLsW/t6ZuwlehbCTWD1EPoatoccYzireE2Cmb+Ob5U+ZqzaQ1nVRDZ7HuqqNGmOp582Tzm6c
	VhNReXgK83c49+wQ1Yr7fkZw==
X-Google-Smtp-Source: AGHT+IFcmOR15ZGz5Gsa7fBVF3oosjvhqqw9NKCyhZ4pJbRReruqQdy/4GqL7Tnfd32j7TD1Ql2rAQ==
X-Received: by 2002:a05:600c:8719:b0:458:bade:72c5 with SMTP id 5b1f17b1804b1-458bade7611mr69837935e9.8.1754300452154;
        Mon, 04 Aug 2025 02:40:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2c76:58bb:66fc:3164? ([2001:8b0:aba:5f3c:2c76:58bb:66fc:3164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c469093sm15033998f8f.51.2025.08.04.02.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:40:51 -0700 (PDT)
Message-ID: <aa7075c14e54ae213ab6bcee78a27cc74d342e3d.camel@linuxfoundation.org>
Subject: Re: [oe-core][ltp] LTP 20250130 fails to run due to missing kirk
 =?UTF-8?Q?=E2=80=93?= should kirk be packaged separately?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: nikhil.r@kpit.com, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 04 Aug 2025 10:40:50 +0100
In-Reply-To: <MAZPR01MB8950AA2D5C8F86D05817FDB9EE27A@MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM>
References: 
	<MAZPR01MB8950AA2D5C8F86D05817FDB9EE27A@MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 09:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221422

On Thu, 2025-07-31 at 14:08 +0000, Nikhil via lists.openembedded.org wrote:
> -------------------------------------------
> INFO: runltp script is deprecated, try kirk
> https://github.com/linux-test-project/kirk
> -------------------------------------------
>=20
> It appears that the 'kirk' binary is expected for running the test
> scenarios, but it is not present in the installed in current LTP
> package
>=20
>=20
> Do we need to add a separate recipe for 'kirk' support for ltp in
> Yocto? =C2=A0
> Or is there a plan to integrate kirk directly into the existing LTP
> recipe?
>=20

kirk isn't compatible with the way OE/YP runs the tests. It is a
replacement for runltp and when runltp is dropped, OE/YP will probably
drop ltp entirely as it no longer makes sense for us.

I've posted about this in the past, nobody seems to care and upstream
have their own plans which don't really work for us.

Cheers,

Richard


