Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4010CC3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 09:33:34 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.86])
 by mx.groups.io with SMTP id smtpd.web10.9375.1747388012098323226
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 02:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=aoklNuq7;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=aoklNuq7;
 spf=pass (domain: arm.com, ip: 40.107.20.86, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=j+PlfvgPel9gi2duRmP9WxDtvy0gNgIHUOSZSxEpW/Q3ebFXNdsVgORzd7toKCWqpDf2yO6ljt5Gz4CTGpiD6rmQw/TzFCItnZCnGPSDTanTjhb1tRF+vvc8/kqtLLgE3oGwqgEvT483RmQ+18/fhSEYhspmfX70EOr4TWixwQeQg9Tr+ixh10LGVWK9sTdt/aNRpPjCQUzRD29rPji2VWH4QEtGh9JDGRq7B9SBOtPjBHJRbzHJlZT8OK46SBZYeyVQtRTHlw1eMj57P2FSIE1nvrsvdfNfHgfORDTo9eqdFM72artPt8geEJFv0yc1tNo0SKBXFi+ulQxpIvZeiA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6Q5z3yTPGkzXSkZWgsam5ZsQP1CJ/LiTWcAaCyluv4=;
 b=hNRHTvQTvK/3LI2GNTPO0FyT5/Jwn20XwPpmXGTGXeshyNNZ3+f9Bs6LotCq3ynulbvgdq2kqlcbfBhSs3nsNqu0Z10kp4RHATj3BDc1mvvnu/V1EYfD3sxPlWHu69i5NXGKjShkIrH4a4fucsTzv4t8dKP9+0ZBoRC078yfLzDFAv3mb5iVhSSZxZjMK/mDJe6IY/s7SfD2ytBXaex+RgQb75xvQO3Z0X23vt09bUQLvNSLBPLXZE7pNVR3D7GkRGszYXklxeirYZxWvJHXI/RY+IzfnF3y790e4OptEvA2KRXKdRjSTQyOI6C2JV3YyrJwfjTqoGvOD9machQ6Yg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6Q5z3yTPGkzXSkZWgsam5ZsQP1CJ/LiTWcAaCyluv4=;
 b=aoklNuq7MX+z97jZUWAE45IYoLda+yvmutkkLJsXcCE/9Ji/0nvyewikamaXqHfkUiaxgLREpf76ZGtlz3XgyOWS+bh5z4NEuzreZY/jpptg6Ts6I6oNiZG0skc2oL8vdGO8pYDvqOkSmm3jrLVEmFc0kPm6hsj8PzgxsKz3xN0=
Received: from DUZPR01CA0322.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::20) by DU0PR08MB7416.eurprd08.prod.outlook.com
 (2603:10a6:10:354::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 09:33:27 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::64) by DUZPR01CA0322.outlook.office365.com
 (2603:10a6:10:4ba::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Fri,
 16 May 2025 09:33:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Fri, 16 May 2025 09:33:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txgAJzMoy1BqzJcvlolLcYpRK0PcM7MA73+ojGb07ujTCeV5DC+JSlIpyeCrB9KvBd2HjL586WyTemzpBIQ60razDv7HKIHGmwHH3IOBFL0TCGyqBgQwmo5Cuus0XI65n7mi/OTt9HXH1lROIDWrZl4aAm45QuPPlUNg56nidKkI4wt5/x/MV7LCKkuPTzcRlwoISBW3u9haQTSCJeKmwSaeunVrzaMQe/iTn783b1295to6RrEROfytZygkrVMAO6gTt6/BFbYrMJWpQ0c59freoasZaQetDWEpcUNwjqAwSZZbyjwftMjhbHAdq/q6uFJVn0V/mKZgihqLasn+bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6Q5z3yTPGkzXSkZWgsam5ZsQP1CJ/LiTWcAaCyluv4=;
 b=WNhTfBeMRplGeKNJ4fB4Oretdp8jXfMKOpqC3cZ9opFs2Tex7VU+is2bQMfadVHMK8wx8AqaGCz1xGQxmTsp9ajo7t2Dg/jHOlBdwgoAdgVF1fHkgXBhuuAt5Jk8U1CNSjx88o2uSSdPLki+08DSXec0HaBf7fVKYGbf18YE8UCZcZCp/fbazNxKOK28hh3tRRS64N6FklIa4BChpTa6qw7g+ICvT+UiEw1IhcVQhlDMGb7y7P5fDf1qhcsc0vROUz3AOVyWjMKzAuNhpW8YOR61v67ZXPz7JTLDvYKoavf53c7O75rHy5gjvI/IiuE+jHEZ611v5fY7VfK3ptwMOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6Q5z3yTPGkzXSkZWgsam5ZsQP1CJ/LiTWcAaCyluv4=;
 b=aoklNuq7MX+z97jZUWAE45IYoLda+yvmutkkLJsXcCE/9Ji/0nvyewikamaXqHfkUiaxgLREpf76ZGtlz3XgyOWS+bh5z4NEuzreZY/jpptg6Ts6I6oNiZG0skc2oL8vdGO8pYDvqOkSmm3jrLVEmFc0kPm6hsj8PzgxsKz3xN0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB7852.eurprd08.prod.outlook.com (2603:10a6:150:5f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 09:32:50 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 09:32:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "liuyd.fnst@fujitsu.com" <liuyd.fnst@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] libunwind: fix multilib conflict
Thread-Topic: [OE-core] [PATCH v2] libunwind: fix multilib conflict
Thread-Index: AQHbxkQrKc+nnFQnWkSURVNCjGsT3LPU/mWA
Date: Fri, 16 May 2025 09:32:50 +0000
Message-ID: <5625AB89-3201-47B0-B698-9039CE2BC553@arm.com>
References: <20250516092238.1182-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20250516092238.1182-1-liuyd.fnst@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB7852:EE_|DU2PEPF00028D0C:EE_|DU0PR08MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: be8c4a00-7f0a-4be0-2b06-08dd945cb546
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?MVYwaTZHb2p4SWdyMFM4YjFEOWkwSXpVTFNnSHVwUHE1dXF6ZkxBVm9kSVly?=
 =?utf-8?B?SmFia2tTbk1BYjhUNGFVWEZpaGcrNnlROWZKSkdObnRIM0ljTEJRVG4yaG5t?=
 =?utf-8?B?dm8wUzRJZnlBdkVMU3dkZS9wY1RwbnZJdTVtUHN6cmx0R0w2b2tVUDRSeWtN?=
 =?utf-8?B?R0RxWm1Wc0dwcG5sMGMwV2s2KzhvLzU3UTN5T2prSGhiWER0dUxlaWJVQjJJ?=
 =?utf-8?B?YXZsTUJyL1Q4QjMxc0k4TzA2aFY0T0k2THYyODdVendvaGNZSjYzdnppT1lR?=
 =?utf-8?B?U0MvUW5nRzByVXUwQUVwSS9YRzlPejd4SnhCWmNid2ZBdXJyWGR5TjVlL2xI?=
 =?utf-8?B?Z1kyOHFXekZNUlVYTXZNTURDU2pzbk9rVVJnWFBneEF5TXlVQnorZWpnWGIy?=
 =?utf-8?B?bDhkVlNVMDBHVHpQMzhKNHVQL01HUjNPR2FQRlB5YS9GSnB0TkFURlZDUGFu?=
 =?utf-8?B?bEpldzFDZE5FbzZSMEp6c2J0ak1ObXd3aGxLYlBSTzV5cXJaTkFtZmJZZGU5?=
 =?utf-8?B?NVpWblZYOVBiUnNEUU82OTE0OGEyUzBjTmRrZjhWbXRUR3RGRW5VWkRhV2p6?=
 =?utf-8?B?T3RvWnNkV1pSWXlSZG1NVG4rT3MyanREcE9sZnU5NTNTdDRvNCtPOVBIWWZP?=
 =?utf-8?B?bXZQZGRsSXdheGk2dlVaZlY2cWY0N0x5ZDhKUElkTXdJZXhpV3hSVkg2VU9T?=
 =?utf-8?B?bFFLSWtPU1BMZFVnWVN2dndvOHM2ZGhqOVFKWDJDUG9nVVZoN29qRnVIb1Q5?=
 =?utf-8?B?M25PZTEyOGUzc3Y1dnhSMEpPMnVIZXA0YWt0T2szQTF6SnVLcmpJenJteGpF?=
 =?utf-8?B?Zy9tNnc4ZFBnSEpWRDNKc2ZSa21seWFkaFdrWDlJMmRUOHZORFRhdjN5OGEz?=
 =?utf-8?B?UGtIcEtaOGtoK0xnS0ttSEpHSkhGUmdFSEFuZEc2NDZXeS9pODl6WjJ4UEtp?=
 =?utf-8?B?dTFnVlkyWG4ra3pRZkl6bVBlQjBpdFZYZVpWVGRoN2hobHByOGM1bXp0dTVY?=
 =?utf-8?B?Q3ZQK2JNa0dCdUFPc2ZHZjAvc3R6UzNPMm91djVmWkF1dHljdGNOcVpJbGp4?=
 =?utf-8?B?MEQ2RmxvNDJuazVINnFtcXJycGlkN3N3QlZNNXIwempOekRoaXByeGJ5QlI5?=
 =?utf-8?B?UXBCVzNHOEtuTitrQTZYTFpmN1Q5MSs3NTRwNEtPenBHRlFBSjhEQzhUbG83?=
 =?utf-8?B?ZFE4SU1zL2ttL3A4aE1aNkxiSm05WlZ1Q2dGclp3QmluS1JnZmtCck44TnNx?=
 =?utf-8?B?d3RIN2VaeHdKMDZNQkJ4Qlo0aS9RY2NjSFpINy9UWVFncklVNHprM2Z2cW1p?=
 =?utf-8?B?YldzN1N2TlRqOCtocytiams0ZDRwZ0pXb1V3RWVyNEFwUCtIVjMwdERFOUNn?=
 =?utf-8?B?VVdoaFNVZTBZa1AzWktuWWZlK2ptSVU4UFo0dTFHS2k0d3FvanBvWHZ5bUhX?=
 =?utf-8?B?cHFYeG52dUpjb2I5Mlp0SmNnenRxcFU1YlV1SkpWY0Q1bzJ0KzFyZ1I3OUlG?=
 =?utf-8?B?OGdoRndPNEhhT0VFd1lXMEkxQldRREJoaVFFeFA4VVkxbEVPelJyREJjeENR?=
 =?utf-8?B?ZUM1VXFMTTJKenBsWmoyL2s0a3AzbWxrVjByOXAxTFpZakFLOHE5T1pPY1BR?=
 =?utf-8?B?cy9nR0QyUmFRWm95ODI1RXdJa09wNGdETFVvTWJ0c05PWDVDMm5rZGlJNGlQ?=
 =?utf-8?B?ZDVJNDBRdmQ4S1hIaC94bUV3ejRSV0RxQ3UvVjNjSzBlS3Zma2g1U0ZiY1hV?=
 =?utf-8?B?L0hVUXFVS3hmdWthTDdtaDJETVpJUUdrS3dmMW4zY3FXb2ZrQWlPa3pFNDRL?=
 =?utf-8?B?UGM0UzRkQmxNN0p4RXdMb2hzajVaRkFkeGk4OEx6RXZuZFZMZURMai9EQS9M?=
 =?utf-8?B?azFwcFN1YW1LaUxrUi85Y291WGRjR2xnRGlKbjF6aGhmVVdycVI1aE1WcG5D?=
 =?utf-8?B?d3QramFKQWNxUFBtclN2Q2h6OG1jZlRrcldILzdJSGF1QS9uSDJZeGdKUzJi?=
 =?utf-8?B?dFVjb1g1U1pBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <78D78EB90F447C49A0EC9159D8FE9F5D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7852
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3d92520f-e7da-4dc4-7ffa-08dd945ca02e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|14060799003|36860700013|376014|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eU5yR1ZKb3hJd2ZTL0tPTEFkNGxML0MxTlJhQUJvbzFubnJMWTVyMXhmd05o?=
 =?utf-8?B?K0N2Vzh6RG54Qy9IU0lWQkZmcUJab09wcTJDZ00xcXhHUVJSRHdMcHhvYXFY?=
 =?utf-8?B?c2Iramp1MVhNT1M0VlhGQkhWczg5KytabERBWENTL0JILzRxMFZYOGtPSzg4?=
 =?utf-8?B?b0MxZEZkejgvWXE2bHA1UGhGT2dHR3JqQWNSSWw2cTc0ak9NeUlmbFhQeFRE?=
 =?utf-8?B?SmpqV1o0ak9JT1hyOTU2Vnd6Sk83Yk1WUnJXb016ODdnbUFRVzY4M29obC9C?=
 =?utf-8?B?Vk1mSDRzZHR4VCs3UDBmWjJ6SVVNcFJwSDNGTFZVUXZ2bTIvSmpEeEhsaVJi?=
 =?utf-8?B?eEFQcUY1WU5KTXNpcU9LL3A1M01jYVNYanJTaG8wSmRtOTUwZ1psaXJwVDlS?=
 =?utf-8?B?VGY1RWxzQm9tSHJnbFdGMzN4ZXM2VTFIRjk5aXdYb2NwMk85M0J3NUwwYkVo?=
 =?utf-8?B?YU5vOCsyQnlLbUJ0eUhqSlQvbEc3UitOK2g3VlI3U1d4azdDK0dHS09pcGNo?=
 =?utf-8?B?S2psVHArd1BydTRUMW1LWFp4YWlTTXh0c0hHUjVJWVFTT2E1WWVVbzdPWTJL?=
 =?utf-8?B?bE0xL1lYUVdQaDN3VWdaZFA1ZGxObVpoTUJQczQzTjllbVkzcHU3c3grK3ll?=
 =?utf-8?B?MzgrWHFmQXp3TDA0WUhNOTFaYWV3aWpDcnBLVzd6b05OQ0ZaM3pxbktJeWM2?=
 =?utf-8?B?TFlPY0QrZU41MkUvRVhZRnJ2Q1pHTEZ2ZjZIZUlURnlkTWc4WHYrRXk1dFBX?=
 =?utf-8?B?MnBGYkpIUjRYQXlUTWZISElydW1jdGFyZUV2TXhvZXdUWjBZakd4eDgvRFc3?=
 =?utf-8?B?dUNnWlRWRTNyczQxTVpldVhHZTZXRXJDMVFMYThYWktJbXMwaGV5N0w5d1U2?=
 =?utf-8?B?eDIrREZJYUZlTGE2Z1liNU1Zb2dlYlVsZkpNeHlrWUlVTHdGMDQzMDdXMWNY?=
 =?utf-8?B?Umo4UkF6ZkxJcG5RUnFYa3A2cTZ3aXVLT1U2WDdTQWExYkh3UFRCWm1kb2RG?=
 =?utf-8?B?MDlDVTVWTUJ6QkVwUlNWU2ZKa0pDa3ZuRGZKc2pYQXYxME1hdGJGd2s2dDBz?=
 =?utf-8?B?ZmpWcGtkOFRsZUVMbXlYNE5hQ1hkRnAvVUU4YTFZNnJhczVzWlRRN2tIemJy?=
 =?utf-8?B?Sm93NzNlWU5kNGF0ZjY3WkdCa015WUZnU2dmSWhMaXFoQTFHN1VTUElFT0dS?=
 =?utf-8?B?ZmhJSFZFQVJRYkg0VkorQVFTSVdMRG1nYUN2UWJtTm1KaGV1MmZpVFlIRFNC?=
 =?utf-8?B?RXExM3ZMc1FoQWl1Y0dnNkMxUVhOT09yKzB3MkRtUE5haWN4QWxmWG9kK2gv?=
 =?utf-8?B?TVpNTFpZdmYyM2JHZWVRRG9yMFViWnRna1ZLRnVxWXBwYmU1bHNmdjdBNUww?=
 =?utf-8?B?aU0xOXBBYTFmQy9NcWFNVEV1czhBWHJGY2xRVklYRFdYUHlUZld5M3BLV01Q?=
 =?utf-8?B?bzZZa1BpZElBR3pnUDZDRm4zL0Jwa016SG1XWk8rMS8zVmp5ZVpCL1RpQlJJ?=
 =?utf-8?B?QVduU3FTamd5R1BDMFVjVmRHTzhHalAvLytjNjBTazU5V2RWU0hSeHRKdzZS?=
 =?utf-8?B?RXZQTmlGN2R0R05KZk1GeXlhd1daZHZJVWZiMTZiWFJPUDNmcndiVUVCYjFm?=
 =?utf-8?B?REI5VVQzK1pGaE1zQUEzaDdtS1d0QUlnYVF0d0FCTUI2YjFHTENJUWRZSWFx?=
 =?utf-8?B?Z2NBcCtvd0taWU1kcWhnNC9XZldMSW01WU1XUUNVZ1Zqakd0cVJLSnFxbGdE?=
 =?utf-8?B?cnhXc2wyRm45QVhZeG5zMndzS0xvcjU3OGdWVUJUU3h3UTNGRkxEZnRTKy9N?=
 =?utf-8?B?Um1ySWtYNzk4bkxUQ1ZKNEp5dHhMQVhlcHpOZmRuNXEwLzJZTVYrdTcwTGVq?=
 =?utf-8?B?MVVZTWhjN25rb3RCd3FwOXhVY3M0dlJ2ZjZXSmFBVXpwK0U1VWRvWVFGQ0Qz?=
 =?utf-8?B?bWpTT1hOeVVtYkY1c211U3RwMkdlKzdsWWVacEY4eXprSzV1VzFlUE1NYkdj?=
 =?utf-8?B?dCtmQWdPSlFGcVczQWx6Y2ptRTJpeDYwZ1Y2N1l4cGN1Z3dHZ2NxaDcxRkx0?=
 =?utf-8?Q?xrBJnV?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(36860700013)(376014)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 09:33:25.5188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be8c4a00-7f0a-4be0-2b06-08dd945cb546
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7416
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 09:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216733

T24gMTYgTWF5IDIwMjUsIGF0IDEwOjIyLCBZaWRpbmcgTGl1IChGdWppdHN1KSB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyA8bGl1eWQuZm5zdD1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiB3cm90ZToNCj4gDQo+IGZpeCBpc3N1ZSB0aGF0DQo+IHwgRXJyb3I6IFRyYW5zYWN0
aW9uIHRlc3QgZXJyb3I6DQo+IHwgICBmaWxlIC91c3IvbGliZXhlYy9saWJ1bndpbmQvY2hlY2st
bmFtZXNwYWNlLnNoIGNvbmZsaWN0cyBiZXR3ZWVuIGF0dGVtcHRlZCBpbnN0YWxscyBvZiBsaWJ1
bndpbmQtMS44LjEtcjAuY29yZTJfNjQgYW5kIGxpYjMyLWxpYnVud2luZC0xLjguMS1yMC5jb3Jl
Ml8zMg0KPiB8ICAgZmlsZSAvdXNyL2xpYmV4ZWMvbGlidW53aW5kL3Rlc3QtcnVubmVyIGNvbmZs
aWN0cyBiZXR3ZWVuIGF0dGVtcHRlZCBpbnN0YWxscyBvZiBsaWJ1bndpbmQtMS44LjEtcjAuY29y
ZTJfNjQgYW5kIGxpYjMyLWxpYnVud2luZC0xLjguMS1yMC5jb3JlMl8zMg0KDQpUaGUgY2x1ZSBp
cyBpbiB0aGUgbmFtZXM6IHRoZXNlIGFyZSB0ZXN0IGJpbmFyaWVzIHRoYXQgc2hvdWxkIGJlIGlu
IGxpYnVud2luZC1wdGVzdC4gICBQbGVhc2UgZG9u4oCZdCBpbW1lZGlhdGVseSByZWFjaCBmb3Ig
bXVsdGlsaWJfc2NyaXB0IHdoZW4gdGhhdCBpcyBhY3R1YWxseSBhIGxhc3QgcmVzb3J0Lg0KDQpS
b3Nz

