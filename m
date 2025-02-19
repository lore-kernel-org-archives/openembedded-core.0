Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDCAC021B0
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 14:49:04 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.23827.1739976537265936254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 06:48:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cUNGlgVa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38f406e9f80so3207676f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 06:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739976536; x=1740581336; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DTHh7S5+TMH3PP6NnZVtRZ9WyMciWg9tQoa7frciXjk=;
        b=cUNGlgVaW1yF3gvwumaeZkbTh4DPy1oCgV8ETSS5P9ipQBmW8Msi96dYVFpmUr5KOi
         QuJYiVsC9sFZVBgCvHhIoDcybWyWdNua0gGb4GIitiPh+HXQ5K3HS3FaHT1n2utngUfa
         2hx++hlsiOTgbnTU2Q9zE8USMG/jhC7eymgco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739976536; x=1740581336;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DTHh7S5+TMH3PP6NnZVtRZ9WyMciWg9tQoa7frciXjk=;
        b=U/jZ/2DaNuQmxxMxS7+K62WSkGJw6+ruEqLOg7t5jJ0QSCvWe75rMeXfThJFmV8fbO
         lOHmAPR79YE54qPNimoAzEEH7XInqiwJEcIVcQkzRf6v0RC69loBfc0vLce2WC1pqK3Y
         WxHDRInCj364i3ah7PLCJtX6NozkR5UK5EUuVeOMCaK0Yd8XWvnm7m32MCGv7k5Ctqja
         pR7FBFJl2PdbvF2bovE+PAf2h0dW2KN/6KWkR8Pe8EXQ/dDVbu7rU5YI+3RqmeJzP/Q4
         W03y0DyVn0H9+yp1PBK9Se8hb5xnB1hKDr+iqXFcI1xiNn2LY4gEP3tRBzhJorF6X9xw
         AtzA==
X-Forwarded-Encrypted: i=1; AJvYcCUjQiZbYS7gbm4HVAl3d7mXorRy71alVJKHK+C8hVXgxyucfisbE31X9PkxH8m4pGDHZCxPFmX8rVlPa/yRWlGbsw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywrf7yxOYRKhcLLR3nDuwhvRteL309XA5kRtXAkeCL8lhcZ1w/Z
	3b+CBi0wG3fEatKREYx4oY0QCi+D+Tq015DaYA8XEAMSiBqMZWGQgxiq0C9oSMh5TnnYPK4TOCn
	z
X-Gm-Gg: ASbGncukK87FNH8RNRSCQypm64Qt/g33GLZ+sIcF7VIfg3FwdbFWV2aLLRuV0WWyX8d
	MQB3advAiZ0dJaZJ3Krq4WXqgxGlgJj7InQURy54aZv/qsL0cVzdzoiRAa/fSAYeMxwNPhJ9Bc9
	g4xnA7uUdC24EDSBFKB5Mr+pU44wZQan7/iylSJjfp9+ZU/vLTXhgzTQcSvixtpQPrE8i+EBoKC
	SpqCr/hkzK9dqTfcMhAfw0dxVmsr7jcM67AfhQ5N6eKRjkOlB9ljmoswoX5HSJFepSmtqIj9jk8
	hJcRzFMitMfDF8RtCrDZfH4BIbIRCjOqVCWWzhVed2rzpVfqx7mL4GJOSzZI/3ab1LKOw78wgs/
	jsRSw
X-Google-Smtp-Source: AGHT+IFAqu0sLj4XmoIlJouj2tZ0nitDxsO0YP8nQj5OLpTD1EqSjqlmtlejsucYDsZEK+H4vwM11Q==
X-Received: by 2002:adf:e611:0:b0:38f:2413:2622 with SMTP id ffacd0b85a97d-38f587f11c3mr2489431f8f.47.1739976535535;
        Wed, 19 Feb 2025 06:48:55 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4146:2030:963a:7035? ([2001:8b0:aba:5f3c:4146:2030:963a:7035])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d8e62sm18123035f8f.71.2025.02.19.06.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 06:48:54 -0800 (PST)
Message-ID: <98f01e8c3ca6b887c1731b561cadf4591f47b5fe.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] rust: Oe-selftest changes for rust v1.82.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: deepesh.varatharajan@windriver.com, 
	openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Date: Wed, 19 Feb 2025 14:48:54 +0000
In-Reply-To: <20250218133352.2360384-3-Deepesh.Varatharajan@windriver.com>
References: <20250218133352.2360384-1-Deepesh.Varatharajan@windriver.com>
	 <20250218133352.2360384-3-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 14:49:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211710

On Tue, 2025-02-18 at 05:33 -0800, Varatharajan, Deepesh via lists.openembe=
dded.org wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>=20
> A few tests are getting failed with x86 arch.The unsupported/failing test=
s
> are added to the exclude list and ignore the failing unit tests.
>=20
> Upstream-Status: Pending
>=20
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
> =C2=A0meta/lib/oeqa/selftest/cases/rust.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../rust/files/rust-oe-selftest.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 48 +++++++++++++++++++
> =C2=A02 files changed, 49 insertions(+)

We did see a single test failure in rust testing on the autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/1014

Cheers,

Richard

