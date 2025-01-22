Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BF8C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 13:40:21 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.59])
 by mx.groups.io with SMTP id smtpd.web11.43446.1737553217357706618
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 05:40:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=aBdqDKWA;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=aBdqDKWA;
 spf=pass (domain: arm.com, ip: 40.107.20.59, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BovUZA9Z9sZ9F3Z0WNa3xcLYHGcPyEA7KoVQYyhRvkRrm/es+wW5Z0SNbIUpzAxHtgLLktovs/80g7rQSHRdRqhoaEL6J12eioVp50Zt9auFynXov3BAa8AA+FJ5zc9WivHfCuSNKDgJbr8hT+9ug+o3GhxZFQ5TBAkfsPW4jhVCkoxdBI/vuuxCrRFEeyGX+D3tBvntlxJ6lv5yXu8rQdado2Ef3p4P4L0O7DIrbXXM+YiBkxtwKK03V3nSIgyL4O5kVvnFq1dFw36BRgc6n5zgCjgqiiWale+MlWlSnyETKVy5opxmncnB4P4wW+bsq2iwKprXQDfW1bMfPUk9ww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRNguxAlKCwa3McAr//qdk8yzVhi1tokK5Hw/zf1LCE=;
 b=ce8Ns93/cu4wVXT44l5YcgJmBkVBPKAOtECanCXDqBcMHPoAm5wG8KwWNfnqYRkJjYChVxzP2lJAElPwOL0frmbx+bCbJ4+8A8kUKUG1U3D+H+Ax2uC+oZrEAt7Ev/Wr3EPg1OFkwuKZ2oYn/sru0rf10br5xUAWyy3339PRlu1ODoeLkmo2RlgbEun+XI6xUxy/xMyvV4Mr4R+vvkU8EHfttMp8IUiAOzDTQaXXH0L2lDTKmZ8TJlAK5/k9QrO04F9cwreOojR3aGlEatOUmetB3oPV4GZQnwJjfQEVP2cYp2TOYGAdUevED9DnZjolu1Z7rRubgl3+5ICBcixjVQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRNguxAlKCwa3McAr//qdk8yzVhi1tokK5Hw/zf1LCE=;
 b=aBdqDKWAsz04ZnQFATLZ4IVcvPst+V3pDLU7uw2uVyHYJkSWYFgtYYw+mkes7eSevOCQQq+ISiJmAr8ENvgeyb4/LB+YmGWvB0/Pn8EZVKbr9/T7YgjlW9XyAPk8s5XYXDpxVE6QIntuvA1ZycZgZvs5ARVnOvILz9oJGoYIYd8=
Received: from DB8PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:10:110::17)
 by FRZPR08MB11048.eurprd08.prod.outlook.com (2603:10a6:d10:13a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Wed, 22 Jan
 2025 13:40:13 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::8a) by DB8PR04CA0007.outlook.office365.com
 (2603:10a6:10:110::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Wed,
 22 Jan 2025 13:40:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.8 via
 Frontend Transport; Wed, 22 Jan 2025 13:40:11 +0000
Received: ("Tessian outbound 29bc2c4ca0fe:v543"); Wed, 22 Jan 2025 13:40:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2e36bb61fa56777f
X-TessianGatewayMetadata: jOao3xgcYuO4z1a0t+sVF2o8p20ITunMwcfqiBXqqAlIvdCCtOAs3bhAQN6uGaf/WIgXYw7CoQVpp/vJaoerUM5sVbCL4Xe8OzkCS68qMg/lP3rtEMrWqmYSczspg+ev71VN1MljW7LznKLhIk/GvrqzBd031gpUzUafK+cD7gw=
X-CR-MTA-TID: 64aa7808
Received: from La3b7837b00ad.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EAA1AE92-5C7B-41A9-929A-2EBA06C091D3.1;
	Wed, 22 Jan 2025 13:40:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id La3b7837b00ad.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 22 Jan 2025 13:40:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mUk3f45quuuoaUqvoPygt7LmMa6VCH1H0RBrqa+KIkuxBG7pLSiCVdJ/fOqq8c3mW+Q54TcyaLga0BAZFLE+KuhkHnHmjwwUaJYWpA4iZwsfj9vmX8TrbljexA5jERUC9k0ho71K1I+RPhz2Kx6QN7HXOkNbWoWz0HIII8YRbAz94PVFQQEcTuzILOuIuKmQp29WYBu7ip/nZN18Ac30EjMNa1k4TsigxPZn8XzeNX6+VSTZ0mFEJ7yw6RrjLNOAydzWYemZDzPSpk+g7uB9fhSDriCstzAhyiznvrUMHBA/ctEkryVygBJAYtGWlxJTmja60/7VtNtHZNSrda/uDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRNguxAlKCwa3McAr//qdk8yzVhi1tokK5Hw/zf1LCE=;
 b=nDWJABsWaFVq7+2gDF4CxMHB8Luf6CiCzSvznHywz0EZV0/PUa1YXmQzUYq9eedXBzieW+CwCwqHmLdz75p/el+4L4qCRaGP3VJNU1sOrey/KmP00X59xeHMMepl4tgjB4pG1T6mS4Q1ec/MCDAeBQp1Lfe3t60DKTpMPXLtt0Z9BQ5ouKgn0eAEnlAs1Ccq59hGrYyjnINyyj+zfApfV1d1EW4GDkkvmovs44PYbbVJsdVMc9bEDi/vUi7unNXRbm/wLKWjI07hviKs+vv/08aX+Ad/KTsPIUCRgsSJOLldTKm+pgo3P0PYgXBCpw9mEsvZzEknr548ZoC+J1lPDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRNguxAlKCwa3McAr//qdk8yzVhi1tokK5Hw/zf1LCE=;
 b=aBdqDKWAsz04ZnQFATLZ4IVcvPst+V3pDLU7uw2uVyHYJkSWYFgtYYw+mkes7eSevOCQQq+ISiJmAr8ENvgeyb4/LB+YmGWvB0/Pn8EZVKbr9/T7YgjlW9XyAPk8s5XYXDpxVE6QIntuvA1ZycZgZvs5ARVnOvILz9oJGoYIYd8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5579.eurprd08.prod.outlook.com (2603:10a6:102:8c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 13:40:03 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 13:40:03 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Harish.Sadineni@windriver.com" <Harish.Sadineni@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Randy.MacLeod@windriver.com"
	<Randy.MacLeod@windriver.com>, "Sundeep.Kokkonda@windriver.com"
	<Sundeep.Kokkonda@windriver.com>, "Shivaprasad.Moodalappa@windriver.com"
	<Shivaprasad.Moodalappa@windriver.com>
Subject: Re: [OE-core] [PATCH 1/2] rust: fix for rust multilib sdk
 configuration
Thread-Topic: [OE-core] [PATCH 1/2] rust: fix for rust multilib sdk
 configuration
Thread-Index: AQHbaAtNGDmuWT+/DkChNJZnBj3YLLMi1iMA
Date: Wed, 22 Jan 2025 13:40:03 +0000
Message-ID: <384A6F6A-CD7D-4A89-B312-EF72753C10CA@arm.com>
References: <20250116113843.1817918-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20250116113843.1817918-1-Harish.Sadineni@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5579:EE_|DU6PEPF0000A7E2:EE_|FRZPR08MB11048:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fd97009-192b-42f3-e89d-08dd3aea4b5b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?clZ3QWxNd0FPbFBzdzlvMmVVT1FFQmlBTUFPQ1ByQWduNXJ6RFhKd2pxNlU1?=
 =?utf-8?B?eDdnSlcvUFUvQVdqL3NOaTE5WTBvYzZuMDBZRHdnbVp6aEtYendyRzlNUitR?=
 =?utf-8?B?RWF5RE0wQnR4R3JrWVhRekpGVThCWGdZRmxIYTB0UjJIWWpVcVFOblhPVkJw?=
 =?utf-8?B?Y3ZjUDZBTk5SRlV4RUpTUEFwWXFyQ1d3b1Jxa2NQVDVBMXhRYnpxRzduTk9W?=
 =?utf-8?B?VGtiTkRkWGxzVnRBeGk5aThnU1F1OTk2ZkZPWEZqeC9HbU9ieUlQR05JWjkr?=
 =?utf-8?B?WHpoeTFxSnp2OHlaSU5oK3lwR0xSRDRtZHhnc2NsVW5rRDVZOHlGS1lyelda?=
 =?utf-8?B?TGl5S3JXVkNBaUh2THBSbExSSTRwTk9zQTNHSlZoNGttQVNIWkYyK29FUmsv?=
 =?utf-8?B?WU5HVzZBNC9scnA1d1NDbGQ3ZVZtT3c5b3VqU2cwZ3poS1BNdTlMNVRZYVBO?=
 =?utf-8?B?ZEdNaEpiallNdGlMNDlPYlE3dGRESWQwVnhBWHlXcCs3Mng4THBNVXhNcFZH?=
 =?utf-8?B?Q0NTZUJ2Z0lRN2JVcmwvQTV2ZHlHeGY0MVZpOSs0bFVlRE1telNKQmRySE1Q?=
 =?utf-8?B?TURsdzk4a3RqbVpJbzVWWjdJaDNHWnkrNGtrdjdWY3lWaGpyS0pScEg3azRJ?=
 =?utf-8?B?WmNmMStwRndLanl4NkhMMHNYRlYwNXdTZHI3UDh5TWxDSnlmUUdadnNLcEp0?=
 =?utf-8?B?RUplYUFkL1YxWjVsWHY0ODg4ZC81UExmTGpKTVRMeUwxZUZsVjk5YUw0ejIr?=
 =?utf-8?B?aUlYSFhhdENGSHJ0azFFb011UDF2THVsWi9BeFVEMmxNd1VoKzdPTEtyWlE3?=
 =?utf-8?B?SVV2QmNkSG5uUDgyL3RFekhVVGIyNllJNnVDNkttRERMVkNYNGlYZGZnM1RY?=
 =?utf-8?B?TFEvc2Y4aVhsakY5SkFOQm1CUFZtYVRlaE1FOElkN2hlOHpOVHZSS1FVWnhj?=
 =?utf-8?B?UFpQWDB5T1pHdzBxeXNRaDNGS25OVE9JcGFSSzFJTDNYeUdIclBYeGJ5aDU3?=
 =?utf-8?B?ZXF1STh4Y21sSjArekh1OFE3aWlEd3VXdXFhdzZlUkJZTEF5MHgreGx2THJM?=
 =?utf-8?B?OGxlSXBjMnVkUWFiSnRFTzZBK3B0bHNqVlBXZGJqNFh5NEpHK1Jpc2UzMUpy?=
 =?utf-8?B?VytNZU9jKzVGYWhuZ05QY1laT3RaL296KzZYOStHVU5CRnFnelpXcXE3ME01?=
 =?utf-8?B?WTlwaGpKVjhXMFAwdzY3aGNjRGdTR1FweVdaL1c5ajdJNUxydlRiYXhJK1J5?=
 =?utf-8?B?ekhWN2swdVNINWdMNFROVDZWdm15N3RNZGl2UzR3NUhGTDZIWEwzZXpMME1L?=
 =?utf-8?B?Nk9nbGgxdDZMY21XUzdrYnRYWDlJVzRDVlgwMmQxOW5OYko1NGpMTnpCa0tt?=
 =?utf-8?B?RlU5S0lzRXY3ZTR0eXZJd0NDRkhvbG02WTNNbXcrR3lVT3NQL0JJaTNwMEJW?=
 =?utf-8?B?aFdjYTBkSGNKSXRUbjdkbFQ4U1d4RnRHcmlKbGtrTHU0THd1Z3BJcURSWFdM?=
 =?utf-8?B?TGtuZmE3YzdBLzF1S0FLZ3VjZmY3WHBOd01wdFBkcWdkeE1GVjFmZnpQMGpJ?=
 =?utf-8?B?dzd1LzJRTTVYUENqZi9La2FDUGdHdndRczEvWFJMYlhBaXAwVjh3Y0w5SGUw?=
 =?utf-8?B?VXM0MlluWk83MktLczFha3I1aG50Y3BlYVJZVDYzc1dWOFBKNE9yajFEN1lL?=
 =?utf-8?B?R0NGdC8yYWtFUGtzYmxKOVVQYVgrM3NxTEtnRlRiYUpmQ2E2NzhxMVk5bk0r?=
 =?utf-8?B?TVEzWnF5Qk1vQ05aUnhWTU9hUWk0OFRlQ3AyUE9sZnZvUXR6ajlTVlNqVE5a?=
 =?utf-8?B?a3B2Q1ZSNGVtNytGZGNKc3BGQTBSSEtGNlZicWkyMDVXZSt3ZHE1c1BFYkI1?=
 =?utf-8?B?aDlHRENZYzU5LzBHY2xJd0E5dkw0cHppYW5uREFtdy8rUW1kdjBqSDBZSFdQ?=
 =?utf-8?Q?rcrwNGm2EG0cl7rXfVwijA6gr19cH5FW?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2027FBFF331694FB83EEA81CA5E0D45@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5579
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	990dd7b5-512a-495b-c6f7-08dd3aea4649
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dXNDbnJsOFJCaG9Sc3V3UXg4S3RHRVFORDRveUhSMXc4OXE0YkhuaVNhMWlM?=
 =?utf-8?B?aFJPVFl6bkRsSTFyMU5LbXYyaXRKOFhxZnJTU1BDUW9wUDlldWFVRVJ1cVlD?=
 =?utf-8?B?TnNQRFk1S0NrM1hEUDNzdWJvdy9ORHFYWUVPSHo5MnlxQTVhRUlaaDdrRzhU?=
 =?utf-8?B?RGVCSnl2aUpBUmNHMWJjckkwaGExcWJ3bHc3OG1zTzNzM2Urb3RCVEQrR0Ni?=
 =?utf-8?B?UFduQUdFSm5oTGJZMUxRS1ZFKzViTmgrV3dPa29kVlRHNXZTM2tOMURLNlhm?=
 =?utf-8?B?L3NZa3hQcy94V29jTDhKaTdEN3A1MGNoWkwwYy9MSEpBWVJPSlJJaFBqSURu?=
 =?utf-8?B?VWxLU205cFFzTlZhU3VjZmRpeks4bWN1SnhlOEZrWjE4ai8vMVlrR0ZMVEZ4?=
 =?utf-8?B?b211eklkdEZHSjM3SmZkZlhjcExlSFY0U01wanB3YlExem4zMnRuNjNta2Rw?=
 =?utf-8?B?b0JacFIrRS82a0FwTjh4Z0FCT1JOR2N5VGIrbGlWMXdNbVl6bVc3VStRYjRD?=
 =?utf-8?B?WmFiOXZ3UHBRR3dkU2M0MEdIci9MQXlyWmJiRm1DbjRhV3JhZ0JaUU1DY0tx?=
 =?utf-8?B?RzJPQWZId2g4dy9VTk5PK09Bak14WjlwdlErTHhsaGZGbGxIYVprSXpxUXJ0?=
 =?utf-8?B?VFpjbDM2ZnJwWk9kbWdMNTNyWHhXWklBTythVk5kWURnRVFvZG1GcFQvOXN1?=
 =?utf-8?B?N1o2Q2ppblNjQkdtdkpjSGVxdExjREdmdTBjL3MrQURmUGs4d3pCRG55U3pU?=
 =?utf-8?B?Y29GWjZGOWtrd0ZKQ2REODU4MmxNM3hQb08yYnUydERkUkgrNXJnU1R6VFlN?=
 =?utf-8?B?TUZocEpsSkNiRmVQdFBwY0IrNFE2T2VXTnVmdUVVRlZwUUNjY0doaVB0UFg5?=
 =?utf-8?B?ZWtBeUpWUzhldVdqZDZtT0lBcFFPZWJBR1N0SGNHM3lieGdVTitEWGREb0hY?=
 =?utf-8?B?djdPc243cmpjZXRXdm9TVmVWc3cvK0xuNFZ0TUplY2lFMkNWZ3FZaHFvQXdo?=
 =?utf-8?B?OXYrVDJ6L1FVdWIxcHFTZlBYL3hqVVpnZ1JYaXByblhPM285YnR3N1JaQ0dC?=
 =?utf-8?B?aUJhUmVvN0U0ZVJoN1F4NUs5VXpzbEdWOVlUcnliS1oveVpyek4zSU56VWM4?=
 =?utf-8?B?Ym0xdTRIQUJXZDJiRHRFaWVnRURuc0xlazVmQzZRVDBiZm41NkVZQ2lETXo0?=
 =?utf-8?B?TnJpSWNWMnIxU0ZQTGFIbzhNWnV2cWkwcUs4eGVyL0lsK3JvSG9RUTUxb1Ry?=
 =?utf-8?B?MUc3a24rbXVMaEo2Y1I3RG5oamxzQjFlV2NpNFJCdWVjK0JsRWpRRDBlZXVT?=
 =?utf-8?B?Nm9LYWZXbXJQaXRHa3Ewa2NONVM1NnpiMlhVNm9NVGlTeGR0MCtMemxBOU9h?=
 =?utf-8?B?S1ljS2Fod2djTTdXK2JadVhSbEZucVc2aUZ6Y1ROcndFZ2l4aVJuUkR6cm9j?=
 =?utf-8?B?aFJaeER0TVBtOWdlVEwrdVB6dmFNU3dRYmRlOVVCdHc4eWw2SVQyci9pSklH?=
 =?utf-8?B?M21ObzlZYUg5WkptOENJTzNqbHBaOHI3K1AzcGI5SXAramgxa1JESWlCdDZt?=
 =?utf-8?B?K3pJNGp3VUlQVDEzazc0U1NyV0N3UjVIdHMxVzdJTjVNazVrcHo4S3ZmOUQv?=
 =?utf-8?B?TllVMW9HbW52TG04ZjQ1RTVDdUVwZGhCejJPUk91aHVMNU5sekk2QzhUaUUz?=
 =?utf-8?B?OCtZMjJCMTN6ZGVUWW9GY2RIZlZHQkZLZFlhMXRIakpPRGs4V3Y3cDZHbHIr?=
 =?utf-8?B?dEt2VUJHeUUyeXJ1anI1R1VGNVNsVWRrVlpmek1aTHpIRm0yNzFvZ09kWTl4?=
 =?utf-8?B?WWJwM0Q0VjlveVhKaWhVVjVwTGQrUXhOWnlwTEcrSVdmVEhiVnRTTEhDTVNq?=
 =?utf-8?B?WjBwK1FvMlhIeGFYNFpRMjZzVUtWZERXM2R2UVFiSTF1aXdKK3F2elhsMWc3?=
 =?utf-8?B?R1pLaHJJNEpXWkNmakNxYWtxS2pQbjhsNlpZaGVBQmVWUXJhdmU0WXA4MXpr?=
 =?utf-8?B?UW96ZDFXT0RnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 13:40:11.7395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd97009-192b-42f3-e89d-08dd3aea4b5b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 13:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210151

SGkgSGFyaXNoLA0KDQpPbiAxNiBKYW4gMjAyNSwgYXQgMTE6MzgsIFNhZGluZW5pLCBIYXJpc2gg
dmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPEhhcmlzaC5TYWRpbmVuaT13aW5kcml2ZXIuY29t
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KDQo+IFRoZSBjaGFuZ2UgaW5jbHVkZXM6
DQo+IC0gUHJlcGVuZGluZyAnJHtSVVNUX1RBUkdFVF9TWVN9JyB0byAncnVzdC5zaCcgdG8gZGlm
ZmVyZW50aWF0ZSBiZXR3ZWVuIHRhcmdldCBzeXN0ZW1zLg0KPiAtIE1vdmluZyB0aGUgbm9uLXRh
cmdldC1zcGVjaWZpYyBlbnZpcm9ubWVudCB2YXJpYWJsZXMgdG8gJ25hdGl2ZXNkay1jYXJnbycg
YW5kICduYXRpdmVzZGstcnVzdCcsIGluc3RlYWQgb2YgYmVpbmcgbWFuYWdlZCBieSB0aGUgY3Jv
c3MtY2FuYWRpYW4gcmVjaXBlLg0KPiAtIFJlbW92ZWQgdGhlIHJlZHVuZGFudCBjYXJnbyBjb25m
aWcgZmlsZSBmcm9tIHRoZSAncnVzdC1jcm9zcy1jYW5hZGlhbi5pbmMnIGZpbGUuDQoNCkNhbiB5
b3Ugc3BsaXQgdGhlIGxhc3QgY2hhbmdlIGludG8gYSBzZXBhcmF0ZSBjb21taXQ/ICBNYWtlcyBp
dCBlYXNpZXIgdG8gcmV2aWV3IGluZGVwZW5kZW50IGNoYW5nZXMsIGFuZCByZXZlcnQgc2VsZWN0
ZWQgcGllY2VzIGluIHRoZSBmdXR1cmUgaWYgbmVlZGVkLg0KDQo+ICsgICAgICAgIGNob3duIC1S
IHJvb3Qucm9vdCAke0R9DQoNCkkga25vdyB0aGVzZSBjaG93bnMgd2VyZSBpbiB0aGUgb3JpZ2lu
YWwgY29kZSBidXQgSSBkb27igJl0IHNlZSB3aHkgdGhleeKAmXJlIG5lZWRlZCAoaW4gZG9faW5z
dGFsbCB5b3XigJlyZSB1bmRlciBwc2V1ZG8sIHNvIG5ldyBmaWxlcyB3aWxsIGJlIGNyZWF0ZWQg
YXMgcm9vdCkuICBQbGVhc2UgcmVtb3ZlIHRoZW0uDQoNCkNoZWVycywNClJvc3M=

