Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0352EF483E8
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 19:30:28 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3276.1774294218533531689
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 12:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Kcj3k1h9;
 spf=pass (domain: siemens.com, ip: 52.101.65.3, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMwWwtOFe7im51UGnShK2bFoWhAEVbSuMsQhQfBYc6cojCLt+3Cnay5OqruEJaDqEZ9Fg88TRffzojXmoCoWst39lO13H7DbnURvh/p56xJp1Za1R1DpWZjE5OMFvZuSZERF5K+Sr4rzt+v5g7QVXwwMFInqXiW53Ew7KUCk2Kd33qlKTZU1SQsyLAHqZV01HML4Q143unzccSB28KvE84oaEL5h4eAJwfFw891YO2m+uYotyQHWSRQX9FYgNHshMIZZiMm4m9yQgJY9h4xeorygzTz2qMAQX31ErHu4Vry11y4Ja117xYZx7xgBCoYv3T81bcjUAR9lgFZqNS/fGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PFrf5Ae4vkiJp4HRwloMolTUTpvXLG36dIgERXG1yc=;
 b=H8PFWohqF0DTFHPvLjaQpjI9ZiIw9iTQcPdPmz2/YrAuQsHNOXtrmg1bo177mXipLGPXonx20jIymT63G9CCx9ckhZkLW4VxJaGG7d0z9v2i5OgMXdY6wNUCVOORhZAgkR1GMK2gI5FACgEnyQG8C9N9mF6ZDuG/zLU3FFsGo7gClc2Y+7ttLlVkeGGNLeFBJ+tePJt2JZiGHdKMFisIMjqHKajjsoqW6II1Q0XGF5PulGGTl6VcV4uJB4awPCSXsdwNwaNysImClWY0n2u2VxUF8gtukUrwtuAyycaJTMzgA933loJJctKfYcIW2bT5mQwQba3iqpqZhWddbMfmkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PFrf5Ae4vkiJp4HRwloMolTUTpvXLG36dIgERXG1yc=;
 b=Kcj3k1h9AiMdELU3Rr/tWnzuf5og5fSGzniOZETm2S1lI7cvy5Ss6e39/nz20q3lrBPl+58ScqfuyDLDDaE0JGaBUj/7EhvJbpXt11Ut4yhqweOrG8MxzXBqlfwdwRksgMdbqINHNG2mhT+tEwsJ8xJ6DWpPDSlRylHnisP72RMxqE6cm8GaSpD80xiBB42r3PCa5+wRoYQA6MDfxzGvLb1CSSA1axtSXSYrsJeOOJf6ZTT1fDbDPP14KFDRrYJJyiwRqEY8orq9eC2BpBubhnnVHZbGojLD5IUvdKXi3gL3PPj0m61ILYlbBlhcoRyoEfRIiJsgD0EIdtxrxvK4og==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB5PR10MB7752.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 19:30:14 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 19:30:14 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [kirkstone][PATCH] libtheora: mark CVE-2024-56431 as
 not vulnerable yet
Thread-Topic: [OE-core] [kirkstone][PATCH] libtheora: mark CVE-2024-56431 as
 not vulnerable yet
Thread-Index: AQHcuvtXe4jAteyBMEKr/peS5CJsxLW8gMlA
Date: Mon, 23 Mar 2026 19:30:14 +0000
Message-ID: 
 <AS1PR10MB56971413200AD78609C724BFFD4BA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <189F8F1FEA11606C.1003@lists.openembedded.org>
In-Reply-To: <189F8F1FEA11606C.1003@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=b81f3c03-e284-4136-83d6-83d5f90bda38;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-03-23T19:29:33Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB5PR10MB7752:EE_
x-ms-office365-filtering-correlation-id: bc81ed48-d1b5-4e25-bbaa-08de89129b96
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|7053199007|55112099003|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: 
 dGOG9dZeBIw5mHRA+iXeIuL7nYKL92+N3JD3NLx1uBjPRCfOVdCVAqnNyhc5KRd/BbYbPesAi4uSXruVVKiNab1WF2sTm23qr0Ygp98qMYLVQumdui0Yr731TgvOlhtQsRwUi42EdjJTAHdnuWilwYlQVpAap3HR6R/AldLLBsOALQgnZ9q/fs4uoKpCKOLVjTi8fO3o/41/GxqvjIlV0Ms7tGifWOrFos2yPUXIORsQGO3muQfO/VEvfYHiFXxpvQ0ScxRkH/dWeu7qpucmtMovtL3CeJIjrdmtl52yCEsPD8xYypYIIwPSUiYfZ3orFOIDiZ6Tt2tt6GKHY8369xhC3lp7qeD8M51PovVZB5Osc4luvq+9+KaH6j54j1nZU9XrS+XXmz57ZwGuAcaqsZ4tB5QBqlCGffSInmR8sQOFfwbz/qS4Sw2MACYDgeaCVsrDsO+woCq6VBU7vuHDi7WCczFD6q7RCw8hEKPEHS9vZ/OOYKPjLZZPJUwb0Qc8QS4SoR7c0jRCw8IFdjJ7gdi7sWMn7NNJNSge5XukHGJ2yPPy+cNLbtrA+RX2Cp3aLzK+bx+hOjgfpDCuswfutihESor+cuV+6XZHy/lT4YxgYRexchYYQMFmXe9/p8wa+bFd53+ItiIGvdbfCw3L7SjIz9BWxZ1ZI1gXJ5o0NE8EoLurrrPYLzpG7m7tOVC2r10Hh++ivuPSK3ZJztv5JPIqa5pvaVYjssmyjukr8KA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007)(55112099003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?YQ1l6ch1BGf2664iYs8N26Lp0lD7+gTKEC0U9PPIleY1ky1D3TXAp0/sKrak?=
 =?us-ascii?Q?jTbr/2EwcwdBph9e6L5WmapFlqYKjfNg/Uwgn3hWeKX5RNS5yZS2l7013LIG?=
 =?us-ascii?Q?7V6tAvlKNLAtwC0NNMVAqTF66cOVODdv1vJIRveh4yF9KGleRG6FRPq969ya?=
 =?us-ascii?Q?YP50Yg0x+Ao847fpDxgEJ6TA/PnMFIKkT051amSNXRDdPtarRQCN527mVdiv?=
 =?us-ascii?Q?i9J5bAKhPMNmOb5UCl6r2sH33wG9Q9LStVWzaFLxhUXKJisNlJbVxpTke9UQ?=
 =?us-ascii?Q?Lm3SqsSvOTahSI10656I612/lBpBaP2kB7mhUXaPDR0ZJWfJTbfrVanlzVx2?=
 =?us-ascii?Q?sLVA1g0aMcRrToNx0KpFkDTvczXlAWK3cDAMb9BuC6RhMmP04ZMrpkK0acIN?=
 =?us-ascii?Q?I31slIYrOnZoPhwgNRzEs+Ut0D/oW6yinJhthll8jZXq5HcYrklBcWCQGaIz?=
 =?us-ascii?Q?2V5ksfPDkCGfFElYG6RNeUagkoOOb+Zl+Qr7Z/eeV+TSO/OizVIm/Jj5wUCg?=
 =?us-ascii?Q?5L+1Sk6cdDQ46CeuvLZS6ic2grp+WKOq8ZEVZngYjimz8ounLBDK/79P6T4m?=
 =?us-ascii?Q?ndA3CILxbXgpsYWFZp5RgUcAisALGirHPBDxaA+wsWRlC8YlCmMnx2oo+piI?=
 =?us-ascii?Q?WwxWpVm/4ZuTA4uPNEebPX26izhjNZ1TsULd5p8Cd/A4t3uLmMrudzvD6DV4?=
 =?us-ascii?Q?ghPIQZTMTYa2651pwIbvlWm2mOF1dZs4WjTYezSZdCyYw6+WCs2VZSb+SOw7?=
 =?us-ascii?Q?udPPBw3826d5o6tsOgL80fnlyFUsqDXwkKh3aMXk7+4j0JKgxAnmWIEVgpel?=
 =?us-ascii?Q?n9ze6bvb7cGfQI4WZbdbmqzcnbpXrqtFgeSwSnSglcROz1H/rzRk9zDfqShY?=
 =?us-ascii?Q?w4az8Y/KRWXMbY6umN0r5aw2Sy+gX7kg9p1QWjYrVq66cEC/17mo2B4/DROx?=
 =?us-ascii?Q?vxe9NKTpbhocVkN2o6FRpk+qJibFtf9XVarernt1WMuU0Km3hbfPy+45tdc6?=
 =?us-ascii?Q?SLkkJCM5HM7iKgCs/ZLCdQJWSZr8aoBgkopY5SLGNdKYTh3mMHSL1+nK4Z+T?=
 =?us-ascii?Q?n1RbVecTwfVyoPSv/D+n0agjJky3qG8RVM4fhsBNteHEcObfBveFVkfGMcgb?=
 =?us-ascii?Q?HWI7Mz99J6UNdncAJkRjPuC8PSDhKjgrUGrxtjSBI4GzxELoEgaqps2wYmYb?=
 =?us-ascii?Q?8OV1JG5YFgp2rWpAsYoZ+QbnsD7m0ukvh1PkRgeh0j7ugM5RDuN2M26zkDBF?=
 =?us-ascii?Q?YVwXdN8wnXuyI0KNs87VqeOlP0erXwOKmoF1b8m/pFBTUv6Yt/my9umndryR?=
 =?us-ascii?Q?upNk6Pzj21z2O6utVH13jqYbeks1V8Ton6Zdjn4gCblfMqhEOkScIQ/8aNsE?=
 =?us-ascii?Q?mXd1ee72oOXFZd9jRjAy05r0DAVvdViTZXEtDhXZ7Eq7fdc5aph8eJYDyfNM?=
 =?us-ascii?Q?L9ruACakWCbBthmKA85g512HtzQyBLdMNrcUoCCQZUqojFxiXUp1DvRrfWzW?=
 =?us-ascii?Q?+3RC8l/Gj3XbSAuGxqCmN3+/icJhAKw5sLTDvp3hINXdxDihLAfJ+ePcTJul?=
 =?us-ascii?Q?AcbtrE8WmuAP7JMsRZxZJ2tLX++CFSeULytveFCr5Zrm9b66jwdgXzWHNSRU?=
 =?us-ascii?Q?2gsFaNi2v6RzsvpG/9xNm0hrnIbfcib/av5/JbBodqB2Cq/5Q38/IVyl2e+n?=
 =?us-ascii?Q?1HrFx+e7K32+cU8cPdAKzRxyTwedac77ZP9gRJ5XyrtM01YCWgSbIqfWT3AI?=
 =?us-ascii?Q?qgMW9/KQSQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bc81ed48-d1b5-4e25-bbaa-08de89129b96
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 19:30:14.5636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U5MnppPJLtPdoGEWw8X8+BYeepCXThKpA9glu36n62J/7LdhLP/hjbg4tDtM85Irp/mdLyQz/3F4hLRDPnznTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB7752
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 19:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233755

CVE_STATUS is not yet supported in kirkstone, I'll submit a v2 shortly.
Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Marko via
> lists.openembedded.org
> Sent: Monday, March 23, 2026 8:29 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [OE-core] [kirkstone][PATCH] libtheora: mark CVE-2024-56431 as n=
ot
> vulnerable yet
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> CVE patch [1] aplies only on main branch which is base for 1.2.x.
> Branch 1.1 has a different initial commit and does not contain
> vulnerable code where the CVE patch applies.
>=20
> Also Debian [2] marked 1.1 as not vulnerable.
>=20
> [1] https://gitlab.xiph.org/xiph/theora/-
> /commit/5665f86b8fd8345bb09469990e79221562ac204b
> [2] https://security-tracker.debian.org/tracker/CVE-2024-56431
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Paul Barker <paul@pbarker.dev>
>=20
> Picked from scarthgap commit 07f35d022b88ab4d297d0252f9909e252b7e4cfe
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb b/meta/=
recipes-
> multimedia/libtheora/libtheora_1.1.1.bb
> index ad0be85559b..7bb08a70162 100644
> --- a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
> +++ b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
> @@ -22,3 +22,5 @@ CVE_PRODUCT =3D "theora"
>  inherit autotools pkgconfig
>=20
>  EXTRA_OECONF =3D "--disable-examples"
> +
> +CVE_STATUS[CVE-2024-56431] =3D "fixed-version:branch 1.1 is not affected=
,
> vulnerable code is not present yet"

