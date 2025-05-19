Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC0CC3DA6D
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 08:20:22 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.59])
 by mx.groups.io with SMTP id smtpd.web11.46243.1747642817898972324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 01:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Es2I6gi1;
 spf=pass (domain: siemens.com, ip: 40.107.20.59, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+EyXryKR40Gpr2abPPpAV12MFwbnNA8ZFYDoksmccnYhZXOwF6vJlg2396uGn7IcI3d4VAiL6OkAawkbhhSgD1i/XQ4z3NekHOkdcuI9G8tkuJpz+JHUcjN3iMBbQp7/O9lKsDPK0ojbF35SnV5tY7nkROq1S3kHxm/66jJdqEWPRk7OCcQofJYyw1/UelMAf6P0/WCZDCDs+GX1z6ameECUquMv76bW2yWEZ7+c/TYdJEL5w4yC2VZh6e6bVYhEK19KtTJwZdhQv+PkiBVaVWXIyWBQTT0+pCJ98kOCyFufT9iO5HF2tos5t7ckNmruk+aziQWbBIsvu8JvYFKyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDe+41nf1q7eVX2jL5GNwSFRS28/78VUKSfzO9RyoTE=;
 b=YXOApuyYA/iB6ePrgNbARGnaIZfew2VRWEaIGr7t1EZF6yBMp7ma0OShd8RF4snZdugaXgGGHCAwDokw9d2O598Unrn84QLTcmeEYeZtNYTC/03E7iG4yLGLfmUm/Lk7KpRBAVUlCESPqHUFHJjCBZgrCc5eTIx5xzgMEBuIuiopI5TJh3BhMGeGsagX5ofnmXrbZC6iYDdDcrvp65uLhQ3eFoReYe3SP/apw6Vh6lPuvAA42XPNGhzxR1MmlJwgX4veIGFM8p+Na89IcgRaqgf1Gi6GwQ2ibb5O0v8nC+QO5Xj62nOx+sEL+T98zBAnZNz0Q09JdUT/tdDHJtqx9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDe+41nf1q7eVX2jL5GNwSFRS28/78VUKSfzO9RyoTE=;
 b=Es2I6gi1cWYfuZpJcNcGitcikCD+vtj1N29hJhs/BD38OZAYv22Ioq08xeypw5/by5vDVGUs7EAJAO9rEcB1kuTp7hubUugyeRrKYHVmXF+EGQZ8opBbhCtFBWcXmMkaHEHv6xIkrfSRr8XpDNMjjT+MPdxc9YYTLVxexl716DE5f3YwqmUCWK4tKTkdQfdR0IYi60S5uoWyZmb3OVdO1zsZEepzZ9kCA0SLYMfdTN8pKhSXo6TSFoGplxPhoOjTnSwWdqWDcBsxF24Lia7EFhYk2tM8yKAoEAuzKIk11fLzJyS9KyxopK+w2ZPVSOgQLHoWGBLY2CcPJQ+TyM+Y+w==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 08:20:15 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 08:20:15 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/4] libxml2: upgrade 2.13.8 -> 2.14.3
Thread-Topic: [OE-core] [PATCH 1/4] libxml2: upgrade 2.13.8 -> 2.14.3
Thread-Index: AQHbyJVxmut270bX+k6HU2msFHH4SLPZnFcg
Date: Mon, 19 May 2025 08:20:15 +0000
Message-ID: 
 <AS1PR10MB5697D29730ABEFDC0F2459E2FD9CA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250519081000.2298461-1-hongxu.jia@windriver.com>
