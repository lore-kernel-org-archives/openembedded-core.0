Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C84BC2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 08:03:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7706.1720512225255705834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 01:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7920ee7300=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4692VOpC001216
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Jul 2024 01:03:45 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 407170jakn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 01:03:44 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46983iu1009479;
	Tue, 9 Jul 2024 01:03:44 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 407170jakm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 01:03:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWgFB2OpNhaamBzzIFvJTaKJo8CM7Zv8sEBTlmhHd3fdYzGEnmGC2oEArox5Q/FXoFT3NTmHq4f8Paf4tCmAXTDl5UTgObnilYA4p6RmF+zN+uUyNbqVFionMcH0soc5rrElo9oaZ3EduXwzpdcRlBXBA3rAkz6WfPoeXbNLdyz6GVAQ2wY7jzHoAliqT/1O2/LHOF+tEmnniKoErRk1B8BPNcDBuPP3vBICGZhD8uJKC24eAziqjaJ+F6tSoZlJLY9VAiPyGF/X78xlWqshhPFLntzBlSDNueXwDR6E95aR5ceCu3tO+TK5Cp+MIGDJvGLQHiPD6wl0j1VDPV6hbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eRm2sH54RHGAEFrkmjebbiWNcElisr1+jxGGtC83cc=;
 b=bEPctGmdLvONAhnZx4CCX9+0u9emO7LrJMzgQMt6YiG9TYTMhT+Ilt0Br1qjotLPVxnSKQTzy55lt/LcctUTCQ3MycGPn3M0fDU99gJ4ecp+SVZuuHwvsfYUdF9BoZcIbK5ek9JZBAsu0ptYPzme+qIwF8ukn73GKTJ6QFy3sBsDrPUXcWkMdZwd0B6F/RTGhxHMqFmZp0TeplFsUj59lLnJ21za7Y3C5yDxUG6IVAqa7TWb9Fs5d1eTrCTPPWnLfdJELLyEI7ccTP6Q5kfAiDMPRlbvUQL9/nRH/6O7JukMQJ5+WDfQDVDwmS8xeTgQLRNX8+jcl1um4ft3WqLLWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH0PR11MB7710.namprd11.prod.outlook.com (2603:10b6:510:298::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Tue, 9 Jul
 2024 08:03:41 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 08:03:40 +0000
Content-Type: multipart/alternative;
 boundary="------------gGF1C9TmkLNtsIgHSuzFLnK0"
Message-ID: <104fb368-48f2-46b4-9237-5c1ee001dac1@windriver.com>
Date: Tue, 9 Jul 2024 16:03:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][master][PATCH] vulkan-samples: fix
 do_compile error when -Og enabled
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240709073158.1037728-1-changqing.li@windriver.com>
 <CANNYZj-29_xM5FOM9WGFg-z3cEjg=uge=Aa5xiYgqRSFrAci_A@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj-29_xM5FOM9WGFg-z3cEjg=uge=Aa5xiYgqRSFrAci_A@mail.gmail.com>
X-ClientProxiedBy: SG3P274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::13)
 To DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH0PR11MB7710:EE_
