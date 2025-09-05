Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF84FCA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 09:10:35 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.15])
 by mx.groups.io with SMTP id smtpd.web11.16974.1757063429249220365
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 02:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EAe1mbcP;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EAe1mbcP;
 spf=pass (domain: arm.com, ip: 52.101.69.15, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AGxqE/AcxywWvsWTDy++anXv2S5yaTCTuRbivgfEcv4FyFN5QqSAgvsB0vkBKT8gYj1JWX5l/ElzPMB7ltFGxLUPMGMK1zriEW4qRB7ksu/9/gBm3hFQPvlzq92Se8C5MkgVkS/+8uj05VgB+KKwzTiVrDwu//92r/PEQFk/xCukrh1X7mesW5N9H012etOyTyHk+ltr0JDHpwsyju8kBsGwlpveJ+kaJOvwn5aXXOnAWzhFtnbsJNxexhQZAus/eVp6KRVFlxcK/0e8K4Fa7M2pbFYktapfkQxEgFGXx+wEyZYJlf3ApG1+FCDJrvd5UAbmPUfkC2e22PB7fuwGbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jaWQSYMn0P4/WQqZKXpm7Z0FOljLE7q8QPVpdvlomY=;
 b=wfEe3s1koiH01NmSTMeSFFi2B6715Jsnq7MXAEIaf7tC7sPfo2ScsXQ3oO2hhwfpTuTljE5Ewu5e1v0dWPWcB+4IsADeRrjGFjR2JXBfHRSCiV/0o1tZYsdzmLXiKVHddkPb1Wv6+FovOMZU3MJu0t/M8sQGASr1+QPx/VOhk/pSUiAcFZ3rU9ni7mc08iVGydikE2ThiWLy8+sHRwInQIr4gB593b/uwxCQ0cBJjRc8rFGEO4vLkkZp9Wk28z1JcNaEDcKLCmQyvqxDdQzWdE/7BlKl7RTqyVwA9AsP2k+mTkDILTa2HpvM3CzaBx51JSLlSJlnMmhiY3U1R7L3qw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jaWQSYMn0P4/WQqZKXpm7Z0FOljLE7q8QPVpdvlomY=;
 b=EAe1mbcPoMcer4vG/ofzB1fsRijC5Pq+8ntZItd7FyzO5qBsbu+6gpVjVGL6QmL8tJNqErhPF1L1dNC2nR7xEE8KEJcqjNuto6QJrliE1TquW91jSBqV2QKKmNrVa+9eHBinPgTCnZrdx1QBDNHA/F2sYC4SkX0T3XjTfc0VqQw=
Received: from DB8PR03CA0017.eurprd03.prod.outlook.com (2603:10a6:10:be::30)
 by GV1PR08MB10371.eurprd08.prod.outlook.com (2603:10a6:150:8a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 09:10:18 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:be:cafe::28) by DB8PR03CA0017.outlook.office365.com
 (2603:10a6:10:be::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.21 via Frontend Transport; Fri,
 5 Sep 2025 09:10:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.11
 via Frontend Transport; Fri, 5 Sep 2025 09:10:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbWP/wEkrcg+ZsMmxN0RLnmv+ZrOM2WU1OJBdNkW9ggiME0xyE2Wyki9iHyGgIc9lIP6JFsWrFZ8+dC+Doh8bmDKwMP9u7DaM7wUZmB2v9fYwi2AMWWCLHyhUw4iQhBq41fb5PjygQRflHd+IN89DEVUJKNMmGqNkvs7dF7+NbjL06Sh/PVCioc37fW5BwMkOOdX4U22HDZKM4hMgRLnl7VGCea99IP5LtDZJ0l6DLXKBA+iVQ0dET5KQJPWCvYbPzJ0tXeZWBlxG4/zH0kTRZ1mgo2tW0kLCw0SwSf/OP3ha4RfX6D5yHVx14H6YCb6ZUpNwSTv/0Ehq3TJYuC8rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jaWQSYMn0P4/WQqZKXpm7Z0FOljLE7q8QPVpdvlomY=;
 b=huJ3EUbJxpwcsV2aLTr7qk+/8TDRaST7PUUdGfVJz1i5sAjem7Tqnl0OuahXw59994mmAzLhLzjnaQ7HhiIPQqzX79UMA1s72zy14v7eM4iUJYAG5/Gv9UkwnTrtDzs56D6rXSnaR3XwBEV//Stpm2dg/fglDMVypJIg6QM8N7IVoedh92OM/HZ7U7S25d871B733ieKEGMojZbBWmVQNo0q4XTZiQ8zG5LbjD2Q+nUG9/x95DBBGAz9CIFSzhG8tbgnLBqr7vYTvGphYEI9VGKvS2yFWcukpR8k1/nrIxYaR5A/on2F6pzSdQjZ6sB4Wo5wx0Fja1Wtb0kzAg7ROQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jaWQSYMn0P4/WQqZKXpm7Z0FOljLE7q8QPVpdvlomY=;
 b=EAe1mbcPoMcer4vG/ofzB1fsRijC5Pq+8ntZItd7FyzO5qBsbu+6gpVjVGL6QmL8tJNqErhPF1L1dNC2nR7xEE8KEJcqjNuto6QJrliE1TquW91jSBqV2QKKmNrVa+9eHBinPgTCnZrdx1QBDNHA/F2sYC4SkX0T3XjTfc0VqQw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6082.eurprd08.prod.outlook.com (2603:10a6:20b:2dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Fri, 5 Sep
 2025 09:09:45 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 09:09:45 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Antonin Godard <antonin.godard@bootlin.com>
CC: "koen.kooi@oss.qualcomm.com" <koen.kooi@oss.qualcomm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Adrian Freihofer
	<adrian.freihofer@siemens.com>, Peter Marko <peter.marko@siemens.com>, Jose
 Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: Re: [OE-core] [PATCH] systemd: stop enabling non-standard MAC policy
 when using the 'pni-names' DISTRO_FEATURE
Thread-Topic: [OE-core] [PATCH] systemd: stop enabling non-standard MAC policy
 when using the 'pni-names' DISTRO_FEATURE
Thread-Index: AQHcG+lTCiL79TKLdkC1JimrZTHYLLSER5yAgAAKKAA=
Date: Fri, 5 Sep 2025 09:09:45 +0000
Message-ID: <ABE717E9-255C-446F-A5CC-C33C7D20ABBB@arm.com>
References: <20250902090925.2904294-1-koen.kooi@oss.qualcomm.com>
 <DCKQ7KX5D934.3FS2DI6M1I2L1@bootlin.com>
In-Reply-To: <DCKQ7KX5D934.3FS2DI6M1I2L1@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6082:EE_|DU2PEPF00028D0D:EE_|GV1PR08MB10371:EE_
X-MS-Office365-Filtering-Correlation-Id: b5ac5c13-496a-4412-f16b-08ddec5c0843
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Q0NSMnIwbDQrM2FMVWd3cy9YcWFuNnhMODhJZmpOdm04Zi9zSFlwNEFtM1BY?=
 =?utf-8?B?WmpnS1plZlA4VU1QSGR6TG1kKzdQcWMvMU4vQWhqZFlXb3ZGTStNKzc4YUZJ?=
 =?utf-8?B?WGRlVFFvRFJzTGJSdW5PN2cwWXYrMWk1QllySlFvUndoWHU1N1U3MHF3QVZr?=
 =?utf-8?B?Z3ptSG9HMDk1ZERMQ01DMGtkZjhPNlg0cGx5OGNQRzliWTBSaWs4cmlKRnpS?=
 =?utf-8?B?WXo0cTEva09CdDNFOE10M1k2S0VjeHJsRmEwaWlqeWpOS2RId2FDMmZFSndV?=
 =?utf-8?B?RkVsSy9iY1VBTW05ZXZ0Y0dBNlBjUmFNWEl5ZkN1ekk5a3hQRkR5Qlc5Wkwr?=
 =?utf-8?B?TWs4TEhxNXlXNVpZd29kc2JORTV1UlV6MGVlQnRvcUNxVFl0VXE1MmJzYTNU?=
 =?utf-8?B?SU9xS3pHeS9pTWxxTXNhMHcxMnhHTmVFUlI2bWt5RW1MWmpmbHJoU3FKUXV6?=
 =?utf-8?B?NTNRVGI1ZC9uQXFTbGJxdUxDK05hSURPN2VVY0l4RmdoMkNKdHQxU013NFpR?=
 =?utf-8?B?YlF1SVkzZ0ppMnJ4b2tvMmJTeUs3dEdxZ1o5RXNYTEdGWEllK0tUNGdjYk5w?=
 =?utf-8?B?UE5RVUJYcWJabmVkOUc2NGpwMHVtNzFoZXZ4UDRwWUl0U2RyaTlCM3VTY1VS?=
 =?utf-8?B?OGdtanpXU2tQWEFuR29uajlXWVF1N1dWajF5QWNRKzZ0VGlKeDVHeGhkRTdI?=
 =?utf-8?B?cjBQUTFKZjdyTUpGSHE2TEZpalRwM0NhZjROdUpYUEZDdXpQUFhBZ3BTQUUw?=
 =?utf-8?B?aHRqOEFvUDQ3WFM4T1JUTXp3RDBnMEFFdWFOWld6RmtkY0N2VmNubjMzcVhh?=
 =?utf-8?B?Q1gwNWI1U3hMNGNsZ0NZRGxsdVAyOUxmYWhJVVFVOHhmV0swWURjampBWFR5?=
 =?utf-8?B?bFA2L2lmNmZhQTl0ZlZ3VlpxWDZoYk54bnlmQU9zTTM2TE1vaUtVWUNZd0I5?=
 =?utf-8?B?ZXM5U090YXRoaDltL1BaVlp6MVprMTBpTFZaMU0ya1RCYVBOUjFNamNtMFVO?=
 =?utf-8?B?Qyt1UEJlM3VpekIwYnNiUWMyRHNDRzF2ZGR2SVJRdk5TSkdmRjZpZDRTbUJQ?=
 =?utf-8?B?SkcxTzZLejE3VWJ5RktkS3B3WGpNR2VYeW90Mm1adWljRlZDQTJrdU5CYkg0?=
 =?utf-8?B?VGtsYWJSZFRhODBXN0IxZzBZSWxYOXpraFE5WHFUMHhtSDBHeFZLM001N0JH?=
 =?utf-8?B?NUxyemo2cEt0Qlhnck1WZEdTL1ZKa0N4VVZNaFlZcVhDUkpiM1o3Uk1WakVq?=
 =?utf-8?B?VllmaVgzd1JZS3dBR1hLL1lITDI5WU1seXUvVXFSaG9adkZYaWtXd0pycUNs?=
 =?utf-8?B?WDZWTFVqTHI1UzBxUFFtRmxiQ2dPZmFiellEVUdTbUdSTmI4bWMrckRiT2k3?=
 =?utf-8?B?ZFNNSnYzdkQ5TWcxRTFDaDc3aXc0ZHZCcTBsMzJLUFE0VTBUL0R0R3RIL1R4?=
 =?utf-8?B?MzZsZE16RVlXUjZPa1FUOXlET1dKazQ0NHdWNnNMVjdrVWdxMUhkZDNtTHRZ?=
 =?utf-8?B?Z2xaZm1RTXpWOHNUVzdFZ3ZPVmh2TTV4bzJhQnFzaFBHV0FDSmxWRXNuUnhC?=
 =?utf-8?B?TmgvNUxLblFLY0t2NVovVmpYQjNrVGRFOWc3SHdHWjVBdFFUUStOamJ0MWFJ?=
 =?utf-8?B?ZVdqZm5WV0g0aEc2VnZrRm5ZWFlyVUg1UnBhQWtWc3NmN0hQZTA3U2dHcS9P?=
 =?utf-8?B?Y3JVcmM0b0dyS0NSTDNQVWw4YXV3ZTIwRE1zYzAxMEcvSmRZaTd6RkducHpE?=
 =?utf-8?B?WklOa1JmZG1iUmlTYUdob0NwL1ZRMjdhbmxlejBZQnJ1Nm11YXZxVDI3YUdI?=
 =?utf-8?B?WTMyNHJBQ21NN0xoN0FWK1NmTE5OS29Dc0RmSXZ2UkU2bmtZeTE0ck9KUXlp?=
 =?utf-8?B?OEJQeGdsbU8ydnFidDlCZ3U1Q0pzQjJ3NVlpTG1PTktmYzNhbmRIV0Zuc05K?=
 =?utf-8?B?QWVzQ0RJZEhUYjBYTFd0K2VXV0R6eEFPMm8xWDFIQ0daNHltTnBWTnNHZjZN?=
 =?utf-8?B?OHZFQi92SEF3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D029AF4184C9344491E6CE546A748EE0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6082
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5eb78a7e-4d0c-431c-18a0-08ddec5bf4e3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|14060799003|35042699022|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NFV5RXp1dFFDdG9yY1orU01iRXhIUTlMbmpONlVjbEhzR0FtaWREc2pxV09F?=
 =?utf-8?B?Z1lwRGR3aTYxWjFBV3pGLy9XL1V5RUkxU0c0UFNzZWNvYWNaU2s5L0srSHBt?=
 =?utf-8?B?QXp4S3hJdHRQQ1dFd2R4R2ZzS2tJT2orT25oMWFTNWdZYm5yTk90VWt1a3p3?=
 =?utf-8?B?ZTQrTWREdVJpbHpicFZqK2NMQnpkazAyODlTZ2VrOGlaVzlxc3pnNldkRHBh?=
 =?utf-8?B?YnBFRENOYTJKQmFSeU5sUWQ0UnpsUUlqSjkyVlVWVmtITEduWkRPNmxiTkVR?=
 =?utf-8?B?MjdtYmwyVWFidWpwQjdhbVVLUEJjdUxIQjdrd1ZoNGdzbzhvUmF2a2JrV004?=
 =?utf-8?B?eEtXaDcyTXB1SHo4Q3NNR1Rmb24xc1JpNkxuWHA3MldRT2REQ1NGR3g2WkNE?=
 =?utf-8?B?YzVlc2kzQkhQNFZpMkM3b2VpMjYzeEppQXZpZzJHNTdKZWQrUmZrNWIwZkwr?=
 =?utf-8?B?K0tBUkhka1o4L3M3b3BIelREMVY4TUVVNGd1bjY3NXQzMjQ4RU1tcGYydXVO?=
 =?utf-8?B?L2tseDMyL1RyQ242dmlGY3JNT055UFhVY3dFbEw0Yk41WUVSU2pBTGJDOFpN?=
 =?utf-8?B?bzhpTkpCelUzMDZzeDFnUWVCLzd1UVV1VVZ0Z2prYzYwd2hOeFRIa1N3NUxB?=
 =?utf-8?B?bERYL0FHYjFGY0c4cHpjclVnTXdnUlpIbU5tRHhpTGFIdktucUt2Zk9FMHM5?=
 =?utf-8?B?T1NMSUJWYVh6bE5qd2lqWlBjMkFoVGJFSnZUOE55RU4xUkdpTWU3dzhBMFRP?=
 =?utf-8?B?QWxWazR6cFd3WTZLU0ptSDBGRFdOY1RFSFl3VjVHWDJaUGJpZzFzTVVsTUx6?=
 =?utf-8?B?bDU1eE1hYytKRmwrOWFnUE1CanZzS2pHZ1NkUG9Ib3lMb3p2RXEyYmhIQXNO?=
 =?utf-8?B?WXpOaGtIUlBvK1p4bTlpbmpaRzJIdkVaNytaWThWeERLeFF6N29aQXBxS09U?=
 =?utf-8?B?ZWdGWklEZlo4WStTRW9hTVFVUkhodzlPUlNwTEJEZFpLb1JZQ3BXQ0ZqNlZG?=
 =?utf-8?B?YmlxbzhaYmRMck1WdUcwbDZWd0dMeEpjTi94azJWOXRuYjdXeEFybWdOWTd2?=
 =?utf-8?B?T0VjKytlY1d6bXlYcW4wRDV4SlQ5Tm1VUXN3WHlFcUtlNThPL1pJNUZVRFJp?=
 =?utf-8?B?MHRnZTdCVktzVThtT0VlaklnMW44SzY5dWprYmFoL3p3RFlxSDZvUVFEcE41?=
 =?utf-8?B?YmxHTmNUSTlFcG9Qb2R1SlR1Ny9jVmJUTG9vV2NEbXdSRHVKRzlCbk1JZld5?=
 =?utf-8?B?NlQ1UjZNdmJkTS9kUlpLdm45WkRNUDRDd3IvRnNRbTFpTWRxUTNFeUtKdHNV?=
 =?utf-8?B?blFEajhLVDR5RFNEcDlkSEpDRVNSNEtVdkNJYXh1N0lGSUZ2cU53a0k1ckpN?=
 =?utf-8?B?TElkSGIrRHQ3cTh5MzNTTHdYTG9iZlFzVUJYSEtWOGhSWjM0L3RtL3N4aFdH?=
 =?utf-8?B?Z2hkVE90ckdNaWVQUk05dUhEV29nMUxIamRwWUtTS2d3TWNhZFpsZUhIZ1Mx?=
 =?utf-8?B?ZTl2M1pabnN3T0VHS1NBam1vM1R2Z2s4NVRoU0tmYTRHc0x6L3BxSDJneVdp?=
 =?utf-8?B?NUVwSEo2NEJqYktpb3pOQS9ZdVZVTXBEeUZPV1hwaDB3dDF1SXBITnFKZVJr?=
 =?utf-8?B?U2FBZjdYTjh5S3dUNHZVVXRWeWNyZk1wK3ZHRENjUlJoOEpvNG1wZncrKzZP?=
 =?utf-8?B?V3pLUUgwVldwb3psZllSNXo5OVBmdlFHeWFwcklvZFBHa1BFOWdYWldZNTR3?=
 =?utf-8?B?V211TnFwSnlQbFN4SGFnZUt4REN6THJuVTRhZ0VEbEZzSmpZelkxdHprcEtn?=
 =?utf-8?B?VDlQaVh3ZVVJdW1RNUlGVFF5THpGN1JVbVh6czZXbllBN1Y1ZFByYUxkc1Jo?=
 =?utf-8?B?SkdmQ1JpYzllTkV2OURXUWtpelk5RHo1RndYUmprODYraXczNUVHUzc5ZWVr?=
 =?utf-8?B?VGlPTTIrK2RNd0tyQzdDREpOSytaQVVDSFhBaE02R0lWYjltMXl5cEtlOXpT?=
 =?utf-8?B?NHpYMWRYK1gxc1pVSlgvQis3anU2aER5Z2wxOWYyUnRnWEVDcktyWUJWbjd1?=
 =?utf-8?Q?oueDqm?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(14060799003)(35042699022)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 09:10:17.5313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ac5c13-496a-4412-f16b-08ddec5c0843
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10371
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 09:10:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222979

T24gNSBTZXAgMjAyNSwgYXQgMDk6MzMsIEFudG9uaW4gR29kYXJkIDxhbnRvbmluLmdvZGFyZEBi
b290bGluLmNvbT4gd3JvdGU6DQo+PiArIGlmICR7QCAndHJ1ZScgaWYgbm90IGJiLnV0aWxzLmNv
bnRhaW5zKCdQQUNLQUdFQ09ORklHJywgJ3BuaS1uYW1lcycsICd0cnVlJywgJ2ZhbHNlJywgZCkg
ZWxzZSAnZmFsc2UnfTsgdGhlbg0KPiANCj4gVGhpcyBjb3VsZCBiZSBzaW1wbGlmaWVkIHRvIA0K
PiANCj4gaWYgJHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAncG5pLW5hbWVz
JywgJ2ZhbHNlJywgJ3RydWUnLCBkKX07IHRoZW4NCj4gDQo+IG5vPw0KDQpJIGRpc2xpa2UgY29u
dGFpbnMoKSBjYWxscyB0aGF0IHJldHVybiBmYWxzZSx0cnVlIGJlY2F1c2UgdGhhdCBzdWJ2ZXJ0
cyBleHBlY3RhdGlvbnMsIGJ1dCB0aGlzIHNlZW1zIGxpa2UgYSBjb21wcm9taXNlIHRvIG1lOg0K
DQogIGlmIG5vdCAke0BiYi51dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJRycsICdwbmktbmFt
ZXMnLCDigJl0cnVlJywg4oCYZmFsc2UnLCBkKX07IHRoZW4NCg0KUm9zcw==

