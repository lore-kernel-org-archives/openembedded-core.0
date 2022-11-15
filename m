Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C716AC433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 00:52:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.377.1668473535222458333
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 16:52:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8318f3f37c=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AF08BBD014751
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 16:52:14 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kt7n99v6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 16:52:14 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AF0qEqZ019525
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 16:52:14 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kt7n99v6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 16:52:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5DVkvPuMO5b00GYU4r6aujBoO+pUU/FRWr5Cqcrq8u8kWqCf9b7hoknrfJHQ46DCDPR+G9FGov1VVXffjAs+JYh70jZGsfaSSE34+M/5XUQ1rkiEiwXuEOSxAV+d/AXQ7fyN1b2p1tv6Pp23yMVU6SIteOAfaSEfHC+LSlfekpGWcenEoYc0a211ssYaRsmsdLsljgzOp1bA9CNH3IHw05GSwTfZWp7FPUejxgwZLi35BSdfWuqgICt/w4AFGACbdw62WKkXPe4XpNNmHIAJy+cSuMGcYUpg6RT9gup8llKQ7OF5dJkC8uB9Ytdgm94jXj0/UiPAXJQCRUQTboTTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0C2MjoMoiwJFfeJpWvveMWkB4CCLrmaUSAm4spnip0=;
 b=V5G8PmHAQN+xJf9EhqZ57bKwji+aK15rM3JBL88IRUG6IEfqJ9co9TqAj5z1Qop6ti0vL28/xzIbmWi0lXfwbsFKFsx3aDFrXKB3GlJ/IHdB3WACHAj9MXmvwRgALcUIN1V68EwoflbpwR/2h4PPkiEDyA1pxitlXO7KaNxJ1U0PpMrVVGSnDUv+GZ+LEZFjYhpYKwdh73vc66AXxhxwzpOaSBvSxQOWoEyaURQiiISfT2GsLglDRpiR0Y1qb5h8egcdvO84gFO3Vw0TjcduAyE2jayWA+PZ9FgKIvPYsFpfKGQQMMtoUhbNu/2gltl95hyVAxz/jyqy2tAniBPo9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SA1PR11MB5898.namprd11.prod.outlook.com (2603:10b6:806:229::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 00:52:10 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 00:52:10 +0000
Message-ID: <720407dc-ec90-1406-a9ab-ca9e4927101e@windriver.com>
Date: Tue, 15 Nov 2022 08:52:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-Core][kirkstone][PATCH] lttng-tools: Upgrade 2.13.4 -> 2.13.8
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
References: <20221109011421.1257186-1-xiangyu.chen@eng.windriver.com>
 <CAOSpxdZBZdKoE-vZaz4fZoSz03ToKn-AQcEGF1G6rLgVAPF5YQ@mail.gmail.com>
 <0af62566-0fd0-e862-c3b5-401a17fa168e@windriver.com>
 <CAOSpxdY1qjAgBAZBg_ejaU3txfBtptFmkgqKMcdW0RaGjo9c7A@mail.gmail.com>
From: xiangyu.chen@eng.windriver.com
In-Reply-To: <CAOSpxdY1qjAgBAZBg_ejaU3txfBtptFmkgqKMcdW0RaGjo9c7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2PR03CA0003.apcprd03.prod.outlook.com
 (2603:1096:100:55::15) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SA1PR11MB5898:EE_
