Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6849ECCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 12:43:35 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.66])
 by mx.groups.io with SMTP id smtpd.web10.8062.1761137005875211510
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 05:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=StNW7MQ9;
 spf=pass (domain: siemens.com, ip: 40.107.130.66, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcscJKQ8ESUW15+AVHwpXOY31xbYGR8InVoO3b6XBeRYG2qaxcHG6KO6O+fpE+GtyXPyOTXZ+lvGQSq4Q2/sCHCzoPZvaKiiJ8bXTYQfgqslROOoq0gV3DXHnF7l9F3lQ2IKCz/2D0jL11DdsO2Gy+gSoqVBOwt4jo5Bl7NoveaSJMZ7gmS06h3zMkt098y9b33VmVEBW7J1zGGfWPx6/cxLxO0udjK91S6/74QXbFhqM9YL+9wr+EOeTZ5YtS/kys3KOazMvUGweTuYkVgZkgfmuZSPnafzKLV44yJLIhgORuirNOYIeLedY7FrP3LgyjMV1T9Ziy5Bh4Y3nir/Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efHIco7MBXYfVpcCZxGTNVDD6p2kvej9EhyAZgysQ+c=;
 b=ab5Bsj5RjE5A8dmMbTgm2PQRP7nBf9BZVoqnH2wxK9VWL4RftsS1QSS6kF9LuszkVHGXbiJJrzKREIkIniGDdEkQvYfa4zO42oak1FnFH3HR+u8eonaUxsY90GnfPxlSU8lZ0VFm3IZgDpf4qdK+0wErC7aiIfvv6uqOqIsC+HFa/LQ1qtZQp7jtAmhgrDMdPtJCAQtIHSTAXpap5s0NN+SL+MATvVx1KUszNl4TsUIeAloNZutKTp1j7YLo6Xa55hi1tjWPXtUxcnBt8kgCrvC0gVTcfdoOjI0ELISlFFDO/MYcwEy8BREL50GrCHeb6Bk6GVnmjZAdcTHmA5ODIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efHIco7MBXYfVpcCZxGTNVDD6p2kvej9EhyAZgysQ+c=;
 b=StNW7MQ9CC8wXteA9kW8g+f3UhFMVERXpEGMD+2Ghu/69E7pAy2Vp2oEXkKBOfyAT3FfkqKbZMCskQ98MLRKsdn2bd78rZCKetzSDdKVNmyzGGa6W3l1wsNDFDNRI1DdfFxMN/oOB7/0JpQL9Vk+NStDC5fHehFZPz/9r0gWDsjq5GDsEXHXfZaVwBQy5XbhRSa9MI3ipnVAFsadM1/CCkU9M0b5wtC1feJBwmxgeYn4hMx2HiKVvA4qWswW4Ig8sKnHaQ62h+f7gcS/wEpghGO5TWjvxyr0mr+H/1rw5sy9FsF06RdOS9GVTJnBEVVEtW9hEdrku3uk0Sd4iisZ/w==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PRAPR10MB5178.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:27b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 12:43:22 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 12:43:22 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "kamel.bouhara@bootlin.com" <kamel.bouhara@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [scarthgap v2 00/11] backport: SPDX 3.0 support to
 Scarthgap
Thread-Topic: [OE-core] [scarthgap v2 00/11] backport: SPDX 3.0 support to
 Scarthgap
Thread-Index: AQHcQZCUu5AEO5oCCE6AISxINPPnfrTOFrOA
Date: Wed, 22 Oct 2025 12:43:22 +0000
Message-ID: 
 <AS1PR10MB5697986A426B5C628C2930F7FDF3A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
In-Reply-To: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=714244e9-8fe5-40cc-bd43-5bc039c8e429;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-10-22T12:10:54Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PRAPR10MB5178:EE_
x-ms-office365-filtering-correlation-id: 1e9acc78-1850-4a07-2637-08de116895f2
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?s7j/FnotD22sk/WpdHgFg/xMqiGj2x1neLBM0dHbViBn0QtWsexH59Yqu7Oo?=
 =?us-ascii?Q?+LN8cieqKDtlV0QDvKdFyqWSEtzVQy0iIrZ5idwsqf2E06FmHAVn0FbMM7Wj?=
 =?us-ascii?Q?8sWJVUONDpIhEq/8zeDD44vKbODtdIxJy5tLAdmrePhN/lMzq32pFu4bsnoS?=
 =?us-ascii?Q?a6E9X+oly56MIDUueD0HFzUnJiGdfJYatKsaWkxHqvzS9fASdS5XWVswnTXU?=
 =?us-ascii?Q?G5j62TdmlxB8h04rKhk7mQy5Ai5Y3d1GLLCTEdrlKfzKatMEmoKQC1r2O1u9?=
 =?us-ascii?Q?q2XFIV+tq/B53QFpzvSp3QsYr77Zv20bJnS9JfsvHLLDybcdll5W9aVgftsG?=
 =?us-ascii?Q?skfj0iR4oJtq4Hi3bsRdjLZDBPDZp+ODIZLLACCOoMFUfnvdZgkWRo6rWKPD?=
 =?us-ascii?Q?PFePSFoEMevZ96wEAi/j9D4mDRdJ1WPTgXFgQ+yuEhrfoFsoiCls7THZY2dn?=
 =?us-ascii?Q?mZp1qrWQ9bTY4Gbi2PL57tiN1az5GEakLIsvwcAk11TJc0Mq29ofDAQsv6eM?=
 =?us-ascii?Q?IDRJlg+FUO7cxYGi54gmg9YFbcp1fpJ6s7FxnNhK/wWmz09ihLZkClGRQAZQ?=
 =?us-ascii?Q?lZkdpx3586zxEomsr2E9vBwlJl3anG+qWTNfJ1OZEnmUXRPcNCVQOFXSV2uy?=
 =?us-ascii?Q?dbet5EZq+JVZmHQHGjqYXWbzAEMGbwbEZ1caFK0+MI2Q8pIEaMv/I/gQJexs?=
 =?us-ascii?Q?Q0QBYWbCPp7FOVcDi6poQXB9GyjaHLRgMOrm4BHVb3X4lfRMOuzEUShwN55v?=
 =?us-ascii?Q?KLzLx2cnwEHU99tqVvdCReKm1xwaaMjSUehTOCMX45dOJVtfoQhTBGQa7BYb?=
 =?us-ascii?Q?F9P5UCNY2ztlI9m60oLEPNQl/zg3yuMWYcTCkrqhXG4pGkuiUVCYw+B4yTTP?=
 =?us-ascii?Q?LqVDUIKRYdXH27hMcO7cT39P3UvqEKxNimxjeZixijzjGwk1n+/+P3QkIoyY?=
 =?us-ascii?Q?mohUIEcroJXbpW0V0+AYDSGePalZEOTXQ0sUmR0buzzqAIcpl5ydoMkJ9mOR?=
 =?us-ascii?Q?nMSBjMzbFbqP03rRu9cVWKXT7eovphc+zMOWJ4OXiE80fh5v7ul8fmj0WfIr?=
 =?us-ascii?Q?7Uvi7rZ+Sv2w99tspxWatsvoCu3VyLv7aJLgIziijpYwf0T3VgR+qU7KCJ5p?=
 =?us-ascii?Q?9WVtPZkHE8zjMBqXwzChbTLkxEmtPLfaKm9xSIMZhHBHN58y0OiAG5ztq8KT?=
 =?us-ascii?Q?tSwPbPa9liEr5D49ccZzkX3AsfA/Fh+mFdI/HbeFlDmHzqVTJwj3XGxtVzHx?=
 =?us-ascii?Q?VWqx6Qe0PmYuEk1hevftBmXZZRWBvl8ij6kI2f9XsMMQoBU9XoSlXP8ddxSk?=
 =?us-ascii?Q?nxfPMT9EMxAb9ZTdZPKu+uiQJXZO2rmaYxjURydentiYAOAqXnFxKRZ7XsnT?=
 =?us-ascii?Q?bVLfTBujCexgluoLap5kAbJ1m0NKjCcI7YUeDOhbAq6j+iVOkwOPHioeGXUC?=
 =?us-ascii?Q?zFxaPP0lLabluq+k5Pj3+Kd3og+eQ0zN1Yl6Mb9+TMLXjBnp7rmjtj/eDAgP?=
 =?us-ascii?Q?Bu0B914LY5iSLUEy5qzcjmtXAcc15RdlRw7Y?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?QSNJmBP2Hog8QYO0aTU4LvkELlUx7MHksrQkA4WTX+snX1dPipZsHdrsrx4j?=
 =?us-ascii?Q?8X6V9Szk8WR2V5ZMKrVqElIttBNIM+lPcM5PFnLzjx0MQAnKYZU27orhH6IE?=
 =?us-ascii?Q?LZ6nDz3HuMbGp8KZd3rVJLlXqHEiKnoeu0ykGHFyPAfKuU7XoeUtcb+KhQ5Y?=
 =?us-ascii?Q?BN17bMgAIEUbakiyb9lpdt3VuHdC11Dt+oDWzc4XYG3O56S9E0hrCdb0eV71?=
 =?us-ascii?Q?0jWdmvKhman83a7IO/m4q5O9webJl/Xh0soIQ4SZiWZ1/dEeYSTTV+J+Dm64?=
 =?us-ascii?Q?iMmFW58G0v3RZftISB2DTGX6MhouUzUbMsCntZpLmC1swc7f787+pFeAJuD/?=
 =?us-ascii?Q?tlTqmt0bIgrVBelYPYHdRBHZ+qGrJYudra+a21/X+iwLDe0ToEDvsXeCz+6Y?=
 =?us-ascii?Q?o/52OukubEabSA0bTk0MRs9GXKn9N97XJxFonKgFkgRSdXsB9NKyluS2pXpW?=
 =?us-ascii?Q?l8yK74NA12Ayod8/u+pq5uewK/F0M/m7v3fqunqgIL5BfIQNMRXnILEbgVGu?=
 =?us-ascii?Q?gRFtJcPr30uchZsUfaykBUuF07Bm2C5HYxp+G0RLD4cFMXCp/stgJLRNhZ7O?=
 =?us-ascii?Q?uGVofUED5TkvzXX5r8mUQJs8lzVLXbWNoF/1/GFZS7xLrpIQ+1b5JXpIOFOY?=
 =?us-ascii?Q?501Uqncq+3bYCklortC39bXZt7NcZHH4uFgKQqE2R69o5V6uvRk7Z0At7PwQ?=
 =?us-ascii?Q?lcSX4iIxQyBykdq7rIlhbFPeB6roj8YwlqY0GP6XpPsWApzGPLvTdwbBIKvb?=
 =?us-ascii?Q?mjSgXZqNmbS/j+9fLQbSowDo3IUopeWxPPYkE7pnqTMM+OHSsSBuQUpKEiOz?=
 =?us-ascii?Q?Zp8+Cz3GUqgS7rCmsMtJsYrpE9yszxxDZtQ2rxrqYdlGilA8igKTWoiMHNIY?=
 =?us-ascii?Q?j2FSWlTT3lWoCxYvrs+0akZZ3ZNRC+bg7+hQYSpSyG7/t84QMJRQ+BQLXgQd?=
 =?us-ascii?Q?4wc3BqtjcC8EuSWW2JgTkHWBJ1zFi58M3Oj4W7iBoqCNLvWrmpLDWVtarXKs?=
 =?us-ascii?Q?c7L4/Y8avhXgA7RtG0C4Ca207o3Zlq91Ugi09eZY6x6eIT5Ihk47fPnk6zEl?=
 =?us-ascii?Q?+B0YLvlmb78Wujrl1cQ773NIAumxn68ac4aQzDqzRiqfziztM0cqfB2Tzcy4?=
 =?us-ascii?Q?t1gWj1JHEx2p5/JD4VDAadleHXAA7rvzwGtabRGWiAizuEjAkyuRNHRc7VQx?=
 =?us-ascii?Q?6E5XyerzAmSUIlDUiqynzgqIBIvY7SZoixURnQ74ogxF+yo5tk1gpJIh8J2N?=
 =?us-ascii?Q?RycxoyM9EZ5kUzbR0x8n4CWqvjlybtgyoogsnFqX7CV0pd5Jb4dbm5LyjcdI?=
 =?us-ascii?Q?c4aCORLAKA38St6cQMul0VJUUUgA8QI8u/FdtFEb5qkg1TDFXeWAcf7Z9XAi?=
 =?us-ascii?Q?HF7Aj4cJo5xLl6N8LfGc3Gb/EUBdTqvJJHM+tX4xHhENee5Fijk8sV9xKlQ0?=
 =?us-ascii?Q?02v5f3sP6EZNc2pQkSvU2VSk7Hz7T/uYtpzLJVppfMLAZnlABIc+lck47zIh?=
 =?us-ascii?Q?sygOuZ7/Ix/1gwivc99nY3WFmKvyv0xPz9OqmlG8ZcugqguzSY7VjWu9mSde?=
 =?us-ascii?Q?fWH2oE8SlDhtqZsEXFBJHRxp0v+MCV8DlpWnM92S?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9acc78-1850-4a07-2637-08de116895f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 12:43:22.2732
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Q6YJUpK2f9OUGOUoekutiMEOmxDkAtewwrznCzOuD9Rm9WjzWyXeZAfQF0Z7yM9gB5Clc7IqsRLcOkrTaUoHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5178
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 12:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225190

Hello,

I have tried this patch serias and I see ton of "missing or unknown CVE sta=
tus" warnings.
Example for curl recipe:
WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2024-11053 - missing or=
 unknown CVE status
WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2024-7264 - missing or =
unknown CVE status
WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2024-8096 - missing or =
unknown CVE status
WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2025-0167 - missing or =
unknown CVE status
WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2024-6197 - missing or =
unknown CVE status
WARNING: curl-8.7.1-r0 do_create_spdx: Skipping CVE-2024-9681 - missing or =
unknown CVE status
Looks like it is generated for every CVE patch in every recipe built.

What I did is cherry-picking this series and adding following to my distro =
config and building my image:
INHERIT_DISTRO:remove =3D "create-spdx"
INHERIT_DISTRO:append =3D " create-spdx-3.0"
When trying with pure poky, I added following to local.conf:
INHERIT:remove =3D "create-spdx"
INHERIT:append =3D " create-spdx-3.0"

Inheriting cve-check did not help.
When building oe-core master, I don't experience such warnings.
So it looks like something is missing in this backport series.

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Kamel Bouhara via
> lists.openembedded.org
> Sent: Monday, October 20, 2025 9:10
> To: openembedded-core@lists.openembedded.org
> Cc: JPEWhacker@gmail.com; thomas.petazzoni@bootlin.com; Miquel Raynal
> <miquel.raynal@bootlin.com>; mathieu.dubois-briand@bootlin.com;
> antonin.godard@bootlin.com; Pascal Eberhard <pascal.eberhard@se.com>;
> Kamel Bouhara <kamel.bouhara@bootlin.com>
> Subject: [OE-core] [scarthgap v2 00/11] backport: SPDX 3.0 support to Sca=
rthgap
>=20
> Hello,
>=20
> This v2 series backports SPDX 3.0 support from the upstream Walnascar
> branch to Scarthgap (Yocto Project 5.0 LTS), including the corresponding
> test suite and fixes for integration issues found during testing.
>=20
> The motivation remains the same as in v1, to bring complete SPDX 3.0
> support to the latest LTS release, ensuring that long-term supported
> builds benefit SBOM generation capabilities. Scarthgap is under
> maintenance until 2028, and SPDX 3.0 is now an essential part of
> compliance workflows.
>=20
> Kamel
>=20
> Hongxu Jia (1):
>   oeqa/selftest: Add SPDX 3.0 include source case for work-share
>=20
> Joshua Watt (7):
>   classes-global/license: Move functions to library code
>   lib/license: Move package license skip to library
>   lib: oe: license: Add missing import
>   classes-recipe/image: Add image file manifest
>   selftest: spdx: Add SPDX 3.0 test cases
>   lib: oeqa: spdx: Add tests for extra options
>   spdx 3.0: Rework how SPDX aliases are linked
>=20
> Kamel Bouhara (Schneider Electric) (3):
>   backport: SPDX 3.0 fixes and tasks from upstream version Walnascar
>   spdx30_tasks: fix FetchData attribute in add_download_files
>   spdx30_tasks: adapt CVE handling to new cve-check API
>=20
>  meta/classes-global/base.bbclass              |   41 +-
>  meta/classes-global/license.bbclass           |  165 -
>  .../create-spdx-image-3.0.bbclass             |   85 +
>  .../create-spdx-sdk-3.0.bbclass               |   74 +
>  meta/classes-recipe/image.bbclass             |   58 +
>  meta/classes-recipe/license_image.bbclass     |   14 +-
>  meta/classes-recipe/nospdx.bbclass            |   13 +
>  meta/classes/create-spdx-3.0.bbclass          |  200 +
>  meta/classes/spdx-common.bbclass              |   99 +
>  meta/lib/oe/__init__.py                       |    2 +-
>  meta/lib/oe/license.py                        |  203 +
>  meta/lib/oe/sbom30.py                         | 1096 ++++
>  meta/lib/oe/spdx30.py                         | 5593 +++++++++++++++++
>  meta/lib/oe/spdx30_tasks.py                   | 1343 ++++
>  meta/lib/oe/spdx_common.py                    |  244 +
>  meta/lib/oeqa/selftest/cases/spdx.py          |  248 +-
>  16 files changed, 9262 insertions(+), 216 deletions(-)
>  create mode 100644 meta/classes-recipe/create-spdx-image-3.0.bbclass
>  create mode 100644 meta/classes-recipe/create-spdx-sdk-3.0.bbclass
>  create mode 100644 meta/classes-recipe/nospdx.bbclass
>  create mode 100644 meta/classes/create-spdx-3.0.bbclass
>  create mode 100644 meta/classes/spdx-common.bbclass
>  create mode 100644 meta/lib/oe/sbom30.py
>  create mode 100644 meta/lib/oe/spdx30.py
>  create mode 100644 meta/lib/oe/spdx30_tasks.py
>  create mode 100644 meta/lib/oe/spdx_common.py
>=20
> --
> 2.43.0


