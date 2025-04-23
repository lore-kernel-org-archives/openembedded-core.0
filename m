Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7316FC369D1
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 14:06:47 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.20])
 by mx.groups.io with SMTP id smtpd.web10.9442.1745417205130308224
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 07:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ljJwhfPp;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ljJwhfPp;
 spf=pass (domain: arm.com, ip: 52.101.69.20, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OUWy7uKsxl+nWs1PoEii2HJRH3vO1f/1G7aJOfrsB7suuJHGXcUKy6cruoUrb8WSPKf/tRGrfUSsuxfWaCwm14bd14pdbrIOtfRITn8O3WrVZ92Yqn8eNhhFl2Fya0nh1O2uz6FG4j2+H09potBU1UoAbadG/BY1YPv8yijAdYdysS1RLR5Meur3zkHAZLLOKXXDvPsV2Nn6mIHx0gZvdZOu2qbZCBWDJ9gfVrFSzXpEf2kiEJG+1IzcKqA0cnehOwfGwN8WbENl6IGaB73rs4Af2EZMs4plDIns6xqhyCaQsbcHR//6QWFweqT0/ryoBLozxdpUfH8Pp0JP+qzp0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/IW3dXS8zCiAB6vYcJ7HI6ptN1b4CNvvFPjw43Vbqg=;
 b=cnG1eUvYUEVydmTgWLJcjcx0N5r+zQ3w5qYgFGn0i1IDKiKvUIP7EE/g+Ii9PP09e6Mam1e1P5pdB17G/SUwWAQUTUw+Xg5IQB4n2Sr4/Bk41QM7XRzZQda9qxIoA5aQUHTpQ8qLwmr2d54kY+udsSFqz+X+WHc+6+cOqzDc7ZT1sK78N1WLVjyuDWyOzBQOL6i66sOjE2gfW0/2b+icJpYr3yze2evAV6ZMEoQXL5njelbEpCF9xUzbpGhNauiJLoNik6FR074MjyYxgoThNK9If6ir4hzO1xcUoeGCJt4wnE+RNwyOPvx2jc/Zp7Qf6ZRfdLd9YwciSwL0r/4T6A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/IW3dXS8zCiAB6vYcJ7HI6ptN1b4CNvvFPjw43Vbqg=;
 b=ljJwhfPpv056z9ulP1ZPlYwK4rpWTW3cEKAeQlTTBdZbvyEUSrQIUmd9PKkbBPRARHQeMAEQJ31ChyawYrt7F6vDE3gEh12f2bjOqRGvawB5fkmMRCZplNvN2RdNsqKSHqJrmKG4bvLUnlM0LeffBZ/ynJ7Er1uNS8DdJqjcRnc=
Received: from DU7P189CA0022.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::13)
 by GV1PR08MB7914.eurprd08.prod.outlook.com (2603:10a6:150:8e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 14:06:39 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::b3) by DU7P189CA0022.outlook.office365.com
 (2603:10a6:10:552::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 23 Apr 2025 14:06:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Wed, 23 Apr 2025 14:06:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAwan4zT0XoFyZp4R82/1uHiudV6QI4FcWMB2/hjihxYfrQKPuw0U/0CKWVlyg0ELIUPFknBh/CbUem1lMaS8uzSTQsXvTGwoEZrGgj9ovn7xFT1J7FklNKjYYplpqqDtOngqFME37aPdHfilrC375QLHpDrC24KFDrG3sWCPM+IGXifQ6QbDBKnDiOjgeVQvsgtWBqjzYga4svN6XoW7uUKYbX34pTDVN0fQyUCCbFExKQJALNpwwAwsxK3r4A5D2pEY1BeHT8pz2L74MaLkCH3joh2MqPwJyzL5kheFTtq4OmSPtEUN3Yibr58/l75tHe0l3m3B/hGNE7vGYzyBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/IW3dXS8zCiAB6vYcJ7HI6ptN1b4CNvvFPjw43Vbqg=;
 b=f8MiCyLjuVwetj5X2YNIL0ODwSUzC9nDLDwzm6sjDKFnOGwZkC13vJYXVTIqU0AJDvcP15KSdGX+gNQQpjd+ClIfagN21dYg8g1xzAqD3a1phe7ENMUaAXkN02BMkuDk6TtwGcwrpY99NV8+RL2qET9CEhP6Bt/ffiRTEKRh1ScO0Y6zgPI59lh6bMMxr2VeLyDAfWqUL2VlAn0ljs8CAvQK81ZppUzOOSCPKqO87txP7OV1vy2LZeOxFLlf2ncgRrm9u1u8ZoMFIb9hgCh5Kr3l7am7tDIFck2lBPPyAj0u4WOD/Y72S6/I04pL/xorHn0HfTHpRFkxiJpbkFrjew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/IW3dXS8zCiAB6vYcJ7HI6ptN1b4CNvvFPjw43Vbqg=;
 b=ljJwhfPpv056z9ulP1ZPlYwK4rpWTW3cEKAeQlTTBdZbvyEUSrQIUmd9PKkbBPRARHQeMAEQJ31ChyawYrt7F6vDE3gEh12f2bjOqRGvawB5fkmMRCZplNvN2RdNsqKSHqJrmKG4bvLUnlM0LeffBZ/ynJ7Er1uNS8DdJqjcRnc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6150.eurprd08.prod.outlook.com (2603:10a6:20b:29c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 14:06:06 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 14:06:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Bill Mills
 (bill.mills@linaro.org)" <bill.mills@linaro.org>
Subject: Re: [PATCH RFC walnascar 2/3] systemd: always depend on the explicit
 serial console units
Thread-Topic: [PATCH RFC walnascar 2/3] systemd: always depend on the explicit
 serial console units
Thread-Index: AQHbtEF88f8Ue4+jTE2+NQNifC1xpLOxSSYA
Date: Wed, 23 Apr 2025 14:06:06 +0000
Message-ID: <F56F8E67-6D21-47A4-B8F0-CB7DE8F60021@arm.com>
References: <20250422190053.3244331-1-ross.burton@arm.com>
 <20250422190053.3244331-2-ross.burton@arm.com> <aAjMkh6O3bUq1hjS@nuoska>
In-Reply-To: <aAjMkh6O3bUq1hjS@nuoska>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6150:EE_|DB1PEPF000509EE:EE_|GV1PR08MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: f2b1b585-b1d9-46e4-6cee-08dd8270110e
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?NG40blQvcldXQ1hJbWN3YmxRenRZTHc0emlOeVRHWm1OWjJtZzBlT2ZkeFJ6?=
 =?utf-8?B?UnIrUVdUZGtCZnNBN0MyZ29kTWkyMEtWdzNkUG9DVzNhWWQ0Yk5URTl1SVdK?=
 =?utf-8?B?UHgrOVdkNW9RQ2tWeEkzT2tJL1o5RGFrLzI3YlhQdVMvNklWVmdzaWVpRjZ0?=
 =?utf-8?B?YkJidnB3OFZqV1NabzZMeUlKeW0rR21FaTR1Y0RIOE5QQ1M0UDAyOWtPbG51?=
 =?utf-8?B?V3hCczBMWHE5VDNKd2l5a2E2Y1FrWVhBM1E3SnJkZy9RN1QySXJHaXRHbmlO?=
 =?utf-8?B?MEx6MUxjSU9oUlpwOFB1QTh3QURRbENHaTlVUk5tbEU5cUYyanFxVlZPN3Rl?=
 =?utf-8?B?RCtsckp3bUdDampEa3ExNE5XS3dXUGpyeEhpUkVKd1A1M2ZzNlZzZnMvbHl3?=
 =?utf-8?B?REp5Z1g0c1k1WkZqM0hxbE9XaW9nR2o4ZVdqWFM1d2hRQ1FYeE9BNEVNYmlI?=
 =?utf-8?B?S2xPYnAyUTlQaWlmNzM4L2g3TE16OEhWUzVvb2Fva2M4OUJJVHd1NzVqT3pJ?=
 =?utf-8?B?S1J4a2lHcTZIbHEwSmx2Vi9YV2Q3OWdxQ1cvUWRjRTFVaDIvMjFVYTgzMER3?=
 =?utf-8?B?NHJiSjMzZEFKeTd0RUIzUHBMMjBoVGtaVlFUeGh4MWN0SWlIajB2Tmd6UjlM?=
 =?utf-8?B?Q3N1OGh3cXgwaGp6L3BrazRVRm9HRmQ3VXU2U3RkTW4zK1c4RjdteUd0Vjly?=
 =?utf-8?B?aXZiQldXeHFvOWZVMmtkSXJveHZ4bzkwYklILzJtbXlGVEVwOE42Qzd3MU5h?=
 =?utf-8?B?emVsM2U4d1BlVmNRVlVKQ3E1d0ZoWXNlcS96R21zMDNabS8zc0tENW1BTHNp?=
 =?utf-8?B?Um55WEVNdFZpZjkvOHhTVWpvbm0xeTk5VWFadlErdFdOYVlqWXVmQ3FHWXVQ?=
 =?utf-8?B?MkxEZ3Y3VlJjajkrMnl1aE5maUhMODVYNHJNUEJyN3lJOEE3dnJuZEhLb2xq?=
 =?utf-8?B?cjNZTzNHdmppSE9NVzU2Wmh0OVErZzV3dXVRa1ZRdHdnWjZFTlVsaENjUkRl?=
 =?utf-8?B?c1lxSlVpRGFLV2dkOERtQ1k5M3RqMHdPQ0lPQ21SelpBRzZsV3NPdjVTcGlj?=
 =?utf-8?B?dWlrYVQvWVBPY25oanFwRWcreklQckV4ZmgvaXI2dlIvTVRBN2JDcTUySGZl?=
 =?utf-8?B?NTJBTGcwSXJ4dkFBMitLN3hxV09ESEpRZGttL3p0UHlqbUxLSFBjSDJRNnRC?=
 =?utf-8?B?SSthZ1huSm9JQldlbjhUOWliWElrWmhVdjBLd3dackJWMUw3cDdvM0g5MmtO?=
 =?utf-8?B?cHlkZ2NKbUtObXBZclF3T1NvMmt2UXBwYlBHMzFyNzdqbjgrR2t3dG45T2c1?=
 =?utf-8?B?UW8yLzZSbmpXaEduZXZuSjlsd2ZlbzA1eXB1bnlWN3dLdGlzUDc0NVJtNDV2?=
 =?utf-8?B?S0FScG5PN29mNVMwU3dQMUdHRWZKaTJMbnhxQnN2NXVjN0hiUnhDaFdxNmJ1?=
 =?utf-8?B?dk11eXBBeUhuUXQxMlZ0YjhJUTEzdEtUdXQzVjUwOE9iT1dTVEdWOUpGZkhk?=
 =?utf-8?B?Z2VDWlQ2Tkg4dSs2N3ZjQVhQK1AyL1IvUUpRaFN0MHQ3NjZ3bWs5YUU4Vm9Q?=
 =?utf-8?B?VzhNUXRMcE9UMll0cXVLaVJvYXRHRUhXVll2SmhHejRXckpjcm9wN09rV0JY?=
 =?utf-8?B?c2pnLzZUTGxmcHFtcUFuK0dLdDdLa0pTNloxN081RXBBSXVkMjBwMEpuM1U5?=
 =?utf-8?B?QXk0TWgxWjdYNmoyc3lnN2ViMzRwUU95Q29HdExyM0xnMjJSVVZjTG1BYlI3?=
 =?utf-8?B?V1l0SnJQK3plTDJKVTZpaUVST2tESEFtUm9Eek9uZWZIanBpMlRsaUdLWmZL?=
 =?utf-8?B?RUMzSnkvMjFxYWZxVDZXWlk2aXk2RC9Kak1UQ0pDKzhvTXdUOGUzL0xmbTJx?=
 =?utf-8?B?cFBSaVBMWVZYZ05DNFoxbVR4d3JXckNtc0phckE4VjZYRFpqR1JUUXNzRHJF?=
 =?utf-8?B?WUt6RFVZb055dFNlTVp3RnlvVXhTT2x4a3pXWHhPSEt2NVJWbkNZRTNEREJM?=
 =?utf-8?Q?ENoJpS3QSa7RoPok8U6P2g3p7EC6wY=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B3F59069DE32F418C4FE8455EFE4ADE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6150
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	47021dc3-2ed5-4311-4db3-08dd826ffdbc
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|14060799003|35042699022|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZUU2TUdzNnd5YTJ3NzdvcnE4ejBKZjFIamNudUZkQVJ0QjJkbmgwZ3NpamlL?=
 =?utf-8?B?bmtpNWZFYVhhajRHUEJXNjk1OHZocEdNRC9ZZEdNa24xakRkcGpURmxySTRy?=
 =?utf-8?B?UFo4UlNpTENnNWtEbGNYNTlrQXBNS29wU0VGMVY2QnRYUEdzYlIrVThkSit4?=
 =?utf-8?B?ZnlwV2llQlNwc2tBU3A4ZnFsUW9zS0pDYmFBRndFaVRzUllGT1hMd3QySnVK?=
 =?utf-8?B?c0hySUoxM2NQZlRQZnB5bHlIcWZ2YXdnL0Z1NkZlb3VDZng3WVk3YlNvLzQ2?=
 =?utf-8?B?R25NTEVRdmFRclFoZjJrcmY1bVBSSlpUVkd6cUNoZzh3cDRsSENBRlBxbHRL?=
 =?utf-8?B?RUQrTGR3TUN1aTJDSEIyUUExSzQ1VVhOOVRTQjVmUUY1WG9VZHN4N0FWUCs4?=
 =?utf-8?B?WHNKNURkOTFwbklKS0MyNmlSQloyMHdlQUs5UkpVb0JXcW1pMURva0xOa1N6?=
 =?utf-8?B?RWwvc1VzbG1nWXh2OERSR1FCRURVTVZFUi9zMi9iaU9IYitEZjJXd0pYTnFh?=
 =?utf-8?B?bnM2eksvQXZYWit3eUp2akxoM0dFRkJBbklkZXNURTUrTUZPNUEyM2NUQ3pt?=
 =?utf-8?B?M2xrWFEvT3JiRjlDNmtpQjVMVytsQVV3bTEwL2VOV21nUXVGcHVlaDdZOHFC?=
 =?utf-8?B?ZVdYZHdTbXBUZFlmY0xjS1l2TEVEcU9YN1BUQWJRZFp4RnJ4ZC9YcjhwUjNX?=
 =?utf-8?B?bS9zV3M5cUZkczZzcGxsNWIwTkJsM3pYMkgzSXNqYU5VWk9ubHRFdnBOM1Fz?=
 =?utf-8?B?SVpUT1BPa01NMTRUVUYyZ1lMZG8xT3M5czhod1djQ2dQLzBEZ1NrSDZEQXdR?=
 =?utf-8?B?SzcvTXhMYzhyOWUreDlOY1k4K2gwWCttQzVsZ3RNWThNTUtkNmpGc0RUU3JI?=
 =?utf-8?B?Y1pIK25wRHBIbGo3TkM4b3gyZG1VUmF6UkdCSW02aXkrRHlkbEJ5dE03Q3I0?=
 =?utf-8?B?RGpudXYvYm43Q1lsQW0xazdpYjdJb1BseXc4THNhRVBQcXFSaUZ0RmFsRmIw?=
 =?utf-8?B?NURuQitrL2NmSU1vSDljSTdCRUt3ODBDNHlNa2lXUE10L0w2YXpBSVh2aEFs?=
 =?utf-8?B?Wko4a0hJdHlqd3prUzltZnRmL3ZCM1JZMHRlcnNQa2t5Q0hteE13Nkd2NG1N?=
 =?utf-8?B?S0xUYVdzcFZxL0JmT25sUThqWVhndjRNekUrb2plUWdNUGgyL2RueXVDT25H?=
 =?utf-8?B?WEswWGxUbjl2bHlaWFV1UHoxWVhtcXdZamF3ckU4WkZIVk1XcXFOR3phZXpa?=
 =?utf-8?B?dUFwOXlReGdWcXpOR2pKSmVzelI1dGpIQytDOXNYYVJDdnhBME9iYms0akU1?=
 =?utf-8?B?N3NLMWUrS2MrYnN6MzF4VGd4di9xUjUwdi9EbVNycEhuNExmRmU2ck1ER0ZC?=
 =?utf-8?B?TUIxd01YZ2hFemJ2MUd1bzZkcWRNVlZPM2Q0Ty9jOEhycFVpZnFFTTRpVlRC?=
 =?utf-8?B?MTJ0R3grSjZNOU1CYWF4a09UU1dMaTJRd2Z5a2psVzJnSHRtN3lIUW4zOXZy?=
 =?utf-8?B?KzNkbzhNZDlBSGFIQXhqNGs5QzZWTU9VK0lVUGNNWDU2Q0JRQzlyb29MZWFJ?=
 =?utf-8?B?TEQwRHJXd2FDNExQR2lTemF5dVVZdkFmREd0RjFkYTRjU1FjRDZhVDhySURn?=
 =?utf-8?B?bExxNEdDeU1zbE5LaE5xRGtJSHRrUGdjVno1M3VEZEZGTzJMWTlaT0NGS1Rk?=
 =?utf-8?B?T1VTM21Ja2YySFpzc3RuekppbHdEaG9JWGtGa0xxUjVZYkozdnNzVlJDdHg0?=
 =?utf-8?B?aEZFZzNUNXlHSEhpSWtwOGl4Vkc4WnBTUlZwVmNpNkhvUkhJV2RUNmEreThz?=
 =?utf-8?B?VDJMS0RoMFdQa25sYTRmMzN0UHdJWVhONXB2RWJvOXhnLzIySHNiRk1WdVR3?=
 =?utf-8?B?NFUrdG5DM1lkU3dUSkZKNHNvZTNod25WaEdiSmVnQ0d0R2xvNXlmRmV3SG5o?=
 =?utf-8?B?NTlxOWtDc2JLdnFnYnVBZzdhc3hHbC9leWFvZm5hNjdscjZrMDQwZG4vRVEr?=
 =?utf-8?B?UUZVQW5yVXJBMDh5dFhuVXNhQllKaHk1Zm9rK05TVTQzN3dDZXZOWEJUSitL?=
 =?utf-8?Q?EInefC?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(14060799003)(35042699022)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 14:06:38.9490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b1b585-b1d9-46e4-6cee-08dd8270110e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7914
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 14:06:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215311

T24gMjMgQXByIDIwMjUsIGF0IDEyOjE4LCBNaWtrbyBSYXBlbGkgPG1pa2tvLnJhcGVsaUBsaW5h
cm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gVHVlLCBBcHIgMjIsIDIwMjUgYXQg
MDg6MDA6NTJQTSArMDEwMCwgUm9zcyBCdXJ0b24gd3JvdGU6DQo+PiBUaGUgc3lzdGVtZC1zZXJp
YWxnZXR0eSByZWNpcGUgZ2VuZXJhdGVzIGV4cGxpY2l0IHVuaXRzIGZvciBjb25zb2xlcw0KPj4g
dGhhdCBhcmUgZGVmaW5lZCBpbiBTRVJJQUxfQ09OU09MRVMsIGFuZCBpZiB0aGF0IHZhcmlhYmxl
IGlzIG5vdCBkZWZpbmVkDQo+PiB0aGVuIGp1c3QgcHJvZHVjZXMgYW4gZW1wdHkgcGFja2FnZS4N
Cj4+IA0KPj4gRXZlbiB3aGVuIHN5c3RlbWQgaGFzIGJlZW4gY29uZmlndXJlZCB0byB1c2UgdGhl
IGdldHR5IGdlbmVyYXRvciwgaWYNCj4+IHRoZXJlIGFyZSBleHBsaWNpdCBjb25zb2xlcyBkZWZp
bmVkIHRoZW4gd2Ugc2hvdWxkIHJlc3BlY3QgdGhlbS4gIERvbid0DQo+PiBjb25kaXRpb25hbGlz
ZSB0aGUgZGVwZW5kZW5jeSBvbiBzeXN0ZW1kLXNlcmlhbGdldHR5IHNvIHRoYXQgd2UgYWx3YXlz
DQo+PiBwdWxsIGluIHRoZSBleHBsaWNpdCBjb25zb2xlcy4NCj4gDQo+IFNvIGFsbCBib290cyBv
ZiBnZW5lcmljYXJtNjQgb24gYWxsIEhXIG5vdyB3YWl0IGZvciB0aGUgY29uZmlndXJlZA0KPiBT
RVJJQUxfQ09OU09MRVMgdGltZW91dHMuDQo+IA0KPiBIb3cgc2hvdWxkIHRoYXQgYmUgZml4ZWQ/
IFVuc2V0dGluZyBTRVJJQUxfQ09OU09MRVMgaW4gZ2VuZXJpY2FybTY0IG1hY2hpbmUgY29uZmln
Pw0KPiBTbyBzeXN0ZW1kLXNlcmlhbGdldHR5IGlzIGFsbG93ZWQgdG8gYmUgbWFjaGluZSBzcGVj
aWZpYyBidXQgbm90IHN5c3RlbWQgaXRzZWxmPw0KDQpZZXMsIHN5c3RlbWQtc2VyaWFsZ2V0dHkg
aXMgZXhwbGljaXRseSBtYWNoaW5lLXNwZWNpZmljIGJlY2F1c2UgaXQgdXNlcyBTRVJJQUxfQ09O
U09MRVMuICBXaGVuIHdlIGhhdmUgc3VwcG9ydCBmb3Igc3lzdmluaXQgdG8gcHJvYmUgYSBzZXJp
YWwgY29uc29sZSwgd2UgY2FuIGp1c3Qgc2V0IFNFUklBTENPTlNPTEVTPeKAnOKAnSBpbiB0aGUg
bWFjaGluZSBhbmQgcmVseSBvbiBwcm9iaW5nLg0KDQpSb3Nz

