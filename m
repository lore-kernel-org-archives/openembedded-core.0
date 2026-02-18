Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 373BBE9A03B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 12:18:51 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.62])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10774.1771417121567774623
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 04:18:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=zre4zRdk;
 spf=pass (domain: siemens.com, ip: 40.107.159.62, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNS9NirtrqUV1fE+hnER7wdjtF+tCK/5QSb2hA3T0/649heO4bjOR7uZ9K7DydMkf7r7Tdl+xCg/vFfGLtOuLxh0O+mXDiTzLympWCRejb3vIR/H800nwTp46bebXJPYfbI7eIQWGLaNsHlrvQWOnXkMKPqUQiO1Y06b8GXvhtNj4deikuTAgGSZRR6qykF4dJcwIORtUKdyIm3l+FFzTzKxWtmUOH7rlGyxk2JnfyescoJCw0glyawxJYgkEQgEQdjfugwIq28TkBsGc5SWZjcHjRJ+c0nsDi1MB4mGdbCq19DWqHwV8xc9M0RaL2xs+UWDCMpZwzPfKcxkFddE0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNW8sjo5Psth4am9MPcg2oATPMJ81EWxG4eAB6Od448=;
 b=esE0gG+3spiDShMlwFTd3AvDAHmfPg/WqgyUM771ck+hJXB71A6N/+BXncDgk3GL2qmhi77CfCLWPrGZYzqi2i9H4X1j/IdCukZoXRdwwG6CtijtQh0j/QF/O1mj4ENIrhyLL49rS0Q9ydK1hzW2p4AHsHzY94McM+jDT0VImwrmSl4JYMTPS4pBcwCqgEglsCZA/3+khekEEtpoSChBtwiqxxpP2wp97LDd2Rx2rT4Nz0uvrsrnzHv72rinFAkXJmJniinYLWNBUbBGkYieywbi+J6sSUox1lZv3h0DurrEEKO3xMpOYu1CrPf7a9rjnBB5beXpvM/RzrbWCEy5aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNW8sjo5Psth4am9MPcg2oATPMJ81EWxG4eAB6Od448=;
 b=zre4zRdk+2wWk6SPFWnTxR2PBhInrESB/yjs4gnkpoduAiGK5nNjtPnC+Ic6ICmuE84XnBZjV80GOFe5K2IAL0DfnRQUjiVdzr7ijAdLUtC2uF0S/hQRhJVoq1Wo5uhxMJPz02ypi1D9u3nUERnU8KWAnzz8vPYUD0nH7yxnozxuRyhK4xnqq2SY98PGcgTYgIB+H7s9k4dl2P0PiEsdE+CXtE89HkmaAW6M+uPPQVijaHTkS9d4ulTqkgAjQzQIQT1YCbObVHkyaeiykDRh+4LDZOC6pTtQ2tlrEb1t5qmx1X8EIVuYdqIAU7RoJitIFCU6Sb9eM2v0hhKOtYYT4g==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB7008.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 12:18:37 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 12:18:35 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "vanusuri@mvista.com" <vanusuri@mvista.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][kirkstone][PATCH] glib-2.0: Fix CVE-2026-0988
Thread-Topic: [OE-core][kirkstone][PATCH] glib-2.0: Fix CVE-2026-0988
Thread-Index: AQHcoNA4KkGg9TM5u0af6rsXgtsfPrWIX1JA
Date: Wed, 18 Feb 2026 12:18:34 +0000
Message-ID: 
 <AS1PR10MB56972066B8E4255BC4EC3B67FD6AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260218121438.514114-1-vanusuri@mvista.com>
