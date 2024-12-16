Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C40AE7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 15:01:50 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.66])
 by mx.groups.io with SMTP id smtpd.web10.58563.1734361300145641494
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 07:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Mj3dqkli;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Mj3dqkli;
 spf=pass (domain: arm.com, ip: 40.107.21.66, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nPBt9VwkrgD+wwXD0HabnvjMzuL/tKTuDVdxj/HcRKskljlJPLBlf0ostTIZC6oGWMrAmDy3Uy/Fll3gux46QYP1MChVHuFJWV3oTPSO4qP0Etb95ORKHfVSzTGaXt4Rlww9INb4XSzSAjiBBObtkF+IvxQ40E9YIxcAzZQTWnvH4txVsXjE0OMxENGWcdRIXa6xtHcYay6ycbqFHgqu1HI56INV+0nvtci1GYoJEhardOJBXBK1DWCmTTRwmKh0/MxCduunQuD0cBfiHu7KhDgnJ0hnMpU6ujxTSZLvHSVK5YSUfY4pg/YPUQmwM3UzojvUvb/yuf23siGS9woM7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vk/oAqSCtrwQbnp5T3fsUKXjm16SiiVagTqpybVn3QQ=;
 b=iVGvf0fZ8Gq4nYmQ10wB2tqf3H7TeNDu9/G/7A2L+3b4vnkbcU/QFqyhBzRoJf/XOwP0gyl7PCb1bXbULHc/FtYAT1U7ZZ0hBukJkFlufzGLFQRlsF80Yd0IxSccBuZqIcLi4Goko1nWo5wlPwLWUqxtVrOUGzi8lpOA4/Xmw4JP01dWezwNBIhxrVBSMur/wGEMw4KZdDflkq8+hpY7E/dtsWHPFs3Dk5iZlIZTMSGqreTZrWZFbqr+yFkOUm0Aai9DRJfPARW0jR6nmTQC1hbhaKf7v1Sks6Q7KnvqjLoe8ay2DgvLmEzMv4qv2hH502fBwXXmeyzosBoeXPxg7Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vk/oAqSCtrwQbnp5T3fsUKXjm16SiiVagTqpybVn3QQ=;
 b=Mj3dqkliBiAskYOqm0Joj0jIOxF5WPe18k3pH3HMM9v4VFvVClMKUI86spegnf8bHStqCadLeN81Q4OxIqZfZr4EF621E09PMUsKtiyW4orQbYi/LDADOqsQBrxYmob5pkxmlsya7tXJIWhILhJd5Ai9uMLBekDxaJxD5cJA8ms=
Received: from DU7P194CA0027.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::7) by
 VI0PR08MB10682.eurprd08.prod.outlook.com (2603:10a6:800:205::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 15:01:36 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::dd) by DU7P194CA0027.outlook.office365.com
 (2603:10a6:10:553::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.21 via Frontend Transport; Mon,
 16 Dec 2024 15:01:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15 via
 Frontend Transport; Mon, 16 Dec 2024 15:01:35 +0000
Received: ("Tessian outbound bf5034006959:v526"); Mon, 16 Dec 2024 15:01:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1d2bf62e6babe684
X-TessianGatewayMetadata: vgUVR+L9h7dyGJH+IFBHqna/WKOgFMQUYYchSUwfvScwDwT0n++bPyMhkUsaSTPcb0odssDgdk3vGw2Oe94GERSk/OhWRVrRNcORqOeOlvCG5a7Ltzq2ZpwIay5koc+I9g3/jEVuJ5ByLe6InnIMqdqN2OoGZ9nrw4gwiRrqMNw=
X-CR-MTA-TID: 64aa7808
Received: from La7c8c5a8a7d4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9E989DFD-3847-4D98-842A-C07E0A6AAF65.1;
	Mon, 16 Dec 2024 15:01:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id La7c8c5a8a7d4.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 16 Dec 2024 15:01:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azcEjI9biBGxqORBnCQl5+ii6WzT05PHRlMFU6wRCfCN41qHcE+7d0lF+XvipaJrEBgDdbPyLdFKaLRsptNbVkRGzJtWH6OEJ4mRugrMz+j0sV/3gCJgTA+Zv5u6fx5J/5R9DvN4Uf4A55+tTLwp0S38SaeLi+CVjydCvJd0FQy1ZyCWBRoKF/XwpOLe3wKzaD7g63+6z/2zdyI75n90f0hDSdvzeiWcAj/wp4GR+/wHxL78r9VT4Q2tDDEPS0FxNega6tpbvw3Riy7v4InsJvEHXduPeuYEGS+JE2Wm5IX4xMhphEJegk7g7EbXZJBjeawSwj6FBE9COPSGfak64Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vk/oAqSCtrwQbnp5T3fsUKXjm16SiiVagTqpybVn3QQ=;
 b=oaJy2kmx7ToNjTdOl56nLd8T3JmVtCUfD7c25aYZBKxI2ll27yIq4thXCbkeu6CIA9TRCOFPUtuD9XrYwrcUIj4osBk8TI7Hat1DVGB3zRCgQnGvzF5yvRlI1MlxlKRyMGsJBuLP9TWDXHIqIBY/YzD8NTF1cHM9Iez+VmnNN1Q/hfNU5wZqJScza1MERt/v3HRIZItq4Wik0c5Ohe9x6DH/es5EHByLMRs9pmgM+a555Inw/F9aFiMQZUaOSD/6K254kUTsyLqnJ8HMI8X9JLTLQpPDpA2wrdPLZx/oyJK4iGF9CPQ4PxsdcVO54PmjiCG15d8SeK0i6DxWOPb2Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vk/oAqSCtrwQbnp5T3fsUKXjm16SiiVagTqpybVn3QQ=;
 b=Mj3dqkliBiAskYOqm0Joj0jIOxF5WPe18k3pH3HMM9v4VFvVClMKUI86spegnf8bHStqCadLeN81Q4OxIqZfZr4EF621E09PMUsKtiyW4orQbYi/LDADOqsQBrxYmob5pkxmlsya7tXJIWhILhJd5Ai9uMLBekDxaJxD5cJA8ms=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5557.eurprd08.prod.outlook.com (2603:10a6:10:1a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 15:01:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 15:01:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "rybczynska@gmail.com" <rybczynska@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Marta Rybczynska
	<marta.rybczynska@ygreky.com>
Subject: Re: [OE-core] [RFC v2 0/4] Allow choosing the NVD feed
Thread-Topic: [OE-core] [RFC v2 0/4] Allow choosing the NVD feed
Thread-Index: AQHbTGLHhkKfBriF4UyuffEmzPmCRLLo/VGAgAAAoIA=
Date: Mon, 16 Dec 2024 15:01:27 +0000
Message-ID: <94803B52-5DE1-4695-96C7-0C4C9B227AFA@arm.com>
References: <20241212065435.15582-1-marta.rybczynska@ygreky.com>
 <B9D4F85A-EFEB-4D83-8090-01753565B29F@arm.com>
In-Reply-To: <B9D4F85A-EFEB-4D83-8090-01753565B29F@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5557:EE_|DU6PEPF0000A7E0:EE_|VI0PR08MB10682:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cb3cbfb-aeb1-4430-824d-08dd1de2891b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bXVFMDhVUWdlRW9wSlpFblpKZjQ4L3I0dE16SU9KNHZvYnJza0tIc0paYk8x?=
 =?utf-8?B?V0ZkZk9aK3ZqTEJTWmQyZU0yMFhUVFcxclRjbEhoWlJWb1ZKdm1DdTVsNnE5?=
 =?utf-8?B?dXpJWG5sOHVGREJITitRZ3pQZkU1bEVSbWliMW5sR205YW10V25JeVREclhZ?=
 =?utf-8?B?SWRCQnR4QUlhOHU1MXR3d241YVIwTXVwL1ZIeENsZ25WWlpPV1lTLzhoTU03?=
 =?utf-8?B?Qk5sT0NsTzYzQjZKekZwYnFkVEJ2VS90Rzc5dDVXQURkRUp3R1R1TGJUZURs?=
 =?utf-8?B?amFYa2g3MC9ITWlod1l1cldkcW11NFp6aXF6dExleVZtcWZoNzNkWFpQL1Jz?=
 =?utf-8?B?ZDFSNjRWbVdZR21vWGtaNXJZbWE3MnJaTXNaSitiVDRaM1EzeFBDSGgzM3BR?=
 =?utf-8?B?OTlKdjRzU0txNDZOdDlPRHF4WXJjNnBONW5kWURlYjB4Y3BSYkE3UXh4SE5k?=
 =?utf-8?B?QVBRUlpuQUdsanN1RTdrN0xzaEpnVUFZam9sM2I1MmhkSTE1dit0MzBtMzVV?=
 =?utf-8?B?QzBWWjQ1Z2NlT2dxNmdEVzBWTGJwRFNBZGFldUxCY25oVUFlY0xDQXpCS0V1?=
 =?utf-8?B?aGZMbytPWlFZYm1HdUl2anozZ2M4QXlCai9TQnJlUDJBb1BXWVZnVmNHWW56?=
 =?utf-8?B?Tkl1TFUweHpaS0V5ZlRjZVpVc0F5ZkRPVnRMekl2Q0dYK21BVDV3T21GSUZs?=
 =?utf-8?B?ZVBRL0ROTEtyZkxZMEY4bG0yZG1vNy83aVk1b1FZdWh4ZVQ5ZzY2Q0VGZ2lG?=
 =?utf-8?B?TlRLaVYyVjJaQ1MxNXUyc1dZdmNZVGRhaUt6dEZ3bG5reElkM1FDbzRUcUZQ?=
 =?utf-8?B?Y0o0MlRKRldONEt0OGlHRmJsZmRscHUra1dyUzRRQllJMHZXZzNKL2JyUTdK?=
 =?utf-8?B?WVNVdHd6dm96WnMyR2Z2bnc4WWRJZFJRQVoxMjVneDdLeUFpdFN2ZC9QQzhF?=
 =?utf-8?B?V0puSkpuMDdNSExENHpaLzRxb3FNeXgwZXg4Y2MwTTVCa2FFMTB0ckZmaHlI?=
 =?utf-8?B?QkNoa0x5ZFNaTVJETEtlQnI1YURNcU0xRWNBUndJZzlDRjhEMStZY2pVb2R3?=
 =?utf-8?B?bWRUeVV3TkYwcXRxRlJLVmdHRnR4Kzg5V1FDZkgyRjgxTCtOZmdjN0d3RWRJ?=
 =?utf-8?B?bVc2dDhGVjhXVkhyK3VoL3NrUEpxNzBialE0cmFuMjNnMTJxUEd0KzNrd1I1?=
 =?utf-8?B?dXNEUkQ1c1RCcWQyOTg2RTBHeGhPVzFhcGFockFVY09UejBLNEs2NDE3OGdE?=
 =?utf-8?B?K0dldTJ4VkJzdGpNL0V5bVVQSTZrWUF6Y2xuSjJ6bURHeWo2TnFnV3d1Mm5z?=
 =?utf-8?B?c2swTktYYzkrcW9tR2tpTFpnRkpNQ25wYUc3VGROT0djSlFpS05WVS8rd09E?=
 =?utf-8?B?b0x3TWVPTnk4WklTYTJHVnNBK09FVElyS2JBSVdneC9iTmlQYXI4akdHZktN?=
 =?utf-8?B?SVU4UkZZaTRZTXh5eTNidmdROXF5T2RpM2laWW81cWR0dnR5aWJNYXNQNWpP?=
 =?utf-8?B?eWh3MWEyQy9IUE1CeU5CNDZBOWlVOCtyeUNJZGJjRFIzQ3FJaERqbkcxNW5Q?=
 =?utf-8?B?eFc1ODBLeXZXQk92UVMyWWNab1E2WStFRHV1V2xlbHFXVklYZ0lIZ3YrNDRH?=
 =?utf-8?B?d3Bja0YrU3FnQ3IweXFhNUM1WmpjeG1Nckp3alM4ZkV2SXR4MFVMS09DU2ha?=
 =?utf-8?B?UHlpME5OYlZMMXYxNGdMSThNTHlHSFhjbVNLVUFYbDV3Q0U2OFZvQ3ZIL2ZC?=
 =?utf-8?B?YlRJUWRWaFVmWVY1aUwxT0JUUEpPOUJIREZ1cXlPR1U3RjlJM044WmJMVk5Q?=
 =?utf-8?B?ZmdudWhjamdkTk1GT2FNTFVkaWdJcVMzdEFrM3djTGxpRHg3d1lQV2xnUXRP?=
 =?utf-8?B?MzhrZUorSDBRSk0xaW9IZFhXRmhienN5VjVSMW83ZlpYZldwU0VoK2xKaGFv?=
 =?utf-8?Q?qWyz/5ZBuGh8MDIWt4owhe1tkXZ2cD+M?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <348A2358AC58354A89657655B25F591F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5557
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c36c7991-0e27-45de-e95d-08dd1de2845d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|14060799003|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SHRsY2hvT0pKeGlaMVUzbW5CTnpqUWo0UkJQRThnZlEyUHVabFlsQzc2dHRn?=
 =?utf-8?B?OXNZcTJFZUVMUmdUVnFZNjVQSXQ2bFVNaVp1K1JrTW04WERMVitraXM1R0li?=
 =?utf-8?B?aTZBWFFDUy92djFsSnlpa1VZdDlBVXlCZE5GdXhRU3Byb1dJRWpDbWp0ZExP?=
 =?utf-8?B?eWpXWEtOcEV1NEFmWkQ0T2NoRVJYWmpiMXpYTnBRK1IxU2hVckF1WXF0OVBE?=
 =?utf-8?B?K3FPOEJpUUpDTVdvVUk1WHZaNlNTK3B2MjAwRWdFRWI0YllnWk5HRFozY0RU?=
 =?utf-8?B?aktBMDBteW5ETEdIazRmbWh6NHphYVp0Y0pBNFBpbU9Vczg2R0pKZnl3cjBy?=
 =?utf-8?B?UHdwL3VHbTJ5RmF0aDRJaHFTNVJHTFpUSGNQRUpCZ1JPc3RTVHZTRXRNdFVC?=
 =?utf-8?B?UW53RlhHQmUxT0owa1lRRk5LZTFna1piZUVTK3FnR1VPSFpwSHhDekliZnkz?=
 =?utf-8?B?ZXA3QjFnUUpmL28zcW9vR1ZwNVdqSXBkK1NUUlE2YXpKRmw0Z1IzaWhwTURt?=
 =?utf-8?B?QURoWHo1TCs0QmRKOVVVOEsrYnB5ZC9qYU0vMENIVVllVkJETmxrbVVkNnJU?=
 =?utf-8?B?QzBrd0l5WlhMSXZBNzNmRzF2a0JXaFFMalZyQ2Mrb0c5Z2cyd0lIelNycEoy?=
 =?utf-8?B?VE1wZzRnUjFSYmJsOGdCYjgwN2FTMWtOeWJwcm5UeXJ0eGlYd2FoU1VMRndx?=
 =?utf-8?B?c0x0Q2ZkMjE2Tm96dDltZGxJQnJVay9XN002UzZIamw0UDVjUFUyWVFvNGZV?=
 =?utf-8?B?V0pQaUpRTmFXUnR1OGNSWHlybkhPN2lPUjB6bUVaakV4ejYyVk5MUll4bUFr?=
 =?utf-8?B?QkY0bTZCaVNkUmUvdm9VWWFwY3I2dkZ2UXlxRGJMcy9kK0VVd0ZZTklGR2tn?=
 =?utf-8?B?ay9EcmJGQm14ZTVIU1RYdGljQVkvVlluVStnVGRGNVRZTE9VcFF0c2pCYXVa?=
 =?utf-8?B?UGxrdXF6eUxrTDhzM0M2VmxSY3ZvN05ZVDlPczRaaDVZOE9jRWd2dEw1QXA5?=
 =?utf-8?B?TFJOVWdML1ZycW9pbE5WZG1mNVAxaS9FUUs4OXVIdzVKVEVobnQ4WHVBQVVO?=
 =?utf-8?B?Uy9zRVdHY3IycVhFRmZGc1lGTHY3RnNVaEtjKzhwa0JwREF0WmRreXpkMDBp?=
 =?utf-8?B?UlVnU2lmWHhUNzRhWEQ0U3dVMkJNWGhDVmdvQVYrVmRXUWF1S1o0d0ZhUG1M?=
 =?utf-8?B?aDVkeGFha2RuZ1BVVHgzRDg0eHFRSDJvSGJBUUtZMDNZVlB0Ymt2M1loYi9y?=
 =?utf-8?B?R0xsbWhRWUNrRSs0eUExR0RhS0Y5UHZGRFl5OGY5NGVHVm1uRGpZNTdiNUtK?=
 =?utf-8?B?YlBHckdWUndsampnb25uZ2IrR2hROVdXWmlnVlp1U0YzQndDKzdyMTRCYk9t?=
 =?utf-8?B?TzVQQ2t2andrN3RNMkEvN1puZXFiTWVBcEpDYUpRNVZmeUV1Q3NoZHZXeGcv?=
 =?utf-8?B?alNwZVE3TnQwL2twWlVIdzJKNGZKak5vaWdJd1VGbFNka01PeUl6V0Q2ako3?=
 =?utf-8?B?WUVYSCtEMERQREJPMjNjNjVWeXp6RnNIa0daMDZva3FZR2FFRklBKzY2VWxK?=
 =?utf-8?B?QklsakRER0twbUtReXpnUmIwRzlDd3Z1WlVtaUtMVXRRSENKbmFwRk5EWjh4?=
 =?utf-8?B?b01PeW5kTTh6YmNLZ0JZRnp0SXR1aWhIZDBya2t0eWNOaHpOSE1icml4anA1?=
 =?utf-8?B?ZVR6R2creE9XeWdxTHgraTFGRjVTdExvaERpZmkvRDlkODNYYmUyTExNL0xq?=
 =?utf-8?B?eTFWQWkwOXM5WXZhTmQzdnZWeFFmQTY2SHluWFVFRVcvN0dRK0RmZ04weStZ?=
 =?utf-8?B?bmE1T1UxN1F5ZnB6RWZRSk4wWEw1UnpDbkdSYklvZ2F6ZVhhdE5jb3JXbEFF?=
 =?utf-8?B?d2R0UEJKdE9wL2IrZTVlbW1rczZsREZvdVI2U09EM1NaM3J0L0xMaXpiN3Ra?=
 =?utf-8?B?NkZtVkdHRTZ6bDI1OXRsTjhSR1Q2U3ZYRFRTblMzaWYwM1kydTdtRTVrUTRq?=
 =?utf-8?Q?fYPzuQmGLA3H/J5sCBbfcGyCg/rSwQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 15:01:35.6418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb3cbfb-aeb1-4430-824d-08dd1de2891b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10682
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 15:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208774

T24gMTYgRGVjIDIwMjQsIGF0IDE0OjU5LCBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNv
bT4gd3JvdGU6DQo+IA0KPiBPbiAxMiBEZWMgMjAyNCwgYXQgMDY6NTQsIE1hcnRhIFJ5YmN6eW5z
a2EgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPHJ5YmN6eW5za2E9Z21haWwuY29tQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPj4gDQo+PiBUaGlzIHNlcmllcyBpcyBhbGxvd2lu
ZyBjaG9pY2Ugb2YgdGhlIE5WRCBmZWVkIHRvIHVzZSwgeW91IGNhbg0KPj4gY29uZmlndXJlIHRo
ZW0gdXNpbmcgdGhlIE5WRF9EQl9WRVJTSU9OIHZhcmlhYmxlIGluIGxvY2FsLmNvbmYNCj4+IA0K
Pj4gQXZhaWxhYmxlIGZlZWRzOg0KPj4gLSBOVkQyIChkZWZhdWx0KSAtIHRoZSBjdXJyZW50IE5W
RCBBUEkgdjIgZmVlZA0KPj4gLSBOVkQxIC0gdGhlIG9sZCBOVkQgZmVlZCAoZGVwcmVjYXRlZCwg
YnV0IHN0aWxsIHdvcmtpbmcpDQo+PiAtIEZLSUUgLSB0aGUgTlZEIGZlZWQgcmVzdG9yYXRpb24g
ZnJvbSBGS0lFLUNBRA0KPj4gDQo+PiBNYXJ0YSBSeWJjenluc2thICg0KToNCj4+IGN2ZS11cGRh
dGUtZGItbmF0aXZlOiByZXN0b3JlDQo+PiBjdmUtdXBkYXRlLWRiLW5hdGl2ZTogdXBkYXRlIHN0
cnVjdHVyZQ0KPj4gY3ZlLXVwZGF0ZS1kYi1uYXRpdmU6IGFkZCB0aGUgZmtpZSBzb3VyY2UNCj4+
IGN2ZS1jaGVjazogYWxsb3cgZmVlZCBjaG9pY2UNCj4gDQo+IElmIEkgc2VsZWN0IEZLSUUgdGhp
cyBmYWlscyB0byBmZXRjaDoNCj4gDQo+IEZpbGU6ICcvaG9tZS9yb3NidXIwMS9Zb2N0by9wb2t5
L21ldGEvcmVjaXBlcy1jb3JlL21ldGEvY3ZlLXVwZGF0ZS1kYi1uYXRpdmUuYmInLCBsaW5lbm86
IDMwMSwgZnVuY3Rpb246IHVwZGF0ZV9kYl9udmRqc29uDQo+ICAgICAwMjk3OiAgICBpbXBvcnQg
anNvbg0KPiAgICAgMDI5ODogICAgYmIud2FybihzdHIoanNvbmRhdGEpWzoxMDAwXSkNCj4gICAg
IDAyOTk6ICAgIHJvb3QgPSBqc29uLmxvYWRzKGpzb25kYXRhKQ0KPiAgICAgMDMwMDoNCj4gKioq
IDAzMDE6ICAgIGZvciBlbHQgaW4gcm9vdFsnQ1ZFX0l0ZW1zJ106DQo+ICAgICAwMzAyOiAgICAg
ICAgaWYgbm90IGVsdFsnaW1wYWN0J106DQo+ICAgICAwMzAzOiAgICAgICAgICAgIGNvbnRpbnVl
DQo+ICAgICAwMzA0Og0KPiAgICAgMDMwNTogICAgICAgIGFjY2Vzc1ZlY3RvciA9IE5vbmUNCj4g
RXhjZXB0aW9uOiBLZXlFcnJvcjogJ0NWRV9JdGVtcycNCj4gDQo+IEFkZGluZyBhIGR1bXAgb2Yg
dGhlIEpTT04gc2hvd3MgdGhhdCB0aGUga2V5cyBhcmUgbG93ZXJjYXNlLCB3aGljaCB0aGUgcGFy
c2VyIGlzIG5vdCBleHBlY3Rpbmc6DQo+IA0KPiBXQVJOSU5HOiBjdmUtdXBkYXRlLWRiLW5hdGl2
ZS0xLjAtcjAgZG9fZmV0Y2g6IGIne1xuICAidGltZXN0YW1wIjogIjIwMjQtMTItMTZUMDE6MDA6
MTArMDA6MDAiLFxuICAiY3ZlX2NvdW50IjogMjM5MixcbiAgImZlZWRfbmFtZSI6ICJDVkUtMjAw
MiIsXG4gICJzb3VyY2UiOiAiZmtpZS1jYWQvbnZkLWpzb24tZGF0YS1mZWVkcyIsXG4gICJjdmVf
aXRlbXPigJ06DQoNCk5vcGUgSeKAmW0gd3JvbmcsIHRoZSBjb3JyZWN0IGJ1ZyBpcyAiaWYgeW91
IHR5cG8gdGhlIE5WRF9EQl9WRVJTSU9OIHRoZW4gd2VpcmQgdGhpbmdzIGhhcHBlbuKAnS4gIEkg
c3VnZ2VzdCBlaXRoZXIgdmFsaWRhdGluZyBpdCBlYXJseSwgb3IgYWx3YXlzIGNoZWNraW5nIGZv
ciBlcXVhbGl0eSBpbnN0ZWFkIG9mIHVzaW5nIGVsc2UuICBJIGFjY2lkZW50YWxseSBwdXQgS0ZJ
RSBhbmQgaXQgZmVsbCBpbnRvIGEgYmFkIGNvbWJpbmF0aW9uIG9mIGNhc2VzLg0KDQpSb3Nz

