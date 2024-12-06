Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB86E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 16:08:42 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.34])
 by mx.groups.io with SMTP id smtpd.web11.40534.1733501313771964244
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 08:08:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arri.de header.s=selector1 header.b=H23oNtsw;
 spf=pass (domain: arri.de, ip: 52.101.70.34, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0O7Jms0ioEJJjb7016hRRiIOi/oC41czkuiy0V0y0IikleL4etRmOiMknhQo+4xskpvuBZdsGVP0lvkZ2KHaw4FWF1RQtZW0rRXEMRry+Z2CwswUeF67izV9PCCJwaQtZGYuwQUMNBqOYLj4WaYlVF5t1rlfoazNa90/pxN6L5uTkj5T/38OMe1VpEY3EM5wC5PzV1ZgXgW2ZrOxhl7BMLk0rkZxRAXsv7/91AJU/7NxxwOeym8XKJhLRyUBhnpjXahpsD856xe57rkXmr3/vn7vaVqxnm+w1D7ZFGfHuby4Xcz3szec1AXQuCYZamkeC+jLVZ4MwCemoqiDpbdjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXWMiZfrcgTqxt6J5ZFVc6bvXEDD0r9LvBA0cSrN7yo=;
 b=pP7TuERYSW+pmCl7kNku33zthzNLHlmLhXpfca2t1O39ICv5ohvo5o76ENJ0d/0rdi7YXcbUy21vWN1Rdkmlps8hs2TSyibMoMAMOloyPuJXBijHDYtTLLbvAgfFdgm/otZw24uxa51ij2jL2yNyIt06v9HLxTGa1pJPlL7x32B3SeRl35fogWETFD8+V0TMiIfKKHnP+ciFBVMw9hzssTYdab2hW0q2JE1YIwMoV7AHOMDIxjXbmIzHBVR7bytcmE5TH9nsktm9QPGYtHh4rga9O0E4gX8L32OymYT5wVtwQ3EytSq7pB43yXfl9GaUbgxHWOs+Uuh/5jq6BcDdZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 104.40.229.156) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=arri.de; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=arri.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXWMiZfrcgTqxt6J5ZFVc6bvXEDD0r9LvBA0cSrN7yo=;
 b=H23oNtsw9aQShswqmE6MHvTT9O2twQNsGt7G4aYjh6A6qy+beggXXG0Q+SIst/6Idfyep9fj2k550FSRyAzNK9p2wHb5Ge8z8hYD+jFy46K4TYUbZ1Z2kPNbhwrIKVjzs7tVK13CxJeqxr/IGnV4N+vtogbqLyyPvTM3oeybFHY=
Received: from DB6PR0301CA0089.eurprd03.prod.outlook.com (2603:10a6:6:30::36)
 by DBBPR07MB7642.eurprd07.prod.outlook.com (2603:10a6:10:1ef::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 16:08:25 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:6:30:cafe::5a) by DB6PR0301CA0089.outlook.office365.com
 (2603:10a6:6:30::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.10 via Frontend Transport; Fri,
 6 Dec 2024 16:08:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 104.40.229.156)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arri.de;
Received-SPF: Pass (protection.outlook.com: domain of arri.de designates
 104.40.229.156 as permitted sender) receiver=protection.outlook.com;
 client-ip=104.40.229.156; helo=eu1.smtp.exclaimer.net; pr=C
Received: from eu1.smtp.exclaimer.net (104.40.229.156) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Fri, 6 Dec 2024 16:08:24 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (104.47.11.237)
	 by eu1.smtp.exclaimer.net (104.40.229.156) with Exclaimer Signature Manager
	 ESMTP Proxy eu1.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_DIFFIEHELLMAN_WITH_AES256_NONE); Fri, 6 Dec 2024 16:08:24
	 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 5997096