In-Reply-To: <20260218121438.514114-1-vanusuri@mvista.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=cc23e441-20c5-4108-aea3-445cee4acb9d;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-18T12:16:56Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB7008:EE_
x-ms-office365-filtering-correlation-id: 94caee90-6b77-4a32-6fb1-08de6ee7d691
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?IvAq8LHin2sDuqGy7IKKdzGcc+S772GN4CeEqkGE3NBpOYDcy++QZIzpUw70?=
 =?us-ascii?Q?we7IjBxIo6JBZ2npuY1hTijFNJnGM2h0apZjKqKG0bdFeG5DkFkK/wqUUKJl?=
 =?us-ascii?Q?ErQJYExq0Xnbv9M53upHCnL8Vbx14jcGGcRTqEPZiPW/CHhCHkn1jMrd4yWl?=
 =?us-ascii?Q?prg8lj/RmccWOmZ5478ETjeVx4UoU8pmB6RsMmEgzA0KbcX/SB//PyZ8F+IT?=
 =?us-ascii?Q?dN2hpnDUOZqVe9e0I+fr1RyWpUA9EWB+5rWal1uGmTLzyk7aUIB8531JqN3m?=
 =?us-ascii?Q?RD9wN1o65OH5th6No7+5bxCVCBqWB3u72UDlB/WooQ2zI1YRURr7lrSqqGvk?=
 =?us-ascii?Q?UhYrHPnlqrPk3MqYAWZH0fni8fW044QdZx+hZeAFizH0uHonjn2uJZkbp9mW?=
 =?us-ascii?Q?aFgY4R1GJ+WHG6xwt2seyHQTmVjMuraSi6kMsTKHw0/X1Tn7dppkzU1K/Z67?=
 =?us-ascii?Q?zRcQ2hsPBxTBJ1BNjjLjG9sZji3ZU750C649NGxkXRh3ubbS/+CwCoDUv7JH?=
 =?us-ascii?Q?mXXHquy8i5iR04n+DOKHezkptIomvBVcnFopT/+ysMbvyZleoRbSmUUdO3Zv?=
 =?us-ascii?Q?tLBVHqqb7Hi/4LgUv5bY98Zr0cdvyGGyjXIEcus+N89HuXfcorCRsoBXue09?=
 =?us-ascii?Q?rgr8XIoDbbI5I7VUxZrwL2wRaHc1392aXdLpYpcNZ4hMoucv3KUYQVGHc4l6?=
 =?us-ascii?Q?/8djnvYBvR/UAq1BpVv/PD9XfnAkWfj0Kxw7afCsZeUA/pIjUpl2LutagcS+?=
 =?us-ascii?Q?gOmmJxfPocV7VfRE6/Ont7N4Lpa3+UMFu24Uux+iQaOn9dwxM1Uj0/7+fEV6?=
 =?us-ascii?Q?7mnF0AmQYOj6B3fAhihwk/CQgCLXCcAJIAQqIJH61TNnv0ctHbfxrkeeb7yV?=
 =?us-ascii?Q?MCyZavqxUcmdHLmHGPR73qmwSOI5bA1YcudIZEaVqfhjiiOvkAtfbExzwPcy?=
 =?us-ascii?Q?AdTWupyAi+lvuWnuorb0NKjyVciyABMGkNCS735hNhO5A8EHUA82Uys2oUJk?=
 =?us-ascii?Q?4PIv0zDEIOEOle2xQQSqGHbkBq/csx5VCpdVB/+wYbO0/4HZyjOXmYCwqBJn?=
 =?us-ascii?Q?H0QZlgfNu+GKfED1pg+IrvVyr2tT6jh7/QAGPnkn3nMuT1fKVWseg1ut/0Al?=
 =?us-ascii?Q?Dx5jIC9zMhwTxOKl2Y/AAn3noJhXvePiJE2a1ZW1sscsvJWGb+9p4MMRzmbb?=
 =?us-ascii?Q?NzWu+4qwrQCkfMCatnN8DyMmIjeDTBbMyCzcgrgIeNew2cHUmJ0VmRaYltcj?=
 =?us-ascii?Q?s4rHvHQH2Q3Gujb1XAbvBlOspkcUP1giTAsVizDLs4Pwwh3dJALP+bJvylqo?=
 =?us-ascii?Q?HRZwZ581b6N/waDXDuKyUsloI6rcOt7bsMATMoLxzi6wSCi4KLWYuW4T1mTL?=
 =?us-ascii?Q?S7F+6BF4Z9t+hgp0prlssQSq9/G9tJ+x9y1N+9GaA0pMfxDxVZLwFBrK8sNq?=
 =?us-ascii?Q?vOh6CqNeHYM/N5VicG9mJY2odCBPN6gT3bkv5AJ/jV/4KFewvZhhVG/dX6dL?=
 =?us-ascii?Q?bLrWsxt4qnhgaEIYZteH8iCMvYoDSSSFk9KpNi/sqK2qKSUnwqcWWtQZMF84?=
 =?us-ascii?Q?NY5vRKCz5gZPnNSNmT9fRIuz/w3ctgxHW9sWZEPg?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?IC+e+Oj5EXHOEjcOPm5KbvMig4ycpMha7sc6/vDAn39TW2ydoSQI+kO9QoSF?=
 =?us-ascii?Q?vAgY1fjjnYqiMb9PfYz0h/SFJSHwXXC751iK0sCwBu8RvzeOIeKIrBIHoj5w?=
 =?us-ascii?Q?AcJChrHZ36FKk68fRj+OcbNweZrBbGQVSu7SnR+VaNLaiN64D1DkClJeHCxd?=
 =?us-ascii?Q?LsBsffXT4mPlNqb37LuW5Uv2AcV3hmbgbgBOf/Ru+U2+8LrG1pLXYNHcB0v4?=
 =?us-ascii?Q?2LHrTEQoSVUU8bd2sTxRHPJzyAcBXUWic2nNzsOqR6h9cV0eLAoqWElHZxAb?=
 =?us-ascii?Q?Z6YHU2ACYejQ1AQc7pu61XsQDGX385v55OJe2z6LCeB3GachZrsp3RXrSimx?=
 =?us-ascii?Q?zG5323OEBn6EF/Xx3LxJzql9j/dndhBMGubZZR2tgL1GVMPZ5QFbtmHFSmC4?=
 =?us-ascii?Q?2UdWR/KBAvJLmyGHJid5dLZRR6luZTC0dPEBiV1YUTD+Eo09PNgJ0nYTudpq?=
 =?us-ascii?Q?iH95Hz2pDb8BWI/IKP+CeizdvO94F2E1wq1qQ0bMujK9YfPpvGSWfhTD09NI?=
 =?us-ascii?Q?k4IAHdITk+jetjMTlI4h2MAAUOEirrNtv7XMR3bNGxQpdv8Y27TRBFEPysYj?=
 =?us-ascii?Q?2VehdvPPLqD3D3uH11l10m7vuhy+QHHZdgtpIoqoHtYWaDmI3Q7w9Qo0H+0R?=
 =?us-ascii?Q?Hxhp8DyzNta9csPt+bFpIPZ4KHwKVhk62XEhmZmwYd0/5er8ozXdxyEKrgtf?=
 =?us-ascii?Q?QxcZAsCy/tjqhKlZcu6PUFdV170TKhKCpGgDRGpAQXTdvme5nLN2pdAHvA//?=
 =?us-ascii?Q?HSmAdPv9V+p1fUhfWKRznKle7YV/Zn+ABvnMQjmWnGhJ5HhTViVdu8AJTz7d?=
 =?us-ascii?Q?95DiePuaDOaue+YdUHKtdenLM01ynl7IbSIY2VwWL0z1JzAGRsNBlcvnMHSe?=
 =?us-ascii?Q?oVdKyG8KSfLrxYpX5zMQKwphQ6E8KFQ3f7gpCi+ThD8z3OQ8ILO/IixlMRZ5?=
 =?us-ascii?Q?M9xEPfNWtxo0N6RvYncviRjdbNcDielvY7amd886C+Y/3+kmtyhYVx4yr/1f?=
 =?us-ascii?Q?uzrUHi2xavuUMa8IuaYTejRCAzz5pNLiFvIHFkeDE+cjbipM4LP3Lb+Hc36B?=
 =?us-ascii?Q?G9I4s007m+hlnX6wrNa9uGYBZ59+KkMv912nqnEz3dd9IfKgr2RQd0OMiqMU?=
 =?us-ascii?Q?9ytb45bZjKFKN7kQwexX8aV1tiCjYe5gHWiYUpv8v/AriXtuVsuqzVLkwsLR?=
 =?us-ascii?Q?mVzvWAlIf1QhTnfPz3QvNSybyGKjMHQBk3HpjTM2tygZb4Z6dGYQlg/qIjUf?=
 =?us-ascii?Q?AhYkuRVjkpWm0ykX3GaDGWwwO02sYGe/ipNfl5VYKgtwpdifm6gL2sUvndsI?=
 =?us-ascii?Q?uT5k2pICb92jTEiczbNGBANAAs74y4NGFwsL65MMaE+t1dZzRDpMtcvljhw6?=
 =?us-ascii?Q?Qe8CF4kKx5ejEbY5wFIokUzz/Glxuld/nKwkGqFonUdK7+OAXUstbbuxJeig?=
 =?us-ascii?Q?m0aHTlqb7IyYXjjc9PHBWG2zyh3c0Bc4l13ftdDBX7yYVGUNJ3/mQsAI4+4m?=
 =?us-ascii?Q?PnUe6PRKCdJIcx0t3xO2S7cL3SRQZ71kmv8A6PwNkA39ShSrjLkOpODNshP9?=
 =?us-ascii?Q?FnYh0th4P+dOG0DkvqTIxNK5kLeHLpdxX7Ty1m8Pwk7qWroQKCHdfcDo7goC?=
 =?us-ascii?Q?tH4yUAFvf1QaPM2EUPIIgbIxe66HvpzOWiAgbZPLUW5079Pzf0MW0jaOUOzF?=
 =?us-ascii?Q?sG+PZyBDlKxF3aespSnk7wKt6wJYuWFlbqrxt6QVFGCIji5o3Y6KKEmEpfmb?=
 =?us-ascii?Q?adb61DM1VA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 94caee90-6b77-4a32-6fb1-08de6ee7d691
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 12:18:34.8861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bjK6X5vUoelqD72Y1PvggSeRhDHQOdQTN8lyx/Dl5SLuFIcRY7bQOWAkqCdD9jkVc+KFha4KQgMj+OU6WzXbjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 12:18:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231297

