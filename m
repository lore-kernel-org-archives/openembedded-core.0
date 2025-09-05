Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FE0CA1015
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 08:33:35 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.16423.1757061210237375244
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 01:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vmp3A8eX;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4B2131A0DBE;
	Fri,  5 Sep 2025 08:33:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1DFAA606C5;
	Fri,  5 Sep 2025 08:33:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86E54102F2376;
	Fri,  5 Sep 2025 10:33:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757061207; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lUUWday7kfheuwIY1mdEotvAJHHhxAQ+k2UDpnSki+A=;
	b=vmp3A8eXrl31inCMmhQ29/XwqakbOT0dCb/5Fn1cEPkJihCV91bw0rdgJh8SGuR/Ermken
	21gdp2kEqnBWANwuXXOkCyoey6Y5PGe8ltiWdscD3/k1sbSr0ufHy+3g+dQUxwKnBFHLmT
	b3BHL1f7k7jOx/6orq/sHxABJ8Y9JhGLYOUR7OmOaz+gFDHNZ/3IhGPV/iuWAyZ+KNPNpj
	jOBGMajM3Vc8qJrAa4Xj6GXaro+EVi5V5qVGJHxbCLfXyQ951Z0is33b/zimOhh/CgI/Ca
	gr6rYlvwtf3RVAQaEH9uA/R9AHoMu424abSPtftbPK8yz6pEgaZbjTNa2PRkqw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Sep 2025 10:33:13 +0200
Message-Id: <DCKQ7KX5D934.3FS2DI6M1I2L1@bootlin.com>
Subject: Re: [OE-core] [PATCH] systemd: stop enabling non-standard MAC
 policy when using the 'pni-names' DISTRO_FEATURE
Cc: "Adrian Freihofer" <adrian.freihofer@siemens.com>, "Peter Marko"
 <peter.marko@siemens.com>, "Ross Burton" <ross.burton@arm.com>, "Jose
 Quaresma" <jose.quaresma@oss.qualcomm.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <koen.kooi@oss.qualcomm.com>, <openembedded-core@lists.openembedded.org>
References: <20250902090925.2904294-1-koen.kooi@oss.qualcomm.com>
In-Reply-To: <20250902090925.2904294-1-koen.kooi@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 08:33:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222977

On Tue Sep 2, 2025 at 11:09 AM CEST, Koen Kooi via lists.openembedded.org w=
rote:
> This recipe enabled an additional, non-standard policy for predictable
> network names: the MAC policy. This is a deviation from upstream
> policies and in cases where no MAC address is available, it makes it
> actively worse by changing the name(s) every boot.
>
> Change the logic to disable predictable naming when the DISTRO_FEATURE
> isn't enabled and only use upstream logic with it *is* enabled.
>
> For DISTROs that wish to use non-standard policies, a DISTRO layer is the=
 correct place.
> E.g. in DISTRO_LAYER/recipes-core/systemd/systemd_%.bbappend:
>
> do_install:append:DISTRO() {
>        if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'fal=
se', d)}; then
>                if ! grep -q '^NamePolicy=3D.*mac' ${D}${nonarch_libdir}/s=
ystemd/network/99-default.link; then
>                        sed -i '/^NamePolicy=3D/s/$/ mac/' ${D}${nonarch_l=
ibdir}/systemd/network/99-default.link
>                fi
>                if ! grep -q 'AlternativeNamesPolicy=3D.*mac' ${D}${nonarc=
h_libdir}/systemd/network/99-default.link; then
>                        sed -i '/AlternativeNamesPolicy=3D/s/$/ mac/' ${D}=
${nonarch_libdir}/systemd/network/99-default.link
>                fi
> }
>
> Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
> ---
>  meta/recipes-core/systemd/systemd_257.8.bb | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_257.8.bb b/meta/recipes-co=
re/systemd/systemd_257.8.bb
> index 174372be03..6399c57640 100644
> --- a/meta/recipes-core/systemd/systemd_257.8.bb
> +++ b/meta/recipes-core/systemd/systemd_257.8.bb
> @@ -400,15 +400,8 @@ do_install() {
>  			${D}/${sysconfdir}/systemd/system.conf
>  	fi
> =20
> -	if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'false', =
d)}; then
> -		if ! grep -q '^NamePolicy=3D.*mac' ${D}${nonarch_libdir}/systemd/netwo=
rk/99-default.link; then
> -			sed -i '/^NamePolicy=3D/s/$/ mac/' ${D}${nonarch_libdir}/systemd/netw=
ork/99-default.link
> -		fi
> -		if ! grep -q 'AlternativeNamesPolicy=3D.*mac' ${D}${nonarch_libdir}/sy=
stemd/network/99-default.link; then
> -			sed -i '/AlternativeNamesPolicy=3D/s/$/ mac/' ${D}${nonarch_libdir}/s=
ystemd/network/99-default.link
> -		fi
> -	else
> -		# Actively disable Predictable Network Interface Names
> +	# Actively disable Predictable Network Interface Names
> +	if ${@ 'true' if not bb.utils.contains('PACKAGECONFIG', 'pni-names', 't=
rue', 'false', d) else 'false'}; then

This could be simplified to=20

if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'false', 'true', d)};=
 then

no?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


