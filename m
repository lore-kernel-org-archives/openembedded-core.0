Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67896C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 21:31:51 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.72.1739309505216343951
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 13:31:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J9ujuqcu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4395560cc13so10550665e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 13:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739309503; x=1739914303; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HYgtLgx5HjWGK6OeMBugpHZjUDKuiHt0g9OdKoJTT0c=;
        b=J9ujuqcuq8rb7qTOcZ69cbrWZOtbCcgFVF7HrpKxtA+0yVlxnB2yXkAR3DfE3yRFPg
         sJ/Me1L37T0YzFaEOVnPKxi92dmEx8LmfDHBWnVrdTthPPMOeqxWHJ36i04EV0idh13H
         ot+lOz/PgTpqwkByM9KvkdIXH0w8CweNnPVMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739309503; x=1739914303;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HYgtLgx5HjWGK6OeMBugpHZjUDKuiHt0g9OdKoJTT0c=;
        b=jf4FDomU2f1d5FP9fzPY9ib+9pj5r3c1gjyGBYxUb0yQ6lvGE2UndyOlwApoK6SqbF
         zD+W+1EOIMpC5TXKCmPhMJ5PFuDLx2xRGKheKYtgnuMNfUg8Hj++ESZ/vCBRLvMO/ZTw
         5NJXILWUwS1wadCxRRio4XbnlR2NPgjAj1Kg02BL3wZvAXY7un17AMj56Jtdu1Ltjxat
         uHEn9mocXAgfBgeF16KUkbiFRw0TSg8jmBXzglUUpsqVuvS+GsyTiTCpTwgeYIRhW01F
         5Qb//BjhKf/tvX3lLRVdAuw0sbm7UIY9e1LD4PhnuHb9NT1WiPLFAiSFJ1SH4mmfXUVt
         2/zA==
X-Forwarded-Encrypted: i=1; AJvYcCVhE91C4kG97eG3E0dNK9EWgxTAtt9vwqQOcerdZXRPUMr3743wEwl7w0qaqi9SN0yaTTi/8EmZeFZ0YiYmXNBasg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz+8565d7CrOpKydkkKTc8fKOPUGtAzcL1sW00pO80L3K9FSqDJ
	nrl56UvlLIYsrU4grTyyJXeO/dl4u6iRMF+1J5ulBP3YOv80nfrMm/OdeHuOQ0c=
X-Gm-Gg: ASbGncsc5+gfKBNhQjoXh5kpNV1WdTEYCP6tDHHiwU0Fx+qiOVs40twegO5ZYARDzGj
	1d19lQH3SYZkqYRe1PQk3IXa3JtIa+vDv0ITDRNspXufyvvjVmmwM25czJhexWOmMzSoARX/gxI
	E0RdGSvhHOLALd4cplpusYzOhC7LLgsXpv7oPn1kTgwkdxliHYIx5Ime3MSMjpJF8yHofk5WUgH
	bBLFrQesBoX9Fwzxc9gXB37VlqU1kMCeUUmto12adUUPd4xjkoltbmThLgQ7w912cgYxHX4V87m
	Ix5i9liLhV23zk0JlEIxuCcKD9b4GdDdCslPp+XNrLsTPAtn9XpwYrLM/tuIsNoPB5fncvRJaLT
	Et0c0
X-Google-Smtp-Source: AGHT+IGrIcQFcN6U2c5lHHSIuh5EvkqjihiwzQlYkOeS8HJkrMXJQvEQ5OcYIYR3TOlrKg6OEfRawA==
X-Received: by 2002:a05:600c:444d:b0:439:3d0e:f10e with SMTP id 5b1f17b1804b1-439581beecbmr6813085e9.28.1739309503407;
        Tue, 11 Feb 2025 13:31:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:679f:b1ce:de17:3648? ([2001:8b0:aba:5f3c:679f:b1ce:de17:3648])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a04f8c1sm174625e9.8.2025.02.11.13.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 13:31:41 -0800 (PST)
Message-ID: <0e8a6ac372068e4f9eb73b2170a50cef5e7d8232.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 05/30] lib: oe: add vendor module
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: stefan.herbrechtsmeier-oss@weidmueller.com, 
	openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Date: Tue, 11 Feb 2025 21:31:40 +0000
In-Reply-To: <20250211150034.18696-6-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
	<20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <20250211150034.18696-6-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 21:31:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211187

On Tue, 2025-02-11 at 16:00 +0100, Stefan Herbrechtsmeier via lists.openemb=
edded.org wrote:
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>=20
> Add a vendor package as base for package manager specific
> implementations to resolve dependencies and populate vendor directories.
> Add common dump and load function for SRC_URI files.
>=20
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller=
.com>
> ---
>=20
> =C2=A0meta/lib/oe/vendor/__init__.py | 28 ++++++++++++++++++++++++++++
> =C2=A01 file changed, 28 insertions(+)
> =C2=A0create mode 100644 meta/lib/oe/vendor/__init__.py

Initially I was going to ask there to be a "fetch" or "download" in the
namespacing. That then made me wonder if in the interests of clarity
and namepacing, these vendor classes should go into
lib/bb/fetch2/vendor in bitbake?

I appreciate the class in OE will use them and separation into bitbake
can be a bit awkward but it would mean we don't confuse this with any
other kind of vendoring, it becomes fetch specific and it places them
alongside the fetch code, which it will need to remain tied to.

I do feel we need to namespace them though as vendor is not specific
enough to be directly in lib/oe.

Cheers,

Richard





