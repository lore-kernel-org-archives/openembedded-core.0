Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF393C87FD1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 19:17:26 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.7725.1754421442158378845
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 12:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=JKZg13Bb;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 575JHIY94107927;
	Tue, 5 Aug 2025 14:17:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754421438;
	bh=7tGWpeDLSwbtHmwiQrgyMYR1Dh/t1GL3A9BKBaCJQk8=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=JKZg13BbHR37LxDiP1l2W1GE89OVH9UDG55CUGfketpJAaMfPEqqAP3U8SYlcd/p2
	 GZNNWDyAYaOlI9JNULP5Z5/4ItVLo3HSMW2nSXofvH/q1hQITMzpwo1rl/guJylNYN
	 myvuJSGCkz0oh+kGLwUkCUBzzIZgpYLrFLxqCslg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 575JHICh3793576
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 5 Aug 2025 14:17:18 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 5
 Aug 2025 14:17:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 5 Aug 2025 14:17:17 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 575JHHpn2628952;
	Tue, 5 Aug 2025 14:17:17 -0500
Message-ID: <6c199d40-063d-4760-9536-6fedef6b1672@ti.com>
Date: Tue, 5 Aug 2025 14:17:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] machine/arch-arm: Append TUNE_CCARGS_MARCH to TUNE_CCARGS
 conditionally
To: Jon Mason <Jon.Mason@arm.com>, Khem Raj <raj.khem@gmail.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20250805171619.1357193-1-raj.khem@gmail.com>
 <DBAPR08MB57986297CB7002A0526D376BF022A@DBAPR08MB5798.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <DBAPR08MB57986297CB7002A0526D376BF022A@DBAPR08MB5798.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 575JHIY94107927
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 19:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221489


Fixes ours as well.  Please get this out to master ASAP.


On 8/5/2025 1:55 PM, Jon Mason wrote:
> The patch below corrects the error we were seeing in our CI.
>=20
> Thanks,
>=20
> Jon
>=20
> *From: *Khem Raj <raj.khem@gmail.com>
> *Date: *Tuesday, August 5, 2025 at 1:16=E2=80=AFPM
> *To: *openembedded-core@lists.openembedded.org=20
> <openembedded-core@lists.openembedded.org>
> *Cc: *Khem Raj <raj.khem@gmail.com>, Jon Mason <Jon.Mason@arm.com>, Rya=
n=20
> Eatmon <reatmon@ti.com>
> *Subject: *[PATCH] machine/arch-arm: Append TUNE_CCARGS_MARCH to=20
> TUNE_CCARGS conditionally
>=20
> With [1], we now have a non-empty else block for arm-features, uptil no=
w
> feature includes only appended when feature was set and unset case was
> appending empty string, which hid this issue where TUNE_CCARGS_MARCH_OP=
TS
> could be non-empty but TUNE_CCARGS_MARCH is empty, this is possible whe=
n
> a tune file overwrites TUNE_FEATURES and does not have a feature that w=
ould
> add -march or -mcpu at all.
>=20
> This changeset adds a check to not append at all if TUNE_CCARGS_MARCH
> is unset.
>=20
> [1]=20
> https://git.openembedded.org/openembedded-core/commit/?id=3Ddb1b355b2b1=
5ba57bd89c2dfb88c2c667551863e <https://git.openembedded.org/openembedded-=
core/commit/?id=3Ddb1b355b2b15ba57bd89c2dfb88c2c667551863e>
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Jon Mason <jon.mason@arm.com>
> Cc: Ryan Eatmon <reatmon@ti.com>
> ---
>  =C2=A0meta/conf/machine/include/arm/arch-arm.inc | 2 +-
>  =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/machine/include/arm/arch-arm.inc=20
> b/meta/conf/machine/include/arm/arch-arm.inc
> index f1e92e19c61..ae661b1ab4f 100644
> --- a/meta/conf/machine/include/arm/arch-arm.inc
> +++ b/meta/conf/machine/include/arm/arch-arm.inc
> @@ -17,4 +17,4 @@ TARGET_FPU =3D "${@d.getVar('TUNE_CCARGS_MFLOAT') or=20
> 'soft'}"
>=20
>  =C2=A0# Some -march settings need a +X option passed in.=C2=A0 Since w=
e cannot=20
> guarantee that any specified TUNE_CCARGS option is set in any order, we=
=20
> must hard code the order here to allow for it.
>  =C2=A0TUNE_CCARGS_MARCH_OPTS ??=3D ""
> -TUNE_CCARGS .=3D "${TUNE_CCARGS_MARCH}${TUNE_CCARGS_MARCH_OPTS}"
> +TUNE_CCARGS .=3D "${@'${TUNE_CCARGS_MARCH}${TUNE_CCARGS_MARCH_OPTS}' i=
f=20
> d.getVar('TUNE_CCARGS_MARCH') else ''}"
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

