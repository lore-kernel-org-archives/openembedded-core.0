Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB21FC30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 11:53:45 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.65])
 by mx.groups.io with SMTP id smtpd.web11.8310.1720094018832897395
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 04:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qX7W7dj8;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qX7W7dj8;
 spf=pass (domain: arm.com, ip: 40.107.103.65, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=JEmzj9UkqOHeZrlVCPwow7MGBSBJXKl4FAvEgZhglmHbkxxtpg8+UaVAs3l6JW3XehFhyDH9XprIOrhPHzNqLXS6GVw7aw92kPBcmD1SR8IrQpBRu/O0bUg9wBmTn/J0znXmOAzAl/jFM6osRSTT98GWD+7EibjeqsKKyxrfE3wbe9I9FniQVFwfEdO5wAvSBnBMuiBmNulL55KzVnnzl+wJpNTu/T9QaXTejlBrrgUHlwmJdE9x8YOuycFSeLBQKKDLCBqDbnZ4bQSGDsvkyIgHY8VHrToeUWpxo7S0LS9dcOvCiJf/GPC/mgy3KabvW9qoaUvOnFwjockU3GDlXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhnUE/vRgTPce6UaqK/Q1SLNz0xYnUeNRBHeiOuPELI=;
 b=ZJvB+0TIbtE+q+JsMMsAVfKxBhVDWbkR3O5KLCbAIXG5hvRRsgm8dpmVvgV2o/muzi0s/fFbATnBetIg7uS9UxNRdh7wJbVyrhghmM9HJPh5UVGr6e4h3tZlQQ/B4O5RVPVHSHaFq7QklMZX/Cjax8FHNBvrr3Kiz5KfuBXKcy3GTX5EeZoSzXFuNwTxYu012VhlEBBhfhbLlhPLkg747UGiFw4Ij0SEcQtztaMrBn7C7yLJuI3yjyKGt6/IrqA2zkWdQztHScBWblUQuYsa4S6wWsO8ha2hirPdCdH8SzANNCYD4rd+5uOePJ2dUy1PZW8qbDyfC5RDSqXe6UMylg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhnUE/vRgTPce6UaqK/Q1SLNz0xYnUeNRBHeiOuPELI=;
 b=qX7W7dj8lrRmIA4GdKHrWRy77h+rFNs7Vhc/jXzKPF0OIAKVTP4eeDX9MkvYzw1oapy79zPR/qhBGQnWV00CCAv5AOBlFo3N2Z5RHI4DpYPpI7y5BFdG+41P8uEkdcbbxl7Eg3PSxpDMbaENR+C4PTe0ig9nPu1lIqFYelK9mlA=
Received: from DU2PR04CA0052.eurprd04.prod.outlook.com (2603:10a6:10:234::27)
 by PAWPR08MB9007.eurprd08.prod.outlook.com (2603:10a6:102:340::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Thu, 4 Jul
 2024 11:53:33 +0000
Received: from DB1PEPF000509E5.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::96) by DU2PR04CA0052.outlook.office365.com
 (2603:10a6:10:234::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.34 via Frontend
 Transport; Thu, 4 Jul 2024 11:53:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509E5.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Thu, 4 Jul 2024 11:53:33 +0000
Received: ("Tessian outbound 04d7821d2c87:v359"); Thu, 04 Jul 2024 11:53:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0e89dec61d8cd756
X-CR-MTA-TID: 64aa7808
Received: from a7b9731b26f3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DF4F580E-8034-4992-AD13-7D56FAF363B0.1;
	Thu, 04 Jul 2024 11:53:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a7b9731b26f3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 04 Jul 2024 11:53:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKGtRe3skrcezM+9tGiAzzyE9QSKHlrSLrYjzrYFVff67ERfAUpBPyklKZkF404L2DCYnM07cSTxMiDLviQRpRbCmOpJg7GBNNI127vZZWsZTtaZlY/ITnd/Toavf8eDhuUkDZwQRipzruWwZ2ur5rK94QnsU4UhSWWhO/0ZWI5uzwpwdSY7chqMJLinYBbv7Q4TbHYLKphjEmcZyBVl6SHL2Yx07k9NiDbrMjbSpOhtXDpH3rhdU2cthSvviUr26heHGAZFdZyu8lqSE1SAs1jDuWrdmK3F6Hj1g/587h3NH+35X2dU4Ou3tLJw4u036KTvcAzE0dLfPIG8LlJpag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhnUE/vRgTPce6UaqK/Q1SLNz0xYnUeNRBHeiOuPELI=;
 b=K6I4sgvc9Q8Th/TTxQeopzcaOCdOARjz5XUySrlWJjQyjWXY4tPmDaX/+Ugw3mai7BT9XcL3zgiam2sfEXj42Da3bN74m+w+Dg74Wwrtr+gRDX1l5ymJEjLChJDFVOIDEfK8ItPzkuvW7xA7P7Ifyksh4YQ5xn/pnB5AUGSIqeP5qaHwmq9DnKD6bM8YTBw/3dj9BlrFL7uhT73i3sGvCQF6ppHEHyI/2dPstLMymKxz+XAIz3y4NZIIjlxGvamOhgL/cO9Sux8bjYG/fSk5r3/PnsODnlsOW4OF421wdq77z9K0M3+LWIJiZqJ2xQ7IR/N62DZRnKO8/TNT3hD9aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhnUE/vRgTPce6UaqK/Q1SLNz0xYnUeNRBHeiOuPELI=;
 b=qX7W7dj8lrRmIA4GdKHrWRy77h+rFNs7Vhc/jXzKPF0OIAKVTP4eeDX9MkvYzw1oapy79zPR/qhBGQnWV00CCAv5AOBlFo3N2Z5RHI4DpYPpI7y5BFdG+41P8uEkdcbbxl7Eg3PSxpDMbaENR+C4PTe0ig9nPu1lIqFYelK9mlA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB10405.eurprd08.prod.outlook.com (2603:10a6:150:14c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Thu, 4 Jul
 2024 11:53:24 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 11:53:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Yash.Shinde@windriver.com" <Yash.Shinde@windriver.com>
CC: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 9/9] rust: Upgrade 1.77.2->1.78.0
Thread-Topic: [OE-core] [PATCH 9/9] rust: Upgrade 1.77.2->1.78.0
Thread-Index: 
 AQHay5krYSY9OeoE90mR7mooEmQQw7HjJU6igAA8mYCAABqZgIAAD6+AgAApmQCAAPUbAIABabGAgAACvACAAFqdoYAABfaAgAACaYA=
Date: Thu, 4 Jul 2024 11:53:23 +0000
Message-ID: <4FC3C83C-C57B-47BB-A926-466885756452@arm.com>
References: <31491.1720072149300569224@lists.openembedded.org>
 <Groupsio.2.31491.1720072149300569224@lists.openembedded.org>
 <17DEFC31DA378080.5810@lists.openembedded.org>
 <CANNYZj9PzQg+FfTdULjsGty3J2w3eyVu5kktQA0HdJS-h=E1KQ@mail.gmail.com>
 <daf07720-a442-4d63-a2b2-a9cc27fa14f3@windriver.com>
In-Reply-To: <daf07720-a442-4d63-a2b2-a9cc27fa14f3@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB10405:EE_|DB1PEPF000509E5:EE_|PAWPR08MB9007:EE_
X-MS-Office365-Filtering-Correlation-Id: f0279cd1-0cfb-46a8-ee33-08dc9c1fee2a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?akkwa2hNZFdWYWZwaDVIRzBLTkxIYUM5aHlWeURVd0l1clhPUG5CcmYxaFhU?=
 =?utf-8?B?dTVmWlFIeG5mNXYzMWtJVk9pZHR0NXVQSmtEK1B5dGMrTXlXNkR0SXI4eVRY?=
 =?utf-8?B?ZWlvdDJTSWw0MU43VllEZmdQUzI1VUkraDFlUTFDRjNUeDdBSklPd1FOOFJy?=
 =?utf-8?B?SnVnNHptZXB0YThmQjBFd09qK3BnZXRPSnBOSUVkM201b0tVMHVXYjZWVUZ3?=
 =?utf-8?B?eHp5d0h2UU1Nem9TVnA1TEh1YmxSMlIrbFBYQUpXR25ad1U3NnkzUlBLbHU2?=
 =?utf-8?B?VzdxajlvSGExM3Z6MkplWUNYK2N4Z2ZIYzFoQVNuVHo1YWI5VHI3YzlkY3FS?=
 =?utf-8?B?UEpzV2VsZTVNeTB1SzJVNmt5QU5BNnRuNHBuNGZ5Slc3ZmFwbDdVaUJOY0cx?=
 =?utf-8?B?UWg0bUxrNUFic3Q2dzB0cTNNZlVQNTRVS25QOEVVa1dOZ2NaaGI5enBRRlNP?=
 =?utf-8?B?SkE3dUFvUlVTeVdEYXJjMGV3L204ME5MRWIrdk9pNjJHMFNwTG1xNTJXc2l2?=
 =?utf-8?B?UWl3dm1MVEwwTjBJUjNkb2FGWWRlTWY4M1Nxc2QxeGhvZUV2TU1YdksxUjI0?=
 =?utf-8?B?cnhMTS8zdnhScVZoRFBOR2kybnZBeFJoVDBUUDZQcVV1L1JlNXdzNExjSm5k?=
 =?utf-8?B?aU9EVUFkUWRxNlk0QVZSZ3B5eVAyVURxc2d1bjQ5Y0EvenZya3hFNGdXcDQ5?=
 =?utf-8?B?WGZRTTZqOVlEdDlHbTNpTWhhdEVBRUk1d3QrNVpzZGlFc2JXQ1hPdzNIOEQv?=
 =?utf-8?B?RmxONEZDQkIyWUQ1bEhDeS9ITDZrVWwxNnVpdVlLdHlmeVgvTDgzVXdUL3Zj?=
 =?utf-8?B?OXNKUEx2V2FNQlowc0g5RzIwMjZJNDlCdkpGalplQUN3MnFDbEhWSWdlWEcy?=
 =?utf-8?B?NFVqQ3h4WkdreFh5RFZyeTNNRGlqK3hTZXRUdk15cmVQM0lKYmQvOEppMkd0?=
 =?utf-8?B?RHhqTHlLNjRJQ1NDRWN0dmdvM3pmN3JVUUpQQ1E5U016WE9vWnUyLzQzdFVx?=
 =?utf-8?B?UU5xemtGUXBla1hBTWRwbnE0Z2xEbGRIUW1nb2loQTdCdUc4Sy9UZ0tpWnp4?=
 =?utf-8?B?RzdvZFJuUmJJRkdDQ2Qzbm0rek9URkxWaGpkNFZnWUI1RFJhNWUwNmVyRmpW?=
 =?utf-8?B?ekN3U0t4T1RUb0JIK29pU3hEWGhXRW50OFd5TzlMM0RMcENEZDFRVXQ3NnNy?=
 =?utf-8?B?bVNBcHB5T3hvL2dzWS9GcFJxZzJUVFRwWHhDR2ZDS0kvaXBvNDg5YmEyeDE0?=
 =?utf-8?B?QWxsekdKMzdXMXFKVzFHZm5EbGx3UnpRcGo5UDlpR05RSVJmSlVmU1VKdk1m?=
 =?utf-8?B?RC91a1VYNlFnZkR4azVCaEdOT0NlajQzOWZyMFZCRDEyMXEzM2ZHK1hFT3Ju?=
 =?utf-8?B?cm1UTkI1Q25wbFJiSFJ0YUJiT0c2aWZ6Z0ZjMk9QUmdlZ3lFY3pSNHFyaGlx?=
 =?utf-8?B?Tm0zZXFmbFlzU3RZV25ZZHhHRXVlL1NqenlyM3RhaWFTSno5dzZ2Z0w2b1F3?=
 =?utf-8?B?WXBNYTJxYy9lY1ExbGoydzBNMlNObjNJMGpOcCtzWnRaM2tIdERIT3BrOUlB?=
 =?utf-8?B?YzJxNFJVRWl1aUdueWRVK3pBSW1nSitQam9ROElYTFVpeVdyTUpndUNrYnpZ?=
 =?utf-8?B?a1RjZVNpK2tzYm8wTWNRMUIzZnFqZ3MvOUFiU2duMWFUVGRkUVp0QTBRQVFt?=
 =?utf-8?B?dUtDalkwZ29LejBEcXl0L3RzcVNsbzlITkxVazhLZXRGQWtnT0tMMzZBTlRP?=
 =?utf-8?B?bFRKQVhIN1ppT0lqNHR6MVA5Y0RMNjBJYlhuVXpGMis2WTlNU29SdWxPeTRS?=
 =?utf-8?Q?vXsiJi1piC7NvM0ViKDkhnuZMbwRHFWxcv5T4=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC9A3A00AF2E5846B510335290A5E06C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10405
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5182840a-018c-48dd-2ea8-08dc9c1fe899
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a3pIM3prMzBNZllLZXZzNnIyL2dZRFdycFZ2RG5wOURiM0dEVzhpZ0NKbW5P?=
 =?utf-8?B?TVJqK3Q3OThaNmtweHU5aHdxa29jbVFlQjBGc24wQmJoLzEzeFUyTk1YZ3Fn?=
 =?utf-8?B?Nm93TGtzMHkwSmJ2bndxQitwbjBBSWRWYm1QWGdrekl5MWtwb0cxOGVXZDQ1?=
 =?utf-8?B?bGdyV3JnbUxwYnJNUUtuYVhkZW5LQ1FLcTR2U1ByN0xkZWJHZlloVG9pRHZt?=
 =?utf-8?B?SGw4dDdqV2tKaTZqajhCVW1SVVJ4SzBma3ZUdzNhaVVyWi9FMXNVUzViRkdE?=
 =?utf-8?B?RUpYVVkwSTYzaGY4d3I5YUVWRkl2WUNNeVJRYTd4OC8zTm1mcWRYbnlERVUy?=
 =?utf-8?B?SDdNQ1FBWkJySm9iMTFPU25vVGdUZW84UzNldlRta0pOYlZId2xkd3duSlEy?=
 =?utf-8?B?TWR2QUI2TkpHcVZqYmMzWitoZ1lUT0k5Q3dLUE5RaHRjRzV2WWdtbGNabVpU?=
 =?utf-8?B?cnp4TVRlTkxVRUNFMTAvdEVDdnRadTZHaWlLKzkvWi8zWG43Qy9FcFdkdys1?=
 =?utf-8?B?emxrVzA1K2w4TnVOT002SDM0Ym9XdVFUY3pxRlJ0ZXJTYjlIOGswTmtrdDkv?=
 =?utf-8?B?TVBEeml3YTkzdlNyWGlab3BTRzljQXpTQndOQjBjOElmV2NFY3RaSllyVkUv?=
 =?utf-8?B?QzJGUVlQSENLRjNnVW8xby84ZWg2TmpGc1ZLdkVITCszZGU3RmIwT2h4M3Jq?=
 =?utf-8?B?bGhpbGtuME1OZ0h6SGVZd1o0c2xibkhiaFNaRGhsQnJydTl5dURIeENDWFFa?=
 =?utf-8?B?OXhYakZQai9VbTROVVVVNElmamwxcktjQVdpSVNqWExxSjNyVnNicTJ6dWE1?=
 =?utf-8?B?MVBhVnk1WjJRY1JrNCtMWkJhTk5UVkl6RGZ1QUxHZkNsTnJrYzVWOU1YM1ZY?=
 =?utf-8?B?TGwwbEp0VEVKM29PemhyYVNTWkFRUi9IVDg3eEJGdWlkcDh3NlAvTUFUdkxE?=
 =?utf-8?B?a3RzTTBRZTdHOWs5V1lNZHZUREdKRnJnWkZnZXVQSDVMYTlodldtWjZ5ODVE?=
 =?utf-8?B?ZGNlbzlHVDZJaFFHR1lRYmxnNkRHc05IVE5KZkxNb212UWZyeHJlbm00TGR4?=
 =?utf-8?B?c0Y0WVBtZ0lxZHZCbnc5NTd2TG9ZUUM3RHdTZjBjUjc2elMxTDQwZW1HNzh0?=
 =?utf-8?B?Q25tKysxM3NjNjlrSlpuSkNHTWk4UWs5ZXJWYWRFbGg1d2tSajhLM2kwaTJD?=
 =?utf-8?B?WHhnUnhJYm1Ra29yR2srNWNtd1ZHR0JCaldqcGdTTlRMZmlHVWNNK05Bbm5D?=
 =?utf-8?B?NGRQSG8vSEZBbE9SeG5iOEI0M1UyN1hSU2ZmQm0xN04vMkxML3QrNkg3TVpl?=
 =?utf-8?B?WXgwSzlPSG5LNkdjOXZYbFJZVUg2RE0vbndkdVRUSCszSEJzTGlOVmJMS1Ix?=
 =?utf-8?B?TkhyMEFhMU9UMENtODBxZGdOOG9ZWXdGOVhVRCtpWjdESVFNOEx6UFVMeFY5?=
 =?utf-8?B?MmpQQ2craWdrR0VRbE03TDJDMUJTcDkyakcyVkRVSVNKSDl6Skc1Y2NqRXAz?=
 =?utf-8?B?MHk1SlJic1hjclNsaEY4bGE0R3JKNjJxMWxsNGNRT2pwSE1mb0lvZTlYenBl?=
 =?utf-8?B?UkZpSStESTY2enlPdHA1bEVjNUhwWnZtMTViL3psYmlZU0ZMcTlsckxKMk5O?=
 =?utf-8?B?bGRXbDFWRHFZalhuMzRRaGNPa3dJM05mT0VZcmxIdytQQncxSGxpMEVwQ2Yw?=
 =?utf-8?B?aEZNSjBhV05sbzRkY3FzT0daUzllaVAxaDFqQlFFckdkQmZUck0rWmFMckpQ?=
 =?utf-8?B?WlJWZHdQb3MxcGpvODVlUi8zRUppUWJvY0Q0MzlNWXVGR0JlZ0pyazZxLzFk?=
 =?utf-8?B?Qm4xOUNsNSt6TkRqWUlRTEJCMUpIWURYQkhLdCtvUGgvSWMrd1cveE1xV3A3?=
 =?utf-8?B?ZmVOTEhZRjEyQWlzaUNiWThBY3c1dkNMVDBVNVNqRE5oZUE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 11:53:33.0509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0279cd1-0cfb-46a8-ee33-08dc9c1fee2a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 11:53:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201541

T24gNCBKdWwgMjAyNCwgYXQgMTI6NDQsIFlhc2ggU2hpbmRlIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxZYXNoLlNoaW5kZT13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiANCj4gDQo+IE9uIDA0LTA3LTIwMjQgMTY6NTIsIEFsZXhhbmRlciBLYW5hdmlu
IHdyb3RlOg0KPj4gQ0FVVElPTjogVGhpcyBlbWFpbCBjb21lcyBmcm9tIGEgbm9uIFdpbmQgUml2
ZXIgZW1haWwgYWNjb3VudCENCj4+IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1l
bnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQg
aXMgc2FmZS4NCj4+IA0KPj4gT24gVGh1LCA0IEp1bCAyMDI0IGF0IDEyOjM2LCBBbGV4YW5kZXIg
S2FuYXZpbiB2aWENCj4+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGFsZXgua2FuYXZpbj1nbWFp
bC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4+IHdyb3RlOg0KPj4+IEl0J3MgYXJtL2Fy
bTY0L3g4Ni94ODYtNjQvbWlwcy9taXBzNjQvcHBjLg0KPj4+IA0KPj4+IEdpdmVuIHRoYXQgcnVz
dCB1cHN0cmVhbSBoYXMgYWxsIG1pcHMgc3VwcG9ydCBpbiB0aWVyIDMgKG5vIHByb21pc2VzKSwN
Cj4+PiBhbmQgcHBjIHN1cHBvcnQgaW4gdGllciAyIHdpdGhvdXQgaG9zdCB0b29scyAob25seSBi
dWlsZGluZyBzdGFuZGFyZA0KPj4+IGxpYnJhcmllcyBmb3IgdGhlIHRhcmdldCBpcyB0ZXN0ZWQp
LCBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBiZQ0KPj4+IGZpZ2h0aW5nIGFnYWluc3QgdGhhdDoN
Cj4+PiBodHRwczovL2RvYy5ydXN0LWxhbmcub3JnL3J1c3RjL3BsYXRmb3JtLXN1cHBvcnQuaHRt
bA0KPj4+IA0KPj4+IFRob3NlIHRhcmdldHMgYWxyZWFkeSBoYXZlIHJlZHVjZWQgdGVzdGluZyB2
aWEgYXJjaC1xZW11LWxpdGUgaGVyZToNCj4+PiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3Jn
L3lvY3RvLWF1dG9idWlsZGVyLWhlbHBlci90cmVlL2NvbmZpZy5qc29uDQo+Pj4gDQo+Pj4gYW5k
IEkgdGhpbmsgd2UgbmVlZCB0b29sY2hhaW4tbGl0ZSBhcyB3ZWxsIHdoZXJlIHJ1c3Qgd291bGQg
YmUgc2tpcHBlZC4NCj4+IEkgc2VlIHRoYXQgbWlwczMyIGlzIGFscmVhZHkgc2tpcHBlZCBieSB0
aGUgdGVzdCBpdHNlbGYuIFNvIG1heWJlDQo+PiBtaXBzNjQgYW5kIHBwYyBzaG91bGQgc2ltcGx5
IGJlIGFkZGVkIHRoZXJlLg0KPj4gDQo+PiBBbGV4DQo+IFNpbmNlLCBydXN0IHVwc3RyZWFtIGFs
c28gZG9lc24ndCBoYXZlIG11Y2ggc3VwcG9ydCBmb3IgdGhvc2UgdGFyZ2V0cywNCj4gd2UgY2Fu
IHNraXAgdGhlbSBpZiBldmVyeW9uZSBhZ3JlZXMuDQoNClRoYXQgc2VlbXMgbGlrZSB0aGUgcmln
aHQgdGhpbmcgdG8gZG86IHdlIGRvbuKAmXQgd2FudCB0byBzdHJlc3MgdGVzdCBjb21iaW5hdGlv
bnMgdGhhdCB1cHN0cmVhbSBkb27igJl0IHRlc3QuDQoNClBsZWFzZSBiZSBzdXJlIHRvIGFkZCBh
IGNvbW1lbnQgbGlua2luZyB0byB0aGUgcGxhdGZvcm0gc3VwcG9ydCB0YWJsZSwgc28gd2Uga25v
dyB0byBjaGVjayB0aGUgdGFibGUgcGVyaW9kaWNhbGx5Lg0KDQpSb3Nz

