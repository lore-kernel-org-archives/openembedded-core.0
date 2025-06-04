Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B225CC5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 10:37:31 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.48])
 by mx.groups.io with SMTP id smtpd.web11.13560.1749033449774552268
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 03:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cxbn6DMC;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cxbn6DMC;
 spf=pass (domain: arm.com, ip: 52.101.65.48, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mEaXejn+UWgHhPQNw4Z2DWJNzenZq6Re9dwo4K4vIJuCcIJuqNSJp6fZINZGnEV6kVFNLsrSJkGJ+d7nUfT3wKdoWPgOJxF362O/Ybl1/WY26NSmN8qrk1cpoV3wGlK1Z1hte7VQvHavQq+mGHlDSbS4CAzNQ7fO6FO2HxHu/XzbPKPyg43ojav4ns+M/BoBN75VS0mo8MNxMiBDePt/h/HsJbIepToi5DpSWe6+0JJg/HMXDrEE+3FLZTMWXqkuiLU5yRZw9Gr2Mnz5uLhMbYCve9OFVuJIISTi62Ar7nCT2RysJEwx2Ruh74rpApkMbFU/4h8OTo10qaYvNRBQSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNzuR5vZMeeZpGk06pK+K3+2Vxti+FnqfWXn/5ZkVQc=;
 b=UesLIuyiCaDVvK9xEXUTO9ofW4VnRgzS1qTf77gHNRtv1EINb0doatDt3QKFTyCwnvkyfQbRVi6M7AlWmVKzsj5HVNZluFfszQFxLP+3Lf6inUA1Hw2YNwVtfuhNxXAU/EdLi+9407ygsHmvcGFEb0sRgP48j3feU+utUOFguhtYw7n9WYI37CNKhklu5KchEO0Be6vxL1Kf4vgC/0dewaZyrMhAAO84NrJ4LZaU4QYVrD3RTa1EESD3miECtbojBWdE4W/2Xyruv8OqXoOXL4pNva8XXTHhTqNrKJkWtLIqedvpbNrl13lFJB9QH76Jg5/yIPx4q7oG2LUxtUwIIw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNzuR5vZMeeZpGk06pK+K3+2Vxti+FnqfWXn/5ZkVQc=;
 b=cxbn6DMCobmLBDaWgUAI7baE4pdu0njfFFk4BVUhNqxUl0qqQqZXkKuS4q/vGw7FC/VuTYrwt9Qj8ppjwBOgA+Kqu2ocHk5ikntEI3W9M0gqbSiGLwZb29JJafFnK1t2+ZdGBfV5VOCc8TF9TR8I7QlIZ8ZSEEHIQ+V5UgaglAg=
Received: from AS4P190CA0049.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::20)
 by PA4PR08MB7410.eurprd08.prod.outlook.com (2603:10a6:102:2a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Wed, 4 Jun
 2025 10:37:25 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:20b:656:cafe::34) by AS4P190CA0049.outlook.office365.com
 (2603:10a6:20b:656::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend
 Transport; Wed, 4 Jun 2025 10:37:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Wed, 4 Jun 2025 10:37:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zg9Q9baKDM/kNYFrsXqGvuA/FRYVwlNI/KqdzMJQO+bjw24Wos2gU8i0heV0NXZJXdrENwdFPyzuU9gX+lXRoTzqWNnpPyjXswJr4lOI5nfKCB9/H/g4acw6oA+33kC/y7TFSNjW4pSSHQqshmaorD1uhtHzkpqTHBauhC0JMr+KjdX8+twgAxFj4LZXe5GcR/L1slar4JYUx62cyJOoK1LECFFoUbjBZ2q+9H/fYIyZyBXYeaocBIEDXUnNf5h/2wslzBfNGfbPrujmhBFcMO2LICgWsV5x9dg99gBAfWOvH/srkJi6hWkBmqb54rDQTWd6US7PSdr2v/9qOeo6qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNzuR5vZMeeZpGk06pK+K3+2Vxti+FnqfWXn/5ZkVQc=;
 b=uz+zW5UC3gJVwvlxmDvBvck0tsyYLENGUZZ1fVv011lqhVpNtDR8eX/KPMkDWRfoFRzkLf4zzLqudKBmPkML+iUN1ErxEzcAviDVJPG+yK2FTFr2BaY5YFdzoaXZTj3aeF2wJg2Gt0fY2ndsUDXESUtq0VhBu75asrvpZDWF+eWFcUyX1an4yIEak7dEay/wNhKEd8oMgOnaLRdMFcVN7F2YLcMAzhS5XDDj0aOkCkoU/WXkvnj8nZZxu+2tPicPRKTXclMIQJV5ctFpYaApPBNEWSpJUsKpuF9GhRH+lecUSt5IO1hysroH+wu/8ZL2SwRjZiHHud5PZjfGCt2jOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNzuR5vZMeeZpGk06pK+K3+2Vxti+FnqfWXn/5ZkVQc=;
 b=cxbn6DMCobmLBDaWgUAI7baE4pdu0njfFFk4BVUhNqxUl0qqQqZXkKuS4q/vGw7FC/VuTYrwt9Qj8ppjwBOgA+Kqu2ocHk5ikntEI3W9M0gqbSiGLwZb29JJafFnK1t2+ZdGBfV5VOCc8TF9TR8I7QlIZ8ZSEEHIQ+V5UgaglAg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB7894.eurprd08.prod.outlook.com (2603:10a6:150::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.20; Wed, 4 Jun 2025 10:36:47 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8792.033; Wed, 4 Jun 2025
 10:36:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] buildtools: Add a replacement for file
 command
Thread-Topic: [OE-core] [PATCH 1/1] buildtools: Add a replacement for file
 command
Thread-Index: AQHbytjKLhIaxA1TPUCpYShGvUhb+7PelnCAgBRM9gA=
Date: Wed, 4 Jun 2025 10:36:46 +0000
Message-ID: <EA4E1A7F-9586-49FC-A98C-C1407E6A5C4F@arm.com>
References: <20250522051651.3711352-1-changqing.li@windriver.com>
 <20250522051651.3711352-2-changqing.li@windriver.com>
 <BAA25366-9801-4043-BC16-A8C2BF807543@arm.com>
In-Reply-To: <BAA25366-9801-4043-BC16-A8C2BF807543@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB7894:EE_|AMS0EPF000001AF:EE_|PA4PR08MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ccc0179-efa0-4426-3568-08dda353cafc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?YmlZTldHZlhvZ0tmYVhDL0VIVkljTWZYR1JoU2poRzUyY0pIcVNiRHlMWmo4?=
 =?utf-8?B?eUk4a21XY3FxNDJxT2VEdjZ6YmVLekpSK3pORHhQamNQUVhVRXRKcFphMGZQ?=
 =?utf-8?B?ZzhPK3NOSjlUQU5SajZyWmVmd2VmWW9uMnhsczNGTmJtVVpaTU15RDg5WSs5?=
 =?utf-8?B?UzdiR1g0Vk9RRDFjc3FFc0V1dzhOSDRaQmxtYU1hTVlQd1RBcmpLUnV1aUJ2?=
 =?utf-8?B?UmNGWFQ0TXNTY0ZUZzJBRkNoS2VCZk9zTmlYY29SRXdXTlpXcVF4ZGpBOE9Z?=
 =?utf-8?B?U0ZBU2s4OFNwVkc1SWx1bHlyN1B2UjJnR2duRGNjVW1qY2lRNHlYU01kUGlG?=
 =?utf-8?B?MzZlZ0NhQjQvVEkwbWk3cThUanozamR6VzJsTGNCWDIrSmgxVHphNmUwREQx?=
 =?utf-8?B?TitsWFpraDBvd3FGakJLWmpEWS9lNE5yaEtUUUdrVitTSjFDZ0VJVFR0R0hi?=
 =?utf-8?B?VGhvdWhDaFJwdWNlWDJudGFJT0lCTlJJb1Y0dUVraDhiUEo5RFYvckZaZ2ht?=
 =?utf-8?B?YTI1ZWs1MjBCdktpRDA4QklwMUxSRVU5Y2FKZGY0dzBOWnhxTCtoaUhIYzJw?=
 =?utf-8?B?cHlwQkZZOUR3THRmQ0c4S0pCb1lNQlBtMzdFNXk0T0w2OUtpYnJ4YzhVQ3VL?=
 =?utf-8?B?ZjhoYkZrZ2NiZTRubWFCUEdUcUhwMW8rdmdjM1prdkdtM0pNVVZibU9jb0pa?=
 =?utf-8?B?Y3VvZWJDZWJCMy9VWG1BWWlTMGZQNzhTTVoyeFp6WVMvSk04ckgxbzV1WWdC?=
 =?utf-8?B?RitCUlErelhDRE1LdzAwdkp2N0poS29VMG9TajdYQUlDQW5PdTZPQXdRTFIx?=
 =?utf-8?B?cUZlNjJoMnhsNnJQOVFIa2hDWXNKMThjVGlIdGx2b1BXY2lzSHNjQ2Y4QXFI?=
 =?utf-8?B?UEw0QW9sT0FReWh1ZDNzZ04xRXhpQkNwdjRNNWpadEVINjFDbGRNQU4xT1N2?=
 =?utf-8?B?dGVPVlJ1OHhuK1ZxWUVMSnZlV09DeEl6Sy9JUVExTGZYRjFLMVBEeG5GUHk2?=
 =?utf-8?B?YVJ5aXdPcHcvYXAwd1RmNUM1TW52cXV1aDJMK0JMdWpDeDZPWkpSeWZBK3J5?=
 =?utf-8?B?QWY5Z2hEQXNHY3lOM09xNG5nYVBBRVpjQ3REbHZneW9JZVNjMWVuOFBsT0VP?=
 =?utf-8?B?UG1BamlUNW1YVENJNzd1RERTdVdxNUpnUzVyZGcwb1RqT25qZG55QktzeUZ3?=
 =?utf-8?B?c2FDNlJlcHVCTHJLdmxZd09mL2RxSmV2amEzVGlUVTd2NXlyNXpkZnR4TkNJ?=
 =?utf-8?B?NVptNXRrRURKSWM3SFJnR2lJa1NPazJMVEtBTWM2QUszbWY5NGx3ZFdlNlli?=
 =?utf-8?B?VWhCOVlvYVl1YVlyYXFib0lBMHNjeU9PKzhLcUtYY0FRSnJiL3ZpdGhnbllH?=
 =?utf-8?B?U3gycVNEYmVQdk5DSTFZUGo4ZXFJTnZXZUdWbk0zTEhSQlUxWHpOUDFtOTlp?=
 =?utf-8?B?U09lQzFHZnVram5RZTI2NUtvWjdhZ05JaWxtUmE5cDQ3S1ZjSklpYVhZeTlm?=
 =?utf-8?B?TkRTT3FBZjFTb05sN1JTVm1YTkZuOGkxeVlLK0diMmZxRVlVaEpTc1plZHpz?=
 =?utf-8?B?dGlodklMeDBCQ3pYY0VtZnM1THhIa3RBK1A5L1lMWGRGbWUvU2JFRkRvWjVp?=
 =?utf-8?B?TWNKY1NLR1RlQ3hheVU1azdZUDZDcXVJVktDUG9zUDl2Zno1RnkrNzdzKzlP?=
 =?utf-8?B?OXZJRWp4d2hGaUJrNm5uQzNLMDhwVkFRcno1dnJnQXhYR1hNY09qTE5wTUFx?=
 =?utf-8?B?UHVKQXhoRHF1QjlWNU5NUjc3UUZqTEllQU9LVThOdldsRkhWNXg2R2xVZ3o1?=
 =?utf-8?B?TnF3Q1FGTGVnN2I1K2gwd29OQ010SmV4M0FtUUFqRytORmRZMFZ0aGdrRWFY?=
 =?utf-8?B?TXQxQkdkTTVKcWlTUjcwM2R5MlE0Q3k5RHR3OUt1aVJZYlZoRS9wNHlGWHVU?=
 =?utf-8?Q?5ak6jQV2QgY=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <640C25BBB93291428F2358BE7A41BF81@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7894
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6fd46fb5-58e9-4873-bebf-08dda353b4a3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|14060799003|376014|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a29GeHB1WUVWSzJ5YlFHa2FZYWtOaXhzSXkvOFAwUzJpbmVwYlV1WXEvVFlX?=
 =?utf-8?B?ZFRkeFp2NkdteVZIeTN2Y1ozbG5nR2Rrb0h2OHoxcDRXYk1oMXZldVMrY2o5?=
 =?utf-8?B?cmpXZ3pON3U1ZnEyeXQzMG8vZjVXRS8vRmYwVTQ4eEVrc203TExNV2FZa3Bn?=
 =?utf-8?B?VzloNzNFSmRSdkQ3SnlyYnNUeVRpRkdONjQrS0xzUUpLTmQvWVdYWmc2dndI?=
 =?utf-8?B?clRrN0U0NU1RbjlZVmw0eCs2U3pXbms1QWdYVnlUUzZNc2oycTlPVm5mcU9Z?=
 =?utf-8?B?Q3R3b3ZrOFRHZVR4R0YvNEkveXd0MXJObGJzQjFBUW1UTlkvMnB6QmVHa0VJ?=
 =?utf-8?B?cEd4WnFvVVJocWRNYWV1d3hPMkR5K2xZNUoyTC9mQ3pvYm1CbUorWTBBZ085?=
 =?utf-8?B?SDNHTHlpNG1lRDVzVzQrUVZGNGxTZXdmZWtwR2MxWHU3UTkvcVBrV1E3KzZ1?=
 =?utf-8?B?cnpjc2g3cnpuV1daVEtGandadXJDYlFwMUNKNTlTdGZ0c1p2ckp0WTQvd1pk?=
 =?utf-8?B?bmVTYlBGdkZES1EzdVFEZzJvM1QycDdvbmMrSms4TlYxWWVjVXlVTzE0aXVC?=
 =?utf-8?B?eHhUYkkyak4vUTc4M3BZWkFvOHRmdjcyUk9scUF2d3JTVm9LVXhZYmx1dWwv?=
 =?utf-8?B?di9SMzFIZ29tcTJuWDl6UitxbnhiZUtuNlJwS00yTlVDQTNrVGtjMFhaeWRr?=
 =?utf-8?B?SXdVS3NnVE9BOGRnZ0JnYllUTGRYOXVNVkVTREVFbWRsTFZuY1RmY21nbVRp?=
 =?utf-8?B?cWlCRHlBREJFSmtpVzZOQ1VUQ2w3NnNUK3JEOVQ5ek9UM01TRUY5ZUJLVFNO?=
 =?utf-8?B?bVBZVTJvS2x2THBqK1ZRZE9hSVk4eS84dytBRVhjclFMMThIQXJBTXE5VkVt?=
 =?utf-8?B?aVplSGNtT1FsS0NqdVBPOFpqcFZSaUtGczBiRUhaWno4cmV4SWdOTWpOQkxk?=
 =?utf-8?B?YW9IZDI5K0NWeEswTGhUN3F6TzJNSHJyeW5mOE9LRjZzUTkwQ3N5MFNoS1Fx?=
 =?utf-8?B?QUdXWTdCNWo0OXpxdUhVclRsZkZERzQ0anFGMm0xSCtBR0VZa3FnODhoUWNJ?=
 =?utf-8?B?OXBGTFl5RDNjbUVxbmNRU3I2Z1U1UXp1c0o0Ti9LQUZDK3dlNTI3VXphb1ZT?=
 =?utf-8?B?V1oweW9yTm0xNi9yL0NJVm5yUVltN3hjYXFVeFVoU2Y1UUJySW9GYVVOVStn?=
 =?utf-8?B?eFJySTRmQ2phUmtBRTJqeHhobjY1SnFlVXlkVFZZSUxCaHplTTZKODN1WllF?=
 =?utf-8?B?b2ZiTnpMb3RYbGkzODRzSkZXMFVpSnU4a1oyaTg1Z3NFY0oyaHdRaDRqRFNQ?=
 =?utf-8?B?RnZ1dzR0NlpBTndaVVhaeitVZ0lYZys2RDZhb0tvcWJEMXlGSmZqSjVBUVMw?=
 =?utf-8?B?eTZyN3BHTDBJYUlOMU1Jd1N1NmdIbm96WUFTSjN3ZS9PS1M5VE02Y1RVMEFs?=
 =?utf-8?B?TUpEWVFXeTEwcDdlYmZCa1pqTndFaDNtUm1DblN2SVp3WWE4dURNV2RhTDF4?=
 =?utf-8?B?SDRQVmw2UTF6L3RqemF0TGdiUWl5WVJOdWYya0NsKzRsenJHSlozV2c1TWFj?=
 =?utf-8?B?bENzNE9wSmpiV0toKzRSandiak16RS8yOWJ2aWduT1NvTTllNmphcG5NNXFU?=
 =?utf-8?B?K0hIbmdRVGJXZ25qM3dPSkZBTE5hTnlJUmVUSmxnNC8yR2xiemQyTXdrWTFn?=
 =?utf-8?B?WEVKbStBcWVJR2ZPR3RvNkZvQUZ6eTFlVTE0YzIyTDFSU1l0Y1pQbndzZkxZ?=
 =?utf-8?B?ZkxpNkt2NGtpdDZMcmpzQkhiYkFMd2s0V280STJ4NnB5R1o3TmlLK0dxYW1q?=
 =?utf-8?B?OHRRNkVnSTRqZEg4QjYwZ0x3NlNpc3BYeHRQVkFlQUJ0U0V5LzJQT2xBUko1?=
 =?utf-8?B?b0hYanRNNVlSTElnSlNoajMyYWhEM2RZTGdmc2FnYTZIenZBcDZSYnBMcEcr?=
 =?utf-8?B?UUNqTlNxdmdsd1lpK01mZU1WZGpYblkxWVFnU2lqQVczQTljcjlEdDlIcXdX?=
 =?utf-8?B?YS9Zc0pLSHNBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(14060799003)(376014)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 10:37:23.9260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ccc0179-efa0-4426-3568-08dda353cafc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7410
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 10:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217899

DQo+IE9uIDIyIE1heSAyMDI1LCBhdCAxMzozNSwgUm9zcyBCdXJ0b24gPFJvc3MuQnVydG9uQGFy
bS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjIgTWF5IDIwMjUsIGF0IDA2OjE2LCBDaGFuZ3Fpbmcg
TGkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGNoYW5ncWluZy5saT13aW5kcml2ZXIuY29t
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPj4gDQo+PiBGcm9tOiBDaGFuZ3Fpbmcg
TGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPg0KPj4gDQo+PiBGZWRvcmEgNDIgaGFzIGZp
bGUgNS40NiBpbnN0YWxsZWQsIGJ1dCB0aGlzIHZlcnNpb24gaGFzIGFuIGlzc3VlLCBzZXR1cA0K
Pj4gd2lsbCBmYWlsZWQgd2l0aCBlcnJvciAiU2V0dGluZyBpdCB1cC4uLioqKiBidWZmZXIgb3Zl
cmZsb3cgZGV0ZWN0ZWQNCj4+ICoqKjogdGVybWluYXRlZCIsIHJlZmVyIFsxXSwgaGFzIGZpeGVk
IGluIFsyXSwgYnV0IG5vdCBpbiBhbnkgcmVsZWFzZSwNCj4+IGFsc28gbm90IGNoZXJyeSBwaWNr
ZWQgYnkgZmVkb3JhLCByZWZlciBbM10uDQo+IA0KPiBUaGVyZSBpcyBub3cgdHJhY3Rpb24gb24g
dGhlIEZlZG9yYSBidWcsIHNvIEkgaG9wZSB0aGlzIHdpbGwgYmUgZml4ZWQgaW4gRmVkb3JhIHNo
b3J0bHkgYW5kIHdlIGRvbuKAmXQgbmVlZCB0aGlzIHdvcmthcm91bmQuDQoNClRoaXMgaGFzIG5v
dyBiZWVuIGZpeGVkIGluIHJhd2hpZGVbMV0gYW5kIGJhY2twb3J0aW5nIGlzIGluIHByb2dyZXNz
IGZvciBGNDIuDQoNClJvc3MNCg0KWzFdIGh0dHBzOi8vc3JjLmZlZG9yYXByb2plY3Qub3JnL3Jw
bXMvZmlsZS9jLzE1YTMyYjFiNjZjZjI3ZDU4NDQwOTEzOTcyMDUwYTAzNDBlNDVmYTEucGF0Y2gN
Cg0K

