Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11044D2CE12
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 02:58:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61658.1764903512975146591
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 18:58:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MH70NhQH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4434d54add=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B52Mxps1836115
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Dec 2025 18:58:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=ZpOzO+sH8TsB6NSL7QVbnM2/+poJ5gaSlaja6puFQLc=; b=MH70NhQHpnFp
	RYqRb2Zu6bWdQC/OUw2OwfNaTZsW+Dnjfzy0Ty5i8hRfLvL9gKfZjSaOmutOOLoI
	zL2iGIHkZrWBTtb08RuWyFOT42bJRxkCF7SRUJ9KJmm53GMB/rR1Ucwd49ZQT3Cc
	W4ZbuxVmXEJb3IWbAIwcCPsRSOx3G88HDbIZQcV7uYdIwhqfj+1mPgF4fzL3RaWc
	TaQ3fi47hHVBae25OIBjIr2//YrV0jdJkh7YSdytngtmKoS/0ikjefeRrkWoBQcQ
	9MAkI407H4ZZaeE3m7pZRnS1gdUI9RjVewF0J23hiTW455DczEZSb6bLeQ41KQHW
	xl3+pLBgXA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012004.outbound.protection.outlook.com [40.93.195.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ar17mxykh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 18:58:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kF3aFEcWcceYERTpFaS5oIM4DhlwP24BaKrZxQM9QtuxhKr7V072mZgw6IimcuFMYmSPi06p/pOQNSqvpam1XlRk2slor/WZ7EtwG1KNvxJ8cKvLXefhJRlrfrg3mpcuaoW0nGqwmO136y778Qefh6MQQ/WCZT6E0RFjO33Xo7gI5r2CxaLW/Y5ggsdw25bBBTuWdF/JX/O5rBT9nyJ023CA3avI2r1VtkhWTp/pTi4Z8G10DYdxXJz2mhv2e87ACbLMf60P4B01NgvOPblyYkVCMKi45+Fj+moaetmZudvc4PTa6fyeOyYOyAowuTG/1r1I/AOKTCxdX1U1anMkCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpOzO+sH8TsB6NSL7QVbnM2/+poJ5gaSlaja6puFQLc=;
 b=j4YNqyd9WHKMOcyxpNVuucyFpg7NOhVtc/vfvMytVGwtx5/uTMutRsftcJdgvqZZwoItuF95aeL8sLlfZM+nBZNO/Xvowt7SzBFyU8kNB4NT2rhWXn/1AOCBcKJrQoRc/NPltpR6qvEvlyK154SLELfMz0nisLHPHkZFMR63Tvm4gXYPvChdsP42hn3F7i4MGAsCX7B2B0QC/6w0FK509JmXhKTztR4MiZv4D5tE6dN0f1yB8WOg1G/7huj+YG+0k/tZLs+26Myc/Wt7TSr2V+nWgCabrLXp9vjRjYt6d2nmMyW5YYwvkx4OU9f/t9j6J/lhhJBJ0CrqBlUnRyxzbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB7818.namprd11.prod.outlook.com (2603:10b6:610:129::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 5 Dec
 2025 02:58:28 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9366.012; Fri, 5 Dec 2025
 02:58:28 +0000
Message-ID: <2e5dd8a9-71b4-4503-98f7-0405eece7c85@windriver.com>
Date: Fri, 5 Dec 2025 10:58:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 3/3] util-linux/util-linux-libuuid: upgrade from
 2.41.1 to 2.41.2
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20251204064429.559529-1-Qi.Chen@windriver.com>
 <20251204064429.559529-3-Qi.Chen@windriver.com>
 <DEPDV2RI1IP0.DSA9QJSL75ZT@bootlin.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <DEPDV2RI1IP0.DSA9QJSL75ZT@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: 2052b5a8-646f-4e1d-0487-08de33aa2a40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U0JMeWdLck8rQkNWRnJRazFOdldOU1FVS1lObVYzRmw4VXhLa01pN3RRL1B2?=
 =?utf-8?B?VGlHeVlJYk1WSG9NajcwbElBVER0ek0yY1l4cGx2VVZBNTJLQjZnNHVNS21D?=
 =?utf-8?B?cmN4RmNJSjdHNTBqVjZDamthWm12Vzd0Umg1QmpTaDN6YWhsS2FPcnpzbGhv?=
 =?utf-8?B?UmlwZDNVUi9WbXJlOGdObTZCd21lWGpNMlZmREluRHdIWWo5MnEwZ3B3NUtN?=
 =?utf-8?B?YnBHWGM4c0llWlVJR1Q0YzlUWWxZUjdqVnd1OVFOYVFLbXA2TW5mYmtQM2Nh?=
 =?utf-8?B?OUFhTFNaYmsydEpXbHAwVzY4OTVwWWpWVmJkWUtoWXE2WXlPdGNtUCtjT2Ew?=
 =?utf-8?B?N2tjaDhFNXVMQTBpUjl5MWdobi9UT1RjT3FneFo4VllpWnF2N1g5QzAzWjRC?=
 =?utf-8?B?NzlzWVlrL0RrV2xOTHBFeDZ1aVlZdks4VG1xWTVlcHhHUGVzK1hxMzNHOTI1?=
 =?utf-8?B?Tjhha2lvMlpRV2xVem5kRFd3enY2YlI1dHJuSFFGK3czWGtkRHMvTjEzbnBJ?=
 =?utf-8?B?eXRvYm1wQVk1cEtVZjI2T1Fwam0wMm92SEQwZTZPcXoxb3JibzNZOHBBK2Ry?=
 =?utf-8?B?Wk8wR29QL3I3Z2JpOElsb0YzRzFXMFhCdFhpT29NV2E3L0J3SFpyQkV4Wm0y?=
 =?utf-8?B?dXdGVXlhZG1ncWRGcllubEpzeFVmemI3UU9wbWtUQkN4OFBGM1ZOUlNoRlU5?=
 =?utf-8?B?T3FUYnRPUkF0N0Nab3ljeTNPNWpnTjRGNFV0bmRIRWlDV29mVFN6ZS9EUFpj?=
 =?utf-8?B?clJ5WVFwbWZyQk1mNkJPYnRBMGVyYmwwMDZzM0EvZThMV3ZpUHoyOWpVWmNt?=
 =?utf-8?B?cjA4WjdXM3o5dWFkS0NIZEJYYk9KOUtGN1ppRGxhVWFOU3QxMDFwc0pVUHFJ?=
 =?utf-8?B?ZExiakx3SHBFQmk1MTNlTW0zZ2VkblA3OU1rem50dS9rQTdGcGxnWFZuTDh0?=
 =?utf-8?B?MEFuaVpRTFUzMFdZcGZjNnVJZWtGSmxNMXZ6MXBXTzlqOC9nK3BoenUwT0Ru?=
 =?utf-8?B?QUpnemR5K3B2M3VURkhJZVVnU0dYQUJuaUhYb0FKak5FVFBjUHZmSElSL3Z3?=
 =?utf-8?B?cXgyR3NYQ0FHNlppNi9ramxrSkNIUVpxZk1tdFhieTdQSUJuQUZvRUV3emE3?=
 =?utf-8?B?Zkt6SzdkRjVENXJtTXkwZmg2emcwWDhMV3I1VE91UVRaNXpBSTNnMlZTTEFW?=
 =?utf-8?B?MGFra0xrd2tEekxJc2xrdjhjOFNtQlA2a2VoWldNSG5YMFlTTzQwUk1LMUFs?=
 =?utf-8?B?WmJ1UWNyQm9UQ3BCS2ZhT3czZ1R3ekJlUEJQRVJYbm5YeWtXWGFaamUzVlpB?=
 =?utf-8?B?SG12UGxyWXVvb00zcnZwZWM1RzUrMzlIYVEvUWFaR2hmZHA5T0l5QzJ0ai9q?=
 =?utf-8?B?cmJ6bGc4dmpwMElqclRSQXJNb25sSm9FL2UwRGRTTi9hekRBK1Z0ekpJSmIy?=
 =?utf-8?B?T2VhZzBtOVl4bUZTVWltM0x1ZTBoK012dVBJZmpGYWxtNEdvNmhIK1hmMHNv?=
 =?utf-8?B?emZ3K0F0ekk4QmhzNU4yaUVtZzhGN3BNb01NSU0yNlg4K0NOYjE3K1gyeDNE?=
 =?utf-8?B?Um93WEVpakFzVlpUSjF1R1lINVFuN2hkdTlRUS8rOXZqUExyQndWVktvVDVY?=
 =?utf-8?B?N04zbkUzWDVUZG9DeU56aHM3TkdnaSttVVNyLzE2eHhDMklWcjdQSFI5ZzJi?=
 =?utf-8?B?S0VyMkhIVlc5WEtSU3FTN3ZERWNGMnE5alAwQ3FFbSsrMmJVME1IY0xrYWh3?=
 =?utf-8?B?UERoSjRRUVh0ZlpTaWIrT0pLQXY4Yy9NUyswdm1GU1pZcXVtQ3R5NWRUT1pr?=
 =?utf-8?B?aEZlVTQrTnBXMnpBbWJxUzIxeldZUk16ckliczhYeGtTQ29qMktPQUhyQ3R6?=
 =?utf-8?B?YjAwTmNGRFFIRzdpUldWWFNUdnpFbW1RTG1uTmNaWWg4elN6K0Z1VlFzUXl4?=
 =?utf-8?Q?Qet6/PTc8J/Y0ctzGdlC+XB8eLO6mpaF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L1R1V3dZM1FHU3NMT2R3Wnp4dnJZLyt0ZnVhRlVmMkhBZmw4dTA1U3RvRllr?=
 =?utf-8?B?VG9Kc1NUVzF0anNIOEo2YmhKSWFJSUs2MXNCRWtJcW9GejVtVlZQYUcyenhP?=
 =?utf-8?B?RGJnZFYvRUptNmZkY2ZuTTlRbmR1UjdTVWZBQ0JqblZ6UnlBUFBUdElEcWVh?=
 =?utf-8?B?ci9kYWZTcTFxS3R0eWJzZ2g2N1VFVXJPd1hQdStUNk1ENnMwYmZLYWtTMlNP?=
 =?utf-8?B?WTZnc3RjRWtaMEZZRTlWRFI3eUgxRmtrSGZCaHlxczFVMFdZMG0vZXJTdS9m?=
 =?utf-8?B?eTlrRW1Oc25hWUpyaVFBbHZBVW10U3UrVWNLT0JaUzMxR2Q4dzZhRWl6VUhq?=
 =?utf-8?B?VWE2bk1SZDRkb3VDaGNmTEtYUGJBK1NFdHVkeTlmcXQzSUE5aW95Sm01NUFN?=
 =?utf-8?B?bkxaWDhFSWt2Z1VmZUtJdVl2dXE4Nm9FUDZ2MExtZVJSL0svS1Q5cE5EcndU?=
 =?utf-8?B?NGZYUnVrQkJRS01zejZTTnRQYy9NMGNmVnZQMlZJeTg0MFhCVWNvRFI5SFpj?=
 =?utf-8?B?T3FudU1tR3hBeUFmaEt0eEU0a1FmVmdqQ1FJVmRGZGtXRzVlZXdESDYzanBu?=
 =?utf-8?B?Y3oyUVlpeEVMaHRFbm5xOXB6d24wVkR6RjIyczMwL1ZBQU8zeGdLWVBBdmM2?=
 =?utf-8?B?K2liK3hjQTRZVEFNR1JoK2d2dzNFb0g0RGIxc2pPSnVXL1dQZSs2Wk5vVHdT?=
 =?utf-8?B?akVGMnBXbFQ1c0htYXk3NU54OUpOYlV0bnN2RE13bkZzNDNnWHNzSkhFdCtm?=
 =?utf-8?B?ck9ZSm9VY3lNNnFWcko5SndLb3Z5TE5Xd2RmWTlTNzdSU1cwM2lvNmJGeXFk?=
 =?utf-8?B?UGpzdGJFM3I2MDJ1M2xkWWlHMHhPUjBLSGhSQVhJY2R0UDQ4RGN4YVk0djRG?=
 =?utf-8?B?K3lXVldLQ3hydkJPakhXQ2JqZjlHSG9MOVV4U2tIa3ZhMWtJcGZhR01lN3FY?=
 =?utf-8?B?VGdPekhmMmZnYUtXVmcvTVNFQWNDN1o5U2VhbXg5clVZc00wUFZrMDhpSFZX?=
 =?utf-8?B?WVQyWUZPUVd1WS9DQW1LUHkyOEdmYnpZN0s0Y2RNMGRBOXQ2YXJzY1lkUCtr?=
 =?utf-8?B?WlZXNmFSbUcrNm9ySnJ1ZXEvZGhwYm16LzhacWxZNTVoVzV3eFNYemxkWG5Q?=
 =?utf-8?B?a2gwZUg5Qy9NbU1mSTdMc2MydC9XTnQrTGJ0YzM0bm1xSHVJNXM1YytqKzhw?=
 =?utf-8?B?Q0ZnbVh5UTlFbzlIdHVQN3YwS1JweTV5anBvMnhQWmtxdXhIbXpYQkRLWUp0?=
 =?utf-8?B?bW1vdXpGS1JuRTY2YVEzQk1HU2tkQ0hPZEczMjBmaUdPUDdiMmZ6VjRrSGYy?=
 =?utf-8?B?SVNPVDEvRU5RdHZBVG5UNVBnckc4Z2tOUGVOekN3Qk13VkJmNHdIS3NjYlRR?=
 =?utf-8?B?VkxIQnNEWFpSaHBoYTl0K2xsR05hQm9SekFjWVE1K1NFcDZBNmdWMC8xTnE2?=
 =?utf-8?B?ajJsWEcxVUR4M1NRNjhKby9xQ1A4MTZqQ2JqWGFrSTVpOXNmYVBYWDNOV0Ju?=
 =?utf-8?B?dXNHR29wb1k2MzNHT2c4Zmxta0RwQm00VmJBb2tpRzIrQWZvYUp5L2NyT2lE?=
 =?utf-8?B?WG9DelMrYTNhejZpREN2Uk8vcENUWnFiZWsxOFhxMTBHUjQ4RUpJZEpKb3dt?=
 =?utf-8?B?ZTZhc1dNa2lYMHAxanJXcCtwSUVkNWpDa2hBOVQ1V1dBa1hscHM2cUZ3Szhq?=
 =?utf-8?B?d2ZRVGVPdTRrUUFtTDV3a0dhalB5QmZvTWp0SEIvOTBkcXlhU0F3YWdrTVBL?=
 =?utf-8?B?RHE4clhKTU9GMXJlV0l2U1JHWTFOVjJBbCthTXVINktqWUR0aUR3dktMYXkv?=
 =?utf-8?B?ME9kVzVlYzQwZ01hdFFHK3oveFQwS0E3TzdoRnZ6VEVGam1xaEduUEMwRkpF?=
 =?utf-8?B?QURLL0FLV2xWSGt5aVMyOEhiTWtPMmpHUEQvdGRaUzUzL2laOFdrd3d1Wmtx?=
 =?utf-8?B?cWYzQzBqU0s2NHAzT2NXOFNBYkMvRHBBS0dLby9xS054cXVjcXFXSlF2TEdh?=
 =?utf-8?B?Zmx4aWZ1OWNvTEdJdytBdTN5ZTdCeUo5VEhyWmt3T1ZwMldwUlVJdmFKK2Ro?=
 =?utf-8?B?ODRoWmdhUzdnMlFtRFNqVTJpYWRvSjlWYkZLTXhhQ0tTbENsdVVHa3dVSWs4?=
 =?utf-8?Q?6ql50rLFEFfFlUKQoRj5B8z39?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2052b5a8-646f-4e1d-0487-08de33aa2a40
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 02:58:28.2310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSzEpOPkrGpEFmx/p6zGsiCNuy/6c/i7ouqIsTBRFzt3K++gxYszyhQv9vyaqt+iKGfdZ58chicictbLyq/zGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7818
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: dLB6ZKFIbPZxb5WnQSwuu3aIukHiUZzi
X-Authority-Analysis: v=2.4 cv=Ws4m8Nfv c=1 sm=1 tr=0 ts=69324a58 cx=c_pps
 a=eN70jGNn7EKSdYhrfilGAg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=1NWNoF9oAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=Hj0wU5QeFmMJ6oqC7ZYA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=97APRTa-CG6DvPMFVxHL:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: CHdJwo0y88glO-YLwsNKarZ9LG7RTPWF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDAyMiBTYWx0ZWRfX+pJmb4avZVeL
 YCp7egz2zYB4U9qJ8qbNt7winNX0q5BBkfj8Yb9DUJodgbJqIVknkcyZAWShvkkWTu2IZldIYNe
 frsde85VsaIkHI7LGwDzl1oGJA++ekQf5lH5bYi/EU6sPPrffK6St9UMSomkhoeIrIjjadB5w66
 kvP5jw12mlAhEv2GgG1/4TxjcGrjLPXClheIK38vCZYpO8jN3hgC28/z3j89bIxd0JdDZqTcn5W
 OOPpfzitXr7MSxtIkVkzg9+2EEhceXklkkoiHAQhc+rzVhXILaVxUcf8iA7C9CR0iZBRMpVZMmX
 mXUEGyAcuXMO5eqdD1/DbOxJC7ZYc/xqeu0OTKjAIZcshMTZlCHAZCCrk20LgCQZ3lUFRjUvyxk
 uM2zeG24fPjKAZFcpptp2ESxnC/8xA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_01,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 02:58:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227329

On 12/4/25 19:07, Mathieu Dubois-Briand wrote:
> On Thu Dec 4, 2025 at 7:44 AM CET, Chen Qi via lists.openembedded.org wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> The following two patches are dropped as they are in new version:
>>    util-linux/0001-include-mount-api-utils-avoid-using-sys-mount.h.patch
>>    util-linux/0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
> Hi Chen,
>
> Thanks for your patch.
>
> It looks like this is breaking some ptests:
>
> AssertionError:
> Failed ptests:
> {'util-linux': ['misc:_colors']}
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2673
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2717
>
> Ptest results can be found here:
>
> https://valkyrie.yocto.io/pub/non-release/20251204-56/testresults/qemuarm64-ptest/core-image-ptest-util-linux/
> https://valkyrie.yocto.io/pub/non-release/20251204-56/testresults/qemux86-64-ptest/core-image-ptest-util-linux/
>
> Can you have a look at these?
>
> Thanks,
> Mathieu
>
Got it. I'll checking what's going on.

Regards,
Qi


