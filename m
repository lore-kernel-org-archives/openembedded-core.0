Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDEFC04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 08:45:43 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.116])
 by mx.groups.io with SMTP id smtpd.web11.35927.1715935542176380714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 May 2024 01:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=AV8siGxh;
 dkim=fail reason="dkim: body hash did not verify" header.i=@topic.nl header.s=selector2 header.b=R/hM4w3G;
 spf=pass (domain: topic.nl, ip: 40.107.20.116, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=m6WaNI9gEEftqZVmCXJBqm60XzolNviQhkWGdwGXrJpfOl/QNLZfNqZHmh5bfz46uTwv5S4ZbaXY+SPhzqhRl/L5OD5M+gEMgVtcxeHwwfOiQRcEWnfs04fSuU9c5JRRbOknfTxU1YxxJouVpplKI2VI2ilq65gyhAjyQthBKzQ9ZwMeEQt68jfbOcXhQjK3YJE26Dyz6uedWd+Gt/vbBP9ZRUF47gtzivyFLD6dq7aWNxoYodBy2v/3PXAIoZXZ1BZ1Wt5KEM5vKcAYaOV7X2ubvHHNGW5VOmPKR7DoVkqer7/4p3gii7u6MflafZL6UDcazCl5p/Gkx7g/OYgZ8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bG1bxK85ouz0dUXa5+M26/tWfO4xveLe8wIxo9s/CcA=;
 b=mrLvSAzQkKvu3VDGaB4ozhGkgCmPhntEB8BDoo2CwSQHN3HvVkvAbmDFsmDGF9iGpwLQWY3NKbY1aZzNYoEeKuo0EoOy3hMNFRwKIdavLiRAJGqXIQWtGYN8y0GCcZN9VKaCdSjgrdITwf3h6AB0Kyb6KGn2penXp2+ZB5r82Z4CkIc+hLqoOpftZZunpGx4R0m7ueFRPNg9P+ONNz8FWn5wsHt+dXdgaHPRLuStMtb8bdHAkUCA+CCn+8B51FaWqu4qsWqVMo2qHQQ3x96AS2fBpOUvPfEpa7e8xanStMZwdM3aUQ1Vx0cy8NWwU62FOUe3vRR7J+gZPno6i/StJg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=topic.nl; dkim=fail (signature did not verify) header.d=topic.nl;
 arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bG1bxK85ouz0dUXa5+M26/tWfO4xveLe8wIxo9s/CcA=;
 b=AV8siGxht4YPvWBArg/RMi022S5F+kEuovhsq4qpHxY4k9CiBcJoXem0xMVBYCl0M36KZ/IaBD2mblI6WbvUfQ/ZrStU3ZaoW8Ju/gB6rFU+RwVN+sWmaOFBrarkmDSj77d+AIltEVNsoEXSUV3x7k8TLRelzIyQkowlbrt3yVS/CXd5dTtpyZ9Twml+qOyGKBcVKyW+xKEdd5VrfDP0MPZRzGuQ11uMccSOsGfxI3uGqtX+NQ6ZrTnpwI82trm5yizA3+Qe9PcmQLRreAYtTGXK0+eTExn1/JRqvi2BM3NtX0jZ2D7ZUDSIcRi64SY7fTwRdqV8WcfRyeIA7mpslA==
Received: from DU2PR04CA0055.eurprd04.prod.outlook.com (2603:10a6:10:234::30)
 by VE1PR04MB7424.eurprd04.prod.outlook.com (2603:10a6:800:1a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 08:45:37 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:234:cafe::84) by DU2PR04CA0055.outlook.office365.com
 (2603:10a6:10:234::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27 via Frontend
 Transport; Fri, 17 May 2024 08:45:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=fail (signature did not verify)
 header.d=topic.nl;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.21 via Frontend Transport; Fri, 17 May 2024 08:45:36 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (104.47.51.168) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 17 May 2024 08:45:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFO1bUBarvUANgNSCt/vMz4IFRIly+OgGvDRGhtRew56x9tl/lVDL9p9CoKsNIL5Yb54QoBwTsSq52r8n57hMxe/rYBhyCUusklUQucXA9fQ6xVCwJZS6oXWwxRt6OxXCMBDfjQWYpEhv4Rl3i/XH+pa91ZdWJcMi5HzyqwTSRwuOaQIlmMEJvm+wjn83+BVmBKiITZcCMJpKE9yX/5ccsPQJo8E4bp+vZIqwF1gRsOQnxIsPDZyo2UnuwHL38ZOYE4Sgbw0TDjEOEVf5PEl7h0xlzjGbyXwE3pzCCgaUHbGmTrEiIAU+h6OfIcGLWsZnqw6Y3AwwWCXFY4ezM7l9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTMY0E/9CQK+vNAAjHoE+kfs14vMSubjGx2vw1dKiQY=;
 b=cAxsdwK68LKh6B26/XovtFsfiWmJESdyJMRciwbWgI2n2cnSKuCTqX5YJj0z5ZlfzAfoPE0luvB3L9WqHQ7+54+NHj1dtijaBAPGciYkhAhb9QUYV3o3VcD+MUGsLQm7Eqg7iuI//e7SqBvoYwJpKczP32CcGP4Q1WDu43AO3hsalFWfk0ijdqurInCEwAYcd/bhcxGO8vwXunjpqqBicDoMcyClQviKxcsFE0I4qSJt60vGbsUlT8UmpYYP6Ga5voikiUNYKxmC50rivqYjmW4ZFpNevJ7cF47g+WsAAhSy6gft6j+ZN8dv2b9agyNUOUIhWsR2/1MRJk1i/44evg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topic.nl; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTMY0E/9CQK+vNAAjHoE+kfs14vMSubjGx2vw1dKiQY=;
 b=R/hM4w3Gwok0YPNWz2AqVVHWrcbVOxWcuhWuxQgBEaqCxdnpKsRWZj/0+upNBeFUT1Nq5005ewQ6NJOxEoS5dCRfPUuI8ffrTNC8iZF/iThFwFFBjrlesmtDYUxzYHPRXczq/OHHcvaKwn+hLUWj7HKRSJ3Pu1KszLlsTF4r6EnKIAT8JcDIl5ltojtSLiKZ/3IKFKJVfACHX4d/JIZvIUOqlcP5/L0O6J2840a8EXyErT8WONnp2Hpe8IwXsqHcm14d1KjI8R/kQ0PgfRs5SGw3IQuoOdAQc75Y454CKZPXfeZm30sZOtDU55RdLNJAdNj976qGfbfUPnvtc4Z6Pg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by DBBPR04MB8057.eurprd04.prod.outlook.com (2603:10a6:10:1f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 08:45:32 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%4]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 08:45:32 +0000
Message-ID: <fc723319-68d3-449a-bec5-72d16eef35eb@topic.nl>
Date: Fri, 17 May 2024 10:45:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] What does "do_menuconfig is disabled" really mean?
To: openembedded-core@lists.openembedded.org
References: <e56f7e6d-d5e1-419b-a52b-c1e25f984343@topic.nl>
 <5CA79700-0B9F-4593-83B4-731FC508A6E2@arm.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6ee1b325-beaf-4256-bb16-19d03e341919@emailsignatures365.codetwo.com>
 <17CFF54DADA1CE45.16299@lists.openembedded.org>
 <17CFF64247723DAA.17823@lists.openembedded.org>
Content-Language: nl, en-US
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
In-Reply-To: <17CFF64247723DAA.17823@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P192CA0015.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::10) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR04MB8644:EE_|DBBPR04MB8057:EE_|DB5PEPF00014B9B:EE_|VE1PR04MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: f5f4353b-4233-426a-1f27-08dc764db892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bE1mNDdic0ZGWDYzbEF2MVQrMnkxUWxBZVVGN241MXBoa3FYbU80bXpsK1Fr?=
 =?utf-8?B?a0tXMmxESS9raSttdURlUVFuMXRyWGJBNnlKRkhYSDd5a0Q5SGpaS3FIK2VY?=
 =?utf-8?B?QzFzQnN5NlFBckZ6YjhRUVU1VGhWYXEzejBOelJpMlIxbjA3alkzcmdZUHdh?=
 =?utf-8?B?dFZXOVV2SGsrcWo1WTl6VHp4cndXTW1FUVdLSFlSMnNGVkVRTjVyamwyWG1O?=
 =?utf-8?B?eml0QThRQVM2VEJoT1oxTGtTaUlaWThGL1hPL1JXbGhsUEQ0UDhQMGh4M0FP?=
 =?utf-8?B?VE5DV1c4dDdjbkRnOUJaYk9Ya0w3aXc0dXpxeEN1WlBLNmRNZHo0WFQ3RkdI?=
 =?utf-8?B?L2VvdTF1b3VodnBuRnVMZUIyNVhjOHlOMGd0aHBNeVFZUUVmRjZHS0h2UXJP?=
 =?utf-8?B?dlFGb1BEc3ZMbGlzQ1NBN21VbVBhdUJhLzJuYnRrOTZjdTBQUGhkWFZxQWFH?=
 =?utf-8?B?SThqQ2NWTlhzK2Q4Y2dkV0dqWVczZVNxZzV0Y3BlRFY4UjBOYmZPRHFvM2Za?=
 =?utf-8?B?ZWp2V0tUYk1pYnlNdkZPZnljc2tQQ2cwOTBkemN0MW5kQWp0QUFpTXRUZ2Rk?=
 =?utf-8?B?UmpLUndyQ1B3Qy9KcUZzczRJYW9vTnJSeFhtbUFwc3pSVXQwYnNUeWlpSDRu?=
 =?utf-8?B?VjRwY2FNZW01Rkk2SGZ6bzFUQ3JnVG4rek12aDFienlBS0prbWhNK2NPeHFo?=
 =?utf-8?B?VjdrVTZKME4vZjdvR3NDYU9lYmp0UDVicmFPdWVPdlhDOU1SUlJmWnFFaC85?=
 =?utf-8?B?VkE2NkZEOWM4Qk1LYjNLZTUwREZsYlZUdFh0aW8yYjBkb0NhaG5TSVVDR251?=
 =?utf-8?B?Qm4vd3lmbGpVWTlRaHFRVVpmWk5vaFkyVHNWUjZQLzI5WE5mZjZFT1hYOGhW?=
 =?utf-8?B?V2tzVGtTVG5sS3l4Z2JnMmxmbFN5NHJnRnpaa2Y3YUo3T1NSSTZFUjBVMzhJ?=
 =?utf-8?B?Z2xSSkRqL05MSTJ0bUpwOEtKdUlJT1FPVzdlaFBJT3hLNEpXZHEzNERZcTZo?=
 =?utf-8?B?YksrOWhmYThWcjE1ZjhIbGlPbElHQWtaRm9SVkxoMkNTNHJtcTRraGVrMThi?=
 =?utf-8?B?bkVLVFQvU29idko2NzluTGJjSGludExnaysrNjVIYWhmcktnWm1Nekhob25n?=
 =?utf-8?B?YUVmZlo5d015cmpQd1VhK1FvUWYxa2FIbEo4WEtMTHZOWlYvWEc5OXVwSC9R?=
 =?utf-8?B?azdqM0JLN3BJZGJDbkRDcXVVMkRzOS9hSi9URDhOK3k3YU9ydGVxZ3p2OVU3?=
 =?utf-8?B?UWhiakRsamdUaFdNazlaaStUa1VXYzFpMDZvWUtPaHpXQ0Y5OFViQmE0azlI?=
 =?utf-8?B?UTIwVWxoTzdQQ1BSUy8rWVpQb3ArRXJTcDRYQjhuK3BwREJ3VmdlUVlldmhy?=
 =?utf-8?B?aUZzWGQ0TjRrdFVzQVYvYkJLaUkvaEFLRjBRd29CbllDZGlRN3I5N3NIMlBY?=
 =?utf-8?B?M2pRTG1BeWRpQkRZcEZqNGowWERWQlZEUkFPNDNtU1JwalBsaDVpRFI3NXJU?=
 =?utf-8?B?bGV1U1JlUTZVWTJ2NkN3WTBhM1BCRGZCRHkyTUZLTklhTEdsSWg3dDkrYW1S?=
 =?utf-8?B?MWMxZDdxQjNhVkp4Z2tscjRoTjl1TlBFR3VhbVBmenFMRE5GMUtsUjBZYStk?=
 =?utf-8?B?aUZLaU9VeXMxbE1HdzlhZ0dTaWFBVEVKd0YrNzBQdkpxWlNiZEU0Y0hJMTAx?=
 =?utf-8?B?KzZIUkhEZ29IRGMzWnF4NkMxbHlXZDJlVXQwdzBqNkpBVExTQWgxNG1RPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8057
