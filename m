Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E129FE5209
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 10:59:14 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18658.1777028349122615623
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 03:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=nkBpaNQj;
 spf=pass (domain: cherry.de, ip: 52.101.70.48, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgO3pm1jHyoXyfnmrmrONy/ZlNqdKtO1W5O12zpZkUKmSPwxO3rfuftCn/9/72rIc3vevzndozIVsI775lAcGedtD6H8pVm3T0/QmtfIFwRS2wgxK9xtIruysymIvxHHkgi3CEYyfw3Qcl5QoczpPacbm8EZyxVt1RprzogHDlxXQLPBJdShqS4NcsdVi+bhQqwA9WpbPt2bLqXx5B9PbBxo3K4sn+c+TmfyOORPPgqfMBKU62EyQYxpv/EyAmEy49CI9Pz2MJW+T5Vgyhfak4tsK/2thXHbrZs5+P3jRSm9r4h0JOooMFFdTUMFky+TdEiMWQgL85VG1UQq+E7I8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ld5KuwI9yXW3E3uZfv7Gcy75n2kW7SMxhle1dTweCD8=;
 b=m0id56uXYIvCvxdUITq6AL5rsQeM4TGbYdkA1BpvK60UbZBMsQoRUuCogIyfQziC2OAvM0e8Q+mYgh7eSKIbWyJD1mCmepaIgdKVEWLfIi+QLhw7Wy8D3yvQ1y+9mPYxGkMppAhQvhMXa+paAlOfme/XotaWJ3/yLlPH8PudRxAD3lBSS9KcvxzvSPmH4xPr0n7TQN053i9Dhk4gKg+L2hA2QV1ps5BBQ/U5ndSbBTud9uYmuZmuMLglJ5vDdG2FRqBH3qrQso2D++u0THEs1frseC8u4ToTwhOo6EpUnVsZJMh1Jy/tC47n794SQGCLVXzOqC8oltU1qqSTqvSB8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ld5KuwI9yXW3E3uZfv7Gcy75n2kW7SMxhle1dTweCD8=;
 b=nkBpaNQjAmQioToantcF7dQZMfwWCJkCeM+nklZoN1hMFAyTdcZhrYZN5T7ZEuv+xNIie18dVpkXNzHLLmvNmqRcDkvbfQJmO4F28pURzQIWq3TEeHqs6UvvpHnd8IKET/JaQuqF5z5WFmUmzObJ9e/thfc6fxEkbIHRs1rvSiU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 10:59:04 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9846.017; Fri, 24 Apr 2026
 10:59:04 +0000
Message-ID: <2994e21c-278c-4842-9900-e1650a656909@cherry.de>
Date: Fri, 24 Apr 2026 12:59:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] u-boot-tools: Add dependency on libyaml for
 dtschema validation
To: ross.burton@arm.com, "raj.khem@gmail.com" <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260412035757.134385-1-khem.raj@oss.qualcomm.com>
 <E0CF1B73-5076-498B-8FF1-26E0F519FF01@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <E0CF1B73-5076-498B-8FF1-26E0F519FF01@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI6PEPF00000206.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::90f) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AS8PR04MB9080:EE_
