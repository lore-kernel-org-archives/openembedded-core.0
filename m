Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CDBCCF9EB
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 17:35:16 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.57])
 by mx.groups.io with SMTP id smtpd.web11.39084.1761586512626757252
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 10:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=LMVQ1JHA;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=LMVQ1JHA;
 spf=pass (domain: arm.com, ip: 52.101.84.57, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IpG4flLHqhLNSyL1EByKu1DVaJ94rjyssFHozd/TnK9QRMLlaUmIDVowJqJuVH1owqDQPzd5Gd9WrSy0e3pzPP3ODJ4qJUcXa9wbWIADufgvF0UTjtrGsaYNK3rKUVE5/tXNulJIR4ogDzGsOOuJE5fHU57gQh5+dBXePpSkQ+UqGxIFpIuENW4R5fM4AP0mAeO3/t4sfMsnJMUlhMP0OicvLeHScX7FDJQfsSc9hO1vfqZl5m6c3pevYkJuvLq+0SUhxYRU32l3vJCjkZOmynzstelKgnkwk7je1YR+QcXvN6wkItkJ02ZxlKF1FSZUBVr7XhVjVOcfa4atJAl91A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hN3fpF5VtlH09Ezf0T7qzSzpVtnWLWWtjRlCWlRx23w=;
 b=whvobwXrNiaCo48jEMCsCN/oUJEiils7/2RBGiDoMQcjXGzDrNYv38fG/j7q/6woNqFdokK8Lw87iZbAvwc0IjCpytEFimHGoLassK88KpCdCqlPTfdL7g2taiwkXgWAEVuihO4GHI2uFcNHkK3PyCgVgomtPD4CX6UQZ8bi2iv1t4jfqApKyX7o5gMoLsJpZRQCwND+gnIP6TtzRVStSmkwPxSVzVtIB6lgnb3LmAAudROlSpzkbLzQ1csWj9DAWyhBOgvGCF65paLqtARfYdDSDXy17w3qhKUpkk8C2+jY5pRF/GdkbzJTblpvveh561J0CIgXckG287Mj2ckmLg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hN3fpF5VtlH09Ezf0T7qzSzpVtnWLWWtjRlCWlRx23w=;
 b=LMVQ1JHAiDJmVmiaMwj9q99a16e4QxXMIr9fW6t+lRdKqs06crUxc3e27UMnr9gMb6hq2joK0u9O2QAwgRdaD4UVD6UhL0vfx4dg8jM+F4WGrW4OUcc+hgOYY0M4mf4cw3+EkQF8eBuYFL0wjZn8sjUhS3/K0tX3eDyuSvdtuEM=
Received: from AM0PR10CA0020.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::30)
 by DBBPR08MB10409.eurprd08.prod.outlook.com (2603:10a6:10:52c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:35:07 +0000
Received: from AM2PEPF0001C70F.eurprd05.prod.outlook.com
 (2603:10a6:208:17c:cafe::5c) by AM0PR10CA0020.outlook.office365.com
 (2603:10a6:208:17c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 17:34:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C70F.mail.protection.outlook.com (10.167.16.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Mon, 27 Oct 2025 17:35:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egplctqzAZLuq30D4aW9ZeG6nnYUGMHGkQtok25B/aEilU3rYde5G7Dd8qBt5LgNPXCqZpucDOkOUYYJRPc3WDH39f4Lcz0F0o2+HdeKMM4YiWv1nswadHFbKbZtcZXLy6S8w7zgTYx9pTFjiYmj2KqGMCBwtjDCd+obhkxnaWQYGDeEf14BlSsNyhr6iDMxFkyQTI+xogyMUkpDPNYmM16Bk9Q1EnOVZdF/7tRzzFUbAoeEdTQynql54sh+XGN8fxFIGfMx+aALIHUZR4UUz4uRT6+WwMm30lXVPK5XmmkM98epVm+JPJJLDiyp6B+pRuDoRDJ93PQE3Kj6Y5E/mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hN3fpF5VtlH09Ezf0T7qzSzpVtnWLWWtjRlCWlRx23w=;
 b=Zanz5hDp6IRCS11gwvLrUNLnkUTQC6IZUMPWHLmmR585Un3qb21ZsDwDei+OBUklX0gj5YFeSS4w3uwQ0PSjsQrsS5vuPOadZN+R9lQD8SdNNdEKhXa4MOfFuJC+8q+j3zH4R20BNb8+8b6lXswnzg40fMM6nWg4GVuj3J0+3vdvnJrL7VxHCXe5onsEereADIpLBO32pfRb4UYOyAZj9IYEdDg6m7P/B96hBvWCM02P5F4AlNhHNln9ZHOpiFQEk/FFRE2Yhg3gX7HFG4WX2jOcSHKZ7anUybAq1bs8Ca8EjC/Uvv9lB9950HI6yZFYTgQVWMWvWRJ19hnoyC1mlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hN3fpF5VtlH09Ezf0T7qzSzpVtnWLWWtjRlCWlRx23w=;
 b=LMVQ1JHAiDJmVmiaMwj9q99a16e4QxXMIr9fW6t+lRdKqs06crUxc3e27UMnr9gMb6hq2joK0u9O2QAwgRdaD4UVD6UhL0vfx4dg8jM+F4WGrW4OUcc+hgOYY0M4mf4cw3+EkQF8eBuYFL0wjZn8sjUhS3/K0tX3eDyuSvdtuEM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6671.eurprd08.prod.outlook.com (2603:10a6:102:13b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:34:33 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:34:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.0.2 -> 10.0.5
Thread-Topic: [OE-core][PATCH] qemu: upgrade 10.0.2 -> 10.0.5
Thread-Index: AQHcPT6UYiuygDTSSE6MJfTOdTgpjrTWVV8A
Date: Mon, 27 Oct 2025 17:34:33 +0000
Message-ID: <2E417004-B05C-47A6-AB28-4F4F218491C4@arm.com>
References: <20251014191245.581962-1-peter.marko@siemens.com>
In-Reply-To: <20251014191245.581962-1-peter.marko@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB6671:EE_|AM2PEPF0001C70F:EE_|DBBPR08MB10409:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f47826-d2ca-4728-d73a-08de157f2b8c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?g9MQDwzikS3/PzGjvEDqNPrPJ4fikWz66uL+MKv8Gd4d/SjQ3kzd8OYDlA1e?=
 =?us-ascii?Q?XjW2akbrHbmDV7clzUuc5nq0u/Ox+va2epbU3iPteN+5GCnJ6UGNdh0aofgJ?=
 =?us-ascii?Q?Y3EZu7MVgThhHQtVSOxGENl/fLoW23wvGPMTt6z1yf7svQ3IyxV6cXrBHn0m?=
 =?us-ascii?Q?xpU0JLBVIX5XbeT35/czSz9zMCAyATXSZC4Mlwo9qGjKqVOg4mI+9BaSMGfQ?=
 =?us-ascii?Q?bG/d5CQBtzAFcfeEYVYmMLVwU9EvaAxU/QVN9tfa7KBrqpLzQG90b7rX8/f1?=
 =?us-ascii?Q?f0r9PhlbiLDyEWwwfnBEOMMZNDS9Tlm5qldYTuuEbwi6nvaOkqEYKfhd0Ui8?=
 =?us-ascii?Q?OCfNhkHKQVxmnXtB7xLlNnZrzA+wsrXwojpSdbiBGTydFasioS7C8LOWtx0r?=
 =?us-ascii?Q?RErU8w/520webnviqHJIZAU2y9k0Rxi9vdLYJsKx/5K+whzt5DDtaF+43onw?=
 =?us-ascii?Q?quiVm1uxwEk0vdK+bcn+9qLJtYMKPA51AVeFH7SMhoWkAK0zBxi3ltR7h2fR?=
 =?us-ascii?Q?cfRArpNlTNJK0PiplbxjxxtH78kBvtr3q7xEofKtNxFy5nlyxRbvWuIVcflR?=
 =?us-ascii?Q?PF3yZJ0i1DtLp0GLhzHWPfxMbJNdanmnGvGUkHiptN96ZjWBrJEmcniNcDS0?=
 =?us-ascii?Q?CNwTvHSt8FccSzRrdkzLYWX/+7LSa47ASOY+hf9Zf3P85hBKC6zz8MCcFUdm?=
 =?us-ascii?Q?/JJ0hbJ2JFSde6Kgi/yZEitF25pulKpRCYUpW+ICfQjqOlMgYisaCy8L5x5m?=
 =?us-ascii?Q?ofj1zdSn/8cuHN2zt/apOqIEH8mHBwlh9TNMGa8tccBK3kcrLlvOpnL/YNNm?=
 =?us-ascii?Q?/y3EDBC+lAz8tssINVQqlWjdn5Nc6kqFhFWioFFK2lMf4Ol+9rbZUgaqwprd?=
 =?us-ascii?Q?AdPkNniImGZ98v/O6OIjRArlP5LAnAmcXtZgSt//+rcyA1VHJqmM1s0K2DCx?=
 =?us-ascii?Q?/Q1Kz64Tka09k9MTq1GNOZmwmcQyEH3Mp3SOwyDoaD6j6Dh/vr280+jsxBAp?=
 =?us-ascii?Q?9BbByTadugHY5RKDFEv+aAMbOD4w6jbsD9EUBGRlxI8DMSb6x0VZq+INM3BO?=
 =?us-ascii?Q?WYx4Xq9elSHnIAtPbzqOlGWTCCVITRN749JNZkUuXNm8UpX6eziSKTsNFog4?=
 =?us-ascii?Q?8PpWeRwf6gVNEVqhxTxuYxiBVUACcJBv6t40M3kGzrgof5Ky9HxNRoUesyWt?=
 =?us-ascii?Q?q7kG9HPmUh29aGfg7hi0gnIqb4zB4qH5gxfxt+JG7zdK1lDTJgiDIQQI8GuY?=
 =?us-ascii?Q?OYtd7FA1Iz1Dsn4+imOmjMJ+VnazA93+rzkp2qUh34EuWvMPJnYDB2FR1qEW?=
 =?us-ascii?Q?E3Tqm+e7pOKdzZL1CO7D4sw2sWhDMdzwfefVFX7ntmGQO1cP7PA2vl38tsAY?=
 =?us-ascii?Q?qoEaxDDxSHTr36syzx/OFn0YegnWcYJ9+LAlWJXHlkqMACnDURu0r30OU73B?=
 =?us-ascii?Q?/KNQzgkHB5KRsLPla3nZWbOOt62q/Lq/gc/5FEJqDx71sOHe+MzpfQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B1396A70461A604D84F34A863B153463@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6671
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5b5711eb-fd0d-4d9d-cb49-08de157f176f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|35042699022|36860700013|14060799003|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2UMaavm1VY8l847XpexE0mGihgbV8NQ/ZJJtOWPwrOjo4kBKOsApVBg0mODi?=
 =?us-ascii?Q?isQxbROlKMZpdy6LNkl5x58ZRpoX9Cz67ID6zemEin1vHIGw5BLHu3zGacs2?=
 =?us-ascii?Q?IlXG+byxhtMCJBQelQj+m6NCkQdyUW3tkcrcJQBQ3sl6/pNAYmCyvDahvuWd?=
 =?us-ascii?Q?ZLvuMar2oUKqpayZYbyUGc+cGpmnrw6p94EIDCv7YQYeao1SL6K+pghJ6NFK?=
 =?us-ascii?Q?wAy/r16bbEA3grl0GzvOMG/ACsHWHEwb+9TDXbdZ4IDmjje1GrTnHCTAGBio?=
 =?us-ascii?Q?PYz+R6YvHIrn4PE5SVBx5bMUnGf1hMP6ybnzZRODpp4wEARxx2J4w9K7dUG9?=
 =?us-ascii?Q?2SF2JM+YZFiL5ExupEp/WifuJpXbMjYqToEilRTsJzHc0hfhbojsbBoJSvlJ?=
 =?us-ascii?Q?pxKgzdcP0sLws4Wvg2mD9wUOdI9b27n6go/cAogLEaluJ5LLYncC7weeulWn?=
 =?us-ascii?Q?40Ykjpvc9po3NgqlOVlx9TTPFPCVhaaRCt3+QOVe9oL5ONhS8kWgrQqXefhr?=
 =?us-ascii?Q?/WQXyiMeMwSHg1A3ccNti0Yjc54hHAQfEomG1Bh4mckgUrzKD9tuk+DAHK/m?=
 =?us-ascii?Q?K4OorYABZ/G+k9OlQpdMVl51hc4BAxZqtfPAnofWEdUJn43/wsUG/DWyTdbv?=
 =?us-ascii?Q?T8frspytQ0ULCfEBAgEVvBLiWrcXtnhK154xxm7TMF2TW2vVDaT/q1B+Z6WA?=
 =?us-ascii?Q?ptJT+vHhOQmikc0YH4Ucio1QL0lQbNn+wAKbmbKVoqrH/bePEov8ysYvKuRe?=
 =?us-ascii?Q?zfJqqAFGDBpGC3414sqN8mpOQCz6GrCzdSjGRh2WvTMtlpCASweS7sfxLR3q?=
 =?us-ascii?Q?Pqna0RI02dXT8oZG+NAjBIt8X2gr628M648FlNMjkjo8W5RSAAZpAZiOzTkx?=
 =?us-ascii?Q?Vp5I2W1LTFvZICIYdMoSMUSt44XyfS7hw/rcALiAK9WCnDZ1tG8vXJiD1pUl?=
 =?us-ascii?Q?SsOBJbc2tcvodWtHW8ZoPcuBJr/uUKKOfsTZiMScoa0lln4DyNd1sl3mZuZX?=
 =?us-ascii?Q?TGcQikvirrhJX72LYmDKXSFlYIL8Z0DMhjYk8T9DC3SBT86VEHG68w5KWhMs?=
 =?us-ascii?Q?DgGHDSbXyIvs0KNYVZu++OOiJJDn5W7At8stP53+MzA6+nVuVjZSmPvxEbLT?=
 =?us-ascii?Q?+5QmMc6FL3+fCLlrFsLeiJVzBc/Lmoeg2w3PXSaSZFGoIrYPv7d8NVwB/47w?=
 =?us-ascii?Q?5SuAK7+P7xD93HC9vp+lxL0/exxXijZKs8ZkPVM2x9y2mqPWcc60E9eYqmXL?=
 =?us-ascii?Q?xc+fOttxLSc8g7C1A8VnXOSBrP3GNavHCSvhtalfXYZRbAIKz+8YUsfSMqga?=
 =?us-ascii?Q?88CtMRpUX3b0nlUmtRHnjPhH6wLwTIJ/Nk/szRaamVwqSBNfxtLMNTbvipQo?=
 =?us-ascii?Q?mCh+wpkgZXgxop4ao//stetCvqs4j2GZZ9NpKKE8HffRFZQePq+UV+WPFGT1?=
 =?us-ascii?Q?dxcWAAY9Ld78FgUse93B6sRfTxNDJ0ZKWaZ7sVW9/rVkAegl0OZeWreCrtrV?=
 =?us-ascii?Q?jby9Lwc4ZLrgppXO1NCSJ6t97HX/sH6J6yc1?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(35042699022)(36860700013)(14060799003)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:35:06.8497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f47826-d2ca-4728-d73a-08de157f2b8c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10409
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 17:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225340

On 14 Oct 2025, at 20:12, Peter Marko via lists.openembedded.org <peter.mar=
ko=3Dsiemens.com@lists.openembedded.org> wrote:
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Handles CVE-2024-8354.
> Drop patch included in (backported to) this release.
>=20
> Reference:
> * https://security-tracker.debian.org/tracker/CVE-2024-8354

10.0.6 was released last week, with a number of potentially relevant change=
s given how this fared on the AB. Would you be able to upgrade to that rele=
ase instead?

Thanks,
Ross=