X-ExclaimerImprintLatency: 2640196
X-ExclaimerImprintAction: 8b22fba192ed44c69a0d332d218eaf06
Received: from DB3PR06CA0003.eurprd06.prod.outlook.com (2603:10a6:8:1::16) by
 VI1PR0701MB6816.eurprd07.prod.outlook.com (2603:10a6:800:19e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 16:08:19 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:8:1:cafe::5d) by DB3PR06CA0003.outlook.office365.com
 (2603:10a6:8:1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.9 via Frontend Transport; Fri, 6
 Dec 2024 16:08:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Fri, 6 Dec 2024 16:08:17 +0000
Received: from n9w6sw14.localnet (192.168.54.21) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.38; Fri, 6 Dec
 2024 17:08:16 +0100
From: Christian Eggers <ceggers@arri.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: <Joakim.Tjernlund@infinera.com>
Subject: Re: [OE-core] multiple toolchains in SDK?
Date: Fri, 6 Dec 2024 17:08:16 +0100
Message-ID: <2184595.9o76ZdvQCi@n9w6sw14>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <fbe1fa4c9130903dea41d988dac28af5ccca9de1.camel@infinera.com>
References: <fbe1fa4c9130903dea41d988dac28af5ccca9de1.camel@infinera.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.21]
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: 
	DB1PEPF000509ED:EE_|VI1PR0701MB6816:EE_|DB1PEPF000509EF:EE_|DBBPR07MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: d0fdea86-eb6c-47f9-287d-08dd16103691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?scdwNTUK7SN+gm6FXuH11HDFCZIucLETVXUOuwUk0RwTa8vdPyZY5GDPdNxD?=
 =?us-ascii?Q?dbLxuMLH0XqfO1eL2B6jbiHFZ0fy7U3ONDdz4KGFb9y0pHpb4hCwOnspDMm0?=
 =?us-ascii?Q?wmGxQhhnXC7m1yrABqf7donNQJWz/sxszOHFbgz+n6xjYyCcaZA8FC/mtEkW?=
 =?us-ascii?Q?qVhX2tYj+JWD9oB3y7YPwdLHAIMlFuM2UXKJPc1UWHw8M2at1ygom33Qjnsi?=
 =?us-ascii?Q?WDcKdLxzPWZl0Ul3IlrJWuEjIfVkfgvOwFwWTgyshLOMM3FzXAC6LpN6loJc?=
 =?us-ascii?Q?y9QUYEMrOY8odstmRffMNsm6EnlP/NsnQakjtN13zCVWcuB6A4Y2Hq0FyrZI?=
 =?us-ascii?Q?p2slmPjDNHvTMHhIsXEHN+C7TZo6g77kvVzfz1jnu6cqGX3AGN3Rggi9qDuN?=
 =?us-ascii?Q?7V+Z6krXTlvaGnRQ1AI4oNMc01ErqgQ25DHVGX0DSnnZZE6VtQ5h8nD8bd/i?=
 =?us-ascii?Q?bPyN3wbVoCiVvvp5tmuhC6I/NvUCVZKwsf42GnwZPuwCSQ1pRNQaR03qml0B?=
 =?us-ascii?Q?+DOCfHuhcSiH2Y1d9y3PsIJgFyO2PyTqyNIQaBc3+pC3EZuobaxlSiM14M65?=
 =?us-ascii?Q?79TfNnRXpp2UO7UsLYs9kWyp7Yh+hMz4mZNaFvJFrSYZxdGn2Bdwbp5fnJfx?=
 =?us-ascii?Q?GXaGgOeXie4dB5QYMrnNOWXgTkfFxsKDRLllQlkvn5xXsKEoo2jV2vGsHF0a?=
 =?us-ascii?Q?kFcH+v5DQqymIvVFT3Dft2zgTqOfFrDKzYiDZ50sm9tZ3ujqUQ6Li15q851q?=
 =?us-ascii?Q?1Dp46XASgdrYn4lXt2+OUqGdb8afYLZTxBYtWVKWLd0JtTJNDqUZQ9ymjUue?=
 =?us-ascii?Q?B2VRwAo6/b2sbZs6mS7QsugVgLsC1V56RhyPm0I9PxVS/gG8nPj1YCzgVvR/?=
 =?us-ascii?Q?DSEtGuLFyepj2Mw07QSb6ZdUZfFb6qvkbqBLxs1tb5wrhOAJiBgWvUqgBxwY?=
 =?us-ascii?Q?2aCK+YArsYswCXaChVvF3Sma3zKbfg99LqNw6z2TmQY1jxNkxrzMa/RZcpIw?=
 =?us-ascii?Q?jMFyE2lprQnFLLKoq/FzZwRei5jewHj6hFPfqHBg5d8ZaeA4j8AETkxxskex?=
 =?us-ascii?Q?mZnpORe89QYKQ8+ZSQFRK6BePw7+Xdggdhg8K8Y8eMVom4tWr9t8s1hd6vQc?=
 =?us-ascii?Q?cCvEul9dedL7GbejXN6jjPClrYFOEQx0mZwogetFtvi8eLbHGg60aMAVIcXW?=
 =?us-ascii?Q?d0tvK0ISGwTJClldVsjOerSRyfP6OIXsE74HhOvVbrIk5pwv+vXBfPJsLHrw?=
 =?us-ascii?Q?HVS3GUnatlrx0+y7bNyMzIIaVJeg6sMUBDptt2mJ6sLtU6EzGDBemk5+OLLz?=
 =?us-ascii?Q?0+2/nqol/uxfbAc+3rbbOfH/aIuXZ34yo9VMpVvaICl8DVpK2qWSwamRYW1w?=
 =?us-ascii?Q?qeVGYUn5e8UN/JNlfyKGemBzAqhPIb3IcQ8rcnRdGMp5SJujasugi3mJR2wx?=
 =?us-ascii?Q?f2H3jK2ORQV4FXEBzCbQTkR6DC90T+6s?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB6816
