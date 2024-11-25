Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABEAD58D50
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 14:18:25 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.59])
 by mx.groups.io with SMTP id smtpd.web11.19671.1732544303177093552
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 06:18:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nkdyKzKX;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nkdyKzKX;
 spf=pass (domain: arm.com, ip: 52.101.65.59, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YjN1/lC0bg7KLEpudEk9O/NhCwt500aXl4A6Y7H5pAw9suL+sMjNkPb89mCcLLj9k+IefokH5LLndmNybTSeFKBwhjLEfzqMAy0QW/EbCrasl7hVkN18oLwe+7SpPEli6lAnVwmxvMiuMrQb6eOBE5kk9MdQ+vIAT2vF77dATm3TdwgmRdnYAgzWTrYX+mU8pDKlq+WlL6kskalIrP5FKo5B8klA14GrN+lttN9OtRPIQZxxS3m/OemGAAZ4K2BpE64hTUn1nyXllCovPlyMPL0+ODN/3m8Ctfu2qQfUO/SsBGkdmAAaOlO5kVSNhUDYNLytva/AfROJEkTaTFP+QA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJYTpee13vYv4CiYw0JMLEHP0cAcrc+MgIdLOm8mPVo=;
 b=IywSKXkgZFmOiobaSt97JIyg9afmUHBpsziJugKVDJ50HYqXmdt/syIfnx2SmWDGll8nP0qoVnnDml2Cu8Aj9v56AuQiCbXNtGYYx9GtIXpRGMDWXM4z2sZoRbnrsIniOsN5javK+WTJfRP87iIBA6bKaakZ1b0D4A7qtlTvnzjuf3iHtyXTEjW4MpEMKRPthCSMSKAQpDh9KZVUI4DjW7R+i2dYJKmW9uRE5ke71AfBvHDLEqjNKbsAVC4WyRgZuL2XZ/yMuD7tjvRJsrEaKFqOY+4J+g5Uwwa9lxIpDOIhgMO+DWVZQboPMgG7+2XK/LorcQ/qLCAx+P1UMe84Yw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJYTpee13vYv4CiYw0JMLEHP0cAcrc+MgIdLOm8mPVo=;
 b=nkdyKzKXVDRvqPR5Qn10fk2BOnGtXyWGR5PGwK3oCWqv7VnPbbOuRODpw26E1RhjuGgkgPkrmj+TfHnQotiST9c3Id6LRFXXcWYPqxtos98mWwDWEjB4bLsWUorn2Pda+bltKC1BSEPJwRO/akwz+FUAo5K1xm0wQdFIUpb6bYM=
Received: from AM0P190CA0003.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::13)
 by AS8PR08MB6645.eurprd08.prod.outlook.com (2603:10a6:20b:38f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 14:18:18 +0000
Received: from AM1PEPF000252DB.eurprd07.prod.outlook.com
 (2603:10a6:208:190:cafe::c1) by AM0P190CA0003.outlook.office365.com
 (2603:10a6:208:190::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16 via Frontend
 Transport; Mon, 25 Nov 2024 14:18:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DB.mail.protection.outlook.com (10.167.16.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.16
 via Frontend Transport; Mon, 25 Nov 2024 14:18:17 +0000
Received: ("Tessian outbound 6970ca6dd121:v490"); Mon, 25 Nov 2024 14:18:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 210683160150010c
X-TessianGatewayMetadata: aydIcio3HeTX/xtgN7k7MRots3LfWdhl9Ha0O86zOHLGoNKIQyHcI6EAGEFn2eArbRxF51Fp/R/IgCXz2QLL5l++GH9agOE1Bx7iQ2vzDJM3MYqtHhlS4y09o4+WoEibkO/t4VjNQmFszptcmZSKDI5fvAUS67Il/Ab85ydfEvU=
X-CR-MTA-TID: 64aa7808
Received: from L06834a25a348.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 30D09559-9D62-4CD5-BC09-9D8DE5805C52.1;
	Mon, 25 Nov 2024 14:18:11 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L06834a25a348.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 25 Nov 2024 14:18:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lj9UvbHlDbkrok794FYMGo5JoRtkX889J9KIK/uM9qqh7DyIE/W7te3CF4t/a2eviraiCJFA/xHZnrnMOWb86rNQ3cs0QSJ4qH5X26XLgtFw9tjwMk3hNt5rLmWkZlkDBF9gq7TZYmzIetxmjZKlQy3R9f1glwDPjOfCOx0vgxShHjFCyR/W+Q6ieTSVb6fSqpqwRPan96JcYMcc5BF2S4PlEFg0kCpkJ5cqMtcrk4ByiBVrj71VXUb8hbpa9axXQrhq/NFGX5ro7FSjdMipTWqVby0A0UcsWf/qkyJeUJQij2DCXIFqWxgHVrAsahFZqzZP6INicoUfnjVe4TCSYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJYTpee13vYv4CiYw0JMLEHP0cAcrc+MgIdLOm8mPVo=;
 b=rlBt0yURdwg90Gk0GV1aV8gvA1dIIJ0fFifuUu+UqAjcDwp6n0xYWVFZqgltUpP0u9O83t83C+RbjnxrNvCfcUqwIZd1/CeTViLoYOYp0zHeHzMQb+LZ46sns6XinZzw9KEoAh8AqJznJ55jXT1nKN1JnW3EHiz9wUrWu4wdRBYVmMnBsYDtJ/7uwjGkQJ3n1d29uPIryK7y6a3hbZpGC2azVcIgIdE+JAlzxPFvnMwgUlQTS1nPMbsSmJSJiiGI8hYV1jlPyNiLH59e9yUHkpPKFmutaqdbWrbjgihKkbBEdF9J0CrZZObuORYwWMgzHZM7Ckji4Ez0Nswnaf0UKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJYTpee13vYv4CiYw0JMLEHP0cAcrc+MgIdLOm8mPVo=;
 b=nkdyKzKXVDRvqPR5Qn10fk2BOnGtXyWGR5PGwK3oCWqv7VnPbbOuRODpw26E1RhjuGgkgPkrmj+TfHnQotiST9c3Id6LRFXXcWYPqxtos98mWwDWEjB4bLsWUorn2Pda+bltKC1BSEPJwRO/akwz+FUAo5K1xm0wQdFIUpb6bYM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9568.eurprd08.prod.outlook.com (2603:10a6:102:2f2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Mon, 25 Nov
 2024 14:18:09 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8182.018; Mon, 25 Nov 2024
 14:18:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hiagofranco@gmail.com" <hiagofranco@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Denys Dmytriyenko
	<denis@denix.org>, Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [PATCH v2 2/3] libdisplay-info: add recipe
Thread-Topic: [OE-core] [PATCH v2 2/3] libdisplay-info: add recipe
Thread-Index: AQHbPd9f4JSLalsw7021sj9HzMAOD7LIDemA
Date: Mon, 25 Nov 2024 14:18:09 +0000
Message-ID: <6783A2B0-15E8-4D42-BA44-902DCE78C86B@arm.com>
References: <20241123193527.1435268-1-hiagofranco@gmail.com>
 <20241123193527.1435268-3-hiagofranco@gmail.com>
In-Reply-To: <20241123193527.1435268-3-hiagofranco@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9568:EE_|AM1PEPF000252DB:EE_|AS8PR08MB6645:EE_
X-MS-Office365-Filtering-Correlation-Id: 316e7004-63f3-4c16-ba14-08dd0d5c01e8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?VFA1TnpmRWVUY3JNQ250SWk1ZkQ4SUQ5SGZONHN2SzAwRmRsdzFHZENOVVhZ?=
 =?utf-8?B?WFo5OEhidGRFNjJqTmdTUzB4OXZLdXY1aEN3M0dTald4S0VSTEdFN2cyTW9Z?=
 =?utf-8?B?ajB5emxpRGZIc21aby9QbkZLK0V1YzNyQlNMMUFSdW1yQTRqYlUzWnEvMHRN?=
 =?utf-8?B?VmFQM2thbDFUNWZFZkFMUDlLRCtVbVJxazNqR2VIcXR5R1VaTDZwdkVMZlBs?=
 =?utf-8?B?dVl1UHc2U3IvTkZhd1pHY2NMQkJXYlEyNms1NGl3UVl4bWlRSDk0QWZnMkJy?=
 =?utf-8?B?aGN6SVpkcTN4WmhpNXBrWUM5MWsvZFptbUh5U3hqM21LUFgwRkJWTHl2L2NG?=
 =?utf-8?B?K095cm13cDBBcUlOVEZscUMwV3IzcytQMkw4NnlFUjlTQnBNWE8rS3Z0TE1W?=
 =?utf-8?B?MXNoS01QaWErRFh5N1hJUzlkNCtMVTQxQ3BpMVpabnpUSy85YXRSNDZINHVN?=
 =?utf-8?B?MWxkSTlBSXNFNEZ4TUs1WXN0KytES3RGMjBYUDBWWGFwekpHT3pGODcrb2I3?=
 =?utf-8?B?eldRNEVUd1BGMitKbXNLT0Q3UE5Fd09MRGg0akNxSUp4WjR4VDR6eXZnUkl2?=
 =?utf-8?B?dTFwMytWVUxGeWZNQWJqVlhBZ2Vnb01rMlE5cW5mR3hkZzBGVEprSitmaWQw?=
 =?utf-8?B?UGRQam5KU3U3NHJiNFFpa3ZpRVU4UFNtTlZCcVJ0TWNoSmhLQm1EVldFUFN2?=
 =?utf-8?B?UzFHd1NBZStIcksrU1AwZitQdXFLNm5PbTlPWTZEWGJJUk8vZDcySHpaWnRj?=
 =?utf-8?B?U3Z3UDYrUWgrNnA5UHVUZXRsSmIyV1FXTVJoUGlheEpVcUN5T3REUEF6TVF5?=
 =?utf-8?B?bCtSTWlOZHd5RGw2MVIzQTIwMlR0VHVMNTJlU2RhTSt6N0dXcksxQmN6RUUv?=
 =?utf-8?B?SDN4b0VQaTVJVmdPVEdYUzUyNGhmUW1hU1MyaTA2UzlvVnh3YzJzR0h6K21x?=
 =?utf-8?B?LytqZUo1U3ZRUFpvejg5cjUrM0ZnOFNYV3NEL2VlRXhxZVJ5RzllVmNvQmhN?=
 =?utf-8?B?a3QxTW5uU3d3TURySVFER1RQVjQ0T0ZDWjZoSGQzamZqYTZjY2ltQVNBSGJq?=
 =?utf-8?B?ZVU0cWZJWlRBendia2VnSTFaUjRGRU5GMklBbEQ1eFpaSVFmRldpZXpLcENj?=
 =?utf-8?B?UlMyK0c4bGVqRk1hNnc5WFQ4QUpRYjR4bGpBcnFzT1NTemw2UkNhKzF6Mjcx?=
 =?utf-8?B?RlVmaUt4NVJybUxvY0I0VWNNRG5BS2JwVHpjTnBZdkh2dTA4NXJLUExyR2Vh?=
 =?utf-8?B?dzkrWFdXSjVKVkFYWFFxQW1sRlBQYklYWUVTZ1RKeGZjQlNvWVJycHlvVUw1?=
 =?utf-8?B?cURSLzJ1dktYN3hoanVXdUdyMXhrL0tOc21jOUlXSHZMTHNVTVNERjI5TkUv?=
 =?utf-8?B?S09BSDV5Rk5FUmY4VnNOWXZJTE4yKzl4bzJQTERsWEwxZCtBVFBMQ3JMN25X?=
 =?utf-8?B?VVlkK2o4Z1NxeDdKL0FxRUxVQzdiU00raDBlZ3A0VVZ6QzcwS0tIcWwwY0lF?=
 =?utf-8?B?Z21Vei96dDJsbkdMeGhzREY1Qks1dlBUOWNQODJBVWc0b0J1OTRvRDhrQ1V2?=
 =?utf-8?B?MGhnVHpXVWZwRmJ6dkREQmdsOUlZZy9IN01JOEFoSkpUOWlhMmo4U1RETkww?=
 =?utf-8?B?RjNtMGI3QUNEOERTd1MvZ1k2d2JCQVNpZElTaGtNc0tZUjF2eUdyL0lIYjRC?=
 =?utf-8?B?anY2Mk5kbG1ySHQwM0V4K0ZWdUR6T1FCRC9DWG0rR3RrcnZ1dUsxaXZ1MDJE?=
 =?utf-8?B?c0gwQjNIeEpXc3I5TWlXNmgrODBWWXZpRnloYVVVWFR4am9HZ3Y0VWZtMW12?=
 =?utf-8?B?eVVNN09TRDZ2UW4ya0xoRWp4T3lBaml1d0g4YVNGTURtRmlwRjNjbE9HNGFK?=
 =?utf-8?B?dnRQSXQrV0tQamp0dWJqeHBmNERNNVlsaFVhNGMwSG82cWc9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A36F88AF180F844B41B37D6F6CFEE68@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9568
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	682e6e40-905e-4f41-5035-08dd0d5bfd07
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|35042699022|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TzgzQXoyWmRrZDN6SlJtcG1QUGZkcXN6RmkvTk9ORXpWOHR5OERHUFJkZ0Nz?=
 =?utf-8?B?b2VWVk1wWEpLVGJvU0FXSjZmK21PMkxBbnNOQ0hlZWJMZEZhcXdxQzljM01P?=
 =?utf-8?B?Qlp2Tnh2NW9CRnlON0ZwQytjMStzT0h1dERmU2NYZmNsMlFEYm9KZUwxckkx?=
 =?utf-8?B?amJ0Y2plcW1DaklKRW5nYVRaNUNRN01rckZ5anV2TWZ4YThsUnZwTHk1Yy95?=
 =?utf-8?B?ckNNWUM4S0VSeEhWdWZ1NDZHM0toeEdOOHo3OVFjS2hacVJMTm5jRTZmektV?=
 =?utf-8?B?ZVZkcTFXTHMrbjQyZ3VuZENCTU5aaGR0Tjd4S1ZvNGVwcFllWlZSRG9GNjUr?=
 =?utf-8?B?SGlmbWJSdmx6NUYySzJ5d1F5OEhBWVRpUG8yelQzOFhxZ29aMzVuaTF6T2FP?=
 =?utf-8?B?MmlkTzJOckl0VVdhUjN1dVJWdU1UbWZaTmVwSFBsTkNwV3JYSlZ5bTdJcXUx?=
 =?utf-8?B?ckhmM2huOGVUY21MUStCdlcwczN6Tk5PTE0vNlJZdis3ZDh2L1k5SHZyM3dt?=
 =?utf-8?B?S1dKUmo3ajlyUTU3T2kyQkFwSGhDUmRKK3ZWVE1UdEl0NHhYNkxCSjVMTEE5?=
 =?utf-8?B?aVVvZkYrV2xucWluaXRsbmdoVFZPb2dSVFRoKzIrUXZGYmZmM3BLcFBELzNG?=
 =?utf-8?B?WVc0bkZSNXNva05SRGt1UEF4Ujg3NWpCSDJFeEdlNG9MYlRBM05oRXpKSjhn?=
 =?utf-8?B?clM3WlZhc2x0RjBLYzdxZVI0NWVJVm15QzRYajVBMkdLOUpET2ZiSFBFaUZI?=
 =?utf-8?B?K3FTWDF4WGVQbXVsT2xjOUc2ZFlYaFFrc2xLdC8wQjZHMkVVRFpOZzlFYWlJ?=
 =?utf-8?B?dUhwMkNYZC91VXFiQ24wSXZNaC9FUWJ6bDhucGcwRWQ5SDBidGVSMWsvdXZr?=
 =?utf-8?B?WERtWktoRXBXOS9EaC92aXZ0cFRCeGNsRzZxckpMUS9ZVHZyTHlsd0FvRHZI?=
 =?utf-8?B?MVVFKzdYS05LMmlYUDRuWVVmb0cwdkhTdlVkbkQ2TDk4TlYxVWIrSk5ad2pB?=
 =?utf-8?B?ZVhnVDlQbk5CT0R0eW0rRUJlTHI5R1l6eWNzcjEwdWY1SUIvUG9GV3duaTlM?=
 =?utf-8?B?RjBBWXA2RUpDczhyU2JOMnpPalBnelE1Tnp1a1liMng2eEZZQlFjdUtxZ1I5?=
 =?utf-8?B?SU54NEtIQytXbUxpTXRhSTBhOHJJamM1ZEJac2ZiYkhMcklDV2JnZmxEYWQx?=
 =?utf-8?B?c0Y3czJYejN4cThqejNLNjFDREZ5QlprNDVoRGhKZ1EzU3dJcS9kWlJaQmRK?=
 =?utf-8?B?UENCSjhnMGhBRUpxeWp5bXJhRVRzZDVCL1Z1S010VmNLc0IzUHk1QTFrOUp3?=
 =?utf-8?B?YmJoNm01b0Yrd0tqYnRqSkRkOEVqWmZPenpZQjNRTnl1NGtwbDRoUXpCbFYx?=
 =?utf-8?B?cVE4eWdvTG1rcGJ3YU0xdGxQV1RrSjM0YVY4VnRCUm90dHdtWGlkN3NZemQx?=
 =?utf-8?B?VFRFc1NCbUtDbi9QOFFBTXUvaDRvVmVtbDR0azJLZkxhOXl4OW5HNXlwdncz?=
 =?utf-8?B?TTUvWUpSUHZ0cHlYRld1U3FDbjFrWWlRYkdQUFluOHRKcS9GVFpub2JYV1dI?=
 =?utf-8?B?TDlONjRMbTBEWGdCOUxwbGxvd0hiMC9BMGhkYzZJdW04WTFSdnVRRjg2cGZa?=
 =?utf-8?B?aFZWek5yN0hGeEcvZDJGaVM3WFVOWk03enR0RWhRSFc3UmdPaXU3TW5TRlVR?=
 =?utf-8?B?RnB5VlBnVkVhdCswZjNWSUZ1MWFoWFJoNTF0TWYvVG1uTU12Vkwzd0hYbzNo?=
 =?utf-8?B?OHp6ektLOEhZTEo3VDluSE5IU3VsN2QySjB5a2RHWE4vWEZ4dTlKczM4Sk5v?=
 =?utf-8?B?RkFSRlZHblAxOGtJZVlna1NTTUhTRlJUTVg1c3dtSkYwOStLSGVOWElodTNO?=
 =?utf-8?B?R1M2b2hFbzdTRXh2ZHZiTG13NTJyaCtoUVowWExndVJzQnVIY2MyTmlUL3Va?=
 =?utf-8?Q?SHXCHqng3nUNVtGojZFaMNufVcfe4UbL?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(14060799003)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 14:18:17.6191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 316e7004-63f3-4c16-ba14-08dd0d5c01e8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6645
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 14:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207787

T24gMjMgTm92IDIwMjQsIGF0IDE5OjM1LCBIaWFnbyBEZSBGcmFuY28gdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPGhpYWdvZnJhbmNvPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+IEZyb206IEhpYWdvIERlIEZyYW5jbyA8aGlhZ28uZnJhbmNvQHRvcmFk
ZXguY29tPg0KPiANCj4gbGliZGlzcGxheS1pbmZvIGlzIGEgRURJRCBhbmQgRGlzcGxheUlEIGxp
YnJhcnkuIEdvYWxzOg0KPiANCj4gLSBQcm92aWRlIGEgc2V0IG9mIGhpZ2gtbGV2ZWwsIGVhc3kt
dG8tdXNlLCBvcGluaW9uYXRlZCBmdW5jdGlvbnMgYXMNCj4gIHdlbGwgYXMgbG93LWxldmVsIGZ1
bmN0aW9ucyB0byBhY2Nlc3MgZGV0YWlsZWQgaW5mb3JtYXRpb24uDQo+IC0gU2ltcGxpY2l0eSBh
bmQgY29ycmVjdG5lc3Mgb3ZlciBwZXJmb3JtYW5jZSBhbmQgcmVzb3VyY2UgdXNhZ2UuDQo+IC0g
V2VsbC10ZXN0ZWQgYW5kIGZ1enplZC4NCj4gDQo+IFNpbmNlIGNvbW1pdCBhMTY1OThiMDM4YjIg
KCJiYWNrZW5kLWRybTogbWFrZSBsaWJkaXNwbGF5LWluZm8NCj4gbWFuZGF0b3J5IikgZnJvbSBX
ZXN0b24sIHRoaXMgbGlicmFyeSBpcyBub3cgbWFuZGF0b3J5IGluIG9yZGVyIHRvDQo+IGJ1aWxk
IHdlc3RvbiAxNC4wLjEgYW5kIG5ld2VyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSGlhZ28gRGUg
RnJhbmNvIDxoaWFnby5mcmFuY29AdG9yYWRleC5jb20+DQoNClRoaXMgcHV0cyBhIHNtYWxsIHRv
b2wgaW50byB0aGUgc2FtZSBwYWNrYWdlIGFzIHRoZSBsaWJyYXJ5LCBzbyBsaWJyYXJ5IHBhY2th
Z2UgcmVuYW1pbmcgZG9lc27igJl0IGhhcHBlbi4gIENhbiB5b3UgaW5oZXJpdCBsaWJfcGFja2Fn
ZSBzbyB0aGUgc21hbGwgdG9vbCAoZGktZWRpZC1kZWNvZGUpIGdvZXMgaW50byBsaWJkaXNwbGF5
LWluZm8tYmluPw0KDQpUaGFua3MsDQpSb3NzDQoNCg==

