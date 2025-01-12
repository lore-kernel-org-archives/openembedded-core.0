Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFDFE77188
	for <webhook@archiver.kernel.org>; Sun, 12 Jan 2025 13:16:33 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.35696.1736687785901941420
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jan 2025 05:16:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hgbe7eXb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436281c8a38so24446385e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 05:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736687784; x=1737292584; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7uUIFL8NQMzguRU6FKSiGyQ0GhQRv6EL0lIIC+jn6E=;
        b=Hgbe7eXbVYQTzNJTynFv+oASRxAw/F5K+0PusxHr8x8dCtLeSA5jppbcnFLoe2+ina
         OV9MHZAFunYf4KUk0R9unoiw2n14hbhdOyxFIaXbtpYDNODSAy9XiubFHr50ZiIbqxvs
         6nruSTjHrp4VLaljY9dasWJXLTg9H3Ak5ZLSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736687784; x=1737292584;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G7uUIFL8NQMzguRU6FKSiGyQ0GhQRv6EL0lIIC+jn6E=;
        b=cpjixyJZDU2eBVBQpuIO3o54h84VVl+MEZvh9h5py9XX2nYT/Nz1Tr5L4N7Pfz13Ao
         LYvqCll5oQkFSbkV2Xo0MUTkwC30GgvcqGiUG0ztALQfpiTPLftdXfvbRHFnpfLFOUnS
         CWungRpPrFhOHZnJvoycmrljixL2e3dtMLPANYQOzTtm6t//TKDr3bRaiLaJ6BGfkSB4
         WC1xg6JCkTLgIAHguzkYSM/4gU896YHE1vkjjDUzDvQJ/F/9bcZCpULzremN1KpnYR7r
         3m9OCbFEo7FwVo4mk1At/rOvABnIZAjDynf8oexyApDI+l5U/CV8vsksylBS+BcClUX4
         1ISA==
X-Forwarded-Encrypted: i=1; AJvYcCU0xDI7j2frXF1EyfpNKIz+VhgI6+tNEvTsuCXmWdhfI4jjpvewuhqRkP9qHF+1GOIlWe8hjhfv1W/nEYNeYKv+ew==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzGu6gQG1QyCEd3FvU7Tu9GaThlYu5wqivXuU9hno6mud2tN1gY
	u8gaVyxJ8i+h7qJVc/hpU7YvcdyqIi/Lie6nwSOnHdZkd4gHiVVFgGK+IJea86s=
X-Gm-Gg: ASbGncsBUrJf5aDKBdSNYSxZOpZE0TOyf6xHz6Amg07QGwLmjVflhCarJrXH4vaIicN
	Lkioyh7+QtoyIYWEfnaROSj9/MFXmiSJFJ1M9DxTZji2+YrG6WDASZUuLg+v54VKQjKgQ3U0heG
	ZtuHjbeKEuqEjd1IruepqcYvA0P7DUzuPh/qPcrufFTl5Z9xwuy0vRUAylRVM5lD+EsZde6DZnr
	ZNKWRoOaMc0s7Mc25lI1JwROMEQSiQSHprkecP+RgJNAcYuGm7jlo7WdvL3tgurxG9Ql/eilQUd
	6ewR28OvciIS0iKoyHN4eVdMFwrpRyJuHInaGrJeSMCUlQ==
X-Google-Smtp-Source: AGHT+IEag18plNUygaZRts+rVT1BDbpfqtgVnJl2MX7VwJGDAnRuH72fP2WzQutQ8GrHnaSJ8aR6cw==
X-Received: by 2002:a05:600c:3403:b0:435:b064:7dce with SMTP id 5b1f17b1804b1-436f5881e7amr50284185e9.18.1736687784287;
        Sun, 12 Jan 2025 05:16:24 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6dec:1ecd:2f8f:23f3? ([2001:8b0:aba:5f3c:6dec:1ecd:2f8f:23f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37d7fsm110497355e9.32.2025.01.12.05.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:16:23 -0800 (PST)
Message-ID: <72e940e5060139c49c7a296361719309698cb806.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/1] cve-check: Rework patch parsing
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "colinmca242@gmail.com"
	 <colinmca242@gmail.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jan 2025 13:16:20 +0000
In-Reply-To: <AS1PR10MB569729FDC98FAE5778352DEDFD1E2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241230192224.113886-1-colinmca242@gmail.com>
		 <20241230192224.113886-2-colinmca242@gmail.com>
	 <d980189b3ffdedb68e0a13b78dd836318a20bde4.camel@linuxfoundation.org>
	 <AS1PR10MB569729FDC98FAE5778352DEDFD1E2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 13:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209683

On Sun, 2025-01-12 at 12:27 +0000, Marko, Peter wrote:
> This regression is fixed by
> https://lists.openembedded.org/g/openembedded-core/message/209573
>=20

Thanks for the tip, I've merged that.

Cheers,

Richard

