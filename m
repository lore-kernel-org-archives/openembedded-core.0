Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4DCC36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 08:55:29 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.107])
 by mx.groups.io with SMTP id smtpd.web11.21023.1744361719171981509
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 01:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=OaVo8J8j;
 spf=pass (domain: topic.nl, ip: 40.107.130.107, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zv9QvcUkCdUC0Ox/H9aSz9VxTElwlr85rRk9reYPvQd5MK2LySbld8BQ39ynD1MlqGpqqWNje0jEuuvf9wDm8QEej6TSY0EstNDILi0O6YoH5PVFinjoigrV6blLPA3PHvZCirnTc/EAquEItDgIShr1fxd8vZzlzJ+zAsJwUT9f9BtQaep/HeVJHFLebCV3A5TvhrrTcHLj3c92wLp0DIScvEjjp3w9UsgdQtVT5pjvz86En7Ec150WMr36wi9oic6RJh/VcynxQrLEiKKhEW5Rh+xM4pLDJbF3sTRnvYwYfFJvZLDhaei7xtIi9R9GFmm7qK0YiA/g6ZSPH/clwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CaVsDZvvNDjhEDOGVvLFaSx8/PJy83eYUJ/s98Vi+lM=;
 b=mnqJ3DB9qnDKiyGsQADuMI2keIXK5vAXDoZyadX/lsXM0S+a4JtMgepz0qEpBTJEXHKwdPAlcha43LeOXeWMi652iRO7v5tyMnF/ycL+M9QthT2gXfYquH47yZbcCuaeT/WmLNxOmuR0bdOE5t+ug1G+LzqvILc+q3icXb15u4EvnDMcJBFv9nEMAIhsoT+o9aH9X6e8ZAHANmnBXha0M8Ks/wnv/9D9PrkHVK49hNyIE+EqqZQmaIGiL9fncm084uu2Gv4b2B35v+Vvuix/sl4p/O9Ej0iS+JpCRsLAIHaVzdFAodiZSW+2Rhslo4XZGmld/kbbfxAZdbGG7Fgqzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=topic.nl;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaVsDZvvNDjhEDOGVvLFaSx8/PJy83eYUJ/s98Vi+lM=;
 b=OaVo8J8jfMWQIhyjSgwfpq8pVBG4uPUVINvZlD41uVx0FN81i+lxWpLS13U74UJ/oB3he6iGbR0DgFy+qK16+p2OQXNhLp7zPGsHCj6R6MFqx1IUxZyIYY6+dCWYbD3+w4kAh4PZ4HG4ovI9IKaDgU3S9r8UBU3FXk2bKe01UJZqSA1Lv0ghreZ+0h7xTjm+EZN5lO9kj1xAS+gYITpR1PyhPtCeuJLrm1h2WBhAOm48J+4Df2yq6sMRRB/e7KfDb5nenVuevpjW+c5LE4y85CZ/SjCQ7UiF9nVhMq2jxBp1l0Fd09q8fQYE4jsZOdnfpqaj8KEggqcQ/RqpL9aHlg==
Received: from AS4PR10CA0022.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::6)
 by DBAPR04MB7464.eurprd04.prod.outlook.com (2603:10a6:10:1a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 08:55:15 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::bd) by AS4PR10CA0022.outlook.office365.com
 (2603:10a6:20b:5d8::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 08:55:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.13 via Frontend Transport; Fri, 11 Apr 2025 08:55:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.174) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 11 Apr 2025 08:55:14 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by PA1PR04MB10697.eurprd04.prod.outlook.com (2603:10a6:102:482::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Fri, 11 Apr
 2025 08:55:12 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%5]) with mapi id 15.20.8632.024; Fri, 11 Apr 2025
 08:55:11 +0000
