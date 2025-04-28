Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E9BC369D3
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 10:28:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.44909.1745836087099636639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 03:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7213f638dd=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SA1S3i025600
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 10:28:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq1aw9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 10:28:05 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53SAS5MV000355;
	Mon, 28 Apr 2025 10:28:05 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq1aw9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 10:28:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwNF/npF1L/1E62TxaZJo6BsoadQSndRiImN73A1zoLU2mH+wvgj3aOete2gF4aVKUyKSaSCX1GSr9klbXILRKnXgw2hRF3GJQywceFnA6sQOuRcSPnW7aLXzB6e+93vsfXgMiMI4ok5JSeYW3w8aIdI//K4v8gD31H8xWJdRUWRUjtTUswBi8F9GhyUzk6QAr9hzSkex0rhA/ob8VOSPZo4QlEq4zyRsbqDkMYzj0dnhEq+Afixodu87lRVUJMUVLRKO8ZiK+92BRg7+h4ufem7No7s3kztPfRsRH/Tem2VBWgPFCbKQU8D8XUZrJ4foKYn+ksg59ZKbgo4dtKYCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPvGqP/VQvZTtdAlXJCK5Jb9fFu/0VwUr/KfJQH96s4=;
 b=hceRyj2DGPfRm9LEPudOIiGoQVxvNYX3nxTolnlV/QLfaMUzYhH9D4lpsPb1eCHre7+7BbLQRU6Cv1J5gfzQf817llRHUj0u4LR+CdwUCiNbc+idANJ6x/EfCK7SR3LHLhlvpn6KcqWniMp69Zc6sWtFO5pLHN6PK72xVvWlMbEda8mJnIMHwG229DUpVqcxVhHZwmTMHGhOMDcya6NOlDXAvou8VOhV227E4jxgDcZ+zAaDyDZT6+StRIKL+RCtVXlHQR9uplm1ILQWfF7qh4DQ4z7n98qqNXI+3YVgjWzTvx5iyxSXb3uDMre1bPIvjO8MbssnyOQ98w1ddvP6hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH8PR11MB8062.namprd11.prod.outlook.com (2603:10b6:510:251::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 10:28:01 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 10:28:01 +0000
Message-ID: <e7279470-d294-4d43-9d2c-88c613f8c41f@windriver.com>
Date: Mon, 28 Apr 2025 18:27:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V5] lib/classes/conf: refactor qemu.bbclass
 functions into library functions
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20250428020852.3949557-1-Qi.Chen@windriver.com>
 <ba587b9e48b80f20369dc16613b01b6de9836302.camel@linuxfoundation.org>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <ba587b9e48b80f20369dc16613b01b6de9836302.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYBP286CA0038.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::26) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH8PR11MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: c35c9e07-5c6f-4cd9-0c1e-08dd863f5a3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c2tIcTU5dmpPbUpoQy9wQ3VDQkRNM0ZkZjhFY1lJYy85OTJhOVV5NFpIc2oy?=
 =?utf-8?B?YmxCb1lpSldvYVdoTk84ekpiWWQ5V20yUmtMeHE2U29nY2R0MHUrUWNrbFlJ?=
 =?utf-8?B?SklRQkU0Rm9icnlhenVSVXpWL2JTeFUxL0V5WDkwbmRidXdmRUxYenJid1Fk?=
 =?utf-8?B?bS94MHhJWVBoRlQ4NEFsaHZGUmR3MVpGLzBVdlVLZVZtbDVQSVFydFdyMlFQ?=
 =?utf-8?B?Q0FQTHlaMk5TTE9ZY3IvNFRBb29RZEcxUnVsdWZQVTcvWXZ6TlBLZ2Y4QTVI?=
 =?utf-8?B?cjZoK2FSeWxIVHVoUjdKR3ZuSG1tWmk5cVZtM0lFak9UK2RGL0dQSndrNUZY?=
 =?utf-8?B?cGtadEN2Q1V4NVhBODgvZXBnQ2gyTldsbU5lMmxoWWxLdGVnSDJrZ2hlYnoy?=
 =?utf-8?B?aXlETjVhdncwWmYvdGJoYnptZC9KNUV6Z1B2d2swUUNCV2g3ajlDZ1FxWGxj?=
 =?utf-8?B?UmV6S3pSS3Rla3h3a05LNjRERnFqYlFBdXJxOXZDcEZnYzU4SnJTM2lTWnFJ?=
 =?utf-8?B?czhiYVpiQlkzd0swZkgvL1d0aGtNeUZSZGlKZFdZUUFFa0VUejNaNXJlcWRi?=
 =?utf-8?B?MjVnaExsRWZuTkdTaVlRL2U3UEd4Mm45VCt1VkFsYkZPUFBSdUlRWCtwSnpq?=
 =?utf-8?B?eGNqRTBhcnFRNVdmbVV0M1EwR1FFc09MNlJTc21VaDBVeWpCanR6ZHZHSHUw?=
 =?utf-8?B?dDJ6SVkxUW1DU1ExbTY1c1pCdlpYcm5pT1B1bUJtUVhWUUFSZ2VKMDN5UDBQ?=
 =?utf-8?B?RmFxSy9FNHFuUEpUaUxRbzJ6WjJYT3duWG9QOWU5YjlqcTVhaUF5Y1Bwenky?=
 =?utf-8?B?eXVwWDZURlh6eVRhM25UdXF1Nm5GTlNTWEZWalV6NmxQdy93S0Y1TkllN0lU?=
 =?utf-8?B?cWloUS9UcVlYTWg1aGFRZ1l3cTlYY2cvbURMTzc3ZnFnWTcrVWVoS3UwaUVD?=
 =?utf-8?B?c05WNUdNRTFqYUlvYllGVjJKNFl2WEFnMWNDYTN2WHlXZjlUSnVBekpWVEli?=
 =?utf-8?B?TGFqTVVMUkVuZkdRUkd1bUQ0bk1yM0Q2THZmRzRNQ243Q1VVc2FjNXdIZHVY?=
 =?utf-8?B?TkROZkhJMGxnSTUvZzAvakJuT1B1bkFSTVd1Q05xcERWNXMyZzR2SEFVakp4?=
 =?utf-8?B?S0ZMeVBOUUplekNrS3RRbFVTdFFWem94Tnh4OUt4RnZYT1llL3J6VGVzNmc5?=
 =?utf-8?B?Wlo3a09qd1hNbElrQlhHQU0zY2pyMHhKblZxd3FaOHRqRkMwU3lOUlB6c1RJ?=
 =?utf-8?B?aUxhRmxva051T2gyMVRYZzZURTdPYjdTdW5mdzJZZjc4MXU0VkJ0S0FaVU9W?=
 =?utf-8?B?b0xoTnVPK0FEbENxeWxKbzJEQitVTEp1Q3loTU1ETENGYnp0UXdJSEpYSVhj?=
 =?utf-8?B?L3M2T2RsWmF1TXkzcDhJWWVDM2h6bU9BbExhSnVmdjU4ZnRZNVBIU0x0elZE?=
 =?utf-8?B?a0tEV2tpemlQc2J3WkNYUnhMdXRvQUhVZFQrNHhGOTRuZWNlNjhOdzg1WER4?=
 =?utf-8?B?MGY3QUkvYzlwd0RNbDVsemdLVEloYkd3VUVNTDZ6Sko2TDJmVzVjZE9hVFBH?=
 =?utf-8?B?ejFzdURTYm1KSUUvK1dDZUp3enQ0bGpmMVdqTDRsYVlqdksyT25nUVNXTFh4?=
 =?utf-8?B?b0NydmpyTVUwMVhiWkVuRXR3N2Y2d2lDQWs2RWFBRG10WDJDemJuWW9aYXFD?=
 =?utf-8?B?MnhObk9oY1MrVlVCcDQ5NlprRi81SjRuTnRUakpPUktGMGtoTXNTczNZSjd3?=
 =?utf-8?B?TUxLcmR6WkFNMVI3OVJ6RTNRVUpOM2Z1L3VmZ2l3ZlF5OC8weVVraDcvNVBR?=
 =?utf-8?B?SVN5bGJIZklQYlZCSVQrRW1mbkI4dlBLdnAzNnRBS0tYVllwNGl6bFlLbDky?=
 =?utf-8?B?NGZlUGJiWUVnYUw1bmtJR1d0Sy9Fdk5ySU80ODd5VUN2bTVhOEhTMHJzd0kx?=
 =?utf-8?Q?GZZuCSwRWgU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SlI4T1RmY2tJNnBDbmtOTVJwK2hOS1Q2S1VOYmNlSlVqZ0RLMm9yUFB5T3Jv?=
 =?utf-8?B?STZNWU14QnVtQW1Pa2E2SXJnbkcxZVdtdjc2UmpoY09zOVdQNTBzeXBDbWRX?=
 =?utf-8?B?TFExd1FwOFUvWkVTZFltSHlEMVEwS1dLcE4zVWlpYVE3WTBRUnFqQ2ZoSFlx?=
 =?utf-8?B?YTRxclh3dlhMS3YxU2hQeENiSWVDWnFaVEF5QUVPZk9oZmNZVHV6K3p2NnRx?=
 =?utf-8?B?emkwOU1OMzVxdDI3aTEvOE5uOXhOalNObXJ5Z212aXBRd3g1MnN5MHBLUEJu?=
 =?utf-8?B?MkxXczZCaXB1dlFhMGJ5MlVlR3ZiV1pRUDQ3M2Qwdlh6YitSREkyWHBVMmc3?=
 =?utf-8?B?S01xaHEwdlptTnpYeG01RkhCWFFwUUFpTno5SHZHeWIvcU9mYXNVN2lNLzJ1?=
 =?utf-8?B?MTZYWmYwa0Rtb3kxbS9qRHF5Nlpua1JlUCtwSkV1aHlid2hVR0VvTDdxQU9Z?=
 =?utf-8?B?YkcxbVVIQTFQVDJPc0VrdjBDNW1GWlFHa1YyQURrRGwwQnIxT0VpU0pJRFlG?=
 =?utf-8?B?aG9lclpNZENWSGpLQTRhWlp2emx3SVNwb01URGFYY0lMUEhiT215QWNNaE5o?=
 =?utf-8?B?UHBGd0o3bVg0cmdNdGNnSlpjbm5qMFNpZnVhNXN2NUV1V1lZN2dZdmU5Qnhx?=
 =?utf-8?B?Q29ZV0luRTliQTZSc0VLSmYvL3B2eHhiVm5wVk14MW1YL2ZocFB2L1pXcW5V?=
 =?utf-8?B?M0xyUFkyaHFYRUs3ekxxZzgybzdhY3EyeVR4WEVrZFF5OUJSRkhjQUNLOFBq?=
 =?utf-8?B?aWo1UHBIK2RtbE8vYzcvWHIwVnhja2VQbk9wbVN1Y0Zad1FkUWZocmczcXM2?=
 =?utf-8?B?NDhkL3lobzFWU2E5TVNqRWlPamoxcVNJaFpEcWVkS3lLajMwSzNyWTd4NzF6?=
 =?utf-8?B?bnVXM1RqN0NVY2ppVTFlS3VqSy9hci9POTBoZjI1eXVLZDJHWEVGQXZWWVRl?=
 =?utf-8?B?cFRvUjFYRWVOcEU0eG5QUGx0WjlLZ01HMmtlTjNXZGYzaFI0SEpQNXVwTXdW?=
 =?utf-8?B?dkhjSkR6emp6TXFoeFRyWFVCSFFUdUk4WGRFK3pTcDVYUEV4dkd3b254VnZx?=
 =?utf-8?B?NE1xNVM2MUtMYktuUzlZVlFXZ3ZhbjZpSDBYK1diNGZVQXVENmMvSHphQ3B0?=
 =?utf-8?B?N2hBOEE1VzFqbjlpRHF0RzBaNTNrTlMzR2dQZFpTbkVOQnZZMFpQclgwaGJy?=
 =?utf-8?B?U3ZXTE1TVlNTMWhBME5NbXMvQVh4dDJ6S3kxRUdTOXZab2VqZklUOGlVWEJD?=
 =?utf-8?B?N3RnL01IRkU5YmdlbjUwcTAzZm1CY2RuaXA5L0VyWU5PUkF6SHRsQ3NoZG5Y?=
 =?utf-8?B?RDl6YXZScWZRYUR2elBJd3Z1czQra25UWkxLakRiZUptZWN4UFN0OTNOZE11?=
 =?utf-8?B?MVBucDFycWJQdks4eEx6aTN1TU1odGQrSEY5RlhFNGtSNjk3aHVzcU5NNVVl?=
 =?utf-8?B?bTc4OFMrRmVxT0JQNGVxbmpqZDdCejZmZExsa0tQS09mYWFXeDJqTDgvem01?=
 =?utf-8?B?QzR4RTJydmxkbkp5YnhxWVlDUTNPRjZZVWlkdmZJOURLNFpJdlFraU5ZbVI0?=
 =?utf-8?B?ZUNnUWVIVVRYSllYTm8yaHpIb241V0ZGM3hKTjlZUVgvYURLU25aVmtZTTRZ?=
 =?utf-8?B?Umx6b1czQk00ek9vOU5ROEwvdVN6R1NaS1hBV3NINGhUNjdwYmcrNEtIeUpx?=
 =?utf-8?B?ZGtvMUM0ZWFFM09KOHNwalB3aDN0dWx5eDVBUnJ5WndzYkI5Z254TlNRdHVy?=
 =?utf-8?B?NmQ1Vm82d1RFTDMvcnZTb1VUNlpjYmJOa1dzQVMyQ29rR29jMlZ1dWFXWGpT?=
 =?utf-8?B?TlJLUXErdXZsNlArVVlrMmk5cDk1Qk4vYjRHb3BFdDVUeThKVG4wcSt5NWZ4?=
 =?utf-8?B?NStKVW9aaTdCNVdFQ09xOTNMZVc4a1JEV09wTzNVdGFvL05VQTJ1b3pzQjRa?=
 =?utf-8?B?Zk9iTE9pelV0YXR6dDloS2h2cEhqWWZmVlNvTzZpMW82T0V1allkVEwrcnFY?=
 =?utf-8?B?R0o2VW1IMThMYURuVWtUbFhwd1hLQkRxUnRobnFPeTQvUVhnOTN3VDZJSzIz?=
 =?utf-8?B?QTg2M0RLMnJoOHdTakFhdVc5UnNYVU5jWGZxTCtRU3k5T1FydWF0aE9UdHhp?=
 =?utf-8?Q?wcZeioJBfxb+u5RoKXBPRlmhE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c35c9e07-5c6f-4cd9-0c1e-08dd863f5a3f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 10:28:01.3896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZ+pRvGOIZ6mVDQj1gkCiQJnl4cNVtWkn3wM/ySeDZK6wxJv8ljjn7u+jZ1pjELnl32VwX5qpAEI4aCB5BUXuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8062
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=680f5835 cx=c_pps a=XlWNgFwcAB8XWrBhwjv7Vg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=71kKxFBeP7vLbc7rhoUA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: nkyy9tsaB55EB6K2KtMkzsqSrzgXYSmZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA4NiBTYWx0ZWRfX2E3j209NXNfb O8QYySC0Y+ObtRpsmr0EVyoJq2SiBUopDWrZogLnzRIQNaDnUjatO8R0zW7UarqAz+TWb5BEizG hz2xsQs8J8nOo08WLnRnan+zqLpK8dzg5gH2dyb9B1OZq6hVa4JuQ4JdAFkAGbpAfZJW8DX1/9N
 HJaAgze+63ArUHq3OCnhK5ZFE2WDsEdqh7FGJhGgPqhUPZeZ31vSZBX+ApsslF6jhHvN4pwEdjG t8gVbWE6PZPQN3Otvl/0Yp8TD/5x7sFN/hjR9xaD+GJy2n6r9MwOyn9wLeJoMc1o4ZZ9DO4voN5 ds95497UTOB8kQsM+o7b9SMQZqtWItt8zx4etLv0nXyrZxMZokxkHlZvQqB7PcEvThYqUmFg6L/
 4b9195x4MRCNLeu6i2uIo4JnMNCxN4SF1A/6+IKB9LfZimz2AzGWMU4nPcysvkoiH0m53U+Q
X-Proofpoint-GUID: d5SFro2NUgYrZCOHUx4qs7hgnr_DIvO-
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504280086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 10:28:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215592

On 4/28/25 17:57, Richard Purdie wrote:
> On Mon, 2025-04-28 at 10:08 +0800, Chen Qi via lists.openembedded.org wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Move the functions in qemu.bbclass to meta/lib/oe/qemu.py as they are
>> generally useful.
>>
>> Now the QEMU_OPTIONS settings are moved to bitbake.conf as they are needed
>> for qemu.py functions to work well.
> This is the bit I disagree with, I'm not sure these should move.
>
> I want it to be difficult/obvious for people to be using user mode
> qemu, it is not something we want to encourage or make too easy.
>
> The reason is that we target many platforms with aren't supported by
> user mode qemu. I don't want the project to gain a dependency on qemu
> user mode support by stealth.
>
> Cheers,
>
> Richard

Got it. Thanks a lot for your detailed explanation. I'll send out a new 
patch.

By the way, I totally agree that Yocto should not gain a dependency on 
qemu user mode support.

Regards,
Qi


