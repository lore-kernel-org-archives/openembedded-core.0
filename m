Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E619C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 08:15:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.68690.1705911352426610437
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 00:15:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=H8AwmUbF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1751a95c74=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40M6oDgK026687
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 08:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=XVLKv6aMTWqaleIacKUQ/gxncyzuHAEjK9hFIztEc3k=; b=
	H8AwmUbF8aI/Ei1g3u7bdL6ps5Gebm2BVtAj/kwztBOU6vHVsJOBFB2n4NKTWKgA
	zSPZMvz6v594AosXqRLlJuJYrLoaYLbYK/cyeHqku0Sjrxv7J93k3Qjw7zt1FXmr
	wp3AO/DEVMTird3igotKZLN62OoCqQNbeGWnv0gwiTvtpIB1CZDATrrC0RpB6Btf
	58kpgzKpAmzdOIL26FmzHqvNXeLWlP9Ntil5ZBxQZfUqPWUk7S7jC16GXDAyCRYr
	/W72SFTr3pdra7LaASkyZxc/kI8ihs3D6rHTHB+5ncrEcOZFy4a+z+Zz6E81eSef
	2guw7aM5uFMQpu4I1aojBw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr3cyhq8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 08:15:51 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40M8F6LA031045
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 08:15:51 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr3cyhq8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 08:15:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEdIJ4gSreAhwhn3GUEp5L1hpTcpqTyDnuK/e2eRX+OejJXbRJZaD9VQWTvOgrvwU9FPe2UKQAD9QB1FEAmSD445etwpdACZe9sp2BqygMI+96gW+EiHudQD8/76bSLi0XfZdVXPI6CFcWCFEkHTgxcE+sOhGKUzWePRa+ObSdOe+8Cu//I9APh4SGEzA68RPPBrPgj+7iG0tg/tN+ONM6hs3awqHV0GMQ+h1GQC/sD+BBfG1RL2dDdcG8BOo2W6CITkIXqX9kogrHfKLSy7gVtob6JzqIQsA2Ww6gPqiWlvfrhiw4VAnNTGib2JUyeZOGZ7VBhYcReLEJJGDWMLCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVLKv6aMTWqaleIacKUQ/gxncyzuHAEjK9hFIztEc3k=;
 b=SREJDD2qj5RAutCzlIwxAxi6ZmRmHygVUCnZYBxE5jQ36BhJIoqN+OfZjRuZBJYM9hYJF0BmviE9aVacvrwR5ci5T/Nn5CHpKmayOTTAX444MZ7laJMxR/fWhCZ7dlZcqy+n9dXKFqy729jMJ5C7dYwdQBkW+VztiVWdLsrn/yl0vecjWMRb6YVLF5nOrEmEy8weqMcfjBl+MYX6EQj3+e0b1YG5piGlsA9JOxZVOmfoB6M0kHadbkMIR9mFpXdiDh/kwvAumLsazWo7Z/1dt/27FJXdaVVD/o0/YtGHvlrQ67QlA2wdSYXQFn+z5qw/pmX1fVWmfVasyFTn0sm7Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 08:15:47 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%7]) with mapi id 15.20.7202.034; Mon, 22 Jan 2024
 08:15:47 +0000
