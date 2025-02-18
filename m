Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19003C02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 15:50:32 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.81])
 by mx.groups.io with SMTP id smtpd.web10.22672.1739893827106314279
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 07:50:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=CzjMf/0i;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=CzjMf/0i;
 spf=pass (domain: arm.com, ip: 40.107.249.81, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HcpdKlwQ9zCwRKVzQqKmgvvDy0/1fYjUoSXFGY1wVgjX/Y3of79GgMMTXV4avAd7ip8xWhOcjHhdNVC+NgnG32nHn+J4UVmywUS+3cA7kgWbshQ4cJmxMkj7c0eyytdZ6WM9Px2K0Y19lyNawppbwxHBgv7lVPhpK4jkaM9vWb+210Ostq7jKnM7exSUr9CVkneaCqAkm805p4ZiUFSSBDLdPmToTw3uGs8V9Ki7lg8u3IeStzU4fI75mxPxG4Tt2vsmquQH0ir2YYp7QY4gK4cXBZ3fZ7/Op4ODx++XF6U0OrqYagFjkkXSBmChpKdexijLU4tx8qHYNp//ZkSI8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJgGDxQGjZ7+Dmbe0uUh5NtR3fLxgq2qZbj5s5rwyRc=;
 b=jVEJv05iiWPhoUsw7hnKmy8Erg1/JyahzNhGJGJZwYopBj47r3IgZJKM0JEJb/ke9GTOaNS3FtW4ehyuxCgeZcLbEYnePqVJMjdS6Hiku665lZ/ota0XTekvcM80vMxbTLcT7E8iJvrHSMcYOv55Pzn3xrJngUKFS3eczVas4SYT/Hi9REC94GNmPZ7rpcZRJPtSFBoODu6hGduUtqxT5AiSGVkTC4NjCS4UyvNFfUgWXCG8UwJsrECOe4FUMTYvLJr0ehWfZCsHN//jAHj7b5+eXdSVwt1XsnN6HIUsZA6RRnUccOS198+orVkblyelM7kdY1qyOcdrCZ423jtzwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJgGDxQGjZ7+Dmbe0uUh5NtR3fLxgq2qZbj5s5rwyRc=;
 b=CzjMf/0iU078QxtHVutxY4zKF1Q4jNrLkgnee39n8e1jWhD84wPar4nPruONWnd/7ALw+EG/WQaV6IpYjfD6qubGG8wb5Br0FWwtRMCDDFiGoeuWt0RWZvLIbNNoBBHjs1Jdi/iw62UMtTez3w2jMWXvFKPTEyEJtZ0DFC6Xm9I=
Received: from AM8P191CA0018.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::23)
 by DU4PR08MB10912.eurprd08.prod.outlook.com (2603:10a6:10:574::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Tue, 18 Feb
 2025 15:50:22 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:21a:cafe::39) by AM8P191CA0018.outlook.office365.com
 (2603:10a6:20b:21a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.20 via Frontend Transport; Tue,
 18 Feb 2025 15:50:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Tue, 18 Feb 2025 15:50:22 +0000
Received: ("Tessian outbound c79bb2535b53:v567"); Tue, 18 Feb 2025 15:50:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f9bc25c05082dd94
X-TessianGatewayMetadata: 9zo0++92BPgFX8gn0GL43HDkdgqFIpZrpgYf1PxecGXO5POAZQ6zzLvPR8o9BKAxa+9d3Nrl1byVNm8WOCLqrXXTeIu1P3Csbuiskd0UKCc4V7i/dJwhGxl/w+VihOq0evPjG8lCYljsvfDsfuiYQf/YMHqjvKu06BQQOcMQdds=
X-CR-MTA-TID: 64aa7808
Received: from L0972a4bf31ef.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6107E15C-9AAB-47A7-9553-985246DF5C2E.1;
	Tue, 18 Feb 2025 15:50:15 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L0972a4bf31ef.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 18 Feb 2025 15:50:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8ncz0kltY2jQVMUXnsJ1N1dQKkZ7Nh+gErwbm6PoVFjxtkWYs9BE7t/pceC0XF5++LeSjueVZdsk6g1GIr2y8msF60mvteDiCh4vC24dSNSQ1xcFDQSEQfPhm7PHjhWd5BcSscjQ03TROkro2RLIEefqttRYq+//mUiknbMN71WIY/T1DH7Fspng6w0l7tBchVFVF2nv436b420bpz8c9lbKroKAZ8NN8QxiWINj3iKIkrAgA8yF06LXOT/62CFjnapvsoTdvU0i2EGQGg8mGbvkr9CvdvElqz0XTCYYYvFi2oTQKw5qlNVDaLGmUo/i7/oPVKTP33jo23hCH8FEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJgGDxQGjZ7+Dmbe0uUh5NtR3fLxgq2qZbj5s5rwyRc=;
 b=Dm+00xIJqC50Su5jKe6L5KCaFWQ7SNofkeXeUiEIdba6/cfm1jKxAXZ3tQX9olLuC9A0PEWKqWHA22qmxUuJzcBEyaUHYlifyNn9L03GqbVT6vHsUHSS0ySE+4j8QTHOvW4AN7+UqnC2smpImtDyR3+bmQQv55xk76if7B6ndpuGS2WbqLhrDamNlhI93qD/ktksBmJ2VX+2VZTKZXcyXHKNCutDWM/pZF5+5avE2MD7h25YVUIgedxbxBAwy1PhJlIjcjjuNX3z0HHwtCMAoubCmR0ML+NNrSPyybZBux0kpWzsxY5M9fbMbrBVPMs4ojNAL7BDXV6LkflI6dxBAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJgGDxQGjZ7+Dmbe0uUh5NtR3fLxgq2qZbj5s5rwyRc=;
 b=CzjMf/0iU078QxtHVutxY4zKF1Q4jNrLkgnee39n8e1jWhD84wPar4nPruONWnd/7ALw+EG/WQaV6IpYjfD6qubGG8wb5Br0FWwtRMCDDFiGoeuWt0RWZvLIbNNoBBHjs1Jdi/iw62UMtTez3w2jMWXvFKPTEyEJtZ0DFC6Xm9I=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB9465.eurprd08.prod.outlook.com (2603:10a6:10:457::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 15:50:13 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.8445.015; Tue, 18 Feb 2025
 15:50:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "danismostlikely@gmail.com" <danismostlikely@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Daniel McGregor
	<daniel.mcgregor@vecima.com>
Subject: Re: [OE-core] [PATCH 1/4] nfs-utils: clean up startup
Thread-Topic: [OE-core] [PATCH 1/4] nfs-utils: clean up startup
Thread-Index: AQHbfYKUmnaTNtz8UUe4zNzWEbRLBLNNPoUA
Date: Tue, 18 Feb 2025 15:50:12 +0000
Message-ID: <C4C29BDC-D13A-4C5F-A034-5F88A17167D9@arm.com>
References: <20250212191518.1968329-1-danismostlikely@gmail.com>
In-Reply-To: <20250212191518.1968329-1-danismostlikely@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB9465:EE_|AM3PEPF00009B9F:EE_|DU4PR08MB10912:EE_
X-MS-Office365-Filtering-Correlation-Id: d01ba739-2602-496b-c1a8-08dd5033f428
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?KzNQRThTb1BwVWxRN2NISlN5NTk1K2xPYTlzN2E3ZWJSZ1djYmgyTXdSQkcr?=
 =?utf-8?B?YURIYU80RkxoZ2R3STRkWUw1N2U4OXVjbm9iaUxMS0crTStXRTF5d25MRlZl?=
 =?utf-8?B?V1NRa1dkdE83OXBHcURLeGZPWXRMNk9LbzNXbVZFaUFSeWVQTDVEbkI5MGUy?=
 =?utf-8?B?MjdEZEo1WE02WUpGRGVTcHJ0SlVjWnBiUm95UVBNbXdHMEN4RlNnNWFZT1pM?=
 =?utf-8?B?eHJ5UjhOc0crZ0RkL2dpWHErQm9wdHdsZFVpVjRZQ2toamNjRmpZQ0U3Mm5E?=
 =?utf-8?B?Q1lDeFVDOHRBS0FNUktwVTNVeVN2TEh2NXdVd2VJcXdzZUdXNGxESXZwclNl?=
 =?utf-8?B?QUVhVnIvczhOT0FnckgyU1I1Yjh4cFN3RWV0YVdGWTVncG96M0l6R3JGWFJn?=
 =?utf-8?B?U3g2U0YzNy9sK0FMUUFPMUc0N1FyMDl5d2pnelJZQlgwbkM1MjJZN3VZS0Np?=
 =?utf-8?B?blhURkxXdmtuMDhSdjdPRFhxdmxzSWFBQjJvMituY3hKdmRZc3JSVmNhK3pP?=
 =?utf-8?B?YUo4TERiQnZDTlRBSHFoazNTYU0rVHZoWmIzdEZMU2QwbW5acldCTXBab0tL?=
 =?utf-8?B?Z0tWYVorVk1FajBsT055ZjBNMUJpQnRUaXI5eWJEZGhXcGVTZDFsSHc3dGhK?=
 =?utf-8?B?YzJlTWVNYkM5Z0R4M3A0YXBXU1NzY1pORmRPRDRSaE1DQVRDL2lEciszOW1M?=
 =?utf-8?B?TGIwTWczNEZ6bDhXVURkK0tkM2ZFRWM5bTNrSlA4Y0dkMU9tSUdYTDhZcGxD?=
 =?utf-8?B?Y2ZkQVNtTVBHZzJzRHc0TVpDRU9GZk5BTDNNWTNkbWhSeG5vTkg0ZHQ3TTJK?=
 =?utf-8?B?RmRSc3B2M1dVc0hNNVJrRmRoY2RlcHJiMzRLS0RhcC94endQRFl1U0RjZjZT?=
 =?utf-8?B?NVFVYWl1L0M2MEtGZGVtaDF6UEI0Z2lPb3ZzbDg2L3I3ekNXMzZ6Skp4clZ2?=
 =?utf-8?B?OVMxZ0NnNGVqbWVOWCtybkxGWGMrcndxaGNLd0QwbWFMTXBXYnJVRGZCUlFQ?=
 =?utf-8?B?Vk12eEtRNGROSVhEK2pSbzJnQ0NoamJidTRKWVBoS0JrQUdaem9FckVIbW1r?=
 =?utf-8?B?VGhDQVVWR1Jlai83SkxnT0dzVEFwVVZPWnJ1UHZxRFViV0x2aHhNMTJvYmFn?=
 =?utf-8?B?ZkFVaThlaVBtRzJid0lLTGdqeVFDYzJKbndRWTk2aFlDU0wzRjE5eEpyemhn?=
 =?utf-8?B?d1Q4RFZTc012bThVMHZkZTRNcHJUZVhRYTdoVm9OK1pDazMyOXlsa0RINkxB?=
 =?utf-8?B?L3NtR0RhdDRqYTRUb1ROMnB2YlhCM1ozVVpKeHRVZkhrdE94bHRSZVl5VUFo?=
 =?utf-8?B?V3p0aHYxM3NJQzJBNmdyQ0E5eW1KaC9RVWNGSVg0aTZqZmd0TU1ZNWRUZ1A5?=
 =?utf-8?B?ajhPTU5JY0ZHbWp1cWYySENkc1FxL1U1eFdRMDcweWF5eU0wNE9KTGY5TlNN?=
 =?utf-8?B?UEJEejFVMjNsZGwrZjNva2dCbnd0ZEJpK2tYd0FBN050NDF3RFh2MlhhbDdB?=
 =?utf-8?B?RFpUNWo3L1d0N1J5UFE0QnlSUW5xTm41Mmw1UnlJQVc2UlYyd2lVMjYySmJM?=
 =?utf-8?B?MmxyanBUOWh5djlCTVVFMmFkd0p5Tlg0LytyeU9EMUpWTUJ1OFZjWGJZTjR4?=
 =?utf-8?B?MXhBYXZlbUdkNVdEOS9MdVJ0OUNhS09KVmpIZ3I0NTA0cmM4bXNpOG5pd3ht?=
 =?utf-8?B?ZlQ5bC9aTWJ5dURmRGwxWnJqVVdtWnpGVGhDQ0tkMHVCQ2lwRlc1NjY4N201?=
 =?utf-8?B?aTdTY0pXcmY4NnpaY0VEbi8vMjdnb2NpUktkRlpiT0J3T0ZyMlMxRE5nNEx1?=
 =?utf-8?B?S0lwdUxkQlNTTitjKzU0cEFhNTIvK3psc3pzMnZreUU5YlRYbktJM1ZVc0tB?=
 =?utf-8?B?Z09ZY3VjcUlzZnkxNC8rUVRQS09pN0IyTDdxMFpWUkZkRUViaG5nTHNqR0xL?=
 =?utf-8?Q?QA0wg/cLhSeSblyKP4H54VCtJ0QyYWHn?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1465B3BC242AC4AB68D96BA31C3E077@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9465
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2adc3a08-239f-4c57-8971-08dd5033ee6b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|14060799003|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VWR6V0VBZk80czYyNnZrN1NDLysxOTlzZFZETkhnRW1wMnVNa0dta2Zid3l2?=
 =?utf-8?B?NVdoSVBOUjU5ZmNnZzdXQlNmdGMxbURLSmVpZjdzUTExdWZYWUpyVjZELytG?=
 =?utf-8?B?RUFCUHF0VHA0VVJsZG0wRTl4clBta2pOOXhoTzZxZlVEdkJIWFloMW5Ed0FU?=
 =?utf-8?B?bEx6UkJ3THBpU2hHTnFKc1VwRVBtUHE4c1RzUmRSVms1Q2JRVnBZVE1hOFky?=
 =?utf-8?B?UGg5Tm1WRzlRZkJseUVmL1lRb1VxbjM1cmJRclMrTDdsVkIxTTNHbTdBUHYz?=
 =?utf-8?B?U1J4OEFkSDdYVklRSnRqTjZ0SmtRYzNuZE51WE5JbGhVMUw2Y2pBREFVOGJV?=
 =?utf-8?B?elRIZXBFVTVEUW5hVytINGFJTG1ST3MxNlhjUTdjVDdJK25kLzJVQXNZOXZB?=
 =?utf-8?B?WThmOXNOKzNHWXp4RHVuckRvT09taEROU210cHZIWUlNeFAvSWltM1hpU2da?=
 =?utf-8?B?dWVlMDRTRnNBYUpZSnVENy9JNnJMK0Ezbm9rN0pxWTg3cEtDSEIzRjhtWWRt?=
 =?utf-8?B?dk1aZ1dKclJBYWVjZHlrRDhNQS9GN0Y2cTRPTDVZQlVpdzdQZllRYkdlaGJy?=
 =?utf-8?B?UURNdnhjZ09QWkFVN0RrSTR3ZjFIUVRNOVNBZ3FMbzRTOFgrNzNTY3J6MU1M?=
 =?utf-8?B?WVpkMm1lc1M2SGUrNXQ2Q01pQncxejBhYjVCOEhERWFIeUR0LzRTYlZGdURE?=
 =?utf-8?B?Q25JQ2c0ektETStmOVlqNTFrRHBTR2Zjb0xUNFpKWVFVSk1KU0xXK3RPVzdw?=
 =?utf-8?B?QWtHYmpEK2tCbXhVNml0emlnd1dMdTJuT3dLb1k5dGZ4Vk1oUUF0aUVwejAz?=
 =?utf-8?B?Tm1MdWxvbUt5N0RxWlRhcmFhWFd4NENZUnlESVA4M1RVQzFjOWpTUUppV0pt?=
 =?utf-8?B?RHIyZU40OWZLZmFPZjdLbzlpYWM3UEFTMnBvNHJ3b2FIOFRDT1haT0RlQWFk?=
 =?utf-8?B?eTlpQ0VydUpIV2kyZHZ1Wk42Q2tBQTlVVWFpY3NUU2NQV2k0QVZHVmY3VEpr?=
 =?utf-8?B?N055SldxZG13ZkNoRmc5bVI1SDArdU5VUElBaUMyTk5QczZuMlhUM25qZHY1?=
 =?utf-8?B?Mmk0Y0xhOFNsMmFPNlRJY1AwODBWbjhQaWN3UHBRUzJxRGhJQ0tuNXNlRURW?=
 =?utf-8?B?Z01tQmg3VUI4aUlVUitFOTVQWlNQcW9BQ2xQWFl6NEFoaGtoazV5N1ZjcTIw?=
 =?utf-8?B?WENPWjlTMW4rTTM0VmpNclNxK2xmL1Y2Tkw3U0YyV3Y4VENVeThjbFEzUWVa?=
 =?utf-8?B?RGlXVDZtYk9EejFxQ0NVTjVHekJlZWVkRjkvbUplV1hvWkhLZjdscGNKTk1K?=
 =?utf-8?B?elpRVTg1RHBIN2wrM1RUbjlzcGhxVFBTeitSTkNpaitsSjdpMS9Kcjc5d2sx?=
 =?utf-8?B?ckE1MEd5c0k2Z2RZeHlHTWpDRkpOaXVYMkcvemxyWXRrbDEvOGtsdEt1RVJh?=
 =?utf-8?B?UHZDZkNGeGc2Zi9QOWlDb0MvN1JvMzdYTmltVGxGZVhhYXRUOXBqUlMvemY0?=
 =?utf-8?B?Vjd4WkdOcGZZVGJPaUU3NmtSK1IvUW5aUGtVZXk2QzVkR1dRaE9idGkvaXVY?=
 =?utf-8?B?K2Q3eTIxYzhYaWFMN2V6YmtBbnRyQSswbE9iZFlMazg0Z0Q3MEFJVEpHdmZo?=
 =?utf-8?B?S2JzeVlhRkllaFdyaTVTeTN1eVFHYUtPYmdtZERoUnptc1h3ZnZxRGJLZUFq?=
 =?utf-8?B?WjBPRzltcUFnQXN0dW5aWG5uYnhyZUEzdzJLU0xjUnQ1cjVMU2hteFY4WmNo?=
 =?utf-8?B?c1p1WmwrQXV6d09FekJxNDUzYW1sTXZmbnlUaFlyWFc5Z1F5b3lxczNoMTFF?=
 =?utf-8?B?TlJnenRXUGNvcGVlUGJSS25IeURkVEVJNjk1VDI5YTZUZTE3SmFKUjNubnVL?=
 =?utf-8?B?WnRJeFNHYU9veXNpQ1BxZjczYlhVWVhDVXdScURmVDZJY2IrK2UyUWlNUWl4?=
 =?utf-8?B?SXB0RXQ4QzNmTmJwakxqbTkvNVpCWVU4azl3NklXS282NUIyS2pKVFcyMHp4?=
 =?utf-8?Q?Y75/OYx3SHHea9xtPMSZ6fGKM7OChg=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(14060799003)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 15:50:22.5719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d01ba739-2602-496b-c1a8-08dd5033f428
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB10912
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 15:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211634

T24gMTIgRmViIDIwMjUsIGF0IDE5OjEyLCBEYW4gTWNHcmVnb3IgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGRhbmlzbW9zdGxpa2VseT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IA0KPiBDaGFuZ2UgdGhlIHN5c3Zpbml0IHNjcmlwdCB0byBzdGFydCBhdCB0
aGUgUyBydW5sZXZlbCwgdGhpcyBtYXRjaGVzDQo+IERlYmlhbiwgYW5kIHByZXZlbnRzIHN5c3Rl
bWQgZnJvbSBnZW5lcmF0aW5nIGEgdW5pdCBmaWxlIGZvciBpdC4NCj4gQWxzbyBoYXZlIHRoZSBu
ZnNkIHN5c3RlbWQgc2VydmljZSByZXF1ZXN0IHRoZSBuZnNkIGtlcm5lbCBmaWxlc3lzdGVtDQo+
IG1vdW50cG9pbnQuIFRoaXMgYXZvaWRzIHN0YXJ0dXAgZmFpbHVyZXMgaW4gdW5wcml2aWxlZCBj
b250YWluZXJzDQo+IG9yIG90aGVyIHNldHVwcyB0aGF0IGRvbid0IHN1cHBvcnQgdGhlIGZpbGVz
eXN0ZW0uDQoNClRoZXNlIGp1c3QgbWVyZ2VkLCBidXQgSSBmb3VuZCBzb21lIGlzc3VlczoNCg0K
T24gYm9vdCB3aXRoIHN5c3Y6DQoNClN0YXJ0aW5nIE5GUyBjb21tb24gdXRpbGl0aWVzIOKApiBz
dGF0ZCBzdGFydC1zdG9wLWRhZW1vbjogY2FuJ3QgZXhlY3V0ZSAnL3NiaW4vcnBjLnN0YXRkJzog
Tm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KDQpJdOKAmXMgbm90IHdyb25nOiB0aGUgcGF0aCBp
cyAvdXNyL3NiaW4vcnBjLnN0YXRkIGZvciBtZS4NCg0KUHJvYmFibHkgYSByZWxhdGVkIGlzc3Vl
LCBidXQgYXQgcm9vdGZzIHRpbWU6DQoNCiAgLSBub3RoaW5nIHByb3ZpZGVzIG5mcy11dGlscy1t
b3VudCBuZWVkZWQgYnkgbmZzLXV0aWxzLWNsaWVudC0yLjguMi1yMC5jb3JlMi02NA0KDQpJbmRl
ZWQgbmZzLXV0aWxzLW1vdW50IGlzIGVtcHR5LCBiZWNhdXNlIGl0IGhhcyBGSUxFUyB1c2luZyBi
YXNlX3NiaW5kaXIgYnV0IHRoZSBiaW5hcmllcyBhcmUgaW4gc2JpbmRpci4NCg0KSeKAmW0gd29u
ZGVyaW5nIGlmIHRoZXJl4oCZcyBhIGxhdGVudCB1c3JtZXJnZSBpc3N1ZSBoZXJlLg0KDQpSb3Nz

