Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA70AD41D46
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 12:01:18 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.35824.1731585672579326527
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 04:01:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a8MBoa6r;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so4719785e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 04:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731585671; x=1732190471; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TF8s6XN00T/PAyngSzyfpp/koTjI68pg7DLVM+QNCUE=;
        b=a8MBoa6rmKo2JjTWAdgpoFBJFzk8vu1W2O1TvaU2ge2DH8wntgZPrgXQm8NfhWobl0
         uYcqKB+fvP4Pfmu1ki2o+9dVqLTIPJBdKY1DrvchQbWmVqCCRiLaMs7Po8Om4jR1iKz4
         7242tSTo2rI8EHvxlY9xb7HDfZQm7k5rI8u5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731585671; x=1732190471;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TF8s6XN00T/PAyngSzyfpp/koTjI68pg7DLVM+QNCUE=;
        b=tvVEdfZu245+qHzVAzf++SL5EsA/3pxRsJn8U/HIn/ZQQ0yhkFpuzOKUJV4nWo8mpQ
         sXVe7ujcMGjV38RY148VL/UYyFHNJh/e2ZnMInpdyQwbVuW7h04zdordEZMcU+scfXRv
         zPOmUcHk7sVvNDbIT9SzXDQXslasgtmP4WuIwgOv+aj8/+Gjxh05cW6Ug8GAJo4CtynT
         LgCFDv9244JWiu4IdS6y+JK50gt64+2Tfhb66dZP9Tc6P/rz23cIbAdCQDIB6W3kWIkE
         jq4IyRkh4u09X2DtNNB0Bqe8ShQ+rdfkIIYWJI6YzmA0xvFyoedF5z805BYLdVYxu8Bm
         3n6g==
X-Forwarded-Encrypted: i=1; AJvYcCXa1RIzidR4qRBvanw9/oWguVrNiGh3eERVtLlJ5Iq9pc6dglBtt1fdFEJyZVbVII0aqE7arfN/AfB01QcHKYW9vw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxcv9T1VXkBRn8WhAZE7LsaXho/q5gBPAIE4Edu8eX3b9K5hjWM
	l5Fgq3yWwRr2PXLOmiA7204Ep2u8GmqjtRQAHQjSTvurjUeNCFswenO40xw4jJ5V65SFfYwrLw1
	6WPQ=
X-Google-Smtp-Source: AGHT+IGdlSe8et3FOTF1UBYGiip/LdDfK465qaOBwX4KpUen/S4ZwEuxRPocNRi2EUS2Wy6PnPBw4Q==
X-Received: by 2002:a05:600c:3b87:b0:431:6060:8b22 with SMTP id 5b1f17b1804b1-432cce7203fmr96607895e9.10.1731585670811;
        Thu, 14 Nov 2024 04:01:10 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:593b:1ea:4243:8543? ([2001:8b0:aba:5f3c:593b:1ea:4243:8543])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dac216a4sm17997105e9.44.2024.11.14.04.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 04:01:10 -0800 (PST)
Message-ID: <fa228c64236225ee3b14f9fd1f78c0c5a98790e5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cargo: Increase RUST_MIN_STACK size to avoid
 SIGSEGV in DEBUG builds only.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yash.Shinde@windriver.com, Randy MacLeod <randy.macleod@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Date: Thu, 14 Nov 2024 12:01:09 +0000
In-Reply-To: <cbc0bcd9-ef88-4fa8-9595-e69d8a794c47@windriver.com>
References: <20241030111601.284064-1-Yash.Shinde@windriver.com>
	 <90fa600f-7b0a-4dc6-a58a-90997995ce86@windriver.com>
	 <7a5cd559-7db3-461d-bef6-10e4545e1b8a@windriver.com>
	 <35d5f2ec-4281-4be1-8040-829dbbdc0d58@windriver.com>
	 <cbc0bcd9-ef88-4fa8-9595-e69d8a794c47@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 12:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207155

On Thu, 2024-11-14 at 16:32 +0530, Yash Shinde via lists.openembedded.org w=
rote:
>=20
> On 31-10-2024 19:32, Randy MacLeod wrote:
> >=20
> > We discussed this issue and agreed that since it doesn't affect YP AB=
=20
> > since there are no DEBUG builds done there
> > and more importantly since it's really a work-around rather than a=20
> > fix, we'll continue to work with upstream p384
> > crate owners to resolve the issue. Forcing users to change the stack=
=20
> > size, even for debug builds, is not a good policy
> > and hopefully some of the code-generation tools that are inputs to=20
> > p384 can be adjusted to reduce stack usage.
> >=20
> > ../Randy
> >=20
> This issue is now fixed by removing unused mut variables in p384 crate=
=20
> and thus reducing the codegen.
> (https://github.com/RustCrypto/elliptic-curves/commit/7652c5842cde60acc1e=
739ebbba34614cb158f8b)
>=20
> The current stable version of the RustCrypto=C2=A0 p384 crate is v0.13.0,=
=20
> which is also the default version for building with Rust.
> But, the fix has been merged into the pre-release versions=20
> "p384/v0.14.0-pre.2" and "p384/v0.14.0-pre.1." of p384 crate.
>=20
> I have opened a discussion thread in p384 crate:=20
> https://github.com/RustCrypto/elliptic-curves/discussions/1102
> to ask the crate developers either to update p384 crate into new version=
=20
> with the fix, or backport it to "v.0.13.0".
>=20
> We can wait for upstream unless someone wants to merge a patch for=20
> master now. Let me know your thoughts on this.

Firstly, big thanks for working through this. Getting issues like this
fixed at source in the upstream is infinitely preferable to carrying
weird workarounds.

I think it should be fine to wait for the upstream change to filter
through to us?

Cheers,

Richard

