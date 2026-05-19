Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41136CD4F5B
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 14:04:21 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.2])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22376.1779199455465636462
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 07:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=m7pWGtTB;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=m7pWGtTB;
 spf=pass (domain: arm.com, ip: 40.107.159.2, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vpR8ikC1D0fYU87Cqtpc5VEI6dsjvN5gyIaNrJFRRW589yP8tDffg1gCItCwF2xWaqOYa+tSt/cKBrW+UaQP9cFUYGoXnMAoYKOKADMDhzWj+AXO1iEV5wS89P1ilK9IrZY4n0NQP0VDPy6Y/xUglycM8AuabyIjzNdhPFFvepqILVnsLu/oxbCf52gWrLIWHeomkhi43CvasF814POeHdgy9/Q7N/0MorFfFaUsoyexTl44Kpf9EEPE8RRMGrGuyQuwhv3VdtdPe1K+OGk5+Dr57R5ooYTirTdXB8F+D18BF54jQnZxk2gQPXY+xcefUEgNeeiCF6L1Yx7KTKJTLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTRMib+xw89ZcDMjJnMn29et9NjeKObVn2P1n6wnUzo=;
 b=mFRcg1taBzoWae3Z18/ivvSpaN9LJMj95SB9vogp2zafeGuE2s6cWEqsCyoy2Cy9dMfoPiraUAmtJFdedgXKzhoK96FDyRbw4Oe1wl1f5gZtULG2daIPDna5lQHsrdKmPTTcB1gBNXro9BETHpQAJqhpfVka15XJdE6mAXSkOK1ctEJ7xrZ3UF+wbVgA2Xg/0oK/a/JVfrl16XpKNcAcPor4fxuu7XIeoVmbixeBr4ogV0bFqmDnluPxI44IZzcePMAFV/XMPsXeZz6xQX/xhoqD2ukutpxc5M0geL+Py8y+uZBiHUV4I7xSwOqB6sSDYFeVVny0ej6R6JdOHz8V8w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTRMib+xw89ZcDMjJnMn29et9NjeKObVn2P1n6wnUzo=;
 b=m7pWGtTBKLEDhGp5pOYi+kM6S/EfJZ1boL3Et6mVZteJsyylUtC/z96zuXucRzplTy/ePizp4M8wHsOsgs4Qn6tU6HtPO4QsAyWz4Zvbb6fhVNf2yGcFTRHrnjB5xu1z2LcLqwYj8fSSotw/IE0VseObaH7v05obUql8iVwJpNI=
Received: from DU2PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:10:3b::30)
 by DU0PR08MB9581.eurprd08.prod.outlook.com (2603:10a6:10:44b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 14:04:09 +0000
Received: from DB5PEPF00014B9E.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::de) by DU2PR04CA0025.outlook.office365.com
 (2603:10a6:10:3b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 14:04:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9E.mail.protection.outlook.com (10.167.8.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Tue, 19 May 2026 14:04:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0COJMaGXCGe0MZ6TSYF34oKSFlJ21L1WB25DoDUXxB+jeEAn78fNFSWjzrGTjqZ8ZD8rTOhWiaWCWT8L2N/zMnPyDa5H/+BSCDppCLRv8yD001eM+pSibclgLmOwN/tnhCHNmy6DD+zWrVEzIpDVza7Rf//qOJRb6Ebi4GCO1lQjo6427DObWZ+ysiUvk2Dpgs8uWnd6ecpRSDS2v6hdAetBj8fCz3J4xhQrZr08d45y1xmwSmUaLszgXsjUjSrAwR0T7QSL8LLsG+2YmS4pyUDUMxJUPgCWUZYEZ0ez1HRvu5t55Q/Dn9KVfbOcvQDqqa14ZKBUvjwLm6uZ7D3VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTRMib+xw89ZcDMjJnMn29et9NjeKObVn2P1n6wnUzo=;
 b=ZOSgBrNQhTjKu80X9tvFR/2zY4EZ43Ubq7GTVgNOmJWrppt2puYAmH0GXY8OfKS757gr0GjNciX9sw0SlEw7VAfylAOryDpSOneDrC+80RMg0kyYT7ffxVv3kuW00wW1yT7pe2QrJCDBmoAd2uYoq57IAw8a2u0i7kRb3sH9DPggtMfvtL5S12UY4sOGC8dMV1KX+gISRi4sMt2MrL1MywhBANB8a5nYVYFolW64Wzun/s6PF09OBpQU0I8LzzQ9NKzqnRuX9Dq7ynKcH8l2etOoJcqXgyjsk5VfLLOm2bjxTte/XBFLgJ6rFqf7fob7Lsh8irgCNvXDY64kOrQTdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTRMib+xw89ZcDMjJnMn29et9NjeKObVn2P1n6wnUzo=;
 b=m7pWGtTBKLEDhGp5pOYi+kM6S/EfJZ1boL3Et6mVZteJsyylUtC/z96zuXucRzplTy/ePizp4M8wHsOsgs4Qn6tU6HtPO4QsAyWz4Zvbb6fhVNf2yGcFTRHrnjB5xu1z2LcLqwYj8fSSotw/IE0VseObaH7v05obUql8iVwJpNI=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PA4PR08MB6192.eurprd08.prod.outlook.com (2603:10a6:102:ea::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 14:03:01 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0025.020; Tue, 19 May 2026
 14:03:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Antonin Godard <antonin.godard@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/4] nasm: remove groff-native dependency
Thread-Topic: [OE-core] [PATCH 1/4] nasm: remove groff-native dependency
Thread-Index: AQHc5rG2Kwr1ERQTqk6taMWkgXloALYVQkwAgAAgrIA=
Date: Tue, 19 May 2026 14:03:01 +0000
Message-ID: <E2D51C59-7F9F-4E69-8B17-35A236A5A561@arm.com>
References: <20260518103249.592747-1-ross.burton@arm.com>
 <DIMN1W09G0QB.1G0MELGE2OTI5@bootlin.com>
In-Reply-To: <DIMN1W09G0QB.1G0MELGE2OTI5@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PA4PR08MB6192:EE_|DB5PEPF00014B9E:EE_|DU0PR08MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e942c7b-e2cc-4b19-14a3-08deb5af7f17
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|4143699003|22082099003|56012099003|18002099003|11063799006|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 qaTmWuiMu4Tss+ONarV42GKvghWvD5hGe+OQ3IAfggwNGIMTLk0E+Z/oMndco7CtAUxlkplJPCRr1dp9A/Q3+vjslFJZr//GyW8K44vMpHub/dUCBbUyKoNMSKN6HSm2Mc/W5RignnEUcIEyTvz92vYJUrEtgHhqsI8u+oncpsaC1PtarZDwvmAkJgssnzWTTug8bTumSAIVAKzZFGWzx+akuIl9kfGFf6yQCApsXzgk7rEETDlq3CLHjF17qQv0GyLKF+8q+bzd7+b0V55CZE0WcDJY0I7pORsDJs5nvpzwoK6jcjg8e54niE45sR5pIe1Kf84I255gi+FZMaAuR9+VmgQ81iwYr/HffPmnNpRRsS8LIPj4KKQ7xlKd3+9dN7LGVdxT7GCBgrnp5x+RlE+jLPj7fnScemzHHDElD1MhF+BA3goZ8dfA/SG+5pHY4N7FmZxrCFXV5e/xYYNLAIkG04MpiAiQRoxxr/+vjDdueQ7Zu9jodPiEv0JGOBMOu2ZQ2a/pIeq77T1aGDGYKsVPB4BbrznsymZhov+gqL7OKFv7+ZHoc7FCjYEJ/dpB1FkC1eSWbuSUNoK+YFlPtMnBcK8+bwg3O/TOvIC4ZSoulPRjJ1hqoOPLw9rTs3lC0XyGiWNmchzoUbbTPz0UO4gbLI+wLo/eH8pfMOawx4ZoldmwKpP/LwbmL/Qt/nr9A67D7rGiesdwaiu1qhm/cA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(22082099003)(56012099003)(18002099003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8C505E8367E8B4ABE7D28F7A25811E9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 kvopn49f/Brl8ZdKFtWvDOT+wJ2WkjUlFsaVIrvZs4F8qx2jtBiRnl2xby19pDCclkEyWUxAEfYkvrZSnGFiiIAao9e0uLrRVCNKL37IuHrQnPTjbq3VHmQ3kzXx+GsnkPJMdokStO/xivaeEi2Z43tGf76qoHMjcg6ad8WipLjh2FW+6N1UckGFczUWReu2JVq7DH3M/5sbnCniAkxg8ejiyAkXRrJ182dzS0fjavzG1OHecr6rAOQMskuYs9VP2umjwWz1kr+vYpSa3ySL7OTjLaxYST6LBHnCVCh5tAEdJVdmOAQUvw3RWE/jiKQ9DmLd/0DkBefnQ0cTvciiug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6192
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c0c9ce72-50e7-4699-40ce-08deb5af56fb
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|1800799024|36860700016|82310400026|35042699022|376014|56012099003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	zXhnSDqbBNMqIauHmIBRg8YL76nfWcXWU1c9X14WdWtarzQHJievnG9hf0ato8zVYZxYQ7YaS2JP+JuJLg/5avUbiQGvh+8KMdLh7sUxf9gcu2Rgu3de0z1O70a1lxBRW956uBqIkD08MyHcG87lDRrkBI66tRAnfEpu2/sdA29SikPFcF1ZoUnmZUjRNJmZXG/2IsM+232YHH2LF1iaKqnbrodmjr2ZtgnrGRfgzPWIrLswcRL9sVb8Rl0ws6v+Bhut1miUbsfSJVkNd4BrmhmRb4oykxQGSReNnths2/jSHo5RWsNuLXbyiiEjXzWX8un/thFDS7INSfO0rB7N9lc+Z9g2++VEcHqWYPtwTreN/EU/negTWJJPYE9wzy2BTGJunPYO332YVnAqgAhMK1Gzc6xdONUhE4Z6Zvo3vCJ9qNc7h2haSNwFYbuWrg43vKGoWjZJw6oz8h27cM4QJxwtaED8WB1Y3Wf1OcelnJh91gKmzRtBdcqmuxjGNtqoXa/kEz3NXGn61I35ah+mWg9x1Jk6wvAEpK6vaplsuUPNIy2UYcPxkZlyY+8BiVRDjqkLngL3olz52KBMp8cjpAKmqMgyLqV0FdUxZVk7WJ4G0n00mqEFoScxdiJ4FOJ8iQM3CZO7wDyjdAakgne1qM2yaVZsVthym/jlQT9q0PYFRrDsPL/g6yQr9odCa6KW
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(36860700016)(82310400026)(35042699022)(376014)(56012099003)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	btsXFL/A/yo6llloz+S9J9CMNdCrdmF177PM5mBZlWEYFWzHeisSmAHbKZR+m4iCcWdh0RAsq/q/GYnhulFoirObhK2gcrKsLvzFP45EQ7nfsqyxitQKIvw2OQwZjPU56EunqkHy6kbCnHhAK9BhSf16rnvF4TTVvfp2VZGMs8zBZr1kkc6OrC50y+Wct1uloncsFqqVJM8S2o0MAoOJgF78478Jep8ohz7A8ap5BXR/lvJqTq1iEE2ASb4o9xPLhjGTnjFh/SQmv+hrhKrPb928QIYt8VNE+fUTtXGuTemCXxujexqriw61gUHxwpU1681ENQPT2+/XoB+wmoTNPywH1WRofaQkr9m4EZtepUuXx0aRKZ8xyqLQYkLaxf6MdPlLC1G5tiA1n1kvBxAayyInmtLFF+YzTu3eF1/GK3mlCqPuBwvVJLHGuCLg+fe1
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 14:04:08.8845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e942c7b-e2cc-4b19-14a3-08deb5af7f17
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9581
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 14:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237327

T24gMTkgTWF5IDIwMjYsIGF0IDEzOjA1LCBBbnRvbmluIEdvZGFyZCA8YW50b25pbi5nb2RhcmRA
Ym9vdGxpbi5jb20+IHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiBJIHN1c3BlY3QgdGhlIHNlcmll
cyBpbnRyb2R1Y2VkIHR3byBkaWZmZXJlbnQgZXJyb3JzIG9uLCBvbmUgZm9yIGdyb2ZmOg0KPiAN
Cj4gRVJST1I6IExvZ2ZpbGUgb2YgZmFpbHVyZSBzdG9yZWQgaW46IC9zcnYvcG9reWJ1aWxkL3lv
Y3RvLXdvcmtlci9tdXNsLXFlbXV4ODYvYnVpbGQvYnVpbGQvdG1wL3dvcmsvY29yZTItMzItcG9r
eS1saW51eC1tdXNsL2dyb2ZmLzEuMjQuMS90ZW1wL2xvZy5kb19jb21waWxlLjE1MDEzMTMNCj4g
TG9nIGRhdGEgZm9sbG93czoNCj4gfCBERUJVRzogRXhlY3V0aW5nIHNoZWxsIGZ1bmN0aW9uIGRv
X2NvbXBpbGUNCj4gfCBOT1RFOiBtYWtlIC1qIDE2IC1sIDc1IEdST0ZGQklOPWdyb2ZmIEdST0ZG
X0JJTl9QQVRIPS9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9tdXNsLXFlbXV4ODYvYnVpbGQv
YnVpbGQvdG1wL3dvcmsvY29yZTItMzItcG9reS1saW51eC1tdXNsL2dyb2ZmLzEuMjQuMS9yZWNp
cGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbg0KPiB8IC9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtl
ci9tdXNsLXFlbXV4ODYvYnVpbGQvYnVpbGQvdG1wL2hvc3R0b29scy9ta2RpciAtcCAnbGliJw0K
PiB8IC9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9tdXNsLXFlbXV4ODYvYnVpbGQvYnVpbGQv
dG1wL2hvc3R0b29scy9ta2RpciAtcCAnbGliJw0KPiB8IC9zcnYvcG9reWJ1aWxkL3lvY3RvLXdv
cmtlci9tdXNsLXFlbXV4ODYvYnVpbGQvYnVpbGQvdG1wL2hvc3R0b29scy9ta2RpciAtcCAnbGli
Jw0KPiB8IHNlZCAtZSAxaCAtZSAnMXMsLiosLyogRE8gTk9UIEVESVQhIEdFTkVSQVRFRCBBVVRP
TUFUSUNBTExZISAqLywnIC1lIDFHIFwNCj4gfCAgIC1lICdzfEAnJ0hBVkVfU1lTX0NERUZTX0gn
J0B8MHxnJyBcDQo+IHwgICAuLi9zb3VyY2VzL2dyb2ZmLTEuMjQuMS9saWIvZ2V0b3B0LWNkZWZz
LmluLmggPiBsaWIvZ2V0b3B0LWNkZWZzLmgtdA0KPiB8IC9zcnYvcG9reWJ1aWxkL3lvY3RvLXdv
cmtlci9tdXNsLXFlbXV4ODYvYnVpbGQvYnVpbGQvdG1wL2hvc3R0b29scy9ta2RpciAtcCAnbGli
Jw0KPiB8IC9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9tdXNsLXFlbXV4ODYvYnVpbGQvYnVp
bGQvdG1wL2hvc3R0b29scy9ta2RpciAtcCAnbGliJw0KPiB8IC9zcnYvcG9reWJ1aWxkL3lvY3Rv
LXdvcmtlci9tdXNsLXFlbXV4ODYvYnVpbGQvYnVpbGQvdG1wL2hvc3R0b29scy9ta2RpciAtcCAn
bGliJw0KPiB8IC9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9tdXNsLXFlbXV4ODYvYnVpbGQv
YnVpbGQvdG1wL2hvc3R0b29scy9ta2RpciAtcCAnbGliJw0KPiB8IC9zcnYvcG9reWJ1aWxkL3lv
Y3RvLXdvcmtlci9tdXNsLXFlbXV4ODYvYnVpbGQvYnVpbGQvdG1wL2hvc3R0b29scy9ta2RpciAt
cCAnbGliJw0KPiB8IC9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9tdXNsLXFlbXV4ODYvYnVp
bGQvYnVpbGQvdG1wL2hvc3R0b29scy9ta2RpciAtcCAnbGliJw0KPiB8IC9iaW4vYmFzaDogbGlu
ZSAxOiBsaWIvZ2V0b3B0LWNkZWZzLmgtdDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KPiAN
Cj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRl
cnMvNi9idWlsZHMvMzgwNg0KDQpUaGlzIGlzIGxpa2VseSB0aGUgb3V0LW9mLXRyZWUgYnVpbGQs
IEnigJlsbCBkcm9wIHRoYXQgcGF0Y2ggYW5kIHJlc2VuZCB0aGUgZ3JvZmYgc2VyaWVzLg0KDQo+
IE9uZSBmb3IgbmFzbSAoZGlmZmVyZW50IGJ1aWxkKToNCj4gDQo+IHwgYXNtL3VuY29tcHJlc3Mu
Yzo5OjEwOiBmYXRhbCBlcnJvcjogemxpYi5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQo+
IHwgICAgIDkgfCAjaW5jbHVkZSAiemxpYi5oIg0KPiB8ICAgICAgIHwgICAgICAgICAgXn5+fn5+
fn4NCj4gfCBjb21waWxhdGlvbiB0ZXJtaW5hdGVkLg0KPiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRl
ci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvOTMvYnVpbGRzLzM3NjUNCg0K
DQpJ4oCZdmUgZ2xhbmNlZCBhdCB0aGUgY29uZmlndXJlIHNjcmlwdCBhbmQgZG9u4oCZdCB3YW50
IHRvIHRoaW5rIGFib3V0IGhvdyBpdCBnb3QgaW50byB0aGlzIHN0YXRlLCBidXQgbmFzbSBzaG91
bGQgZGVwZW5kIG9uIHpsaWIuICB2MiBzZW50IGZvciB0aGF0IHNlcGFyYXRlbHkuDQoNClJvc3M=

