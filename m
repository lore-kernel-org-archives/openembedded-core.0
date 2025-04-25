Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D218CC369D7
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 13:50:59 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.136])
 by mx.groups.io with SMTP id smtpd.web11.6970.1745589057304467553
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 06:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=bj5nmnsV;
 spf=pass (domain: topic.nl, ip: 40.107.22.136, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwC/cFVBuJy1fmo6x0LnNg+ADNf73LTQSy5NwLsYigdJCtTstaGlcK5bLqNA4JDdlUCXZQ5TWSFOtYhjriM4D6SPHuMCfur7ZK7/NhHd/WJZbrLQLsVzMKhsOYoz27I6onSp6Ob2Dg1eSo2sOn7FEkO4d8H3A6GEKmHdISi59arJWQxeJZ/SClVVrIxjX5qSPr1vEBzOsDvtL2IBQZUftE+T2sIC+od5mQ9RQIwujv4/2OodLh+DSzUIFc/x5qfdZrcQuFBuFZdQZ8F5XC3nFFn+qRwDqLlBQeAasT9Z3HKzMKpdpbkZjxVOFADm3jNMQrPTQPTBUK2y+2+WT3LXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KLPSKopjdSDt3SpYcyFdpXIVF7VreS5tzqt05AJpVc=;
 b=wT7vopPqr/1+SYthxCgYRsAk55/et6GLT7p68d2lbKgPnVK8zmqGz6GhEBr9cHEp50siHzaqJz2eIpENjkbVvNwucoeBbP+EXAKF0pS3Q3RgR21getOs8AZOkhiBC59jqA58rcbWUa8LiQ12Ey89PjkRipSxcNZHMUege0QVlviEwk092yVVKKcAV+4MJJYVr1j+9seQRuE4GGqqgvwRTuHZjXvfJNKME/8ej7jB176CEzTBLRekLOs/PJLBrLuAgwwXm3qXbsqrGVp5m0yeoMWos6AN6l5Elf1xQt8lpcwnI3g+rDLWnf9ekvPujX9bpFkk7jO233tp/FyIFuGgHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=gmail.com smtp.mailfrom=topic.nl; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=topic.nl;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KLPSKopjdSDt3SpYcyFdpXIVF7VreS5tzqt05AJpVc=;
 b=bj5nmnsVwRbb1HXA34XLqRjOG1A5kITNyN6nNjuDaC7sF5yEXy9SMpEpiwMdDWw76hAy2//EmDz21DeLk3XypnA6UqyAvkozyvvDkY7U6Wg8/VmHdh2coUUwahrx2lyDKPscmOlR56MKjT8aTzkiy+u5gKwEBjmZdrdJZa+N1udra+Z2uuxeg0aVHlms1K0yL6Bvvv2p9TkqlG37HV+SUIOILgCPh1oatOHXCPWGdcV+qOfrXtTpsN55e++GiP6i3cEtxoCBlijBa18vIwth4j/I5aP1x23uFNltvCD/XY/Mw3QNYhSukpEllBxifMzUl3vMXeAaDbXQaUuFQNci0Q==
Received: from DB7PR03CA0078.eurprd03.prod.outlook.com (2603:10a6:10:72::19)
 by DU2PR04MB8519.eurprd04.prod.outlook.com (2603:10a6:10:2d2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 13:50:53 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:72:cafe::c1) by DB7PR03CA0078.outlook.office365.com
 (2603:10a6:10:72::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Fri,
 25 Apr 2025 13:50:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 13:50:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.106) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 25 Apr 2025 13:50:52 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by AS5PR04MB10060.eurprd04.prod.outlook.com (2603:10a6:20b:676::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.25; Fri, 25 Apr
 2025 13:50:52 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%5]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 13:50:52 +0000
Message-ID: <b88d7c9d-5f69-4104-864d-b66f2d20a1fa@topic.nl>
Date: Fri, 25 Apr 2025 15:50:51 +0200
User-Agent: Mozilla Thunderbird
From: <mike.looijmans@topic.nl>
Subject: Re: [OE-core] kernel-module dependency mystery
To: Max <max.oss.09@gmail.com>, openembedded-core@lists.openembedded.org
References: <5a9b30f0-c189-4841-9821-6dc26de4de84@topic.nl>
 <bde7ccac49b5417cda5c964055f72e28a3bc84be.camel@gmail.com>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <bde7ccac49b5417cda5c964055f72e28a3bc84be.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR04CA0044.eurprd04.prod.outlook.com
 (2603:10a6:208:1::21) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR04MB8644:EE_|AS5PR04MB10060:EE_|DB1PEPF000509F9:EE_|DU2PR04MB8519:EE_
X-MS-Office365-Filtering-Correlation-Id: d95bc3b5-8a49-4fea-e3a4-08dd84003266
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|52116014|4022899009|38350700014;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?OW45OEZlMnkvdDVlWk83ZXVrWUpna0FSM1BoOTRhLzlXMmxnQnYrdlVDQTBm?=
 =?utf-8?B?N3dDS1dsSFhrRnRWcHlyQjNGM2xKNjhWeDdtVWZXVGh6U0lzT3hJdEhjdWpL?=
 =?utf-8?B?UW56Yy9uK1hDbHpVNGpKMTR4eDVocm81R2tYV29zUHorZE9sR2NhTGxBTXJx?=
 =?utf-8?B?REtkdThNRWNSempMSVR2MG5SZnI5VXBlbThoSUs1RjFTOCs0ZE9BcTk2SUgz?=
 =?utf-8?B?cVo5OVdKaVJjVk1aYmlvYmFwaGFwZGRFc25wMUZncGNwTkNHT0lacUFlckYx?=
 =?utf-8?B?TWhCOSt4bm5Rb2hWL2Vra1FQRnV2bDFNMHJMRVQ2b0hRMnFBK04wd2xHZHVP?=
 =?utf-8?B?MUx5VC9LeVlZY1BORmlud05jMllSc3A4MUovYnlPWmEvb25JMlB0aWM5WEE5?=
 =?utf-8?B?U2p4YnQzL3RHSm0zOVBKOG91V3VxTk5tVE52TE8vVU5TUk51THRVbHJnQkhy?=
 =?utf-8?B?cG1BRXdjUk1BZkRxR1c0eUVDMW0wTWp5S0VMV1B6a2dad2s2Zloyc01JRkl2?=
 =?utf-8?B?VDRqeTVhNTJLWE96SlFVeEg2TlZFRm81Q3lwbFRDZnpQNGpQdXo5YjhwTVVr?=
 =?utf-8?B?b3BYNjZIbzFGb2IrQ2R5RUEydDJjYzZmMWlFalFqZy9nZ1lpS2VXRWw2YnNY?=
 =?utf-8?B?TDF0eXk1ZlgxWjBBekZoUGkwY1BKY3lOaW50V0hJOC9PcHZzeGdSbXV4TzV3?=
 =?utf-8?B?anloekF6cU16Q0VTZ0RnT0IwTmxKN0VBOEs4QWl6c09jU2JpbGY5QU51N05S?=
 =?utf-8?B?STVIaE5nL2h3akwvV255eWo1WFJYUzlMbzBlUUkrRGx1cHZnTHVMSEpmSmpK?=
 =?utf-8?B?eWtzK0hqYWY5V3ZsQktaVXhjd2pSMmtScTZtMDZPSGEvMW4zZnVTWGxZdy9C?=
 =?utf-8?B?bm92NW5UUlpKVGNuMTk1dVV6Y002T2pBUk1reEpPR2FkWTR4dkY5bTBUYk9x?=
 =?utf-8?B?aXZMNDBPbEZQa284aWRLS1pJR2hkUjJSRkhJVXkxRDNhM2N0NEhWRi9CYTlO?=
 =?utf-8?B?K2MzOU42YWdXUDQrK2R5UHZmaEJCVnV0WjRoUHFDNzdjOU04TmdIZEIzNG13?=
 =?utf-8?B?ZVk0d2RnYnZyZ2dtdUlkbE4vL2h5aklZYm5GNEZycUFZT1FOdXF3bkJsa09m?=
 =?utf-8?B?Tk50TkZLVzg2eEd1YUlTSE9QdDZkWGNjMXFMMDhqZWxJWlRVN2FQQVNyMUZu?=
 =?utf-8?B?ZTBEelM0U2xjUm40Q0pPWnNZYVpDWVdvelRzelAyQkM2Z2VPSDFIMGRiMDhw?=
 =?utf-8?B?UG1YQnBoUE9wYU9OM3VJS2xhQkhiakY3Q0pvQjU5cjhveXpvcllUTzNRTDJW?=
 =?utf-8?B?MkZ4dkZyL0kxbHd4S0JRbk5HMWVvaWZCYnd5Q1RPSlMvVVZIdTRtNDdrV29U?=
 =?utf-8?B?OXBHY1ZGUkdFaDAxQzlDZ3hFU3RkZWdmVUtValJaOVpDY3I0SDZkTlg1U0p5?=
 =?utf-8?B?OS9OQi9HT0VqOUxpODU1eGxKWXY5dWhkWkQwekN3dzNSSVdnMWtRQjRVelBH?=
 =?utf-8?B?RUZUQldQdW4xeUxqWTVPQXJ3cno1UnlKdHd2VC9zdVNaWG9jdkVxZTJMbS90?=
 =?utf-8?B?NlI2endac1lGV0ExZy8yV0JNN2JoeVhvOElhcFRKMHFXaWE4aytSNjdCL2lU?=
 =?utf-8?B?Z2oxWmJjWkhCZlFFNWR3MVlXb0N0b0t2WVFJbndnOERDMkh4YzRyeTI1VVh1?=
 =?utf-8?B?VXVMWnkvMmN3SDYzN3psMWM2M2c5NEp1WEtYOFJrZFV4YlRjazhsL3ZFaGxC?=
 =?utf-8?B?bHQ2dVh4eXYrV252d3pxVmFSV2RDUTNieExCYXU4enFOZTU4YldhZUtBemt6?=
 =?utf-8?B?VmtGdGZCOFA3TVdtY0J5NnpJbENEUDBMeVNPSnJTUFhRMGRaeEJQYVNhNkpy?=
 =?utf-8?B?RkdHUWFXZWk4WGVBMzgzTC9jM1o1WExOYnMyZkwvUXdNTEdmUCtvMko2VTB6?=
 =?utf-8?Q?hCLo6oF7nAA=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(4022899009)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10060
X-CodeTwo-MessageID: ae46fe00-bcb4-4d85-8ff8-c5135858e1e8.20250425135052@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	025f2a29-73a5-46da-d32c-08dd84003156
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|35042699022|82310400026|4022899009|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RE9kNkV0aW52OFNaOTYrM0JSUXBHUUdNL1FNVzIxU1hhMVg5S3FuSFFFblBG?=
 =?utf-8?B?ZllMN3ROUnY4MWIvREZZZnYvZWViZkdaa3NhUHV5cmY0dWNSc3RMSDBrODRh?=
 =?utf-8?B?RVpMVXNhOGJDRzR0cTF5a1NkY2Z1dEMraVBlejFvdjRjbWFVbXVTbjkwczZY?=
 =?utf-8?B?UFhyWUhmSFpQcStzbkRkeWtBRHlMaFg0UUFHcDdhOVFoODB3bE5jNml5OXZh?=
 =?utf-8?B?Lzd2NTZhOVM0Nmh5UXoxUGRvLzRXaDYxYXowVFl3a1d4Tzlpdmh3eE9Id2NM?=
 =?utf-8?B?QnRkWFdMamVTSGtselRGUHVuTWIySzNwbm1vNjJQZCszT24wQlFjamZHMEtw?=
 =?utf-8?B?cG5VdytXS3ZKL1JkNDVsNU83MnZTTWpkME9sYmNYNFNKMVBObDdJSmsvZnFJ?=
 =?utf-8?B?WFA4MUN1bFNDem50N1BOMVNZbVBYQXoxb2pXV2Fxd21HTlhxa0QvNmR6UTFS?=
 =?utf-8?B?TVlrUDBYd2toVW5STTJ2MEZrdUNWQ1YrUGE2MnpJMXlaYjBuWUl6VTl4cGkr?=
 =?utf-8?B?VWdjUXdtaTJxa2Vma1N0MUUvQ0hhSHg2ZEtCeXFCOXBLUjBhRzFqc1VhUTR4?=
 =?utf-8?B?bGlmVGw4Ymw0SjhndFd4QmhZUnVTRC8yL1IxaG05bGdycHQzZk5IVWd5akhp?=
 =?utf-8?B?REJuM2lmSURvUG9ZVS92dmhEbk0vZ1NFMDBSTk5zWDB1VVlhbytpNERUWnBS?=
 =?utf-8?B?enY0RGhQYm9mclQzdVZOMjhYR0p1VVIvS2x2U2oySnNpNkpucjE1WUczU0Zx?=
 =?utf-8?B?U3FVT05MMUxuei9rRDNGa3AzVVU5Q3JCdWNRRGV1cFFmaDYya25YTkdBZ2th?=
 =?utf-8?B?Q2RXS0Y0RjFCcVJPS3lKb0tlMmFYd2Y5YWhDdWl0UC9TVUFmY0czMnRiUXVl?=
 =?utf-8?B?bWR3bEdsbEJ1ajhrWEs0S3Jod0haNmVQUDhNa0Y0M1BZcVVudm5ISDNKV1dl?=
 =?utf-8?B?VlFBS01RNDA4SUo2ZlhlVm1jRGtNYU1qZDNLUWh3cXJsUUlFTDJkWnVTM2RG?=
 =?utf-8?B?RjAxT01jMWZoeXZoeUFIbUdycDd4UDNqWDFxSnAzUTRtWlVLTFl3YXVxZWlY?=
 =?utf-8?B?RTdCaHI4QUdoM292a0JFRjJRaWgxMWpxb21pMTVQZ0Ntb21BeEdRd2cxUlpr?=
 =?utf-8?B?RVhTS3ZDR2NzeklnUVZWb2xFM0YxNm1NSUpheW9vMHA1RHM3YWVicm9yd2dG?=
 =?utf-8?B?akdlUjZiV20wWC9oUzFmN1lud1d2NEJSajlHNUh3U1grVlhhZjQ1L1VCV1VX?=
 =?utf-8?B?NVV3dkF2ektBK05rSEdoMHplc2NUa2kxV1JpZldzTzJXQ2YxQUNpdjQzN01J?=
 =?utf-8?B?ZUFCd1NWZ1VFbDVQQ0N2UWgzVDdvekQ0aWY4YTZ2YXhjNy84aHI2Z0toemNt?=
 =?utf-8?B?amJ5RUJ6OEorcGlQYkRHNlFCT0lDajV6KzZzWFBtOG5lZnJYVmpnQ2k2bUZX?=
 =?utf-8?B?VXZEWnkwbDBJV3JobVJFcTR0eXFmbXcybEpvdmhwa3lBSi9QeU44cDZYRkZT?=
 =?utf-8?B?bmtIVWExNXdmRUd5YUZJSHZhWXlpU3dIRS9qV0wxMll2OWppbWNEeWorcW5G?=
 =?utf-8?B?bWZaUXA0aCtSYStaZ245SlVrN3BmM1Axd0w5Z0xSbVhZemZLNXZ2TXZTQVNS?=
 =?utf-8?B?dmJ3R3kzUDZnMVdIaEFrakQzTHNQNTV0Zkd4bEEyb3UxaDFGamNwa3JBQldx?=
 =?utf-8?B?RWpXU3diTHRBZlpUQlArbWhjc2ZUbUJnZTRsNFMxTWgrZ2ZOd0JoNTNNUFht?=
 =?utf-8?B?ZVp1Uzg1QXA4b1JxaTFONjN1dUtmMzA5L0hTdWNnWit1T2k0ZnBPMUxxMlI3?=
 =?utf-8?B?NlNwSndnRlBCZkRHM1dzTjQ2MUViYytDSWJHNkVFbGdTeW1vcUNjZ2h4TkJP?=
 =?utf-8?B?dEFUN3VxemVXeFNjU2dCZUJBbWo3VmNuYkVjMlY4cW5JRDhoOGdQQjlaWDhS?=
 =?utf-8?B?RUh5eis1bmlCcFJDcWV4eWFLR2RTWHBDR2tJUU1TUkNQclErK0Q5MFplYWlp?=
 =?utf-8?B?d0pvYUUxMzhRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(35042699022)(82310400026)(4022899009)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 13:50:53.6486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d95bc3b5-8a49-4fea-e3a4-08dd84003266
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8519
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 13:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215476

On 25-04-2025 10:48, Max wrote:
> Hi Mike
>
> Am Mittwoch, dem 23.04.2025 um 14:34 +0200 schrieb Mike Looijmans via lis=
ts.openembedded.org:
>> I built the same image for 5 different machines. Only one of them fails
>> with the logging below. Note that all machines install the
>> "kernel-module-dyplo" package, and on 4 machines that succeeds just fine=
.
>>
>>
>>   =C2=A0* Solver encountered 2 problem(s):
>>   =C2=A0* Problem 1/2:
>>   =C2=A0*=C2=A0=C2=A0 - conflicting requests
>>   =C2=A0*=C2=A0=C2=A0 - package
>> kernel-module-dyplo-1.1+154+bb94f350+bb94f3599b-r0.tdpzu9 requires
>> kernel-module-dyplo-pcie-6.6.40-xilinx-g6a2cb0f14db5, but none of the
>> providers can be installed
>>   =C2=A0*=C2=A0=C2=A0 - nothing provides kernel-6.6.40-xilinx-g6a2cb0f14=
db5 needed by
>> kernel-module-dyplo-6.6.40-xilinx-g6a2cb0f14db5-1.1+154+bb94f350+bb94f35=
99b-r0.tdpzu9
>>   =C2=A0*=C2=A0=C2=A0 - nothing provides kernel-6.6.40-xilinx-g6a2cb0f14=
db5 needed by
>> kernel-module-dyplo-pcie-6.6.40-xilinx-g6a2cb0f14db5-1.1+154+bb94f350+bb=
94f3599b-r0.tdpzu9
>>   =C2=A0*
>>   =C2=A0* Solution 1:
>>   =C2=A0*=C2=A0=C2=A0 - do not ask to install a package providing kernel=
-module-dyplo
>>
>>   =C2=A0* Problem 2/2:
>>   =C2=A0*=C2=A0=C2=A0 - conflicting requests
>>   =C2=A0*=C2=A0=C2=A0 - package
>> kernel-module-dyplo-1.1+154+bb94f350+bb94f3599b-r0.tdpzu9 requires
>> kernel-module-dyplo-pcie-6.6.40-xilinx-g6a2cb0f14db5, but none of the
>> providers can be installed
>>   =C2=A0*=C2=A0=C2=A0 - nothing provides kernel-6.6.40-xilinx-g6a2cb0f14=
db5 needed by
>> kernel-module-dyplo-6.6.40-xilinx-g6a2cb0f14db5-1.1+154+bb94f350+bb94f35=
99b-r0.tdpzu9
>>   =C2=A0*=C2=A0=C2=A0 - nothing provides kernel-6.6.40-xilinx-g6a2cb0f14=
db5 needed by
>> kernel-module-dyplo-pcie-6.6.40-xilinx-g6a2cb0f14db5-1.1+154+bb94f350+bb=
94f3599b-r0.tdpzu9
>>   =C2=A0*
>>   =C2=A0* Solution 1:
>>   =C2=A0*=C2=A0=C2=A0 - do not ask to install a package providing kernel=
-module-dyplo
>>
> We had an issue with the exact same symptom and had a hard time
> to find a fix. It turned out that:
>
> - The kernel is built with a patch applied from SRC_URI
> AND
> - We had LOCALVERSION_AUTO=3Dy in the kernel config
> AND
> - The kernel is in sstate
> AND
> - The kernel sources no longer exist under tmp/work-shared
> AND
> - The external kernel module is not taken from sstate
>
> If patches are applied in a kernel recipe they are applied
> with 'git am' and a new hash value will be present with
> each run of do_patch.
>
> If LOCALVERSION_AUTO=3Dy is in the kernel config that new
> hash becomes part of the kernel and external kernel module
> packages.
>
> As the kernel is from an older do_patch and the module
> from a newer the hashes used in building differ and you
> get the above OE build error. Even if it wouldn't the
> different hashes become part of the VERMAGIC and the
> kernel would refuse to load the module.
>
> Our solution was to no longer build with LOCALVERSION_AUTO
> and since then we no longer see the issue.
>
> Regards
> Max

That sounds plausible, and explains why only one failed (kernel happened=20
to be in sstate-cache). I'll check the LOCALVERSION_AUTO value...


>
>> I'm on "scarthgap" branch.
>>
>> The "kernel-module-dyplo" recipe can be found here:
>>
>> https://github.com/topic-embedded-products/meta-dyplo/blob/master/recipe=
s-dyplo/dyplo-core/kernel-module-dyplo.bb
>>
>> The isue at first glance appears to be that
>> "kernel-6.6.40-xilinx-g6a2cb0f14db5" mixes the git version hash from the
>> module itself and the git hash of the kernel. There's no such package,
>> it should have been "kernel-6.6.40-xilinx-gd7b52381656b"
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#215287): https://lists.openembedded.org/g/openembedd=
ed-core/message/215287
>> Mute This Topic: https://lists.openembedded.org/mt/112412917/3617484
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [m=
ax.oss.09@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl




