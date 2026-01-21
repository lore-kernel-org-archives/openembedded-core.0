Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F3DC44507
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 09:14:30 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8002.1768986856227917313
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 01:14:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=VtZLCT5V;
 spf=pass (domain: siemens.com, ip: 52.101.83.21, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XuJRBOAOjwzpFAMzDbTrZYG+cAVbzK39w9sHug+E+Ia3AQw3lWFW62Nsob7SCx5ssxDvgMBoYO6PaQ7xpsEVsyqGTvkkFs3/9KqwX9+rlqBjZnv/qyhp6TzDJvbwVs88KTcepREi8mSeP2ImMKq+IhQEKmFRsKiNGEIiy9WO6CzcT89f1Em3rUz4VMjbk8+4JDDIocJ9tLj6STW0PqlhUYMT1/fK4ZCY7k1NUSge1uxunFqKg3H37Hnn7w9PyWHz+1pj9aj+yRLhHJD6u6k2wZZVmawDRUfduwqHSwy78dhVIHIojCFXE74nphpRm0oVyRcVOXgGUvvErDBusjXBfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tf509D3zXutuQXvJz4awF7i0tDHDSB4lH/pbNRVKJRE=;
 b=qAjCmVgHHvYwTwWZpsvAZALxFV1KiiytvdwcEwTGxNz+vovmyfL3JvAJI9nFAWmLRwa6cBUqqm+NXsu1hQV/uSBt/JhwotryvQuIKalNZDWgKx4MbCMy1t27YfmU5V7WfE7oZs1AAtSY78YuzPDqJTdKG0FY7UKczfdZpKUzJoYAOgtfMuvzyd58ao8caHcGkIbRkZrugCwFG69dSAYnxHYgirYx4Cpd7YbVEktx4ttmTWodK7dIW3Qj3oO6iPHuGlSbs/++eRWmRg1Uc3agYHkpt6hcUPqV/go1vCq4tTyArFFBvUlo+i+dDn2Rt3akziGt0MYDiUkk8sInOsklow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tf509D3zXutuQXvJz4awF7i0tDHDSB4lH/pbNRVKJRE=;
 b=VtZLCT5VVkGtKAxMOG7qE9Cfp4BDFLSDwd5B78+Xke0hURduw4mluGygBpiet7+KD1VwEfYqhLbgSro2ysG871YziG4oHOAIEJlQItv7BlDa0I4RwX70UyCbhh9gQaKznl/hzWlKBwONyPVwnyPezZpjDDrJ/4JVQMwc+dhD4UD2v6qWIVyBrJNWIoKrNJsdHkV0NFc4Ruegp3tP4TH/2zgPgCtxRoejifNqApeYkfIOecidwyB97Fi8WRmyqDSAWrfqbISZMyHfNTvW/mq8GtgIIAsuKxxDgx8VVbY2HoqcEQEwa23uauN18Il1gdk5VMfkmS4zUcCCA8aL1+jf4Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB8PR10MB3305.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:11c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 09:14:11 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 09:14:11 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "deepesh.varatharajan@windriver.com" <deepesh.varatharajan@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>,
	"Tatrai, Peter" <peter.tatrai.ext@siemens.com>
Subject: RE: [OE-core] [PATCH] rust: Drop
 oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
Thread-Topic: [OE-core] [PATCH] rust: Drop
 oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
Thread-Index: AQHciqs8CowzkRwZhk6O0QaTEb9jHbVcU2jg
Date: Wed, 21 Jan 2026 09:14:11 +0000
Message-ID: 
 <AS1PR10MB56975E18D333A47C8DA8AC39FD96A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260121075430.436353-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260121075430.436353-1-Deepesh.Varatharajan@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=0014d850-bda0-4af2-af53-fe0a37a8b34d;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-01-21T09:00:21Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB8PR10MB3305:EE_
x-ms-office365-filtering-correlation-id: 8f3c74b3-6250-4a43-9913-08de58cd70a5
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?jdOYKO/73DCBbEAukwveehqxRka6+o+mrrLUCP+NGk58P+1yHWawl4rIC9xo?=
 =?us-ascii?Q?rH56kimTELgPe90w7JJPrM15oeZ6Wp7b5goZTOtzMS9OveE3P3vYIBwveXr6?=
 =?us-ascii?Q?XTjjeFLx52iUgFu9EmrL9TUr3PaNk1zdnIncAZiLXj6Hyvpy1+xnp8fYGHu7?=
 =?us-ascii?Q?XSRF8vt+TB0nO7PzdXZzLyTHg+VaKc82ljswVJiM4cotefD/WKu9KgenUXYj?=
 =?us-ascii?Q?8l9JT/U6VBUYHVv33KlX7LicenMo3hOuKbcIKQ2sFj3gBFGhGuIOWo8Lg+9V?=
 =?us-ascii?Q?aGiC2mLfDcxDzxbhdh9MFYHtJGE0k6J/fBjWdiQ5bAD95tTSzae4NX8Pr++R?=
 =?us-ascii?Q?FrtkKDkQJwpYJBJ3dgVP1C0oBTZmaMWZtCIxH4pZmLmRHr0gczUnwgEh/SXn?=
 =?us-ascii?Q?BBjabIBkO7ZQ+nhjPgd+1taAx86VTGARXAk0g0/07tqKPg06IaSxsRCNF8Dw?=
 =?us-ascii?Q?An3sJuuVejLlDSDS7QlY81zHyx5MWD2EJr/5m5E+mD2R+6e7si93tgHupEhV?=
 =?us-ascii?Q?Sdekmf7BBcMujTG5aKX3aOYY8Vc/0HkKfrCpz+AwUQ/Cdxt0gfCUjlvWk7Dc?=
 =?us-ascii?Q?sBV9xqgjwjLEbaN1rO1yVbqVLDJH0jo0ZgoK5Fu3cdg6U3k7fONoZ0dFG3gl?=
 =?us-ascii?Q?gsoY1xHKnPUbUiRswm2sxjGyC3Ti/uuBiQgZNivUBr3KKl7T7ssoO4PoUNyA?=
 =?us-ascii?Q?yYpZs8rA4M3hPnhbOhlJcE/rq5djrfCKwiWB5HoLbsvkL/s16X0f8LmbvPKp?=
 =?us-ascii?Q?2LBxFiIxQp+jocrvawjM+zJvb8pHe6ZcDpPQve5WrxLwRMYXrl6eMP9oJEYt?=
 =?us-ascii?Q?pgmdDCLWsBHUT3T6pfJHygDKwHUfyaX04ikxr06MlpdqeqTilKmPvZwBjMFI?=
 =?us-ascii?Q?4sYlgjSAMsMH6yjCg/69EU6A70PUnPIZH4NB8VJmlRs1ZlGY9DThMWNOYWL6?=
 =?us-ascii?Q?CTMeIT64rt/JGXdtvVt+hX1/OGbXRgPbnasBHUqnlI2SEu45PlpsVX9h9Epl?=
 =?us-ascii?Q?fmajYqkdUYqss5i+RHN63rPSuYB7TvAp/kj20rWobhorSaxklwK0y+UaoseX?=
 =?us-ascii?Q?4QdC1lFFCdVUTqthSQQ8lOoNfh15F+dWX+O0vLTThUJMaPE5AiYbRBet1oFB?=
 =?us-ascii?Q?uXVH8Vzm26Y4c9HWXnf+MdbAb2XQMUYbjtk/hC/kdKLldMoQ3siH8FPqWfLn?=
 =?us-ascii?Q?K5zISSrdmglw9cXcnNDwstcju7AgEbIm/y6LLPLTEJpiC/INdm6tR53mC0YN?=
 =?us-ascii?Q?qUVDrANl5j/I1q9Q4qERYHIIhfaW+/8Umi6gnWz752uI3AdyamEP0PGAO2uB?=
 =?us-ascii?Q?vGsSyLzS1nS5K9nsQ0xZRIPKPQ6MtJ4FDOGWXmfAzTO3UsgEgd0MzKh18J1A?=
 =?us-ascii?Q?RnROaFAnbFDFG1Zbh8TwnkTSIk9Vnv/VLU/d1ahpUtXOPVh5kJQyi4ErnCv3?=
 =?us-ascii?Q?8WYw71P+yxSRdmSLTnH/IqiOsA/Jfqsoy7uJUc4MiwJSm6Xl7e/lUhEfDsCm?=
 =?us-ascii?Q?eGFssyyfQC6srA1IJC+Ly8ZPc49p+wlTUGe4JCj2kyVA2oP5PRFAgHSJaSCg?=
 =?us-ascii?Q?KxvizaQ2hZ6+/tJt9Vo=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Ey5oXY3ErbTCDIZFE1WKyu2/dWMgCHWGRwswwhflUR9XYOoFTHijpT3rxiKh?=
 =?us-ascii?Q?uIim5OCjWWWoH/irSaz4YVsIYuEI97d60flAMVArbu2clEgWo7ASSjYyJ4Ky?=
 =?us-ascii?Q?+4KSDWtVLoRYIM/1tOqkKBvzv6N8j0jeyUYKwD24ng3oRwnQYfCe7lyOP47G?=
 =?us-ascii?Q?Tw1ZGn20bINr81PWchnol+hrzn3piPTE/ct2Y84Iarrh+OSktrw4GtAkM0ag?=
 =?us-ascii?Q?Njdy6hjfHA6u9JrL8o5WUESDMwJBskW1vWrLyRDCLkhI9/jUEOF0f7eiQGYa?=
 =?us-ascii?Q?F4gPTHfXOdCc0ZJGoBZXv743bVtJg5vL0ZSa6JknAFSLi/wqsYPIpPyDXVcz?=
 =?us-ascii?Q?rLrWHv6xy/u6fJKUfaZPlziwEgH/LtNymUw66AlmElkvvU92DXSNKlmWileL?=
 =?us-ascii?Q?So8hxbBUMTiR4GN8yMB7/puV7B4G5O6med2rUXTa+Xu+WlFvVFHRJn9RnYKP?=
 =?us-ascii?Q?6O8ydGliKJNkoERKYck8inUJBRHMpzw3sKKX0CLIZvDScax1p6u2qK6bKGh0?=
 =?us-ascii?Q?ybuKyasYaRcjfgPWy+NPxCjc3r2U5JcZqTcWejBBCg8CocOMP/Q5y/LsKzsc?=
 =?us-ascii?Q?nfBt6j3MP5EDu/7Qx33NBberiKqT7EfnQBOHBUxev/XJ3XmYL9rK+A5R1A5P?=
 =?us-ascii?Q?srBdALeYm7eAVONNb5cy4WneRydo2vkCAqkXhsOgnqS4PJ39CPHyeoosgP+S?=
 =?us-ascii?Q?59XmNFY3G08fekM0NaAZiGQeAXhR5KllnNUe4NSk2DyhmNMVUBEqywe5Jk20?=
 =?us-ascii?Q?pcC+Jz6hBbz++xcNyUbT/VLn8SrT5arkNJ7viiEM95sar/cnS0i/fuUh79x1?=
 =?us-ascii?Q?dxws6ign8ElSPxUBPQdaeHwOaxUQCvnfX0FG+KnoCaykK15kX/BkfO6NBunA?=
 =?us-ascii?Q?iggQqbYd0Izi0zx8O0XPCuzUjXdnvl4nCFBuiWo0cOpQOy3tu7ehdkn4R+44?=
 =?us-ascii?Q?TLW6F7yg8Le53sC6pABNM22tQBpadNI2xFtSYsnF4FC2Yd+mvWQudiGQ0Kzj?=
 =?us-ascii?Q?2i1kWp7P2qQFb9ClND5hfk4vYwuDwuLdBmkn2n7AYzQKtQcYnnM7WTxKzr+t?=
 =?us-ascii?Q?XIBDGuwYhU9UpC36TnbBKZMlZUkb0ceGqBjmDg8QA8KG4N8dTrZfOWkZ5ZX2?=
 =?us-ascii?Q?NYIij/lLng6mNUztRb4Vx3JL3c6hYCTzopnvk9AT0s0A0yOBfbwps+tleijU?=
 =?us-ascii?Q?uMRm/NrXHph7lLX1wAdXAjBg2M/Ha0lQUIaNsUk36oDoMWYailAK5FnCxryQ?=
 =?us-ascii?Q?KUM/dZYYQsvp3s5SwpIwRwXcdvAKPgd18+jttx7X7WISnWrATKJTKW0z0m70?=
 =?us-ascii?Q?LbCPCxRR15QAi6NU5ynjyc5Qs8mHaf2vgq7s7xrbAveaLIOVDdGyVb4h6e6B?=
 =?us-ascii?Q?5yvkZ3P3QMyXgpytUuq6kN7WsTixBNtSBOpRTbrMaNO+SnHxE5SehRoBeHmD?=
 =?us-ascii?Q?AKTKioy1s+ywSjbILFf14CUvnrb3wu0mYQcSYexdmGiDuHoQ2owKyPpqMquv?=
 =?us-ascii?Q?6CucAfCkwVDUxBYyzH6vYOh9kIkmMuSwX+ocTC5R/NMDq6uACcGDiO4cEafQ?=
 =?us-ascii?Q?DMMZ5m+vl7S/5x80OvzyUxYMsjkKqTCiRhMsHvkUoIc2dSH9c2qIsC/svX9B?=
 =?us-ascii?Q?9WqAHr1IYXQDwm1ZnZS9wc7lk4rRaPNSu5B8QdoFX/VwFHLh0UZKyxAmWDMm?=
 =?us-ascii?Q?qIlAScYXK2xrcBcsycdv5Cu3IjA9DT9eyKWINlzGtUnO6BEIHV0ih5Kp79rk?=
 =?us-ascii?Q?s75JY4BvCw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f3c74b3-6250-4a43-9913-08de58cd70a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 09:14:11.4188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NFaeeHzZMKyWpZ8LExUfAVbNzEPwllPV37ThOYPxdpm4PFkQT7TZLGIMbPgIm+joWn8FyBlkj4ghawOHnCLG0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3305
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 09:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229799



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Varatharajan, Deepesh via
> lists.openembedded.org
> Sent: Wednesday, January 21, 2026 8:55
> To: openembedded-core@lists.openembedded.org
> Cc: Sundeep.Kokkonda@windriver.com; Deepesh.Varatharajan@windriver.com
> Subject: [OE-core] [PATCH] rust: Drop oeqa-selftest-Increase-timeout-in-p=
rocess-
> sigpipe-ru.patch
>=20
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>=20
> This patch was originally added to address a rare failure on the PPC
> target observed in AB. Currently, we are no longer testing the PPC
> target in OE-Core. Therefore, we can remove this local patch. We have
> also verified PPC testing locally several times without this patch,
> and the issue has not reoccurred.

Was this tested for 32-bit ppc on a build machine which was under some load=
?
I wouldn't like to play a remove/re-add game, flaky timing tests have tende=
ncy to return.
It's rather trivial patch which should not be causing any maintenance effor=
t.

Note that this architecture is not being tested on AB, so the commit messag=
e is bit misleading (as it was not observed on Yocto AB).
Also not being tested in AB is not a good reason to remove something as use=
rs are still using it (as a tier-2 feature).
Note that we're discussing some form of return of Yocto AB testing for 32-b=
it PPC.

Peter

>=20
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  ...crease-timeout-in-process-sigpipe-ru.patch | 31 -------------------
>  meta/recipes-devtools/rust/rust-source.inc    |  1 -
>  2 files changed, 32 deletions(-)
>  delete mode 100644 meta/recipes-devtools/rust/files/oeqa-selftest-Increa=
se-
> timeout-in-process-sigpipe-ru.patch
>=20
> diff --git a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-time=
out-in-
> process-sigpipe-ru.patch b/meta/recipes-devtools/rust/files/oeqa-selftest=
-Increase-
> timeout-in-process-sigpipe-ru.patch
> deleted file mode 100644
> index 5bd1abffb4..0000000000
> --- a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-=
process-
> sigpipe-ru.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From b4524278985f517b0785b6f64a21380dcf1ff096 Mon Sep 17 00:00:00 2001
> -From: Peter Tatrai <peter.tatrai.ext@siemens.com>
> -Date: Mon, 4 Nov 2024 13:58:16 +0100
> -Subject: [PATCH] oeqa/selftest: Increase timeout in process-sigpipe rust=
 test
> -
> -This patch increases the timeout for the process-sigpipe rust test, whic=
h
> -occasionally fails when the server is under heavy load. Increasing the t=
imeout
> -reduces the likelihood of false negatives under load.
> -
> -Fixes [YOCTO #15625]
> -
> -Upstream-Status: Inappropriate [OE testing specific]
> -
> -Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
> ----
> - tests/ui/process/process-sigpipe.rs | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/tests/ui/process/process-sigpipe.rs b/tests/ui/process/proc=
ess-
> sigpipe.rs
> -index 11f363d62..c12d66016 100644
> ---- a/tests/ui/process/process-sigpipe.rs
> -+++ b/tests/ui/process/process-sigpipe.rs
> -@@ -23,7 +23,7 @@ use std::thread;
> - fn main() {
> -     // Just in case `yes` or `while-echo` doesn't check for EPIPE...
> -     thread::spawn(|| {
> --        thread::sleep_ms(5000);
> -+        thread::sleep_ms(50000);
> -         process::exit(1);
> -     });
> -     // QNX Neutrino does not have `yes`. Therefore, use `while-echo` fo=
r `nto`
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-
> devtools/rust/rust-source.inc
> index d7d44510e4..3edf0899ab 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -4,7 +4,6 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-
> ${RUST_VERSION}-src.tar.xz;n
>              file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-lin=
ux-
> g.patch;patchdir=3D${RUSTSRC} \
>              file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
>              file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=
=3D${RUSTSRC} \
> -            file://oeqa-selftest-Increase-timeout-in-process-sigpipe-
> ru.patch;patchdir=3D${RUSTSRC} \
>              file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-
> rust.patch;patchdir=3D${RUSTSRC} \
>              file://revert-link-std-statically-in-rustc_driver-
> feature.patch;patchdir=3D${RUSTSRC} \
>              file://0001-riscv32-Define-plain-syscalls-as-their-time64-
> varian.patch;patchdir=3D${RUSTSRC} \
> --
> 2.49.0


