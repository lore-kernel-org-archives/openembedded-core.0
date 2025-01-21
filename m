Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F9AC02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 15:31:03 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.18])
 by mx.groups.io with SMTP id smtpd.web11.18256.1737473463122646030
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 07:31:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ocE7xSpY;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ocE7xSpY;
 spf=pass (domain: arm.com, ip: 52.101.65.18, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TYW49LGH2D45C2x+iGsSmD1mvFMglBgSrc2miDBooRTfMn0aJhvDYVynTa7kjOdDLyZsgk91h0bZah82+TorA16jxhdkgMUZVaOSLHKX0upAnISGUHqmvld/u6PK9pLjXeF0e2Tgdy4IdZOcvBUp0taY1t9YIDZh5sdFkDSp8xuFqwZxxFaFPj5j+gQB99qBEyJLABvGL9iY8sD1590W2eYwHFWDjy98haLpWEsch5IFURGFtfNHJ9rpxMPXPaIFiFD5PJ6Ls97lJk5odCzW9t/92rwQeLm0tWrcgpGFoRJSjzxAVMV/0TTWhoNpDANDmkN5bLR+tBya174rg+ay1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoJ+5s7kGcxh5NR2E/QFGKB3owDw78E49n2lEIB46B4=;
 b=X5LO5nFreZ1OYWlEfFZ2dE7e8e400J4Unl/WCRDD56NWccy7FFrHGZ7vXAVD4hxZxAmEgaY7U2O5o4h5yWri5r1WsiDdDHsMxJu9n3ht2/4BhS7LgN0N662qJa1+mGwKUiliLHz4kSO8SMeIsi+7NQvl17VtcGGCAnzCNF9l0BvIX0lynIsgNfiUC9MFjeUtWtjE/YRr6xFgCGUC7xKv1eoz7IimQ+UNB7MjVo0NONV5CMmQDQbST/XA2D0qmN1g9ShfjNhQ28fvwWcVin+e3qv197MVgyj1JuLvF11uO3a+R/d+fpN8V8maZUf91uhxH75uJ11xyXVmAeZJgIEUaw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoJ+5s7kGcxh5NR2E/QFGKB3owDw78E49n2lEIB46B4=;
 b=ocE7xSpY5MxL97yY0Ssq141dDfN3ZSrh3fGUpgW28fX7TekXZ79RzQ5hBWkHU0LjDX8Ppkzj8Y8BHeIDLGwGdZo03B+hr/9oN3/FXRFJFQxpQuREJiPe+odb8xRX5N3NoWZ5J1PD2ycDGOSbDw2wmdxTsnzFeQRuP5JZq1ofoWQ=
Received: from AS4P192CA0016.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::11)
 by VI0PR08MB11133.eurprd08.prod.outlook.com (2603:10a6:800:257::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 15:30:56 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::7d) by AS4P192CA0016.outlook.office365.com
 (2603:10a6:20b:5e1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.23 via Frontend Transport; Tue,
 21 Jan 2025 15:30:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.8
 via Frontend Transport; Tue, 21 Jan 2025 15:30:56 +0000
Received: ("Tessian outbound db4187c85a3b:v543"); Tue, 21 Jan 2025 15:30:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fa27c956a582598f
X-TessianGatewayMetadata: ekMY1rRd4MIAaLwaAvNV7rqoLx1R20depPaQ4Wr1ALvt25KH5UHhy7rhY2RdS/pkdNJ05as3PjYt8uzXpJB8H8QmvEPP/3G+og16WpHY6UtPOShu2fpHWgTXOc0vi/YyeXJGt5EsFoeG8yCkfTyInDNoR4b5hdvVu8OOIkXWU/Y=
X-CR-MTA-TID: 64aa7808
Received: from L73537443f029.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6291EC55-C986-4302-837F-F526D3B15675.1;
	Tue, 21 Jan 2025 15:30:48 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L73537443f029.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 21 Jan 2025 15:30:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ey48E+wro1aydjwFVwhL/YgOMvxknXJTNxj32IvKnq+/444GRBdzxlkaX3nLGfen8wepBG5CEwQAxOIKZSREES+9qK/nHNfZXCdx6JT8ToAbyRno/kEIgAk0d1cDqt8+1n6R5LDcA5qzARyUokraTmYIg4xMiIo0s0Oq10/G0ORrj8tgQplqhOCK6XrA/2bEGn4O+RP0KC3DKJL+GcaUt/Q1xEFgBKqCKhFOPwcBlAUPqHqU/ZCy9dFtj/Iy3QjitykqxzhkatIHoPTRuLLP9UQ99TtxFzLom79KpJcTZ/Mf0uE3Ea9aTSNGTgRHQj3xkzpvN5XKRDxVpU4Pr8aMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoJ+5s7kGcxh5NR2E/QFGKB3owDw78E49n2lEIB46B4=;
 b=KYfNr/YppPcsG0htZulmXo3Dp/+K5tCGLSuqWM/5/BDemKI8Z5C6NM3oEwWHtVbgRs7EaB3/hm4YRybtSs5QB/C4MmHhywhrmhdl7jpfMzYWTHinFU9al/9MGkTAWEWUZFZITLYJUVnYvNnf33DTg8Sjv9vD8hXcq1vFJ/2HrFRpGROlsjzqv+wfoajz++cNFENtGqFaFOgn/OHmHFI0P84wiTvlxqt3rESNXzrbrK/kVa9y1gVtuQhp9+bAReiVCnin1at8YOjA7xOI/HMmkTCZ7ekzSLh7mlySOGsPWTeTKQNtG0/uqfJvhzcgAexpr1DTrTHEeqAb4WsxoFuy5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoJ+5s7kGcxh5NR2E/QFGKB3owDw78E49n2lEIB46B4=;
 b=ocE7xSpY5MxL97yY0Ssq141dDfN3ZSrh3fGUpgW28fX7TekXZ79RzQ5hBWkHU0LjDX8Ppkzj8Y8BHeIDLGwGdZo03B+hr/9oN3/FXRFJFQxpQuREJiPe+odb8xRX5N3NoWZ5J1PD2ycDGOSbDw2wmdxTsnzFeQRuP5JZq1ofoWQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB5700.eurprd08.prod.outlook.com (2603:10a6:20b:1d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 15:30:46 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8356.017; Tue, 21 Jan 2025
 15:30:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Lei Maohui
	<leimaohui@fujitsu.com>
Subject: Re: [PATCH] [OE-core] [PATCH v3] ncurses: Fix install conflict when
 enable multilib.
Thread-Topic: [PATCH] [OE-core] [PATCH v3] ncurses: Fix install conflict when
 enable multilib.
Thread-Index: AQHbZ6xjjF+WnkogNEq2fGG7XFScyLMhY3wA
Date: Tue, 21 Jan 2025 15:30:46 +0000
Message-ID: <B0D54F55-821C-42B5-8EF6-285E7055A9D8@arm.com>
References: <1736986779-18213-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1736986779-18213-1-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB5700:EE_|AMS0EPF000001AE:EE_|VI0PR08MB11133:EE_
X-MS-Office365-Filtering-Correlation-Id: 16008200-4e03-42bb-0645-08dd3a309970
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?z0dnWgpHEAnox0Pp2M+14nfG1dmEnbER5KOlwg5XlCRhbYfhh+u2xSBAtpnr?=
 =?us-ascii?Q?+1PJNQ7Jl2qyU8KsyWV7AVq3IsdMQqTUSE6mtIsBi21iJ/xUHWZBtpfUAdYU?=
 =?us-ascii?Q?dvjC2YHJBtJh+fFd52D0vbJGEKwd6T4W0Q2iPSgUP3efsDn91+1RTnuEn2+n?=
 =?us-ascii?Q?EnK4JYXMbJikQ3miPVrTBgJFyQnzUkNZjU0+QznwTohQ9xlLNcvyhevRLikz?=
 =?us-ascii?Q?Qmbtd3XRylsoZ38mIcS5VCuD/o6uctU2rF5eJ4Ukw8yHpDXI+h13IvG0Dg8A?=
 =?us-ascii?Q?9hprvDeWk4P0uTN6eBTpimUCGhKaSljyVx59H81i0dMPk2XV/A+zdb0NkNR3?=
 =?us-ascii?Q?UaaZvW0t3DFVtkHFfqDwQ/UOtEunk4BSOSzaebPezqaMAypt218L/w3j0mKy?=
 =?us-ascii?Q?45GjmXc1Y3/1ycNRXo8u7KP9w583oFlMUi9hFcIyY+N8rpX7amEx5r3Dplgu?=
 =?us-ascii?Q?ACBMHBSZqJ3QOKt/hWGSWXpBqD2rJNQ4wFVHLXxcF5FHRqab84pn2CmiY4mt?=
 =?us-ascii?Q?ey1I2xd7IZVZTygDt6FhzJT/C9i2c86OZa9ozLL5P1PkiVe360hGxEpfIlvr?=
 =?us-ascii?Q?ZtTy3cujxuelBAczYkagLBYJ78mh9OAhYD9vD/vaqyRCWSRMHsmYHwoWEL4D?=
 =?us-ascii?Q?7pa7Ozffa/lHVE7/tDISyh/V16qMZYaDOCfCZYMYDARmATFOnwSDUabiCP+Y?=
 =?us-ascii?Q?FuYZY5p7Qi1/xHT4zgVctUcvGko1Ib8ravq9v099mVpHvdAApXiB66lhrqcH?=
 =?us-ascii?Q?YOVi41ooCYk923J/Q+2GFPRR2mLeLDR3dTVvwhK5e6czplKZsUpi2PpOjm3/?=
 =?us-ascii?Q?4Y66Qo08C8S5P6VPZdjA6Jnx0N8euETuxMBk3ehsG9czCj/jT6CJYg9Ol8mB?=
 =?us-ascii?Q?AhEG75sdwuw/caP4Xp4HPwqPU+LbkFcM2B8CGLibAsOT3xQAH8Js/DiVRgI7?=
 =?us-ascii?Q?DHLNzCXwp2eVQ8Q83LsAEJFQ1Etc8aBZ4Tvryae/YIGCxQQsMfFunxzOV+jr?=
 =?us-ascii?Q?pLAaIlZj0j79f4eJmQjHLEOwRYNvywJ20w2uh6jHkHjlG2v86uf64X1AwR5d?=
 =?us-ascii?Q?mBiVU9jZGRdSczlcSGqmL0ADt7iAWpgzsQU1JTF/e7Y9LMw+12ne8yxYE8in?=
 =?us-ascii?Q?vykPPDoqx1cVgwmFaMNpgaCcTvgwFQxD7DNJwMaG/XhW/PPoo1toBLPkAcV0?=
 =?us-ascii?Q?mZ1fQi3BB7LDM4t0LxQKuZ1LwZ0ijcoqkGrA6pFtBN+iaHY7fwZ8IsVXfQFg?=
 =?us-ascii?Q?yEcpfD3v/p6YZNCme4ciz/wJiVt5eSTpNg5Ir0T8EPA8Vg4lGXgoMdZV6ech?=
 =?us-ascii?Q?7QtVQr2TKe/8wgEkXZo+kBO353R23zZzwT2VNJTu8N2day6mCrXVrnscuMu4?=
 =?us-ascii?Q?sFFo40v3N7U5jKIfa6jq+vX1jtQZOzAmO3Qmq8rZN5Yo4Tbtrk11mecdd0KA?=
 =?us-ascii?Q?IzcplQ/TWEB97G8RSHMSSoayCBpL4bij?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E9B3BCC3BEC6954DA407FCB9A5C24A16@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5700
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	306dd6d9-2a08-498a-b1bc-08dd3a309399
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|1800799024|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vsnofO20QyUuwB3r9H6YsW2CuVWHNWDdsE6kbj9rA356fgx9yn+wlDyzjlNa?=
 =?us-ascii?Q?gfuQ8PU3msKfqZ5zSFa2RgG2QDSJEHrcoFgJJmLLk0xBEdJGGEunOFB/eZUn?=
 =?us-ascii?Q?q76exHYru0Sr56IhhpYRv269yy16DGEfNGz6W6GyxLZmJuOuCk3GDhLozrC+?=
 =?us-ascii?Q?svUQor4oQvdDA0qRWqfvVS0g9KPzyCIZ1qoZVcTJR7g8sSjsQ1LIR4IJ36li?=
 =?us-ascii?Q?dlq3hyz6V1LOYgrUJFO8+UZgWEeGgdz/jDtoYU65+yjcLuTRDXYOsKWFm+8f?=
 =?us-ascii?Q?/rCqKco1hZnavLrX66/chuyx/yboOCKgt9aeQf1h8wWVT5clD0Y1YR1XJxNV?=
 =?us-ascii?Q?3NR21tzc3mf7kfvWQqFDXnANCx4ASLhc4zT2wwMQf++k96kbWeFiocaHEgKg?=
 =?us-ascii?Q?dEiZ7in3QzmP95bh9U5+6iaPEFz7KiLvq9NQpomuFE0swtcPRrtcZfPFcBr4?=
 =?us-ascii?Q?GIJgf/l05IX1h9e/gcTmN4OdCroVmwvVKvm4id+goiVj+3LkH90lPB0LSndw?=
 =?us-ascii?Q?8cU0McSA6BlPKlkK2GcUBpcyymGUK/P/TgwpxOBahINMXGdjuLBgPDpw1hVi?=
 =?us-ascii?Q?SdT1svUAGrHLu19Kltm25iryHnTq8raSG1fXhRiSMPD/xL9NVMZON0R0a26w?=
 =?us-ascii?Q?osAQBmvPOU9bYZVINRj8gF23er9rU7WzTUzVDOXlMqfgJB6T+E1mKYg7RzaA?=
 =?us-ascii?Q?UuVm09f50YO3IVnIHDUaT2eXzP+JNOZYl+T62EqtLfIiLl2m4y5TTwtoJQqq?=
 =?us-ascii?Q?k/Dv0Y1N/tcdj++REd4idXwdg8h6+/fV0a5jKztR5l3evs/eQc4lMFW7td+o?=
 =?us-ascii?Q?2OjViQ5Qwddc1sqgO6pmzTIN2vVJLHvMBMCjUZGQ9xLyWRzvFn+PRMr6sNEo?=
 =?us-ascii?Q?T9jK4B4Fjk852Oj1IVf6C/fXoy52NUTHggYzRZd+fd3BIkdPZicwBAieOujP?=
 =?us-ascii?Q?nkAZQnXmlAZjIR2KYHNHGlM8yFIa4RTIrQ/9KdKb16U3Tyz3Ndd/NZHwU4LJ?=
 =?us-ascii?Q?z29fTxb8MTtC0KER9t/HHT1wKf1wL+EOmcKYIVNBxdfK7uzMEUqBeUJUXKLk?=
 =?us-ascii?Q?lNBycDmk42rPeXegOErajU0BD8J6YLwawcT3aK7ek1URsYM4C66bZy6393Vz?=
 =?us-ascii?Q?NnOJVA/MoRkG6pRrq3uKmykEaelh31AWcpIRqRTkffZ6mlTA+qF41AMldB7a?=
 =?us-ascii?Q?GfZI9v/hKg+9r8l7A0aEZAy4VBbwSGFb7FfLL7Z0GN6hFuB24tAKWmG6gvFY?=
 =?us-ascii?Q?bweKsouiGyebgtrliMFlq1v6mB5dNkDVMDpLKYgxQZb/6ojFNc9dmH5Z+V0r?=
 =?us-ascii?Q?610yAeGfb9zragfiukI5Pb+T1v2KGU2iX05CTVT03fbAbCWk+rb3OMfdAdzY?=
 =?us-ascii?Q?yPWtgu3hbFErETSUvbCPhM+1st/ATwGqzY28fO7m9rUiRW7GshWTTe/RbOXN?=
 =?us-ascii?Q?nSJYgjpkL1tgLC4CxU5fho3CHJr1V31T9t87P7nzY15CAkRcDEq8s5kHeUCc?=
 =?us-ascii?Q?AE4QTzlySGylMrU=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 15:30:56.3106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16008200-4e03-42bb-0645-08dd3a309970
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 15:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210098

On 16 Jan 2025, at 00:19, wangmy via lists.openembedded.org <wangmy=3Dfujit=
su.com@lists.openembedded.org> wrote:
>=20
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> The setting of want_xterm_kbs is as following:
> case $host_os in
> (*linux-gnu|*cygwin|*mingw32|*msys)
>    want_xterm_kbs=3DDEL
>    ;;
> (*)
>    want_xterm_kbs=3DBS
>    ;;
> esac
>=20
> The host_os when enable multilib is as folloing:
> host_os of aarch64 : linux-gnu
> host_os of aarch32 : linux-gnueabi

Seems like the proper fix would be to change the glob to *linux-gnu* (and s=
ent that upstream first, obviously)?

Ross=

