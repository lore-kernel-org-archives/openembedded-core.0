Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53071.1795438879196741593
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 05:01:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=EWtaUBd1;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CE8234E41648
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 13:01:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A4978601E1;
	Mon, 23 Nov 2026 13:01:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 001A111E68355;
	Mon, 23 Nov 2026 14:01:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795438876; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=vLzLahWVLwz6Hp8+GYsLjKUdy5WDbFRwom5KZY0DKTM=;
	b=EWtaUBd10HTtUjr/8C4eTGdAgi0ZYK+hhFOlF/bL9RDk3Pj3LviB432M1qPf22LjAO6tFE
	ZEil/HIlZ3eydeHBRDQdxADCyjIt2WIsCyiDFO37ID/8/gDWHSQR3WOkZhOe32iZmsZQ5a
	Yo4nuCv/VY+JsSz6tAlNxJtkcBnE/bHtU5OA969frBgdRcQyEZisNXLwtKaqtuH07RMbTf
	7fluA0x9mw0xQtk6GGRj1vWGWpxUBFCRaesEBs59FKRSc+omaV1hBxSp9fBZb/7CdeeFeJ
	oIWI+NmQ4S4RcqDdY0DG8pTHK5IOU8fKjY+DEKxvPUQWXBURr/yS73Igq+BUyg==
Message-ID: <4e328f5d-191f-45e7-a487-1a9b14ef557f@bootlin.com>
Date: Mon, 23 Nov 2026 14:01:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rpm-sequoia: skip flaky
 policy::tests::signature ptest
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>,
 openembedded-core@lists.openembedded.org
References: <20261123123424.61533-1-jaipaul.cheernam@est.tech>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20261123123424.61533-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 13:01:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250914

Hello, Jaipaul

On 11/23/26 1:34 PM, Jaipaul Cheernam wrote:
> policy::tests::signature fails randomly and reported
> upstream as rpm-sequoia issue #119. [1] and updated Yocto test logs
>=20
> [1] https://github.com/rpm-software-management/rpm-sequoia/issues/119
>=20
> ptest logs after skip:
>    ## starting to run rust tests ##
>=20
>    running 1 test
>    test symbols ... ok
>=20
>    test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filter=
ed out; finished in 0.01s
>=20
>    PASS: /usr/lib/rpm-sequoia/ptest/symbols-478593ba8da2eb3f
>=20
>    running 2 tests
>    test tests::merge_certs_mismatch ... ok
>    test tests::merge_certs ... ok
>=20
>    test result: ok. 2 passed; 0 failed; 0 ignored; 0 measured; 1 filter=
ed out; finished in 0.01s
>=20
> [YOCTO #16532]
>=20
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>   meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.3.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.3.bb b/=
meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.3.bb
> index a91a952f261..f63a5a04027 100644
> --- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.3.bb
> +++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.3.bb
> @@ -23,6 +23,10 @@ SRCREV =3D "8e0b76e1e75c83d7d8e6f38976b0c83b52ebe7ee=
"
>  =20
>   require ${BPN}-crates.inc
>  =20
> +# policy::tests::signature is flaky in 1.10.3
> +# https://github.com/rpm-software-management/rpm-sequoia/issues/119
> +RUST_TEST_ARGS =3D "--skip policy::tests::signature"
> +
>   CARGO_BUILD_FLAGS +=3D "--no-default-features --features crypto-opens=
sl"
>   CARGO_INSTALL_LIBRARIES =3D "1"

Thanks for the patch.

Reviewed-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>

--=20
Best regards,
Jo=C3=A3o Marcos Costa

