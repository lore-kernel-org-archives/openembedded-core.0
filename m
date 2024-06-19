Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44E7C2BB85
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 15:35:54 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.59])
 by mx.groups.io with SMTP id smtpd.web10.24253.1718811348054155065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 08:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=lI/U2V2q;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=lI/U2V2q;
 spf=pass (domain: arm.com, ip: 40.107.241.59, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=L08hoSk5E6ILDkPybpvCQMVFYJ2awYhUWnIGSgEBb3XgrpJBT9Yloar6C0q26+E/uIVwAX9lTOIe0eMRO+QbbLHAS8GeHWiTWsrhmvZH8P1WmkSozMSbpB8NanVtq8KK1ucpipDPtwXAlZnjS43B5GnvPhvAvM0JJqW2vcGbtRkmgZQnGSMK8tzTU5DhneZvmBEWNBj1PnxQNIQOiEXnqpoZNr8LK8aaqZMZtA36wFe1lxJfbDkKhRgqs4VnYQJ/yYhIlIl8AzVyKn80fKUoY5F1OLgkOjWFQaGNzqkf8gqWQ8e/ZbMiyWyYzNMaX9NLh5BP3JWzdjFc4S8J3fv0Xg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytZBeZ1o4lTBFTBzcvMdUEeyQrYPtdYPfJtQ/4LSPYw=;
 b=Fu4VWDYImzy4obndYci+W1CFqmU6MWOL+i6Vc4T4OQHKLOxOC7h5OwItZDT47KHBzCOLqGc7cj455FGkBz4NgQNeLYoODr4z/lNaYJWuAxfydvgI7JlWKOwjnWv4oYtTMqAnrRvJ82O1pb4LGJaNWUyGtwzcWcgrAPl4/vCJa83BlmiSxDcThCKQV3kT4KSz61GFKJ62ScrlvQp2aPy/7Ya0suMlcOdT8sGOLZ5HVX07WNCokP/eTSFUFvcAudJiaBn4fAxNs/1csevn5WDh6dbxUb+jrgQS/2GG3Gme5/YoUQE4b2wgkL5MayMIBdUDdqP3FrQYuvIsgVUpw8edrQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytZBeZ1o4lTBFTBzcvMdUEeyQrYPtdYPfJtQ/4LSPYw=;
 b=lI/U2V2qXlCfhFWPayV9jhjUsYNrpH+TPdLh2ex6G8bguP/T50E6BGNQQuBrld/taRVOmMqQKaCER88q0C8QMr5cNQsIDoaqK6z9HRQdSr93fH32TccNUYB9ksEaDLe9Vi5hm4918yieYXmuJ2soSWEZsZtffWnKTvjkiQWiSIE=
Received: from DU2P251CA0022.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::20)
 by AS4PR08MB7454.eurprd08.prod.outlook.com (2603:10a6:20b:4e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 15:35:43 +0000
Received: from DB3PEPF0000885C.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::d3) by DU2P251CA0022.outlook.office365.com
 (2603:10a6:10:230::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.32 via Frontend
 Transport; Wed, 19 Jun 2024 15:35:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885C.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Wed, 19 Jun 2024 15:35:42 +0000
Received: ("Tessian outbound edc8664ba7c2:v339"); Wed, 19 Jun 2024 15:35:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2b0634758ba770b2
X-CR-MTA-TID: 64aa7808
Received: from de2377470f22.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 622208B8-56C8-4370-A1D6-310F69E8F04B.1;
	Wed, 19 Jun 2024 15:35:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de2377470f22.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 19 Jun 2024 15:35:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRNRBnKxRgTVDREQ/RVYwCoFzO/XURhwn8dnRD5D1JUOGbxDDFb7l0oOh3sUKG8sM5zQMVq3Ey7w9pDE9m/MwlKwu2/fa2fubsQ0kev4CATlWBsVVI2ZqGNko6YmDqUzM5tGU45dzoARYfpCl0hWU2PZnP25HWfZTafBAd9kPAKz0JuoN0by5wmklUGsB5E3n0cDF/jlQ9iHzbAmTAcA6eb+CKsTVGednF12EY1FpafBzfQclU4Jk2dfGqMMHlGIzc7JdPGysVxtmoEvEI4pFleED6ZnmK8lRhU70OtTJ89cn3vduD/QOZSOzbEEujNUH6D8ow24IcSHQl3GRr4jKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytZBeZ1o4lTBFTBzcvMdUEeyQrYPtdYPfJtQ/4LSPYw=;
 b=duMPpjQZypRlrl646hMIVqcrhGPVrfctcIVMh6mwNg5JpoUaS0bqduBxCRX8v1aGN3pR5d8X7RJA8ra+GzLMzdmIOnmRNrv7HrCOIZHkJ590SqQlF830n0zlX869RVBFUNjV/hqWyEcGF9X8oeMVY7hbS+c5ELySd/cstZlwwynFwvWP/sA7gBsZJQa1EDwF2ROTwyE+TIcKOkrblwhu/AQuI4W0EWgBccSB0tVVeeSwE3sQbZWBoBbz+kiRSgDftSf1Rxxfirty/z1mioDfZbB0+ec4O+e4Bcy0Cex1ztgAEnPmvdbg77qML32b/sB12WxuirV7CyLvyC1KF60IHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytZBeZ1o4lTBFTBzcvMdUEeyQrYPtdYPfJtQ/4LSPYw=;
 b=lI/U2V2qXlCfhFWPayV9jhjUsYNrpH+TPdLh2ex6G8bguP/T50E6BGNQQuBrld/taRVOmMqQKaCER88q0C8QMr5cNQsIDoaqK6z9HRQdSr93fH32TccNUYB9ksEaDLe9Vi5hm4918yieYXmuJ2soSWEZsZtffWnKTvjkiQWiSIE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8708.eurprd08.prod.outlook.com (2603:10a6:20b:562::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 15:35:34 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7698.017; Wed, 19 Jun 2024
 15:35:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 10/15] glslang: mark
 0001-generate-glslang-pkg-config.patch as Inappropriate
Thread-Topic: [OE-core] [PATCH 10/15] glslang: mark
 0001-generate-glslang-pkg-config.patch as Inappropriate
Thread-Index: AQHawidh25kfEsum70eyS7mUXfcPvbHO00WAgAABEQCAAGP1AA==
Date: Wed, 19 Jun 2024 15:35:34 +0000
Message-ID: <D479E782-0AE4-45EE-A0B7-A7277B728857@arm.com>
References: <20240619085957.2787700-1-alex.kanavin@gmail.com>
 <20240619085957.2787700-10-alex.kanavin@gmail.com>
 <CANPvuRkyyjavWQn2gynunhJpXxAG42+DmKNZ6+eTyumCoUCQog@mail.gmail.com>
 <CANNYZj-ZUTSpxwpycadiwnAyWkK2SbvX7BguE5hr3ZY0Kq6XWQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-ZUTSpxwpycadiwnAyWkK2SbvX7BguE5hr3ZY0Kq6XWQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8708:EE_|DB3PEPF0000885C:EE_|AS4PR08MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: 30472922-1624-421e-236e-08dc90757b0f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230037|1800799021|366013|376011|38070700015;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?VW5ub3k4QnJMSjBiNzhtWjFWcFBDYU1rQXREWjhDUmtXbC9IdGxmUGE1bUZE?=
 =?utf-8?B?UlJlc1dVUVp1cmhKbVBrNzNiWXQ0VFd5ZGNtdlJKbEdhd2duTm1vVlBwQWlw?=
 =?utf-8?B?ZHFKa0N3dmZoYmsrRkw1dSs3UHFjMlEyQUlWdWhnQ2FKK3U4ekEycU1ReDVl?=
 =?utf-8?B?WGxGY0dGN21vejNFSEE5MlBpc01ORWE1REFlUU9vU2xQYkMyU21yb1ljQVNR?=
 =?utf-8?B?OHl3Z3RQUDJkSlRpMEtpR1EzRmp4UEk4bEZvM1pzL0Q2MW0yQllveVJZVldu?=
 =?utf-8?B?SWQ4aE1uMUdVdVlyWDN4WnZDNTI1b3FEcWc1cWpBdmhlcTNrVXlvYjdSclQ1?=
 =?utf-8?B?eEUrT045MTZERmdqYlBPUVVYejdjMUEycllDbmtaaXpNMFFZUDVucWhLYmY0?=
 =?utf-8?B?aE5ucU44eGtBeS8yUU1rbTg5U241Y0dpc2pFQnNwMXpZRDNMcG1JZTk3ajIr?=
 =?utf-8?B?MjVjTVIxdC9iOHZsa2pkMEpHR24xdUVCdFZVd2lYY3g2eVpUWFpjS3RvODN4?=
 =?utf-8?B?eWpPcTZFcWhFcHEyVVhoUTJwdmdEWEQvTlpwYXhwK0NPUW4wRHhHQUo1dUdu?=
 =?utf-8?B?ZDNsTmIzVUpKMllnMWlvWjlJcldWZW90ZnJnU05VM1o4K1BBOTk2N2s5amNS?=
 =?utf-8?B?V2dMbXY4d3RpMDNXOFNQRDM4ZDZrVzhxb2RLbTlXbGxvZHVwT0RtdzRoNXAv?=
 =?utf-8?B?TGVOdEVuTTQ0ak1iVUE3d2pON2haUSsvbldsd1ZyVVhCYTJVWWZkeVJzZXc5?=
 =?utf-8?B?WlE3SmVLMHRVSEpHTEw2UXFEU3BEV1ZEQjEvZm9oanRQNGFCeEowUkNROW4y?=
 =?utf-8?B?NklpbjRMdEg3Y1NralQvN01VMDJqYzJVOVBvSGlpb09lWlhuUS9tVmdreHY3?=
 =?utf-8?B?SmczMFZDMEt6am5uc1h1Z1dITkJPZWQzVytxOXZqSWtXT2xFbXZiaHptVHlk?=
 =?utf-8?B?RnkzMndiMC9uSk85YVdxZEdIMXZUcVBrcjNjbmY2cFBQbTBrWFVFTjdseEJS?=
 =?utf-8?B?S09CdjlZd0pDWU5XclhPUHB5Rnl1VTc4cjFMK1hzNENuRU9SaTNCZUcxZG1I?=
 =?utf-8?B?bU81MnVwODlDeHFDL0VrVE96ckk0UUhzSlJaNkJ2bFNUOHBpdUx4LzB4TmVM?=
 =?utf-8?B?RElxeUJIMmt4N0YzNWtnSEsxMjdPMkhuSENXb0pERGVMNVJ6cml6L3RuYWVz?=
 =?utf-8?B?WFh3QUxqdkthdUQ0QUxJcGpVY2hFQkloSGF5WVZScGd5eE5sbHBYVFlIZENY?=
 =?utf-8?B?VkJLc0VIcUZSV3ZZNjBkNDdaMWZKdjZuc1VRVk84WHU2NXhzZUdjT1c4Tld4?=
 =?utf-8?B?c3RvSTg1OUVwUWFhbGh0cHpCenJTUXVQZk1aRzlzL1hmSGR1MStkdWc5N1dy?=
 =?utf-8?B?U3REejhBaGxvRmtDT3I4QlRYdEwrRG1OUzZSTmNaZFJoQlJySUZkZVluSExy?=
 =?utf-8?B?ZlB3WElsZE1vam5JeGZ4QzJucFBhM2RYVEVzVk9iRjJtOGsrZmtUbmZWZVVL?=
 =?utf-8?B?dm9BOGtJcWR0VVJJeEpnamJuMWFjRWFrb2V1MUh6S2hDRzEreUVwL1dkekVF?=
 =?utf-8?B?QjN1VHpobTBKUkczR3ZJZUtzVUorQmdDeVdDRVBXYjFwcGF3am9IdnZ6MFlT?=
 =?utf-8?B?UnNKVklRYXcwczNLUisvV3Y4QlZnS0M5TGl2VmZoUmw4anVKZnNqZHUxMnhM?=
 =?utf-8?B?MWJXYVNKOHNSTTlqbW9NMkdSeGhVa2FqVjlnZXZmTSs3dWxaV2VaT09HdTNY?=
 =?utf-8?Q?eL/o+uHtsFulEZ3BkeTuBV8KjapNqYwTO3/ZE+9?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011)(38070700015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <45C56EA26316E94EAF269A01237E9441@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8708
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	25d4452d-8cb5-46d3-5ce6-08dc90757639
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|35042699019|34020700013|376011|82310400023|36860700010|1800799021;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SWVWQjBtdVZRYXBvcmRidktmcVBmMHhmM3pyKzZ4TmtOWVI2b1JXUjQ4ekQ5?=
 =?utf-8?B?dEpQV0xlbFU5Yy90YVlEVmJ4VVhRVkVMSmlZRGpNRjcva1dFbFpodjZ1LzNn?=
 =?utf-8?B?ZXlyUXRrbDFYYWhKM3ViQkdyRWNqTGlqZEJ3UC9DR0p0NllRY1FOVlBmYTVS?=
 =?utf-8?B?bU52TlZHRlA0TzZLa2VFVjNydWpHcTBTRTY4Z1lFTk12VFd1Z2ZvUnliQjhI?=
 =?utf-8?B?SzM2Sm1wdEplZDdzTTF3OXhkNERDSGNOVEdMQ0ovdFZHU1JDdmpGSWJwbGtx?=
 =?utf-8?B?cFpTOThJOXRLa2dRRTRRSUE2UXF2cndDSGJVMjR2b0J4VEFHSU1TbURKWURZ?=
 =?utf-8?B?bGlueVhKQ0RaMmh2SGI5SnBLM2pzZkJnMDJEV216TUdpQ3ZFd1hEbDRXZ1dH?=
 =?utf-8?B?cm9KYWhvUy9mSUpxNXdGZjFSUms1U0JTZDA5M2RJcFZ3bTBGei8xYXdSK3pr?=
 =?utf-8?B?d2RyU2xTcWNpN1lEVXdiMkdsbWpZbDVaTzArYlk5MWhPQk5iKzBpdTRRcUFM?=
 =?utf-8?B?ZXBjdGh3YnBHbU9VM0Jsd0JURlhFWmRNS2FYMUtBdFdoMVlLNzQ5enRhS2VE?=
 =?utf-8?B?enM2ZnZjSjVPUThSN1VqOUhTODcveFllZEdiV0lSbUlGSWR3ODN0djZIV0xh?=
 =?utf-8?B?aDVrc1dRbnpZSWk0dnRicnBKQWIrZ0ZIZ3pXZkM3WEszL1JEWlJucFVMNWIr?=
 =?utf-8?B?Yk5RTWZqVlN2Vk1NTm1kWG4xVXJPdDdoSDRJT3k1UVZNQXNNbW56L3lEL2dw?=
 =?utf-8?B?VWtYaWxFSGZ4d1RvNHNMT3FPNStuM05WOXB0TTk0ajNmOGgvNzNaT29peFlM?=
 =?utf-8?B?eWx2eXpWU0daeGNXTlZLZ3lHc0tQZHpZZUdEUm5BL1dmRUJDNmQ2NFdzSG4v?=
 =?utf-8?B?aC92SFBWaVpiU2NVZ0hvZGdnamVDZDlGT0piUmVRaTd2NE1HY0NKampsTk04?=
 =?utf-8?B?U2NZNkZFdkZyc2R4ZE9tY1NmRHFIaEpaL1RjY3hDKzhCaHo3SDNyVjhpYW95?=
 =?utf-8?B?Y2F2b1I1eXQ3aEFidm1vWXZMVFF0VnNQSTc3ZXh1SkFpM0tKY0tmMDFJNkRz?=
 =?utf-8?B?SEtZNkdpamx5b3lKU0VyQktlZlZ5STZYcG5BNVBJTXhLZ3hoK3MybzVrWCti?=
 =?utf-8?B?RjVUb0luczQ4SXZScW5hRm9PQkVZMlhYTXFxaWZMV1VrZE1FckhheXRtbSts?=
 =?utf-8?B?czJkK1cvWlRzT1hNYy84Q0dGY05zWE5va2l1bDFPeTdTZHZGMjJHVnFGRDBu?=
 =?utf-8?B?dTNrcFlUU2R1NVZxVWUwWFgvdjNIbzRCOTh0eXh1T1I5dkZXS3N4dmxZOVFJ?=
 =?utf-8?B?Q3NtYXd1WU0wcjU0VGZSTjdwQWxreXBjV1J2QU1SVGx5TktuWThuMEFIMFh0?=
 =?utf-8?B?VVpYOC9wa2hDL0xURWJ0QmkzRmdxdDRxVWsrQm9ITGFBYnVHcXlmZUc0VVd5?=
 =?utf-8?B?WXhLWUxWT01LVC9HMVlXd0w5T1FZVWVHWlFWSysza3lSQ0lwaXFzQzFtSEJv?=
 =?utf-8?B?RkMxOVJncVR1MVlSa3AzSjFsREQxWUREa0hlS1BDSi91SHB5akgxWSsyQUZO?=
 =?utf-8?B?TnJGYXpkUUE0VWZyckxhU3NEb2xOQ2RLZ2dEMCtiSTBSZUMwWXpaNVZudXlw?=
 =?utf-8?B?UlRDdGtGSGZLR2ZtVUorUUgrYklkMTRPWkZMdmtuZkl4S2w4bGZtZ3EzZzMr?=
 =?utf-8?B?RmlrdmxyaWNvbndrclB2V0ZYWnlnTTZ1MnN4Z0RIRzJZcVFveUg4TE8zeXpK?=
 =?utf-8?B?NmpjUGR2R1dzN2pGTzBpZUdwSG5acEVQb0E3dmlaRzZ4OGFFYklqWFBpSVBY?=
 =?utf-8?Q?jIGUbhWFvNE7UCtmctxEyJ1a/xNohM8XGEZR4=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230037)(35042699019)(34020700013)(376011)(82310400023)(36860700010)(1800799021);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 15:35:42.9930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30472922-1624-421e-236e-08dc90757b0f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7454
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 15:35:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200917

