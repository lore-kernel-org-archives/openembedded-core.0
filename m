Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D50F483DD
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 17:29:09 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.824.1774286941615761270
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 10:29:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ciG33K9z;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ciG33K9z;
 spf=pass (domain: arm.com, ip: 52.101.65.19, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xpfOqaeSOrAzzbp9Eh7lUusA8Y2RRCj2BBLGUrwaXmXW16CtzusCr7g1gtlSNINgllYbWyGhDVLbaq9xoRN49sAelup14eZKHb+MlYqd2u4QFbTSWQQ4vb9UA5jVMizoUy9zkaN82/iAvsp6d5MTfaJFW/9TY3/A9pNAufw0+VqxfNxR66kE5XZaLedJdXO9ZIflvLNWK++C+nKTfn7wc9LOp1uoqNw6X1ouUndRk6bUwWyjYmmNzEDkN0Z+NZWiAoMl57AW3Um7X4rdjQVN4neB4DEtCXpsvCvt0cGKIPZqya6o7IEc8VGO0HXpFYka9TIfFR9W5MAo9mStfLwhDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaNNIvhZyGVXanm4C4yaKofq69YwKuawk1q+6/D8Ae8=;
 b=A4OoERdNCctIdhCBySheKKdqGxVTeD7tpCMpm3ma2/DjeRHb3olU/mIAyltUAkPkKyuCR+MzuggiiPkcn/yKYg6NvM7xDp/1ORhOgy/Hirciq1CUl2ZSDAr5YOnbIm2urMAcaTYRz8Y413OxQYpSkTO/31G6KOpJ/YCM5oYCqDeUolDrP6AkaLExHwS87gQbqliAeSi+MD056XALtyul9fRlNuqv1PGo3YhcQXdikH2SYWhM1KDv/9i4YttimT4K3U3R2LABvHi90oEzd8n0ftCJwh3eZ87K2DrMeYRywa1tP27T3Mh2vCfDiZp2BqiK4QVzOJ1kUw/9VJmM4a6Njg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaNNIvhZyGVXanm4C4yaKofq69YwKuawk1q+6/D8Ae8=;
 b=ciG33K9zNAtzvV5MSxPXVrzDcOvRPtDkbgPJUqPdcQ+z2XL8NDw5vgbfkqtZ26ulMgGj61qSSP4bPUYNxM0oEIgcLFjD74+19EpRg1JeXHD1SuR2BA+zUHhX7kVri1zYr6MnIz4ttkKnuZ8kEQnFyEz90HxeB+S32RFQ+gVRll0=
Received: from PAZP264CA0198.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:237::22)
 by VI0PR08MB11549.eurprd08.prod.outlook.com (2603:10a6:800:2fc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 17:28:55 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:237:cafe::da) by PAZP264CA0198.outlook.office365.com
 (2603:10a6:102:237::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 17:28:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.0 via
 Frontend Transport; Mon, 23 Mar 2026 17:28:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+uGyvbWnNlKJCo9sfTSnTWw5oxDam4qjK+mE7gK7T2V0AC9FZ1NAKVcSCwtIbMtzOBN5IJR7GPxKQ02Nryq91wEJ8yjwvYpxvrPpVMfaLsKbS0vh5OP1Ba5i/fDaqkH6XowTg5WGu59teWasD2WoJb++3UJ7WduR0HQ35WwsLV7DA/bX5JWxMMsnNvwQTIm0yr3MWdkTt3af2Si5gGe6gFQYP2yl3r64bjS5yOMBBFHlyZyRPk0QuzGcz5S3vp7r/umG3uk1ZFNG8+ogi+EXzOOU80wHAYhagRo2LCc7YgnRQiv4ceQv5nYgPW2Dd28smGlGQhg9YPm9gghexQG1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaNNIvhZyGVXanm4C4yaKofq69YwKuawk1q+6/D8Ae8=;
 b=RxWs79pvJmMnbj2I6uY9ZSfRa0B3+TDO3SqmDxSo5fx9bMseTulJt2IXlj0w74D0Ft6mSGKAqZZ9SDD5AekxyQ/WGGOnPQhynRq5ITBcjqnTKTUwk8w04ni1ULl0l9/SNDTMpIooXKYXwLhu5H+lf+pG0EVtec5/ddqRyTBnMCVptMkw7ueDGjIEPhNToG7dIjYWtxAwr0fC8V5FkN8Urr8dUFg3pcd1EHX/6FVVQ9nHp+dmGsm60PC41p+yObn51Nm4QDhizOWcleNRrV3yYQFsWa9oF+uB+ArrqeR6NQLcqqKOGltFeYcNl83iVKmlGtp1MS0Q5avNteYst5r5ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaNNIvhZyGVXanm4C4yaKofq69YwKuawk1q+6/D8Ae8=;
 b=ciG33K9zNAtzvV5MSxPXVrzDcOvRPtDkbgPJUqPdcQ+z2XL8NDw5vgbfkqtZ26ulMgGj61qSSP4bPUYNxM0oEIgcLFjD74+19EpRg1JeXHD1SuR2BA+zUHhX7kVri1zYr6MnIz4ttkKnuZ8kEQnFyEz90HxeB+S32RFQ+gVRll0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9204.eurprd08.prod.outlook.com (2603:10a6:10:418::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 17:27:52 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 17:27:51 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 12/40] harfbuzz: upgrade 12.3.2 -> 13.1.1
Thread-Topic: [OE-core] [PATCH 12/40] harfbuzz: upgrade 12.3.2 -> 13.1.1
Thread-Index: AQHct4lDOhP1/OJuPEOXqD9URKBWbLW8ZaGA
Date: Mon, 23 Mar 2026 17:27:51 +0000
Message-ID: <915F7C67-4706-4A76-A393-4F9EC418313E@arm.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
 <20260319101332.2067-12-wangmy@fujitsu.com>
In-Reply-To: <20260319101332.2067-12-wangmy@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9204:EE_|AM4PEPF00025F95:EE_|VI0PR08MB11549:EE_
X-MS-Office365-Filtering-Correlation-Id: 12732900-60c8-4dc7-91cf-08de8901a86c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 6ZxEbVKAotrDkjC6EaNX6wPZ4h2xfYXO7YIC4XHSwDkJcNAcuUjJNjwkMgqJH5xHp9zE5ZTKF01ET9eR1okkTcsvMggHGpslQTSSg+yDEaoebEVLwcPEtcDyOdNLFBcs5S0TJMPk9eSmGPAuA0IkwhUc9+1Vu+7ZIMs5h9buvSspbI2PDiLWMS51J+CWPPAkY/mZF85vyN8FsFVtuKUJ3ZOfMZqdVA3lJ9u338fHw+xa+JyVnZzwhUPUozQYKJp6opviA98jb+3WnYFSt4y9PbAjSW+M1wD1QlpR9o9CezGXoNhOHR34HSMiTF3ibEmTUrPXClTp6PNbGhLrRIi6G1gbjx3kyxkrVbTEDqWOB/tFEK49wGTFXYknBTdWbMI9j5pU6xreb2iyGrSiZW2wBSm03vndeHO1YCbYMWBdRSkwm0xIODJYYMiWTpFADSCx8jaZy5sWnnFVnyX7kOGmiuSuFPae/hEAX5bxzby5xQDyFgiOcOTsOI493/fOCwSx8SA1NWt5r+8KFLQuPypjgCeUKW1x+nvLYKF7a1u7/LBO2D6Na3rEqMonS78fime4tci2bd4bZfLujcH+Rhqa66A1b7nSpznLZAbHumNga4OE1Kr4FIbxGRqyJslwIg8+wVtT0F+uukYYExsx2T7SAN5Nk2gxDmS9H6srAJn3ys6q3ESU0hd5LcdNZVevbpxdmPIXkFqQGCyenK6XpvbF4SVm0EmzH8/7Ieg6f1SCtH4Vp0VtDkr/wY/TSH/DXF2nJe5qcu4roY9orH/gryOP9y0yzXeIH44z81TaiBRyaHs=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <026D22D43BDA96479ACD50E3716ABF60@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 qfkk77fHIsUZZB5WBGs9zgvqEFQx3aYmDBrmSVFLG800NppDX/gRExj7QR9uJepHHe+nWFNytsHUic6JKzDZiCcqkwElYuhawi/zxoeY2ezpghfQiJRqrKK3s2FAnfWEZJvM7PkhqalCxRl2pvM2z07ck7uj1Bow5OnothPxbZ8l7F+zhxHH0HybY7HNAlDSn8Mzr68bWqDtYNV+DZREH33wX8XhFbkfxSL4/j0ob/j59z/KRK27LFcQknHwrHY/fQKkMRX7kU2sgjVkcUYm4Jbda5S9hVmE6Gwbj6TpjkvMIatAWxRNvAP1SNSs3N07LAog1d4eZgP5Ce4OLFmuZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9204
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4cd7c414-a90d-4cfd-9bc1-08de890182c9
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|14060799003|35042699022|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ip37NLVHFI957JLM+cx7G0m/QXFEAcZ8+ETXOLlyTfzmKVZybnhXnXkrkar5DL2JFcBZqj//r5pYmq3SYxJ7fi3sPDCgi3M60FGGWjhBGVnEHTIrDbvBOncJz4D2Ay6z5LIRUOvWmox8eScitCdh+uPvJm7ibRjeZl1zxj+PPEO63Co9pJitgBe6ZwYFN+Blq29l4mvlt3pR4Q/wnsS7mktgJOK4zlKmPprQTMMlB0Oir1OY5vtRaxAoplWQZVwGxHoHNZZi5nI2MsDs2+BlJc583oDs7jplIGiyiv5dYCkowJHZejubt0ZTTL96x9hdv78qAAHDooV90Uup1ImKnszttONGUfj8p57djB/qhE7yIvdkJvN8OO7OL5yf2GFd88H5H+C1q5pUPk2ImYTDmyvneSuv1dieVrH1TPhArJpKBhsl3+hIXa6IBE7u+uwLuxN8COzqgzIHzEVukoTUZc3nKBWOjEBImCF9IIXi6NiFNwVIFuK8aVKyds+nL5KBV6PG1LvzbHRKtlj3JjUdkch0rjKQ0bNTbSJe3pXSWGdntg6DR81qHQnmaDGHlyR4bD0xVykk2exfmxpTQF/1zBnzNIoVzRIrLjsn61LeYe1KKrIVOCLAhZ2d5ckadxN6mWNpjWR5BpG2Kbw9CFSEvgGAtpuk8AhsnSSmidhZzeBGx3CtLp90Vd3dyc6FTuxgwWe704VHb3V4hyPYY+Og5CL4TyTXyl5vhQWjZgRxwblpt+zePLUThOQNgJgq6+uCyC5skuj/ItqGD2+/P03uZw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(14060799003)(35042699022)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	At4rJvrDTdvRYSusKs/006WYEOmFOhVZMWBnpOg9rE1qIK4Krds1HejDVjaQTTrNbfp1kxhqcw9m8PknDn6j+l5UnW5/rM/2IKl664PoBQHmT8FpNsehrvh7ml/4rUVP4K88FZLNaU4EIS6SzmzLb+R3J+0rHsxibdC/s6rZObOXEKknpgNogtGaQgyCNXHKDUcGVRq/LVr1l+f57gxVN5ZjBWOkS5IHO9TA/9Kb8loPh3HKpzIVXlS8Wu/BwpMwODaa/qnAra/vJFGrtNSBFal+xzxzyvPuNUCzFwgliDexcgbzvnq5O3s35OtBTjOikGwNNSVijAzNtx8EL0O1w02vAkY1jT/iM4JXxlicnovd6hdTmiyb1eaH2TkUrBnqQVE4UmIKigy6QUEX7Iko12InzlP3FS1tb9kAgRZ7JXV56PkdA0ycm8kTNbGify/s
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 17:28:54.6265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12732900-60c8-4dc7-91cf-08de8901a86c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11549
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 17:29:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233752

Hi,

As per the release notes, this adds a new hb-raster library that has option=
al dependencies on libpng and zlib.

These two build dependencies should be PACKAGECONFIGs, and the raster libra=
ry split out into a separate package.

Thanks,
Ross=