X-CodeTwo-MessageID: 51d5c6dc-78b1-4306-9362-87f4cda04988.20240517084535@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	abf25984-a7eb-4b1c-5dbc-08dc764db660
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|376005|82310400017|35042699013|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TVdzdXE4ZWdUL2ZjeVNXL2hVVFE2YWlha3hiUVBDb2g4Zi9lTUpWdGlIQ0pL?=
 =?utf-8?B?YndQcWR1QVhxYXlybnNKcGFoemg4ZmVxS3N2WlNpcUpwSnRQb0E4OWlRcEF0?=
 =?utf-8?B?QUFia1ptakxPaTVHYWNaM25iS2tBSGQvSFRhREhGTm5hMEFrYk1JWDlaSVlF?=
 =?utf-8?B?dnZHcHhhSERXdHB6UGx5d3JYVGpSbDZKRTVGVmJhUE1ZaW9ZMHN2MFFmQ1JU?=
 =?utf-8?B?U2ZiNkYvd25lY0FNTVRCOVZvV0VIRXFRRXpNandDdXRQNThtcXFodlk5VWxZ?=
 =?utf-8?B?VGRvcjFDZTRmbE9hN3p5N1JPQ0xVaUw5T0Qzak9wLy9uMXpSSXA4VWpmaTlT?=
 =?utf-8?B?dUN0TTYxbXRVMGxEM010elZ2UXcwMGFlQThVbDMxc2NxaDhKRnl5cUxONVhW?=
 =?utf-8?B?Qk9rVDZrVmIvc2c0QzhXU2xEeFpOT09IS3ZFYnZqejIrVkpGYjFPK3ExaFhK?=
 =?utf-8?B?Y2x2RlNjVmp3VzM3Mmg0VXlPaWp2YURrUFpJdFFTbDhBWHQrN2N2cUpRS1Ax?=
 =?utf-8?B?ZWUwWkZLTHlSbDV4N0F5Ny9meWQrMk1qV1NQWENxV05vbmZneXpnU2hYcGVu?=
 =?utf-8?B?Tlg2NHFISS9jQmY3NGdpbCtyOGQ1eUFSOTRPdXkzU3FvM29QVmltT2lnOXhE?=
 =?utf-8?B?bkVFbDlVNEdnZmdXYnhNTEYxMy80dHhxeHFBWi8yaXpDdEdueElsa2RiVWl2?=
 =?utf-8?B?aDQ2WWl2bUlkMmJTY0VKbjZGa1R3ZW12V3RHVXViVnJPSVpiaHphWXpRMlJi?=
 =?utf-8?B?aVBNOTgrUzlFTkYyeVRRSW1Nd01nbXpUNTRXRE1jUCtweXFOK1R0SnhuVVlt?=
 =?utf-8?B?NkdPeE5DbkIvK0hObUdlMnhRZFloQ0Z5bnQ0N05TOThrZDYybytDaE9kaFZT?=
 =?utf-8?B?UDY5K1N1U3h0dmRmTDFUTmhlRUlNQU11OGhvTGo0MVlERGdpcG1xRU1FL21t?=
 =?utf-8?B?RVRkNS9XT2Z3WjdXOVowTUU3LzErU2JNbFRRQXkyUzZwcEthbzI2d2N5Mmd1?=
 =?utf-8?B?MlNyWUNBbUFsTGQ5bjlwMTAxNGs5UVJPSUlMUTRsRitkc2ZlNHBrS1BhaE9X?=
 =?utf-8?B?cXBxcDlQRTA2YVdXblg5RUVBMmwvNmI2alBkbVMzMStTSWVuMHBSREFrcmJm?=
 =?utf-8?B?OFQ5TE1weUlNeHpqTE5ObGtINERGMHlnOXhpbG9uM2tVVjFqeWxqbnIzdXNy?=
 =?utf-8?B?RWNYWG9IVktGOXVhYVhrQkh1VlhEendqY2p2R2pqYXAvNlEyem1oNTNJeFlZ?=
 =?utf-8?B?Um1uVnp3UzY4eVVhQ1hnYXNwWmVvcmtZRWhtV0Y4ejQ5RnV2RHY4eURoUHFU?=
 =?utf-8?B?RmFNWW4xUFV1dVlqQVpxMFByWHJvQ2NJOVRabm40NGhVUzBBWEZEV3JmYVBm?=
 =?utf-8?B?N0lLRzhJdTV1MFQxcVQxVU43bnBUNGlSWk1Vd2UzM1JQZCs3bXNHWnRCSThu?=
 =?utf-8?B?MjQ0SXpBbTgrakgyaWtvcnM0cnR5QXhic3RQZmdvYnphSXp2d1hYdzl6Yk5D?=
 =?utf-8?B?VytTTURBaVBjb2grWkt0K3RnWHF5b3ZRcmZzY0I0V1d1RXAvNk1kTjJOQmJh?=
 =?utf-8?B?VGNZUnlqZmJEZTV0R1lWTTFIL1pOOU9MU1doV1dXbldzTTJmdFpLWGI5QXlv?=
 =?utf-8?B?NVdmdlBCK0hDUEVPWUVncUpLcFRneWh0U29vL3h1dDVDbVFldm9qa1pZNkZU?=
 =?utf-8?B?Vk9OUjFSTW4zVVcyRzJJZStJalpsVWhpUWQ3enR1MzRLa0R2clFlblQ1VEd0?=
 =?utf-8?B?RGFrdzNLTDRMbTFTZlNpWUhJK2FnSjAwTzRvMHZDOFJERzRZcEx5cmNJamk0?=
 =?utf-8?B?WG9GWnJzMVo4TENIVkNNRFRBcEp1UkVyc3p3V1JwK2c4Z3BUdGJvVVRUTW9i?=
 =?utf-8?Q?1sTtrcxouX5ab?=
