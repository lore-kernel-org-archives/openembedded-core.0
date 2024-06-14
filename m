Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4965C27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 09:38:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7433.1718357900265277009
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jun 2024 02:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=689569ec74=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E4t2GF005019
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 02:38:20 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymjk2e1tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 02:38:19 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45E9ZaE7011471
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 02:38:19 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymjk2e1t9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 02:38:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUqy00Rgoi7JxrKg5Zmr10T6/mJH1YTSuL5FmGY47Sakq4dxNPj6iIzTMfclyBBZpeZuWfDJxRkJi95TeGsfH3M4D+iGtBa6EFVAobBsnY73iTs2pIGKGQh2nvogrgthHUyIyKHu5cU0l4DawiWItVRcn6OfKRWjHGj67w7S/GZLP+6DduEcxyOv6gmbB3FfvLPMagIK0rXr2SoU4fl6294GOP5cqlU64DUU/GKO33DuNAdD7rlhqlWb6af2pfpBQyOERb2LeVT+nmDO23xKeR9AQYd8tnYr5W5j9OP0cVrY5uqnPmJoQfdFFvjFGgaherdOcxGQCS9NI2UhQl9EuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=beN/bZcHYc8SWdKH0AHOCYfqH5D9Dp7CbV5VSAA76vA=;
 b=jZKk5gkQm/BFB32zL4eEs5PIL4eky2XUYiTFXgR7UAz/Yv+gptIl8+2o34r3gMs/c44iFQ9JGKtu250huxGtmMPFMvnYJolpPG2MTNFIQPpwUfE9Ir3X1WvvtGOVwf9HwIJMSoDGgh2Dog+L9IvT0wUyC+QGcVTQRxtxukYOcAeGBGa8uxxlS/mvz78X4NsLpaUueBMK/f+vB6MH03nsHAgU9WY0o86i387k94CAeHCes26f335Tmue9FrKi8+aVyGFNyvO7Pt8TlSOprDht94DmfmWl853uGXrDRNan0FX1U7shOO1pi+eu9gzmgJ01WOPSvQ884g0jqJpsLB0Hmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM4PR11MB6431.namprd11.prod.outlook.com (2603:10b6:8:b8::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.37; Fri, 14 Jun 2024 09:38:16 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 09:38:16 +0000
Message-ID: <4f04ffed-96de-4fc4-bad6-7a2d1e70310c@windriver.com>
Date: Fri, 14 Jun 2024 15:08:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/3] rust: Upgrade 1.75.0->1.76.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com
References: <20240614054959.3184774-1-Yash.Shinde@windriver.com>
 <20240614054959.3184774-2-Yash.Shinde@windriver.com>
 <CANNYZj9vZTXSWO1W8V7U-oWieQd8t=CgDdgCdUtzBP6N4DxGyQ@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CANNYZj9vZTXSWO1W8V7U-oWieQd8t=CgDdgCdUtzBP6N4DxGyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0204.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::29) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DM4PR11MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: 05ff95d5-9df9-41f3-c2e9-08dc8c55b7d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|376009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T1J4YXJiM3kzTjJLc2NHdW1UdU9FV1Q3ME9MYTFxRElISjhhMEJBQWNrY2Zi?=
 =?utf-8?B?NUlyN2x1S3hsaGxzYXZNcSszVGlSVGR3UXI2Ri9VSElqdzdlYytiazcyVktY?=
 =?utf-8?B?ekxWeHdIQlZpWVRUazhCVVFNeWxFZUlmSWxrcnRCV1RQbnEwdXJaUHl6ckRP?=
 =?utf-8?B?RG9OcXdKQmE3UHp4OW1hU2svQ3pxOHNmZlJMNjFrVHE2dEZmQ0IvTmE0aUR6?=
 =?utf-8?B?REZpR0ZaUVBTS3M0c0huajZLL3RUL0o4cjRMOTN2VThwS0p4cHRXcGxUMG52?=
 =?utf-8?B?L0F1b0JXQ1FzZU91RDJUMmhGRmFtSGhmbit0R0Fkd3d0SWF4bFdHdXFBYVVx?=
 =?utf-8?B?WHNGZmkrR1FYZU14d3djWHg3VFZ2S3BSdlZvSHdpaEFlV0R5V3dZK2ozaGpG?=
 =?utf-8?B?ZmswZGJFaTlHK0tSZVpCUWNkeHQ1SERkMEdTOVhKUGlnN3A1bjBEWlNhUTJ5?=
 =?utf-8?B?SW45ZkZYaDZwb1dXTitLYWtXOHp3dytGZzJveEJUN05XbEFWWkdvYVJTOHAx?=
 =?utf-8?B?Q0NoZE5HcElORWhEeTkrNjlTUkl4ZUVpRGVLYjc0eDU3THZRdnQxQ3lva241?=
 =?utf-8?B?ZmEzdC9lWjNHVVNsTVFzcXI5SkNCaW1aV1ZrRjlOT0VhcU95YTRXMlc3d2pj?=
 =?utf-8?B?WGgwRlVhR2EwaG1FVFJvYnptWmZyV2cwc0p4cDJGOGtLZTlqWm5YSWducXhN?=
 =?utf-8?B?MU5zNSszOWs1Y2FwWmRCZkY3STVSZkNWK3R5b2txdlQ0L01zdTVnYWk4bk9E?=
 =?utf-8?B?WlJpTDBJd21hUTAxSHlyUVZVZjhONkJ1NDlCM25LemJJQ1RLdUhlWXlYZVYx?=
 =?utf-8?B?cTRUajVpUnN0MXJ3NGU3cWNUOWdiVnRyMk9lS2Z3Njl6ZHhDdkZMQ0xUdmhP?=
 =?utf-8?B?S3BHSVdtU3hzZHZOMHpWQWpISThXZjk4T3BkdklET1RPcmQ0bmo2T20wRnFu?=
 =?utf-8?B?dXdPVzdRWlJ3anRXTTY5eG9PeGdjUVFZUEthcTd1OVZXL1NUaGc4MW5QbmNn?=
 =?utf-8?B?bHZKa2x5ZjJPVTVKck0wNmlFdXZld1dLcHFucUNaMC90YmM2MFYxQktpQjR6?=
 =?utf-8?B?UFArTDdXKzZFTms2U1FQYVl6SGp2aTVWVll2T1NZZXJEamZuTmNuelQ2c1Rx?=
 =?utf-8?B?QVZiWitMV0ZSZFVXS1c4K1k5b3RDTkxmcDg4MDVLWWNUK0Ezelh1MWNpWUUz?=
 =?utf-8?B?MW84QkVFL2duenAvWG00aEcwQklRUzh4YklyaHRhZThWcUJKS2hubjJGNnZQ?=
 =?utf-8?B?V01URHNpUlF3SjFjblY1QkQyaVFTaVJCNWhyclVwWWt6RWhyWHJqbUZKZEow?=
 =?utf-8?B?ZzBLajBXTFhCMkloTFRIc3NZeHJnMVVpeGcwdHdWaWxpNVZFQjh5eXpUQ1Ez?=
 =?utf-8?B?OWQ1TVNHcVdQeXFFM3gwQUROQnFhRWxFRHpoWWZLOHZWcHExb2FWVVhSTTZq?=
 =?utf-8?B?T3RqM3JWL1Nnc1J0TERtKy85UEJvOG9qZGdYdkpiTHhyRTVRL2JUVGljZk5X?=
 =?utf-8?B?M2dYckVubVc4VXpFYjJsc3RTeG4vR1c1b2d1WGpCbWZjRXJ3cE5jRDYvcWRI?=
 =?utf-8?B?aWloWWxNZm5XSlNRTG40M21YYTYvS2svZVlkbkVFMktnY3IwditjbkloZWxm?=
 =?utf-8?B?UVptekVxemxXamF4cG9xRUtUU3RFL25RL3JueS9zK2NSWE1OTFllcTEvYlZ4?=
 =?utf-8?Q?3ZTjqsJ41rSlD/jmzDWp?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(376009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S3R4NE5BUWUvOFFWWGIzd0g0MWxRL1FDTFF4VmU5VFl2T09BMGF2ZjFjUlhK?=
 =?utf-8?B?VWpSTEF0SmY1NWpUMUtIQmtQUkdrZWkxN3UyY21qWWVYempjVktVcTRlTkZq?=
 =?utf-8?B?TlVEaU1RN0R1Z3lkek9oOEg5MG9qajJBV3ZER2R3Rzgvek9qa0g3cFF5M0NH?=
 =?utf-8?B?YVI4NVQ3VDVuMHBrQWt2anFJdFFLajJlRVVPbVo3SVprNzNqSjNVQ1BNczg4?=
 =?utf-8?B?THlYNWs0QVlqVFkwM0pEV29pZ0VRWUdZU2x5ZTd4OURTS05jQ3VOc2E1VWhx?=
 =?utf-8?B?a3BBUWFDWkNwVWpmVlpSMGJFN1pZSE95ekc3dDVOc0NSSXdsOXBKZlE2SW5r?=
 =?utf-8?B?UEdPdE5JSFRzYWxLeDVnSUV5ZnVuMnFZVnVOQ0RyK1Y0VHY1cHlFNHA0em9a?=
 =?utf-8?B?VUh6bVIzaUxRQUlYVTAzOVZacnBVNjNpbDFDM2ZJZDZETkRPR2RPS3dVOFRD?=
 =?utf-8?B?bjloMGpPcjU4WU5mNkk3dThFZisrT0U4U3FjQ1Y1ejZDck5sS1BYZm1GSmtN?=
 =?utf-8?B?Rml5aHZqWlkvK1JOakd0cWFUWk92d29oWXpReFBqRjRJNlo1TTRUTmVXR0xO?=
 =?utf-8?B?N0NHajFwcGFQSklWWGVyS2dHQloweTUxQ09lNmRrcS9LeE5SSVl3V3hZaTZr?=
 =?utf-8?B?bGtCdUg4U0hSTmFiNHp3UzQxWFpOdU1aV25JblV2YnVkRUMybFc3VEVxd2dE?=
 =?utf-8?B?YnNMenlVV3VjbDZHcmp4UXZTZmlLVFdzRE8xQTNQbnNjWGQzb1lvbjlEOVJu?=
 =?utf-8?B?Zm82RFF1bVQzTWJRZk5NZTFrYU95Qm9LOTlGKzM1eFpvOVVXRjVKRlBFMHZh?=
 =?utf-8?B?ZnZ1Zmo5TTMrS3d0RUcwd1FLN2tjdzZPOFpiNFVnMnVkWjlOb0pJMmtYdWgy?=
 =?utf-8?B?TEtLMnFieTU1QTUxQnBadHhzd1JDdjBCVG94Y1B2L2pBMmlBMlZndU84RzZI?=
 =?utf-8?B?c3ZMUmE1Z0FjRUpEVEM5M1lURm5iVEUwQTIrQytyRHY5eDBuYUxnODhPRmRD?=
 =?utf-8?B?WHh6QjZGWC9ZYURPREx4TXpzWFhPVzVxcTNkaGRKUGlXeURkbnBsdXp6bGtG?=
 =?utf-8?B?eGk0eEVCOElKTWFUUFZCUm56bzFpbEIrOW8xcGxCRitQSEJ1ZjNHcHQzd0pD?=
 =?utf-8?B?MElYNUprbUJnWUN5QUJBQ2o1WXllWDJJUEN2cC9kenZjQTAxNDBaNTluSU4z?=
 =?utf-8?B?alNMbjhuTzNKdm04cE5jWjBZQVZiRkNwK01MK25lSFlOUEdrVE1hSzlOV3Rk?=
 =?utf-8?B?TjdBaTVPKytjd3AxR3U0MW41MmZCc3hINEVMVWdHMFFheENpNW5FN0poekdG?=
 =?utf-8?B?QjM4UTcva2tnTit3Z0RRR3Awb25kZWYwRE9ka0NWYjhJZTJmVUpKb1BJS3Vr?=
 =?utf-8?B?U2EvM2FvWGo0OEpIL3pPTkY2YWl2WVZxZVlGM09nTnU5Tk5tVm1YOXZkYThv?=
 =?utf-8?B?RmsxRWZIM0ExOS9PcXl3Ti9XMW5MdXVBZVhpaGEwTHlQME53NGJJYUp2bHR1?=
 =?utf-8?B?TjVaeFF6WkUxL0QzNnBCQmFYZFJOSjFGbURCOE1Edzl0U0Nnbm14akNOa3gr?=
 =?utf-8?B?c21WOGpEMmpTVlE1WmxPM2pGLzFOSGFLbm5SOVFwT1FjdVdMRUN1OFUzRGFr?=
 =?utf-8?B?SzRsWCtTTVQvK214NC9vWVYrRWh1MmF4RnZJUzJaZ214RnZrUkN2SmxWd1pW?=
 =?utf-8?B?TnR5eHF2MHlXV0pOYU1uTDVWeGNwNlVMMmpWT1pJSkl0Rkp2bk5UZDJKYnZ2?=
 =?utf-8?B?UXplakV3b25iRTRHcC9JRnkxcHV6cGs5ZnYxdHQ0TUluVkVBUUF6UDR6ZFJt?=
 =?utf-8?B?MWJaNGpjYnFkQ2tSSTVuTWIyTjdzNTkwdEhsL3RkWVdKWnk3a3BMRzZTaXpL?=
 =?utf-8?B?YzkxVEcxVU1KR3lFV3RtRWJMVVkzSjhHVElqVXpJajlieWNHcFFDT0NZNk9B?=
 =?utf-8?B?Ujd3S016cjZCU00wbDQ3bWJYdjBnK1gvM00rSWowUklHWTNpSnd0YlNNZW5j?=
 =?utf-8?B?QlRISWUxZEV2WTAwVGVGcVI4VkhNbzBxZ0hreWNxMkhMMy8rNXNIQTlMckw0?=
 =?utf-8?B?cFFaU2JXWk9ya1lOVU5oZFZ0UzA5cHludzFZTTViOEp2OGVYQlJSLzB2S1Bp?=
 =?utf-8?B?OGdSRlZLU2lGa05MRlBtSlBtZHBTbUZOT05jYitGL2FZS0ZnREwzYWZmOHlL?=
 =?utf-8?B?OXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ff95d5-9df9-41f3-c2e9-08dc8c55b7d0
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 09:38:16.4740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6YuWgEBBtSt6+f0mL02rm0T+E2OgsnJFWL/zs9uT+mli7VwmjxCAxe9Y/NFYCkNZRFLLKBBMskEgWShfif3g6xSqdlQO9z+eFVxhIgTJpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6431
X-Proofpoint-ORIG-GUID: mEOSPUhlb-e0UBKO6zsrAdY2ZeJq928a
X-Proofpoint-GUID: 9eWc15o-i_h36yN9vX39fdtVXuuu9Cuu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406140065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 09:38:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200655


On 14-06-2024 14:47, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri, 14 Jun 2024 at 07:50, Yash Shinde via lists.openembedded.org
> <Yash.Shinde=windriver.com@lists.openembedded.org> wrote:
>> --- a/meta/recipes-devtools/rust/rust-source.inc
>> +++ b/meta/recipes-devtools/rust/rust-source.inc
>> @@ -4,17 +4,14 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
>>               file://hardcodepaths.patch;patchdir=${RUSTSRC} \
>>               file://zlib-off64_t.patch;patchdir=${RUSTSRC} \
>>               file://0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-relat.patch;patchdir=${RUSTSRC} \
>> -            file://rv32-missing-syscalls.patch;patchdir=${RUSTSRC} \
>>               file://rv32-rustix-libc-backend.patch;patchdir=${RUSTSRC} \
>>               file://rv32-cargo-rustix-0.38.19-fix.patch;patchdir=${RUSTSRC} \
>> -            file://custom-target-cfg.patch;patchdir=${RUSTSRC} \
>> -            file://rustc-bootstrap.patch;patchdir=${RUSTSRC} \
>> -            file://target-build-value.patch;patchdir=${RUSTSRC} \
>>               file://0001-Handle-vendored-sources-when-remapping-paths.patch;patchdir=${RUSTSRC} \
>>               file://repro-issue-fix-with-v175.patch;patchdir=${RUSTSRC} \
>>               file://0001-cargo-do-not-write-host-information-into-compilation.patch;patchdir=${RUSTSRC} \
>> +            file://rust-oe-selftest.patch;patchdir=${RUSTSRC} \
> rust-oe-selftest addition should be in the first commit in the set, not here.
>
> The other patches are removed from the recipe, but the patch files
> aren't deleted, and there is no explanation for it. Are they
> backports? Are they unnecessary anymore?
I deleted those patch files(since they are backports) in my tree but 
somehow git didn't capture that for the commit.
I will check again and send another patch set.

Regards,
Yash.
>
> Alex


