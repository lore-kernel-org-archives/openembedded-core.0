Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBB5CA1016
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 12:11:50 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.28])
 by mx.groups.io with SMTP id smtpd.web11.37488.1756987902000567114
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 05:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Sk1OebDk;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Sk1OebDk;
 spf=pass (domain: arm.com, ip: 40.107.159.28, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZXbWyk9QlnxJdBZ9izb6c7we7kYdAhDhb5xSewn7G6s+p3m562epZktcL3FsK7a0+IDk/mBPfxHiVFQt2mx5834z+dKMDBhiOPqDo0uHTnSeaR79jfa/+PAlVrIS9V/vtQQcNmKGj8Qr9BDHNPNQQtpqQKkRnp3u7z3s38PTz+hARO9oRDUeLMiCAynK0OMzcK/t0nthK2Uk/6OtYCfjpa3OBf7qaoEiCutoUs39I4z30gcXjxT/yGbPOjTetQXGss+FDcQOhMJBHpYbItYfY0grQKf2pr3ex+X/jAStmxwQU/FoVyCwnszRK1clyF3Ur9lRAcWPlaK48YRxWPhRSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbichZabzVroLIXvuuZNeChCRZjKA1o0AUNFNQ+Rp+g=;
 b=Z4Kznozf+S+IMUI7w45RxhiM8j1csf39e8N8sz3rRrRduB3xExrlVhOy4RKMxaR85Q4nuQnkaGdrMlB5U5UNFhY3mEH+WpSju6KttVQHohx5TT5NSPv3Qr11Dn0MY9DADIbBYA7oXcYu3l6Ka4hSblzWC/CLFrNQa0OUDEhEd/J46DRwgVFZLDQc7DwqX8mB56WFVVX+daN36/bEEfeydFVa8/NcaMIMtYbGOO8fbgOidrtzcNL5mnNJR/KN9g6FREv6CqM9IoCvsgabtFvr9aKTwJgymUPTHOPZ8afBP+WjUjVzbm2jPEuwGJQzgTq3UrzNaPJLHurhluhfWW/B5Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbichZabzVroLIXvuuZNeChCRZjKA1o0AUNFNQ+Rp+g=;
 b=Sk1OebDk0mEEe1EAxy9aVBIcmQTJuABX/wjseY2tZCc8+dCuN9ImHOmnjwoO/qrF11nGfkPGYFR/HTs/oTD3E9Iv64K5JALEtdlaYiIYejIj8y116tniAknqKXC0rvWFhJjM7V5cRjgBxb//Or/9q06RyKtmjiHQqvGaySQsJJ4=
Received: from DUZPR01CA0300.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::24) by AM9PR08MB6065.eurprd08.prod.outlook.com
 (2603:10a6:20b:2dd::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 12:11:35 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::ab) by DUZPR01CA0300.outlook.office365.com
 (2603:10a6:10:4b7::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Thu,
 4 Sep 2025 12:11:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Thu, 4 Sep 2025 12:11:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IELvNEM45MkDM+ekgxqjAKIIsC2vCR+XpozJ+XVQBTQLnm9PSZr7tEQ5XAmdeWP2uI4xoIcsiierktJN0FBF+2ej0wcvilEJFkjNU8GZFjMBGB+cGePUvQ7fYkoDd2oGVliNNFdoNrFOxK5bST6FTbxHrKNfktxP96BrLSTm2T5GrUgCHQkoLaMW+vBBT5MPsdTel/Adyau4/E9bxwQJFQtpgO422H5/32v9bqTOOnyAkb7fyPgJ1NEB93XpQy6ElvADCMzgOdqEa0OU2hPleblf3VPJIeWu8hU6EfDrKF3HxE9tSul0FxfmRPACo+iFf8cmv09K5EpeUNc2PqYF3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbichZabzVroLIXvuuZNeChCRZjKA1o0AUNFNQ+Rp+g=;
 b=cMcbkNCD/NAIzMWT6JYVYjc1wg7tkIC19VaBP75ZakA8oh+7GZBxLg0am3PozBr5PuZVLWrUVZ68xzIlLHiBjF6mn0hyghDMalkqY8Ji03xyjNAzA8q87OtRBu0dDUlD3/l30BIlzvq8hKiMzXvbHPlfmOSY6oWSUN72enIRmyrh7aoGAfsPDu8bZdQfjnX8quyT2VYUIHcvreFMaiocHm9t7wSiFkNvYRy1zpsIakgi7f759TVNV4JU1hq3CQfzOUlsm7w/t4/Kc4pbqORrV9Q9Wtn6F+1BRGEiVbHTYdJ1rIc1rTIKkYGdkgJQE4cu2+HGrq2h2ob1afHj3noz3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbichZabzVroLIXvuuZNeChCRZjKA1o0AUNFNQ+Rp+g=;
 b=Sk1OebDk0mEEe1EAxy9aVBIcmQTJuABX/wjseY2tZCc8+dCuN9ImHOmnjwoO/qrF11nGfkPGYFR/HTs/oTD3E9Iv64K5JALEtdlaYiIYejIj8y116tniAknqKXC0rvWFhJjM7V5cRjgBxb//Or/9q06RyKtmjiHQqvGaySQsJJ4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA6PR08MB10781.eurprd08.prod.outlook.com (2603:10a6:102:3d5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Thu, 4 Sep
 2025 12:11:00 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 12:11:00 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] lttng-tools: fix unix socket high FD count
 test