In-Reply-To: <20250519081000.2298461-1-hongxu.jia@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=20602ab8-7ce5-4314-b20f-d97a8030dca4;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-05-19T08:19:34Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB8PR10MB3529:EE_
x-ms-office365-filtering-correlation-id: 6333cedc-d650-4e8e-e11f-08dd96adfba3
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|13003099007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?6mJ4EXywQnMPQy0CaKGkykwbzlRH8WVnYTwP5nRokR8ztPYaHrA3t5FwyeqL?=
 =?us-ascii?Q?Gc0ggAvb/EeiEoI2MstuaUOXySlw7ff+UeQQdOSGuf7Vs0sbn7FyWXaTMnSF?=
 =?us-ascii?Q?Xf8vyIhoxioplX9Ch4MtrUKssTWHmkvjV9YKlVTUKYic3iZ3s4vdOyVYVMnu?=
 =?us-ascii?Q?ytazaorVPoFjypVNNJJWlmTuyimkXMWJAzXiRfWzrkTfb4GfDdOnUkdojgbV?=
 =?us-ascii?Q?lS0Ypn9HUrJqP4vTWfTh5+1GJH/QlRuXnuLw3BRNkwYn79Yul0B2kcQglOnO?=
 =?us-ascii?Q?dhGLY2252GQfyPJKtsHmcseN8Ou+U+EhaBbSTzZ1azxv83eZisq8oqGk7gUz?=
 =?us-ascii?Q?BBTPkwU6cNsq9bc3dLsg7opRc6NtQCg9By8DSi3C0V19xN0yUXNfan8azMUE?=
 =?us-ascii?Q?tAjkbgFt+/8B9cwHC+PQ1H58b2yEH6dy5utBxu1FDFyW5qyAwas2XXFc/oSd?=
 =?us-ascii?Q?t/Md629Q3baMypDIgAwZLa2xyUKvNaoCBytt2EXidoXUelJGGQGxOdi3Y6rn?=
 =?us-ascii?Q?wvTr/Q8rtgrjFjYpNAK1CUT+dlR9J1/MVuuMGY/IV6JAfo4IJDjoErgDSqIM?=
 =?us-ascii?Q?Tnie/MYY/xZZiIK3DTnjf9IQyDv7HMaiYIFQUr5Q/1yo3wG9dKeM22cBaTc5?=
 =?us-ascii?Q?F6jIGXdkYKBou4S1mY8PrfTZ9tuuUTfoGYTzWzkHCnqYK3+jBn0xGrtT72tk?=
 =?us-ascii?Q?SYql92F1IhO1vongj+UbpFVFs8nzfRO/N4VkfaPY6MpkDPlyFTq2UxZZ1ZwP?=
 =?us-ascii?Q?5yFtUM3ddeTnKzydfLVmjXC1fB7Dzn1xTTFQ2qCnhviZ2bEumcSSVlHUcHZo?=
 =?us-ascii?Q?MpqCOGUB/zLT76EaZCn0JmlVQKmXWgyr9NfIk9qcanFONPVpohrDBEX0m1fI?=
 =?us-ascii?Q?dfwRbqS3XU7XcQdKzeYaQ3P7tBAzwzj/FwwLkhzape0W27vaYWAVmAtweRRp?=
 =?us-ascii?Q?OxAycfi1tx35DwkPTirABSSUUhM7G6Je0Ju1jLvY1UYaJtI2JVAZK6tqa0pl?=
 =?us-ascii?Q?EYHlfAneREajnsQAFYRLs7XTXgaKRYomlDjb5vi2Cdm6wv/80nHmWYKXfQUx?=
 =?us-ascii?Q?2PfHgt5RnCONJcLrmrHVLXPOkZG9gJamW6UUbu3UIx4esokvu0w+K4ULLwWK?=
 =?us-ascii?Q?Yry2j5zWYL7P9mGGEpyCnP+o0iljrj9M7dwtsjiFwlhSPQmIHsXeUHaJ9BG7?=
 =?us-ascii?Q?HWNzIvp7nsLqOm9p8gP58YfHe+GQCR3DoZb/bMJsenQWlOikM7Mo7TdK37wt?=
 =?us-ascii?Q?M+2LsziLyzJJcY5E8FMY7+gmBrGlJu9T5bies/gSikIKAoAhJI1NXRUTd9bi?=
 =?us-ascii?Q?gGUKqTKF7p7TE8dPsYgC6vPxbfQgovs3xwkf196+D1azqWpGlI4vXMreKgfz?=
 =?us-ascii?Q?VTtJMH8AHCdfvrl2/JDil7Ip2LWfmxYyZ0xFx5dSHkdaRBqRmazbIj+qxIno?=
 =?us-ascii?Q?2xqEfSdp5T4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?q2PmVMBSzbSBOoNMCJ4GbWqK4PS2TZNXYqRJxhDB5dMvhy5m24s+0iDY73Nk?=
 =?us-ascii?Q?cZk9xjhhCasQ4Fdc+885wo5aklH2oG7oPF/KO0jgxt+dM+dlTHMejB+zxmux?=
 =?us-ascii?Q?IcuzWCTrY2HfhWGq3KyUO0v8zJcWVD+hIRKARQshrAiuodvIBzdHKb+BJe72?=
 =?us-ascii?Q?65tRfW2P0CakLigL/JutvAp4d+n5JtkB3m3N5tZ0Gz1rWq/MTjUjxlaITL+F?=
 =?us-ascii?Q?CndhrbL6Jor7YlCIjSvz9CObpmmpWDPsJHvO7fuQsHruB+5IlmRurun/QzRX?=
 =?us-ascii?Q?FPFvSgF39EvfB+cfmQBCSBRwv8AzWPS0inHindOGM/ixAwfwJV7cIBOkSMTD?=
 =?us-ascii?Q?CDDLII7Q95w4UgiIYECh+x8GKfngQxvI+hAH8aZHtBcYYZ6vVVIJAWCW4brT?=
 =?us-ascii?Q?kWHRFuGOKNG0seHcS8dAGVjalmSkJcca5m1PXVpgH0kQEoicyjr/SYcxuZGX?=
 =?us-ascii?Q?Oag5gzgeX3EBMWrZcpglXBkH2Q3mLdGmX5qrtQ5t7pRgTEnrAE3bnAIxY56x?=
 =?us-ascii?Q?9h2gAtJPqYjBDZAMkl3BtthoMbtdkkNiyQyEg42AELd8sR3ToWZK4l62VfUX?=
 =?us-ascii?Q?bsSFgU004pN9JmYMKnOSL85/0m4fvhK5/h0LJ+Vubjl3MpJXGdXXsEsMcEQ2?=
 =?us-ascii?Q?2MBk0N71ZA8ikRL+lu5xLklLlUEtFn5Z5uOBze4b5n6XwW/RbmhxmdlTS1+Q?=
 =?us-ascii?Q?mOcnIFQSRMtlN42i2TIjLUIpKNea9+cHaieI72m47os1R6RW7/58YpkghXlL?=
 =?us-ascii?Q?2jI9fPB2MOEThOaVubIUmZqRBX3f10omeXhhlVBcaBlHLJQbHxQJPsx37h8D?=
 =?us-ascii?Q?ktdOO6Sg6l0gmANDxlf4FhMQXk1Uy/ZjKmrdqNoXlw5LSGga3z17myRn4C00?=
 =?us-ascii?Q?l050UZN6/tEphqanRCmnLL09aTwr1B7BjyltGhlBVcmcFYRlkOQdfDDHU1Jz?=
 =?us-ascii?Q?ROBQ41o+VQ8wGIFmoG0pbye+SM79+ztORm6YWbwSyvAPA1rMi/AWDslHMG8V?=
 =?us-ascii?Q?jGCsDiv9AaXANWVwdm1lPF1EgeQwAu50Er7aKAkhdbcn/K9nEwYvr4yWSLkk?=
 =?us-ascii?Q?04eFg862bzgtedlQTC0Wic5x0JKzaQQxg3sTbRqmQ8DZboYFfMsQVtGqLIih?=
 =?us-ascii?Q?w8r+rdw/Q5o/P8uZSUS6nnMwdnfE27M9u8yNZTeWa9BPRWPB0tIh1R6y3EeW?=
 =?us-ascii?Q?D5iyvmb83nIzpCKBVdSy61lbdfDR/WMlEvBRcXkLA7fmxW/Ff7EhKEL0KyCe?=
 =?us-ascii?Q?TD/VMEikRbfpw4kZQQ6Hcf39U8n2cSC6pWy4af7iLtIeWH/GjNi+dlRlo956?=
 =?us-ascii?Q?AD5rQ8DzEk6BEiEqQGq0hY+6SdjWBCkYhzq4Gzp/8ffaO9NtPc6q16QHvMFA?=
 =?us-ascii?Q?lxq8IHV8Wzm28DBlu2iPu2IaPoSK3/sbO0kmLp/3CSRgug4BRJxYF+Dp4Iq8?=
 =?us-ascii?Q?4+3tR+BxpOeigIPTTvup0JeNS4uH6JS43W+Ab4YBGuPXDBTz0Itl0iIc3jxm?=
 =?us-ascii?Q?kPmiBY6ZvBYsbstdnyWjOvPnSu06YnRcxiizEEi07HatAknMxTLg9g2oYRNT?=
 =?us-ascii?Q?RCOIg+NpVVmW9gXsNs+fQaD31qPu/UbA9foCcZl+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6333cedc-d650-4e8e-e11f-08dd96adfba3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 08:20:15.1182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ejFt6kZwqWWGgRSOAexXdsiks7iTUGAHe8n4NvWnngO57lQdSVIlNF2SBAiGxjalkrRUu/uNf6liGAF9NQH0vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3529
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 08:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216826