Message-ID: <73578c4c-6107-4fac-ab34-9f065db39d81@topic.nl>
Date: Fri, 11 Apr 2025 10:55:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] python3: Allow to specify which pyc files to keep
To: openembedded-core@lists.openembedded.org
References: <CANNYZj9r9D7PzkGm-5tPQVTyU_MkyQngS+RbZii6+4YToGNLVg@mail.gmail.com>
 <31851.1744290321098835072@lists.openembedded.org>
 <CANNYZj8JQf8tzC2g7k__TM0B967-szdV=4gt_-tBcNjXL65mXw@mail.gmail.com>
Content-Language: nl, en-US
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
In-Reply-To: <CANNYZj8JQf8tzC2g7k__TM0B967-szdV=4gt_-tBcNjXL65mXw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P250CA0009.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::10) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR04MB8644:EE_|PA1PR04MB10697:EE_|AMS1EPF00000045:EE_|DBAPR04MB7464:EE_
X-MS-Office365-Filtering-Correlation-Id: 66a3e7ee-f15e-4c49-a68e-08dd78d69354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZjlUek1sOHp4QXNnZVNOR014YnRDZDBEbTZTYThxQ3B2d3p2NDFaaHRHK2Ur?=
 =?utf-8?B?NTFjeTVCb0xPNlp3bXBjTWpmTFZTcUNwMnQ5ckE1NmpZN1lCckRxUjJ2Q2hp?=
 =?utf-8?B?K3YyV1cxMnJETm5jQkpZSHRadU1Ka3dmNytBck1CVzZLK0p0TFVUQWpOc1Fh?=
 =?utf-8?B?SFBjbzA1RDRHT05hdWh1azBHWHFmRnNMOC83YXJraWRXVUQ5SGcrdGhtUVE3?=
 =?utf-8?B?MmFwdFNqcUJJaW9SZSs4WTZmUytBQ3BnU3h2YkRicnRSanphSWZuVlBoTUNY?=
 =?utf-8?B?N2NnVk5VYm1iS0RScHpHVllyRlhEQ2MzYmt1V1ZJTC9kamNZb1JMMnVmdWhx?=
 =?utf-8?B?c1h0Z0p2NmxsQ0p5T082TmxVRkFCaTZUT05ucDZld3NjME5nRi9YNkR2V2Jl?=
 =?utf-8?B?SWh1TXovN0FZZGFMQ1NLTUl0Y3NoZXp0S1F5WWJPWVhXejNsLzNnU3ZzSGR3?=
 =?utf-8?B?d2hzcSttWnlvTnMyb1I1ZTBTak95TENvYVZ6MzBManREclJOTGVsb0x1cU4w?=
 =?utf-8?B?ZTJXanVrRWR4aDJWWDc0VktEMXVqWGd1T3RRYmNBYmErUFk4a2lWc0pZV1E5?=
 =?utf-8?B?WXNFT2VVQ2RZYzRFRDlmSXB0SWNwMnZNb2R0aEhqZzgxMktQNjBGWTBGenND?=
 =?utf-8?B?K0lkcGVzNFZGRjlRUDRWRXhkQStUOFIwRENXTHFHUkV0b2hqWCs1bGNOSmZU?=
 =?utf-8?B?empGOHRkQmRuQmJCcEtMeFkrQnpFS2pXK2xPOERPMDlCcEZEcThwR20valM3?=
 =?utf-8?B?bjkxdi9ZWHFQcU55d2RvdEFLM0FqMk1uNEU3azhnaitZNzlBSU5OeUpwT2lH?=
 =?utf-8?B?R3ZMYUl6bmVLcW9NeEg1b2wyS3pXZEVCQllVV0VMdVdEeUtacHBERnJTak5D?=
 =?utf-8?B?QytvL044T3RPam1TQmJURHhsb1NGTzRLa3pjZ1V5c3JOSFIvWTJ6eVJHZzFr?=
 =?utf-8?B?aGVTNXJ3Y0xQeFFVUFBIY2dUc2lGdi9WOHYxTU5OVVRXdVYxMkc5RGl2SlpI?=
 =?utf-8?B?Q09JbWo3SGxMSnBBakdXV0FRTnhvbmhMV0ppejlBZnNVOHd6MUpXUm9uNWpx?=
 =?utf-8?B?R3pPWlptZjc1a0hhMnpudkpkY2xxWGwxSVdZcmxjbnhCWlZLeXNaQ0hudFhH?=
 =?utf-8?B?ZGxTNUVKUS9LU25oZG53dW5JTHpYdS9TUVRFWmxHa2FvS2huM3Jnbi90V1pB?=
 =?utf-8?B?aFFpbzU3bmdDRGU4SDZVbzJmYjBlZ2RRYVZtMWFkOHpweG9qbU0yUXI4akw3?=
 =?utf-8?B?NTdRNzdZWDF0RGFGd3NxSlNPcnFGMHVrdkhoWVc4Q1JZaVNGMmg5S1ZTT3k1?=
 =?utf-8?B?TEwrbTZsUkV3UFhUTkx1VkxFNStxMmVUMVF0MjdyYnFtYmtjWVU5Y0xIRkp2?=
 =?utf-8?B?QWF5bHBzbU5mTFErUjRzL1ZERDh5cmZuNk0wTjRsWlhNUzNvVkZxeEdEVUJ6?=
 =?utf-8?B?ZGtubFlPWTZpczVUUllIaDMraENCbXdZWk1abTY2VzYxenRzbHptUVB4bUxr?=
 =?utf-8?B?dXB6WGsrUmZUblVKMUhuMnphMGxWbWFIUTRIbTV5Mk16aFpnQkJPT242clli?=
 =?utf-8?B?YlRaMC9WK0llRzlBd1kycU5sU3lXN2hnOXZMWEZKV2diTGhYYWwrUWw1aDlV?=
 =?utf-8?B?bEtaeDdlbTd2Y2htSkJwTzJJaUtuUGFDVjFOYjZNRWpocGt3RHdad2NaVm9N?=
 =?utf-8?B?R2JOL2NqUVdlVUlhTEZaOEQyTm1OMnlqVXU3cG90bjhvQWkwcGJkOXRjbFBs?=
 =?utf-8?B?NW41T3lFLzhvYThOeHBFOXNUOGhnVklEOXJEc3FrLzBEYk1kUFJZN24xTTNl?=
 =?utf-8?B?cG9Mck1CR2F1UXhsbW16RmxDdndGWGIwZXdIck1MRG5TZUdnQXdiZHlETm5M?=
 =?utf-8?B?a25IQUttNHdaNzFIVzBiN3NETEcyMkF1ajRRb1FWbWFFOEVzejB1TzFWak9a?=
 =?utf-8?Q?3OUqBwn+Bbk=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10697
