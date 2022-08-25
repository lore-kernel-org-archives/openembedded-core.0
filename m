Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46399ECAA24
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 19:11:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.28158.1661454698078689088
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 12:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ClgHWOBt;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5236f2e612=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27PILY6O021295
	for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 12:11:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=hZBuV4oApQzKZWY7NISnWnYujpxX1tGtfBTb0FYTSiU=;
 b=ClgHWOBtUcEm+cvLMgOp+rdtm/SBWSZdmbeTwen86cuHw6B7m40H7S2eVWeJ6tn4wKq7
 VxCQJWYuFl78uGUr2VHX3zWp308QF2MsTL1vZJDflzAZ5tBh39z4HUQnbLt7ExJxxWeN
 L6TS5zjGtQ/VLacHvPlBjQe/8Q0kULxm8cNDvjJyngKGTLkbSG4mmg9XDvQbJtPPlLyg
 sSeFqeNibTXhbSWmB3NDb7kL/YWb+eTkziEn4cboJEzAZXu2xvoMUjuiUsUvTbL7IRZC
 +6CDAgCLp0XXCMdeeujNA4ajenm9uKcX9xN1QitJqBrrR6rEMca2JzB8ff1WxtGQUZNm Qg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j53rvj2mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 12:11:37 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27PJBbkj003906
	for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 12:11:37 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j53rvj2ms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Aug 2022 12:11:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNSZ0WWTmxSH/lg0XIH/ekR7aAqQolUTqKWg9MmHSWH1YScc0CNmphgVPxkab12M3kNypclT6DUOF0pKraoZULRh78RSA0hKau0S3qQMyj8wDEPPw2iMwXUw54/fe+WMczoD33/ihpQsL0OSRNafXxS2xvWtNhBsvq1+dzKPl2RAKBcP6+gaggoEhunxrxJ5aKREocI/sbFhXc2L34/sl66i/qn3+Na4bKhcBLLypmyyzeBbeXYJZ3I+r+4hAsU6Mr/YdEy6Y/TNWze1LWOTZwtCf2QAiTSJqnRfQffyyYGVsmwFuvl7C/UOyMrSymxntnG+tjW4cC+ouWNZXlizAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZBuV4oApQzKZWY7NISnWnYujpxX1tGtfBTb0FYTSiU=;
 b=AmIrzToGFsdbPKgBOCLaltarD9NO429yRBV5PXPrg6dKcDzt7ZonFPFcEXwxic9dMFWCnuv+VrNTOFgZaBBDpEgAn4nq6d5x584KGscbt/CpMQSDpTIX+KB+SNxEZzWbZSyO2HqXVGmtLyCwZ47xokkoq+UCEAW1YluyaWqmQpdaJRVZ9WKRFNi2tx1yRRR4/8nD6y4sW5R1BJODH0CzqFM6XeXFtfzPjVFTYlVD1dTOPzugz5vEW/DzGKN79X3MXbtpeWuYNJG/5oemmsz2IQry4C7TbBBBrd2yQKRqHMOfy2Zx1qf6IwE8Dln1ciQFBPSLvEd85XCSE/UdvfTA/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BL1PR11MB5270.namprd11.prod.outlook.com (2603:10b6:208:313::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 19:11:34 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060%5]) with mapi id 15.20.5546.022; Thu, 25 Aug 2022
 19:11:34 +0000
Message-ID: <9b77dad2-3e98-02db-d248-822bc8b3e138@windriver.com>
Date: Thu, 25 Aug 2022 15:11:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH 1/3] rust: Fix crossbeam-utils for arches
 without atomics
Content-Language: en-CA
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20220825104851.3258387-1-richard.purdie@linuxfoundation.org>
 <CANNYZj_7Eroqgrf0bJr9ubDWEogOekWm3gYMUxUEO6ERrzBS4g@mail.gmail.com>
 <6eac7847f432cc60d66c9afba010308818bbbb46.camel@linuxfoundation.org>
 <CANNYZj91fDezS+i1tdX7zZ1B6M_roVgn3wh5gHyNzkj=rn-BFw@mail.gmail.com>
 <0e3c6ff17930e446338e75dc4bf6f6d4bf53c166.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <0e3c6ff17930e446338e75dc4bf6f6d4bf53c166.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0060.namprd07.prod.outlook.com
 (2603:10b6:a03:60::37) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57d24d26-0316-4493-266c-08da86cda081
