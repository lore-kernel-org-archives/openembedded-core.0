Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F38FC369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 11:18:05 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.15])
 by mx.groups.io with SMTP id smtpd.web10.37232.1745320676536298974
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 04:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nBnoeSWT;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nBnoeSWT;
 spf=pass (domain: arm.com, ip: 52.101.71.15, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jp+MvLLqeB7eqDhb4VCRP9sXrH3RkMg5aIZhiXIYHRxC0oBT92Jf5PLio3/6dSmWEJxFW50kVVlasfzueloXCGJIAHgl5KN55j+qnxAdFfrt80GSxvWD+eWfBGCFmukb7QStAAYse0GLoc4AA6oeXIu0yrfesyQxM/4qKG39CvoMEn8NYuJMVHD0FzSAKZ6WWbYWSYXCOtwJxZB9MRXJtsBNGzy0Oz/SyUi4bLUpR4dkbcVEj6iIhuWmefuGwcSecDFy99DQ9fxvQwAXM2Lpxc6f2J2ENduqL3S2s+4BKQRMgmKbJXxqx2Vn8YDAoBBDxEiWjjYLkm+LNGfKNjyPcw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6K0yMdpyeKymZ6RctG9rrwXsQ+8Dt8cX+PZSlpusp2w=;
 b=T51MGK0ChnT9g7vsFl1Dk8A66V/yva0SbCKziD9D8WqNwv7Eu+nxpKEWa8m3UXWb8rAGnWSY2TIL7tlO4/jOa+KS6R1FH9WS1N6XHJjDJHOmqJ7iPYor5kv4hsaqiIk0yjiCrob+Ojz7sGiCsG8JOjMbpngX3aYgEP3cXAxdgCWtr5i8cdGKPvJEz+cG4XOcbx/lLcqxczmPAjeeBDh79e1JILc75d8ulDFNJhLxlcC/N1Vk70kvYFvuBy1xhVuB1XfS8/PFBAihIbHH8qKv8EfwyJX20BLRS/Ol1waDu2+LvZBd7bbvJ6hUNi3NZ3SFaPE8IagVnKZ7xchbtoi2Og==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6K0yMdpyeKymZ6RctG9rrwXsQ+8Dt8cX+PZSlpusp2w=;
 b=nBnoeSWThLjeW4I2/ZOS08zXSwGA2dy8G+JOq4V56DhMfAS1ilGofzVRLByOLZiIjsdLmkRY5ZuztImO72L8X1mh6gWJqN0TfQ72JR9mEfrMMqFrMqWTkyM6aLrNdzHqzoOQs3giTR7P+H1tiLyoL2J2LObpfR+9mHlbAZT7iSw=
Received: from AS4P195CA0005.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::14)
 by FRZPR08MB11072.eurprd08.prod.outlook.com (2603:10a6:d10:13a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Tue, 22 Apr
 2025 11:17:52 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::e6) by AS4P195CA0005.outlook.office365.com
 (2603:10a6:20b:5e2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 22 Apr 2025 11:17:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B5.mail.protection.outlook.com (10.167.16.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Tue, 22 Apr 2025 11:17:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHqY1O7J1kSK03JcVoJOTZ+040pRcH7LRMwrfpUCNaKbF+Ua+Uryr9AnqwocYfGY/AAvLiAV1TvkQrbdmlQ5/I4r8Qx/Y96CG2DomtOJkrP6fGXJH9HwkmzpzQgEuC+5EKbk8fTi49jdhni4T39QHSwalZTjl+o/hEqPm/dIX51kEvu7Ug74WLUXPtYMximD0DtFYyQqPz55NuQiAyl/IFaslkFKo2xYpcb9okOK2QlVvRkzPVo/X1HiGcYRxxmce4QhczuuFqf3xWxlvQjycKhHUz3jKODAUjMV7039dT4bfpKsZDaPJbOKuSdn+3iOIDWvxY6hRYjHvjU24byfbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6K0yMdpyeKymZ6RctG9rrwXsQ+8Dt8cX+PZSlpusp2w=;
 b=n0+/XEA7vNi7T3nI5cwht7YYsacS4lXUO9Yib+N6mkcgKx2KnJXEhNQGU92GPyq6/RWeRqJ+N8qQ1Kv9FZHQ5Kn5kjkq2GmdpOLPH1FXlxEKKX/Dwtx34KNZkSk72WiAMC7yKDrM7rxNVK/0v2WY9rHSwWb8rI6bdYWjDznFbhHYpMto+5jLM7wdRnOYhsj1jp9t1t+8QvZlU/VrW1zZ6LkpOvLM1IaHJNxPYi9MSt2CCzAMdLZFj2vPsVbpbf2/XzTAIaxFeSRLH2K8lFZrLovqhqeAbjcPKdHwvPW0Cc5ixKo8YeyeShXLAAbFXh5cW/RS7OxPlY7ciKy0IhiBYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6K0yMdpyeKymZ6RctG9rrwXsQ+8Dt8cX+PZSlpusp2w=;
 b=nBnoeSWThLjeW4I2/ZOS08zXSwGA2dy8G+JOq4V56DhMfAS1ilGofzVRLByOLZiIjsdLmkRY5ZuztImO72L8X1mh6gWJqN0TfQ72JR9mEfrMMqFrMqWTkyM6aLrNdzHqzoOQs3giTR7P+H1tiLyoL2J2LObpfR+9mHlbAZT7iSw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA6PR08MB10782.eurprd08.prod.outlook.com (2603:10a6:102:3d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 11:17:19 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 11:17:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Lei Maohui <leimaohui@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-dev: Fix install conflict when
 enable multilib
Thread-Topic: [OE-core] [PATCH] gstreamer1.0-dev: Fix install conflict when
 enable multilib
Thread-Index: AQHbszF7sN107XBU+UWuE9Z/G7P50bOvicmA
Date: Tue, 22 Apr 2025 11:17:19 +0000
Message-ID: <0603ED6B-9982-493C-9E7F-038240C4942A@arm.com>
References: <20250422025127.605-1-leimaohui@fujitsu.com>
In-Reply-To: <20250422025127.605-1-leimaohui@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA6PR08MB10782:EE_|AMS0EPF000001B5:EE_|FRZPR08MB11072:EE_
X-MS-Office365-Filtering-Correlation-Id: b19918c8-d193-4f0d-6449-08dd818f52dd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?RDBxSEZ1SDBOd3hRQW9aV0lIRFFBWlZadElTY2tzampHWC9rRmhrQVA2OVF0?=
 =?utf-8?B?b1lPZVhEY1k5NTlUMjhFMllUUXZ0RnFid2xoaCtlMmRGOEhjQzh2Nlcrc2x0?=
 =?utf-8?B?MllBZ1R3YjhjYXZqM1pNc1VXVnBkNHlBWW9jTStVNG1JMy9yTFV4WUh3NFYy?=
 =?utf-8?B?SUw1TGtjMEZzbTFReXQvNExEZE1kM2VwZ1B3SUFlOGZFclZFRm0wLzhzbmVX?=
 =?utf-8?B?UTFDam1Pa0xzS25yY2Zwa3dWZVRpQ2I5VCs2QUkybzRBdFZhTkpMa0NacDhH?=
 =?utf-8?B?V0kwQ1NjRjVkQTdUa2ZxWmppQThYOHY4TVRPOGx0RU5xRk9NNmhXWHJoaU1H?=
 =?utf-8?B?T1FKbC9NcW54bXpMekxoOEwvcHlOZkRGWnJsUkkxQWdMZ25UaHZyRmlQckpm?=
 =?utf-8?B?eHB2bFJxUFVNQ3VEUDBPUnR3b1hkbmJHNXQyNXV4Z2tnQ0djb0FXREdRRlFN?=
 =?utf-8?B?UGYzb1YzT0tiSDh6dkx6alVHdHJYeC9IN1NnMXVWNFhQMVRGZzQ1L0dMQnNj?=
 =?utf-8?B?c2VQQlRLKzZNU2tzL2JsRnlFVFJyUmhwVGw2em5EMkVsQ0VRMkFORDNBK2o0?=
 =?utf-8?B?OUVpUFZ5bmswYWhKVFJybkRvU0hQblRoUVp2NTducUdOQzczeUkwbWczbWlY?=
 =?utf-8?B?N081Yys2N3lXVDd2cXU5MUdYZjZKeVFWT3cwV1RCUElPdnlEclZaU3ZxNVFM?=
 =?utf-8?B?Ly9abTBBRWZtejhOekRFVVk4bmFaMWRsSmFoelF4bUMyclZueHY2dUIrOG5M?=
 =?utf-8?B?ZUhSbk1kVWU4dUFlVkVBK244cHh5VFMybkNTK0N5Z01iSnZhRUNyQkYrbXV5?=
 =?utf-8?B?dXVqSjAyNTY3Q29PUVd4ODBCRld5SGw5WWp2N3RkMEJOUnhtdm1BSHVVQXFs?=
 =?utf-8?B?ejlrMlFLWmgxMk5SQnRlbnloRkNDVzJjajg0by9Cb0dnWGkwa0ZUOEI3bm5l?=
 =?utf-8?B?dmtwOUFIZnlIL2h6SUlaRUpOYjdzMVROMXd5eTM4emg1ZmkxUHJGVnltVkJl?=
 =?utf-8?B?RTdLYjBURmlPSGZiWTFIalNrMWNHKzI5Wjk0T0I3Q2I2blh3STlLNzJ2UnpR?=
 =?utf-8?B?NjVkL3N5amw5K2ZuWTErZUs2Ym1TQk5sVG1pdURRSmlzUGp4NTM4R09EOHNh?=
 =?utf-8?B?SUswdS9kUFdjK1BXT2R1a294WlFFbmdPbTZRVlpZenpxeDFuSkU3NEIyeHVC?=
 =?utf-8?B?cTYwSHBTWThWaWpZWGVJZmVZMVlFc29oQkZhYzdTaHp2SW05dkVuckNuK2px?=
 =?utf-8?B?VGc1MGtwVHlYRnlndzJKOEJqL0hyTjdueHZRSFBZcTZXcUpzQkxlckVIM0w0?=
 =?utf-8?B?LytMZTE0azNCUTNTWjh3dSs3alphaXN3emlDVW5IVElSMDVCNS92bldINVBm?=
 =?utf-8?B?TXhlTVZkM2dsdG5YNGo2dEVkSENSRVludTZ0Z21EeGNvMjdnMWdaT3p4N1hs?=
 =?utf-8?B?OTc3dHlZM1pwejJSMDFRY1h0ZmlxMVBkcE1mUTc5dE1hRUNlUGNkRDlRVkJ5?=
 =?utf-8?B?R2VySGhjdHc4VEliZFg5czVGLzQzcjNXSVRGSmNicEFPbjJvYlR5Zk91NU5o?=
 =?utf-8?B?bkk2VUUvMEYyVUpHaXRkSnhiY2plRENtTjA2TEdENUNYL0pnLzRqMWRMdy9V?=
 =?utf-8?B?bWhCTzV5OGlsUWo2N2g1T21nR1FRYWprOUlxcklZMTl5TGVBUFZTOWpmNTdR?=
 =?utf-8?B?Y0xCa0hwdEhTcGtmN3lBWU9KaTZ1RDF0M1hKaWpuMURoVGJQTGppZE5sT0Fr?=
 =?utf-8?B?NEM0ODRzSDJ4UmRGekQ3ZkY2NytzUHFuMmlHNWlKYXQ1UXNyVDlaMk5wRjBa?=
 =?utf-8?B?Wm8xSkJoVlg5WmhGbWRuTWY0d2pFY2I0OTFVWXplWjVMa3oreU1HejJtM2o3?=
 =?utf-8?B?cE5nVlp0TFY5NnJYYzFvYkZBN3k2cmE4azRlOTZxOEZEbkt4SHZKUStSSlBC?=
 =?utf-8?B?UVZuSXpQeHdIVDJwV2J1YjBHVHZEK0J2aWY0NzVwZkFrbCtIeVlwTHppcWhr?=
 =?utf-8?B?U05Dd0liNDlnPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B903D3253E358445A344EE7758B38B72@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10782
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5e1dd9df-4175-46a9-2a3b-08dd818f3f14
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|35042699022|376014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VGhiNi9CdXB3WVZTS0JLaGtnMGZhUUY1c3RWUlZBaE52K25oRUUzY3N1SUVV?=
 =?utf-8?B?dmhnWWw4MFFnZGk0WFZlV2VPSEJ4VTB0VlZXYXNvSjFWYjNBeUNNQjRhYm5J?=
 =?utf-8?B?UWFibjg2ZUVUWThLNUtjZEljVVFHQ0VHQjR0M1V3OGpsTlk0Z2U1NWU2ZGx5?=
 =?utf-8?B?VklEUEdvQjc5MW9wL1RFdlg4b0NYenIzeVNEN0NSVXZYL2Q1TnowVXU4SG1W?=
 =?utf-8?B?U3FSSFc2ZG9pU09DNUV4dm9vMHJJSFlsRHlQTXAvbkVUUXdRTk5qdm5xTm1G?=
 =?utf-8?B?M1JmU1RkN1dpcHNzUVF5Y0xPMXhmODczNTZsY1kyZUhHeHNlUUVjUUFNbmlG?=
 =?utf-8?B?eUNQeElnTFZJaE5YVXZCTnNMUzhHSzRTcHFQWkczRzIzeUtjWjFSYnVuZWc2?=
 =?utf-8?B?ODBNTVg5K1dPZUdGMTY4UFdxaUpCVktlVllVMXI3RElWa1paeVMyTW5rR0Ns?=
 =?utf-8?B?M3ByeVQ1N29kME44cHF2d05sU2RNTzgzU0dNUFhicUljMzhjRjUyaVF6UVVY?=
 =?utf-8?B?L3VNTUZ0alF1cUxaakdBMjd3bjVIdGRCU291UlJkQ1ZRaW5hLzM0N3Z0NW0r?=
 =?utf-8?B?ZFkrYWtCbGYvQkZnL04xOGRqR3ZMUUN4amhBMHMvWFpvN1NIdEpBSDZ1TjV4?=
 =?utf-8?B?RWIxUHNxOUR2cmJhWWQydFFpaDhrb2FwZ01HRnFsUlBHNlNaSlZRK2dHenFT?=
 =?utf-8?B?S0hCdm56S0dDUHdBbmpGLzlnRTlHcjZUeGEvUHZOMm1aeVAxTzk0NmIxSW5N?=
 =?utf-8?B?dyt1Y3lGRDlCMmJhajJDazhKTDkzdUoxYjRmajY4V1hYZm56Vmkxemt5WjBv?=
 =?utf-8?B?dWt6Y1FkenpGZFlVT2JYVldtcnM4dDRRVkJCang0SGZqdGFUaktrNC9XbnNn?=
 =?utf-8?B?eVVhdDhhT0Zna2NGQUY4bDRqdll1WXNiMU1zM1AzaklScFpteUgrdDJ4UVJo?=
 =?utf-8?B?V0k4Q2FQdWY5VTB1RlJJZDY3SzFKd29wL0tsTUxyWHN6dWllUTNiZFp6NDhy?=
 =?utf-8?B?Zi95dWVkZDFjUFFiZis2RTJGQ0ZwUkM1ejVuZVhEc1F4Wm9LREQ2RlBGRk5y?=
 =?utf-8?B?Uk9DWkgzdTM4RlltOGs0RVJ0eVo3U0h3YVRIT1FFODA2U1RpK3l2c3VpYXI2?=
 =?utf-8?B?dERBS0pJdXp5ekVsMGNGVkJjLzB1TUJlczFmNitVNllSTHJFcFRmUXQrY0Jo?=
 =?utf-8?B?dmpIQWxDYzdNbWk5UjhzeE4xSlpqU1drVk1SUUtNWUpXaVRwc1huS2JlS3dB?=
 =?utf-8?B?VWdDeU42YmU1MmQyVE9FMlZLOTNVazhsUm9CWmNDNkp4MzgzNjhOMVB4YVpl?=
 =?utf-8?B?cVY3VE1ZTnJ0am4rd204OWFKQ1E4SmwzSFR5VW1UemdSVFFKWVlzZWxIM3Bt?=
 =?utf-8?B?RWJoYnVSaFNUYWxZUCs1ZWsrVUYxNDR1UTlucnBxUE9VWkR5WDFxOWZoVGZF?=
 =?utf-8?B?bHhFeFNHbVo4NWttTFN0SmNPZ28rVTRmakI2eTdleStoNXZHRnB6L21kM1Fz?=
 =?utf-8?B?a21ERUlHaUYzV3dhVnlMRVA1UTNPTUkrcmg2bGEvNzNFczZNT2dZQ2ZhS2Ry?=
 =?utf-8?B?K1VwK3k4T3Bkc21GR3VCdGZRQ1dUOENpalB6SlM2alI3TC9Db1ZlQVBkdjha?=
 =?utf-8?B?a2IvRFhwZnhlNmNBcWxVc1B0R2JvUE1WejU1OTlNTGhvQWRiUk5rTU4vRXcy?=
 =?utf-8?B?cDhiRXhvYTd0VkRPUUVEUzJJTXRHU1dHNjh3K0gzMnpmclFObWc1NGN1TDlh?=
 =?utf-8?B?NC9rUE04aUQzWXBJSUNneUxkOUFxMEVWOG1aUWdlRXUyWWwwdUI3cmEzcVd1?=
 =?utf-8?B?MTF5cUUwY29VQklMdmxPUjN2OWc2bzNXMDNYVGFQeXVUaEhCUlhpSDNvb0ln?=
 =?utf-8?B?djFiNDhMbVBDWElLTW5pY0hoYlZqcklkeHhiWTJSWmlEdEpIbUtJZEdCS2R6?=
 =?utf-8?B?TFpzYlE5MVB3SGZHK1Z2YTFmakovWnVEeTF1L0xLMEpYN3RKRzh6WjlsM0Vo?=
 =?utf-8?B?b0hHZzRJdHQzMVRES1FRY2FTenZLVHhwYjR2L0Fhc0lmeW1TYXFXQWNXWXU1?=
 =?utf-8?Q?FZVdse?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(376014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 11:17:52.6713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b19918c8-d193-4f0d-6449-08dd818f52dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 11:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215201

T24gMjIgQXByIDIwMjUsIGF0IDAzOjUxLCBMZWkgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5j
b20+IHdyb3RlOg0KPiANCj4gRXJyb3I6IFRyYW5zYWN0aW9uIHRlc3QgZXJyb3I6DQo+ICBmaWxl
IC91c3Ivc2hhcmUvZ2lyLTEuMC9Hc3QtMS4wLmdpciBjb25mbGljdHMgYmV0d2VlbiBhdHRlbXB0
ZWQgaW5zdGFsbHMgb2YgbGliMzItZ3N0cmVhbWVyMS4wLWRldi0xLjI2LjAtcjAuY29yZTJfMzIg
YW5kIGdzdHJlYW1lcjEuMC1kZXYtMS4yNi4wLXIwLmNvcmUyXzY0DQo+IA0KPiBmaXhlZC1zaXpl
IGRpZmZlcnMgYmV0d2VlbiAzMiBiaXQgYW5kIDY0IGJpdCBzeXN0ZW0NCg0KQWxzbyB3aGF0IGV4
YWN0IGNvbmZpZ3VyYXRpb24gYXJlIHlvdSByZXBsaWNhdGluZyB0aGlzIGluLCBhbmQgd2hhdCBp
cyB0aGUgc3Vycm91bmRpbmcgdHlwZSB0aGF0IGNvbnRhaW5zIHRoZSBkaWZmZXJpbmcgc2l6ZT8g
IEkgY2Fu4oCZdCByZXBsaWNhdGUgd2l0aCBxZW11eDg2IHZzIHFlbXV4ODYtNjQ6DQoNCiQgbHMg
Y29yZTItKi9nc3RyZWFtZXIxLjAvKi9pbWFnZS91c3Ivc2hhcmUvZ2lyLTEuMC9Hc3QtMS4wLmdp
cg0KY29yZTItMzItcG9reS1saW51eC9nc3RyZWFtZXIxLjAvMS4yNC4xMi9pbWFnZS91c3Ivc2hh
cmUvZ2lyLTEuMC9Hc3QtMS4wLmdpcg0KY29yZTItNjQtcG9reS1saW51eC9nc3RyZWFtZXIxLjAv
MS4yNC4xMi9pbWFnZS91c3Ivc2hhcmUvZ2lyLTEuMC9Hc3QtMS4wLmdpcg0KDQokIGRpZmYgY29y
ZTItKi9nc3RyZWFtZXIxLjAvKi9pbWFnZS91c3Ivc2hhcmUvZ2lyLTEuMC9Hc3QtMS4wLmdpcg0K
JA0KDQpSb3Nz