X-MS-Office365-Filtering-Correlation-Id: cf6f9da4-4750-41e0-bb26-08dac6a3a05a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gZYQKZYuWEiq1FwHKj2ZtlVwiArxlzodC9srw34tVmbqWWIz1AC4Mc5XBNCBsmX4ZGOf4dlJjS9kLmvfGY7CvXJOXte32lavIo/hILShgUiSqbscc4fah+P2H2KzoEdsyy3ocQWQwM/gIkGN0OHIt1aHzAtlKK8/lFbXHN2aNaNnDCdEp4oMVX0sfr8Kj8KohOJHWWCe+G684rHVf1EzME+bmZfVEe2B0i749tIXDKv3gGcj+yTegtWkismtMEk2sEg95MoJAoyFcLsTSp0oekXUzfgIjMi+g2KZo/COhT1iiv7o9guL0SNjgeU1ptfP92hCkI5O7FBGhSAco94wKQsIUoPxGFr0986GI+Y4/h8kGv9Ff7QBYUXcCgAbFyPNtfJaTpfTgVL0Tgx0S696V0R9xnrpZOJj1fr3+9cXo1IyYmpRMzxpMJ629AaQEbT0ohCKkGyw7A0vC+FxCq2q0XH5u+6kshweqLRHIVebl0txA0NNRe+mVjmmZj4HKyyMSDcXS+GeL5cwY8UcKDPEFB4GtUQvhYTH6AiA3q6dXQ4QwiDoGXpElzpHwjJ8phWnmtHYNEBy0u6Q2HiZc8++emJxUZlsIPApI3Nn5cVAg4iP6EtiV9+7FzPtg5eDCDuZjMJI1DEEPEeGatt2fQKtPpej7vKyzhoxvI+6BEPYAfsEVg6xPQV0gRoDLdA2NAPFogTWm8POvJnDR9zB7FbVynE8F5G9SOO5HOkKE37ZBSkW0H10jvZVAJNe3RQna/0b++8mFfUYc7FdmG9hP+kFp1loUoTuEq2BDg+zt92I9J2q870V01nLmPLot+CwzFjr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(396003)(39850400004)(376002)(451199015)(31686004)(5660300002)(966005)(8936002)(66899015)(2906002)(36756003)(66946007)(8676002)(316002)(6916009)(31696002)(83170400001)(6512007)(6506007)(41300700001)(6486002)(26005)(478600001)(4326008)(6666004)(9686003)(53546011)(83380400001)(186003)(38100700002)(66556008)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VHh4elhBbkdKTXVRSi9oa3JLMEFBZEJSS1UxdU04U3R5Tis3c1AzN2N0Q2lz?=
 =?utf-8?B?SGxEbVZkRTRRRHJRMXpubGFOenc2V0hCQ0EvekxxQVNGdllhK2kxVG9iRHFy?=
 =?utf-8?B?ZUZyQXdkMkRrVWhKWFhnSk9pS1BJS1NhdW9ES3BETVVEZHROakNtYThYSW9y?=
 =?utf-8?B?ZUJmY2hzaHVDcnN6djJYSkFLKzQyZ0hMT1BrTm4yUTRINjVxRmV5SzJoQ1Bq?=
 =?utf-8?B?cHhpRGUrTDVUSUxwQUlDbmY5dTlBTXRFZytybThaMnAzcXJJc0VmVU1zemhm?=
 =?utf-8?B?RVRWMkEwbXJDS1Q4SStZdDB4RVlvWWZtQzFwSGdIZ1E5Y3hrTVZ0bS9RcjAy?=
 =?utf-8?B?YkhEQ3BzNXdDNWtobWRFMWs0TUxJaThBRzFta3VwY0h2SjlBd1lHZlRzNmtW?=
 =?utf-8?B?em1xQXJlRDRTdzZHamhkY1AzU0xWOFEwZWptZ2VWeHBlUlU3NXNZckxpOFFL?=
 =?utf-8?B?azZVaVFnT1BTWWpiL3BabVpScktnaVRmNTBjaHplUzdCYWJtaEhlZjQrRlFo?=
 =?utf-8?B?Y3JGb3Y0eVJrTkMrc0lqUXZlNmlCK2p0cHMwUnRvY0o1a0VydEdNd2w2Vkg5?=
 =?utf-8?B?b09aN09qQ0h4T1ZnZGt5ZzVxdTlBK2JaVEduNnJESmt2YVVWaTFyRklKOWdz?=
 =?utf-8?B?QW93K3drTFFpMk44SEtZc3F3NmVsNENoa0ZtZE43c3RPZUdBU0FKeVBnMGNE?=
 =?utf-8?B?ckFnWGRGUlN4RDZ2OHA1NE1vNlFmT0xaSW1KUUdkTC94RzlucjZ3a2RZVFNE?=
 =?utf-8?B?VUR4c1VmNkIxZzlXaE1FMncyQ2xtS2IzcGdFNDVkNFdGRzVSVTZjRU5LNmVI?=
 =?utf-8?B?Vm8xU0FnN0ZFUVNRVFRrZVN1WmNtSE1xdzJ5d0xZNUx0OVBQN1JNZjNpcDBK?=
 =?utf-8?B?MWlPeWpIT1BiaTJNZHpGMHk0Ky94NkdWdkJlQ1NSYUlHMFlja0VwL2lBd1lQ?=
 =?utf-8?B?NGJzdC9sNjc1b1BISXlRb251a2MvZzlDT2lTdjh3ME5aUk9HZFdOWmRJNmo5?=
 =?utf-8?B?QmJrVE9tNHQzOTdHOGo1RlBFRTlNYjJRbURqTzFUUmJOVkVWZFRadE0yRDh2?=
 =?utf-8?B?c0g3TG9pNTlBcGpwVTJQdlRCcERDK2xJa1grelRsZ2RWbUhkbjRmQitPUVRF?=
 =?utf-8?B?T0t6dlBEOW5tVUJPbGt1eGFNWDJqMTFBK1UwcllNYTV5VVZCVDNMOUk5RktO?=
 =?utf-8?B?RjNTODNUNGNqa2lYbHVjV0RWME1VU1V3ckd1REdQcUVSbDdXSEQ4aEduM2VC?=
 =?utf-8?B?ZkhTY2IxZVBEdEZDNkRTU2w2M3BJeS9JUFBXYy9MVUU0d1hCWWYvRHhLVCs5?=
 =?utf-8?B?RkF5ZWdTMmIyRmtFbFYzSDN6SUxiS3UyRGRHSjJsaVdweXFRQmxJVUVwODAw?=
 =?utf-8?B?aDcyS1BMc09MQ2FkdVRaMi9URnZhMnVUVDU3Um5YcVM3QVBoNllGdTlwT25o?=
 =?utf-8?B?UlVGUnY5WnFsZ25Cc0plc2NJcXQxWHdFMkRVdEFMLzBLTUNLMTFETjBKWTZs?=
 =?utf-8?B?eElFNjZNWmhFWmM3M0F6NUsyMitGci9ybFNjQS9rTUVad3UxMVhaZU9GbGRU?=
 =?utf-8?B?cStWWU5oNk5uaFVEWHV0aENiMHp1Qm1HZkR0Y243S0tpQy9nUzdGaE9iODli?=
 =?utf-8?B?bWROOWlkVFlYWVhEaVZLSTN2c2x4S0prM3N6a1RHMkd3eVNvTzdTeGczMlFa?=
 =?utf-8?B?OGlPQ1JRcGhsTnFLdFlRVmwzUHlJT2M2WHJocy9NeDFjSmFUMWtOS3pvRENR?=
 =?utf-8?B?aEppNjIwNHp3d3FhVXZjYS9KNTRtTDNQT1grZGxZdkExb2x2UkU2ejF3TTJS?=
 =?utf-8?B?U1dySkVOKzFtQVJnRlBFR2syMlF1cmEveVdoaGo3Z1lBeWk4aHpXNUY3Y0xQ?=
 =?utf-8?B?V2ZqNER2cStNZVkweVoxQW5HejN6OWRtMFBYb2NQa2l4UlhFbTc1MHVFWlRY?=
 =?utf-8?B?Y0hxMXYxTU40cFU3ZzIvMHV2UWYyc3crd0hVaXp0TDJWWHBCTThoYzNxcjN4?=
 =?utf-8?B?TzFHc2x5MGorOUcrRWJ0VlNIT3VmNktUQUZ2eFZTdHdFQzZOYlk0R2pIMm5W?=
 =?utf-8?B?TW1VSWVNSHRxME91SVhLb2t3SW5iemNEajkwUWs4N0ZwQ3oxMGIyblpRcmlw?=
 =?utf-8?B?RllDbnhvemw4V2JoM0UrQTRnQnVCYTNLT0tpczFIUFIxMU00SzBWYUhOK0Vi?=
 =?utf-8?B?TXc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6f9da4-4750-41e0-bb26-08dac6a3a05a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 00:52:10.0803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cRCRYkVmeAKl0Ho9upxR7luygS0SE8f+MJGgpIMlccXUGHwZLYVItQU0dWDzFEty1TqLt+Q00nHoaU7+2OjlIKs8jYkaGUzANkYBRLElce4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5898
X-Proofpoint-ORIG-GUID: CsmxJUOy_VGxM0zmWjoOwgC2Q8IrsHgy
X-Proofpoint-GUID: pboh608I-Z4xKxVg74eFRCDsCF0ZoI53
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_15,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211150004
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 00:52:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173264


On 11/14/22 22:41, Steve Sakoman wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Sun, Nov 13, 2022 at 4:17 PM <xiangyu.chen@eng.windriver.com> wrote:
>>
>> On 11/11/22 22:34, Steve Sakoman wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>
>>> Master branch is currently at 2.13.7, so you will need to submit the
>>> version bump to 2.13.8 for master first.  I will then cherry-pick the
>>> version bumps to langdale and kirkstone.
>>>
>>> Thanks!
>>>
>>> Steve
>> Hi Steve,
>>
>>
>> The lttng-tools on master already upgraded to 2.13.8
>>
>> https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
> You are correct of course :-)  I was mistakenly looking at the version
> of lttng-modules when reviewing!
>
> I did try this lttng-tools update previously and encountered ptest issues:
>
> https://lists.openembedded.org/g/openembedded-core/message/172187
>
> If you could fix this I'd be able to take the patch.
>
> Thanks for your help!
>
> Steve

Hi Steve,

Yes, this commit contains the fix of ptest failures, I also did a simple 
test in my local setup, the ptest ran successfully ;p


