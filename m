Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8868FC07E9D
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 06:58:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.25442.1664175508863705600
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 23:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=nnqZffTt;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=62686aa93d=zhe.he@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28Q6TiGH002209
	for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 23:58:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=Qbxm6AwIWEn90n8frAp/npEDGghu7fy/OvjAJK9GbZI=;
 b=nnqZffTtp4poedqn4zHsDJm05o6LZRiEm4nz/bNFhh7hfQWIVnn9JG0cU0IPDWsQnn7D
 SCe/wqju8nvU0KjFBHxhVdhfnJ1Wq/n2jopi29IX47mz3tPFps670pHVoqHuErzVfVnx
 UZhSZ/O2036nq1dtGDxKK501KPmYRTb+u/mL2jGlUxuJ4f7z2Sgm24SQOTely/DukRDK
 qMoyBegdBQ2YtCgoM/r7AYlvmDCOybBjj4vBdQuHx5ybAwJuB3eTWWHXEQ1TDXOwY3OJ
 SXxR8o+fScUEpOAdcRKZO/mg1TIlNpTDgmANS5H2tWDmLW0D53T2pB3VdvDyWgj6y5B1 7Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jsw65h6td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 23:58:28 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28Q6wRxW023965
	for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 23:58:27 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jsw65h6tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 25 Sep 2022 23:58:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSu6tllgB8RdRV3lSURBPV1EvMasVhC2d1TRHl4OV1MzVUEnbOfabpoDEOhjPOtygzFB/N55HwhvtiUmJwHJty5FN2SZLJJYs+S/7wjo8nsoa0TaLwxXoHTDK+++XYYdqLTNmq+VFF3zfdiQddVV+fiIbU9tlAS6aWx0j0f3QCiWnG8tZZ/vV7kGKtgwNcc1B4qLef+WfPwivnZE8qfDZVI+SCcZ2wk3IqrTdXtgyaSSj99cWyi0LuBDxnIMxx7hMl+B9E5VBjdjpRmqRR7Iu/eOQCaAv+SCT5IMf6KiOJ7tZHGzwBdHpAmS8ILK+L9rAf10TUiqNM3mNM8O0qPNug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qbxm6AwIWEn90n8frAp/npEDGghu7fy/OvjAJK9GbZI=;
 b=ORLXnG/OglymgPKMmuLBLHz1nbbl2BwHETpTqyxtBXZ1wbfwvhIaSRnELMRwSkQuPM/LosuZ5o0C8kOeN1AXUTN//HfZZ/cZS3mADhU1O4tX/4wvSNo4wIAP6i2ntIvGvI2klxsTwBAw3r1G45HhX6Yb26KGFi3eJMfdUoOtQUZn6dyAH9nu9moxUgt1NioPfBeQ6eD2jkJ2N8CfL36HN6zlm1TxSx3A20POTLcOEV9QFF6R65Uc4tlQQdi8gn8eXppJuejORVBg26Tsnp7+oNapvC7gLbpm3psUZqxkTHhdjul8AY+dljPEfsmQJHLn7u/5s7RyO9JjbdGgWhZEpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by DM4PR11MB5246.namprd11.prod.outlook.com (2603:10b6:5:389::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 06:58:25 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::2572:6bb3:3214:81f8]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::2572:6bb3:3214:81f8%10]) with mapi id 15.20.5654.025; Mon, 26 Sep
 2022 06:58:25 +0000
Message-ID: <b575cd75-6e23-66ff-cf44-c73dc8216b42@windriver.com>
Date: Mon, 26 Sep 2022 14:56:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core][PATCH] lttng-tools: Disable ptest for qemuriscv32
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
References: <20220923031844.1630492-1-zhe.he@windriver.com>
 <c92673306b99fa5c7c12a9b810f8a82ab0414571.camel@linuxfoundation.org>
From: He Zhe <zhe.he@windriver.com>
In-Reply-To: 
 <c92673306b99fa5c7c12a9b810f8a82ab0414571.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0105.apcprd03.prod.outlook.com
 (2603:1096:4:7c::33) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1358:EE_|DM4PR11MB5246:EE_
