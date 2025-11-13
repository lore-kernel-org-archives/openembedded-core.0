Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8596ACD5BCA
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 11:18:17 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21569.1763032692914938258
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 03:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cgNMG/Tr;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cgNMG/Tr;
 spf=pass (domain: arm.com, ip: 52.101.69.66, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TUQklZxpTc1tBmkOaf9w6qWOt4T8ngEkTrU6Klq+QZHEDCBdZ0R7hs+1qY4/7rZdbFrjoiC0wRywT+iBwUGe7si6fzcNGv4uAUArBoUgacfZuMrC/LCk6tnLYz54qVLdbhoChQ9ymNesQRW9veNu3d0MgeIHV1zvD5iOAIvmjHWLdtUMMBvOJvBbj0+93MqH9MINt8rHEry8GVbyHadzlBL48p/um3tMgP1aA2uESZNIF926ydFBM09inWiiug2zAYwWMRanReUB/IaIGcUfzbe7z4VCWIsevo28EeNlyHwUqiQpEpJijojkafm1FGJoYaNOEcJ+hBtT7Q6td4sApw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LV+of+JolbfAnZRfV2V+D9DZUnRC8yTtEtfYRvq7W7Y=;
 b=NAMAGPMHSETTdpiVlvJ5PZ+NUaxr3i4p64cv58fXvp6MJnUkGKMz303nUEN9UAoiNkAjZ5tIefYpE6Omgxa1L2JO3T80UxIcbsGmv9s+TkNVWTQvvR7U8f+C30D8MHAgcmNQRbF4eiN9ZHka5GJ/rG4aDqatkpFtUNTyBp++4BVuTs5/bVdF7lJK1l9TcC0HJcvzWHRyxQP8fo6ynMFQGSa7EsanL1fV+4fGNPCUD2PbSw2HvHLzCY0lSUBn2wBBlNt17Q2fNpbgJbfWOo62dk+F1igQMid4FM2l1Ggn+jN4TRJRvbpLtvzZSvOGP4DzDyApRuVqEEjosX/UrrRUgg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LV+of+JolbfAnZRfV2V+D9DZUnRC8yTtEtfYRvq7W7Y=;
 b=cgNMG/TrYoSbxRpVThBXOcd8BB8YHUYHpijp+CTJ5+AQkBvmte908+Y3t1oEnIqhiEwD6BHkp1X6tZtLHUDBLawmMN1sLLt0FZEvZdGOzBAR+dX1w3AbzqcY3h2Ktyq7OqAbkE9e+umCDOz97nQZToZgo+MfriRE2ITXZ2cGlMs=
Received: from DU2PR04CA0350.eurprd04.prod.outlook.com (2603:10a6:10:2b4::22)
 by AS8PR08MB9313.eurprd08.prod.outlook.com (2603:10a6:20b:5a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 11:18:07 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::94) by DU2PR04CA0350.outlook.office365.com
 (2603:10a6:10:2b4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 11:18:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.13
 via Frontend Transport; Thu, 13 Nov 2025 11:18:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kus9FntRTXmen6M+meHM200L0kqwV/jLXX0YCCWfeC8TT3wQeKPMvy3xeZ4YG/i/Fqg0Ml6oy4CB5Gn2rPXidQBLN/1saBDMdPlt24OS95+r5oAEvAyzezbfbEUIIdSfuI5LyOqll7y2OUzjYdFwh4CD814d1AJ2qizQZDuCduJDBgKAg7aDw9zc6B/TThDb4/MZEfZxLgVYgBWeC3sQda1R0H3fX2S9hYiqO8s4sJG9V3t+T4uZ+OHSibErwvT6qXM7knKqIot9BkdK5ITc5lT9okKJfmgdW8LJs+Ec0tAaLmvOZSgjQhT8nXCV/QWuvihFUcd1eyLprQ8gMtOwKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LV+of+JolbfAnZRfV2V+D9DZUnRC8yTtEtfYRvq7W7Y=;
 b=hfFmlbNh/NJ5z8NeKeu9PHvX+iVvwSoeubhd5qejxeBlW6MpzcZ9x4rJpB8u0mQ6UmfiHc2ER+FBmEAZqrqdMqEbVe9s8q1GWTXmD2bIJjijJ1JeUdHUd8ztKzXTfBhGCNqOf2JQlQWU76J4E7YDH2imv6/428SpvOLgcOrduzfcIEcixL9xIj7l1rt7sijcQIoqEWkwXH2imrzm/umSpwm3+BtRB159CB+lvLxnRzymlGQc5k6veUqxZ/K9JP62LmhbLNrYwfYydty9q/A9E0FAsBd28GLCjmzikWR6GqMvgobyOKrV4oCeXYPnw+8mmPc2PZxsBfDtp0PS5lPnwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LV+of+JolbfAnZRfV2V+D9DZUnRC8yTtEtfYRvq7W7Y=;
 b=cgNMG/TrYoSbxRpVThBXOcd8BB8YHUYHpijp+CTJ5+AQkBvmte908+Y3t1oEnIqhiEwD6BHkp1X6tZtLHUDBLawmMN1sLLt0FZEvZdGOzBAR+dX1w3AbzqcY3h2Ktyq7OqAbkE9e+umCDOz97nQZToZgo+MfriRE2ITXZ2cGlMs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9271.eurprd08.prod.outlook.com (2603:10a6:20b:59c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 11:17:31 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 11:17:31 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "rmxpzlb@gmail.com" <rmxpzlb@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] armv8a: Set -mbranch-protection more
 specifically
Thread-Topic: [OE-core] [PATCH] armv8a: Set -mbranch-protection more
 specifically
Thread-Index: AQHcVHHd2Z2eKlgWzE6EMGDiaL9qFbTwdUSA
Date: Thu, 13 Nov 2025 11:17:31 +0000
Message-ID: <83C84BC6-EE26-4C26-94B8-AFD9CBA980BC@arm.com>
References: <20251113074747.6735-1-rmxpzlb@gmail.com>
In-Reply-To: <20251113074747.6735-1-rmxpzlb@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9271:EE_|DB5PEPF00014B8D:EE_|AS8PR08MB9313:EE_
X-MS-Office365-Filtering-Correlation-Id: e2442b86-cc36-4d1a-1fba-08de22a651e6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?THpzd0R6cDBZUGgwWkJOZWNIMTNvSnlmSWh2NVFwMGRxTTJFVnhxNVVxdHVy?=
 =?utf-8?B?cDNhU1VMMERwSVNGampIdzlCNjJGaGtIZHhoVUt3WXNBcTMvMGNnanZCOElq?=
 =?utf-8?B?c2E0VGhzRDBZbUg4cURnTWhIL3J3aXI0L1ZqWGpkdkpIS3RiSHZWdllrRzhr?=
 =?utf-8?B?LzFQWGNZK1Nmbjd2cGthTzRnYkZ1TmRnZ0NoeERiaUs5ZHZUeTZNay9kN2Zr?=
 =?utf-8?B?VGRKSlBEUmp2MnEvdFppWFlzRTluZDl2MDVPRkVzUVcyR1FITXBXU1dSRmV0?=
 =?utf-8?B?QUZrYTVRYjdlR0F5YzQzZ0J6b0V4cTdIOWdCMlowSitCVTFaeG8xS3oxMlB6?=
 =?utf-8?B?VnlLazVNY1ZMa3Myai9tOFc0YVlJUzF4ZDkyblJEeFpiOGVIbFhBVXZMVnlV?=
 =?utf-8?B?Wjg4L0NheHUxWUhJVG9hY2ZtNStqYmhMZDZmUkR5cWt4WGF5QzM3SXdYNVNp?=
 =?utf-8?B?VnhqMStzVHlzbFZQMUlad1NQczFrcE5lbHB2cUpudjcvTUV4V250MkRwNTlq?=
 =?utf-8?B?QVlBQjZoUXAxSmExWTI5cElsUEZsVmlMN0R3YVNHZjd6aWRvNGxzaVZRdzhv?=
 =?utf-8?B?c28zb0tnSzVINTVDUHRrQ24yYVlpSHJqSnNqQmxuZU5jR24zbnJHeGozWCti?=
 =?utf-8?B?cnlBQXd3cHJsR0xsdVRpL0ZHWE5JYnNYcGM2RGcvNUp2NEJDVDhiQ3A0QjBq?=
 =?utf-8?B?K003L3FWem1IakRPSFhZY1BiZGsycGtWckZtcjBQVDR2OUFFSzdKckFPMEtN?=
 =?utf-8?B?NDFOalMwYk1vaGtXUXd5UjJmMTFocXY0bm5uV3E1Y1g3d08wWUVmT0VpSTVI?=
 =?utf-8?B?OUpKOEQ1U0liLzYwaTdyQVJ0S3BrZ3dnUSszdG50enhzNVVvUmgvSTlvN2ll?=
 =?utf-8?B?T041amZrNHlvYm5ORitJN2ZaT3NxM0tXWnNiak1WaUtIaGpmRkdkc3RjcDky?=
 =?utf-8?B?KzZHalcwYXg1Ry92c0l1MUdWNXR0c0hLdmN4eFpKRUkyRVNPdytIVXpDemty?=
 =?utf-8?B?NEI3SnNzRU0wNUY4VlkwejlNcEFqWnE5MjBoeVNZcG1wTnFOZDFIUmtiYW4z?=
 =?utf-8?B?Nm4wcTZ2bnVFRGlvdTFobWp3RnNGK2pISjAvOFZTYTdxb3pTZXdpQ3JHaWFY?=
 =?utf-8?B?UkdVcEQzRitPQ2xCVVZOd3F6U1FoZTViY0hSYmFBaC9uR3BnSlkwOHZXb2h1?=
 =?utf-8?B?ZmtrajVxS0J3SDlYSlVOYnU4WVFvb245ZmhPTC9PcmwzdmpsUGVqclhLaFZr?=
 =?utf-8?B?eTRCZndVT1Q2bzFTNE9HQTNqZHBPNGRWR1R2TkJidEVMcFRnTytYclFFbWJG?=
 =?utf-8?B?SmF2Zjc5RC9CaTRHS1pkZmliMDBKV0g0YVd6NzNuN1ZZVFoxdTY0NlI1V0xi?=
 =?utf-8?B?OGwrcGs1NjlDeVRxbXR2Y3FxNFVEcDNNd0M5ZzJHUkdhTEJ4TmFLMUR0S0NE?=
 =?utf-8?B?WnFCUDZ6blpxMTFQK0I4Vi9BUXNkaEcvTDJuVGV5WTVQN1hEcVExRG8yazZJ?=
 =?utf-8?B?TlBXbEdPcnk0dWZKK1lsdkVoUmU0cUJuenFIeVNpc2VsRHQ3Q2x5RVBJMTgy?=
 =?utf-8?B?dmlTYlppa0xDWFE5bG5veW1ndGJsdnJYSGVYbHhsNlRZYys5Y09NaDk3N1Rj?=
 =?utf-8?B?MGNTelhCZlgrMks1V29lemEyc25RUHlpMXhXNjB1MzU1YmJTSzd0ZkhGYm9S?=
 =?utf-8?B?T00veGdnc1dFMkJEa0RQdkN3Mmx1RnRkVGFwRCtkMlpFU01vUUdpdXJ3Mlh0?=
 =?utf-8?B?OUVTVXgzeWNUTFJkak8ycmc3QXQ2MUc4R3lPczNyb1hIUS9mOU90QXlLak5B?=
 =?utf-8?B?eW9jalE3STlNK29ZYjZvVnAzOEMreHkwVlUwNmtkWVBWZFVCeENOOU1MbUxo?=
 =?utf-8?B?UEtubFZEUE8rVGFTektmaXIwQlZXUFJuTXVXZzE3WVZrK3YwR2NwVTU2ZTZ3?=
 =?utf-8?B?SkVXOVZOSHIyYlIreWE2L28wUWcrZGxaSExVcGhTdkVNclFmL29kaElGSW40?=
 =?utf-8?B?MlNHVTVzS09WaThWT3lCQ0JGVXdaNmxvSHhNdGpkNHFzb240WjBJbkhXUFh6?=
 =?utf-8?Q?9yVEEI?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0AAA62757078E54792AF5737ADFE353B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9271
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	47a81a04-4573-4ea4-4f11-08de22a63cdf
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|82310400026|36860700013|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T2swT1dUclY2NThKMkhWN3ZkTGpiQktPbkdEODRlN0F0U2YxblpNNlRRK2Jp?=
 =?utf-8?B?ek1DSk9XY2s2MXpDbGYzUmNYQVdvRGJkYk12RjhQMDdlKzJobXdVU0ZtekxU?=
 =?utf-8?B?NWRFazcvTWNWVms1djRCZVd5Z3lQL1IxZ3REa0tuS2lZM3dVanZEUUpxelpH?=
 =?utf-8?B?dldMdmtMOEMzdGNzNkpoZTMzNXdzL3pCVTVpSmVjOXBGWDVqYTZHWVpuc1E0?=
 =?utf-8?B?YVJpWEtHOWZ5MVBnNjJzd3EvMWhHSSs2VHYrY3dWOVFpNHA4RUcreUR2ajgv?=
 =?utf-8?B?UjFMVlFjODVCOXRyZjRoRmtCdFNWZzRva3FPZWRBZ1JncWhKREpYYlYyOG1w?=
 =?utf-8?B?Z0lmNDZrbXJCdWNuQ3RHVTFtSGd1WG5TNFZOdSticFZjQlB3MW54WG9SVnlJ?=
 =?utf-8?B?ZzFmODdKZkhTS0lhRXAvRFN1WUpTTWtGMzVlY2tSUlZvMWY2RWhHNmlWYjFU?=
 =?utf-8?B?VnphWUtadTY0NDBuM2J4UTFJc3ltK3ZIUVRnNXg4MFB4aVEwZisxL1lINjFQ?=
 =?utf-8?B?TlhKQ2prTng4dVRiSHh3WWpjaHlwRit1VkRaN0lVSS9LcGMzWm5KeVhSNkV2?=
 =?utf-8?B?WTVyeGQraW5jaStjeWFQb0M4dThmMTFMZ0kyNytlTUJZL3VUTVdtUWh0Zllj?=
 =?utf-8?B?M3lNZEFqcnNWNm05SDlyM3NwVzVkc1pXYXRCM3VxOXBNWm9yLzE3cERsdGhT?=
 =?utf-8?B?Y1dGSzN5ZFdtZ2dTTzVmUDN6SE5JY2pndU1NZFhuc3BtTXh5ZlpDN1l0bUVq?=
 =?utf-8?B?V28raDc4aEtGNmNRRDdSS2tSZzkzTElIY1krRGd5NmhLYkVuVSsvbmhQSHNR?=
 =?utf-8?B?cmwwYUw2QlovNlVnTVhocy8zRnZNWXhBWmtMRU42ZzNUUnNHb3F5VEhQNUo4?=
 =?utf-8?B?VDFqU2lsNFB1Ti9pN2VhUHc0UFB4bENKbTdBKzJtVURjTjR1Mm1RUERtUkFk?=
 =?utf-8?B?SUpHbXo3TTJjWGM4bkZsS1kyd0R1ZXJQZDNSc1FXbkVQc09zV3NxTk9OQkJK?=
 =?utf-8?B?OVQ2dVc3aUtrcTk5QXA1MDZNOGRYYTRGeVNqMkg1Zi82TzF4RUpCWUVNVDJy?=
 =?utf-8?B?NGcwSURoUmE0cUc2aGVVcTlSTXZvaFR4ZEZaTTMxUGQ5ZVdNSzZtM3hyaS94?=
 =?utf-8?B?WVR1TmY3ZGYyTXFJSDZWeXROSE1USmFja2dMNDRicUplZnhRVGg5QTVtZkVu?=
 =?utf-8?B?T2NpMzRiYUlrVm5VaWh4R01kS01JbXdxVEZJQkpzQ0lTbWRvZTE0eitCR0Uv?=
 =?utf-8?B?bmdLeGFQUUNiZmtYeDFPaUpjUytybG53a1N0YzhYeGw5SVRxWlpxYm53NmpU?=
 =?utf-8?B?aVpOWFh3NFNiN2ovSGYxMDhTU1R3TFpyR0QraFFRNjk4d2RiTXludGt4SklM?=
 =?utf-8?B?UHFISmthVWhucVJkOVJuR3QxUzcvZUdqeXRQMmFMNXVIN0taVi9GQndwYXlj?=
 =?utf-8?B?b0hsUEdCOUVjVHlLVGtzS01LM0gvM0xjeE9ZcXVOOW4rdjF4ZGJyTG1SZFlB?=
 =?utf-8?B?R0cvc2NOZWE4aGh5VWwvblhSLzlsaGVBR2NQVi9iR3VkcnBqWHJ1bjk3TTlW?=
 =?utf-8?B?MnlYdzNuM2dEOEZxYnBuNjdqMVlqeGRCOEJzbVdPYVZHaTczWDJHMFEzSC9t?=
 =?utf-8?B?S1UrK2xtYVR0UUtRWkRaZHVleE9PRGZIc08zbWtyNHJRSG45Q3ptZDZXKzRW?=
 =?utf-8?B?WXJFUFh0SlZiUXR4czZZSWlITUZoVWlaaWJTcDVGVDV3eVE0SGptYnZFNnds?=
 =?utf-8?B?QXdyR2plNWRmMGNFTURmRGRYS0xzMEdkU0tWbm1URm5pZUhIdFp4ZHJ1NmF4?=
 =?utf-8?B?UERWQVhwQTFZd01uNjVMSUdzbzJBUVNuak9FNW52UUdjV3VydEU5dWVvRktj?=
 =?utf-8?B?dUZWVnZRcG5nWnF5VVdEdXdjUFBYQy9IV2xKbjR0T0p0WUNJTE9YSU5jUzBk?=
 =?utf-8?B?WWlVSFRGQU5FcUsyd1kxU0Z2d3hsWWJvUGNDSVJrYUJsdUdMSHM3MUowcmxD?=
 =?utf-8?B?d1BTNDF4NWxBVkhRQjE4ZFRKUHJ5SEVrZFhDMmNaMXMwNGt1MHFVcGtOajIr?=
 =?utf-8?B?OVE2Vi9DbUxSbkZOc1pScUhWV1p2RUFmT1FhWGIwTkFHKzM1SWRlQXJXYTJz?=
 =?utf-8?Q?PmY4=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(82310400026)(36860700013)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 11:18:06.6646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2442b86-cc36-4d1a-1fba-08de22a651e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9313
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 11:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226236

T24gMTMgTm92IDIwMjUsIGF0IDA3OjQ3LCBGcmFuayBaaGFuZyB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cm14cHpsYj1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IA0KPiBHQ0MtMTUgZW5hYmxlIGdjcyBpbiBzdGFuZGFyZCBicmFuY2ggcHJvdGVjdGlvbiwg
d2hpY2ggaXMgc3VwcG9ydCBieSBhcm12OS4NCj4gT3BlbnNzbCBkb24ndCBzdXBwb3J0IHRoaXMg
ZmVhdHVyZSBpbiBhc3NlbWJsZSBjb2RlLCBjYXVzZWQgbGQgd2FybmluZy4NCj4gTW9lb3Zlciwg
b3RoZXIgcmVjaXBlcyB3aWxsIGZhaWwgd2hlbiBsaW5rIHdpdGggb3BlbnNzbC4NCj4gVGhpcyBw
YXRjaCBzZXQgYXJtdjhhIGJyYW5jaCBwcm90ZWN0aW9uIGJhc2VkIG9uIGV4dGVuc2lvbiB2ZXJz
aW9uLg0KDQpXaGF0IG90aGVyIHJlY2lwZXM/IFdl4oCZdmUgYWxyZWFkeSBmaXhlZCB0aGlzIGlu
IHN5c3RlbWQgKG9lLWNvcmUgMjk1ZTMwKSBzbyBJ4oCZbSBjdXJpb3VzIHdoYXQgZWxzZSBicmVh
a3MsIGFzIGl04oCZcyBub3RoaW5nIG9uIHRoZSBBQi4NCg0KSSBkb27igJl0IHRoaW5rIHdlIHNo
b3VsZCBiZSBxdWl0ZSBzbyBwYXJ0aWN1bGFyIGFib3V0IGJyZWFraW5nIGRvd24gdGhlIElTQSB2
ZXJzaW9uLCBpZiB3ZSBkbyB0aGlzIHRoZW4gSSB0aGluayBzaW1wbHkgZ2F0aW5nIGl0IG9uIHY4
IHZzIHY5IGlzIGdvaW5nIHRvIGJlIGp1c3QgYXMgZWZmZWN0aXZlIHdpdGggYSBsb3QgbGVzcyBs
b2dpYy4NCg0KUm9zcw==

