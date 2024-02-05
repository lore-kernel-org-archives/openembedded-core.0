Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A3FC48291
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 07:18:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.58255.1707117531024780589
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 23:18:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cbw2J5dW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2765e3e443=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4156PWQg026472
	for <openembedded-core@lists.openembedded.org>; Sun, 4 Feb 2024 23:18:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=3cRWXlwxwIEthbWqVvaDuy9tom87JNvZITA7L4IsFT4=; b=
	cbw2J5dWch7bMrQvWS85qFaPAyMcVT4lXlMwyJ4ImbKRFGTEMmBFCcQJESH8YT8P
	GZ1a7wb1KimOLQlSiJtJ1DhndnTj2WfCl+havr1RWDBFU7sdJldSgKhtr0eaqn1E
	yMenNziA3a2kEhEDRAJ7ZeovmrQSriN+G4G3h3PQzXUs6vwoM0++em1Q7+Keo2U7
	n+fqwS48l2Gxq/XR9JxgL6dCLo3FurPaEed9e5sT2p/BxD+lFOi09jU4IzP/6wDW
	R51PfJpOuq0L0YUWQ7ymklzITr59leRq9zIKScAP8UcQClbhpWFhCN/3fhF7QeJH
	GWL3ClRi2FPx9NJPCVAWYg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1hn3sbsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 23:18:50 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 4157InrP024237;
	Sun, 4 Feb 2024 23:18:49 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1hn3sbsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 Feb 2024 23:18:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBvSTDrRFxer3f7PxVusND+emgLlILFYpi/I35hoSnNFCmGRZvQ3gAy20xrL07Gakxwi7Ec/jc+WywfVlWpJ1Zm3NC+85uhR7B2xTMcqKeTiGnbVJGon+elDs+JlNOLZzpXf2dmdHmhDTxpBsQK3Tc2B9007dlclrOgRm4MZMbnMHuPBk+h7L52bUl7EMk3eOOO9NRPA0oWb44cueiWdWxNHkq8eSi95oUr91lgVQkt+FE96jz8Y5h0yuc8ENsgsr17/yMkeZbZR47FQIsbQMm+J8JqMDwrO606Jn4VEIFh8Uv7tPUL4O3lJw0A9ubRaFrv2brr5Oy7vV+gQ3QGzYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cRWXlwxwIEthbWqVvaDuy9tom87JNvZITA7L4IsFT4=;
 b=YNptG+6jJKdle21HXI3FgxaeCa7xMy1eqJa+38/QTYDhDCaUBmaN+GZ8aqC8SaiHE8t0uKQsq1YL6xYeOtpKoZRFP8AmgrVYxLJ+ccwUHhKqzEGhEJJAb9mumskLq9O1fUrQDdi+jWsNdCNt6aPb4IEVsMHkU7XvBJFK9rovUQd0ztJPIbcqRrWa/NbrBDrEC095het2tEdmR0x4K5DPU+xd1JwzqtWiUwy3EBW6YPd12tZt7jT54kHdcxaYj+PAEqu7jdGjviLOGeJlHOFwZaN7h2OT8TDCQ8Gf1p+R6J3HtAQ2ouf94pi9s5usq6zcwgBR+zp+m3ozUyPmExeLpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by PH0PR11MB5191.namprd11.prod.outlook.com (2603:10b6:510:3e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Mon, 5 Feb
 2024 07:18:45 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::c66:ddc4:3908:5994]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::c66:ddc4:3908:5994%3]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 07:18:44 +0000