X-MS-Office365-Filtering-Correlation-Id: 97e5d04d-3096-4f60-ee80-08dc9feda504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|4022899009|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WDZSMndkdUc2S1dJWldPNVhCdEZYTWpiMTF3ZWE4NjdUbUE3QmkyTm10RVc3?=
 =?utf-8?B?ZG5sNXppM1pHRm92dnE5ZTV2TWxvWm4rNi8rbEk4NzJRM1lEdDhaUEFucDNY?=
 =?utf-8?B?L2N4STQ5WlFiRnQ1KzBaeFViOThhdHd2b3lvQVluSFVjRllNcTdsemZpYVd1?=
 =?utf-8?B?K2RwRWUwNVlYcVRkWVFsRnlwc2cvVG5XYnh5OG1vZUQ4OW04K1czMWY2d2Jt?=
 =?utf-8?B?OGx5OFUxU1V2azdUbjFXejAvWUJHRWxEVVZaYm1MR0xyZ09ROVRsbkVJdTll?=
 =?utf-8?B?NXluMGVxMDJBTE9Mb25PNHZyellXdm5yTENiNkdwNEJGcVZpN2dPcDh5eUZO?=
 =?utf-8?B?ZUNUMEVudVRBRHZxdTVkZER1cHVKUWxvcDdrdE0zK1cySFB5NWFCQUNIcXJD?=
 =?utf-8?B?U0dLRXhvNHUrall3bUNueHFmVEk2YU9vQnB5QkdvS3JJS3ZaM2VFcmZidCtP?=
 =?utf-8?B?d1Y0bTBjSmYrL1daOUFIdG9tMy82K0VzYURpNWxpOHNsTzM1QVV1RGlqeTVT?=
 =?utf-8?B?Z2pKWDJSdWI1TU1zV3FZVVRHWWtieEdCazFNQVdrWkxzVytQQUNtN2ZuUDho?=
 =?utf-8?B?TExIQ3ljWTk2d204RHlhTkU0bFpVZE85VkUyVnFldXU3bmdIS2FWSFlmRlpW?=
 =?utf-8?B?Wm02UDdPUzZtQ0VZdkcrak1lak9Mc1gxMUFWRWJKeE9MVnJBb3JRK3pCa24y?=
 =?utf-8?B?bXI2bTMyeEdzdkJCNzlNSDhrckhLMlVDNm0zL280V1Y1VHUzcW1OOENRZXBL?=
 =?utf-8?B?UVJETkg3UDhvNlNyU1FjNWNJakV4anl0K3MwRjNXVk1XYVRrMkd0czN0ZERa?=
 =?utf-8?B?NHhEV0EzVk9Ba3VpUzMvTUpYWkVwck5XOXphN0F0VVpYVG95eXhKWUJubVc1?=
 =?utf-8?B?SGIvZEdVbEZaUWxXaHdoWnYrejZDK0diRHFYRzV4VlppbDJVZmRDSTB0cG9x?=
 =?utf-8?B?bmJHRHpqckwzc0hxa21IeWNjU05tVlVTOGhia3l4cFlva1RsNFdTZ2hBbFkz?=
 =?utf-8?B?Q2M0SXlRMk93eFhlazVuMXFoZXkrVGVIUUlTcHJkQTJnRGtrSmxvSnBMeVlj?=
 =?utf-8?B?MUo0TWVzMXI4aUkvT0g4MGxYL0EwY0NFWENZYVBFVVNjL2xielRKZDMrTEJE?=
 =?utf-8?B?K0hSVUhIL0ZtVXNRNlpJclpJQUVlWnJObkh3RkRrNzZ4dnhTWW5YSGIvOUdk?=
 =?utf-8?B?ZzlTMmdvUnJTbU9SUElzanBFSmNOeElrRFZkLzcwMUk1ODRkMGR5azZqOXJh?=
 =?utf-8?B?OHYrTTltUzRjb1dpUlZRTy93UkpSZldqRHlGam1mTVorYVJkZUgrd3VlUXgv?=
 =?utf-8?B?TUV4c2RGb293TFVUeGY2S01hdlJzVzBQTFMwd0VCSXRiVkpDNm1jTGRiYlBF?=
 =?utf-8?B?eDdtbVc5b3BFcVJsNFVJUGxGWGxoSTVsK1JtRVd2NzJyTTdJT1JYeXBkSzdN?=
 =?utf-8?B?Uk5xc3l2Ky9GNlcyb0xUaWF5N3BxTEhxVzZtdXhRZldhUFJMUVhuSWg3bkxn?=
 =?utf-8?B?MU5RUk9XK2VqMHBJWlBmMi9aUUg1aXFmNGZHbEZSMm1xWFB1Z1prbE9hSnlk?=
 =?utf-8?B?VUhsWXlIUTVlUnVQNXN1SUc0WXhBOXpJYVp3WnkxcExncmQ2SHhJTHhKNk1D?=
 =?utf-8?B?eFVoNVp5S3lLZjFralQ4QVNmSzBldGtDem5keGwvQUpiNy9HcmdKM0tpbGw3?=
 =?utf-8?B?b0ZqaWZsbVBVR2tvQktaZkRMZWExR3BSQmhmMnd5Z0ZWZlA0MGdDbGlvZWhL?=
 =?utf-8?Q?w+zAYo5UDvXa2pHvK4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MUhwQnlRU3JGOTE3cU83SStRUzBpM0FYb0szY0svbkMyMk9mZlQ5VTQwNlRQ?=
 =?utf-8?B?Y2k4bkZic1dBTDM0Y0Zhc2Y5TExjNjBybUVsSFUyc21MaUpxOG80bmdqTmdo?=
 =?utf-8?B?M0NYZTJSTURmM0NnQzRTSXRHSE4vUlphUmc4OEhaYVpNeE1HNXpKRnRSVVgx?=
 =?utf-8?B?NFVuejdiUmQyd2FPUWNRZjdOVTJaR011OGVIQXhPWjRUNmNEZlNmSVQxdFpP?=
 =?utf-8?B?Z2hGQWpsU3VkeC9wdUIxM2xpVFYybVl3RzJCYjVJTlVkZzI1clZpUFBnUmRx?=
 =?utf-8?B?R2ZIMTlJV0JXQS8rY0NJZVlzeitQMUJ5Zy9QVTZWRFpJbExNZHhPc2x5QzBM?=
 =?utf-8?B?dGgrZE9lZWdjRmhmMElGYlp2ZDY1KytVNUJyQXVOV1dFWGwyK1BvUTBMSG1K?=
 =?utf-8?B?cWlSSlNZK1V2QjRSVVpTNzMycmRFMUhra1piRVJmVk5HcVNoVjhDYlA5Zm0z?=
 =?utf-8?B?Wk0razNaL3FEckdaMHY0WE53RW1POXE1TDJaTjRiQytvcmo3d0NSeThZdzlk?=
 =?utf-8?B?UlFkSm93allncGdPR2hSOVE3dFNyVzcwZEdNcnMxc3VtWFIraldhUUV4Ti9X?=
 =?utf-8?B?a1F2RGtjSFQ4ZjFrWk5xWVFwZFlYT1l0RDdVSkRFa3R4U0xPNU00V0I0Sm10?=
 =?utf-8?B?YXZnYVoxTzdPaTUxL2ZFNXd1aUFLdkpRS0pQS2xBMkF1N1FidHArMCtqaWhw?=
 =?utf-8?B?M2hld3ZVUzJHRkdUajFBMy9abkRNSVlYd3AzbUF1UVg5bHdFa2hheCtHL2U3?=
 =?utf-8?B?SVRXUW9XR3hhUlA1bmFWcnk2aHRJYjcrUk5NOEFPSmlPbVRLRVZQMHVCOUxk?=
 =?utf-8?B?bWVxR0gvbXB0VGJCMEhaL0tRUzFIRjdRVzR3aVN3ZklJQXJlbFB1bTFLOGp0?=
 =?utf-8?B?N3gxSjhvMHB0bWt4Z0ZaNXRtNVpYTDc2b0htVTBNNWxWUnRaV1l6TytYQW1o?=
 =?utf-8?B?RXo0d1l6SVd2MGNoZGRnMEJ1ZzJRc1lHR2c0VjJ4UEFvU090dE1tRURRb3J4?=
 =?utf-8?B?cHYvd1V1dlVGelZnbnYrTXloSmRINkUzblZEWnNFbmp0WGRNTC9CeXdLcGIr?=
 =?utf-8?B?RnBLVjROb3pwbzdBeGpFYVNUQnJDVFhUb29ISkpKamtBc200N1BkblZEc2ZB?=
 =?utf-8?B?djJhRVV5N2R4TTFwLzVNNVYxSUYveEkvMWlXM1pXVzBESWprMzVlU0ZTWEtz?=
 =?utf-8?B?NEk4b1Y1OHpaeG9zelhaRTBXUlMxMmd6ak9hOFN6aDVtblZQdTdaWGVmM2Vt?=
 =?utf-8?B?VWl6VkxNOEkzZ2RtNitkZjgrUVVsSEFzTndxeEpMMEk0cE9ubVBNTjhHVmdl?=
 =?utf-8?B?dDVxMzdiZjJYQ0trYWFiNVRMNVUrd3NoQWVQS3IwWkd1WUNkOHp3azVEMTR3?=
 =?utf-8?B?Qm93UGZSOGhScVdMY051RFc3TnM4ZUh0eWo1TStGQ28rdWNzVW1PNk42bUxt?=
 =?utf-8?B?Vit5WXhIVnp2dDdiV0pMNXl6Q251T2Vya01RTmNHSWN3dlVQSFprOE5peEFK?=
 =?utf-8?B?WDJnbXBoNkxZa1dDb2ZNQlh6clBXdy9tQnFJWVBVa0FqamlHQ3cxbTNoOWh2?=
 =?utf-8?B?ZS9Ja3VGT09pYWY5WEd1Vmg2RFV0RWlXSUYyTmU3cmFmeGttR0tiQ1NEMjdS?=
 =?utf-8?B?MzY3Ylh0S2pRbHJCTjNMZGF4OTdhYjhNNGNEQ1piYXBRWU5QSlVqckhGV0Zq?=
 =?utf-8?B?VDE2UDUwcjRWSWlRclBycVViTEFpUS9tTjRoNHhlTDZEeGljWDMwSXJTVGhK?=
 =?utf-8?B?Q3VCcVo3YUJSR2wxZzBaTFZtSHJpcHNHWnczNElRRm8wTjFlOFJsWG1iTG0r?=
 =?utf-8?B?eUY1dkhNa3NScXVSN3dOWWJGUTRqazZEQU1QdThyYnJtRHRLSDQvMW02anEv?=
 =?utf-8?B?V3FnMkc0VzA5MFdwNFE3Q2R6UEdTck1xTkRIQi85bVRHRFFrRWhkTWpPNzRU?=
 =?utf-8?B?QjZlYmFqVm1QTXRNOTVEbExqNDlZRHIxRUYreVJ0RXl0NER0N1dRV3d2djlT?=
 =?utf-8?B?djQxanU2VDg4Wm41QlZ3OXlxWm5ZN051RE1MKzlNK0RONzZRUGgybzdGMm1r?=
 =?utf-8?B?czZ6Mnd2REg0TnQ4KzFlR0xwMHNzWUJ6SjJKbkZWZGlRUFk0QzZCcGhMMDNk?=
 =?utf-8?B?SHdkTXZxQTJSV1YwMEdLbVQwdFRsNTYwSG1FQ3ZiSFZVZ1RyeTE4VUYzNlhO?=
 =?utf-8?B?Q1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e5d04d-3096-4f60-ee80-08dc9feda504
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 08:03:40.7951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nEcQhixu03bIfokBp77MCtEiEve9fHehSD9gq/HYuJjD4QwS3zjtmbJgK55uBj+abwekkeUlkSAqDUYuB8aSfDJTcpWY38ivZtRsXlACTPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7710
X-Proofpoint-GUID: RZOFzjM0MoEkKYcIjd2TN-2vlXBP8ICS
X-Proofpoint-ORIG-GUID: U5aG8hZ8qABveMAoNdUY3yyGOoVqyI5g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_15,2024-07-08_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407090052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 08:03:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201647