X-CodeTwo-MessageID: 2067c17e-2339-44e9-a817-8d8b4e7bb959.20250411085514@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	67416246-2885-446f-e80d-08dd78d69188
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|35042699022|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M3BBd3NWVm5mR0FGaGUwMXp3c2laL2N2ZjZITGZRSkxrZVMzOE81QTAwVWlm?=
 =?utf-8?B?REpFa0JOeC9vWUlVSi9QSjJQTkxFVE5qMzZFL2w1TGtMaUk0QmxuaXFRendQ?=
 =?utf-8?B?MC9BVnh1SEwwMXN6QW12MDE4bjBDT05jVExMTWdLQTJpMlRINE1tK1B4QlNX?=
 =?utf-8?B?Z3JHOTJ6TDBTYUNXKzdkaWNraUdVNFN6WG04eG9RM2tZVWtZeDFZcnlKQ1hS?=
 =?utf-8?B?b3VYTkYvcjlYa0NoSW5NWStCTTcyUHIreDVCZEZ0V25WdG1DdWRCVjdDSFVD?=
 =?utf-8?B?djNqbG9kbDhtMU5iVWg3cjNSMHRUYzUrdmhSUXZZczlTcEZubEphbzliSHlO?=
 =?utf-8?B?SWx3YlY4UHhoMVVRMDRYcHB2dldiU09HR0o0akM3dy9PeVBwS2k1SkUwRSt1?=
 =?utf-8?B?ZnVjLzNPbHpkNW15cUV0eThKMmIrZkJ3Y3UvUHJtVFNscHh3Ukc5UzAwdU9Q?=
 =?utf-8?B?Y1BRSjdsWU40QUJqdVNSSVhsUnRDUXJPWjdyUlUrWWNDV2xScEVwSlN6SjlC?=
 =?utf-8?B?VlBPYmpMVjM3c2l4MFFvMjZITDVNZkFDM2Z5YnA0MzI2OVpoVCtFa2VvcXVl?=
 =?utf-8?B?c0xQS09rRFNHM0xVK2NkQ213Yk9PQ3dxTDRMVUhUSkE4d21wbEM5T21zWGZl?=
 =?utf-8?B?T1FoQnlsL2IzYVppYkpLY1hDaGpyeEFHc2FjYlpkdzFsY0NLbG5hOXUySUtO?=
 =?utf-8?B?ZzRheGJmRFd5bURSdGszRU01VjRUdmlkNk5wQ0x5TW5VMHZHYkF5endlUEVC?=
 =?utf-8?B?RU5zZUZWTmw3aE5SZjlRWVcxVUJSa095MGMwUGwzZ2RRYi9lanJGRXVaTnY3?=
 =?utf-8?B?RGZRc3BTQjVLMTE2eHJVWjh3bXRoRVBnaU5mUTV4WWxvRThkV2hVUGJxK28w?=
 =?utf-8?B?b0UxK1RBdk9NRE5nNzZBdGFUaVhzazB6WnF5eWYxSWtMREFDc2RIUkplby9U?=
 =?utf-8?B?TnEyeWRxSS9Xc1AxVGJxZjgxQzJqb3p3TUZVUTRCWHZ3YityVUtOWkZTS1pJ?=
 =?utf-8?B?d2RVUzFrUVNiZlZESTZuQ2hhc2hrZjdrdDRTcXVLaGpJYWJpa3lvaFI0STN0?=
 =?utf-8?B?TnBzR3UyWEs5SUxvZWJQTUdCN3R2NlZqbnMvS0hOeGxSNi9kVTNvMWtZbXpO?=
 =?utf-8?B?ZG05OGZ4elFaMjJqQmpGekRrVGtmenlhK01ianpTVEhENVdMaVZJVWlpTnMr?=
 =?utf-8?B?S2NrTHFsbjZlYnMwakU3RS9hSTBtNjZWMDFIRkNqVlk4eDB4MFVZaDFWZWNG?=
 =?utf-8?B?eVFYWGpoTnVJdDluNmJqejdxVVNQVzc1eVlRZG1zV09JU3pXc01yUk9CanNr?=
 =?utf-8?B?ZG5abVhtMmRPTVhHTnRUQVdKOHN3blJQcW1hWUVrblNrRWVGbjhFZEhXMk9B?=
 =?utf-8?B?aEJNQ3NZWGEzRzg5TSt1K0VDdlRZbnd5dXJKcnNyeG1VSnhRN24yblpUSHA2?=
 =?utf-8?B?M3BYZjZDVTN1QkVaaVUxcFBVN3VTSzltRkpRWCsvdHcvR2k4aE5pclNZRWIx?=
 =?utf-8?B?TkN1UnRmWHd5WW41WWVxZWJKUmJDV05UUlc3Uy94eUlsQmgrOURydndIdjh6?=
 =?utf-8?B?RGNIKyt4cXJ0ejlQZFNMSHNITFJ3TlhzaCtqV0hseEVyKzV5dFNUNXVYTkwz?=
 =?utf-8?B?aWRtUWRNL1U3TlI2L2NxdGwzc3FnOUM3OEpCMmJDYjdLazFib1ZBMmRNcmZy?=
 =?utf-8?B?anQ4NjZSd0NMc1lKaUt4ZXowTVRXMU4rTEZTVWluVEtoYndFWktRL1VqanJn?=
 =?utf-8?B?N1JQdE5pMERNcmNUVzJ6YzNVeS96akxZU09KOU1WcHBQU0k2RjE5aUgrS1pY?=
 =?utf-8?B?ZitSenQzMkZ3SE9weVlMZ2xBeDYwSlhRQTEwZ0lvbFZadEgyaUJqRGRMVHZ4?=
 =?utf-8?B?NTFudlZVL3RYWXhPc3NYTFdzL2hiU0dYWlRJbGV2YkxVYXVJbExCc1ZIaENn?=
 =?utf-8?B?NThKbkxqMS9mWFMxaTBLcm9ZV2hpNDRtK2Q4R3EwY3J6b0crVTVLLzZFMXJY?=
 =?utf-8?B?azlPTHRBVmp2QllFdnptYXJBSUNFc2wzSUFOaENVZFM4ODJOd1R5WDFIUVk4?=
 =?utf-8?Q?xfabDv?=
