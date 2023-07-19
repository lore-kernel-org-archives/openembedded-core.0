Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED50EB64DA
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 09:40:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10084.1689759620953153435
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 02:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cZrOyClW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6564ce24fe=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36J87SVU011260
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 09:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=U08HnxSd4ngW+nM56z08oNogR3JZF4yFHI5kULfNj3A=; b=
	cZrOyClW+0JCQGl+5lXoJRKxCplelj6sWCEXk3a+2XQ0a8fnoP2WI+foLUXkpcRZ
	gDYiAxFHsX5Ji2PoXjviKacXum7TxQH2OyrHVeiOUdotvy6vEtPmJzvoa/lWn3Qn
	2tnbLmaILMm8oFtg2ndC3ESmI9o0re5F4ioByhSAC1rPEHJ6Kbmhh5gXiRml2nVW
	ehB9YGGuj3+NAsI59M52qa1NMUFjaxDIMNM4pnwv+V17cNFCbKPy8G3tP4xQ6GXr
	5MCRFXPSVjl6DpN74vSxQp0Uqccrk5VzEya36yu3s8Gqsh6EyHfMVKYeaZLNLUrT
	S5JqMRej8uGFNZYJEATv8w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3run9jug7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 09:40:20 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36J9eJex014582;
	Wed, 19 Jul 2023 09:40:19 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3run9jug7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jul 2023 09:40:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJeDRfcZjRxV4DdJ8c/JAkcT5uvD1IzEyLoy7KNDBoQQay/7/5bkflvT4WK0GxCpZaANW7fswkoRzhncGfioU10Gjyi0RoUu1ZhqsAQBVHhaMYrVWVmfAoOcSE7Fx6yXFk0+KnjvAUc71fhTmnB3/SGmmTlldYecKfL1DkKWnHYRlRA1hOk446OkmT5vcSVsmVcAPJeZryAe1FC77VrZ/NZ5gSuLq8gRUkS/kqTv/UtvbzlUx2CqmdOK0x7yO3nAa+6zaHfo/jIR0lMAzJ+DkSoNAZouV0SXawoNHPjv0OPCpLfbkXJIWbijzlJ8NgdbRk43MZHbEmwQjRpUCKClBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U08HnxSd4ngW+nM56z08oNogR3JZF4yFHI5kULfNj3A=;
 b=KAlhIKjL7B7pW2u1p6JiBIF6FAP5Nb4vU5r/LqQoGkv8VODAr1UZM5FjT62fal620lsjSsdp5OEL+LzU8IOd2BRvbQo58XfzJnzyh4DoOhwqyuOdJsiyLU0B4jOuKJeQk/4TLoFQ88ibhw+nwxnN+CuVACLWAFYN0UWE/BuCGqozVieaUOKg/crz9WP0FSdVFXicxrFbzziQPULYdR2CdFeaI7tHM8POmz8Xyx9nzE6JwhGUUiLvJ+qNLMC3nte8cICKCmOyh/UBBs+41hNQcN3yAggSO3kEi1MwvkqIm53yCsadDHAID8qAZSlJryy1CEoBorJggZIZwZvONaXQnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SA3PR11MB7528.namprd11.prod.outlook.com (2603:10b6:806:317::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Wed, 19 Jul
 2023 09:40:15 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::dd05:531c:7914:ce9f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::dd05:531c:7914:ce9f%4]) with mapi id 15.20.6609.024; Wed, 19 Jul 2023
 09:40:15 +0000
Message-ID: <078073d8-60c9-1cdd-e7be-cd3cf63e7dda@windriver.com>
Date: Wed, 19 Jul 2023 17:39:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH v3] qemu: Add qemu-common package
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        alexandre.belloni@bootlin.com
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>,
        openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
