Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F78CCD18D
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 15:20:40 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.2])
 by mx.groups.io with SMTP id smtpd.web10.46587.1760368831239054526
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 08:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=T13pENgj;
 spf=pass (domain: siemens.com, ip: 52.101.69.2, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFsjRbdRP03R9hHEURjFrY8iX4ygFmwSlPFkiMA5mgylAVxurb29XuwETbqfPSs18zUpEeJ82W1S4XwIEOwhPvlS1jxPH/zj87DiTe/GdR491YfO3ln0aD2sTul5C+InVKr+JipiEqKAepno5fkL//0LwiQXYfxva7G0N/sIjgWnLZDLR/n1A8DLbfag537VB1kilgQwXLt/kYPWJFDHSOcUrM4zofWydGqtcGqUhXGP2bq6sQBEr41HRhAk9BHHkgn/0qwAYn08/YXCECXWPzl37UCvlcpB5iNczvUW/M/pxip3ZhrnKHmRqDYbD+l5iW6cT8Tojk/PDsQzext6Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LmgXwzWWVLnj/Iga8pStfF4DPDh89/uOk3wVp6qNdVw=;
 b=IIm3QxuO4fv02oq0dEgWnJdPInd8OXxZi1bT2XTKYc2LS/dz3SGpDR+OeCiLGFJvxXgLMd8OVYXcwmIrCUued144WN8z0z/W+u1F30bKcqhtSFgXRKNkUpw5qPe8Ibv/ElvKyNy7/dOdQO/CxNonNkSuxrwrZrNBVuEDLPdVVewvddHxP4UgQoVP+dP2uk/KbryhbXrbIFtCrd1mWxbgsn/YwuihNE33idrHLBpkos8+j4aWqSlCFtWvde7ZPJjUJrbzye4kfF45koQiG2FhSg2ZAqIJaxLhYuBugoSm+j9Oj1NGOlkYVxsSixZoFKhFtOmMho6A44w7s0pafw2nIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmgXwzWWVLnj/Iga8pStfF4DPDh89/uOk3wVp6qNdVw=;
 b=T13pENgjj3gxVSFrqHhpPvMCJ7skLfD0YNof4pW+yXcqGT/7iUN5EGcq0SBpcYeqkmADXwJOol5IQeppU0CjPCT/wrWIUke91kvC1ftKXNgpM5A0rSNIBy0je2rJ6l1GG9qDP03yUDWUDkqDHEenulJeBV9pqBxwgzp/wNiP9vsWKrHYUBg4iMkTrZbAtBibSMrz6V0X16euIHd9vtauKiTMoIPY1fjr8XxXmFhaN7imppuu/lLStPb/t8kCmdMYqYLptBmNT3uIcNOHaMmg/kuVB6r18V8IodFvUuMR+iUf3u64mSY1d03VTm2UVmMtJlyWctAMGngF35kHoyI5YQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM7PR10MB3908.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:14e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 15:20:27 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 15:20:27 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v3] sqlite3: upgrade 3.48.0 -> 3.50.4
Thread-Topic: [OE-core][PATCH v3] sqlite3: upgrade 3.48.0 -> 3.50.4
Thread-Index: AQHcPBA+V7X5KCzTT0WxKLArtir5BLTAC2uAgAAkZNA=
Date: Mon, 13 Oct 2025 15:20:27 +0000
Message-ID: 
 <AS1PR10MB5697DD6614465FD77FC0583DFDEAA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251013070846.505298-1-peter.marko@siemens.com>
 <F39582CD-E4B6-4524-A591-92C971883922@arm.com>