X-MS-TrafficTypeDiagnostic: BL1PR11MB5270:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7PelJBJR+bYCpNxOayV95/De3uIUqPF5WQ8pBoxOpxhwpEgwckrsf4euVq0AI5fFb6GqTTqfCpL6OJ+HKidAZ+LlPe0Cy1h6Q4WvbRDWpm2wfBbYFFZO4R1RbS2JZzTh5AO0w/m+pLnabf6C3VzKXoqUFv+VrIfmFyuwOP+HM4dab5KFVfcK+Tocysboz7kFp2X5MOpBQbRPCf8BltxGGnaWNhvSxfwO9BfZjr+a79efuE/BaKxkLHUQGKXdbOFrw9vc3imrUnU0b3xNaqdZY7jDP0X7/XL+f1Zfhka+v9s91RtexUyZ1NnVJzKPdkSetY1GT5rqi037oXly/+Nf4S4aZkwplvJYiRPnnu7q1zcD7n1IHRGAgCmRrQZ4muYYB3diCbVomogI2R54fMV1wdf7/v4cPVcEnuqZY3Rm5FLNw3rqI2xY3Iy7q+we4Si6ZxdEp8bc4gYMPgQ0AYGJ5JZgAW3gqiGo7be15J3VoGNNPhHmCg90ajSNAAPsZRHehQAQVSSjSFyFMSXElsEflpUGqb+h+xKVzyXp0yBYDitACfwPaz722Jt0ojXxkS6XzUh+pDe3nFSCd7DDScBHYxWOlpN8j5zcNVw2JGtVsJh0oA4dW14dt4E1En9YKXw1jmaYBBAW+z8jp99niIA/BRrGjyoohpoBoOVv5Y9/tIZuFvzD/B4IfapLCnGGGHn24whOzvJiBCl1yf9kiM1ye0dyG0ZME0RMuNQ84uKIhrey4YF2gq55oz1chkt1HYzNCQ0xpWZKuDNfQchFC8bn6b1hOFk7vfFhQOgbnjaAoV3HT+1U8X9LP7dew/2VkT1wqWJ4/hO8kr+egoMVCY4nNmrh1fpwuckZPgVkEa9X86KsUmvEWy6/gEGd/rLSOfD47K5gtKnPmWELG98WbT80rQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(136003)(376002)(396003)(366004)(346002)(6506007)(2906002)(6512007)(83380400001)(52116002)(186003)(2616005)(53546011)(31696002)(86362001)(26005)(66476007)(66556008)(38350700002)(38100700002)(8676002)(966005)(66946007)(4326008)(6486002)(478600001)(8936002)(5660300002)(31686004)(316002)(36756003)(110136005)(41300700001)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZThoVVhoOS9pVXo2QmxGNDQ0b3ZWeFZzdXRMbVRTU1U4c3dQYUg2bjZDQStk?=
 =?utf-8?B?M1U2dm1GR1JwMXFuSFNzZEl1a0dJUjJvWEhKVkRRV05PakVvcE5Sd1paZHMx?=
 =?utf-8?B?a0diZGt0WjhsWjFBTG5ROHBxZ3dNNHZzZEdpNWk0NDBQeHNSR2I1dEw2N1R2?=
 =?utf-8?B?b3dRb25tNkNmd09qSnBQM2tmNUJjQU5oVnFQSmZQdHIxNmI5WWMzK0cvYmhx?=
 =?utf-8?B?eVZLVmtnUUxSQStuVlAxVXlWZGhLYkhNNERpSHNKTnZHSW82UHRjNjA5Q3Fa?=
 =?utf-8?B?aFA3bFFXQTcwRmQ1R004QUVXNjYyRW13bXY4TjdEYUxVZ3k0WUpnczQ0RE5O?=
 =?utf-8?B?UzNIN0IwT1J1Qkw1OVVVSE52REFNKzVWZ0FZUFkyRFRlZlZJRmtVNEVtYUt3?=
 =?utf-8?B?SHdGL1QxTS9nMDNpQlkzZG5nS3o3M21VcnZNK2VuWWZZLzAwYWg1ZDg5UFRF?=
 =?utf-8?B?cmlqREZyYkxoVWlSdUllUVp2ZFJBdm4xUzJ3TnV2aGI5bHB2MzBSTmRXMXFX?=
 =?utf-8?B?OFFKcG4xUlRoQzljQUExVmpGWlIwd3gyRzk2OHQ4WHFwOWtmTHZleDQwSXA0?=
 =?utf-8?B?aVBUcnVUV2NYQTNYZ0xuR081RjVlejBDWm9tV0c1OFZObnV4aExROER3ZE53?=
 =?utf-8?B?VGMxTHdyTkN5TGFta0F0T1oyOHJ1MEUxZCtWQ1gyMjVrZlp2bURKUVc0a1hU?=
 =?utf-8?B?WTY1R0IxSmRSMktFUFNqc3VrWE1uUzluREE4TFlpSlhlTVhldHN4NXpxcUZ3?=
 =?utf-8?B?dk1LTzF0aVh1NGswci9scFM3V2tsc0VHWE05STlvQWNnRzV1UndDa2dPY2VR?=
 =?utf-8?B?T2F6anQyeUxsdzkrTG90T1BjMERFWjNKSW12dlc2SFd6OGRUWmJoQnp2aDlr?=
 =?utf-8?B?cjZtc3h4bGhOVCtJQzNEV3FyaGxrR3R6czgvTDlQcndnMWVBMmFxNjlJcTRW?=
 =?utf-8?B?TFBTbW5nR21qR0VZTnhyMGRWazE3bEJRdzdMV1V3RFE5ZlZuSTFTRTVWVDdT?=
 =?utf-8?B?WHZtSlBVSWlHTUh0SUIvQmJYRVZ4cDBUS2Y4cUR5OUQwZDRvK1JPV1hBRVR6?=
 =?utf-8?B?TGFpTFpPSHFGWmpLTWFBNldOckkzd20yWFlTZ0dRR0VsellTU0pxeTZUWWsr?=
 =?utf-8?B?SkQ4K3d1L2JDaU5BYVdieWRzSGNqNkVjcndqNkFzU0FxeUVydlNCU1pDekh3?=
 =?utf-8?B?NEtZTjNaTVlpckpFVmdGNG9oMjFlZjUwbjRrSXVFTjFDV0Q4M3J6Z0d6b2w5?=
 =?utf-8?B?aC9VN2JJem9GMzk3NXFVd0dwMDNWQnFyRDFEWElGK1hxVkJjSmhVQmtjN1hB?=
 =?utf-8?B?eG1YZmV0NndnYy9qRndYa3psTGdLNjNuZXJHZjB6Y1VjclRDdi93NW92dngy?=
 =?utf-8?B?cXdmUXZ0cDdjZC9KZ2hJVDY2ZFRMV1NkUDJBVmV6amt6Qk5ubWJ0SGJkQkph?=
 =?utf-8?B?ZlZOVFg2enhJWS8wT2RlQnYvd3BMcTYzQzVqSEd1ZjJJRUtvUFdHMm43Z005?=
 =?utf-8?B?djFRMmM3L25sd2pNMzNXdFliaS9CcGlEZGpRMjBaL3dGTEYrMm5YczVRa2dY?=
 =?utf-8?B?ZXcyU0N1SzdTOGNYVENSRWVtLytTZ2g0M1d3YzZBMDBCUHVXYVY4WXhsRGxY?=
 =?utf-8?B?czk4d2hpVWl6Q2tTcEFQNDBVM3pXajdQUWNwSVlVdGgyOTEveGtkcmlpcWpE?=
 =?utf-8?B?UTV6dEtSMEhCTVRDU251cElVdVVhYlgyWml3UHRwdE1GOHUyaGdCNkE2SzB5?=
 =?utf-8?B?NlFyVVlTcm9GbjZ4VWRhSEtkRmdNc3czNVNzT250L0xCZ0FXOHZsc3ZjQWxX?=
 =?utf-8?B?dWVjcXFiRnNWVkVHam54NTBWWFY0azNmTTQzOXJaYUs2OWRoVHI5SjZjeXNW?=
 =?utf-8?B?enN1cUxHckM5ZW83WGhMSDZzMmJpZVBKSldqTWZIWEZvTCtMc1VHaVlHYnBa?=
 =?utf-8?B?ZjlhNWc1aENJUExuaGphV0xBYjZtZFJUK1Frdm42UWxZTUN4KzBJNTl3TlB0?=
 =?utf-8?B?N001eDFvQnRpQ3V5RldRUFp0KytGcGtpeTlkb0dwZFMrclN3YUo2eTBFcUd1?=
 =?utf-8?B?elBxdE13K2NJeHlvdTI4S1BVNGhyQUZmeFVwaUZHSEhaYlFkSUljVkZsNFhG?=
 =?utf-8?B?emJIQkZZME5iMWNGaWUxWFZ4Y3pjbkhjT0lqeER2dzZVZkw2YXNiSVU0L21S?=
 =?utf-8?B?OUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 57d24d26-0316-4493-266c-08da86cda081
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 19:11:34.7301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oH4EssAS4lq7j7KI3x+9JQr6efqUaq3Cl79l2dUlVN3DclHeAzdX/DDlO42DyovC904eeWJmgneKdxR+PxB2C+66H+BPD3g5hOM5G0SaK+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5270
X-Proofpoint-GUID: CCGttom_BqaUaaYQSzGq6B83r9YRzTdb
X-Proofpoint-ORIG-GUID: rr43i31Otfjq3XdTuW6sMtBXvaRi9HRh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_08,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208250073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 19:11:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169885

