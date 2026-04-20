Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A0FF36C3D
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 07:35:58 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14782.1776670553923223923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 00:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=js/u8ONJ;
 spf=pass (domain: siemens.com, ip: 52.101.83.13, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abTWmXw+aBshPwlT2Pd6PvZbxqsPACofdfjtN1ZoB6ststVeJW+Mq8Sy7Gh2t5TP6q6K0gkA53+9UgmWvYSi8sX4phEGTiCcqFqwiAYxrbaPl7Pxm+2pUXqEuvl700LzCTLLyXy9mjo82jb6P6iUrAvK1QqgTztBS9KnazdCqazVBDnPCpbgLLG4j6ZQJFSh9mPga25PYThwCCJ20eiiZmQB9bD4oRG/Yd8fzUYouJ9ejkkGpSSYfHff/JAutLMqkhHR3+4zXOwYeHx1lJSf4mwB53Qe/PAuJmGOtHcraFvP4puQOtqWxGXmdj4KcsKJAQyhSCmFscn5sJ1nNz0PCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NOxe5nLRB+ZJ4//zYkf6UrZlZSqrxUxoi5O1yDpxuw4=;
 b=o0Z6mbhhWFmPpXBcjB9VZCSCPeKoUMO+qWoMlWtTebb/sLCTprnLL/cF4khT6lgIx36sSN/e2or0oRr2I+8g4aQ8HCLqqdcrCYrO+1GlUvCW/yh6udXObZeYXp+J8lg/YdySFj7T4U4kWoOHGGYbek6rTtE4s7Lhx4coZfR3HV8sACgX8rWaUoYLgYED2lL2sW9xxeFnTGPXYf//JILbVZMQiP3c9xtX5odBz9pYWsR//UilCsxCiNZ8h2B9cSBgTL9jemzyfcEjBm5aFSRkmzqm74ceojzzE2I+MDcSpVIpkK+C5yw0dkxYCKSdW83SK8UgxRbIby3at+mzZTKv/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NOxe5nLRB+ZJ4//zYkf6UrZlZSqrxUxoi5O1yDpxuw4=;
 b=js/u8ONJC6LugLHNGJ32gCyli2XMBaVnwPCq8e1pmlDEu8VdcD+0BKF3+FGC2XhZDhbBVAx9zX9SYxpKUWlZhWX0m9lLNa9tkaFucaVzP/yibdhsRrOYj8V/buLsutW7W2feMiwaBXZxsjM28dA4qku/YKYrXwqeWjgdnaUsEuGBZWjGrPcB1W7pjpwPmMPwQxC4L5BB1uCYnsLgO7mFOOBFL8OoxVkiYqKZJRsMxjS82vQ7rtBVd+L+d/GdSbTStK74Ftk5+8jZ9ekLCgq72u5Y9om+GCzXOG+jhxZctYTYPHaZn+g/uw2GaNlab6bgnO/ulp/kTk1H5LMv7N/hQw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB8PR10MB3815.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:160::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 07:35:46 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%5]) with mapi id 15.20.9818.017; Mon, 20 Apr 2026
 07:35:46 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, OE-Core ML
	<openembedded-core@lists.openembedded.org>, Yocto Security ML
	<yocto-security@lists.yoctoproject.org>
Subject: RE: [OE-core] OE-core CVE metrics for master on Sun Apr 19 23:58:36
 2026
Thread-Topic: [OE-core] OE-core CVE metrics for master on Sun Apr 19 23:58:36
 2026
Thread-Index: AQHc0JSNf9OCw6KMPkmnUeeV8pwkVbXnjj1A
Date: Mon, 20 Apr 2026 07:35:45 +0000
Message-ID: 
 <AS1PR10MB5697D1AC518B640243633925FD2F2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260420070750.2093171-1-yoann.congal@smile.fr>
 <20260420070750.2093171-4-yoann.congal@smile.fr>