References: <E57733DA-39D3-494F-A91D-9AA8306DBDAB@arm.com>
 <20230710103218.3834001-1-mingli.yu@eng.windriver.com>
 <2023071611474165f97b23@mail.local>
 <919cae59-a542-5a51-e70e-164b5306eb41@windriver.com>
 <202307171246212fd06366@mail.local>
 <9441c96a-33fe-19d4-4228-54a8f4ea413a@windriver.com>
 <20230719092014d84e04f9@mail.local>
 <5ef0c81123f4abb3be2234cd8598cfa0a4cffea5.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <5ef0c81123f4abb3be2234cd8598cfa0a4cffea5.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0179.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::35) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|SA3PR11MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 47456dcb-d0e2-47ee-b725-08db883c2818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sPxfN23pwn+xK+cL00XoetxBZ2IEOj7j6aK5wMzcbUxZfOQaztXnjmj60S0AzDPjnLTkQKBlkq8QKGJOjeeVvTZOsTqKMtCafps1MV7SmAfMoo45hAzFkQRyrOpBIdhtMvwna3cWSuJiWTTObLFC22lhJQqxVnKgK1dMUS8mcx7quvdNC37YIcW1tTWlxq2xrXjoT1Cll0aMUYqvFUwOc1UHBBbsHCiM+XwBt3bgJIpmEk/1aTyYnPr61Y9mt6lGncgh++Dk4uja3vhArPpFP4jKGh4w9l1AhQMZ+zrb2JsPw25Bnk17Hrqmk11Jw+x7DfpIa3bfie17T3MA38K6g9F14NrNoLDJHFqKFOv1KXbNICAQNJ3I7hDfJf8RtkUG5Zk033u7FaklZBYCkzLmUTy9c3y4kdiNwGlc1wEDkg1OhImwVI7a6RNtNKXnH3oX1TUklEdnVDNFzzWRrE34ZIOzTgVwjJw+cLwMoV2Ubbky3NLwKxUf/0CS8j0CZ2rtWPe/iERIBPcdASOj554p5xKU0K53AtfVX2mceX1TLQFoMqR2Io/zci1NLMjgfvgIT98CMJdWay7UjHl7RqUvUteOUbFLnF01nXbfA9ketyjmjAXC22p9XOZvg1D0RKo52+eYXuKb33Krj8p2Y7Mn6A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(366004)(346002)(39850400004)(396003)(451199021)(8936002)(8676002)(41300700001)(478600001)(2906002)(66946007)(66556008)(4326008)(66476007)(31686004)(316002)(5660300002)(38100700002)(83380400001)(6506007)(6486002)(31696002)(36756003)(186003)(2616005)(86362001)(6666004)(26005)(966005)(53546011)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VlhrRG15YmpYS3J1cGFGSzVBY1RlMXJ4NWtxZlZ0QmwvVFgvd2pnMFZUNHpZ?=
 =?utf-8?B?YTBtMHgvUFU5NFhreVFvRWdHZmx2Y3VBUS9SVi9EOXlLdHVCWVZrNlpIR1dI?=
 =?utf-8?B?V0N5N1VadFZTeE9wZHRMaTVDSkQrc3V1b0hZS1N6RW54TlBkSWlGdloyZHN0?=
 =?utf-8?B?SzY3SlpxTlJxSDNVRVJzUkx3VUgvUTQzKzE1OU5rcUo0VStLdU9aMnQrLzNU?=
 =?utf-8?B?VnQrVytwRXVLNlFDRTZ2UktvWktubmhwcDZkWlNOL1FncHNKczJOY0puTkVh?=
 =?utf-8?B?eU1sZy9sZ1puajUreXdkMFN1OHV1a2RWWjRQajE5aDBzT25KeWxWUXhKZUp6?=
 =?utf-8?B?ZGdQR05IWnR3R1JHa0g4bGFlZEhBZ0Q2bEhnc0tVRWpUQlV5NThxQm0zbHdp?=
 =?utf-8?B?NXRxM3haUFY3RmZNV0tqTmQ3SWJZQlVxOWVwRlFLUnNuUmsrR3NtSDZNZzVh?=
 =?utf-8?B?NmY2dmpCTjk2Q2t2dVBoWUR6cXk3dFNMZ1ZzUmUrR3FkdGpsUnZ6WTQxZDEv?=
 =?utf-8?B?YnI5R2MvamxRUCtjYzFFeFhhNjFuODFZVXQ3U2hwSmhKSERiUlF4YUwvSHNW?=
 =?utf-8?B?SDhYK3VTV1ZCSjUwTkNjbnAwdEtpSUw4SkxDS1RPbXkvZjVYYVhva0tScG9l?=
 =?utf-8?B?OW94SWN0WTZMaWN3M2RQSXpUQXhaNXVBVU1Zd0xvRmhYODg2MEV2NFVyaHdj?=
 =?utf-8?B?MjhNYnQ1V3Zxb1NtbXMyeGRtemNmTzNrMnRCS2hDN2xweEpOU1dreUY1YjBY?=
 =?utf-8?B?SVB0eHhkY2ZRUDA2NGF1ajZwSUNpVWVPWkpTa3lSN3RGeGwzTTZVZlI1SmNh?=
 =?utf-8?B?TXhNS2xyckhWb3Rsbk1YUzBGS0IxekF5OVIrU0Z4V0U1aFlWTDRXMDJ2WnBB?=
 =?utf-8?B?QjdvdVF1aWpQWFpvMElJV0ZrOTJ0TWJyTTZZWWQ4U01jWlBrL1pHMmtDOWtL?=
 =?utf-8?B?MzFpQzNQMjdwemNwQ3JSUUNjL0ZwVTNpVGlweFZCZGNuRWl0UVhiYjFMQ1FR?=
 =?utf-8?B?VGE0YXpnWlFyOHZEVEgxaGZmRFpyOVhPdW41LzgxQkxDOXlBRTFnNWZPSEJZ?=
 =?utf-8?B?amh4WGlvRnl0bDY2UGFuZzJ5dXF0a2lMWXlOdWg2bjdEdk1na25NcUZzVXBS?=
 =?utf-8?B?Y2dGKy9kV1NYYUp3THlWT2p6OEo3eFl5d0NTb1p6dmF5TG9EVXQ5SWMrQlFi?=
 =?utf-8?B?UVJJdURRRndHVzA5OGRlTGJsQ05RZGgrTVZBNjF2elVROVpSU3hQVjg3b3JR?=
 =?utf-8?B?Si8wQUYxSjdlekFGVi8zTk5pZzRjcXkzeEdoNUNqb3piU0xKclhMUU44ZVJi?=
 =?utf-8?B?MGFUNnVmd29qNjJVZXViaUpKS3lJL21MTW5jNU9KOTB5bHBiVFAxYU9Xemw2?=
 =?utf-8?B?cXc3eWdYVE1keE85ZGlVN0dsQm9wR0o4L0pOcFo0K082NjVXVjZncy9YdUx5?=
 =?utf-8?B?T1JBUTYxd0Jad1ppWHcxNHJMbEZiZXFtMHlTYlBWZlNQeDVMY0NzK2FCOWhF?=
 =?utf-8?B?ZitOREdZZThMNmZ6Y1FHbnVHa3NOUUlmNUhHY3JEM1BPNXNzNFRRMkc0VW4w?=
 =?utf-8?B?VU1EeFdKZTZUMFROSURLdi9FcFlWQ1hRUWpSVFdVV3BORy9Ta1pTMXlZTjFH?=
 =?utf-8?B?My9RNEh3alJlbVFlY2NjN3A1NWUvMDV5Um0zODVkOTZrWW5QRkVDRXk0dEVx?=
 =?utf-8?B?L0R3a2VZOXhUTldLamwrWDI0ZG40dldmU0lDMGNudmh0cElDZndMWVlpRGRF?=
 =?utf-8?B?M29LdUlOaEVYMWMzWklNVmJockI0THFSczFNR2RmUWVhZHFCVVNUVlh4cG5V?=
 =?utf-8?B?eUVBaDJTcUhybXJzQW9rWlBvWnE5NGQrVGxLakVRWCt0ZE4yc1p4R2FjSlhy?=
 =?utf-8?B?UHp4S3EzbTJybzBiZWF1YTVFV1FLalJHaXNHaFpjWldmdzZQbW55dGZ4T2Ni?=
 =?utf-8?B?LzVOS2kyeXVHOHREek56QVdyYTlYejJUdkI4NE9oTld1dExYdVVnOElBWWJG?=
 =?utf-8?B?Wm9LTUVMTVRYcWZ2UDk2Q3lsWjZGeWxET0RZaHcrSlJZNEtBV3R6QlRFRnlh?=
 =?utf-8?B?eUlMMTdWbjcrS25qVHlCTTdCYWZQL0t5YjBTNlRTZ21TdGt2aVEyRitLOUJX?=
 =?utf-8?Q?TfiBFjNuH8XPjd0g9F5Kar2GI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47456dcb-d0e2-47ee-b725-08db883c2818
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 09:40:15.7545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XIgpptsfxAFKoseJwKABQZTsc7xwlNuMj25JkbeRIVwsBUIE+Oaiasjrg3/uuA1Ouj1hA2g47WJHZUf8mZpuZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7528
X-Proofpoint-GUID: niki_3c8BiamSsFFF1iiVy1UD9SQyoG4
X-Proofpoint-ORIG-GUID: FBZcX8Ec28TyT-uMWhGnZT3Qx9h4kTI1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_06,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307190087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 09:40:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184573