I already tried this one and it will not work until lttng-tools is patched
https://bugs.lttng.org/issues/1427

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of hongxu via
> lists.openembedded.org
> Sent: Monday, May 19, 2025 10:10
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/4] libxml2: upgrade 2.13.8 -> 2.14.3
>=20
> - Rebase install-tests.patch
> - Remove --enable-ipv6, due to upstream [build: Remove check for IPv6 ][2=
]
>=20
> License-Update: Mention contributors in Copyright [1]
>=20
> [1] https://gitlab.gnome.org/GNOME/libxml2/-
> /commit/4bd66d4549b2e8925a752e0daac3a189d2fec8f7
> [2] https://gitlab.gnome.org/GNOME/libxml2/-
> /commit/dc6f55cf6e03ae63a40e3af9ad6879821558d6a7
>=20
> Release notes: https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.14.3
> Regressions
>=20
>     reader: Fix reading compressed data
>     parser: Make undeclared entities in XML content fatal
>     save: Fix XML escape table
>     save: Fix xmlSave with NULL encoding
>     Revert "valid: Remove duplicate error messages when streaming"
>=20
> Bug fixes
>=20
>     save: Fix serialization of attribute defaults containing &lt;
>     io: Fix linkage of __xml*BufferCreateFilename functions
>=20
> Build systems
>=20
>     cmake: Fix installation directories in libxml2-config.cmake
>     meson: Install libxml2.py
>=20
> Improvements
>=20
>     parser: Make xmlCtxtGetValidCtxt depend on VALID_ENABLED
>     html: Avoid HTML_PARSE_HTML5 clashing with XML_PARSE_NOENT
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../libxml/libxml2/install-tests.patch           | 16 +++++++++++-----
>  .../{libxml2_2.13.8.bb =3D> libxml2_2.14.3.bb}     |  6 ++----
>  2 files changed, 13 insertions(+), 9 deletions(-)
>  rename meta/recipes-core/libxml/{libxml2_2.13.8.bb =3D> libxml2_2.14.3.b=
b} (93%)
>=20
> diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/=
recipes-
> core/libxml/libxml2/install-tests.patch
> index 1c8c13ab5cc..2570efcdf50 100644
> --- a/meta/recipes-core/libxml/libxml2/install-tests.patch
> +++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
> @@ -1,21 +1,24 @@
> -From 8c1054eacb430472068f21e4840749c384e8e866 Mon Sep 17 00:00:00 2001
> +From 5bebe007b3efd1a723bd45bb9b3303f8645e9810 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@arm.com>
> -Date: Mon, 5 Dec 2022 17:02:32 +0000
> +Date: Mon, 19 May 2025 09:45:18 +0800
>  Subject: [PATCH] add yocto-specific install-ptest target
>=20
>  Add a target to install the test suite.
>=20
>  Upstream-Status: Inappropriate
>  Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +Rebase to v2.14.3
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>  ---
>   Makefile.am | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>=20
>  diff --git a/Makefile.am b/Makefile.am
> -index 4cb9a5c..8adcd7e 100644
> +index 6f98144..ecb3b54 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -27,6 +27,16 @@ check_PROGRAMS =3D \
> +@@ -26,6 +26,16 @@ check_PROGRAMS =3D \
>   	testparser \
>   	testrecurse
>=20
> @@ -29,6 +32,9 @@ index 4cb9a5c..8adcd7e 100644
>  +	cp -r $(srcdir)/result $(DESTDIR)$(ptestdir)
>  +	cp -r $(srcdir)/python/tests $(DESTDIR)$(ptestdir)/python
>  +
> - bin_PROGRAMS =3D xmllint xmlcatalog
> + bin_PROGRAMS =3D xmllint
>=20
>   bin_SCRIPTS =3D xml2-config
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/libxml/libxml2_2.13.8.bb b/meta/recipes-
> core/libxml/libxml2_2.14.3.bb
> similarity index 93%
> rename from meta/recipes-core/libxml/libxml2_2.13.8.bb
> rename to meta/recipes-core/libxml/libxml2_2.14.3.bb
> index e82e0e8ec36..1cdc80cbb76 100644
> --- a/meta/recipes-core/libxml/libxml2_2.13.8.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.14.3.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/libxml2"
>  BUGTRACKER =3D "http://bugzilla.gnome.org/buglist.cgi?product=3Dlibxml2"
>  SECTION =3D "libs"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D
> "file://Copyright;md5=3Df437ed9058e8e5135e47c01e973376ba \
> +LIC_FILES_CHKSUM =3D
> "file://Copyright;md5=3D5873615e8a9ecbf5c8857c4312ee05d6 \
>=20
> file://dict.c;beginline=3D6;endline=3D15;md5=3D2b4b7b827d2d8b080372433c4c=
9c85b6 \
>=20
> file://list.c;beginline=3D4;endline=3D13;md5=3Db9c25b021ccaf287e50060602d=
20f3a7 \
>                      "
> @@ -19,7 +19,7 @@ SRC_URI +=3D
> "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=3D${BP};name=3Dtestt
>             file://install-tests.patch \
>             "
>=20
> -SRC_URI[archive.sha256sum] =3D
> "277294cb33119ab71b2bc81f2f445e9bc9435b893ad15bb2cd2b0e859a0ee84a"
> +SRC_URI[archive.sha256sum] =3D
> "6de55cacc8c2bc758f2ef6f93c313cb30e4dd5d84ac5d3c7ccbd9344d8cc6833"
>  SRC_URI[testtar.sha256sum] =3D
> "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
>=20
>  # Disputed as a security issue, but fixed in d39f780
> @@ -28,10 +28,8 @@ CVE_STATUS[CVE-2023-45322] =3D "disputed: issue requir=
es
> memory allocation to fail
>  BINCONFIG =3D "${bindir}/xml2-config"
>=20
>  PACKAGECONFIG ??=3D "python \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
>  "
>  PACKAGECONFIG[python] =3D "--with-python=3D${PYTHON},--without-
> python,python3"
> -PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
>=20
>  inherit autotools pkgconfig binconfig-disabled ptest
>=20
> --
> 2.34.1


