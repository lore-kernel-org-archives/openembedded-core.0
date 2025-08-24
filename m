Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F06CA0EFC
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 14:02:51 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.23])
 by mx.groups.io with SMTP id smtpd.web11.17419.1756044166083625767
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 07:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jqJOjMM9;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jqJOjMM9;
 spf=pass (domain: arm.com, ip: 52.101.69.23, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TburxzDcGdkNsMuCES6yB1HlC53qBdZp/uZasomwMkLGNLydNtL7OFRISztnTglTwNJ5bcfc2EblHFuKyF0rmE0zHOsAVdMfiTrSX359UATZWiz1eaE3hxJgGpR2z0rcPZV+Xk4GuC30Y5gHzqtNMFqkc+T2kgVUU9D9gUtkZsmfidGT5r/W+0+JpojjKb1eTCbAR2/2TmyN7RmvRA86bdRwjxSOQUp7UDviDxaGd6RX6aap5/ZriBLVVt5sZN7XVH37GYyKNZVWjTYIh4dtpYA5ffd/Pgb9ztlpki418TIYGTvCKDG+Yhf1tOnO+6bc4mU0oodY1993kpCrpEEwKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSxe2mQqvKdTalRsA5zqMJcbHWbjq3l7YHOFsxhXIQo=;
 b=F5olK15eOZjZQYLMZIV8pb2po9qKpVui0C9tMFYEBuaTATdNLYMNTzlo1lEAB3wpwI4m2+YikJTy+VNbMUfLVs3WoNv1LPcn7tU9gqh97BQlQxHECA7s+Xzl0vAtus0GHUqwI2+XDcL5OZ65DDjaonWpyc94wwKHA84RJzC4hUXRAaZp7RlM9O2dDKRn+QMtB5P2K6Ani+niqxBePjgpbGnvI3jEF2TZ+RTgChxjfqGMSyuBT2mpseQTLhuWKjd9On+YpxPnWY85YNA+CpJ09gRWMj6PlmBsuEpeV+dOfM9j8CwTJQzwo+2GGQBLfWOAyAOq/KSef0IgkLA2BPLsGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSxe2mQqvKdTalRsA5zqMJcbHWbjq3l7YHOFsxhXIQo=;
 b=jqJOjMM95PIJqH7rSzahzYWAdXC8vifeH3Xhi/5/WFRgrrGTo2SUDTOD3RWux418tzugBBWzUqzhGdive4gSQMe0k7mOMVpnBMhC4C8cCamvW3rQ9zAV/qaGAVggXcxhQW30Gi35rrCCnb4uOVnxLJkB274yRoQAU0lWD55hB6Y=
Received: from DUZPR01CA0344.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::9) by AS2PR08MB9761.eurprd08.prod.outlook.com
 (2603:10a6:20b:606::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sun, 24 Aug
 2025 14:02:40 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::72) by DUZPR01CA0344.outlook.office365.com
 (2603:10a6:10:4b8::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.20 via Frontend Transport; Sun,
 24 Aug 2025 14:02:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.11 via
 Frontend Transport; Sun, 24 Aug 2025 14:02:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qiX9rWx3oLDQ9iCbk1F/ECFOLnlt5K1yH9lTZaom4qhUe4eIqKfteTEitnFyKXJYDwpcHU+gfpQeCv6k3GFL7Ecrd1UMPSTSFY6/jPPjbFU1KyR1XKFTgP8V+jwyKSAzvUqFBZwvQOWiXjpsD/9SseE3gErBP395+pap+9yUYk5SEdcBrwXH7jr3cFaw3m0ACrtHqYFiRzowAp5xmq90BcXj1e5cHKrZeS6L/AcEcaf18aB1r4z2vDjaILYEHUv0oVkYoEWY+tbLfQAvSz/kMlsyygZ25XpIYdoEqmf2IbEUjnJl91z5tXWzZBO/xwHm1+giRPULRw1ypnXBPvYHrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSxe2mQqvKdTalRsA5zqMJcbHWbjq3l7YHOFsxhXIQo=;
 b=Fy+ybbuDL7vjQLj9o+wojKRoFcNqtuMzWPgupdv+eW+rL85M2dfHTeP/7mB6OZVnJ/1wTuYJjtuKEDIouB+i+cY9GhHz+RZfnN9EnIiRd1drbloBvuYWMDqTGOpLkaoubtpLPvd9cg98/1DWxrz+7LvjXGLSZQsMlmtcnOLOkpSHUE8C0qt7hZBN0dpCDNIN5tge3BnnKH6vFIcygSPpvh7QvtIHPIdVLV4ywCRbAkRefmUXGFqIrSqC9mldyESIsQ58AfHaoS1U1POjqoRmj0EckFpV0LvIgigO6hGqm2hrmNPSM8+fJQp5ZQIwiRmva0rms6MX2C2hkXBZhAP8lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSxe2mQqvKdTalRsA5zqMJcbHWbjq3l7YHOFsxhXIQo=;
 b=jqJOjMM95PIJqH7rSzahzYWAdXC8vifeH3Xhi/5/WFRgrrGTo2SUDTOD3RWux418tzugBBWzUqzhGdive4gSQMe0k7mOMVpnBMhC4C8cCamvW3rQ9zAV/qaGAVggXcxhQW30Gi35rrCCnb4uOVnxLJkB274yRoQAU0lWD55hB6Y=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6526.eurprd08.prod.outlook.com (2603:10a6:102:df::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Sun, 24 Aug
 2025 14:02:06 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.9052.019; Sun, 24 Aug 2025
 14:02:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "semc.2042@gmail.com" <semc.2042@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] libmd: add ptest for 'libmd'
Thread-Topic: [OE-core][PATCH] libmd: add ptest for 'libmd'
Thread-Index: AQHcEBhgK6qHCXog+kWa+F5sUSkJ0rRx3xuA
Date: Sun, 24 Aug 2025 14:02:05 +0000
Message-ID: <6B127FE3-6823-45C9-BCC8-49331E6BA830@arm.com>
References: <20250818081557.776364-1-semc.2042@gmail.com>
In-Reply-To: <20250818081557.776364-1-semc.2042@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB6526:EE_|DU2PEPF0001E9C0:EE_|AS2PR08MB9761:EE_
X-MS-Office365-Filtering-Correlation-Id: 159d80a6-765a-4292-0f26-08dde316e2f0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?NmxBWnhOY2tIQjJReEpmRzJ0U3hrR0RyZjQ0NkhnV2lHR25POS8wU1RQRXBz?=
 =?utf-8?B?MlU1SkpPZ2xwbEtZbTUyWS9hMUtySnV4MG56elV0eXNncGMvaWpVTmdHdUFW?=
 =?utf-8?B?NkxHQVNSVzVaTHpCL3EzVzJIemc0czR2bjc0V21ldHlKWExXbjM0S2EreDJK?=
 =?utf-8?B?VkZReHFzZWJ3MnEwb3RqTDVQWmFmeVNxbkJOM1E4amFGUkNzdXEwMUl5RXZ1?=
 =?utf-8?B?VVFEa09zTVZrRk0rSHViWW1kV2UwMk54MVgrVW1RVXgreDV4V3NUWWhyTXZs?=
 =?utf-8?B?cThZVCtrdXpOOTdLQkMzLzlOQWNaMVNoeEtmRDZaanNmeXhldXZ6MWl6ajRM?=
 =?utf-8?B?S29jK1MrS3U1U3ZWVlcxKzBYU2c0Z0RlOUx5Rkl2RXJSRjc5NHYyL2Q1SU43?=
 =?utf-8?B?OWlPNS9mTllNWTdUcU5QZmtvNnluU2lSOW9DQ2Fkbmh4MFJyamNDMWkwd3RR?=
 =?utf-8?B?VjNCb2MrN1pZVW1YaDNXd2NBRXIvUjI2alRqK1JYZlJpRmJoanFDSFUrbWlN?=
 =?utf-8?B?Y3BDWXNJbURQdlNaZDJMckF5YWNMYSsvaC8ybUIxVS9YK1QyUHVBTDN2Tm9K?=
 =?utf-8?B?WDBDOURaNlZRSmR4SkR5WHBjSFl3eTlOZk00T2lrZ1U0a01aT0VQYTFwTHI5?=
 =?utf-8?B?cEcwdVJlU2Q2RlVXeUs0VFBFUlVGY2p4Rm1SVFVKd291UW5HWEJraDVlalI2?=
 =?utf-8?B?bjMyZ3hVNHJ0bU5VSGhqZnFsVXZSMm12VDllb2JwN0RlN2daSnF6UnFrWmk2?=
 =?utf-8?B?ZDFtUW9OQ2pOYXRGMVVoMis0bEJPZytBbk5mNUdUZ2pHdlE2LzlHT1V3cFdk?=
 =?utf-8?B?WTFuUU9hVk9ieUFuVG5GbkdIOXc3ZlpPWSt3eDlvckNKL2ZHUzYzMU0vWVhP?=
 =?utf-8?B?TFpyd280aEhMUDVGR2IvSnV4Z095VmpaQ2dFME9oQVN2MHFNVHlUSDNnWVQ5?=
 =?utf-8?B?S1paZDVTZWFpaWg4aHcvL21uMkhTdnl6djBTKzVrbHVoS21uOVdKVDJhZHZr?=
 =?utf-8?B?K2ZxTGxjaExXUnNmbHNzL0YyZTBndGo5cndkeFpOY3FIWkM5VlBBbmdJcmps?=
 =?utf-8?B?V2FaSmxTeFNGODh1VFlEeTJndUVRaHFseDY5NEdjU2xhditNQmMvWVZHZDBB?=
 =?utf-8?B?clpDRWpTdU9qdmtFWnRhSWJpYTJpTjVNY3VZa1Y5dE5pTERXdFpPR2NrWE9a?=
 =?utf-8?B?QnlhS1N6aVo5MXl5QVpPZmVBaDdKeDZxaHlKVVpFTW50ckZPVVF5SDJFQ1Zi?=
 =?utf-8?B?MUE4VElpckRoN0pLYm1mRmI1SFpGVDV4em8velZJTjRoSmR1a09LR0NBZGNH?=
 =?utf-8?B?UEtCVGhnenZDcEp2SVUzRHBoTHVVY3puM1E5cTZlczZVa3pIY1o2dnBxTUFI?=
 =?utf-8?B?Q2ZJVEh0S1d2ZlZnWC9JdTJNVDRydlVKQlFmLzNBcjBkWi8yRTVtUzBJV1VX?=
 =?utf-8?B?YysxRXRyL2tMQWhaUVBKdFRhNjE2bEF5QmZFWEltSEIrNm4zTXhwMXdOeGtp?=
 =?utf-8?B?U0dhZzRvVDRZQjdsSGhWakZUdGZMZ1EwRXUyUTdRRmUyaEQxb0NKV3dra05r?=
 =?utf-8?B?RTNaU2s1dTNGMmV3YVl3VVRmWkpHTG9vUGdqTFlsem5YNjU0ckVFV2hzbVFt?=
 =?utf-8?B?dkQxSFZSeGhyS3ZCQjJEQXVKamZWTkZBN1E4ZmZieUxDcHhrK0xBbzhZSVln?=
 =?utf-8?B?MG8rWFhVdHI4Z1JvMnM5bmVVOTRZeHJsM2R5WldjWFkxNVFhby9ra0RYejN3?=
 =?utf-8?B?dE9saVFoWDBsdlVLSVcyNGl4QzRCOXNnc3RoSituZFdTbXIwcnhqQTAxSm56?=
 =?utf-8?B?Zm5pSks1ZWtVMHdyR2tIdFA1bm9mT280cStoMDAvZDMzY01PYjJNNkxQMjg4?=
 =?utf-8?B?WCt1K3hFemZQcTdjOXBkeHhtOE9pZURLMHRjS3NOcnhQUzlEWllPZVpMNUlj?=
 =?utf-8?B?Y1NNdXZMbjVmWUhhZHdTTGhyL1YrRkFwWm5GU2g3NFM1Z1pnOGxvNnR5RFVj?=
 =?utf-8?B?QnJNczRHNGdRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9506565B51C714CA7617B46719FB702@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6526
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f51929a9-a032-4d47-1842-08dde316cf27
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|1800799024|14060799003|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QVpvYVRwNTNWM2xlSVp4bnBWVGZlZTY4R0RDcklqemJUVVZNWWxkMTZGcU1K?=
 =?utf-8?B?SlhOU0xCcTFmdGhmYldXL2l1WWhXRFpOaUd3dmhwbEtmd1FMMlBYVnpoMWhl?=
 =?utf-8?B?UzBvT3AxUkUyRnNWa205ejB0VXo3QTA0ZkljL2E4QXYzckpMMlRJZEpNTTFq?=
 =?utf-8?B?c1k0TnNTL3VWQzhBRFJoR2VVTUJaOHRwM0tBZWdzS3FJZENHZ3NYd0FrODhj?=
 =?utf-8?B?ODUwQUtKU1VzbVVvVnFnbkZMaUhmTFVFZ0NpclZuZzBrTEdOOTFTaDB2ZVBD?=
 =?utf-8?B?NTZvTy94elZ4U2hvQk4yVzdMeEI3Y0J4d01YV1ViNHF3WFBSYklJc09pOExZ?=
 =?utf-8?B?aE5oa1RUYXBTbmhHVXR2QVJNVHlSc0owZ3NFaEVzZUdsTXhIYkhock13QU51?=
 =?utf-8?B?Vk5XbEI0aXhaUUZleGk4OEJRVDFMT2UyYUdmaTlpVW1HZXY3UXJrbTgwbWVC?=
 =?utf-8?B?ZWVZRUdXOHFiQ095RlB2WTlBa3JRYzBwVSt3MFRJMjFrUUplUklKUEFvY2lM?=
 =?utf-8?B?ODhkaE9IWGVrc00reDZqR0FzdXEzQmNMdEVsb0NEVklBN3BZekFJdFUzWDRF?=
 =?utf-8?B?OXV3ZEJyRkFmVUJSQ2twcjNMRDRNY1FNOU1HQmhEOXdBR0JhalFwVG8yMmZq?=
 =?utf-8?B?R2RaZjhGbC9rMTdUMENHUW1EZ0ZZNUFLVCtwMTdmdDU5TUoxbDNEZGExb0hs?=
 =?utf-8?B?Z1RwaHNrdTE1WVltbm10QTJqaXpiOUZ3UEJEMkpMUW5pcW8xMjZqcVZjSzF1?=
 =?utf-8?B?Sy9pRDhmQzE1aXJNVUZLeDRuMjJhckdheUprTjlFS3FxRENJUzAzNFZhaHp6?=
 =?utf-8?B?dlJ3T0poOFJtTm4rNUlkMFE5VVUrV21CVjZONEk1YmpySVBCaE1aTTV0TDIr?=
 =?utf-8?B?eHVaeWVyQTRuRkc0RjhHR3ZTcW4vc3c1ZiswUzlzS2pLSkE1R216YTBnRUN4?=
 =?utf-8?B?bUdJQlF4Q1MvZW9xK2k0SnRIaTNRQ09BNjNkcm8vNVIzWTJWWjZkLzYzK0hM?=
 =?utf-8?B?UnJnTjFRRUpuT1liRmxZZkZLdHNJZ3YyZHBNZU1GUkFtdEp2ZW5xZUFhZnhR?=
 =?utf-8?B?UEZxWExPdnNzdlI3aHdRbmJBZFdCdnI3MmxPT0hHdHRnb3l6dDVKeUVRMWVF?=
 =?utf-8?B?WENOcC9FWi80Q0hlZk9zK2gxRzNsczF4Umt3QmdNakdRaG16ejc5c2Juc1V3?=
 =?utf-8?B?YzNzZ3p2UEt3MWVzMlp2U1oxU3hRblJhT3czaFlIRk81S3BSY2Q1UW1sdnFs?=
 =?utf-8?B?TGJjYWRsOTNkamdVWE5RcEJUcmg5UzY3YlViTEpzK0pUeFlhNzVYVk5HSC9h?=
 =?utf-8?B?d21JT2N3dncza2FzK0poNFdUUVgzZ1FUUGhVdjQ1cnlMc3FLd3ZFbThOci9G?=
 =?utf-8?B?ekppZWN4MUR6dS9FUlU1dE83aXNqdEFmMzB5L1IrK1BWekszdE9iSk5yWTZH?=
 =?utf-8?B?cTJoNERYMUVBU1lxWHRxRnVBdjdvV0VzYTY1U05Hc05nMmROMTNyRm0rOWow?=
 =?utf-8?B?QlR3MWtGb0hoYVh0NEdiRGhsU0xVeWtQWFptVjZscnZqK1p1K2tYaU52dS9S?=
 =?utf-8?B?SDFHSUZzLzE4TW95OXVhbDZzM3l4aVRKblNZaGZTSFhIT0RvbVNablBPMzRR?=
 =?utf-8?B?NjhGc0VTazFxUzF4RkQxcWVOMHgwVnZwbFB3SXREZUVtQnlrV2hmRmpFOUZJ?=
 =?utf-8?B?TFdFVmxySXhBMVRMM252dWJaYXdNUXZ2SVpaTkM2ZytpbWRaRXBNQ1FkUTZr?=
 =?utf-8?B?ZUZ2cktqNjNPb0JmN0VreGJ1TCtzUFV3SS9ZdCtUOThJaEFNOVBMT2M1MGRH?=
 =?utf-8?B?QmFLaHVoNVFWZTlnZFB5emNoTCtzTmtKL3pRbkZvTjJGZjlUdkcwL09DQXNP?=
 =?utf-8?B?dGtGSVVpYk5yZlJxZDJScU5EbHpua0c1T1pOZjd1QXkvbURIZ1JtU3RQSUtj?=
 =?utf-8?B?MUs4NHlOejlOUHVYaUsvN1Yxb01KVWdhNmgyV2hyeG5hZ3NEbFNFQXdHMkds?=
 =?utf-8?B?YVQvR250MTB3dHl1bHFNN3NnaXIyeW9xT1d0dnppbkR4T3cvb29GamQyV3BT?=
 =?utf-8?Q?L/aJzb?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(14060799003)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2025 14:02:39.2131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 159d80a6-765a-4292-0f26-08dde316e2f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9761
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 14:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222377

DQoNCj4gT24gMTggQXVnIDIwMjUsIGF0IDEwOjE1LCByYWptb2hhbiByIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxzZW1jLjIwNDI9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiArZG9faW5zdGFsbF9wdGVzdCgpIHsNCj4gKyAgICAjIGluc3RhbGwgdGhlIHRl
c3QgZGlyDQo+ICsgICAgY3AgLXJmICR7Qn0vdGVzdC8ubGlicy8qICR7RH0ke1BURVNUX1BBVEh9
DQo+ICt9DQoNCkluc3RlYWQgb2YgY29weWluZyBmaWxlcyBmcm9tIC5saWJzLyAod2hpY2ggaXMg
YSBsaWJ0b29sLXNwZWNpZmljIGltcGxlbWVudGF0aW9uIGRldGFpbCwgYW5kIG1heSBub3QgZXhp
c3QpLCBjYW4geW91IHVzZSDigJxsaWJ0b29sIOKAlG1vZGUgaW5zdGFsbCBpbnN0YWxsIDxzb3Vy
Y2U+IDxkZXN0PuKAnSB0byBjb3B5IHRoZSBmaWxlcz8gVGhpcyBlbnN1cmVzIHRoYXQgdGhlIGZp
bGVzIGdldCByZWxpbmtlZCBpZiBuZWVkZWQgYW5kIGRvZXNu4oCZdCByZWx5IG9uIHRoZSBpbnRl
cm5hbCBkZXRhaWxzIG9mIGhvdyBsaWJ0b29sIGlzIGJ1aWxkaW5nLg0KDQpSb3Nz

