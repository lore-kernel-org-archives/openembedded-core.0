Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B320C5516D
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 10:56:33 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4037.1785495386117153012
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 03:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=y+Zmer+a;
 spf=pass (domain: siemens.com, ip: 52.101.83.70, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpOQwp4LkRD5ODk5gG63VtnrtBHcPGK8pWtVPJXY+JBYQVC/306OLlXJUTsZXILF7JkIuJBbTJZduJAUPVi4aA1hm2AqyOqAAwehQ35L9AtdfSgj8s5LSkz0fSDZafWpglDDIg/76VsE+hF6ksHY83GRC8e0GO6NE7q1TXhhuMvgSbuq6fJ2dt9qnHGjBk1ygyyRPr8KB1zcOReRw2o1PX8h6wR6elHv7iFrK0cmaxieeT/5UDKECd1frFpEsXE9VOxE1W8P0za0K4cACX+2gDuUbQPrSTWrBGgQAwGCTrXSfCtwQLmIhLFEDiCwBB932lMKXeRopQMpuiFU7lX4xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sjt8qhsrflqxIjE+L54VvrSowbqH9SYfseKGliiFE6g=;
 b=utDCNOaOd/V3WEL7F1IUUwL3rY0aQ70UvDg0erdxHsWLJzOp2dZ+zoXb8g57HjEL9ILM3MTVCfuFiXK0+aEAGdafQBUEyYPFsoSV/2B5JGEhY8OvRkmvVaEM3s/twxSeTeV36yIsVVh1PcEun2Egv4Xi/qVz95oOudfMwxa/9ua1tZBgmrQJt1P3UVd9T9rX2tcASFU9wo0cSpum4gJ2lFrILb1MmBYgjUJoS+ciW/JjuDT/vCD4t2JkY018mJA3qM45PzpDWpvM+PnkVsjdd/PSuAArBS8Hv6aV2eWORR+qIAsLeEyZtVYvJDHnDu0+vczTv3MjsAK8/TqgBVJggQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sjt8qhsrflqxIjE+L54VvrSowbqH9SYfseKGliiFE6g=;
 b=y+Zmer+aGIKZF2mc0ATR6fG5ScCUIcH7vnpZ+MwmPBNWGIAHCtR6nG7L0x8v1wXEe866bzMsQtRTFtVkKD/Cyi65xYu0h+eUfIsoVIejOKkkW6fRc6Hs1dQ/pcoXhuarPAAe65GgiuH862xL/wO4Hd+B9Cnt+5gfiqrOCCKhQJ1pwvQLGt59mfj+Ik8Pkws62XEBIwqkA651SY8VXfHtkY0ktTlIDdd4+GJ2c9zcpqPxOSSjAd4TxFLeFqwnFSKdfQ9GivkVl619Ky6IKU8WuRdGuyVboZO6/gMqMqaBilw6kiGllzUuScc/RgcZkpMvmjZrGVFNtUc9q+bAubrlDw==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by DB9PR10MB7410.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 10:56:18 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 10:56:18 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] glibc: Ignore CVE-2026-5358
Thread-Topic: [OE-core][PATCH] glibc: Ignore CVE-2026-5358
Thread-Index: AQHdINnKdwTkjzQCnE29RnozZtsX+raHdCkQ
Date: Fri, 31 Jul 2026 10:56:18 +0000
Message-ID: 
 <AS8PR10MB50735F0BDABDFCA84EA8283AFDC82@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260731103554.617510-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260731103554.617510-1-adarsh.jagadish.kamini@est.tech>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=69124a2e-cd2d-4a93-ab05-28d5e9316a33;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-07-31T10:54:17Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|DB9PR10MB7410:EE_
