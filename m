Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53882C35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:27:01 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.61422.1742894817354800499
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CSCTChkA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3913b539aabso2876304f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 02:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742894815; x=1743499615; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3dYfg+vAmoapWBCvHFEk0ZHB3UJmHp3sdGRy5QGCjI=;
        b=CSCTChkAVeHTEyodjqfNuGsZqH5GOEMBql61a7lAh2SuVPAe/yKkx+M45i5FEj2Jqr
         LwuSKktjwvVB9gMBNUfTSaQGJ4lVeuGbPAlsZIurk2aXH8o2gUvkedSt0P24kJANk++r
         3NkLaV6WWk0oBUzyRJUkZUAq8uQLXX0Kluz+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742894815; x=1743499615;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/3dYfg+vAmoapWBCvHFEk0ZHB3UJmHp3sdGRy5QGCjI=;
        b=rTXbFapX0RW3OCYbKQS0ekOAOExahvc0qn7CcAvhFQqoDjfUVJCCOd0Ng7LM0ApEfK
         9bi06Fi9sZHls6KdcAp2IOPakaD+U83GX3T6m/3lx0NbkNoqxbAfQq7sfCfn06LEVYhE
         SNXpnS2yjKA7HG0GtMwWkh1rzgbMkivXi7fla+M2i0VspIuzchf3X9SSEvSHn9hIZx/4
         wpD+27JMcjK2k46Q6ejJE7zUe+/UhM/kchVNqYjLYtf3wNoKf4FH39l7VPA1f+QstuCI
         QltLYluIGl2k5sNPEHoZ0susf7TyQj0XGEEzzJWbiwjlRYlFV1F1/d7QpiKaWZBAQNir
         UoRg==
X-Forwarded-Encrypted: i=1; AJvYcCXq7s5QweOA+Gu3qAvetgLq4fvsoJ7Eg8HVSG0i8aLNXBp6g3sK1lEF/Okp6ie2PBduuEzX5f7ALPlJKrrdlCO1Yg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwJpG8fewgKYwVOYudnlYsSYA2ansL9xXKKa56qguDCWrZRno86
	Rr9er8SDhWNHqZszLr7cz+JhgeBFleExd6ruB0ZOkbuGX8Gbzft6I90lVWqFH3E=
X-Gm-Gg: ASbGnctJMeGIaXA8M0RoBcuOrmpXeb1BBUiWuiemUic+f9zTko7fzT0LSUk94qzAoPK
	w9THjtxvEZmkhNExoEXSUkgnKI1VXGFcdJblAjt7/uVURfjJfy1P/jfyoj2KIdvZehmWX12qXub
	2PqRZYCbGILNDid2uONocaQLzKne42NgJTSzxkJRyo6MLNaOfTIWEuPBqeP0VYRJI9VrtmkdGCF
	eM81ycfcZKxotSqOg7uSOSB/JLOSJ1ZsFYdRrSEsaetzN4ObUWKi5H/P/JPdECUfc9rO4NQtBxO
	Za6xpP3uAEpYmxYYdV9ptH84AQHJoSmYuYvbjIdPZbp+kgklAvV5qTY4zYReecTtpVYMe9UMIEq
	uRVf4q7fbXyJI12odahmoUAlA8T+/a9HBQw==
X-Google-Smtp-Source: AGHT+IH4UGI8mzNzPp5jeEZ3FERhgsA4VngmD1dNbtaBbBYTc9Gu9FwUlLn+ZIf3T/zUhUytnYpy5w==
X-Received: by 2002:a05:6000:18ab:b0:391:1806:e23f with SMTP id ffacd0b85a97d-3997f911624mr13079848f8f.17.1742894815289;
        Tue, 25 Mar 2025 02:26:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bd49:ef6e:5ada:f0b5? ([2001:8b0:aba:5f3c:bd49:ef6e:5ada:f0b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3f76sm13349533f8f.37.2025.03.25.02.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 02:26:54 -0700 (PDT)
Message-ID: <4dde9a34f0765944a47445822b6b12194fadf289.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] meta/conf: Start to populate autobuilder
 config fragments
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Antonin Godard <antonin.godard@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 25 Mar 2025 09:26:53 +0000
In-Reply-To: <D8P81UEBJTPA.3TVLG94CK2MIH@bootlin.com>
References: <20250324170911.391159-1-richard.purdie@linuxfoundation.org>
	 <D8P81UEBJTPA.3TVLG94CK2MIH@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 09:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213600

On Tue, 2025-03-25 at 09:58 +0100, Antonin Godard wrote:
> Hi Richard,
>=20
> On Mon Mar 24, 2025 at 6:09 PM CET, Richard Purdie via
> lists.openembedded.org wrote:
> [...]
> > +SANITY_TESTED_DISTROS =3D ''
>=20
> Will the recent 'removevars' addition from the helper's
> scripts/setup-config still work after that change?

Well spotted. No, it probably won't :/

Cheers,

Richard