X-MS-Office365-Filtering-Correlation-Id: 45763e67-88a2-4452-41c6-08da9f8c81e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fqPL0/5OVGqUUCJVBW1L8b45t4HV+TjV1+G9g2aWkxlnVOQThd/MTLaoZBVTkVyxIcWARdrIftb0LvPFEMoU2qNrB4MdlpDr1zETYS3o9nuZzWySVwKFVXWTQn6y0JKp1W/DGdupCMru692xjuId3mcuoXnCJdU8evKS9fTxifjRcXzOYOrcR4gZZXUHArloSJJvzGFqTV3DPIWo9NwOBVgkwl57FUwTBTdrBmdvRWbxzdhu/Xy6iArMeX5kLPQJDMSScVLa4Gc/GQLahLEqQSGUXDSH/H57xdxF51Y2dMKF3v4y9k9L/XRd91kODx98Jr/SOHngnUzZh0zq62wzTzQss9DW0dueJdpUW7TdLTvdswxAT20OFwht9WhTVA7E1oPC4j+bj84+6mhfwidy/zb3L5P4VfpwEv3aKtVtQ1MiV4zAEb0TtfH0wz4g8z/UNG1eUIhBEBJqHXOEs53momxy0hUkIoXM/wYB2K2ZmwyFSFNjCKZcmJ187VpT6QQneZf9ecjpoZhVh+Zhinmq3kWuGPKa68kV2sb6Ov/+0m+ZtqH/IapHzcPeuEAaWZ+G6BY1qm/C8Jg5acCtP2GXV5Lri3fGZOcl9R49Qlw++vU3L5fosv2KtcObbJU+a046CdJaZkJVuY4c90ALcokN2RGJ7BDlsflBrxqElyNd5A3bM+bUWAao4Z2A7vd6V+izO2lF2G/TfXyoHa+eIKIZMgA4Y5x9qXE5WpN5YlL2XyY4bzYirr062ChVVoibMgjXy9KdH7uJ1z1iqiUMwF+vD6q04VYV+JG6hGpJ4ExtgrE9nnKl7eYsjkSfc5aAbfkgXqGsTuHJwJI6cPKkHzdCIg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(396003)(346002)(136003)(376002)(451199015)(31696002)(86362001)(38100700002)(36756003)(31686004)(2906002)(186003)(26005)(5660300002)(6512007)(6666004)(2616005)(478600001)(41300700001)(6506007)(966005)(53546011)(6486002)(83380400001)(316002)(8676002)(4326008)(8936002)(66946007)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eG5xa0dxdHZHQnhFeURhT05RdUtXeWFCTzluMVZOWFB1ZlBKYVNhRjBtOWZM?=
 =?utf-8?B?ci9zMUw2d0M3OEwxOW1TRXNoZTR0a1Qvc01rR3lBOEJhSit6cEVQNVYySjBt?=
 =?utf-8?B?Rlg2KzNQbHROdUJOd2t6UmE1aFc4SFpxejIySTFaeXRJM3lXME5WQTZvNjF4?=
 =?utf-8?B?dU5PNmlESHRjRlk2OTQvR3VqMHBta1NTUWZYWXlXRWx2WkNqZExtdWpvT0da?=
 =?utf-8?B?SENkODgrVkpzQ24xcHVteEVaQittNGlZays1ckJydDNPYWxtTWZlT3ZzWjB1?=
 =?utf-8?B?LzJKMUVMbEptS2ZHTDV5L0hzbWQwUkptUVA2R29oYlZxTkNIMXgvSWsrZkhQ?=
 =?utf-8?B?MC9TZjc5QTJDNVJmeHd5QlNvc2pqRWZXQ0puWGNESnd1L2VWMGI5MkZqNCtG?=
 =?utf-8?B?WlhsRFJpWitMaXV4T2htQm4vZStvWnl2NjNlZ0xoNkM2Qm9abWh2eXJTYzBn?=
 =?utf-8?B?S0x2SU8vRUI2bzhicS9sTnFGLzM5U2U4UmlKTWtmelM1bUxzL28xVWlNdFFI?=
 =?utf-8?B?ZUtELzd4SXEzRWtzM3RiZlBRNzAxa3lLSGFaSE12NXhiUUlua2x0cFE2NGhx?=
 =?utf-8?B?Y200YWgzaWZHT1NUQ0RPOVEzVFh4eXVCZGV0OWh2WjM1S2U0OXVQZmJQZXJn?=
 =?utf-8?B?V0E4TDFDQ0VUclJDbFU0Um4rMXVSSnV2ck1BL1RtSCs5dmRLVkpIbURpM21r?=
 =?utf-8?B?YTM3R3g1Z1N5bWNpZDNOL3hlem9hUDBUc1p3QnVvbEplM2s0alVUdjJQSElh?=
 =?utf-8?B?MERCZE9ieWh0VFlKdnVnSmFYZ1UrSTFNQ2xkeWVuekFTMFdSTUlJaHNhbmha?=
 =?utf-8?B?c2JPVFlGdzllK0s3d2dmbVFzRzlxR2YrUm9rYm5iMUVlemdvM2VtT3hGeUlT?=
 =?utf-8?B?MnB1bjk5dWR6RHBoRzJQOGFETm1CY05HZVNjL1NVN0J4Risvc0h1bmE4Wm1C?=
 =?utf-8?B?eTRSU1pBN2hXajZZZnM3d1V5R2piTkhSbTErMTRlRGdsRkhKeStMNlM1Mngz?=
 =?utf-8?B?MWZFL0dPdnQzZ0JoVTY1VjhEeHl3UVpzRTc0NHI4RkFZMzc5NVhEdk5URkEx?=
 =?utf-8?B?aHBtK29DSVJVYzRaZHk4WXdyUlpMZWUvZ1VSYjVBdFVjRXpIK096a2VOaUlH?=
 =?utf-8?B?MSttZzFoalNYRU9Ec1ArTmRqdEN3RHRBL2JoY1dieTFIMkc5YzRDWU5Ta2FW?=
 =?utf-8?B?Vk1vMWxOQkdrMldFZGdxZ1FZZnhCZlJEekMrNCtvakpxZVBMZjFwRE9YcE9w?=
 =?utf-8?B?K2VaekYvZmNmYVU3bGttNjBaZDVIZmo0Mk95Nm9TeHE5d0VnVi9sbmpkV09R?=
 =?utf-8?B?dGdMVUU4ci8vV0xEbW1WTGw0NUxJbHdaZXlrY3FzWXpzR2ozVXZ0bmltYnhV?=
 =?utf-8?B?elp4c21xaXZHQUZzS0wybTVFK1BUNVZSVWZFU2M2Y2pPOHBOSHpoRExDdHFS?=
 =?utf-8?B?L0VtNUJQVEM2TWFrYWF1MW5JMzFpTlRuSzFTMWFTWm5KbUUxY0Y1RS9BZGFQ?=
 =?utf-8?B?QS96OG5TUDhkUTIvWVdhRXNhQnU2UFM4dVlOZjNZanc1eEhUcDdVL2NoYmtO?=
 =?utf-8?B?MW9KM0FVekNUa3Vtb2NXREFoMXIrbmloZFJxYk8wdzQyTXJCUGMwZTFUb0I4?=
 =?utf-8?B?eXYwWkoyMk5oSlEwRG9vU0RrTW9yekpwVE1KK3Bhb2l1eDF2QVFSdDM2TDFn?=
 =?utf-8?B?YXVGdmZpbWVibWhiN2NtZ3NsbXRoeTFlR3FocXlxREpNZlBoeUwwaGFCM1l3?=
 =?utf-8?B?QmJGeUtlOGNlTXhFb0MrS0VPaWR0Rm9kcEtLVzI5d3VKcUJHK0FGbEZEY1Er?=
 =?utf-8?B?bmgwV1d3Y0tKUWsrUzJpVmRNeGFuVlcyMndRbUxZMHFRNjNUVzErQUJoS0Qy?=
 =?utf-8?B?RU9BOFVvZ3d2OFRiMjFtazhOcHJ0aHpPS0N0dG1mVVlzRTYzWWtqaUNmTTRG?=
 =?utf-8?B?VXF0ZzJJTVl5WVhBZ1owNVpSV3JYQUFlaDZ6UGZKS2JVNllhaTZhRXpjN2xX?=
 =?utf-8?B?MXE4cmdzYXcrQnF5YTlsY0FWUm41RXFVV1hscWl6YUZ5ZnRLNWtQMjJmOGo3?=
 =?utf-8?B?bFFIU1BpVEJjdlcvTDBqWGlVSmtxTmFhdUJ0RmpxRFhMczEyRVd0MklWRUVH?=
 =?utf-8?Q?/Wx7V3BS5QkxJLWH8O9amsfEo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 45763e67-88a2-4452-41c6-08da9f8c81e9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 06:58:25.4975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rt2Og5SO96W0zq6yNR10ch3EUe1g15oY5QMIf1Jov7CgiXpY4wqtxYxYlEEFEbNIJ+8xLX9CJjPzfOMzFJHppw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5246
