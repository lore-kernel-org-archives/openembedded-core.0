Return-Path: <aditya.gs@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820C6CD98DA
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 09:15:43 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.125669.1781514934793335854
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 02:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmwtechworks.in header.s=selector1 header.b=vheHIY/5;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.37, mailfrom: aditya.gs@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJ5mZo16tkjlttjyWGDEdek1geWc7F3+hWfoZUeDp2jz1fqeKmJGaRMVBhEaHEBs4j7EOqGYS75XKCfDutsBS+z06U9IZriAWVBX/znasUzX8ehsZMCB1f9WumR276l16svd5wsIBrc14kO7nBPPD3Q3Y8McoWh5f73xXoDhC4LNntTW5nWjTB8jnkcOVRm77tUxNfI6KwDU1jnMhUNoJKi/v7ZJEdEZ1rqlnDYwDmheCbygMRC2RJ+ZiZcozhkifApMUdeX8putlWDk/jEsj61ui2T3+xD/hddQCEW1K4YU71WVG5+DLNml6ky06PH/rNWjURiVXnptf3R9aZQpnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIq8/orcW72HQl7KOSZBfdOM+zqf7VVr5wOlzeGZGso=;
 b=ABmbFGw9GjCbAX2JoMrjUkexMc9YRzHMv13WN/IJt535Ux42NJRXTFiBAXN2kaAtjVv/QfCIdji8oy/qZuMik/EU4C+W8I7jurN2UaAplAIe3IzYIl23kDujEKu4WmkcsnZmbmCjLGoFrLb68kyI3Tl7+Fc5cOYTm0D3lqq841GNeUalbywstnlApKhSps4hBbN0x9RCHK4zQkclfe7HUmdQp8juva2LY4oGWJlthpLWAik1fmfXoL9HlG0JWDYhT5rjo0y5ZDpZpSsJ/jrp1NrRrQR81/dTmJgXusMDUOAAA2VJ+R8sHHv4/NKbmbWx8rGbmwFfzFHaBAJTEnxjyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIq8/orcW72HQl7KOSZBfdOM+zqf7VVr5wOlzeGZGso=;
 b=vheHIY/5B9RS3hkwZe6CEv7SnrUztBp0jHq6eOmwoCboqQvgfg9mFvkpLiLMc//GFam9MGhaRWoni2x4MNsm91XXzgF5hWMXrfVX88c7Ct1UmsxrPYdGirPQ2bXltJyGWXSxR/FBXSmiAAeW6U2UcUt7H5UdT2BVMpEElbJJ1UEyd97r7d9nZBgWZZ5nakLwi7sqi2OVyxIkRX3+uaFijWOjQ5pWgUkVte8eoBfkrMorOTLYgE4l2HVutln+QNHcI4Ch5EjkU5mkWXixFQVDLyM2KpZbXcrf0Kuwa7LzBY66aLsQyb6Y+o1MfzZEP0uBsMoeb9ocPFPjQoHovau5WA==
Received: from PN0P287MB1221.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:190::13)
 by MAUP287MB5535.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:216::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 09:15:26 +0000
Received: from PN0P287MB1221.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9fe:b41c:e003:e0b1]) by PN0P287MB1221.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9fe:b41c:e003:e0b1%3]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 09:15:26 +0000
From: Aditya GS <Aditya.GS@bmwtechworks.in>
To: Yoann Congal <yoann.congal@smile.fr>, "adityags2004@gmail.com"
	<adityags2004@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Parrakat Nisha, JD-8" <Nisha.M.Parrakat@bmw.de>, Suresh H A
	<Suresh.HA@bmwtechworks.in>, AshishKumar Mishra
	<AshishKumar.Mishra@bmwtechworks.in>, Nikhil R <Nikhil.R@bmwtechworks.in>
Subject: Re: [OE-core] [PATCH] openssl: upgrade 3.0.19 -> 3.0.21
Thread-Topic: [OE-core] [PATCH] openssl: upgrade 3.0.19 -> 3.0.21
Thread-Index: AQHc/KGnQ+MzV8ajrE643OxMkXz0cLY/Ud+AgAABQmc=
Date: Mon, 15 Jun 2026 09:15:26 +0000
Message-ID: 
 <PN0P287MB12213F647A0D7B19BC74E47CF9E62@PN0P287MB1221.INDP287.PROD.OUTLOOK.COM>
