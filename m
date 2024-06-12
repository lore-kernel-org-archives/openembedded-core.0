Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 058B9C27C53
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 14:52:48 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.89])
 by mx.groups.io with SMTP id smtpd.web10.430.1718203963417428498
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jun 2024 07:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Hq0KdXxL;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Hq0KdXxL;
 spf=pass (domain: arm.com, ip: 40.107.103.89, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eWJjTSpytYuhJDAppZQQCM1vGYUJkemBcPUnShAp1sEezuJp7lK6To8MJUYP/WTT7SXVmHW4yJVyR1OwKU2sXciNcg2KOyPxc9kovYCpM+sHUjv2GmT5lCO5/7XTLoAmzhw0Nv5VqkblHCahC/p+rJEPr0OUk9gTlonHrh+1ayb6b0Q7JRBSa1W+xkaEOVhC/B7OuKIDEZmiElzu0YhZ8WQDHXwaDV+bxKv+O35402MlqK8TdpsZLth9Tt+vo5W1dqzndxkoPtdCNZw8uiEq3ctEuoSE1pMEVf8+AZW3RI8+XZGb3JbZp4lHfap2rgQ3fwqAaBca+2yY6RgUOcb5Ow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxCY/FPBv6hNDXa9t5M0uhzELy6Cj4zgUfxck4fvxbc=;
 b=G74MnPJQeRuXoD1V91BFy9CxiQoOcRC0zyfluxDRSpVMQ86biK2+8a039/a5SkXrgxKdOqkYw9iashTVjszrr7N2gRV1RrX4LAsMECqx7Ig0EwF1IJpjo2r9B6niXgzbXCNZ241EVw/UD+rOV932KmO/XhOTZPhclYMPyOx/9OvrewWWLcfY/vXjVcNlxegGNsSOx5mPxUdWD3youay8MocgVWoBwLQ/ERZC9zkV3T9XsLudcRzd/CAfywLVMS3YnB3Mvz9Re87wkt8cF+adv88ToVqgga/NFcqPxJzJQqxn4zj2PzhCYUxJGDLGxKX5Fh2ssc22WyeYr6yf3tHe8Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxCY/FPBv6hNDXa9t5M0uhzELy6Cj4zgUfxck4fvxbc=;
 b=Hq0KdXxL+Pwwhx4EFI+AXp34Y45u59aI2KYiQvXjGM8ra/8/eM32lZ9+wa0ZSN8qDUdKfeLM8AjIKiXRjUhoejHPkXCPVz1WyGUrWkvk6G8XgI65dXcZW13tr8IAtxOC0QRaObgNYs6x6AXq/I/cdjyY0bRnDHVjBN8voW7Ylyc=
Received: from DU7P250CA0022.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::6) by
 AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.37; Wed, 12 Jun 2024 14:52:39 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::d3) by DU7P250CA0022.outlook.office365.com
 (2603:10a6:10:54f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20 via Frontend
 Transport; Wed, 12 Jun 2024 14:52:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Wed, 12 Jun 2024 14:52:39 +0000
Received: ("Tessian outbound 2ded0d7f80d7:v332"); Wed, 12 Jun 2024 14:52:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 35eaddfb6a67b884
X-CR-MTA-TID: 64aa7808
Received: from e191d63f53ad.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A021DAAA-6253-42E3-BF9F-8B3B08874BA1.1;
	Wed, 12 Jun 2024 14:52:33 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e191d63f53ad.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 12 Jun 2024 14:52:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/BeVThWQkqU1NiQGVBjlOH9abCKfax6ncB2Y2WOjqBCXerSCfolENltEdVSVREWYm6c57ywEEbKK18K9FeVtOi3cwlv4ZWzUOEeeijw6RJY4axUzM1fl1uQXRzkUs3mYszod/l9xu9u6iquzRqbApv2dEKnh+woYeTgYb1ViVtaVk5QZNjaisbuVzQsZ5yq64BNDFGPypuXvPaMZ1ftbLqCp9k/oaC1bWhV8yKnD3kpUn+ejBs3QJIbSMdZyTbQHb27QcfPmm2uEKuCLsyLvEhv1ZespcIDOaI6HEgui/6/YfABS8orXFKPnqz3m6tN5bQ0sEuf0qokWKxQAObOyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxCY/FPBv6hNDXa9t5M0uhzELy6Cj4zgUfxck4fvxbc=;
 b=LQ8VXP9d/xw7kO0HD5+8pq0hPKw836tT93xU9P3Z8fCjFJ4IEvFQgRvIv7hmYKTBVOsGH+PCO3kmuZxQEMBqkAWgmjKPwJymdjH64WjxweOiMw+eDuZ9NEjLi2Z6iKIWrrzIweqky9c/K7kjcR0cfLSkb6+wA6s5St8/VkmfPMkmTWw0SYwK+QfhwCeu09sukhJu6EKqVl0hVGDJL30pK8T5XtduAkw3nllvZs4cUW2zT7lJWkL0Hoe4tX2GWtMyYd5oK6efavfvL8Gr8baxqdZcdPIyXrW2b1+KmT7zIE5uqFzkSigQ2BLuwnns48vjVjLMaJucdarotNxLOuy38A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxCY/FPBv6hNDXa9t5M0uhzELy6Cj4zgUfxck4fvxbc=;
 b=Hq0KdXxL+Pwwhx4EFI+AXp34Y45u59aI2KYiQvXjGM8ra/8/eM32lZ9+wa0ZSN8qDUdKfeLM8AjIKiXRjUhoejHPkXCPVz1WyGUrWkvk6G8XgI65dXcZW13tr8IAtxOC0QRaObgNYs6x6AXq/I/cdjyY0bRnDHVjBN8voW7Ylyc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB7619.eurprd08.prod.outlook.com (2603:10a6:102:260::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Wed, 12 Jun
 2024 14:52:30 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7633.036; Wed, 12 Jun 2024
 14:52:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "ecordonnier@snap.com" <ecordonnier@snap.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v4] oeqa/runtime: fix race-condition in
 minidebuginfo test
Thread-Topic: [OE-core][PATCH v4] oeqa/runtime: fix race-condition in
 minidebuginfo test
Thread-Index: AQHavALGfk0LyHQzRU2DxEILKNGr4rHEODoA
Date: Wed, 12 Jun 2024 14:52:30 +0000
Message-ID: <D4461EE4-DD0D-4638-ACCA-0BA86CBD59B8@arm.com>
References: <20240611132447.1497274-1-ecordonnier@snap.com>
In-Reply-To: <20240611132447.1497274-1-ecordonnier@snap.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB7619:EE_|DB3PEPF00008860:EE_|AS8PR08MB6309:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d4bd131-be51-4964-950c-08dc8aef4e63
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230032|1800799016|366008|376006|38070700010;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?SmdGREN6bEpPQnVzQUpIbGlhTHEwbGgxOVBGM2Y1Ym1Ud1JMdE91Q0pSclVl?=
 =?utf-8?B?YWp4WGYrTGV1anhObXEzVnpEeWZvUE9ybFU0QXZzQTJUWUtlMkpqVnBFUldx?=
 =?utf-8?B?U05LZDlGSmROYTB0VlJtQTRjamE1UkhLcWxNUFdtKzE1VEtZcFpNWkl1aEk3?=
 =?utf-8?B?Y0ZycG4vREIvZGxUS3o5S3V0NmZUZisrVkNVdjlQTnBrWVZNOVRFbjRJY2RN?=
 =?utf-8?B?T2ZBRWFoS1ZDbVd5K1FWSkJveWl6QjMzR1dPNzg4QTB5SEhjUk5xTzJnRVdm?=
 =?utf-8?B?SWZleUtUU3o2M1Q1bUZYaThudjErN1ErTDlzdHVNOC82TUtwOENmM2VjUWhR?=
 =?utf-8?B?ZTgzdVRzVnd4MmVvcm90NStuWnZvSUQ4aWU4bWdGK1pOUExycXJ5VXhDdTNw?=
 =?utf-8?B?RkxTMjBRU3Q3a2F2elFZNzN3aEd4d3JaYVZyd2ZTYVo5dWJwRXdNdWloQ1ZL?=
 =?utf-8?B?QjJxOTZsc1JFTGNmSXhnNmNBdzNUMEtiN1J0c0M4aWErQjJmd3I0VUFvdHM1?=
 =?utf-8?B?ZWNaN3JaaTVGMDVqVWNKRm03Mm1aYnc1L09la3RWUlMxOUJUbm5XZ1RXWDJ0?=
 =?utf-8?B?b1dEYUFGbUpFdlZkWG5qMHNqRzN6blcxVHEwbWJzeVpxeXpvNzJXbTlRREpI?=
 =?utf-8?B?R1o4V0JWa2pnU1ozRGNUcDd3UDIyalFBVnFxUE0xZ0pCd1RVL29aenUrNkIy?=
 =?utf-8?B?ckNMaE5Zb0lxOTlpYThYek5mQVRwTHNvTXdVcWlQUzhWRkJHS0NRL3lMcEtq?=
 =?utf-8?B?a2pQUzNCZUZ0TXQwR0NtcjkxcTFGNlJneXVGSTJRRkhoNUJjL1dkZHBxTkJF?=
 =?utf-8?B?MGNZVDI2dmh5NDhYaW54NEtvei9HdlpiMEZMd3ZhUVFhemM2SzcraVQ1VWJ0?=
 =?utf-8?B?VXBYMDJwWm50SEVxcXM2cXJPN0lkVGVOajhpUWVRUHQvYkFGZUxBZG5pOXJ3?=
 =?utf-8?B?REVPWmVDRlBiSU9ydWJ5QU1MLzgyRHdmYnhOdW4xU3BFYmJGMXJUNlNNaFQ4?=
 =?utf-8?B?eGFOMHg2OSszWHVodS82Y1ZySWpmelRWU0lNeUE3bDJFOTRpemtoMlVFZzZU?=
 =?utf-8?B?M3g4V0xzblJzUTBUejhUTnVZRlNhSEN4UlR4ZmVQbXJ3VXZORk43Z28wM29h?=
 =?utf-8?B?RmpOSmhZSnREL01vOFJ6SFJCWXNKZnJhWjVvdUx4cjBnYWpwSnhtcWpKUWt4?=
 =?utf-8?B?bDZNc01OOEc2eStwK0cyRVRlWWcyN0NHUXdONFZwb2thcDNZUUR2a1cxSUNU?=
 =?utf-8?B?VWRxRlFSelNWU3ljM1B4aWxSTzc2NHJqRm1CMk4xNzZOL3NPeTBWYVRkYXVS?=
 =?utf-8?B?blJEcDZ2K2NiRTBOd1pKR2lVNmtkQ1ZpeHAxNEJUVTdRaE5JY0RUWWZQeGQ4?=
 =?utf-8?B?d2dPbjUxQzF0cG44QUNJTExlQTdteTBLMFJvdlM3bzJTM1lNWXhLNUdmMmpI?=
 =?utf-8?B?Vk4yKzJWWlRyS2kyZG16VnFQYkRvMzVBeGFtdzJRa2dpb0xuaDFCcHBVU1FI?=
 =?utf-8?B?Y0NJMTVMaUxUc2xBM3llM0VYdTJISFI5dU1ueXp5ZklHd3hwMm45Qm9ISnJz?=
 =?utf-8?B?bjBmK1VNeWQ2VHp4TnV0TGNuNmJMSUd3ZVVUb1VLbVl5ZzVGMHdCR2Jtd3dI?=
 =?utf-8?B?VjhyQ3lrNVBkR29xR2NkVGJRRHFZOXk2Vm92V2xtdWowTnR6YkdzaUlQRVZ3?=
 =?utf-8?B?enpjTjE3RkhQVTUxSW5LZ2M1ZzgycDBpZjVUamptUS9DWit0ZVd5cC9uVENR?=
 =?utf-8?B?RCtRaWpkbnhMU05Ea2JjRHJUMHpEUmZPNTd1a1BUaTVzSzlqd1VZd2tGUkRz?=
 =?utf-8?Q?nxWfUoC91mqvISPEkRIeIncKb9nau2aULkUf0=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(1800799016)(366008)(376006)(38070700010);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5783C845153A04D919F2B1996782ADC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7619
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7693a5c3-5194-4719-00ce-08dc8aef48f2
X-Microsoft-Antispam: 
	BCL:0;ARA:13230032|82310400018|35042699014|36860700005|376006|1800799016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S1YvZkdwK3dreXYzcUEwSGg3WjlWbWc3Sy81ZVlidkZSNUtPelIrb2V6aSs3?=
 =?utf-8?B?NzFrYTVlZFJ1UThVUjFYVldIWHYrWm0zVXBSSnhJTE5neHp1SngrVGVMWHhj?=
 =?utf-8?B?Mk9pSkc5N3lEOFdMeXkyZ0pNWGVSWnlMS3RNTU1pcUp5M2dlYnVIV1lRV0F2?=
 =?utf-8?B?ODFQN3hhOHdqU0JuekFZajJrcmdUc3ZSdUxHNWJ5b3hTZXFBTjI3cHlCYXB6?=
 =?utf-8?B?NEpMTlB2VkdZc2NqaHJ0bmViK01qeUJTYTUwUFVyOHllTURLYlJLTzhyZWFR?=
 =?utf-8?B?WFdxbkQ0SFI3S0hHQ3ROMXE0MDVjQVJIcnVxZGRaRXVvSTJOWVk4NXgyemdL?=
 =?utf-8?B?OVA4aEpKWE5iYU9TK3BHNTZMZUE5UkVGZmNWYzVFenMyalpCMFpjR1JnYTVT?=
 =?utf-8?B?L2psNGhiL0dGY1NOMkNOS2pyOW4xc01xSFphcG1HTXpiYUx5QTlXWCs2ZEFO?=
 =?utf-8?B?OUxjSXp5ZDVYUkJlbHVxa0d5UEJJd1FqOU02MG8zdENacXRsR0dsZFJBb2xu?=
 =?utf-8?B?cUczUldpaVR0WFkvMmVGMGdIZzdodWpaSit5NE1QVzRWRnpGc1dCcjliUy85?=
 =?utf-8?B?L0F5cXFaZ3ZuTFk5NlZHOUcyUWdVY1gwcWJJZmdlWGpXRWRPYmJOaWt0Njg1?=
 =?utf-8?B?eE5EaWM1cHBGcFlrV1N5ZXg5OE5EV2Q2TnhnSjR0ZFhyQzk0b3FjcE13WTFq?=
 =?utf-8?B?YkdTL2xIOHlGYjhqdldvZzgwYjZFNUU4ZFRIR1VWMG9mQitLZ0NtVTlTYXJm?=
 =?utf-8?B?aVU3OWcwaUVkS0xQc3kwd2o2b2lSeEtEa2ZrM2RiQktxYTFzcWQzcUNnbVFQ?=
 =?utf-8?B?Rzg2Rnl1bHc0ckVmMlZ2Wk9Od3FlQkZ5OEhIN3BhYUJJTDZmTzVyNDAvbjIw?=
 =?utf-8?B?UEg0Zlh2K0REUFRZOTNwenl0czN6UVBSY1lnMHd5T21SV1V3bkVFMEJLMDQw?=
 =?utf-8?B?RXJudGRTSUpFQW5RZDRzN0wrNVAvQ0pPLzBxZjhLUWlyRWlsbnpCWFNaUVlY?=
 =?utf-8?B?NGhlK0tZV2hHNzZMbU8xTnVYVzViUXhWRDNmb2lyYnUrdUNOMHBSZG9oV3pI?=
 =?utf-8?B?ZlZuZmxOdHpxTit0Slk1Z3JSZkNlWjBSTDg3TzR1alRDUVVrVnRPNHd4ejNa?=
 =?utf-8?B?VEFRcXV4Z0JXb0M3V3BENllJSW40ZytscitRTTRYNGZxcjY4WVJQUXpjbTJ6?=
 =?utf-8?B?V05VRlI0MEFwQitIaWJ1TXRmSGFUL1lWcVNDVHA4b0NzRGN2L1dSOHY5blhw?=
 =?utf-8?B?dUI0UXR5TDN3emlDS09ISm96Wm5KN09VTzZyaTZoazdWa2l1TDRjdFdvV0xP?=
 =?utf-8?B?S21nMm5rVzRWUnQyNVpLc2F5c0F6cGdMdEVDblEzcXVtcVJNMzZ3akp3Vnp1?=
 =?utf-8?B?d2ZrZnh3WU9LM3E5akQxWlkwdzBTZTJXd0pXNlRLNVI4WEdDalhRK3pqR3FM?=
 =?utf-8?B?NHdDQTZtUHJiUVJMQm9BOWFXSlFMSWc3TjBiZEVnTzlXTHpRaGcrYW11VUlG?=
 =?utf-8?B?UnBzWlpIVjRvaVZmTmpZc3dFVU1tU3ZobG9HWFZmbnZZdGQwU0ZEYzBYdzFZ?=
 =?utf-8?B?NUhoUEtQdy8ybWhRcnBDKzlETFVGNlhGK1RidFdHeit3N0pldTBjQzBKM1p4?=
 =?utf-8?B?ZXRDQWNudWxtRGVwOHB4ZlBsaXZ4RzFadlhYTXk3WUZQcGtJcnY0Wlo4VWVM?=
 =?utf-8?B?YzB0RlZQdHJXYlN3TTU0d3ltZE9ab1Y3NVQxS3JIUVRUb0Vqb2RWU0tJSzNo?=
 =?utf-8?B?dVFoYytZcll2REs2Z09JQ2JUV1VjZkVkRis0VEprVGR2SXZNYzNKcmJIbzdz?=
 =?utf-8?B?ZVFOdEJqUUczSk02QnBjZnNTVENhMmgzZVMrWkd5K05rTkd3VkR4RzdmM0Vh?=
 =?utf-8?B?TUVFNFZWeEoxQ2RxQ1diZEdJMXJQWHBrTmdmTER6WTFXSnc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230032)(82310400018)(35042699014)(36860700005)(376006)(1800799016);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 14:52:39.6733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4bd131-be51-4964-950c-08dc8aef4e63
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 14:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200573

