Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABED9C36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 08:40:39 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.98])
 by mx.groups.io with SMTP id smtpd.web11.20825.1744360834442922661
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 01:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=Ef/gDfFF;
 spf=pass (domain: topic.nl, ip: 40.107.130.98, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vsgn1YcvLMxiGf6Qc9oKQ98L8H4scz2MEtpXou0qNh9LFjO+/GpKkZkPuvI0NnyTChPC8Upe1OlcyODpyRizumOXcdV6pqVEK1rVFBAgyNtEac6fdKMsw361tDm1RaDEdQem3MEcFHbvnNlN0iaYwLFp5NI9Evr1Tr374Kio9iTY1FEI3NRMe6uOul0+3udCuvvtxIsAYCFl/JmSN0teNNCiifnuC+OwKTPb8QVO8WNePBquFMn31tVy4CkcXMuGdboPj4O1lxTcy1rj7uDM3DUtvaX3VnEZd4na+cpByTX+CNUvBht7Fs8mr3wQYHwmIrrnRmv+w3p7QyOmH7oMVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDtW5FDfULx3chDKXgkqTAdH0IqCUAjGlc768Nsz6so=;
 b=M2XBsDECD9G+FmhSgXXyVi3jSrFWNjuVbjn92WjCQR6V8qLId5zkB1wctXVawV1UcraFMFS0wHS9ChTgZvpcm9L1odHhWumkJ3UOEricH1ktncuTVFmKUmTU1PBNlDEXDN+/w9IA5N3j1BRLRmosOcfgCfr/OW6TmbA37nOsRHX/Q+GCoZHLsD6OV0EzChPS/GwQKXBKgaENxVTLkdKE8sfC52GpkXkaIfTHbpl8xsHs5669un55VPbjshJSbp8/xuaQRCgZjyK0FEXFTG4rue0ewFL2jDp4K2axKb2Pa0Z1xgfFQYCFCZjPNNpBkl2xy1hovcI5LANxWeXth7V0MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=topic.nl;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDtW5FDfULx3chDKXgkqTAdH0IqCUAjGlc768Nsz6so=;
 b=Ef/gDfFFLZGeZX7bFdXHQqRscdB3yoQ/zU+wPgSGSNGiMCuXfXmxJNjS8FkH11rZ91N7LfYSxG2unq1Z7H+gv07zp9eSOHdbQZdc+khr724GkFkeBF1IZxXUnvGInElNKJYFzJ4X8wRZHXYBv5c09z9Jx1ySDo/DaTwsjMSlbZ8egx+yuwt5aTAkV7PDZpWVSoUI6Wk/+fGrNCMDv+frUZ0vOwPW8x6/CMHY+QhRq5rfVCgTjsRIaT08YTIx0UiE7qkQQ/Bz6IuxpRvU+ikpIAKVmA4AjnDMPBf4V1RRjICFpI+B7/JIUOgjo65SLVitSdmrntEeke2N2AFUAl1nlg==
Received: from AM9P192CA0006.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::11)
 by DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 08:40:29 +0000
