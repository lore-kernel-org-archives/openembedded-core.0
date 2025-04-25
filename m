Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E45C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 11:33:08 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.49])
 by mx.groups.io with SMTP id smtpd.web11.4480.1745580783190306396
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 04:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WssWwkSn;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WssWwkSn;
 spf=pass (domain: arm.com, ip: 52.101.67.49, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HWGVHxV9FYEiDzTY0TJhjcnWi1GQRTsG5abLvV+qENT55cyDWSiPGxJNDCoMI+Lxm9q+xVKYoOIDhjYjn245YDBG5V7S445Xq05fXWezTUPwmfwh3cCBCyS16OZVszv/H0JqgxKGld+sMX3WaHOkSEFGsMwRtI2U8igf8fOTDeB5MI26/7gtgqQ2jjSu2ERlwyR31UYfBuZyE6tSdMyaMGenUhhTfvHo2kHWS2E13r1dE+w3ibiNhTObd9Ibl/TZeISPHOtwQU/vNWfrElYQKhRERrBPARgNhwJ3r0Kk0RcouFhjIXe3iMbbJpa6ykHgV9t4QqeotPI1+1+HUkc3pQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIKUZWLZQla6AYusMJZ6ZdZAa5sW3R7VIKLmsf1/2mM=;
 b=YCzl4Hu46bDkDmFACWG82y8YyBF/668IGV86dg82FQrh09kzepxjpLZHwVU0Nc5czKEch6F8ywj2Mos7QRiMEyq+rPG+Q8TTcTy+RjnV5AEvo7HdCESw0N7aqM9xJnRJWClMJnJyUMAmsPnW0Mo5cAGLLiG/hbx6F5hKtyVZYTGvufOUzI/a+TNv4/6oj94ufwd96kJEphiv3cx0WRw+x1Q7a3cy2YJ9+kVVCPVoRpVRaV/9W7RVzfDnNvc29KhlbysvNzL8RNt3Mi2BrjgqrRvK9/3Rfx013uG7aqwjmtXhNVqIYhP94uACwubEac2sy94pXG6p94zfsFZTlAs99g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIKUZWLZQla6AYusMJZ6ZdZAa5sW3R7VIKLmsf1/2mM=;
 b=WssWwkSn59cknXuE7Zbz9+3UiGgCtsZQMQ0Gnlnk36YBQjK/36MWI1ICv2lv0G/YGJAbI04bOnj724CCYMAGNTpKpaFnrl9z1HgFLy97HWRpBfePrjbqF56lK6dUUMwZpl1Hbrlj+yrqU3clrsOBvaVEyQ+6g0ScgRy0dkdPcTE=
Received: from DB7PR03CA0075.eurprd03.prod.outlook.com (2603:10a6:10:72::16)
 by DB3PR08MB9109.eurprd08.prod.outlook.com (2603:10a6:10:430::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 11:32:59 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:72:cafe::c5) by DB7PR03CA0075.outlook.office365.com
 (2603:10a6:10:72::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.34 via Frontend Transport; Fri,
 25 Apr 2025 11:32:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Fri, 25 Apr 2025 11:32:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtBE9SOogwTXgHhe/+vSC8easYdR3E9MTUGkTcJf6buNNNcVE8iu91wZQoFYE9L4tvLKTYWXxtjdka+P7aziFVONJYbxrt1heR/yEo7+2ZhFIbUZlV4EJY6N251d/fMB2deg6p058sOvKO4Wi39TbHhj63SDIL0ObfkMvJ9ymkyP7YN/lzAS18ZlPYddy0V0gF3YpQ3+CgdFJTxERiyCbEp9IsLuf9jV84OeLKciNeNijkjxZdfmL/QUKVpaEcqldlaX8P9ZFTqPzojGLQaINX+wIb5w6PIRMtnm1XdGMNHOVLr5RyAUBVLCMCFvVLD1IfuhvwoK8sNJ4ohAM+OdYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIKUZWLZQla6AYusMJZ6ZdZAa5sW3R7VIKLmsf1/2mM=;
 b=asDXyDNISQz6OH+JHk8/DgwnnxmGhVQCkgrmjfSMgNFINji3vAg2i9zmPKtVjCFD/ZCupgOU8GFe31ECUWdyEPdQFxIDCE2crOzLbdq6maZC50dbAqt2hk44j/Dk0RudwaDsvhGnKyq+y12ExWK6LXvA5BdiV21/AuSqKtZh3edvtxzcqWNxp4hW+3Dz4hRxHdfgUJrA2o1LpdIafaG+fPt9nYbiq03//08KPDvolNVid5Add0+ntg6ALW9jrG9qeCCEQ/am71uN34U344kKT/OEzW1A84ODfrjf7klhQcvTEmPupiDmckx/vnUwPQxXP2sI8nDUtaSQr89mwrMMsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIKUZWLZQla6AYusMJZ6ZdZAa5sW3R7VIKLmsf1/2mM=;
 b=WssWwkSn59cknXuE7Zbz9+3UiGgCtsZQMQ0Gnlnk36YBQjK/36MWI1ICv2lv0G/YGJAbI04bOnj724CCYMAGNTpKpaFnrl9z1HgFLy97HWRpBfePrjbqF56lK6dUUMwZpl1Hbrlj+yrqU3clrsOBvaVEyQ+6g0ScgRy0dkdPcTE=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by AS2PR08MB9499.eurprd08.prod.outlook.com (2603:10a6:20b:60d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.25; Fri, 25 Apr
 2025 11:32:26 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%5]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 11:32:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: "adriaan.schmidt@siemens.com" <adriaan.schmidt@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/1] libunwind: 1.8.1
Thread-Topic: [OE-core] [PATCH v3 1/1] libunwind: 1.8.1
Thread-Index: AQHbqt1k7cZlgvxc9ES+O9hDAGzBurO0VLyAgAAA7IA=
Date: Fri, 25 Apr 2025 11:32:25 +0000
Message-ID: <0C960F34-637A-4075-9C45-B9BC43E8DB7A@arm.com>
References: <20250411122926.706371-1-adriaan.schmidt@siemens.com>
 <20250411122926.706371-2-adriaan.schmidt@siemens.com>
 <CA+chaQd9qFEXem+k9sbyWHU71k-ijTmZC-XHXUMHt8ibA_o8Kw@mail.gmail.com>
In-Reply-To: 
 <CA+chaQd9qFEXem+k9sbyWHU71k-ijTmZC-XHXUMHt8ibA_o8Kw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|AS2PR08MB9499:EE_|DB5PEPF00014B9B:EE_|DB3PR08MB9109:EE_
X-MS-Office365-Filtering-Correlation-Id: a7e0c002-daa0-4f22-1ee6-08dd83ecee37
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?d2kxNm1nelFFcGptSTV2MVJCMnpkZHJ5azIvNW1VWFAyZEJxaURSbC80TGNO?=
 =?utf-8?B?bVNhMEk2V1c5dmVTSjlxSlNJWStrUTFDR1VqRkthQnJLZGV4L0FHc0lEM0V3?=
 =?utf-8?B?ZFhFOHE2NEhSb0llYzdIcVBLY1lPVytnWGFPVXJNb3ZRWDNNeDhjbEwzT0VI?=
 =?utf-8?B?QXZNVE5tVXNEdXJZSjRzOHdQZndPOVE1ZmJuSUpIc0tWQktBU0ptcGs1UDht?=
 =?utf-8?B?T0xoZmhiS1YzUE1ySGNOUCt4L0NTS2F4bXk4QjVvSDBtYmM0a0pUZEk1YktB?=
 =?utf-8?B?YVpHaFpGeDVNNEpuYkUwZDJ5VTFLeXN4U2FQOEp5Z3JFeU1LMUFLOTdzWVRE?=
 =?utf-8?B?ZWpMSFlxRWdiWUlTaVAvMXMvMGtDTFFHTVZIUkNabXNOQ25kUXB4dW9NZENl?=
 =?utf-8?B?c3AwdUVTckFscUV3cTdKTWJVTWlBODVOYjVFY2lFeThKc2tpZ2xxUVdvbHVy?=
 =?utf-8?B?dktPRUxwMmJwYW1ua1lhNGdMcDZJS2Q2ZEtkSklFbFk4ZVduRU9od2FKUXNG?=
 =?utf-8?B?RzZBKy9VT080dGlUZ3FHamlFSlRpSkhnaXI5YW53T01jcUVXU2FZc0xzWWkx?=
 =?utf-8?B?djFCaEplY2ZzZktmWXNMWHZtZFJZWUduMEVGL21BNmdQZmZ2OVM1OUMza1Vs?=
 =?utf-8?B?MEtSbE9iQmNXdjBBSG9VVEJYdktJOGpKRTcvZE9HaHd0ZTFkcFVBa2RpTVNR?=
 =?utf-8?B?eDdmc05HY1NtdXMrNjFSS3FaWkM4MmRtUk1EK1YrSlc2WEhpakZXbzN5dG1D?=
 =?utf-8?B?OUhyVy92cGNWcFQ5VnJFRmJrQ0JHVVhDVkhZYkhOYmhpVnVxeVo3YlZvM1Ny?=
 =?utf-8?B?OWxYUHdmckNGNHArWERoUWRyYTgzK1R1SjBUTkxzMEVCU1BoR1lKTm02VjZi?=
 =?utf-8?B?Y3hrd245RVdVWDV4V3piam1nTHBhVDFtUkhqSTR3Z3QxQUZHMkxsaE94elB5?=
 =?utf-8?B?aStMR2tQQWFVZ3B3VG9NUHV5UTlRcGNEaFYxdEtma0daSDlrSHNqZ093TnBM?=
 =?utf-8?B?QjNWUUViSDZMTUpxZ1gvNm56Q2R1WGJFemdpS0VZd3Nya2dRUU9lMUJ3RlR1?=
 =?utf-8?B?VFl5RjNOaXJsdFNsTmFjOWl6MjQwY2ZCT29USnBLaFNmcTBzT2NhWEdoYnN6?=
 =?utf-8?B?MzkwNUUwVmxsNDd1cVR5S05rN2pGM3dyOEd2dUFCcHNDTmFRbDNoS2tWc3E3?=
 =?utf-8?B?ZXBlcTRHcXpyY0hYb1NwWk01K0VqQmF2WnhHY3VIYXc4M0Zmb3V0YjFUVThB?=
 =?utf-8?B?NVVLMDF5bHUzY2pIZDh3ZGc5UVNIVHA3b0ZKSzV3Y1hqMWVZNzZZN015Uk9k?=
 =?utf-8?B?V2JuWDdjTTBCc1NmTzMyVGc4a3ZmU3FpTDBBK1hSQThjdHd1cGYyaXZvMDlU?=
 =?utf-8?B?d2gwa1lFYVkrT21xQlcvQ05ITzJWK2VYSVY3STc5SlZkRE5KTEpPU1RGMzhL?=
 =?utf-8?B?WjZJTy85cTBaK2tGUnlIVHh5Wkdpb1Fkclp2Ym95UjQydXlqT3VmMmF3bTl5?=
 =?utf-8?B?RjNOYzJVQTI3eHkzdFZGQXRQQjAxWkdGbUh2WGJrSVpaczhhK1FxTEt2NnMw?=
 =?utf-8?B?c2tpT04ydXVweCszQ0RQemxWTHVGYXh0aWM4L2k0VFJMV2dkSW1IWmwwZDRn?=
 =?utf-8?B?em1SWm9WUFRvWkFNSG03WWdTV0dwdE9MMnJmRmJDc3dwRFl3ek1yU2JCRmNL?=
 =?utf-8?B?OFhTT3g3Tm1Iam1tNFFaT0ZQQXVPR1JITkFqVS9YNTBtd09OTnR2aW1lT0pC?=
 =?utf-8?B?S0NsRTA1SlhVTm03Mjg0S0s0UWszNFZzZGFmam1KeEJEQm9pWmxmZVRBYzUr?=
 =?utf-8?B?RDgvSElERzkyWlUzMWFlaVBMVHlrNm5KU1pERDFEMUxZT1JFOU9JNFR1ZjQ2?=
 =?utf-8?B?a2NtQjgwWFZIZ0xqWVBRUjkrUlRmYks0U0s1TnlGYUFLb0lRQ0VHTXhEclJF?=
 =?utf-8?B?Si8vaEt1Rko2T0I5NjNUbmpJVHRjSVpSRy9wc3I3VllwTTVaTWVaYkNITFc0?=
 =?utf-8?B?Ynk5V0ZFTk53PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9C7BE62A2BF604AAA32B90B2FEB37D0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9499
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fc7575ac-d93e-4a33-5412-08dd83ecda90
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|82310400026|36860700013|1800799024|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TFJyYjNMVzBqQVZ4b1k5REUreXh5c2tEenhLZ2U5RnY1RmZFanNiN3ZadWFJ?=
 =?utf-8?B?dWtTV21BR25MUEFvcXBFYStxR244eWYvS3hYOFIxQ2NNelhxU2Z2TDA5Qlps?=
 =?utf-8?B?NWtJZm5OOTd1eFpIcTdJUy9jdllBbWN0REp3UWlBSXJIT3dnUlg4MHd6cjhF?=
 =?utf-8?B?SUhIdG9xalM1RTNQYjBtd2VaM2VBNEtjTllWZkRhMHRSakNkTWgxb0o4SklI?=
 =?utf-8?B?aFl2QWgyVVVHcWpmdEhHdEtWdUQ1M2lQUEhHMUV0YXpaelI5dVF6SG5tSG03?=
 =?utf-8?B?WW9nMUlqNzViak4xamFDVGdiYjIxSHNtUWVBMGRVTUtmQkw2VVVCT1cvdzdJ?=
 =?utf-8?B?cjBwcTRVQWFCS2Y2eGlGcjArems2S0JUQUVqQjRobXRlN3hIVTJ6empTV2lB?=
 =?utf-8?B?dWpMcVpDeUxVQ3o0bzdkVE9QczNrTGxCVEY1c3FVd2tEMHp0bXNFMnQvZW5O?=
 =?utf-8?B?QXVRcEQzWnJsZGx6ZWdCeklocGM2eXlhcytPRGZzSWI0SUVVM2JJb0llakVx?=
 =?utf-8?B?NzNXYXE0RXRUNjJWUllGT1BQY3FxTU54UU5wT2xROHRMVGVYaHVweDd3b3lT?=
 =?utf-8?B?elRkV2RKb0lJZ0R6TUJFSEUwUzN4blBqT0NaYVV5SFlLaXk1d3g4SGVlcEM4?=
 =?utf-8?B?MDQwQnhVUWg3NEhYMThhYm9nVFhBRURISXRDTW8xWWFzWHdXa2V2VEtTU0h3?=
 =?utf-8?B?a3llWnBFMmkvU1RBNWY3UHRLdktaV2lQaW03RHo4NGR5cDdITHpwTmZwSHR2?=
 =?utf-8?B?YlY2cWF6T1poYjhNbXRVUWhKV0ZIT3NhUlE5NkQyK0RhV2NRa1VWUVJJUHYz?=
 =?utf-8?B?TUgrVURzRlBneUt2K0VpeHFreng0THJNWUdFbFVqMmlDd0M0TjN3Y1Z0T3M0?=
 =?utf-8?B?TDhndUE0emwxMUlsUm1OT3pIUlZiVkhNTjJ1MWxBOXA5V25JVGY0SkFXWUNo?=
 =?utf-8?B?ZitIbElENFJnYTgyVTAxK2FsQm9kd1YwUWZIY3UwbFNaVmJVSndNaDBLc2oz?=
 =?utf-8?B?TDdqUHo4VW5WNE1JUlZCQVo1VHNzejR2YVR2MElHY25aK2hIcXF5dFc1U2Yy?=
 =?utf-8?B?T1gvVlFJSGYxV1JFTk84MWdnN3hJQmhDQ044WGpDTXBreTdERWxzRE1oQnZK?=
 =?utf-8?B?dkZUWHhJVHd5TnFXNnk2VHoxdm1zR2J6WDVPTllvQXJDT0hkSkFpOXUrZktz?=
 =?utf-8?B?SDBxajBlSmVZM0JjazlEZGdFa0xtL25KeWxsbWxhQkxvbHdzNDROOXppU1Vv?=
 =?utf-8?B?Y3pac0gyQnZjWHZ6WHhsUitzb08vbEdSUHk2WEhRUTFCU1FtNmtQNDU4M21K?=
 =?utf-8?B?cFBramRYRkxtOXlHWnF6dldJMFFDU0h1OCtUQnI0SnJMM3p4c01FM25Gb0FW?=
 =?utf-8?B?Z280UVpVVmpJeEtQc3BEclQ2K2NvQXptUTRiVXpBQVUxUUwzNGtKemtYaWtz?=
 =?utf-8?B?cnFMOWc3aDBidUNDNE4yT25WanpCTmV1WWFXR21SRkFaelNWVXpYK1JGRUFu?=
 =?utf-8?B?Z3JpaURJK2hJTFVyaEFiUWRsUDRqZXdxR2U4UzN6VnREZ2NHT3lsT3F1aGlq?=
 =?utf-8?B?cS90QjVjdlloVEFqZUI4N1ExcEdON3lDUHBrbUwvZ3lWQ1FsMjdDcGNxQmcz?=
 =?utf-8?B?cGFiTnBydGl3VG40OG01amRXWUFjN29oaUpKSkF3QXZBWnpTVzR6ME5tVnRJ?=
 =?utf-8?B?aE9RNStNVFd1cWUzVmlobXMzcjlpOWM5SWlZL1pvRUk5djYxWk5INktTcHpS?=
 =?utf-8?B?di81aHRmb0djYkpTRTAySnRmUVZsampIaWl3bHJZMDA0aEp3dDBQMHZTRzgv?=
 =?utf-8?B?RVFFS0hqaU5PanJuN0c0Mmp2UThGVE56TVBLb2lOUGtXV01uM1JYYVplQ0xq?=
 =?utf-8?B?Zk13ZitBKy92OVFlZHhIdUo4SjJjOTdNVWlIRzZTRUExZjZuUldienZHSFpB?=
 =?utf-8?B?Wi9NbWxYUHVhbU96YnluTnh1YS9HL3p4QVhxZTlWTFBpWDZuUkJsZGsrdStq?=
 =?utf-8?B?bjRyZVhYS2FRODRteDlDVlBkajRua3BrUzdSbUMyM2duRDh1bSszVm0rbzlM?=
 =?utf-8?Q?FxSqVm?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(82310400026)(36860700013)(1800799024)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 11:32:58.7600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e0c002-daa0-4f22-1ee6-08dd83ecee37
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 11:33:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215458

T24gMjUgQXByIDIwMjUsIGF0IDEyOjI4LCBNYXJ0aW4gSmFuc2EgPG1hcnRpbi5qYW5zYUBnbWFp
bC5jb20+IHdyb3RlOg0KPiBIaSwgd2l0aCBnY2MtMTUgSSdtIHNlZWluZzoNCj4gDQo+IEluIGZp
bGUgaW5jbHVkZWQgZnJvbSAuLi8uLi9saWJ1bndpbmQtMS44LjEvdGVzdHMvTHRlc3Qtbm9tYWxs
b2MuYzo0Og0KPiAuLi8uLi9saWJ1bndpbmQtMS44LjEvdGVzdHMvR3Rlc3Qtbm9tYWxsb2MuYzog
SW4gZnVuY3Rpb24gJ21hbGxvYyc6DQo+IC4uLy4uL2xpYnVud2luZC0xLjguMS90ZXN0cy9HdGVz
dC1ub21hbGxvYy5jOjQ5OjEyOiBlcnJvcjogdG9vIG1hbnkNCj4gYXJndW1lbnRzIHRvIGZ1bmN0
aW9uICdmdW5jJzsgZXhwZWN0ZWQgMCwgaGF2ZSAxDQo+ICAgNDkgfCAgICAgcmV0dXJuIGZ1bmMo
cyk7DQo+ICAgICAgfCAgICAgICAgICAgIF5+fn4gfg0KDQpMdWNraWx5IEkgc2F3IHRoZSBmaXgg
Zm9yIHRoaXMgaW4gYW5vdGhlciBkaXN0cm/igJlzIHJlcG9zaXRvcnkgZWFybGllciB0b2RheSwg
SeKAmWxsIHBvc3Qgc2hvcnRseS4NCg0KUm9zcw==

