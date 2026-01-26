Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F0FD13C03
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 13:04:27 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19474.1769432659858899984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 05:04:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=BPnlnqnM;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=BPnlnqnM;
 spf=pass (domain: arm.com, ip: 52.101.84.30, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SPmbeENlb7S763ZkV5RTqZfxo25+80KvYLrS5U7d/aa/ZUcRBtPkTLb/+nLCWt2ODiAHi4G8Ry8H76/86CJlz7gFsPLo2DsmgY1Ltyp9iM6PgPf79qaaTq4R9AKYaqMfGJQn+b1NMInvwuqmC+FArDvCkWxPnUTA48ouY5vRIjmQt7XVmAEXS3yjiJLa1wfBr8dove5hzWhnj6WbToXz1TiF5buzHf5mPGndkmUmP7CzRyl9FK6VOnjO7BavobSfUawVrqN+ZbSXKkMhISi+9AMc0h/dnidyL7X4q6ozht2IgqmYPUiQn0Q7EoCXDk6USjRuW4SD9BOUhOjciNFvxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yO+lojvMpCz8VtOeuLUkhgfsLVj3G4ScjUlZLD5pU/E=;
 b=m7h2/B3BnnBI75GxuWqslPQWDxFHM2Lv4yM1lW8vpBMIvwMk8rcYbk1ld2qT3TGH7ONw2mmMKmk8uvlZ22tkcX7z1Q0PQ6PcaisyMXpbiMiHuABNt0h85Q7QYsmhDCIvqMZD3omhSppEb/jrVqsnx0HGmFvBUtmDxmyZBLBBf8ZwHR1O1F4OIW4Q452AKCZ1LWUwORyyFc8l6AUk33ZzGtOJ4f0oSRKVuDbszQXoyT/TXJoPqruuSiZTX406DDqvKwSzACYcMIpmmC/E17u6AB9XvRMnV8V8uLk/RVuDEZr9gB/3S0JbW70yz4tDvIDa5EQF/Ji/0yM1+a9G2CNyhA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yO+lojvMpCz8VtOeuLUkhgfsLVj3G4ScjUlZLD5pU/E=;
 b=BPnlnqnMBOz+PSw3bGnWCMjevE3DmJlTubLFCCb2sEM06VzAGsM/EJHLbJfCRAiATKz6T4h3nCAOGC04YBiVZ/SnOPhDi9aJIWhz/zq6svwmaJN5kDxspepxhSOOMAlTcBhV8bJL6n0yJ1YPpKk+xtd0kqiylNGNA1ade+LtNeo=
Received: from DUZPR01CA0176.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::12) by GV2PR08MB8270.eurprd08.prod.outlook.com
 (2603:10a6:150:c1::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:04:11 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::6f) by DUZPR01CA0176.outlook.office365.com
 (2603:10a6:10:4b3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.15 via Frontend Transport; Mon,
 26 Jan 2026 13:04:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Mon, 26 Jan 2026 13:04:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9DHxULxUKKGqxSoxMCNCdAUhfY66j90nygtagsBLVpxRPUNVGBHsrLSTHue1dmNilb6uS9ahtXLdEk8ewOxabc2xytoVHIiXjIXo8R+ogAF8aYQBcN1Cjgmxv0uiyCDug0jxYG+75Kqdx5fI7NdmyMBsV9Lcha27xmBpOUChY9/GnODh9fGYU3qnU85iv2rrnfBFdJD1WLVnrrzczyg/w4QQhHflue/44C7EVYc7LTM1hd5i9MPV/Bypj3+U7EaHxOSi5bicJKNSgFMfAsGCrTUUmGsC5qwuErVN+wKwWouDeHdEsXouvgi/a/CyDRPKq/olebl3C6deQ3X0jinaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yO+lojvMpCz8VtOeuLUkhgfsLVj3G4ScjUlZLD5pU/E=;
 b=LA50eylRrE8wYvDT3+gX1DCxZ35wpo8Z/2Wt6lBCrTSLpovRjGT3oDTCwfDxKybdtxj+sl1J7RxCmN05WU+PTg33pWsEm0Ukxo8lzvl8fUH/UfhwWD32QEvlz5af2AHbHa6fXk2FhHZHO8BbnrndqUpg3ernxy01iE9WlGQsytJEdMxRpdRx6Ay3D5AerxDwey4/quY5Jtj7CHMW/zZ3LZ1sk0aolyoPwgEXAIr4wclALtZCalnZsLVtZnno/FTTJ2my+KQeo2qWw53bSE7KiO0dDwz4KU8Yo6BhEcCE4Zdgm+zULcOYMVWitVgzVj9NO2kHNBTPYCgmKtJFC2Mo6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yO+lojvMpCz8VtOeuLUkhgfsLVj3G4ScjUlZLD5pU/E=;
 b=BPnlnqnMBOz+PSw3bGnWCMjevE3DmJlTubLFCCb2sEM06VzAGsM/EJHLbJfCRAiATKz6T4h3nCAOGC04YBiVZ/SnOPhDi9aJIWhz/zq6svwmaJN5kDxspepxhSOOMAlTcBhV8bJL6n0yJ1YPpKk+xtd0kqiylNGNA1ade+LtNeo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA6PR08MB11287.eurprd08.prod.outlook.com (2603:10a6:102:514::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:03:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:03:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "jianpeng.chang.cn@windriver.com" <jianpeng.chang.cn@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] alsa-utils: fix dynamic package splitting
 dependencies
Thread-Topic: [OE-core][PATCH] alsa-utils: fix dynamic package splitting
 dependencies
Thread-Index: AQHcjC7e7urZSdZAhkOqGsTeJht8j7Vkb9CA
Date: Mon, 26 Jan 2026 13:03:07 +0000
Message-ID: <510ECB90-577D-4972-871E-12451C272B7C@arm.com>
References: <20260123032747.99010-1-jianpeng.chang.cn@windriver.com>
In-Reply-To: <20260123032747.99010-1-jianpeng.chang.cn@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA6PR08MB11287:EE_|DB5PEPF00014B88:EE_|GV2PR08MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: 57e34b3e-2ef2-4a8a-8aaa-08de5cdb652b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Ynd1aG9walRTLzN1aGNhQy9zbkN1MmVUSUorY1daTFRKUlVhZWh3NGNreEd0?=
 =?utf-8?B?RnZBWGtvd0RlQUVFR2tFZUJNa3JTVjhYZCtYdFpmbjRzY01GQVladGZVM01y?=
 =?utf-8?B?OUlrWVYxa25RVmdzNSt3NGczL0lRb1NqT1BpTldmU1hUak5UNEJvbDhTeXQz?=
 =?utf-8?B?TjBHVi94dzZoem5PYm5OOGxuZy93M2pqdDE2UXFReW5CbmZuRlFPc2lvYXlj?=
 =?utf-8?B?NmRQY0t4c3NSSEhYM3dCSHNHeGc0R0JuSTdaOGwrNHhWUWJNYndGdUlJcXFt?=
 =?utf-8?B?Rmd2WFFIbUhRMkdoS2p4SXU2SEtBamZtV0FKUzBDWi9lbTNhYldQUWdYbnhM?=
 =?utf-8?B?TkxMbkJTVFBDQk9RWmtWZElMdVBYbnp4TDFrSVZoY2dNdEhxVms5SUY3UmQ4?=
 =?utf-8?B?WjhSWk1hWnppa3UvOXpaa01Ba0FaODJWMDFxV202SG1ZSHlmS1dWTXI2VlFX?=
 =?utf-8?B?RnM3YTladU5xMTZoV29Vb3pFYWVQTUZ6U1p3S2pEcFFqSEI0S1ZjUkJMN2wy?=
 =?utf-8?B?QU1veDR1dE9BTmVKalhRT05veTA5RGJoVHp5MzZvL3JXVGYyOEdXSUQyZnpa?=
 =?utf-8?B?YWx2bm5vY0R6cHNaMEZzNnB0cDgybUJ4UmxmcnhtZDYrMHRsN0d6b0NWb0cw?=
 =?utf-8?B?OVB2Y1lOSTBqbHdHcHdnVTlodVB3RDZoV3JnSFRnSGJVNW13cmVKalp4ZEZs?=
 =?utf-8?B?MmEzKzRydlVFTTVIc09kZXI1Q3JMM2VDUzA4NjRlZFI1bFRBV0dxU3JlT0ZC?=
 =?utf-8?B?UG5NeURjc2N0Sis5VUo3c0RydXE4aktuTDRCcDkwWUU1QUdHdm9HQnpOdXVp?=
 =?utf-8?B?d0w1TzJxMXg4WjlEZ2xFZFJheWtFdURKWUF3QTFBKzhQUnA4ZENZUmltTzly?=
 =?utf-8?B?cythZmptOU5LYTNRM0Nldnh1b0duYXllSXQ4WWF3TGt6YU1KTU1OVlFoVnZH?=
 =?utf-8?B?R1phNTd4YmxhaDdNaHlYbUd2b2VJdFFXRnhVM0xjeW1oV1JlS1NwcGgxTVZQ?=
 =?utf-8?B?b09pTDg0YUowdFJnMkN0VjJEL0xGWEc0L1htbk9OTzBpa0xYRGFvRjFJNDBo?=
 =?utf-8?B?ZklkMXRVNHY4MjBTdGNiQXVHYjgxMlM2SHBFVWMva2FvQ3o3SVFocW9qQ1Y1?=
 =?utf-8?B?YVI3R0s3WWNRbGF3TllvWHlsR3k3TEE5V0VDcjVPYmhPeEVDcjBLSE9lTWF4?=
 =?utf-8?B?YzN3ZDZzN2g3eHplUkdKeEwvbU81L3d3REd3elREZTIyc3l5N21CVCs1KzVI?=
 =?utf-8?B?T2o2anBrZENzb2FsdDNEdUlFL09pOXpNT2JnUUd0eDVaOWZCb29STm5KOHBW?=
 =?utf-8?B?VUJrc3lmREF0NUhOMlZ6WDFGcGJDTllGNHVSOGpGS3QyRENodWRLVXdmN0Fo?=
 =?utf-8?B?OUYwdmFXa0hnaDltNnFKUEdGODZWQm9RRWdvOW9abzhMT1dVVm93azNVbUUz?=
 =?utf-8?B?RUl5ek5MMVU2d0ZKUlY4d0EwdXM0S3cwaFJ5VE9xeEc3S0dybFVpeDRKNjV0?=
 =?utf-8?B?YWdpUEl0N2Y1Y1dMazZxTGt1eFp6Qzh2WVI1OU1XTkVnTjRPaXhHYmswVDZJ?=
 =?utf-8?B?TjVYM1JYOUFVWWVRZ0RWUWswSzdKOG9uZ0tRY21sV05vOWxUR2RDMWRkamJj?=
 =?utf-8?B?Q2FTNnc1dlpTVStVcjZCV0pPS1JuaklGOEVYYlRBSWVwWWpZd21vakJYWFVT?=
 =?utf-8?B?RUtTUmlpM2J2NWdtNVA1WFJZVCtVU3dQeXl3bkJPWFhxL0tVQlU4N1Fsenox?=
 =?utf-8?B?aVRUT1A1U01FNjNQYXVMYURHSmI2NmZyZ3E0aDI3TlZLM3Y1eVlRNjZTUTVk?=
 =?utf-8?B?NW9ISEVZR3hOU3RqRERrRmRqNnFEU1Y3YytHc3pKL2pwQzBZZU5Qc1YxeEcz?=
 =?utf-8?B?QitCczNtZkt6blZPckZnY3dQbEhpVkpkUHFSSW1OQ1FJVURCbngyMVFZb3pv?=
 =?utf-8?B?YlVvcDl0Z3FRN1JjVEd2RGxaNTV0d3RIV1cyZHF5NHBpZ0kxdXJjcXE3M0VS?=
 =?utf-8?B?aTQ4UStjMVZhV05kRmhTTjdiQm5pODNFbS8xWEsyK094SVgxa1UzUjUxYVJr?=
 =?utf-8?B?NkZGWnROWGJoTThrYjZOa1lGTmdTRHUySk1QK2k4cGJsVytmenA2OW83QU1Z?=
 =?utf-8?B?ZTAyRWY5aFhyYUk4cHNuaEVMbnZDOGNVYzVYYkk4bS84aVpVY01vY1VscG14?=
 =?utf-8?Q?TsjrYQ86J6uA8/U3cE1eVkU=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E61877111917F41AAFD0FAD33F5D110@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB11287
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4e49fb1b-3952-4282-ea26-08de5cdb402f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|35042699022|376014|1800799024|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L1N5d2tCQ1VrWmJzYkhRVmwxR3gwYVBxcGdYK1RZNlhJWUU5aUJPZmo0dE13?=
 =?utf-8?B?dmh4WFNSSEFvL2ZseTFBNUNsL0JBQWh2Q3RQRHdwSDM1V3NVd1grdytCMXlD?=
 =?utf-8?B?cVVQdE5xQm5KcFhmV3AvTUNFaWp3TEhwZExRdDJtek1RSitXOFh6b3kyb2VX?=
 =?utf-8?B?K29IMGxQMjIybGxLK2FtdXcvRnlxSHIzMWZqK0hYVTZ1S2lnU2hIRUlzZ1FC?=
 =?utf-8?B?WnlZMERpcGRhUkpNeUVZSFkyVnc0SzhDZEk5S3ZEL3REWGh5WnVTV2VrcDVO?=
 =?utf-8?B?c2ZmbjJ0ZmgyeUpDUm1VOGpmbndzdU80VVVSc3RSbnY3QzBrUUtka2Z4bHlB?=
 =?utf-8?B?SnI4azNhVXRJWXBVTHBuS1l4NkJaVm5NeDg1c0M5d2hWM3NEWGpxeHlRV0xk?=
 =?utf-8?B?SS9IQ2x3OFV4ZWRUa1dhVk56eTNpL04yTXQ3bTVyWVkvNFI3ay96aW1KSFNM?=
 =?utf-8?B?S3ZnS1RrZXdST09QNy9xeHVVK1ovbTlpNlVPYzFvR1hCQm5YYXBQcEU1b1RY?=
 =?utf-8?B?MzZzakY4RHZXRnd5Z0pYcmpBWkxCREowZXcvUHBYNGt1Si9mcG5QYStFemhP?=
 =?utf-8?B?ZXZvSmtKWFlWaGR0bFg4VXdvaUphb0NZUzNraEFOUnJEa1NBYXFQRHQyZ2RZ?=
 =?utf-8?B?NHdpNGtBRU5HbnJKK1lVWUtXTC9WTkdBVk9DSThXN1duTTNCRVkxb0pZTmVn?=
 =?utf-8?B?NzZ5bXNHTDRFQlUwUURaR3kxY1dDOTdURlBBWFlaZXNXY0dWbDZXM0pHY3J1?=
 =?utf-8?B?akhMcFRIMDdiS0pDOGxFYk9xSlBSajJOTUVEMzFWdDE0cnkvRDFHZmRXOE90?=
 =?utf-8?B?bEltYmJEZ3lOWFpKVzY0cktBZW95Z1NCWU5lVDRLaFp3QXdOSVNqOGFtc2dT?=
 =?utf-8?B?UXpXMXk5MUpMbUJjQlhad0ZSUGw2L2FDTzRLekw0cHV0Qk9GUlRCWHE1N1FE?=
 =?utf-8?B?eGpWNndEYmFqeFBlS2NMWC9zYitObnhiYUNudWdtUkRBWE52bHpaSjRRejJK?=
 =?utf-8?B?R1g1aDFTbnJjd3VMMitzZ1JPTVZhU3B3UTBkWE1WeFF4dFlIZ3NzQldVZnVy?=
 =?utf-8?B?cFZmWFA1U0FQb0d3N2NCQzhjZ3A5Nmo5Q285NWdFL1daK3dSTGVoa0ZhZzdX?=
 =?utf-8?B?bUZZYThOZCtDR1hwOUV6ZXlYRHNJNFh1UDdDYnc3R2ZYY21mY2liRGhPZDhB?=
 =?utf-8?B?M245R21rczVia0Q0NFFVSmhDeTNMTnJjUFo2RHNvYUdXUHV6ZC9tK3Y2V2JZ?=
 =?utf-8?B?bm04T3M1akVzS3REUk9tMlA2U1R3dmhOaFUrOUdpZTAxMEs2empjN0NCeWpj?=
 =?utf-8?B?RGdoSG1ObGZLWDdSeFl2czVkL01ndmM2dEdTblVCM1JiVWZaZkJiZWw5bHhm?=
 =?utf-8?B?alRLSzZSU2l0NExQZU5PTkdiWm1tQVZPU1krTVp0S2hZWmRjZDB0dEFGako4?=
 =?utf-8?B?bXFvVWJmMjA0bUpTTXBQZlVZU01FOHZndktOTUlQZ0w0SHlGeWExL0lrM0lG?=
 =?utf-8?B?Y2pSbW1CQXUxUjVESGVyMDhQa3NjWWMwNU5TaTFNNTQwNmRpeVQvRG00ZUx6?=
 =?utf-8?B?Y1JINnNZSzMzTUlhMUI1QkVJYUVIMnZhM2hRUHU4UXNwRGxoQVllZk9iMjlI?=
 =?utf-8?B?R1lUVUdNR1kxcWg5WHNPdzRaaE5yaEg5bVNySjUwNGFxTzBkaURjRGhMR3Rh?=
 =?utf-8?B?MnBvcERKdU1GNC9lOUd6RkNBenFYZlR2UG1XUWp2QWR0aHNiQTZ5OWFPSXVB?=
 =?utf-8?B?UjE2djZXK0pLMWFSWHZ1UTJmaWd0UGkwQjNwRUZTMFpLYVN2a3NsejdXUlps?=
 =?utf-8?B?WDNWN2ZsQTNVangrQzYzRzdwZkFqR1lGNFJoOC9sUlhvbnZPQm9FcDZVcUYv?=
 =?utf-8?B?cm9JZFBWamM0YU42N05xbkxFUmVWbmIvT0JxY1B1dkpjTmc4ZUJjbHlRRmlx?=
 =?utf-8?B?RFhmOUR6V0lJKzgrZnRaUVdoTVFwUi9IQ2ZBRVdCTTNWRTdwQ1k2M0NWNTVJ?=
 =?utf-8?B?VEM2SHdkYVV6Y09JNlZKQlF1eUEzbyswVzl1aWowbWhSNm5wVGMxcFZyanpG?=
 =?utf-8?B?bUxTZE4rUUZncWptcDVwT2orMEdKRlN1dmt0TFY5aGVyYUxxbjlNKzFtRENp?=
 =?utf-8?B?cDQ4bUppUVRxSW1ZLzJvaVdNcTkzd2kwYUxhTXY2YVltNExvV3BuZldVUGRz?=
 =?utf-8?B?VEtscDhNZXJJUXg2cDF0TkV3NFBab1d6emRoVmxVMjNZT1RmNWxkVEE0TDJy?=
 =?utf-8?B?RVFjSERvM3R3VXkwSEdsdEhTd213PT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(376014)(1800799024)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:04:09.7671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e34b3e-2ef2-4a8a-8aaa-08de5cdb652b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8270
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 13:04:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230006

T24gMjMgSmFuIDIwMjYsIGF0IDAzOjI3LCBqaWFucGVuZy5jaGFuZy5jbiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8amlhbnBlbmcuY2hhbmcuY249d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gbm90aGluZyBwcm92aWRlcyBhbHNhLXV0aWxzLWFwbGF5
bWlkaSBuZWVkZWQgYnkNCj4gYWxzYS11dGlscy0xLjIuMTUuMS1yMC5jb3JlaTdfNjQgZnJvbSBv
ZS1yZXBvLg0KDQpUaGlzIHdhcyBmaXhlZCBieSAiYWxzYS11dGlsczogZml4IHBhY2thZ2luZ+KA
nSAoNGM2ZDVmOTY5OTBkMzIwMGNiYmU0NzViYjc1MGZlNzU0OTJhMjc3YSkgSSBiZWxpZXZlLg0K
DQpSb3Nz

