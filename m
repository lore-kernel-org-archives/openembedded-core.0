Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D56C282DE
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 01:11:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4091.1741655454789926923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 18:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51653cd539=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B0vvBZ032744
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 18:10:54 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458j27ak7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 18:10:53 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52B15vfE011957
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 18:10:53 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458j27ak7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 18:10:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFGVDFhhnaFzZr/2yQCL9k7hSmTGZ2xrHdNAgw1sZ/T4j/OR9XAyPpwwB2RIeZp5exmUptS6lB4gcECXZSys0kG3rXaJPDx5VUzkipDXLyXToQ9007lPV4Wvi/7ccBLeV0MBfqBVZB9+5ZzjMk4di3wqc9v1lGZJ86uLPSU+BkvjLJc7t9PXZkvej+oYryRt6FDCO/sPR1NQxJoz6H+Hvq8B6YV9yXzQnl7cFGhbhshLzpHfDbgE+ODDcUV0HKXeVye/son95gLDYXqB83+VgLjxIjIy0AywkOb1ZT9BsgDlQOHEi28YowC4+C7MzAwz8V5FkVIGlyFoOZIJZ5k/Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uM98/J7CdI8bgJwhuwnx8Knetc0vLoF1SVB8S8Mey64=;
 b=CTSGc2B9oiz2fvMJtE93MzuMxPDDeJ9UN4LbumBkU1IOnBE+EsmTkhgAdMOA+e/2vQVzogQrqjM7ZXXX+i82fOka+qpZTiYNLSxbUw84ZijY0gnDh9KkJpLwKsbn6nVt2loDzsdrIC3oZDDHvQOadtUdmL4B72+fIGqVMoZgFCjl/WT8FT4TtM7otgwiOKxj3KuAZn/DI8Z6bv3RHMXJotUaMd1sJ4NvAb299QP88ZpozQnn1FDj0lByhp/legJ+0EcpENKu0Z9MiVSChUQwEUTgY18ECFSG9WMeomlQNqEY9KMRh3Vm08Nwn76/5UYj+Is7sTDEssyHIAdTS35nuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2671.namprd11.prod.outlook.com (2603:10b6:805:60::18)
 by IA0PR11MB7305.namprd11.prod.outlook.com (2603:10b6:208:439::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 01:10:49 +0000
Received: from SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326]) by SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 01:10:48 +0000
Message-ID: <10787155-0935-4352-bc16-522088b9ce05@windriver.com>
Date: Tue, 11 Mar 2025 09:10:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][kirkstone][PATCH 1/1] boost: update SRC_URI
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250310090101.446602-1-guocai.he.cn@windriver.com>
 <CA+chaQf4-0NRdJBJF+ZAwO0KGVDvA2rnQoNY5ms0xjZ0uZY_Vw@mail.gmail.com>