Received: from AM2PEPF0001C710.eurprd05.prod.outlook.com
 (2603:10a6:20b:21d:cafe::3b) by AM9P192CA0006.outlook.office365.com
 (2603:10a6:20b:21d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 08:40:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 AM2PEPF0001C710.mail.protection.outlook.com (10.167.16.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Fri, 11 Apr 2025 08:40:29 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com (40.93.64.9) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 11 Apr 2025 08:40:28 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by PAWPR04MB9887.eurprd04.prod.outlook.com (2603:10a6:102:390::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Fri, 11 Apr
 2025 08:40:26 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%5]) with mapi id 15.20.8632.024; Fri, 11 Apr 2025
 08:40:25 +0000
Message-ID: <8ae24df9-f1ae-44a9-a4f3-7d8aa273a335@topic.nl>
Date: Fri, 11 Apr 2025 10:40:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
To: openembedded-core@lists.openembedded.org
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org>
Content-Language: nl, en-US
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
In-Reply-To: <20250404162932.447699-2-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0193.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::30) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR04MB8644:EE_|PAWPR04MB9887:EE_|AM2PEPF0001C710:EE_|DBBPR04MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e29256b-aa7b-4396-58c6-08dd78d4837b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?dXorQllNb0k4eGVHZWE4VTlJY3VTR0lTTlJxYjVTTS9JVUt4S1dQT2g2RVRH?=
 =?utf-8?B?akVIVUx1endJVERzZ2p6MGpQWk5MU2dUd1VxdTNLWDFlcTJWbFZpN2ZxUEN4?=
 =?utf-8?B?N0V2VUg2Z3d2WHNJdHNjMWl6aEl1OVExNW41S3F2Q1BSMEVqeVMveDdpMzZx?=
 =?utf-8?B?QW5uTzI2MmdKOEZIS1dubWd6L1I4cEFORGxNaW83V1RpM05NeVVySXQ4WFFl?=
 =?utf-8?B?SnlaUlZYd2tzVlBxZ3gvcjFkWnl2WGVpaURSTzUyTFZyblhJMG5maHUyN2Nn?=
 =?utf-8?B?bVZ2SDJCdGpQekZPNmxiMVNQTXNUWThWaXh0Wkp3bGQ1Vzd5aFdtYk1VM3hG?=
 =?utf-8?B?cmRLbjVPSFNRaUlTYysvejdmaHBubG9BKzlBS29qc3VOZzRhZHVhUjREaWd1?=
 =?utf-8?B?OG5jcFlEK0dKeEpQR21yUGFrbTU4MUVidmR5TllBSmtvdnJ1WG5rQ29Qanpn?=
 =?utf-8?B?U0F3ZVo5WXVWU0grVmNHZFJiWFk5Q2lZNDMxMXB0bkpHWmlSdjZWN3RyN1F2?=
 =?utf-8?B?TnBJMGRPWVIyeVlYL2JkRXYxajBPaVJzSGd3SzRIcG9PaFVsdDB2bGNrbTBs?=
 =?utf-8?B?N1kwRldueHptcE9BUnJBREtYUzVPMVpHcjlCYVdaZEV2N28rYWFpK09BQUNm?=
 =?utf-8?B?R2RzbmR6QVkyTlVLc0cxeURyL29NMWZuOW05T3lCSFhsZVQzbGZUODUrTVFS?=
 =?utf-8?B?Sm1qWUV5QlpSWW8yVk5DcTVLYUh6dGx3Z20yUURVL2VrekcxbkdpZEhtQXdy?=
 =?utf-8?B?L1VVWWE2TGQxdDZPTmVQTnFzbkxIeU5tQzhHR0JuMlZBdmJNSEY1WVl1bjM4?=
 =?utf-8?B?MzNLUWtWV1ZEcm54SjY2NDNwRmlreWhpYnd3aFhjcys2c3lKWWRZNm9oNEk2?=
 =?utf-8?B?R1VOWEtEUENwVk1Sd3QyQnVvRmlreC9rR3ZwN0tpZXA5b1FNMy9DZXNVU01V?=
 =?utf-8?B?ckpCYWtob0d3d0N3ZTUrY2xLSHo1WUU5WGZwOER4eW9WZDhSWTVaMndUaU1D?=
 =?utf-8?B?K1gxR3VOUUZ4dGtxd2cxVzJWcVFsaU01bjlmRldqTVZoN2t6WjM1WGgwWktx?=
 =?utf-8?B?ZUdRL1RIWUJQdzFNZ2h6b3dXaTQ1ZDNTSGo4Qm5TQkxzckRmRkdaWExjRTVE?=
 =?utf-8?B?YkRxN2VUUVFHb0tpaFh2V0tmUitUaGNKTWVQNEJpTG9QMzRwYmE5dlhWQW5i?=
 =?utf-8?B?akxPWFdYYU5VV0lkektKRVNwZ2tWWG42VTJrc3RVbVFsdEc5ME52UnFERWtT?=
 =?utf-8?B?emVIQ3BGNzFibU8vcEZubXI0Y3dFRjlBT3ZNZm1oTFBvQVJUb0JvcEdweGVB?=
 =?utf-8?B?VzRrWUtzbmx4N2lobjFZaU8vekFlUGJjYzRBVk9XT0laeGFiMFRFejdCYVBl?=
 =?utf-8?B?U3BkYktLbmxGT2h4YjdlVkR3QUhDSEhVMUFmWnN1MUhJc3BjMlkyOFpBYjRR?=
 =?utf-8?B?Zmx3UGJxUVdnZU5hblovb3lWeG95VTdSc3U2L0xnQmhXbk1tRW05YkRnUzVD?=
 =?utf-8?B?NDVUT2Y3VnF1NmtQRTJ4b1BDWDRPbmZpeEp6UlcySFNUYXVKRVl5c0lya3lp?=
 =?utf-8?B?WWZpTFpndFd4V0JqTWEvMmVzTGt6Rzg2NEtrMHVaR2NJQVM4Q28yY04rNXB1?=
 =?utf-8?B?dUJnK1F6b3U0T0t2dVQyU0xmZENlRTRQUmZEK2YyVXZZdGVYQUU5Y0xzY3l3?=
 =?utf-8?B?UzdmVG1GOUNDNjV0VUQ3aVpnRVg5blVhcW1CTVQ5T0pnWXRObGdTV0ZJTDZN?=
 =?utf-8?B?Mmk0TjcxU1dOOXdCbUMvYXk5MXFyNmwxcTcxZzF6YTlHTlNseHpTOGlJOFJS?=
 =?utf-8?B?RzdHTWdqQXQxckt6WjNLOXBoZ0h0NGVRQk4wRGxqL1ZXNDRGcDYrTGxjS3Z0?=
 =?utf-8?B?eThoYU84RFRsajZPQU81UVBLd0V0ckdUb2M5WXlLaGRZRXU4VVVIQUVLQm9C?=
 =?utf-8?Q?/sbBHhCWaDI=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9887
