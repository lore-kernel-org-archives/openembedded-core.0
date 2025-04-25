Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9738C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 11:44:58 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.73])
 by mx.groups.io with SMTP id smtpd.web11.4634.1745581494262413615
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 04:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GPV1bgMU;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GPV1bgMU;
 spf=pass (domain: arm.com, ip: 40.107.249.73, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=a1rdZo6yosry4/0jMlXDjw3qyJl+sBF4OHC0ZbVTpA2O5dC/YgLliGZjeSs9OqXGYOExV9c4p5iXayGJF5wjGVZ9ZlkzEa8oVQI8Wb0e2qHCmH0ecfy18EJ5IMOqF+1YrfmdAOUAVep7jAZqrsqGYRj4bE3B360N8M1EZxeZ9X3/5FvIVikgSX9dAkLDMeCpAuOXGwPF/D4J/JKP6OEjjhWJQj7wIlr9AiC82jwsVQ/zWxT7RHamuu85BgWZnEVb6Kwk+8cnFnrhzpQSEFP13yw46Mi5qcUbEnUNwWwQVAdlkcQlgIGFV56D8w6CGhOldo2btDIK6X4xwU2pZQMssw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nifR1gJ1Ar/hjMufpsvI+5OEwLGz3v1mG4zIwZP3iwU=;
 b=g7vWF9+J1/o7Onz6JhqXTu+PefMGxW04K+SvouZdwMdfEjpbN0BOhTjwW0ZO5g5K195U7nwnkOZVwJpiwBjXJJvH9YcDi/dALI+3t0jhpJ6kX7NXDZkV1fcADEadKWV7lFLTvVVb9tjnnnsGoSFaLZQpdOfWAdMQ7x7D0iqYdaplcNnn8e2IwARhIa1YkGwH3JcN7GhKTn0IQgbhUSIpEZU2owibYIAqU/tBBokbg/jq2azxWRcz/VUr2ayZhZ+qi/tfly1b5JXaF57+byyvcfketBMyD/aCzNWGtns1MzQjIqPJ1ySLwaUgci0v2lGi+xK4O9sREpieuXcNiYm7GA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nifR1gJ1Ar/hjMufpsvI+5OEwLGz3v1mG4zIwZP3iwU=;
 b=GPV1bgMUzBiQi79Q98nFoXefNWiKY94SjUXuGpClxvvIpeMGVIXv+cxUeOWyLdxRbHP1K7CbVkSD/ps6vK3Xr9aPKGzPGhUywMl/nx5ql08MUwjGLeTp4BIopsXhQ4ZejarsnmLsMcNM5Andrg05TzeQ+fQRUSgeV+idjN4sNUo=
Received: from AS9PR05CA0039.eurprd05.prod.outlook.com (2603:10a6:20b:489::15)
 by AS8PR08MB8565.eurprd08.prod.outlook.com (2603:10a6:20b:568::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 11:44:49 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:489:cafe::33) by AS9PR05CA0039.outlook.office365.com
 (2603:10a6:20b:489::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Fri,
 25 Apr 2025 11:44:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Fri, 25 Apr 2025 11:44:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xfthW+IcijpSvjG5gIyHoAmlOSanrIflMWFcTd0nATeTileGAkZyc/One2cQxJPcbLkAsqCU5esGOT7mZvzD3HF9091eW8Ye38m7KkVvxBhg5rac+Q1RUvPFR67eb7Pbfb+GEKEECAQERUBsJQG73Aiw5OPvcM3Fy4gOcUnguwlTu+H3Dn4WsYyGWBhlzMNfqrvGaJKpBgdQ0HMfYBi4haeuDTf5yaN9tl9nFLUw1cLQHAlDWb2pg9OXesmmiovHapZOTpgX13+tpwV63DLTdF02iUiH6QlygXrkt9WENBJtr87QOPiLEwjqWwITOM1DHgCRpIk+yxHHqHDkAnFo3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nifR1gJ1Ar/hjMufpsvI+5OEwLGz3v1mG4zIwZP3iwU=;
 b=ThLu+pVt6Mn9l6humhaSOvERofZnmzbbEHxH7vA2mC7cKHFWU9s0lWHTj7HRiq7z5hqJXvMbRPyXfT9vDoei7ABJvwYplB8dT7bREzg3m3nc1mvaiEeECW0jbU5v08+m9yWBB8xlYZ1YffD7eaI27rpokUguyZzMXrMz6CNXOKmue9/sxfzd0WeLdiFWgVu46YUza1Gya6uh0b0tnF+JPaaBllPLVIpByPGSMWZsge+Vf3LAK6lOat6lwou/TnEa6Ux0auZc7IO3npRgjQ1EdrrR4O0qsq0pSiMK7Kj3MquIw6SPfK6laynsRbD82PRaV9weNp8+PxzQDp2EehA0vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nifR1gJ1Ar/hjMufpsvI+5OEwLGz3v1mG4zIwZP3iwU=;
 b=GPV1bgMUzBiQi79Q98nFoXefNWiKY94SjUXuGpClxvvIpeMGVIXv+cxUeOWyLdxRbHP1K7CbVkSD/ps6vK3Xr9aPKGzPGhUywMl/nx5ql08MUwjGLeTp4BIopsXhQ4ZejarsnmLsMcNM5Andrg05TzeQ+fQRUSgeV+idjN4sNUo=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by PAWPR08MB10897.eurprd08.prod.outlook.com (2603:10a6:102:46a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 25 Apr
 2025 11:44:15 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%5]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 11:44:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 1/1] libunwind: 1.8.1
Thread-Topic: [OE-core] [PATCH v3 1/1] libunwind: 1.8.1
Thread-Index: AQHbqt1k7cZlgvxc9ES+O9hDAGzBurO0VLyAgAAEOoA=
Date: Fri, 25 Apr 2025 11:44:15 +0000
Message-ID: <329FC220-EA62-40C3-B085-BA73A48FBB25@arm.com>
References: <20250411122926.706371-1-adriaan.schmidt@siemens.com>
 <20250411122926.706371-2-adriaan.schmidt@siemens.com>
 <CA+chaQd9qFEXem+k9sbyWHU71k-ijTmZC-XHXUMHt8ibA_o8Kw@mail.gmail.com>
In-Reply-To: 
 <CA+chaQd9qFEXem+k9sbyWHU71k-ijTmZC-XHXUMHt8ibA_o8Kw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|PAWPR08MB10897:EE_|AM3PEPF00009B9F:EE_|AS8PR08MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: fff89422-b5a8-4afc-ec37-08dd83ee94c1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?VDNaOGd4L2FUT0lESVNrNkdselM2VkRBWjFhZktNWS9ERGorLy92aGVGNDBz?=
 =?utf-8?B?bFhJVk16amQ2bittZVZjZ1d0ejA4OXFKV3UwcktZZHcrTS9BTjNLLzJtUFRM?=
 =?utf-8?B?c1crenpNeEk1TDlaZzl3ejA0ZjROWllieWV6WFRlTXRURHJJcFdybjA2Wkl4?=
 =?utf-8?B?ZU5zTlJnV2Z4STlQV2szVjcyTXRGaGM0K3VKZDZGVVVsakVhSFlOY0lXS1Jx?=
 =?utf-8?B?YkdiY2xzTEFBenUxZ3pvTm1EY1FPdjFTQzN1czhGMzJJemlLakxUV09sWmtt?=
 =?utf-8?B?MlVKM1ZRaGtUeTNXZSs2eTZyamFHRW5lOGgvNXBRMUhJQ09rYjAvY2srZ2ZM?=
 =?utf-8?B?Y2tuZi9zR0xES3VjL0RUS2x0cStIdzZEak1mejFMWFZhU2RObWdwWU9wUnJE?=
 =?utf-8?B?N09sTlhMdUtnMDVlbU8vRWRDSER2ZjZRME1GczJtZ3FKbzMwT2FmaTMvdlVv?=
 =?utf-8?B?VUJpS252QTNpVEdmdU92UHkrL01HUjF3OVRGTjdWTTAwSmM4TzhPbmw2ZDNM?=
 =?utf-8?B?N3plb1JJQWZkbllPU2RyTFIvd0ttZGozUytyOFA0MG5jM2xnZEFlK1ZCeG91?=
 =?utf-8?B?aUtFZm5DenUrQklTWUtPbHZCOW5QcXpaQy9OZUNwVnZ3SUtSTWpPTGpLRlh6?=
 =?utf-8?B?NDRNQU5BR1NjZVBKeFltd3R5bVVZT05PeVMyWXRlNG5vY2N5NGIwUEtRVC9p?=
 =?utf-8?B?NFhhb3lqYUVtRXk1NjZaUERSdWtiSzJwUmZaZlN5OU9qdDZobE9NbnZkam1h?=
 =?utf-8?B?M1hQS3N4U3loczVzZWNBQ0tBUldFeHM2RGZHN3dOT0hpOStkV0MxdEcyaHpO?=
 =?utf-8?B?QnEzZkhkSFNRcklpYkZmNzRMK0hUOGoyUUsweUw0NFhaeTBKNE5WaGRCUGxu?=
 =?utf-8?B?emV0QzRIcnFwdTNpT3RNRTBPRXhERnI4RDFKZlNjLzl3ZThqeElwRTJCS01u?=
 =?utf-8?B?cmpKUmlXQ0hyTytvV1dJVE9kUExFU01DdGVHM2xnTHc2YkFDcjU4b01pY3R3?=
 =?utf-8?B?TG1XVDhraHRxanplY3JIZmR3VUp4Nm55b01PSGUwRVFxQkV0dWY4d2JhNytN?=
 =?utf-8?B?a2hzNUFnY3JSV1hWMUI5dmlMMVNyckRMT3FSMkk3S0tIVkFHaTl5SmUzVUdu?=
 =?utf-8?B?SElvUzMvWHB2ZzZTVnorcURNbHhZdy9RbHJiUnVOK2VjNC9naTlzS2dYc0pR?=
 =?utf-8?B?Nlk5OGV2NUlFWkVETXFZOGZMbUYzZnE2Y25MWkx1dUdRZEhBNTJQdVFCcjNI?=
 =?utf-8?B?SGVSWWlHZEJSVkJzTUtkT0pYMm5uQ2JLVjZUSHlZYzd0Ky9xRGpIZCs3bU1L?=
 =?utf-8?B?QlRoTkp6aE94dnl3R0NDZ0JnQWw3M0ZTanVUSTFwMnd1TjFRcUhacWZHby9X?=
 =?utf-8?B?NnpUOHBpM1BFbDlIY2w2NmxQSzcyWVg4UEVFZHYra2NMRjg0U1pxZnpaSVJm?=
 =?utf-8?B?VTJSYlBqbnVSeVdLQXhwS2xkZklXakdjSEtTbHlRbTUrcHp4U21CU0lYQlFR?=
 =?utf-8?B?RHJvZ014VENBUUlnYUUvTEpmMW1DblhRTDNwN1ZOUW9wVktLdU5uNGJXN1Vo?=
 =?utf-8?B?L3VaMjNQQk15aWlFSlBURkxpRWRTTHdaMnI1RFdmSnNFeGQvMXFYdVY0ZDVt?=
 =?utf-8?B?U0lpZHV2LzVQbDk1MnBPSFRMZ3ozdUQxUjB0WVRFdUxpUyt4SkdsdGNncDJy?=
 =?utf-8?B?TjRYaGlSMVRRMVVpaDRESmtZZzQzWVJvU1pZUXN2SFBDazZleEtsRGdvL3ZZ?=
 =?utf-8?B?cVp6eGhnNSttYWkyakM4VWM5blJ6dTV6Vm05aXVseU5memx4WXJZNDMyenVv?=
 =?utf-8?B?SDlSc2hJQ0x4WVlFZ2pTZjVmcmtoOGZKYjlxZDVFWWJqZS9zME93OW9hbWtU?=
 =?utf-8?B?ZHRLSVVIOG9pQml4YTlZdkdlenR4YlpoczJKa3RDR1FpVFNuSFliQTU0aFZH?=
 =?utf-8?B?V0VpaEVQd1Y1ejdYc3kwMDdoV3pPc3JFMlVRUTJ5OTB1ODMwcXdFSmduazNr?=
 =?utf-8?B?cDMrUkp1OUJBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DA725647AE7554FA23217BCFAF00F9D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10897
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d769c655-7a6a-40dd-5615-08dd83ee81a0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|36860700013|1800799024|35042699022|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cktqZlcyTTRhSjk3NlQ4QzE1YnJyNVlRR0c0UzhWeGJLL1huejhnRlN4RDhq?=
 =?utf-8?B?eUlXNFZJVDNFbExmanI0Z0N0c0toMEw3V2xwKzhvZnY5Z2k4ZFpjbjlpRzhZ?=
 =?utf-8?B?ekh1OXNBRnZINmR3dXFnME1WLzVDc3Q2Z3RISGdKOWJYS0tuc2hpNytwNmtD?=
 =?utf-8?B?RGlOTlhObkhyeXJlc2lpdno4aWlvdTJHRTR0T0J3S2NqaE9ObXI0RzFUaWUx?=
 =?utf-8?B?ZnNGT2s5c0pnL0lYVzU5VzZBbUorT3U5MXhkcEMyNzVDTnJNazZtYW1yc21F?=
 =?utf-8?B?a01NaklQZUc0T25ZSlJCTlRWcFJaRndKNmJ2ODlHS3VGcndNYTgwalIwUWtr?=
 =?utf-8?B?K1FpdE9kVjhZd2NjZ0dYMHpPOGs4eDRtL3MxYUpKc0gzak1Id3oyOUpmdVds?=
 =?utf-8?B?eVRzTWpSNlpNQVcxMjV3Y2tPUlJJdVhhUk9Ca2dseVlLN0V6d3FlR0VOcHlr?=
 =?utf-8?B?WWplRWJiVlg2Um9JZnd3cGtkZU1RdzFWRURGS0Z6bjdUeEdFVEhMMlFXeWY4?=
 =?utf-8?B?cTVsMG5yRkE5cW5NYldNM24zL0JoSFM2OFdJRUMwS1p6RDdPRFh4cU5obXFa?=
 =?utf-8?B?a1JLWlN4ckFtYkhudVRZWFE3ZHkxaS94MUUyTzBYbExWcmJ3OXRzcXUzQTdK?=
 =?utf-8?B?UHpGeHQrcEI4Zk1LRlZxNmtYeDM0YmFEdHh4L1VMaWg3VS9uMzJWT2N6SHB0?=
 =?utf-8?B?R2tGSmllM0plcXdKVUJGMFNrck04K3pHTSt3cmU5cW1PNXRKM1NuMktvdUdB?=
 =?utf-8?B?MUNYS3N4RndpSVdKUkpEVTl5VjBISWRScFVGZFBYY3doZHlSYmY4LzVrVUF2?=
 =?utf-8?B?RHNaTHlnelNVNXRNbFR1aHJzSjE0TDRuSnpmVEc0VkZUNzc3Q2NuSlJja0Fr?=
 =?utf-8?B?NUFXbFRRb2JObG1QVUlYRy9xOW5HSjZkNW1HQzVJRWFFOGJZVGxpelc4WEVk?=
 =?utf-8?B?ZXNTYVhHa1p4UGpRN2o2SVpjeDYxTFVROVR4YThhMjVrK0dhWnhzYXdWemJL?=
 =?utf-8?B?WHhRSEFJSjdZWnROUU4xc3lWREdHRHRvR3V4bTJ0N251aEZjQWFVakxtQ3pu?=
 =?utf-8?B?eFNHT09Nb0VvZlRBbmo1U29nL3BRTndiUGNWeVR4Qk9mclI3Nk9QRUsxS2dW?=
 =?utf-8?B?Snh3RGF4aHp0S3RxMlAzUkxjU1hmTEROb0J3M1huZTdqaXpCVUFsclFYMi9v?=
 =?utf-8?B?Z2kwWGVNRGxZYjVCQ1NyaVkvaERCU3dtak1jcVRHNjc1Y3hiT0krU0t5R0Jy?=
 =?utf-8?B?QmI0Y25aQ1VuUkwvMFdMNlpuNExyNDF5K1M1ZW9ab3MwcVNXcnRzZ3YxT0dS?=
 =?utf-8?B?a1M5UXhrRElHVGhjNnhWcXpwaEJHOTVpdzI0ZkdYR3N3MjhtT2dmanJDc1VD?=
 =?utf-8?B?YTR2QytsSkx5NmlkaWR6Z2xQSzUxa25QK0FnS0JzOTk2Unp6MUFxRHJyTUhj?=
 =?utf-8?B?blNwVjhkdXFwY0IwTTZIVFBxaHF5WWJYZEdiczJSb0VienVzMmlKT1FBN0o0?=
 =?utf-8?B?L29DQS9JMHowSHNqNnIwc0xQREU1VjBYdzdhSGw2YWRmQXoxYkxGYklrT0xD?=
 =?utf-8?B?UUFUZTF5VCtXSjZmQXRXVmtuejRRL2lEa2xKamFvY3MrVWhCMDMxWDE2NDZC?=
 =?utf-8?B?cWNzTFRZSEJHbTcrMU9ZL1FacStSSVh2THhKMzlKRURnVnNUR1pQUEZsYmFy?=
 =?utf-8?B?NkkzOTFyWTRJeGx2NTFGYWZGd1hSMWZHaVZyZDJIQ2w0d3hveXV6alJYb2hK?=
 =?utf-8?B?STk5UEhQbGc4VG02NEp5dHZ4TW9PaENlTUw5eFZFNlhFbFI5NXRkbXhHZ1ZO?=
 =?utf-8?B?bkU2bDQyMjF3TzllMWtNMGR3QXB1cUJHWDZkcGJyQTFUZ0RGS2htNUhVQlQ4?=
 =?utf-8?B?V3QvQ3A4ZzF6bGpBcS9YYnVvK3MwMXIzRG1QMXA0ZEMzbkcxeWtxY0dkc2FQ?=
 =?utf-8?B?aUJ1V3hqS3AwMVFPc2E4VkRKdFZnbWNEN2RXZmJhQzBXbmhvYTN3cG5hV2RD?=
 =?utf-8?B?UG9pcTlUazloUGlucURiUzVESS9PL240dkpFdjNEcnE4eXh0UmttZFBKbzdR?=
 =?utf-8?Q?U/HQJ9?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(1800799024)(35042699022)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 11:44:47.7357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fff89422-b5a8-4afc-ec37-08dd83ee94c1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8565
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 11:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215464

T24gMjUgQXByIDIwMjUsIGF0IDEyOjI4LCBNYXJ0aW4gSmFuc2EgPG1hcnRpbi5qYW5zYUBnbWFp
bC5jb20+IHdyb3RlOg0KPiBIaSwgd2l0aCBnY2MtMTUgSSdtIHNlZWluZzoNCj4gDQo+IEluIGZp
bGUgaW5jbHVkZWQgZnJvbSAuLi8uLi9saWJ1bndpbmQtMS44LjEvdGVzdHMvTHRlc3Qtbm9tYWxs
b2MuYzo0Og0KPiAuLi8uLi9saWJ1bndpbmQtMS44LjEvdGVzdHMvR3Rlc3Qtbm9tYWxsb2MuYzog
SW4gZnVuY3Rpb24gJ21hbGxvYyc6DQo+IC4uLy4uL2xpYnVud2luZC0xLjguMS90ZXN0cy9HdGVz
dC1ub21hbGxvYy5jOjQ5OjEyOiBlcnJvcjogdG9vIG1hbnkNCj4gYXJndW1lbnRzIHRvIGZ1bmN0
aW9uICdmdW5jJzsgZXhwZWN0ZWQgMCwgaGF2ZSAxDQo+ICAgNDkgfCAgICAgcmV0dXJuIGZ1bmMo
cyk7DQo+ICAgICAgfCAgICAgICAgICAgIF5+fn4gfg0KDQpJ4oCZdmUgc2VudCBhIHYyIG9mIHRo
ZSBsaWJ1bndpbmQgc2VyaWVzIEkgc2VudCBlYXJsaWVyIHdpdGggd2hhdCBJIGV4cGVjdCBpcyB0
aGUgZml4IGZvciB0aGlzIG9uIHRoZSBlbmQsIHdvdWxkIHlvdSBiZSBhYmxlIHRvIHZlcmlmeSB0
aGlzPw0KDQpSb3Nz

