Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397D4C0218C
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 13:41:31 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.26])
 by mx.groups.io with SMTP id smtpd.web11.43473.1737553284893323655
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 05:41:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Hy00xyK2;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Hy00xyK2;
 spf=pass (domain: arm.com, ip: 52.101.67.26, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=enrUiKcEUaW3lxul1RyHVQI6ReVlsmFBHy350FnIU4zXnXDjAck8OxztaKOci58mqHfEmvMehFCD6TIRpx0IN4QSIZ868bdte4NhZPrYBAYL2e5iNtHhK2EvgmnIK9nVd3tmKPT9o8crL3Ynwiwrz8OBFLWrd6XKLBCrRgezoovSbVSbBdAD3ZcfjD5tQDigK341R3cIXloEZ4zZ+4YhH+RtC4N4qVJp0R3JZALiubW4921nV+lBpDMBbjLDkZntODZwLCzyAjm6fmlmylVQF4K+um9GMwzEaxd25oEpF5LrsKykr6lU0Qw2dZ2aqa0K0YK3YyYSSZfJR8Vf97YpGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEbCcMkcnbzTub3YZqzZaIo6jLtxh9xeai5g1C0GKXU=;
 b=GIuYggr0ZJFBvx+z1M5VsPabbDSowkBBqX6Oe/0uy7T+pZA3e//b4q6w4Mcf47TWB2rtXvg5hsaCHaGU95P4vJ3kjAwAya4ZXQU6hiV0hKO7NGXSzO2EcwqLOHZtEca5OR8uDYOhjdE2zHA2fXxV4Qi4mlfwEqcMwhUM54LEwCMsxQioDc6XhjNjnowwjsl11fHQbrR4JgDHbkbrHNztU3p6c/L/n2E4Imwcz1/ORT18QRt4yoyVQ90PEyiQauEdOBBqNr6TkMOPy8hUvV2f6AUZQ23NqUe8PTKeLslPOzG9pOasyFucq5VJJoP35WItExLbbV065LgtZoAqqhyaHw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEbCcMkcnbzTub3YZqzZaIo6jLtxh9xeai5g1C0GKXU=;
 b=Hy00xyK2h+YzJiWyJcEq26MhrAO/XNaaG8w96FS9c/u2DbaMRWhKmrCOofqITy/Mha1YtAsvwwiLZ14cC1t8r13bl3Rruzx57ihPnPkJWYpflPQBFhitt94g0kZTeIr6LYkE/WfLz6kLFMJmKrLjgRLuDW+v6Tlpb8awfX7jdWk=
Received: from DUZPR01CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::15) by DU2PR08MB10088.eurprd08.prod.outlook.com
 (2603:10a6:10:49b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 13:41:21 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::ce) by DUZPR01CA0051.outlook.office365.com
 (2603:10a6:10:469::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Wed,
 22 Jan 2025 13:41:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.8
 via Frontend Transport; Wed, 22 Jan 2025 13:41:19 +0000
Received: ("Tessian outbound 29bc2c4ca0fe:v543"); Wed, 22 Jan 2025 13:41:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c7c0fcf21c2a8b0a
X-TessianGatewayMetadata: JP9kh9OvfjuqtiaIpf70dcZFTnx44fL4RZ8d9Cc36c5AcWK2JTq2YSOM3JMNKUjro3wezmtXDAXiYx/oKzvT1ls979wWQGR7n8GlDwcM/6TpfLouefLO6D3kldT8vzeDaktMR1Un1eX9U5w7Ov+/iQT+0QGBA4evd2uBc/Y3gBA=
X-CR-MTA-TID: 64aa7808
Received: from L7186a41ef70d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F6CD102D-D0AB-4310-A134-5CD0B21F2882.1;
	Wed, 22 Jan 2025 13:41:13 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L7186a41ef70d.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 22 Jan 2025 13:41:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vydmWqVcG8DoZ4pmegv2n/P+UuCVzw7X1y8ypssQaLwwjE/4jcvw/MEuIr5WPiiDwqk6pbylxpGeqJ1yMNR7iODJHiXn97eUK128Os5tNj6P/+A9pcCKi7i4mbbXDRjPtjoidRmYK0WjUX4KdnpnArDXbCXyHRq0lDssinhND+JgTmspn/E3CM4uCC7OwMdYsvm29s/xKl5I/syNLBGpqdqMtnI3MH4lSX79GMr0UDentypxiA0xR1Z/YQ978as08zhrbDjLYD2Zm8QqIeY/p8k3KQggJ2zMbEAE2WQN5KCuEIoZSicUeV4vxIRca5TrE7LmfE+wD5xF1tWecYqCMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEbCcMkcnbzTub3YZqzZaIo6jLtxh9xeai5g1C0GKXU=;
 b=WTyhjXRx8Jk23pacibx/J7k3LQA0jkyO4PHNwnlcak1S/BHMk53AHiiSNPZGgmxYt3pvYr9xTEhaSohbqquW3maLYsnn/tD1qqn0NkZwgJ3NW8FTiHKiJQrWsVzgsg5Vn04FiJEvfZdQbAk06rH0t+OpVWG32SUTHaUn0dC2xSy/aAfWLMFDcD6A1cOahmDkf6Ud8yoBrBJqufKPsN6RKZeyQjgIq2GlLS8TqliZWOFJyCh7AOigVDYH3i6FHudDjE9k3LoyLs8T4hWUGFaRYpr261wROqTD8RHGImlATCcot2unQRg1WEyRD/fiZ6cz7Ko3H/h6DOoRelBvKUf7Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEbCcMkcnbzTub3YZqzZaIo6jLtxh9xeai5g1C0GKXU=;
 b=Hy00xyK2h+YzJiWyJcEq26MhrAO/XNaaG8w96FS9c/u2DbaMRWhKmrCOofqITy/Mha1YtAsvwwiLZ14cC1t8r13bl3Rruzx57ihPnPkJWYpflPQBFhitt94g0kZTeIr6LYkE/WfLz6kLFMJmKrLjgRLuDW+v6Tlpb8awfX7jdWk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB10348.eurprd08.prod.outlook.com (2603:10a6:20b:57c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 13:41:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 13:41:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "sean@geanix.com" <sean@geanix.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] image/populate_sdk: Support usrmerge for
 nativesdk in SDK builds
Thread-Topic: [OE-core] [PATCH] image/populate_sdk: Support usrmerge for
 nativesdk in SDK builds
Thread-Index: AQHbaOEBxKQ4HzD1JUKR9/yf3FIR67Mi1MkA
Date: Wed, 22 Jan 2025 13:41:11 +0000
Message-ID: <C02E5327-1001-4CA9-BA15-E063F862C4AA@arm.com>
References: <20250117130851.4055166-1-sean@geanix.com>
In-Reply-To: <20250117130851.4055166-1-sean@geanix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB10348:EE_|DB5PEPF00014B95:EE_|DU2PR08MB10088:EE_
X-MS-Office365-Filtering-Correlation-Id: 49f0b4ee-dc20-4a7b-a259-08dd3aea73c6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?tH90nNY/sBXXGmp+hKHBYDhF7e2XucpR2KZ4qDhoTJMQjfFY7VlMLpfhZSBq?=
 =?us-ascii?Q?K4DULE16LcYEP8iUOkcTEYY4l4e1oxrKPQhRuSfZD5MErj55KbSMO+0GGBHu?=
 =?us-ascii?Q?RfG/Y8EXcf6ajZdouf1VkPES/j7iXoEKVGOUjAuj2Qv9QclE2yvDS16LHGSK?=
 =?us-ascii?Q?OGF0EqCpeKwgeOZlUpTUJBb3QlX1jdY9R7UO9fCpQQ/De96VJQ0yWimiXfbP?=
 =?us-ascii?Q?3esNACOxGH+LH4Wojex6Im75NGD2Nzk3kSl8baih2j2Gc30hA/emxgo98Hxf?=
 =?us-ascii?Q?BnmEE0VMif1UirN2AlFUL5nDMXiAemZpzf75YNEnoNjziHFtsRYTmtYUJlpw?=
 =?us-ascii?Q?dlpUI945FgbgNoNKP4gdQB/Q6vdmi59ZPIo8ew+cT5edPbjGzyClbJyUFWTL?=
 =?us-ascii?Q?sUPpTYDWTv4dYy57Tp9/8HhFz5cH7DB5e3vRhNagXv33StKQ1czuTEOsgl6t?=
 =?us-ascii?Q?ZAcXlMBIG3U4RfQ40tNMjSAovGuLffiG0bXkFwY6f7HdpEiAZmp5LdTzBuOe?=
 =?us-ascii?Q?Cdx7lIIssMatOmi7blJvbkPO1FhVT/TVolpyi3gTxwrwniy7bQHFUsQZRAvf?=
 =?us-ascii?Q?KNegsE9XBF8CDKZ/jOgXNWCIseMJSltNpOfNy/XELb0AYe2RK8O293m09DKc?=
 =?us-ascii?Q?KzXPLgGjUG98DszzQt0MlxLHJW5/TIz+l6lpdRo03x2Pljayj7FqSE20nnKU?=
 =?us-ascii?Q?HGA+hqQ/dCGRdBriFleFW9527QSEa8nXWUgMh5/L5VHnjqgBrNPGDItjZIEC?=
 =?us-ascii?Q?SaZh4ntDmbsA+1HOPqEsqFm0qLGO5p+XPcLKzedj6er2Hdd6JE+C4f5bfDUr?=
 =?us-ascii?Q?VcPx66K0qVDucR0MPDfoeO4ZicZ5fCXTCyZiDJYWY2/oI2nfO+/19ARELwT9?=
 =?us-ascii?Q?fKYAJjsENHAPtJSt+xeSM4lPhsbMQUg6HQhdiSxz+i6w1SljauYu55zI3hRM?=
 =?us-ascii?Q?hmTVEYr+uqE/sTBVItlnAi7/1AFGhshnCeaE0hhUQy/vKx2AxRI0v/wad/5w?=
 =?us-ascii?Q?I3xVMZebsif8nIPs0d4krnrSX6IbjaeJbnmJHCF01IoAg0P12yI+Zfvmr8cH?=
 =?us-ascii?Q?+9JptFqmJm1X1PRcFZENY2kIhqdAZymW7CM0upfSJVnjSklL2DG3aBp3t3Yk?=
 =?us-ascii?Q?2et9ch4hViEHaMMz2Z+mzipzi2TCm5d9m3VX0sMMiPE4YaolmGg0jq1aVi1P?=
 =?us-ascii?Q?3CqUrtnlQINuEuF05+oblrWdxBACV09DpfsKMVEQiBZxsfUZ1b6JB96ggWYs?=
 =?us-ascii?Q?8rPy2kJAkToa667501wEoibq6oJiyS69GFqWG+rj20lZtEpdCUKHOYROQS1Z?=
 =?us-ascii?Q?EdVQeMnaULE2hBj3pLBnO0sbBSRpvP56NPsm7TMuILzTT/w4LNNbYNMobvpV?=
 =?us-ascii?Q?Ar9K7IowNizBOeIA7ErEfa0VfUct5xsY+mwCkc/OhcOcpljrcjfs60tZTbjA?=
 =?us-ascii?Q?bDInw+mKqzrSeSm6tYFbyZU7n5DOnC6b?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7EA779450BC1D24EBD500A0C03A9B1C9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10348
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	93a8601c-361a-4ae3-f4ae-08dd3aea6ed8
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dYGLMrPSB8Uw2uiREuLxG/EcV872Y6svfBXBIXMnEXSH3oratnXxFy2LVaX1?=
 =?us-ascii?Q?GXVmCchWKJk/RdLbMCQAgfzygy83xg20Ppt7FkzQb841UIks+TB0CkiEUI7W?=
 =?us-ascii?Q?bFqFOrLjaCAUxlitXdrtvg7X79ieWzIl9xaQLTFjIlobuSgOxON2bXHlVreR?=
 =?us-ascii?Q?mNyFcdcmC9WujurVbnmUavzZwZ3oMm6js/n/W17YFvvmEmeajBb41pxANspf?=
 =?us-ascii?Q?9DlnET+64F56CpdDYcDoxQdjC0SrUjvEJHYsYlCwnxDGPvfCPig2qjw8YzE8?=
 =?us-ascii?Q?uM8F4dq8vKoa8HLgXPTxai2H0xkv4PDKAlLbV/00/pTA47RyC49QuzmU0CcD?=
 =?us-ascii?Q?AEg754o/rl1Mugs5I1zsXxboTAGKPNIf+8oRrpagn7h1n5ctW7j7x4DhYZW3?=
 =?us-ascii?Q?lu2oqVywPidKxO+TYTzKyvhN5omIvQwsFnR3eIGoFaiTH/ltuDBDb0kZ3hsB?=
 =?us-ascii?Q?sKHAjNbDBeg6UFQ8JIemHqynjwXmcHTy9UXfFD5qUiBPc+ynEI0NYCaZh10y?=
 =?us-ascii?Q?kOiZ/bYjDCCkkoRz1tww+zRhJRo0WLsbvriRfc6sr2KxGpsWd+OLWzX1PLk0?=
 =?us-ascii?Q?CMOYKPcWsNz4DF+XtxbEwuWpTDWP3RroCk6lni9TomV5Ns+3Z8w/0wpPvSd6?=
 =?us-ascii?Q?JTFqX8W+NuAnHdXVyszhqOGS1ax+/43m6+30xyxevyJNuHVheJUIcY6z7Y/A?=
 =?us-ascii?Q?YFxtKlBVUL4KdcW9hW9tjIs7Z797lmWm938h6RChKUzTde9ZksJMIIitw8wd?=
 =?us-ascii?Q?egnYdAcERhQS4/5BT+wOln0XqYZUR5Hp7pmJ6VDU3+QVtWlW6t//oKF4+nXD?=
 =?us-ascii?Q?rSZ8YiaTFcYG8V65xsi0kmoQ/5gqPjZwRbB7LoTREcz+IegROAO85Wt282za?=
 =?us-ascii?Q?HrgCGAZhl0BMj4M2eBuYF8nwfSoVfD7py0uKHOOnBmdrX1gnifw12srECuh1?=
 =?us-ascii?Q?hDkRV+omhn/mqYcuiqsItU1hZIiFLyGp7W0cDrMxHd/73gp1kZ/w7PqKsZUL?=
 =?us-ascii?Q?agAkyrf3rn8gZ6qo+K5x4EuIzAVYQ90UVtf1W9mJY5NGgpLklgD4S8cou0Nu?=
 =?us-ascii?Q?ZfCCY/FHfwIvrQ3vXZO4PmYM00ouUDGpiw1OJSvhh+RpfdG+e80KQGCyVqck?=
 =?us-ascii?Q?H1RemulQhRbXpJT7+V49dZPxGNkiKxg9PPfMtPHFGYTTUSx57Gs6GGWvxyIx?=
 =?us-ascii?Q?Pj6SMWUV3wL3JwwdIOgAk8akUZ8fRjRH++N1UFOMqj9cTj39dMs1YHlyuA4x?=
 =?us-ascii?Q?3J9ySOg2xQPB+AEPja/+TdUOkMGqirNbBi1/0Ei2eEfF92TAbqGlwJzWcyti?=
 =?us-ascii?Q?ujjISjkIw5iyIYQV0jJzeGNaGFYURx9WHVTI65NexU7hobgqb15fCTOD1hFY?=
 =?us-ascii?Q?D9Yzr+D2Jr0dFpzXnLXcVsZcklc0/VEBVNbBdgF7oHSE0+wRyoFS3DYiGvC5?=
 =?us-ascii?Q?SAVUJH50eGCw4ot4o5bSf3+HT1tJDDo3WPI2p1sqKZEG5k2Mxa9xyCNwaSoW?=
 =?us-ascii?Q?EMUs5kdlYksFkSs=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(35042699022)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 13:41:19.5634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f0b4ee-dc20-4a7b-a259-08dd3aea73c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 13:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210152

Hi Sean,

On 17 Jan 2025, at 13:08, Sean Nyekjaer via lists.openembedded.org <sean=3D=
geanix.com@lists.openembedded.org> wrote:
> Some recipes(systemd) requires usrmerge. Create the required
> symlinks for `/bin`, `/lib` and `/sbin`, when installing nativesdk
> packages.
> Enable the symlink creation by setting the `usrmerge` flag in
> DISTRO_FEATURES_NATIVESDK.

This implies that there is some layout dependency between the target and th=
e sdk environment. There really shouldn't be, what broke to cause you to se=
nd this?

Cheers,
Ross=

