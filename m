Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A777FC25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 13:47:38 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.56])
 by mx.groups.io with SMTP id smtpd.web11.14326.1715867248329644881
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 06:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=S/6lIJRL;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=S/6lIJRL;
 spf=pass (domain: arm.com, ip: 40.107.6.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cDzulO5D4XhwGLBGedY2XUIMTK4oh1S3XWmLYTwMsu6CB2LcpeAryaSop2H6yZjRqgz4tbKGuT9yUMkqY0DQ9wam7vVlRgjl0D616bhjORaB2k3MDEe0b4rV6CzjV9lepKljwLz+ZwSnXutn4XzOV1HOa+n0fkpZaOElFuwIupkGgdLKGDzAMhxi0z/pcyfn/4g/piHeQL1Wxn4CTXnptrZ0DS/z2MuwPtaVri4dGNTQVvXVVMhAiIf2hXrNOIXhZE/xmB71XJ5buQTXPpk9sYq49xFcc9miLTvCCS0UgPEjs3vHgllCfjO5H6ov5gu1bDjQknNWztm7OK1YAfswMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCWVgzAw6Has/ePonX2quH5kHidSEY39KJM5OeYPeOs=;
 b=VMcYOHat2/oBwCO+9z4FeOw0DViqM0h8L5vodYHVUeLZeXIoXiwTDn7OmN6129fKVOa5V8oz+azrbCW+MEl6pTjXFQRrADDr85xQrP/FUTNChCIh6P82hMpXLpFHiHw7k/Kz4p7dhDYhkbDUbijbBhqPak4aZE3mhKecHq2morKOa/DHUShX+031qVxJ/mpzAO6J8mQ5YC8HuY8gkR2aeO5aodnJitnv7Hs1ZKNHuj08ENzq9sp5LoEC3b/WbpjewX+WVfHHMEN8Y75NP2xt2mQrwBMfuKphZSQ0MK7dX25Q/hufOV3Gq2sUljTYwAIBh/nRZuA3zKVh3zAlt7SPYA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCWVgzAw6Has/ePonX2quH5kHidSEY39KJM5OeYPeOs=;
 b=S/6lIJRL8fe2A1UizcgGj3gR6zasbxWpy6HZUnj4idaigEV/eWj4dx74SH8UCgvFsEVD5uRO+VuhT1jYm0Le+mEWUzKVO8xPklHZ2FOf7Ae+8JhA+YLSsVrTMqN60GjJzT/gjWhBo+fFHSBDTokYr8mzN8xIXHnwUfWJMpYksoI=
Received: from DB3PR08CA0020.eurprd08.prod.outlook.com (2603:10a6:8::33) by
 PAWPR08MB9029.eurprd08.prod.outlook.com (2603:10a6:102:341::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Thu, 16 May
 2024 13:47:24 +0000
Received: from DB5PEPF00014B9D.eurprd02.prod.outlook.com
 (2603:10a6:8:0:cafe::40) by DB3PR08CA0020.outlook.office365.com
 (2603:10a6:8::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28 via Frontend
 Transport; Thu, 16 May 2024 13:47:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9D.mail.protection.outlook.com (10.167.8.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7587.21
 via Frontend Transport; Thu, 16 May 2024 13:47:23 +0000
Received: ("Tessian outbound af213ececc3d:v315"); Thu, 16 May 2024 13:47:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fed6fa7d7d8e0ab1
X-CR-MTA-TID: 64aa7808
Received: from e48b474fef29.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5D801A8A-52FE-4FA1-9297-9A47D6537E64.1;
	Thu, 16 May 2024 13:47:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e48b474fef29.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 16 May 2024 13:47:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZA+vskvMT/EtxD3A+IlhBXN1Gfv+a043CN6iLh609CcQdOgWxMjkF+eka5gdp2FxY7/YWRCJJqPa2VDHsxY7I0xPRXRqZTz/VdyNwSyzIp5tqjlqGzmgdfXwaA+/fXz7n+o5MM95xBDUntHHH5Wc3s59uSAVZXy+2kAPuj5kSQSLS98Cef/IOI6OwyGEQnmj5CbcwuYyh+6Q1AP+TQInk56QEx1r2TYHrUrY9sjP/vETvu/wV+XXrhUCK06WAx53RUXkYxjoWpQ4HCd5hp7JpK2ivoQlulnkiwT1UlrBCXBQCPytvJoxi3aGFfY8qLlQgmM34YIXoLIgY+tpU6Ysw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCWVgzAw6Has/ePonX2quH5kHidSEY39KJM5OeYPeOs=;
 b=m6ny2IWxdPEjGJu94pmDGpti/KzIUCM2QeoWpH45uFKgQYZLJ+DTNBLeiIQN2miL6DboLjxJwU3DUh9drygGUw0SY4PtotK/jxxv9NJ+yx1KQPYZIalgdJnssH6OIBkTo1XtWwA14MoZNcjT6LeyHq/Hkb2nxdo0SnLzaTr5d39l/hs8HuxdgyvOjjpa2B42mR1UMgPeJyWQfnGGLcgrHinjPI5D93XmDwj7Vz1hcXzKtyiBk4cs2DagCZY2Mc7LJ46SaVhAHvlvi1afa3KdF2Qprq1h6dNjrZ5nAl1cQNSuykkWA4/iWf6o8uoXsmMV0NFS27baZREf68ZPR1GPJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCWVgzAw6Has/ePonX2quH5kHidSEY39KJM5OeYPeOs=;
 b=S/6lIJRL8fe2A1UizcgGj3gR6zasbxWpy6HZUnj4idaigEV/eWj4dx74SH8UCgvFsEVD5uRO+VuhT1jYm0Le+mEWUzKVO8xPklHZ2FOf7Ae+8JhA+YLSsVrTMqN60GjJzT/gjWhBo+fFHSBDTokYr8mzN8xIXHnwUfWJMpYksoI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU5PR08MB10657.eurprd08.prod.outlook.com (2603:10a6:10:51f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Thu, 16 May
 2024 13:47:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 13:47:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: iso/live/hddimg images, cdrecord, burnia, the future
Thread-Topic: iso/live/hddimg images, cdrecord, burnia, the future
Thread-Index: AQHap5ePpgX4YUQ7rU6thnvEGRl5TQ==
Date: Thu, 16 May 2024 13:47:15 +0000
Message-ID: <005A0B7B-2F65-4997-88B2-BDD86FC2970E@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU5PR08MB10657:EE_|DB5PEPF00014B9D:EE_|PAWPR08MB9029:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cea768c-e3fa-4ebd-9251-08dc75aeb716
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?NDB3cENPdGdMbU81cWNZUVFWcHN4YVBvMWVLK2JFZFAyallrYUF6TnYzL093?=
 =?utf-8?B?ZTg2UjdKNW41Q0pJOGY3WWM5U1FjLzJVMWExSS9EWjdSRW15bHN5ekkxUGk4?=
 =?utf-8?B?UkZubFFuQ2ZKSWExVUh2V3kwU20vdGNRalNRUERDOW5vUXo4L1kzRGNrTTBa?=
 =?utf-8?B?eTFyZEMvRnFRRStCb2FXM01mWlBOZ2hoMzhRSGZkUnlSdnJITHBlb2RiTmh6?=
 =?utf-8?B?YWQ2NDZ1Vm9jTzZEdmw0dnhUQndNTUNqb3RHbFJzTlQrRHJVKzZBWEpmWms1?=
 =?utf-8?B?RkplYUJlQXczbnU5dUptWEJjVytwOFlncFlJdXdOUFVGTzB4NHl2aEloRWtT?=
 =?utf-8?B?ZEJMQ3J5OWZTVW9KV2FhRVZISUNhalllaVh5NDJOU3RQSTdUVUhEdDlVc0lw?=
 =?utf-8?B?RjYzczhzbEhUSmtWQ1p6UE9XTCs1MnBsNEdCYVBQRVY5ZTdHRE43R1k5VlQv?=
 =?utf-8?B?MUFVdHY1U0VNMzhYOUpoY3ZvTEw4aGtKUzQwMzU4U2ZIczVCVFhGUzl3YVps?=
 =?utf-8?B?eWZEUXhXc2t1K2JOM3VEVWpocU5ZcUY3elpkeFlqSXJHT3YxR1g4a1ZGSEh0?=
 =?utf-8?B?bFc5aXhrT2NRejZnRytxYVlrSGM5NGZDZ0kwNFllZ0h0NE9CSEZWQ3ZZcmJw?=
 =?utf-8?B?c3NXb280eklNTGd3K3YxNUpReDU3cjB0YWhPbnNSNDBwUldRUUtlOWxBQWJs?=
 =?utf-8?B?SENzVFNXNlVzdHZPdytWMmF0d1RzM2ZLMUszbGNmcWhkdGpOMm1EVzZSUTdq?=
 =?utf-8?B?M0p1NDVwaEZPL2U4VlM0MGJSb3NrOGRvUm5xVk81Y05tV2ZpL1JmTmVrQ1pZ?=
 =?utf-8?B?b2JrczRXOCtiY1hjVkdHdlY1ZXdtTVF0RUk4QVNtZTNSZUZMWU9kbnJ3Y2Qx?=
 =?utf-8?B?SmMxUFFiQVczWkVCY3ZvL3J0RjlwZXAzbjRlUlVXQTBxaXltY28zREwrbUc1?=
 =?utf-8?B?Y3E2Yk1IVUhGNFFWUnNheXY4SjZmYkc0V05EMUUrZC9xbGE5Nis4WDNoaHFJ?=
 =?utf-8?B?bnEzcWZyRExGbzZXZEdMYy9ic3BwT212MjdPVTg0VWhnYnNzWjVQSSt5UWdr?=
 =?utf-8?B?bmhFTEdYK0VpMnpKZG9ONkpaalJFZmZOYUg1NGpUOThMdXFwWGw3cWg1SnlW?=
 =?utf-8?B?d0pROEZkbjYva2R3Z1h1SWhoajN0QzZKSHVWL3pOV0JKV2RTZnNlbndSK1dl?=
 =?utf-8?B?OGhOMGNwZGhBQWVlV3lTTURRYjBTOGRQSzN0UVBaK2xBYlFZWWp6VElOYXpq?=
 =?utf-8?B?SG5BbVc4UXd2NlVZQjdVMTFYS2tIcWlmeWRnRTRDN0RxeFVQR2hyS1o4MVlo?=
 =?utf-8?B?WjI3aitIS2xkWkRJOG01Y3NhandyenRjRmt0T1BJQmVmRHp1MzRLT1VlSjR1?=
 =?utf-8?B?SCtONld6OUtMdXZ0OGFRUjJUdHYyTzA3V29aSWFiNWpZcjJEN1FWMnZONWJF?=
 =?utf-8?B?dUptSXBlZmlMWFVjMm95VFovdk1XdWdxZVp0eXgxajYyV2oxL3hrQ3lVQ1hI?=
 =?utf-8?B?cUtpUTU5aGFzVnlPS1ZEZDFHVFZrKys1WGFzQ2dSTk41VEZCM3JqY3FrZllF?=
 =?utf-8?B?dmZZQ0tubldnYVRnQ2t3WnlLT3MrMzI4RDhoR2IxOGtIcFo0eVZ5QXU4VkJ2?=
 =?utf-8?B?a0VPbGd4Zkt0RUJ5bnRxSVF6ZCtFcVc1Wk8zVkFNajljaFBNSHloU3pyM2NC?=
 =?utf-8?B?N3E2VFA0QlV6aEpaRGRpc0NEREZnWnA0b09FZC9pd24zUUVPbDVUQ3V3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3570A0BFE930D469EAD69D536BB4F5C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10657
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a00a170c-21e9-426b-0b99-08dc75aeb1fc
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400017|1800799015|376005|35042699013|36860700004;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QWVLcGNkZkxIMDlIcnFRbDZtTlFmSjd6ams0RDFKdXhJTFBVcFVGVFUrN0NJ?=
 =?utf-8?B?Q1ViNHpNaHVoMzR5QjQzdEIwYldKTDNxY0xiQi9odzMzdTMvMDJuRmVPUXJv?=
 =?utf-8?B?ZVpQUTVOMEpFQzlHRGwxNEJTWVJOZlpOUDhnWGtnRE1mU25CY0grNUI2T2Za?=
 =?utf-8?B?eUtmQjhrSzltOGNYSHEyTGxiQjhOMEJtbWo0MlZOTm5IckdmODYzVHdCSy9i?=
 =?utf-8?B?dVhXNXZzazY2VmR5b2hMa1poRE5YLzhZL2RnUitEbXU3UWEyLzRXQ3o4MEpP?=
 =?utf-8?B?cGpQQkp3dysvMzIrU1JjSFFMaDV0dEJiNTdkcUdhK09wTitmdEJETGJ0R2Q1?=
 =?utf-8?B?WkZZM0lkTU5yN1JKYlJHeVFJVER0NjBOUG5uZnh6SWVNRmd0RXJBQkRSREpC?=
 =?utf-8?B?K0ZwdXNiSnd5N2lxb1BxMkc0aDdhTHdwa0QySEJJYm1HbU5Bc0RZM1hqWEJT?=
 =?utf-8?B?WDFvekZGQXFwVXNNSlVoVFJ2K29VZWRFU0Z6cUE1bVRobDh1THhCY1RNZlRp?=
 =?utf-8?B?b2VHVWMvRmRPN0RMcWhtRWFRdW9DTDZvc3lkeHFGTkRpdmFEQVBKYjJjbzk2?=
 =?utf-8?B?WlNlaEZKck04Tmt5VjNod1JyMDA2cGI0TGtoS2ppNzNERXJ3QnhsUEJ1Z2pt?=
 =?utf-8?B?OHp1eWw0MVhwVHhmR2U4Q0xDclJkQXV3cDc5RWdhQU9GaU9wdWdiUk85bzRa?=
 =?utf-8?B?YkpoSGhsTStzbUo4VEcrUWtJYittQUxkTW96MllubUIwd3N3NmtPR0UwTmdK?=
 =?utf-8?B?ZmhPVjl4cGNsS2RtN2VmLy9ZUVBKK2JLZHBIZ0VxcTZTWmlBK1o0NEhhaysx?=
 =?utf-8?B?WlBXY3o5OHk2dWtIWkFIWW5rcjRJTEYyOXVTTFBZTXphcVNDREJmS3NLTGpL?=
 =?utf-8?B?c0NGZnkxOVhGaDUySVA3ODdtR1R1ejVDRzQ3T3h3UFZKbXVmckFuaHJCUndp?=
 =?utf-8?B?NVhIS0RKd1pqWHlDNXVSMVRoUysyUExVZXZUSkxadC9UQVQxb0dsQ0dNaGVa?=
 =?utf-8?B?dG14NkxOay82TURDY1N3eXF0RlhTZzNyZEdoNXp6dWcvV1BhSnlhc2dUTHNq?=
 =?utf-8?B?Q0lLakIvTzk2U2Z6RWFETDUwR21ReDEzSEYrZHNuZGpCMEYxSGo5bVB1NGFS?=
 =?utf-8?B?djVoL0FnemRxNW9oL0UrbzRZVHlvYlVMcGFkT3h5bm9YakZpQ20zOEFvbzZS?=
 =?utf-8?B?cm15VllLcXRxTnhvKzV5QUEvV215YXBJS2RRZXU0ajdLeEI3UlFMSzFDQzBS?=
 =?utf-8?B?amJWbm9ZbFdEUkExWGhrS0xsa1JITEZtbkpBSXlLNnN4eVg5dnhORWgyeTBX?=
 =?utf-8?B?c1dJd0x0S2NVVDJHNlkvOENDSDB3OGVmOWw2T0UwcGlwUzhkK2FVN2xKejJ0?=
 =?utf-8?B?VVFIMGdua2V4YVdrT3pPeTVBcUlEQUxablRtVkx4ZTVMTU9wbHFhNEl0MU91?=
 =?utf-8?B?NFNZSzNhRjJsanE5MkhEWWozajBmcXJPRW8rOHk3Q01CYUdlVE1PMkR4dG5v?=
 =?utf-8?B?bzZzZ096dlNKeURHdkpIaWVCU3A0a3NWWTQ1MXZ1dGhEejE5Sko2Yk9senRD?=
 =?utf-8?B?V2hZcm5Pa1htRW1NZkl1ZFZFWVBTY3U4T2c1eGZQQ0lkdjZsT1dQL0J2Mi9r?=
 =?utf-8?B?aWZWS29TYjJYRjV3VEEyVThVek01Qk96Z3l0K1g2M0dLcVZIdmM0aTlUdWV0?=
 =?utf-8?B?clZBZDJVUW9nWkZaWFhCN2FVZGhVY1lhUWhSMkdJaGJDM0syVVl3TG9NN2hj?=
 =?utf-8?Q?6xmIi/NrUoCJjZtrsTqUjzVaPKr9W5M0JIOPmFS?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(35042699013)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 13:47:23.6236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cea768c-e3fa-4ebd-9251-08dc75aeb716
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 13:47:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199489

SGksDQoNCm9lLWNvcmUgaGFzIGFuIOKAmGlzb+KAmSBpbWFnZSB0eXBlIHRoYXQgY3JlYXRlcyBJ
U085NjYwIGltYWdlcyBmb3IgYm9vdGluZyBmcm9tIGEgQ0QvRFZELiAgQXQgdGhlIG1vbWVudCB0
aGlzIGlzIGltcGxlbWVudGVkIHVzaW5nIGNkcnRvb2xzIChha2EgY2RyZWNvcmQpIGJ1dCB0aGlz
IGhhcyDigJxsZWdhbCBjb21wbGljYXRpb25z4oCdIG1lYW5pbmcgYSBudW1iZXIgb2YgbWFpbnN0
cmVhbSBkaXN0cmlidXRpb25zIGRvbuKAmXQgdXNlIGNkcnRvb2xzIFsxXSwgYW5kIHRoZSBwcm9q
ZWN0IGlzIC0gZ2VuZXJvdXNseSBzcGVha2luZyAtIG9ubHkgc29tZXdoYXQgbWFpbnRhaW5lZCBh
cyBwYXJ0IG9mIGFuIHViZXItcmVwb3NpdG9yeSBhdCBodHRwczovL2NvZGViZXJnLm9yZy9zY2hp
bHl0b29scy9zY2hpbHl0b29scy4gIE5vbmUgb2YgdGhpcyBpcyBpZGVhbC4NCg0KQmFjayB3aGVu
IGNkcnRvb2xzIG1vdmVkIHRvIHRoZSBDRERMIGFuZCB0aGUgZGlzdHJvcyBkZWNpZGVkIHRoaXMg
d2FzIG5vdCBhY2NlcHRhYmxlLCBEZWJpYW4gY3JlYXRlZCBhIGZvcmsgY2FsbGVkIGNkcmtpdCBi
YXNlZCBvbiB0aGUgbGFzdCBHUEwgcmVsZWFzZS4gIFRoaXMgaGFzIG5vIGxpY2Vuc2luZyBpc3N1
ZXMgYnV0IGlzIG5vdyBhYmFuZG9uZWQsIG5vdGFibHkgdGhlIERlYmlhbiBwYWNrYWdpbmcgb2Yg
Y2Rya2l0IGhhcyBhIG51bWJlciBvZiBwYXRjaGVzIHdoaWNoIGFyZSBub3QgdXBzdHJlYW1lZC4N
Cg0KQWdhaW5zdCB0aGlzIGJhY2tncm91bmQsIHRoZSBsaWJidXJuaWEgcHJvamVjdCBoYXMgYmVl
biBxdWlldGx5IGJ1c3kgc2luY2UgfjIwMDcuICBUaGlzIGlzIGEgZnJlc2ggaW1wbGVtZW50YXRp
b24gd2l0aCB3cmFwcGVycyB0aGF0IGJlaGF2ZSBsaWtlIGNkcnRvb2xzLCBpcyBHUEx2MiBsaWNl
bnNlZCwgYW5kIHN0aWxsIGFjdGl2ZWx5IG1haW50YWluZWRbMl0uDQoNCknigJltIHByb3Bvc2lu
ZyB0aGF0IHdlIHN3aXRjaCB0aGUgSVNPIGltYWdlIHR5cGUgdG8gdXNpbmcgbGliYnVybmlhIGlu
c3RlYWQgb2YgY2RydG9vbHMuICBJ4oCZdmUgdmVyaWZpZWQgdGhhdCB0aGlzIGlzIGp1c3QgYSBz
L21raXNvZnMveG9ycmlzb2ZzLyBpbiBpbWFnZS1saXZlLmJiY2xhc3MgYW5kIHRoZSByZXN1bHRp
bmcgSVNPIGlzIGFsbW9zdCBpZGVudGljYWwgYW5kIGJvb3RzIHN1Y2Nlc3NmdWxseSAoaW4gYSBx
ZW11KS4NCg0KSeKAmW0gX2Fsc29fIHByb3Bvc2luZyB0aGF0IHdlIGFkbWl0IHRoYXQgSVNPIGlt
YWdlcyBhbmQgWW9jdG8gaGF2ZSB2ZXJ5IGxpbWl0ZWQgb3ZlcmxhcCwgYW5kIGluc3RlYWQgb2Yg
bW92aW5nIHRoZSBsaWJidXJuaWEgcmVjaXBlcyBmcm9tIG1ldGEtZmlsZXN5c3RlbXMgKGxpYmJ1
cm4sIGxpYmlzb2ZzLCBsaWJpc29idXJuKSB3ZSBqdXN0IGRvY3VtZW50IHRoYXQgSVNPIGdlbmVy
YXRpb24gcmVxdWlyZXMgbWV0YS1maWxlc3lzdGVtcyB0byBiZSBhZGRlZC4gIFRoZSBiaWcgY2F0
Y2ggaGVyZSBpcyB0aGF0IGxpdmUgaW1hZ2VzIGFyZSBhY3R1YWxseSBJU09zLCBidXQgZm9yIHRo
aXMgSSBiZWxpZXZlIHRoYXQgdmVyeSBmZXcgcGVvcGxlIGFjdHVhbGx5IHVzZSB0aGUgbGl2ZS9o
ZGRpbWcgaW1hZ2VzIGFuZCB0aGlzIHdvbuKAmXQgYmUgbWlzc2VkIGZyb20gY29yZS4gIE15IGVu
dGlyZWx5IHVucmVzZWFyY2hlZCBndWVzcyBpcyB0aGF0IHNvbWUgcGVvcGxlIHVzZSBoZGRpbWcg
YnV0IHRoZXkgZG9u4oCZdCBuZWVkIHRvOiBhIHRyYWRpdGlvbmFsIHBhcnRpdGlvbmVkIGRpc2sg
aW1hZ2UgY2FuIGJlIHdyaXR0ZW4gdG8gYSBkaXNrL3N0aWNrL2NhcmQgYW5kIHdvcmtzIGp1c3Qg
YXMgd2VsbCB0byBib290LCBhbmQgdGhlIGluaXRyYW1mcy1iYXNlZCBpbnN0YWxsZXIgc2hvdWxk
IHdvcmsgaW4gdGhhdCBlbnZpcm9ubWVudCB0b28uDQoNClRob3VnaHRzPw0KUm9zcw0KDQpbMV0g
aHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvQ2RydG9vbHMjTGljZW5zZV9jb21wYXRpYmls
aXR5X2NvbnRyb3ZlcnN5DQpbMl0gaHR0cHM6Ly9kZXYubG92ZWx5aHEuY29tL2xpYmJ1cm5pYS9s
aWJpc29idXJuL2NvbW1pdHMvYnJhbmNoL21hc3Rlcg==

