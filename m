Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A67C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 17:52:00 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.571.1743184313814398105
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 10:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=el8IsXhD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3913b539aabso1466874f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 10:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743184312; x=1743789112; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rHssYmx9dpEwqrNL02qUPumiExuMSzuB3lB8rzL1Y7w=;
        b=el8IsXhDLWqPbcxxa18kWQkAB6HBnn8Ng14H6AydjjyrDXbQzUKZnR23xjqkAJG4QK
         s5PzeHu9Pwx4JF2O8IStu8OWHwi1J/vZxhU6EAYX2+W+mZoSA1mpPSgWm1okL9TyZOLm
         mgdYv6iEAu+qXccnMha5VSKHxfzyVorm6YO2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743184312; x=1743789112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rHssYmx9dpEwqrNL02qUPumiExuMSzuB3lB8rzL1Y7w=;
        b=hH+c7C2++p1hnk4r3BEuYUkQbn0h/5yedJwlxX1oX+v6kdEe5c/bik+PzFZfAeFi6e
         knANsipvv8ypfwe7zNW3DH6zJbI6+LABushQn5mmPHSxtE+3CfdohIz8ZNKKTaiR2VO3
         hcdRn+B2/XnMu89Ur2/AEFb4UzLqFFmVSSF7fU6UxZTJv2FjpEMv0HPXqud3e14+2Se0
         Dz9nwEy7ekMjK/e2dSSTK+hAvdZQ9cBVsdxX6fIdBbHE5EftTbgyc3NsKb0WZbN2v/F8
         Bm5wGmb1EHpZLPVo2JV+3caxHUPLDxG5GAytmamP/44r3RlG1iFRNM6oOONtOvn0i0cw
         MhnA==
X-Gm-Message-State: AOJu0Ywc7sqYmCninF9YyrTUl7QCMwt1w0gd+Q5bzmEoLA9wgtlxZF84
	XmGemzHC1nMyi5bANqbikr7lczN2XVuluQUYjVCOXOhsDQbGOogm+RQU+x556sM=
X-Gm-Gg: ASbGncv17XN2+UZotiMufbK3JdbKZYVQtunXVAr9fXeZ7y9tqpMT9sUEzDR1KJQFOA/
	0S6TulY67d4WTn/sfSkE+1sLnohL5Xt2/4wpYF+P7ELoL90+RhnLvylTE1M1D0ZOyhg3lHUOVpB
	7xVVWYrKx/GRBzWnvcbq/totBYIE3xPkXrOUoaQvEgWS5/+kO/SYnwOKuAH9Nicc+sjfjpVfPog
	KXy1df32UUH38chPughvZJfx8G8zcGnRVUQJY0uuictCvImR4GTlSoHIuQPPu8fKVB+yIE4r0uH
	5XBAR6DCj7s2zsboHfPlD+HKBwDejBEaS15Xz2YeWE+nMuYhtsA3kq+3qUNRk1MM9aCH6dRJz0e
	0zKZ8b3ka4hnRcHpx7/C6+e+svicLmfVNvd02+NYQ9h6a
X-Google-Smtp-Source: AGHT+IFbTvEIPSwkJNSI16oC0e0IS/dcx6fN2sYCYIisnr1VR6wq4pSpOnUdG/lTMwBtU0pmQr/q6Q==
X-Received: by 2002:a05:6000:2ae:b0:391:2e6a:30de with SMTP id ffacd0b85a97d-39c120db4b2mr56689f8f.19.1743184312205;
        Fri, 28 Mar 2025 10:51:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8d57:ea33:89bd:8b22? ([2001:8b0:aba:5f3c:8d57:ea33:89bd:8b22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b662bf9sm3162242f8f.29.2025.03.28.10.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 10:51:51 -0700 (PDT)
Message-ID: <5307873e784b5d21f94f5e23dc3a4ad0796b5bdf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/3] rust: Upgrade 1.84.1->1.85.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: koen.kooi@oss.qualcomm.com, Yash.Shinde@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, Ross Burton <ross.burton@arm.com>, Jon
 Mason	 <Jon.Mason@arm.com>
Date: Fri, 28 Mar 2025 17:51:50 +0000
In-Reply-To: <BB6CE0C2-6EA2-44F9-8B16-8981A0B19BDD@oss.qualcomm.com>
References: <20250328143005.880998-1-Yash.Shinde@windriver.com>
	 <20250328143005.880998-2-Yash.Shinde@windriver.com>
	 <BB6CE0C2-6EA2-44F9-8B16-8981A0B19BDD@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 17:52:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213859

On Fri, 2025-03-28 at 16:17 +0100, Koen Kooi via lists.openembedded.org wro=
te:
>=20
>=20
> > Op 28 mrt 2025, om 15:30 heeft Yash Shinde via lists.openembedded.org <=
Yash.Shinde=3Dwindriver.com@lists.openembedded.org> het volgende geschreven=
:
> >=20
> > From: Yash Shinde <Yash.Shinde@windriver.com>
> >=20
> > Rust stable version updated to 1.85.0
> > https://blog.rust-lang.org/2025/02/20/Rust-1.85.0.html
> >=20
> > Some of the major updates:
>=20
> > [...]
> >=20
> > - Explicitly set float ABI for all ARM 32 bits targets.
> > Fix: https://github.com/rust-lang/rust/commit/a51fefcaab835b310e2e26005=
b50982d0049d905
>=20
> In OE we allow selecting the ABI using tunefiles, so this hardcoding to h=
f will do the wrong thing for non-hf builds (which are rare, but still).

Well spotted! The patches did fail in CI on qemuarmv5:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/1207

so at least we actually caught it in testing too.

Cheers,

Richard

