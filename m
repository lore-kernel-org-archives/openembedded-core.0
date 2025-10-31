Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D62DCCF9EB
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 06:09:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8629.1761890977402452677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 23:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=I38iQOvs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=33993df286=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V3abW22280727
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 23:09:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=qzcbTaP2KhEPyRBO0irUnDrM5tp4aMg6vWr9Gx6Vewg=; b=
	I38iQOvsoWUfqPZl+v2i+CU3J8gv1RAuffHC7cdg9KaKv6BRZpJp7MvuWKkZ/Ob3
	X2Mxu1yVV95SHGbRdAF/d8Q7YkAsAUgPTGRnLME/pNOmI3qhvlEkU5SYT60rfHje
	7I0v68ULWs2FVGIEjaAxXPHVgfTKhvODsCuvRpKh4f2sBy1y9473tCOq6c+yRM/W
	R3cZGwYpbtktn+B1VjkIs+ZaF+TYuPl3eM3V7xmlNi0cYZ9kZY/G98oCtmQ6HS/r
	aEaFbtOvC46D+PNc6bbXPOlxb0gCgY/bFj/6+3ds1tMdn6D09uPb+fUrcfpntmcU
	IhGneyGiWVf491sdJ5+zsQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012002.outbound.protection.outlook.com [40.93.195.2])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a3wa1sjm2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 23:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XT3oojUocS55/i17nG68kdsTTU6rBSQZ7OpGf9MTArxJcullmo4vEqYng6Diq4nmIhwKW5uSm/umh6XlXTse426ck5qMXnlAzmPxgNyn9EtAxFebb9Q10CgZ/OcoBETS+7c7AH64gUmpk6h2NHOMJwOlexCM880cx3BQb+QZPL/JbqGBeue/iF/Cm/5jPw0s8crYeTl9hpe3jwpIlXoXAYeYI7UIbOeXZUl4tqISKsL3nAc46vofpAGqf6VCRGa2a3J+9WFQhnmMYm44Y2IyyIUdDmRgJjcUm0KDhAmMvWRi4S5xpDGLVLsLGQ5FHH0oW1BDTrxnMh2Y2YAJ1V4jRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qzcbTaP2KhEPyRBO0irUnDrM5tp4aMg6vWr9Gx6Vewg=;
 b=W09V4Axga6QLgtyUaQ9Z9wR7o7LESYzUqnv70o4aUw+bXe6haLWB7cZQchJdEKFlxYjoCKX/Yy3PfU0gz1/x3QesXHS/c+46SpmrIkBDtpI56n80x7QuQtwkwFbRVi9s0X4sWIZHQIuxD4hk2Ej/T5BAweoJTEOrdq62Y6GEjHplGF22USg/5D6oc3X4SHzJHfnArZACxuiQrU8ab13mQaFxfITRjlnkX1iAE6gvUQPUCOv3U25GlirmXW/XaGCJXKTE1q/CY8+tZMygFO8DMdAMAqB6foGX66CRDEM92aeD2IJiERQjSBiLtJ53luUi7jdxbiel9etZVZGnVLBmyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY8PR11MB6844.namprd11.prod.outlook.com (2603:10b6:930:5f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 06:09:33 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 06:09:33 +0000
Message-ID: <10e196ea-a7fe-4a86-93b6-bedf2e819ee1@windriver.com>
Date: Fri, 31 Oct 2025 14:09:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V5 1/3] base-passwd: add clock group
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20251031030519.2602967-1-Qi.Chen@windriver.com>
 <CANNYZj_1CpU0svcA4mRWA6=mvY+GLgqruO50jACnUO439FO6aA@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj_1CpU0svcA4mRWA6=mvY+GLgqruO50jACnUO439FO6aA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYWP286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY8PR11MB6844:EE_