Content-Type: multipart/alternative; boundary="=-b55wGz18Ax9z9nMKALTFHg=="
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6e231120-d6db-48e7-8a1a-08dd16103237
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|1800799024|376014|14060799003|36860700013|82310400026|8096899003|4076899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cmxSVWI5SDhHYnlMaU1TTExjNmJTR0tWMUhRVEJGSDZmVk94Q0grNHhpbnBF?=
 =?utf-8?B?NXhWcFpUL3BxTUFRWDk4RkYyMUlTb1gvMGJWQkN6KzQvT1ExeWdsV1RDUzEz?=
 =?utf-8?B?cE9IZjZGeDJ3Q25QekxnS253ZU5RZ2p5UXRGMlAwZzdnNTljemt5K25JdWlL?=
 =?utf-8?B?VHFhdG1yc01Ec0RlZmxaNmY2Z0JrQk5JU20rS3l0UEUvOVFwY0NMU2tZemYz?=
 =?utf-8?B?R2xtK2VKQUJXQkxOenFxL0dVdm5obXJib3hRNFRsMjF2dU9iOFZ5dTd2bHVD?=
 =?utf-8?B?QzNQK3FOTUpTYWxNUCsvSTA5R1pMUVJsMXJBb2MxanlOT2l2OGYxUEcxb0FH?=
 =?utf-8?B?QUkyS1BySGFXU1RzaWZvUkhrVkY5VHJBMXd0dDQ0RU90Y2tiU0s0eHI2QTJL?=
 =?utf-8?B?SlB0a0NQVENLSzMxd0VTUHZuYnZlcVplamZUaFF0Q2JIV1U2ZTZ4eWlweEZY?=
 =?utf-8?B?N3ZPSmNCd2VuRGhKTzQyRkdEb21oeDNJZURCM1hEcjV6K3NKZjdYRWtoUlB3?=
 =?utf-8?B?cjhtcFppTW5WRG9FWlJTaGtBZHY0dVJJR2gwdUEyMmRQTjQ4eVRSUGNYcVIr?=
 =?utf-8?B?WkNCaEhyM1VtT3RhMkV5YTFHamtaZTlzWFBXT3lSLzdlNXh4cE1TcXloODBR?=
 =?utf-8?B?RkFlZVdoODg1V3g0NnlxYXE2RXNzQWZweEFyR0ZrVUo0VDhsL1g2ZzlBcWVt?=
 =?utf-8?B?VVJtTXd5cjBJVWFSRDJzNG5tdWFjQ0ltN0Q2dWZaaDRsRHdMbCtTd21DdHFJ?=
 =?utf-8?B?RkVRSUFlN3JwNloyQ0pLamZiMGxIbStZS3IxUmd6SHBaaG1FQVdhZmdNZE1R?=
 =?utf-8?B?blpERkdkV2xOOCtmVkFQcE9HZzZ6ZHcyK0YzRTFBdEdyY0JvMmU4eTY4OG9G?=
 =?utf-8?B?R0VhSFBKQzdLemhxalFGU1ZJdURuLytNM0ZBUFhyM1hibWtoNmNNWnduTFdI?=
 =?utf-8?B?WkJjVGZrRXlLMlYzNDZtMTZDUTdkQ3E2ZzhPTUZIQ20xZWlFMjVZYytkeWxH?=
 =?utf-8?B?emhrdXhCb25UdzAzYnBweDBCNWpzb1EySzUrdnJUOUx6Qitlbnk2WHMyTDRE?=
 =?utf-8?B?b2NlNW9rdXlMa3dxRDJQRUlnWkxRcEQ4WFRRNHUxTHZ0ZWJueHcvVllrZW91?=
 =?utf-8?B?SW12U0JDaW55cHFCeHFSdkxDWi9aTW5SVnhDUUUydWFiRS9YdlNHckFVNG1m?=
 =?utf-8?B?Q1VEQ21jUXdWSzRpMkZ0RFZmUzl5NmVIbXgxQUFnVlBBcXJ2VWprVWtVNE9R?=
 =?utf-8?B?a1pqMC9RTUtrSHJkRWF6d3h2U0RncFpkWC93ekxXd3NKVFRtaytGUEx2TUtP?=
 =?utf-8?B?VlBSQ0VRdHpRTmorSzVKNFdhbXc1U0J0SGV5dC9zNDhwTTJaM0VUQ1NhU0FT?=
 =?utf-8?B?QkQ2MExLUGFvdjR5Qm1sRmlmbUlHNVZLamJpZUtpUDVaTDhKazRWdmpobVFz?=
 =?utf-8?B?M1ViOVdMcUluVFRRNFZTMitMVG04dDc1c0FnRllQNTljWHlUSFplTTE4cWxx?=
 =?utf-8?B?dXJNRzAxU0xaUENJcXh1ams0Und5UnA5b0Y0K21Zb2VueUdKM3B6OFRVYmdE?=
 =?utf-8?B?cjJMaXlRSGxZd1d3dHZWby9VYTRvMStGQXplRTNDZ1RtTm5aZk0rWTA1a3Bh?=
 =?utf-8?B?ZHB6SGNDSUF1cmgyWGMxRDdQMWxxYlNhdDRQSE8relhIR2tpYUZSUzJVdjA2?=
 =?utf-8?B?Ym5reGlYMVFTRjVzWmt0cytTbituQ2Z1KzVrb0VONytwcEMvM1IwZE1SQmlD?=
 =?utf-8?B?cUgzRk1Lc2ZBbkZIS2l1TlNaZ04ydHRFUVYyMnJCUnFYZjNjOE1VSnNKUStw?=
 =?utf-8?B?MWNtdDBMUTFCRGlSY1FLeUtFRWdZNStrSnVkMk5aWGxlbTBpanNEVlZyY1Ji?=
 =?utf-8?Q?bgnQctk/dAp8D?=
X-Forefront-Antispam-Report: 
	CIP:104.40.229.156;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu1.smtp.exclaimer.net;PTR:eu1.smtp.exclaimer.net;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(14060799003)(36860700013)(82310400026)(8096899003)(4076899003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 16:08:24.3498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0fdea86-eb6c-47f9-287d-08dd16103691
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[104.40.229.156];Helo=[eu1.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR07MB7642
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 16:08:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208430

--=-b55wGz18Ax9z9nMKALTFHg==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=utf-8

On Friday, 6 December 2024, 15:12:03 CET, Joakim Tjernlund via lists.openem=
bedded.org wrote:
> Trying to figure out how to build in SDK:
>  gcc-arm32-musl
> and
>  gcc-arm64-musl(or possibly gcc-arm64-newlib)

+1

We currently use ARMv7 (32 bit) with musl for our products and it is possib=
le
that we'll have to switch to ARMv8 for some derivatives in future. As we
develop multiple products in parallel, having a SDK with both compilers / l=
ibrary sets
would be great.

>=20
> without using multilib(as musl do not support multilib gcc-style), also
> the arm64 toolchain only needs to contains static libc.a
>=20
> I cannot find how to express this in Yocto/Poky. Any pointers please?
>=20
>  Jocke
>=20





_______________________________________________________
Christian=20
Eggers
Software Engineer
=E2=80=8B
ARRI
Arnold & Richter Cine Technik GmbH & Co. Betriebs KG=20
Arriweg 17,=20
83071=20
Stephanskirchen
www.arri.com=20

+49 8036 3009-3118
CEggers@arri.de

=E2=80=8B

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRA 57918
Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik Gmb=
H
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRB 54477
Gesch=C3=A4ftsf=C3=BChrer: Stefan Mairiedl; Walter Trauninger

=E2=80=8B

--=-b55wGz18Ax9z9nMKALTFHg==
Content-Type: multipart/related; boundary="=-aMXbJz+9JoyxkUbcSO6OQA=="

--=-aMXbJz+9JoyxkUbcSO6OQA==
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8" /></head><body><div>On Friday, 6 December 2024, 15:12:03 CET, Joa=
kim Tjernlund via lists.openembedded.org wrote:<br />&gt; Trying to figure =
out how to build in SDK:<br />&gt;  gcc-arm32-musl<br />&gt; and<br />&gt; =
 gcc-arm64-musl(or possibly gcc-arm64-newlib)<br /><br />+1<br /><br />We c=
urrently use ARMv7 (32 bit) with musl for our products and it is possible<b=
r />that we&#39;ll have to switch to ARMv8 for some derivatives in future. =
As we<br />develop multiple products in parallel, having a SDK with both co=
mpilers / library sets<br />would be great.<br /><br />&gt; <br />&gt; with=
out using multilib(as musl do not support multilib gcc-style), also<br />&g=
t; the arm64 toolchain only needs to contains static libc.a<br />&gt; <br /=
>&gt; I cannot find how to express this in Yocto/Poky. Any pointers please?=
<br />&gt; <br />&gt;  Jocke<br />&gt; <br /><br /><br /><br /><br /></div>=
<div dir=3D"ltr" style=3D"mso-line-height-rule:exactly;-webkit-text-size-ad=
just:100%;font-size:1px;direction:ltr;"><table dir=3D"ltr" cellpadding=3D"0=
" cellspacing=3D"0" border=3D"0" style=3D"width:100%;direction:ltr;border-c=
ollapse:collapse;font-size:1px;"><tr style=3D"font-size:0;"><td align=3D"le=
ft" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0=
" border=3D"0" style=3D"border-collapse:collapse;font-size:0;"><tr style=3D=
"font-size:0;"><td align=3D"left" style=3D"padding:0;vertical-align:top;"><=
table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"width:100%;=
border-collapse:collapse;font-size:0;"><tr style=3D"font-size:14.67px;color=
:#7F7F7F;font-style:normal;font-weight:400;white-space:nowrap;"><td align=3D=
"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;"><=
p style=3D"margin-top:0px;margin-bottom:0px;">_____________________________=
__________________________<span style=3D"font-family:remialcxesans;font-siz=
e:1px;color:#FFFFFF;line-height:1px;">&#8203;<span style=3D"font-family:&#3=
9;template-LZ3Cj7wTEei85wANOiIRuQ&#39;;">&#8203;</span><span style=3D"font-=
family:&#39;zone-1&#39;;">&#8203;</span><span style=3D"font-family:&#39;zon=
es-AQ&#39;;">&#8203;</span></span></p></td></tr><tr style=3D"font-size:0;">=
<td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" c=
ellspacing=3D"0" border=3D"0" style=3D"border-collapse:collapse;font-size:0=
;"><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:to=
p;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border=
-collapse:collapse;font-size:0;color:#7F7F7F;font-style:normal;font-weight:=
400;white-space:nowrap;"><tr style=3D"font-size:14.67px;"><td align=3D"left=
" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;"><p sty=
le=3D"margin-top:0px;margin-bottom:0px;">Christian</p></td><td align=3D"lef=
t" style=3D"vertical-align:top;color:#000001;font-family:Calibri,Arial,sans=
-serif;"><p style=3D"margin-top:0px;margin-bottom:0px;">&nbsp;<br /></p></t=
d><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,=
sans-serif;"><p style=3D"margin-top:0px;margin-bottom:0px;">Eggers</p></td>=
</tr></table></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D=
"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"=
0" style=3D"border-collapse:collapse;font-size:0;color:#7F7F7F;font-style:n=
ormal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size:14.67px;"=
><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,s=
ans-serif;"><p style=3D"margin-top:0px;margin-bottom:0px;">Software&nbsp;En=
gineer</p></td></tr><tr style=3D"font-size:14.67px;color:#000001;"><td alig=
n=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif=
;"><p style=3D"margin-top:0px;margin-bottom:0px;">&#8203;</p></td></tr></ta=
ble></td></tr></table></td></tr><tr style=3D"font-size:0;"><td align=3D"lef=
t" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0"=
 border=3D"0" style=3D"border-collapse:collapse;font-size:0;"><tr style=3D"=
font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellp=
adding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-collapse:collap=
se;font-size:0;color:#0E50AD;font-style:normal;font-weight:400;white-space:=
nowrap;"><tr style=3D"font-size:13.33px;"><td align=3D"left" style=3D"verti=
cal-align:top;font-family:&#39;Arial Black&#39;;"><p style=3D"margin-top:0p=
x;margin-bottom:0px;">ARRI</p></td></tr><tr style=3D"font-size:10.67px;colo=
r:#7F7F7F;"><td align=3D"left" style=3D"vertical-align:top;font-family:Aria=
l;"><p style=3D"margin-top:0px;margin-bottom:0px;"><span style=3D"font-size=
:11px;">Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH&nbs=
p;&amp;&nbsp;Co.&nbsp;Betriebs&nbsp;KG</span>&nbsp;<br /></p></td></tr></ta=
ble></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertic=
al-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" styl=
e=3D"border-collapse:collapse;font-size:0;color:#7F7F7F;font-style:normal;f=
ont-weight:400;white-space:nowrap;"><tr style=3D"font-size:10.67px;"><td al=
ign=3D"left" style=3D"vertical-align:top;font-family:Arial;"><p style=3D"ma=
rgin-top:0px;margin-bottom:0px;">Arriweg&nbsp;17</p></td><td align=3D"left"=
 style=3D"vertical-align:top;font-family:Arial;"><p style=3D"margin-top:0px=
;margin-bottom:0px;">,&nbsp;<br /></p></td><td align=3D"left" style=3D"vert=
ical-align:middle;font-family:Arial;"><p style=3D"margin-top:0px;margin-bot=
tom:0px;">83071</p></td><td align=3D"left" style=3D"vertical-align:middle;f=
ont-family:Arial;"><p style=3D"margin-top:0px;margin-bottom:0px;">&nbsp;<br=
 /></p></td><td align=3D"left" style=3D"vertical-align:middle;font-family:A=
rial;"><p style=3D"margin-top:0px;margin-bottom:0px;">Stephanskirchen</p></=
td></tr></table></td></tr></table></td></tr><tr style=3D"font-size:0;"><td =
align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cells=
pacing=3D"0" border=3D"0" style=3D"border-collapse:collapse;font-size:0;"><=
tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;">=
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-col=
lapse:collapse;font-size:0;color:#1532B9;font-style:normal;font-weight:400;=
white-space:nowrap;"><tr style=3D"font-size:11px;"><td align=3D"left" style=
=3D"vertical-align:top;font-family:Arial;"><p style=3D"margin-top:0px;margi=
n-bottom:0px;"><span style=3D"text-decoration:underline;"><a href=3D"http:/=
/www.arri.com/" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decorati=
on:underline;color:#1532B9;">www.arri.com&nbsp;<br /><br /></a></span></p><=
/td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-al=
ign:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"=
border-collapse:collapse;font-size:0;color:#858080;font-style:normal;font-w=
eight:400;line-height:normal;white-space:nowrap;"><tr style=3D"font-size:14=
.67px;"><td align=3D"left" style=3D"padding:0;vertical-align:top;font-size:=
0;"><p style=3D"margin-top:0px;margin-bottom:0px;"><img src=3D"cid:image895=
117.png@6B12B797.13EF4F6E" width=3D"20" height=3D"20" border=3D"0" alt=3D""=
 style=3D"width:20px;min-width:20px;max-width:20px;height:20px;min-height:2=
0px;max-height:20px;font-size:0;" /></p></td><td align=3D"left" style=3D"pa=
dding:0;vertical-align:top;font-family:Calibri,Arial,sans-serif;"><p style=3D=
"margin-top:0px;margin-bottom:0px;"><a href=3D"tel:+49%208036%203009-3118" =
target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:none;color:#8=
58080;">+49&nbsp;8036&nbsp;3009-3118</a></p></td></tr><tr style=3D"font-siz=
e:0;"><td align=3D"left" style=3D"padding:0;vertical-align:top;"></td><td a=
lign=3D"left" style=3D"padding:0;vertical-align:top;"></td></tr><tr style=3D=
"font-size:0;"><td align=3D"left" style=3D"padding:0;vertical-align:top;"><=
/td><td align=3D"left" style=3D"padding:0;vertical-align:top;"></td></tr><t=
r style=3D"font-size:14.67px;"><td align=3D"left" style=3D"padding:0;vertic=
al-align:top;font-size:0;"><p style=3D"margin-top:0px;margin-bottom:0px;"><=
img src=3D"cid:image874737.png@FFF4299A.EDE3391B" width=3D"20" height=3D"20=
" border=3D"0" alt=3D"" style=3D"width:20px;min-width:20px;max-width:20px;h=
eight:20px;min-height:20px;max-height:20px;font-size:0;" /></p></td><td ali=
gn=3D"left" style=3D"padding:0;vertical-align:top;font-family:Calibri,Arial=
,sans-serif;"><p style=3D"margin-top:0px;margin-bottom:0px;"><a href=3D"mai=
lto:CEggers@arri.de" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-dec=
oration:none;color:#858080;">CEggers@arri.de</a></p></td></tr></table></td>=
</tr></table></td></tr></table></td></tr><tr style=3D"font-size:14.67px;col=
or:#000001;font-style:normal;font-weight:400;white-space:nowrap;"><td align=
=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;=
"><p style=3D"margin-top:0px;margin-bottom:0px;"><br />&#8203;</p></td></tr=
></table></td></tr><tr style=3D"font-size:0;line-height:normal;"><td align=3D=
"left" style=3D"padding:0;vertical-align:top;"><p style=3D"margin-top:0px;m=
argin-bottom:0px;"><a href=3D"https://www.arrirental.com/en/cameras/digital=
-65-mm-cameras/alexa-265?utm_source=3DARRI&amp;utm_medium=3Demail&amp;utm_c=
ampaign=3Dalexa-265-launch&amp;utm_content=3DtrafficAll" target=3D"_blank" =
id=3D"LPlnk689713" style=3D"text-decoration:none;"><img src=3D"cid:image408=
484.jpg@995CE312.9B2133B2" width=3D"650" height=3D"95" border=3D"0" title=3D=
"ALEXA 265" alt=3D"ALEXA 265" style=3D"width:650px;min-width:650px;max-widt=
h:650px;height:95px;min-height:95px;max-height:95px;font-size:12px;" /></a>=
</p></td></tr><tr style=3D"font-size:14.67px;color:#000001;font-style:norma=
l;font-weight:400;white-space:nowrap;"><td align=3D"left" style=3D"padding:=
0;vertical-align:top;font-family:Calibri,Arial,sans-serif;"><p style=3D"mar=
gin-top:0px;margin-bottom:0px;"><br /></p></td></tr><tr style=3D"font-size:=
0;"><td align=3D"left" style=3D"padding:0;vertical-align:top;"><table cellp=
adding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-collapse:collap=
se;font-size:0;color:#6A6A6A;font-style:normal;font-weight:400;white-space:=
nowrap;"><tr style=3D"font-size:10px;"><td align=3D"left" style=3D"vertical=
-align:top;font-family:Arial;"><p style=3D"margin-top:0px;margin-bottom:0px=
;">Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH&nbsp;&am=
p;&nbsp;Co.&nbsp;Betriebs&nbsp;KG<br />Sitz:&nbsp;M&#252;nchen&nbsp;=E2=80=91=
&nbsp;Registergericht:&nbsp;Amtsgericht&nbsp;M&#252;nchen&nbsp;=E2=80=91&nb=
sp;Handelsregisternummer:&nbsp;HRA&nbsp;57918<br />Pers&#246;nlich&nbsp;haf=
tender&nbsp;Gesellschafter:&nbsp;Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&n=
bsp;Technik&nbsp;GmbH<br />Sitz:&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Regi=
stergericht:&nbsp;Amtsgericht&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Handels=
registernummer:&nbsp;HRB&nbsp;54477<br />Gesch&#228;ftsf&#252;hrer:&nbsp;St=
efan&nbsp;Mairiedl;&nbsp;Walter&nbsp;Trauninger<br /></p></td></tr><tr styl=
e=3D"font-size:14.67px;color:#000001;"><td align=3D"left" style=3D"vertical=
-align:top;font-family:Calibri,Arial,sans-serif;"><p style=3D"margin-top:0p=
x;margin-bottom:0px;"><br />&#8203;<br /></p></td></tr></table></td></tr></=
table></td></tr></table></div></body></html>=

--=-aMXbJz+9JoyxkUbcSO6OQA==
Content-Type: image/png; name=image895117.png
Content-Transfer-Encoding: base64
Content-ID: <image895117.png@6B12B797.13EF4F6E>
Content-Description: image895117.png
Content-Disposition: inline; creation-date="Fri, 06 Dec 2024 16:08:24 +0000";
	filename=image895117.png;
	modification-date="Fri, 06 Dec 2024 16:08:24 +0000"; size=528

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGlSURBVDhP1ZOxSgNBEIZ3o6QSSWGRwiJFCl9A
iCDEIqKFgo2FYGHjA1hYRZ0sGrURgq0WgkoqEUHQShJMYWFhmcLCwsIHsJBEs/5zmTvvJIE9sPGD
Zf7Zu/tvdndW/TVaogcRDSWVKlilMhvGVGQ6FoEhzAaTWt9AFji31q7C9Jh1HBISFSpbQPDMGK31
NlcsqTOBIRxmRPmkUTGJdubHUKmsxDA5ic6EDV8k+jRa1i6KdiYw/LL2QiTzDrNpY8yb5M4EhlvG
XKNdniXl9pkTHYvwkrlXDkTxIR3tEWUkcyZi2FbqBOGxm6lUR+tT7k/JnYgYYs8+sHfzkP7eTaJ1
LmGaktyjTDSGsSxphMjV89khyqGx7yG96rC3r7g5S5vGNHaJsrb7LI3RwPw6btQDv8f0NGRwTWYT
Wlch/eo+Mc5gPoWPfu9tpVgqrbGIHkoIVHOLQ5qAQVOmuNqVHma8guDK9jVkisY029aOQ/JhcYU9
wbLPRaoBiX2p1+utu1rtqpDPV9FKHVQziiqH5fETzMr40yHe68hcfPaJRnHyI5L+K5T6BsZ9gKi6
xb3hAAAAAElFTkSuQmCC

--=-aMXbJz+9JoyxkUbcSO6OQA==
Content-Type: image/png; name=image874737.png
Content-Transfer-Encoding: base64
Content-ID: <image874737.png@FFF4299A.EDE3391B>
Content-Description: image874737.png
Content-Disposition: inline; creation-date="Fri, 06 Dec 2024 16:08:24 +0000";
	filename=image874737.png;
	modification-date="Fri, 06 Dec 2024 16:08:24 +0000"; size=824

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALNSURBVDhPtZQ/SNVRFMfv1Z/S4PCGBoeg1Uih
oaFB8j1wMGgweBJBgUNRUQ2BQaH2e79SaKipwcGhlkioQEiooT++7RUOBkYODg0GgiIOLyi1bp/v
/d3fL8U31hfuO/ec3z3nfM895z7zr2GDbIg4jgutxvQ6Yw5IRy5uGzOfJMmKP9AADQMSaH+LtQ/5
WEaNUutfEHj5t3OXbyfJTDDl2BNwPI7LxtoJthFOD5A1WM0hf7QY04FDB98vohdZjzeduwbjOnuP
piA9QrBnMJjl4KHRJBmD3hJlF5HdW8Z8HU6SqeFKpeScu4BLmUoepd4pcoYqs9XaLwo2UqkMoEfo
YjrIysreNs6dI+kk515b516wf4ptgETPdSBnqDtDRFuUIJ1g0s/jOE3pJ7TQZ30AY9pg4tmyn8E2
AYE29mlmdVMNwInrSFbG4vgq5kvY7lHeLZ0ROFcj0SrbCFYfZNM9N1n7XveLOucZajQQCl6TTsYr
MFv66dyo1wNItoFQg4QF/dAwL0GnfnxAnP2cqZu6S3WSD1MEwLQbnFVpdcpdlM6ZNcSatfaw9Cyg
2Ml5G7bd3ubcJ8md0D2RTEzmU0uOPLEPyM8yIiLqEYIXZMtY7wTJhsI2K1tJ2hHtEPgs3QfcVPdS
HGP5UijhtGSGO3F8EuOw9pmzGNOkSbYbkHkjGxWkGK9UXsGqk7Hp4tBLTN3oU2RcQvahH0VO49DP
XgxF4iyr8Is5zJ6hZyg08TY5XCDY3WbnzgTnMnKEz5FeBgN/ijG5gW1fSKLh7tr5pnOGguaPUjXQ
93l6GhlddlsYl13gmfZzVTXNbTB5NAfp8a5a/Vjq6flO0JsM6yD3sspaf1utruu77qy3WDzeWyo9
4T6HKO8bPunsBuximIHs+kfRo1eThA1KrHM46/w8pV/nzyNrZo6GATNwBRqjPtgeRK2H7i6MJEk+
Nv8ZxvwBPgIhrepF7fMAAAAASUVORK5CYII=

--=-aMXbJz+9JoyxkUbcSO6OQA==
Content-Type: image/jpeg; name=image408484.jpg
Content-Transfer-Encoding: base64
Content-ID: <image408484.jpg@995CE312.9B2133B2>
Content-Description: image408484.jpg
Content-Disposition: inline; creation-date="Fri, 06 Dec 2024 16:08:24 +0000";
	filename=image408484.jpg;
	modification-date="Fri, 06 Dec 2024 16:08:24 +0000"; size=56831

/9j/4AAQSkZJRgABAgEASABIAAD/7QAsUGhvdG9zaG9wIDMuMAA4QklNA+0AAAAAABAASAAAAAEA
AQBIAAAAAQAB/+IMWElDQ19QUk9GSUxFAAEBAAAMSExpbm8CEAAAbW50clJHQiBYWVogB84AAgAJ
AAYAMQAAYWNzcE1TRlQAAAAASUVDIHNSR0IAAAAAAAAAAAAAAAAAAPbWAAEAAAAA0y1IUCAgAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAARY3BydAAAAVAAAAAz
ZGVzYwAAAYQAAABsd3RwdAAAAfAAAAAUYmtwdAAAAgQAAAAUclhZWgAAAhgAAAAUZ1hZWgAAAiwA
AAAUYlhZWgAAAkAAAAAUZG1uZAAAAlQAAABwZG1kZAAAAsQAAACIdnVlZAAAA0wAAACGdmlldwAA
A9QAAAAkbHVtaQAAA/gAAAAUbWVhcwAABAwAAAAkdGVjaAAABDAAAAAMclRSQwAABDwAAAgMZ1RS
QwAABDwAAAgMYlRSQwAABDwAAAgMdGV4dAAAAABDb3B5cmlnaHQgKGMpIDE5OTggSGV3bGV0dC1Q
YWNrYXJkIENvbXBhbnkAAGRlc2MAAAAAAAAAEnNSR0IgSUVDNjE5NjYtMi4xAAAAAAAAAAAAAAAS
c1JHQiBJRUM2MTk2Ni0yLjEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAFhZWiAAAAAAAADzUQABAAAAARbMWFlaIAAAAAAAAAAAAAAAAAAAAABYWVogAAAA
AAAAb6IAADj1AAADkFhZWiAAAAAAAABimQAAt4UAABjaWFlaIAAAAAAAACSgAAAPhAAAts9kZXNj
AAAAAAAAABZJRUMgaHR0cDovL3d3dy5pZWMuY2gAAAAAAAAAAAAAABZJRUMgaHR0cDovL3d3dy5p
ZWMuY2gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAZGVzYwAA
AAAAAAAuSUVDIDYxOTY2LTIuMSBEZWZhdWx0IFJHQiBjb2xvdXIgc3BhY2UgLSBzUkdCAAAAAAAA
AAAAAAAuSUVDIDYxOTY2LTIuMSBEZWZhdWx0IFJHQiBjb2xvdXIgc3BhY2UgLSBzUkdCAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAGRlc2MAAAAAAAAALFJlZmVyZW5jZSBWaWV3aW5nIENvbmRpdGlvbiBp
biBJRUM2MTk2Ni0yLjEAAAAAAAAAAAAAACxSZWZlcmVuY2UgVmlld2luZyBDb25kaXRpb24gaW4g
SUVDNjE5NjYtMi4xAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB2aWV3AAAAAAATpP4AFF8uABDP
FAAD7cwABBMLAANcngAAAAFYWVogAAAAAABMCVYAUAAAAFcf521lYXMAAAAAAAAAAQAAAAAAAAAA
AAAAAAAAAAAAAAKPAAAAAnNpZyAAAAAAQ1JUIGN1cnYAAAAAAAAEAAAAAAUACgAPABQAGQAeACMA
KAAtADIANwA7AEAARQBKAE8AVABZAF4AYwBoAG0AcgB3AHwAgQCGAIsAkACVAJoAnwCkAKkArgCy
ALcAvADBAMYAywDQANUA2wDgAOUA6wDwAPYA+wEBAQcBDQETARkBHwElASsBMgE4AT4BRQFMAVIB
WQFgAWcBbgF1AXwBgwGLAZIBmgGhAakBsQG5AcEByQHRAdkB4QHpAfIB+gIDAgwCFAIdAiYCLwI4
AkECSwJUAl0CZwJxAnoChAKOApgCogKsArYCwQLLAtUC4ALrAvUDAAMLAxYDIQMtAzgDQwNPA1oD
ZgNyA34DigOWA6IDrgO6A8cD0wPgA+wD+QQGBBMEIAQtBDsESARVBGMEcQR+BIwEmgSoBLYExATT
BOEE8AT+BQ0FHAUrBToFSQVYBWcFdwWGBZYFpgW1BcUF1QXlBfYGBgYWBicGNwZIBlkGagZ7BowG
nQavBsAG0QbjBvUHBwcZBysHPQdPB2EHdAeGB5kHrAe/B9IH5Qf4CAsIHwgyCEYIWghuCIIIlgiq
CL4I0gjnCPsJEAklCToJTwlkCXkJjwmkCboJzwnlCfsKEQonCj0KVApqCoEKmAquCsUK3ArzCwsL
Igs5C1ELaQuAC5gLsAvIC+EL+QwSDCoMQwxcDHUMjgynDMAM2QzzDQ0NJg1ADVoNdA2ODakNww3e
DfgOEw4uDkkOZA5/DpsOtg7SDu4PCQ8lD0EPXg96D5YPsw/PD+wQCRAmEEMQYRB+EJsQuRDXEPUR
ExExEU8RbRGMEaoRyRHoEgcSJhJFEmQShBKjEsMS4xMDEyMTQxNjE4MTpBPFE+UUBhQnFEkUahSL
FK0UzhTwFRIVNBVWFXgVmxW9FeAWAxYmFkkWbBaPFrIW1hb6Fx0XQRdlF4kXrhfSF/cYGxhAGGUY
ihivGNUY+hkgGUUZaxmRGbcZ3RoEGioaURp3Gp4axRrsGxQbOxtjG4obshvaHAIcKhxSHHscoxzM
HPUdHh1HHXAdmR3DHeweFh5AHmoelB6+HukfEx8+H2kflB+/H+ogFSBBIGwgmCDEIPAhHCFIIXUh
oSHOIfsiJyJVIoIiryLdIwojOCNmI5QjwiPwJB8kTSR8JKsk2iUJJTglaCWXJccl9yYnJlcmhya3
JugnGCdJJ3onqyfcKA0oPyhxKKIo1CkGKTgpaymdKdAqAio1KmgqmyrPKwIrNitpK50r0SwFLDks
biyiLNctDC1BLXYtqy3hLhYuTC6CLrcu7i8kL1ovkS/HL/4wNTBsMKQw2zESMUoxgjG6MfIyKjJj
Mpsy1DMNM0YzfzO4M/E0KzRlNJ402DUTNU01hzXCNf02NzZyNq426TckN2A3nDfXOBQ4UDiMOMg5
BTlCOX85vDn5OjY6dDqyOu87LTtrO6o76DwnPGU8pDzjPSI9YT2hPeA+ID5gPqA+4D8hP2E/oj/i
QCNAZECmQOdBKUFqQaxB7kIwQnJCtUL3QzpDfUPARANER0SKRM5FEkVVRZpF3kYiRmdGq0bwRzVH
e0fASAVIS0iRSNdJHUljSalJ8Eo3Sn1KxEsMS1NLmkviTCpMcky6TQJNSk2TTdxOJU5uTrdPAE9J
T5NP3VAnUHFQu1EGUVBRm1HmUjFSfFLHUxNTX1OqU/ZUQlSPVNtVKFV1VcJWD1ZcVqlW91dEV5JX
4FgvWH1Yy1kaWWlZuFoHWlZaplr1W0VblVvlXDVchlzWXSddeF3JXhpebF69Xw9fYV+zYAVgV2Cq
YPxhT2GiYfViSWKcYvBjQ2OXY+tkQGSUZOllPWWSZedmPWaSZuhnPWeTZ+loP2iWaOxpQ2maafFq
SGqfavdrT2una/9sV2yvbQhtYG25bhJua27Ebx5veG/RcCtwhnDgcTpxlXHwcktypnMBc11zuHQU
dHB0zHUodYV14XY+dpt2+HdWd7N4EXhueMx5KnmJeed6RnqlewR7Y3vCfCF8gXzhfUF9oX4BfmJ+
wn8jf4R/5YBHgKiBCoFrgc2CMIKSgvSDV4O6hB2EgITjhUeFq4YOhnKG14c7h5+IBIhpiM6JM4mZ
if6KZIrKizCLlov8jGOMyo0xjZiN/45mjs6PNo+ekAaQbpDWkT+RqJIRknqS45NNk7aUIJSKlPSV
X5XJljSWn5cKl3WX4JhMmLiZJJmQmfyaaJrVm0Kbr5wcnImc951kndKeQJ6unx2fi5/6oGmg2KFH
obaiJqKWowajdqPmpFakx6U4pammGqaLpv2nbqfgqFKoxKk3qamqHKqPqwKrdavprFys0K1Erbiu
La6hrxavi7AAsHWw6rFgsdayS7LCszizrrQltJy1E7WKtgG2ebbwt2i34LhZuNG5SrnCuju6tbsu
u6e8IbybvRW9j74KvoS+/796v/XAcMDswWfB48JfwtvDWMPUxFHEzsVLxcjGRsbDx0HHv8g9yLzJ
Osm5yjjKt8s2y7bMNcy1zTXNtc42zrbPN8+40DnQutE80b7SP9LB00TTxtRJ1MvVTtXR1lXW2Ndc
1+DYZNjo2WzZ8dp22vvbgNwF3IrdEN2W3hzeot8p36/gNuC94UThzOJT4tvjY+Pr5HPk/OWE5g3m
lucf56noMui86Ubp0Opb6uXrcOv77IbtEe2c7ijutO9A78zwWPDl8XLx//KM8xnzp/Q09ML1UPXe
9m32+/eK+Bn4qPk4+cf6V/rn+3f8B/yY/Sn9uv5L/tz/bf///+4AE0Fkb2JlAGQAAAAAAQUAAklE
/9sAhAACAgIDAgMDAwMDBQQEBAUFBQUFBQUHBgYGBgYHCAcICAgIBwgJCgoKCgoJCwwMDAwLDAwM
DAwMDAwMDAwMDAwMAQMEBAoFCg8KCg8PDg4ODw8ODg4ODw8MDg4ODA8PDBEREREMDwwREREREQwR
ERERERERERERERERERERERERERH/wAARCAC+BRQDAREAAhEBAxEB/8QBogAAAAcBAQEBAQAAAAAA
AAAABAUDAgYBAAcICQoLAQACAgMBAQEBAQAAAAAAAAABAAIDBAUGBwgJCgsQAAIBAwMCBAIGBwME
AgYCcwECAxEEAAUhEjFBUQYTYSJxgRQykaEHFbFCI8FS0eEzFmLwJHKC8SVDNFOSorJjc8I1RCeT
o7M2F1RkdMPS4ggmgwkKGBmElEVGpLRW01UoGvLj88TU5PRldYWVpbXF1eX1ZnaGlqa2xtbm9jdH
V2d3h5ent8fX5/c4SFhoeIiYqLjI2Oj4KTlJWWl5iZmpucnZ6fkqOkpaanqKmqq6ytrq+hEAAgIB
AgMFBQQFBgQIAwNtAQACEQMEIRIxQQVRE2EiBnGBkTKhsfAUwdHhI0IVUmJy8TMkNEOCFpJTJaJj
ssIHc9I14kSDF1STCAkKGBkmNkUaJ2R0VTfyo7PDKCnT4/OElKS0xNTk9GV1hZWltcXV5fVGVmZ2
hpamtsbW5vZHV2d3h5ent8fX5/c4SFhoeIiYqLjI2Oj4OUlZaXmJmam5ydnp+So6SlpqeoqaqrrK
2ur6/9oADAMBAAIRAxEAPwD5l8vfPRXjHc8Vdy98bV3L3xV3PFXcsVdy98bV3LFXcsFq7l74Vdyw
K7l74bVvljatcvfFXc8VdzxV3L3xtXcvfFXcvfFW+XvirXL3xtXcvfFXcsVb5YFa5e+FXcsbV3L3
xtXcvfFXcvfFXcvfG1cWxV3L3xV3L3xV3L3xtXcvfFXcvfG1b5Yq7lgtXcsVb5Y2ruWFW+WC1brj
aruWNq7ljarsbV1cbVuuKo233gvz/wAUN+JGaXtU+ge92eg+o+5L7ccYYfdB+s49lH0H3rrx6h7l
Wubl1jXLFWq4VdXG1axtXVxtW642rWNq7G1djatVxVrlirXLDatcvfFWuWKtcsVdyxtWuWC1dyw2
ruWKu5Y2rXL3wWrufvhV3P3xVkemWsVpD+kr0VjBpDF3lcf8ajv/AJ1y8UBEccvgO91moynIfDhz
/iP80frSe9v5dQmeaZ+TN9wHYD2GY88hmbLm4cIxR4YoTl75Budy98Vdy98VdzxVEWlvPfzRW9tC
800rBI440Lu7HYBVUEknwGAmk82YHRtM8ub63cG4uh/0r7ORSVPYT3A5InuiB36qxibK+Iy5fNnV
c0BqHnG+u4HsrYR2Fk+xtbNTFG4HT1WqZJiOxldyOxwiAG/NBkxbl75Ywdy98bV3LFXcvfBau5e+
FXc8Vdy98bV3L3xV3PFUVZ6hcadNHc2lxJBNGQySROUdT4qykEH5YCLSDTLh5ostaBTX7EPI3/H/
AGirFdA+MibRTe/ILIx6y5Xwkcvkz4r5oHU/LEtrbtqFhcJqGnggG4hBBiJNAs8TfHEx6Co4MfsO
9K4RPodigxYry98sYO5e+Ku5e+Nq7l742ruXvirINK1KJ4zYXxrbyH4X7wv2Ye3iMysWQEcMuX3O
t1OAg+JD6hzH84dyW6hZS6bM0MvUbhh0ZT0I9jlOSBgaLl4MwzR4h/YgeWVt7uXviruXviruXvir
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
/9k=

--=-aMXbJz+9JoyxkUbcSO6OQA==--

--=-b55wGz18Ax9z9nMKALTFHg==--

