Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81670CCF9FC
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 14:16:27 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.26242.1761833778675904322
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 07:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U53HtY6E;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47710acf715so6064655e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 07:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1761833777; x=1762438577; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvaSofidPU60IXR0IaYbi6B7LTWby5Mz+6fcH+pAcjc=;
        b=U53HtY6EqoMBoZSsKxW+KK1Em33Ww4gBaND+ih4YyTWdbtEksbhslxxuu1yxiFQ/Vo
         rnmSKQJDjc4FkGYqIlDIIl9oRmDETUHwSSNQEowg9ix3+oStJaQc5zFHJkIc9vs29CM6
         bk17DJu4WPOa88K9o3DPDn+XHx0k3unEsSmAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761833777; x=1762438577;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QvaSofidPU60IXR0IaYbi6B7LTWby5Mz+6fcH+pAcjc=;
        b=FZq7/BovfvzWITlAUgvIBfPlpR1V7/InmOK19fBSKfZiEmrfOJQ+3Z3Yp2svtoxHZJ
         p3TvDhsZ1kiXdS/jJO6H3Us2gYGC13gL+Jy6FALCmEdyQixvyZFuf/erL1HB0/1FK9h2
         pS4pdjzlcn3Ut78xsfHlWewgFRx2WV6uaaaHUBxGNu1ypg8ZcK6PzoVqMwhfkdHx9ZUP
         aTVAik03y5bRiHABq9EDiCXfuMBrbbeakc7NdouqZSuZuO1ihWpxh8xHaIrzNPl2XWan
         7oqLW4HvaBSJXdzpK80oDQtFtiLTzwYl1JUvoD0uuhiVcKMu8Q+QMOlf1IXgq1p+GgE8
         e1GA==
X-Forwarded-Encrypted: i=1; AJvYcCVHU7MOx3DzQSMpYaQnUhP5i5fiOj83xYVaMH4YlgDPf8yVfKCH51ZvcMPCXfyUK6M35l7a+V6goax9q1+GOfY8iQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx2rsH02Zh17QyGaa4Nkzm/X1NkLGtP7M7jY9o3Mw2eJ1/wH+ae
	qny0ek8TWC8DtHHfTS6SufJMaBGEOXvXBVgZ5WIbmws+Rm5BABZnrKSfXRUkq3LFb5w=
X-Gm-Gg: ASbGncvKXO/U86WR9CNU3Dqr5efn8Jj1t7u8BSNd0xhbVATiiZwBWujFyMq4my9oKjm
	uZOCICWztv5zQIIJhHnV64bHUnTQDVXSZxXGxZKP6NGeBeFZKrkp/0jNJvp68bt+8TPjgGD97ms
	xWpLbms8whdkL6MFOS0xbAKMxKdLzsTbYcRweczGSGtiNhCwUPK3XZcnau/Ez5fwWRnOXwKwYrc
	T1k/8MKSXpGvvyzjOCKvSVsfwAxsg9n4SXVqUPlGrumufNQCwr+iJ4OU9jpGSVgZoRROvw9jQXa
	aTIPqn9gffOVPmhcv4/heHXpkHdJsWvlbzetd8ktRKl/l77pI77YmW9Lhgzc9BhLjJXAvP++Bq/
	I9ry+OtxvFvtfDww3G53BTUOFJp70DszqejIK7jomjN/b0adZnzPNsRfsMVXgceIVKmvtwpI3Wx
	FI8w+j+3hdMqPmrY1NlrgQ4gfLBzzLsDrMBY/ZW6Kr6fq7sQKMjVpmYrlnPbNtL9aI
X-Google-Smtp-Source: AGHT+IFX4qZ9+yTtD2hrc8mSV1bMI3RYBheZyjvXxHfx0VyaH/l9nxWljgnI5QbhtL/Z2PJVyor3fQ==
X-Received: by 2002:a05:600c:6303:b0:46e:4329:a4d1 with SMTP id 5b1f17b1804b1-4772675fffdmr29575295e9.4.1761833776941;
        Thu, 30 Oct 2025 07:16:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:140a:6934:991a:a17e? ([2001:8b0:aba:5f3c:140a:6934:991a:a17e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477289be3f9sm45281695e9.12.2025.10.30.07.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 07:16:15 -0700 (PDT)
Message-ID: <0108bc7fd4700b706d41945fe76b9d843f91df98.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] rust: add missing zlib and zstd
 dependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.tatrai.ext@siemens.com, openembedded-core@lists.openembedded.org
Date: Thu, 30 Oct 2025 14:16:15 +0000
In-Reply-To: <20251027102900.65173-2-peter.tatrai.ext@siemens.com>
References: <20251027102900.65173-1-peter.tatrai.ext@siemens.com>
	 <20251027102900.65173-2-peter.tatrai.ext@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 14:16:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225494

On Mon, 2025-10-27 at 11:28 +0100, Tatrai, Peter via lists.openembedded.org=
 wrote:
> From: Peter Tatrai <peter.tatrai.ext@siemens.com>
>=20
> Use WRAPPER_TARGET_EXTRALD to pass '-lz -lzstd' to the target linker wrap=
per,
>=20
> Rust's internal LLVM requires zlib and zstd compression libraries when
> building rustc_codegen_llvm and other compiler components.
> Without these dependencies, building Rust for PowerPC target fails
> with linker errors:
>=20
> =C2=A0 error: linking with `target-rust-ccld` failed: exit status: 1
> =C2=A0 =3D note: undefined reference to `compress2'
> =C2=A0 =3D note: undefined reference to `uncompress'
> =C2=A0 =3D note: undefined reference to `ZSTD_decompress'
> =C2=A0 =3D note: undefined reference to `ZSTD_isError'
> =C2=A0 =3D note: undefined reference to `ZSTD_compress2'
> =C2=A0 =3D note: undefined reference to `crc32'
>=20
> This manifested in oe-selftest failure on qemuppc:
> =C2=A0 oe-selftest -r rust.RustSelfTestSystemEmulated.test_rust
>=20
> Fix rust-common.bbclass wrapper generation to properly split EXTRALD flag=
s
> into separate arguments (extend instead of append), making the wrapper
> mechanism work correctly for multi-flag values like '-lz -lzstd'.
>=20
> Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
> ---
> =C2=A0meta/classes-recipe/rust-common.bbclass=C2=A0=C2=A0 | 2 +-
> =C2=A0meta/recipes-devtools/rust/rust_1.90.0.bb | 5 +++++
> =C2=A02 files changed, 6 insertions(+), 1 deletion(-)

Why do we only see this on powerpc?

Cheers,

Richard

