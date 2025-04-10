Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D53AC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 11:33:50 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.32332.1744284825782099364
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 04:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZPaiaDT9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3965c995151so273246f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 04:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744284824; x=1744889624; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQTe/WGrcR2SGBSLCxcMFLF0TXrifjhXPNlnpRQF6Fc=;
        b=ZPaiaDT9D1P6bLPqiSqHGIbMHGiWcqkF5a5b0pOHkcIc+jlWevon9R5ZEJUHawBcB/
         w5Sn5mNKplKQ1zhOTbZR6P/4XV7itpV0NutAmcWdgqxMJMOwKdyCP5jYLvh5N7mylY1t
         xz+Xox7mqG8OetWP85GEQYnGizPYwVlt461ZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744284824; x=1744889624;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fQTe/WGrcR2SGBSLCxcMFLF0TXrifjhXPNlnpRQF6Fc=;
        b=jwwSRBD7QKpOBeyiM1/h3eBhEgu2duxtmA0N6zW+Q9HvggYQ79FzsueGbe8fSGmyWF
         z+/3caLPjmiWhb8motnyTLq2U2jUlXn12hJ+gKFDjUdM67W9IuqixGjdjq+6CqF2DnP+
         MGhT/X4whQ1Eqfw7noV6kcx/J0QbBO2cYNSU3NdosFLsOcjVLxhZMyAU+vGeg7z4Wqj8
         FgBCrAw7gERig3wJxTFjjEXUVUrKQ4GCcgVsmSgXLMb43PPppqaiulZY88VyX+74xK24
         d9szY+4micXYs4zMCxLZzPHLBUolqCFn6EsaFZtl6mLTEH73KFsV9h8DIc2gGJt9Gs9H
         HEIw==
X-Forwarded-Encrypted: i=1; AJvYcCXTExmwh68PHA2EUpOfsTNIDf9GnXUMcs5xNRHniJ9pAcV32Ke/R3xM2i8ppS9k8NIxGovvuGmoAINj+3dthTn5WQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwUeRGeSgWcEX2MwcBNjlaYspDd/4P3U9dep5arUzjO5vF+c2Pj
	aErx0uQJsn1dPShcmfgn6c9GEktwhbdN9nhMoVjbe25NNgrHt7K77CYzuQNPqowdmfg6kT8m8IE
	D
X-Gm-Gg: ASbGncv5rF7cUHKrkmUIatCfnLPY6X2orj6G19WKNfk6B3Xbs03+xTAgxfg/79T96u1
	hgocR7cl8JspsdEzYrH438WZw1Eanf6y926SvsTEYArzilrwPB3I6T6+/ilZJAG6d/gldL8XrGP
	M4CtXSsYkOQtC0VCQDccUXyb8xBHUybS2k/eANtxgIQt+fqN7J9yRI1Lx/jBp4dP+zEi34x5Svu
	YGD4i0jtboLFOAodw2ylCPs4kdiMKwQ/CdtXnMSfoCUnCNopa/uhG2zkbmCXGYxF+4IJGF0Zuo2
	IiUUG4NpksDNgkQp/BW5R2Lst1Da67fO5RwSJ8amUdHiVFRdcnIABdtaxC0ewbJRgDBIzBbQATN
	PCgqw80EIXDqolVlQqa2L6c6l1lM9pg==
X-Google-Smtp-Source: AGHT+IFAy5hQcAJ2UTBfp/n5ssXb5+dhET6PH67s3ZvNbxcBMYnx23FKrSVKxHe+Dz059VCHKp+rcw==
X-Received: by 2002:a05:6000:250c:b0:38d:d0ca:fbad with SMTP id ffacd0b85a97d-39d8f46d4b3mr2011854f8f.14.1744284824080;
        Thu, 10 Apr 2025 04:33:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ddb2:da8c:e063:58d6? ([2001:8b0:aba:5f3c:ddb2:da8c:e063:58d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f208e96dasm37371135e9.0.2025.04.10.04.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 04:33:43 -0700 (PDT)
Message-ID: <3a3917e7e0b9c3f444ee895f24ca401b36e6c694.camel@linuxfoundation.org>
Subject: Re: [OE-core][kirkstone 10/10] glibc: Add single-threaded fast path
 to rand()
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
Date: Thu, 10 Apr 2025 12:33:42 +0100
In-Reply-To: <19fcc012160c6b8782be0e6fc54797c88bf084ba.1744145328.git.steve@sakoman.com>
References: <cover.1744145328.git.steve@sakoman.com>
	 <19fcc012160c6b8782be0e6fc54797c88bf084ba.1744145328.git.steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 11:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214649

On Tue, 2025-04-08 at 13:51 -0700, Steve Sakoman via
lists.openembedded.org wrote:
> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>=20
> Backport a patch [1] to improve performance of rand() and
> __random()[2]
> by adding a single-threaded fast path.
>=20
> [1]
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dbe0cfd848d9ad737=
8800d6302bc11467cf2b514f
> [2] https://sourceware.org/bugzilla/show_bug.cgi?id=3D32777
> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
> =C2=A0...dd-single-threaded-fast-path-to-rand.patch | 47
> +++++++++++++++++++
> =C2=A0meta/recipes-core/glibc/glibc_2.35.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A02 files changed, 48 insertions(+)
> =C2=A0create mode 100644 meta/recipes-core/glibc/glibc/0001-stdlib-Add-
> single-threaded-fast-path-to-rand.patch

This isn't in walnascar yet.

Cheers,

Richard

