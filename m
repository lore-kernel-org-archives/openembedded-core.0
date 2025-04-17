Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47948C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 10:59:37 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.61])
 by mx.groups.io with SMTP id smtpd.web11.5965.1744887573394410044
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 03:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MQzq42Bg;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MQzq42Bg;
 spf=pass (domain: arm.com, ip: 40.107.21.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ifJ6KjFaN8RWv1P5Al8Y48/ZwwGH86+oTpD0X4TkYhNn4RVhzHTyUbFuEsJ5Cz89oNYieAgceF0Xa1SlLTn14GL3DU0Sojx4t03xwOGWaM6HXCsYjqBH3VC0Cy2Y7E1fRqeoM0a0qZ+Ia16qNYx6cZYFjwqtvj/s8dXvGQDbg5GBZHuerQ2oVWX5XK04K4Zteajhx3RIl9GY7kEo55OZGzjQ51dstWu10VEPbz/Gyu42Sgmx+4qprH472KdRpYds351pHB8+LOwYADl8XRopaa9ThE6wWyKob6yk/oLH225zbfMndSlArPVdj9JqoKLjrNFQe9Mw7LtEMVFnbOlSNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfP8Hem+8wNzMmzaIf6JCf/t69M78dxr33pljhWwD2c=;
 b=Z78L+zjLCiUdMx+9fkwel8cA9nr3ouNYIhCAzHBaHigl1BfmIDb07+rrzjQ3AeZVDtyJANLe73McMfEQiQPBBTtYv5sNZUg2YjkoiNC2Ib/ucvfVn4igaadshCE6CXHj19HvQfRCsGS4yuzx5GNrdnPfvnpjsO+ApPM1bUhjtncXhNpnoQPJ6LO9SEgESVETvXsWlqBn2DEY0I8enLF7CQSNlNHLsvGLarjO3DFmqUPgTFsyn2spY/qG/AlC8QeJOS1RMQj8UjizuOR1+WYBS7fQTZD7epY5x8MR7dH48MGjw5wbbbOgcn4sCuvsT/ntbA0kO8YWmk7HkTpFXmznBQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfP8Hem+8wNzMmzaIf6JCf/t69M78dxr33pljhWwD2c=;
 b=MQzq42BgEEzSBN7GHsSQqU/a5znwHvO8PWNw/EowJ5Zr96CdKbQ2Y0kCvCGOBQaCp5sIMDvN1FieBX5UJr9c70DocUt/KGdMrYl+PWPBwvc0BLwhTGq6c2lmict7k7pL5tdnPkTcwQuuIPVN2Z6lw30GuLHFL2fFSB13HO+fkQM=
Received: from DB7PR05CA0019.eurprd05.prod.outlook.com (2603:10a6:10:36::32)
 by DB9PR08MB6409.eurprd08.prod.outlook.com (2603:10a6:10:23c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 10:59:29 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:36:cafe::11) by DB7PR05CA0019.outlook.office365.com
 (2603:10a6:10:36::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Thu,
 17 Apr 2025 10:59:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Thu, 17 Apr 2025 10:59:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjT8KnEUCaEpaGn8JYmjjGQkV0Z5oCDkqs5yGWdi4FF3CRPcY3YF6Qn6f1kegz9G6qm8yRim2TGIrn0mSDu7dYUloaOJqoVF6dq+xguTxVxHnaGkd68sdFY6z3GiffWfioUz9kZQE8lrI/uneK4Wge/n1Y30Xv/6BNN/jbjb2m36PfPtVZVABE3mGnAeTDNDKG6lGPd95RbTRbqXSndxst6ughM+tAz/L9U+/Bm07Lo0JWmsDKC7cq6yKN1lw/TmSic+R5SlOT7HsMl/XjQ+RhxyVtqQ3fO5nSUh2mBcrrsWfIGO4jjwqV57+BKL9EU6kvCLh8UL5ykUyimcpgVRZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfP8Hem+8wNzMmzaIf6JCf/t69M78dxr33pljhWwD2c=;
 b=LfdlswRwlfNKaG7v2ubxU/kGn+e2xGEXPHPSXXuDtnW3SvzL44wxwg9lhRCeKL6XvV5ZmdedaRwXwihsFLT/Nap9Itq6IY/XvaX2WsqPN6sJqJCsyF6nw0IHbmO7uB9TpJc6YKNydm5S04THxGOi4b3xawHxVIj1cWAF3LUNuiF3NvptnwusNjCqCIP+vTFukS9Uz8MBVIWW5LoGj6aRNUSX/ivyRY7viQSrLVuegMswrG2KUVCgycQ8LGC6i+FhHkLm1135ywLlileN5s44XS36GBNdEc3hR1xiH4OOIl38IdVOuQNHffQjEnqRrx7Pb9LnozOB7oMB/FbXxQw9Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfP8Hem+8wNzMmzaIf6JCf/t69M78dxr33pljhWwD2c=;
 b=MQzq42BgEEzSBN7GHsSQqU/a5znwHvO8PWNw/EowJ5Zr96CdKbQ2Y0kCvCGOBQaCp5sIMDvN1FieBX5UJr9c70DocUt/KGdMrYl+PWPBwvc0BLwhTGq6c2lmict7k7pL5tdnPkTcwQuuIPVN2Z6lw30GuLHFL2fFSB13HO+fkQM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB5505.eurprd08.prod.outlook.com (2603:10a6:208:18e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Thu, 17 Apr
 2025 10:58:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 10:58:56 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Monday April 21st patch review call CANCELLED
Thread-Topic: Monday April 21st patch review call CANCELLED
Thread-Index: AQHbr4e29KIZ8ccNXU6xRT6qNLuEbg==
Date: Thu, 17 Apr 2025 10:58:56 +0000
Message-ID: <C8C100CF-C25D-4B9F-A47F-A663425FA7D7@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM0PR08MB5505:EE_|DB1PEPF000509FC:EE_|DB9PR08MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: 90e07515-ce8c-4751-0bba-08dd7d9eed07
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?GT+9WOtkBmzShUp0rkln5BQIhOskdZ7fgHqi275JMYOkZsb6If0CgG4OqTBg?=
 =?us-ascii?Q?/ZbZQzX20+dXBfrUX6TkE7SSyy2R9/Ans0NleP+kQcl89qrG3v3IyHEVjO0U?=
 =?us-ascii?Q?PxwVH1EgIgLh3vV2gckXzS5um+wuK6Ospwhp9GrWpD8hdtVVpnTHateyyOwG?=
 =?us-ascii?Q?e7P94ahtHr6OdwCi79yxEPsL6E5yx+v5nVwXLJ7VAj0G9prpTyg98Y50hSb8?=
 =?us-ascii?Q?UHja7EAoNfF1OWW5422Cs1jFXnizURzdgQUgiQ1VMmgP593aRv1G5j249V33?=
 =?us-ascii?Q?qb1TUlEhhiso6Q1tus9uv84bFlKBLG5dKklnNALM/vrUMOH/MbaDg7fEGTaL?=
 =?us-ascii?Q?IAlGTASKCmXustPta2UOS5QVnQUE70hAST6CbGUNa6grTILz44Wkqz71nCHS?=
 =?us-ascii?Q?wACsmic91+ZsHTbB7Yb7yndb9EUI3voZUCGpS78w0Dc/bVFV8K/6AA/uutSi?=
 =?us-ascii?Q?/KSdUpFuFbF0c2y2k3QGZN7fmKtmLn30RqROEj/V+UCc3g/KNayGt5r9uYsQ?=
 =?us-ascii?Q?9aAjUz+3lzYzngRtvFbfsfhDOE3pvaekO5FnneOOdKZZAqq2HoDMszPJr5p7?=
 =?us-ascii?Q?deXUgYyun3l/YdhhNGSC0SkGWRKreDl3Q9q3SKzwf4TL9tDmdo7qwds0A8BW?=
 =?us-ascii?Q?u1cr6s4DRLTYMfpyEnGfij3Xm3cFK6qtD1s63nTdQi5oMJTEhJfT9TPAgf5e?=
 =?us-ascii?Q?NuPVjN0PBZKNc8rQGOKQK0H/qOBTM0I/EMXQDmoPuM4yrKjKrgfFcxbFPlny?=
 =?us-ascii?Q?B0eMs9IV+Gns+rCgAVtWbIWwRIWu5Zqj/Dqc+Rai3a2VM0KW1tBqD3TuPvEj?=
 =?us-ascii?Q?hUxWKq2ub4cUQ3A1cZPceuSir612gyhUK2rYSZDOxtPSr1xr9z4VMv6/o8YV?=
 =?us-ascii?Q?xwFfPAwBETmA2dai2of5fnSxd4WdpU3EQlrQlOyL3dfTjUN4HHUjSnMe16M+?=
 =?us-ascii?Q?IgqAFqWNh1pxnmJWmVEMKXQa6sffrrreT9u6iH5VQDUghc0swNAIgePrRN/U?=
 =?us-ascii?Q?pLa6D9grpd/7ULNglN7LDBv+Dtf5IIUtXF36jfxudZQ17V5VR4ASUBIL0U77?=
 =?us-ascii?Q?Lgc2caeImT06rLR37S1LNKlqg+zoc5TMg23D+ozXvshZnF7siF8gL6mdxutk?=
 =?us-ascii?Q?v2RBfcK+4Xr53mql+Seb+lofgoJkz/FiB2TlOpCStdwRXuOgzptFyRiuogj6?=
 =?us-ascii?Q?S2S6D7ZdAHds/HUdle8VJFkzYaM6y2P56E6vGL9yP0GJXmPple5nEnj2U6Fa?=
 =?us-ascii?Q?CkmH4pAOsBPg/JEqhDsT04WTUrra3NSkjSt4vDv79CKcUorSGDB6aauLEcHO?=
 =?us-ascii?Q?dl7D60FhnD7q5aTF9JSsobzjIpYCRgl5iDMjmNx1w+MKaCzlJoLOgiaSqrTe?=
 =?us-ascii?Q?8XzmWCI2fHg8MbsuyARkdAriSV+yR4M6PbNkUyjEo3OrSaa3qh0WE61ay9P7?=
 =?us-ascii?Q?S9L/Q3tBK+L1Yl3BgBfbNcwlkVTPKcMRUGHYkV8G4divTSSRG+UcMA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4D454E621FCC364CB4D083B40F4A15FD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5505
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9bff1d3b-ac00-4573-946d-08dd7d9ed97d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|82310400026|35042699022|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?szJ2JG+HcO0tGfNgXqSyFLMnHq/XHAnlZzRoPMrq4eiRlVbDGJjRJHB2/JfU?=
 =?us-ascii?Q?akkmAcestp/1xQreytmKhGH6tTl4BwT9JxvTuyJ0CoCkbnw3Xh/yOU3zzwYg?=
 =?us-ascii?Q?XZWHzVefB7UTNLPqGJfWIeaSaG33LbF9ptnjUGpg5Tph52XFQ0IAHdzP0KtJ?=
 =?us-ascii?Q?2liymZmqnkXJ4KjpCaXlFQjXNloEsZfVTHvwvGUXsKgcUKX7PdB84VOrJDzZ?=
 =?us-ascii?Q?klpMQ9ysZ8QzW1o8aTcOllC0nxT5nal39XE/GYzL5DoJy1uhTNb3qvF6vv4L?=
 =?us-ascii?Q?Xz6otF6GiGDp6ewAsTrbGd9Pg8k2b5SQ4aRGTOyt5XtZmsVa4TqtrvIT1lIy?=
 =?us-ascii?Q?K3NG52em+s3yUCxzWBIuAsHEHTdGnk2vfqiUzQezW6uajiNn40uNwu0TdUIt?=
 =?us-ascii?Q?Slw3PHW1awKz9uo8JaSfma1RY68INCaBoPx7rnXSTIgBfmVtb0QUg0tFAJQ9?=
 =?us-ascii?Q?meCGtnL++z0qqMPfRmo4FzH1sAlcqvzSaXw9/r02tTSM+qnzngrIK0r1vz72?=
 =?us-ascii?Q?EuJ0OUiwqKHe9xeNco12hwqVXf64K5q0THkX26kMTHm95GCFK3Y/EU3VMTS7?=
 =?us-ascii?Q?N8yORFbOKc6tA3cZYZBJQLvXjLJMaF3y1ifGflPAPPPXVqj4v8GlGffMoZwv?=
 =?us-ascii?Q?vHM2B9IkiFk0uHBuDDOGuHDv0xJSQ8VGWndtupXbemyWQ4s1jWRa7fhdbeOc?=
 =?us-ascii?Q?tAgAzrUyTpy36REQoa7W/DvBzZn0pmALLViSDq3J/Va7YEjSFk4qWHYA6GVo?=
 =?us-ascii?Q?DYzJOIwn8cU62aOJiyKzTsMs3PZrqyawsJWHoiYH1er0U4+UYpBG8bBIQBkb?=
 =?us-ascii?Q?jOiVngPoXJ728OIv+npWsYpk+UmQ+737hxvgthVHjgCGmYeWNtxG6/E8+SLa?=
 =?us-ascii?Q?0Ilx3FMdG89vsK4hwLWSb6PLMJAzTbsaNzyYTtGNjNg48DsZNz7bmUjQy5ng?=
 =?us-ascii?Q?3cJqmCAvbUdYJWOuPaIZQMpV01VFN1wG7y8S0Q3Oe1FBNUJCPaoxIGftqETm?=
 =?us-ascii?Q?KOO4t3n4bEopZhzjK8PRd+hd/i/Zg2hXMgmJXLy1efe/BncFQWjL5X+6V72h?=
 =?us-ascii?Q?k+TEskZrC+beHBrAq5l/j2P/VqL7K1a2PXNBEj1IMmC8gZT92YLPjXMjU7Tz?=
 =?us-ascii?Q?367mSewTOA8ush0S5pFA/4y7xiw/Mw/pKkk7qfIRoUbp6xDGaoo7BVnmylQe?=
 =?us-ascii?Q?QrBJMAFpK53sh1rU6h2i/JNKn5HENZ1aQgPihU4ntwjFdmtUkhnmNwrEe4BX?=
 =?us-ascii?Q?lJTAqIFODmdLJ1T9peRoE07F29ndcgZPrHDaIDZRL7HMWbpG0pByt6pNF91U?=
 =?us-ascii?Q?gu/0XgzdGtP06Jt9cgbLYzbtXzwVZ/aXp2cX3QyvPvQOhnOAEwplYeHQdDHg?=
 =?us-ascii?Q?OV5+IYe5j54dvklR0Yk09uiHalsQpE1VKCEGcbereqZAut5fk8bZ4ZdBmpFh?=
 =?us-ascii?Q?3G9aydVO/CBgn0gk3pKWAMb90ZjCVOLtDWKo7srxfJp0Dlfrd1so4xz/hKzK?=
 =?us-ascii?Q?dp8gXFT72zhCoS7fsYf3guz4ZUOtasAOfJLc?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(82310400026)(35042699022)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 10:59:29.0351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e07515-ce8c-4751-0bba-08dd7d9eed07
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6409
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 10:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215064

Hi all,

As Monday April 21st is a national holiday in a number of countries (specif=
ically but not exclusively the UK, so myself and RP are unavailable) this c=
all has ben cancelled.

Cheers,
Ross=