X-MS-Office365-Filtering-Correlation-Id: 94bfb73a-1495-4e3e-3c84-08de18440fa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cjZGaHhMcEc4STIvUUY0cnZLTFlNRWVmQ0dpM3FLKzlOYnNaTlo5djZlb29O?=
 =?utf-8?B?U29WS0k3REdCbUJrL0dCa0UvT2FWYWZuKzZXN3VQS0dKRmllaDllMVJlQUFp?=
 =?utf-8?B?OFVlTnA1MVZMSnJTWkJNUUNoc2FqcjY0MVBsVHNCeWpKejgvWmRxVEN1U0lo?=
 =?utf-8?B?aTdRVnd2cFhIM2pvb3IrWVJZYmJwTVBSNk1aZXJpVGRGRndtbHpwNVlGeVlj?=
 =?utf-8?B?ZEpFaUF1UmNmSkxZbGxxeFoyVHRtc1hEUVRHZUc3MDJ0RmhwTmVwZmk3a25i?=
 =?utf-8?B?RjVQMU9mK1ZZVFI2aFFKVVVpZEhxY25DWlJpcmUyTkNsWEFFeGIyWmZDL050?=
 =?utf-8?B?aWJJMTlJWmtXMmI3RmZmYXB3eGp3SG9qZmNPTUFaRkcxWjc5Qm5rQklLM1JE?=
 =?utf-8?B?ZzRLUlB0amVuVENxRldTaGdhd1RrQ1FXM0ljbmNuaVBLei83TzZYbi9rVEtU?=
 =?utf-8?B?clF5dG42ZkxQN280ckNERzBML0gxVXBUK2wwME16QlVYTUo0UlhNRmJzTC9R?=
 =?utf-8?B?NUovcThlenpyLzJBVDZ2N0dJS2E2RTA5azVPKzVibUpkd3YvWTI1ajNKREY4?=
 =?utf-8?B?QlZNSy91T0JqM2hENjR5bzdUQU9lK2JMdWFqZndNdyt6YWREZmlTaGV5SFZT?=
 =?utf-8?B?RG5IVVJ1eS93aUhZbGhmUjJtL0greitoa3J3MzZTeGZZYU9oOG9sWEFqYS9k?=
 =?utf-8?B?ZUFKN1Ntd0h2U0pJQ2hRVC91K21EL0tabk1iRkQ5UjN0enI2Rms2dnNFV1Q0?=
 =?utf-8?B?RUd4QThSVmh1dXRBc25pMER6YnBjNk9RWWlvdm5GaS9SU1IxTFFHSnY0U0xh?=
 =?utf-8?B?aExjd1pHbkdGU2N5QWVXTERtT3d0QmRvWkRMeUJrZ2k1bWVvWWhMWXUxekM2?=
 =?utf-8?B?SEV2VkU5WFYyZERjUkt0SG56bm54SVJVUUxpcTlkTVZIa3YvUnZKbW16aGp2?=
 =?utf-8?B?aXROVmFlK0hlNjJPdFZieFZPUng4RjJEWFpzcUpXVjlPZ1ZEbTE1djhlYjRG?=
 =?utf-8?B?enJ1ZzA3WkJhY1pwdkxUVlVmckMzRFN0eDg2MSt5Z0lwdWlIMytCSkJmRTR1?=
 =?utf-8?B?bmxZY0lHRGhpWGhqUHVRUVJydUl5Zk5mcnZKbmkrUDN2WGhBVzFWZ0xJSkpq?=
 =?utf-8?B?K0ZVM2ZadHBIMUN0NXk1aVpnb0tvMzhNamxKUkpuSXNmMnRvRG9aVHpGUS82?=
 =?utf-8?B?UUZhMk5melR6Y0szMjRVYlBjSUdyWmhrdHA1NXVRcWEvSFJLTDYzWkxqSDIw?=
 =?utf-8?B?Q1ZOQVQzaEVwQ0p0MFRFemtocG1zWGtiMjBLQmJHbjEvenRWK2UrNWJrL1Uy?=
 =?utf-8?B?Zms3YW9xMGZQeWlFM1ZXeVFyWFI3ZVgzeCswM3VpVmdjMWFwQnlENG5MYTJB?=
 =?utf-8?B?bW1oeWU3QndXU1RmOWlaT0Nmb3J0ci91TXBZbkljdjI4QzJWaTBWZUNER3JI?=
 =?utf-8?B?Z2cvZStEejh1VXlOSndpWVFhZExqT3dOTmdaLzVkZ1BqL3hYVHQrSWt2NGxO?=
 =?utf-8?B?U2tlL3ZDRUwyVkVadENNNTlickxIRFlENXczNHlmalE0dGRsdHNad2VuNUVL?=
 =?utf-8?B?aSt4Zjc0cWVyLzZoZVFjK3pNL3NTcStJS0o0NlIxT2dGZWhNNE5CYXJiUnp5?=
 =?utf-8?B?SnFoZ1pLbEYyK3A4TXBGYVdpSXJiYzJzSUVCOTNoaWNkQk5RcStFbXBXMVlL?=
 =?utf-8?B?QUFDNytFVDlscnhoQTJ0TXp2cjE4NWZiNHJtNVhPcEpNWm9GVFg1SjZQcmdn?=
 =?utf-8?B?ZDA5b0pXRGJIWDFOMS9meGg4aU55Y0xaZmpWRkhhUmJtTnpWaDQ5STRPbWhV?=
 =?utf-8?B?K1IxV3M5S1ZuNEdxZlRIUnByUUpPN1RMNEpTTWhKUWFJRXk4ZWVSSlpnc2lh?=
 =?utf-8?B?THhJYm1rT2pnSGgrTGlVRGFGSzFjdU5LSkh1QWFhVUxkNXgrdUhteDNBNXR1?=
 =?utf-8?Q?5OJWxfJiYwViDsXcX12keY/armLXcZ25?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZjRxNWlqeWtmelN6cE1oY0p4eEgvajNwUnkrbitMdTJtU0NBYUVnek5rYW5a?=
 =?utf-8?B?cnVpZ2cwWkN1S3VtUytUVXRaQU5pUDBEZnVLL21MbGsvL1VDamdJQjNJZHdv?=
 =?utf-8?B?T1lYZExmWGk5YStNTW1QK0VlTnZtaW5OUVFaWE1JUXF6YjhGZGVkL2dldG50?=
 =?utf-8?B?dHZoa1o0T3VUbUlBWTQwajNuL2xQdFFROTFrcVhRSnZONGllWC9nNzM3UHBH?=
 =?utf-8?B?a21saVNxalR6MW1QbjhsMjB5ZGlnOUlveHRub3N1RjVOOXo3OVdxMm14YjVQ?=
 =?utf-8?B?TmF3eWNQb0Yyd3NPODhnWGdEVjl1dHFyK0dMY0YzL204ZTYvU0xReFhHVmJ4?=
 =?utf-8?B?QVBscWRhWjFnNE1SNktZRG5TZzlPVDAxQk44UzExUE9LNzF1aU5hc1cxUWZ3?=
 =?utf-8?B?UWI3bWVQS29mNDBBaG5DWGovYzAvTWROS2FhQkFPYms1NmUralkzbUhVekRY?=
 =?utf-8?B?RGROb2g4STZYQXZqMFdScHNSUGtQSlNEbTNNVFJPdTk2Q1hXdzdpYjF5b1B1?=
 =?utf-8?B?YUZ2TFYxT0ovVXk3RjJRNzdzWUxNaXVidzVpYmNjbTZQdFJJcVR3ZDJnTHha?=
 =?utf-8?B?dkE0djA1dXYydkM0dHJJLytrNXNScElJeGJ0bXJ2eXJaeWt4MHoxOEN2L3F6?=
 =?utf-8?B?VUZtdVZYVXhXbmhJMElnbENvVmlabmh4SExlMWIvS0FtQXFRMm5wZkhnQmFh?=
 =?utf-8?B?cXAvS1VDUWU3STAzZVk3ckJ4YnBpek80WE1IWkM5ZXNMb3dya2hLWlhZWFQ2?=
 =?utf-8?B?eDJiSDhhNDRmblhSY2NUcDhNQ1puSjVMUTVlSHMzdzJhSmpDanZnYWtRTkNh?=
 =?utf-8?B?ZnR4eXNXUVp2cVpUMXJqZXZIejlEcWF3YnJPWEMyQmh2cmdvck9CN3ZLVE4x?=
 =?utf-8?B?ZEhYT2xBejdKTkRhVGovTHVvVmdFZ1JOQmNaME1ZTGxaa3hKR3BRallac3R1?=
 =?utf-8?B?RVl6Z1Nnd0Z3MWtZNms1OVA4QXhHQUJBWU1KMzkxN1drMTZ4ZmROVHMvWUdm?=
 =?utf-8?B?eUs3ZEU2Nk82eU4vZXRmdDErUkJ5aVJkb2NLRy94Z3NNb2tyaXdBcFNvdDQ0?=
 =?utf-8?B?NjdwY3N3NHE5K3c2WHhCVDFJWmp2Ym1NR2hERDE2YkJ5Nnd6c0dveEttbGty?=
 =?utf-8?B?K0JDQ3VEVzVrS0FYa0kvWUhTMmF1bkVoTDh4b2JLcXBkb20vUG9CTUVCV2Rt?=
 =?utf-8?B?OXNqS2c0SVd5dEZmZVNJNk0rbDQwald4SlJQYlZ0VnVrOEc4TXYwYWRGMVhk?=
 =?utf-8?B?UnpaQ2JXZVVrZzBGWDdKcW5lV0drSjFDMmVuVmw2YnA5RDZWVGp3Sjd5STJ4?=
 =?utf-8?B?V2hLb1lreWlKVGsyL1JmSXZiNVpwbXJzQmVSREN3RW9icm5mci9qKzhaMjFX?=
 =?utf-8?B?aEJ3R0lkMkh6bHFtYkFZNlJyb1RmWlpsa0RoT3Y5UEtqT2RRT3lONnMrZEd0?=
 =?utf-8?B?Qy9QRm1vQjZLd0x6SXplaVNWejZzVWFadU5RSHp3REphRW5FdlhxdUtoYXRH?=
 =?utf-8?B?WWU5U2g0NkFzdFErSkJJS293dnhGL2lCYmVjeHhnSm9XMjBsTDNHdXAxV29X?=
 =?utf-8?B?OVM4cUNyeDAwK0xMbUxndk8rTzdKbkV6L1pYYlBqbkk2S2t0ZDFTdG9JdHJl?=
 =?utf-8?B?cmdpeUxqMXUzelk0ZklFRFlkUnBaaksrMSt2Z1lRL1pmZitGb0FIK1k3MFl4?=
 =?utf-8?B?OWQ1d1dIRThOL3g2WXB1VVNoZGtjMVAxWWsvSSt2RXA2VjRmdlhhR0QvVHdR?=
 =?utf-8?B?eml5S1d3UC95Z05kR0NINE9FaVFIb2dTdUJYOUhPbkFPb2dOcXA2RFVVYnJh?=
 =?utf-8?B?M1ZURzZuM1dmNDB6TEw1clBEdWRXOXR0TFJXd0syVC9pNkpkUGdiZW9MeFNk?=
 =?utf-8?B?aytYR2RGa2xKeG0rRUhqQnZDZitJOUZsOVd0NTZVTUJlcTVmaE9xMUswQVpk?=
 =?utf-8?B?RDA5RVFrR3pGLzlYMVFlakxKb0ZlODY1RCtVSmtMSVlYc0FzSFp6WEh6N1Nt?=
 =?utf-8?B?SnU2OFhVd2lPZjkzTE9nQjNSOXc4SysvYi9XOU1ZYmRqQ25kUElrWjdjZ1Jv?=
 =?utf-8?B?YWhIM3ErMXVRak1GY05GS3h5VFJFdjVaNVNXaGdqakxKeDF2SitzU0F6TzlH?=
 =?utf-8?Q?T5UZ3LppJmrutOLuGG4wkACGl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94bfb73a-1495-4e3e-3c84-08de18440fa1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 06:09:33.4439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yZRH7EF5KeYLmyZBOzCjoF7BFaEH3HeapY54G5Yyd0OdgHPtGHjTWx0qYhHJ3NjSnyPGBBXzTiGZL20bRJeug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6844
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA1NSBTYWx0ZWRfX1JQFe7MVzif9
 wcmOymeCtgPfQHp6Bvgd00jOKJLttgwYrX87ykoM7/6o4UQKAUiHnFDwFx5ymi5UM7iVOOkTZsz
 sl+6/ar8GvISU0omn3JHvmN29NxBGC1vxzMaLQb5eUmBlUMW538k7iQ0y9WbICWhjjPjsekiJCQ
 y93XBr+fweRLv3a0clEwzcVDOIMbUjntQi6HWtsigJWK+OpSJylreRzOHNX3pHz4FHcAMJhNokt
 QgS+pPyt8SqPhgeabshZ7yxLrubn8uDpNyBaHRyqOk1yKHCZ+nLmdM2u87UKaJGyz3ZwP7/UncC
 egyp9smm8gYTkuSpvdjHREfGS+jvlPawi6TGbwkJs3N6J4dGKaZhToltAvw2698nK4dYu1HzAG0
 4o0Wj1fjlbhhY+AKPo7HSENXVTVO8w==
