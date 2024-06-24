Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CA4C2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 10:06:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.137141.1719223610132024056
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 03:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6905150c53=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45O4ePAX031110
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 03:06:49 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywsvysc07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 03:06:49 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45OA6nhw032081;
	Mon, 24 Jun 2024 03:06:49 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywsvysc05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 03:06:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtxTNQHyq5O2fI5olvHzw79scEO31vwO74qLKUWnlb8joZKgJvDfjX2htF3/fmcj5s/isFwXds2kAMcqpYEDx5Ue2/biQJjQXUQVXy0vz870lbK+DWQRlAlta7e3byCzpELHL/i1Maxpjot1neBMM97QvPhrA7Q0R6wFYrFvLhoVR6dWWGq6VU4Lmv1Kw20LggbiEcv2YK4FymJ0AjFAqGnccJ4u2kyyrhNzNhlh26iQeAZp7N2btS4wiNIKhbbEn6iViju45T7YV0jce2XNP+nxvGLOOL1qjidXtGn6vANFEeK38Kj6NxkermckWdq6ScpyNj9MiBkJZdaCaZTBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGs4DAQB8fX1FacL8LaNht+26fMiwMmWweymjecAXpo=;
 b=JVZ2RIAb2RSUiC6Xjs0LRnzlJ24deXskb3ZCav0CjRd89vJORe3X9urQxMUlNeSVBd9MD9w9domxZ6Mrco5ZGov0+rODz8tH/kKCwQwRKD7/RyxeANM/eU8feETSxj5SEl7yfFkAgCMPBbbsYwLxJqhwiX7EWYWYHD9T3KHo1lDQ+LjESkA/WQpT+olGf6HNOQl6XWUf9aEhtlwRRDNZUZeuFFtjzl1A4eYu5y9RTRl/XwsTLFILBywUwsBdvrBG5i1oxoR0JNrbANwWqIv81lwNCgOZw/myOvd5X3yR3lGapLL2JpCmkq6PA1YvTIL4EMCfQmQR38oLrjLFG/QqDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 by DM4PR11MB5296.namprd11.prod.outlook.com (2603:10b6:5:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 10:06:45 +0000
Received: from SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569]) by SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569%7]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 10:06:45 +0000
Message-ID: <e8fa3278-4d25-45e5-a22a-95d19475cb9b@windriver.com>
Date: Mon, 24 Jun 2024 18:06:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 0/1] Update for gfortran
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: richard.purdie@linuxfoundation.org,
        openembedded-core@lists.openembedded.org
