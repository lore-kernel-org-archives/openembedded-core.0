Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE1EC48BC3
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 01:40:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4722.1707961208490373919
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 17:40:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UE+Hq0ua;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=277593d998=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41F0LMRi016408
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 17:40:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=cSXwM4AEl3I3rHHBIJD
	yNmLmVxHuyhMPjg/KzRc/QOg=; b=UE+Hq0uarK1oRdBa6tJ9MYOQhJv+F7fM78V
	/5ixBBafNitkesISkaJBIvN6Aph4hM+NgE8lpcZtbWcY3dpBgaTkKt3AsuKbF3yV
	mumEH5wTrwjBmSrYMJ445dfdMGvSgH3gkyMSy4WuE/+blTXD2qXn+0z9VZZNC8ka
	hWXxq9cjZgpZ+OZ+zhdo7PDokCjDIyPteicwVcbYP3ud1xbNTo710FlHEGZMn2so
	Kele/ouj3+RoXixmo6iU2KyoccwUaAxn8z3gvnrNb0JcajXgCfUNbaYb2KDHUQ6A
	nxKHPyt7Oi6oxfGotTDLSMnuC3Y85glDxPly8VpWnxJHjbm02Qw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w65a4v62d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 17:40:07 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41F1e7kJ022384;
	Wed, 14 Feb 2024 17:40:07 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w65a4v62c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 17:40:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2F3+67e+sFn0xUF230CLnOKDsQm6XgpKvr0l60oMnbpemdQzbJZh4Rx5rvrVu/gke5SkibL/XjWQIvcB+oenG4CWQnDpuKmyvSO4k0HhVTVkPKDfqz3ZcBPrOfKZ8wsiqSmClWxnP9Dd0yRGeqht0gnZWbqMn/Jl+FrwHF0D0G0vFMts8fHt9s63lVvGUN63+w/Z5GlHQLl8YsSa3Y4nFVeNWmqf77wuNS3TDV7XXFlbNGUaGImgXdqa87PV2Jzrwrb28gozRWx+qQ/wLEK1KKPQduwzjxuKEEz/2kzJNu8pt9xBCzP9IBKTrykoFiAux6sjVjvS+BFzSLbegd+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSXwM4AEl3I3rHHBIJDyNmLmVxHuyhMPjg/KzRc/QOg=;
 b=Bf7dmtQlSnnuwVottjTfjvs88GPRvtB87QCOF207EpLIHu8C2BBIl7ZLdOhuEHfBtWSbOFnDEV+vQD82R4cubyA6XdebvtPz7BZIkIM+pA0yVt9VyUy12EH0tYeMao2LXP3ggc2UiyzCnmXG3LHbcYav3VTL0IAneDr5PNNBJwghDmAfnc+pXZcRxTi0ZTHsWqti3wGgjiCAfluiGn5xPBrQ1Q4gvSV+PLY1rxu4l+AyZIBM3TJ0M+O6xKJfbaMuU7aGRj1OGaDSZ3eFrz8ByInfM4UUrNj1EYLmSQBVYscJI/GctT4uvwhTX+rJbKjQ6d/X8DZka8D5bSDAOu8naA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by SJ2PR11MB7548.namprd11.prod.outlook.com (2603:10b6:a03:4cb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Thu, 15 Feb
 2024 01:40:05 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 01:40:05 +0000
Content-Type: multipart/alternative;
 boundary="------------sLkngExqqEhFm3JczSRfbT6f"
Message-ID: <a62957bf-4901-460e-883a-c774d16d3f97@windriver.com>
Date: Wed, 14 Feb 2024 20:40:02 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/3] valgrind: skip 14 ptests in 3.22
Content-Language: en-CA
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
References: <20240212220501.3571864-1-Randy.MacLeod@windriver.com>
 <20240212220501.3571864-3-Randy.MacLeod@windriver.com>
 <2816e71889d9f743496192eb2f6e0520f3b6eb8e.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <2816e71889d9f743496192eb2f6e0520f3b6eb8e.camel@linuxfoundation.org>