Thanks,

Xiangyu

>>> On Tue, Nov 8, 2022 at 3:14 PM Xiangyu Chen
>>> <xiangyu.chen@eng.windriver.com> wrote:
>>>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>>>
>>>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>>>> ---
>>>>    .../{lttng-tools_2.13.4.bb => lttng-tools_2.13.8.bb}  | 11 +++++++++--
>>>>    1 file changed, 9 insertions(+), 2 deletions(-)
>>>>    rename meta/recipes-kernel/lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.8.bb} (90%)
>>>>
>>>> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
>>>> similarity index 90%
>>>> rename from meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
>>>> rename to meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
>>>> index 0ea4da05ce..a814eb79f9 100644
>>>> --- a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
>>>> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
>>>> @@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
>>>>               file://disable-tests.patch \
>>>>               "
>>>>
>>>> -SRC_URI[sha256sum] = "565f3102410a53d484f4c8ff517978f1dc59f67f9d16f872f4357f3ca12200f6"
>>>> +SRC_URI[sha256sum] = "b1e959579b260790930b20f3c7aa7cefb8a40e0de80d4a777c2bf78c6b353dc1"
>>>>
>>>>    inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
>>>>
>>>> @@ -113,7 +113,7 @@ do_install_ptest () {
>>>>            for f in $(find "${B}/tests/$d" -maxdepth 1 -executable -type f -printf '%P ') ; do
>>>>                cp ${B}/tests/$d/$f ${D}${PTEST_PATH}/tests/`dirname $d`/$f
>>>>                case $f in
>>>> -                *.so|userspace-probe-elf-binary)
>>>> +                *.so|userspace-probe-elf-*)
>>>>                        install -d ${D}${PTEST_PATH}/tests/$d/
>>>>                        ln -s  ../$f ${D}${PTEST_PATH}/tests/$d/$f
>>>>                        # Remove any rpath/runpath to pass QA check.
>>>> @@ -124,6 +124,7 @@ do_install_ptest () {
>>>>        done
>>>>
>>>>        chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/userspace-probe-elf-binary
>>>> +    chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/userspace-probe-elf-cxx-binary
>>>>        chrpath --delete ${D}${PTEST_PATH}/tests/regression/ust/ust-dl/libbar.so
>>>>        chrpath --delete ${D}${PTEST_PATH}/tests/regression/ust/ust-dl/libfoo.so
>>>>
>>>> @@ -185,4 +186,10 @@ do_install_ptest () {
>>>>    INHIBIT_PACKAGE_STRIP_FILES = "\
>>>>        ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/userspace-probe-elf-binary \
>>>>        ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/.libs/userspace-probe-elf-binary \
>>>> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/userspace-probe-elf-cxx-binary \
>>>> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/.libs/userspace-probe-elf-cxx-binary \
>>>> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events/gen-syscall-events \
>>>> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events/.libs/gen-syscall-events \
>>>> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events-callstack/gen-syscall-events-callstack \
>>>> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events-callstack/.libs/gen-syscall-events-callstack \
>>>>        "
>>>> --
>>>> 2.34.1
>>>>
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#173006): https://lists.openembedded.org/g/openembedded-core/message/173006
>>>> Mute This Topic: https://lists.openembedded.org/mt/94904524/3620601
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>

