Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07242C19F32
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 23:36:35 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.4264.1740699389033666012
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 15:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XKhXVpw1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-390dc0a7605so841352f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 15:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740699387; x=1741304187; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c+fpLEEa6ebrLh0Lgxq8llKydtAEgZV/MIdRuIHMjD4=;
        b=XKhXVpw1E+77xd4I3Jt86XWClVlEP2Q5BZHbu0tLUZtm7QuzK0Z2SqXx199cMbrFiR
         yf4ecHSD1NUxt1tYR31h91XeKbzfGzrfBSgwzTJKo5q1Zz8AEHt3bHC8idUgCECnemYn
         ZirV17wAXqQHGtDkVUHH/XerjLSjGL29PfpJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740699387; x=1741304187;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c+fpLEEa6ebrLh0Lgxq8llKydtAEgZV/MIdRuIHMjD4=;
        b=K89vFZYUdJv1GuZM/NgBHTebu3M43CWsxGRwhUqgtOuas40CVOkzuty3wRArbzUNs6
         yd2dyWk+G6SgGbYe3tzW3QhqBf0IpLkn2rWlSfx9pa2fwP0g3lU2AiC/cQhiQAEQChro
         cIuKs0jsGrAUmIquEekf+Y+4YCHj73UsTs4DE8pVPoOQAGNzkhIp6wQH1T2qLDouHw2J
         cVptJLY1TXnZ99TQH7kHQdX1la1Y8l3KgtcK8wlhXPuGt2Kj6zYOBR9xzYVUL7/7qzTM
         1Lx86BR/i4Msz1n26x5DZtfVG5rGtoXLg/t2cwz3Azjs3jna+f0dxnjkTIQhV7l20ulK
         +iOA==
X-Forwarded-Encrypted: i=1; AJvYcCUpJzGvNba8txMVeBhoMi8lMc8/34XkMrloNIvQFjdn849wVHi4lIK1Fv1UP5ZjK3pjlSrU6QNirrYoEsL+F7i4Fw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy4Ub2StL+WIuq2iq2S5ShhRKXwgBIWrIEWcbosOMgKk9OShOt5
	dnPSLQDTiTaiImxkrS0MDqSUzNr7lVdTktCSSag/Rg8sv1InTr1zQ76EyMZM9Hg=
X-Gm-Gg: ASbGncs/uRyox14AZim23FwjedulEMKI2eecNWTuF38X9e8bq3+BSYm64lerHrZ8SG3
	XAPKyFm2pghlB8HaDPGN2W6wRJbRVvH8TQ9eGwM/GOJ9cWAijhmyux8xbdSmPS28axg31sskf2p
	QSdrPyqvDVupoFnoWmzwusKQ6lSQ9XtZmE/uxXMjRcpQUGRep83F4XhI0zMQYQJDEO6frkQbx+L
	mDNhBwL/O3erCDkyOjROFtkxm8TrJEGNlXklY/dS78ZYo1Q4eNLLm1J9IS8p0Z4XHCTMYqW5Atz
	sB1KdfbcVPM4DsfPTcuFOQmbtfuUZ4bi9Mrjh4kyHl61Cqw+tScbqbSaNFqBN2c2R+I4zDfCVX2
	NkAUneX9I2C3RxZI=
X-Google-Smtp-Source: AGHT+IGJZtWDW9InDHImxqrdbUUnP8d2fTtWai95dSfeP8LpVaTXppTBajyzcbqzHvPQzfMrit1WwQ==
X-Received: by 2002:a05:6000:154b:b0:38a:615b:9ec0 with SMTP id ffacd0b85a97d-390eca38144mr886830f8f.54.1740699387099;
        Thu, 27 Feb 2025 15:36:27 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:26a3:608b:106c:59dc? ([2001:8b0:aba:5f3c:26a3:608b:106c:59dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b7371b004sm36576985e9.24.2025.02.27.15.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 15:36:26 -0800 (PST)
Message-ID: <49ac1b8e0331f764930d16592e9e11a3370c7e4f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] rust: Upgrade 1.82.0->1.83.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: deepesh.varatharajan@windriver.com, 
	openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Date: Thu, 27 Feb 2025 23:36:25 +0000
In-Reply-To: <20250227134340.144081-1-Deepesh.Varatharajan@windriver.com>
References: <20250227134340.144081-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 23:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212043

On Thu, 2025-02-27 at 05:43 -0800, Varatharajan, Deepesh via lists.openembe=
dded.org wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>=20
> Rust stable version updated to 1.83.0.
> https://blog.rust-lang.org/2024/11/28/Rust-1.83.0.html
>=20
> Renamed and modified the below patch to adapt the new version.
> rv32-cargo-rustix-0.38.34-fix.patch->rv32-cargo-rustix-0.38.37-fix.patch
>=20
> Modified the below patches to adapt the new version.
> repro-issue-fix-with-cc-crate-hashmap.patch
> revert-link-std-statically-in-rustc_driver-feature.patch
>=20
> Dropped: zlib-off64_t.patch
> https://github.com/madler/zlib/commit/a566e156b3fa07b566ddbf6801b517a9dba=
04fa3kq
>=20
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

This nearly works but we're seeing:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/1089
https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/1018

Cheers,

Richard

