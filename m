Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B30AC3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 16:22:24 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.39])
 by mx.groups.io with SMTP id smtpd.web11.1193.1743438137143627759
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 09:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jUzY5eeB;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jUzY5eeB;
 spf=pass (domain: arm.com, ip: 52.101.66.39, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FGU/HKJMTsJ+mBlz1KT9LQshaeKO46/OMIVJ8soBjd8ROJ/wHrdXMQvw5zaiY/axqWOW3kAJHLUUzfZm3cjIup0V6YPXlk2c8eX7N382WlsMwHCyvB+HmMchipSA+FS+YiDjHdP3M0iwSHaFJzMHnK/BkPlH/8lXz8aFc0g4QYjphJhBbR7As/xe3VdGKDfmNT03dfi2xU/TL/fDYd0R5Cp5slhLgYXBcbn+aZ6NGb2S4/r25fyGe1M3q0YSSzzBeKl75eBIAgu1kR6EIqdK0/AJH9NIjb+PyN0hIWVHNsmu1xHtFd/iEc0gr693H0hWtAZT6qRdekykCs2JCsgr5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3U32ADWFucvoHEY76tYivYIU6If//yiVcnov4Ala7w=;
 b=bFPtJbndx2jLFy9dpqqlFL0QgCzoA+q1l0/O+3sjBW/EVSAYLlbfkP4JONXLv6pOsCvF8Ft9ddXflGuxnF1CFqLANyzCDTeRikw11cOkzgf/H3kMw5zaqLtj3te7ShKT2wyJ3dELSWrjVAt1D1MBu+e+95zI6w7KPBc52aR36MOfmHEWJuuc5lMIi3ZaR8wuFNM9CC7uIUY4xEFiJE/b6B3C6o/4ANR0/YLYieQ9M6yLxw9NC2hFuR1bAld+Rw2z/p4P5PQphjP1vQ98sxfk/URxWeZ5tm4yc+mM/oa2JU4t63DiTglgzguBeVMBfF9ns+N0FntpoLI6rRxwQk/KKg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=vaisala.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3U32ADWFucvoHEY76tYivYIU6If//yiVcnov4Ala7w=;
 b=jUzY5eeBh+rnBWRpO9CvD/f/4J8sPosy57Cm+GQ82BAKuqIxA2Wx2azvdYulqldwS9PL8wqWJTO+ABGUeYi9oVRE46tvTVnJr1vn7oBW7sC21GPFAfmPGBMJODRs6PRcEjv0NW1DX9A49EkSHiPbliLDUtY3br8wljE5y6CXgro=
Received: from DU2PR04CA0179.eurprd04.prod.outlook.com (2603:10a6:10:2b0::34)
 by DU0PR08MB8908.eurprd08.prod.outlook.com (2603:10a6:10:464::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 16:22:13 +0000
Received: from DU2PEPF00028D06.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::68) by DU2PR04CA0179.outlook.office365.com
 (2603:10a6:10:2b0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Mon,
 31 Mar 2025 16:22:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D06.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Mon, 31 Mar 2025 16:22:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vTomiSB+SCqFcgw/Hde513iAy5Idq7KGyAxRXg6LARuc9nETOm3CACCWDdNUguhGMAfl65Hge33JGMMMMs04MFZN5E4HtILsCLHtImeYDoxQOJ0FFZoHdXWn9l0/BXOqlFyL/j6E+x0IFifR5ch3fufgQx2lD5CigwQ+V/qGfwAc+hTyq5ctvzBKP9cVhkFWiY3Qz0Wa1jYyZdFgcWlDloiyOreo36zHSK2MkIS7u1z/l4flUzI/9934ObFwZpIK0Dy64Vg8UzNmxcF4maRfQGYLZ1W7wH+itIpf8dEhmfJWUQYAAhplJgsU7wnHb6MtSmByc9Ly+i47+ChdAcX56A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3U32ADWFucvoHEY76tYivYIU6If//yiVcnov4Ala7w=;
 b=YWAx2Po5bUwyYfF20+hmuZREZ7iNM0JmheSPpid+1s3DyRyUHtBmMa2mdpl2oTaYykmFMDYAE5pi+uysaFzR3sW7Pb8MWTgNDaAy1FBI0fiMfibxzXnxcGL7vBpP8cJnYmOg5DGyKodgGmkf8tvvq1aTZh+Se3UbfZi6rVKo49lcfpMs8/d06uRlGGbj+vq/dRoZphDGrHrA8T8vPhwHWjCj056drSMlLzKGpfndQbe8TX6RjJbxeOQnEM7bUYtjVYWlE3FCp0r8Btdk8KssHbuNJfIw18oLxx9t6RpDC7LYeDRnU/t5f38rJqJYsGromiKM9u2m03rdRbfHvgLICg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3U32ADWFucvoHEY76tYivYIU6If//yiVcnov4Ala7w=;
 b=jUzY5eeBh+rnBWRpO9CvD/f/4J8sPosy57Cm+GQ82BAKuqIxA2Wx2azvdYulqldwS9PL8wqWJTO+ABGUeYi9oVRE46tvTVnJr1vn7oBW7sC21GPFAfmPGBMJODRs6PRcEjv0NW1DX9A49EkSHiPbliLDUtY3br8wljE5y6CXgro=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9052.eurprd08.prod.outlook.com (2603:10a6:10:474::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Mon, 31 Mar
 2025 16:21:40 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 16:21:40 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Niko Mauno <niko.mauno@vaisala.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 6/6] recipes-connectivity: Support alternative runtime
 D-Bus
Thread-Topic: [PATCH v2 6/6] recipes-connectivity: Support alternative runtime
 D-Bus
Thread-Index: AQHbn/JdWVu8RxZUVEmHv6pEk4kkQrONcgYA
Date: Mon, 31 Mar 2025 16:21:40 +0000
Message-ID: <80F71DA3-7A19-446F-B16F-AC3619AB8566@arm.com>
References: <20250328150136.1855862-1-niko.mauno@vaisala.com>
 <20250328150136.1855862-6-niko.mauno@vaisala.com>
In-Reply-To: <20250328150136.1855862-6-niko.mauno@vaisala.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-mailer: Apple Mail (2.3826.400.131.1.6)
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9052:EE_|DU2PEPF00028D06:EE_|DU0PR08MB8908:EE_
X-MS-Office365-Filtering-Correlation-Id: dee8fd16-7fe7-48db-1669-08dd70703210
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?tX0vdIIEVT/QyPDNSZSBex+lg4Q0BdnXDNFWrWRJX2Zmd20xV/FO1rYSr3V4?=
 =?us-ascii?Q?zc2EO6e9Ql2Jz41wjfLj+O+2K+M2mt+IHR8DROla06eKmWRDtpu3JG9pdWRr?=
 =?us-ascii?Q?z0YfVMBP5mIfClI6T528oZObL0DslMk3F4x4nIc6dcqI1xw2kJIydijFCwpi?=
 =?us-ascii?Q?9LtCrOEW/9SrcaN287tDsZ9t4ly1DOqGNlhKlqK/toFoVMIKBfHqjN0NZ1hn?=
 =?us-ascii?Q?ZiOsizWMR8i5hHp52kvKsPnMera1W48DcZ+AcUR9h5cnojoijz8mti2EHuPo?=
 =?us-ascii?Q?2PEYGtN6gn/DlVHizXaRrs/IuC79ZRM42FCqdaSv0M/dwU/oymWACsNbRz5l?=
 =?us-ascii?Q?0FofU/V7/ZNbEsc/6MxiVSGdI4oMm7jZYHs5bY+vXfD0LYISO5leXLJChc5N?=
 =?us-ascii?Q?kmlHRGfNAxI3OE47ThYixT3Iy+VJnPa67rxkjQi4b4YDZJb6qzNz8D81iCmF?=
 =?us-ascii?Q?Zu8L6zn4sC5kMWfJ3+hq/7F9pbJH4iZijal1QW5IKZ02EE6KPCy9Cpm56mJu?=
 =?us-ascii?Q?DqNKRldxDER5N4oy8lt2wobSvM/ki2p2WFne2k8Zo58FDId2XsM9MzMyRQhj?=
 =?us-ascii?Q?i5vX0JCTE5N0BDedWzOWfaM5wfSx3XgDWObFmyJuMRQO8P0heaNIhUteoU/3?=
 =?us-ascii?Q?pYztmigJw9KjCFHC8INqurlurxgd05kYth9Sw7dMwoq20hNTbBY+QJ1xSSvp?=
 =?us-ascii?Q?XdQkZtRbUFEgQoAwlpw+4U0ym8NbZB7O24vg6IqUYu4/KUhCG4DqCTbFkb4F?=
 =?us-ascii?Q?zP2l1vcsP6PK/Q0BSxlFMs5Cda3wSRHkv9mVBHqfTquxyvHax6Su2EmfEV9Y?=
 =?us-ascii?Q?tDwbEDXrqSyMieXDSE1PZ9mLLpTHgxH2F9HwqnmQd+XAT7pWSc0MuQTEGAnS?=
 =?us-ascii?Q?99dwzFG7bv9TKgAh4e1kcKSA36LNLOs8y5w1ZqybPm4qRLRv7FJSwBuKlMiv?=
 =?us-ascii?Q?7YsrTannDgIrBY2Uun0qPb2kusNufRtawy4Eod1dGzQHtUqxylIzcvQQCT1c?=
 =?us-ascii?Q?G2uhGoYgn9QYY/2BKgbrhxoz63aIbBOb+FO7pux3e/z8pXF7iOrADkYid0kx?=
 =?us-ascii?Q?G55x2EyC2i5BWWWHlwCb7laRktiBcDuIwR3CoCcAwMRhhTArWsJvDPWoGLNO?=
 =?us-ascii?Q?8/YYIcCBfMIBDS/wYvD2/NotyluvmUU9Z/sYPgruU+VbgblV2Ep/XA1GRMi8?=
 =?us-ascii?Q?QFysWyTOY1LrOADjFC9mh8UvNvbl4BuRfRP5CHV7QUvGI8Ua152Fa+ty+nrs?=
 =?us-ascii?Q?cB2r6jK95qvAXjiKlI3b6zyVg00D5j72Y3bbnOrwuQKTkM3CMperV8HY+Y9B?=
 =?us-ascii?Q?P51WNZDs0dWawW0OQuqIYnoJIrxUowo3+40LrMRcx5DdWZWPRI2EFtZkknVe?=
 =?us-ascii?Q?WLUTvC64gTL2WpiV+1LqbFy7Z/fmYs11XlDPGBQj6RAMNmHhKaOoPks1IYpI?=
 =?us-ascii?Q?1F3kYRbgVbgE5mjWAy66Frlj75so9TsW?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9EC76328CC99644AA95CF244E6F3823A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9052
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	daab7ab0-406d-4eb1-bbec-08dd70701e97
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|14060799003|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Qew4c9T/o4Ioe6lR8oe/itSMMXacl4vGXDe1BRihPWm5FAnZiDUi70XDJS2k?=
 =?us-ascii?Q?rp0LuqTgencI7WHv1TkIptlOrBedJo++esXRySOtf1yQZImX3TJINnN5xaU8?=
 =?us-ascii?Q?N+paidRwQ41qYg4nn8CHkC2TlvpI0O2yYy7jKFIiQOirPFH4UzgjN3JLZlzz?=
 =?us-ascii?Q?7Gq/YsFY3sfDr6U6OUMnzUSjCGO/PjQNhPRxfjbuEqSDUZCnZXx0fzYf/1jZ?=
 =?us-ascii?Q?78D6tbKLAJdqxHvCH5nRv4oECQopHQk3kc+/8T4VofFv7r25KXFTmKL3F2X+?=
 =?us-ascii?Q?jwcRJFUpVb9aKGjztwe73u2YzFRu1RQH/OZlBiH1meB5N8TsCBY+aa22MbKX?=
 =?us-ascii?Q?yBH+rz2kH+6nGzQoCQ7SoTFruifK+QYHMtNS68CE98mxo8HWwWNpP8TgDNMM?=
 =?us-ascii?Q?+W/On2nxGSbfi9pZzU1sL6yB3xK6HlcdETAUiHxB236IPkaIfojWQWuNyww9?=
 =?us-ascii?Q?QjmTlIiksU6wA35kJsc0x5+pxj6nW2NmWPwbuGOanCvMcpBRSkPPn+FOdroD?=
 =?us-ascii?Q?73DyDEmGooOfi6mRpaYiBzD0rWRrcQNN/TiarQ+C4ZHmWRHCCd9L+Z8SXefP?=
 =?us-ascii?Q?pUnGF36xbMcwxXMN/Q28JzneSQ2tBQIP9EpYJnDEjxudfjfmAvVrlmxwgXkn?=
 =?us-ascii?Q?bc0C1wT1rcHImXwWFdf0wHdUpSXVgIrQEeJfUcQ92Zsu9ENl+bdSwn26QGrm?=
 =?us-ascii?Q?97JyviwciWEq3O16FlKkvfcK0+07CZ2EMB/HUupnm11wFOsfK1+8l8TMi9Kv?=
 =?us-ascii?Q?srgX+8JMwWBcMMDhqt2HL8dvBEv+Gr5BCsdvZfJGxRgpHuwx1acW68eUh8HP?=
 =?us-ascii?Q?yDOe3tkSejzBxbVYbs/GhVo+nj4jobfFmiuxomYeyvgw6ht8OcdTzfItPZx6?=
 =?us-ascii?Q?4ykRupzTzNUOssNadsEpttsnrmGPajC23HQtoE9HXAop0kONm+LwD5J0fobL?=
 =?us-ascii?Q?YLxkJRhKAaJtWaNjdsvji1YqA4ChoazvYTwR7qDyII6HKi/4qC3QqksWXB46?=
 =?us-ascii?Q?hsWqKLbwY/bEJIgfwcXCiW8tX7StJ2bC8icxlrp4IycWRhipVpn42YHEYJEm?=
 =?us-ascii?Q?Nd+tU8V7uHPjxDLpljbUrxQYYzZ20fPOveAXKeXVsZ+rrpxFHFlRbl85086+?=
 =?us-ascii?Q?Xq2/jw/reVszfyCL8suCXkykGN4ak0twHHKHmvCZM01jptCjdD0X+zOKA1D4?=
 =?us-ascii?Q?2DXZNhBgLMF9JT2faFGi7rTbomL9RwgCG2vsZyWgmqrXdqwMz6chbTNYHUvg?=
 =?us-ascii?Q?7aihP98pzfvMkxF3Fpxo6q9R19ZpBFFnspevEZtISl/bxOz7XmUzuNUqDEX9?=
 =?us-ascii?Q?tz0oAVg0dEmo8GnLCL93zOjVsmScqhimxhmnQb4FZVjRmwsQZ5m2Sbcm71Zo?=
 =?us-ascii?Q?x+pKnjQ7UpYSuNhtwUupuTpW/Zv5yg5t7pQmLSJaLJwIghdFtc5lPnfs/fSW?=
 =?us-ascii?Q?9AFCI49JyyGdikEztJVR9dCqz7o1DK4c6+VZtkA1lXCYURCvYJdKhA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(14060799003)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 16:22:13.4572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dee8fd16-7fe7-48db-1669-08dd70703210
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8908
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 16:22:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213989

On 28 Mar 2025, at 15:01, Niko Mauno <niko.mauno@vaisala.com> wrote:
> -RDEPENDS:${PN} +=3D "dbus"
> +RDEPENDS:${PN} +=3D "${VIRTUAL-RUNTIME_dbus}"

I suspect you can actually drop these lines in this patch instead of changi=
ng it to use the variable, as the binaries use libdbus then they will pull =
in the bus via that dependency anyway.

Ross=

