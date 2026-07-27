Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624D1C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 09:57:36 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27475.1785146248884708338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 02:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=kDbyr1lZ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8EDDD1A1281
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 09:57:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 54805601BE;
	Mon, 27 Jul 2026 09:57:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6607C11C125CC;
	Mon, 27 Jul 2026 11:57:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785146241; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=0fcy174GJRZ4kJYtT0MLwGatv0ToASVp8vy0eda/U3U=;
	b=kDbyr1lZsKjpz5NJHgwcjnpw6aLp5YSyePacZPGCMtKF3rv1R6AOlaFDPpvThUtXHPqkLf
	lCdDd9ZTgid+we1bDwy5TMmS/BLA7tNovNwsDIIkLI/JsvrZoJUSTSeAhuQPYxaEA/vgkQ
	3Njx71cNXle0YgUD1+0iG60vaI1CtWf5HCYfKJW+oCur916OhSPQPvrsgJSOE4gvPliMhb
	KsKSKbrw5NhpDKlvfrGYtrpGoRfsl+3tMKX9J/R45JrGosJPLEapEPwd3U8VsS99CvAUts
	CnUGQ3VXo+XXej1ipZtF3CDKBOlRFSHq3I2muDMzCRZ4kMYLSxK2OvCLlwCjWA==
Message-ID: <73ba7cda-3c94-4214-8b34-b171965904dd@bootlin.com>
Date: Mon, 27 Jul 2026 11:57:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] gawk: skip randtest in ptest suite
To: HimaniRamesh.Barde@windriver.com, openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, Shiva.Komati@windriver.com
References: <20260727091430.81858-1-HimaniRamesh.Barde@windriver.com>
 <20260727093530.83107-1-HimaniRamesh.Barde@windriver.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20260727093530.83107-1-HimaniRamesh.Barde@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 09:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242078

Hello, Himani

Thanks for the v2!

On 7/27/26 11:35, Himani Barde via lists.openembedded.org wrote:
> From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
>=20
> randtest performs autocorrelation analysis on random number sequences
> and fails intermittently on overloaded CI/autobuilder systems where
> CPU scheduling and floating point conditions vary between runs.
>=20
> An upstream fix was previously merged (ccabae3036a7) to improve sigma
> threshold handling, but the test failed again on qemux86-64-musl-ptest
> on 2026-07-21 with 'Tau=3D 162, Autocorr=3D 5.15181 sigma'.
>=20
> The test is inherently unsuitable for shared overloaded build
> infrastructure. Skip it, consistent with how 'time' and 'timeout'
> are already handled.
>=20
> [YOCTO #16254]
>=20
> Signed-off-by: Himani Barde <HimaniRamesh.Barde@windriver.com>
> ---
>   meta/recipes-extended/gawk/gawk_5.4.1.bb | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/gawk/gawk_5.4.1.bb b/meta/recipes-ex=
tended/gawk/gawk_5.4.1.bb
> index 56930498e3..89b73a1641 100644
> --- a/meta/recipes-extended/gawk/gawk_5.4.1.bb
> +++ b/meta/recipes-extended/gawk/gawk_5.4.1.bb
> @@ -80,7 +80,10 @@ do_install_ptest() {
>   	# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14371
>   	rm -f ${D}${PTEST_PATH}/test/time.*
>   	rm -f ${D}${PTEST_PATH}/test/timeout.*
> -	for t in time timeout; do
> +	# randtest is a statistical test that intermittently fails on overloa=
ded systems
> +	# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16254
> +	rm -f ${D}${PTEST_PATH}/test/randtest.*
> +	for t in time timeout randtest; do
>   		echo $t >> ${D}${PTEST_PATH}/test/skipped.txt
>   	done
>   }
Reviewed-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>

--=20
Best regards,
Jo=C3=A3o Marcos Costa