X-Forefront-Antispam-Report: 
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400017)(35042699013)(1800799015);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 08:45:36.0598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f4353b-4233-426a-1f27-08dc764db892
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7424
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 08:45:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199510

On 16-05-2024 13:58, Mike Looijmans via lists.openembedded.org wrote:
> On 16-05-2024 13:41, Mike Looijmans via lists.openembedded.org wrote:
>> On 16-05-2024 13:34, Ross Burton wrote:
>>> On 16 May 2024, at 12:03, Mike Looijmans via lists.openembedded.org=20
>>> <mike.looijmans=3Dtopic.nl@lists.openembedded.org> wrote:
>>>>
>>>> Using scartgap branch, trying to create a kernel recipe for a custom=20
>>>> LS1028 machine.
>>>>
>>>> The recipe in meta-freescale for the ls1028ardb is hopelessly outdated=
 and=20
>>>> produces a 5.10 kernel.
>>>>
>>>> So for my custom board based on the ls1028 I want to create a recipe t=
hat=20
>>>> builds a mainline kernel (I don't need GPU or fancy things that requir=
e=20
>>>> firmware or special drivers, so mainline should be fine).
>>>>
>>>> I started out trying to get linux-yocto to build for my board, so copi=
ed=20
>>>> the "skeleton" recipe, adjusted a bit (add COMPATIBLE_MACHINE and a=20
>>>> defconfig).
>>>>
>>>> But when I then run "bitbake -c menuconfig virtual/kernel" I always ge=
t=20
>>>> this message:
>>>>
>>>> ERROR: linux-yocto-*-6.6+git-r0 do_menuconfig: do_menuconfig is disabl=
ed,=20
>>>> please check KCONFIG_CONFIG_ENABLE_MENUCONFIG variable.
>>>>
>>>> I tried starting with a copy of recipes like linux-fscl, same error. A=
lways.
>>>>
>>>> (note: I've run "menuconfig" a million times by now, for dozens of boa=
rds,=20
>>>> so it's not the system).
>>>>
>>>> I tried adding
>>>> KCONFIG_CONFIG_ENABLE_MENUCONFIG=3D"true"
>>>> to my recipe, but that also had no effect.
>>>>
>>>> The log file also contains no information whatsoever.
>>>>
>>>> What's the real issue?
>>>
>>> cml1.bbclass has this:
>>>
>>> KCONFIG_CONFIG_ENABLE_MENUCONFIG ??=3D =E2=80=9Ctrue"
>>> =E2=80=A6
>>> =C2=A0=C2=A0=C2=A0=C2=A0 if not bb.utils.to_boolean(d.getVar("KCONFIG_C=
ONFIG_ENABLE_MENUCONFIG")):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fatal("do_menuconfi=
g is disabled, please check=20
>>> KCONFIG_CONFIG_ENABLE_MENUCONFIG variable.=E2=80=9D)
>>>
>>> So if you=E2=80=99re seeing that message then _something_ is assigning =
that=20
>>> variable to false. Use bitbake-getvar to identify what that is.
>>>
>>
>> Interesting, that points to "uboot-config.bbclass:147" which sets it to=
=20
>> false. I'm not building u-boot here, I'm building the kernel?
>>
>>
>> $ bitbake-getvar -r linux-fslc KCONFIG_CONFIG_ENABLE_MENUCONFIG
>> #
>> # $KCONFIG_CONFIG_ENABLE_MENUCONFIG [3 operations]
>> #=C2=A0=C2=A0 set /.../oe-core/meta/classes-recipe/cml1.bbclass:35
>> #=C2=A0=C2=A0=C2=A0=C2=A0 [_defaultval] "true"
>> #=C2=A0=C2=A0 set uboot-config.bbclass:147=20
>> [__anon_148__..._oe_core_meta_classes_recipe_uboot_config_bbclass]
>> #=C2=A0=C2=A0=C2=A0=C2=A0 "false"
>> #=C2=A0=C2=A0 set uboot-config.bbclass:147=20
>> [__anon_148__..._oe_core_meta_classes_recipe_uboot_config_bbclass]
>> #=C2=A0=C2=A0=C2=A0=C2=A0 "false"
>> # pre-expansion value:
>> #=C2=A0=C2=A0 "false"
>> KCONFIG_CONFIG_ENABLE_MENUCONFIG=3D"false"
>>
>>
>=20
> This is because of using "fitImage":
>=20
> meta/classes-recipe/kernel-fitimage.bbclass:inherit kernel-uboot=20
> kernel-artifact-names uboot-config
>=20
>=20
> I can specify this in the kernel recipe to make this error go away:
> UBOOT_CONFIG =3D "tfa"
>=20
> But then the menuconfig command just exits silently and does nothing what=
soever.

So the issue turns out to be that setting KERNEL_IMAGETYPES =3D "fitImage"=
=20
breaks menuconfig for the kernel in the scartgap branch.

Only way I've been able to run menuconfig is to temporarily change=20
KERNEL_IMAGETYPES to something else, then do the kernel configuration and w=
hen=20
done change it back again.

M.