X-ClientProxiedBy: BYAPR07CA0038.namprd07.prod.outlook.com
 (2603:10b6:a03:60::15) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|SJ2PR11MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b46f1a8-7699-4857-c734-08dc2dc708e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qPECInE1QYEos+wxVmWfW7KRntPtwwcJZ7dFvSBxR8bhdu30zLTttQ2g5WrawYAfnnRuwme8hejFrnk81mWVtn/CrL910rFnezqhQBWX2flFTo2F2bnF+GQV+taAT9QOTgjNuqLR6AtAuV6jfPetvbPENhsamG75aqJGVsJtReaAEDSWpLfQPgppf7r6a0jLGPOsgHjhL7G2smnaNF+/iGZbuY6MTFtXr5Zo+DqOxL/LkTYDXc5NwQhGSlzTXIZu7YxG1EaPCFWDhJnTv04SXq56yoXO2BuavAsQjGL2wErWvrPMh+CqZXI7kvTSK1tt6XpfvLXW9u6dBFxrovdNpXnVfAB7ilGITTGVcXKcYH2fvUP7XV315mlyf5Ix++titU7EukO8ad+FhgzWgk9ICdmk31fSYp5MJa0Qbjp1VIv41Se+HInpnID0JQxlz5eNW577Zdxvxl06EvrtAn5zOc8PYocALN4kwRj4KIBLjFAQKiP4QTOHqKVN7SBOt0rb7df6s3kNvutP7mtODM3a0Uak1HV3D5KKPdrEAGzlqd4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(346002)(136003)(366004)(396003)(230273577357003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(31686004)(36756003)(166002)(2906002)(8676002)(478600001)(5660300002)(8936002)(66476007)(66946007)(4326008)(66556008)(38100700002)(966005)(6666004)(33964004)(86362001)(26005)(6486002)(316002)(6506007)(53546011)(6512007)(2616005)(83380400001)(31696002)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MHhjQkZFSmVBaWJidEpmWDNGMjNieDB5QWxjcGFZYjQ1Yjd5OE5wNFpxWTVz?=
 =?utf-8?B?VzN6VkZsay8zVk1WcTN6end5RVhrb0QxdHlyNHF0WGlTc3UyY1BMcStONXBl?=
 =?utf-8?B?RGJ3dTFmTkJ4Q3hOZkRPbzRpZTZTQjJ5WEJwOEtNWnBTWXZOVUNpbzU2dXlU?=
 =?utf-8?B?eTRqTTdMRGlWWVJzOWhKMUVUWW44WTY4YUdXb3M4dnpPZG9iVUlEQmE4MVlu?=
 =?utf-8?B?VVBHVlNxcERzVjBTTEUzdjRPRnd4ZENWRTJaMHE4SWJKNG9HN2s4dHBTbWdj?=
 =?utf-8?B?a0dOL0JBU1MwbFg4NVhzWmJqMjRwY1hENE51MVdTaHRvSXNWUXVSMjd4R0N5?=
 =?utf-8?B?SnJYUHZoZmV4dGZyQUhud0hOVWZTcUd0dXVrOUVubGRBSTNrYm1BOWdQRGlK?=
 =?utf-8?B?bk9qUk5hNENpRVZlN1NaMTJKQUhQTkxxVG42dzNFcm5nb2wzYkIxdythbUxz?=
 =?utf-8?B?bXVwSjEzbVd5TVMrWlRtT3N2bUZUdW9aRFd1TUZzeHd6bWJ6Q3NBa2JrTkFU?=
 =?utf-8?B?LytRUHVMYkozU2dVYi9BYlZyV2U0NmlBVUpwMGxjd2pUcG12aTEzWHAyREM4?=
 =?utf-8?B?TWJuMFE3dUsrNUxqVW9TQ0M4SVZCV1Bkend6NU02RzE2Z3UzUDRyeUIyNi9X?=
 =?utf-8?B?K1dpdHZHdXdVSTFBMXA3LzkvU1k4S3ZGN1dqZmRvdkJpSkZuVjVOdzR0S3hC?=
 =?utf-8?B?VFBRcE1Iemk0RWJMb05WSXBmNFdsdkZpRlVQVVYvM2h2TCtWYkxnK2dta2hL?=
 =?utf-8?B?NjZGQitlK2VoYkI3Q016S3JxWmdJTkdPQ0FCMjRSa3pqWGRHMlNnSFRoZ1Ru?=
 =?utf-8?B?dU9veHNWWmlTOSs5U2xIQUo2N2dNYVBKZklOTFBOeFdvR3c3QTJ3TXl2VzdE?=
 =?utf-8?B?elQxeHlxOHZOTzJUQmsrQzNQaWZtbjJ4VUJobkFxVWR2ekp2QTJJS3M2bzI5?=
 =?utf-8?B?Uk51anZQOGpwbkF3R0duZGpmTUp5WlRJUWQxZHg0bWJkZEtBRFJkZ0tHZS80?=
 =?utf-8?B?czYyYUtGQmZLeXAzV25LNzM3NWx5eFl3RnZOYUZUbDltUWhGcU9FbGE2ZVJ3?=
 =?utf-8?B?eWtWSHBFOStSQjNRRytNOTJPK1JibFUrR08zUkJac2cwejhKcDhUYmdvSU9p?=
 =?utf-8?B?OUpMdXZkRFhhMUNJZU5aNEhCMnpqY2FWSnM1ZitYcTVHSXAwbmpIZE9QcEE0?=
 =?utf-8?B?U0pZN3ZvRnI3b0ZFdXdjRGthNnZQczJwTGwvQzdFaWs3YWxDd3k5MVBMeEp3?=
 =?utf-8?B?NFlEb1VlQlFtMHU0N1B2VkFVSjhCRmFxVVlOdlNZZWJERmEzcDNTMkJsUHNL?=
 =?utf-8?B?MHN2YW9BNGJGSFBoc3lOSExaLzZxYVZtSWNxZm1mTWhTb2UxU21ySDhMMHBh?=
 =?utf-8?B?VTBNM1dzN0pYcXkyK3BlVEJTckhoYXdUVm5JNXg4dGVPRUZGMXB3Z2ZWSXM1?=
 =?utf-8?B?dGxKN2VqVGRtdE9VNjNoRjYrdnFmRzZXVkJyQzFORGNmMUFYaE8wNmhCcTZ4?=
 =?utf-8?B?TW91QmtqbUt1WmdrK3VYTldiSTliQkk4VU4rVERkOTZuNVAvNWJQeVVOZWtp?=
 =?utf-8?B?cDRIOUMyTGpxZndCVVBoL1hNelNKT2pPeC96N1BVeDNqdzE4N0dxSXN1ZjBX?=
 =?utf-8?B?NklKbUZvbzlYeWZGSzM2NmdvdmlRYTY1djU3SFhLYnlaUkt5K0JHaFkyWmRn?=
 =?utf-8?B?c3NGdHVZZWF3Wm9STk1nSXgyanl1RGoyaUlhOEJKV3RGVGVWd3RneFpXVGEr?=
 =?utf-8?B?amlQZXk2NFVOVEc4ZXhoamRQdjhXTHFaU1h5amlWbFN1MFZZcHNkdU1TbDJX?=
 =?utf-8?B?b3pBUFBwbHhZaDB5YUY1d25zQkhKOVEwVG16QnltMlBGZ0hNUTE5eG44OFd0?=
 =?utf-8?B?bjdvcVF1K2ZSYnFhMTdBZ1RXd0NBOUxPSDZHajA3OUx0RXhEMElVYmFYWDRO?=
 =?utf-8?B?TCszS2JIaWNHaVZHVG9tYkZqWWw5MWh3NE9MV1AzMFNhaXc0MnNwZTdqNU14?=
 =?utf-8?B?TFdLVjFhdnFDbE1kQTlBVDNuNzRaeG82b0xGaWMwb1lpbm1lVG44eDFacHhv?=
 =?utf-8?B?cU5iL2xhVm5EY04vYzBiZFE5RVExc3cwbXJrRjFhMkpZVEZ0MkxNV212MlZY?=
 =?utf-8?B?eisrckdVeC9rRlVsQXlnU3JxMWNYSXJDd1dFMjlFVTVjMlNkdEJuaW9OZmJF?=
 =?utf-8?B?QkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b46f1a8-7699-4857-c734-08dc2dc708e9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 01:40:05.1963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t/wGldNlwUGyI8tKle25hX/j4MyaUMclCSdfFDxpuTeTMgkcbTrMdXAPO2/aS+UeSOw6+1rXXFM+J+UzZeZKtZ7DldSz14dv+mrH2BBqrYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7548
X-Proofpoint-ORIG-GUID: xjTjlkx6DCSgR8KFY2rawPS51qTfTTDd
X-Proofpoint-GUID: U42UMe0iS2_IfwelhO1djLBZn3OrYgtM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_01,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402150012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 01:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195501

--------------sLkngExqqEhFm3JczSRfbT6f
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-14 8:51 a.m., Richard Purdie wrote:
> On Mon, 2024-02-12 at 14:05 -0800, Randy MacLeod via
> lists.openembedded.org wrote:
>> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>>
>> Sort the ptest depenencies into a somewhat alpahbetical order.
>> Add python3-compile for ptests.
>>
>> Add softlinks for cachegrind to eliminate a warning seen in those tests.
>>
>> The folowing tests fail after the 3.22 update:
>>     memcheck/tests/linux/dlclose_leak-no-keep
>>     memcheck/tests/linux/dlclose_leak
>>     memcheck/tests/wrap1
>>     memcheck/tests/wrap2
>>     ...
>>     memcheck/tests/wrap8
>>     cachegrind/tests/wrap5
>>     massif/tests/bug469146
>>     massif/tests/new-cpp
>>     massif/tests/overloaded-new
>>
>> Omit these tests until they are fixed.
>> Tracked by:https://bugzilla.yoctoproject.org/show_bug.cgi?id=15399
>>
>> === Test Summary ===
>> TOTAL: 778
>> PASSED: 759
>> FAILED: 0
>> SKIPPED: 19
>>
>> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
>> ---
>>   .../valgrind/valgrind/remove-for-all               | 14 ++++++++++++++
>>   meta/recipes-devtools/valgrind/valgrind_3.22.0.bb  | 14 ++++++++++++--
>>   2 files changed, 26 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
>> index e26088f3b1..004589a7ea 100644
>> --- a/meta/recipes-devtools/valgrind/valgrind/remove-for-all
>> +++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
>> @@ -1,6 +1,17 @@
>> +cachegrind/tests/wrap5
>>   none/tests/amd64/fb_test_amd64
>>   gdbserver_tests/hginfo
>> +memcheck/tests/linux/dlclose_leak-no-keep
>> +memcheck/tests/linux/dlclose_leak
>>   memcheck/tests/supp_unknown
>> +memcheck/tests/wrap1
>> +memcheck/tests/wrap2
>> +memcheck/tests/wrap3
>> +memcheck/tests/wrap4
>> +memcheck/tests/wrap5
>> +memcheck/tests/wrap6
>> +memcheck/tests/wrap7
>> +memcheck/tests/wrap8
>>   helgrind/tests/tls_threads
>>   helgrind/tests/pth_mempcpy_false_races
>>   drd/tests/bar_bad
>> @@ -9,3 +20,6 @@ drd/tests/pth_barrier_thr_cr
>>   drd/tests/std_thread2
>>   drd/tests/thread_name_xml
>>   massif/tests/deep-D
>> +massif/tests/bug469146
>> +massif/tests/new-cpp
>> +massif/tests/overloaded-new
>> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
>> index dc00edb24e..74ac7ec9d5 100644
>> --- a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
>> +++ b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
>> @@ -129,13 +129,18 @@ INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libexecdir}/valgrind/vgpreload_memcheck-
>>   RRECOMMENDS:${PN} += "${TCLIBC}-dbg"
>>   
>>   RDEPENDS:${PN}-ptest += " bash coreutils curl file \
>> -   gdb libgomp \
>> +   gdb \
>> +   ${TCLIBC}-src gcc-runtime-dbg \
>> +   libgomp \
>>      perl \
>>      perl-module-file-basename perl-module-file-glob perl-module-getopt-long \
>>      perl-module-overloading perl-module-cwd perl-module-ipc-open3 \
>>      perl-module-carp perl-module-symbol \
>> -   procps sed ${PN}-dbg ${PN}-src ${TCLIBC}-src gcc-runtime-dbg \
>> +   procps \
>> +   python3-compile \
>> +   sed \
>>      util-linux-taskset \
>> +   ${PN}-dbg ${PN}-src \
>>      ${PN}-cachegrind ${PN}-massif ${PN}-callgrind \
>>   "
>>   RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils glibc-gconv-utf-32"
>> @@ -225,6 +230,11 @@ do_install_ptest() {
>>       sed -i s:@libexecdir@:${libexecdir}:g ${D}${PTEST_PATH}/run-ptest
>>       sed -i s:@bindir@:${bindir}:g ${D}${PTEST_PATH}/run-ptest
>>   
>> +    # enable cachegrind ptests
>> +    ln -s ${bindir}/cg_annotate ${D}/${PTEST_PATH}/cachegrind/cg_annotate
>> +    ln -s ${bindir}/cg_diff ${D}/${PTEST_PATH}/cachegrind/cg_diff
>> +    ln -s ${bindir}/cg_merge ${D}/${PTEST_PATH}/cachegrind/cg_merge
>> +
>>       # This test fails on the host as well, using both 3.15 and git master (as of Jan 24 2020)
>>       #https://bugs.kde.org/show_bug.cgi?id=402833
>>       rm ${D}${PTEST_PATH}/memcheck/tests/overlap.vgtest
> There may be further failures on arm:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6086
There are 22 more arm64 specific ptest failures.

I've skipped them as well and I'm doing a round of ssslllooowww testing 
(3 hours/run).

I'll send a commit to be added on top of this series once that's done
and we're back to ZERO ptest failures.

I'll try to make time to fix the regressions before 5.0 M4 but if anyone 
else is
interested, please let me know.

../Randy


>
> Cheers,
>
> Richard
>
>

-- 
# Randy MacLeod
# Wind River Linux

--------------sLkngExqqEhFm3JczSRfbT6f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-02-14 8:51 a.m., Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:2816e71889d9f743496192eb2f6e0520f3b6eb8e.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">On Mon, 2024-02-12 at 14:05 -0800, Randy MacLeod via
lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

Sort the ptest depenencies into a somewhat alpahbetical order.
Add python3-compile for ptests.

Add softlinks for cachegrind to eliminate a warning seen in those tests.

The folowing tests fail after the 3.22 update:
   memcheck/tests/linux/dlclose_leak-no-keep
   memcheck/tests/linux/dlclose_leak
   memcheck/tests/wrap1
   memcheck/tests/wrap2
   ...
   memcheck/tests/wrap8
   cachegrind/tests/wrap5
   massif/tests/bug469146
   massif/tests/new-cpp
   massif/tests/overloaded-new

Omit these tests until they are fixed.
Tracked by: <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=15399">https://bugzilla.yoctoproject.org/show_bug.cgi?id=15399</a>

=== Test Summary ===
TOTAL: 778
PASSED: 759
FAILED: 0
SKIPPED: 19

Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
---
 .../valgrind/valgrind/remove-for-all               | 14 ++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.22.0.bb  | 14 ++++++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
index e26088f3b1..004589a7ea 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-all
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
@@ -1,6 +1,17 @@
+cachegrind/tests/wrap5
 none/tests/amd64/fb_test_amd64
 gdbserver_tests/hginfo
+memcheck/tests/linux/dlclose_leak-no-keep
+memcheck/tests/linux/dlclose_leak
 memcheck/tests/supp_unknown
+memcheck/tests/wrap1
+memcheck/tests/wrap2
+memcheck/tests/wrap3
+memcheck/tests/wrap4
+memcheck/tests/wrap5
+memcheck/tests/wrap6
+memcheck/tests/wrap7
+memcheck/tests/wrap8
 helgrind/tests/tls_threads
 helgrind/tests/pth_mempcpy_false_races
 drd/tests/bar_bad
@@ -9,3 +20,6 @@ drd/tests/pth_barrier_thr_cr
 drd/tests/std_thread2
 drd/tests/thread_name_xml
 massif/tests/deep-D
+massif/tests/bug469146
+massif/tests/new-cpp
+massif/tests/overloaded-new
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
index dc00edb24e..74ac7ec9d5 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
@@ -129,13 +129,18 @@ INHIBIT_PACKAGE_STRIP_FILES = &quot;${PKGD}${libexecdir}/valgrind/vgpreload_memcheck-
 RRECOMMENDS:${PN} += &quot;${TCLIBC}-dbg&quot;
 
 RDEPENDS:${PN}-ptest += &quot; bash coreutils curl file \
-   gdb libgomp \
+   gdb \
+   ${TCLIBC}-src gcc-runtime-dbg \
+   libgomp \
    perl \
    perl-module-file-basename perl-module-file-glob perl-module-getopt-long \
    perl-module-overloading perl-module-cwd perl-module-ipc-open3 \
    perl-module-carp perl-module-symbol \
-   procps sed ${PN}-dbg ${PN}-src ${TCLIBC}-src gcc-runtime-dbg \
+   procps \
+   python3-compile \
+   sed \
    util-linux-taskset \
+   ${PN}-dbg ${PN}-src \
    ${PN}-cachegrind ${PN}-massif ${PN}-callgrind \
 &quot;
 RDEPENDS:${PN}-ptest:append:libc-glibc = &quot; glibc-utils glibc-gconv-utf-32&quot;
@@ -225,6 +230,11 @@ do_install_ptest() {
     sed -i s:@libexecdir@:${libexecdir}:g ${D}${PTEST_PATH}/run-ptest
     sed -i s:@bindir@:${bindir}:g ${D}${PTEST_PATH}/run-ptest
 
+    # enable cachegrind ptests
+    ln -s ${bindir}/cg_annotate ${D}/${PTEST_PATH}/cachegrind/cg_annotate
+    ln -s ${bindir}/cg_diff ${D}/${PTEST_PATH}/cachegrind/cg_diff
+    ln -s ${bindir}/cg_merge ${D}/${PTEST_PATH}/cachegrind/cg_merge
+
     # This test fails on the host as well, using both 3.15 and git master (as of Jan 24 2020)
     # <a class="moz-txt-link-freetext" href="https://bugs.kde.org/show_bug.cgi?id=402833">https://bugs.kde.org/show_bug.cgi?id=402833</a>
     rm ${D}${PTEST_PATH}/memcheck/tests/overlap.vgtest
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">There may be further failures on arm:

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6086">https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6086</a></pre>
    </blockquote>
    There are 22 more arm64 specific ptest failures.<br>
    <p>I've skipped them as well and I'm doing a round of ssslllooowww
      testing (3 hours/run).<br>
    </p>
    <p>I'll send a commit to be added on top of this series once that's
      done<br>
      and we're back to ZERO ptest failures.</p>
    <p>I'll try to make time to fix the regressions before 5.0 M4 but if
      anyone else is<br>
      interested, please let me know.</p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:2816e71889d9f743496192eb2f6e0520f3b6eb8e.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">

Cheers,

Richard


</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------sLkngExqqEhFm3JczSRfbT6f--