X-CodeTwo-MessageID: 520a0b7d-5858-4e95-88cf-d08640a87ccc.20250411084028@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	30ba9d9c-b0c8-4275-4fb4-08dd78d48162
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|35042699022|1800799024|376014|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MFhsMUVsZkswUUswU1dOb3pnVXlPOTA4Q1pJWTc5SVJhRllBT3lDSGNjY3Uv?=
 =?utf-8?B?MlZzTVV1SkhzY014NUNqZTZnU1JSREllVXJ4eDZrUHlQQVFva0VXdHdWQWVD?=
 =?utf-8?B?R1dvSm1YNUxYZmZ4TWZHeWd2QlR6bmtoRzA4VnRQVkpQd1F0MEp5b0hNWVJC?=
 =?utf-8?B?VWJGZCt6VUtIaHVVbTZrZUt0WVdKeXhrVFB3eWxuT0ZVWlV6d20yOG03UExU?=
 =?utf-8?B?VWFhV2ovVXVLSG5RWkNLTHZmdDh1KzhaakdXalY1ak1GL2wwRWV0NVBLMWpn?=
 =?utf-8?B?V0pNTW15bzNFU3dNMXJUYzl5Vm5pa2h2bDBwc1ZNbGVrVDBUWXRqQ1pnWlUz?=
 =?utf-8?B?V0Z4TFlRY2dRWE5mUW9wNDd0Ykt0VCtjWFNNNmJIVTRFRHVYZW9MbmFSQ3Bz?=
 =?utf-8?B?Y2JFYmUydy9tb016SEFaeHlOeVplMGtoRVlnakVoZk4vMzNlRDhHWGova0tE?=
 =?utf-8?B?dlhvL2FSOW5RbjFabitwdC9RenFrVlVIWFg0SnhraVhocTIxR1ZVRWx5aTZU?=
 =?utf-8?B?aHVMMDVraGRhQnBvckdmcG12bzVpT2lGbjFpSno2M2w0VEc4MC8vT3dsakJ5?=
 =?utf-8?B?bm50MDhQNU5MeHQrdlJWenJWY2Z1d254L2dCaHlxWDA0YU83cXJPcmVhNnVP?=
 =?utf-8?B?dFdUZDU3QzYzdUIvQ1dlQktBNDFRY1ZLVEE0eW5rdnpPWkx1dXBnczFtejBy?=
 =?utf-8?B?UFNQZWhPZHF1aWNJYWxIN0lCU1hyYUpMS3RtY2RsaS85a0xDL1pwWHhoWXA0?=
 =?utf-8?B?N1N6bkVSUXBXYlZvVzNHajRCaUVmMmQxa3pjT0l6ZnVoK2VnRzhhcEwwdnk4?=
 =?utf-8?B?Y3VwUUZ3Z1JXRlNHTXlyejR2K28wNVhTS25QMFJBMDVFalFLekhOZkdNNlZ5?=
 =?utf-8?B?VHp2ZTZqOURQalRlaWxSWTArR0ZLanVCcVJCQVcrdll3c1VpV2JyUllOVDBT?=
 =?utf-8?B?ZEVlU1kxQVUzV2pZM1gxUzB0WW5EekhvZUNGcStHengydGRzL1JETzRJSDg1?=
 =?utf-8?B?U0cvVmY3R2djdGd6RmdWcnFib1FOS29xK2JIWkNNM2VhT1l3a0l0YldNSGVB?=
 =?utf-8?B?MDFjR3p6eEoybklURjVWS1lXVHFsVTA1SCtJUXEvNEFFZlNKWEl1MVZlTWg0?=
 =?utf-8?B?VUxnMXVIUFo1bnN5L3lDUHZ0Wm5XZzE5bVZFeWo4V0wvSmp3d083aFFpQ0pT?=
 =?utf-8?B?bXpWUUgrRG5hRHdWUFh6b3A1cWVkVlpUTzN1K3NXc2dRVGhPSVRPZC9YMitw?=
 =?utf-8?B?VlhRYjB0emlDdFdFRnZiL3NJdVFmUHl0QTQzNU55UElOQTdFb291Y2s0RUkv?=
 =?utf-8?B?TiszSFpKN0FBRmR0YTBZZ25nWlpMRk1Ec1JnaEhjTVIzS0daR01zUVN3QTdP?=
 =?utf-8?B?WVFjNnludE1aM2JXVUNzTHVsZjlYMkgyVG56Q1RKRkJSVWRmSWtoZENhcTI0?=
 =?utf-8?B?UFhtckdESmJNbUhNUTdENXp3M2gzcWxPWGcrQTl1RDBlV29zRkxPWFJqY2l0?=
 =?utf-8?B?S1E2dGVmc3BvVUcrbkZIcDJuaytmRm5uVElnRm40TFgwUzBTa216TXVFQ212?=
 =?utf-8?B?K2RTeHlKelBTR25yelRYL0pMWmJUcmZsSFUrcVo3cmFlMWdTYkZRR1RQVndX?=
 =?utf-8?B?NjZYNzZIM2lLcGdDOG9UZzBHdmZhcjdMK0RKOU8xVHpJd3BwS0hZTjkvSEVB?=
 =?utf-8?B?Um50Y1M0ZlVBci8yc3NxVVA3L2FCeW9vMW94TFZsaGpLNUgwb2JucXRRYTFH?=
 =?utf-8?B?emZybVl2bDRhNHdCNktDWjR3amJ0OGNMdmVMUUdmZDJsTUlrTzQ0RTZkUWty?=
 =?utf-8?B?UWtCKzIrczVyN0Z4U1MxY0ZDYUxWTytrbXZ3TFFvZ2p3SUZkMzlyck1rRHRr?=
 =?utf-8?B?YVBXUFBTeTYvdmN1bnh3SEJIbkVQMnBJQXEzVzEwSkxDY2hmb1lXL1ZkdHRR?=
 =?utf-8?B?TWllWTd0WFVKOVhxUUxKb3JDRUhjVkk5UUhnazJocENVZG9HY3dJUWhlZ25Y?=
 =?utf-8?B?TUtsekRIQkVSbjQrSHdNKzZOTlZuSUo3SWd0V0xtdGNOZGRvNzRCU2ZKZmk3?=
 =?utf-8?Q?qn9vT/?=