Hi Richard and Ross,

On 7/19/23 17:24, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> On Wed, 2023-07-19 at 11:20 +0200, Alexandre Belloni via
> lists.openembedded.org wrote:
>> On 19/07/2023 17:10:37+0800, Yu, Mingli wrote:
>>> Hi Alex,
>>>
>>> On 7/17/23 20:46, Alexandre Belloni wrote:
>>>> CAUTION: This email comes from a non Wind River email account!
>>>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>>
>>>> On 17/07/2023 15:10:35+0800, Yu, Mingli wrote:
>>>>> Hi Alex,
>>>>>
>>>>> On 7/16/23 19:47, Alexandre Belloni wrote:
>>>>>> CAUTION: This email comes from a non Wind River email account!
>>>>>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>>>>
>>>>>> Hello,
>>>>>>
>>>>>> This causes the following meta-mingw error on the AB:
>>>>>>
>>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/7501/steps/12/logs/stdio
>>>>>
>>>>> I didn't find the core-image-mingw-sdktest recipe which I noticed in the
>>>>> above log, so I cannot reproduce the issue as you mentioned.
>>>>
>>>> As stated above, this is part of meta-mingw:
>>>>
>>>> https://git.yoctoproject.org/meta-mingw/tree/recipes-core/images?h=master-next
>>>
>>> Thanks for your pointer!
>>>
>>> BTW, the below error which in https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/7501/steps/12/logs/stdio
>>> seems irrelevant to the added nativesdk dependency though I have removed the
>>> nativesdk dependency in https://patchwork.yoctoproject.org/project/oe-core/patch/20230717071114.2734859-1-mingli.yu@eng.windriver.com/.
>>>
>>>> /home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-ncurses/6.4-r0/recipe-sysroot-native/usr/bin/i686-w64-mingw32/../../libexec/i686-w64-mingw32/gcc/i686-w64-mingw32/13.1.1/ld:
>>> ../obj_s/lib_kernel.o:lib_kernel.c:(.text+0x5c): undefined reference to
>>> `_nc_mingw_tcflush'
>>>> /home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-ncurses/6.4-r0/recipe-sysroot-native/usr/bin/i686-w64-mingw32/../../libexec/i686-w64-mingw32/gcc/i686-w64-mingw32/13.1.1/ld:
>>> ../obj_s/lib_ttyflags.o:lib_ttyflags.c:(.text+0x2c): undefined reference to
>>> `_nc_mingw_tcgetattr'
>>>> /home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-ncurses/6.4-r0/recipe-sysroot-native/usr/bin/i686-w64-mingw32/../../libexec/i686-w64-mingw32/gcc/i686-w64-mingw32/13.1.1/ld:
>>> ../obj_s/lib_ttyflags.o:lib_ttyflags.c:(.text+0xbb): undefined reference to
>>> `_nc_mingw_tcsetattr'
>>>
>>
>> It is relevant, this is because of the dependency that this gets built
>> and fails. I've seen v4 but didn't have the time to test it yet.
> 
> I've still not seen an answer to Ross' question or mine about why we
> can't just add a couple of dependencies and resolve things that way.

Sorry for delayed respond!

Have added qemu-common to make qemu as meta package to keep backward 
compatibility. For user who install qemu rpm such as 
qemu-7.2.0-r0.corei7_64.rpm, it still pull in all of things as before. 
For user who cares the rpm size, can just choose to install the needed 
qemu arch rpms such as qemu-system-aarch64-7.2.0-r0.corei7_64.rpm.

Thanks,

> 
> Cheers,
> 
> Richard

