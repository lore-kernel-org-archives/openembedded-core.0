Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9A7E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 14:59:40 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.49])
 by mx.groups.io with SMTP id smtpd.web10.58488.1734361171059286745
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 06:59:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RJpH85Hx;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RJpH85Hx;
 spf=pass (domain: arm.com, ip: 40.107.22.49, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=h1lRcny8u7MiaIbgSmJNoKs0GxxdSYS34XhqVTlJA2YntN4jIb4D690defd7FCC8HD/S7Sbfurmjy+/TPIRV5UXYVk0H4oubqdcv9XkRyeJvDzlGeQ374eb17rPIgrs5UJlUzz2t8wnazbi0LHwpiEMSebZFWmpINMYuZkWIfZWQ7Y5+6lVA22IwFDCVeiHatjSvIqgC1Y2IouNEaLo6rZD6BRK8gYu5rm2upVMFuPB8r6eiA/EOfyey6zeVa+Jvbt+dIH7rx7hb6g20xCx7lrPpgCVMmK8Hh8UQXHl4WLtB5TCGIsPNIKe9oUxhrUFu6Fk4AsVbMrQvct6MODCVtw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VUyjN6kCN+wgGrBMU+xPhwVupUNjpdhwX2OhDWJkvww=;
 b=ycty97e5pXFF4NyGRrhM6KU84WhkK8D1hNWG2DdIOSGlcDVCLsDqG+RN6b+85WvWUBmnJAnHZVfCH0wQDk6lH8lj/ZiBr3tv4WLlY7YRMc4ui1nLDnOaLPHNEU/9ZVXw0vgPhhdRpXZhFChmmb8eHGCP1JaHZvWS52CD8zRm5LDfUB5Ap6FDDGn7VnaoBKycPzb1hcgPyYAcdNU2loa2gcRi98yTpdfrY66q2bbg9Rdp6l6E+LAGVbFmxdtdL8Rog11t92/bFbyJmnd/3VfZYqkYRZh0N9Pm4VDvEQc1GJ/SHCVbbaNghAaMgdS2JBszkUV78W2UhMoOnD2Nh09QZw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUyjN6kCN+wgGrBMU+xPhwVupUNjpdhwX2OhDWJkvww=;
 b=RJpH85HxtPjGhyK9DT3MMMRqNMvFjcGUg1eAkkMFXZqqnSMsD+hU3A0KdC6w4ksqZZqJuyv+jLAP/JxZ7iIfDDJAbhS3n92TD+tvo1jpS4uhlMcjN/+fmZkgiOkYQIEXFF6x7wsTDlksaZY/fxwnagh6JSS9N1qKYiiYA+m7o3A=
Received: from DB7PR05CA0017.eurprd05.prod.outlook.com (2603:10a6:10:36::30)
 by GV2PR08MB8510.eurprd08.prod.outlook.com (2603:10a6:150:b1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 14:59:23 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:36:cafe::32) by DB7PR05CA0017.outlook.office365.com
 (2603:10a6:10:36::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.19 via Frontend Transport; Mon,
 16 Dec 2024 14:59:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Mon, 16 Dec 2024 14:59:23 +0000
Received: ("Tessian outbound 6a902d9511f9:v526"); Mon, 16 Dec 2024 14:59:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 17b06bdf1d02cdcf
X-TessianGatewayMetadata: 54DrQ9IneaBQZkFswXlB7ePf+JJNaavvCMEVkvB24R68IQMBmGlNcYfZkOd66Gmre7x+YywaSNLlxD1Hbwsh0/AanClrlAWEsjAbxfP29QbsetYhXl8oZDmwz7b2Zj4/gQr77qG0nDOT1gVG5Me+UCUh+VLnWQk7jISbV7XNBug=
X-CR-MTA-TID: 64aa7808
Received: from Ld6b636da6734.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EE9A87DF-A281-400F-BC14-89667396C486.1;
	Mon, 16 Dec 2024 14:59:16 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ld6b636da6734.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 16 Dec 2024 14:59:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fABllctFQTVt9c7QSnqAYIkwolnJQgYqFw9rkz9TSxMRC6P+qYWW8Z2yvkCEUO/e77k5dOky1gTyndguJyKM8hSnsp81sNWRP0+Rkx41iwNp81Ff5nTo374tLeqXpce4jahyg6rFpL2ZaRh6+6kVe9+qieZRz1PJhpn1OmH+m/s3Ok0t0uzvgXYmpQ92aG+JBhLPRgW3ExmE15pfSrCIKUI79WjjtKPuC1M1gHqFzieXu0aSngb0ii1/+Ok0AoBL/BNqHBoFYSCRTyFSI/GfzOi5ut4HSMDU6J4qAZk0PjXOHJuZS3DqJ9JurD/Ob+sBwz2/YME4Nl6XcBuXSqSP5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VUyjN6kCN+wgGrBMU+xPhwVupUNjpdhwX2OhDWJkvww=;
 b=LunpWRNwy6JMADMy4GaRB+WbdJe98idtV6JWZs6ytBpd949cguG9t/Truo3+WB9Dzhke2q3OEaqAs+hBaWP2wkArBVfGobyO09dqe66HvmcRCaYnfoQbKw1HUkRWtDBEz3WYANSp31Uu+Q/6Rh35ZDuZDCT8QMTEHz70YVm23SZfdQX5b8T3SxlocnStJ/sAnCp8sRWqJyDIDzlcej/AIMiZ1Be+1HiL2f1GpOH76XTGWK5nP6ii3z4u8rmQSkd6bVSzED90z0ma2Iy7FkdpNr1kp+R5QMfm+4LpYW72d7SYHzVi8gHkuss+9gi7OZ6wW4Q9EfdHQG6K/jjE3ebVWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUyjN6kCN+wgGrBMU+xPhwVupUNjpdhwX2OhDWJkvww=;
 b=RJpH85HxtPjGhyK9DT3MMMRqNMvFjcGUg1eAkkMFXZqqnSMsD+hU3A0KdC6w4ksqZZqJuyv+jLAP/JxZ7iIfDDJAbhS3n92TD+tvo1jpS4uhlMcjN/+fmZkgiOkYQIEXFF6x7wsTDlksaZY/fxwnagh6JSS9N1qKYiiYA+m7o3A=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5557.eurprd08.prod.outlook.com (2603:10a6:10:1a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 14:59:14 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 14:59:14 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "rybczynska@gmail.com" <rybczynska@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Marta Rybczynska
	<marta.rybczynska@ygreky.com>
Subject: Re: [OE-core] [RFC v2 0/4] Allow choosing the NVD feed
Thread-Topic: [OE-core] [RFC v2 0/4] Allow choosing the NVD feed
Thread-Index: AQHbTGLHhkKfBriF4UyuffEmzPmCRLLo/VGA
Date: Mon, 16 Dec 2024 14:59:13 +0000
Message-ID: <B9D4F85A-EFEB-4D83-8090-01753565B29F@arm.com>
References: <20241212065435.15582-1-marta.rybczynska@ygreky.com>
In-Reply-To: <20241212065435.15582-1-marta.rybczynska@ygreky.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5557:EE_|DB3PEPF0000885A:EE_|GV2PR08MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d9dafb-dd8d-492d-38b0-08dd1de23a41
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?U2pCVEg1TWJkZTRJQXM0cWIxRVMzOHM3ZEFQY2ZacUFGV21nWVRsWm9IYjJ6?=
 =?utf-8?B?WWpEeUQ2K1hYWHhoZ1R4cjlYSjhtQUh0LzZ3SnVXSGRpdVgwK09tamo3YXdl?=
 =?utf-8?B?NjhUQmJObWpVQ1hJVFg5Y3BJUk5nMUpIdFA4UHJaV0JISlhQQ3JITUNkSnYw?=
 =?utf-8?B?NjdlWTV0OGVUdmZ5STJPSDBtRWw2MTdGU1YvNi92bkpMRHpZRFh6WXl5bHdu?=
 =?utf-8?B?Mm9VU3p1bXgrdE1LVEpnUWJnc0FTTHJtdjJUN1NxT3NRUzdab2IzRVExTTBY?=
 =?utf-8?B?TitQSWc2QUYrUmZKNnlYM0Q0djROY3d3QXVsRTdJNW50N3gwM0d1bHZNcVY5?=
 =?utf-8?B?UGxXbXJUNlAzWWNtdi8xMG1QZ3ZQUFlMM2RlcjdRVEliNFJtS3plOUc3czlU?=
 =?utf-8?B?RlhqNnRPTEE0d09GWlI3dFJYMzlqcWgyem5yR3puNkVlTnpWYnhBZ29YSjNV?=
 =?utf-8?B?QzlQL0xyNEo5b21zV0lXUkhvY0pDcmQ3MXVvT2RvSEdnZElvVVZRWkRRclJG?=
 =?utf-8?B?SzUwM0dreTQ5cE11Qi9NM0VjSFQvSjF2VjVNT1NVOEZNcDFBL093V0I1NThu?=
 =?utf-8?B?V3pjSUF6amM4clhwL2tPVFdqZnJCdU1jdFR2bmtIalQxL283amJkVWJEazVR?=
 =?utf-8?B?dWlQclF3c2xWSDBvYW9WQUl3bU4wWkVNREg2Y3o3NXhxaVQwTUpEZWJYSDN2?=
 =?utf-8?B?L0ttTzRPTlFoY2VVYXFycW9jQnhRUjhMT2dBNW9KSFFxU3U1VkNUcmozbEJh?=
 =?utf-8?B?RmtMcXNQaHdKZUd3amJDcE42SlFqU0x6MTVtZXVzNFlQY2lQMzR4eVdvV3ho?=
 =?utf-8?B?ZnFRMTcxWDlnR29FWUxJYnJCeUdzNEtselduS2xGMTNLSTVRc1JudHhMZXZR?=
 =?utf-8?B?citmVkRITnpDTWwvWW93NDF5NTNodjNBMUNTc1BLMW1iM3JBWWpZTkRZLzhM?=
 =?utf-8?B?ZndtS3NqWHZseTVEb2ZJYWlFM3plRitUeUYrNkVBUVA3UFViZVFNQUptakgv?=
 =?utf-8?B?bzZaWHJsdURESGxRL0NXNTZXMVV5SzFyaWlwalc4aGJ4RE9qaWRWcDZIZjBQ?=
 =?utf-8?B?ZTBkNVVTa3ZWODIyTm4xUmkxdTJ0VXNoVHdBdkFrTVZyN1MzWVZvalZJMzBw?=
 =?utf-8?B?QXJ6bmI3U3ZMSHNkY3pCNGVBcU93bmJCSEl3cUNEUWhGeVhFUXJ6cUxVcnhF?=
 =?utf-8?B?NDZROTdzUnIzN2c1R3N2azJIYU4yNFRrOUx1WHpTMGhxWC9nZ1lYMnJPc2lE?=
 =?utf-8?B?dktTUTZQbWZlZ1VMVkp3Q0ZBckI0Y0NSNGRFQlhEN0FZL25rWndqa0puclFI?=
 =?utf-8?B?K1V1eEpxRDN1Q1pSVUJRR21zQlVPaHM0VWxqdVI4SmFUT0VVYTAraU9uSHpC?=
 =?utf-8?B?T3RaajZ1Z2s2NGRMa0I2R0VTdDErR0NCR1dSTTlEL3U3eXBtQ0xEVk5ZeWdj?=
 =?utf-8?B?YkRqZGRUWUdmTVJ1ZmhrSzJUclR6TGxERjZRYm0yQktYUWw3TWJCVWJ6dzlL?=
 =?utf-8?B?TDNuUFU0U2pxTGxIQ0s3R3hrWEczSXRQM1ZIdnE1bklBaXFiUmkzNVpVNXVn?=
 =?utf-8?B?QTk1bThqRCtHTlNYeVBwSU0vUWR1NlpVd3VoYmlULzNZek04R3R6bG5mOVVE?=
 =?utf-8?B?RUNtbThxNFQ5K21MdFNSYnpkV0U5dVpKRWM1cDlBbjNMVHp5d1VwWkJETVdn?=
 =?utf-8?B?QTNUSUJlbHNORDRRQi9yWEtLczFXMXUzUDRwK3AxU0dpa2Y0eE1uYVZ4WXN0?=
 =?utf-8?B?WjAvYUdQdW5OUC9yd0FvVGFCSC9QbG05eHpSVGhKV2drNkVBS29NV2lGVFBB?=
 =?utf-8?B?dXh3SE5NZmM2Ry9LL0Fhbis2TGxiYWFnYnNvL0RNN1dhOUlpVmJZR3ZUdktT?=
 =?utf-8?B?RzFOYWtSUU1DOTVLNlpQdTNzRHRLelNlcGlkUnhDOEU4cHY3RzJkaTR2dkpm?=
 =?utf-8?Q?opg6iXUdOwR092jlAbheFz1ZZj3c6DZK?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F92617ED965E15479127615B9A6B6F00@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5557
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e9be601b-d2e6-4e44-8db6-08dd1de234ae
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|35042699022|14060799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dFhvRHRna2JMU09SdURQaDAyaUZaNHFINnN4TjlBb1FER2h5QUR0RUFSdkVJ?=
 =?utf-8?B?ejlVdTFpQlBmY3pZV1NIc3U0dkdVcFE1UjFPTWsrWGhkOE5LV2t1V3VlMGNx?=
 =?utf-8?B?RUhJeFdwdndwNFFXWC9rWjBwdFRzNmlRWUtjVEFGRkJVVUJtM09UQXQ5QWUx?=
 =?utf-8?B?eWxCcGV4YnJUTG9VQXM4Z2JaOFdoT01zWjdoZzZJN3lWQXA4QkIvVG9xSk1i?=
 =?utf-8?B?MWpmY1B5eVZPOENLZjFkMDZYKzRueUJBSlMySXNucHlac2VMQzhJaHhRSFJu?=
 =?utf-8?B?Y0FGYURxczNzSjExaVJtVjhZcStYUmYyVldDTEV6UGFXdTVkYmMzZUhPRElM?=
 =?utf-8?B?MVY0cG5zRTFBRlRjUGpvOFkrVUFDYkNna1UxSnRZV1ExNXRaSzdZS0V3WGk4?=
 =?utf-8?B?R0lsOGFRYmRqcFF1cWNJSXc2TWdZbks5U3pRV3hzcTVQQW9BWWI2QktrTlAz?=
 =?utf-8?B?MDFPcHZ2ZHFoeHFjQ0kzWlQ0Qmp1MHYzL254dFJzVVNmZDR0U014SVZNejdD?=
 =?utf-8?B?cnR1QlNYV0RuM1I0V0taU3QrUGVsWDQ0WGVRNy8yTi83a0E3WHlKUGZiNXZ6?=
 =?utf-8?B?aWJHWEFPVkwxWUZ2TnB6d0E3dk9abTBWTWpkQkRtRDNwQjNicGx6QXdJVUF3?=
 =?utf-8?B?Sk42VnFMc09tWFZwSksyQ3A4VEZXeFVJZUEyblVtTEMzZ3dDcXk0aFhKVjMr?=
 =?utf-8?B?cFlOeDBiUVdJY0UzUlIybklyVTJMVlBFZVQwdnY4eUY4TXZvbVY5aUhBRG0x?=
 =?utf-8?B?dXYyQmRIZkFibStTb0N4OS9nZnlEWlZzSHo3cHRGNXBBMFRta0xLTVJscXI1?=
 =?utf-8?B?RG9XN0k3M3grZXZscUQwSEpQQUcyRGxnSlN1Q3kyYzBuTWJPeDMrdlE1YnJ6?=
 =?utf-8?B?TnNwN3FkNHU0YUJHS3pTeG1FanlWa3Q2WVVuQXAzZTluQXUzZm12YXVCVUJy?=
 =?utf-8?B?VzBWUG5Gc24wOTdKOVJVZzFKQW5PVzlvRHhEYWFMdjBzYXo5L0p1NkJiclRq?=
 =?utf-8?B?UUxBNkpMdkhDVDFya2Z2N2l5N0FyNGpUZzRWSXBXZW9yVkptQUpqcEpISjYv?=
 =?utf-8?B?SXJSQW5FMlpmdTFrOG8zRGEvUUtxd0Z5YUNVQlZDRHM3cUpBZnhRTDZ2M1E3?=
 =?utf-8?B?a2VaZXRzemdzeTd4d25lQUU0ZTkvYUgzRUdGbmlTRjdiNHhSN2N1TlRvVVVk?=
 =?utf-8?B?UVUrSWhwalRTT2ZQNC9RL0UxN0wzQmdwOXdFdzlvZXN3VVdibFJJL3dHd2Z0?=
 =?utf-8?B?N3cyVGo3ZVFQWFVCYU4yczZjLzlIcE8xd2lpRmJ2aUZrZW1mbE1KZmtNZkY5?=
 =?utf-8?B?bSt0elg1ZUFaK0lyNHBsT09qeUhwRlo0OWVKVlBZUHQ4VVpsQkEyK3UxZVM3?=
 =?utf-8?B?VllkOXE5aGdSMHNyRVFxeUVFTzB2S213b04vd3ZmRDFSRzVNRzYxM1dYdTBP?=
 =?utf-8?B?OHpnL29JSXNTK0NuanVzL0g2cHh4dFNqUXNjTmZ0TWNnSjRBcHpQU25tUVBu?=
 =?utf-8?B?VzZpWHArOXltRm9scEZhTmhJV2JMM1BaeU1zZVduc2QweEx6R2N5OTFDL3E2?=
 =?utf-8?B?Y0E0UVJPeXVVditIRHliV0NldUxIUStRV2d6UC8wWDhJVlBDNG5HV2xPKzRo?=
 =?utf-8?B?Q0pPNzBjdWVjNGx3eVpkZUNHTDQ0N05UM3RwZVhsQTVjNmJUOWJPeXlTWDJK?=
 =?utf-8?B?TjhjcXZ6K2x2elRpdTlhTzB4MVVWVWlPRi9mVzlPSTNYcVIzYnpRV1UwbldI?=
 =?utf-8?B?eFFrdnFtZWt3NmVRNUlKdlZrNnNiWWVyRFRqWkIrZ0N1b3BqQXlLQUVPbXp0?=
 =?utf-8?B?M2NBNTlSeVUwQi9pNFNOVGtGS2lBWHFWR2wxMUs2azgxNEYzSE9rOWxGN0Jn?=
 =?utf-8?B?OUhDR1FWWUlBcExKNGprYmZWY1p2SXU5NUFabEJBclg4ZDNMR1lWWHJEOWsz?=
 =?utf-8?B?dWg4RGl5aWg0K0QwT1ZGcmtNeTJGYWhxQUp2NEJnYzdSSGRjTVh6UGJvSlRt?=
 =?utf-8?Q?DlEZC8kRG83RFvJ17py5q9mELE+8kk=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(35042699022)(14060799003)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 14:59:23.3489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d9dafb-dd8d-492d-38b0-08dd1de23a41
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8510
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 14:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208772

T24gMTIgRGVjIDIwMjQsIGF0IDA2OjU0LCBNYXJ0YSBSeWJjenluc2thIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxyeWJjenluc2thPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+IFRoaXMgc2VyaWVzIGlzIGFsbG93aW5nIGNob2ljZSBvZiB0aGUgTlZE
IGZlZWQgdG8gdXNlLCB5b3UgY2FuDQo+IGNvbmZpZ3VyZSB0aGVtIHVzaW5nIHRoZSBOVkRfREJf
VkVSU0lPTiB2YXJpYWJsZSBpbiBsb2NhbC5jb25mDQo+IA0KPiBBdmFpbGFibGUgZmVlZHM6DQo+
IC0gTlZEMiAoZGVmYXVsdCkgLSB0aGUgY3VycmVudCBOVkQgQVBJIHYyIGZlZWQNCj4gLSBOVkQx
IC0gdGhlIG9sZCBOVkQgZmVlZCAoZGVwcmVjYXRlZCwgYnV0IHN0aWxsIHdvcmtpbmcpDQo+IC0g
RktJRSAtIHRoZSBOVkQgZmVlZCByZXN0b3JhdGlvbiBmcm9tIEZLSUUtQ0FEDQo+IA0KPiBNYXJ0
YSBSeWJjenluc2thICg0KToNCj4gIGN2ZS11cGRhdGUtZGItbmF0aXZlOiByZXN0b3JlDQo+ICBj
dmUtdXBkYXRlLWRiLW5hdGl2ZTogdXBkYXRlIHN0cnVjdHVyZQ0KPiAgY3ZlLXVwZGF0ZS1kYi1u
YXRpdmU6IGFkZCB0aGUgZmtpZSBzb3VyY2UNCj4gIGN2ZS1jaGVjazogYWxsb3cgZmVlZCBjaG9p
Y2UNCg0KSWYgSSBzZWxlY3QgRktJRSB0aGlzIGZhaWxzIHRvIGZldGNoOg0KDQpGaWxlOiAnL2hv
bWUvcm9zYnVyMDEvWW9jdG8vcG9reS9tZXRhL3JlY2lwZXMtY29yZS9tZXRhL2N2ZS11cGRhdGUt
ZGItbmF0aXZlLmJiJywgbGluZW5vOiAzMDEsIGZ1bmN0aW9uOiB1cGRhdGVfZGJfbnZkanNvbg0K
ICAgICAwMjk3OiAgICBpbXBvcnQganNvbg0KICAgICAwMjk4OiAgICBiYi53YXJuKHN0cihqc29u
ZGF0YSlbOjEwMDBdKQ0KICAgICAwMjk5OiAgICByb290ID0ganNvbi5sb2Fkcyhqc29uZGF0YSkN
CiAgICAgMDMwMDoNCiAqKiogMDMwMTogICAgZm9yIGVsdCBpbiByb290WydDVkVfSXRlbXMnXToN
CiAgICAgMDMwMjogICAgICAgIGlmIG5vdCBlbHRbJ2ltcGFjdCddOg0KICAgICAwMzAzOiAgICAg
ICAgICAgIGNvbnRpbnVlDQogICAgIDAzMDQ6DQogICAgIDAzMDU6ICAgICAgICBhY2Nlc3NWZWN0
b3IgPSBOb25lDQpFeGNlcHRpb246IEtleUVycm9yOiAnQ1ZFX0l0ZW1zJw0KDQpBZGRpbmcgYSBk
dW1wIG9mIHRoZSBKU09OIHNob3dzIHRoYXQgdGhlIGtleXMgYXJlIGxvd2VyY2FzZSwgd2hpY2gg
dGhlIHBhcnNlciBpcyBub3QgZXhwZWN0aW5nOg0KDQpXQVJOSU5HOiBjdmUtdXBkYXRlLWRiLW5h
dGl2ZS0xLjAtcjAgZG9fZmV0Y2g6IGIne1xuICAidGltZXN0YW1wIjogIjIwMjQtMTItMTZUMDE6
MDA6MTArMDA6MDAiLFxuICAiY3ZlX2NvdW50IjogMjM5MixcbiAgImZlZWRfbmFtZSI6ICJDVkUt
MjAwMiIsXG4gICJzb3VyY2UiOiAiZmtpZS1jYWQvbnZkLWpzb24tZGF0YS1mZWVkcyIsXG4gICJj
dmVfaXRlbXPigJ06DQoNClJvc3M=

