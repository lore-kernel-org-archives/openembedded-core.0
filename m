Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D137C61CE8
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 16:57:37 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.50])
 by mx.groups.io with SMTP id smtpd.web10.65371.1749488250475542314
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 09:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WBzDoS6j;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WBzDoS6j;
 spf=pass (domain: arm.com, ip: 52.101.69.50, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ePFBxTuWW/Gp8YiuQ6S1zKoaFVhWKcdPmv+ba8EJrLG02H9R0fM0Ui98DS2XqcKbNKOkDGmu3izmSw8EE6Cg0pD1oOg+MaoN+eifcB59/DICQBOuKAcJ3r+sIxLpOHPI0YyICF658fQT8jLUPSZ5yLcCl3MDsp8P1hMLmhO/b91qJS5bReonEZA5hW77q9CThy7IYUu17CHVyOPEM+RTlbqpqfQuvzppgX9cC4I7qbKbhC9uqmv6NcdVmgrNawLTq37sBjsWXiBau49w8zVcqzRukfL82b2zdFkficvEEbZScqTGGx2lETUF09RUS2S+Lb8ZiAYignZeqQxhxywjgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20MDx9sKmkRavXNE7Z9TGALeDrANVMeMP0VAx6SDZgA=;
 b=zNmpvBci3OzBLV43UgVJ1FScAn0Q4ed9GakZbsD0sfN1YZlLKr87obydqnpCze3gA0dzUhlQ1Aa+gPVVwXyzXd0C4ax2+geijX+CoQi0O/2xcCRvh76eSLSeIxd8/oPPzVkLlU836YoQQnO38WAkjqz2nCOHwT0v5QHdsewBOUwzuhun9CAHGY2TlLgJCca8JLAdozNoDDzuwzPblkIMa5i0Jrb7zFo6F23RNrOBk+5KFMMQj6Y35RjkX8vb/+114JrKi12eWcl8HOv8F0hfFCH7k1ZmIAIc8ygxDwFxYHKt9fI+ZoycBHm/dCBit6Q7tHwmEp2yiuh2pFUNWtCcLQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=t-online.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20MDx9sKmkRavXNE7Z9TGALeDrANVMeMP0VAx6SDZgA=;
 b=WBzDoS6j2LFHJh1lnJparGNtLKq/ee9RnEFV2p+CUT6/js8sPp/pj6W+p7O3PBJK6/8rh55QiAgx5nf5++038Nv4Pa81E8U1eHZ8RElsf/XxW9s+kNvRQcOret3y3Otd74HlN+0fxmZ7Ih3iAv6YSqTugsEMGY3BV+A13z2f/v4=
Received: from CWLP123CA0131.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:87::23)
 by DB9PR08MB7397.eurprd08.prod.outlook.com (2603:10a6:10:36c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Mon, 9 Jun
 2025 16:57:25 +0000
Received: from AM3PEPF0000A792.eurprd04.prod.outlook.com
 (2603:10a6:401:87:cafe::92) by CWLP123CA0131.outlook.office365.com
 (2603:10a6:401:87::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.26 via Frontend Transport; Mon,
 9 Jun 2025 16:57:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A792.mail.protection.outlook.com (10.167.16.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 16:57:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WArQHPjY+zJTXwjupwovXtytnu2Oa3LJaiLkB6znJzeR399ZYQ31n3RURxQTQB27+6cbPc+lTI8n7B08tDT4gUpMUVXd1XTfhTo9K6Y3ZKMUcQzVs97e6+SYiYVfmQp5J3g9ku2PSlJ7ZXlcKOoUxNvk1wbdsi4Ga1JWx2Ael1CjAhJqWgETysBrWZk1Z2hx9DRfegluJDZYQacOtVM+8FGkX3qerWQSJVsAEiwfY9oA3pBvJG4TXuNTfcy7ti20U9F748z5wnAuPS70XU3rpLk+WO7pk+sNMvQvy6zyEXCUtGjZ4f9N2i9UOTK+QePOeFUR/kdNMSQ2uXA9Mufm+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20MDx9sKmkRavXNE7Z9TGALeDrANVMeMP0VAx6SDZgA=;
 b=dwNgw8w3mOlfX110QcwM/ZHr/Wm9yrHcQ01IPBV5oZ3Z8SG+QX2Cc2pFneUE7kQw2drnZx1RKqSdqqeQc6h4v4S08eWwmCygC0J3Znkgn5Pl4HFk1A3R4ruzOdS+JI08GlpDOMaYNm3aXoO2CNTlHbhK6ozkjqk8vr2rd0lUZiPAN94lX0ERP/ptdAmQ9Cizr2o8iuKvo/NlVKEVcCR+7zXgwTv0tYGpOV1WKggIqm7d2PLqsUEMDp9Dmdzv/QG9yGQtIszp2jeHgT8FR8SYUcQoOP/n2Ea1vCMKLCOi+af5BM4YQdcD3htPeuc7G5mxagJyvTe6MyxMWAJLfPLVYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20MDx9sKmkRavXNE7Z9TGALeDrANVMeMP0VAx6SDZgA=;
 b=WBzDoS6j2LFHJh1lnJparGNtLKq/ee9RnEFV2p+CUT6/js8sPp/pj6W+p7O3PBJK6/8rh55QiAgx5nf5++038Nv4Pa81E8U1eHZ8RElsf/XxW9s+kNvRQcOret3y3Otd74HlN+0fxmZ7Ih3iAv6YSqTugsEMGY3BV+A13z2f/v4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM7PR08MB5496.eurprd08.prod.outlook.com (2603:10a6:20b:de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Mon, 9 Jun
 2025 16:56:51 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 16:56:51 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] libcheck: use cmake instead of autotools
Thread-Topic: [oe-core][PATCH] libcheck: use cmake instead of autotools
Thread-Index: AQHb1r9x4EV4zYpYYki3N437PXfB0bP7EXKA
Date: Mon, 9 Jun 2025 16:56:51 +0000
Message-ID: <6823FCE3-C779-40E8-8868-223F71C9C353@arm.com>
References: <20250606084539.2960891-1-f_l_k@t-online.de>
In-Reply-To: <20250606084539.2960891-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM7PR08MB5496:EE_|AM3PEPF0000A792:EE_|DB9PR08MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 11c13bb3-0435-43ad-1192-08dda776b5a5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?VGIvYVh0bHJUL2tDNWhmT01HM3dhd1lScms0T0RuQSt0NnhhNnhhMGZ0cTRI?=
 =?utf-8?B?RVl1WDUySWNaMVpCWEVPbk1hOXk0c3pPaXp5R2VPYXBYNjRZZnRLeVBWdnFI?=
 =?utf-8?B?QUVUODEyNzE2ejNtTU5ZbmczVENXeHBaekJISlEzNHEvQkVKZlpOOGZwRDBr?=
 =?utf-8?B?MElKQXBsT0FvWmhxVUc5QmpBTkkvem1ialJ5dDdXWlNVSTRpM2oxcWZReWVH?=
 =?utf-8?B?b2JrWGllR1RnNWVvWE5BU2RJUXBWQkRMaWROZjljQ3Exc2g5eFhzWE93SFc2?=
 =?utf-8?B?SU16MHhlQXNEZWxsaDlNWHpGVjJFdjFqY0x3TnNjQXIydnNmSTBEZGZJdEdp?=
 =?utf-8?B?UWY4NFRVTzBoV0hxL09jUGJ4dVozaHdYdjNIZTBQUUNLVTJIQkNjRlB6amdX?=
 =?utf-8?B?RmVteE9ZN2plNTlIWTltRmQ2SDAwMkNFdUNxdVYwK3VGZnRCUEpLVmQxaHd4?=
 =?utf-8?B?bjlCMkFPbnZrYS9XZ2FTU3cybnlBdW1YQ0k2NWM0TDVBV0UvMmZzbXc5NzQw?=
 =?utf-8?B?YnBEOSswMDljZDl0eGRQMTlXZGFJTENqaGFDUGo1YW9abFZxZUUxcjArb3BN?=
 =?utf-8?B?SHlEZVRYUVIxeno3MmhWSGI4L205aUJHdFlRWmlicEM2ZkwyczNBeVVLQkd0?=
 =?utf-8?B?dEloM2k2am5sWU9LMVFCaWpnWUFkZkdFRFJCTmpDYlgxa3Q4T1lvZEdDWnRs?=
 =?utf-8?B?TjFFSXc5bGMrZy9DZzRwWXBEb1JsMGdQQnJqUDdDSjhkVFFuMGRBSUNwVHZT?=
 =?utf-8?B?M2gxK0xJN1NwbVhuUjl1WWRqMGVwRjJpQlRpNzBMUGViNWUrZDVJVVdKcDlo?=
 =?utf-8?B?YTRjTDNJZys3ZGpneHQ5VjRjSW10K2d5UDhwY25IUmVLTEduaXVKa0ZTZXJI?=
 =?utf-8?B?dm1QMkhDNzZrZ1BDb2JTVzFiRjhkQ29JSHI5Q1BtSkxwaHIyci9VbDlJT2tP?=
 =?utf-8?B?SmhHL2JtZ0VZeWU0L2k0bFdJdHdsWnNSdWhXdHo5eHo0MERZTHdycHV2RUZk?=
 =?utf-8?B?RE40eXhZWUlMbnJoMnVGM0FxVG96WWdmRmlKd3QxTGFlazJtNzYyQWlPN1N4?=
 =?utf-8?B?bnJzV0syRStYTjJXeWhMb25CV1NIT0VTdml5N0hFUytFM1lvcjBjeFl1YmF1?=
 =?utf-8?B?ckgraFdJNEo1aVhZcEZwQ3cvajVRczJLSnBmM1hiM0ZvUHJJY28rakZCWDdw?=
 =?utf-8?B?QUlIdDNabU9GaXlUeEhaTm9nd1piSTR3MlY4YzBES1g2WjZ5RHF4NDV1a3Zi?=
 =?utf-8?B?bHRweHE4eVN3OFFxQThnakRqVEcwVko0MTl1Y3NjVSsrbWFNTGJHOEJEM2Jh?=
 =?utf-8?B?ejlFYWZKSFZCNHg1aFNmUFFERWJMQVdLTG5tMXVGUFpPdjhMYUpNeWtYcHlz?=
 =?utf-8?B?TkVMdWFiMzh5QWNLbWdMUTVWOTVYT1IvellSQUg1ajFldWFlSzY0aDYvZFNs?=
 =?utf-8?B?OUJScVdoVS92alpkY2g3OGtVR1FJSHF6Ny96R2hOc0hkajlRckV3bDFYMDBQ?=
 =?utf-8?B?UkN6L0I1ZzFlSWVRTUlNazZvL3oxNXZZR28wdWdpL2ZHdUxRT21EZWtEMGtI?=
 =?utf-8?B?K0J1L3JGMDBPdEdLWjJ5clhjVTA5NmdvQ1RSa2wzbmJLUll0d2ZkRWxmODla?=
 =?utf-8?B?cGlGc1BMMzRLUG16VHg3RmpMU1NUSUFwd0JaWGFxZGtLT0U3aHNYdm1UWGFF?=
 =?utf-8?B?Skh2K1Nza0xqTThZbWovemkwTFVUdlRtYytIcUo1dDFjVmdBeXp0WVhHL3FB?=
 =?utf-8?B?eHhURjMwKzd3VkpwWWs5eWRIck5ESTkxdVVYYkJtMUM1UjFNZXRXdmppdmlx?=
 =?utf-8?B?YVlNSzBpdkU4WjlVd2I2dlVzcmxmSmtmVGk0N2xSTTNOc2dERnNENkdKQWY5?=
 =?utf-8?B?WVJmeXRZMm94TmFQUndhbm92M0JnUG02cStVdStVVVVkYVFLaFFiZCtlNXZF?=
 =?utf-8?B?cVU0dS9SVGJLOWE3b1VtaW5VcEx6UVk5Nkt3TU1KWFRTY1ZZQUIxZkpvQ0FG?=
 =?utf-8?Q?LecTa1xkhfcU6lsS5dF4vIL/gxGsac=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE83E0791B3E73438A76E362E0133438@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5496
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e9904d27-d45a-47e4-df9f-08dda776a1c0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|36860700013|376014|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S21zaUxaemdtVkpINEpDcXhFbm55cHdGYnFSanZpMWZ6ajJnNmp4aWovbUNL?=
 =?utf-8?B?U0xGanltVlNIWHdmWlkrNFNGL1FmZ1gyNE1laWtmNktUdzlRQzJFMm9RZU1a?=
 =?utf-8?B?ZVN1WXZQcnltUzdQUFZmc1pvWDFXcUVFWGxWNzRmVHZVR1U4d3NvUTMvaUNM?=
 =?utf-8?B?ZFZPblRheUppNTNEeGtTUHJpbzRXYkFjbkt5aFZwRU9wVlNqRjJBc2toUUFG?=
 =?utf-8?B?ektDQ3cwZTBYMnhKL0JPalJKT2tML0t3MExMc0ttWUZNcERYU2JBaFovV2Y3?=
 =?utf-8?B?YVZQU2dqUWNjTmtxUWh0aEZSUUVKaUlFU1NmUzd2My90Qm9rSllhcFZsdlI5?=
 =?utf-8?B?eDBKbXh1SnFmeGtpQlJkYWdFNXZObDNiWFYvVDVwcFRHWDFSbXpDNkl4OHFi?=
 =?utf-8?B?bTJFQ1lDR3RPSlYwancrOVQ2NGJIaWppV2txai9ySXZJQ2d6clArY0tzSHlR?=
 =?utf-8?B?cTdDbGViaVJYelVML01PVm9hWGhTZGNyVVZmTmkrb0x5VGpIRlBWbFRJcUtV?=
 =?utf-8?B?KzdXYkhLZk9RUHhHMitnVS9HdHlGN21xekl2OCs4ZGRDY2U3YWJsR3NoSDdP?=
 =?utf-8?B?MmxmaUZCc3IyUm1LUkhWSlRWTHVpYUc0cmxGMzh1QnJGWi9LUHRjd2VZS21D?=
 =?utf-8?B?SHBtQ2NhYkJpdFB5cW83WUtOdjh5M2o0QUU4cXFVSFBqRnRBcnlDY3dMRlcv?=
 =?utf-8?B?aFlVL0JDclpWc3NJZjFQeWY5aTJRcFp0Q1BNWlJXRkFuRUpmcExEeEtpVWNJ?=
 =?utf-8?B?eVpUQUk4RXJsZDhZd3RlVW40K3hacHNBdjB6aGthYURBM3JnYVNsQk42UUJY?=
 =?utf-8?B?Y294cVNyb1ZPWlZWa2d3OXJ4eTAydW1sZnAwL1drTHduQ0lXRjQzcjBNWVB1?=
 =?utf-8?B?WU54ZE8yMmlaczlvUVBuZTV6N3BKOFY0UTk5Y0xZMEd6ZlI4THFUZTZDMndk?=
 =?utf-8?B?TDF2cm5VY2J4U2ZycTJ3cXlMMEpremluWCtjTnFsZUtIdVZjaWdYaC9iZStu?=
 =?utf-8?B?M25pdlRXZzR5SzVEMkd0cVlaa0xsU2YvTERkTCs4MGNxMGtZS2JhM3Z5MWpM?=
 =?utf-8?B?YUpndGRXL2lXaUU2SmhqMUJCVWNBUzFvSFhMdENmSy9acms0cE9uZGtWdUtG?=
 =?utf-8?B?M0tGSnVZNytrSG9aQVp1UHNDa3hWNWxOUXlEdmI2QmNDL1llQnF5V01weGFP?=
 =?utf-8?B?Wk91SURFQm12ZE42Q21PTFFYL1FQRGhhNVdhY25DQ0MyMTYxaDlMWkFZemtX?=
 =?utf-8?B?YjF2blFEdTNQVWtycTZMM2FJTFhiNTFrSmxzazNzYjVKWUk0ejZpZTRWMXBi?=
 =?utf-8?B?WERSTGxYckg2NVpxL01CWWFjYVVuaFJjcTdWZ00wZDVpZktKZmtLeWtjSEtu?=
 =?utf-8?B?eHlQR0lFQUszTjdMY25ULzZtYWNjaWZqQ2xKSDVWSlVNMnR3TFZJVy9PZmM4?=
 =?utf-8?B?bmhuTmdaQjFMcHBMeVgwV0tBcHdCZk9RRFAwVW9VeUt0NFVJcjBBTS9CUkFF?=
 =?utf-8?B?ZjhrMnZ5QVQ5T3RTakdmeVQzTk0rREhSWkNwZndIaDBZTmJFcjk0RjE4WDJV?=
 =?utf-8?B?akNqdG9Sb0dFdkFqT1ZsRnlob00vYlgxRmlKcWVCSXhJRG5rZXdEeXVpMmZa?=
 =?utf-8?B?akR2dEhMNXE1S0IxNnZRbjV2KzdwbXpkYkdnVmtYSENDb0NIbm5mVm1Oc2NO?=
 =?utf-8?B?SnN3RXJXWGdRRHRycC9TajB0TzladXlOekJVU2hidy9pWWhyTFU1NzJYZTI3?=
 =?utf-8?B?MmREZmV1MzROejAvZjA4NWNVTDlHTTJ4bTdQTGFzMzd4bmpjOEhzVU9GNDk5?=
 =?utf-8?B?QnZvVnpCZnBUdzR3ZDBEUERhQmQySnV2dFRFeDB2c2lTVUJYZUxhcUVWZmRD?=
 =?utf-8?B?YXFmSHBTS1NacUplWWN3TDRtNmpTTjdrZXpSaEVGOGJGWlVZK1dXcVlkUVFz?=
 =?utf-8?B?ZkJrMCthdFVxcUZ6V3plOUxxbHdJUEVLQnhHalk0WTUvZ2p3Umd2ZmpqZ2Ux?=
 =?utf-8?B?b0FyT3lVTXFZTXBqM2ZrTkV2OXd4d2JKNEg1SXhoOXdWeitmRjZxOGxsTnBE?=
 =?utf-8?Q?/ir9fr?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700013)(376014)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 16:57:25.1597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c13bb3-0435-43ad-1192-08dda776b5a5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7397
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 16:57:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218302

T24gNiBKdW4gMjAyNSwgYXQgMDk6NDUsIE1hcmt1cyBWb2xrIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxmX2xfaz10LW9ubGluZS5kZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToN
Cj4gK2RvX2NvbmZpZ3VyZTphcHBlbmQ6Y2xhc3MtdGFyZ2V0KCkgew0KPiArIHNlZCAtaSAic3xA
QVdLX1BBVEhAfCR7YmluZGlyfS9hd2t8IiAke1N9L2NoZWNrbWsvY2hlY2ttay5pbg0KPiArfQ0K
DQpBcyBsaWJjaGVjayB1c2VzIGZpbmRfcHJvZ3JhbSB3aGljaCBjYW4gYmUgc2VlZGVkIHdpdGgg
YSAtRCBhc3NpZ25tZW50LCBhIG5lYXRlciBzb2x1dGlvbiB3b3VsZCBiZSBzb21ldGhpbmcgbGlr
ZToNCg0KRVhUUkFfT0VDTUFLRTphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0g4oCcIC1EQVdLX1BBVEg9
JHtiaW5kaXJ9L2F3ayINCg0KUm9zcw==