x-ms-office365-filtering-correlation-id: 34c358e8-0dc8-44b3-b6f1-08deeef259a4
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|11063799006|56012099006|18002099003|55112099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 rmPxbWZsFwju8csqPLJ04P+toKp8gSn2zk1sjreUsVwFO5qZEtXEqGfrBHzrNudxqm5VvrsGKqEn3U0ZCvkQk/UwpBf1kXX6uk/cZRbu9nOl3IWBf9oFbFGHpoCYE0WqPLL5ip/RT8C7oUeB+sDeEyI1X2k4+ERfu9HybkXW4JhJUqkJZFJyiLuQYDIVCiO2EGp2imsc5d60UHeruuRjOw1daOpCQW/3tZju7Tmlk4FxJTE/PJZvR7eTt40+kLZftEwPP01Vd+mtdroS/3n68oxMl86ifrL0JD1uCVDkg5rm6UcUcH0/oZGhRxoUSSmU0BK/5r395iCMhBDFm4gJeXyLEITMCdul3xWlZEQBgJYiumNhcxitEnzwssjxT19ystRvVPo6+05MVm27tcODYCcmK7jp2T/4k6st/pLlK4KeqSIZjUsW/3b7EpshewTidXH2dZUGEvL0SLn/lP5VQSYP1tgyBUNCEfiNu/4CcHgf1o8+jQauZYdSwcmXUxNBSeeDsdzrSlG8eSOHg0vjvtKlDUqs4ZEESMoevt9TNzlcGHchVVNy+in5lRVDrbzVtAZCNdIJVCJEnqwLcuj3PgYkFJeLNdrjIGKEgg75LrYPzygMI7b1MC8rB4qTnsrt6UnP2Q5dmSYfczT8J0HyrjN9Q0dR6QipGulqYl8blSQXf9//odKzh12QBSENkEybruTw3eUslstTklbZCOmnMzwQyRX+cSzc/xyI9Ddc7bs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(11063799006)(56012099006)(18002099003)(55112099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ZsfSCvgm4GNPzHoK6s5XpjR0gIFXRlplIidgHRq0Ax7bFYii0cAG/XBFSC/n?=
 =?us-ascii?Q?YJPPcE0BMiZbJTugstmzbX7kJl0BDxMHFFBLAPquh7JXHS6EJNO+EIeT3mmZ?=
 =?us-ascii?Q?xHtiPrKAQTiA5BYvTpWl8xK63hdesk/DrWl+OfueBXDc0qyGhOi7D43s3KtG?=
 =?us-ascii?Q?VC8lzs4sLM9EUjJoiAI4ISMhTzTvhievl443JIGJvdRGMpLqruSjEkvLV/KK?=
 =?us-ascii?Q?98AMcQ65XeGcQGOH0iCl9r/++p6bkjsD9c862EwJtPxzSLV/Zodz1r2eCds7?=
 =?us-ascii?Q?MQf32pNZcgU93vdkntTs0lga2cYmO6sm+KQNycbwXXWe9kjaQiBpQgtznDXC?=
 =?us-ascii?Q?QAKQMI1h34zgL6Vx7icshIyfXbbeSJUSVuReVq1wZ2Zgr8oRRMSw7Iy/r5L6?=
 =?us-ascii?Q?T/dTpxrVJ7EbwOtvKfuYjw5b5weuoVALRbtUczubgOJWQ1aZeD5cMvTPicAx?=
 =?us-ascii?Q?DhsvLNZUOtxz57Y8p4xfgwi3Ct/VXXjd9sJetn+9bA2PWl8mz/rvEwL3C6zG?=
 =?us-ascii?Q?EaQ1vOTXeJQFLIgPFy+RXVEvV5M1lESnZ9yRbMVwjDBK1Y8okdrvO4DwB6Ig?=
 =?us-ascii?Q?E/4fXn4g8yY2AXRPEUoh43+sW8aS3HPeT1eEBITKk8QAM6vQGmuQXtNaWRNT?=
 =?us-ascii?Q?SNk/EVGlF4h7pcX+1ULHhmgY78TQW18mwl01EUpJMYg5uesRk+GCiIBiwcOY?=
 =?us-ascii?Q?fsZAgncg+tuV2Kff/8GioY3g1+YwST69/oMuVyPvpGXzhap8MA+m21foIp1b?=
 =?us-ascii?Q?ycWgVaJARxi9rhCqlN+gWh5nVGjAwgdeAcoVRrP9LTVPZCqQrKHGVSqqrWCA?=
 =?us-ascii?Q?1cDypwRi/CnUHvznCLRSbfbL71tZ62W0RQJfOQBcHBepXEyvPKH5K1UypqGh?=
 =?us-ascii?Q?6xNtV/uIg4547DYaXSxUrfNyc2SrlIybhIxifvcpNw5aMEPZqk+HhKYl+U1T?=
 =?us-ascii?Q?eMuC1zjPeHpNFehAIJ6IA+9AzQXDRFR1YOJRJ+iPE9pMmYL3Vbkd37HRVdR1?=
 =?us-ascii?Q?PBMMvDQs5fPYhImmqr9lJGsuCaAkAJNJTXoiyocw208QnEkTrSaVOYbxo4q1?=
 =?us-ascii?Q?Fq8N2Ek32ny6YdQc/Q+uS/dBpEFw1OJIh98FwgOGwuoJW4Vi1FtZM2vQucCM?=
 =?us-ascii?Q?/IMwoJU4C1LbIG8r4bR5uHtsQM0enwEG1DR+YadUs6XZql5ygX4TQOpd32Dh?=
 =?us-ascii?Q?FS8FN+PNecGUlbhz5D3cpFtXD1BOryNPc3ztqycLd6tcSFIf3eayMG9Z+D2R?=
 =?us-ascii?Q?Q64U1kNO11wngzOuLRgZ38HeGoZhYQ6R1urnf6pBfWXrzclBeHCxigmbu/f8?=
 =?us-ascii?Q?8zCg2DOGfRfONJbBfyvReKwtK8exLtgz3Vs7tvgpsrOdADjc/xjPSgAZWato?=
 =?us-ascii?Q?qu5F7Z6phYmFz/p6KYr5KETP9fkwjk/LorIRRJLQxb8WxjDt+WFCV6L9WGiB?=
 =?us-ascii?Q?59Xi2R9miDw29TLno/vqQcIcNEn0wvBD3f34YKUmluvwVPIExUO8biSqZK68?=
 =?us-ascii?Q?HmhUH4zWw+RBB5g/L2ptHtK44TxlT2TwS0J0aNGB6Bsn9w/IR6ob7HW8epUK?=
 =?us-ascii?Q?NOfeCo+dFOoVvs/jVzvGU49CjAfmscpyHWsMLPnwuV145FuWNnYjILlGi4oU?=
 =?us-ascii?Q?LDjGBHhICxGgfYXjMXpsH9yQhGd/izkjyMApXktzB9xeO0Ow35PFmQGHVwJQ?=
 =?us-ascii?Q?VAUbt6bHkJc39iQqaZSRcNTr2Chj34fDfJLSt+iRO2Td6jD4s91HlpJosFbY?=
 =?us-ascii?Q?by2sjTJz8g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c358e8-0dc8-44b3-b6f1-08deeef259a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2026 10:56:18.6103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RJIVXoZw/NPUzttZC73d+EoQ9ggAzH1z6WVDAyPcv00v09zfKPesfGOlShL8NCWrWY5z0FVnSIRY3XJ21DKJhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7410
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 10:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242429

