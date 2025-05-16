Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51274C3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 12:46:35 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.48])
 by mx.groups.io with SMTP id smtpd.web10.12267.1747399585894788110
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 05:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gffdU9so;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gffdU9so;
 spf=pass (domain: arm.com, ip: 40.107.21.48, mailfrom: luca.fancellu@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pax6qqi+GNYYTGFV1KRL5uC4hYX3DsBvLfoV5XAXtRwJ4+EtJX5u5DPJUALUPbDvmEgEbIZzeOnv7UxB9ZW3Eh45IYU9EG1LUIOGx2hU/gN37SY1P5Ab7o66yhdhLeYxTpyMJpuzOeGx/xOGwbvpVG+RGV76jRSlucCpU/dsg3xZOneYGot7at7P5YETAjJSyV0/iY1FiPsFoaI559ZUiiIBZEQTsPj13BI1S+qdnBdd8yVOEYa3T1WiYap22KJ2iZCktU+FpTKYEwSO8SkpWAil2fwydG3FNsn/kqmGPnpM0tcv4AM2KhOjp2Ju9DLA5mTE8C/OORiJGHXsx41JZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LS4GxYly49TZxhUQpyBp//Ao3Ir74rebjEDWI3PnbTc=;
 b=ehIxkaRV6QrNFynyMOQ+t6Dkm4Y6lmm0cJztIWBPZslIc2OA0o8FUfUd8k4q57We7CYxCCM80D0cDuqxEwzPQJ+BN8FAlGM+VxOej4eD4Edu6BlFKumDXc352FjlprTPEU/XrQoRArkcy2Uuyq4O7L20fCm7FKIna38v2hdUwL+Ix1g+WPXEGfxOCLGLpkirhfZwXKiSl7z3fMDMzsyFahTFq+lZ8rb7aaOMQT476rbPK2mFVUMOYmnUv5UXnYtIJ4ERfjV0ywb6TVVFY1Ajit0zuS15DXBy8j6r07zo39UhXPztKQY3tCJKPvJFi7AKYCrJCFANZPex9LthmzWHxg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LS4GxYly49TZxhUQpyBp//Ao3Ir74rebjEDWI3PnbTc=;
 b=gffdU9soBvETroHKDv/JvrAPKPS8ybnrrruLgIOiaVJZKo1LqCWpP84FTXHjE5CppYdfgYVu3q9x6ZC16wH1HK4DqOhakcbIE7goeClMhiuBd/YsYaOosD0aaoQM2dWNKgjgzg/xsQ/7AbIkZjNk/jVMDf8KL3GYqBJK5fPPKmM=
Received: from DU7PR01CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::14) by AS8PR08MB10152.eurprd08.prod.outlook.com
 (2603:10a6:20b:63e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 12:46:22 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::d8) by DU7PR01CA0027.outlook.office365.com
 (2603:10a6:10:50e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.24 via Frontend Transport; Fri,
 16 May 2025 12:46:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18 via
 Frontend Transport; Fri, 16 May 2025 12:46:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mSEEZCiLKmv2yJ6xBE5/dvbi2HQ6XEwrQCh2jbCIMGxHC6gsHk37uHcaGmSaKnK752NPV9n+l5LrD00H/siWfc7jK4vq3Tt+mG0vJyBJ5m9MAplGeAnl80XYV01CkUzQpkvR17bBiP06MdvNkfN2bf9t2jXPDVitF1/ATPgP2WHMDyrfIC6V9SIhSAvsZGCZ94B1pXZDbi12KedwYh+qKP1fqQzapRdbVDSbaVqlZ1jleElLGIWUD+dQA7pWXrGa2K2hSsSsShNFRW/LUBVbyMm+q0xw9HnnWbrqZIpgCHzsP0DtGEL8PhLZBj6Kg3x9UxDVFakz5xJQ2w1CyLvqxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LS4GxYly49TZxhUQpyBp//Ao3Ir74rebjEDWI3PnbTc=;
 b=Ap4FbttIO4+S1PqDSnAaQ58u6x7lIVNytnTsjviX7KqwFf7S/RpoEHxp59Bsg73R7fckJVrvuAo2aZzSMNfsM7gOCUSnYwmO8+S8hoX0p7nIVvn5jpKcLRHshV0FfMc0CI3co98WkoTSmvPDlK6I18ojETAAxjygvBeIEJ8j7uISWIqDsMJql8FxaeCsDHRhnA4dBan/n3w0O7A4yPxNnk0xju75Ypp15tbZvrWmDO05X3QvrF4czkQfdR5QKdoDTtBN2OHokQ3WuGJsLq8WVOnfg+fT5YJTeJnRbKtduM26mntaz8wSQdHmDxEPkt5uKIwV6RtTNrmzWPNSEytZAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LS4GxYly49TZxhUQpyBp//Ao3Ir74rebjEDWI3PnbTc=;
 b=gffdU9soBvETroHKDv/JvrAPKPS8ybnrrruLgIOiaVJZKo1LqCWpP84FTXHjE5CppYdfgYVu3q9x6ZC16wH1HK4DqOhakcbIE7goeClMhiuBd/YsYaOosD0aaoQM2dWNKgjgzg/xsQ/7AbIkZjNk/jVMDf8KL3GYqBJK5fPPKmM=
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS8PR08MB6165.eurprd08.prod.outlook.com (2603:10a6:20b:29a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 12:45:47 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 12:45:46 +0000
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>
CC: Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] clang: Include the libclang python bindings in
 the build
Thread-Topic: [OE-core] [PATCH] clang: Include the libclang python bindings in
 the build
Thread-Index: 
 AQHbxZq5ZISzQqXBeki2/byi0MF8RbPTsSuAgAAA5ACAAAObAIAAIHSAgAAyMICAAA5cgIAAFcmAgAAEzwCAANUPAIAALzeA
Date: Fri, 16 May 2025 12:45:46 +0000
Message-ID: <C8EC2D37-BBD3-461B-B150-9FCB7A12201B@arm.com>
References: <20250515130753.326236-1-luca.fancellu@arm.com>
 <CANNYZj9qTsHiDK-hHgNUN72+i--RamkCNt760Fa3ZjWkEzqSAA@mail.gmail.com>
 <6C8DA825-0E82-4776-9E56-55B17CF1052A@arm.com>
 <CANNYZj-71JnUvJb1tAZ34TGQX8RTwGB9ATUVc7-ptf+CemP+XA@mail.gmail.com>
 <1CB83516-B9EF-4381-85DE-59B4C55A031C@arm.com>
 <CAMKF1sr68GCyfXRMuS4cUBRL4jCEd4RUZ4GZrKN84R01w_gfSg@mail.gmail.com>
 <BEB697EE-4F8F-4832-9C8C-F149BE8E862B@arm.com>
 <CAMKF1srHjmPo-tcx2u5c15oZCNzFKu=NagkFFHQ1UCYdCWe9bA@mail.gmail.com>
 <5979472F-B748-4ADE-B950-636574096C3B@arm.com>
 <CAMKF1sqAXCiaau0jfDo3OgoG=LFc96_czB0yC7JDsC4S85jJHA@mail.gmail.com>
 <A5AB0449-4EAE-422C-8314-758993EDA6E2@arm.com>
In-Reply-To: <A5AB0449-4EAE-422C-8314-758993EDA6E2@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	DB7PR08MB2987:EE_|AS8PR08MB6165:EE_|DU6PEPF0000A7E3:EE_|AS8PR08MB10152:EE_
X-MS-Office365-Filtering-Correlation-Id: 072f91d4-68ea-4944-eec0-08dd9477a865
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?L3plRllIYUxNaU9EYXpCcmEwSW5BRjBhcWFFS1FFTGJKYkswc1lablB0YkF4?=
 =?utf-8?B?U250UWlTd2VzSHA5M2pHay9SZ2x5azMrSUtiWWYrb0c5Z25yNUd2d3JMa0JD?=
 =?utf-8?B?VUhKc21DaC9BRWRvQVpqeDhHVDZWaHc2cU9rUFltOW5odEx4d01qRUpMTE5n?=
 =?utf-8?B?VTJqS1ZtRkNBREI5aFRaVHRKSkYwY1lSL082RDRtYzl1eGIxZFVtQ0piTTQy?=
 =?utf-8?B?UVJsMHUraWNvS096NHlidlh5UWUybmxIQVF1MXhVdUlyaWI4V1d6R1pZa1VY?=
 =?utf-8?B?eGllUDNSTFYwUGhvZ2hkK2NOSTNYK0ZNYVREUGxvdzJ6UHVsN2lNTE1kNlBs?=
 =?utf-8?B?RUhPS3IrSkpUdzRnRy9ZVWQ2SjFoY2gyeGZySXBKVG14b2p4SVdGUC9JZzhv?=
 =?utf-8?B?MnRhdnVWNVM3ZEJob0I5SGZJUDRMOEsvMkpBQ1RHTE5TM1ptTHVuL25hWkFv?=
 =?utf-8?B?WU4wQVVXUFBWTFNTbS9DL092cmJtWU01UFEySUpaL1VnaE11M0N0c3N3WVQz?=
 =?utf-8?B?R1dKTEV5WGl5bmZwMEVvOVdFNHpPaGQ2dU5Mc1g3clZ2eDNCQ1RsL2p4V0d5?=
 =?utf-8?B?OC9UbkJEK0c1cDRTeGZOQ1NCU3Q2OTRDRjNHWnVacjc1NGxpelV6U3RLVjkx?=
 =?utf-8?B?bWZGVGY1VHdFcUJJZW1RQWpzMEhIaFJ2Q1BSMFcrd0UyaDRRdHd4Njl5cjR4?=
 =?utf-8?B?aE5IMVFRRllzM01RR245dWxCMS9OaW50R01FN3lSeU5EL0I0d3ZpZXJPNnls?=
 =?utf-8?B?ZXJCZWlnQXVqTUVjZkcvU2tDU1dUdDBINGZTTXAwNG41d2tnZnhPeW9QZ2NI?=
 =?utf-8?B?WmlTb1VuaGV3T2pReWVDYVNDa0pGdTA3YTZNdzdZdkdPMXRnWkJhZGFHUGJB?=
 =?utf-8?B?ZVdDTmY2ckc3OGduT3BpdGRYSVNRV3dvNEZEUkVxV2hDd3oxYjQ2cHgvSjJH?=
 =?utf-8?B?TnhZc0xjV3l5bGVKNURWTWlJZnBnQzk0RHFGcThPbGpmNGNXOTZQUDMxd1I0?=
 =?utf-8?B?WFlGYnRIZlpyOHJLeDhJMUxPMEIzUElRZXJZcFVhNERCN3NNd0NTcXFjY1Zv?=
 =?utf-8?B?Vk5FSDZjTTVyY0k2Y2x0akFYa21UNjZyMUZXRSt4MzFnM1VkS2thRDBJNEt5?=
 =?utf-8?B?Sk5WRmR3WXZCMlZnK2hhZlA1OU13aHJaRWZOVWNpWHEzWTVwODF1b0FFQ095?=
 =?utf-8?B?Q2gzTmpSZmpWc0NidzZqaUNpMGZWMlIzWGtiNWxpaVJmTlBnbEorOWFVc1Qz?=
 =?utf-8?B?RnJlS1ozU3FiR3JIWkJ6NGdVcGlTdWtVYStoYWc5cVlsZkx6WG9yb1cvbTlU?=
 =?utf-8?B?ek1IbTc5emM1RStTdURvS2U0dDc2aXZJY0c3NnZ2bHJML3J4ekxBNjJMYTdE?=
 =?utf-8?B?NXc5Y3NzUG94Y2tMb2JsUXdxUlMzd1dnQzBnWnBnK1lTVVVNL0hIRUNERGlH?=
 =?utf-8?B?YnJ3MDdKOHRZZk9VSnY0K21nU3ZubVBpaG9iVG45YlhkWWh6NUs5TVF3YmI3?=
 =?utf-8?B?ME1hSDluWW5xSzNjaXpSNkd1dVJiSGh3dXBDVjZEa3pxN1RrSjEvcHc0UnBz?=
 =?utf-8?B?VEVEaEtDcWFYWlNkU1EyVEFnMENhbnBMdXJNTjFkYk03WDh4ei91ZlN0bkp6?=
 =?utf-8?B?VVo1N2VDNGNKaGo1SVlHaXNNTDQxQmlWMzVVb2x0Q0J1T3VQTEJKYkw1U3Jx?=
 =?utf-8?B?MU9IZ01OM3ZRcWt1K3l5NEFUYmgzVEp0SEVwQXZDVkg2enhuMkFsdE9UcXVh?=
 =?utf-8?B?RlhzaWNlUVpTUFhmaHBPU0hiZG9jRU5TaUFkV2dyaGpVNGhwMXN4c3I3QTFm?=
 =?utf-8?B?dUNYcnlHSjF5Vnc0d2xuQ0NLSDIrUHNLSzNBU3JkUUhkM1pBQlhmVWtCWlV0?=
 =?utf-8?B?MHo5UWVRMG1iQkxFbkJ5UEl4cUZOcDhIaFp2UEpmVXFjaGdDZktCTWwxYUZm?=
 =?utf-8?B?RjNHNFRQTVRtd0xEK1AyT2FOVURTQ2N3M0VCdmdCbndTeTREZW91Q2h5c2Fr?=
 =?utf-8?Q?CE+UJNrm1kv5KYfPGBkJ/pZfQKAQhA=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3447D53509BE74B9652AB64564A9D17@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6165
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	150ddbda-0930-4749-e06f-08dd94779416
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|35042699022|14060799003|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VFkyQVFYelhxQ2JRT2ZzZytPVmttUGZ6RGZuL3MwYTByOTNMQlJsR3A1M0Mw?=
 =?utf-8?B?bTQ5RjdCSGEzMlozL2M2TWRSak5FNmhEb0ltb1d2QjlBNmtHUE9kOERSZVIv?=
 =?utf-8?B?MGI1dmhQa3pMVFVGNEJ3WFQ5V1ZXVG1WWVFSbThhWjF3SEJjUGVWTmxYYkxy?=
 =?utf-8?B?RklLcVd6MitTL0Q3Wm55WThlRlgyQ09xdTZqY1NsdWcwaGhGWnk1WldxR0JT?=
 =?utf-8?B?UkNQUklNc1hGT2oxZ0ZsOEVpVy9OMVJ1K1dmWUl1Rkh4UW1Ubm1ndC9ML1pU?=
 =?utf-8?B?dzJHak94SXpzTlFyMWlqdWxNV3lkVWl5R3k5amdCL1ZkTjdJZmRVemRvNkNC?=
 =?utf-8?B?azFOK3pUeVNFU0RaemRGZUtLUUtDQkYrdG1CejQ4K1hZN3cyYkxqcFpWNDIx?=
 =?utf-8?B?LytwZ3Z4VzUzMTRteHZXWmM0Zml3dGhzSGF5akRVcW5ucHU0V0xJUWFBNzVV?=
 =?utf-8?B?dEY5dXVrMzh2VzVwcUliSDdHZE4xL3lORkNEN0paTUFuaGEwdGxSWXo4Nlo5?=
 =?utf-8?B?cHJGaUZWc3FqQmUwbXNWdXRocGxTYTRhdVFSWjVibyt2OEhWZVBLUUZLbURY?=
 =?utf-8?B?ZEFieDB3U2FlTWxaVm02di9yTlUvbXZHbjRnRTVFV01YdnFGb1cvUktKVjBY?=
 =?utf-8?B?QUxVNUk0VXFydFlIYWxkbWdZQnM5dThpbGhQU2JZcVpwOWRENk1wbGRxVTkz?=
 =?utf-8?B?MGFkS05KS3pNSjVlTU54dXdybjlNMHlaR2ZUS2hMM0pTejdpTjNSYVVRbWc3?=
 =?utf-8?B?UHEyQmNpdUlkZUFWUStnN3lqeThJc1d3MlZ5MGlOei84dnBVTFpJb0VyRUdN?=
 =?utf-8?B?eCtWRUZ0N1ZoaTRSQWN6RVByR09Vbkg2d0F5ZzM3WFpCcXFHWUF6RjJqRHcz?=
 =?utf-8?B?RHdFeldGQ2RrNVhEQjd5blhlMFJ5MHEwZUsyalBXNUc5SlNnMnk3UTNNNGhw?=
 =?utf-8?B?b1NSV1MrTHNwOE9kK2xmanFsMC96c0Q4MTByR0ZSSXg5TVcyT2txRHpCV2Fz?=
 =?utf-8?B?TGJ4eXRtM0kyMmNFS1dPZDhPMHBOWEtPVmN4Tk9RQ0ozVzREYVVWMGd3MkNV?=
 =?utf-8?B?TUtJOHIxUEs4bFoyRGR6TjhqV21tYXNiME9laW9TWXc0UDZrc2MxdWdzMW1k?=
 =?utf-8?B?ektiWVU5Nk92QkEyUnJadS9DN09vQlR1ZlEyZUlMWWxCeDZYaWp5cmk5YkNW?=
 =?utf-8?B?OTFZeUQwVHVUMG9VaW9aTVZwcnZ0Sk42cFBOa0FSZmpJd1ExenhjbElIRUEv?=
 =?utf-8?B?T2U5U252dWJHSzQyOUdLcHVZYnV3cEtwbVFCSUVBT0hUeWRpdUc1bXVWRXUw?=
 =?utf-8?B?ZmhEL3ZhdkswUGxVaDJnRnphYTlEU3gzWkxIaGUyQ3prbDVzUXdwU25YUHVD?=
 =?utf-8?B?dU1qeDZ2bFhWYXcydWZaRzNKVU83cmdielFNZzVRWnE3MDlaQ2JwM3BBMlFt?=
 =?utf-8?B?WWVYN0xRUnphYy9Lb0ZTdVdURHFBRU5HcWZaN3pNV3h0RTgxcDJZcDh1eEt5?=
 =?utf-8?B?UG5MYXE0YmdkVzJXNnNZN2g3VFBCdk9RcUN4ZVZsUnhOTzBaT1ltS05sUUFT?=
 =?utf-8?B?dEhrbktrVEY1S1h6Q01EMmJZcDJRVWpIZloyS3I4MW0rWmVwUmw1TFdJbXZa?=
 =?utf-8?B?RGJJWWFob05PTW41NUhzdXFGbExwR1lyWFp5Ymt2aHVTYWFPdk5JWWt6OHIx?=
 =?utf-8?B?K3QySUx1L21WbnhZMXNxaUNnRThvQzBkc0cyN29GVlVTRmNrUENmcXozbHlw?=
 =?utf-8?B?Q1dSUitYRzNZR3M3dHhQL1FJVkJvcGUwYkhjQlJCelJJMWRhVmJwczFlalB6?=
 =?utf-8?B?clpSY1NrOFV2d2hHY2tZZkVaT1RQcWZSQUlYbUFicDExbFM0NG94Z2hWaUxR?=
 =?utf-8?B?K21XQWw3aTJiT1J3b0hENWxiNGV3ZmN3N21jTGZGOE05aDBlbnZZZTBRUUwx?=
 =?utf-8?B?V01wU09zNjdONkh4Vlp1ZjR1WTJZTHYzY085U1g1ME1zeXhkTWFlYkhwaEF4?=
 =?utf-8?B?K0hhWGkrMjQ1eW92N09IT3NCUTBjSFNKT0VQSkUxWGRmeWMyRVlWcUJWVGJq?=
 =?utf-8?Q?pN4MHM?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(35042699022)(14060799003)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 12:46:20.2789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 072f91d4-68ea-4944-eec0-08dd9477a865
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 12:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216751

SGkgS2hlbSBhbmQgQWxleA0KDQo+IE9uIDE2IE1heSAyMDI1LCBhdCAxMDo1NiwgUm9zcyBCdXJ0
b24gPFJvc3MuQnVydG9uQGFybS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTUgTWF5IDIwMjUsIGF0
IDIyOjEzLCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8cmFqLmtoZW09Z21h
aWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPj4gU28gaXQgZG9lcyBzZWVt
IHRvIGFkZCAyMDBzIHRvIGJ1aWxkIHRpbWUgcGVyaGFwcyBtYWtlIGl0IGEgcGFja2FnZWNvbmZp
Zw0KPiANCj4gRG9pbmcgYnVpbGRzdGF0cyBjb21wYXJpc29ucyBpcyBsZXNzIHRoYW4gdHJpdmlh
bC4gSSBqdXN0IHJlcGxpY2F0ZWQgdGhlIHRlc3QsIGVuc3VyaW5nIHRoYXQgdGhlcmXigJlzIG5v
IG5vaXNlIGNhdXNlZCBieSBvdGhlciByZWNpcGVzIGJlaW5nIGJ1aWx0Og0KPiANCj4gIGNsYW5n
LW5hdGl2ZSAgICAgICAgICAgICAgICAgIGRvX2NvbXBpbGUgICAgICAgOS4zcyAgICArMS4yJSAg
ICAgODA2LjJzIC0+IDgxNS41cw0KPiANCj4gSeKAmW0gZmluZSB3aXRoIGFkZGluZyBhIFBBQ0tB
R0VDT05GSUcgYnV0IEkgdGhpbmsgaXQgc2hvdWxkIGJlIG9uIGJ5IGRlZmF1bHQuICBJIGtub3cg
d2XigJlyZSB0cnlpbmcgdG8gcmVkdWNlIHRoZSBjbGFuZyBidWlsZCB0aW1lIGJ1dCA5cyBpcyBi
YXNpY2FsbHkgbm9pc2UgaW4gdGhpcyBjb250ZXh0Lg0KPiANCg0KcGxlYXNlIGxldCBtZSBrbm93
IGhvdyB0byBwcm9jZWVkLCBQQUNLQUdFQ09ORklHIGFuZCBjb25maWcgZW5hYmxlZCBieSBkZWZh
dWx0IG9yIGRpc2FibGVkLCBJ4oCZbGwgc2VuZCB0aGUgdjIgc2hvcnRseS4NCg0KQ2hlZXJzLA0K
THVjYQ0KDQo=

