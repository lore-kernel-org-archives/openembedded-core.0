Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D94AC3064D
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 12:34:43 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.77])
 by mx.groups.io with SMTP id smtpd.web11.6802.1719491681521513616
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 05:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=PXFk/IJ/;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=PXFk/IJ/;
 spf=pass (domain: arm.com, ip: 40.107.21.77, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=B/0QzSRCcRNQxESEHqLDvxuyhfTMmP2a5J79/hM3n+Kjp4KC1jUvcjtgr2XggqkjE0NXGxacHX1+BpawvQAkUK/yZePHJKDqcXODPMHBB3hv4SMIrsM+0YJrsT7rwrb2Qw+tNNOaSu+L6603KLgK5M1CPjduDvQMlsrc34P4RE+dxEj8cveb6IsgZtPawHRdSY9MhsGI+XbQsgArHGMHpTxBJlNVyBYdT7Xr4WPbV1ctUNC2TY02N8kQ1c8IrmKmzDdotJ1E/HA/uWbkEjGpVICEyoHXoqhrprtaCW+ND1tHiyPuaZrlgqic05M2PRlSokA7FwrQD8oJrPz5NrgCCQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKE8J8JD6QlU5Lb9SiUHcB1iwV5mWxqAD5O5xdcE6NM=;
 b=HfG8thjdA2l9caR48IpAPsiAVwSnVcyirZANGb/2Y1/bzAcbgXY9KGV/MHi6hBGRHtclKEU8Y0j7CgcJFQTTUC7aysW7+iSFClA8DPIM8/4x0A2WIPo0RXZte3Yyt77cZ4y0EYijA6viWgdMKeqV+XB7bHok3o3NkhR5r07z2Z1LrEWOeHTbCOuXiEVhtta6wcO4gR20XGThigP9wfiu0rcqt3deN0opozJ2WC0ENJL0t/cgu/PzjZmamzJMZHrbopks/0gZ77LyfJXf3wxexOPFhxGMgZzRKQyYS8G6FHmA2ibMeffikYqr+P7i/wuq90UX8u/xef7g29TEzDNY1A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKE8J8JD6QlU5Lb9SiUHcB1iwV5mWxqAD5O5xdcE6NM=;
 b=PXFk/IJ/FxDO8U4YoIRtoYkyIP1hslQ6fijnufieiCxUD79PQ85ZIE/SRVLdOrGyO6crnNsZcTQtDjj6Ib0r5IDwQE52bhsLB0/y+ULknluf4+0xCOcwC0T8os7gaDbfZNBhjpIqkaXh25rJvNHQVV8lz6sn4sCKzdRyE4aueL0=
Received: from DU2P251CA0011.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::6) by
 GVXPR08MB10864.eurprd08.prod.outlook.com (2603:10a6:150:154::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 12:34:37 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::dc) by DU2P251CA0011.outlook.office365.com
 (2603:10a6:10:230::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Thu, 27 Jun 2024 12:34:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15 via
 Frontend Transport; Thu, 27 Jun 2024 12:34:36 +0000
Received: ("Tessian outbound 3d451520b20a:v357"); Thu, 27 Jun 2024 12:34:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 14714e368e58044d
X-CR-MTA-TID: 64aa7808
Received: from 63b3cf0c0b89.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2B90F0FF-DBA9-487B-8DDF-4CC2E57F0FF9.1;
	Thu, 27 Jun 2024 12:34:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 63b3cf0c0b89.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 27 Jun 2024 12:34:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3sQoMOi/6sCYi+b78ln/KH53wDA8IrQOvWJJQLhjc1og8/m3A7uVtI3LoKqIfPyLweSf++Dp955YRqBUt6Z7BQ3go+pIv9ud1N+XwoByQ7cFnYh5FHb02/XdWFwugwUkkwn41/w0F8j34ia8CDZBy8yqQZNZ2n9JPvquCHw0JSwcFr09wtS4Dx4NlFxvXBy7WXdFx+jkMK8igTan8fE85ItyyBo3L3HVMk+Du2IotcUjOcM7JovEQstigL3KkNfgLwdMaTomZyAwReKer4zv0qa78GLKnQ1JjibHNtquQzmxgCDr+DBPcqfhNM6TQeyubMHr1Tu7dJgp9Yq+gwlJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKE8J8JD6QlU5Lb9SiUHcB1iwV5mWxqAD5O5xdcE6NM=;
 b=LOt00aYwY5X9DpVolKUnWMIcIY2mjPvywt/vK23hKShfF85LikBQlgH3mmzS30kLoOAkSUNC+ykcMMGEcPSSEMc2GTBsu2dsNXjUWDef/gaawKyQMQLdaO7Mi4DmXGO7PVdvLQQ353SRhggehOhnVe+mFS+AAB6nN55/sbCWEkAq4Artb0CU9md4InW6UBpD+uFrn0ZNAVdQ+0wfnuDldYB/QPbEcTQJ0+F7KOrjhogtDUNo5EqK4ykXDaFH9buDZUaU7FVqPqEeiD/rpSuB3mxXws6vAHsTPDqcMoogcBKRObVmqx+7jgLwJmnWFCqw85c3NvpY+8yOr08b86LiqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKE8J8JD6QlU5Lb9SiUHcB1iwV5mWxqAD5O5xdcE6NM=;
 b=PXFk/IJ/FxDO8U4YoIRtoYkyIP1hslQ6fijnufieiCxUD79PQ85ZIE/SRVLdOrGyO6crnNsZcTQtDjj6Ib0r5IDwQE52bhsLB0/y+ULknluf4+0xCOcwC0T8os7gaDbfZNBhjpIqkaXh25rJvNHQVV8lz6sn4sCKzdRyE4aueL0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8163.eurprd08.prod.outlook.com (2603:10a6:10:3ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 12:34:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 12:34:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Peter Hoyes <Peter.Hoyes@arm.com>,
	",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] testimage: Gate artifact collection with
 variable
Thread-Topic: [OE-core] [PATCH] testimage: Gate artifact collection with
 variable
Thread-Index: AQHax60h7iZA5dLbYUSyJlBo1cRah7HbhEkAgAAJAgA=
Date: Thu, 27 Jun 2024 12:34:27 +0000
Message-ID: <00A67594-956C-4E0F-BA5A-CE113EFFB153@arm.com>
References: <20240626094130.255905-1-peter.hoyes@arm.com>
 <dc373ddf53eddf0ef3103d9f08a9bb72bbd00550.camel@linuxfoundation.org>
In-Reply-To: 
 <dc373ddf53eddf0ef3103d9f08a9bb72bbd00550.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8163:EE_|DU6PEPF0000A7E2:EE_|GVXPR08MB10864:EE_
X-MS-Office365-Filtering-Correlation-Id: b39a2b64-b48b-4701-37b4-08dc96a58170
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?M0N1SFJuZG9TZnA3bVpZd3pqb0FkWG9iaHNiL3B4c2YyMEVJMDNKcGlzb2xq?=
 =?utf-8?B?R2YxSUU2ek1mM1ppWGsyUmdFQ2hwSXVtK3FEWXFaalBGS1FLV2lWNHpPcE04?=
 =?utf-8?B?TzNxRFgreUFPSkVNajY2S0tRbXMxeEJLdm9BMkdrZDg4ejRqSGZtNEpuOWhw?=
 =?utf-8?B?eDBJWWJGWjdOYTdwbXcwaDdKdHJZb3U3V1VCdys0cWR4OU5TNU9PMjM5a3pX?=
 =?utf-8?B?cmViSmErem9NUWtzQ1RFU3pRZ3BHUlA5TTVTci93VXFmekNRU3lkNkxHVFU2?=
 =?utf-8?B?K28vd1V2emNBcFZiU29GWHo1dVVLMDR3K1hMdTJyYXZRTEcrRlYrUnZpSEZi?=
 =?utf-8?B?U3l6a0NqaHM0WUV3d1ZOOHltcXc4Y3BLdnV4UGJ3M3pkYkNYeWg0TDdBU1l0?=
 =?utf-8?B?VzhuOHUrT3NRd3c0RlZCQll1VTBNMm5oaUovTFJHZHY2R3hheERERmk3MWRK?=
 =?utf-8?B?dFc2TTU2RmsvNTUvL05FeS9GdU1VUXJRVHNOa1R5L0gvL1RFdUZFREg1NkZT?=
 =?utf-8?B?M3NhVWV1R3lWa2pxeC9UOEN4ZzhFWFlMeU95VFQvQS9PWllBZlVGaGtweDNi?=
 =?utf-8?B?VTZtZG9uRlo4NFEyR0g5ZnlBNFhBbUxuNjFkcjVvRTkzTVdJTTdlNXRac1oz?=
 =?utf-8?B?RFhYVmlZajJjbDZ4REt4MGFpc0NpSGNWZW9MYmRrcGttTnNMLzN1UTVGNGgz?=
 =?utf-8?B?dmJPV0ZsUW5GbW9GK25lc25WRVNzMkpiUVRNaE5YQzJ4N2R6djFDRC9Da2VT?=
 =?utf-8?B?YU5PSHdab3BVQkVRR2JrSXJlbVdFMUR5bG5uSTg4TmJuVmlKZUZWY3VGb3Rk?=
 =?utf-8?B?U3BBWHBvRUZSaVdRY1ptN3FOcXFBSHpvL0dIOWRCc3Q5aU8wU2ZzZXNNTjZh?=
 =?utf-8?B?bHFvRkNGcnNVVktrNTFyaXlIYWVwR05nS2lWdW80cVlwRDIxYmdick43UUZi?=
 =?utf-8?B?bWdpSHVwZW5UbG1hdURMTFRBdE5tN2FVeW9UNE4zVlZwVHpxbkVXVUYvT1B5?=
 =?utf-8?B?akVSL0V6c256S2xoWXFCYk5OeW5jNVR3M0J4ZDlscEtDc2djaUtSOVRjdkpy?=
 =?utf-8?B?V1ErQTJEN0lYRmZmVVpVZzZ4OFJtSUlHY2JnbG9Dd2tUb1JQVGxZM0I2S0Ro?=
 =?utf-8?B?c1FvVnV5NDdNUmd1V2NNWFJmOE9mc3VSMUxhSVozQm1hUXBqYXNRQW5xTVF5?=
 =?utf-8?B?VWEwN0ZBQy9BSWdxM0pDMWVpdXdQWmpkR0Z3UnlZMXNyVmxOQXU5SW0yVG51?=
 =?utf-8?B?cmFOTXpZY2QvSDEyMHp5QnpkRGsxYVEyUDRJM3Rqa0FqU2ZCS3BPRmYrZERG?=
 =?utf-8?B?UEtkZTFOTzkvTk4zdFFpM1BQekY2Q1dteVBrV1Z2M3pCb2Eyc3BpV2gveEJx?=
 =?utf-8?B?Nm5seGc3Q3cvcUlHSmMyUG5CYXlFMURJZk9CZ3F6bmNSTUJjcThNNCt3VVhp?=
 =?utf-8?B?cTl6c3RCL1dmdlhNdVErYjV6Ny9ZNFo2NFVmV3Fmd2hsclhKeEc4cmpiTmxL?=
 =?utf-8?B?Vkg3a3JrS29ESCtFWkczWXhBME9TRmlIVm5jNzk1c2lEVEJRQVFFZmgwOXF4?=
 =?utf-8?B?ZUY0SnVxcHU1TjRkTGlvYkk3KzV6eFZHRlNwQmt4bmE5WWozeUdBbWNDK3A5?=
 =?utf-8?B?aXJBaWtDd0dzMVRtTjg1bXJGR01xNC9MNnpCemYxQkRyOGU2b1Z6Y2V1R1dC?=
 =?utf-8?B?MDJGTUF3cUgrQzlkTmdabDhIY3VJV3cyd1pHMEdkMjh4UlZmRkI0NENDcGd1?=
 =?utf-8?B?L1ZLZkt4c0JDZkQzVHVDV0JFQlRVcDJmM20ySytkRTNTYi9KYmdKd2oydHNi?=
 =?utf-8?B?aEt2bUxLZWllN0FWaUhtUlVOYWJTQThjbjR5YTViRVNHemJRbHlaWC90Z1ho?=
 =?utf-8?B?QTVGVHBJZXJHV1V0T2VJMDFZODhUU3UxS2xxQVRIdzZ2OFE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6AADFBCDDA513A4E9ED61658071A3FB4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8163
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	41721cc5-c225-4da2-3d6a-08dc96a57bf3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q0ZENEVDalQ0bjNzWVl6eXpQZTNmMy93cmg3dm00aFVPbS9YUmJ0b290N3pt?=
 =?utf-8?B?VTR3TlNkMm5TMzM3MmgwYTZKSjhObUQ5eEc0T2llYWJZNm9kdjdsVm9jVTFR?=
 =?utf-8?B?bWlmVGJNRm13MGQvR3ZKQVgzc3N1a1YxQUE2SXRyVHp2cjVBbE9vR1gxNXR1?=
 =?utf-8?B?WjRwL2grSGJTSVVWVlJsOGIrZHdZWmIrdTF4M29INmlpYXc1MlVrK0tsVEZZ?=
 =?utf-8?B?elplK2RFdGhOb3JKWUJvVllhNXp6ZFZoVWt2Vkk1VTBjZHg4ZTFWT2RkY2pH?=
 =?utf-8?B?V2Z1VGxDcmM0ZHAvNFV5aG9XRDdtUXRqc2Nkd3RvMFpCQjFzQjdRWkRJMW4r?=
 =?utf-8?B?Zlo1b2FxaStjb095cGc0U2dheDNYeVNXbXZZUWJMK1lPdTVzQVoyQ2p2MmEr?=
 =?utf-8?B?bk5jV0JXS1NYVUlLRTh2V3FRWTljKzFPeGJGQk9adXNDTzFLTisxdUpHZEFP?=
 =?utf-8?B?WU4zZWJBT1c4T3I4V1dXbWYyMDJwd3RpUlVtOUFKUTdYWXBGZWN3NVdmSUsw?=
 =?utf-8?B?ZXo4NEViYUlBQWpSSDlQVWozbnBoVGowYXFjVnEzenBGaDRjNVV1cVZVN0tz?=
 =?utf-8?B?bnVBdXdkWXNsZzZiNU05ZmN6L04zNitSbVd2WWJkSEtQT3FVMnA4bjVWRVBH?=
 =?utf-8?B?Y0FQWHpUVkgvUlpUSldqZ21WRTdpaVpnTUtFWlRjNjJDOTFBZ1RPUGJzbGpS?=
 =?utf-8?B?QXNrYWU3RmNFVUpXT3dMdXZibzA0VWdCaWQ4Ui9nVGRnVFllNUoxSU91R3Vp?=
 =?utf-8?B?SUdWRkd5Q0dOWFk3TmVCYkNramJYNXlzQ21WU0h6aFRYNEh3Wkh6RWEyL0Vi?=
 =?utf-8?B?YXRaeWdRV1ZUZjB4UWhVcEtXZnAvbktEY25la1hQK3Y3S3h4djJJWDJXSGVH?=
 =?utf-8?B?a2J4WldGOTg4dndZRGwva1hkRStCSU81K3djaE5LQ0l1Q0VQMjdzS1FwRDNZ?=
 =?utf-8?B?Rk9kb3oyVnBPTXpiNFJDVnNNaTBWS2pSa3A3MWNXUXdRbXdNa0REMFlvczhL?=
 =?utf-8?B?TzFZVjhPUXZhY0doVk50dHk1Y0tFdlFHRjlqdkdNbHBoMkZDaE5WMEExelBN?=
 =?utf-8?B?MGdLem05dlNQQWlGZnhRSkQ4SUZ1b2NtbzNpM29weEZPUmlTOXpBMGEvRFUr?=
 =?utf-8?B?dFJZeDFGZ2k3cG5weUExZElDZmNaZzc1dlV6bUNJdHArZ0M3ZjUzdkMzbXFi?=
 =?utf-8?B?QllDcEpsMzNpQVhFS2tXMzd3WjBCVkZMN2h3dnhwZDlnNjVuSkhodFRnenYz?=
 =?utf-8?B?RGlsVzdjckRiTnptYlNEd3d3UkpEOW5hOTc4RndQeXVJOWZOY3pybzZTL0I2?=
 =?utf-8?B?RFVXNHpIeWRuMmFBV1VhdWVRMWpKQVNFeFVya0RqT05aSStteGlYY2NOYVVa?=
 =?utf-8?B?SnFjWFY4TDdDTnBJdlNMTlhJaWdibDFVNXQ2c3RKUkRHbVcrSGR4bm5WTkNm?=
 =?utf-8?B?Wktud2F5YUV5djF5OE1lbGtKdVE4dkk2ZTMyMHRBV1hYQnl4NGdOQytMT3Bh?=
 =?utf-8?B?Tkw4dUd5Mi9nVmkwRU12NkhXWVg0d0xQam9xMGtKNHJoVWNLNUFwZnJJVGRN?=
 =?utf-8?B?bzRrMGQ5aHNELzB3T3l3WTM5b2tKRFU4SHUvYVdzYmdrQzNBTUhhTlhjWkxt?=
 =?utf-8?B?L0Rxa0ZPSkRUa0FYSkU2ak40ZTk5TlRWZjFHT09EdGt2U1FNV1VFVDBUN1hP?=
 =?utf-8?B?WHNhNFVjYU1MQVFNWGJYTHo0TkwyeHRENzFUMGI3ejMrbnRCUDNoUWljZFZt?=
 =?utf-8?B?WGpXWkU1WkhJSjN5SjAzZWVscWhZMDlheThQVGwvZjlzaDEwZHh2UE11Mmx0?=
 =?utf-8?B?R3lHRXRHTGhuSytLd0FDRjFJMUdrQlMyT240dzE0czBDU1FYL1Jpbm5zSzdL?=
 =?utf-8?B?Um13Q2lDbFpVSzhFSGdRTkVsMDZ3U2dvN0lCYysvT3hNcTBaU0swN1hYK0d5?=
 =?utf-8?Q?e605wSpnKwHyypir1eIh7K/9+eK2+Fnd?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 12:34:36.5153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b39a2b64-b48b-4701-37b4-08dc96a58170
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10864
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 12:34:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201201

T24gMjcgSnVuIDIwMjQsIGF0IDEzOjAyLCBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBXZWQsIDIwMjQtMDYtMjYgYXQg
MTA6NDEgKzAxMDAsIFBldGVyIEhveWVzIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3Rl
Og0KPj4gSXQgZG9lcyBub3QgYWx3YXlzIG1ha2Ugc2Vuc2UgdG8gY29sbGVjdCBhcnRpZmFjdHMg
YW5kIGRhdGEgZnJvbSB0aGUNCj4+IHRhcmdldCBvbiBmYWlsdXJlLCBlLmcuIGlmIHRlc3Rpbmcg
ZmlybXdhcmUgb3IgaWYgdGhlIHRhcmdldCBpcyBub3QNCj4+IHJ1bm5pbmcgYW4gU1NIIHNlcnZl
ci4NCj4+IA0KPj4gSW50cm9kdWNlIHRoZSB2YXJpYWJsZSBURVNUSU1BR0VfUlVOX0ZBSUxVUkVf
UE9TVF9BQ1RJT05TLCB3aGljaA0KPj4gZGVmYXVsdHMgdG8gIjEiLiBJZiB0aGlzIHZhcmlhYmxl
IGlzIG5vdCB0cnVlLCBza2lwIHRoZSBmYWlsZWQgdGVzdCBwb3N0DQo+PiBhY3Rpb25zLg0KPj4g
DQo+PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBIb3llcyA8cGV0ZXIuaG95ZXNAYXJtLmNvbT4NCj4+
IC0tLQ0KPj4gIG1ldGEvY2xhc3Nlcy1yZWNpcGUvdGVzdGltYWdlLmJiY2xhc3MgfCAxMCArKysr
KystLS0tDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkNCj4gDQo+IElzIHRoZXJlIGEgcmVhc29uIHlvdSBjYW4ndCBqdXN0IHNldCBURVNUSU1BR0Vf
RkFJTEVEX1FBIEFSVElGQUNUUyA9ICLigJ0NCj4gPw0KDQpBbnN3ZXJpbmcgZm9yIFBldGVyIGJl
Y2F1c2UgSSBhc2tlZCB0aGUgc2FtZSBxdWVzdGlvbjogdGhlIG5leHQgc3RlcCBhZnRlciBsaXN0
X2FuZF9mZXRjaF9mYWlsZWRfdGVzdHNfYXJ0aWZhY3RzKCkgaXMgDQpnZXRfdGFyZ2V0X2Rpc2tf
dXNhZ2UoKSB3aGljaCBkb2VzIGEgdGFyZ2V0LnJ1bigpIHNvIGNhdXNlcyBhIFNTSCBjYWxsLg0K
DQpSb3Nz