References: <20260615083317.2657-1-adityags2004@gmail.com>
 <DJ9I1H3FGLVT.387B1AALA6MXN@smile.fr>
In-Reply-To: <DJ9I1H3FGLVT.387B1AALA6MXN@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB1221:EE_|MAUP287MB5535:EE_
x-ms-office365-filtering-correlation-id: bd6a417a-66f9-4071-9a91-08decabea330
x-ld-processed: 970fa6fd-1031-4cc6-8c56-488f3c61cd05,ExtAddr
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|31052699007|39142699007|1800799024|56012099006|4143699003|11063799006|22082099003|18002099003|4133799003|8096899003|55112099003|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 1gMH1Qstunl/qnUidkpfiAtJH+4r7rRbYO4cImARbrvt0Z6XUtKvMOmQz14sTf/U2CbyIq3eWL2myjHeaYZvX9Qc91gXd7iAvima1N+D0hqOQB1hK00JZynxeI4HhpEtwar79vFkVDR23NEA1TZ+sy2n6vDjDaFBR+H9SXtEtQp+5RRPwydDJ0CscqSQQ3XDEN5Bjpz/6m/Sozn2H6TKdGb96GvbOMAz6Xu24P0hGTfaf/KPQLsSFMMaBaANn9uylIJL/eQDdHl46vSlmAcO7obMC8+O+LPiC9ZKCbl4kV4BFSq61K7pUo29peqKKdj/JMtr5Dz2g+4MHFARcbezyvk4swWQTYTHnacHFoebywZku1FrV8nD5gpdYG70ilQeHupyJrBPCHhSUVMgcJAJSlnriUYpbCeHnPha7wQ5e54MP44y30qR31gNg/3stWZ5PpT9QvkXAK52ORilZ0gyc+fkXQaSXO87RzX3ktCfA3K6NR5mB/ugcEbJfSNQ4o0Oc182rncRJNaBBft+QhzwqLLraNUp1J3dkA9Cl3wjVtGsDZ0WYDytOI1nKSpVBmQWdtofhmwcKJKVi7mIK0tbuNI0vn7sMz3JcRaFDjZeUtMhtTCicNAFds00VRMOemW4EpTP/3irfhiIgobqq860IMFpFE9CbQ8cVrv72RhJqzxRGooLut3+efe1JEbqLratRQIjciftKVPFDHyjy1Nj5Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1221.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(31052699007)(39142699007)(1800799024)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(4133799003)(8096899003)(55112099003)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?R1ocG8Rgd0HzaJ9Lgyw4rdexp2/hQR24pdHw8F5reFxoR0RErXiuNQeP6bKs?=
 =?us-ascii?Q?o5kQqgH/BzxAah6vlGoUjdbhTAmn1EEzKiHaLq8XYHdOFTyHT2o3uqpljrnL?=
 =?us-ascii?Q?RJXqKbMeX19TetrSmjVdTn9Z9IT06lwsFshcveOpraFMOY2g/HbigntoZvyM?=
 =?us-ascii?Q?UDmucJ034oD/hnr+ojTo44rARr8nZzE23dAHchUQtJep7wIXYrE/PCLi4a1I?=
 =?us-ascii?Q?DLmxB+xSVNnYrmFmCgfr1iKSI0kj+bGLFTBoevWbSKNrpSJTlALF3oBKx911?=
 =?us-ascii?Q?C4fo5oSGGqDJNyz/f/op9OfpHGQGV4jQk/bLHGtrYtdqdJkaDzdqvBWKsiN9?=
 =?us-ascii?Q?xIwCml9Uo5RDt58xP7P6cSKCaCCBrqr682+AbLvjRG1ezWUdDisnDNXdM3Hg?=
 =?us-ascii?Q?n8r7wTQg6qxSGK5FHL5MaWoKt3JlDwbDTlRmfSn4mH0o7LIylIbsBljVEo9+?=
 =?us-ascii?Q?tHtSrj172lSxvpLW4dLdf3y/5TJd9mb8q8nLRrAHnIJaiF3P2t2urQTYWxdj?=
 =?us-ascii?Q?cOUTcvFgOk+xOImJnkPg7WaZxoz3JcBIQKDsvM/jW07/0e9SFJZxvI1f1VJF?=
 =?us-ascii?Q?0T0VTszvWpMq3UC0Q/cIdh9V2I1znMSa7jTxAyBkF+7r6HtpuqOi5c8rTXy8?=
 =?us-ascii?Q?BY69d8vAMoYJT2taFdJAxFIPpCwKh/mujNdylN89h6+J4+/Q0Mx/AD9Opt+5?=
 =?us-ascii?Q?j8YSigd0At7SdR6ihPGZ6//csl1fJ9bbz9o4QXqxsG+wRyfTJZDlZz7ffmSX?=
 =?us-ascii?Q?TAysQLKXq1VqHJEsO/TlY0IRCPLLt71YQVvtnTPjvRltLTU8Mr+bH8ZrtXaN?=
 =?us-ascii?Q?q/ZJBqk2ioUSqN9gOmSgsWESvK+mRFP/2jMdLnpyrnwhbnEPRnYLabHD1pK9?=
 =?us-ascii?Q?l0OB4kpNkLOjpW61KeGoGSn8K/8yvJKO8qzrJhkg9/meUwS9mUjMWkBs5g8c?=
 =?us-ascii?Q?tmMPaUECX/zSG2BhxAehRA+WBp5iAJ5sZRCOT3z6gl4egmhsPzNnfhziMffz?=
 =?us-ascii?Q?2vx33wM9aueWHt35MyD4n3BWrzLlETMUuxCG9T2u3OBYncGQEDubx4+yF6r+?=
 =?us-ascii?Q?PVZJlK7pnIafISpVICVh7QrVojPd7rm3lh3pxV51f+6yJ/b4T/tCtGhW0zLI?=
 =?us-ascii?Q?H8VZxKZuPgE1nDxVVtYIvNMb8iOh0AvYK44VjaYNLu3FDeWSKGa98CY+KHkD?=
 =?us-ascii?Q?P/Ol5ftSzUtf/Pb0SQ+JW9W5z9Rz4c1jSksQtfBnTeKhteQayUEJ4lGiCK7u?=
 =?us-ascii?Q?7wTjP9mevyG4sM9kseb+XggCsU4Wf+6PF5p74twyPcm4IftHNWjeZKgolUvU?=
 =?us-ascii?Q?7tGpiCXXU5qSUrA08JhBY4dzXxWl2i5Wll1YN9EIB1KEULuk7uCnm6gyNZ1D?=
 =?us-ascii?Q?DuipBVs7x8QrhAdI0U/0sk8xmjgMQ2fMyAJkxJynBlqKbkzPDjfQ2rn0ge5J?=
 =?us-ascii?Q?dS3l7y47ia4Y9wi9AGyDovGuKdYXgyfWQ33uHZCde4hLtTskYVsQrVzUIW9e?=
 =?us-ascii?Q?bxyaCe7dlkDOz7bKPuY5Mw2HVnChu6IFhjI1AeSbxm/AEHbSulFDUtgv9sM0?=
 =?us-ascii?Q?YFuqZqGvi8K9XDTAYn3k9x2GebnaCUTQT9vo2RyzzcmggFEJOtc922Ttck6a?=
 =?us-ascii?Q?Sn4uVLyq9tfGplvNYm69QyYPdKSGmBOEiebfyZ4aclkdOLDty5B+ziYohjrf?=
 =?us-ascii?Q?ei/qSCirJXatDOH8hE1J0rCB/rCLV8UzCkprcqLrCXvKPGzkwSEd14za3RZl?=
 =?us-ascii?Q?TtFEYhX7vg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PN0P287MB12213F647A0D7B19BC74E47CF9E62PN0P287MB1221INDP_"
