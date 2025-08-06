Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD338C87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 10:50:51 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.50])
 by mx.groups.io with SMTP id smtpd.web10.22268.1754477449390163502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 03:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=D9ZBgGPV;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=D9ZBgGPV;
 spf=pass (domain: arm.com, ip: 52.101.66.50, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=izyx5h86gZJRjc4dqaRq27VSeDc58vl7xS5CZlx4UQwzf6fEibx83Zgn50156c4s6WvTs/7a/B/IkjQ8gN9Vq9E/YtfixDmlKE3d2GjQbNZCEdaSHth4C0b935TMvcA0t40MU81JlsLtknF+r+ict5Qy+G8rT4rKloceTpLRnVHhCc60+9w8XbatCSq+GaU3ySYFcYfM/HUXpEUpwPqhgVp6QKX2eAdAVC+yD1zW4/Vcs3egzEri45WMcs2Yinaker5W0oqubVneYKlU53845p/ImiePvvLwUT1QBx7GhDHWbu510JnC6ogW1tU4W5va4ccan7DkrV8yZhU2hOQsAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbDCp24GO4XVCyny4hUioOmOii9X1+6xqVm3nm1hFj4=;
 b=EzhoYtJ4qSPjcK78DHg9f/koQbh2yLpIdA/o1M8RhmYIC740Vx4whwljDeq7dmv1OLHAYTJcTAg2AgST40MQE3rt4/y0BJCz4v0LLXc5WJmP7FisAVFeB4nKkiILTDk6p+CkcfG7z4xbWxTe8EQ+9o6NCzOglcGY/kQOkq0nzHlcOR76SAIvmqSHEOyOzcDzBg8fQVUBthNkXeiDY/BzJ4DgUkdatIspnWaxoGc1QB7Pf+8nvKa2DurcRaSKrUqSZK2ECaiFC0nTTevDCit7x3J/a7n3zaMUyw93ylqCDY4V13SzqgO2ps7GEVCeQ7+7XcP8RRfasdXeWMGmjvuJbQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=0leil.net smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbDCp24GO4XVCyny4hUioOmOii9X1+6xqVm3nm1hFj4=;
 b=D9ZBgGPVIr2nd9pmkVA7iRvSAQ1MJQbF3WfMcbdS+Sm5P8XtYHHCJoSvuuNbDglIY4CHEd6FSeiUuxCnmDOU89E6aEbgiz8ZE6oLWPco3ffbgI/yEodagYv1VOAKkYw74IGYjAWtl46C1yzpFClmt/FJi5ujkKH6t7lCVkk9mxw=
Received: from DUZPR01CA0025.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::13) by PAXPR08MB6622.eurprd08.prod.outlook.com
 (2603:10a6:102:153::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Wed, 6 Aug
 2025 10:50:44 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::83) by DUZPR01CA0025.outlook.office365.com
 (2603:10a6:10:46b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Wed,
 6 Aug 2025 10:50:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Wed, 6 Aug 2025 10:50:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSTAi2SWIfvKjRCKdLIAnyr0N+QvFfxgJOFkFyOnEL/rMrwQKzeheNOt3Pd4fQq5wBr1vCbC3LzdcWlsfAjJZ1mYk1Y97MkYgag/bX6qcWsRpi0IkhbqD7CyzjgYEk+plhzShH9nC+q8Q6Hreb2zJv+hTFeNf4v9dn2jnNio5gyVHOARXdbxtDVcjwI4talulMMkX46wrRi6K+wueviGXdixZWv9VeAyCaQ2Zwi8GyPrkf/c7rZXfg3wgwgT/PHqILl6EETyTEgJ11I582pePXACaI3O09UPPIeXUmfyR5maMWyOyFY8kG25ujxOcueGEC4UUaASFVlf7DUBIsgBHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbDCp24GO4XVCyny4hUioOmOii9X1+6xqVm3nm1hFj4=;
 b=mJlG0rmWkaQlFspJDM/ZpTtfcwBhVXfYaATzYqV3BAcLiPf4KIrmIGMZLSRMXgnsHdwE2nvnM+GeSRIRKgW4kymQDGP+BLeVQ+V1T78zeKXD7duwzfornPEaOnWUAG0ZMCQJ0aobUW4cOfpG/XTGAAI2aEf96g8ueXR/hm7fyTGLu58FgF+yp/2uLbRdWlacdwrOKiWEty7Dx3aghWUm2FZ4/cnfpT4maKxPqMZpXAfqoNJWkDSd9pAO4xXjv4zbcPv8XhIB/7gcOtBmUxieJsyFnfLlH4gHahp7Pz4TT6jCMUsf+DG8z5zMv4JegZkXEK1zhXn1oXD6C2kouJY+0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbDCp24GO4XVCyny4hUioOmOii9X1+6xqVm3nm1hFj4=;
 b=D9ZBgGPVIr2nd9pmkVA7iRvSAQ1MJQbF3WfMcbdS+Sm5P8XtYHHCJoSvuuNbDglIY4CHEd6FSeiUuxCnmDOU89E6aEbgiz8ZE6oLWPco3ffbgI/yEodagYv1VOAKkYw74IGYjAWtl46C1yzpFClmt/FJi5ujkKH6t7lCVkk9mxw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7566.eurprd08.prod.outlook.com (2603:10a6:10:31e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 10:50:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 10:50:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Quentin Schulz <foss+yocto@0leil.net>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC v4 3/9] mesa: move PROVIDES out of include file
Thread-Topic: [PATCH RFC v4 3/9] mesa: move PROVIDES out of include file
Thread-Index: AQHcAtQB5yEsZRq0N0mPpA0TqONtC7RVeg+A
Date: Wed, 6 Aug 2025 10:50:11 +0000
Message-ID: <2028623D-6052-4893-80C7-17F7FE1AB92F@arm.com>
References: <20250801-mesa-libclc-panfrost-v4-0-101c6dcf564f@cherry.de>
 <20250801-mesa-libclc-panfrost-v4-3-101c6dcf564f@cherry.de>
In-Reply-To: <20250801-mesa-libclc-panfrost-v4-3-101c6dcf564f@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7566:EE_|DB1PEPF000509F5:EE_|PAXPR08MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: b772e420-c1b5-49a8-3cb8-08ddd4d71800
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bnpHa1RVOGt3SjNyWFF0dGJQS0FKbzY2bC9sS2huelNNbklMcTVPdFJ4b1NH?=
 =?utf-8?B?TnVFWE1uWFJLZFBnTVhDbkxXM2E2WXdBWFdzUytkMm5hbzBDOE1md2tiNFFR?=
 =?utf-8?B?MnlWR0tmTVI4L3pvUTZGbUVjdlprS3lVMzNwV0MwM1RKM2JaY0RQbGozWXAz?=
 =?utf-8?B?MTVSZmgvd1p5alA0T2hjRG5aaTJSMDg3c2dyc1Ywa09FZzRkSGtvQ1dvYjJi?=
 =?utf-8?B?b3g1VU9WeUlrNXp3TVJOcnlxZnRhTTRJei85NDhENExLM1ZwTTkwZHN2Wnlw?=
 =?utf-8?B?ZThOaVNzbkZaOXVJTWlJUE16aEtJSThDQVVwdVZkYVNQN0xLai8wUytmalFq?=
 =?utf-8?B?bVRGS091aHhZd3FxT21VWHE1TGJZMHk4WmhOU2ZXbFBrbnA1dng4L25BZ2FR?=
 =?utf-8?B?dHlLeXBLVW5Udm9mTVNkRXRsTXpjS0EyYXYySVR5SG1qdTk3enRWNGptbXY3?=
 =?utf-8?B?RUV3dkpiVHZ5TUEzUktGeS91TngyVjY1QjFjSitqdWVsL2twMDNUZzF0S0pQ?=
 =?utf-8?B?VDZhcTBORThRd3BOK0VkYjRhQW5mZ01STmI0dGY2ck43REtEeHFxcVp5RWJF?=
 =?utf-8?B?QXNWeWVNbjkySTF1RjN3T1RqVUxvakwyN0hraUVoNFB4MnQ2SXFzbEVyQ2xm?=
 =?utf-8?B?VFhiMVNoL2FETmQxSlgwLzFBUm93M3ZnSjRDVC9BWHZLU1c4N2RtZDBvcEwz?=
 =?utf-8?B?RVNnM0dld1dwUnJWVDlOM1hBaHIyVnJHQ3hFQlRleDBwbE1SNVNOSTNnM0hj?=
 =?utf-8?B?WFNLd0RKMDdhRlo0Mm9Heis5NFpFeVI0STNlaUFFQTJXQXgvS0RGditlQy9C?=
 =?utf-8?B?cUZyRjVaU3NzbXNCdlpqNkZhRFRNMjRFZXBWQTR0RHBCa1JJNnp0a1c4QXBP?=
 =?utf-8?B?Z01iaU5tQUY2SGxxNHdnbHUrZW1yVjlBbjR5eExNc3RwTnVGUkF4aDdzSkFQ?=
 =?utf-8?B?S0RtRGdIZmlwVG53RU9KVHlqdWlGZHdNRjVMVWNzWUw3eDRaa3RiZzlRZHhM?=
 =?utf-8?B?OEdrZnQxc3ZXYzRHeXlrUFM1ZGxYTHh2U3RXSXJiVitTTExPM0FxTTlwb2tV?=
 =?utf-8?B?ZGcrV2JXL0QzZHU5MkNNVDlYVzJabERjRnUvUGFoR2pIVysySTc0emxyU1Ev?=
 =?utf-8?B?K2YxTE0zSElKYk1kQUpFWFVRVG8xQmV5NWNHaVN0Q2UzYU5CZXQ5dTVGcWNR?=
 =?utf-8?B?czYrR3ZKVUJFQmkwaFoyWjZWMHZKRXVnN1NSemJjTktOdXBtUUJlcHRzV1dx?=
 =?utf-8?B?SXFDMndYOU85aGRIaGpNNHJYRmt6amkwUmozSFNCcDNSS1VNR0E0ai9uMEta?=
 =?utf-8?B?eEpaaW9iKzcrMlpYMWVYTFZCRVgydTNSaHNNcFNhVTNOb1ZkUGNnZDVpREN2?=
 =?utf-8?B?UkhZVzVsSXc0cnB3ZDRZclJtVXFEeWVmSHpQUEQrSVJOeTUyem0xY01aLzRs?=
 =?utf-8?B?UDluS21kZ2NtL0tEa3JINk13UTMzOWJsVGZkaElPUjltbHQycExibmZzcHR3?=
 =?utf-8?B?MDhoSFM5eVhoQWs0NHJpM1Ryakt2K0xpdnE3RU5wb1pxZURsSjZ3Tk1BbHNx?=
 =?utf-8?B?ay9zSXlTYTJyeG1RaFA5RmpZQkNUL0x2RXBKU1FjTDhvcUFjR0FGRktSMTFJ?=
 =?utf-8?B?MW9ubFo3YkxqU1U3OElkOENkcDhvV3AvWnp6M3hHakJKUDBwYUZQem51aXVq?=
 =?utf-8?B?L0ZITlJsS3FVZnZhUVpvV1F6R1JXbjMwcWQ5TkpuOHIwaGJTSGtTTW4vTk1t?=
 =?utf-8?B?STZLSm9jNUM5cFJ1TzBibFgwWXJKNzM3aVNWbE5FeE0wTFNNTTB1RnBUSVVu?=
 =?utf-8?B?TDMzdTJXamJUVGlUTEtOWXR2b0wvMDg1T0VzcHBYRzRGU3BDRXJua1JZTUdr?=
 =?utf-8?B?Z2tKTjJGQ2pSRFZOUGtZMVVjVWkzMzM3RktWSGhJYTMwM2l6Z0FXMkxGaGhD?=
 =?utf-8?B?Mk5Xazc2SG05L1pkQm05R29YcDJJNDF0eUI2WEd4R05ZamdFZGNxeCtXbkwv?=
 =?utf-8?B?TkQvSEZEMjNRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BED6B96C2E7B9148915A4A57ADA2430C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7566
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3c7ae42f-5a21-45ea-0c9d-08ddd4d704be
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|14060799003|376014|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RkIyeWhaQ2JpRXBZZk5xM3MxSE5pcWZBaTRtdTlnNWgvbXdCMzhUUXhOWUZX?=
 =?utf-8?B?YlFTeEZuOEpJZDJHc2g4M3FmSHpPN2crMDA3ZXVMc0Nhb0tUVXRmQnRpZnpG?=
 =?utf-8?B?dU1zUWdERXJLSmh6ZUdZdkhMVjBVYjNUeU1ITnUwTndDK2RxNHl2T3p6SWVl?=
 =?utf-8?B?MklSWGNjbzJIbFJ4RUV5RHRwbzdDSThmaUFud3dMTkdoTVJ2eURGWmI0NzdM?=
 =?utf-8?B?REFLNDZVcUtQcTJ2eEdMMmUzSVBiVWczcCs1VFJDcXF0aG9aT2N1em1ZN1Vq?=
 =?utf-8?B?NktSV3ZTVUc4S0NPbmp3VlpLaGx6dGtBUDRVUFJkNWFkRnJkQjNjTU9MVHlB?=
 =?utf-8?B?RSsxTUhvWmV6cDIrSktsZ3lLN3lROHVJOGx2RDZLVmgwS3U5MkFyelAxeHgx?=
 =?utf-8?B?ZFBtcVQ0OGpuYUVHZ05pVmRIa2dxeEdVMkp4N1ZzOUsrUEswZHJNZDJTaGh1?=
 =?utf-8?B?WVlMbjQwbkNNeXg4dndwYTBTTnRoWEJ0Ykg5aVNraGNYV2ZzRnYxaG56TVNp?=
 =?utf-8?B?WERyRTk0ci9QUWN6MzhkK1ZwWVVlYTlFZXdnSUtQcEM1MVZjcmc5YVNZbTV3?=
 =?utf-8?B?OVRyN21NaWlEbFNEcHp0cnNVYXh6T3BEWUFoeDMwV2x2SUtKN2Y3MXNHcHpS?=
 =?utf-8?B?amQ1K2FWRng1Nk9MdkFZTlhvdUdDK2FKREkrQThiV3NYRmxiQmVWTkcvc3JC?=
 =?utf-8?B?U2JOUXl3U1RDU2FyNnd6ZWVUM1kxSWRJYm9TeUJLaklnc0sxZ3ltZENwRjZG?=
 =?utf-8?B?Q0ZBSGJ3QU5wM2VBSTJkVTVBaWhycHpzclp2c3RadHJsWWhVVGRDVmdmZURu?=
 =?utf-8?B?ODhlS0lBVjJ5TzZpZGdHSkxZUU4ydVdLSWFCQXZPSjU1VTFINnRQM2F3S1ZM?=
 =?utf-8?B?K0pQTmNSa0o5SGNjK3pBdThiNExISHBheDFSb2RrZE9mbVhQRFNDNkZYREdJ?=
 =?utf-8?B?eG1BMmh3Mlo4cTFFTzJDUllzTVNna0FWK3pKck5GeW5pUjgwcnc3VFlIdE1t?=
 =?utf-8?B?M3B5UmR6SzNwL3QrdUdWTWR4bmpKczZZcjJUL1ppUzJkdUZ5K0g0aWlRV1JW?=
 =?utf-8?B?RjdKVnpoZnJKcERscDlpNHBRaDN0VDY5cFFWV3kzb0VVbmZ4cXI1cjNQRkVi?=
 =?utf-8?B?TU1MdzczeXNNOWMyOXZ3ZmRPVnA0MjNOaGFKTVhOUUc1am0wMFd3L3hobkVT?=
 =?utf-8?B?NzlhazdpMWw4VCtFUTBKc2xJWUNmS1FKVjBWZXlTVFpKZTBlcmZMYzJXVFBH?=
 =?utf-8?B?NncwQTlIK01CVHVYd0k1c3RCdTIrNUcyZElzREswdU8zQjVaU1dSNVh0djlr?=
 =?utf-8?B?U0FqMmh4alR2RHJFQnhKTm1tZyszL3YvRndvK3BpckgzL3pYSkV3OVRiQkVx?=
 =?utf-8?B?b092bUlERTBUWVRMYitMR3krcy82ZW1jRjlSOEd3UDlicmRWeVA2c0VNdk9i?=
 =?utf-8?B?cWluWHNoV2RMT1lPYTVLdTFEZUdiQmlqUG5vZEdqRTVaeXd5VVVjNUh1OGxV?=
 =?utf-8?B?OUNGV1lSVE8xdWtXaldoVFFlRU5XdzBGd1lndGxSa2VrRUp5Zmltd25nYkRh?=
 =?utf-8?B?aUVXcmFPc0RPczloVXBPeTZxbDliUUxqRHB3UVNHMExmcmVSeVhCR1FEUFhB?=
 =?utf-8?B?UG0yYzV4MjZqUENlRURCdVdEZS8yTjd4dEZrTmNDdCtWWldlakNlaXNyTGJQ?=
 =?utf-8?B?anArVFlrWGcvREw1b3FHa3kzUGtJM0pPZkc2YktSMXFwUDFweUhCVUVMdDJ0?=
 =?utf-8?B?QWFjSGRvRy80RzN2TjdudGxCM0tPaVk4aVprOXdwVm5LSlo2Wm50cFRPMUt1?=
 =?utf-8?B?L1J4S01na2UvVTZHS1BweFdZaTFxa0JqYnJXWDF4RVovdG1SL1l0Y01XekpN?=
 =?utf-8?B?RE05YVJxTjNzRkgxa3M4Zm1NM3gzMlR2a2NpKzJvcnZWU3RtZDRnbE9WZzRU?=
 =?utf-8?B?ZmJCbThacDNOQTZmaDlpQ2JmYVV4NEhmZGlUb1M5anFzdFUwUWRDSWpYVzJ3?=
 =?utf-8?B?N09wRVhtZWZqUmpHMkR2ZU4rT0tQQlJlc0dHbmRJd2NpSUhZWXFwR0FSN3JP?=
 =?utf-8?Q?R8bbGz?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(14060799003)(376014)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 10:50:44.1730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b772e420-c1b5-49a8-3cb8-08ddd4d71800
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6622
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 10:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221532

DQoNCj4gT24gMSBBdWcgMjAyNSwgYXQgMTI6MDMsIFF1ZW50aW4gU2NodWx6IDxmb3NzK3lvY3Rv
QDBsZWlsLm5ldD4gd3JvdGU6DQo+IA0KPiBGcm9tOiBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5z
Y2h1bHpAY2hlcnJ5LmRlPg0KPiANCj4gVGhlcmUgY3VycmVudGx5IGFyZSB0d28gcmVjaXBlcyBp
bmNsdWRpbmcgbWVzYS5pbmMsIG1lc2EtZ2wgYW5kIG1lc2EuDQo+IFRoZSBmb3JtZXIgb3ZlcnJp
ZGVzIFBST1ZJREVTIGFuZCB0aGUgbGF0dGVyIGp1c3QgaW5oZXJpdHMgaXQgZnJvbQ0KPiBtZXNh
LmluYy4NCj4gTGV0J3MganVzdCBtb3ZlIFBST1ZJREVTIHRvIHdoZXJlIGl0IG1ha2VzIHNlbnNl
IHRoZSBtZXNhIHJlY2lwZS4NCj4gDQo+IE5vIGludGVuZGVkIGNoYW5nZSBpbiBiZWhhdmlvci4N
Cg0KRG9lc27igJl0IHRoaXMgcmVtb3ZlIHRoZSBwcm92aWRlcyBmcm9tIG1lc2EtZ2w/DQoNClJv
c3M=

