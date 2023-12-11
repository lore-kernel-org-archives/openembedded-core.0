Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA764C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 14:29:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9625.1702304943403447721
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 06:29:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ei1M3eOS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=07098ab644=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BBBdqre009715
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 14:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=mbHaIfHdpjyzdEmXCTLFnZvq/84GIJ3Uc6Cl/ccxvs4=; b=
	ei1M3eOSe8tocV/Rz9XZ/VUTtsllSsoDTsK4nyCatw8oTe02qopeNA2t6jTrwdw5
	6F77kavYnjhpZKJhjBKDezUcRH39ybePkIhr5h5jTEpDpZ4SOLt17TJWWT46ReAq
	T6WYwfZ0FI/C7oqHVY0xheRB70TGfjyrJzXBNGqe3yjHLqmu5zuovgnLpTRuT6Os
	52wM1+nHHmfvY4pPl85nqAELcMSVm2YJYCfSq+4jKdfZt27lmClKtAkcaFUcQ22d
	buSmH3WiVyWymffl/qKwvYVqd9lHH7UJRE72xuZb70WmZeYkmSwxLLyVOX6MbN43
	2C+sC7xCIwYq76yZXqUwHw==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvdexsvjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 14:29:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYD3hdqlFkCaa+oZ1koK01+6WqJlqtjEqOquAyi0OGV9C6pF25g3FzwZYD0dC45IeYMvF2iC4gFF7nwPFSCVdHw4Zrf0JT5HcP0cMi6eKBuTIn/8knnryjPQQJMUMWOKsILMYE7xFy2jW+oLD4qmByOAldhwUIxExYpoaOQblPU0WLxgeiiKuY1sAwAa7yz8bXm5fZLQtJK+UK5IhdU0S8QZ4JD4k3R5xqNJzhUL6sc9MsoB3RVUkKykhgw/29NX/iIj6AT9pTYRkZBSNz1RPdy8CqWixFd/dXH/Vgkz3G8fnbDScCzYbnO8/XyPSSaav1rKJ29KMEfJ57aTyR+gqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbHaIfHdpjyzdEmXCTLFnZvq/84GIJ3Uc6Cl/ccxvs4=;
 b=KhpIeWkNKpYjZ7byAdUC3DdWi2clcFGPvFbb0FtjzEwje80MbRaTu5My27BvHtl3X/hWljPeEwKqMtSjx32hf5Tifon2dc9jYKigAlW7JZg7xTiROOkAuGCdQsDBg4yH+yVW+R8MStacNSL8UF0dskqLOsStP9zx8k83gB7x5xH5RpySGDDQXfasZi7ZoJLW9Sr6Da49ncCjQsCVOm+am2Riqm/xFL/1bz/R0Axeub5GZO5Oj3fZ8+4mkZleJxPcnG5rq8GHyHHaw91j7r2QhvjjbP1p2vC4kn8/9BaCZZq+YyjV2s2YEfP9tq+EN98qG6SKCfjppevJEplmmMWJvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by PH0PR11MB7586.namprd11.prod.outlook.com (2603:10b6:510:26e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 14:29:00 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5d43:ce18:14be:b2f7]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5d43:ce18:14be:b2f7%7]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 14:29:00 +0000
