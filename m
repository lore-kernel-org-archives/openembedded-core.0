Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A05C27C52
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 10:53:52 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.79])
 by mx.groups.io with SMTP id smtpd.web10.11395.1717671224716959897
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 03:53:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=H0+hrl0N;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=H0+hrl0N;
 spf=pass (domain: arm.com, ip: 40.107.7.79, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=I9Scvsasi14H4QTMcftBM5M/hi2gpDTfoym5YciXJrcTJ/shUuHtCSeLD+LjP24LI7nZNRuU8ktYF/mI6DtWPXvK0XFzmCcDISvmUXTYe9tpOhHHSRl0YfAVhMQt/TrrEhPYiwm+yzulWCtpl+1UUHQv9fcn+dd9UmIKdWIwlknmhQQIxyAqlCFFu4+ZTRHC7k0EVHQC9I5QkYDb00kcOujfoi5T0LwfdNbII6Fn92y/dGb1S0AnV0+nTz4BmgZ/nL3f5S2HoHAlt58AUYy7BYTMwBM8ya+Vxydc1M22WnWws/W4EOBLCvcPu0a1DqYLmeKkyvb1r+2JMw9AxbpJ+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zypCTaiuAFpX/iZ1J/oPl0qER4m+3fVFewkxbScel2M=;
 b=cyIcomXdIuC3UwS3lUDkkMSajWtdE3VhNjwG4L7Rcf658HMjBbrW5LiH+thkWfmJBE4a4WCDxi/vqii9rA2Vy8paDoWnbmPaGCFEnCoxxWoQjw5fHSSj2oc95gPX5RIvSWLV2Dmu25kVaXP1c82FUucGK66HdJerAu0rE3iZGZDcVZ6CXhONlCuCJg4jJCVV+bOKI+XuwCY4E5nd8MUqV3NLTDckC6G7aI6HPQ5HAzeBtZU+JOzNCir8J3JuWO93OIZUWSJuLCf1DqYPvYXVZXbCCP9zVmO8mT8KsMtrA3681cyh6OUSUVugHfZqQxBr2Dqc++bGXpnXF/DHH5LF+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zypCTaiuAFpX/iZ1J/oPl0qER4m+3fVFewkxbScel2M=;
 b=H0+hrl0NNq/YG64q5MAp7ZiWzbrU8zd8tXX2wGBdJ++46EokdFFAeXG8Unu4vlTIH8kNLZ3n/gR/h5JtKsMvNPvcPslPV0CeUpxIjaeM5gbXqLnsM2oM7r5CA3bujTTC1m8959nZrYkfUNK/tods+gwbomkrNwoAsX5soKXbed8=
Received: from AM0PR02CA0134.eurprd02.prod.outlook.com (2603:10a6:20b:28c::31)
 by GVXPR08MB10963.eurprd08.prod.outlook.com (2603:10a6:150:1f9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30; Thu, 6 Jun
 2024 10:53:41 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:20b:28c:cafe::a) by AM0PR02CA0134.outlook.office365.com
 (2603:10a6:20b:28c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.16 via Frontend
 Transport; Thu, 6 Jun 2024 10:53:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7633.15
 via Frontend Transport; Thu, 6 Jun 2024 10:53:40 +0000
Received: ("Tessian outbound 58fd6e711286:v327"); Thu, 06 Jun 2024 10:53:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 35353dd30f18ed78
X-CR-MTA-TID: 64aa7808
Received: from dbb07fb10451.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3CA5CEF5-3840-4ABB-998B-4D9208698592.1;
	Thu, 06 Jun 2024 10:53:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dbb07fb10451.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 Jun 2024 10:53:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XU3eTmE+TkuU+WGJNkoHawZJsaNEP7RX09GylxfYCf7pyXIFRPEdO1Z35cjEWIutZemZ963z14QZ0Ikzg8p26+eREqeq5vW7W7BY3nSUgmgUGeOOp+E9bk+sPq26BysveAb9ckREPBWJ8iTQaLbY9BrCfYJ+N+3a+WTDSCgSAdkDRkJD1v4D0py6m1ae8w+oSmf9a7bTxYknNm5fnhVyHkG165BQVnE8NWHFKslsmQxAqMS3U9quo4nNV18VMFeJSOB4lF8/v63mEVSnD1pKx1xLcveFCCbakyCdxeEvi4HPYLwnUsKOW1NNrOhUgRf3abUsUx2p9wKaJhCBG+h8CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zypCTaiuAFpX/iZ1J/oPl0qER4m+3fVFewkxbScel2M=;
 b=DGfmR5r7nUu1Zyq5lsqYUabwDP/p6b7RMvb0QAMH8GtOjkzf9KB1q6HXYsgvv7lBcmI6IZap/puSIVT+PpojRBvia8m7I1JtAy93PcvkN3Z0wlIGEeLf7zl5aHgj+rAxtFblM7u8Gyzqrkx54uLSs78VEMKzsY7ks+SoZN+kCHajyXIp0z0LPfINrS4JPOLvG5eBUnu2jWW66T4omUtr8AcODMCZdzkLzSahvOAgn9z+DdB1JsFXVK6L2XwEXpKoHTgGOvlcXv0f69Bu65GXmjTvFP2Mimpm9Rb08OcIFDa7bzGPLBQNlqsy9VGO0Kyxp4lQppHLYVMOuxuhj5Op7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zypCTaiuAFpX/iZ1J/oPl0qER4m+3fVFewkxbScel2M=;
 b=H0+hrl0NNq/YG64q5MAp7ZiWzbrU8zd8tXX2wGBdJ++46EokdFFAeXG8Unu4vlTIH8kNLZ3n/gR/h5JtKsMvNPvcPslPV0CeUpxIjaeM5gbXqLnsM2oM7r5CA3bujTTC1m8959nZrYkfUNK/tods+gwbomkrNwoAsX5soKXbed8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB6320.eurprd08.prod.outlook.com (2603:10a6:102:e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 10:53:30 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 10:53:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "ecordonnier@snap.com" <ecordonnier@snap.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2] selftests: add test_minidebuginfo_qemu
Thread-Topic: [OE-core][PATCH v2] selftests: add test_minidebuginfo_qemu
Thread-Index: AQHat0rLaRLSSdiuyUeir7GhRlX9i7G6kOcA
Date: Thu, 6 Jun 2024 10:53:30 +0000
Message-ID: <D032FB11-0E4C-434D-AC54-0CDEBE18E5B2@arm.com>
References: <20240605131727.2647983-1-ecordonnier@snap.com>
In-Reply-To: <20240605131727.2647983-1-ecordonnier@snap.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB6320:EE_|AMS0EPF000001A6:EE_|GVXPR08MB10963:EE_
X-MS-Office365-Filtering-Correlation-Id: fb9e9693-33e5-4e1b-3f63-08dc8616ecfd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?REk4d0F2NWlUQUh2eXh5NmRreWxlOFJoVm1IMGdsdXloeU5YeWpwWUlRalB3?=
 =?utf-8?B?UGx2MXA2TnJENWdGVjY1bXBBbFRLOTRhRnM0TXNpU1N6MFU4dzRMTjRZNUZW?=
 =?utf-8?B?SitBVHJCUWtYaCtleGFtWExhREdLTm9hbHk0RWZjUnBJQkphTGhtRzZkQ1NZ?=
 =?utf-8?B?UDdud1hkK1NqNThVN0l1dGVMT0lNSWt3cXdDK04zZnVFSVBKa3ZEZUZQOWha?=
 =?utf-8?B?ZDBlV29tNC90ZU5vemZzeStrQURvVVdlUjVPWmFlTDcvL2NxYk9QbitLQjdr?=
 =?utf-8?B?bXptY1B1KzJrOE5wVFVzQ3N6T1llTi9nQmtWVWZWcTBtb2ZUMjQ0L0pKQmlr?=
 =?utf-8?B?T05peHlwdFR2L0tNUjBxRm43YzRtUWZHc2krVmt6SUowdzVCVGZBWExZL0hy?=
 =?utf-8?B?YzVzem9ZalZCc3hmaUNuV3k4RHRqMXo3MU96dEUxYXZYbjREcms0Q3ZtQjlN?=
 =?utf-8?B?dkpTK3NTYmlDYXV3bHNpTStYZUZVUlNBUENQUUZxeWFCdGhIV21CN2dDV0Ni?=
 =?utf-8?B?ZzdqaXcyNWI4VXArRUVxa290SUlwWlFYc1YzTElzSFhNYnljanVmLzdDNytW?=
 =?utf-8?B?Mmgxa014TEJLMlJBZnAxRUczWUpOR1M0UTA0a0ZqMG5NS09mRkJKTzhYeWM3?=
 =?utf-8?B?MFhXV214MVhKbWJtYzlDa1RicEx5SFhlZVA3cWJsQzhLbGtoL0NiMXhHaXNx?=
 =?utf-8?B?T1JmMU5WWC9Dbmh0czd1VnY4RnV4cTZTa0xYOWJNbTdiczVOYk9zTkpvWjJS?=
 =?utf-8?B?bTVZUGMvR2pMQlZEV3QzbHJiVFIrcGpzNFFUWjIyVVdNajNuTm5NbkMwNGJw?=
 =?utf-8?B?Z3d4RFBIUGY3UHhTSDlJZHhmcktjZDlvM2Z4eVU3TlNoZ1UwWjFOU1NZcVZW?=
 =?utf-8?B?WTJOZTVDVEJjeFJLRGJJeUhXS2xqam9jR29XMU96MmxhMjVYUGEvZzFXaito?=
 =?utf-8?B?NjZadXQ0M1JrQWljMVZYbGhUMGFkTUFQYjYxQXBTWHc4U0o4L0xWRzYvMWF1?=
 =?utf-8?B?Und3eS9KUHlZTUdHeDVkYStGU01vbGxhNUszN0FaY1VNT1cvcFVyT1pkSnJW?=
 =?utf-8?B?RWEvcGV6a0RHZWNDR0ROaW8xcUJaampBSXdMZ0RhTThFaTM3OExHbThZZFZt?=
 =?utf-8?B?OEE4ZnRXYTV5YXBPSTRGam55eFFEZ3RINmNyanBubVkycTZiNWcvNUtvUE1z?=
 =?utf-8?B?OVBteWRCdzIyVTh5TXNUUEU3MFpNb1c1M2lyUmR4MmorMXhzaWgvOUVXUzd6?=
 =?utf-8?B?ZGlpUEdnRnJUSGZydzZYd2dHYnE1TFcyNUNiQlZNZERSUnFyQ0RRV29rU0dk?=
 =?utf-8?B?NU10YjNXc2pNRlFjY3JtKzd1NW0vbEtFV2U1RktKY0pKbllxNEsxMVZrT0dS?=
 =?utf-8?B?Wkt0YklpWUNBbDFpVnhaekh0Nys5VUk4Y1UwZXhjQWhGTG9Nc1RWUitmb3ZB?=
 =?utf-8?B?Rzc4ZHg1YkFhdEppR0RqVTNHOUMzYXpMWER4TUZRT0grWGRHY1hhaXZBMWtz?=
 =?utf-8?B?TlN3VG80MHRsbFRTZExUTHduYmw4Z09qVmQyYkMxUTlxa1ZxQ3YxWkNNV3pU?=
 =?utf-8?B?d0ZTME1XakczNjlubWJzaUVmYnVIbkNVVWZlcU9RMUUwTFduUjJrQ0F6a1p1?=
 =?utf-8?B?aEE5bVUzYk9lNUpxLzVrbml6aUpRTG8xc1p1MDZzMXFrR2ZRc0JxcUpra3FD?=
 =?utf-8?B?NDRtRGE1VXhESlcrY21CZ1UwYTVIRFowYUFVTGVaUTN1enQ3eTYzRTlMTlJB?=
 =?utf-8?B?bnhwWkMyVHZhT1hsMGh4MURjV1FHRHVSQzZvUDZ1YlczWG0wQjJheWhvOGxi?=
 =?utf-8?Q?g9j1QeT/MGvTYyO6ygu0RCUrMCJQ3GAMHQg68=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9CDED70604A5C840AECC317474A88FA4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6320
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0d211f0a-2e3e-4eed-f475-08dc8616e70d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400017|1800799015|36860700004|376005|35042699013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UFZjZnE0dVpvMzRHeXBXdkl4MklpVzBQb3lUa09VanhuLzJWVUdVTGFIZS9i?=
 =?utf-8?B?QmluUWlFNXM4dTNlUVNpTURaNGFzMUpycWtGZU9oVjVlRGdFRm0weDBHMEJC?=
 =?utf-8?B?UmhpSVFLQmE5UG13RVZnUWVVcGZXY3ZseXlJTlpzOWVHQmxlbEVTTDBBMklt?=
 =?utf-8?B?VHpZNWViTU9RSkl3SWtHSUdqWmxlU0d2SXgrK3c5L3Jsbjk4WllySUFEL3Bs?=
 =?utf-8?B?bWVldUhKbmdtanZVdHBLbU9TaTA3RWQ0ZEJkU1NJZmJ6aW9EaDlYUHhkbnpG?=
 =?utf-8?B?bnZpWkwvcS8wcTZGLzhtZ1VDY0w3OTdLb0wvSXh4dCtLbDRxWGJaV1BqMkt0?=
 =?utf-8?B?RkxCcm54ckcwdS84c2N5dmNkRzdhOEJrbDlES0R0TlNVeHBDc0YvS2FYZ2J0?=
 =?utf-8?B?Ri9XSXo0cXRySmR6dUJwZlI2NURYMmZPYzE5cHA1aHVma0twSEtoUDZvVDQy?=
 =?utf-8?B?a21SUmZBelM2aER5aU0xZy9DNnpnRDVDenFpOTFvVkIrd1J3ME41dnoxSkxP?=
 =?utf-8?B?UEFjZmhndm1rckNDcTU1Y2kvMzBLa0cwSXFnUUZaejUxVlhqMVlUT0NaNGQ0?=
 =?utf-8?B?OE9zQW9qYmZqaW43TFJTcFV2ZkJ2c25DdVBvWmFma3Ara08zUHBvaVFyS1Zx?=
 =?utf-8?B?eFl6R3B6WDlaQXV4Y3d0UG9YMnRHN0hDZmhXNHZTTjFKNUJWMDVXazE0SmxD?=
 =?utf-8?B?NStlaXRram5pY05qSE9mWlFmc2ZmSHFCaWVDbzh3UGxOSnNlNStBdkVjV0hG?=
 =?utf-8?B?SUZ0V1lTZmVlajVyNXNBNHZYKzNYOGc0QlBPQWZQQlFFT2dxVjgyOGsvcEdi?=
 =?utf-8?B?bnJ2bnE4S2ZRYzVOV0QzdGxWbFl4bXNQa3JRaElmMzZydlBkdmZtNzZnelNY?=
 =?utf-8?B?MFpnRWRiQm5pU1QzUjhsVlZ5V1h1QVhIeHZNcHI5aUpSNmRnRHFoMmk4Y0Vv?=
 =?utf-8?B?TXl5TzNqSVYrRW01TmpEb0k0eW1xRXhSQ3h2UVFubHRxQzR6NzVzdEE0b0h4?=
 =?utf-8?B?aDhUaEF3Qlo0Z21OcWJZbTRDRkN5ekJ0VVBxYUVNRW9Jb0pqZlhHa0lMbFdQ?=
 =?utf-8?B?ODZtak40TWJOanNGcWdMWVBMUXFqT0JHRDU4T2x4akN0ZG44UlBSaldOUEZa?=
 =?utf-8?B?SEcyc3h1aHN0TkhXckJXd1RQVnVwNXptZXdkcFhyMnJybUFwR1VMSWZWR04y?=
 =?utf-8?B?TTB3NDlvZzB2blNaMjFYTk1pMHhZdWw5Nmhyb01lZGVqYm1wUmNjbGtRd3hI?=
 =?utf-8?B?aEdseCt2RUxtOUZjNDNVUisxR1dxbE9BL014TWhhRURnOFJZTzdqMGZQbE81?=
 =?utf-8?B?M1I5QnM5Z3NEcnl1UmdRM2g1OTBuRlJOcXpZd3BnTi9aUUlIS1pNL3QxOExY?=
 =?utf-8?B?dzRBbjZjWXVDOHFmMEY5R01QVjcvd3lsVlJELzZLaG1qd0YwMHM1VEN0dkpH?=
 =?utf-8?B?UEdicE01VWF2VWYwZG55R1dQR1R1M3AxUnlQM2FjTWhuK3FjbWljZjE5RHBx?=
 =?utf-8?B?RFFUc0NabVU3czBVYm5XRTRDMXUveWoxSTM3OUVieGMrekdJTXN4endReDRY?=
 =?utf-8?B?UTh0ZkVDUm1YVkhIM2xjTFVJejRITGY2ZHBBdzdiQzQrakhic1l1YlI0WWNn?=
 =?utf-8?B?WmtyajRRRjMzcmpSdHdiY1hMR1pPRkl6aG5qaXE0TFp5ZkxlREswaisxdVhT?=
 =?utf-8?B?OGExS0FUWCtZY2p3ejZEVWxUZERNOTR3bktEcGFmUGZkWlZZZktQY3ZBWXh5?=
 =?utf-8?B?OGRSdC9CSHBqenk0QkdZUUV4UzBlY0d4bmN1dlhINjJOUTJQRjNILzJmV2dX?=
 =?utf-8?B?QnZpQ1h5RlQ2WWRabWo1cXhnNGN3MU9QV3pxVk1KVTk2N1JVTzZqQjlqTkFr?=
 =?utf-8?B?VjJ5VERua3JRRGhZeDBzQlJJTWx3eXRMM0xDMmRpdHA5QXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005)(35042699013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 10:53:40.2565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9e9693-33e5-4e1b-3f63-08dc8616ecfd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10963
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 10:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200392

DQoNCj4gT24gNSBKdW4gMjAyNCwgYXQgMTQ6MTcsIEV0aWVubmUgQ29yZG9ubmllciB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyA8ZWNvcmRvbm5pZXI9c25hcC5jb21AbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZz4gd3JvdGU6DQo+ICsgICAgICAgIHNlbGYud3JpdGVfY29uZmlnKCIiIg0KPiArRElT
VFJPX0ZFQVRVUkVTOmFwcGVuZCA9ICIgbWluaWRlYnVnaW5mbyB1c3JtZXJnZSBzeXN0ZW1kIg0K
PiArRElTVFJPX0ZFQVRVUkVTX0JBQ0tGSUxMX0NPTlNJREVSRUQgPSAic3lzdmluaXQiDQo+ICtJ
TUFHRV9DTEFTU0VTICs9ICJ0ZXN0aW1hZ2UiDQo+ICtURVNUX1NVSVRFUyA9ICJwaW5nIHNzaCBz
eXN0ZW1kIg0KPiArVklSVFVBTC1SVU5USU1FX2luaXRfbWFuYWdlciA9ICJzeXN0ZW1kIg0KPiAr
VklSVFVBTC1SVU5USU1FX2luaXRzY3JpcHRzID0gInN5c3RlbWQtY29tcGF0LXVuaXRzIg0KDQpZ
b3UgY2FuIHJlbW92ZSBtb3N0IG9mIHRob3NlIGxpbmVzIGJ5IGp1c3Qgc2V0dGluZyBJTklUX01B
TkFHRVI94oCcc3lzdGVtZOKAnSwgd2hpY2ggd2lsbCByZWFkIGluaXQtbWFuYWdlci1zeXN0ZW1k
LmluYy4NCg0KUm9zcw0KDQo=