X-Forefront-Antispam-Report: 
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(35042699022)(14060799003)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 08:55:14.6455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a3e7ee-f15e-4c49-a68e-08dd78d69354
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7464
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 08:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214720

On 10-04-2025 16:31, Alexander Kanavin via lists.openembedded.org wrote:
> On Thu, 10 Apr 2025 at 15:05, Lukas Woodtli via lists.openembedded.org
> <lw=3Dhqv.ch@lists.openembedded.org> wrote:
>> The reason to use these features of the Python interpreter is that we de=
velop for
>> resource restricted devices. The target device should not need to compil=
e the Python
>> files to byte-code at runtime (which happens regardless of the optimizat=
ion level).
>> We can do this work at build time. Moreover, Embedded devices usually
>> have restricted storage size. So using the optimization level 2 for pyc =
files is sensible.
>> Most embedded devices don't need the docstrings in the Python files (sim=
milar to
>> not needing the man pages). So we can get rid of them (that is what opti=
mization
>> level 2 does, apart from disabling asserts).
> Most embedded devices also need to be robust. Lest you forget, python
> and its extensions are written in C, and asserts prevent what is
> over-generously termed 'undefined behavior', with a loud crash. Which
> is a feature some people find useful. Can you demonstrate speedups?
>
> Docstrings argument as well needs to be substantiated with numbers.
> How much space is actually being saved?
>
> Is there anything else to these optimizations? Is it documented
> anywhere? How can we know if it changes over time, with new python
> releases? I feel like this needs to be considered far more carefully
> than you have so far.

Getting a deja-vu feel here... We've used a similar approach in the past fo=
r=20
OpenPLi, as we had to cram the full DVB settop box GUI firmware into 32MB N=
AND=20
flash for some boxes.

The impact of the "optimization" on runtime performance was negligible, and=
=20
we're talking about 200-400 MHz MIPS CPU systems in those days.

Python's optimization level 2 is sure to break things. Quite a large softwa=
re=20
base uses asserts and docstrings for their internal purposes. One might arg=
ue=20
that that is "broken", but that's not something that can be fixed from this=
=20
side...

We didn't experience any ill effects from optimization level 1, so the we j=
ust=20
patched the Python stuff to just always use that, regardless of the file=20
extension being pyc.

As for space savings, the best thing was to omit the "py" files. That resul=
ts=20
in more than halving the space required. To accomplish that, we split the=20
packages and put all "py" source files into a "-src" package. So on the end=
=20
product, only the pyc files got installed and developers could optionally=20
install some -src packages if they wanted to hack on the box itself (the ma=
jor=20
advantage of using Python).

M.