MIME-Version: 1.0
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1221.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6a417a-66f9-4071-9a91-08decabea330
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 09:15:26.3124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /49xQ/aFghkhiVqQ8sm1unagSAs3KIJaS5DBZBykswETRYB3R2VeOAgTkKo/e2taFmiKMTISBP4PjPdTXRv9L7GkkV1P7D1NL87vJpQJpLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5535
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 09:15:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238827

--_000_PN0P287MB12213F647A0D7B19BC74E47CF9E62PN0P287MB1221INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the review. This patch is not targeted for any upstream OpenEmbe=
dded/OE-Core supported branch. It is intended for an internal BSP layer (me=
ta-collab) where we are required to upgrade OpenSSL from 3.0.19 to 3.0.21 t=
o address the upstream CVEs fixed in the 3.0.20 and 3.0.21 security patch r=
eleases. Since this is for an internal layer and not for OE-Core, you may i=
gnore this submission.

Regards,
Aditya

________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Monday, June 15, 2026 2:31 PM
To: adityags2004@gmail.com <adityags2004@gmail.com>; openembedded-core@list=
s.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: Parrakat Nisha, JD-8 <Nisha.M.Parrakat@bmw.de>; Suresh H A <Suresh.HA@b=
mwtechworks.in>; AshishKumar Mishra <AshishKumar.Mishra@bmwtechworks.in>; N=
ikhil R <Nikhil.R@bmwtechworks.in>; Aditya GS <Aditya.GS@bmwtechworks.in>
Subject: Re: [OE-core] [PATCH] openssl: upgrade 3.0.19 -> 3.0.21

