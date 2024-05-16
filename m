Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4077DC25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:59:08 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.114])
 by mx.groups.io with SMTP id smtpd.web10.11685.1715860746995616236
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=ZTcA0ki7;
 dkim=fail reason="dkim: body hash did not verify" header.i=@topic.nl header.s=selector2 header.b=KG/YuJpn;
 spf=pass (domain: topic.nl, ip: 40.107.8.114, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=hFvlPJtQDNhXHFnkhYbn8L+b6JgNhfalfOtl27SRTPGSY9FaSi3auTwBRC0q8G1NWXAU8chfYWYYNKKVcPfJWFbCZ35YLGD8wnbbPDpuQJvNzh673vjDwx0CltDQls4nPyYfKEFzdSeeMdtQjD44Vj523S9qz/Bip+qZlyRNrG5GV61B2fBrpaWaLvfRLL87lsV8xXA9y67/+l0Vzbz8S8IyacFYQArfrLnFITqCTPFOowhXdKpUGr3z+/3uMkjPupu5sfUBMvmDc5wz40CICgDH/ur8XyD14BgsZR3hXQ4bP7C23BMXpSDe+Q0rhT02TXFRfjOm8UNYlokpC8uGXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsDiQCwPvUX2+oyIfqIyvfdbGgbqVLwG8sV2zQwLIZ4=;
 b=QaRViDj9znJWr+PQqABvP2M+BIgjN9h2gNyQdXL457nOYdVU4RgW6XZv6Y1aBuZliVzEeT2mrPnULNR+h5Pb1yqyNKGgUK8BQt6HR4vHz0avMQBNVlN0c4gLL2023ESL4km1qOCvCIKGNbKnJxTENEmWzyxQ6mRZoaRnqZ0uquobCZygDmf0oAjxdrjkGoEiFubL44AMlrABWsgkW3eYvHiwDEGzCo+fvdpt9EYVH540z5dv6h0IKnGbyaYRJJIHuUaGnVOvFY56Lp8vn8dLdZPn2rUdo7J9zUigqyR6xv+POcv88OkHxYnlEP2hdVnFafXcJR6+hDd9AU3a8qJH5A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=topic.nl; dkim=fail (signature did not verify) header.d=topic.nl;
 arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsDiQCwPvUX2+oyIfqIyvfdbGgbqVLwG8sV2zQwLIZ4=;
 b=ZTcA0ki7gIYYXddFfNh2RmAH8r4eV2I1h0UEhQbPn9UiTxdHuRk2tT6UdPOKVmBd+aColPmXHAQrTJhSZJfg2PwnTg8/bunchilWi2puVFdVHQO36I+ClcwpV7DmalvgBQTF116pmT3P/GKOggqF1iT0EfuDU2UfPdjCpXwbnJSTNZ+P2sMloQsrbc4htp8urwu8qPu88WDcdMIpdyZ2ezxzvKijn/bkdZacNlKeaRFu/fDTK8hf2wIBVaeXPJHquU91rFJvK7A92ANGbTh8mqNhqzBGiXKXacwiszOHtN7DBAO9moczHRkCSJxsiHio9mcZQhk6D0WYqWEI51B64g==
Received: from DUZPR01CA0199.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::28) by PA4PR04MB7615.eurprd04.prod.outlook.com
 (2603:10a6:102:e6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Thu, 16 May
 2024 11:59:02 +0000
Received: from DU6PEPF00009523.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::e9) by DUZPR01CA0199.outlook.office365.com
 (2603:10a6:10:4b6::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27 via Frontend
 Transport; Thu, 16 May 2024 11:59:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=fail (signature did not verify)
 header.d=topic.nl;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DU6PEPF00009523.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.21 via Frontend Transport; Thu, 16 May 2024 11:59:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.50) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 16 May 2024 11:59:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9EBKyNE92mEZp8KZwz0iRKq2XZfdV85ldMtLyE49WlkiHxKvGB0T3bSqa6GjYLe/+F4pYcH6dQHkRy6sNiW0SWlBqkdU182cgf/hUHkFCFPc8viMKd1grRYJPoZlKek/mj23dZiKqZK15W78QVRPfsb74GX8RLZegtIYT5LLlR4tc+26yOFO2gBAOu/zn5EBFXmSBSb6cYr2gxP3c1Hx1phoRNx5LkxMMVAFcxMKtYiwshsMso5FGpq8wQ2wVNFu0kBwR7ULghM4bcpAJFoRgpxz8JS/B52lafrQtIi3f+BoeNZIgwTTWonovlcbPGAX3RU+KCVE54QC7nyPHeYsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJQKadUeMxp67ycesNOCMAg6n2AlC1lf8r+VBTpBVW0=;
 b=FD53VREDr+wgj/FgLxcFfsWLDFh8z3aSdwO8SfuTFSuv+9CkTkK6h2pSIwapsL4z9W2tpeg05VPSyGn8wE81x5hBgzM/yrPFkJFeehqAX+Ix6bJh3DXy0HI5PKrw8l1d2qEOP9NWkhZAdEUv74vs0w3KzrKNYd4dkQ2VV6ExVRXL3BiCSe2M6eKqHL3JvfpAcMo4U3WBpeaWamiPDMlP75MEEPRf5Y5BHy9H5rzSgdI8BBWT3wW561XlK1T6gYjTkFGggmcWBquJkELPZpKfOB3Hwhp+ne4IU7K7xSj4QWTNHb6eEKzo/XAVWiTRZ7jS9IFORQq1x/guNR4HNX92Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topic.nl; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJQKadUeMxp67ycesNOCMAg6n2AlC1lf8r+VBTpBVW0=;
 b=KG/YuJpnVMhI7KbeQ8QE8OOoCtSVlc0TN7YFWwvXMfTUAZcW1w/trS4BNoAiTHn7pS8JJbyhhvcBWebJsQANTxbXbDMwqB0HWIpGq7C57A51XiDNQOWYH3AKaNIxdNH2fX1HfWf+HcJ8WCqyN3DpdHkHxay2n3FSfR/2ClFhhqpeyBOIHqIoQ45joJcETsq5qQdgXz3ND1Ss5+yQcM03kFF+xJxxPP2H9s22bwfUoGffdx2wfs19SSADB6XsjcSS9qMqu4agxSqtJcctyNxal7yaThiasupUpJCa+ogar/kfKbf+XNG14r2WsWL7f0AGXfApIgUAZvoLkin6RAL1VQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Thu, 16 May
 2024 11:58:59 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%4]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 11:58:59 +0000