In-Reply-To: <F39582CD-E4B6-4524-A591-92C971883922@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=0b55749c-1a07-48d8-a0b2-0a591e8ecc24;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-10-13T15:13:45Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM7PR10MB3908:EE_
x-ms-office365-filtering-correlation-id: 96913752-4577-4241-d514-08de0a6c09d3
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?dFiuT2mBd8t5oQQ5gQ59+aVa9tJglJ8n+jONfk1ugULpbYRzK8bn0VV+gXWK?=
 =?us-ascii?Q?rkNhb6JHdN0rn4vfmeB4atmLF7dBd6qFUVi9K4qpikyk+0JPdDgYuhEkIkNl?=
 =?us-ascii?Q?AvCnObicoBWfusLWfKARpT5hijOygqHW3DNmXmNUyy/ooksdaDCVzc4Zq3c4?=
 =?us-ascii?Q?pm96V52hKJ8s9NlVKLI3qDdxjiBx4P+XTQbFtLy/777pUfRcBbK+87t+xHvD?=
 =?us-ascii?Q?Th7FOpml9+r2wBmhYjXNqZkgIxgONm47V116AuliwMunlG2LzrTzE3fSTOSY?=
 =?us-ascii?Q?0sgl2gyJfOSlplfHWbC4otEFjwiOS1ql5hxZtUE92tvR17qDRx7xsDq8SpBP?=
 =?us-ascii?Q?s1aF3bxTUYsq0av7JKdcY8SwPAWUZX1c4HmXmkXRSwuUlkFu2XdIbksP5KOZ?=
 =?us-ascii?Q?jiO0nvrNIhVANC4Mk3UGqKyxMNGIkUyWD4Gs3V1Nbq+Auq3R7rQA7SqGPemx?=
 =?us-ascii?Q?qbk5eynijIv0ZVJds73EPnHeUxYBZivM98wL68LIFzddCJFeAq3uGE1sfjc7?=
 =?us-ascii?Q?lrS8SOh7zjjGMzyNoweMcSC9fBJ5QsFrg31bKzkAbb6Y77TQiApDFW7YNtUf?=
 =?us-ascii?Q?DhDBPBQkHgIUp9ygo9MCVvlEalLzny3+STz0oY4GiGpnF4DT1ZmlyyJc9nfC?=
 =?us-ascii?Q?ohgtYgLKIXLDHcx5UhSwrbWdltPNkg03jUXpE1BxzRXx/cI9AC+Kg0UnDY84?=
 =?us-ascii?Q?rr52uKAyvQBMSWxxPs3n471HWyuNAPi/VzJJ+oDuIddp5bOdsINlKzKiVhEo?=
 =?us-ascii?Q?M6YARGgU29cc4Is5URlq+H6MDOmV7JxKPS3xllOtRN0cBb+HWGvfxgWYJ5U4?=
 =?us-ascii?Q?8JYpxUbWBTYEEBHP+99zQNuYeKRoISwDITVQAjgOjteAHsI6UWXwgcVZXGio?=
 =?us-ascii?Q?Xoh1RvhbHplGAS/GQYT5afWO+A3Stk2mrn9K0wabwEFzZly1U5Ptjs72N4bZ?=
 =?us-ascii?Q?nE6NdE5QqV6k9wX3VcodaKycnOrcSlcgfkkphsDIv5tX7gG+kQ7kLdUDHu2I?=
 =?us-ascii?Q?z46DHhorsodnJ04flOSz3G3KH9IHn1oPyF/a7HWUgCVlujt2xO5IbloA/pZZ?=
 =?us-ascii?Q?hZ6HRKYg7Ywq/sd4FaGxLFgjdYor0ePVJttnixL4DLyBPqRFmaWokJf1Zhbi?=
 =?us-ascii?Q?Bdy6CMm1MFV8gkXp2Oqd9t5+jBZFrkHNUmU7YOzeTz2VH0FS3sYlfm7nOT59?=
 =?us-ascii?Q?Q+36L77I3fbLiaKtRWDY0Kmky//1hJJC4reVF5siB4epKscpe0XV4Ex1kTHV?=
 =?us-ascii?Q?+Fr4NT/wF6RgSTFzb1sFbGvS2LmIaiJmHzmKZL9B/IebzfDciYRM1/a8/Id+?=
 =?us-ascii?Q?LjB5QiFRJDiOnqBAxa+auXK6wGmdEdxvDsiQk7wPSTF8B++KcsnAfBnT/OxR?=
 =?us-ascii?Q?ciKDns5XXkm9XrJiCwt2doT/1X6pgQUFPhQv6ywzsYzxDm1+pWuez3y3nev9?=
 =?us-ascii?Q?MlDQJs4SJcfCG+0P/Ybn8VJd0oYp4wGrj+qZAiySkbIiUNx1kNxDeC3CdmTt?=
 =?us-ascii?Q?gOAHpfihed9pPGEqA0ANYCbH9wEfeVrINZRy?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?HkxsamQ2ORmCpfKL+SWHFFJV5iEJiY1UFl5+05nEnyCqKOduWBkC0p0Njrz5?=
 =?us-ascii?Q?b+0aYXBGzXBu/lensC35x37rVTGTlTvEboHNKnVLJxofV9KsimFbSWKaqok6?=
 =?us-ascii?Q?V0lZOHmiZBJeNlvnrvdSTqqaAcT2hHbvCybf9CCBBZwLgo9MIwp4QhP3CMFr?=
 =?us-ascii?Q?qQQAM22tF5qYChG4esmyHnCeTJxaYc/6gMK834SQzUXqMYhYLEnwh9QjagcO?=
 =?us-ascii?Q?6itmAEo9en5ct/QJD6Qeg6YEd0bMZ+vHNdQJDZ9CSG9UGvRAbZQkoIYY0Rpv?=
 =?us-ascii?Q?+ExLzj2KbdQ3kCaOSJ/kEr3VYs0oA4FiUGahQt2ybi60PToKXFg7G0xMMo44?=
 =?us-ascii?Q?BSlQRxbN2nyt/0gndfqoWcRsSb5Q+M/MAQ7yL7F7i0Yl5NJ8UcICVdTEZDMO?=
 =?us-ascii?Q?OUAWDBG2SIXFyi8F3uocYv4uPWH3e1IFAGRBSixCipDLzq7WT794cYRjwRHl?=
 =?us-ascii?Q?7ZY/BcNpuq61DZqWP/THWa4zDEQyU1CfgZGuv4NqTFbgTzNkHhkFxunj7RPP?=
 =?us-ascii?Q?EGFCBStEQW6h8HLrNBLl5QG4QmcxaPen2vUe3pdCOKpucjaMtjd4EnehvqzK?=
 =?us-ascii?Q?/op1HaUMEF7FGfxf4cTQ6rUhONvFC6c8TSVK31370/FXZMn3zOnyZQd8mDzZ?=
 =?us-ascii?Q?9+t8j4d5QN2bT2yTado2HCAJn8cnDTY2eblQ/wBecOpAvCA14V3m1/+RLTQC?=
 =?us-ascii?Q?VIMK5yFq5I6B1imPWaefgfuT8f2tEfGG/j++4HAwsZwqp7Y/a3p06PEMxMxS?=
 =?us-ascii?Q?2G7DV6peNVN9CIJRMkVYRomC+YjlYrkXrZrTg2RsugY2j54sEUhUjjow7TG3?=
 =?us-ascii?Q?yfbB7BJNsnCno0qbr6UtOn5R5npmxzk8i6mPlyJHNTDXO7Hlv/9NnPYqIaDX?=
 =?us-ascii?Q?PhQ57x+BSJxIOUswsmnsucOgr5sJho8WSPTLQBBlyj8va3KFBKxGspl1tbA5?=
 =?us-ascii?Q?ZzYoeXILI0NkKkAojFBr/lRmSfIKxD450yD/aF7/MlIm4azPTIDq2xTKuHrn?=
 =?us-ascii?Q?ZTGVlUwBE/JlgBgWDijjM8xy6ZYz4ixyQtrT8a3210LQmj4jkkn/D9JmZOEp?=
 =?us-ascii?Q?Gi0P19uq89MbF1WwcUnySylLHC8S4wfJaCDdHJTiFiln955BcsrkVmgXchEh?=
 =?us-ascii?Q?aymWAuVVoKhQrbhvhCiTl+NxJRjiPaRGpmGG4Or3Gd/+aKyIxc2fqynUpYT0?=
 =?us-ascii?Q?RTnZgE22u1wRRl1yuUZwtsxOKrgKcqVtCZzAGaHlE+Vm4EKvyI61WjIoi5f1?=
 =?us-ascii?Q?DUDpzs/gDQynKDR4bOiE8EZXs6JAigPjoy8cxKGcxwIKWaMFDakppfS9bDUh?=
 =?us-ascii?Q?HDbdT4xWkmQ/BHdFkkQ+0hFZAZx7ER3W5CgsF9bOtHWgsgexKL8++4gQ4tET?=
 =?us-ascii?Q?sX02nDFQjJb5jzUtczCZdKWPzXdGzz0QmaAk7iS1avlXCDGilBFk3tLGX51/?=
 =?us-ascii?Q?Gd6skDtD7ZzJE406JwikFf+8GU6xRAePVgzcaTX9ssbchl3ZKxOW3kr99WGs?=
 =?us-ascii?Q?x7G1neHWOU4yfSuMHnMGVU0BZBh6E+i3TWG6vULOxKlTp5na7KY8EeNuZAN8?=
 =?us-ascii?Q?crOlLsV8ezab9VNhrPVCP36VN/sf2Zi2OrzyvHW9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 96913752-4577-4241-d514-08de0a6c09d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 15:20:27.0604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lhp8ePkxnOFUmeRm1SSTDRpF7GJiV/uTwjY3H4fAWLJiru4RnKASHM1MhXz9LDk32k8bKPKZybO1Q9TiQuO5AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3908
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 15:20:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224787



> -----Original Message-----
> From: Ross Burton <Ross.Burton@arm.com>
> Sent: Monday, October 13, 2025 15:04
> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH v3] sqlite3: upgrade 3.48.0 -> 3.50.4
>=20
> Thanks for the respin Peter.
>=20
> I presume the soversion format change is expected?
>=20
>   /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.0.8.6 =
to
> libsqlite3.so.3.50.4
>=20
> Ross

Hi Ross,

Since the build system has changed solib handling, so it's "not unexpected"=
 that the number has changed.
I did not see any distro which would upgrade sqlite to new version, so it's=
 hard to predict what number will they choose.
Or rather if they patch it to the previous number or keep the new numbering=
.

Peter


