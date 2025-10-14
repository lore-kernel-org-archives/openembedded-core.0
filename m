Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BE6CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 15:11:31 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.10])
 by mx.groups.io with SMTP id smtpd.web11.19200.1760454687845664816
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 08:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dTgwT/yz;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dTgwT/yz;
 spf=pass (domain: arm.com, ip: 52.101.70.10, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=m5kdpQb4eTDJvfjzFtrfMYoDyFAeizu1EEuQrchp8r7q9VAFpu6sqPnI03tdexa05wUFp+O3HgIX4UvwdhQVsio3keSG34QL1X/UGg6queKJduM4JzF4+ezQCHxxT0BFJlQm7SBea6BW/jUFb3iBlB1PpIdMicUeU49p9etkvSjBsL94U3+3Cm8mnwvEbeXYAO4LcIMDuRckyfptqp2sNLZNtlAr9ZdlQkH/e2a433YUHq4Mu4OIq+UIApHvYHLVtAndrLbL4db594GDyQwaV6Ps7ThTqXjsLXaSCzKG2dO8ncBIiS0clrVn3HQHP86ACiSW/VaCu9099FgAEvLqwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MijXj4R0LvUULVNEBDDYqSCQGKBU8JHwBNdYXvFPTM4=;
 b=waTXMWdib3HzKdRnf5/78Bps8wBNuDXnGjuFDJw45jCulnAX+Bt0FWk4UmGELuJlb0BfxKfp9pACKQrkqjBn0ozSSYuYgs7hti/7be5j8HVEHFkZSlbmf7g4IeoosSYUn6uR1BaFJEn+E/k5IMnTi+rfWusWZdgTwu03dOP83dEaftAvWKdw9m7qe+wcraO44fQXLzhjMcGH6d93MANKYUT+UwPCI14gq16Hfi23eyCumln+tb7wiWdcZ/jyEvW5XV1JQEjYj8mKdtY3DuoO7EY1VOS2QGPlqt16vQ7qauh0pjw8m7zvVL9KhPKS9ZWzX8DjGrl2ttbeYD1kd4Zv5g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MijXj4R0LvUULVNEBDDYqSCQGKBU8JHwBNdYXvFPTM4=;
 b=dTgwT/yzswivNh39HEu1/+wcML9nBYvqoUHhHg8ivuaH02GAFA04tBpaOUjmKOwtit+prsslx+kqqXapNfDpwCy4N3+ykKqdvHLfhQvQzIemoM9I6O7ddsrLd7R9wy2jDBjN67CqGbTY34DJ5xOVrz4+0q5L3lvkKxUEja5VJXQ=
Received: from DU2PR04CA0320.eurprd04.prod.outlook.com (2603:10a6:10:2b5::25)
 by GVXPR08MB10474.eurprd08.prod.outlook.com (2603:10a6:150:151::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 15:11:23 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::a) by DU2PR04CA0320.outlook.office365.com
 (2603:10a6:10:2b5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Tue,
 14 Oct 2025 15:11:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7 via
 Frontend Transport; Tue, 14 Oct 2025 15:11:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c67I08Io1aAIcbzYyvVghZtrbVlEzvRkGLkEi4oZQyK1XuT1brKRjb3oM8Dbh75ChCyZ3RrppgnEGHtvx8ShqXPWO7O54xom3dKl4MJ4FI/lUm33eUUXn7bTmdqDRmm6r7Fed9BpgfrIDQNoLX1WED7eIRfP54Ts3SAtp/nRbIVfCjEOles7PkgL1PgByV64c4IgvPQ4omzuQFtoogJoZvhwKgtqSjZQaAGUVWf3JHhtr4dJbXxqX1Rj305rlbAAYMwOTyzJUC9df5gxrVjTrHN2/1vlBrqmxQQ8bEGeIVS3jPwqKq86qlN1rotthuknRs4mbaizYR7NtqhZDmCoTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MijXj4R0LvUULVNEBDDYqSCQGKBU8JHwBNdYXvFPTM4=;
 b=XnSul6HBQV0cMwzDQRIWpfpkZ8LSg/b2VahHjZA4VugB+FpzKoI+RADAlPD10Sp/RV0K5ZYsLFY+BwHiuJPn6nV6lF083W+FAPotoEPX1lDikM4/gVKbE+kH+f2oHsxeHoIS6oxyXqpuGXpPmvyNPc1YPvfz97/psxV3a8/Mtp1TggTkWFLeCUt3/FxfvdgAvuAyArYg9QpBG/hqKssRZZ1kvwclWH2J4FVguoCkQuvGDdj36Pr31D9uZdWLu4oi8jZdb5HUEwXhw7j13tqTwpno973hVqv74b6SLNvpmFXu/j81L9w3fZC7YtnCsQ0+xFLXqS9zJwNHP75ZFCFbvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MijXj4R0LvUULVNEBDDYqSCQGKBU8JHwBNdYXvFPTM4=;
 b=dTgwT/yzswivNh39HEu1/+wcML9nBYvqoUHhHg8ivuaH02GAFA04tBpaOUjmKOwtit+prsslx+kqqXapNfDpwCy4N3+ykKqdvHLfhQvQzIemoM9I6O7ddsrLd7R9wy2jDBjN67CqGbTY34DJ5xOVrz4+0q5L3lvkKxUEja5VJXQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6375.eurprd08.prod.outlook.com (2603:10a6:20b:31b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 15:10:50 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 15:10:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.0.2 -> 10.1.1
Thread-Topic: [OE-core][PATCH] qemu: upgrade 10.0.2 -> 10.1.1
Thread-Index: AQHcOo2+/qwa29Zk4Eq3SfIa3kRJ3LTBxEuA
Date: Tue, 14 Oct 2025 15:10:50 +0000
Message-ID: <D8796B2E-9677-4EBC-848A-7DB63A6D9C16@arm.com>
References: <20251011090152.398298-1-peter.marko@siemens.com>
In-Reply-To: <20251011090152.398298-1-peter.marko@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6375:EE_|DU6PEPF0000A7E3:EE_|GVXPR08MB10474:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e4a6a93-db5b-4ad6-dedd-08de0b33efdb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?VHQ5WnBRU0d5N0JKelg1R2ZKK2p5VFNRUWs3dWs1Tmt4aW04MndXd0V3OG5j?=
 =?utf-8?B?aFlYZmJkWGVRUFg3eXJVM2t1b3RJYm9mbTdCTTFBOUtqK3EwUzZQdjJTR0lS?=
 =?utf-8?B?MTZpTitUVTlrR0dMVEVncDFLbEpWTnRTeCtkcFBkVVVwdW85TUx4ZmJ5Tlds?=
 =?utf-8?B?Ky9LZWpvd2pJdzE4cE54QzAwODF6bUp1MTg1SkJQaGREb2VXUUJKMlVQemg3?=
 =?utf-8?B?UEIyalNaMGxWbDV3TGhIZ2JJbEJmMFc5eXFRYzg5bGdtalE0dmkrMUZiTkZL?=
 =?utf-8?B?RUxSU25zditUYWJETmJUWFY4bmtWdDN4aEJ6MjZ6NWZqVHAwN0lXS2tmcTBX?=
 =?utf-8?B?SVE0Y1E4OTY4WTEvWVZ1bmhSVFA4dXB6Y1dDazVoOU8ySHBpcVZoRDk3MnR4?=
 =?utf-8?B?SHVDbmNENkc0UEM3NGx4OGdvc29BSUpVc09zbTlZSERBWXpaWlRZRElRRFBZ?=
 =?utf-8?B?QkoyWEs3ejZjMnJQOEc5ZWpkc3pNY1NkRDA1SERrRmtTYnRwNThoRVMzRDdw?=
 =?utf-8?B?Ykx6dkVCZk82dFg2Wll2U1NZeGUxeXRtQWQxb1UraDVXWW9QSnV6bmtId2pt?=
 =?utf-8?B?aitsNVlDR0UwQTBTTmNGdi96TWtmL2dpVGJEZjltc1J1ZzBDUHdYb0xxQ2hv?=
 =?utf-8?B?NFk2STRoanBOcmV0VnFtNUxaUlRnVllVQ0tPczd0VUZqd1p5OU5oaWFra0tX?=
 =?utf-8?B?bCtsOXBWV1ZKV25QSWNFUUo0c3BjRDg2ekMyeUVVNEwvZTJmd1FLc21MN1FS?=
 =?utf-8?B?ajQ4dXZWSFdFR3RMQ3h6NDl6Z05oN2JuRm1zSndxUjRWWVlqVmVZR3NCUmVM?=
 =?utf-8?B?d2F5T2gxQW1UeHdSTTZiUWlLY1hzMGtwVDJXZDBNSVY3aDF0dU9rei9CMDM2?=
 =?utf-8?B?SS9tbUtrTjVKRlRLVzhvcVpnUDRnZkFEaGNxZkYyQWdIaVR4KzRUTjJiamhV?=
 =?utf-8?B?MTZtSDRBa0NTL25ld1pCa2ZsR21LS09TMDdYVXJDU0ZTaWRqYXFia2UwYnND?=
 =?utf-8?B?OGx1ZmJRQ2RRUFZQUkZDVFRZOHdHeHpybDFUL29RSmtKcmNIbzdPNGIzZXlr?=
 =?utf-8?B?Z2xTcmxxS3FkY08zZUFESFFJUzRKUHpJMU1lN0FuR3o2ZVF6Z0JPN2JxM3VG?=
 =?utf-8?B?TStFajlITFBHdi9xMXdpbkFsYU9RdGFYRTE2Qlc3b3JYU1JzMjI0L0kxWTVS?=
 =?utf-8?B?WDBsalJ2TDdZK0RhczBsRTRQNTJhbldGTzEzelRheEtlUFlEeFFDNGZaTEFw?=
 =?utf-8?B?YkNwL0dJT3M3QStSOXpGdzZQWWF4dWtSSFROdVpLSFgrSnpNZUV4aFlDRXMv?=
 =?utf-8?B?V2Y2eXNhcm5KcVRvN2VGY1ZodS9NWGUxRmQ2YUhVUW9nYXdiOHpDWnNrTURx?=
 =?utf-8?B?SnlSbUtLS1hYaG8zNDBxc2lRZjFpNUxYeE1DNksrc2F5T1pxNjIwMlc4bmd2?=
 =?utf-8?B?OWRmYlFjVFBpajE2THZqZmJpK1Flc2pYc1JYOEgwOE9uUGZ2U29aM1ltdzhT?=
 =?utf-8?B?UFAxUnp2dlhtbkowV2V6OGhSUlNVMDNYVWducjQyd05MRFYrZWVJWnM5TDhJ?=
 =?utf-8?B?WVlQM2NLK3RaQm5qdU1Vby9zbmRQSngwZDE4UFROMDNvQzY0NDJPNmhtKytq?=
 =?utf-8?B?akxXaXJyVVFxVDB3bDh0ZS9uM1RXa0RGMTBWVXozRlBybXN4cVNta252NTBB?=
 =?utf-8?B?NnhtZDFIb1dsaDlrczZzQU9kSGNpRFlOTzdOWGh0Tm11NERVMGRCb2czKzdv?=
 =?utf-8?B?WGQxbGpJQWNPbkN3TEZzSU1ScUdiNnZmdDI5VzEwenc3bStyb01EazdoT1Yx?=
 =?utf-8?B?T1BvVFpKcG1JSGx1M3JjaHlPNE5kYWlZMlBndWVLUmRXSHFydS84R3NZd3ZN?=
 =?utf-8?B?UXVRb2cvVGpQTTdGSmNWN240bVpzZlo3NkROTVVyamU5bERFckxTQnhvMWhs?=
 =?utf-8?B?RTZTRDdSZVRpcXFma2R3dWFDeU9SWiswNmJCdEVwckJzYkNxMy83aFc0d29p?=
 =?utf-8?B?ZTVyR2REalN3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <858DF879AAA0264C8EA14DC249E30CCF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6375
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0285c4f8-616b-4861-ba4c-08de0b33dc6c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|14060799003|35042699022|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ek1PTG05dFpoSUdrVVUwZTZVTTBHcHdyMGxoeEE0WkRzbHVOM2dmK0NRVENs?=
 =?utf-8?B?OFhWQ2pUcjBZQVNrSktXaGJPeEVIcExXWnVKRk5jcU51b2N5VDFyRmMvWUxB?=
 =?utf-8?B?RlpxaWpiZ3RYelVsZnZvQWdwdHlqTFR3UVlFc3JOaEZvbzRRSFZ3WHRlWGFN?=
 =?utf-8?B?WFB6c21yQzVUcFZ6SEVOUzJqUTJySWY4Tk4zaW9zMU5ZN0JDRUk3TXN5QWVD?=
 =?utf-8?B?VmZicU51UzVaT2psNU9ZTG5weHZtMEJONCtxeDl1SUNTcStIRS9WdXFwSDJn?=
 =?utf-8?B?ZXpldUowWVlhSEhCb3FJMkN2QzJaSnhOY1ozdmt3OG0raTJra2pMRGM3d3FW?=
 =?utf-8?B?Z0MzTVA0ZXc0eDhPWkhzMDBXSGdtVHR2S1g5SHYxTEVrckZnYkNpTDNoREFx?=
 =?utf-8?B?OHFvYUxJREJlSHhsWDU2SHQ5UHg3UFRqM3VrWXlLbGFmL05LQTk4MTdjaENG?=
 =?utf-8?B?MThXbkVQMXBPcER2M3I5MzBxTm15UDNXcVYvZ00wSU9LbVJ4bmZZZzcrQXRE?=
 =?utf-8?B?RVphRWEwVVVseS9FUFE0NjJQVU9walNOcFNGSklpUFVtaW9BQWhSdnhxd3ho?=
 =?utf-8?B?aHJzWGdxOUFIczUyZ20zYzVnYlEvYjlkWi9lV1EwbzI4V3hGeEZWSjRMOWtE?=
 =?utf-8?B?ZExuRm81eDFneDd0a0xENS83RzBpaTNOYXZQOWpNcDRlN3p1Y3ZPbGE5NmJH?=
 =?utf-8?B?eHkvOGhTNXNJUHdvYWlSYUVZNTNnWng2WGo3RzE0U09UQllOL0syWXhYcldM?=
 =?utf-8?B?SFY1L1didDdHVjRkQnI3RWFhaExteFo1ZGIxblIyMUNOWVlJOXFuZUVVNWo2?=
 =?utf-8?B?V0liMTVzUlJaUEVJUllCUzhFdjJHb2hibjE3dXJKOXExNWpsc1VPcWswTEdC?=
 =?utf-8?B?a3NrUVQrWkZERkJ4TnlidHk3K3VOMVZrZnRQcEFUUmJHMlVnMUZaUEVPWnFy?=
 =?utf-8?B?SCtxN3BCVWpjdGQvdWUvOUswZkwrMkFiOWNsbWdyMUgzeGM2a2JwTVV1YlpD?=
 =?utf-8?B?ZVd6azM2VVhIa2lpQVRReHNwd2x3U3FkUWgySnZQQWtuMmt2QS9OeFZINkxV?=
 =?utf-8?B?T3l5VFNvdWg2WWh4RW52Smo5ZEpuMURsRjlXUm8wbW1MREo2eDh3bUgvY0Js?=
 =?utf-8?B?bExGTWgyWmNHUjlUOUFzZzJYTU5yWis5bDBSVUM0b3lCcnZXVWttOWNFdlJY?=
 =?utf-8?B?SEV5dXVrcW9ZWkNyU2tLejNkZndmclV1MTdIUEZHMmJsZ1VTOWRLdDJadE50?=
 =?utf-8?B?RUdJRTZJK0kyT1RuUmg1c2tnYlFjYXZGamxmaURqNGhIMXhpajRRTTMyYy96?=
 =?utf-8?B?b3RKWXNxV3UwbmhsTk9xeERzaTJrYS9MbEw1TkJoM1dMMXdjM3krb3VUMjZi?=
 =?utf-8?B?ZnRSR1lsQ2J0d0w1UUEveDVJNTlMYzZFWmZaVEs4QWlNaC9sam9vSG83cFVX?=
 =?utf-8?B?ZW5CZHZ1Y0czQ1hRUGNKeHNyNFVuQWRZMy93REtMM1kzWUt2Wm1jbkNuNDFo?=
 =?utf-8?B?d1cwSnVRM1RGT0xLNElnQkFBS21yd2F2OElmNCtKNEpabDh3aUNDanNiRXI4?=
 =?utf-8?B?K09ZQ081bUhkV2QzQThlOXhMSGIxYi80b1ZiRGtBd3pSMUxpbitTT0EwVE9r?=
 =?utf-8?B?em5vK1JiT3VzQnJMNkppRzJCcXRjVVg2OHVUbUx4V21WQVF3K1lxb2lTaEJl?=
 =?utf-8?B?ZExMeW9JbW41eDhoRmJLVzEwb2VJQkJPZkdBMXhTQUxCVDdKby9KaTVmTnZq?=
 =?utf-8?B?WUhZbmdNckphMmhwangxdmI3cTh6YkJucHd4VkxhRUw3Zk51VnU3eHIxQ1hV?=
 =?utf-8?B?UWQ0cHEvcnpnZVdpN3pKTWl4MkJTd3IwWXJoekRxQ2ZWL2xGNDlxbVVvd29B?=
 =?utf-8?B?NldyeDhPRFJHWFZkSjFkMXpxWHNuVWl6bXhGV25MZGJIRGFDeGtJU3E2UEp1?=
 =?utf-8?B?R3pUcngrL3hDanprSkxwbklMZzlVc0szZThyVHdKRnhqalFjQmtsWWZrQWly?=
 =?utf-8?Q?xnzYcqluKxuwLWTfDZMZcW+ySZP1n8=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(14060799003)(35042699022)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 15:11:22.8103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4a6a93-db5b-4ad6-dedd-08de0b33efdb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10474
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:11:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224833

T24gMTEgT2N0IDIwMjUsIGF0IDEwOjAxLCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cGV0ZXIubWFya289c2llbWVucy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+
DQo+IA0KPiBIYW5kbGVzIENWRS0yMDI0LTgzNTQuDQo+IERyb3AgcGF0Y2ggaW5jbHVkZWQgaW4g
KGJhY2twb3J0ZWQgdG8pIHRoaXMgcmVsZWFzZS4NCj4gSGFuZGxlIG5ldyBmaWxlIGNvbmZsaWN0
IGJldHdlZW4gcWVtdS1uYXRpdmUgYW5kIHFlbXUtc3lzdGVtLW5hdGl2ZS4NCj4gDQo+IFJlZmVy
ZW5jZXM6DQo+ICogaHR0cHM6Ly93d3cucWVtdS5vcmcvMjAyNS8wOC8yNi9xZW11LTEwLTEtMC8N
Cj4gKiBodHRwczovL3dpa2kucWVtdS5vcmcvQ2hhbmdlTG9nLzEwLjENCj4gKiBodHRwczovL3Nl
Y3VyaXR5LXRyYWNrZXIuZGViaWFuLm9yZy90cmFja2VyL0NWRS0yMDI0LTgzNTQNCg0KV2UgbG9v
a2VkIGF0IHRoaXMgeWVzdGVyZGF5IGluIHRoZSBwYXRjaCBjYWxsIGFuZCBkZWNpZGVkIHRoYXQg
YXMgd2XigJlyZSBhYm91dCB0byBkbyB0aGUgTTMgYnVpbGQgdGhpcyBpcyBhIGxpdHRsZSB0b28g
aW52YXNpdmUsIGNvbnNpZGVyaW5nIGhvdyBvZnRlbiBuZXcgbWFqb3IgcmVsZWFzZXMgb2YgcWVt
dSBjYXVzZSBzdWJ0bGUgcHJvYmxlbXMuICBXZeKAmWxsIHRha2UgdGhpcyB3aGVuIG1hc3RlciBo
YXMgb3BlbmVkIGFnYWluIGluIGEgZmV3IHdlZWtzLg0KDQpIb3dldmVyLCBJIGRpZCBub3RpY2Ug
dGhhdCB3ZeKAmXJlIGEgZmV3IHBvaW50IHJlbGVhc2VzIGJlaGluZCAoMTAuMC4yIGluIG1hc3Rl
ciwgMTAuMC41IGlzIGxhdGVzdCB1cHN0cmVhbSkgc28gd291bGQgeW91IGJlIGFibGUgdG8gc3Vi
bWl0IGFuIHVwZ3JhZGUgdG8gdGhhdCBpbnN0ZWFkPw0KDQpUaGFua3MsDQpSb3Nz

