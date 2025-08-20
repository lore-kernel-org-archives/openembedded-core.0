Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB02CA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 10:53:41 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.69])
 by mx.groups.io with SMTP id smtpd.web10.16968.1755687211458374321
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 03:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=IZ4ooto8;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=IZ4ooto8;
 spf=pass (domain: arm.com, ip: 52.101.84.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wb8QtkwY8Fj1iqem8WAP7x+o2oXkHQF3WN5SLFcDlYnFT0LMrz78SguhI7JV2B4COiPSSv/MEWzBFleGMW6iiu35ITqLNLPu2IHnxLdxU+cFq+sJkWBIjSoa7Edaz02Qyn8Ty4cEw9Ip/MEAdGQj4/wZMDKXgQ2KxDMyFw+9heryT7jc+ANqDrDLUYZ3YVS2YAMZSgMb9O3ayzYpAbV0dLwYRAyECP/Z/omRPJIv+bjejqnfLu1Mq/DoUV81qp3gKxPBKVBB48tk+r4D9HKCm3xFDPsrCrDt/FvpxNpH+VeHFmkG463I2Sw3I5Dz/vMeenOBr+xA5IJlUHMYv2pWNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUeu85ac1oFgpsD7OvOykWRpFHqInM7EV7hlpRVZbx8=;
 b=vNyNUQ3RI8SSmNFVOqbtRvop22uJeWyLB2FBDg5aulT3sQQeJ1lCw1EQeNgiZFfUuEynuvncEpKGwIv8xBc/MpEkcwSru8nCKtkl37XVAQDSvfJCtN4+Ssnl/+UvLzeOxzYmMnbHRDoQK0WZku9mCDC5JJczpL8gnnkcJZklgxM9ukfEfGEmhtzw6XzcekmTF1EPV3OgBJCsKiWP7gsB0mh8eOk6SbD0Q6iEkhPE98ICIRWAB+AxfNNIZmEXbzhAB9QKhRxJR/h2MXAqgCXY7FxnZYeFk9hU8rHRB+4rU0OJKwfJj2Qn6Y/aIvATblAAXAbVFMGOXTPsq7F8rJulXg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUeu85ac1oFgpsD7OvOykWRpFHqInM7EV7hlpRVZbx8=;
 b=IZ4ooto8SnHCS8rkgvs191GhmnzbniA/L807G1pNUaO8TsNPny1/xsusKiEWGhkfaYRfWV2sZMAW59UASH/g419acrBteZacpraNaywaYNv7/Hff39lv+1U6TFcZuraXjCRNhEbBhcTfDIkeOoG2GWqK8/Zc2kfDB8NSxBf5yxY=
Received: from DB8PR06CA0031.eurprd06.prod.outlook.com (2603:10a6:10:100::44)
 by AM8PR08MB6611.eurprd08.prod.outlook.com (2603:10a6:20b:36b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 10:53:28 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:100:cafe::d8) by DB8PR06CA0031.outlook.office365.com
 (2603:10a6:10:100::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.13 via Frontend Transport; Wed,
 20 Aug 2025 10:53:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8
 via Frontend Transport; Wed, 20 Aug 2025 10:53:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZM5kxuXslecE7p6ABZDV4H1xanbbCldA0HCAqXBMv1X6cjIzhNCxOsclPog77jugZZ2+ql1HsK5OdZpNWFqcewwdb0UJy2RkI6LFXhOKVq5RMQkqWfBqSHu/mckqa2jZGKz8J/qWMbDXYD6G5T7sJpBqRnkldWuBcbV6xtTMj1eX5R3W5LBnRpRg1WXpyh2Yesn9BN2g8CWrcMugbrWxj8SIu4+R8cqNU+sBUmzEJYq3bKHIkVUHjtPuY/FQ5NH5PS71zeIfvDZR4I9w/6dKcqa3aarQ1PtSPFBr+HqGGazh7CX+KnDHt1LBN8hOQJWfznBEEYIX75FMQjWy5cHBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUeu85ac1oFgpsD7OvOykWRpFHqInM7EV7hlpRVZbx8=;
 b=Zrjk0c06DN200WsZwHiJvMCk55W52Suhrrq+AM2EXY83CPFYFXAEYhYgxPX+nEhPr9eOAqr1VpJDoJIqDGPw/VBVPkIv6iKvrug2ERIhC/x3nEsRLm5DjPBJaMAg7S0R+KLs6iSwS1hGd8/zFWq74q7DGz2Zst4ppRGAs66TOIHBY0RmAvinfzX7K1SWICGpj70stYfRZMX50BR0fTO6wlJroHPNaw9CkMEojo0Pf40DJzPbk+WlvVS3Rdp0+CFyBwdnRi1WVRArF/RNbj3berrJ4c5J5YtuTRMpy1GfFsa5aoLSi5L7cgZ/BNSaAThTc2//8//x9aG1bbHo4N4XUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUeu85ac1oFgpsD7OvOykWRpFHqInM7EV7hlpRVZbx8=;
 b=IZ4ooto8SnHCS8rkgvs191GhmnzbniA/L807G1pNUaO8TsNPny1/xsusKiEWGhkfaYRfWV2sZMAW59UASH/g419acrBteZacpraNaywaYNv7/Hff39lv+1U6TFcZuraXjCRNhEbBhcTfDIkeOoG2GWqK8/Zc2kfDB8NSxBf5yxY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB6516.eurprd08.prod.outlook.com (2603:10a6:20b:363::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Wed, 20 Aug
 2025 10:52:55 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 10:52:54 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] dpkg: set status for CVE-2025-6297
Thread-Topic: [OE-core][PATCH] dpkg: set status for CVE-2025-6297
Thread-Index: AQHcDgbtk8oapSIaEkqpvFRXOiQPR7RopRcAgAGI8gCAATcGAA==
Date: Wed, 20 Aug 2025 10:52:54 +0000
Message-ID: <1763650D-790D-4054-8E7F-129909F861BC@arm.com>
References: <20250815170517.12674-1-peter.marko@siemens.com>
 <ECC125A2-DA09-44DD-8DB9-CB61F89A822B@arm.com>
 <AS1PR10MB5697BF898E03CB4B9A1AE739FD30A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB5697BF898E03CB4B9A1AE739FD30A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB6516:EE_|DU6PEPF0000B622:EE_|AM8PR08MB6611:EE_
X-MS-Office365-Filtering-Correlation-Id: dba490b6-4a9a-4a9f-defd-08dddfd7cb04
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?RENFenlkN1Zpa3IyK3ZSNjRWVVcrc0dvUzFRL1VUb0pSTWtLUkNiQjNBT282?=
 =?utf-8?B?ZkxCeFBxUWNOV2I2L09Xd0p6Z3p6VkZzU1B4SEtpWXYxNXhxM0xheXVQekpV?=
 =?utf-8?B?ekYyT0IzRHFKY0wza01KZmJGc0NTcndrK1ROb2trYjM3OU9nREIyQ3dOaWox?=
 =?utf-8?B?citveDJuTjd5TkZTM0YzNjRzLzlKcXVRNmpyeEZtNmxCdzllTnB5Z3NLT1FR?=
 =?utf-8?B?WXo2OHJvNXRrbk5TTk84LzVrd05hSnlLekhHYUJac1FiTzBsWHBrN1UyVnZx?=
 =?utf-8?B?bEVnV2JKNk1sVFlGdHBadmJ6TUJOSkt5eU5IcUh3bzVORWJyeG5YU1drT1cx?=
 =?utf-8?B?SFJoYmNNVjI0cGVrOFBnZ2NyYTl5bllpbHBKMTB1T3RSdXprSXZ0YUZQYWV4?=
 =?utf-8?B?MXBvYlZseDlHeklWQi9YSllOSGJYck9rcG5ZMGV5RGw2SjdzdGIvQ1dzOE10?=
 =?utf-8?B?V0NiaEh0NEhqaXlJSm9LL1RmY2NlbmVOaGtPQmppNVF6a3JjeTlqZldjZXM5?=
 =?utf-8?B?QTJuNEZOZlA3TzdFRldZVnU2M2NKN2hJQWtTSzFjVXhFb3k1TDNWdDJEUlJz?=
 =?utf-8?B?UkdEMUlkWnJCUFdlSU8vREwyWGdHTEY5ajlMNllMcEpMNmJ4K3E3WXVwTUxn?=
 =?utf-8?B?Z0ZOUHlkMWU2b0lubm05Q3pydkJvRzIvZ2g1Vm1XT0tJeFBlTzBBUHNsK05m?=
 =?utf-8?B?cnpuaEZzMnZYUUFTaDRUQm5tWmh5czlkSlc1SkRmZy9QVmVYOVlWWDBYSTJX?=
 =?utf-8?B?MEIyMFl0a3hBUHlmTm9iMWxKTElrVzZvSmRBejczY294SVBoajdNaWU2QUhw?=
 =?utf-8?B?a003enRLUWwyYzBFVmxMZW9pNUtCVlZvQ3pTNVZNaTMzOWlFanFNcWhXOHJL?=
 =?utf-8?B?ZmVNNUN1OWVXZ1FLR29yTVYxZFFIM3puaUpJTmhvbERWTG9uUlVtSlcxamF6?=
 =?utf-8?B?Vm91dVcya3F2T1B4RFllMm1PY0cwd1FIWkc5a2R6TTJ1dDhNWlJES1Y0RTB0?=
 =?utf-8?B?M2F2MERITitsb2h3ZHhUQlNxT3dDM3Z1b2djQWVQa2ZPeGx0Ti92ck1Tam8x?=
 =?utf-8?B?anlPb0FKNk5vbGpYcGExTkkrTnpLbDNUZXk3YlhZVXlpS1RqbTl0elRjNjFS?=
 =?utf-8?B?MUZ3RmROSksxZ0JuL1JIQkRCSE0yL3pnb0xKRWd4NGxGV0lpWStnR2RWUU9a?=
 =?utf-8?B?ckRkeTJBKzZrSEYrV0J0R1IweEdXRkxkcjM1ejg5MjgrYmVITTFkYmFjS3dZ?=
 =?utf-8?B?eHhOUTh5bHRlWEtlbkJTUVFBZVBFV1dGR1J6MjVSWTRUR3Yva2VsQy90eEFi?=
 =?utf-8?B?UVNCbzAvL2ZkM0FhOFk0cE9rU0QvSWUxRDkraHIxbTZ6U3phNGdBdlh5Ymtn?=
 =?utf-8?B?MXhhY3c2MGc1QmxPTnVwbnc5NDBtZktGai9ra0JaeXp2aTlwTnpiVkJBbmp0?=
 =?utf-8?B?di8zenhQd003eDR2R25CQlpnaHdYMUs4MWVCTGNoUE93YVE2Y0dTeFladnRG?=
 =?utf-8?B?bEhVbkUrZHU4aGYwQ3JPZDFkS0xhV2VGUmNxdDVxZmgyN1hXU2RGdkp5WXZz?=
 =?utf-8?B?TG84ditVNWtDb2JEdGhWT1Y2Y29pMjhLYUJvUnRqSjBVc20wMFBWc1FPakF2?=
 =?utf-8?B?RjlmOElhdFk1UFYzaGxwajQrbEppRVNmUUxzV3RyeTNlM1ZFbytwWHR1QnE0?=
 =?utf-8?B?MHFJYzRsMEhacHdya1NuSWZtODdjS2M2MlZSSUtuR0xBQmkvVGxZWmo1VCtF?=
 =?utf-8?B?SUQ2b012VitkV2h0SWw4clgyeFI3K1BVcUlsUFZZSVpOVDZCaWRBenVBTE9C?=
 =?utf-8?B?SmhHcWVSdXhBUFdrTnJUOWRPNDh2OFVKZ1k3dkF4RlQzUWYvcFRlazZTTHgy?=
 =?utf-8?B?UEplTEowOCt1Z1dncERCUG1zcjNpaEFlVWZSMDZDMU1ENlF3SHRWZ2NYa1pq?=
 =?utf-8?B?WGVkSnpjZk43Qkx3QnFaQy9hZkhaZmpvbDBlSml1Q2lJamhvM2NRdktHODhK?=
 =?utf-8?B?TXFGY2Ntak1RPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B246BA9644BB241859C61BD7408526E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6516
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dab2e1db-af6f-4373-873e-08dddfd7b7a7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|35042699022|1800799024|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UEpsQkIyKzI3Uy9jRXY2WTJOdy9Gbk14aXE0RjFZL0tzcWluQzFIQjNOY2JG?=
 =?utf-8?B?ZDdLaFo2c0NzenlOZnkwc3ZtWlVIT0puWG50czBpemJtc2dwKzV4bk1LZ3d6?=
 =?utf-8?B?QTBtNTRUZTNHc0hyUk4xMCt4SzkvVzI1ZmkvNXlxRTVUaEZxOWI2RkJhV2g4?=
 =?utf-8?B?bUdhYUQ0MjNQOXpCQmlDSkVid1V3REVKRGp3TjJ4YUx6dCtSNHQxTWFDL3Vm?=
 =?utf-8?B?dGpjZ3lpR2t6SFlKb1Z3UDlyUUdleXVOQWNBeEpGeW14MFZ4MHJ2cWFIaVBn?=
 =?utf-8?B?MlQ3S3cvSlZ4bTBVN29PMTBVQ3FNT3U1a09xSmxqTXp4UjNCNUhYRTl4T2dW?=
 =?utf-8?B?dThtSXVKeCtPeWYrSjBlbU9xdWRNVURNbHB1emgrdkpzampMUDEyS2tab05m?=
 =?utf-8?B?WHBrck1NZFQ1dEoxR3lTdFhiV1ZpT3doOW5vK3FOWHozZTMvdGxBMnZEVlEw?=
 =?utf-8?B?Ujd3ODJRQlNSakhEc3QrNXBiWXFYYS84VDU0L3hSVjIwMXI4dG8zY3JxbEo0?=
 =?utf-8?B?VlBOSmxRblZpRzVQQkxQN3dkYmNZRDNsSXRtTDBwUzVGR2hob2tBaG9LaWht?=
 =?utf-8?B?SzZTdVNld1JxWTB2Vy8wNjgyT0JYZVNMVkY0TnRiOW1vZjBVYkVsNnhCMnQ3?=
 =?utf-8?B?V29SWVZraUhtdVRzall4MlRWbFVTWFFpQ0g2YnRmQmNpVC9WbDdEczlUY3pC?=
 =?utf-8?B?R3RqakJQV1ZjNjNGRlp0K3JmeUEzU08zcml4Y1RKRmJhRDJZY1ozRWt6Q3Jv?=
 =?utf-8?B?aTdycEhYMmRqRWswU20yeHp6V0loVUZ1dXIxL0pGRGV1YTBTYXhJcGtZeWtO?=
 =?utf-8?B?YTJ0dUhxVGNkR1pneXhRODdvbkozNEw5VDFZUUZPd1c4Q1lrSE5xU3dpR21U?=
 =?utf-8?B?YjdxYXBKZVR6eFU2Vi9RUW9yTE4vWng4Q090ZlVWTUltcUU0MkcvZTRmUmlZ?=
 =?utf-8?B?czlzcWZReHZqYUJuSEZaOUROd2xyVjJIVjRiS0xKQVR6NlpXclZwOVV3YjNG?=
 =?utf-8?B?Ky95TTlLaUhOb2svWFJKcjNGUVZwM05CQkp5NTFEZkhHK1Z6cUt6c3VKU3Yr?=
 =?utf-8?B?TSt6VEZacFRIUkdRVHFxRkpRZnhLakdHQndoTzB2VUVUaXpyMWxCelNkWnVh?=
 =?utf-8?B?bE40YW1vOTF6aElsUjBWVXdST0s5RWhQUklWR0NNZUd0aVd3Qzg2aTlIUExq?=
 =?utf-8?B?blUrNXpaakZicWlCenhSSzNadTN3WVRxRE90MVpjdHpqNXY5aUhBdkJNRFdM?=
 =?utf-8?B?czJ4V3V1M0h5NFAwM3BrMklrQVNZbyt2R1JsMnlvU1UzZmwxMm1JWFNKYjRj?=
 =?utf-8?B?SDBWVG1vR1ZhaVJPQzQ2dXczditTaE5VMjUrenc1RWpuWW5xR0tReFJobjJR?=
 =?utf-8?B?M0ozN05MdDY4ZGhrWU5sYXpDeC9RMWlkb0Y1RVI0dDM5bFZLdlRzdnlIZEky?=
 =?utf-8?B?ZzRmbTlac1lKTUNLNGVvU2RtVWFTeEY3UzlFK3FxaVdod09aU3crbCs3K3JR?=
 =?utf-8?B?Q21JeC9Ya2pGMFIzTTQwN1Frd0xMRjExWElrMDZ2SWw1NGQxaHk0bytQemlx?=
 =?utf-8?B?dTdEZWc0MVljbjVCS1lvb2hFUFVyMFBacytUSSt0ZXpxMnpnMENtdEV2UXdW?=
 =?utf-8?B?aHdwTTZFZWxBbE9BWlRqMkYzRVpHVlNJYUpnT2NzcFcwek1aV09lRldSZkVN?=
 =?utf-8?B?QWF4azhXVXhsYythTGtoeGZDdkF6WWFMY1dkZ0k4cTQ1MFg4WEk4QXg5WTFL?=
 =?utf-8?B?VHJjOGJWUjhialJUcm12R0ZySWhmNm5iSjBWN0E4cFg1YkZ6bGIrbWVOak9m?=
 =?utf-8?B?RnY2ZHlpb0hjRTlkcU9VUXlWWjJzUWlFUE1BL1JxWEdlR2NMWVNwSXEza2pD?=
 =?utf-8?B?ZW1DeFZjWUpFWWJHMm1QeWtGcE5qa2VyMVd4UThuQUNBNlBoSkFJZU9GcTda?=
 =?utf-8?B?S08yNGdtWVZjclUwWVlyMmxLRW1PZG8yTmlzMnowQVRlaVoxdVM0WnJURlZF?=
 =?utf-8?B?THdyOXNXSS9BNW5KcE53WWY1TUhXcmpiQ1VFYy83bnpBWGR6bkNsNDZId0JW?=
 =?utf-8?Q?QMSXMx?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(35042699022)(1800799024)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 10:53:27.3057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dba490b6-4a9a-4a9f-defd-08dddfd7cb04
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6611
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 10:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222172

T24gMTkgQXVnIDIwMjUsIGF0IDE3OjE5LCBNYXJrbywgUGV0ZXIgPFBldGVyLk1hcmtvQHNpZW1l
bnMuY29tPiB3cm90ZToNCj4+PiBOVkQgdHJhY2tzIHRoaXMgQ1ZFIGFzICJVcCB0byAoZXhjbHVk
aW5nKSAyMDI1LTA2LTMwIg0KPj4+ICh3aGljaCBpcyBmaXggY29tbWl0IGRhdGUsIG5vdCBkcGtn
IHZlcnNpb24pDQo+PiANCj4+IEhhdmUgeW91IHRvbGQgdGhlIE5WRCBDUEUgbWFpbnRhaW5lcnMg
YWJvdXQgdGhpcz8gSW4gbXkgZXhwZXJpZW5jZSB0aGV54oCZdmUNCj4+IGJlZW4gcXVpdGUgZ29v
ZCBhdCB1cGRhdGluZyBDUEVzIGxpa2UgdGhpcy4NCj4+IA0KPiANCj4gTm8sIEknbSBub3QgY29t
Zm9ydGFibGUgY29tbXVuaWNhdGluZyB3aXRoIE5WRC4NCg0KT2theS4gIEkgZGlkIHllc3RlcmRh
eSBhbmQgdGhlIENQRSBub3cgc2F5cyAiVXAgdG8gKGV4Y2x1ZGluZykgMS4yMi4yMeKAnSBzbyB3
ZSBjYW4gZHJvcCB0aGlzLg0KDQpSb3Nz