X-Authority-Analysis: v=2.4 cv=HODO14tv c=1 sm=1 tr=0 ts=690452a0 cx=c_pps
 a=LBR8CsJoUNkXwF8+XrmcNA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=xL0Fv3Poc8S4chuXwXQA:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: ri8A2zd6NAflq3pk451sBKdru_PoCyve
X-Proofpoint-ORIG-GUID: Oe72DPUp6lLh4wmk2gvmIvdt0TzsCxms
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 06:09:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225528

On 10/31/25 13:54, Alexander Kanavin wrote:
> On Fri, 31 Oct 2025 at 04:05, Chen Qi via lists.openembedded.org
> <Qi.Chen=windriver.com@lists.openembedded.org> wrote:
>> New systemd version (v258) introduces a new group, clock, to
>> "enable applications like linuxptp to open clocks without root
>> privileges".[1]
>>
>> This results in warning at do_rootfs time:
>> WARNING: Group clock has never been defined
>>
>> Add group clock with gid 81 to fix this issue. The wheel group's
>> gid is 80, so 81 is chosen.
>>
>> Note that Debian rejects this patch because they're using sysusers
>> to handle such groups, including 'clock', 'kvm', 'sgx', etc. We're
>> not relying on sysusers, so we have to add a patch here.
> The question I had was why can't this be done in systemd recipe,
> similar to what weston recipe does:
>
> GROUPADD_PARAM:${PN} = "--system weston-launch"
>
> Alex

Hi Alex,

IMHO, there are two reasons.

1) It will result in other recipes using this group have a dependency on 
systemd recipe. This might not be a problem for clock group now, because 
it was newly introduced. But such dependency is really unneeded. It's 
possible that they use sysvinit and they can still use this group.

2) It's better we handle such groups (sgx, wheel, kvm, clock) in a 
consistent manner. We either change them all, or we keep the status quo. 
I mean, if we use sysusers mechanism or change useradd.bbclass to have 
similar behavior with sysusers, it's possible that we can remove these 
groups from base-passwd. Because in this way, there will be no 
unnecessary extra inter-recipe dependencies.

In summary, for a group that might be needed by multiple recipes that do 
not necessarily have dependency relationships, we can only put it on 
base-passwd for now. If we re-design and re-implement useradd.bbclass, 
we might be able to avoid this.

Regards,
Qi