Message-ID: <f0e4d215-e8f4-2670-1586-be18b2116c21@windriver.com>
Date: Mon, 5 Feb 2024 15:18:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH] kernel.bbclass: fix parsing error with
 KERNEL_SPLIT_MODULES = '0' and multilib enabled
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20240204052826.1282577-1-Qi.Chen@windriver.com>
 <c44b506f2cf4728e05e8735c0c640e910ad01d8a.camel@linuxfoundation.org>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <c44b506f2cf4728e05e8735c0c640e910ad01d8a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::20) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|PH0PR11MB5191:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ce77ac2-c8a1-4bf4-1bc7-08dc261aaf6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AMcOAt+QdKpwnrvsYp/J6B0bpItwJHAk97xZQ40fk7qXLxiq4V1tvf6qbAiUmqQkVuj76sV4mGH9Mfch45KVHWVGGX52kYBc8mopTICpCkG5d0KBZBz3vZT8PIlTTMNrDrQq7ZSkuDnT5P0hLMncA1pS+imxQRBQ9iCeh+6OZYc9/JBoIhJkXBLjzzZhOgOz80ryCLEn0LDHMA7LnL1M67aHKL44UmmD6SY4oGJp1rkzfyXVJyEcyX1MkZJWmdw6d0mnfvQ34ieHKTdQWShmLoNzuMz98XOAaB9Ch/z+5AXWgdAexAygTOmZSGexCleMFDZVDvE9Gru96z+3QT1sfUgydJMq1tV20zQ9BaINFZUIrNfgwmYfRP8Y9LwZSeiMB1et5OjC2Q3Zk1QuR4aT1OOU/CMPwPCJTuCPyjyiav+IaWlBSyeia+MP320S5DiucaW1ioTMNXebAe/k2xMzaknjTRE3t4Cb7YQAHyBPAYmccSXDbhgr+84/5euWiHQ+P8UnDaTHzBsPKTTdRk/JL81q0MdcEwlYj3eON7Ux8rhTx+rbY1E9c1Va8B8QPLDy3l/axHRfJwPDBXvlFv1y77W06qIYxenlmgHRRJwK0JGDry+ooFUNOgncG8x2HMTkpvKiXWOGdc7yV+BDDPfm7Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(346002)(39840400004)(376002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(41300700001)(2616005)(26005)(86362001)(31696002)(6486002)(5660300002)(478600001)(2906002)(66476007)(66556008)(66946007)(8936002)(8676002)(36756003)(6512007)(6506007)(53546011)(6666004)(38100700002)(31686004)(316002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TVQvYi9ucGJlTzU2UU1hNE9WNWhTV1RqeG1PSmZPeFdMTllJTFdiSDVKSE9M?=
 =?utf-8?B?SUJMMXFtZFNTY2F4c08yNkVxYmcyblk3S2lkR3JRcWQ5YU1DUHRaazliUGdS?=
 =?utf-8?B?cDdNMTBWZzl6dFVpOW9vZWx3S3BhNW1yOVRjZmF1ZUhSTmN0UzN1UWZXN1ZO?=
 =?utf-8?B?L0k5YlBFNVdET0xDRUhDRjhnK241dHByUVBmaW45dUM4d1RKbERqMU9ld3hy?=
 =?utf-8?B?MDNjd2R5MmZja0o5WXd5aEhEZEdTa2dFUlRrQ0hkakk4V3RQVzRic2JLbTFn?=
 =?utf-8?B?a3dSUVlZMEI3QStMR2lEb2ljeUh5SFlJanN2T3U0cGpvTmFZWTRaSkZ1VUww?=
 =?utf-8?B?dzZockhOWEYyeFlIVnRnYy9YUHZmVjhSTDV3RnlXVUJ3UVliNU5SY1ViZisr?=
 =?utf-8?B?aUpDK0NENnd5UUx6L3A1dDRqTzh5UndiZjBQMzlmMTF6WkFjUThmaGRpSE5q?=
 =?utf-8?B?Z2ppRGkwNUZjOVJKSW1zUGU5djFGZ3BDaDhNaHNJY0NLRTZ3MUxkbmt0UzRF?=
 =?utf-8?B?c0R1MHN3bjkwVDh4YXFwY0ppbHRMcmRrYXJvelNrbWdoUVlqRGJqN1hwODUy?=
 =?utf-8?B?Vmw1aUFTTU8zVEhLTGtaaVVGQ3YrU012QzBJQWxxNzM0d0EvZVZDNjFKUjNE?=
 =?utf-8?B?VWtLYnFvTnBjT3UxRzRkVWFiVFB6TmR3Vi9Dei90eFZncTRoS296VlhNSjNr?=
 =?utf-8?B?QmNiYmFZdEs5VGdmQWgyWmxzK0V0T0wrL21XYVFYNDVGM3ppV05QcmpqaHAv?=
 =?utf-8?B?MmxrSGErN1pvbnByRVhmRFhlSHBva3pWbTNiS1BJN2NXMmZGUXdweG1Bc25v?=
 =?utf-8?B?TGllRktSdjNCV095QitqWnlwelZRcTM4bUlRaXRTb0YyLzlZOWJKeDJEU3Zz?=
 =?utf-8?B?aTkzb2M1OFJvblRtMURSb255T0xLbDdwQU8xL2IwK3NnR1RSbjE5bFIxVXRI?=
 =?utf-8?B?N01vZE1MdHZETkVwV0NkVXpQeUtIMWV0RUxNSmFxTExwSUg4aEMrVElZZW1k?=
 =?utf-8?B?bEJsU3VZNk13b1JuaU5pZmpzaVJnbkRJWHRoY1lLY3BpYThZRjAwYTVMMkdn?=
 =?utf-8?B?MDNjUUl4U0hBMXBMWWRqcGtEQUVKT1JlL2xtUytsQ3U0d0ZUUTRDaFp5UjZW?=
 =?utf-8?B?dlNNVU5XR05IN3dERldvU1NuMk1xV0lHeE5WMkFuQy9jbnIyV0xlNkszSEtn?=
 =?utf-8?B?TmtxTmJmNzU1c014SitSejZwQUtUclJjMHZQR2V4REZFeTZGZW4xTEVPYWtJ?=
 =?utf-8?B?SWxwNkFOemtJVDdvR1dPYnZyaE42STRRay92R1A0Yzk1c1N1TldYUW0yU3Z5?=
 =?utf-8?B?KzhYbDAvM0licURuSDNwZTFkWG13N3R0a3lhQVljNUM2RE82T1JxUVc5SVlR?=
 =?utf-8?B?S1k4Zk5YaW5CUXNrS3BVMVlpVmNRemlUZmxQVWZCTDRpeWxESWZldjVQUmNC?=
 =?utf-8?B?Uk9ZSFMvNEErcWd1VnFlVDhOZ1NvbUZLaXhLTEJSZ080UnFZMmFBKyt5SHVp?=
 =?utf-8?B?d1VBVnViU2lLNVJQWUlLd1dXUEhMSWU1blg5aWQ5TXpqR1ZOZmNyUUs5US9p?=
 =?utf-8?B?S054eFJ6aU5xL0RiOCt1UVJ6SzFiSDdiK0NSVTFlUkt2WDJjaWsrNGlLUE9v?=
 =?utf-8?B?L0dhUFZWRHFiTHpMSVh4eEdlaTZpQVNtS1JjeHBrendyemhxK1ZpMnZmY01U?=
 =?utf-8?B?T2g2SlpBVVRYekJjRkFxUEdYOGZLQzVhcmpJQnBoU2NvUmFnMlVzbnFucno5?=
 =?utf-8?B?UEhUaHh5TzJWbmVVTG9hU1E0RWxuODc1c2d5d0x4ZFd5S0RMZVRac3ZQdC9u?=
 =?utf-8?B?VlhaYm1jMVU0czlRcXRqUjU5OTVET0h0MW12L1pMdXY3ZFlxOUF0UDNLcWMw?=
 =?utf-8?B?RVJ5N2FaWUgzM0RVc1RsZFFLR29Uc282V3VzRmw4V0dIQWhQRE9pdWpSYXpS?=
 =?utf-8?B?WmN0cHdzSjNYTWtzbzlqSjRETXFsR2ZZcG1ndjZnYXNhWDRlTmk1ek14RnBm?=
 =?utf-8?B?eUJFMHVPQzhPMlA5SWZUMjZkT2pLd1lMOFdtTkY0cXNuRFhpQ1VTN2Zja2w4?=
 =?utf-8?B?QURTZ2txZmEzdzlQY3dEVWpJR2sweUdVbk1najJnT0dOc0xiU2tKT1VIT1do?=
 =?utf-8?Q?Pns51IF/t0F3m0GF5rXBd4wqS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce77ac2-c8a1-4bf4-1bc7-08dc261aaf6f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 07:18:44.5082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IC6Et60/sRVf6MzRRnzNNL6kwmChuM9lwiKb/kUMCR1a2UviIzFz2xaq143VstgoI+3MRVi4kAAOZDTLsMZe4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5191
X-Proofpoint-GUID: _np00-twV63AsJk-wVvoD6Ma8zQ-gwPC
X-Proofpoint-ORIG-GUID: FUYD9Fx4Wf8NM_yzluziJ1_s3roP0N2s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_02,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 suspectscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402050054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 07:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194919

On 2/4/24 18:20, Richard Purdie wrote:
> On Sun, 2024-02-04 at 13:28 +0800, Chen Qi via lists.openembedded.org
> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> The problem could be reproduced with the following settings:
>> MACHINE = "qemux86-64"
>> KERNEL_SPLIT_MODULES = "0"
>> require conf/multilib.conf
>> MULTILIBS ?= "multilib:lib32"
>> DEFAULTTUNE:virtclass-multilib-lib32 ?= "core2-32"
>>
>> The error message is as below:
>>    bb.data_smart.ExpansionError: Failure expanding variable KERNEL_VERSION_PKG_NAME, expression was ${@legitimize_package_name(d.getVar('KERNEL_VERSION'))} which triggered exception TypeError: expected string or bytes-like object
>>    The variable dependency chain for the failure is: KERNEL_VERSION_PKG_NAME -> RPROVIDES:kernel-modules
>>
>> This is because multilib_virtclass_handler_global function in
>> multilib_global.bbclass deletes KERNEL_VERSION. So we need to handle
>> such situation.
>>
>> The KERNEL_VERSION is defined as:
>> KERNEL_VERSION = "${@get_kernelversion_headers('${B}')}"
>> So in a clean build directory, its initial value is "None". We should
>> sync other settings to this value. If we use '', then what we'll get
>> error like below with the above settings:
>>
>>    ERROR: Required build target 'core-image-minimal' has no buildable providers.
>>    Missing or unbuildable dependency chain was: ['core-image-minimal', 'virtual/kernel', 'kernel-modules-none']
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/classes-recipe/kernel.bbclass | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
>> index a76aaee5ba..7c1cb0ec77 100644
>> --- a/meta/classes-recipe/kernel.bbclass
>> +++ b/meta/classes-recipe/kernel.bbclass
>> @@ -44,9 +44,9 @@ INITRAMFS_MULTICONFIG ?= ""
>>   # number and cause kernel to be rebuilt. To avoid this, make
>>   # KERNEL_VERSION_NAME and KERNEL_VERSION_PKG_NAME depend on
>>   # LINUX_VERSION which is a constant.
>> -KERNEL_VERSION_NAME = "${@d.getVar('KERNEL_VERSION') or ""}"
>> +KERNEL_VERSION_NAME = "${@d.getVar('KERNEL_VERSION') or 'None'}"
>>   KERNEL_VERSION_NAME[vardepvalue] = "${LINUX_VERSION}"
>> -KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
>> +KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION') or 'None')}"
>>   KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
>>   
>>   python __anonymous () {
> I'd prefer not to have "None" floating around as a string value since
> that will likely cause other problems, perhaps not now but in the
> future.
>
> Also, the kernel should have a version by the time packaging runs yet
> this seems to be avoiding that.
>
> The code in multilib_global only operates on a copy of the datastore
> for local expansions and the idea is that it would leave
> ${KERNEL_VERSION} placeholders. Clearly this doesn't work for the avoid
> anonymous python pieces.
>
> I wonder what happens if we also delete the above two variables there?

It works. Thanks. I'll send out V2.

Regards,

Qi

>
> Cheers,
>
> Richard
>
>
>
>


