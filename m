Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id EE3E760E49
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 09:57:14 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so5941289wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 01:57:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=nmPIXWbW0/Aizc4w3J6QHbgctPYorpATTkmsJYnvyj0=;
	b=avSHH//yhdWQP9Rl9ok9EmKO6bnAJTGmdvV4HkJUZkTyk0PX5ALTdEeyfbgv1Wshg5
	jcu6KwE+xGLK+Q9sfkiO6E3/9fShuy7NuaL/ju2fEBKOMt6qAQbJeD9JQQjgAuQpFLjg
	bLAXTXiks1R6UXHg8RkGKTRXeiBSLoeKOpdMKt4KF4AfyGM+L78yfryqtA2OevUnO5yi
	v3q0QLTmLFqtO2W38SnhEId5CeEA7kd6SuSbCRjocU5ya53Fs1l1QIt96aEbHY0Jzwsu
	UuFda2WGeBWNdPdw86p29cOTAFDBEjfhJImDIoTNvJNbegGDhw6hyyBRTqh+7STr1dEd
	0YeA==
X-Gm-Message-State: ALoCoQneNHRHmpL6Cm+rM8vF4Jzs2IkhoJF688vbzt/PGp1ebHlDtch4AXyIouuEW9fpVoPuKrky
X-Received: by 10.194.216.162 with SMTP id or2mr46171562wjc.68.1415008634564; 
	Mon, 03 Nov 2014 01:57:14 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id cv7sm6634913wjc.3.2014.11.03.01.57.13
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 03 Nov 2014 01:57:13 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1411387952-22717-1-git-send-email-koen.kooi@linaro.org>
Date: Mon, 3 Nov 2014 10:57:11 +0100
Message-Id: <1C408B9F-5383-488A-AE4C-E18D69800825@dominion.thruhere.net>
References: <1411387952-22717-1-git-send-email-koen.kooi@linaro.org>
To: Koen Kooi <koen.kooi@linaro.org>
X-Mailer: Apple Mail (2.1990.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libpng 1.6.13: fix build for aarch64
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
X-List-Received-Date: Mon, 03 Nov 2014 09:57:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

ping

> Op 22 sep. 2014, om 14:12 heeft Koen Kooi <koen.kooi@linaro.org> het =
volgende geschreven:
>=20
> The configure override was too restrictive, it needed both 'arm' and =
'neon' to trigger, which breaks on aarch64. Since TUNE_FEATURES is the =
only qualifier that matters, drop the 'arm' override.
>=20
> Buildtested for 'genericarmv8' and 'qemux86' machines.
>=20
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
> meta/recipes-multimedia/libpng/libpng_1.6.13.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.13.bb =
b/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
> index 0c6fd1f..8798a96 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
> @@ -19,7 +19,7 @@ BINCONFIG =3D "${bindir}/libpng-config =
${bindir}/libpng16-config"
> inherit autotools binconfig-disabled pkgconfig
>=20
> # Work around missing symbols
> -EXTRA_OECONF_append_arm =3D " ${@bb.utils.contains("TUNE_FEATURES", =
"neon", "--enable-arm-neon=3Don", "--enable-arm-neon=3Doff" ,d)}"
> +EXTRA_OECONF_append =3D " ${@bb.utils.contains("TUNE_FEATURES", =
"neon", "--enable-arm-neon=3Don", "--enable-arm-neon=3Doff" ,d)}"
>=20
> PACKAGES =3D+ "${PN}-tools"
>=20
> --=20
> 1.9.3
>=20