[You don't often get email from yoann.congal@smile.fr. Learn why this is im=
portant at https://aka.ms/LearnAboutSenderIdentification ]

Caution: "External email, be cautious especially with link(s), attachment(s=
) or QR code(s)".

On Mon Jun 15, 2026 at 10:33 AM CEST, Aditya GS via lists.openembedded.org =
wrote:
> Upgrade OpenSSL from 3.0.19 to 3.0.21.

Hello,

This does not match versions from supported branches. What are you
targeting?

Regards,

>
> This upgrade brings in upstream fixes for multiple CVEs:
>
>   - CVE-2026-45447 (High): heap use-after-free in PKCS7_verify()
>   - CVE-2026-7383: heap buffer overflow in ASN.1 multibyte string
>   - CVE-2026-9076: out-of-bounds read in CMS password-based decryption
>   - CVE-2026-34180: heap buffer over-read in ASN.1 content parsing
>   - CVE-2026-42764: NULL pointer dereference in QUIC server packet handli=
ng
>   - CVE-2026-45445: AES-OCB IV ignored on EVP_Cipher() path
>   - CVE-2026-34182: CMS AuthEnvelopedData may accept forged messages
>   - CVE-2026-42766: NULL pointer dereference in password-based CMS decryp=
tion
>   - CVE-2026-42770: FFC-DH peer validation uses attacker-supplied q
>   - CVE-2026-45446: incorrect tag processing for empty messages in AES-GC=
M-SIV and AES-SIV modes
>   - CVE-2026-31790: incorrect failure handling in RSA KEM RSASVE encapsul=
ation
>   - CVE-2026-28387: potential use-after-free in DANE client code
>   - CVE-2026-28388: NULL pointer dereference when processing a delta CRL
>   - CVE-2026-28389: NULL dereference in CMS KeyAgreeRecipientInfo
>   - CVE-2026-28390: NULL dereference in CMS KeyTransportRecipientInfo
>   - CVE-2026-31789: heap buffer overflow in hexadecimal conversion
>
> As a result of this upgrade, the following CVEs are already fixed in the
> upstream version and no longer require local patches:
>
>   - CVE-2024-41996: vulnerability that could lead to denial of service
>   - CVE-2023-50781: fixes related to certificate validation and memory ha=
ndling
>
> Upstream changelog:
> https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fopenssl%2Fopenssl%2Fblob%2Fopenssl-3.0.21%2FNEWS.md&data=3D05%7C02%=
7Caditya.gs%40bmwtechworks.in%7C4ca06f174ecd41274bcc08decabcb7fc%7C970fa6fd=
10314cc68c56488f3c61cd05%7C0%7C0%7C639171109068806752%7CUnknown%7CTWFpbGZsb=
3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFp=
bCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D4zXCyTbP0EiXoF3vnNrmgILUnQlUiiV0d=
yUk%2Ffy4iPk%3D&reserved=3D0<https://github.com/openssl/openssl/blob/openss=
l-3.0.21/NEWS.md>
>
> Signed-off-by: Aditya GS <adityags2004@gmail.com>
> Signed-off-by: Aditya GS <aditya.gs@bmwtechworks.in>
> ---
>  .../openssl/{openssl_3.0.19.bb =3D> openssl_3.0.21.bb}     | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>  rename meta/recipes-connectivity/openssl/{openssl_3.0.19.bb =3D> openssl=
_3.0.21.bb} (95%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.19.bb b/meta/r=
ecipes-connectivity/openssl/openssl_3.0.21.bb
> similarity index 95%
> rename from meta/recipes-connectivity/openssl/openssl_3.0.19.bb
> rename to meta/recipes-connectivity/openssl/openssl_3.0.21.bb
> index 293b450cd0..2531305cda 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.19.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.21.bb
> @@ -12,20 +12,13 @@ SRC_URI =3D "https://ind01.safelinks.protection.outlo=
ok.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenssl%2Fopenssl%2Freleases%2Fdow=
nload%2Fopenssl-%24&data=3D05%7C02%7Caditya.gs%40bmwtechworks.in%7C4ca06f17=
4ecd41274bcc08decabcb7fc%7C970fa6fd10314cc68c56488f3c61cd05%7C0%7C0%7C63917=
1109068834034%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuM=
DAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=
=3DN8JHLKbuTSv%2F2FuSQciRUuAZP7%2FIxJtz3EpFCvW%2BtJU%3D&reserved=3D0{PV}/op
>             file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from=
-co.patch \
>             file://afalg.patch \
>             file://0001-Configure-do-not-tweak-mips-cflags.patch \
> -           file://CVE-2024-41996.patch \
> -           file://CVE-2023-50781-1.patch \
> -           file://CVE-2023-50781-2.patch \
> -           file://CVE-2023-50781-3.patch \
> -           file://CVE-2023-50781-4.patch \
> -           file://CVE-2023-50781-5.patch \
> -           file://CVE-2023-50781-6.patch \
>            "
>
>  SRC_URI:append:class-nativesdk =3D " \
>             file://environment.d-openssl.sh \
>             "
>
> -SRC_URI[sha256sum] =3D "fa5a4143b8aae18be53ef2f3caf29a2e0747430b8bc74d32=
d88335b94ab63072"
> +SRC_URI[sha256sum] =3D "617e29af8e421f46649484a4937e48c685e47f46488167c9=
82f88bc4ec1d522f"
>
>  inherit lib_package multilib_header multilib_script ptest perlnative
>  MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"


--
Yoann Congal
Smile ECS


--_000_PN0P287MB12213F647A0D7B19BC74E47CF9E62PN0P287MB1221INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"line-height: 20px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
Thanks for the review. This patch is not targeted for any upstream OpenEmbe=
dded/OE-Core supported branch. It is intended for an internal BSP layer (me=
ta-collab) where we are required to upgrade OpenSSL from 3.0.19 to 3.0.21 t=
o address the upstream CVEs fixed
 in the 3.0.20 and 3.0.21 security patch releases. Since this is for an int=
ernal layer and not for OE-Core, you may ignore this submission.
</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
Regards, </div>
<div class=3D"elementToProof" style=3D"line-height: 20px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
Aditya</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Monday, June 15, 2026 2:31 PM<br>
<b>To:</b> adityags2004@gmail.com &lt;adityags2004@gmail.com&gt;; openembed=
ded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.or=
g&gt;<br>
<b>Cc:</b> Parrakat Nisha, JD-8 &lt;Nisha.M.Parrakat@bmw.de&gt;; Suresh H A=
 &lt;Suresh.HA@bmwtechworks.in&gt;; AshishKumar Mishra &lt;AshishKumar.Mish=
ra@bmwtechworks.in&gt;; Nikhil R &lt;Nikhil.R@bmwtechworks.in&gt;; Aditya G=
S &lt;Aditya.GS@bmwtechworks.in&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] openssl: upgrade 3.0.19 -&gt; 3.0.21<=
/font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[You don't often get email from yoann.congal@smile=
.fr. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
<br>
Caution: &quot;External email, be cautious especially with link(s), attachm=
ent(s) or QR code(s)&quot;.<br>
<br>
On Mon Jun 15, 2026 at 10:33 AM CEST, Aditya GS via lists.openembedded.org =
wrote:<br>
&gt; Upgrade OpenSSL from 3.0.19 to 3.0.21.<br>
<br>
Hello,<br>
<br>
This does not match versions from supported branches. What are you<br>
targeting?<br>
<br>
Regards,<br>
<br>
&gt;<br>
&gt; This upgrade brings in upstream fixes for multiple CVEs:<br>
&gt;<br>
&gt;&nbsp;&nbsp; - CVE-2026-45447 (High): heap use-after-free in PKCS7_veri=
fy()<br>
&gt;&nbsp;&nbsp; - CVE-2026-7383: heap buffer overflow in ASN.1 multibyte s=
tring<br>
&gt;&nbsp;&nbsp; - CVE-2026-9076: out-of-bounds read in CMS password-based =
decryption<br>
&gt;&nbsp;&nbsp; - CVE-2026-34180: heap buffer over-read in ASN.1 content p=
arsing<br>
&gt;&nbsp;&nbsp; - CVE-2026-42764: NULL pointer dereference in QUIC server =
packet handling<br>
&gt;&nbsp;&nbsp; - CVE-2026-45445: AES-OCB IV ignored on EVP_Cipher() path<=
br>
&gt;&nbsp;&nbsp; - CVE-2026-34182: CMS AuthEnvelopedData may accept forged =
messages<br>
&gt;&nbsp;&nbsp; - CVE-2026-42766: NULL pointer dereference in password-bas=
ed CMS decryption<br>
&gt;&nbsp;&nbsp; - CVE-2026-42770: FFC-DH peer validation uses attacker-sup=
plied q<br>
&gt;&nbsp;&nbsp; - CVE-2026-45446: incorrect tag processing for empty messa=
ges in AES-GCM-SIV and AES-SIV modes<br>
&gt;&nbsp;&nbsp; - CVE-2026-31790: incorrect failure handling in RSA KEM RS=
ASVE encapsulation<br>
&gt;&nbsp;&nbsp; - CVE-2026-28387: potential use-after-free in DANE client =
code<br>
&gt;&nbsp;&nbsp; - CVE-2026-28388: NULL pointer dereference when processing=
 a delta CRL<br>
&gt;&nbsp;&nbsp; - CVE-2026-28389: NULL dereference in CMS KeyAgreeRecipien=
tInfo<br>
&gt;&nbsp;&nbsp; - CVE-2026-28390: NULL dereference in CMS KeyTransportReci=
pientInfo<br>
&gt;&nbsp;&nbsp; - CVE-2026-31789: heap buffer overflow in hexadecimal conv=
ersion<br>
&gt;<br>
&gt; As a result of this upgrade, the following CVEs are already fixed in t=
he<br>
&gt; upstream version and no longer require local patches:<br>
&gt;<br>
&gt;&nbsp;&nbsp; - CVE-2024-41996: vulnerability that could lead to denial =
of service<br>
&gt;&nbsp;&nbsp; - CVE-2023-50781: fixes related to certificate validation =
and memory handling<br>
&gt;<br>
&gt; Upstream changelog:<br>
&gt; <a href=3D"https://github.com/openssl/openssl/blob/openssl-3.0.21/NEWS=
.md">https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
thub.com%2Fopenssl%2Fopenssl%2Fblob%2Fopenssl-3.0.21%2FNEWS.md&amp;data=3D0=
5%7C02%7Caditya.gs%40bmwtechworks.in%7C4ca06f174ecd41274bcc08decabcb7fc%7C9=
70fa6fd10314cc68c56488f3c61cd05%7C0%7C0%7C639171109068806752%7CUnknown%7CTW=
FpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOI=
joiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3D4zXCyTbP0EiXoF3vnNrmgI=
LUnQlUiiV0dyUk%2Ffy4iPk%3D&amp;reserved=3D0</a><br>
&gt;<br>
&gt; Signed-off-by: Aditya GS &lt;adityags2004@gmail.com&gt;<br>
&gt; Signed-off-by: Aditya GS &lt;aditya.gs@bmwtechworks.in&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../openssl/{openssl_3.0.19.bb =3D&gt; openssl_3.0.21.bb}&nbsp;&=
nbsp;&nbsp;&nbsp; | 9 +--------<br>
&gt;&nbsp; 1 file changed, 1 insertion(+), 8 deletions(-)<br>
&gt;&nbsp; rename meta/recipes-connectivity/openssl/{openssl_3.0.19.bb =3D&=
gt; openssl_3.0.21.bb} (95%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.19.bb b/met=
a/recipes-connectivity/openssl/openssl_3.0.21.bb<br>
&gt; similarity index 95%<br>
&gt; rename from meta/recipes-connectivity/openssl/openssl_3.0.19.bb<br>
&gt; rename to meta/recipes-connectivity/openssl/openssl_3.0.21.bb<br>
&gt; index 293b450cd0..2531305cda 100644<br>
&gt; --- a/meta/recipes-connectivity/openssl/openssl_3.0.19.bb<br>
&gt; +++ b/meta/recipes-connectivity/openssl/openssl_3.0.21.bb<br>
&gt; @@ -12,20 +12,13 @@ SRC_URI =3D &quot;<a href=3D""></a>https://ind01.s=
afelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenssl%2=
Fopenssl%2Freleases%2Fdownload%2Fopenssl-%24&amp;data=3D05%7C02%7Caditya.gs=
%40bmwtechworks.in%7C4ca06f174ecd41274bcc08decabcb7fc%7C970fa6fd10314cc68c5=
6488f3c61cd05%7C0%7C0%7C639171109068834034%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0=
eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjo=
yfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DN8JHLKbuTSv%2F2FuSQciRUuAZP7%2FIxJtz3EpF=
CvW%2BtJU%3D&amp;reserved=3D0{PV}/op<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-=
co.patch">
file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch</a> =
\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://afalg.patch">file://afalg.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-Configure-do-not-tweak-mips-cflags.patch">file://0=
001-Configure-do-not-tweak-mips-cflags.patch</a> \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2024-41996.patch">file://CVE-2024-41996.patch</a> \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-50781-1.patch">file://CVE-2023-50781-1.patch</a> \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-50781-2.patch">file://CVE-2023-50781-2.patch</a> \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-50781-3.patch">file://CVE-2023-50781-3.patch</a> \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-50781-4.patch">file://CVE-2023-50781-4.patch</a> \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-50781-5.patch">file://CVE-2023-50781-5.patch</a> \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-50781-6.patch">file://CVE-2023-50781-6.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quo=
t;<br>
&gt;<br>
&gt;&nbsp; SRC_URI:append:class-nativesdk =3D &quot; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://environment.d-openssl.sh">file://environment.d-openssl.=
sh</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;fa5a4143b8aae18be53ef2f3caf29a2e0747430b=
8bc74d32d88335b94ab63072&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;617e29af8e421f46649484a4937e48c685e47f46=
488167c982f88bc4ec1d522f&quot;<br>
&gt;<br>
&gt;&nbsp; inherit lib_package multilib_header multilib_script ptest perlna=
tive<br>
&gt;&nbsp; MULTILIB_SCRIPTS =3D &quot;${PN}-bin:${bindir}/c_rehash&quot;<br=
>
<br>
<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PN0P287MB12213F647A0D7B19BC74E47CF9E62PN0P287MB1221INDP_--

