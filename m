Return-Path: <Oliver.Rohe@wago.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FF3C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:51:50 +0000 (UTC)
Received: from mx08-005c9601.pphosted.com (mx08-005c9601.pphosted.com [205.220.185.5])
 by mx.groups.io with SMTP id smtpd.web10.16179.1747731101072050137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 01:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wago.com header.s=p012021 header.b=fxvD/hNt;
 spf=pass (domain: wago.com, ip: 205.220.185.5, mailfrom: prvs=1235086a97=oliver.rohe@wago.com)
Received: from pps.filterd (m0237837.ppops.net [127.0.0.1])
	by mx08-005c9601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JLcDnj015778;
	Tue, 20 May 2025 10:51:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wago.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p012021; bh=uW
	X7gCp2qXTQGx88/jyYts3Mdbu2EP5SgECYtcigIv0=; b=fxvD/hNtyAIqENVoQK
	lp+tfMixmF4ApA6uGxep5tjYsNqfW6lHTHVWIBi6gFBzKQul1LEAcH2JKDJD/gda
	RBTWYDRyuT9hveq7krlcLHAhlozMpBb9hts1BlMhWT2Roo3D+dRSjf7+55o40M/o
	lx8aDDRqf9WCrpt5UwGK90+mwhPF+PehU/Xs1PiULmvXCDE/aeXIhLK/KmSdJaoM
	ybexq7Zzu5oum2apxEEJ9mVexDDGXffOQ5k+KMebphRjzhsOVMZNLj3T9xocUZye
	4sd51omspvDr8a1jRg1kWFpWJcKYuEhWfN5OjPiXalFuUyr5S0gcPGOIZoCsLLzx
	xu6A==