X-Proofpoint-GUID: Z08Ldlgw0hARN7it1tSvk8hJf_gPKtIn
X-Proofpoint-ORIG-GUID: ojV5WjMNu8MjIYOiVRWPudggYEn_Rw3E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_04,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209260043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 06:58:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171051



On 9/23/22 23:12, Richard Purdie wrote:
> On Fri, 2022-09-23 at 11:18 +0800, He Zhe wrote:
>> lttng-tools ptest requires SYS_ppoll and SYS_pselect which are not
>> supported by qemuriscv32.
>>
>> Back port a not merged patch from upstream to be able to disable the test
>> build and disable the ptest build for qemuriscv32. This way the main
>> package can still be used or at least built.
>>
>> See the following link for more details.
>> https://github.com/lttng/lttng-tools/pull/162
> This commit message and patch are confused. It isn't a backport if it
> wasn't merged upstream first.
>
> The patch below has:
>
> "Upstream-Status: Inappropriate [oe-core specific]"
>
> which isn't really true either. The correct status may be Submitted or
> possibly Rejected but not Inappropriate. At the very least the link to
> the github issue should be in the patch header to explain the status
> and let people get more information.

Thanks for pointing out. I should have added the link here.

>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>>  meta/recipes-kernel/lttng/lttng-platforms.inc |  4 ++
>>  .../0001-configure.ac-add-disable-tests.patch | 38 +++++++++++++++++++
>>  .../lttng/lttng-tools_2.13.8.bb               |  6 ++-
>>  3 files changed, 46 insertions(+), 2 deletions(-)
>>  create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-configure.ac-add-disable-tests.patch
>>
>> diff --git a/meta/recipes-kernel/lttng/lttng-platforms.inc b/meta/recipes-kernel/lttng/lttng-platforms.inc
>> index 933c65d85d..2351df08b8 100644
>> --- a/meta/recipes-kernel/lttng/lttng-platforms.inc
>> +++ b/meta/recipes-kernel/lttng/lttng-platforms.inc
>> @@ -15,3 +15,7 @@ LTTNGUST:arc = ""
>>  
>>  COMPATIBLE_HOST:arc:pn-lttng-ust = "null"
>>  
>> +# Whether the platform supports lttng-tools-ptest
>> +# lttng-tools-ptest uses syscall SYS_ppoll and SYS_pselect6 which are not supported for some platforms.
>> +LTTNGTOOLSPTEST = "ptest"
>> +LTTNGTOOLSPTEST:qemuriscv32 = ""
> If the lttng-tools ptests don't work, will lttng itself work on the
> platform? Would we be better off simply disabling lttng on the platform
> until it is supported?

There is a comment in the issue saying that "disabling them is a quick-win to
make it possible to use a package on such an architecture." I thought it might
make some sense if we could at least build the main package, so I tended to just
disable the ptest. But, yes, now that riscv32 is not officially supported we
should disable lttng completely. I'll send a patch for that.

https://github.com/lttng/lttng-tools/pull/162


Thanks,
Zhe

>
> Cheers,
>
> Richard


