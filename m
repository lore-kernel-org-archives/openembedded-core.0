Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D81AC71155
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 12:56:35 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.29753.1750078590617962879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 05:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XWhLX4Wr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d54214adso34775855e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 05:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750078589; x=1750683389; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdJERrrG59yCHUmqztLJPtvYa2KgrckJANdraXZAuzk=;
        b=XWhLX4Wrkk4cfTXZKEewouUlXkoILxW0UP10sqGEqmmKJZru6OCbDPGTP4Mm9oS1+P
         y7icAPg7tV6Q8Sl6PYohRT+6uPKApFiKBBy4Rn+GH4Nw/YmNq5ym/Z4tYWsdzyXC1U9Q
         z3Zyxbxeqg8iYgNdgmn6KkNZEiYZf4PWcP1g0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750078589; x=1750683389;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YdJERrrG59yCHUmqztLJPtvYa2KgrckJANdraXZAuzk=;
        b=f+oGmQBi9ZF9/5fdwekOsD0KIDSiLLiti4lJ0VU8hdxS1S/tKQ8hwEx+qFgXWagqQe
         B6+jbAVcB1g7ofPGsHjNPN2FA96faNSzR9QdfJvwG6RcXpJE/GWIje2zsDuf45ioJJ2a
         HeKac1EeeDP459BAfkm1pDN5U5+rtYE5o2vxmHn97LN7McS04oTz4Loa/1CxUY3QPvZ3
         KMBwvGjZcpExq0Z+gKw38zeADghwIr2fU5N9sOuyoAKh4180UkstpbohXl7dlC1VzNDV
         7MkrPepHe981m6Hk1GxMN4MdYkadmOK3TMLPbrvVLTaf6iL8l7gC5hnEeQ+NE+21vIM1
         DG8g==
X-Forwarded-Encrypted: i=1; AJvYcCW5HWwtUDuMAKT8/bF0bxrGM5wg9HPjg46h4LmVCnHK8BivWyOAdgIebhnIZM7H3YCNm2NtQThOgf4URhu47Pl1jQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz3WAeU7ChS9UADhnHsIq6+fLvqrVU7QEFUbbcGB1SzmIAl7UnA
	7FRf/wlZv6yTuA5i8U5RKbIQrcX8kmxHsDZEmbbiXgK04lNPpCldTlZdyJW52WshhYw=
X-Gm-Gg: ASbGncvkReayA0S0tl8lmxUKoLtQ+Q3ydVNVkBinOTmMEStCY3m2FR+NqSJrok6zGoe
	PEhlaadEXVgJULe02g1BYT5vNac8wR3EGjM/VzrdTsYwRS7GMszrUEMBnl11hy6AhIFWJWM8Vkv
	Nx7Frk9uOMS02bbwndMpEd6IVrdys8RRBpY9E1WFSg/n04itdckjrVv0DqCZoa0dasOBkBE366S
	ztk0SSiJ4oOarpyBXbNfw71nJzYLbqB7On3vcE/OgaWkMVpZDMZuyNPnVM6f7XyAAId0aTyNEDs
	FyvlMdkzqxWHTXwtojpt7DfFhM7EkEFbHoyGV6ho/v6A0ZGDIu+nNoQoYJf5G1CXPS1SLP+0xc5
	AAt7JTTbnzM2XmasMj4WH+es9qLaFRXrOMfzF2AiCA+wbiX02