References: <20240616153135.3058410-1-kai.kang@windriver.com>
 <202406180640385120dfe3@mail.local>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <202406180640385120dfe3@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0060.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::15) To SN7PR11MB8264.namprd11.prod.outlook.com
 (2603:10b6:806:26c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8264:EE_|DM4PR11MB5296:EE_
X-MS-Office365-Filtering-Correlation-Id: a2274fcc-e75c-4e15-c4d4-08dc94355a6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|4022899006|366013|1800799021;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z3BzZCtad0MwWkllNDlJQ25IVG14WS95SGVYRHY4STlhTjFXeEZxeHZpcHBj?=
 =?utf-8?B?eFBoRWp5MEk2TFdQOHFqTzBZWVVLb2JDa1EwK292TEtQb1JJci9sSDRFTHNR?=
 =?utf-8?B?Rko1UTNrdk1YN1hNL3lmSWoxV1JFOGJtQ0JRcnhidjdqcHRDd1JYanhhMVRN?=
 =?utf-8?B?VVVZcmltS0FiWWN6R2I2R1JYdVNQNTVDdkdwSTYvWDhZR1FaTUVYMm03RXZh?=
 =?utf-8?B?bk1MRW9PUURjYXlLdWZ0aDFXOVU3WU1reTgzWXRBNG1JUkJBSkwxdS93NkY5?=
 =?utf-8?B?dElDTGR6ZlNoQ0RTTDNYRlFRQjZTUUJPaVgxRVRaRTdmdy9hcHQ3SjNwQUd2?=
 =?utf-8?B?eUJUd0J1TllzMVBxUkpqZndSTVpPU0lQeWxJS3h5TkdPTVdZd0w3cldiZk1F?=
 =?utf-8?B?bkNDdUhHNjlYYWViOHpuMkdXcW1ESG9iU2pCU3FDSFJibnFicUlsMWoySTln?=
 =?utf-8?B?T01DVjFWZktvT0tKcFRDTXdRdXhrK2JNWXp5b1dyM1J2bGo2bUxoUS9HV2Qx?=
 =?utf-8?B?UEtVYUxmN05hd0dLUVJNSGtWWG9CNlRwMkx6SDJxYThzYTBvOWFXaVhCZXM4?=
 =?utf-8?B?RmFRd2JLRDBUZTVkTlVRS1N0SVhwOW5lOEVZNVVoY1d6ejhVZG9wMmhPZUY1?=
 =?utf-8?B?bWltRDBKVlhwT2xFUUtMSXp6bkd5dWQzVk9BMGw2ZWVpZG55eXlRVVB5RWZm?=
 =?utf-8?B?MGZERC93NGxNU2lROE0wcVQxZHdJSkVrdFpndlE1Wml4MjBiS3h0MHVBZWNv?=
 =?utf-8?B?K0wvQm5aTm9Ya2llS0ZBVmd5YlEyaFB3Qjh6RmpLeDdUSDVIckZsZWdVNmZy?=
 =?utf-8?B?WjQ0T21zSmo0dldZYk9HcUdYZDlIUEFHYVBqd2tQU1RjdUU0MWx1a3BzdVVH?=
 =?utf-8?B?UlhhTnhLK0kvNUpqSldjYW9yN0VjT2hEMHRsZWx4dVl1ZzBGWnNSQlZ4TGhG?=
 =?utf-8?B?UWJMcW1yM0xYdWg3T0VBbjJZTmtaZ3g0dkR2a3pid1RpbmphY1ozN3RBdXJr?=
 =?utf-8?B?VnY2NEtxUGtBblYvK1JTZThJcGNTWnlRek54ZjZrYi9WdlhSUGlFc094bEI4?=
 =?utf-8?B?eW5MOTVPSVFIbXU5UEY2MUxyMGJDUEF6WTdkSnJKQ2N6akdGRzlhQjZNN0Q4?=
 =?utf-8?B?ejVqL3VUVTFrNDRWbHlFa3V1VFdkVjRkbGxDUTNIRkJOZGFvMDNQdWNtQU42?=
 =?utf-8?B?bkZwbVN4eE9KTGZ5UmdEdnNLbzV4OW0xd2I4MzY0SHZMSExiS0tyaSswVFBT?=
 =?utf-8?B?cnhUVm9Jc25tYnZQS2xrNjV3RHhhdzQ4UEF6YlFzRXY4S0ozOEo4bFYvZFFB?=
 =?utf-8?B?VEZKNS9tTS9RZ2huZlBESHZOdWlXNzZ3bW1wR3lUN3lNUEVGZmlQUk02MUhG?=
 =?utf-8?B?a0lRdHUyWWhYRk1HRURZZ3ZEbXhmc3pFdlg0d1gwZmtrUlgySUkzT0UrOE5U?=
 =?utf-8?B?bGNNOUhoYnAvTzFhMVdVQ0FZWEV1ak9ES1NDMXVrVExheW1tNVNqR05XUUxs?=
 =?utf-8?B?dDJKVXZuVFRQUEJXalFRcU5oeE5QN01MenFTRXNoWGlZZHMrazhvV0hSVk5o?=
 =?utf-8?B?Smovd01BZ0tJL0kzY2lvTmgxeTI5U1VBZ1ZiTS81azd3bmxCbjl1elRUNGo0?=
 =?utf-8?B?SWozVEM0TmlLZ1cwY1dGTlRvSXRKRkVSZFlqL0lxM3V4d2syMXV0T3d6Qno1?=
 =?utf-8?B?c1RlVnhkK0RTNUNnaHVYRVhFb3FNTEFNRFBrOWcvVGd6MG1VanRxTjl3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8264.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(4022899006)(366013)(1800799021);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VE1kcEJHekNmU0owMy94TlJGRHRHZGt0MVdoNEZ3Mkg5Nk5hNTNEcFcvUURW?=
 =?utf-8?B?c2xBNkdOYWNTU0oxZWJkN3RCRUxXcEE2dmhJNjFodlpnQm5QeG5KWWZzVlNI?=
 =?utf-8?B?VWI4U1cxM0RuRS9zWnBmMTFGdVBTZUs3RjhwVi8zMEJVK0dZd1o4eUdsbGpF?=
 =?utf-8?B?S3J2WEZoYkFTWW9KRVJNMzYwbUVaNkpMWlNOWTdvVjlzcUVrM2FmclVvblpN?=
 =?utf-8?B?Y3Q2UndhNk5IUFlBdm9uSkdTeE03UDl0Y05LT29lb3Y2eU5LRUQ2a3A3cWRL?=
 =?utf-8?B?SVZTR1ZIb2JFRWY4K2Zra1FUVHVHSE4xenJoL0xUd0JJdDM5c2lEVVFuUXoy?=
 =?utf-8?B?Y2xHcVhVR3p0dnZkTEI0dDVScjRWWHllSlJLWlp6ckNmRVEwaDJPc2QrWGxB?=
 =?utf-8?B?Rk45N0FvNzZFSDF0OVdIZFRIem0yVkp2WDYzTDBzUkdxVW9pdTZqdlVmZi9k?=
 =?utf-8?B?K1dDc1p6VTBqY2VOWmFhMTU3MUQzSEdrdTQwUXczdWZzaDFxcXNwNXkrZW9M?=
 =?utf-8?B?a0JaUmtUUmZPMEdZVWFCU1JFdW8zRitKZnVrc0F1cmo0aWhPSnRBbDRqMXhp?=
 =?utf-8?B?d3kwUmpMdUtnWW5zSnFOWHo4ajBjZnM4SmJkUXJaMDhuWXFYU3FIdVFLN2hz?=
 =?utf-8?B?bFZlUjJKa044OGNwTDBnd3MzYnM3cG1NOXBYRlJYNWh0MWlIQ2JYdnJuKzUv?=
 =?utf-8?B?REY0Z25ZWE9rUDdZeitXdHluMUY1ekR0bmhBYlZpemZPcnVoUVhWc0RQRkxh?=
 =?utf-8?B?UWJNekdHSHdxZVFaSUdpU0w3elFNWk52TWJBU1B4TzQ1dUFaZzZ0SlpQeHk2?=
 =?utf-8?B?R0lpOGxIQ0lLVzJLWnF3OXBJREY5Zy85TC92U1Iva1V1YnNPNFFINytzeGkv?=
 =?utf-8?B?cXkwQnBqMmZqVm5ubkZRR2FBS3dzNmdGM2hNaUhqaVdIU25VVmEreURGOTJx?=
 =?utf-8?B?QW9Wc1Jtc3h2M1p6cFRqQ09uK3ZxaHI5N1BMSStJbzJpQjN4Zy9QY3hKV1RU?=
 =?utf-8?B?TWFvb2phNHUzWUdIb3RCdE9uU05POGowN1YzNk8vc3dtQzNROUZ4VXBIN25h?=
 =?utf-8?B?M056bzNROFZZZUpYYkFLcENJRy9GL3h4L2tvdU9SbHpmR2tQaXNHL0htQ2Js?=
 =?utf-8?B?WlhlZ3NVRHFKMDhzeHhhTVlZOUFsYTVyVEloR1ZTaTJSMnVldnF2TFVjb2J0?=
 =?utf-8?B?RWt1QjdSM2ZxdzViM0dSbFFPOVIyNXpLdVFxWlk5NThaVXNrbjIwenlDaWQv?=
 =?utf-8?B?SlpGSTcvRnBBR0pPUzgrNEdPUU85eDJXb1cyT09NRVYvZS9lbmRlVC9lRUpX?=
 =?utf-8?B?Q3RHQW02L0NEZ0Y5Zm5sMmhMb2o3ZjlNa0FHYmltOFVRdGZBUzVCOHh1ZSti?=
 =?utf-8?B?MVlKSHhLQlg2S2dVZ1Nua2Vncm8ybWE3STJBQ2UrMVFYdlVRY1NMU2xwNkZC?=
 =?utf-8?B?QmNBRTNPL05odDM2ZUxacjhWTk0xK0t0bi93ZHRZYlZMN1FDQnJGVjU2d2xT?=
 =?utf-8?B?S2Qyd09WdlBKM0ZqaTJGODlpTlJiWTJFNnFaMUJicC9DMlFtMWtvUHJEQlAw?=
 =?utf-8?B?Tzh3SWJQL1hUbGw4Vnpoajl1MkpoRFdlWHZnOGhIZytJZnVBWE1mUEdJMkk5?=
 =?utf-8?B?Nmg5d1l2d3JmT0JlU0JNY3FObUdaY1R3OHB3MHlSMmwwWHUvVlVuYnZnZVJt?=
 =?utf-8?B?UlBDaElUdURwTGRsMUVBSTlxREd1cnlhTGpyNG9lSmpFaGM3Z2UxZndEVDhB?=
 =?utf-8?B?NUdXZkErdUx4NFFMQTcxWkZqeGRvZ1ZOTUJ2RUdUR1FDQThieUxRTjR5L1hE?=
 =?utf-8?B?bVQvSzZ4blZuclp3SXBPRXUySU1BenZ4SWtHUlBjeXliSnNFSkk5VU9KL29Y?=
 =?utf-8?B?eGx6cjdHdGhjY0VVcnBPYksrOFJqekZGM2grSHJsT1EzVkZ3WFp5dVY3WnBV?=
 =?utf-8?B?bklTT0dZNW9TYWgwUkg4NnhURFJ5alVPOXhYWnBjRmhScHMxaVlVVGsydWc2?=
 =?utf-8?B?Nk9VemdkM2R6YlNJQ2gzSE56bkxFamdCQkxHL2RqYjhIZDQraE1vV201UHlE?=
 =?utf-8?B?dy9XSkRnZ2RRQ1AxcVRoNnZJSVJDY1lYa3BOV0FubklDYjYyZGlhVWp4MFc5?=
 =?utf-8?Q?GgA1whnOk1zZeFw0IgmgCGXkx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2274fcc-e75c-4e15-c4d4-08dc94355a6d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 10:06:45.3667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2zrn4iIez79D9vS3t5VYOkRta6IBgrSRmiwG8KaeMw9eVKwZKFTCuX7ywsRB11miiHBwMgnH/rzhUDL4nIbnHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5296
X-Proofpoint-GUID: xlgcMMGBD-1j5hB00xR0CMHLccETfv2c
X-Proofpoint-ORIG-GUID: KgwIhTqzSxROoW4VwOzZ2G_R6H8g1ASL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_09,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=718 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406240081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 10:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201073

On 6/18/24 14:40, Alexandre Belloni wrote:
> You must always resend the whole series, else ths patch is not
> applicable as-is. The work must be on your side, not on the maintainer's
> side.
Because the first patch has been staged in master-next, then I just send 
the other one which

rebased on master-next.

Regards,
Kai

>
> On 16/06/2024 23:31:34+0800, Kai Kang via lists.openembedded.org wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> v3:
>> * update INSANE_SKIP for ${MLPREFIX}gfortran
>>
>> v2:
>> * add sub-package gfortran conditionally
>>
>>
>> Kai Kang (1):
>>    gfortran: update runtime dependencies
>>
>>   meta/recipes-devtools/gcc/gcc-target.inc | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> -- 
>> 2.34.1
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#200779): https://lists.openembedded.org/g/openembedded-core/message/200779
>> Mute This Topic: https://lists.openembedded.org/mt/106704989/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>

-- 
Kai Kang
Wind River Linux