Message-ID: <1fae1739-db8c-4f22-b2d6-f283d0f26a1f@topic.nl>
Date: Thu, 16 May 2024 13:58:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] What does "do_menuconfig is disabled" really mean?
To: openembedded-core@lists.openembedded.org
References: <e56f7e6d-d5e1-419b-a52b-c1e25f984343@topic.nl>
 <5CA79700-0B9F-4593-83B4-731FC508A6E2@arm.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6ee1b325-beaf-4256-bb16-19d03e341919@emailsignatures365.codetwo.com>
 <17CFF54DADA1CE45.16299@lists.openembedded.org>
Content-Language: nl
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
In-Reply-To: <17CFF54DADA1CE45.16299@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0211.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::18) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR04MB8644:EE_|AS8PR04MB8420:EE_|DU6PEPF00009523:EE_|PA4PR04MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: 728e8506-7d33-415b-a022-08dc759f93a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZDBBM0pyMDVkTlFaaitYWDdQejU2eWJKY3Vud1ZvNVQzSjVadis1cGxJVHg5?=
 =?utf-8?B?ZU9Namt4ZmJWNHZlLzJHb2p0a2hNUDFidzdjYmdudVpUWGcwZVFHU1k4ZVdu?=
 =?utf-8?B?R0ovMEx0OWdwbEVSUm5HaStEUTE2VW00K0JmOEp4QWNRMk9VSjRzYUhBZHdM?=
 =?utf-8?B?ZWNUdFBULzRjcGkzZ0trNnB4TVpKbFk1ZkpqcGY3cGhZREdlZ1hIVjhBaUp5?=
 =?utf-8?B?d2phT3cwdVZ6cnNBY0FMQ0NZMTZGNm5wd3ZCL2lZUk8yTFVLU3A5a2pWb0po?=
 =?utf-8?B?OGY1aDhRMENuMzhpWVAzS2tqaHNkV3E5NEdRdG5RMmdTN2Rua1hreExxc0sv?=
 =?utf-8?B?RTRxWEpCS1hjbVk2V2J3Y3hDeGtJNkpKdElHbkwvOGgwdGlGbDNEN29yQTkz?=
 =?utf-8?B?blNhYW1pVU9wWDFMeDViT01zWDBVRzgyMTFFN2JpNVhxWW5GWk5qNGFzOSt1?=
 =?utf-8?B?a0JJYjNyYWVtMnlOZm9QZ2JGVlEvUDB3RFE3aC95bG1TOUF2cm1zS0VDaGxu?=
 =?utf-8?B?NTFmRThseXMzWGRaQytOMFp5aTRhZ25TWk96MUFzaW93bTlxbEJXc3hpN3lX?=
 =?utf-8?B?WnIzdzJRMTdLci9JOVJ3aUJBNnJsTXFYc2xlYmMyeVVabEEyMkMxZUFwWk51?=
 =?utf-8?B?alBPM0FUVlhsM2RuV21KZVlnSEc3K09QTVMzOUlxaEhyS2V2U0h4Zm0zU2hh?=
 =?utf-8?B?bEZaTUVGR05zbFlkcnA3eXFhU29PYXExS0VUMkVtT2NJeFE0WFBnWEFBVHlP?=
 =?utf-8?B?TExtcXJSNk1YTG1xUnZiaUhyNzVCRitqSWJKeE1FQnF3UWFTcUNtTFhMZ0xH?=
 =?utf-8?B?NG5IdE85bVZiY0tjK3pWcWltWHBqZyt5bjRWTXVDWnhRTDRRc01CRHRRbzRh?=
 =?utf-8?B?blIyTUFxVnFSVG9mWVMrS3hncytJREtNc0EyR2UrZm13Q3VWN0hkUXdCeFV0?=
 =?utf-8?B?M01sYy96L01tdVlrZVplYmVEV1c3U1JBayszUnJRc3lUSnlKS2FEMkRIODQ2?=
 =?utf-8?B?cEY0ajE2RllQTERqSk54UkcrTG9hM3UvRCtMZVNYOGpuTGp1bFhpQ0hKRHh1?=
 =?utf-8?B?MjEyRytHNXVqQncwcWx5cTFsbTdBNnUxRU1aQ2ZnZHYrckJLMndMMzg1TWJt?=
 =?utf-8?B?WC9QVjFFYXdzakJwSExRbnlWY2VZbWlDclRTaDdpZlBmcnBUUW9QMWczREht?=
 =?utf-8?B?UFowdVdBOHJMUm5xOHBLejlodHNXb0h2S0hXZUVmTEJ1SUMzR0dWb0RqV1cw?=
 =?utf-8?B?WHQvWlBIcTlicUpRR25WaHlBV2p2UXNJV1pxOS9ScHBWWmtnQkIrM2liMlRs?=
 =?utf-8?B?VDA5clFIN000STg1ZFZ1Vk1SZDdOTysrUlpsbnpGQmJkTkQ0VDcrejNBVjJT?=
 =?utf-8?B?L2ROVmZTcjJ1Zmp0MGhtT29lYTN6TDg5VGRGYTFtUnM1Z1k1S0dSYnBBeTdD?=
 =?utf-8?B?aXg0NmdCZStEYXovVkVqaWk4UXBOWEFxT01DSmJsc2YwSEtaT3JabmFZbG12?=
 =?utf-8?B?UkdSZTNiektXbTZGOUhsbTd5SklTaEcySmJ2OU51WEgyTUZXMCsvQlhHQ25u?=
 =?utf-8?B?SVp2VEZXQVNLdmEwRzYvK1p3OGRXTmVDUTU0cjA0Sit2SGlNeFVONXlERnJC?=
 =?utf-8?Q?7qSGNJqNzl3wyBYiTX4/AxGsT6WbH3d7kyJnJO2wQAzo=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8420