T24gMTEgSnVuIDIwMjQsIGF0IDE0OjI0LCBFdGllbm5lIENvcmRvbm5pZXIgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPGVjb3Jkb25uaWVyPXNuYXAuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiANCj4gKyAgICAgICAgIyBHaXZlIHNvbWUgdGltZSB0byBzeXN0ZW1kLWNv
cmVkdW1wQC5zZXJ2aWNlIHRvIHByb2Nlc3MgdGhlIGNvcmVkdW1wDQo+ICsgICAgICAgIFRJTUVP
VVRfU0VDID0gMjANCj4gKyAgICAgICAgZm9yIHggaW4gcmFuZ2UoVElNRU9VVF9TRUMpOg0KPiAr
ICAgICAgICAgICAgc3RhdHVzLCBvdXRwdXQgPSBzZWxmLnRhcmdldC5ydW4oJ2NvcmVkdW1wY3Rs
IGxpc3QgJXMnICUgc2xlZXBfcGlkKQ0KPiArICAgICAgICAgICAgaWYgc3RhdHVzID09IDA6DQo+
ICsgICAgICAgICAgICAgICAgYnJlYWsNCj4gKyAgICAgICAgICAgIHNlbGYuYXNzZXJ0TGVzcyh4
LCBUSU1FT1VUX1NFQyAtIDEsIG1zZz0iVGltZWQgb3V0IHdhaXRpbmcgZm9yIGNvcmVkdW1wIGNy
ZWF0aW9uIikNCj4gKyAgICAgICAgICAgIHRpbWUuc2xlZXAoMSkNCg0KVGhlcmXigJlzIGEgbW9y
ZSBQeXRob25pYyBzdHJ1Y3R1cmU6DQoNCmZvciB4IGluIHJhbmdlKDIwKToNCiAgICBzdGF0dXMs
IG91dHB1dCA9IHNlbGYudGFyZ2V0LnJ1bignY29yZWR1bXBjdGwgbGlzdCAlcycgJSBzbGVlcF9w
aWQpDQogICAgaWYgc3RhdHVzID09IDA6DQogICAgICBicmVhaw0KICAgIHRpbWUuc2xlZXAoMSkN
CmVsc2U6DQogICAgc2VsZi5mYWlsKCJUaW1lZCBvdXQgd2FpdGluZyBmb3IgY29yZWR1bXAgY3Jl
YXRpb27igJ0pDQoNCkNoZWVycywNClJvc3M=