Content-Language: en-US
From: guocai he <guocai.he.cn@windriver.com>
In-Reply-To: <CA+chaQf4-0NRdJBJF+ZAwO0KGVDvA2rnQoNY5ms0xjZ0uZY_Vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0133.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::20) To SN6PR11MB2671.namprd11.prod.outlook.com
 (2603:10b6:805:60::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2671:EE_|IA0PR11MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: 1622eacd-8f2d-4ae4-811a-08dd60398f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Mmw0LzlhbE9aOFk1SWh2Mi92Z2IzeHB0M0ozaXVmWHZXWnZwb05JMHZ1U3Bo?=
 =?utf-8?B?OSs0UXJrczhRTTV2eDlHeEVCSnppSTI2VG1lVjJwRm5FV2ppOWFCWWE0cEQw?=
 =?utf-8?B?bm5ha0cvYnNiS0JMTHFHRk1VdHJjQmR1dyswWVYzdlkzdys5bGFUK091LzB2?=
 =?utf-8?B?WkZyWlloRjBNRHRxNURSc3VabmNEdDlIZktZeVpYZy9qSUlHL2Z1OE1hb0cr?=
 =?utf-8?B?Zzd3MzA0dk1MU1lSMTQxeEErKzcrZXpOZkRsSElTQkI2OHhqbzFEQ2pQalNy?=
 =?utf-8?B?VzZFNWIxd3UyWVZBd2dCT3hpQ2o4UkQwa24rYjFlVVYyeWNCVUNGVFNELzJD?=
 =?utf-8?B?NnE5V0pHQWxzUTlBV2xyV2pLQXcvQUoxb29Pdjc2MXJVa2x6MllWK3M0NnlU?=
 =?utf-8?B?eXFTWm9zUUJQZXViRE0xN1JGWllFSmtadEg5UHpyVWdyNlVVWGd5YzZiMytU?=
 =?utf-8?B?VmpFYk9CTzEybjEyQ1F1cURsVEk2VkE5REZteVB1RFN4U0l0NDBwUVVYQk5z?=
 =?utf-8?B?NVhIMjZxTFZCSUVRNFpyUjJsMks2ZjIrV0J3QVhjNThoMXNwZVFWZ0lXWjA5?=
 =?utf-8?B?ZjJHRVhGbVVXSWt3bzBlT1BGRmFub29maUFhYlhqMFhHZXNPQWsxdzRVbWZF?=
 =?utf-8?B?byt2anBacmtrK2hTRjZ2UkR3aDBWUnQrekJHT095NXNtRlhIak1iWTdFK0lW?=
 =?utf-8?B?NHlNam05azZ3MG5HeU93TXZRMzFnMjMzU3pVeEw2R21JaVNVcFVjemloMnhM?=
 =?utf-8?B?dUFnalZXQ0tLN0FtdmN1L3padlpHOTI0Z0pGdndoejdGd2RDS2ptRHVjQmtH?=
 =?utf-8?B?ZEZFaThSN3p6aUlUWUREbnJuZTBjVVZMdmpvazNKMERwYXNBSU5taFVZZnZn?=
 =?utf-8?B?bjZIQ2piNnlZUnNvUFBJeG5DNDZhV2daYXRFa1cxNkZ4Y3A4ekJQNjlUT0Rt?=
 =?utf-8?B?OXowZXVIT1RtMVdIektocCtQMU1PejgyeVFCajdVYlFUS1p0VkhjOTZUd0ww?=
 =?utf-8?B?VTJWNWJPNGJFS2M3UGc0L1R6Nnd2NjNzc0p2THRmbU5ad2NCaEFMZ0U0TzFv?=
 =?utf-8?B?djFCTVRpTjM3Z1dYNXJwVXBXSnFtbWIrQ2d5QitWcnYvQnVlV2NvYWRuZkd4?=
 =?utf-8?B?QzVOZlpPZTRiRU1UQmNFdDF6Zml1VWp1RHV3TndTMXFYWERoTEwxM05HQjA0?=
 =?utf-8?B?WjdHdnYzSjJlSzJrVE5QdHBBcEZHMzlsNXJDQTJYOXNzekp2UEtQRU5KKzFU?=
 =?utf-8?B?NHNSMXA4REIydkd1Rmx0VWdRS3RlMlY1N0dmdElZMm9leFJrdFd2UGN5c0dr?=
 =?utf-8?B?TlY0UVFaanRHOW5pVU0vaG5aeDJxSmFJQi9EM2lEUXRFOFJWZ1ROZ0hPZ0Nl?=
 =?utf-8?B?RmJRc1dvM2h6R3VpN2V0STFLWlM2VnpIeU1xUFp1c2VHVzVzd1lkTzFwQ0ZR?=
 =?utf-8?B?a0tYSG5ZWmZYSFk1d3FmelpnYkpFdFhiM3RMdndXbjNQYi94L0R4UEZ6SnI4?=
 =?utf-8?B?cXpyOGkwTGhrVXNyMXdrVHdCTnpSZVBDSnFKdUpYbnRlUGRybjdkK3FtMTVm?=
 =?utf-8?B?WnkwTWpveU9kb0lqS1Z2Y2VvTzUwNXdRTzV3MDZwY2RWNW5xMkJXMHpGd09V?=
 =?utf-8?B?V2NpZ2cyZ1R1cml4cldzVmlobVV5aGNIZUxSZ0F0ME5uRCt3Ti9zUFoyb3pm?=
 =?utf-8?B?S0FRTnN4NmNEZWRETXljTlNqVk1YdWJ1b1VKSmJRVWlhRWRxVjVodi9oMFEy?=
 =?utf-8?B?TFlMTjl6cW9iRmpNQ1M1bjAvZGFlY09kWSs3YjJ5UkU2S0ZCNzdSMURVaE0x?=
 =?utf-8?B?WXd5MHJNSUtNUXVEUi9lUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2671.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RGtaNXNXbGFXUHYzbEpCMFhPWlhMT004am1CUEFQNDZnZkJ1UUhPMTdPVXF6?=
 =?utf-8?B?TnhjU0lJdW1rZExtdHZPYmR0S2RuUGRvTllaMFk0NURCOHNEN0hJcTBrTW5w?=
 =?utf-8?B?eEhyT2VGMStFSXlQS0tDZDJneTB4cEJCNEpnanRBTkRSYjhnaFdBTFp1YzJK?=
 =?utf-8?B?OXMvME4zKzl1MVdQRTl4VWJVQ21haEVNbE5Mc1FJWWlxOUJzcEJWUjZwME1W?=
 =?utf-8?B?QnUzbjN5b2k2bVdhaldKS1gxb1hUUmhISEMrdlZWNmUxc25JOGQ2dUhnMUpw?=
 =?utf-8?B?YmxpVFE5WHJhNnZBcmdKMlVSZVUzbldQaSs2R2lDNzJzWUdnNXQ1UzArclUy?=
 =?utf-8?B?cTFkemxKRExlN1dNU0VsWjNuQW5Wem95ZVoxQTJ3cDJVcGdSVEJhTm1QTDlt?=
 =?utf-8?B?c2V4ZmtmVGhzUm9UNDc2T0xPSm9sQmlSaW92VmJ5NkRrUEFUVjlhT1NnaUQ1?=
 =?utf-8?B?V1QyL3RGcTF1UjhQY2wyQnhyYjFJWHhtclRPTXl2YmhLak9ONTBBVy9NU0V0?=
 =?utf-8?B?aGJTZmFKa1k5QW9TSnorcWF2b0NNN2xCSkI4cnZWUTBzKzkzRmNzRk14anc1?=
 =?utf-8?B?cHJjd1NXQXgyMFhkTWxTdkFXeUxFZ01Oc0pydklTQkJBLzlSczYvVEVmNS9F?=
 =?utf-8?B?WktSZlNmaGdXM0dma28zeFluSTVDb0pKblAvdXE0WWQyM0g2bS9BQ2RrV0lK?=
 =?utf-8?B?d3dBMFd3TUlXbTZwRnZFQTBGd2ZJKy9hTWZMQTljYWUwSlY4MjVaNGx2b0hQ?=
 =?utf-8?B?aCtEd2UwMDVjblZnS05aQUNSZng4QytudHF1SHluQXlab1I5Ri9ZWXY3LzFW?=
 =?utf-8?B?TW9STHhrak5nd1UwR3UzdFFZdnoveUpxQm5ac09abktVcDJhU0pOQVU3ZjRK?=
 =?utf-8?B?N1pSdHM1dzBrK2RlY1JZdHhQMmhNWldLcjZzaFRzZE5kUXdjL2cvSlVONGRW?=
 =?utf-8?B?U0RXdDhKZlZwbEo4c1I5L0NvNDh6VkZhQ1ZUdTJyL05VTW9qQjdHYmlGSC9n?=
 =?utf-8?B?SUsvNVhJbXU2Y1BUelhYUDQwMW5BeC9CaGpsYUI1cmU2dUdSdDZjNy9hSng4?=
 =?utf-8?B?ZVBLZXpFOG1TYmN0MjFpU1ZHMThSWmVxb2E5YzYyQjRubXg2VjYvYjJkR25Y?=
 =?utf-8?B?cWkrTmZiZUp0cVNueWN0bVltaks3TytjWjdjNmtNaHpwVkg0Tmd1cjU5cWc1?=
 =?utf-8?B?UmE2K2pwRmdHOHhhMkNjbTQzTTZITU1rQVhUY0ZqRUJ3dHJpTHJDOVpQb0dP?=
 =?utf-8?B?M2piTUlwUk9QTmJSNUJMSzlQNndzV1VyRUgvaEdtZkV5ckgwTWVJbzhqRU5o?=
 =?utf-8?B?dzRUUXVzN1NuRXRrNmdJUjRVWXV1SWlwaXZuYWV6L0hwYzg3dGU0THJXMTlm?=
 =?utf-8?B?a0l3TklMemQ3bEp1UlRMZUdXOGVEUFlPVmtaVXdWODMwK2paZFFObUpKdXpq?=
 =?utf-8?B?NU9VcXdmNFNiVFNwNmN0bGc3Z0lIWDhPOVQ4eS9ITDNCaitZdTFZSFkzSUsv?=
 =?utf-8?B?OEJaa21KKzgrdm0xSWRPbHA0Nzg3NDI4bVkvb1BSSjBYVzR2NEd6RmtOY0xD?=
 =?utf-8?B?ZkZialRJRm82N003TXBHdnRwWEJ1UGN4WjFOeDN2c2J1Wk1jQ3BHUGRMNGh4?=
 =?utf-8?B?dVJLdzhkZGp4WGNPajJ3bktSL25VYThIc1hOZEhtWExPMHhrRnYvc05BSG80?=
 =?utf-8?B?a0dZRWx6UnFlY2x6bzdNV1h1N2creEE0ZmJMcExIVjZuOEJDQnZhUVZzQ090?=
 =?utf-8?B?VXdJOFc5OCtZSFFtZHlKM3lYZnJTVUNXa2Y0RkdmTzJLeTU2ZHd5aWsxRHFT?=
 =?utf-8?B?eVVLSysyellEQ0lEVnpYcEo5TjhHZjRGT3c4ZzBJRzJXcHVxZS9YVDlqS1pR?=
 =?utf-8?B?MVJtN3ZmMVFXQXVpS2RHTHN5QUFGeHkwR0NpeWZTMDZwbzg3NWlqMjlRRjYw?=
 =?utf-8?B?VTNQTnhCZEU4TXhtTlE0UHIzcEo3a3pCTy8zditRMlJPQlhDR3BvQ1hvTkRV?=
 =?utf-8?B?K3NpWXQ0dThrSnZHZlphMnlZZ0JLRmkxRmlRVWFlVFdoeThrdVVzaGg5a1Rl?=
 =?utf-8?B?MllsQ2RGOEZWdWpYTFEvUnIxWFlkTWhqeTgyaEtrUXRaNXJuNCs4T2V1Qm9l?=
 =?utf-8?B?WWpnTHNXWWlVSFVjdDd0ay95dytXTG9WY215TWtobTh2WTd3MnREdzRoQlRD?=
 =?utf-8?B?S2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1622eacd-8f2d-4ae4-811a-08dd60398f07
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2671.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 01:10:48.8152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sjvbSTR4BjCGkpyfl0/f5mQUqmzjhm9oR7iEDtB9hZ0EZ0E0p9WY0XjNTf7QWOFi4XyfBYkO0gZVMD7Jr6FUWINiXxTbpA5TRcsFC5C6LKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7305
X-Proofpoint-ORIG-GUID: CHV9zEYFwdz7UyGx7Ogb4ZnrwmYn8r5Y
X-Authority-Analysis: v=2.4 cv=WNuFXmsR c=1 sm=1 tr=0 ts=67cf8d9d cx=c_pps a=LJpgAVzrtcldLI4wrjuEkA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=Q4-j1AaZAAAA:8 a=gvic6WYWAAAA:8 a=ovJmrJClAAAA:8 a=AIPdC31oAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=FZvwupbCPNh938574uQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=PupUpSa0FqD61Tkl4dNl:22
 a=brTEhlvMp4NY0_u118I2:22 a=5478VIVnyzLWgM9zoUhq:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: MDnp5OjsWNqqZERcZb5xw77a_F7228a8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502100000 definitions=main-2503110006
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52B0vvBZ032744
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 01:11:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212537

Very sorry! please skip it.

Thanks

Guocai

On 3/10/25 17:36, Martin Jansa wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Is it really needed? It's already merged in kirkstone:
> https://git.openembedded.org/openembedded-core/commit/?h=3Dkirkstone&id=
=3D3b4c5ce6b89477307f3a2c30c7e275473b0c9f00
>
> On Mon, Mar 10, 2025 at 10:01=E2=80=AFAM guocai he via lists.openembedd=
ed.org
> <guocai.he.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Guocai He <guocai.he.cn@windriver.com>
>>
>> The official archive location of the Boost tarball has changed to:
>> https://archives.boost.io/release/
>>
>> Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
>> ---
>>   meta/recipes-support/boost/boost-1.78.0.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-support/boost/boost-1.78.0.inc b/meta/recipe=
s-support/boost/boost-1.78.0.inc
>> index 729a47b54f..98f4f7ff30 100644
>> --- a/meta/recipes-support/boost/boost-1.78.0.inc
>> +++ b/meta/recipes-support/boost/boost-1.78.0.inc
>> @@ -11,7 +11,7 @@ BOOST_VER =3D "${@"_".join(d.getVar("PV").split(".")=
)}"
>>   BOOST_MAJ =3D "${@"_".join(d.getVar("PV").split(".")[0:2])}"
>>   BOOST_P =3D "boost_${BOOST_VER}"
>>
>> -SRC_URI =3D "https://boostorg.jfrog.io/artifactory/main/release/${PV}=
/source/${BOOST_P}.tar.bz2"
>> +SRC_URI =3D "https://archives.boost.io/release/${PV}/source/${BOOST_P=
}.tar.bz2"
>>   SRC_URI[sha256sum] =3D "8681f175d4bdb26c52222665793eef08490d77585293=
30f98d3b29dd0735bccc"
>>
>>   UPSTREAM_CHECK_URI =3D "http://www.boost.org/users/download/"
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#212493): https://lists.openembedded.org/g/openembe=
dded-core/message/212493
>> Mute This Topic: https://lists.openembedded.org/mt/111615439/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[martin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