X-CodeTwo-MessageID: a452627d-d5ca-4ce4-a73b-7ce67d9364a0.20240516115900@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bb2448f6-b829-407c-d613-08dc759f91fe
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|1800799015|35042699013|82310400017|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?amk1YlRteGdRTGRkY08xTGRuMVUvYkJpK2tnckFRTkJCbGJCeGloY2VYajRt?=
 =?utf-8?B?dzg0eThmdzA4blRoOFB6RHpGRjlOTzNnVUlBbW42bStNTVhSdGExTEY2L0tx?=
 =?utf-8?B?alVYeExvUXB2MkVuVS9SS2E2R25jNWNmMDc5bEdFODF2Mm5iQUNNZSttYUxJ?=
 =?utf-8?B?Q1pDdWxITnF3ZExtd1FhUFVLd0Vmc3ZTYTVDQk5abGVNMHFYdTQzZXp0OTkw?=
 =?utf-8?B?WXdoL2NGNFFWVDNLamdZVm9jR0l0SjVRK1ZsMnI4RjBINkdDRWRDRnorcnZN?=
 =?utf-8?B?ZzZPeWs0eEhSK3l4T2FDTXp3YUdLVENwY3RXTE55V1dJZzYwTGpCeVZXVTBv?=
 =?utf-8?B?K2ZwVzVVY2FtZzdMUHlEcStKYzRJVFpuSGJqZkNVZGtlb3J2TU0wU2dJaTJG?=
 =?utf-8?B?K1BQWmFSTmtpOERyQW1KM01jeUNOeHlhVHVRMzZ6QThjUHVJRnk1RzZZdG5a?=
 =?utf-8?B?UVRNdVJwdkpud0dvZkhEd2NFd1Y2aUtOUTFqbTN1S2cwelRHVFo0dC80Q3hO?=
 =?utf-8?B?a0d3a3JiOUhsRFVGVU1EZ2dVc2N0bi9DSy83SmZERFRDdjE3QTVIV0NNdUhm?=
 =?utf-8?B?QWJsKzVKWWNSOU5yNFRYSUw0cTd0czE0YU9zemkvNm1MUzBVYU1Gb1JYR0xx?=
 =?utf-8?B?TUV2N3BEWlRtWFM5dzR3YmQwbUx4T3hCWlk0ZmpEdjhrdW4zdWNCTzRSMnNz?=
 =?utf-8?B?WFhOOE5UWEJZdTN3eFo4aE8vbHhiV2wxSWtjVXFUZVFrZEF5MHNsOHJyYVg0?=
 =?utf-8?B?c1lpOHpMZGhVdUZITkZ3LzBsaVZxcHlQOXRtSTJzMUM2MDFFdklCdCtqZkhk?=
 =?utf-8?B?OWZUNU5sQW9pWWhtUVEvT2hrZ1JVZWphSlJ0c3FETGZIWHptTVdqbUFHd2VQ?=
 =?utf-8?B?elJzYmZIWjhTRmVHZXJXSVIwbUlFeGplMS9nNWdRL2NHR0laczdTc3puNzZ6?=
 =?utf-8?B?WWhWY1daQ0I2NkF0RzB4UmVDZ2dKMTJYUEZ4MUlTdGlPQUtTditrSzhScUs5?=
 =?utf-8?B?Y3VCOHBOS1IwQnNObzU4TVJ1SGZyaGVKWWdBbGZIY1gwdVQwOVN6WjlvZGha?=
 =?utf-8?B?aUtmbkNQblpHNlBiak0zcGFESCttQklXWWloaG92YmxsU3Q1ZS9obE9FeWNm?=
 =?utf-8?B?Umpad0NMQlQ2M0RFV0FMeVcwWjFzTndzcFVFbmVDNkU3cTEvQ1oycTM3ZDJD?=
 =?utf-8?B?YWt4RFR0K0hhM0tXakd4U0haSk4rL3VGZ3JWZjI4QkhGQ09HYkNsQnFaMk9V?=
 =?utf-8?B?OTNZSnFyeUVNVmNhbXpmWWJaYk9xOEMxNTIyVG9PWFhiYmtXNVpBOW5uQm9Z?=
 =?utf-8?B?Z0pGOHYwS3pnb0dlR1hHSXRQQkw5b0k5NlQvcWo5T1ZqdHc2ckl3bDNFL090?=
 =?utf-8?B?eTZFTldvTllzeEhIK2hKN29hNVJXc1U1eWNLUU5zMzdJbU1qK0lkZXlpYkhl?=
 =?utf-8?B?QUF2V0ZEZ2xFbzZSWkV2YVNXaVNVbmJVajhMbXM5T2FPeDVaWU9HVXgzNmlW?=
 =?utf-8?B?VWRlYmdubnBpQmcybzNUWVY5bTRwK2FMTkdWT0dvSjd1VjJHaFpPNUJMTHUz?=
 =?utf-8?B?dWh5dWRhNE1OaXFlampqU0JjY0pDWmE3LzNXU0o4bUJnOWo3aVpDalBUTEVw?=
 =?utf-8?B?THE2NmIyRFZoNi9TMUJKR3BkTTc1d0Q5eUNZN0hNSDhrenE5dFEwSy9YZnJV?=
 =?utf-8?B?YnhjWXQwYVY2Y01Wc2NRQVlxTEJCaHNsWHFSbk9rM2tCNVF2M0YraEpubzhs?=
 =?utf-8?Q?4QAPMDPPq9jodNdQtUpUvHAISfgWP+YJ2e817wX?=
