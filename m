Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EF2C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 09:26:16 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27122.1785144369279746964
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 02:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=rRA4GLLa;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CD1D84E40F95;
	Mon, 27 Jul 2026 09:26:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 86AE3601BE;
	Mon, 27 Jul 2026 09:26:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 486F411C12325;
	Mon, 27 Jul 2026 11:26:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785144366; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ciPm1cyV0y3ilR2GYQG0oz4mj+QOx0JZWGqVyD1twwQ=;
	b=rRA4GLLaRcWu0+m6oBvrPpdOsHataOF6W4djr8hjHUg/zpk/BhnkER2cHFkAQK2NPc4l+c
	4iiYhC/KJykJ3rz5Jl/W8ie6mrCCT5QIhgt60m/mVS/IAnNpZ6a0SKi6sN9LgEysF0HLTf
	AfZtab1DOxyAlybMMiTbgvh2qsa5KxfELBbaxiuZ0yB3nkApOHgBByj0ExOpD8DPcCcJKx
	HkwQOImJIL553B2+E536tPRJ/LHBMcrJNhDSs25s1GgtVFRMvGxkdmgLu7c5n+lSbfIKrM
	1grr7NKCT9AAVpJ2py6Y0hArguwYyibDU8QMpSLP+HBOpcXhbMvQmiQUmi6ZnQ==
Message-ID: <e567f71f-e5e2-4480-9094-f2ed0c3c0246@bootlin.com>
Date: Mon, 27 Jul 2026 11:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gawk: skip randtest in ptest suite
To: Himani Barde <HimaniRamesh.Barde@windriver.com>,
 openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, Shiva.Komati@windriver.com
References: <20260727091430.81858-1-HimaniRamesh.Barde@windriver.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20260727091430.81858-1-HimaniRamesh.Barde@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 09:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242073

Hello, Himani

On 7/27/26 11:14, Himani Barde wrote:
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
> Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
> ---
>   meta/recipes-extended/gawk/gawk_5.4.1.bb | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/gawk/gawk_5.4.1.bb b/meta/recipes-ex=
tended/gawk/gawk_5.4.1.bb
> index 56930498e3..5cfd4e61c3 100644
> --- a/meta/recipes-extended/gawk/gawk_5.4.1.bb
> +++ b/meta/recipes-extended/gawk/gawk_5.4.1.bb
> @@ -80,7 +80,10 @@ do_install_ptest() {
>   	# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14371
>   	rm -f ${D}${PTEST_PATH}/test/time.*
>   	rm -f ${D}${PTEST_PATH}/test/timeout.*
> -	for t in time timeout; do
> +    # randtest is a statistical test that intermittently fails on over=
loaded systems
> +    # https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16254
> +    rm -f ${D}${PTEST_PATH}/test/randtest.*
> +	for t in time timeout randtest; do
>   		echo $t >> ${D}${PTEST_PATH}/test/skipped.txt
>   	done
>   }

Thanks for the patch. Just a couple nits: you added two very similar=20
Signed-off-by lines (is this expected?), and the indent level of the new=20
lines doesn't match the original.

Reviewed-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>

--=20
Best regards,
Jo=C3=A3o Marcos Costa