Message-ID: <d4449852-cb1c-499d-95c2-1df8344e08eb@windriver.com>
Date: Mon, 11 Dec 2023 22:28:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 0/1] nfs-utils: Upgrade 2.6.3 -> 2.6.4
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <cover.1702291194.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <cover.1702291194.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0130.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::34) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2789:EE_|PH0PR11MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: fe352a61-362e-4819-750b-08dbfa5583d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O/bApQpeK5MXeY9NALKetfJmAtjqEbiLKwOdVWsbIqgJcVhb+Mm+7SLvk+tyVX+s8NhWXAH0HYvaEI+FKY+yifxFVyAHXUYS6UpvyOaEh6SE4OW7O395p98NpWGX+y/JeCpVYJscN+7B44eHJ4uDZmP71yzHBxIz7m1mhfOvvuj0uhNk0EF45ktn1lDN555KcbRUGHj/i5t/u//XZlORkj4w09yJMD6H3cmcB8IRf7L7qnWIp7hC6f061tR/HlQGcK46JdNCka5hhsvaQpaCbUAs8Fgj7oKxKf7e6DeG/fBIWwWB/zTP2mzbeDo5notTSOej4dVZQl7ooW4qYc/hAt1KejpwzzcR0FrGB5FCo8mpxvorpewMbTnRvMdRWfSpiaHQ4ZPqBnmBoO+SShmCahoWfgcF8mXf76Y7CS7KEDwPTy0p2nxi53U7YMMZ3W1eCG5zlugeNHqUOtJ4298S98LN92c9p3fQN/WeoOXKr+ql+V+FLj0DEAYRbviP7xs1dZ38KmoUNv3ykl0CN0OSMSpjF65eqr/OiFZWXpBrZ5WJQQR/MASlOlDeHcIRl4dmO/XpwFUe6/0cGnxAmBFIBPHOgQ7CNFk1AWj9Ler5cdjP52KCfWNYUD6tDVv7NWz/aI0z/MxKdp03oBK3lnjvtnmeEy4ugOiIOX8De2W8qWbCOjTovUsHbjM5mvOSFkRK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(376002)(136003)(366004)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(66899024)(41300700001)(26005)(2616005)(83380400001)(36756003)(86362001)(31696002)(38100700002)(5660300002)(316002)(8936002)(8676002)(2906002)(4001150100001)(6666004)(6512007)(6506007)(53546011)(66476007)(66556008)(6916009)(66946007)(478600001)(6486002)(966005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L3QxbmVJcytLcTJ4d0J2WkV6L1FLSXpGd3NzSFArMVh4NU1VemhuOWNjeG5V?=
 =?utf-8?B?RlIzSFo1NUtqeXpjUFlyd3BCeVlMRTc3WVpkSE1DTUpyeWwwWnNZY0gyam9O?=
 =?utf-8?B?Qms3SFowMkJMVnVTU2hxTGlUbHJqdjJTdVdBZHBrTk9CTjBkSzdkbDNnUmFu?=
 =?utf-8?B?dy9MY3cyelNFamdwUis0bWVNN1gwV3R0UVNRSkFra2Jta3IzYUxEZzlsemtJ?=
 =?utf-8?B?QnV4WlJxdlRUOUJoNGp4MkxYY2l4SUpMTUN6VllyL3A3OTNEUnp1eW1ra3ky?=
 =?utf-8?B?U3VZVzFod0VVc3VlQkJ2aWFaWlFDUW9KdXdBVjRUTTcweXp6TXlZRFVPbEt4?=
 =?utf-8?B?ZnM1dE5OMnZjblkydHUrR05TejJDY2c4bndHbDZka2JCWVJSMGlRaUhHL3JY?=
 =?utf-8?B?aTZqNElTWDlXSURJZUVSVjRPNTIrMG1EL2pVMmRCRWVRbWdEVi9QZTQySks3?=
 =?utf-8?B?RlgvVjdKbnlYWjJ2WWhrMGh4QnlydmZpa0RjK3ErQmJIVzQrSUJpdjhtL2NZ?=
 =?utf-8?B?VlFOdC9oUVJBZEF0RjJPWXlhSSt2ZVJwTElXSU5ObklnUFUvRnVONkFYMkJj?=
 =?utf-8?B?YXpsQ3IyOHZTMjNMYVJmSjhNVllqRG9UcWw3d1YrM24zUjJnZHFRVGZWamNW?=
 =?utf-8?B?ZzBPeit6R3dKVXhYbkJLTzMzS2JubHgzUVdvM3NEdVRhdCt0RVNmcXExNjRR?=
 =?utf-8?B?b01FdmhqbjFKQlhqMzM0VUFWbnltTXJLSHNvaVlOeWdTTUl5dnBrZTVCMWsr?=
 =?utf-8?B?djZtbWxyTlB6QmV5NjB5UUFqbGEvb0dBWlh4MzFSL1d4OThQczVKanhJZXBN?=
 =?utf-8?B?OXlqZjVKaTM3Qm9id3JpY3lLcjQxVEwraHAxMzFGNVFyeUZnL3VQbmZPc08r?=
 =?utf-8?B?U3dFeC9wTTRFZmJUWkJSQ1BlS1U0dEhhMitKZXloKzhVbkIwVWxBZmJvYnZW?=
 =?utf-8?B?KzZNRDBqVWhFeE1uNGRUSHh3NUI2Ni8xTzJ3NTFhNEMyY2M0UVBDNW4yYlNX?=
 =?utf-8?B?czhyc3RWaXhxYmVyY1NSdXZCM2pGMTFJRkNBSVdYM09pTkMxbWdzWFlIWGVM?=
 =?utf-8?B?cy9KSVFwajRnR3ZKQllOcWpmc3hYUkxYdVZGN3JHR29vOFFLZHUxUDByajNR?=
 =?utf-8?B?L0Z2eFhQcWVMUnpuRkEyNmlxQ3lxeG5uTHJCWjRjWHdKM3FFeVc3elpsbE84?=
 =?utf-8?B?c3NGVkplV3ByNTVnd1FlTFJ5UmlKcldNOWp5QkhuM0ZOdXp4Y1JyQ0R4K0JF?=
 =?utf-8?B?enBERDF6R0pXTWQvWlVKYlJiMmVMRFdOamRDYnFFVnVSaXQvNWdkSjMxcnRk?=
 =?utf-8?B?dzVOc1d0bVFoWlJzNlk1bkNMazJnTGFyd1Z4d1ViOU8rU2plN2U4TS9odlMv?=
 =?utf-8?B?MDdVUTZjMUVyK3BBZEVNd2xVenFwdHFEZ29BVDNqTzRUUUtnenBUTnVvd05k?=
 =?utf-8?B?d3l5dXEyVGk1U0xpUG9aMGJ5a09VZ3dMdXI2MklTbjRrMFZQckpia0hmd2ZC?=
 =?utf-8?B?Ynd6ck9MTmVuYytGYTJUWGU3Y252UjVhY3g4Z2NLbUtrbUI5S0lZSGpHNEdQ?=
 =?utf-8?B?cW1QcWFQa1AvQ1BjdVRCeEw0VWhud0xaNlEzbi9US25YZTFWbDgzMWFjak1u?=
 =?utf-8?B?bkpVNU9jakd2YnlNZFczZHZkQVl4WHdFSko2YzRTWVNHRDN5QWRrNlk3MzNG?=
 =?utf-8?B?MHNPSGgxSzR3bWJKeUxjekQ5ckZTRUpncUJNWkVscXkzWnljR3Z6TEVuR3B6?=
 =?utf-8?B?NHlYUXBWUkZpUDZFZjNvM2hMakJsVnhrc0d6bXVKVzB1OXlIaG9HdW1XcUlu?=
 =?utf-8?B?ME54cGs5YkQxWS9hVmVVbURsT0FCc0NFRkk5dURzbS9UdEJ1VHFtb1RFaGxv?=
 =?utf-8?B?THA1RkhoeFNMcW5ISHNzcjVwUHc2N0pOdzV1VHBUVnRRbHpjM0N5TFk3TTJ1?=
 =?utf-8?B?Z0JzRjA0VEwyQ0tHNTNOdnpZV0J0RXBEWnkxM1Z3bVBLTGxJVVVhbzFXRWd1?=
 =?utf-8?B?Znd0MDZSd0VRSC8zblN6aWwwQ0ovNWFRL3JjVGFoL2NoaTY1VFF4MHluM2Np?=
 =?utf-8?B?SmFteG5aa1NkcmJ5T0NjTWJRbTgvVW5tOVJxWTNqUDE2UnhYV1VxTm84WTYy?=
 =?utf-8?B?VkgzNmw2M0p4NjlRdHBxcDhEcEl3N3RoZUVRTGg2K2RzU1NSWkV3UjIvSVl1?=
 =?utf-8?B?OWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe352a61-362e-4819-750b-08dbfa5583d1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 14:28:59.8529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8IwLl/3cy4aEb3/J6rIt/CL1M/ADXd4EoZy+htfWsLLO14qrCeMTikGUWSw/2rs1iWnSqOCIIPBKcN2wIHaK5wsPiywDoiKczAFrM4X0Rt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7586
