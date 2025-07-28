Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F373AC87FC9
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 14:30:57 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.22])
 by mx.groups.io with SMTP id smtpd.web10.82608.1753713056059068583
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 07:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ULdCfqs5;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ULdCfqs5;
 spf=pass (domain: arm.com, ip: 52.101.69.22, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TAj4q7f5hUYiHJfD5ve0PNTtnkof+bZ/sHp2TDgpWv73Sf/2fV1JYGtGeEXeF+6BjdgD6p2CPGn6JxUKykOq3IAQCPZR+XWZR/kBcBnv1VXGe06zR89E7hG9Snxv1MhoPnvbyw/eRGIynvNhbULLPr4fmhjzTp2WTgHK7AcSi80fgJjGyQUA3lS4wCXgemajRLGEp6NQjBHALfl1M0dynjkL8qAZL3klaa+6ermRtaAoCfPKZvobgtp+S+CuS8HjhItS1JyYdIR6ca3tRXzDrT+YoJUQlBSnrMfNPsG2G0s3FdpayZ+iTeikv7cEYQ4aaIwEuxUQnzaGh6k0E8EeXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLuW8Hij4XgwZOyGVRPbvtmPnCjpygwk+tczcgjNqWI=;
 b=KVN1gkQIxI8YfkeI5dxBvF3VAynpVlmyM4VbiWSa8vgCjMQfZxz3EMaxRGsFKoOUacga8hCdGkb32h5nmyUzZ7JkZhdV92WnXx+MSs1SX0ydi3fMFYwKXN8TQ+ql1gWuqGIMjwKhZPl4w0hjBClc5JSyy01nU3uYpXg199WudULbvjJXP0xwK4jr0IryoNepbipnEeh1FCUsUfDdOI8tY9+K4D0E6r7Nf/OYnyTyX1t6jD/d0hOiyR8BFK2ibSKfYm4GdxbHgnOhzC276EvM8Bb4s06RWzZK9H0w6mnSk1TWAmGLaBeBCQbE4N0meRiSAv5gaMUPUyecbpl7eEPRVg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLuW8Hij4XgwZOyGVRPbvtmPnCjpygwk+tczcgjNqWI=;
 b=ULdCfqs5R8iVqPrNghSpndVfeJYtGnBmupZ2dE4JbeR6NfTgElfxGKhE3XXVS9+vzs0/TTg/dUgx0cMRijNq40rpshL1M2k4VXxXgPPEU09BXce5sQkoiqODtfXnooPGddzKb78gq8VMoMIbF8NLpNFc3xIYrSeKp50FZObhUYU=
Received: from DU6P191CA0047.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::12)
 by FRZPR08MB10901.eurprd08.prod.outlook.com (2603:10a6:d10:139::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 14:30:49 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::3) by DU6P191CA0047.outlook.office365.com
 (2603:10a6:10:53f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.26 via Frontend Transport; Mon,
 28 Jul 2025 14:30:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.10 via
 Frontend Transport; Mon, 28 Jul 2025 14:30:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkQuaQiqPrzfPK0tLWge5FzBJXZ9gCbgvrKXtpqCI7uAs947oNDDD8wBX6HaWno9mEEdDrKLGAROt414MKfB0AUtpH+bybm9MM9VHbmEQ87lsfjFX+7/ktjhcNvEVLnQZqWJmlhXayhu51HaJ+YuHMglmfBz7v1KOMiK/fGKMXMeu+G46lRmECwVzMaq+tNrZxkgVRP3ZlmUq6+Ai7iABYjKRtAd/Beb2pVl5WrUFhS2Q1veBEIgLMkbqY6meMqN8LmljFaOzFvDNim6jy07T+eNCnDLCLZd236SY1R5FpB38oPn3nLZD7NzLio6iJOlp/Nopl0bShMTvA+FdjTe2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLuW8Hij4XgwZOyGVRPbvtmPnCjpygwk+tczcgjNqWI=;
 b=xlebKqG5I76Cuhnr1bVv/27tKLQsdpJaM56czGo2vt8Eea1sdEBpecBgs7biwsJuERI8cQT5JOpxJZwDB+voae7iz7x9U77X0QvGPksxxtxRt4pgZDqaRW1oi8OXw4QHOl3/w+98LRmehNqe7weXpBzz4JcxEwemJ2UPRBFptaa3lHVipODC/UN1zJ6HwJn9HuznJcd80heUOPIRpijK3v+j8eo6yJYOcW6mCF+F5280fAEfrxvk0XE0tEmZwPw5diqvNCK+3wEf8v1122G6Zt3Azw3+390kwvmF5V2APCZDQQfh1o0tO3+yqi7hV5wgkXY9r26XgtN3sd9ZZ+Wf2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLuW8Hij4XgwZOyGVRPbvtmPnCjpygwk+tczcgjNqWI=;
 b=ULdCfqs5R8iVqPrNghSpndVfeJYtGnBmupZ2dE4JbeR6NfTgElfxGKhE3XXVS9+vzs0/TTg/dUgx0cMRijNq40rpshL1M2k4VXxXgPPEU09BXce5sQkoiqODtfXnooPGddzKb78gq8VMoMIbF8NLpNFc3xIYrSeKp50FZObhUYU=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by AS8PR08MB6600.eurprd08.prod.outlook.com (2603:10a6:20b:33e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 14:30:16 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%5]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 14:30:16 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/5] clang: Drop dependency on
 spirv-tools-native
