Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 72982725F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 19:30:21 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id h11so13394300wiw.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 11:30:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=6gqBcVlptPMnV4Yq5GJ4wrcChONKIBmvFj6k7QE6tMA=;
	b=cJ88qjX0Hiu7ZVxKl5+fePpxRpYZCTh3L6eX9YwrfTsF/QZPBmJkJEDpLfZJEYrKEE
	cuAK+Kut6Cflm4N7BRmz73x7g8UUi/o3XCBVyqIWibrLvpUWTc2Js+YDgBTlnuPC7N3O
	yozwJ184e22tz75b2i3w2t+FCu8+ChV2kDHHkENssR1JxUTXLa1mW4D8i5UI/vP578ZO
	8mlL0yx59PhsICnGRoSs1utPMtKnLh8ed3S9xUwOqSJDk7W79OnAzpYg92zRVVbJyu65
	5jdYy/rG5KNT2Or4lL1tzR2wuVpTbYJ+9kvD8At7yAosoBFAD+7evSL/bnhix7ygT6su
	RUyQ==
X-Gm-Message-State: ALoCoQm6xHtikwJ6oagmVRV0ckPir0M0eweb2wcys1vu6uzPI3pooAlPxjtN7Z3U2Fz7b9ofoC0N
X-Received: by 10.194.83.98 with SMTP id p2mr20580520wjy.125.1418758221886;
	Tue, 16 Dec 2014 11:30:21 -0800 (PST)
Received: from ?IPv6:2001:610:612::9a9:92aa:cd3f:5533?
	([2001:610:612:0:9a9:92aa:cd3f:5533])
	by mx.google.com with ESMTPSA id nb8sm3276819wic.7.2014.12.16.11.30.19
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Dec 2014 11:30:20 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <835687296e529e505a948421804d16259eb51d2b.1415350038.git.kai.kang@windriver.com>
Date: Tue, 16 Dec 2014 20:30:18 +0100
Message-Id: <D9FD4A25-6B2D-4868-B536-9593EFF79254@dominion.thruhere.net>
References: <cover.1415350038.git.kai.kang@windriver.com>
	<835687296e529e505a948421804d16259eb51d2b.1415350038.git.kai.kang@windriver.com>
To: Kai Kang <kai.kang@windriver.com>
X-Mailer: Apple Mail (2.1993)
Cc: openembedded-core@lists.openembedded.org, Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [PATCH 09/24] libpng: add neon option for aarch64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Dec 2014 19:30:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 7 nov. 2014, om 09:51 heeft Kai Kang <kai.kang@windriver.com> het =
volgende geschreven:
>=20
> Add neon option for aarch64 just as for arm. It fails with:
>=20
> | ./.libs/libpng16.so: undefined reference to =
`png_init_filter_functions_neon'
> | collect2: error: ld returned 1 exit status
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
> meta/recipes-multimedia/libpng/libpng_1.6.13.bb | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.13.bb =
b/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
> index 0c6fd1f..3d32bfe 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
> @@ -20,6 +20,7 @@ inherit autotools binconfig-disabled pkgconfig
>=20
> # Work around missing symbols
> EXTRA_OECONF_append_arm =3D " ${@bb.utils.contains("TUNE_FEATURES", =
"neon", "--enable-arm-neon=3Don", "--enable-arm-neon=3Doff" ,d)}"
> +EXTRA_OECONF_append_aarch64 =3D " =
${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=3Don", =
"--enable-arm-neon=3Doff" ,d)}"

You're introducing the same bug in a different way: overeager use of =
qualifiers. Just drop the _arm bit and it works.=