In-Reply-To: <20260420070750.2093171-4-yoann.congal@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=b80db35b-44c3-4c4d-bad7-836710fcc7cc;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-04-20T07:31:27Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB8PR10MB3815:EE_
x-ms-office365-filtering-correlation-id: 6209dc12-4233-47a6-6be2-08de9eaf6f69
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|38070700021|56012099003|22082099003|18002099003|55112099003;
x-microsoft-antispam-message-info: 
 7q1J0et/F9OsRcVqc8A8ekvhqhu5oBGl3LrH7vlq162PMV5GgYQRNL5Lm/eu1ll3Oif6W8MTAkHenYNdCTHRWhwGg4tm0sZsfj0r5FWuRZyiEpsFsk2YP4snjf/NzCsPyT18fAHOOSqkF3cNsDRUCBs1VWmMtW4tVxpPsEXJKAKvcuVw9ZzDlrknp33U+RfyNeiXNtrd/UHbVM6naiL2+anY0aikMyp7uLtZYGtavgFerySvgVWaGOD/RB/q+uPzgAqntfZDaeKF8CoeOU4C4YwhbGTKyUHzAKiTeO/Bfg8+MNoAfqk8DxkkzuhCxTHfrJvqNdbxwBfTK2xt0jpYzi5XHAK90dv1xYhlFye21gkNnUoMdSxAZFvwb9NYmHQT/Mq3c0C9rXUQcS+YNnLJqigULkCf29ZdpvgGClv4wE/iH8RR8FK2kkGY7fFCH2SkZbAwaph/0sz0YfOrZQpIWWT0Jc+mbg4ul1T/Zx3+IFpHsEIi7NkKQLLC7xCOpdWZLl66mcV6he8QxF5aqJunL6jlcSQhZpoB06iwwkwbwR8jruMbY87R+IOo3XIAvs/1BDw5nK99In8SyHq8zcpzvHz08y+paYcyciWsknUZbjC4X5QCrMj+nK4V+YxYN0B8XlwiKLRqOUUAT1ttoxl3SIxERdWBEXGPvojLQhOM5Q09CzF++/J0Nq7lABhx98kq6b+TJgnwu6vNuCFEtACzoY4/4GNqETj6uvYuZx/JoAZkQS6+tfMAv84/1ClQs2bP
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(38070700021)(56012099003)(22082099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?CUoehzCHahE4aRB8t9RkLu4IRynazabCAaf360mRHsCxGglnh5b2DcKdZFWP?=
 =?us-ascii?Q?LGrdbx/oveERykpm5s2x8SscVRKUpXLKppAEqoXKq4hS0cWZT+sZEP0xrXtg?=
 =?us-ascii?Q?Lwc36H4iniRJmH7pHmMCEVcy75BjDVtxMCqONjZFio8gqbq8iO9QeGIXu11J?=
 =?us-ascii?Q?fCNWQ2YqYzQkZDWt+0VTOykGWrJ3lr+0VYaUMTEl8RYHvNW+43zPDavWhPwl?=
 =?us-ascii?Q?Fv+ANNP/XywMPb/J4TQXRT2K0R8Lg1lgNqOUbCtp+su34Sjap4KltPIM8PRk?=
 =?us-ascii?Q?oG+c3yqm2HWOWg8D4xF8mF3wlrckDn2yZH9hEBmhY7+AGl1V903OogWJ32iB?=
 =?us-ascii?Q?IHvff2WSJlmnRT4UH+g2+hc6y3G+oJHdcpieoOodmFlZiKVVMsDF8Urixd/7?=
 =?us-ascii?Q?0oTwHXVUl7ugzyl6Hne5+hCqOB4jt0uakya9bawAP2jaHU98i1OiBK8eNCWX?=
 =?us-ascii?Q?O427T/eeoiZfpZRzjkrly66dmhcFPT9rtQDLONGEzY/59c29hcBoApF9F/1Y?=
 =?us-ascii?Q?WlWZFYx203LCBVKOdE/Dx7ldL2wp0AhWoW7kgi5wrPGyTIjWledvNJXkRq1d?=
 =?us-ascii?Q?G/vOMQIZQsCqjt2p8T/b1GDJyddzXn2UnwhDw6czK2/9rLFKtrCgthBdglU4?=
 =?us-ascii?Q?d5oIfewzVBCjENHyYfsJsBgc7M3LHuoz+wmgzgntA0RIxd6ts4mm8dnILi7I?=
 =?us-ascii?Q?KWZoH7A5M/HydLWoTXs/kGfD2urxq1EQ+tscSIITov4NjKrGavkE1/RVOmrh?=
 =?us-ascii?Q?kIgjKbwl1Or0GlRgvSG2u0Bs8sPxyefK1cKU/gNpP0j3UkRgceUzXO2kMezG?=
 =?us-ascii?Q?TjiHXmlDqmryhzHtRakk1tRMryr0s9xZgXLDV1vjLCB9BFd52rBHAqom5MkP?=
 =?us-ascii?Q?jfIAIMElWyrgPXaKrgNhYwl+XraT9U1W82wSKxyt/YqjT4UdgdFtCxmpQSTY?=
 =?us-ascii?Q?261DKIfMQ18DIlPdnYavUlO1DRGgil0KRq8YkjRmsHp7622vhl3udon7LObh?=
 =?us-ascii?Q?vVkSN573EL9rljIOoo1jZfLNE9SkpFTqeb1xScxEYLlsv2iS8a2ABHD1+uuY?=
 =?us-ascii?Q?wuV3R1mfmu4o/ipusVHGpLdJabruxYXJzk550LQSR2dVzxzBLCaqcunCR37g?=
 =?us-ascii?Q?fkkFlSQCcMC9qxBJlbaA5kgvnY4oQytpsW2/bS6AMFYmZwqVmtpel/FsJ8J5?=
 =?us-ascii?Q?vNzodLTwYQx4WZM8tkEHjdJht8GVBR4TsFve17DL/eDWFqU9EuoJVZwllTce?=
 =?us-ascii?Q?aaeN6AdoJREikk08grl7PTxam1gw7cRNoVRxJCUNymSgO+ZXJwSUJ11t6N0J?=
 =?us-ascii?Q?QeT0lcR2+f5NJqLyTpJduI7xI5BqBPaZyQo6X++Dm0l/cfUH7CnYvWFrWCtE?=
 =?us-ascii?Q?kyCXk5yk+lbqsdEEsgeUKwOoqB7IxttNQZZXQiFYiYbd3LT6VY+6WWUv7u5F?=
 =?us-ascii?Q?H98L+v4WT/7bEScSR46Ct9wOjnrDnFlT7nVjgSyfb+PXMW7lMoElFfilOJZ8?=
 =?us-ascii?Q?vRpEdDfKz87a6mCtHD1GGaWZhwUwbICh/V7VmEuW8ogYYA+nOaZn1hdXe50q?=
 =?us-ascii?Q?TbrAskV8EumifZnB8TsLyeyTUGWhyO0CuJWshncB25P/qcTzJftZF+7kl2K2?=
 =?us-ascii?Q?cEhpgisfwhIMTEcxqmFqbupcdPJbViNov74NIVdTLxGiOocgVvicgEolitBI?=
 =?us-ascii?Q?/Vsxu3lZKtH2RTyRo7RrVANltN8KnFufUPw6TFkwmlhewNohqWnrG+2O4Jd8?=
 =?us-ascii?Q?g3P86+0u8w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6209dc12-4233-47a6-6be2-08de9eaf6f69
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2026 07:35:45.8577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GBmOoEG7JxlQ1SiX0qtoWhqxNyoRt1BqYk4A49LodfVP6oSzU6+n4Fx1J3d0hHsV00O+NRrO4QppYbvSodryNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3815
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 07:35:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235539

Hello Yoann,

Could you please add following to your build configuration to match what va=
lkyrie metrics is showing?
LICENSE_FLAGS_ACCEPTED +=3D "commercial"

Currently this report is missing ffmpeg recipe vulnerabilities.

Thanks,
  Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Yoann Congal via
> lists.openembedded.org
> Sent: Monday, April 20, 2026 9:08 AM
> To: OE-Core ML <openembedded-core@lists.openembedded.org>; Yocto
> Security ML <yocto-security@lists.yoctoproject.org>
> Subject: [OE-core] OE-core CVE metrics for master on Sun Apr 19 23:58:36 =
2026
>=20
> Note: The CVE list generation was switched from cve-check to sbom-cve-che=
ck
> class. There are slight differences in CVE filtering/handling. This is wh=
y "old"
> CVEs appear this week.
>=20
> Branch: master
>=20
> New this week: 134 CVEs
> CVE-2023-53012 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-53012 *
> CVE-2023-53187 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-53187 *
> CVE-2024-2236 (CVSS3: N/A): libgcrypt:libgcrypt-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-2236 *
> CVE-2024-47850 (CVSS3: N/A): cups
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-47850 *
> CVE-2024-49854 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49854 *
> CVE-2024-58251 (CVSS3: N/A): busybox
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-58251 *
> CVE-2025-14876 (CVSS3: N/A): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-14876 *
> CVE-2025-38656 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38656 *
> CVE-2025-50422 (CVSS3: N/A): cairo:cairo-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-50422 *
> CVE-2025-66382 (CVSS3: N/A): expat:expat-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-66382 *
> CVE-2025-68195 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68195 *
> CVE-2025-71145 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-71145 *
> CVE-2026-0665 (CVSS3: N/A): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-0665 *
> CVE-2026-2243 (CVSS3: N/A): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-2243 *
> CVE-2026-23327 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23327 *
> CVE-2026-23328 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23328 *
> CVE-2026-23355 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23355 *
> CVE-2026-23371 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23371 *
> CVE-2026-23374 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23374 *
> CVE-2026-23377 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23377 *
> CVE-2026-23389 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23389 *
> CVE-2026-23391 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23391 *
> CVE-2026-23392 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23392 *
> CVE-2026-23393 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23393 *
> CVE-2026-23394 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23394 *
> CVE-2026-23395 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23395 *
> CVE-2026-23396 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23396 *
> CVE-2026-23397 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23397 *
> CVE-2026-23398 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23398 *
> CVE-2026-23399 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23399 *
> CVE-2026-23401 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23401 *
> CVE-2026-23402 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23402 *
> CVE-2026-23412 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23412 *
> CVE-2026-23413 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23413 *
> CVE-2026-23414 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23414 *
> CVE-2026-23415 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23415 *
> CVE-2026-23416 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23416 *
> CVE-2026-23417 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23417 *
> CVE-2026-23427 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23427 *
> CVE-2026-23428 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23428 *
> CVE-2026-23430 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23430 *
> CVE-2026-23431 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23431 *
> CVE-2026-23434 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23434 *
> CVE-2026-23436 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23436 *
> CVE-2026-23437 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23437 *
> CVE-2026-23438 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23438 *
> CVE-2026-23439 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23439 *
> CVE-2026-23440 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23440 *
> CVE-2026-23441 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23441 *
> CVE-2026-23442 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23442 *
> CVE-2026-23443 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23443 *
> CVE-2026-23444 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23444 *
> CVE-2026-23445 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23445 *
> CVE-2026-23446 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23446 *
> CVE-2026-23447 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23447 *
> CVE-2026-23448 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23448 *
> CVE-2026-23449 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23449 *
> CVE-2026-23450 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23450 *
> CVE-2026-23451 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23451 *
> CVE-2026-23452 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23452 *
> CVE-2026-23454 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23454 *
> CVE-2026-23455 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23455 *
> CVE-2026-23456 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23456 *
> CVE-2026-23457 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23457 *
> CVE-2026-23458 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23458 *
> CVE-2026-23459 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23459 *
> CVE-2026-23460 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23460 *
> CVE-2026-23461 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23461 *
> CVE-2026-23462 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23462 *
> CVE-2026-23463 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23463 *
> CVE-2026-23464 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23464 *
> CVE-2026-23465 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23465 *
> CVE-2026-23466 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23466 *
> CVE-2026-23467 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23467 *
> CVE-2026-23468 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23468 *
> CVE-2026-23469 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23469 *
> CVE-2026-23470 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23470 *
> CVE-2026-23472 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23472 *
> CVE-2026-23473 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23473 *
> CVE-2026-23474 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23474 *
> CVE-2026-23475 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23475 *
> CVE-2026-25645 (CVSS3: N/A): python3-requests
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-25645 *
> CVE-2026-31389 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31389 *
> CVE-2026-31390 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31390 *
> CVE-2026-31391 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31391 *
> CVE-2026-31392 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31392 *
> CVE-2026-31393 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31393 *
> CVE-2026-31394 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31394 *
> CVE-2026-31395 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31395 *
> CVE-2026-31396 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31396 *
> CVE-2026-31397 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31397 *
> CVE-2026-31398 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31398 *
> CVE-2026-31399 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31399 *
> CVE-2026-31400 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31400 *
> CVE-2026-31401 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31401 *
> CVE-2026-31402 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31402 *
> CVE-2026-31403 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31403 *
> CVE-2026-31404 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31404 *
> CVE-2026-31406 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31406 *
> CVE-2026-31407 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31407 *
> CVE-2026-31408 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31408 *
> CVE-2026-31409 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31409 *
> CVE-2026-31410 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31410 *
> CVE-2026-31413 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31413 *
> CVE-2026-31414 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31414 *
> CVE-2026-31415 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31415 *
> CVE-2026-31416 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31416 *
> CVE-2026-31417 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31417 *
> CVE-2026-31418 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31418 *
> CVE-2026-31419 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31419 *
> CVE-2026-31420 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31420 *
> CVE-2026-31421 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31421 *
> CVE-2026-31422 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31422 *
> CVE-2026-31423 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31423 *
> CVE-2026-31424 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31424 *
> CVE-2026-31425 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31425 *
> CVE-2026-31426 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31426 *
> CVE-2026-31427 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31427 *
> CVE-2026-31428 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31428 *
> CVE-2026-31788 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31788 *
> CVE-2026-34743 (CVSS3: N/A): xz:xz-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34743 *
> CVE-2026-34933 (CVSS3: N/A): avahi
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34933 *
> CVE-2026-34978 (CVSS3: N/A): cups
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34978 *
> CVE-2026-34979 (CVSS3: N/A): cups
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34979 *
> CVE-2026-34980 (CVSS3: N/A): cups
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34980 *
> CVE-2026-34990 (CVSS3: N/A): cups
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34990 *
> CVE-2026-39314 (CVSS3: N/A): cups
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39314 *
> CVE-2026-39316 (CVSS3: N/A): cups
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39316 *
> CVE-2026-39837 (CVSS3: N/A): cargo:cargo-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39837 *
> CVE-2026-39839 (CVSS3: N/A): cargo:cargo-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39839 *
> CVE-2026-39840 (CVSS3: N/A): cargo:cargo-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39840 *
> CVE-2026-39841 (CVSS3: N/A): cargo:cargo-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39841 *
> CVE-2026-41035 (CVSS3: N/A): rsync:rsync-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-41035 *
> CVE-2026-41080 (CVSS3: N/A): expat:expat-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-41080 *
>=20
> Removed this week: 17 CVEs
> CVE-2008-6713 (CVSS3: N/A): wic:wic-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2008-6713 *
> CVE-2025-12801 (CVSS3: N/A): nfs-utils
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-12801 *
> CVE-2025-61662 (CVSS3: N/A): grub:grub-efi:grub-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61662 *
> CVE-2025-69649 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-
> native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnI=
d=3DCVE-
> 2025-69649 *
> CVE-2025-69693 (CVSS3: N/A): ffmpeg
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-69693 *
> CVE-2026-1467 (CVSS3: N/A): libsoup
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-1467 *
> CVE-2026-1536 (CVSS3: N/A): libsoup
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-1536 *
> CVE-2026-1539 (CVSS3: N/A): libsoup
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-1539 *
> CVE-2026-1801 (CVSS3: N/A): libsoup
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-1801 *
> CVE-2026-2443 (CVSS3: N/A): libsoup
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-2443 *
> CVE-2026-25645 (CVSS3: N/A): python3-requests:python3-requests-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-25645 *
> CVE-2026-33416 (CVSS3: N/A): libpng:libpng-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-33416 *
> CVE-2026-33636 (CVSS3: N/A): libpng:libpng-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-33636 *
> CVE-2026-34714 (CVSS3: N/A): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34714 *
> CVE-2026-35093 (CVSS3: N/A): libinput
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-35093 *
> CVE-2026-35094 (CVSS3: N/A): libinput
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-35094 *
> CVE-2026-35414 (CVSS3: N/A): openssh
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-35414 *
>=20
> Full list:  Found 161 unpatched CVEs
> CVE-2019-14899 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-14899 *
> CVE-2021-3714 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3714 *
> CVE-2021-3864 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3864 *
> CVE-2022-0400 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-0400 *
> CVE-2022-1247 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1247 *
> CVE-2022-4543 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-4543 *
> CVE-2023-3397 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3397 *
> CVE-2023-3640 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3640 *
> CVE-2023-4010 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4010 *
> CVE-2023-53012 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-53012 *
> CVE-2023-53187 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-53187 *
> CVE-2023-6238 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6238 *
> CVE-2023-6240 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6240 *
> CVE-2024-2236 (CVSS3: N/A): libgcrypt:libgcrypt-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-2236 *
> CVE-2024-47850 (CVSS3: N/A): cups
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-47850 *
> CVE-2024-49854 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49854 *
> CVE-2024-50613 (CVSS3: N/A): libsndfile1
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50613 *
> CVE-2024-58251 (CVSS3: N/A): busybox
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-58251 *
> CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-6519 *
> CVE-2025-14876 (CVSS3: N/A): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-14876 *
> CVE-2025-38656 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38656 *
> CVE-2025-50422 (CVSS3: N/A): cairo:cairo-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-50422 *
> CVE-2025-52194 (CVSS3: N/A): libsndfile1
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-52194 *
> CVE-2025-59529 (CVSS3: N/A): avahi
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-59529 *
> CVE-2025-66382 (CVSS3: N/A): expat:expat-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-66382 *
> CVE-2025-68195 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68195 *
> CVE-2025-69652 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-
> native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnI=
d=3DCVE-
> 2025-69652 *
> CVE-2025-71074 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-71074 *
> CVE-2025-71145 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-71145 *
> CVE-2026-0665 (CVSS3: N/A): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-0665 *
> CVE-2026-2243 (CVSS3: N/A): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-2243 *
> CVE-2026-23327 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23327 *
> CVE-2026-23328 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23328 *
> CVE-2026-23355 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23355 *
> CVE-2026-23371 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23371 *
> CVE-2026-23374 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23374 *
> CVE-2026-23377 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23377 *
> CVE-2026-23389 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23389 *
> CVE-2026-23391 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23391 *
> CVE-2026-23392 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23392 *
> CVE-2026-23393 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23393 *
> CVE-2026-23394 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23394 *
> CVE-2026-23395 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23395 *
> CVE-2026-23396 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23396 *
> CVE-2026-23397 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23397 *
> CVE-2026-23398 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23398 *
> CVE-2026-23399 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23399 *
> CVE-2026-23401 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23401 *
> CVE-2026-23402 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23402 *
> CVE-2026-23412 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23412 *
> CVE-2026-23413 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23413 *
> CVE-2026-23414 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23414 *
> CVE-2026-23415 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23415 *
> CVE-2026-23416 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23416 *
> CVE-2026-23417 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23417 *
> CVE-2026-23427 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23427 *
> CVE-2026-23428 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23428 *
> CVE-2026-23430 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23430 *
> CVE-2026-23431 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23431 *
> CVE-2026-23434 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23434 *
> CVE-2026-23436 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23436 *
> CVE-2026-23437 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23437 *
> CVE-2026-23438 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23438 *
> CVE-2026-23439 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23439 *
> CVE-2026-23440 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23440 *
> CVE-2026-23441 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23441 *
> CVE-2026-23442 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23442 *
> CVE-2026-23443 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23443 *
> CVE-2026-23444 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23444 *
> CVE-2026-23445 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23445 *
> CVE-2026-23446 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23446 *
> CVE-2026-23447 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23447 *
> CVE-2026-23448 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23448 *
> CVE-2026-23449 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23449 *
> CVE-2026-23450 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23450 *
> CVE-2026-23451 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23451 *
> CVE-2026-23452 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23452 *
> CVE-2026-23454 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23454 *
> CVE-2026-23455 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23455 *
> CVE-2026-23456 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23456 *
> CVE-2026-23457 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23457 *
> CVE-2026-23458 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23458 *
> CVE-2026-23459 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23459 *
> CVE-2026-23460 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23460 *
> CVE-2026-23461 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23461 *
> CVE-2026-23462 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23462 *
> CVE-2026-23463 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23463 *
> CVE-2026-23464 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23464 *
> CVE-2026-23465 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23465 *
> CVE-2026-23466 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23466 *
> CVE-2026-23467 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23467 *
> CVE-2026-23468 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23468 *
> CVE-2026-23469 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23469 *
> CVE-2026-23470 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23470 *
> CVE-2026-23472 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23472 *
> CVE-2026-23473 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23473 *
> CVE-2026-23474 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23474 *
> CVE-2026-23475 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23475 *
> CVE-2026-25645 (CVSS3: N/A): python3-requests
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-25645 *
> CVE-2026-3099 (CVSS3: N/A): libsoup
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3099 *
> CVE-2026-31389 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31389 *
> CVE-2026-31390 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31390 *
> CVE-2026-31391 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31391 *
> CVE-2026-31392 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31392 *
> CVE-2026-31393 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31393 *
> CVE-2026-31394 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31394 *
> CVE-2026-31395 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31395 *
> CVE-2026-31396 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31396 *
> CVE-2026-31397 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31397 *
> CVE-2026-31398 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31398 *
> CVE-2026-31399 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31399 *
> CVE-2026-31400 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31400 *
> CVE-2026-31401 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31401 *
> CVE-2026-31402 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31402 *
> CVE-2026-31403 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31403 *
> CVE-2026-31404 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31404 *
> CVE-2026-31406 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31406 *
> CVE-2026-31407 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31407 *
> CVE-2026-31408 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31408 *
> CVE-2026-31409 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31409 *
> CVE-2026-31410 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31410 *
> CVE-2026-31413 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31413 *
> CVE-2026-31414 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31414 *
> CVE-2026-31415 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31415 *
> CVE-2026-31416 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31416 *
> CVE-2026-31417 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31417 *
> CVE-2026-31418 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31418 *
> CVE-2026-31419 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31419 *
> CVE-2026-31420 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31420 *
> CVE-2026-31421 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31421 *
> CVE-2026-31422 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31422 *
> CVE-2026-31423 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31423 *
> CVE-2026-31424 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31424 *
> CVE-2026-31425 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31425 *
> CVE-2026-31426 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31426 *
> CVE-2026-31427 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31427 *
> CVE-2026-31428 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31428 *
> CVE-2026-31788 (CVSS3: N/A): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31788 *
> CVE-2026-3441 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-
> native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnI=
d=3DCVE-
> 2026-3441 *
> CVE-2026-3442 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-
> native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnI=
d=3DCVE-
> 2026-3442 *
> CVE-2026-34743 (CVSS3: N/A): xz:xz-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34743 *
> CVE-2026-34933 (CVSS3: N/A): avahi
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34933 *
> CVE-2026-34978 (CVSS3: N/A): cups
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34978 *
> CVE-2026-34979 (CVSS3: N/A): cups
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34979 *
> CVE-2026-34980 (CVSS3: N/A): cups
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34980 *
> CVE-2026-34990 (CVSS3: N/A): cups
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34990 *
> CVE-2026-3632 (CVSS3: N/A): libsoup
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3632 *
> CVE-2026-3633 (CVSS3: N/A): libsoup
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3633 *
> CVE-2026-3634 (CVSS3: N/A): libsoup
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3634 *
> CVE-2026-39314 (CVSS3: N/A): cups
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39314 *
> CVE-2026-39316 (CVSS3: N/A): cups
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39316 *
> CVE-2026-39837 (CVSS3: N/A): cargo:cargo-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39837 *
> CVE-2026-39839 (CVSS3: N/A): cargo:cargo-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39839 *
> CVE-2026-39840 (CVSS3: N/A): cargo:cargo-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39840 *
> CVE-2026-39841 (CVSS3: N/A): cargo:cargo-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39841 *
> CVE-2026-4046 (CVSS3: N/A): glibc
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-4046 *
> CVE-2026-41035 (CVSS3: N/A): rsync:rsync-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-41035 *
> CVE-2026-41080 (CVSS3: N/A): expat:expat-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-41080 *
> CVE-2026-4271 (CVSS3: N/A): libsoup
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-4271 *
> CVE-2026-4647 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-
> native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnI=
d=3DCVE-
> 2026-4647 *
> CVE-2026-5119 (CVSS3: N/A): libsoup
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-5119 *
>=20
> Summary of CVE counts by recipe:
>   linux-yocto: 123
>   cups: 7
>   libsoup: 6
>   binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 4
>   cargo:cargo-native: 4
>   qemu:qemu-native:qemu-system-native: 4
>   avahi: 2
>   expat:expat-native: 2
>   libsndfile1: 2
>   busybox: 1
>   cairo:cairo-native: 1
>   glibc: 1
>   libgcrypt:libgcrypt-native: 1
>   python3-requests: 1
>   rsync:rsync-native: 1
>   xz:xz-native: 1
>=20
> For further information see: https://valkyrie.yocto.io/pub/non-release/pa=
tchmetrics/