X-Google-Smtp-Source: AGHT+IFdd3nT5cWHmRH9AJF31R4tuGOxIbffs4KzCCC2kGmfyM68cZk5AOZ9SiITMqaM4fcQVoMx/Q==
X-Received: by 2002:a05:600c:1d06:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-4533c9bf9e2mr95132675e9.0.1750078588895;
        Mon, 16 Jun 2025 05:56:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a03:fc99:2a4c:41a2? ([2001:8b0:aba:5f3c:a03:fc99:2a4c:41a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e259108sm142608015e9.32.2025.06.16.05.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 05:56:28 -0700 (PDT)
Message-ID: <e57b93b0fd2635058ee3ff2bfdc76b1611b9b55b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 22/24] python3-typing-extensions: upgrade
 4.13.2 -> 4.14.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Date: Mon, 16 Jun 2025 13:56:27 +0100
In-Reply-To: <20250616091643.918-22-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
	 <20250616091643.918-22-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 12:56:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218821

On Mon, 2025-06-16 at 17:16 +0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
> =C2=A0...extensions_4.13.2.bb =3D> python3-typing-extensions_4.14.0.bb} |=
 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> =C2=A0rename meta/recipes-devtools/python/{python3-typing-extensions_4.13=
.2.bb =3D> python3-typing-extensions_4.14.0.bb} (91%)
>=20
> diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.13.=
2.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.14.0.bb
> similarity index 91%
> rename from meta/recipes-devtools/python/python3-typing-extensions_4.13.2=
.bb
> rename to meta/recipes-devtools/python/python3-typing-extensions_4.14.0.b=
b
> index 9c83ae6c61..1c03aacc10 100644
> --- a/meta/recipes-devtools/python/python3-typing-extensions_4.13.2.bb
> +++ b/meta/recipes-devtools/python/python3-typing-extensions_4.14.0.bb
> @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfcf6b249c264=
1540219a727f35d8d2c2"
> =C2=A0PYPI_PACKAGE =3D "typing_extensions"
> =C2=A0UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> =C2=A0
> -SRC_URI[sha256sum] =3D "e6c81219bd689f51865d9e372991c540bda33a0379d5573c=
ddb9a3a23f7caaef"
> +SRC_URI[sha256sum] =3D "8676b788e32f02ab42d9e7c61324048ae4c6d844a399eeba=
ce3d4979d75ceef4"
> =C2=A0
> =C2=A0inherit pypi python_flit_core
> =C2=A0

Something in this series is breaking ptests in large numbers:


stdio: WARNING: core-image-ptest-python3-xmltodict-1.0-r0 do_testimage: The=
re were failing ptests.
stdio: WARNING: core-image-ptest-python3-cryptography-1.0-r0 do_testimage: =
There were failing ptests.
stdio: WARNING: core-image-ptest-python3-click-1.0-r0 do_testimage: There w=
ere failing ptests.
stdio: WARNING: core-image-ptest-python3-webcolors-1.0-r0 do_testimage: The=
re were failing ptests.
stdio: WARNING: core-image-ptest-python3-wcwidth-1.0-r0 do_testimage: There=
 were failing ptests.
stdio: WARNING: core-image-ptest-python3-uritools-1.0-r0 do_testimage: Ther=
e were failing ptests.
stdio: WARNING: core-image-ptest-python3-trove-classifiers-1.0-r0 do_testim=
age: There were failing ptests.
stdio: WARNING: core-image-ptest-python3-rpds-py-1.0-r0 do_testimage: There=
 were failing ptests.
stdio: WARNING: core-image-ptest-python3-pyyaml-1.0-r0 do_testimage: There =
were failing ptests.
stdio: WARNING: core-image-ptest-python3-pytz-1.0-r0 do_testimage: There we=
re failing ptests.
stdio: WARNING: core-image-ptest-python3-pyasn1-1.0-r0 do_testimage: There =
were failing ptests.
stdio: WARNING: core-image-ptest-python3-pefile-1.0-r0 do_testimage: There =
were failing ptests.
stdio: WARNING: core-image-ptest-python3-pluggy-1.0-r0 do_testimage: There =
were failing ptests.
stdio: WARNING: core-image-ptest-python3-packaging-1.0-r0 do_testimage: The=
re were failing ptests.
stdio: WARNING: core-image-ptest-python3-more-itertools-1.0-r0 do_testimage=
: There were failing ptests.
stdio: WARNING: core-image-ptest-python3-markupsafe-1.0-r0 do_testimage: Th=
ere were failing ptests.
stdio: WARNING: core-image-ptest-python3-license-expression-1.0-r0 do_testi=
mage: There were failing ptests.
stdio: WARNING: core-image-ptest-python3-libarchive-c-1.0-r0 do_testimage: =
There were failing ptests.
stdio: WARNING: core-image-ptest-python3-jinja2-1.0-r0 do_testimage: There =
were failing ptests.
stdio: WARNING: core-image-ptest-python3-idna-1.0-r0 do_testimage: There we=
re failing ptests.
stdio: WARNING: core-image-ptest-python3-hypothesis-1.0-r0 do_testimage: Th=
ere were failing ptests.
stdio: WARNING: core-image-ptest-python3-calver-1.0-r0 do_testimage: There =
were failing ptests.
stdio: WARNING: core-image-ptest-python3-bcrypt-1.0-r0 do_testimage: There =
were failing ptests.
stdio: WARNING: core-image-ptest-python3-attrs-1.0-r0 do_testimage: There w=
ere failing ptests.
stdio: WARNING: core-image-ptest-python3-atomicwrites-1.0-r0 do_testimage: =
There were failing ptests.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/115
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1712
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1712

Cheers,

Richard