X-Proofpoint-ORIG-GUID: 5fcreALMr6QrREEnpg8DSK5LPoB1zeEX
X-Proofpoint-GUID: 5fcreALMr6QrREEnpg8DSK5LPoB1zeEX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=696 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 14:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192170



On 12/11/23 18:41, Robert Yang via lists.openembedded.org wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
> 
> * V2:
>    Fix build error with musl

Sorry, please ignore V2, a patch was lost.

// Robert

> 
> * V1:
>    Initial version
> 
> The following changes since commit 564339afb73fc52a66c1a08437587cad1c4d46e7:
> 
>    useradd: Fix useradd do_populate_sysroot dependency bug (2023-12-10 09:23:58 +0000)
> 
> are available in the Git repository at:
> 
>    https://github.com/robertlinux/yocto rbt/upgrade
>    https://github.com/robertlinux/yocto/tree/rbt/upgrade
> 
> Robert Yang (1):
>    nfs-utils: Upgrade 2.6.3 -> 2.6.4
> 
>   ...event-and-libsqlite3-checked-when-nf.patch | 80 -------------------
>   ...{nfs-utils_2.6.3.bb => nfs-utils_2.6.4.bb} |  3 +-
>   2 files changed, 1 insertion(+), 82 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
>   rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.6.3.bb => nfs-utils_2.6.4.bb} (97%)
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192159): https://lists.openembedded.org/g/openembedded-core/message/192159
> Mute This Topic: https://lists.openembedded.org/mt/103106403/7304958
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [liezhi.yang@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