--------------gGF1C9TmkLNtsIgHSuzFLnK0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4692VOpC001216


On 7/9/24 15:37, Alexander Kanavin wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> We haven=E2=80=99t updated Vulkan-samples in a while, can you check if =
the=20
> issue still occurs on the latest revision?
>
> Patches like this are difficult to remove, once added because one is=20
> expected to =E2=80=98prove=E2=80=99 they=E2=80=99re not needed, so I=E2=
=80=99d rather update.
>
> Alex

ktx under Vulkan-Samples has not been updated since 2021. I have report=20
this issue to upstream Vulkan-Samples,

so proberbally need to see=C2=A0 if upstream Vulkan-Samples will like to=20
update the libktx?

//Changqing

>
> On Tue 9. Jul 2024 at 9.32, Changqing Li via lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!cPwLL6W6ja8cj43rxGT4QmpSLh90iciuBLP1z_FIc5MsiZLkjY1V8e5kywVgvcuq7M5Dx=
x90SR8Zeo40kWVTBpdg_00$>=20
> <changqing.li=20
> <https://urldefense.com/v3/__http://changqing.li__;!!AjveYdw8EvQ!cPwLL6=
W6ja8cj43rxGT4QmpSLh90iciuBLP1z_FIc5MsiZLkjY1V8e5kywVgvcuq7M5Dxx90SR8Zeo4=
0kWVT7jpOEPM$>=3Dwindriver.com@lists.openembedded.org>=20
> wrote:
>
>     From: Changqing Li <changqing.li@windriver.com>
>
>     When debug build is enabled(-Og is used), vulkan-samples do_compile
>     failed with error:
>     In function 'ZSTD_compressBlock_lazy_generic',
>     =C2=A0 =C2=A0 inlined from 'ZSTD_compressBlock_greedy' at
>     TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/thi=
rd_party/ktx/lib/basisu/zstd/zstd.c:21914:12:
>     TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/thi=
rd_party/ktx/lib/basisu/zstd/zstd.c:21551:30:
>     error: inlining failed in call to 'always_inline'
>     'ZSTD_HcFindBestMatch_selectMLS': function not considered for inlin=
ing
>     =C2=A0| FORCE_INLINE_TEMPLATE size_t ZSTD_HcFindBestMatch_selectMLS=
 (
>     =C2=A0 =C2=A0 =C2=A0 | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/thi=
rd_party/ktx/lib/basisu/zstd/zstd.c:21736:32:
>     note: called from here
>     |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t const ml2 =3D=
 searchMax(ms, ip, iend,
>     &offsetFound);
>
>     Refer [1], always_inline is not suggested to use with indirect
>     function
>     call, replace always_inline with inline to fix the issue
>
>     [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107931
>     <https://urldefense.com/v3/__https://gcc.gnu.org/bugzilla/show_bug.=
cgi?id=3D107931__;!!AjveYdw8EvQ!cPwLL6W6ja8cj43rxGT4QmpSLh90iciuBLP1z_FIc=
5MsiZLkjY1V8e5kywVgvcuq7M5Dxx90SR8Zeo40kWVT33BBzsg$>
>
>     Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     ---
>     =C2=A0...ce-FORCE_INLINE_TEMPLATE-with-inline.patch | 52
>     +++++++++++++++++++
>     =C2=A0.../vulkan/vulkan-samples_git.bb
>     <https://urldefense.com/v3/__http://vulkan-samples_git.bb__;!!AjveY=
dw8EvQ!cPwLL6W6ja8cj43rxGT4QmpSLh90iciuBLP1z_FIc5MsiZLkjY1V8e5kywVgvcuq7M=
5Dxx90SR8Zeo40kWVTU43RwXc$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +
>     =C2=A02 files changed, 53 insertions(+)
>     =C2=A0create mode 100644
>     meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FOR=
CE_INLINE_TEMPLATE-with-inline.patch
>
>     diff --git
>     a/meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-F=
ORCE_INLINE_TEMPLATE-with-inline.patch
>     b/meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-F=
ORCE_INLINE_TEMPLATE-with-inline.patch
>     new file mode 100644
>     index 0000000000..22538d4119
>     --- /dev/null
>     +++
>     b/meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-F=
ORCE_INLINE_TEMPLATE-with-inline.patch
>     @@ -0,0 +1,52 @@
>     +From a7bfe82a311c713b12bb83b8488574ad5c784f89 Mon Sep 17 00:00:00
>     2001
>     +From: Changqing Li <changqing.li@windriver.com>
>     +Date: Tue, 9 Jul 2024 04:29:11 +0000
>     +Subject: [PATCH] zstd.c: replace FORCE_INLINE_TEMPLATE with inline
>     +
>     +Refer [1], always-inline is not suggested to be used if you have
>     indirect
>     ++calls. so replace FORCE_INLINE_TEMPLATE with inline to fix error:
>     +In function 'ZSTD_compressBlock_lazy_generic',
>     +=C2=A0 =C2=A0 inlined from 'ZSTD_compressBlock_greedy' at
>     TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/thi=
rd_party/ktx/lib/basisu/zstd/zstd.c:21914:12:
>     +TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/th=
ird_party/ktx/lib/basisu/zstd/zstd.c:21551:30:
>     error: inlining failed in call to 'always_inline'
>     'ZSTD_HcFindBestMatch_selectMLS': function not considered for inlin=
ing
>     + | FORCE_INLINE_TEMPLATE size_t ZSTD_HcFindBestMatch_selectMLS (
>     +=C2=A0 =C2=A0 =C2=A0 | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     +TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/th=
ird_party/ktx/lib/basisu/zstd/zstd.c:21736:32:
>     note: called from here
>     +|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t const ml2 =
=3D searchMax(ms, ip, iend,
>     &offsetFound);
>     +
>     +Upstream-Status: Inappropriate [ Latest upstream ktx don't have
>     this part code ]
>     +
>     +Has report this issue to upstream Vulkan-Samples, refer [2]
>     +
>     +[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107931
>     <https://urldefense.com/v3/__https://gcc.gnu.org/bugzilla/show_bug.=
cgi?id=3D107931__;!!AjveYdw8EvQ!cPwLL6W6ja8cj43rxGT4QmpSLh90iciuBLP1z_FIc=
5MsiZLkjY1V8e5kywVgvcuq7M5Dxx90SR8Zeo40kWVT33BBzsg$>
>     +[2] https://github.com/KhronosGroup/Vulkan-Samples/issues/1089
>     <https://urldefense.com/v3/__https://github.com/KhronosGroup/Vulkan=
-Samples/issues/1089__;!!AjveYdw8EvQ!cPwLL6W6ja8cj43rxGT4QmpSLh90iciuBLP1=
z_FIc5MsiZLkjY1V8e5kywVgvcuq7M5Dxx90SR8Zeo40kWVTJ9jXLJ8$>
>     +
>     +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     +---
>     + lib/basisu/zstd/zstd.c | 4 ++--
>     + 1 file changed, 2 insertions(+), 2 deletions(-)
>     +
>     +diff --git a/lib/basisu/zstd/zstd.c b/lib/basisu/zstd/zstd.c
>     +index eaf13738..423f149e 100644
>     +--- a/lib/basisu/zstd/zstd.c
>     ++++ b/lib/basisu/zstd/zstd.c
>     +@@ -21548,7 +21548,7 @@ size_t ZSTD_HcFindBestMatch_generic (
>     + }
>     +
>     +
>     +-FORCE_INLINE_TEMPLATE size_t ZSTD_HcFindBestMatch_selectMLS (
>     ++static inline size_t ZSTD_HcFindBestMatch_selectMLS (
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ZSTD_matchState_t* ms,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const BYTE* ip, const BYTE* const iLimit,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0size_t* offsetPtr)
>     +@@ -21596,7 +21596,7 @@ static size_t
>     ZSTD_HcFindBestMatch_dedicatedDictSearch_selectMLS (
>     + }
>     +
>     +
>     +-FORCE_INLINE_TEMPLATE size_t
>     ZSTD_HcFindBestMatch_extDict_selectMLS (
>     ++static inline size_t ZSTD_HcFindBestMatch_extDict_selectMLS (
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ZSTD_matchState_t* ms,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const BYTE* ip, const BYTE* const iLimit,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0size_t* offsetPtr)
>     +--
>     +2.44.0
>     +
>     diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
>     <https://urldefense.com/v3/__http://vulkan-samples_git.bb__;!!AjveY=
dw8EvQ!cPwLL6W6ja8cj43rxGT4QmpSLh90iciuBLP1z_FIc5MsiZLkjY1V8e5kywVgvcuq7M=
5Dxx90SR8Zeo40kWVTU43RwXc$>
>     b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
>     <https://urldefense.com/v3/__http://vulkan-samples_git.bb__;!!AjveY=
dw8EvQ!cPwLL6W6ja8cj43rxGT4QmpSLh90iciuBLP1z_FIc5MsiZLkjY1V8e5kywVgvcuq7M=
5Dxx90SR8Zeo40kWVTU43RwXc$>
>     index d60c0f3190..4e688e44a7 100644
>     --- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
>     <https://urldefense.com/v3/__http://vulkan-samples_git.bb__;!!AjveY=
dw8EvQ!cPwLL6W6ja8cj43rxGT4QmpSLh90iciuBLP1z_FIc5MsiZLkjY1V8e5kywVgvcuq7M=
5Dxx90SR8Zeo40kWVTU43RwXc$>
>     +++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
>     <https://urldefense.com/v3/__http://vulkan-samples_git.bb__;!!AjveY=
dw8EvQ!cPwLL6W6ja8cj43rxGT4QmpSLh90iciuBLP1z_FIc5MsiZLkjY1V8e5kywVgvcuq7M=
5Dxx90SR8Zeo40kWVTU43RwXc$>
>     @@ -10,6 +10,7 @@ SRC_URI =3D
>     "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=3Dmain;p=
rotoc
>     <https://urldefense.com/v3/__http://github.com/KhronosGroup/Vulkan-=
Samples.git;branch=3Dmain;protoc__;!!AjveYdw8EvQ!cPwLL6W6ja8cj43rxGT4QmpS=
Lh90iciuBLP1z_FIc5MsiZLkjY1V8e5kywVgvcuq7M5Dxx90SR8Zeo40kWVThP3VTJ0$>
>     file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch;patchdir=
=3Dthird_party/spdlog
>     \
>     file://0001-Deprecate-u8string_view.patch;patchdir=3Dthird_party/sp=
dlog
>     \
>     file://32bit.patch \
>     +
>     file://0001-zstd.c-replace-FORCE_INLINE_TEMPLATE-with-inline.patch;=
patchdir=3Dthird_party/ktx
>     \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>
>     =C2=A0UPSTREAM_CHECK_COMMITS =3D "1"
>     --=20
>     2.25.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#201645):
>     https://lists.openembedded.org/g/openembedded-core/message/201645
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/201645__;!!AjveYdw8EvQ!cPwLL6W6ja8cj43rxGT4QmpSLh90i=
ciuBLP1z_FIc5MsiZLkjY1V8e5kywVgvcuq7M5Dxx90SR8Zeo40kWVTRCp2LU8$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/107118822/1686489
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1071=
18822/1686489__;!!AjveYdw8EvQ!cPwLL6W6ja8cj43rxGT4QmpSLh90iciuBLP1z_FIc5M=
siZLkjY1V8e5kywVgvcuq7M5Dxx90SR8Zeo40kWVTr4QQbaw$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!cPwLL6W6ja8cj43rxGT4QmpSLh90iciuBLP1z_=
FIc5MsiZLkjY1V8e5kywVgvcuq7M5Dxx90SR8Zeo40kWVTJswMGfk$>
>     [alex.kanavin@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------gGF1C9TmkLNtsIgHSuzFLnK0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4692VOpC001216

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 7/9/24 15:37, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj-29_xM5FOM9WGFg-z3cEjg=3D=
uge=3DAa5xiYgqRSFrAci_A@mail.gmail.com">
      <strong>
      </strong>
      <div><strong><span>CAUTION: This email comes from a non Wind River
            email account!</span></strong><br>
        <span>Do not click links or open attachments unless you
          recognize the sender and know the content is safe.</span><br>
      </div>
      <div>
        <div dir=3D"auto">We haven=E2=80=99t updated Vulkan-samples in a =
while,
          can you check if the issue still occurs on the latest
          revision?</div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">Patches like this are difficult to remove, once
          added because one is expected to =E2=80=98prove=E2=80=99 they=E2=
=80=99re not needed,
          so I=E2=80=99d rather update.</div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">Alex</div>
      </div>
    </blockquote>
    <p>ktx under Vulkan-Samples has not been updated since 2021. I have
      report this issue to upstream Vulkan-Samples,&nbsp;</p>
    <p>so proberbally need to see&nbsp; if upstream Vulkan-Samples will l=
ike
      to update the libktx? <br>
    </p>
    <p>//Changqing <br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj-29_xM5FOM9WGFg-z3cEjg=3D=
uge=3DAa5xiYgqRSFrAci_A@mail.gmail.com">
      <div>
        <div><br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">On Tue 9. Jul 2024 at
              9.32, Changqing Li via <a href=3D"https://urldefense.com/v3=
/__http://lists.openembedded.org__;!!AjveYdw8EvQ!cPwLL6W6ja8cj43rxGT4QmpS=
Lh90iciuBLP1z_FIc5MsiZLkjY1V8e5kywVgvcuq7M5Dxx90SR8Zeo40kWVTBpdg_00$" moz=
-do-not-send=3D"true">
                lists.openembedded.org</a> &lt;<a href=3D"https://urldefe=
nse.com/v3/__http://changqing.li__;!!AjveYdw8EvQ!cPwLL6W6ja8cj43rxGT4QmpS=
Lh90iciuBLP1z_FIc5MsiZLkjY1V8e5kywVgvcuq7M5Dxx90SR8Zeo40kWVT7jpOEPM$" moz=
-do-not-send=3D"true">changqing.li</a>=3D<a href=3D"mailto:windriver.com@=
lists.openembedded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-fr=
eetext">windriver.com@lists.openembedded.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote">
              From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windr=
iver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-lin=
k-freetext">changqing.li@windriver.com</a>&gt;<br>
              <br>
              When debug build is enabled(-Og is used), vulkan-samples
              do_compile<br>
              failed with error:<br>
              In function 'ZSTD_compressBlock_lazy_generic',<br>
              &nbsp; &nbsp; inlined from 'ZSTD_compressBlock_greedy' at
TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_par=
ty/ktx/lib/basisu/zstd/zstd.c:21914:12:<br>
TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_par=
ty/ktx/lib/basisu/zstd/zstd.c:21551:30:
              error: inlining failed in call to 'always_inline'
              'ZSTD_HcFindBestMatch_selectMLS': function not considered
              for inlining<br>
              &nbsp;| FORCE_INLINE_TEMPLATE size_t
              ZSTD_HcFindBestMatch_selectMLS (<br>
              &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_par=
ty/ktx/lib/basisu/zstd/zstd.c:21736:32:
              note: called from here<br>
              |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size_t con=
st ml2 =3D searchMax(ms, ip, iend,
              &amp;offsetFound);<br>
              <br>
              Refer [1], always_inline is not suggested to use with
              indirect function<br>
              call, replace always_inline with inline to fix the issue<br=
>
              <br>
              [1] <a href=3D"https://urldefense.com/v3/__https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D107931__;!!AjveYdw8EvQ!cPwLL6W6ja8cj43rxGT=
4QmpSLh90iciuBLP1z_FIc5MsiZLkjY1V8e5kywVgvcuq7M5Dxx90SR8Zeo40kWVT33BBzsg$=
" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
                https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107931</a>=
<br>
              <br>
              Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing=
.li@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"mo=
z-txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;...ce-FORCE_INLINE_TEMPLATE-with-inline.patch | 52
              +++++++++++++++++++<br>
              &nbsp;.../vulkan/<a href=3D"https://urldefense.com/v3/__htt=
p://vulkan-samples_git.bb__;!!AjveYdw8EvQ!cPwLL6W6ja8cj43rxGT4QmpSLh90ici=
uBLP1z_FIc5MsiZLkjY1V8e5kywVgvcuq7M5Dxx90SR8Zeo40kWVTU43RwXc$" rel=3D"nor=
eferrer" target=3D"_blank" moz-do-not-send=3D"true">vulkan-samples_git.bb=
</a>&nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 1 +<br>
              &nbsp;2 files changed, 53 insertions(+)<br>
              &nbsp;create mode 100644
meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FORCE_INL=
INE_TEMPLATE-with-inline.patch<br>
              <br>
              diff --git
a/meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FORCE_I=
NLINE_TEMPLATE-with-inline.patch
b/meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FORCE_I=
NLINE_TEMPLATE-with-inline.patch<br>
              new file mode 100644<br>
              index 0000000000..22538d4119<br>
              --- /dev/null<br>
              +++
b/meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FORCE_I=
NLINE_TEMPLATE-with-inline.patch<br>
              @@ -0,0 +1,52 @@<br>
              +From a7bfe82a311c713b12bb83b8488574ad5c784f89 Mon Sep 17
              00:00:00 2001<br>
              +From: Changqing Li &lt;<a href=3D"mailto:changqing.li@wind=
river.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-li=
nk-freetext">changqing.li@windriver.com</a>&gt;<br>
              +Date: Tue, 9 Jul 2024 04:29:11 +0000<br>
              +Subject: [PATCH] zstd.c: replace FORCE_INLINE_TEMPLATE
              with inline<br>
              +<br>
              +Refer [1], always-inline is not suggested to be used if
              you have indirect<br>
              ++calls. so replace FORCE_INLINE_TEMPLATE with inline to
              fix error:<br>
              +In function 'ZSTD_compressBlock_lazy_generic',<br>
              +&nbsp; &nbsp; inlined from 'ZSTD_compressBlock_greedy' at
TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_par=
ty/ktx/lib/basisu/zstd/zstd.c:21914:12:<br>
+TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_pa=
rty/ktx/lib/basisu/zstd/zstd.c:21551:30:
              error: inlining failed in call to 'always_inline'
              'ZSTD_HcFindBestMatch_selectMLS': function not considered
              for inlining<br>
              + | FORCE_INLINE_TEMPLATE size_t
              ZSTD_HcFindBestMatch_selectMLS (<br>
              +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
+TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_pa=
rty/ktx/lib/basisu/zstd/zstd.c:21736:32:
              note: called from here<br>
              +|&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size_t co=
nst ml2 =3D searchMax(ms, ip, iend,
              &amp;offsetFound);<br>
              +<br>
              +Upstream-Status: Inappropriate [ Latest upstream ktx
              don't have this part code ]<br>
              +<br>
              +Has report this issue to upstream Vulkan-Samples, refer
              [2]<br>
              +<br>
              +[1] <a href=3D"https://urldefense.com/v3/__https://gcc.gnu=
.org/bugzilla/show_bug.cgi?id=3D107931__;!!AjveYdw8EvQ!cPwLL6W6ja8cj43rxG=
T4QmpSLh90iciuBLP1z_FIc5MsiZLkjY1V8e5kywVgvcuq7M5Dxx90SR8Zeo40kWVT33BBzsg=
$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
                https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107931</a>=
<br>
              +[2] <a href=3D"https://urldefense.com/v3/__https://github.=
com/KhronosGroup/Vulkan-Samples/issues/1089__;!!AjveYdw8EvQ!cPwLL6W6ja8cj=
43rxGT4QmpSLh90iciuBLP1z_FIc5MsiZLkjY1V8e5kywVgvcuq7M5Dxx90SR8Zeo40kWVTJ9=
jXLJ8$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
https://github.com/KhronosGroup/Vulkan-Samples/issues/1089</a><br>
              +<br>
              +Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqin=
g.li@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"m=
oz-txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
              +---<br>
              + lib/basisu/zstd/zstd.c | 4 ++--<br>
              + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
              +<br>
              +diff --git a/lib/basisu/zstd/zstd.c
              b/lib/basisu/zstd/zstd.c<br>
              +index eaf13738..423f149e 100644<br>
              +--- a/lib/basisu/zstd/zstd.c<br>
              ++++ b/lib/basisu/zstd/zstd.c<br>
              +@@ -21548,7 +21548,7 @@ size_t
              ZSTD_HcFindBestMatch_generic (<br>
              + }<br>
              + <br>
              + <br>
              +-FORCE_INLINE_TEMPLATE size_t
              ZSTD_HcFindBestMatch_selectMLS (<br>
              ++static inline size_t ZSTD_HcFindBestMatch_selectMLS (<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;ZSTD_matchState_t* ms,<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;const BYTE* ip, const BYTE*
              const iLimit,<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;size_t* offsetPtr)<br>
              +@@ -21596,7 +21596,7 @@ static size_t
              ZSTD_HcFindBestMatch_dedicatedDictSearch_selectMLS (<br>
              + }<br>
              + <br>
              + <br>
              +-FORCE_INLINE_TEMPLATE size_t
              ZSTD_HcFindBestMatch_extDict_selectMLS (<br>
              ++static inline size_t
              ZSTD_HcFindBestMatch_extDict_selectMLS (<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;ZSTD_matchState_t* ms,<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;const BYTE* ip, const BYTE*
              const iLimit,<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;size_t* offsetPtr)<br>
              +-- <br>
              +2.44.0<br>
              +<br>
              diff --git a/meta/recipes-graphics/vulkan/<a href=3D"https:=
//urldefense.com/v3/__http://vulkan-samples_git.bb__;!!AjveYdw8EvQ!cPwLL6=
W6ja8cj43rxGT4QmpSLh90iciuBLP1z_FIc5MsiZLkjY1V8e5kywVgvcuq7M5Dxx90SR8Zeo4=
0kWVTU43RwXc$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tr=
ue">vulkan-samples_git.bb</a>
              b/meta/recipes-graphics/vulkan/<a href=3D"https://urldefens=
e.com/v3/__http://vulkan-samples_git.bb__;!!AjveYdw8EvQ!cPwLL6W6ja8cj43rx=
GT4QmpSLh90iciuBLP1z_FIc5MsiZLkjY1V8e5kywVgvcuq7M5Dxx90SR8Zeo40kWVTU43RwX=
c$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">vulkan-=
samples_git.bb</a><br>
              index d60c0f3190..4e688e44a7 100644<br>
              --- a/meta/recipes-graphics/vulkan/<a href=3D"https://urlde=
fense.com/v3/__http://vulkan-samples_git.bb__;!!AjveYdw8EvQ!cPwLL6W6ja8cj=
43rxGT4QmpSLh90iciuBLP1z_FIc5MsiZLkjY1V8e5kywVgvcuq7M5Dxx90SR8Zeo40kWVTU4=
3RwXc$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">vul=
kan-samples_git.bb</a><br>
              +++ b/meta/recipes-graphics/vulkan/<a href=3D"https://urlde=
fense.com/v3/__http://vulkan-samples_git.bb__;!!AjveYdw8EvQ!cPwLL6W6ja8cj=
43rxGT4QmpSLh90iciuBLP1z_FIc5MsiZLkjY1V8e5kywVgvcuq7M5Dxx90SR8Zeo40kWVTU4=
3RwXc$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">vul=
kan-samples_git.bb</a><br>
              @@ -10,6 +10,7 @@ SRC_URI =3D &quot;gitsm://<a href=3D"http=
s://urldefense.com/v3/__http://github.com/KhronosGroup/Vulkan-Samples.git=
;branch=3Dmain;protoc__;!!AjveYdw8EvQ!cPwLL6W6ja8cj43rxGT4QmpSLh90iciuBLP=
1z_FIc5MsiZLkjY1V8e5kywVgvcuq7M5Dxx90SR8Zeo40kWVThP3VTJ0$" rel=3D"norefer=
rer" target=3D"_blank" moz-do-not-send=3D"true">github.com/KhronosGroup/V=
ulkan-Samples.git;branch=3Dmain;protoc</a><br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<a class=3D"moz-txt-link-freetext" href=3D"file://0001-Do-not-use-LFS64-f=
unctions-on-linux-musl.patch;patchdir=3Dthird_party/spdlog">file://0001-D=
o-not-use-LFS64-functions-on-linux-musl.patch;patchdir=3Dthird_party/spdl=
og</a>
              \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              <a class=3D"moz-txt-link-freetext" href=3D"file://0001-Depr=
ecate-u8string_view.patch;patchdir=3Dthird_party/spdlog">file://0001-Depr=
ecate-u8string_view.patch;patchdir=3Dthird_party/spdlog</a>
              \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class=3D"moz-t=
xt-link-freetext" href=3D"file://32bit.patch">file://32bit.patch</a> \<br=
>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://0001-zstd.c-repla=
ce-FORCE_INLINE_TEMPLATE-with-inline.patch;patchdir=3Dthird_party/ktx">fi=
le://0001-zstd.c-replace-FORCE_INLINE_TEMPLATE-with-inline.patch;patchdir=
=3Dthird_party/ktx</a>
              \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
              <br>
              &nbsp;UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
              -- <br>
              2.25.1<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#201645): <a href=3D"https://urldefense.=
com/v3/__https://lists.openembedded.org/g/openembedded-core/message/20164=
5__;!!AjveYdw8EvQ!cPwLL6W6ja8cj43rxGT4QmpSLh90iciuBLP1z_FIc5MsiZLkjY1V8e5=
kywVgvcuq7M5Dxx90SR8Zeo40kWVTRCp2LU8$" rel=3D"noreferrer" target=3D"_blan=
k" moz-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-core/message/201645</a><br>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.openembedded.org/mt/107118822/1686489__;!!AjveYdw8EvQ!cPwLL6W6=
ja8cj43rxGT4QmpSLh90iciuBLP1z_FIc5MsiZLkjY1V8e5kywVgvcuq7M5Dxx90SR8Zeo40k=
WVTr4QQbaw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">
                https://lists.openembedded.org/mt/107118822/1686489</a><b=
r>
              Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@li=
sts.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
                openembedded-core+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!cPwLL6W=
6ja8cj43rxGT4QmpSLh90iciuBLP1z_FIc5MsiZLkjY1V8e5kywVgvcuq7M5Dxx90SR8Zeo40=
kWVTJswMGfk$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">
                https://lists.openembedded.org/g/openembedded-core/unsub<=
/a>
              [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">alex.kanavin@g=
mail.com</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------gGF1C9TmkLNtsIgHSuzFLnK0--