X-Forefront-Antispam-Report: 
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(35042699022)(1800799024)(376014)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 08:40:29.0777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e29256b-aa7b-4396-58c6-08dd78d4837b
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7737
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 08:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214719

On 04-04-2025 18:29, Mikko Rapeli via lists.openembedded.org wrote:
> For example genericarm64 enables "efi" in MACHINE_FEATURES
> and in u-boot. Boot without "efi" in systemd works with
> EFI protocols but for example efivars is not mounted at
> all so various checks fail in userspace. Fix these by
> enabling "efi" support by default to avoid making
> it machine specific. Fixes efivars mount to
> /sys/firmware/efi/efivars etc.

Looks like all you need to do is include "efi" in your DISTRO_FEATURES for=
=20
your product.

You're offloading your problem onto others. If your patch gets merged, it=20
would mean that I would have to devise some way to conditionally remove efi=
=20
from the PACKAGECONFIG again.

I don't know what platforms you're targetting, but many embedded systems do=
n't=20
use EFI boot, and some even don't have a block device they could put a FAT=
=20
partition on...

M.


>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>   meta/recipes-core/systemd/systemd_257.4.bb | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_257.4.bb b/meta/recipes-co=
re/systemd/systemd_257.4.bb
> index 64fb8fe69a..06e5621398 100644
> --- a/meta/recipes-core/systemd/systemd_257.4.bb
> +++ b/meta/recipes-core/systemd/systemd_257.4.bb
> @@ -68,13 +68,14 @@ PAM_PLUGINS =3D " \
>   "
>  =20
>   PACKAGECONFIG ??=3D " \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor efi ldconf=
ig pam pni-names selinux smack polkit seccomp', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor ldconfig p=
am pni-names selinux smack polkit seccomp', d)} \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump =
elfutils', '', d)} \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)}=
 \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit', 'li=
nk-udev-shared', d)} \
>       backlight \
>       binfmt \
> +    efi \
>       gshadow \
>       hibernate \
>       hostnamed \
>