Received: from eur05-vi1-obe.outbound.protection.outlook.com (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
	by mx08-005c9601.pphosted.com (PPS) with ESMTPS id 46pf37jqug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 10:51:38 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=djEdHiX4iEF2AUNIooItYRAVnLTt5rB/Sj7dMOfHvIhttCfElgpq0b60V92aH4sxPozmMdnx6plkyCWmLTwmwIAhsmcuvUI8y05lnAOEeAe7KZwRmdd1OE3YABKXV3QrFoGfMfbzN6qCriX/Im6sr8uA2yeQGO6ZXQLBIHu+uK96Ui5GsTLvY0yNyEHgMEoS6aR3WILwZyr/LDoxJlVik61pojmtBzwcDvTFOCfbQoCzt8zrIGnPzrGZURSuznLh7e05Rezs/a9VH59xInPsmECsJ4fDBTUD/lgGDtzR8b80hYxJTm6VwHBkdqQKzS3OdbBSqJIFVj8OGG2cbdeS/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWX7gCp2qXTQGx88/jyYts3Mdbu2EP5SgECYtcigIv0=;
 b=ToEYjCMxiIoPgsdyOmuJg779YSs5HC1cKyXfbd7QDCTuvfzgrtAmyk1fzGDhFVqE4wnc6JhoyWn3PbGv4Yyy9aHTFHq+hpMSXd/+O/X2/pIyvmgcUAATX8ZbP1x1p/atajsM6X7njwSq83Hj4bGpPLQAHtBvDgmYuNEVnY3CyxLb/T68mBpPFwH6Zbf0kJB9DQah0eyZAHHb/DBLdewgXF10eyHJFw433YgN5EMvL3fKmNBUazvjfmOlzCXi1EJdlSBtKZMaXeEjlY7dKHKT91gec8XP7GMmUoQRxhAZsBRU0jVn+c7oEddrww4iGKBlVLhHfWtcKHlRgTx8hbuKzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wago.com; dmarc=pass action=none header.from=wago.com;
 dkim=pass header.d=wago.com; arc=none
Received: from DB4PR08MB8102.eurprd08.prod.outlook.com (2603:10a6:10:386::8)
 by PA6PR08MB10624.eurprd08.prod.outlook.com (2603:10a6:102:3d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 08:51:34 +0000
Received: from DB4PR08MB8102.eurprd08.prod.outlook.com
 ([fe80::93b6:7bd:c4e5:7e99]) by DB4PR08MB8102.eurprd08.prod.outlook.com
 ([fe80::93b6:7bd:c4e5:7e99%4]) with mapi id 15.20.8722.027; Tue, 20 May 2025
 08:51:34 +0000
From: Oliver ROHE <Oliver.Rohe@wago.com>
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] kernel-fitImage: allow overwrite the
 configuration dtb label
Thread-Topic: [OE-core] [PATCH] kernel-fitImage: allow overwrite the
 configuration dtb label
Thread-Index: AQHbxlwJ3kd3lvqCT0yrzOhlqhd1qrPaM8CAgAEHCDE=
Date: Tue, 20 May 2025 08:51:34 +0000
Message-ID: 
 <DB4PR08MB81021F9904E04AC45A79E58C9E9FA@DB4PR08MB8102.eurprd08.prod.outlook.com>
References: 
 <DB4PR08MB8102C882795C5B8725105A0F9E93A@DB4PR08MB8102.eurprd08.prod.outlook.com>
 <f5080c649ce5d0f214dfdbb69a25449923b2948b.camel@siemens.com>
In-Reply-To: <f5080c649ce5d0f214dfdbb69a25449923b2948b.camel@siemens.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_Enabled=True;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_SiteId=e211c965-dd84-4c9f-bc3f-4215552a0857;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_SetDate=2025-05-20T08:51:33.679Z;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_Name=Internal;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_ContentBits=0;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR08MB8102:EE_|PA6PR08MB10624:EE_
x-ms-office365-filtering-correlation-id: b8b42ac6-8c1e-4a44-132d-08dd977b860d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|38070700018|13003099007;
x-microsoft-antispam-message-info: 
 =?utf-7?B?dGFmODZzVTdrRTlsb3FMZCstN25wZXJ2U2NDWU5URGJ2UkpITjVlbW9OTVk0?=
 =?utf-7?B?bmZ3N0VCQ3ZIbjg0L09hZE1tQjIxUHNMSFUycERLQU5GUW5OVzJCWThhOEFB?=
 =?utf-7?B?dVk1by9iUVVJNlhLRVpOVzVmNzZSMGV6L3NPenl2Mll6djJWb0xmNzFJNjky?=
 =?utf-7?B?S2c3RURSMm5SUHFmZVh4cTVQQ3VXUXJqaHFzcm1vTHhPRkcvTjF5Z09KS0Zk?=
 =?utf-7?B?emJwMXdDeG5IbTVzaWU0NVUxRXZmZmQ4ZlhQbkRLYnV4R2FKUHFTN0RsQ2N5?=
 =?utf-7?B?cGRpTk1HWUJ6bHFZRG1GcGs0Q2F4eEVEWHBWNmRXcUNwVVl1RGhOQmszb3kv?=
 =?utf-7?B?b3FGaU1oYXc0RURBUTVlemxiRFNNWUNudmE0Q3JpVFZsQUpiVXVGVm1nQTEy?=
 =?utf-7?B?bDlPUFJCNlNYTlhhaXpJWnVYeVhmKy02T2I4RnhuWlMwM2ZKUTJFYlBkKy1P?=
 =?utf-7?B?SDIxV2FvNTQ2VzVqa29ST2RDZDQyQXJ5aFJGYkZxTGhKRXY2Z2JEL1JsR0lh?=
 =?utf-7?B?endIMk9EZnN2Q0pKdklJZ05CcVNuU3pvM3BNaDBuQk93OW1pMDJqRkVDRURj?=
 =?utf-7?B?emY3TCstcnBRUjFZVlI2alQ0QistY3JiOUhNVnVsMHI2Qm1uWng1Q2QzTU9U?=
 =?utf-7?B?N00wTW1zZHZXTFFzYUhCdmtWVXhyT252YUxNaWpTcUNTUU8yVmJNSmtueHdp?=
 =?utf-7?B?REc5U3c2WjErLXVHTUJkYU03SGZYbHJtdEdqdkJnZGt2MjBpL2oza0J5R3Yz?=
 =?utf-7?B?MmRVTWVPd21YbUJKTGVtYkkxemhSV1NndmF2aFRramVaN21FNmdjZXNVUFV2?=
 =?utf-7?B?RHphSUh6Ky1NRlAzcDhKdFNlUkR2enlPTEs1Mm1SYVZqQTlGQkxxM2VDcDhV?=
 =?utf-7?B?UG1tdUhoNWY1bWlJTTBZVzNSbnNBa3ZRd0R1bTlaYUlLTGtnbWh6YlZmck8=?=
 =?utf-7?B?Ky1ISGVuOFZPZVZwSHkrLWxhaWM3OVFkdUhGQzBtZ0pNOEJiZ2JRQzNZeTJw?=
 =?utf-7?B?NC9iUWQwcFpSazdpeUZLWlErLXNYYUFGcWZieXBzWmhqS3JPN1A2WkFMZm1I?=
 =?utf-7?B?ZE04R1V0Ky1wYUpLNXAyN3pabkh0Nk5zREFuZlpVVmVqSlBnbktLWFI0MzNr?=
 =?utf-7?B?WXhzVGlLVDF1eHhaaGJlc0gwWWh6NUZrNEhnc1E5S2g4UGZ3WnVCbTdVYnNQ?=
 =?utf-7?B?a0tsczQ3WmNrMmpvVndlYk9NUElsV0VvZystZEg0bTlUUm1Eck1EWHJqUzVK?=
 =?utf-7?B?OUFsVjJKTHUvMzRpSm0yRistbnBybk54ZS9CaCstZ0gzR2ZDcFRWRzNOaGZR?=
 =?utf-7?B?MU9TZkluMmUrLWJJYXBRRzVvSTJ5L2Z0UUk3b2g5RUFwQkVuaThsSWFMdlMw?=
 =?utf-7?B?SDVxc0V5SjgwVWlIbmRFMXgxVXZiTTJwS3IrLVpqa1JVLzFGVndvOGNYSGJM?=
 =?utf-7?B?a0FzZE1OQWdRRjJXdVFrZGtqQy9sKy1zeU1yc1F0NlBXUWxJNFhObVBPaFM1?=
 =?utf-7?B?MmY0UG9xd3R0WkQxaGh5MDB1eWdVS2dNblFJdlJVMVFVZ010SVV5a3FaOUFt?=
 =?utf-7?B?RnkyVXNQTXdjdkQvbFRKUFpYd2ZObXJQcERmWmJGdXdUTkRnV1JPbmsvUXp3?=
 =?utf-7?B?SWpSZ1VabGYzcEdDYUp5eFY0WUNlM21XWDdwRHAvWjI3Vm53cW0yN2hsUU1T?=
 =?utf-7?B?TlRxcGlFSjZRZmRjcjZtLystS1BaYUx3NTdzVkZEMlE0TElERkpvd1NPVEFl?=
 =?utf-7?B?RVNjRVE1R2dtUlFFRVMrLUZYclcxeVR6SUkzSGFUaTArLXljUFd5dlltVnNh?=
 =?utf-7?B?dVdNT3RrTjIrLWtWYVNYTFkybGFzY0RaQVFab3E1RnQxSjlldWRJTnFRQXI=?=
 =?utf-7?B?VistNUFRbFlzZkp2OGFOS1hvUWhlaFdBRFVHLystZDh6UCstcnNWQzVzdDhn?=
 =?utf-7?B?ZDFMKy10aDdUc1ZHSS8yekVrdUtjL3FCZXpNbmR4SGc4cDR6WXcrQUQwLQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB8102.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-7?B?bm4zTTVieDRrOHEvbElNempCS0xjL3BlcE1qcE5HL0JYSmZ4TFlaTVdGdjJy?=
 =?utf-7?B?M3pLY0IrLU01ODkvZHN3UWQycGwxdGZIbDg4TWw3WUZuVFVKWlBVcXhWSkRW?=
 =?utf-7?B?cGhJWDBERms2Nm1ZQS9WdzdFVE11MFRVbXg1ZFEwY1BwQXdQWDNNelFjT2dL?=
 =?utf-7?B?NzR3RlkzOXBkRHZCcmEyaTE4TTJUMUV5SjRmMUpvVEpFVUlxVHlYbnhWcWxz?=
 =?utf-7?B?Z2V1aDNKYnpuaFpaWlRKWk1Rek1PaGdEWWQwMnZlTkh4OUIxOVZHbDlkZE4y?=
 =?utf-7?B?cXhpWHVpR0VYc0szL1hJRjdxbWkzUUk0WmpiOUF1SzZEajhVSVBVRW1yUmJy?=
 =?utf-7?B?ekYwTEtSL3I3UzVMOUdTVlZuV3cvM01SRWxvSDJrWWZEVGJadDVnQ0pHVXUw?=
 =?utf-7?B?SUVjT0RCNGZ0UGFmVTBLcjVzYk0rLWNGbGFUWGhEOHcveHBqbDkwdVh4RVdT?=
 =?utf-7?B?aW0wMUs2aGpNNlhQRVhsMXBBMklqdVdpL3RYOUgrLWs2cWFDWGJvTWxIUGZm?=
 =?utf-7?B?SystMS9YOFVzMDBoelVNN0Fpczg3YnZFTFNlUC9CM1FxdG9aUnhkSVRZUWp4?=
 =?utf-7?B?ZHhjQWdYSnZUL0FubDRlaFEwVXZCOEpiNjNSbllxTUVYUkcvTnpmakhHdEdq?=
 =?utf-7?B?RUdZbk9ldmd5ODYyVEZGVWJOM1p6bkxkUHBZdEM0eDJxeENDeDAySm9PcUMw?=
 =?utf-7?B?Ky05MG5pYkNRN014eHNFc1VpQ3RBWSstWVkvQmNUc2JzZWlpU21CcHZvZHJp?=
 =?utf-7?B?U0NmSnQ5MEVqTlVWM241UXRyUkVDbUE1cU5OVTEvbEVtamtvZ2czRmNYMy9Z?=
 =?utf-7?B?TGdCdDQ3MkNFUGxtNXl6MFhzZ294dGxHTTd2d2dvNFRLNUFxQ0RGYlByZE85?=
 =?utf-7?B?NzBIakxSdkZWNzZubnF6SWg0UjNBT2ZFNGJKUGx3UCstQVlCc2psOXB5TXNQ?=
 =?utf-7?B?YkpnR0tJWHhtbGJTb1pBY0FGcXZYQUczQkhndkJCQ2phNmZuZFA4UG1jTy9j?=
 =?utf-7?B?bDFneE1MRVFvM3dTbTd4bGdZcDJBVmxLdmdvZDBsWG9veVkvQ2FVZzBtVWJp?=
 =?utf-7?B?SkRHVTZ5TS9NWG01LzBNS2QvbXNtZlRzTlJ0Z1IyZVcrLU9wZ2tQUkdiSDZn?=
 =?utf-7?B?VlJIY0dwWGE3cmwxeFBPcjJncmI5enlDZzZZTVc0aVFJNHNpVHNxMUZ2Yjl5?=
 =?utf-7?B?bFh3cUNZbmY5SVVqY3J4VFBZM3VXNmJXWTAzeVJqdHlBSmtiQmh4Z1Y4NTZU?=
 =?utf-7?B?YVo4S1hROUJiNVBMcXM1bGhYY2tIWC9mRi9RU0twdzhLbi8rLVJnaTY0Ky1x?=
 =?utf-7?B?QmNsZmZzU1BHMTJMSHRLb3N1dEFTY0FXTkdXbUkvemI0d0k1Rll4OVZFS3Rr?=
 =?utf-7?B?UnRKN2dUaWxxcVErLXhkQ2pDS2MrLXl6RU9FQU9FVldheExHOVQ5ZkxMdTdh?=
 =?utf-7?B?MmlrNHpsRU9KM0RIQjhMZTdHaENVZjVxZUwvdDJ4ZG5iZm0yRWxlMkNDbWVF?=
 =?utf-7?B?bEZ4RmExQk5LREZhNzAxT3l3Y2hWZDk1UExJUFJQb2w5ZkdFKy1iRGFWMGh0?=
 =?utf-7?B?c3pucnM3V2U5SmpXKy11dWdldTJ4MVN6VWVGc2tBYlVoYWFBSkkrLXBhZTlC?=
 =?utf-7?B?ZFU4NHRyRFo5bGhmQmFtN0NBcmV4MW1ueWNUSWZQRDFYM1BhQkQvUHg1VFdT?=
 =?utf-7?B?enVnbDBVcystZFhQL2gwYTExcm1xd1pNRkNLNEFsVFZzOUpwblh5RFNaM1E0?=
 =?utf-7?B?ZVlwTVAvNkQxL3ZqeVNRVFlvVzdhbXNwUi92RFl3NHh0NkFZS0FrZ3ZBTklP?=
 =?utf-7?B?NFhSRlR2MDcvOFlldG9WQmQwcS9Ld0dvVExyUDdWMlNPV0oyTnRHTHBFTVpM?=
 =?utf-7?B?aEtzVFE0UVpyRi96TDNGSU52NEp3YVowUkNiZzNPckVZUVNOd1BkbjNXMWUy?=
 =?utf-7?B?TGxjRU5SSGhEUlVSYTFIQUlPNm4xUlE3SWJ0Q2tpTGQ4RWVoM0k1TWdtOXlx?=
 =?utf-7?B?VHdsY0k3UFBoRVBRRHpCVTByVHlkc0Y4NXdhb1Q3aUxWVEF4QmFKRFNYNUNE?=
 =?utf-7?B?clRUMHZtSy96RGQ0OFA3NS9aY3R5VlQ1dnRpMjdiZkU2bVpOZ2pPQ1ZGb2cx?=
 =?utf-7?B?a0lqQmQ4WGduUGdyam5NSSstNUVZK0FEMC0=?=
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	za1oTfnFRdKPcqUcIo7wSaXK5esRpAXq4jepvENw4LcXdYfF/++xgSd4wKYPBRUXZwTXpzi09UfqMNLCEaNtYp48S5mfPERIWRRkMlMEpjT2lU2dWxT/rZF4G7gSR19qbFBSChedxAqexCm1Dp8IzCmHjYKLkB60kttbmiQyXern8UavaUvReXo+8NmqaEfmIEvvOhDjZ/xC+mPAxYLj9qYElGCvIUI0QQXkO6J9IuLpTdN07byifjGvuJa/c89M4IyJyKlGH14lIfZOh1e7hGS5F1Ch7c2zgF1TriFUQiLHldzo7DNgG7uLh1UTAEZwtHd7Fm4KA3IEgjYqFYiPpzfX62RBlk+yJkTPHK3zF5PjNM8hX7e72Plrn6GW4a7WgGINNYFM1VTHka1boRYRNwtgnkTRjemoOcTucUM8eW8Q0HgSqDoCIFVzM5Kmk1rQkAmzekIp+VtKpt06Q1tv+BdvhC7gpxehhX8Xks/g/4w4soPoJxNkYoeq5Y46Rgf7thdPZyfVvzYCsFQo07KDROPIhuj9esjRWpFw2Odjzbc8QUPLOAY/xxivLJdNK5BAKZ/bjbZ5MkqeDBOfmdA2r2FlWYA9Zo/cOMJQ9hr1Pl7XD4Jc+sH92FvziFZd8dp0
X-OriginatorOrg: wago.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB8102.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b42ac6-8c1e-4a44-132d-08dd977b860d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 08:51:34.1597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e211c965-dd84-4c9f-bc3f-4215552a0857
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nQjUMgQ6IpLDUFAt2HTw1Y4TsFMUM7ywnCstKZgbC5MGPHoEt4kOUC/8Ry1365WG6Zrb4iAoxaAmqmeAigz0Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10624
X-Proofpoint-GUID: CeFnCIPhNJoSToJ7jwH42z1kt8skE8IE
X-Authority-Analysis: v=2.4 cv=PM4P+eqC c=1 sm=1 tr=0 ts=682c429a cx=c_pps a=9TK2mEVt+YNFxHG6VsEebQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=wzW8d0FwaosA:10
 a=TjCsNTqe5bEA:10 a=dt9VzEwgFbYA:10 a=uherdBYGAAAA:8 a=Q4-j1AaZAAAA:8 a=a_U1oVfrAAAA:8 a=ThMX_IV2AAAA:8 a=2nnM2dgGAAAA:8 a=MFFWu9hoAAAA:8 a=F7-tcKQWpIAC6dpmJs8A:9 a=avxi3fN6y70A:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=0jcnvs3wCqEDeep41k2a:22
 a=i-hxQrRGloBzdKMNCQNT:22 a=SV2Tz2c5VQls2wiQynLY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA3MSBTYWx0ZWRfX8DyqW/3rn35J 2brEp3XQqV0Ip4rS+qvB7n2sbs1rtyfOoJm/JIqrSqC4m4ycYOS0N6SFCtBanSiEPOagvSz2EPq 5T6f3m7QUhwn3IHFemXiz7EvGGsr6a7OVl2VeIi04/RNPYhm6/Lo13Kb9E2aHR6qAGHaAZhe4Rm
 bme/2Ol57vcl0aEkf8M4FPsVhpGvqH4vKSuBDOEMrDSzwqG9yDbQ1U1Tw0+CmHpGNMIyLNcuub7 gfRg58HBfw0/JvRjBlOrZc8W0279rtQekNmgzKyuhaGnYn6qo+ybZ1EFJcfYzUA4yDTzqWIp6va 87822M42Kv6fqJogmRaz1e7bMMzwomun4EjH1CF3WUJuLq37hs2Bgw9O4rWrHI6JWC7+xami4PI
 WibbxdPJsBzm5iKhcJbippe9HTRQZin4XnZ3aRxmRGjRRQh3/Cyu9iKsoEBB6E4/obQ1IblP
X-Proofpoint-ORIG-GUID: CeFnCIPhNJoSToJ7jwH42z1kt8skE8IE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505200071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 08:51:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216892

Hi Adrian,

+AD4- There is also a patch-set pending which does a complete rewrite of th=
is
+AD4- code in Python:
+AD4- https://urldefense.com/v3/+AF8AXw-https://lists.openembedded.org/g/
+AD4- openembedded-core/message/216836+AF8AXwA7ACEAIQ-B6Ltl4Q+ACE-
+AD4- sx1j+AF8-QU1O83+AF8-wMeOlorBivh3C9HD06dwOTkdj+AF8-Mvw5g0JkiLC3BEVzuC8=
rMFPlyIDdqYv5r1ln2lPqCb7AhxUktc8So-+ACQ- +ADw-https://urldefense.com/v3/+AF=
8AXw-https://lists.openembedded.org/g/openembedded-core/message/216836+AF8A=
XwA7ACEAIQ-B6Ltl4Q+ACE-sx1j+AF8-QU1O83+AF8-wMeOlorBivh3C9HD06dwOTkdj+AF8-Mv=
w5g0JkiLC3BEVzuC8rMFPlyIDdqYv5r1ln2lPqCb7AhxUktc8So-+ACQAPg-. I
+AD4- guess your change will potentially be simpler if it will would done i=
n
+AD4- Python later on. What do you think?

Cool, looks very promising. Especially that the fitimage now builds from th=
e image recipe.
I will check and try it out once I have a spare minute.

+AD4- With the current implementation of the kernel-fitimage.bbclass many
+AD4- details are hard-coded to +ACI-one configuration node gets generated =
per
+AD4- dtb+ACI-. Are you sure that we can change the labels without breaking=
 other
+AD4- things here? What's your exact use case for this?

My patch does not change the default behavior and keeps the dtb name as lab=
el for each entry.
It just allows to provide a custom key if you want to. From my understandin=
g,
the reason for using formats like fitimage/blspec/extlinux is, so that you =
don+IBk-t need to know
what kernel/dtb/initramfs combination you want to load, especially if you s=
upport multiple variants.
We are using a unique device id written into rom to know what combination t=
o boot from the bootloader.


Internal
+AF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF=
8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8-
From: Freihofer, Adrian +ADw-adrian.freihofer+AEA-siemens.com+AD4-
Sent: Monday, May 19, 2025 7:05 PM
To: Oliver ROHE+ADs- openembedded-core+AEA-lists.openembedded.org
Subject: Re: +AFs-OE-core+AF0- +AFs-PATCH+AF0- kernel-fitImage: allow overw=
rite the configuration dtb label

Hi Oliver On Fri, 2025-05-16 at 12:+IAo-32 +-0000, Oliver ROHE via lists.+I=
Ao-openembedded.+IAo-org wrote: +AD4- This allows to provide a custom label=
 for each dtb +AD4- without having to overwrite the whole function. There i=
s also a patch-set pending which does
ZjQcmQRYFpfptBannerStart
This Message Is From an External Sender
Please use caution when clicking on links or opening attachments+ACE-

ZjQcmQRYFpfptBannerEnd

Hi Oliver

On Fri, 2025-05-16 at 12:32 +-0000, Oliver ROHE via
lists.openembedded.org wrote:
+AD4- This allows to provide a custom label for each dtb
+AD4- without having to overwrite the whole function.

There is also a patch-set pending which does a complete rewrite of this
code in Python:
https://urldefense.com/v3/+AF8AXw-https://lists.openembedded.org/g/openembe=
dded-core/message/216836+AF8AXwA7ACEAIQ-B6Ltl4Q+ACE-sx1j+AF8-QU1O83+AF8-wMe=
OlorBivh3C9HD06dwOTkdj+AF8-Mvw5g0JkiLC3BEVzuC8rMFPlyIDdqYv5r1ln2lPqCb7AhxUk=
tc8So-+ACQ-. I
guess your change will potentially be simpler if it will would done in
Python later on. What do you think?

With the current implementation of the kernel-fitimage.bbclass many
details are hard-coded to +ACI-one configuration node gets generated per
dtb+ACI-. Are you sure that we can change the labels without breaking other
things here? What's your exact use case for this?

+AD4-
+AD4- Signed-off-by: Oliver Rohe +ADw-oliver.rohe+AEA-wago.com+AD4-
+AD4- ---
+AD4-  meta/classes-recipe/kernel-fitimage.bbclass +AHw- 26 +-+-+-+-+-+-+-+=
-+-+-+-+-+-+------
+AD4- --
+AD4-  1 file changed, 18 insertions(+-), 8 deletions(-)
+AD4-
+AD4- diff --git a/meta/classes-recipe/kernel-fitimage.bbclass
+AD4- b/meta/classes-recipe/kernel-fitimage.bbclass
+AD4- index 07786647e1..f770d65087 100644
+AD4- --- a/meta/classes-recipe/kernel-fitimage.bbclass
+AD4- +-+-+- b/meta/classes-recipe/kernel-fitimage.bbclass
+AD4- +AEAAQA- -344,6 +-344,15 +AEAAQA- symlink+AF8-points+AF8-below() +AHs=
-
+AD4-         echo +ACIAJA-realpath+ACI-
+AD4-  +AH0-
+AD4-
+AD4- +-+ACM-
+AD4- +-+ACM- Simple function to allow overwriting the configuration node l=
abel
+AD4- +-+ACM-
+AD4- +-+ACM- +ACQ-1 ... DTB image name
+AD4- +-fitimage+AF8-emit+AF8-section+AF8-config+AF8-dtb+AF8-label() +AHs-
+AD4- +-       dtb+AF8-img+AD0AIgAk-1+ACI-
+AD4- +-       echo +ACIAJAB7-FIT+AF8-CONF+AF8-PREFIX+AH0AJAB7-dtb+AF8-img+=
AH0AIg-
+AD4- +-+AH0-
The convention here is that functions starting with
fitimage+AF8-emit+AF8-section+AF8-... emits a section. However, this functi=
on is
just concatenating 2 variables.

Thank you for the patch
Adrian

+AD4- +-
+AD4-  +ACM-
+AD4-  +ACM- Emit the fitImage ITS configuration section
+AD4-  +ACM-
+AD4- +AEAAQA- -404,7 +-413,7 +AEAAQA- fitimage+AF8-emit+AF8-section+AF8-co=
nfig() +AHs-
+AD4-         +ACM- conf node name is selected based on dtb ID if it is
+AD4- present,
+AD4-         +ACM- otherwise its selected based on kernel ID
+AD4-         if +AFs- -n +ACIAJA-dtb+AF8-image+ACI- +AF0AOw- then
+AD4- -               conf+AF8-node+AD0AJA-conf+AF8-node+ACQ-dtb+AF8-image
+AD4- +-               conf+AF8-node+AD0AJA-(fitimage+AF8-emit+AF8-section+=
AF8-config+AF8-dtb+AF8-label
+AD4- +ACQ-dtb+AF8-image)
+AD4-         else
+AD4-                 conf+AF8-node+AD0AJA-conf+AF8-node+ACQ-kernel+AF8-id
+AD4-         fi
+AD4- +AEAAQA- -442,13 +-451,14 +AEAAQA- fitimage+AF8-emit+AF8-section+AF8-=
config() +AHs-
+AD4-                 +ACM- default node is selected based on dtb ID if it =
is
+AD4- present,
+AD4-                 +ACM- otherwise its selected based on kernel ID
+AD4-                 if +AFs- -n +ACIAJA-dtb+AF8-image+ACI- +AF0AOw- then
+AD4- -                       +ACM- Select default node as user specified d=
tb
+AD4- when
+AD4- -                       +ACM- multiple dtb exists.
+AD4- -                       if +AFs- -n +ACIAJA-default+AF8-dtb+AF8-image=
+ACI- +AF0AOw- then
+AD4- -                               default+AF8-line+AD0AIg-default +AD0-
+AD4- +AFwAIgAkAHs-FIT+AF8-CONF+AF8-PREFIX+AH0AJA-default+AF8-dtb+AF8-image=
+AFwAIgA7ACI-
+AD4- -                       else
+AD4- -                               default+AF8-line+AD0AIg-default +AD0-
+AD4- +AFwAIgAkAHs-FIT+AF8-CONF+AF8-PREFIX+AH0AJA-dtb+AF8-image+AFwAIgA7ACI=
-
+AD4- -                       fi
+AD4- +-                       +ACM- Select default node as user specified =
dtb
+AD4- when
+AD4- +-                       +ACM- multiple dtb exists.
+AD4- +-                       if +AFs- -n +ACIAJA-default+AF8-dtb+AF8-imag=
e+ACI- +AF0AOw- then
+AD4- +-                               img+AD0AJA-default+AF8-dtb+AF8-image
+AD4- +-                       else
+AD4- +-                               img+AD0AJA-dtb+AF8-img
+AD4- +-                       fi
+AD4- +-                       default+AF8-line+AD0AIg-default +AD0-
+AD4- +AFwAIgAk-(fitimage+AF8-emit+AF8-section+AF8-config+AF8-dtb+AF8-label=
 +ACQ-img)+AFwAIgA7ACI-
+AD4-                 else
+AD4-                         default+AF8-line+AD0AIg-default +AD0-
+AD4- +AFwAIgAkAHs-FIT+AF8-CONF+AF8-PREFIX+AH0AJA-kernel+AF8-id+AFwAIgA7ACI=
-
+AD4-                 fi
+AD4- --
+AD4- 2.43.0
+AD4-
+AD4- Internal
+AD4-
+AD4- -+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--
+AD4- Links: You receive all messages sent to this group.
+AD4- View/Reply Online (+ACM-216750):
+AD4- https://urldefense.com/v3/+AF8AXw-https://lists.openembedded.org/g/op=
enembedded-core/message/216750+AF8AXwA7ACEAIQ-B6Ltl4Q+ACE-sx1j+AF8-QU1O83+A=
F8-wMeOlorBivh3C9HD06dwOTkdj+AF8-Mvw5g0JkiLC3BEVzuC8rMFPlyIDdqYv5r1ln2lPqCb=
7AhxUnKem2gk+ACQ-
+AD4- Mute This Topic: https://urldefense.com/v3/+AF8AXw-https://lists.open=
embedded.org/mt/113144105/3616858+AF8AXwA7ACEAIQ-B6Ltl4Q+ACE-sx1j+AF8-QU1O8=
3+AF8-wMeOlorBivh3C9HD06dwOTkdj+AF8-Mvw5g0JkiLC3BEVzuC8rMFPlyIDdqYv5r1ln2lP=
qCb7AhxUiauaTC-+ACQ-
+AD4- Group Owner: openembedded-core+-owner+AEA-lists.openembedded.org
+AD4- Unsubscribe:
+AD4- https://urldefense.com/v3/+AF8AXw-https://lists.openembedded.org/g/op=
enembedded-core/unsub+AF8AXwA7ACEAIQ-B6Ltl4Q+ACE-sx1j+AF8-QU1O83+AF8-wMeOlo=
rBivh3C9HD06dwOTkdj+AF8-Mvw5g0JkiLC3BEVzuC8rMFPlyIDdqYv5r1ln2lPqCb7AhxUgWyg=
Dxq+ACQ- +AFs-
+AD4- adrian.freihofer+AEA-siemens.com+AF0-
+AD4- -+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--
+AD4-



