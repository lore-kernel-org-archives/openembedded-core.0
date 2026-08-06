Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8090DC56207
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 15:08:28 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22014.1786028899310025626
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 08:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=D5QvZMrS;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=D5QvZMrS;
 spf=pass (domain: arm.com, ip: 52.101.70.9, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=F8Gm3Y5c+TT2VCLMBR2d2KKabbItL0Vid7Q2E9q80v3f2xhPB72sKD13SXREv3i5FtPVpOK6iIUsuoW5yPdjDtLWQEb0Tc2k5vT6diHgnaSkVCdXTEEWpEkCKjUaVK0+McbU/82Q8gO5iSSuGo/YnpLyHJ/RZfMgbsinmXzDJ+RPism67si3uJXVgZE05RKXwrm00VxlzAv4hX2ysjIw64IlYDTWsHBtGrlhd3ZtwxdeMplpu1EGwm+2ZlRAHlDE1jNUVynPSa9hw/aH9834s8JXXvlvyhthov2N9o2IL2+eFYJMRsHmSsSAOfdOdP6RTGr1JXVvp8O0idNcF1eGoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELufy6Kyr7RZxmwPD4MmU/Uba5VVB60hMBsXJb2JP8c=;
 b=EXuKOPcpR8WxyLHAyX5Usd8x6PWDKy1VStkPZBGFdkLp63DI0lmV+F49oVdKlhy/rnVJCBdOC1pcbq3xLBdOQXvlUjPoZgH+sX8vyCCBbuXqQhlqUhi83zoqW3Lx4OZIE5rbdUJcyIEI4MFeBZXmp7zL9WE87BC1Xdgfh46vNs7fxw/+c/TrKPLqIMK3NOKrtHcHdlBSIa9sKtm94mC8WquTf2urHCsEBivVl9vn9SFYsL34FPhyt8PLjnJQ/QrEoxWWO7YuD+zD12MrqK4LtOURx3OyPIe0J40PgyLwK6gA4t2FLaw1qAJDG0w3UPtT32oDXoh2zo30arrCLrBhyw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELufy6Kyr7RZxmwPD4MmU/Uba5VVB60hMBsXJb2JP8c=;
 b=D5QvZMrSTXKlmShqtgPj039lHgam/v6VrwU9HklKIXAjGMqC1t8ahHmpmq5KCel6XKJMX6WBTpdxRHiIRibxwo1xRyJMUbnDsXb/jWSpVxtH84qwc3CuoyBLPE19RzZw8098pxAilZ1HYz+P92+85KzC8JO/M4GifvKo19kCBzI=
Received: from AS4P192CA0024.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::16)
 by AS8PR08MB6357.eurprd08.prod.outlook.com (2603:10a6:20b:31b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 15:08:14 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::2d) by AS4P192CA0024.outlook.office365.com
 (2603:10a6:20b:5e1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Thu, 6
 Aug 2026 15:08:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Thu, 6 Aug 2026 15:08:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j09krFDnCRHWciZuBwX8Uf1t2wfrbCtm2FGRKwLIQlJ6BPFYIUoVl9TDHazHvP//NvrP3xuhmKUI0FysHga0yfaE4xgbRo6pVxiSM96bUduvWnqjJzsEGJxm3khx/uTdsd+eVHmIhABzbLsv8U67Hcv02g4oDfG8rn8/ClS76Z9/xVc8zQ6fPlB/EghmLzW+lgBI6jNG+GpEE/1PPSbbR9Km2TQppIMh+oxUWzTIJ+IWyjyCFo9dAIbP4P3wkPmjmuotKKjC7ca/loKlGWMVb8f+vpm6VE7jKZQbngQBYcoBtc5pWH9LcemA3eEQq2TmHAiDUq/oUEKZ/uC6edLp5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELufy6Kyr7RZxmwPD4MmU/Uba5VVB60hMBsXJb2JP8c=;
 b=cQL+fzaiS2f1YxKwe5Q0Guh48dYqYTyi/29z51nF2qaZ0B1egcJcq7dNAk+9+vMESD5582FlhA8ETqbRpwBxJQQ1GdbUp9fZMlQ5lWoik9syzky5N1twg+tz8ZpitFRYNilv5kRVmaf0/AzwKiojcTm8k+qgyiNwGt1X27Y5KXj+UdlHB3z99QNKPNuxYgtlmqfT0EDd3tBhZRPQQ3JI2SIKXe0vtdsgZpMuisbWP3Wa2iZ5KYYi90Rb7A5RygzdU6RJd4on/ch95rrm8KwFMTax/Fla2F/l9cnoa0/1ZSZJrQhESWDSkEG43HE4g+VFxmW7wnRDiKgd1vFQuYGdCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELufy6Kyr7RZxmwPD4MmU/Uba5VVB60hMBsXJb2JP8c=;
 b=D5QvZMrSTXKlmShqtgPj039lHgam/v6VrwU9HklKIXAjGMqC1t8ahHmpmq5KCel6XKJMX6WBTpdxRHiIRibxwo1xRyJMUbnDsXb/jWSpVxtH84qwc3CuoyBLPE19RzZw8098pxAilZ1HYz+P92+85KzC8JO/M4GifvKo19kCBzI=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GV2PR08MB10384.eurprd08.prod.outlook.com (2603:10a6:150:b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 15:07:39 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 15:07:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "pratik.farkase@est.tech" <pratik.farkase@est.tech>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Trevor Gamblin
	<tgamblin@baylibre.com>
Subject: Re: [OE-core][PATCH v1] libpng: ptest: disable for riscv64 due to
 timeout
Thread-Topic: [OE-core][PATCH v1] libpng: ptest: disable for riscv64 due to
 timeout
Thread-Index: AQHdIys8qLsOuvNzHkaYnS4ANDfUyraMHI8AgAUHsQA=
Date: Thu, 6 Aug 2026 15:07:39 +0000
Message-ID: <700BA187-ECB4-46A0-BE32-48D55AFAD60F@arm.com>
References: <20260803093344.15211-1-pratik.farkase@est.tech>
 <30940d7e4b46c8b44c0921956fb0785b4d164606.camel@linuxfoundation.org>
In-Reply-To: 
 <30940d7e4b46c8b44c0921956fb0785b4d164606.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GV2PR08MB10384:EE_|AM3PEPF0000A79C:EE_|AS8PR08MB6357:EE_
X-MS-Office365-Filtering-Correlation-Id: 07d40d6f-d55e-4bee-1e9e-08def3cc898e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|38070700021|6133799003|56012099006|11063799006|10067099003|4143699003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 KFyVqjdzrlavHjs7T8+Vg3y7tdhLtf5b/UWL4OZ+SbH16XSA7sv/hk7wfxUkWDILP3xaouy0P/73lne0fiotKI4jN3af+wJYxisQY8ShTroJWUtrw1GObfPW0EIx6CYa9so2f7uXNxRnl2bUTSS+m521hBoH9T09fZuvssbMMIwBlA43FLcdcpcd2kgmmHL/6mFI1hS5wuJEgHkxavABIkpIwkqbboaAyhVm9xDrWBQc5I2NnMQKScDcc+hjVO7be/4qGBIk2rYTqHhGLaGjvWl/ezLxFcsW74/ACqo/CO0/0f1qG1ddUJGgai+O8eWDYnb9N9zN4XD9G+acISAitRDjfF/fLRVI871vlc9MpGLWld+trwKDNtSziX+xclQ331fSPmYg0R9QP3xMVsja1PY+GMgqkVAdXjh1PtjE4VEHvfFY3Nrv6y4+KagxJjNV7cx1RWMGBXLkzFxhuDu9ugwqbXqw/BX2/6yP+eFMSaHvm7lKSRkXKFOLRQYqbi+btPVGry6NXKy+l9cmA5VQaYXKzEkfvqLoTWAWPeBCfXqmRTZRrhJ6hHvqCfa6YeJBKOoSaVgOVW5RMb9SK9uH0pCt/O+7kiLaCjGA+JJsOLmBpYUXwlznSbBXur7bOgwb1TW5qVCQorrUGzgGpiFU6+reccsKiI4elb0h2tzTwQIHrMy2EGyN1mLyaxrRB78b9lOoQr2L+TTv7uZfehdXB1/ID0xBcjsHrIBTmXDJy54=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(38070700021)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D05DDFAFEBD71C4CA96315ECFDE3C339@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 TQIx7e7l8EgCg+aj883xIOa4SJMwEa5htiyWfPn6cx8vjB5MGqi0TtroHtoVCjLR26U/rqdnZlZtM0vssvlrTpIuGNaej1J6WKwwla3Ov6cI2HZMZ6NbOdMXtTlyn9npWiYd45ek3R6GnjgXh4uT/TElzfk9f0frp/1h160WS162jZeGYh0jrkxnDyjGVZB6v5uYCyc2MWAPlM9zHwHwYK7Dkrkk3JK9JiLLQtZM/FDgFN5OW+a7VXs/lpS+BGDepat7SOOOAwhWOHe+y3hitN3w3Lv4V6rJX/j2Ii5XIKx13kmvGKjk57JSj0M1Fv+3G5TlkuLAzPNBRITjg0Hpsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB10384
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9ec8b8cf-47bd-4206-f1df-08def3cc74d9
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|35042699022|14060799003|36860700016|13003099007|6133799003|56012099006|11063799006|10067099003|4143699003|18002099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Ow2rCum1021YY1i4fuubseHnahyAOL3MNlHd6M0+Ulp8NzQ54TDZU2wV+FOBTrJqk5m5DRUAKv8J3aVzkfztyESF0bim8eU2DNJBd1xs7225P+8h9IIXTCpNPO747hymwxWoR13/z771Medg6iC7esFhkhL9FEDRFGIxt8zBoO8ZfYTqHLErZqvMabxYzyA/L99aaqZ2FrW1rALSWZRPIcSi6WSgX6PhyxMJLQPmz674Q1Zrb8SDshodw0SHrKqJEY+fEH2kEkQpRTWPOvBNTTajKahUTseZtSPwr+liu58JB4EGY8puiHRaBaAK1DDOe3FsDjvEQEwoxNLfKNqselCFhVaND4ECEA1+2qCfbrKYglN7cdDynhqN63icnTFNPdKnsrooc2dD1lZHQlFUorQpDfYMkDqRskOgCZ7jfYVpvmbDng9sSKs9/3kFnRbEcWzOxGQgmoMvkC9tb7kbHx6toifoBWoitxlPrXwAa343YEYGWe1AZsx2mTL38TkEcZFe7xGU6xb1bSXghnVEO3buFb6n9SoLWc4yH6M9FnPYkBeWe9zfHHAug9/37b2i3VRk6uaQw0KTKKKMrJply1nOMgETPnFzrDJdCLwfTFZXhnrmPevEmGD8pl7ytd30AJmTVh+s08HussOr42YmtdIs8liq7ClVVOjWx7thzbGpFf5O9/sSga2XwipU1BGTdt7yiYCH739viryC0yq4ZA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(35042699022)(14060799003)(36860700016)(13003099007)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(3023799007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	o8l7kp6j+LbddxoMvLAkI7eKLeN2+oOvl+h98ZLohJBCGeftOLz5+3fiGQqjeC5rtUxvttrlcEiqnt4T4mrhcf7EemaFnoURmZcyFzIdMAZyRIJqO8+lC/jfDSXuPNAhBUo3ADv6buKpqHDo3mXn1TqB9CG3rMLxhd3hl3uDiZ1q9n+/waJA4WyynYV1cshiRl3C2dVpdqPcCWLhaz2F9MgtApri/a6ZCqVKmxWlqxQYfPf1ygZSKijh6vmy1Z8SP86UFX8qkbsaFNXl18XVxZV8HsG84cEt3+ZtV0txullxLfye4rMzvteBqxXXIfaqZMn3oyUZsNpfI4r9BMmNh7KVHi7K+M3FJj3/0oU34f648SYN0BWRKlHtc165sBeww4m3D7YYEyglBpZI8mP/WbPU5G1qbdvY9CDmlRCYC3tGTLnkPoQFl0u7GDUCsph2
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 15:08:13.8986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d40d6f-d55e-4bee-1e9e-08def3cc898e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6357
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 15:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242951

T24gMyBBdWcgMjAyNiwgYXQgMTE6MTgsIFJpY2hhcmQgUHVyZGllIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxyaWNoYXJkLnB1cmRpZT1saW51eGZvdW5kYXRpb24ub3JnQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+IHdyb3RlOg0KPiANCj4gT24gTW9uLCAyMDI2LTA4LTAzIGF0IDExOjMzICsw
MjAwLCBQcmF0aWsgRmFya2FzZSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4+
IFRoZSBsaWJwbmcgcHRlc3Qgc3VpdGUgY29uc2lzdGVudGx5IHRpbWVzIG91dCBvbiBxZW11cmlz
Y3Y2NCBkdWUgdG8NCj4+IHRoZSBlbXVsYXRlZCB0YXJnZXQgYmVpbmcgdG9vIHNsb3cgdG8gY29t
cGxldGUgYWxsIHRlc3RzIHdpdGhpbiB0aGUNCj4+IHB0ZXN0LXJ1bm5lciB0aW1lb3V0LiBBbGwg
aW5kaXZpZHVhbCB0ZXN0cyBwYXNzIGJ1dCB0aGUgZnVsbCBzdWl0ZQ0KPj4gZG9lcyBub3QgZmlu
aXNoIGluIHRpbWUuDQo+PiANCj4+IFtZT0NUTyAjMTYyMTVdIDogaHR0cHM6Ly9idWd6aWxsYS55
b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD0xNjIxNQ0KPj4gDQo+PiBTaWduZWQtb2Zm
LWJ5OiBQcmF0aWsgRmFya2FzZSA8cHJhdGlrLmZhcmthc2VAZXN0LnRlY2g+DQo+PiAtLS0NCj4+
ICBtZXRhL2NvbmYvZGlzdHJvL2luY2x1ZGUvcHRlc3QtcGFja2FnZWxpc3RzLmluYyB8IDQgKyst
LQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+
IA0KPiBXaGVuIHlvdSBzYXkgImRvZXMgbm90IGZpbmlzaCBpbiB0aW1lIiwgd2hlcmUgaXMgdGhl
IHRpbWVvdXQgb2NjdXJyaW5nDQo+IGV4YWN0bHk/DQo+IA0KPiBEbyB0aGUgbGlicG5nIHRlc3Rz
IGVtaXQgb3V0cHV0IGFzIHRoZXkgZ28sIHNvIGVhY2ggdGVzdCBzaG91bGQgcmVzZXQNCj4gdGhl
IHRpbWVvdXQgaW4gcHRlc3Q/DQoNClsgY2NpbmcgVHJldm9yIGFzIHdl4oCZcmUgdGFsa2luZyBh
Ym91dCB0aGlzIG9uIHRoZSBidWcgdHJpYWdlIGNhbGwgXQ0KDQpJIGp1c3QgcmFuIHRoZSB0ZXN0
cyBsb2NhbGx5IG9uIG15IGFybSBtYWNoaW5lLiAgVGhlIHB0ZXN0IHJhbiBpbiBqdXN0IG92ZXIg
YSBtaW51dGUsIHNvIGEgdGVzdCB0aW1lb3V0IG9uIGEgcmlzY3YgbWFjaGluZSB3b3VsZCBiZSB1
bmV4cGVjdGVkLg0KDQpJIHN1Z2dlc3Qgc2VlaW5nIGlmIHlvdSBjYW4gcmVwbGljYXRlIHRoaXMg
aW50ZXJhY3RpdmVseSwgYW5kIHdoZXJlIHRoZSBkZWxheSBpcy4gIElzIGEgdGVzdCBoYW5naW5n
LCBvciBpcyBhIHNwZWNpZmljIHRlc3QgdGFraW5nIGZvcmV2ZXIgZHVlIHRvIHJpc2N2L3FlbXUg
YmVoYXZpb3VyLCBvciBzb21ldGhpbmcgZWxzZT8NCg0KV2hhdCBtaWdodCBiZSB1c2VmdWwgYXJl
IHRoZSAubG9nIGZpbGVzIGluIC91c3IvbGliL2xpYnBuZy9wdGVzdC9zcmMvdGVzdHMgd2hpY2gg
d2lsbCBjb250YWluIHRoZSBmdWxsIG91dHB1dCBvZiB0aGUgdGVzdHMuDQoNClJvc3M=