X-MS-Office365-Filtering-Correlation-Id: b64110f3-8c04-4762-be90-08dea1f07f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	d0P6qhAfrX+ZqQPZFxNF7JJiKf5+1Rexqv0tSyJNwlth+OHaE/p+zGvwbOntbhNmQ+IteT6PmrIBa6BZ+bc4aKXRaPJuoP11FV6T0dGh++3+WjVJ0tOsioOhrPgoRSYX97t5rTHFotf071YLnITHchF3kBtsLjOYXZ/dFI22H3G+4AlOz6ZHNJFdDiOPdsu7zK4oIrW2lFnE4COH8O2lhM5PyYLkn/OY+O6S7y0uSj1wiUBtL8Bj8fGXntvXspjiauV+hTyD1xkCL9ibVHl6b6b4uqZ/kFKDFYgaqnh29LD3pOIg22yqTVRcgi9T8jaaZ9vYuKg4/NEB1KqKs4YITJLAsDH2GWqZ3ZPDqzt89x+hTD/gOIx5dLXzHgb8/rN4FLMw/Fl4WSHR6T2k7Zd2q4xHVC6Ww32yyMQIwWSGGqkTTxsgwVdmqMT3MQam8IuGuVqoCgH15Kn+3Cp4V4dn2Ti+oJzT4xJRlOznyFWspD1TT0GOFhY+xpz8PQEzsY53LNtz8c4ffJrIKI/JDPs5+o6GfibcHOFQ2IrqtN+4dDE6sScec2Z6s0pnx8KP9pfJ05abPtqwF7/dFH/NqVfBmgZIlo1q6AkgTS9FUrS9RY3Ikdt/CHhcY5gk71vqpzddjGzLWa5nm930OdsAXQAfDfsqrCsnx9sTikPGO/wlx8j82lEekKd2DX6qgYjIWXTwucXzz7sJEXmWx3ZngMOQ1qABAQRLq1gn1EcKgLBQJ1k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d1dySnVRR1VKdTNxVnN6M0VDR2tvQ2syblVjSkYybUJZc1JoVm9DQUpLTE81?=
 =?utf-8?B?SlBpZzhmTjdzczZ0cGxuYWpTcCs2dUZBNVhkZ2Z4ZDk5aDcwVmQ4enV1cmk4?=
 =?utf-8?B?QnZsNkw1UFpKQXZHMzVMTWRHWlNoM3ovT3BJbkdPUUM0OFFCSVdvc2RHajRt?=
 =?utf-8?B?czUyeHZMQ2ZQbXNLd2tTZ1pvWkRITjJkSVZZRm8xclFuemg3aXB4WC9kK3Fq?=
 =?utf-8?B?OE5SS0g3SEJlV1FsYmEvcDczTnR4NDBDbGJzV0wrTTQvNUdmT2dRMm1BaUk2?=
 =?utf-8?B?Uld2MENVd1c0S3FPZnNFbTNRUVN5dHVGSERLRFNwYzJaZ2lma2R4cHZoMGRN?=
 =?utf-8?B?dm9VVGRjM1R3SXFlYVlwVG5TQ21WdjFyc09IUHlYWXBNQ1RFU1c1dFZrbCtq?=
 =?utf-8?B?L3R1RXl5MkZRZFRMOElLQUwzRFhXU04wTFE1RGlKWDRZdEdZc3RzUDVyZXJM?=
 =?utf-8?B?clJJM2dLZlVCdUdoUFNaMm0xTkxaNHZ1TmxvdGIzOG8xTzJMTkpmY1lnOGxW?=
 =?utf-8?B?S3p0Z0tKSUpGWWplRjJ1WlFHZHN4RldNdStWQjJsTzdMZGd1NFVibUorc2dI?=
 =?utf-8?B?emlrYk43UXhWdThsd2FZcmtWcGlSaXZsdmowUXYxZTcrUFFqZXFyZjVqT0Fa?=
 =?utf-8?B?WEZXZThoZW9HZkRTcE9zQm51NjAzU3pCUlRPanl5YWpPMGlUMFA2aEVDcjlI?=
 =?utf-8?B?bmJVVHMzZndNaSswdnpNdTJIN1RleWx4SVpGZTFzNTlLQldRZnVJK0dRUm1Z?=
 =?utf-8?B?amkwM1ZKdWI1dUgvK0ZpU1dvcUN3RFlnUm1iMGdvZFRDSU90eDl6VmwrZkRh?=
 =?utf-8?B?UlMwSGNucHJXMzRXc3RYN0Z1aFFRQlVlVkRiMXUwaVI4d25RcGp3VjQxc3F2?=
 =?utf-8?B?ZXpwK2t0NVlESHI5WWtsazZIc2ZVQ2RIMDVXMkFVKzJZZHp1VFhQM2lrWXp5?=
 =?utf-8?B?Q1luZHdPaHF2RGJiWllCKzhoTXJXVFRPUy84Rk1ZdmMxRE5WS0dJWWtRM1Mx?=
 =?utf-8?B?ODlka1dwc05YVVNLY0hsMGZ6bjVEU0RtbTRaRlowbmlnUW93MU5aTGZ5VGcw?=
 =?utf-8?B?QnJWOS9WWWJoYW5ta1QvcXdvdytsbk55YkRhUTFOakdiV3k4TU94UXlJM3JU?=
 =?utf-8?B?TXF5VDZVR2kxR0RkRVl2THNIUXZwU3FYaFQ3Q3pvc01yYnZPZkh4bkJ1NUtO?=
 =?utf-8?B?Yjd3VExGd041M3lnTzlJR2tGSFhjNlVnVnZPenJjQlo3eTJZYk1pajZnTkhP?=
 =?utf-8?B?T0p0NDdxSHFXUWNqSVhmRlhaSFdjUjg1ajJLQ0oxc3RZODBXUUc4T1JQdTBG?=
 =?utf-8?B?djQ2TGRVc0N0WGYwZGlHSVZPUjVxejRNM25JTlA5dHkwS01zcDUrM0ZnS1Z2?=
 =?utf-8?B?ZVdYQUJEKzk4ZHpRc1FNN0FjL1hxdVI2RE9nVmYzNXlBVzNnUi9wR1FnTks5?=
 =?utf-8?B?a2F6bE52MTA0TmFrTmR3bnBaR2hkemsxM2hKY2pvQTBqK1hTSXNLSVoyWnpX?=
 =?utf-8?B?a0lvVjBZKzU4Wkhiemp0SjRUbkZvenF4R21jbENEY09sdjh0aFBiNi82aFNX?=
 =?utf-8?B?dzVtQWVFcFgrZmw4RG1wa2x4VjR5Q0RoZ2NRQWR6M25zd0MvN0I5WkZ0Slh3?=
 =?utf-8?B?TlZSWTU1S2pzb2Y4Rm1RV1Y5T3Q4QjA3a0dRTVM0Y3VTcG04RzRzUlNjeStD?=
 =?utf-8?B?TVhpbGcvVkZGRWU4ai9KcGFuU1hZQ212WTlCankwSzhvWnZsaDI0WEJzRktP?=
 =?utf-8?B?N1NkMjllTTVuS2Q0dGYwaEJybFBBL3c3RDQwUFVqcWFTUHFJTEN2TzRhMXI3?=
 =?utf-8?B?RjdOcmRCYUpZK0ZGUHVyNklhVmlJWXBmYmkyWVhHL2hIU3BxN0FFRjZiYWlM?=
 =?utf-8?B?OXRMV3NucTJlUzRleWtCbHJ5Q3FJL1RmY1ZmV3lpT0RXODUxbitaOWE0N0F6?=
 =?utf-8?B?RXgzNGNQdlpWVDFXUFN0Z1VpNTJnZjJaaEhUM0dZWkdnc2lxdTd0eXRmVHRG?=
 =?utf-8?B?c1p2U0N2YVROVXkweEZYVktESE5XUXRqY05tak9NcWdIcm4vaExJc1V1eWN1?=
 =?utf-8?B?Umh4QkNyU08xellYaWxLVFVqVkJqOURiRlBXc3RNWHJHUXJVeVErSG1qdHJH?=
 =?utf-8?B?bHZua0xPbFdQSXpRUXBINVU5QXRzQ0c0TFg5TTd0dzArWldGcDZlbjhNd0N1?=
 =?utf-8?B?NkQ0KzdtZkJqZUhXTnJZK041bDlQVFVsUHowYzZqYnhWK2VnaHlHR0tBVVFW?=
 =?utf-8?B?cWgvRjBUa1hKVHlydlkvdWtzZExrM00rWVkxdlRCNFR2dFlkaUFYSVVKbG9G?=
 =?utf-8?B?LzRrWDUvb21Jb0xzeTVkRW1PbTVXZEtZN2JGRmxCUzdwTWVBSVJFYXk4Z3BE?=
 =?utf-8?Q?v8twqssfkvZEoldglazLCl/SGWkGMtTcd8mTA?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b64110f3-8c04-4762-be90-08dea1f07f44
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 10:59:04.2089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tq9j7p3MMSDxtAdbXDQJ/qOePsawetwpy6nd5wSbDIpkxd/5sPGrsMLG97GbmY+/Z3Vu2E0b8UozbF6UJ/Uz9YahNgZfi7W1RqX4VpMmHi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 10:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235857

Hi Ross,

On 4/15/26 5:32 PM, Ross Burton via lists.openembedded.org wrote:
> Is this specific to the 2026.04 upgrade or does it apply to 2026.01 too?
> 

The file only exists in 2026.04+.

Cheers,
Quentin