Message-ID: <78b1e91b-d681-2031-55a3-b622bccb211d@windriver.com>
Date: Mon, 22 Jan 2024 16:15:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH 1/3] systemd: upgrade to 255.1
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20231227042036.2376255-1-Qi.Chen@windriver.com>
 <2968be9a-c13d-5d98-e1be-d291d0b5b008@windriver.com>
 <2024011918132485b9ba7f@mail.local> <202401191814434c0685e2@mail.local>
 <ff3ec5f6-13fc-0468-9a07-09c3226c300b@windriver.com>
 <20240122080452ba0f7ee7@mail.local>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20240122080452ba0f7ee7@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::12) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|BL3PR11MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: 18e3d22a-8e70-4efc-da63-08dc1b22563a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	R93T/kFPbBDZ2Gkqpg/3igGdaCrnJIh4o06OgB9zixBhnBYGcp7TKnSR2AIu8I6WEzmk5RxoMpIBXS6UMmNdz4QhFUaVXRBBNZ4ds7wCDfcsArXYx1MVv1BIBWrJv323YbkB6gLydAqQRra7M+NdMb7zXN3fYFRzluWDDhmfCuSAqtoRUyVQEV/lirf4b6E0v5Dd9gspCoygHIP751mK0nCu0AQ/f1NONyz/V8EIiodFfz1/icw8KClWkI5q7Wz2pNCXIUWaJeFxGUbbhgD2Zjz2GYHH6g/wdC76F58Prs0b4cFpXVk0kMtyyolKlFO/M1iyNaRr+GMy6d55HvnnO59me1W05MciF4BO01BDSLsF7fU32BqBdmIC96Ue4T7IzAhaUbMpC3kFCfsk87R9fejUgWL3gZuj94EWqx2ql6a7zCUi2pmzQjTmkiNeBkVIsYF6C/E/CggcLJsffjntJntZlz8VCtcXux5BW9zWwaoOe9b011UJINxJdPNogEXhRfqhwZdWa3VFghc0Nntf10H733Dq4Dd6FTGQGoLyaHd9JeWAsLGHz0w0D2Sx1THGfEbh7umKiBZSs1GIksBTe0feeIpXQe06J/9Nz++UJ97vOLF5qe32i05jVaS0xBdJ8WTY9jDDJUMNtHAWCMdSN9YTgg8Lz32xMyaXVKa8IYg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(376002)(366004)(39850400004)(230273577357003)(230173577357003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(36756003)(26005)(6506007)(6666004)(53546011)(6512007)(2616005)(83380400001)(5660300002)(2906002)(66556008)(966005)(6486002)(4326008)(8676002)(8936002)(66476007)(6916009)(316002)(66946007)(478600001)(41300700001)(31696002)(86362001)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RDVrOVJTRWQ4V1NFQ2Q3bExqWE5zeURQS29Ldm9tOGk2SjhiOVFMczcvbzEy?=
 =?utf-8?B?M0NWT2tTakg2ckYrWnpyS3dhMG9DQkx0ZnRlR0hqSVB0M0szK1hmSHJ0VElG?=
 =?utf-8?B?R2toWFhFY2RWdWtmNmVCK3RXS096SkpOT3ZaWHl0c0NKMEhURnBxT2U1bXdj?=
 =?utf-8?B?Y3crUWxhNm1SRlBHbkxzVmFOcEVrSHJheHpickt6b1VLdVBHRVB6SUplYlRa?=
 =?utf-8?B?ZGhIREZrLzF1TktRZ1JYSno0NHdhU3hKOTFCay9laFRlNlJ2eFRxWlJHNXRz?=
 =?utf-8?B?TWRYVWNQSC9PQ0hRdmRVTUlTam40WUljQWN1eE96RGxyenRyQXhCdXA1YjVl?=
 =?utf-8?B?cldBTUZYcGhFc2RSNTZFUnFIcDJMSGo1QVZVaGNmc3dtUER2TGJpNDRWYXFx?=
 =?utf-8?B?SzdNaVpYdGI3SFpMelRhd0pOcng2Qm53ZUgzcms0aFlpOFY4anhCMXR6S2Za?=
 =?utf-8?B?bE1YSGpvRDBRdlo0ZU5uNU5oV3MzcGZtOUlwTDhmczJTVi9YN2hFWkVRYTZk?=
 =?utf-8?B?UjFnbzdQemlnUFkxL3NTOW0wSmsxYnJ3Z2x2dFpWUnFqc08xYkErc3VKWE1m?=
 =?utf-8?B?SVQySndFL1ZWMExaMng5cnIyV2xLekVkNzdGbyt6YnV3dE1hZWRHQjBmbGJa?=
 =?utf-8?B?RVJteXREay9RSHV1QUt3REtVNkRDODcxUVBUdnBtczgyNnJVemozV0lpRGx4?=
 =?utf-8?B?RUIyeGxpcEJYT21nbDVaR0FPSVBhOHBHeFlSeVFWN21PQ0Z0RUVuQVdWL1Ix?=
 =?utf-8?B?OStMVDJ6Q1JWVWlWTzkzZHZCTlptUDRsbGVLWFFZRWw2UG1aaVNmcW5XNUU0?=
 =?utf-8?B?N1h5ZmYrd2tkenF2aEdIdDVXd0pxWllHVThSbDVQSjAyOEMvQ1crZi9yWGZE?=
 =?utf-8?B?bVQwemFVb1VpMWJJOEI2Um5xUXZiOU0wQWpRK1Y0aE5jQUQvMHFNckFKdENO?=
 =?utf-8?B?c0RvbnFOUThrb0FGbWpNVXIzQjcyVWhSQ21CeHhnZGMxYU1WaEYxbUl0TXI0?=
 =?utf-8?B?RXhsTmRjSElIY3Q1L2VSMDNDM0NydnYraVQ2YUZhVzR4WXQ4OXhRRTVQeTdj?=
 =?utf-8?B?WFovTC9BdlMvY3U3NXlMdzZGaVhXZXFWYTJrTVBmaGNPYW5IYTlpSHZtd1Ro?=
 =?utf-8?B?YjFQNXhwRXloSnJlT2c2SHpnYUlOQ0hDdTN2aEM3eU53bUlCZTQxeE5rZzdX?=
 =?utf-8?B?ZkRFVkNFNGYwejFsdlN1UFNMYnBmNWZkUjRQR1lGUjFvK215Tm10Z0RHVCsv?=
 =?utf-8?B?VCs4eXk2dXdhOWd6ZUlVVVdxd3BxakFnM2VvcEM0RjlTKy9nNmh4czFhOWEx?=
 =?utf-8?B?Zi9TWnFzU20wT2ozOVpKcHF0dlpYMCt4VzFwcWxtaUpsb1oyek5QdHVScC9C?=
 =?utf-8?B?ajlqK1J5RU9kM3MvckpNaDY4amdqSGtOWkhZSHdLWUlzLzVWT3FYTmlrOWwz?=
 =?utf-8?B?N3VJd0NKVVVyWGhEVkcyd3JLNDhnMnFIWVJBemJkVkdRSjVMcGwzMWpYRFNj?=
 =?utf-8?B?bUkyaTFUUG5pNmkwVURPZmdXVStUV0piTyt4azBpNEhWM0wzOVpSVmhUcjFO?=
 =?utf-8?B?M1hpbC9oNitaeFNTS25kOFN5VkI2dWR3SjdIL2xoWnBMcnRnd3NSZTFIS21C?=
 =?utf-8?B?MHY4aCtsSFk3QjVhWlA0SWIyRmlNZmVBMHBsRjlPYVkxb1FScTFFQWpBWG1N?=
 =?utf-8?B?b3BKRHNSWk1SZThLWUxaOTNpZzA0MHQwa0lsWEdZTUg1MlhnYXdrdWgvbXY1?=
 =?utf-8?B?cEJwWVREVG1JR0RKUWRFY1lIN1A3bnB5bFJrNXRYNWhUQ2g3SGNqSWhuMXdK?=
 =?utf-8?B?S1JtYitDRDJmMEtBbEszenljcTRWTWFLa29uLzJvMmlTZi9xMlV4TXM3NGpT?=
 =?utf-8?B?Q2g0dU8zUnVmRjhBWGl1cTVGQ3BSV3IzZlRUU2VQNXBmMUJwTFpzT1dzc3RV?=
 =?utf-8?B?MUVuU2R2ZC9IWTkyWFZyV1R6b05zQlVxb3B2OFpBaVIxN3g5MXJtTnIxempE?=
 =?utf-8?B?M3BVbzhHVTVmNUJIVXdVdVpHOFFKOW03WTc5RkRFbmxBTXo3b1pDU2h5R0Ny?=
 =?utf-8?B?Q0ZUcS9wNFFaSW1MWnQ0aDZGOVVMcm5FWTlMVkVOeTRKaE1NWnNib09yNFA4?=
 =?utf-8?Q?EZTaaXz3VShh7j87F635Iar+X?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e3d22a-8e70-4efc-da63-08dc1b22563a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 08:15:47.0489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6p34ZUD9Ccw4OALSqEZNv2UZrh6c+0ucv6JJVMvCHX+u2oc22wpklME88rWhS1/dbK2KuZAXeWpTOtnfqWuxwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6409
X-Proofpoint-GUID: F1ASSIgNF2VDxQhRnboec2gFHPyxcWoy
X-Proofpoint-ORIG-GUID: X52QqeMvverhDFxZJqqIkGbgyj2dklBD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-21_04,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401220059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 08:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194121

On 1/22/24 16:04, Alexandre Belloni wrote:
> On 22/01/2024 12:38:15+0800, ChenQi wrote:
>> On 1/20/24 02:14, Alexandre Belloni wrote:
>>> On 19/01/2024 19:13:25+0100, Alexandre Belloni wrote:
>>>> On 19/01/2024 11:09:20+0800, Chen Qi via lists.openembedded.org wrote:
>>>>> What's the status of this patch series?
>>>>> Is there any issue or concern that I missed?
>>>> I'm glad you asked, I got this today:
>>>>
>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/8466/steps/26/logs/warnings
>>> and I know you sent a patch for this but it didn't make it yet.
>> I just double checked with the following settings from the "Sysvinit with
>> systemd" entry in config.json, there's no warning.
>>
>> DISTRO_FEATURES:append = ' systemd usrmerge'
>> ROOT_HOME = '/root'
>> VIRTUAL-RUNTIME_init_manager = 'sysvinit'
>>
>> So I further checked the build's settings.
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/8466
>>
>> In the second step, "Fetch yocto-autobuilder-helper", I can see the
>> following logs:
>>
>> HEAD is now at ebb7e65 config.json: Fix syntax errors
>>
>> So the build is not using the latest repo. The latest commit is:
> This is not correct, it was using the latest commit at the time, the
> patch was applied after my email.
>
>
OK... Do you mean that the warning appeared in autobuilder, and then you 
applied the patch to yocto-autobuilder-helper to make the warning 
disappear? I thought you meant that the warning continued to exist even 
with the patch.

To clarify, we can now wait for autobuiler's results and I don't need to 
do anything more, right?

Regards,

Qi