Thread-Topic: [OE-core] [PATCH 2/5] clang: Drop dependency on
 spirv-tools-native
Thread-Index: AQHb/26uP1G7V/bXxEu/JPCs/odXQrRHmVuA
Date: Mon, 28 Jul 2025 14:30:16 +0000
Message-ID: <ABC201DB-B815-4F6B-B22E-A54446FA2FEE@arm.com>
References: <20250728032045.2783514-1-raj.khem@gmail.com>
 <20250728032045.2783514-2-raj.khem@gmail.com>
In-Reply-To: <20250728032045.2783514-2-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|AS8PR08MB6600:EE_|DU6PEPF00009528:EE_|FRZPR08MB10901:EE_
X-MS-Office365-Filtering-Correlation-Id: a835f396-c8f5-4275-df23-08ddcde3592d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?QnlZLzcyYXNnYzFIVzJ3NFhrcWhyVnZwSXhXbE04TE5HS0xxaDk0cE9rRENt?=
 =?utf-8?B?M1VIM2FxdHR1UUZTejZ4TDM4Z1Urb1czL3c0T0RRNi9iQjUxd2lab1VHOU9E?=
 =?utf-8?B?RHB1eXhsNzVwR1VZTS9YRURVc0F1eGNVYzhDR3RJVDNzeFVBdHg1RExOTVpL?=
 =?utf-8?B?cDQ4UnE4Rmp3NWJTNzJHQ0N5UElFbTBXbzhGd0YzT3piVkV3SWsrR2N0Mk42?=
 =?utf-8?B?MXIyUGZBNFJ4NjJ3aEMreTZDWUJOeXBVcDd3ZmZNbkp5eVBhOU1mSU1ud3VC?=
 =?utf-8?B?VzE5WGhIV29QNlN3RlFxcDV0K0drVnVDMFF0SEJ2Qm9aOEkzbWFVMW9yUmJX?=
 =?utf-8?B?TmlGcmtNQ2lXdjJqMW11SWYvMEpycFVlVnJvbTJhZ1hCTVBzV09rV2M1eVdM?=
 =?utf-8?B?Q1dnbTRLZDY4MStNdS83VzFQeGR6TC93Nk8xdjlIMFl1R3N5R2lUWmZWckFw?=
 =?utf-8?B?SGNGd2g3MzJ6eFcwYnhsVjcxRDgvbXdXTHJ0NkxORGlNc0QzeVVSQXRMdkxv?=
 =?utf-8?B?QzQ5QVU4TWlySUQxZFJxV0hTc1h0RW0vZWRwa3Y2azErY3AyVzZrMlNIOWFt?=
 =?utf-8?B?eXJ5S1BWY21EaXM5QVFvRnkxcEpZTnpjVVBZQ2RtZG1UdSszeEVPVHB1SnFG?=
 =?utf-8?B?KzlYYlplZjJGQWZ4UFlqTmdPcjBMT3RQYnNRemJXUTVWeVFZRmViU1YwUTFm?=
 =?utf-8?B?YVhaUWFWc05Pdm9Vc25Td3hWcm9MYzM0MUFUTEdyYVlTUjRkLzFweWFFazVh?=
 =?utf-8?B?N0JWbXFsZEVIQklIYWxGY0xRaE9Cd1R2UGxNb1p0OTN2TWRMTEt2R29KNkhn?=
 =?utf-8?B?N3pkYzNFL0JmMFB3TExNaHBIVG1KVHVUR3VoL1liaDNEM0Fsa2oyS1kvMnYy?=
 =?utf-8?B?L3YvK0xOYjZITzRDenBQdkZqSlkra2hldU82VU1tWVhDdmk3ak1FZGtNMTFZ?=
 =?utf-8?B?RHVMYjVpanVYVy84Vnc2dUFWeWxLcGdIUjZteCtaa1ZKRXBGTlAyWHIvbGU4?=
 =?utf-8?B?MFNhR2lLTnhMMVAyNENWbWZ3ekdyZFIxaytTelVqYXNuMFF6Q2dTTkVoQU02?=
 =?utf-8?B?TnhoTjJGQW1sSEwwZEhiVVBJRG5Xd2FGYmJZWjA3VTN5c2ZOWjEyY2ZNelBx?=
 =?utf-8?B?RTVwSnRnZ0JJQ2d2bitjZExnYlRzS3UrNFNZNVFUMjJmdG13MFBQNTk5RjA4?=
 =?utf-8?B?b2RPODJXbkZTWHhRdUdSb2ZNbDcxYmVFVmdacWhpVWF3bXpRWkZFRWFEVW1O?=
 =?utf-8?B?MkJZdSsxdFozQjhPV3lsdTljWlBpdEJFSCtlVXVYa3hMT0ZLc0tmSDE4Ylg2?=
 =?utf-8?B?MWFqQ1o2bXBMa3RkWkFiYXFMSDJEWm1NM092bkYvUXFPangzVEJxbVVyN0Fs?=
 =?utf-8?B?ZEtNa0ZranViVCt3STdIMkpyYUhVSG1sdVJyZVdMZFNIYnhxbURnMENWRjNW?=
 =?utf-8?B?OFhza3Vid3JNN1luZ1lQUGxGVkRxcllFMFJFNSs2OTFDV2hoZklLV1ZMU0FU?=
 =?utf-8?B?MkFERm1EVlYzdEVscTlqRDFUWHBuV2hQQmlQYm9lMGJoWUlnZW9GN0VlT0Nl?=
 =?utf-8?B?bXZJT1RhUEx6M01RaW0ya05sSUNpVkN4dE1tNHB4dUtDaEFIc2R6cEZ6dFdZ?=
 =?utf-8?B?bE56MHRZbFhyejRrSS81N0FtcC9MdGZneXFTNkdyN0h3VWdPQmFvcy9wZyt0?=
 =?utf-8?B?ckhBTk1TNWtoTnU3UEFmYzZvOUJOMVFZZzV2OEMzQXdVUG5UbzQxVWRmL2FT?=
 =?utf-8?B?R0s4RG84MGJCTEdKemNxQXluWVhLRVpmT0FLQkZkWUpGNmIwZFkrWVI4anl5?=
 =?utf-8?B?Q0RWaTJXVjI4YS83UXp0cm8zMTBDN09wVys4Z1BhUXUzV2Y2QXhhRVpVN0k2?=
 =?utf-8?B?TDQreElxUFlaOWdTMU9Za0g2ZjI2WTQ3MFM5M04xYVBRUmRoNGFmTVhzMmxW?=
 =?utf-8?B?dm45UmtlQkR6NGZQYmZIMExhMkgvSm1NYW9LUnhpV1RTekpGVDZHcTVhVENR?=
 =?utf-8?B?b3djMy91ckt3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD348AF4DB2D7A4788B7F422DB3B5C71@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6600
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	08e5b798-2acc-4eb5-6dfd-08ddcde34557
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|35042699022|14060799003|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NVoxRWdxcE94NkZRaFFIODJBNjN3NFpLZVBlZFhlZU5CdDRtdXNlaVk1THRV?=
 =?utf-8?B?RU80WVdmbUp4OTYzOS9MZTN3ai9NaEZTeGNPL3cyclV5NG1kdDhzdmpDT0ZP?=
 =?utf-8?B?SmZPb0psbXJMTEJQaEQyc1poN2I3Y3hqY2pLa2daUzV1N0RRSVppWkRVTW1P?=
 =?utf-8?B?clVyTTlEeEFLem1EUWp4TkJiMjhMWmpJMVhtV0x2WjNlTFN2Ykpqb0dUYWM5?=
 =?utf-8?B?M24vdXNtQ05GY0hVQ01wS3gzWjdpNEh1T3ROZm9oY2pNbEpnOFd0VkpOVzh4?=
 =?utf-8?B?UlJzbXZxcW1QTHh0UmZPV1FoU1pNVmJTNHpWczM4RW9IbmZQdEIwSU5hcDZ6?=
 =?utf-8?B?Z2x3UitSdkRWakJ3Y3VyMkdoZy9LenNJcW1GZGU4Ty9SeHU2YVpYQnh2andq?=
 =?utf-8?B?YWtRNWM1RTJRbi9sSnQ0OENFVHovNXhCSlhvdFV0ZmNVT1g5ZFpjNmlqM3Iv?=
 =?utf-8?B?Qjc5RklpaWczVkVDS0dRTW84V3JTWXJJZUFwVWEzU0VkRWVmUXl5ZzZ2Zmgz?=
 =?utf-8?B?dVp3UkdzdFMremkxeFJnT00vbDJhZi8rY2NhVzJjbURMK0lNTVhhL0JwODFH?=
 =?utf-8?B?MVBsMVIyTkcrVGhSM09ja1hRZDRNRWxsVzkwZmVHU014aTJNMTUvcUlRb1BL?=
 =?utf-8?B?bXdYTVFpZllZUmRvL2xRQjZ4b25ZUHFyZlQzdERseFM3SlRkOE1jM2xxNDZx?=
 =?utf-8?B?eCtuamdKaU8yeXl3TjhWMHZyanJ3OHlJendTenpMY0xScWlxRkpGYjhHVE9q?=
 =?utf-8?B?dmpJSitmR3pnRVAxaGx4eGlYVUNkM1JjSFFCdkZJY1czV3lXd3lpRFJPOWtp?=
 =?utf-8?B?ZVZNbDFoNkJSZ1N6MUxvSVVtZ1dNKzk5U2tMZHlrKzVJNWVSWnFhVi9WQkRa?=
 =?utf-8?B?MEpRRnBCckdka2FPUkM2eGNwbnNORjRtUDlpdnppWW9Jb1M1eTZmTU9Od3ZY?=
 =?utf-8?B?UmVvVDI3a3FLdlQ4eW82cHVFSk9LYVd5L2lMR0luS1pSOXJUVk5SWTUwUllE?=
 =?utf-8?B?ZDdndzhSaU9GdzVTRCtPQ2JLRUpCMGs1UGxsMzdFNWU4VU52bEtYM1A0Zk9M?=
 =?utf-8?B?Y09ybmY2VC9kUVlkZmg3VlFzSDRweUpBNUR4UDNxTnB2NEtKM3hIa1VYZ3RH?=
 =?utf-8?B?WHBKVFRIV0hVUHF1eHJkNGNLRC8vYktDTDhCdDc4dVFVa2ZNY3REWDh6bDJl?=
 =?utf-8?B?YnJRYUUvUlMyRSsxc2hoeE1EU0FsZzlqVUNxVjJZQ0JDWllTZkQrMHJqUlNY?=
 =?utf-8?B?aVphenhDOE5sTmF0d3NSSGFDMHZJa1hqZHhPYzdVMGxMdFFmaVA3Y1pSZWpn?=
 =?utf-8?B?TU1kTzJ2OGt4N3ZnMWdsOEczM3lmdVFqZHZRNVB0aDYrRXlDSk8vQ2NiYmZa?=
 =?utf-8?B?ZllBaUhQMVE4eXFzZG1xbGEyRTJERnBIRTBlMnRhSjhpWGsraFMrd05uZmZa?=
 =?utf-8?B?dTNUTVE4N0tKVGxCaGFoZUtSOTB1azdnWUU1cnUveUNIUmNVTm95d3AxanJO?=
 =?utf-8?B?TkIxVjZHU055VW1wdWplblEzNENKK3YzVkkveWJKaEszRitVYWpKaDBWc1Y4?=
 =?utf-8?B?bW5DZkVIQWt3NG1pelhoYmEvWUxmODhhZmdxcStaTnE0OTJ6UCtTcXlUWXdI?=
 =?utf-8?B?SmVBTUFDMDNJQXhTcm9zaUZjLzVzUmNaMlhHNTY1SmxudDAxLzlsTTFvWC9I?=
 =?utf-8?B?dlVsVmh5Z0hEbE13TlYvNTVDVUQySGgzRmFzZnU5UkRVQW8xSlAyZjBiUlN5?=
 =?utf-8?B?U1RPbm5KTWUwT3VWWHNMZWFFSzR2SXZpWHYyRFo2K1BUQVVGQmNPTFF5emVa?=
 =?utf-8?B?NmppbG5IK0JjdkplVHhqcE9IcDFxNkdsQy9wTGRrOGppdnJJQWFFWnM0aVUx?=
 =?utf-8?B?K2dTNVNvdjZsUnFRc2JXOHBkTUtiOSs0RDN1MU9UOEtiNWphZDdSUlE3c1Yx?=
 =?utf-8?B?NGhIMnI2SmpSM1NqSlY1WEJmczR5VFNJY0MzUm9Ud1VQWkZEa3JtbHN1VExM?=
 =?utf-8?B?RDc5NUFNblBmZkczaE5IZWdtYkJXSTV0dVBWajh4K3EvSlM4UTREckZyaUR6?=
 =?utf-8?Q?g2fsVm?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(14060799003)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 14:30:49.3449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a835f396-c8f5-4275-df23-08ddcde3592d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10901
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 14:30:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221008

