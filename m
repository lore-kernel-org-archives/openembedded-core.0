Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CABAC433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 15:13:06 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.10668.1644937985589126912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 07:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.199, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpclient.apple (unknown [50.34.64.238])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 15D0BFF80A;
	Tue, 15 Feb 2022 15:13:00 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [OE-core] [PATCH] curl: configure with '--without-ssl' if ssl is
 disabled
From: Robert Joslyn <robert.joslyn@redrectangle.org>
In-Reply-To: <20220215125456.13686-1-ceggers@arri.de>
Date: Tue, 15 Feb 2022 07:12:58 -0800
Cc: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <ECF86DAA-5625-4F93-B0F5-18B9B7367D0D@redrectangle.org>
References: <20220215125456.13686-1-ceggers@arri.de>
To: Christian Eggers <ceggers@arri.de>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Feb 2022 15:13:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161753


> On Feb 15, 2022, at 4:54 AM, Christian Eggers <ceggers@arri.de> wrote:
>=20
> curl requires that at least one SSL implementation or explicitly
> '--without-ssl' is specified. This is particularly the case if
> PACKAGECONFIG is empty.
>=20
> | configure: error: select TLS backend(s) or disable TLS with
> --without-ssl.
> |
> | Select from these:
> |
> |   --with-amissl
> |   --with-bearssl
> |   --with-gnutls
> |   --with-mbedtls
> |   --with-mesalink
> |   --with-nss
> |   --with-openssl (also works for BoringSSL and libressl)
> |   --with-rustls
> |   --with-schannel
> |   --with-secure-transport
> |   --with-wolfssl
> |
>=20
> Fixes: eef6c45fc6ec ("curl: Rework openssl and random PACKAGECONFIGs")
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> ---
> meta/recipes-support/curl/curl_7.81.0.bb | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-support/curl/curl_7.81.0.bb =
b/meta/recipes-support/curl/curl_7.81.0.bb
> index c22a13cfea3f..e7219def18d8 100644
> --- a/meta/recipes-support/curl/curl_7.81.0.bb
> +++ b/meta/recipes-support/curl/curl_7.81.0.bb
> @@ -67,6 +67,7 @@ EXTRA_OECONF =3D " \
>     --enable-debug \
>     --enable-optimize \
>     --disable-curldebug \
> +    ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls =
mbedtls nss openssl', d) =3D=3D '') else ''} \
> "
>=20
> do_install:append:class-target() {
> --=20
> 2.34.1

Somehow I didn=E2=80=99t have an empty PACKAGECONFIG in my test set. I =
do now!

Tested-by: Robert Joslyn <robert.joslyn@redrectangle.org>=