On 2022-08-25 07:53, Richard Purdie wrote:
> On Thu, 2022-08-25 at 13:04 +0200, Alexander Kanavin wrote:
>> On Thu, 25 Aug 2022 at 12:59, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> The usptreamable version of the patch would probably be something which
>>> splits the target names in no_atomics up into components and matched on
>>> subsections of it rather than the whole string. My rust isn't really up
>>> to doing that though.
>>>
>>> I didn't really want us to maintain a separate list of targets which
>>> have atomics issues given it and the list in no_atomics would get out
>>> of sync very easily too.
>> But then the same patch needs to be applied to (and maintained
>> separately in) librsvg - and everything else that includes a copy of
>> crossbeam. Perhaps it's worth to at least make the above suggestion
>> about making it upstreamable in the patch commit message?
> Yes, I can improve the patch header. I do understand the patch isn't
> ideal.
>
> The alternatives are:
>
> * we take my patch
> * we break powerpc, mips, armv5, riscv32 and others
> * we drop the rust upgrades (the latent problem still exists)
> * we rewrite the patch
>
> For me to rewrite the patch, I'll need to learn more rust. I'm sure I
> can do that but it will take time and that time is time I can't use for
> other things.
>
> I'm hoping that by explaining the issue and documenting it, *someone*
> would step up and work out the upstreamable patch. This hasn't worked
> well for the rust recipes so far as I've had to do a lot of work to get
> them more into shape. I'm hoping the problem was just the shear scale
> and now issues are in easier smaller pieces others can/will help. It
> will certainly be time before someone else can schedule that in, we
> don't have anyone who can do it now.

Yes, with the range of things I have had going on, re-writing the
rust classes/recipes was too big a task to consider. However, I can
and will work to get this patch into a form that is upstreamable.

I've created a bug to track that:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14904

and at least started to look at some of the code!

../Randy


>
> I will say that I'm really really tired.
>
> I have a ton of autobuilder failures and in order to resolve them I'm
> rewriting patches many times over, first to get them to work, then
> taking review feedback and people complaining they're not perfect or
> don't fix other issues. I have a pile of other problems like this.
>
> I appreciate the desire not to have patches, particularly when they're
> as painful as the rust ones are. I appreciate the patch can be improved
> and should go upstream. I was hoping to take some time off tomorrow but
> it looks like I have other things to do (in reality probably on the
> weekend, I need to rework the llvm patches too and both sets take hours
> in rebuild time even to test).
>
> Cheers,
>
> Richard
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169852): https://lists.openembedded.org/g/openembedded-core/message/169852
> Mute This Topic: https://lists.openembedded.org/mt/93245408/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux


