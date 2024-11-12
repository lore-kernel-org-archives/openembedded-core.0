Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B41CD32D92
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 11:02:37 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.74])
 by mx.groups.io with SMTP id smtpd.web10.84045.1731409346640242639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 03:02:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kaViCMdV;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kaViCMdV;
 spf=pass (domain: arm.com, ip: 40.107.22.74, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sbi7NhmHplM1aUWpItA2V2VqHLuqIWVuEUhj6q3FPRnv9hKdDbWY76ITfZ3Lp3FuySBn0nCs13ksiOx2ZZGnNW5QpX9M+l4n+tMAgQkW604OanNUtemKTImk5LhAlwysD1ULy6qnrOawZJ95NxciptN6/eBAn2cF8KtqnPs9MKXXbWKaU0cIDqPsORaYjlyQHwgVGISKvoTABoHfMsex4AgFxRaoELNU0D6ewmRXClhfjBfE3gn1euPjZ2Onr+ZjyFSuczYYtLtPqEHECMM+chl86BnBYzfusRRQG1V8BesDRbI2D98gphlQOmyBBOfe2OOfH+V9T0gd9A9SqCvnHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6WCqn6FDMsRrVf2YpQXKV3q7r0fIlF8H2pdBix9Aqw=;
 b=FUzQZCC8Xz4uaeoRwtO7T3SX9QjsqgskwEpFG4Dv69vszuBvangAdvF1ShEtRV49rAq8/brV0QI03jxbm2na4m2z6IIKGXjsQ1gGXR5K4nB4kHDRiITUgIuSUcXoG1kUMu9yimbiK1+cigAYONebVJghcotjxV/ldu6J67GSC6kzT2JAfi8C5zv5kc81hwXGlny0GA18jedURe3M2VeG+j/Q/fhdUpnnMI0NlzVX5vr5fI/zjZZtvKKoalmpHpxlHj4nGCQj25tf6Fn4zcd1d8w9U5jTiuYmSTrscDPlGIZJT3/g9itSCjyzDkfKtQoQEzbJ7UtJvJs5aIJnaq9X8g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6WCqn6FDMsRrVf2YpQXKV3q7r0fIlF8H2pdBix9Aqw=;
 b=kaViCMdVe2hWsAFZN79Y7HUhZypqqonQ6VeVFbXDKd2vahCOgEgUXRAsFm7PP3ul7udpbrKkA8vgrp2lS5WsItDjZLguEbL/mo630V8VuXIImShf52M6t795bi49105Hsa1oRF7cjBWhYb8MCbYkUWmiwxvCbB4W31C9xuSm1vA=
Received: from DU2PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:10:3b::9) by
 FRZPR08MB10966.eurprd08.prod.outlook.com (2603:10a6:d10:135::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.25; Tue, 12 Nov
 2024 11:02:23 +0000
Received: from DU2PEPF00028D0A.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::6d) by DU2PR04CA0004.outlook.office365.com
 (2603:10a6:10:3b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Tue, 12 Nov 2024 11:02:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D0A.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Tue, 12 Nov 2024 11:02:22 +0000
Received: ("Tessian outbound 3a0c19083709:v490"); Tue, 12 Nov 2024 11:02:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bcfeb6acc65b2b8d
X-TessianGatewayMetadata: t0iADcCROcnuu+xqaH5G9f8sHqZbIgA1IuSd5ba0qaM6HrdTp5xDwwq8OgqNeLkQNpcJ6TgKXP2TNukeTau0hC8hAiOhs58B8eGGsQ+NEFCgJvetdU+mv2WKMXPbUhd5ZgxriTmh5+lr17qrMymYJgWQUyIqpamE1Z41GQpi8rE=
X-CR-MTA-TID: 64aa7808
Received: from L2187b073c330.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 22144D5C-DE99-4D46-B74A-4398092C70D6.1;
	Tue, 12 Nov 2024 11:02:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L2187b073c330.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 12 Nov 2024 11:02:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RG5KrF5gu189sADhiFwUZQmLanRpziiyVHy2jLeMvxR1E2PcMs/BIF0sA5BLWN/HRoKTbewnk/A6ikZlgx6pGOplp29tWbpdnLlWC9u1CYYFV2IK9IQ4ZyIVcz8rWLof8CdXM3LOuRp2axzQTZsH2BYi88jawmQXPg3CDBgzILolzj2nbfQAfl2hAt2nwV5APlfS28GiTfxzJrw5GPuNIc/cZ4lbFVUr1hCVt0LKkukaMUPRAzTU3w9rb3CO1FeQWf++MwGWiaFgP7QoaDLZjHbfNxe0YlBIN4fd26G+QgT3kGt/lXeWol7ufIF1x30rEJ9qyucTCK7+4/8JpFFQIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6WCqn6FDMsRrVf2YpQXKV3q7r0fIlF8H2pdBix9Aqw=;
 b=PTX2S5ItC8h7B6qQmUDgIdEgFjV79Ar6TbebtIeVCmm5/+E4RCP3c+xG0eKr0zaDpmj+uLYbGWR2LyomjD1z/zgl08Iq3VHECI5PXTh/NT9RGk9TJFcZyrb7NrE5BjRJVWBuEEN6wBSkp5gz/vMyRry/rGM9YTbwdoQUXxQ0Y1yAECfSEGlJ7bxXvS7g/uVb4Ww2fpWpjOsVF2hiFf8yNoZDGN5iYHHSwYXOWFbvN9kPrwK8j5bt0vKcrKCEBjwMinswQrNckez2tAwY8XLH3rqj1JbZfimXxoQlGL50qStmm4ypHp29aWkDVd5tjd4ZiyxeIv4zrnigvFNhwcDj5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6WCqn6FDMsRrVf2YpQXKV3q7r0fIlF8H2pdBix9Aqw=;
 b=kaViCMdVe2hWsAFZN79Y7HUhZypqqonQ6VeVFbXDKd2vahCOgEgUXRAsFm7PP3ul7udpbrKkA8vgrp2lS5WsItDjZLguEbL/mo630V8VuXIImShf52M6t795bi49105Hsa1oRF7cjBWhYb8MCbYkUWmiwxvCbB4W31C9xuSm1vA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB7441.eurprd08.prod.outlook.com (2603:10a6:102:2b9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 11:02:13 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8137.022; Tue, 12 Nov 2024
 11:02:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "liezhi.yang@windriver.com" <liezhi.yang@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] bootchart2: Fix native build
Thread-Topic: [OE-core] [PATCH 1/1] bootchart2: Fix native build
Thread-Index: AQHbNFW2Xegk3DnFA0WdUhu1zyEVn7Kze+8A
Date: Tue, 12 Nov 2024 11:02:13 +0000
Message-ID: <6591CDFE-6ACD-4BD8-9C3D-D8F59C009D17@arm.com>
References: <cover.1731341964.git.liezhi.yang@windriver.com>
 <6890ffe7090972af68b585b0a130b29bbc700548.1731341964.git.liezhi.yang@windriver.com>
In-Reply-To: 
 <6890ffe7090972af68b585b0a130b29bbc700548.1731341964.git.liezhi.yang@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB7441:EE_|DU2PEPF00028D0A:EE_|FRZPR08MB10966:EE_
X-MS-Office365-Filtering-Correlation-Id: 29a2264d-15ef-478f-ab36-08dd03097c1c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?TG5rYWFqUmZXMHRCMVZWaGI5TW9ncnkwQzBRak5Da3I5RnBSYS9XZUVoeEVh?=
 =?utf-8?B?SzFGdXY0LzJWSVRLMTNqb0xKN3hFL0RnOUpSa1RsTHJIY1JiRTBEbTdOQlA3?=
 =?utf-8?B?N2ZsblZnR29PaDhqUXJ6cmwxSkZBcHhJbWFaTlBWRXdyd0IxRHBkWm90eXJ4?=
 =?utf-8?B?azAxd3RUbUJLRDZ0aldNbHJaMWdzSnJxajdNV1lydnVHOUlLZzQ2dXkwNUVp?=
 =?utf-8?B?N1dSOUF2bk9LMlR6RlJJQzR0TzRBeWxuUmNoNWFjclFnWlV5ckhyNXdFRU92?=
 =?utf-8?B?N2drTXhEWVppWElkZ0EzdUJEc1pxTlFFVHlYbEN4akpFMkxNTEF6RThkMytz?=
 =?utf-8?B?dDZiUUtBT1NCTkFNMFZXZm1sOW5QT0w2cVQwRXNHK0RvYlZKdTU4UEF0YUk0?=
 =?utf-8?B?Q0hVaTJmZkh3SkxjZHkrRHgrdFhMeUZPZVRsT0o4dCtVMDBlWFlQRVlUYnJh?=
 =?utf-8?B?TUVuM2dCM1V5QXZNN3FFNERmYXZRSmtHTGRFY0Jac3pZbHZBVCtuM3Y4ek8w?=
 =?utf-8?B?bTRMcEZKYnk2L21PamxCREVTMlB2clUyYVl2Z2g2V2NLMVZJY1VXSjdTSDg1?=
 =?utf-8?B?ZHROdkpraFVEb25ZbTNkUmZ1YWtmeHE5Z0VCQVBXSkozRzRrZkdXUFZwcWNT?=
 =?utf-8?B?RWNJcjh5cVcxcHA0c21CVzZES1RIVjZMVWR6VDhqVVFJRG1pSXhOR0Nmd2Uz?=
 =?utf-8?B?LzZEWHA5bXFOYWk0OFlaWWhobE9qWUpGUXVtWVU2dkVSWGxLd3FudHRjRVRC?=
 =?utf-8?B?RUQ0ZDd3dkdKWjZ2NDJHNHNXNXJwSUtYRTRCR1dYTlFvSzZNQ2dsTS9oYTlK?=
 =?utf-8?B?OFJMSWRTNjJ5UE5nL2JSRjRNOU5xTVN0YzdNMldHU00rZ3IrZnlIMkErQWRm?=
 =?utf-8?B?QXRGSTlBS2FWUUhJN0xpMDZGZ1RXZzFBWXhCeEM1cTFOcGRNRVprU2F3SUdS?=
 =?utf-8?B?MkxVNG81MXZvaUszS3lUNUxVZXE4eWRoZUxlTytoQ1NWZzFTTE5lOUNHclZt?=
 =?utf-8?B?YmVINVpSSXJrazFQREY5UVFkSVFHSURrclNYd0xzYUpWS2Z6bHBWUkFlaTlS?=
 =?utf-8?B?VHVCRytnNEdFVXNTN1RsZG9MaEdFREd2bFg3S1dUNHZzMGtVRVFsRUQzQkFB?=
 =?utf-8?B?ZHVxWGY3TmJ4L3I1cGE1WXJjZjNpRVlkQ2tpTXFpNTFOaGMrNUhEMlpkc0hH?=
 =?utf-8?B?M2FHc2VqeWlna2NXK3dlcEZTOFdDbC9LR1dKU21QQVFuMWhHTVFLUlBIT3lF?=
 =?utf-8?B?QUFKbXRwWVdZS2U0RTNkYUVBWmRqTkhOdFEraXlySHVZYW9SQUJtQ1M0N20r?=
 =?utf-8?B?R0FJc1dwM1VGQ2F3bTA3RTRldkJmaDVrZHB2T3lSOFIwWm9hc25xNndQb3lk?=
 =?utf-8?B?NHZDU25rakRQbWFRelNGL05zSWF6WHM1TXRtdTZ1K0Q1aFdzNzBJcmh4MGt6?=
 =?utf-8?B?M0FFblFoSDRJdHVZM2wrd1RVMkZZaTl1UXdjRUNqakpWdWVIcXJQeGF6VVlk?=
 =?utf-8?B?czI2Zis5b2Q4S09ENkZsTlY1ampXT0VGdVlBUXhqUHExVXJVdGtPTEF4SktD?=
 =?utf-8?B?cHNDYWhrUVZCM0dGbFBaWkF0TGpiV3FOMmlrM0V5WVRTZ0tyaE9iRXZka2xx?=
 =?utf-8?B?aC8wT2RjVEY3V1NzTDdLWVhhNnFqd0Q0dS9zQUNGb0JDMmRpUi9VSVhlTUtz?=
 =?utf-8?B?VUlFV0JrbCs4ajJMN2RZQnVSb3p4MnlZWnR2QkxkT2d3dW1JM3JmUVpqWmh5?=
 =?utf-8?B?T3RaRk03NWU4ZlBJM0tzS3lveGhKSk9uM0lod3RYTlhvZlB0ZEpNQjA2Y2Iy?=
 =?utf-8?Q?mZ/9lHRZzwuG4se0hwdI/BYe5UL2caVpPGb8A=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F299D6DC0C290B4291530B79F991337B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7441
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ec282a9f-8656-46f1-f06f-08dd03097658
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|14060799003|82310400026|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dEN0NGVXYWtvbWM3b3FpMmRhKzVVTHBwZmxZVVpPay8vNlVPVFRwLzRqaEFv?=
 =?utf-8?B?SmhCb3FJYTVSQSt2bVFpendWU0NsQUlzV2kxUTNFejJHWUROVStMa3ZqT1oz?=
 =?utf-8?B?YWxpK3dPdklHT21BYVdzZFp5ZG5vbWhGczcrUGIva0FYa01VTVEvQ2RJMlVC?=
 =?utf-8?B?WHlwR2U1dmR0emh5SEhJN3N3alR0MWF5aXEzeU5wRnIvd2luQi9FdCtMeGRU?=
 =?utf-8?B?aGNJZUZxN1p1RURQWmxrb2R6UlpTelhyZ2tvVmtmNUtoNytuUzNDbjcrQUU4?=
 =?utf-8?B?cC9pbHlaSXBaM1JQL3RsK2taU3AzNklxcEFZYVViSGNpd2paeHJZa1REcm9o?=
 =?utf-8?B?eGhoRXdnSFpBYlZJMUcwR1A3WHBjRnBySGdZcTRNMGp2bzZxWWx2KzdXMk1q?=
 =?utf-8?B?SjJTa01oSGhVVEphL0ZFT1UzVjZhQ3prRDl5a3pPRkNRK1l2MFNwcHNqcnBH?=
 =?utf-8?B?elE3S0RXaDdQUUVEZUxoQmtVYnhyNUFwdkExTlFoMzIyZ0I1dURkRDNkUzdm?=
 =?utf-8?B?ank0VVhOYmtmMWtpWUxYUCsrQXNZUXdiSnpWSFh2VXFnTVVEbkczSzJzMUV3?=
 =?utf-8?B?RXBHdDYwVFJmQ1ozNUtCZmJVb2RjTThtUHNwVkNWU0VYTmxzVzBsYUt0UXJJ?=
 =?utf-8?B?UEd3OEpOb0N5UlF3dk1aVDVycE5sQTdaS3lFNGJhTWpoQmpOQmlnZURCU0Vz?=
 =?utf-8?B?QzNHbHc0TUdoaTdIM0UzSHdpT1R5QU5PaVlndHF1RTJlTmh2aGg5ZjdBS3d1?=
 =?utf-8?B?L3Y4RUlIUDcvZnJyZURxTkJMdTJMMjNBdk5XVjJjUkx2U010UU81aEl4Q2RD?=
 =?utf-8?B?azZvQkNmeDI3cE44Qk9LMkVpaUQ0K09US0U0RzRVSktjcWpuNFZ1azBsVlVk?=
 =?utf-8?B?UkRKYXI5T1lUaUduazdyaWhyQkluL2dIVG5vOWNRWUZnU3d4UDEwOGRXTVJo?=
 =?utf-8?B?RVFBN2ZFdWhrSFVvNDFoelJ4MUtoOFp2N2lsbzBkRE1hNDRNcVRYeVVEbUxQ?=
 =?utf-8?B?SXVzaXRJdGRpeTZFL1VnM3FnU0tQaGRBUkhsbExWaE92SGRnWUFGTnRPWWhI?=
 =?utf-8?B?bTF3NnVqY0FSUlhvaUw3Q0FMcDBqakZtNytJOHdTTEs1S2tBd25MeWMxQ09n?=
 =?utf-8?B?TU8wcE5oT0NuRU00a082ajBIbXBLRTM2QmNrdUpMbTVsdGsvNDQyZVFSVGdj?=
 =?utf-8?B?VFFEL3hGbWFSV05RVlpuZFR5YmNsZnRRYkxJbzdLU1JMMUo4TkxmNVQzLzVt?=
 =?utf-8?B?VC8wWVhkSzljZ3c3U0wvei85NzAwb0hXMWkxTzJIR0NaK2l1RitlRm5IVkYx?=
 =?utf-8?B?bDltbmVzakEwZEg0dDA5SjdXRnZWd3lTM095VVNxSFM0M1NjdXN2SmdGb3Fo?=
 =?utf-8?B?Z0swM0ZISUh4clk0eDdya3NvN1NSWE9rNkFvR3BFanBjbUFyaHUxTTljUFpF?=
 =?utf-8?B?Zkh6Z2JmMHhSUFd3QmtOcGs5Y0hDRDdJb3EyQXJyc2JBb2RlYlF6cGVjdW9Y?=
 =?utf-8?B?dytwRHB2bFFQcERkU3J3QUxscW5abW5KcTVBT3RsbFk0UEs1NnlhUm5FUmow?=
 =?utf-8?B?eWlCTzlKZVJIZGhrSjRxT1BUYS90NlBiQStSL1VQdjh4c1dkY0JRU2hIL2Rq?=
 =?utf-8?B?ZEJHeGVXODdNUG9rTXVDcnExQzlVbXNjMnJSVDRreEhTUVFIL3BkNWJZNVhi?=
 =?utf-8?B?NE1jQnJTTGp3aWp4blNCU29NSkorSFVNWVpvOFNEVnppQk1xUHg2a2thd0Er?=
 =?utf-8?B?NWY4QmRsQk10Q2Exc1MwcHppcUM0RVJuZnY4UW04dTFTdVlISjJ5Nkpjampa?=
 =?utf-8?B?bCtZZ1lBTUhpK1FoeVNydzNFbTR3bGc5ZThFNU0rTHhEMXplUnE0STZUWUwy?=
 =?utf-8?B?VHlIZHBvSk42K01vMHozSGRIWDkwUVFrVUNXcitDRm92V2c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(14060799003)(82310400026)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 11:02:22.8321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a2264d-15ef-478f-ab36-08dd03097c1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10966
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 11:02:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207042

T24gMTEgTm92IDIwMjQsIGF0IDE2OjIwLCBSb2JlcnQgWWFuZyB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8bGllemhpLnlhbmc9d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+IEZyb206IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5kcml2ZXIu
Y29tPg0KPiANCj4gRml4ZWQ6DQo+ICQgYml0YmFrZSBib290Y2hhcnQyLW5hdGl2ZQ0KPiBnemlw
OiAvcGF0aC90by9ib290Y2hhcnQyLW5hdGl2ZS8wLjE0LjkvcmVjaXBlLXN5c3Jvb3QtbmF0aXZl
L3Vzci9zaGFyZS9tYW4vbWFuMS8qLmd6OiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQoNClRo
ZSBxdWVzdGlvbiBpcyB3aHkgZG9lcyB0aGUgbWFucGFnZSBub3QgZXhpc3QgaW4gbmF0aXZlIGJ1
aWxkcywgd2hlbiB0aGVyZeKAmXMgbm90aGluZyBpbiB0aGUgbWFrZWZpbGUgb3IgcmVjaXBlIHRv
IGRpc2FibGUgdGhlIG1hbnBhZ2UuDQoNCi93b3JrL3Jvc3MvYnVpbGQvdG1wL3dvcmsvYWFyY2g2
NC1saW51eC9ib290Y2hhcnQyLW5hdGl2ZS8wLjE0LjkNCiQgZmluZCBpbWFnZS8gLXR5cGUgZg0K
aW1hZ2UvZXRjL2Jvb3RjaGFydGQuY29uZg0KaW1hZ2Uvd29yay9yb3NzL2J1aWxkL3RtcC93b3Jr
L2FhcmNoNjQtbGludXgvYm9vdGNoYXJ0Mi1uYXRpdmUvMC4xNC45L3JlY2lwZS1zeXNyb290LW5h
dGl2ZS9ldGMvYm9vdGNoYXJ0ZC5jb25mDQppbWFnZS93b3JrL3Jvc3MvYnVpbGQvdG1wL3dvcmsv
YWFyY2g2NC1saW51eC9ib290Y2hhcnQyLW5hdGl2ZS8wLjE0LjkvcmVjaXBlLXN5c3Jvb3QtbmF0
aXZlL2V0Yy9pbml0LmQvYm9vdGNoYXJ0ZF9zdG9wLnNoDQppbWFnZS93b3JrL3Jvc3MvYnVpbGQv
dG1wL3dvcmsvYWFyY2g2NC1saW51eC9ib290Y2hhcnQyLW5hdGl2ZS8wLjE0LjkvcmVjaXBlLXN5
c3Jvb3QtbmF0aXZlL3NiaW4vYm9vdGNoYXJ0ZA0K4oCmDQppbWFnZS93b3JrL3Jvc3MvYnVpbGQv
dG1wL3dvcmsvYWFyY2g2NC1saW51eC9ib290Y2hhcnQyLW5hdGl2ZS8wLjE0LjkvcmVjaXBlLXN5
c3Jvb3QtbmF0aXZlL3Vzci9saWIvcHl0aG9uMy4xMy9zaXRlLXBhY2thZ2VzL3B5Ym9vdGNoYXJ0
Z3VpL19faW5pdF9fLnB5DQppbWFnZS93b3JrL3Jvc3MvYnVpbGQvdG1wL3dvcmsvYWFyY2g2NC1s
aW51eC9ib290Y2hhcnQyLW5hdGl2ZS8wLjE0LjkvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9s
aWIvcHl0aG9uMy4xMy9zaXRlLXBhY2thZ2VzL3B5Ym9vdGNoYXJ0Z3VpL2d1aS5weQ0KaW1hZ2Uv
dXNyL3NoYXJlL2RvY3MvYm9vdGNoYXJ0L1JFQURNRQ0KaW1hZ2UvdXNyL3NoYXJlL2RvY3MvYm9v
dGNoYXJ0L1JFQURNRS5weWJvb3RjaGFydA0KaW1hZ2UvdXNyL3NoYXJlL21hbi9tYW4xL2Jvb3Rj
aGFydDIuMS5neg0KaW1hZ2UvdXNyL3NoYXJlL21hbi9tYW4xL2Jvb3RjaGFydGQuMS5neg0KaW1h
Z2UvdXNyL3NoYXJlL21hbi9tYW4xL3B5Ym9vdGNoYXJ0Z3VpLjEuZ3oNCg0KSXTigJlzIGJlY2F1
c2UgdGhlIGluc3RhbGwgaXMgYnJva2VuLCBtb3JlIHBhdGhzIG5lZWQgdG8gYmUgZ2l2ZW4gdG8g
dGhlIG1ha2VmaWxlLiAgRml4IHRoZSBjYXVzZSwgZG9u4oCZdCB3b3JrIGFyb3VuZCB0aGUgc3lt
cHRvbXMuDQoNCkFsc28gYWRkaW5nIC1uIHRvIHRoZSBnemlwIGNhbGxzIGluIHRoZSBNYWtlZmls
ZSB3b3VsZCBtYWtlIHRoZSByZXN1bHRpbmcgZmlsZXMgcmVwcm9kdWNpYmxlLCBzbyB3ZSBkb27i
gJl0IG5lZWQgdG8gZGVjb21wcmVzcyB0aGVtLg0KDQpSb3Nz