This CVE has rejected state in all DBs that are used by Yocto cve-check/sbo=
m.
There is no reason to also carry this annotation for it.

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Adarsh Jagadish Kamini
> Sent: Friday, July 31, 2026 12:36 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core][PATCH] glibc: Ignore CVE-2026-5358
>=20
> This CVE has been marked as rejected upstream.
>=20
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D34067#c6
> https://inbox.sourceware.org/libc-alpha/20260421164416.4031726-1-
> carlos@redhat.com/T/#mf76c27025e603294611196b90e428769c9fc5a4e
>=20
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  meta/recipes-core/glibc/glibc_2.44.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/glibc/glibc_2.44.bb b/meta/recipes-
> core/glibc/glibc_2.44.bb
> index 9c93c05fe9..97446c12e8 100644
> --- a/meta/recipes-core/glibc/glibc_2.44.bb
> +++ b/meta/recipes-core/glibc/glibc_2.44.bb
> @@ -4,8 +4,9 @@ require glibc-version.inc
>  # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-1010=
022
>  # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-1010=
023
>  # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-1010=
024
> +# glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-5358
>  CVE_STATUS_GROUPS =3D "CVE_STATUS_RECIPE"
> -CVE_STATUS_RECIPE =3D "CVE-2019-1010022 CVE-2019-1010023 CVE-2019-
> 1010024"
> +CVE_STATUS_RECIPE =3D "CVE-2019-1010022 CVE-2019-1010023 CVE-2019-
> 1010024 CVE-2026-5358"
>  CVE_STATUS_RECIPE[status] =3D "disputed: \
>  Upstream glibc maintainers dispute there is any issue and have no plans =
to
> address it further. \
>  this is being treated as a non-security bug and no real threat."

