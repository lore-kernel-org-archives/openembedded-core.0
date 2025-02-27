Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C5DC021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 07:54:47 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.0])
 by mx.groups.io with SMTP id smtpd.web11.5962.1740642886631848320
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 23:54:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=rD3Fag1D;
 spf=pass (domain: siemens.com, ip: 40.107.162.0, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrLulIr7mFL7HadSESHV0OQ0LY0v5/7Nz+FYs2b0+W6ZHMfFSBabU35bk62YZRnwh6pXhdJFif5LS9YYOcIhXkTITyXYXRxuN3gBMUvhyY1gCIv/58KDDoXyoPYAliGRfwCmNdNat434YJi+jBaU/EGyrbiZrnBVTykWpBUor9th6BpSxKimLUMcInicZASl3O0xLgRO1u9j4S6o3RNfKcTH5erQQdAacg8lvMO5FEfu4cz+X9QS801bo6hbzUsdu05iUMhnCSeC3EWWX1V2DrTCwn+5xzGS2710FP6ci8midYAkISh88QThSpoIIE3OuDZIlD9AIgiTm4KeBpa13Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+Oj71suG6fQPMia/P7ojYy59zFsWgQPEZI4EJFuZAM=;
 b=uxxxmtZ8n2o8u/qtrnBo388SQ5l0e0FkggrYQF/AF6+nGRwjfkStHHUZALDhePdemJk8Z2AJX2BL2ymccExBnn2HtHOBqdQN4mvWdPtlCd+NDJBYe/Sg26wRUc0d6znbuyPvw4hY5vNPjEKthuA1Oo1Z2j9ObA5ATtzqPJ2pY+7ZGq9z65sjPacQI/+p2stioRy1bM+8ikg8O3b/yKKh3oF/OaQKxi5vxt+tBlTQobPhHfc2ahOFQOnHLLR5uv6SqsySuQeA62s7358awapGPfnbriZgsHRv//Tk3YPAZg/Xpb6IK+Ue/aeOM23uH7SMON2oHqu+Rb0mVptfU0lnUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+Oj71suG6fQPMia/P7ojYy59zFsWgQPEZI4EJFuZAM=;
 b=rD3Fag1Dqvzq18ouqshH3lDrg77qR6vAAWdgtdyX9oZP1TBYWIu3d4sawf8iOlWLVJZLdetvddAScdUR6wYQhGXdY6rfCiBdFmXZmyKmrieMtsw6f2pKhbEiLxbef7tdkvsKNiYpasmrfIJGKLvc666dRPi4OO1QVOTxhHZJGcBgs9wKTWtTw+2VZrxU3Zdece9GlIZA0ihUgbdPFA/TgW/Htg5tkGaKnA04oZtTC7kwYLqZzC69+kmQxsYBmjI6KARqZmpYzddPNTDhdnuf15pIOpBPx4ufMEMjHRlN9x/0ssCMWHA0vJib5ggb8Q6/zC3hOw1AW+newKGp33syJg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB7897.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:63e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 07:54:42 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 07:54:42 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Steve Sakoman <steve@sakoman.com>
Subject: RE: [OE-core][scarthgap][styhead][PATCH] subversion: ignore
 CVE-2024-45720
Thread-Topic: [OE-core][scarthgap][styhead][PATCH] subversion: ignore
 CVE-2024-45720
Thread-Index: AQHbfXUaFN2ZOZ3Aoku2A8px/mr1erNa3pvg
Date: Thu, 27 Feb 2025 07:54:42 +0000
Message-ID: 
 <AS1PR10MB5697596B020A14AC2754EC7EFDCD2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250212173847.9923-1-peter.marko@siemens.com>
In-Reply-To: <20250212173847.9923-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=6567b267-db01-4ca8-be12-a9b3da1e5994;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-02-27T07:53:59Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB7897:EE_
x-ms-office365-filtering-correlation-id: f9f60268-12b5-4c65-9dae-08dd5703fe86
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?+e4A6fmle/i9yVAPymJfm1GLSUDuNK76fxZ4J7XhNlIOnQZ7qLmQhVlJircy?=
 =?us-ascii?Q?ZXaiUKFywDfZsOv8DIYBmjdMR53mQ/WTvmKn35bcTx2Qitw/bcyh0lrDAGwg?=
 =?us-ascii?Q?jcq0DKcpbdO5Umnz6+md8UT5c3XthJ8aOaMVlYgKwY1KgU4xZ3YFZW4rNQv3?=
 =?us-ascii?Q?RjBzgka3PXRCAYy62RKQC4Mgs5P5MsHMlq2g5lzVtxhBABdxBIxitXR1dySv?=
 =?us-ascii?Q?lohnfvKJyBUp4Ju6BDkz1+oYyAbqzkN+mdmxOwwRVW8r4dCXI2mhwNkrCMa2?=
 =?us-ascii?Q?8XOt9Bh0UlP5XdXk5Z/B8KCV/Lb6IA6mHJBoUT/1HXfpPg8GpaBtRKckCq3U?=
 =?us-ascii?Q?xk/kJgku23yVezlgoIaPU6P4EoSmg4MlxOxM568POgLZulHqNlno0opgSfxu?=
 =?us-ascii?Q?r4S9OHBF+rZTdWnY+3EhovRR2Fi5wSnfanna3r+9Ow/yrY6Ol1fM/sMCz340?=
 =?us-ascii?Q?gGfZW7IIBzBt09ToLSWiReuUMv4RnqGGCLFrUZoFG7r/jqun9iRUfDqH6Rlc?=
 =?us-ascii?Q?v3gaR/N9HdXrv9Qa6DjoSt0zU3s1JmlXuk7XkumsT89X4rZTYKUM8JPHuYWz?=
 =?us-ascii?Q?uZIUmjfYP18SruG6Dpp+Bq6213vLiTybQmAc7OIlHPgyaHenDb3ONjcB7NpE?=
 =?us-ascii?Q?ob4PqnD0sMJAjV8V9GR1kYmxoLXHmAz9FNRnJud8bEGSGoSeCDa2ghy6J5vW?=
 =?us-ascii?Q?TL4sCVt3ofmc2fc1NoI2t/gfrYIseDb7AcckWY6BmvUm3fCAni3tSXL54bG7?=
 =?us-ascii?Q?6TBJYzZv0SBoKrt3nQIcM4uiVz0v2v+LYOlrc16c+yaNKJtO5kouJ0+cXUId?=
 =?us-ascii?Q?aqQmfbKIYiNhXlsZV2DM/llXc3x4NfKs9Cx3VzwOAPu/TGYEfRVl6uSvv8Nf?=
 =?us-ascii?Q?RH9K+luAtzTgQ3CoRJ8kx6rt15oNjdWAqFKx2QjFkYBxp8eGWFzs+TegIiDn?=
 =?us-ascii?Q?BOPhHUV3r7fOsTqdY0LKTfT2H4/EmLb2nLJk68lrPw0y0cU7rP4Z7isWlJc0?=
 =?us-ascii?Q?l/KxhbzA1pVKVHccZEb7MFJC/VLQtWoA9bOmd7kGk4ZP1r/fOnxErZh0zUpq?=
 =?us-ascii?Q?Wg0dA3KpfRX6Nlfb0zXykFwZa9ThIhCjL3xGnWcxpMygpV9+3jxHAMjLVwsl?=
 =?us-ascii?Q?fTrdxdcNEvU8mYvpZxBtpA6khaK99qulw+VNbuP20SUJCpCrULpJ6ma87nN6?=
 =?us-ascii?Q?0qeqqWZvE/nlux1Ent4qVo7Hrz+eYRTd11u/iCOelaWy/L7u5wOXP2bJyRbQ?=
 =?us-ascii?Q?aCQ6fynmROToCbGTVJcqcWicpbdWiAPOZ+SORi58qHxKQ7oLQqjQSHQoUAaY?=
 =?us-ascii?Q?dkt1CvtLfrpzKMSpkElgF39/LX9f1x7Xxi3Wi3Kn2qQlRYqpJ7J6h9LpIBW0?=
 =?us-ascii?Q?Hu9WviHK+uOIlHcbU1j772Z1cGZqEzz0Uvnv3HI54CG8YoIo5vUzjUbtFa6w?=
 =?us-ascii?Q?+3Jwy5W7fJIUwp/kN/xA1gS0dBsbigxH?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?R864sS0Z+t6a0ViwThDWbm+BZlf+mv7YQsbKQPwp2YfEBcW8kChuJNvrRe3J?=
 =?us-ascii?Q?RD42yy+Fp0I+ILM5YXS7t8T6oLyDf6ND9IfyN0cHrYPXBKQ9Rg1QInEKizTH?=
 =?us-ascii?Q?VEVMHuHGslPacrp0u+G85JzF/CZbbXsrZfq3HEQqwdqNeXblDTjt9r8cyH7d?=
 =?us-ascii?Q?QN+1Hl+IGDjuBPiw88ZoDAeIrIJwVLHq+rav+yJ9pO8VwH4hor9Jwh76kQQO?=
 =?us-ascii?Q?hhP5ie1Hk4emCKN/hKVjhmfF4hwTKvsJwiNfU83n3j615QA1iNaHCRYdGyEn?=
 =?us-ascii?Q?Wg2Gz4e9vGuXyExlNc5TzGCSwpI0LEJnCwnyfGpDThkuxmFOMeacugsB49sf?=
 =?us-ascii?Q?twpTtpP2ogKZtaA9KPSAApI+eEHIFfWGAB46W+2UYO/N2RpLtkPGpCCYiFNj?=
 =?us-ascii?Q?LL19R+CoBhH35fr/JrAp5eI2ydEbguYfDeLTxJ7EbzivE5BaMpbaHIMz0cxe?=
 =?us-ascii?Q?YUTyNlwrR+Sq3nlfSwWsDyiIY4GFQDe1dyMopwex1EwL8dFN1UnUO9eGe7Ri?=
 =?us-ascii?Q?SdxDtegCII2soCgmzWTvyLkdL/47D0on9orq+1sfn2mTS4GIKdyP9/jSVLM9?=
 =?us-ascii?Q?P46dgiqI9QaqP3YHcbkhJ2oPY8TIZ2BYPBLTN40k2FIjg9fX0uy622JEBU31?=
 =?us-ascii?Q?mGhqAcB2HU/Ga2M2Hruh0msP7UUdviJuGJa12tUcPUv8JG5wlMg2+hhlbZ5w?=
 =?us-ascii?Q?p73sFTtC7KRLZ8SbP/afU8yUwT8HeGYuo2wC7cqvS7M3L59YNSbUzYUeSQVx?=
 =?us-ascii?Q?H+4xAR93cC0XY5s+Qx69PAqrwbrTpKR1WeCRvVXHwws2Vyqp8rsfF/Yp0euQ?=
 =?us-ascii?Q?XiGzMXy05aef2Mw8J5e7foV9GHM9QiVj1zMnibvjHA1dx/38IZ0IB34OEHC8?=
 =?us-ascii?Q?OlGa6XBMbjZSkwIiRY1QnyUbBA6quHSobzz3FzJ3oYntxMQhLr5S27/by+HD?=
 =?us-ascii?Q?jMzgr9feD7Vq6Yp1aiUeZL5iK9STvPK9eK9mVzBP1TCnEFmh9U+6mSc+VERf?=
 =?us-ascii?Q?Ux5bakn1ERTiaZjsDOmwMlLS35TDc3m8gdz33Wdi3MhLQ51fL/AdNPqgE6dj?=
 =?us-ascii?Q?mZkMd24tR9HSsP5MZ6wkEgQMjXO+ANxoS+Cby8oxWy05loylFlcwiYv+Twqt?=
 =?us-ascii?Q?T1JugxyU7rvBLnHOFUIYwkWF4PUB1h2NAV9ZSpUjYt+bdekLgX883Ipuro50?=
 =?us-ascii?Q?hJXN5Pt8O1IvMD11HX+3qPSfoU9PI06uvKKJHsBvSRDQuJsDmHSmsK4FZSbk?=
 =?us-ascii?Q?jQnUmuEdQwZZ+S51S9m6i8flp+x1cRYiEK3/zZYM1bxTrXD4zaNK2dz40UK4?=
 =?us-ascii?Q?P2Q5pgzu0O74M7dNt5vLonu5Ki9ekBAPN3CaZaKs3PrCAa2fgEJYLv7UG2id?=
 =?us-ascii?Q?Nf/sNUKxtnOtSBkAJb2FhCe0JsV5c6de99N2MeeCk3wANxpeDpl9VY/S4Jj5?=
 =?us-ascii?Q?I+1HdjkXrYKhQC+yzjYBnyGzuE/hTnWssonZ/tnfHaQRwMM9xZ1qXNWiA4F1?=
 =?us-ascii?Q?/T+tf9k1FWnW5F59VN4VXeEADNjz2h7BPXjdtvli4uTaJRcHvdFYzmQJ8yFv?=
 =?us-ascii?Q?UWYZm+AXS9oWdiZhpC+6zTjuukkUEwcK/LkMTecf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f60268-12b5-4c65-9dae-08dd5703fe86
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 07:54:42.2922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iE/kFkbprJadgq2xZPF0s6CoWkcl36NYN2PQcr7AqDLKRRbqhrPU4jAP9BiOYgUCJkN98ZeSaxa4WxzmlN+SJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7897
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 07:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211981

gentle ping for styhead...

> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Wednesday, February 12, 2025 18:39
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [OE-core][scarthgap][styhead][PATCH] subversion: ignore CVE-2024=
-
> 45720
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Reference: https://nvd.nist.gov/vuln/detail/CVE-2024-45720
>=20
> This CVE is relevant only for subversion running on Windows.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-devtools/subversion/subversion_1.14.3.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/subversion/subversion_1.14.3.bb b/meta=
/recipes-
> devtools/subversion/subversion_1.14.3.bb
> index 1ef3d498a5..679228cbb8 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.14.3.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.14.3.bb
> @@ -19,6 +19,8 @@ inherit autotools pkgconfig gettext python3native
>=20
>  CVE_PRODUCT =3D "apache:subversion"
>=20
> +CVE_STATUS[CVE-2024-45720] =3D "not-applicable-platform: Issue only appl=
ies on
> Windows"
> +
>  PACKAGECONFIG ?=3D ""
>=20
>  PACKAGECONFIG[boost] =3D "--with-boost=3D${RECIPE_SYSROOT}${exec_prefix}=
,--
> without-boost,boost"

