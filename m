Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C6AFE77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 12:48:21 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.18630.1736340493814353013
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 04:48:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bmEdgi0q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436249df846so115883585e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 04:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736340492; x=1736945292; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fejb5K48ewGCQFhTD/jkxpIE/sa8f8uFoiOfJTH5BFY=;
        b=bmEdgi0qaJJA6toIHFpg4xHdSE30BmlVj9BISxvnuMrYK7JnZ8X60hGcXnDHPUd1sZ
         zgX1XTFqTgTEa3pbhCQeZMfjp17h/os6UiWGPronqdw0HDcfOqaIflIkH20N0gOKC6Gk
         jglGOfZto8dRQmYDNkXPl/NHTP1HNG9zWTU9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736340492; x=1736945292;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fejb5K48ewGCQFhTD/jkxpIE/sa8f8uFoiOfJTH5BFY=;
        b=I1wQG8NoulQTH4G7TuGr9JYo7E9SRr/3etGrWQvVPIE4x3V0AOUQJLNHiYQ1lPBtxt
         tFQR8ih4NlO2TSc1IJNxXV0DrvY+AQMW9Q2mv/dQelMFnIsf3kBtbc9Q/QvF1dPBsANZ
         7/fAIyr4YJMaVMtRCYPxjVTplH4DI6eZPWRZyN4EOE5fXLIpAViQ72BSOxbCjSAm+yOX
         6qJghR0p+ZZ+AfDnVgnFVMIxQNl+CITtTeMjf+QmGjewnosQbIzs6fnpjrbhS3X9jnij
         iGXexbeehUf4wNsnp3AYSOJxBZgA7QL0K2iYRPtzeTrx8FIPRKvg4W4FkoQM6MOrJf3M
         wouA==
X-Forwarded-Encrypted: i=1; AJvYcCUuSuBl1whQEE/zC/Iw/zcZFTz/7dwdL5lpL4c2hoFMfPKQqzJhcgGB4VzmlkZR36xGVjpHTi39qj0NLQSEcH7X9Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwDDuBZ2os2xQ657Ku/v3ozssHLSm3uxnYFspZuddo6iETHjXW3
	ac3t9nV782yGGMHjNN+FQZJQW4XJOs7ygFcCdALbg0qoornIN6ro+djJUjjzsg4=
X-Gm-Gg: ASbGncvpJZTiaxNAyN21aP6H6hbKCBbQt0WxmLfhzLJwtPzN9/Pyc5G/5JF1pxU8Pmg
	cFnuVu2L2DT5oAPSb2uZkdTQybCyCSdErnp84Rp2w/tIMYy5BqIj0EGc9tBJDVCXOC+P1BQ38dP
	bfnx+WfNFUv+7pM9+x/RjceqUYtosmQYSjzgwfthds6s/tyjDdi7k+U5JLDxj99GfZhhSMdT2e4
	0rrWq3PPNlzfVSl5hh28VNh/nuoyqkYuOA4h2nanvUvE+CdqS72U0EgFDguvDHmhLiip/+I0XAC
	N1bPtLomslwT+GfFBzy1w5kZoHvoyEloiKzep6IxDtPtHQ==
X-Google-Smtp-Source: AGHT+IGPgxhBx1rUOiUhDKCHxFqgCbAkD8LT1WX40HZxcOMrCJ0hNednxE4MG0CqNuZ5AFT/X0syWQ==
X-Received: by 2002:a05:600c:3b91:b0:436:46f9:4fc6 with SMTP id 5b1f17b1804b1-436e26928e6mr23283505e9.8.1736340492073;
        Wed, 08 Jan 2025 04:48:12 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:906a:f5af:b180:de5a? ([2001:8b0:aba:5f3c:906a:f5af:b180:de5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da7747sm20159095e9.4.2025.01.08.04.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:48:11 -0800 (PST)
Message-ID: <4d65caa530949e6ce04889829ae9a89bb2789f1f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] meta/classes/create-spdx.bbclass: support to
 inherit SPDX class conditionally
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org, 
	jpewhacker@gmail.com
Date: Wed, 08 Jan 2025 12:48:10 +0000
In-Reply-To: <20241227061111.2086879-1-hongxu.jia@windriver.com>
References: <20241227061111.2086879-1-hongxu.jia@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 12:48:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209557

On Thu, 2024-12-26 at 22:11 -0800, hongxu via lists.openembedded.org wrote:
> In order to inherit SPDX class conditionally, using variable ${SPDX_CLASS=
}
> to inherit SPDX class other than original 'INHERIT:remove =3D "create-spd=
x"'
> and INHERIT +=3D "create-spdx-2.2"
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
> =C2=A0meta/classes/create-spdx.bbclass=C2=A0=C2=A0=C2=A0=C2=A0 | 3 ++-
> =C2=A0meta/lib/oeqa/selftest/cases/spdx.py | 8 ++------
> =C2=A02 files changed, 4 insertions(+), 7 deletions(-)

I don't really want to add more variables to control inherits like
this, in most of these scenarios you'd be setting up your own choice of
classes in your distro anyway. We can't have a variable for every
single possible choice.

Cheers,

Richard