T24gMjggSnVsIDIwMjUsIGF0IDA0OjIwLCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiANCj4gc3BpcnYgaXMgbm93IGEgc2VwYXJhdGUgcmVjaXBlLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4NCj4gLS0tDQo+IG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jbGFuZy9jbGFuZ19naXQuYmIgfCAyICstDQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9jbGFuZy9jbGFuZ19naXQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2xh
bmcvY2xhbmdfZ2l0LmJiDQo+IGluZGV4IDgzMGMwMjgyY2Q2Li41ZjBkZGQxYTJkYiAxMDA2NDQN
Cj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NsYW5nL2NsYW5nX2dpdC5iYg0KPiArKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2xhbmcvY2xhbmdfZ2l0LmJiDQo+IEBAIC0xODUsNyAr
MTg1LDcgQEAgRVhUUkFfT0VDTUFLRTphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIlwNCj4gICAgICAg
ICAgICAgICAgICAgLURMTFZNX0xJQkRJUl9TVUZGSVg9JHtMTFZNX0xJQkRJUl9TVUZGSVh9IFwN
Cj4gIg0KPiANCj4gLURFUEVORFMgPSAiYmludXRpbHMgemxpYiB6c3RkIGxpYmZmaSBsaWJ4bWwy
IGxpYnhtbDItbmF0aXZlIG5pbmphLW5hdGl2ZSBzd2lnLW5hdGl2ZSBzcGlydi10b29scy1uYXRp
dmUgbGx2bS10YmxnZW4tbmF0aXZlIg0KPiArREVQRU5EUyA9ICJiaW51dGlscyB6bGliIHpzdGQg
bGliZmZpIGxpYnhtbDIgbGlieG1sMi1uYXRpdmUgbmluamEtbmF0aXZlIHN3aWctbmF0aXZlIGxs
dm0tdGJsZ2VuLW5hdGl2ZSINCj4gREVQRU5EUzphcHBlbmQ6Y2xhc3MtbmF0aXZlc2RrID0gIiBj
bGFuZy1jcm9zc3Nkay0ke1NES19TWVN9IHZpcnR1YWwvbmF0aXZlc2RrLWNyb3NzLWJpbnV0aWxz
IG5hdGl2ZXNkay1weXRob24zIg0KPiBERVBFTkRTOmFwcGVuZDpjbGFzcy10YXJnZXQgPSAiIGNs
YW5nLWNyb3NzLSR7VEFSR0VUX0FSQ0h9IHB5dGhvbjMgJHtAYmIudXRpbHMuY29udGFpbnMoJ1RD
X0NYWF9SVU5USU1FJywgJ2xsdm0nLCAnY29tcGlsZXItcnQgbGliY3h4JywgJycsIGQpfeKAnQ0K
DQpIYXZlIHlvdSB2ZXJpZmllZCB0aGVyZeKAmXMgbm8gY2hhbmdlIHRvIHRoZSBvdXRwdXQgYWZ0
ZXIgdGhpcz8gSSB0aG91Z2h0IHRoYXQgc3BpcnYgcGllY2Ugd2FzIHVzZWQgYnkgdGhlIGNvZGVn
ZW4gZm9yIG9wdGlvbmFsIGJhY2tlbmRzLg0KDQpSb3Nz

