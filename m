Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF551C3DA5D
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 11:58:47 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.51])
 by mx.groups.io with SMTP id smtpd.web11.36125.1721044718945666903
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 04:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Wnx1OZk2;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Wnx1OZk2;
 spf=pass (domain: arm.com, ip: 40.107.104.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Sucl6GA4+JikTgqdofc4NNASiZpkHdv+uwO2lxmW+416OkN4wavtvVvV+2syKRPcFRuydwClPL8c0fq2VEzYZ0UdGbjFPtILifw/jeLqew5s6ReaXGjoQFma//qqPiOSnKGf0Ylxrx5A03D7aISvSxve0ioBNtMVqZPttAnENg5hqefwrcXxq/WjM0aadY9GzzKzRnBTek93z4vEmcqDVbyob/EZKf1tc8uKCuRO2cGoTeWGTMKQ+2gvw+3W0B2jKwR8TcV0mgZ6PrurFV3jciKLiOaiRPrD87I0hB+/WAr35RUP+6rz4Jw5g1hlTZPnUL8mEpOfFyK8uUq49fxmWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fyPOmaWyr+mX07LTVam21ReEiQ+hwiKI6wJOSo3q1w=;
 b=QV4ghe+JRjep5SLjIVJe/Cs3SMoF6+Jjqh6mMnISeBwwC1RCPDxUrFtqK5lvPs6Hg4V/StthIwCOGx7Xr+aXnGQ1YupPF2R8BVSEo/3q/iKe9jH61K92YunFh9eN52wFt9fKjUm5k2qFm1JpOC7Cm6qH5oA7RtqJ5UilR0ISWFfWOH4vGVI/gOOpy6eU5Sh/dGCqSDr4Mm8YCLaqX+Ce/bLW5Lr4uvMvp1VLBp72PTD6k9WGvTjZsVeVWwdrXX6qEYMbBTR4kf//+lsXE01KEdbsgm/dtF3c2w224b8xl0q5ygme3f9L939ixtPM+rlwfOCnI7A5Oq06vT+67GLIZQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fyPOmaWyr+mX07LTVam21ReEiQ+hwiKI6wJOSo3q1w=;
 b=Wnx1OZk2wjlVKAv2r43l4GT3252j8QIDJzsZJS6ROo3PYKfKvHaoeAfC/Lk84UEj7aFP5/ZLRZgziup/LmF6gPid6+YOzeQ1MAfcVbdlRN1CzUEc3JrtPJnPjx/MT2KMnJ4ta7Sl06ZRYCn1vo5pwDRJarUF3Qnt2i6lOXq1qkI=
Received: from DU2PR04CA0282.eurprd04.prod.outlook.com (2603:10a6:10:28c::17)
 by AS2PR08MB8574.eurprd08.prod.outlook.com (2603:10a6:20b:55d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 11:58:32 +0000
Received: from DB1PEPF000509F1.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::d3) by DU2PR04CA0282.outlook.office365.com
 (2603:10a6:10:28c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28 via Frontend
 Transport; Mon, 15 Jul 2024 11:58:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F1.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7784.11
 via Frontend Transport; Mon, 15 Jul 2024 11:58:31 +0000
Received: ("Tessian outbound a3a2ee2b3d29:v359"); Mon, 15 Jul 2024 11:58:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8f26292614a55c09
X-CR-MTA-TID: 64aa7808
Received: from b485990fbc5e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EBE21211-E3C1-40DF-8772-16D307BF0281.1;
	Mon, 15 Jul 2024 11:58:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b485990fbc5e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 15 Jul 2024 11:58:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tW7ODkfKjPdYEaOrBLyIl7CANM3QwKapZHV6wfTckLV0d7Ey0xNrGRXE13HdeRTsoS1XUNlDErW26gV2LXxOx+gnNlBxLdabVdYxQVgDUvzxWyu5H+FQSV4oisxSGluUtp/g79IINwdWsynnaTlGCgJahthopIpsmwe5fhK4IeP3157KMzn9z3dBc8q0jmX/wDHBEWXaMf/9K6DetTlQvpp6kny+MiFNlhU3WHqCoZx1b5DVzttio1qj+dQ28M73ZlrzSb2Z6AP66/ixVvaa1rnhjPc0s8xqEqlnIiG/0wUCkzuUbpct4DuiZFs5OqRjI5TZ/IGT2bTw6KYKWu8KYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fyPOmaWyr+mX07LTVam21ReEiQ+hwiKI6wJOSo3q1w=;
 b=OHVMDGsxxpZeRKoKlh99UPqrYGk4k6aCuqBpDJE78va64H/ut6GtxmVJnyo1H991Qn9g6/PIcu5Qp0JLdu8UMWmsIoeMz+KoTcuh8jywALJ2og7LEzn7uUp6zdP/bn2TQDhjBVl6wgu1zyWiEA8nLOE7ctrmonvwZCs9fqKIr1PafoeAvQzzjkAEKZlostx2DxZtXyRXCS/rCiMvhB0BtmGBQuV1pRE0kJRlJgmWkEtA+3Z5jB5HgLq8xB/INdj1EnxydU+EsxmLvZn4aw9zUvAZ0ZrdJAzznzEoE5NsVVoRjBlkuNpXDYCJpY75Rsd034ijq84u9P/QebfeUPurcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fyPOmaWyr+mX07LTVam21ReEiQ+hwiKI6wJOSo3q1w=;
 b=Wnx1OZk2wjlVKAv2r43l4GT3252j8QIDJzsZJS6ROo3PYKfKvHaoeAfC/Lk84UEj7aFP5/ZLRZgziup/LmF6gPid6+YOzeQ1MAfcVbdlRN1CzUEc3JrtPJnPjx/MT2KMnJ4ta7Sl06ZRYCn1vo5pwDRJarUF3Qnt2i6lOXq1qkI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM7PR08MB5352.eurprd08.prod.outlook.com (2603:10a6:20b:10e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 11:58:22 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 11:58:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 16/30] librsvg: upgrade 2.57.3 -> 2.58.1
Thread-Topic: [OE-core] [PATCH 16/30] librsvg: upgrade 2.57.3 -> 2.58.1
Thread-Index: AQHa0q6YJNDEqDdecE2wr9+OsqcchLH3tyqA
Date: Mon, 15 Jul 2024 11:58:22 +0000
Message-ID: <222DDA84-EC67-42D6-9516-D98CBC624577@arm.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
 <1720604634-23406-16-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1720604634-23406-16-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM7PR08MB5352:EE_|DB1PEPF000509F1:EE_|AS2PR08MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: 05149408-d2d8-4cf2-adfc-08dca4c57275
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?cHJRK3RCcTdMS2o1NG9wMG9uSlYwY2VCYllhYzNmN2NySXl6SmNYbnl0aVpS?=
 =?utf-8?B?TjBadzdSeSttWWxtUEpuejNaVGRyL1BtUWtia2JDZTdKcEVDV2tPT3JTeEZm?=
 =?utf-8?B?Z0c2U1J2eDZVdElkaEp0Vi9peGJOZHN0b3IxMjF1ZHZKcW9sOVYyaGZqN2NR?=
 =?utf-8?B?MkErS2ZpVWNVTnVxNllUbWhtZlgwZlF1dDF1bzJ3Yk1XallkbXVYNUFHNFZx?=
 =?utf-8?B?bS9DakU3R0xKNXhZWGE3Njc5SlVOeURrYTRlYkJVM2JiY2U5UzkzQXFEVXNh?=
 =?utf-8?B?cGxubHNlLzFuTVN2RURFMldZc21jVVh1Tk0xSFZBcG1rcHVGWkxCQXMzUkQ0?=
 =?utf-8?B?ODVnaEFDa0NGUUdtVG0vZ05EKzJSQVpCVlVBUjViMTV0aGpuTkovZEpsZVdU?=
 =?utf-8?B?MTJ3Z2ZoeWZ4TFUvWW11L0xmQWk4UEVXM3pnR2N5SXZORzFwcE9DdFlCWjNO?=
 =?utf-8?B?ZUc5QW9DRlVpZ2FTdTF1anpSUm9vTHFUclB5dXRrZG5mMFByQnFXR3Q3Y1Y2?=
 =?utf-8?B?L0M2dC9uc1EvenRUR1Q3RVo5SkZlRnJNaS9FYXMwb2NDWnl4TWswNW9mSkxs?=
 =?utf-8?B?QmVEb0tiSG1aS0Y5VTZWUXFPRm4rbW55TytvVFB0REhna21reVFmalJ1YXAv?=
 =?utf-8?B?NDNwNjlSOVdQN2trZm9aMTlrUjZmUzAxbGsvZWxFUjYrcktPRnFkZFZkMUdk?=
 =?utf-8?B?WDBaYitEbGMxdlZZSk0zWFZhWlNHSytVUEpJZS9Fc09ZeTJoMzRyUmxMMEUy?=
 =?utf-8?B?NXVuWlgyZTcrak0zK2k4bXROd2tqcWNNY3UyM2xEQSs0OFR2Q1hVQ1krNGYw?=
 =?utf-8?B?Tk05cld6WUFtaDI2ZWFibGNEZkZ4bDBVR05yWTRUbWcvbFRtcXNZQVVxQXNu?=
 =?utf-8?B?RmtxZ1BZNHpvUzl5WCtZZ0EzQ2toMk1hZExQbThmdUZlSzNyeS9FcnNMd1dB?=
 =?utf-8?B?YS9lUTdhZVg1T3RMMkg5N00yYTI1MXhLTWo4K0Nqc0NEb1VOM1BHc0NsdWZP?=
 =?utf-8?B?UjFTUmw1VHBpc2tjZVc1dWNuZXdNVUhtbzlEclRuM1o1c0lFOVkxOW8zTDhy?=
 =?utf-8?B?Nyt2bXZQZ2NIL0ZwZm5XelBnTGZsaGxKb3Y4cFFWZEFPRXdsandWRTJxZktk?=
 =?utf-8?B?MGhaR2p0NTR3aE5TSVpWa3Z3NFdmbExMbUpkOUU2TktHL1VQSGcydTdnMU1C?=
 =?utf-8?B?SXRHUGpMWE5DaURkU2NoK3lMdWFHQTNNQTVSa2NWaWVyUFY5RG1NVjd4WXNG?=
 =?utf-8?B?TVZBSlhXcXNXaU14ZnkycXk2YU1KTUdOQVM4eEJGMU5LZythcFdRb0NIOURP?=
 =?utf-8?B?SkcyUjhKY3hpbDhCYmpSQ0liYXNpTUowSEFpcFpwajhpWXlScld5L2FVVkIr?=
 =?utf-8?B?a0QvYlZpTVJvY2FsdlFKbFlITWIrUVBHNUUvN1ZlOXhmKzVpTExLT1VMaXI1?=
 =?utf-8?B?S1NOM0d3ZFRXcWh0TjF2U05CbVZ2NmN6K2piVy9KNnlDNkxmbUJuVXQ3YlZM?=
 =?utf-8?B?STJRSWsyNDZNNlc3ampJcTMvMEdFb1Y0andoRk9lZ1FoV2JNUEVVS3FlQ3dr?=
 =?utf-8?B?cktDYVBaekVLRmI1ZGFnQ0hBZ2JvbVRZQmpsajlnMTltS05sU3M5aklPajJ3?=
 =?utf-8?B?S3Ywb0EvRHk4VTBvWTBNTHpYRmw2V1JqNEJUUHJEa3hqOCtUMFJITHlqY29H?=
 =?utf-8?B?M29Bditnb002OHpNWm43OGEzT3htWEZyMmFLcmdUdUVNYUV4SVNBTlV5MWYx?=
 =?utf-8?B?dWJKTFB5Y2RGUFA4NlpYZVdlMkUwR1RYSEQxdk83cmpoODc0alJHYWFnNkZG?=
 =?utf-8?B?YkREVkkrWkV2QjVsNWcwS3dabGlxT01HajNBd0VvcnkwMm9UZGRybUp2eUJy?=
 =?utf-8?B?d3dyM3lsa3RuM3g2c0h2R2JlR3dicVJwdXdtNWpDZndwcnc9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE99A381BEF39F4DAEDDF704247042E0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5352
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0d954625-8b7f-4233-3b00-08dca4c56cd1
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|35042699022|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QXdjdDd6TjJQbVNCbFQzcFNycC81SUtRUjZhWG9OVkYxNTZYbFBKbWlwSG16?=
 =?utf-8?B?N01HMTBYeC9oR2Y3K1ZMNitJQXhPQllWRWVweVJHZ0htSVVjVHRlQTFPL3Iv?=
 =?utf-8?B?QkZNRms3c1hLWEthZVBZVkZQQTlwSHd1enliR1M0VVdCMTBQZ2I5K000alE4?=
 =?utf-8?B?RFUvWVFzUzlDeldyR3dXc2gxR21VK3E5dUFvSTNMK2tENWJzMytLSjdOTkV4?=
 =?utf-8?B?ZmNKZWlxdjVLenJGSkpPUVFCbE9XQXd4K1VYakMxWk9RQ2ZHRWdNSHZhVi8w?=
 =?utf-8?B?VHdCakwvaWREQ0JScmptNnhFRWwzQkN1eTcxM2p5bG5OWmZTcElpUHZwZFJp?=
 =?utf-8?B?M21sSFhUTDRmcTB1WTh1ZWhWM0F2Ui9WNW5WUEMwbWgzVlNOZ1BhYmNRdXJQ?=
 =?utf-8?B?c2xFZEpFRkh2cHJxa25GcjVta3BHOGtHWHFYa2JtbFAzL0pYa3lCUzZ3aWVs?=
 =?utf-8?B?dGtlZFM3T010dWNHeUNsUXF1STErTnZsVE1iSW1jeCtHdmZOLzg0SlVydi9K?=
 =?utf-8?B?a01qUUN2SzI2NDlPSVJyaDdzYWFhOWkyQ1h5SHZna1EyOE1PVzVXK3UwNGpw?=
 =?utf-8?B?WWpBVzZTYzBnTFd5emdaM2FvNTJnWE11eUV6aiswc0h0ajhGU3B4UTRhTDB4?=
 =?utf-8?B?dGdXeUppWmxuVVpIOFl0THl3TGZwa3ExYksxVVltSVVoUE9JQmNmYW5ZRlNy?=
 =?utf-8?B?SllEY3pDZEJ3ZGQ1TUpmTUY1T0hMT1FsWHdyVEM0Rk5iN01sOHNDdDBlL3BL?=
 =?utf-8?B?T0Q0QW1ZYkZNVkpTRFNUZUZ0a1Q4VTJoSC95TmltZUhBdVNzRmxQcmovcmtn?=
 =?utf-8?B?UzdJeXh1T09VS2ZVbitRNjluOHNTSVd4UnljRFJlUkR1Tm1QaGhwUGtOcktP?=
 =?utf-8?B?b0QzVEFBZXJwMDNTa1FRTnZLN3F1ckdFeUxwOXZxb3lldGJJVWVCMjA2a1RN?=
 =?utf-8?B?bzJOamZ1ZzQzVGFYNi9nNmZsTXdsY1QyaWF3b0xmMGRXSTkyaGdwemR1bkFl?=
 =?utf-8?B?S2pLS29RYmpvd3R4cEtpSHE0Wm9NMTZ2QUFkUTNEbUhvbFVvT213Y0I4NTlw?=
 =?utf-8?B?MVhUaFRoUmdlMU5hMHhFVHErNDJiR2JSS05LWm1QNmRqd1k5VFpFUnMrMHh3?=
 =?utf-8?B?SEF1Wmg5YkJUM0V5dE9STHdkMkZqY0hQNklINlRaV0tGVFZUV1pPczQ1c29L?=
 =?utf-8?B?bFdsdkVxUkVZdER6OVFYWnlmRHcrb0lTa2xKc2VpejQ0bXBXWXl5S2FGUHp5?=
 =?utf-8?B?dDJtNm5icDE1eDI2c0ZWV09RdEpaVzRaa1lNMlVSaDBPV2l5blhrWHRxWWFa?=
 =?utf-8?B?ZkIzSGp1eDJaQ2NtRlVpNEJOWVhSQTRyRWIwaEVvWmIxdkIxQW9MNGVEOWVw?=
 =?utf-8?B?WVhzQ2xCa1ZUcTJqcDAzNFNYQW5hTzArTjgrMFNFMk1IRDBZdldkTG1yVTY5?=
 =?utf-8?B?anRJb1NNOVB0OTJTN0ZNVDhCdi9hVldYcnJ6NVkySktOczdUTnVuZUZxWExp?=
 =?utf-8?B?dDJBcG15elhwd2lJMTNlNndhVFhWWWlvZU41Tnl5OU1xUVpTcGR5RVJTbitp?=
 =?utf-8?B?UkJFVnFyNXFoelpwaTNYOTREZ2E0OXRYRFphbWV3S3BKeFBhc1laMXN0U05z?=
 =?utf-8?B?eUoybm1weE40Y3lBQ29haEpXOS9XemEvbUFkT3dwZDZ3MDZSWG1hbzFFMHlm?=
 =?utf-8?B?YmcySEV3YXJPajh0MkUycjMrVXN5dnpiblJKSjlYNjc4NnVwNXdpd2pNMy8z?=
 =?utf-8?B?Tjd0a3NhelJ2WTVlL1NpUE1zMU0zWTVldW5DVVZWdU9NcE5HUEFRejFoRlln?=
 =?utf-8?B?RkYyYWpMekd1dCtYeHlrbExLbXI1Q05BcjRVSWh5aVNTT2huL3FnNlI3bm9m?=
 =?utf-8?B?bVE2T243TGM1c1IvMEZhUGxvWWh4alY0aVlMZk5malEwdERpVTM5UEVjdGhk?=
 =?utf-8?Q?vZm+oT3Adfv0UTpGT6AuDY299ZU5sLU2?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(35042699022)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 11:58:31.5595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05149408-d2d8-4cf2-adfc-08dca4c57275
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8574
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 11:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201915

T24gMTAgSnVsIDIwMjQsIGF0IDEwOjQzLCB3YW5nbXkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPHdhbmdteT1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4g
DQo+IDAwMDEtTWFrZWZpbGUuYW0tcGFzcy1ydXN0LXRhcmdldC10by1jYXJnby1hbHNvLXdoZW4t
bm90LS5wYXRjaA0KPiByZWZyZXNoZWQgZm9yIDIuNTguMQ0KPiANCj4gQ2hhbmdlbG9nOg0KPiAt
IEZpeCBmYWlsaW5nIHRlc3Qgd2l0aCBQYW5nbyAxLjUyLjEuDQoNCk9idmlvdXNseSB0aGF04oCZ
cyBub3QgdGhlIF9mdWxsXyBjaGFuZ2Vsb2cgZnJvbSAyLjU3LjMuICBJZiB5b3XigJlyZSBnb2lu
ZyB0byBpbmNsdWRlIHRoZSBjaGFuZ2Vsb2csIHBsZWFzZSBpbmNsdWRlIGFsbCBvZiBpdC4NCg0K
VGhlcmXigJlzIHNvbWUgbm9uLXRyaXZpYWwgY2hhbmdlcyBtZW50aW9uZWQsIGxpa2UgaG93IHRo
ZSBlbnRpcmUgcmFzdGVyIGltYWdlIGxvYWRpbmcgaXMgdXNpbmcgYSBkaWZmZXJlbnQgc3RhY2su
DQoNClJvc3M=