X-Forefront-Antispam-Report: 
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(35042699013)(82310400017)(376005);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 11:59:01.6916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 728e8506-7d33-415b-a022-08dc759f93a9
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7615
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199484

On 16-05-2024 13:41, Mike Looijmans via lists.openembedded.org wrote:
>=20
> Met vriendelijke groet / kind regards,
>=20
> Mike Looijmans
> System Expert
>=20
>=20
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
>=20
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topic.nl
> W: www.topic.nl
>=20
> Please consider the environment before printing this e-mail
> On 16-05-2024 13:34, Ross Burton wrote:
>> On 16 May 2024, at 12:03, Mike Looijmans via lists.openembedded.org=20
>> <mike.looijmans=3Dtopic.nl@lists.openembedded.org> wrote:
>>>
>>> Using scartgap branch, trying to create a kernel recipe for a custom LS=
1028=20
>>> machine.
>>>
>>> The recipe in meta-freescale for the ls1028ardb is hopelessly outdated =
and=20
>>> produces a 5.10 kernel.
>>>
>>> So for my custom board based on the ls1028 I want to create a recipe th=
at=20
>>> builds a mainline kernel (I don't need GPU or fancy things that require=
=20
>>> firmware or special drivers, so mainline should be fine).
>>>
>>> I started out trying to get linux-yocto to build for my board, so copie=
d=20
>>> the "skeleton" recipe, adjusted a bit (add COMPATIBLE_MACHINE and a=20
>>> defconfig).
>>>
>>> But when I then run "bitbake -c menuconfig virtual/kernel" I always get=
=20
>>> this message:
>>>
>>> ERROR: linux-yocto-*-6.6+git-r0 do_menuconfig: do_menuconfig is disable=
d,=20
>>> please check KCONFIG_CONFIG_ENABLE_MENUCONFIG variable.
>>>
>>> I tried starting with a copy of recipes like linux-fscl, same error. Al=
ways.
>>>
>>> (note: I've run "menuconfig" a million times by now, for dozens of boar=
ds,=20
>>> so it's not the system).
>>>
>>> I tried adding
>>> KCONFIG_CONFIG_ENABLE_MENUCONFIG=3D"true"
>>> to my recipe, but that also had no effect.
>>>
>>> The log file also contains no information whatsoever.
>>>
>>> What's the real issue?
>>
>> cml1.bbclass has this:
>>
>> KCONFIG_CONFIG_ENABLE_MENUCONFIG ??=3D =E2=80=9Ctrue"
>> =E2=80=A6
>> =C2=A0=C2=A0=C2=A0=C2=A0 if not bb.utils.to_boolean(d.getVar("KCONFIG_CO=
NFIG_ENABLE_MENUCONFIG")):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fatal("do_menuconfig=
 is disabled, please check=20
>> KCONFIG_CONFIG_ENABLE_MENUCONFIG variable.=E2=80=9D)
>>
>> So if you=E2=80=99re seeing that message then _something_ is assigning t=
hat variable=20
>> to false. Use bitbake-getvar to identify what that is.
>>
>=20
> Interesting, that points to "uboot-config.bbclass:147" which sets it to f=
alse.=20
> I'm not building u-boot here, I'm building the kernel?
>=20
>=20
> $ bitbake-getvar -r linux-fslc KCONFIG_CONFIG_ENABLE_MENUCONFIG
> #
> # $KCONFIG_CONFIG_ENABLE_MENUCONFIG [3 operations]
> #=C2=A0=C2=A0 set /.../oe-core/meta/classes-recipe/cml1.bbclass:35
> #=C2=A0=C2=A0=C2=A0=C2=A0 [_defaultval] "true"
> #=C2=A0=C2=A0 set uboot-config.bbclass:147=20
> [__anon_148__..._oe_core_meta_classes_recipe_uboot_config_bbclass]
> #=C2=A0=C2=A0=C2=A0=C2=A0 "false"
> #=C2=A0=C2=A0 set uboot-config.bbclass:147=20
> [__anon_148__..._oe_core_meta_classes_recipe_uboot_config_bbclass]
> #=C2=A0=C2=A0=C2=A0=C2=A0 "false"
> # pre-expansion value:
> #=C2=A0=C2=A0 "false"
> KCONFIG_CONFIG_ENABLE_MENUCONFIG=3D"false"
>=20
>=20

This is because of using "fitImage":

meta/classes-recipe/kernel-fitimage.bbclass:inherit kernel-uboot=20
kernel-artifact-names uboot-config


I can specify this in the kernel recipe to make this error go away:
UBOOT_CONFIG =3D "tfa"

But then the menuconfig command just exits silently and does nothing whatso=
ever.



>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199483): https://lists.openembedded.org/g/openembedde=
d-core/message/199483
> Mute This Topic: https://lists.openembedded.org/mt/106132236/3618446
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mi=
ke.looijmans@topic.nl]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20