Thread-Topic: [OE-core] [PATCH 2/2] lttng-tools: fix unix socket high FD count
 test
Thread-Index: AQHcFGknL2WAHSPnMUaz9s/eACAbCLSDARSA
Date: Thu, 4 Sep 2025 12:11:00 +0000
Message-ID: <133B9C5D-1469-4443-9855-FFFA8360F72A@arm.com>
References: <20250823200405.680409-1-raj.khem@gmail.com>
 <20250823200405.680409-2-raj.khem@gmail.com>
In-Reply-To: <20250823200405.680409-2-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA6PR08MB10781:EE_|DB5PEPF00014B93:EE_|AM9PR08MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: a2ad202a-3c30-4872-0cc4-08ddebac310f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?gvpHUOjpYxdtiE4mod1lejqwmdtCxcgJ80t49KQ7+7+iXNc1NEyPH4RPkCw3?=
 =?us-ascii?Q?r6BFnTm2k8tt/jMszTPYkaazuJI/ylhIAsFhQaxgjGr8B6+OKQYn2sCTigFc?=
 =?us-ascii?Q?10Fo1rWqBtU5lSVwaxenUQNj084sd9T+AlXlD4AnmatlKjN4sdoysYobOOL8?=
 =?us-ascii?Q?UYmM/0UGutICBJthL97e/PLUu54EbbwLSQSplYc2PPNO/UMNEVtJmsmK+R31?=
 =?us-ascii?Q?PIjI1rozQylLOe0X40DqkxR8SchgsSdxVJlZvLcXJQi2lgKmfKSuulQm46Ca?=
 =?us-ascii?Q?wVik7Qi42KnwN70niMNKlppKnlLdKl/xJ1IqCd0uiX0m0CiPiWGycPXJRxW4?=
 =?us-ascii?Q?sfwomnZtsXcXVAykst+04iXvl7q7i+WtuSAiaUsUXABh17uanJKXLuT48owo?=
 =?us-ascii?Q?dSPIUOhatL2KqI7roeUpmE3dXAGsMBqks51kWaVDDp4Hu7sJUN36WlG56DE5?=
 =?us-ascii?Q?u9a95Dpyujc42NsmrHtB9z78YmZpFKx1PKqjUBlCj5lZ7SS8sckNYI2df4YC?=
 =?us-ascii?Q?BN/Dj61V4U+/hZGws1rQrSMZfAyygIvmLyUoAJQIE3Zqz017hNsC1wEvyS+J?=
 =?us-ascii?Q?84966GC1IXggaXWOD95Ir0qi8IlH1f06mBV5qygKOVQJS4lGH5vlLf7nA5fr?=
 =?us-ascii?Q?6S7kX9XCUlbd/tvpPap1IrsCfe0jAPxJVzaN6ntz3IlBS4j/Q/kJeAKlz4XS?=
 =?us-ascii?Q?TI+6vR7bZKz5ZjzQ+rJT7mauh4WO0FQuKdRzg1aLQiNpms3GSvF/tUpWAlXC?=
 =?us-ascii?Q?+YW0ubVqQvCR+mobzJN1PhDOXsuyT4b0PfInYapa7NjYxLOVkPcT2S8SHHuQ?=
 =?us-ascii?Q?3BTCXAkMwFG+/LEwYI9UbnapeRKqcAVSCG//fSP8l+0xE26AwTzPhMpu/RKr?=
 =?us-ascii?Q?7xwFQC49bt/NAdZLrXcl8k8by5H26YdQUck7Cd43RJug8IdH+GO5IBzFo7Dj?=
 =?us-ascii?Q?+4iPX1k6mWOfVoyldFu3dcS/YRGQ2qeGVGHZAIrogfvKs9sMWbPbxTwHLA6G?=
 =?us-ascii?Q?7lYrAnTZ6Jqtpzvic16MlcVU0i5MFUqwyUYTE97EBglL8Y4mgzBT/apvOqyl?=
 =?us-ascii?Q?mcEsklNFy5nfhFOoLYlaFPr8SohmKLAPMJdJ5LTpWkiV387Vh71+0PV8K6d7?=
 =?us-ascii?Q?7nAgDkegEpPg3EIcRZTfBebi/b1vk0e43og0dhzprbib/XzXUI/v7gMBZI/k?=
 =?us-ascii?Q?tnVwJka87MTQKlAIsWvaH/lrb+2BAF8fp9puEhoXLrXOiwmtuA8jWYKrLWD6?=
 =?us-ascii?Q?fYdk4zTTQfiII1d2ftoLwLmmhUB9i/pAtlLAhGE0bgmfkFqiDu1O2EkVJlFN?=
 =?us-ascii?Q?Una4/DyG6b8sVOP2oBhRPmjCeNaJhVb7GnlF0DljU0PwzuJvzPPqdw0+QCU9?=
 =?us-ascii?Q?7v35yTqOVxpKNV8WKgNCp7GA8ZppGBR/7uw0acNWd8spA1p3ffbnqXnTzFu4?=
 =?us-ascii?Q?BghJCMa5DYjub0xoEsn3RZBLmqR/jsTBeuvFwVKRx2P8v80Sic6GZA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ACDE10D7990C4147982C19FE512293E3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10781
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d77c2cfb-b08a-40fb-8ea2-08ddebac1cb5
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|14060799003|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5Ym0VAgJIMC2hh0JXopeCNYbBxkQdjsBMLe8QyR/+jbYx0Bmrf4Lsl35oXC9?=
 =?us-ascii?Q?lzV91jxdPohj3vh3p+du4HggGuE11mrK5FeUgFOiTT2yWhBMm7M6pxw0Qt/s?=
 =?us-ascii?Q?KwW0W3QnqpAVPc0HFn+7+CIlkuukQ18ChXV6GV+AzjiRulT786CRFKXznG5C?=
 =?us-ascii?Q?UF/b/SvQFGDTXOzOdU3OywbNv0GkZ61pyBpKeeymLa7GtURP1Uk/SDKjmbEd?=
 =?us-ascii?Q?x3bZoJD8ylXwXUBjxJ6zrzxcCD4gCPEX3TsUvcZF1X3v1FkFKreCoSakprhb?=
 =?us-ascii?Q?ZLBxuHqiGH4LVafciSQ7e4nSRLVr6RCF7Umzo15RSGLrGG+a0aYsUuSCEz3j?=
 =?us-ascii?Q?KfAMhy+DNq/tmNaeltwTn+4CEtus/XGUxtxUPqDoI4eWC8MUKKZkHAQcY8Jn?=
 =?us-ascii?Q?Hufzib9Katq1aqmhJDxsMfKJ5jmmHCK0cjGmvfkdsMLtwEbO7S2Cx4vxcNB9?=
 =?us-ascii?Q?EtwmFCSozZl1qNymBrPSxmVihnXslNmMc/L5umzDLqnmGhq9YkjBVuCenZc0?=
 =?us-ascii?Q?FEBIfQAkoHNAU38tOLMUvaVety5/sbBd79AgF6A1GbErie2251KgbLR3G3t3?=
 =?us-ascii?Q?/oS8zxBxSFr4p6RPFALT1z3M/cQkGW6bQ7TXHhfgzCLJNCYQH0BOXpUoR9qH?=
 =?us-ascii?Q?58bOpd9X3uN9iFkeuWO3ovCKDRRr0NBAx2fqqBZ+VLXaZ/a+QXiqf5gASUw0?=
 =?us-ascii?Q?DkIeT62aJwjAmTvD+5kmkw9r8vl5zKMX2IZxnqdj4OMi6iZzuv7pfTMDCZ/c?=
 =?us-ascii?Q?YhJZZHiWPc26aJjVdcX32o7dFysOAnl2mn0ctS41+pnfy200A81SSBEidX8F?=
 =?us-ascii?Q?0krj2WON4KzMggf1hQ3TaPoWMM1fo90UoEj7uhLMMYwPbYBgWbtdW+ZIXYzx?=
 =?us-ascii?Q?kYQC1YTAmtxFqwylzgD1aqBtvlhn2CIcwqP6l8vzOxCOQNsKJO9MfVvjiCR/?=
 =?us-ascii?Q?hRDsUaBuUfgCJuf5V3e+SdbqnIWbmfO0RGumdHJS572I/ZrGY23b/eH/ZQpE?=
 =?us-ascii?Q?1bl+7smQYi2L42W2Dk/SVlbu+fbjl2RM1eKvwvP6flYpgGcbcF06iRoYcCY+?=
 =?us-ascii?Q?IhYUI1VnDLRUFMfQtHO/ZhGUuIWquZur0B+mhF86UqC7Ib8YjIPAi6opHtLX?=
 =?us-ascii?Q?jDOrhHio6qFtwnKoJe8dkyTgw0xLKqlWJY+Sguu0d22hdoXQNrJs9GuFK2pq?=
 =?us-ascii?Q?yfDVBN1R3McbGvNEpMJHGR9QL0qGo9WcU92EvBxg+H6POtpZq706xTAi8629?=
 =?us-ascii?Q?nu9oFAe4FTG2XZ3FoNVpPu15LhXOPTe6ZAPb4mwXFhro57Yj0t5XutAKf/QX?=
 =?us-ascii?Q?MKcmeURE1Aqm1VjQTvU9TaI1O6QJS9pMg9CcOJv0yr/uM725KYRNvIhPw1ti?=
 =?us-ascii?Q?YPHe/qUKUBZeKsMJODzBnh5HOf+50u1RvpYtHu21ddUJEIGdpm2w0QZrkrLx?=
 =?us-ascii?Q?8QsgizJWFwOQFDylpNEjc0ZnprFSWLVfKTlShabGNx5KZ6HbGOac83DKQj/2?=
 =?us-ascii?Q?LACQRfbPxNdUKQhXRwWguCuWr56xsAUwa281?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(14060799003)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 12:11:34.6007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ad202a-3c30-4872-0cc4-08ddebac310f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 12:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222921

On 23 Aug 2025, at 21:04, Khem Raj via lists.openembedded.org <raj.khem=3Dg=
mail.com@lists.openembedded.org> wrote:
> +tests: fix unix socket high FD count test off-by-one

Is this an off-by-one in the test suite (in which case it should be upstrea=
med), in musl, or in glibc?

Someone has a bug and we should endeavour to fix it at source.

Ross=

