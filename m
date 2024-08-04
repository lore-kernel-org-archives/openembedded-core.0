Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED8B2C3DA64
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 21:32:43 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.34899.1722807156937039358
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 14:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XtkPzUVM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4280ee5f1e3so67232125e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 14:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722807155; x=1723411955; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXGgYK8VB/boy8bcE0S3kUXHv0lpr4Ibrt4cQT/KuJA=;
        b=XtkPzUVMdPbA4VTbB5qxes4cFrbcEL3T4R9f52ZzjuIPxHTGPtmXB+NrTinX8yPjyn
         YoN6GGb76ekIxredJXad3l4vK8wqIAEqgKdw8dURjwWK4kOasmGy/fAWEpVo1pUjF9JY
         y/UHsy8EK+BU7nPdAtJztDNf5a2b4uIMZ7QHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722807155; x=1723411955;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nXGgYK8VB/boy8bcE0S3kUXHv0lpr4Ibrt4cQT/KuJA=;
        b=Sb58pFyU6d92IjFHkWlLhWj0xf+GY9Pz33kOcYSK679HKkusStTpLLyFO5cNc1/zLF
         KMYXo/79LSw0rNMILeyRL5kdrgJ+yeIY4Du1uG1FdUO/Dd4FVvwl2NOBjWOQz2sRbnpF
         xBszO/gUzgjYL1eL4NdWIMXSL3sN7rK2kMm3L1rYuzC4Yb5qfTsvHRsZB8rG0YPCCtr4
         8MSBzXrtboZbU9rUp9FIsEwRudV7l+20rrZ3gCEMWpgKzwKjMN7yVfhGlQkBrDiOY04o
         mvTyJF1TssOtAik8V4RPJMulZ+wdiXAAYvXI3kWobFSzLDv9ozf3BxYyS5FWzgJ/xB/o
         9reA==
X-Forwarded-Encrypted: i=1; AJvYcCXGLJ7Ntn7Ol1uxLhiCIhtK/cF+hgsmxt+sQ+Y8R3W5nX29Eg27klX9vsMZ54yCjU82WtR5qJr0Xa4RsdK6Ln8jWvEB8WImE9y8h7XafbqEwuEgzYF4NNrm
X-Gm-Message-State: AOJu0YzfgVqjpweEsrBGwkRv/wll2vjfLkCjkAuM+xi/loHZf92tC8IY
	NIO86pugpNiBLzgrv4n5ECDaQSS9sUbLXbSCrGYNXMw1IRLGjJhYbpUdvCj3iYD+X0/0sYD7cgP
	WZOI=
X-Google-Smtp-Source: AGHT+IEBMWUFzz/nd/hFEeshzvDbMWyqic99tt/E4EbMKtEpnZzwM1P+f+q1zYrVpvKMySMciOAsnQ==
X-Received: by 2002:a05:600c:358b:b0:426:63ff:f763 with SMTP id 5b1f17b1804b1-428e6b942femr61473395e9.36.1722807155055;
        Sun, 04 Aug 2024 14:32:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c970:9bdb:c2fc:595d? ([2001:8b0:aba:5f3c:c970:9bdb:c2fc:595d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6e06e98sm112452535e9.15.2024.08.04.14.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 14:32:34 -0700 (PDT)
Message-ID: <76a9b1972d61073056cfa0b3a181c3b876269eb4.camel@linuxfoundation.org>
Subject: Re: [OE-core][scarthgap 18/18] rust: Add new varaible
 RUST_ENABLE_EXTRA_TOOLS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
Date: Sun, 04 Aug 2024 22:32:33 +0100
In-Reply-To: <136a25567499191b23a4d000a06bf83a473224ca.1722790925.git.steve@sakoman.com>
References: <cover.1722790925.git.steve@sakoman.com>
	 <136a25567499191b23a4d000a06bf83a473224ca.1722790925.git.steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 21:32:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202979

On Sun, 2024-08-04 at 10:09 -0700, Steve Sakoman via
lists.openembedded.org wrote:
> From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
>=20
> There is a need to enable some extra tools from the rust for the
> build
> and so this new variable will help for that
>=20
> This varaible then we can use during do_configure task to add overall
> values as per json format in build -> tools
>=20
> Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
> =C2=A0meta/recipes-devtools/rust/rust_1.75.0.bb | 6 +++++-
> =C2=A01 file changed, 5 insertions(+), 1 deletion(-)

Not sure this is on master?

Cheers,

Richard