This is already submitted almost 4 weeks ago.
https://lists.openembedded.org/g/openembedded-core/message/229927
Since the nut branches are not updated that often nowadays, it's worth look=
ing at the mailing list...

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Vijay Anusuri via
> lists.openembedded.org
> Sent: Wednesday, February 18, 2026 13:15
> To: openembedded-core@lists.openembedded.org
> Cc: Vijay Anusuri <vanusuri@mvista.com>
> Subject: [OE-core][kirkstone][PATCH] glib-2.0: Fix CVE-2026-0988
>=20
> From: Vijay Anusuri <vanusuri@mvista.com>
>=20
> Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/glib/-
> /commit/c5766cff61ffce0b8e787eae09908ac348338e5f
>=20
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../glib-2.0/glib-2.0/CVE-2026-0988.patch     | 61 +++++++++++++++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.pat=
ch
>=20
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch
> b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch
> new file mode 100644
> index 0000000000..1b67b162af
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch
> @@ -0,0 +1,61 @@
> +From c5766cff61ffce0b8e787eae09908ac348338e5f Mon Sep 17 00:00:00 2001
> +From: Philip Withnall <pwithnall@gnome.org>
> +Date: Thu, 18 Dec 2025 23:12:18 +0000
> +Subject: [PATCH] gbufferedinputstream: Fix a potential integer overflow =
in
> + peek()
> +
> +If the caller provides `offset` and `count` arguments which overflow,
> +their sum will overflow and could lead to `memcpy()` reading out more
> +memory than expected.
> +
> +Spotted by Codean Labs.
> +
> +Signed-off-by: Philip Withnall <pwithnall@gnome.org>
> +
> +Fixes: #3851
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-
> /commit/c5766cff61ffce0b8e787eae09908ac348338e5f]
> +CVE: CVE-2026-0988
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + gio/gbufferedinputstream.c        |  2 +-
> + gio/tests/buffered-input-stream.c | 10 ++++++++++
> + 2 files changed, 11 insertions(+), 1 deletion(-)
> +
> +diff --git a/gio/gbufferedinputstream.c b/gio/gbufferedinputstream.c
> +index 9e6bacc62d..56d656be04 100644
> +--- a/gio/gbufferedinputstream.c
> ++++ b/gio/gbufferedinputstream.c
> +@@ -591,7 +591,7 @@ g_buffered_input_stream_peek (GBufferedInputStream
> *stream,
> +
> +   available =3D g_buffered_input_stream_get_available (stream);
> +
> +-  if (offset > available)
> ++  if (offset > available || offset > G_MAXSIZE - count)
> +     return 0;
> +
> +   end =3D MIN (offset + count, available);
> +diff --git a/gio/tests/buffered-input-stream.c b/gio/tests/buffered-inpu=
t-stream.c
> +index a1af4eefff..2b2a0d9aa9 100644
> +--- a/gio/tests/buffered-input-stream.c
> ++++ b/gio/tests/buffered-input-stream.c
> +@@ -60,6 +60,16 @@ test_peek (void)
> +   g_assert_cmpint (npeek, =3D=3D, 0);
> +   g_free (buffer);
> +
> ++  buffer =3D g_new0 (char, 64);
> ++  npeek =3D g_buffered_input_stream_peek (G_BUFFERED_INPUT_STREAM
> (in), buffer, 8, 0);
> ++  g_assert_cmpint (npeek, =3D=3D, 0);
> ++  g_free (buffer);
> ++
> ++  buffer =3D g_new0 (char, 64);
> ++  npeek =3D g_buffered_input_stream_peek (G_BUFFERED_INPUT_STREAM
> (in), buffer, 5, G_MAXSIZE);
> ++  g_assert_cmpint (npeek, =3D=3D, 0);
> ++  g_free (buffer);
> ++
> +   g_object_unref (in);
> +   g_object_unref (base);
> + }
> +--
> +GitLab
> +
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes=
-core/glib-
> 2.0/glib-2.0_2.72.3.bb
> index 50701be3d0..7c0ed01f55 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
> @@ -70,6 +70,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-
> ${PV}.tar.xz \
>             file://CVE-2025-14087-02.patch \
>             file://CVE-2025-14087-03.patch \
>             file://CVE-2025-14512.patch \
> +           file://CVE-2026-0988.patch \
>             "
>  SRC_URI:append:class-native =3D " file://relocate-modules.patch"
>=20
> --
> 2.25.1


