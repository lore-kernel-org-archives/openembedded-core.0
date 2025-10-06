Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D99CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 20:10:38 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.64])
 by mx.groups.io with SMTP id smtpd.web10.2234.1759781432730359685
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 13:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kkLTfbhV;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kkLTfbhV;
 spf=pass (domain: arm.com, ip: 52.101.83.64, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bjL1mD4+yQbmlhz9K9j/ri8NwFvpf0IhNWH2cRLJYFALY5e7v743YH6Gr7CDYJ4pRn2MbrkBezWdDmuv18IaiM1z4Wx1w4v4Vo7+JKSmb5KHio1i9LYj6oDvRmPv2SYWelM5FZANmJUWx3V6Sl2Fx5eNiisiNE9jyZUd22sNLAjubGrVJF2zroJ6nv4++WIrwZl5T1HF13bw/aas9MZIWCUY168I8vBEf+lC6MUxuS+AWWGmAlwWPCSnYwMHjKABocX0Zlm3F0E491+jbQzjzXg3mTeVE2zOoegZm6inthT4GwpEx8nP357dWZsytnnYC09rDIU/tNIUs/8OWY4oEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BULQs3qW3FNDF6JVU4b0g4jUUEBVPmREm2ZfNU69ldc=;
 b=E5bsEP3PeNwEDO7kpWVMTxCHO9lQQ3gPJok0hWWWAlhQoV9hMMUjEeW962Oqk/H7UhVNHHnogWKIGInKz+zSEVKRPFiUjsNpwiBSTZYZfLMaCwUKr0TYF9qCQ7Jc/1MhXnvfKLDU9OjfBqrUiWnwoJEm4wq+PftMzHJtgtVTM6swotiAIJi+4eYYN/9mwCfoVRYtcWNU3QWdJMM+WMvTK0kUkUISs066MOkOswVsXRsGZAzs7aKw6CIVtcrsxYZNksnNLWb8WIZ4+j0i0N2RR95ValH8taBWda/gFJ0dcNb7hU8HtQuZYnTbGIQN2DGuLZ2SCpqxN4u0IOnlyDKATg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=axis.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BULQs3qW3FNDF6JVU4b0g4jUUEBVPmREm2ZfNU69ldc=;
 b=kkLTfbhVTEBp6W4aYvx0Pg25WskdC07K+o/K4Rt/bYvAMbe3tH5ooLd/G7USYGAx3n6PP1JyyZxCVXWVfUQK7ZsI7bNjmeAiyuVXgLa8YWXphhRtLOBeUrea90NPAqtMyXhlzBEDifGcVF9efxT5QXvPrS1QoIG9kNDgriX4/QA=
Received: from DB8PR06CA0042.eurprd06.prod.outlook.com (2603:10a6:10:120::16)
 by AM7PR08MB5304.eurprd08.prod.outlook.com (2603:10a6:20b:10e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 20:10:22 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::34) by DB8PR06CA0042.outlook.office365.com
 (2603:10a6:10:120::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 20:10:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9
 via Frontend Transport; Mon, 6 Oct 2025 20:10:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/RPoep7qt0pz8qE9Y1CgeJBhE/Ew3pXfQqxSzpA2STQqrdo+Ku1bd/QqEFXw7yBLSq4901tMxZN/Vc2jcwznp94NIc37ZSFWopZZcc8hznqv2bfb1WLwfMQbaxKo1m48ss1w5x+6ZXmxBM781oPF4veesJbCrEvGCXEpsL9H5CAYzrpHWtDiSI3EqVddTfIAyIjqQHT9Sm914yvxqvVYnc4hVbeaXLxwTBXyDre1guP3nrIxUnRfpPc/J0uSx2FWDbIaeT2KGfawN+eew9M5oHtjnmQH+c2yTU+yqsPUHf8j0o3+lEl1yEIvCu8ggI4eYWPwzpAyL2Lke5h9tc+EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BULQs3qW3FNDF6JVU4b0g4jUUEBVPmREm2ZfNU69ldc=;
 b=nWQWpjhqCzeE+TIF6N7WhscInsd9zFkcPtr3RuZSo15hbGGO0TkmnDEIEqWhWg7b9Ux0LCnFCW0l5Q/lCa8UdvbQ5Lmo1B9lC3enBFH8GRswsEI+crn/M+qVaBCsvcy1U6ZIYnd1ei535uKXtUozhCsJ0kNYRCXzrJ+w7JbuNhvV8zXEd5Qkqh2+ioBUTQ2Nq7TJjq+T5v7zKjNJNp16BDMaBPr0BTPrZSglZpJ1g2b3uE3YFlNWfTzYirc+RvxdqS8ZI8beaoAXeD+wqgnJXvN5/W/BWbwJ+CY+oxlMezXpLolpEjfklFksWjlujWK9l/By/JH4GRMzyjZh94uUUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BULQs3qW3FNDF6JVU4b0g4jUUEBVPmREm2ZfNU69ldc=;
 b=kkLTfbhVTEBp6W4aYvx0Pg25WskdC07K+o/K4Rt/bYvAMbe3tH5ooLd/G7USYGAx3n6PP1JyyZxCVXWVfUQK7ZsI7bNjmeAiyuVXgLa8YWXphhRtLOBeUrea90NPAqtMyXhlzBEDifGcVF9efxT5QXvPrS1QoIG9kNDgriX4/QA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9551.eurprd08.prod.outlook.com (2603:10a6:20b:61c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 20:09:45 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 20:09:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Adam.X.Nilsson@axis.com" <Adam.X.Nilsson@axis.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Adam Nilsson <adamni@axis.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [OE-core] [PATCH v1] core-image, populate_sdk_base: Add
 zsh-completion-pkgs image feature
Thread-Topic: [OE-core] [PATCH v1] core-image, populate_sdk_base: Add
 zsh-completion-pkgs image feature
Thread-Index: AQHcMu1bm4eWL7OysEKcbvVDSC82UbS1lGkA
Date: Mon, 6 Oct 2025 20:09:44 +0000
Message-ID: <FF7BA9D0-A09D-4D43-9CBB-5CA991E825BF@arm.com>
References: <20251001160212.2588471-1-Adam.X.Nilsson@axis.com>
In-Reply-To: <20251001160212.2588471-1-Adam.X.Nilsson@axis.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9551:EE_|DU6PEPF0000B61F:EE_|AM7PR08MB5304:EE_
X-MS-Office365-Filtering-Correlation-Id: c54d1b42-d82d-44a4-347d-08de05146146
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?RW1qTEZDWGgxMjMrZjdJS00rMUdBN1ZrMWlQM25YOUkwMlFHeUJ4ODVKMmRj?=
 =?utf-8?B?RzIxNjRlTkxUSzU5aVZiQWV5aEZ0RzN4YTQ4UzYrbXVCNkNmS3lJVkNDYjFl?=
 =?utf-8?B?bHR3K1pycW5ZUFQweHFYQ3NqdnA5OXY0bWpJUG44cnBKdHZmRy83SGJaZkFE?=
 =?utf-8?B?akJaTTRsS2Nmd2pVTzZyS0pwZzNoUGRiQVBKeWZNR01lWWZrUWVFekE2ZkR4?=
 =?utf-8?B?QlpOY1ZyNVZPNllkQTMrb3pIM3BhVE0wakNkY010SldhR01RNmpkaDIrKzdX?=
 =?utf-8?B?Q0lOSzRINjl6a0Zqd3dxTUF0K2Z5V0lWd0EzNG82dCttUUFNTlcvcTZqazYy?=
 =?utf-8?B?c0lEcUhJK3RpWUd2V0hBTkU4V2ExNmhab09vaEhTZ0pYM3E3eHkweFlLeDJ5?=
 =?utf-8?B?QVJ3QkNRa0paRWNCVzMyeGZWMXJ4R0ozU09VaEtWUCtBam9tNGVQZ0l3UnVl?=
 =?utf-8?B?TUcxRnNSemhXeVc4MWVvNi9CWTRYSCtaeGllaHdJZEVYVk5WcUpEeTREVHFS?=
 =?utf-8?B?QnhmeWs4QXZHSld4K2d4QnNYbWtrNnJlL2xtM09yM2tybEdJM1pKaURKdUQ5?=
 =?utf-8?B?VGdqU053MWZCRHoxNldaSGQ1ZXRjdVowL0pyV2xrbGxwT2t0Q1R6RDNyczVk?=
 =?utf-8?B?Y3p5N2o4ZXdQam5jWGhKUkJxQ1VhVnQzeGVwSnBRdG56L1NNc05GQkFpK21U?=
 =?utf-8?B?WDZXYThRR3ArQm9Lb3NVNEgvYzZqNDNqLzlnMGtjUWkrYyt2QWFnU1I4dHhO?=
 =?utf-8?B?UW8yc2NXZEM4WFFjL3JlbjNKL2Yvd0V6U2NRb3o4QlRQS1ZaTStwdTcyMjZI?=
 =?utf-8?B?VHlPL1AweGJGTG5XNnJIUm8xVUthMW9PMGh1SEcvSkdtS3dsNXp5Q1U3c21l?=
 =?utf-8?B?ZVF1cXdJakVoK0dpRmFXUDF2Z0tvNVNiWitwSFRRNXI2Y2xaTkNyNnJTOXpI?=
 =?utf-8?B?TW5kcU5MOXhnaFZYL1AvUlZRV1ZTdmxFajNqczUrdXgrSk1kRklBVDdNeWpD?=
 =?utf-8?B?eEl6WWpwVzlDNFpnRDY5Yk5iZ0hkUVFkZUVmMEJ3bGlVbTMzVk0zY3h1Y29Z?=
 =?utf-8?B?cThtamR0b25tekVlYVVNc0dFeVQ2RlJiQlBVc21ubXpXZ0kvcWRKM3VaalYw?=
 =?utf-8?B?RkYrc3JYaGI5bFc3bHJrbHUraEpPN2VyZ2hNS1hBZnhEM0pSd3lDT3BwQUlH?=
 =?utf-8?B?R0I1Q1cwUE9XZ0RoVmh4ZXZxSjFZWUdyc2E2VksrWGtMN2RpNklNcDhBNk83?=
 =?utf-8?B?d00vR3JtN01YSTFaZWJZNy9MZk9lSkd1V3I3M1o2RUhzUjdtV254SDZ6T1l0?=
 =?utf-8?B?SHoycVhicEsveStmdHVxWitVVjExRkJINFBLZWlkTHRJZkdvalE2U1BmWTR1?=
 =?utf-8?B?MkVCVUZpUTVEN2VjbmhCeUVQSHdaRlduU2Z0VWFoVFdEOXFhVnNxcUFRSUFx?=
 =?utf-8?B?RlBBMmhiL0dZSHMvWFhIeVplL00rZUFSTjdZLzc2eFY1dEFlVUw5YVdHNjBk?=
 =?utf-8?B?WlBOc1EybGZVbEw3S01LRWhzdXYxZ0thcUswVjI1bk4yS1ZrTHJsU3R1NWhj?=
 =?utf-8?B?QnZLOXYvcU5ZRWtnRFhMRm44NHJrK0NtNGRzVWlpOW9jSk1INkxyd1dWYmxT?=
 =?utf-8?B?a0ZLeWNKTm5hOVUvekFzNjNuWjB3K0ROUmdxMTNRUW5IQVI2c0h0VUVqN2pE?=
 =?utf-8?B?Y0dkSFhBbGhnVmVybDB0OXdsclZnZG9NNWVpN0RMckRtSC9IeitwQnJ4aFlI?=
 =?utf-8?B?ZVNXUEs1UW1mYkx5SXVTdzlpbzk4SElqUjVtYWtTNWhXOVMrMEF4U1pQT2tN?=
 =?utf-8?B?RlNqRnpvRk1oejVYT295dEJoU0R4VmlmV05IdjdIVnVFU1A0VkFOZUxnUFdl?=
 =?utf-8?B?NWRqOTNINFBPWGZaN240N3BNcWhBUXZ3YUVSZ2p2Y25RSnVTSVc1VzFKa0Za?=
 =?utf-8?B?Yk8zeXB4NkxFdnl2b3JzMHFtS3dSNUhQZVNXTERETWYwcjVjUjcrTnBJSHlC?=
 =?utf-8?B?M2traFNpeko5b0VYN3lTOU1XSWFualpkQndNd0MyVEtTdCt4NnVvZ1YyZG1T?=
 =?utf-8?Q?WUGLk5?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2F1A56607273946972F11F26C454FF3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9551
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a9aa6490-f73a-4a9f-bc37-08de05144b03
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|35042699022|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QmM5U2Mrb01VeGdXRUtZemlHSmxFVUNHdmtMMTlZYjZzdlF0L2c0RWd2MC9l?=
 =?utf-8?B?aHFGVVhiSjFNY2tUUFphTFovZW5aMFdDMEUva1V5OHd6OUVRUkxjODg1Q0pM?=
 =?utf-8?B?WDZJemZkZ0k4WjlCbndSVkdUSlVMSXR2RnVmWDBOaFJzcFFzY2R4R09udHNr?=
 =?utf-8?B?bXdsUmtIVkFScHBhNkh4eTkzVUhOd2xaWlFnMWZqYVRsSjZDUTJmdzhUVTZK?=
 =?utf-8?B?SE5mY2U4ZVN4WHR0c09XYzJ5YVZDeFZaOWtSWktieG0rSUo0Qk9aN3RMQjR5?=
 =?utf-8?B?OWpvOGVocENSYWdia2IxczNKNVFuaE8wS3NSdmxobkIvMkh3UHQ1WTBrMnQw?=
 =?utf-8?B?NlkwSGxyTFBxK2gyWTN2dGpDSmpEb0FPeTBpY1dOQmhXU3Z3Rkc0MkwyRjNu?=
 =?utf-8?B?bGprbjhQK0NxWTB3bTJyWVlQNTJKK2dBUjhmb2xNVXVJSTNUM2JoSjRCZG8z?=
 =?utf-8?B?UkJuaWYyZVBpWUtOZ3lGc2ZtSURKaXpWUjZVQXExZ2lEcjc2L1FTaG0rMTJC?=
 =?utf-8?B?S1ExSDVDTzRPV0ROSFhPYktSYjhOSFB2NkdSYkFMU05HSWlDSzRsODFCUjZp?=
 =?utf-8?B?M1RyZlhHUjczMXVQR3MyMTN2TStoRlFGampSaWJGSHd4RmR2aEVNN1hyUEJL?=
 =?utf-8?B?aFB4cXJXRWFnUy9YNEpsSVByKzh3cXBPRUw3WDVlWG56LzRxeXROMkNMcHNl?=
 =?utf-8?B?YUZ6L2JIYXpEbHBzTFdGSXFuRkZIWlRlT09HR0tnZFZNaWdtT2VSN0lvdEda?=
 =?utf-8?B?amo1dVNUWDhvZGNTay95azRUNzBXUHZ4RytuTlZBWmtFWjBLMG16bFVqWVpG?=
 =?utf-8?B?STZZRDBZcGxmLzAxT0piYnJSdzZUM01Yc1o3K1ZVSUtjRUFTV25LYUFVMmky?=
 =?utf-8?B?ZVpHS3hJUS8yaHh4Y0tsVkR1Y3JsTzFDZlJXKzIwY2JuQUdESzN0RmQ5Z1Vt?=
 =?utf-8?B?Ym8vU0hwck1uUW1SeFU0b2IrRVF6MTZOckIxOGdTZVVDcUhYOXhYTDBIKy9L?=
 =?utf-8?B?ZzROVVBESGI5em84OXFLdFdETDJYaXBhQS9tZTFFMlZJU3ZZSVdBZnVoeGJI?=
 =?utf-8?B?eVNIY25kZllpRlBIa0RQQmxrYnlCTGdHaTFYdkxOcndVdFBkYThTUHloVUJK?=
 =?utf-8?B?QmNub1lyVVl5ekw3RTU3NS9PV0tLNm5OMVlVcU5nSHdrWWRMZDNBK0xWc0Jo?=
 =?utf-8?B?RmpTUmRlTkJoUFJLMlZFcThudXJDKzZxU2I0VHlwcjJ3ZStUOHU4YWtkZTNn?=
 =?utf-8?B?NlZKdTRnVzlJUDNsdHAraGhHL2c2UWhoZTNZZDF4TWYxazZwTGl6WHhndldH?=
 =?utf-8?B?TW9xK2VOT05rQVZldTlZLzV0UkZqUUVrSVFyZ0ZwQWxPMlE5SVlyWTRsMDJa?=
 =?utf-8?B?K2pRWDZjNG1ydXRXVzNyWTdFVDRsYkFEMEYzTmFVdFVRWk83c2RuRW9VQ2Vk?=
 =?utf-8?B?ZitZM3RpNGJ0SFEvQXJaa3Jqd1lLcjVtQlBSQkRtd3ZjeWdsNU8zTnhzSWRC?=
 =?utf-8?B?aU5LSGc4cE45cm83SGVMbXdTU3hYQzJwQzZLK1JGUkV1RDMwNFc3aGt2THdh?=
 =?utf-8?B?YVB4b1pJMDBjYTZHZnIzSW5JTFNWcWFGcDd1Qmt4T2ZGMmoyVXRPb2ZndFc0?=
 =?utf-8?B?TUtOS0pUV3RNT2Y5ZkJKZnFFcUs1aXY4UTlOS1FhNkhRT25NTjFBci9rTFFR?=
 =?utf-8?B?K0dlbEdRQm8wa3ljR2gwWVN1L2lQQ2kwZHZXaDhWdUlYaWgyVzNaQUtBWDFX?=
 =?utf-8?B?QWFNWjBDZlhDRXh2UnI4RDhiWnFzL3RQdDd2YzBYRW9Tc24wZ3M3eHcvUTlK?=
 =?utf-8?B?QjJramFyS1MrOTI2ZVJxTFlzV1AwSTBFZFFnaHM0ZDNGR00zd00yQ0lESERR?=
 =?utf-8?B?dDNHWDlDdnE2eFlxQmRvYmZWa2VDQkMxdmdzNjN6bmVWT0pQd0RpWlZZL0xM?=
 =?utf-8?B?RmsyUVd3Y2U3bkxUNklGQ3VJQTF3SVlNUkhMZklEQ1gzTkc3SHpiQkx3OTg5?=
 =?utf-8?B?YlYzZ3RGeXV2YmR1M2JqVTRwSTFEc1NObEVNU0RRSnJqYVQ2WHhUekdKelFX?=
 =?utf-8?B?U1ROSjZNWXc0VGU3dUJsVi9EQWhsRFNtR3Myazcra1lsMUtNNEpHeEdPYURa?=
 =?utf-8?Q?SFj4=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(35042699022)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 20:10:22.1682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c54d1b42-d82d-44a4-347d-08de05146146
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5304
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 20:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224503

T24gMSBPY3QgMjAyNSwgYXQgMTc6MDIsIEFkYW0gTmlsc3NvbiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8QWRhbS5YLk5pbHNzb249YXhpcy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiBGcm9tOiBBZGFtIE5pbHNzb24gPGFkYW1uaUBheGlzLmNvbT4NCj4gDQo+
IEFkZCBhIHpzaC1jb21wbGV0aW9uLXBrZ3MgaW1hZ2UgZmVhdHVyZSB0byBpbnN0YWxsICotenNo
LWNvbXBsZXRpb24NCj4gcGFja2FnZXMgaW50byBhbiBpbWFnZS4gVGhpcyBpcyBzaW1pbGFyIHRv
IHRoZSBleGlzdGluZw0KPiBiYXNoLWNvbXBsZXRpb24tcGtncyBmZWF0dXJlLg0KDQpCeSBteSBj
b3VudCB0aGVyZeKAmXMganVzdCB0aHJlZSByZWNpcGVzIGluIGNvcmUgdGhhdCBoYXZlIC16c2gt
Y29tcGxldGlvbiBwYWNrYWdlcy4gIFVudGlsIGl04oCZcyBtb3JlIGNvbW1vbiwgSeKAmWQgc3Vn
Z2VzdCBwdXR0aW5nIHRoZSBDT01QTEVNRU5UQVJZX0dMT0JTIGFzc2lnbm1lbnQgaW4geW91ciBv
d24gaW1hZ2UgcmVjaXBlIGlmIHlvdSB3YW50IHRvIHVzZSBpdC4NCg0KQ2hlZXJzLA0KUm9zcw==