DQoNCj4gT24gMTkgSnVuIDIwMjQsIGF0IDEwOjM3LCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyA8YWxleC5rYW5hdmluPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgMTkgSnVuIDIwMjQgYXQgMTE6MzQsIEpv
c2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPiB3cm90ZToNCj4+PiAtVXBzdHJl
YW0tU3RhdHVzOiBQZW5kaW5nDQo+Pj4gK1Vwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBb
aW5kZXBlbmRlbnRseSBkZXZlbG9wZWQgcGF0Y2ggc3VibWl0dGVkIGF0IGh0dHBzOi8vZ2l0aHVi
LmNvbS9LaHJvbm9zR3JvdXAvZ2xzbGFuZy9wdWxsLzMzNzFdDQo+PiANCj4+IA0KPj4gTWF5YmUg
d2UgY2FuIHN3aXRjaCB0byB0aGUgdXBzdHJlYW0gc3VibWlzc2lvbi4gSXQgaXMgbW9zdGx5IHRo
ZSBzYW1lIHdpdGggdGhlIGV4Y2VwdGlvbiBvZiB0aGUgLWxITFNMIC1sU1BWUmVtYXBwZXIgd2Ug
aGF2ZSBpbiB5b2N0by4NCj4gDQo+IFdlIGNhbid0IGJlY2F1c2UgaXQgaGFyZGNvZGVzIHVzci9s
aWIgYW5kIHVzci9pbmNsdWRlLiBJIGxlZnQgYQ0KPiBjb21tZW50IGluIHRoZSBQUiBhc2tpbmcg
dG8gZml4IHRoYXQuDQoNCkkgY2Fu4oCZdCBzZWUgdGhhdCBjb21tZW50IGluIHRoZSBQUuKApg0K
DQpSb3Nz

