Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A31BEC433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 02:17:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1344.1668392239254397476
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 18:17:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8317b30afd=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AE2GjWg030037
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 02:17:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kt2fa93a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 02:17:18 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AE2HIvb030576
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 02:17:18 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kt2fa93a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 02:17:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHW+M3c2XZHF71Z1qnh48xdI90SjjrCuWuWqA0vsvE/ou7GqWbOYSD/gMfADJa2fOtVS5qZFjcwJm0VjvPS1ztgRuQQPbcOBS3N5OJUlKKm4sQjUU0E3B0/xvJltWf41j43wD4kS4p9C0y+NVQMBakhOMp+d1iEOhvaNhYECsiJe1bpUiBZeq3B6rcLcrMJdjh7JWJWS9td/cVchvZxYf9sRg+U2nmPU5ZuothUbrJK/B6CDEERaicItDCnWI980BlVqAwSZwAYEL5ndAhN5NNCaAPBU8L8muRcoI+HdkPiCYG7tvqfwAP+TzIFb4R2AED102R6jr9wRGOts0jR2XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IhQul8U/k+KC/F8FYuEY2N9ycNfLS9MrHMxJ+oQi+Y=;
 b=Uyl2UstsTK3aG8r/z1JmFJythsfcjva3orLw/C264KcfYx/rEHcZwTWqE7rcJ5ERtKt/DUPU4XsNH3rS1QpZrn3Qg5JX7D12dJw2neLh8d/rNI/uwhLsVdflw/4iVtl63aEU8RG9JXCHHQs196BimvwNHMhCHF6KTcpRkpMvDHUKP2BG5vP06/ODXTCO20pWdUClQZg1ZsLLqfYIA8Lbi1Yv8vUb2Q0y9PYsQ4lvdvUXu291xO6UoSa87bWanuyT/CmTi9AMgqUDExgJgDL5PkBDYX0se6OO/SqhqwFm5pf++gsFujqjWh//QUUeiK0cPg50TIVv7SoK/eH3VVo0Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 02:17:14 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 02:17:14 +0000
Message-ID: <0af62566-0fd0-e862-c3b5-401a17fa168e@windriver.com>
Date: Mon, 14 Nov 2022 10:17:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-Core][kirkstone][PATCH] lttng-tools: Upgrade 2.13.4 -> 2.13.8
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
References: <20221109011421.1257186-1-xiangyu.chen@eng.windriver.com>
 <CAOSpxdZBZdKoE-vZaz4fZoSz03ToKn-AQcEGF1G6rLgVAPF5YQ@mail.gmail.com>
From: xiangyu.chen@eng.windriver.com
In-Reply-To: <CAOSpxdZBZdKoE-vZaz4fZoSz03ToKn-AQcEGF1G6rLgVAPF5YQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|BN9PR11MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: 564712a9-68e0-4749-bc6c-08dac5e65884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Fpr02wyAslylZr6ZHrv9DVsBPzQjCOdQ+52S+FqaTCOJ8GtdHZWPm7zGyLf12kF/rAGSfnk1SBkvDZTvQu10jkWHTtYMWwYi+tj1xotjqy5FvdnhqDtAW7dUExQOsCZwTGbnx+O5Fb/m2Kwq7aSGhu+7txtKBWEWaV2+9Nd3tvuGhXTHo452BsTRPQ0RBd1GVf2UTafVFwVXYwO3X03l3flMGt3ndZKpET+eGQW4WHWvAIht7P2zeAPcB8zGTFDVkivRAxUQ2auAp3otgGkCRCN3VG3thLlmVd2UhpO/zi7tkWL1Pm8gS19rYsF4Dd9qQCUNylGYbeDp07B4QGE+g33mGI9GBo5sf6VIFZ936oZNKgkH5MsKTzmJZ+u8p3hQsGYt4Cm0dpy5HbtoQTTuHDCTAoZuTf/ui+Mn7ewyoYhWpAWVDIwMbJCic7AZ3wA/5d2RmCqf/AgxKr4/Ivb42mhfiFHJKua3Q/P7lWusKAoEJP2Z/p7NfY2R0UW84kvLixV1rxoV+kQYlk0ZkDir+7ApGRHiJ4EFeYdBR4CusWuEZGqXw5/m8u2xU2k9oXRhzj/LzoeMj2SWEkWdLFZopKbYXJEQKR3Ygz195pAKNEUedonbjGh77SPt2IRK8We9ExgpODYvjZidQeb+Sae0BPl96RZC22YQXnLPSU3c8ueiLz3m8Ed+owDO04NsoJwApkaGnfywz9o38EWkNcZSVq+0VSoX9QmuZPvAAud+9adtErXdTDH63CxXfKlYqbt55ptLKtAGbhqFBdNqQ87SHPiQNCV61sQhXzQquWTeKss1C2Ed1zysxtvcQ7Iullxi
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(136003)(346002)(39830400003)(376002)(451199015)(6486002)(966005)(6666004)(66899015)(478600001)(83170400001)(31696002)(38100700002)(6506007)(83380400001)(41300700001)(2906002)(6916009)(53546011)(316002)(4326008)(26005)(66556008)(66476007)(66946007)(8676002)(6512007)(9686003)(31686004)(186003)(5660300002)(36756003)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WldiS2M5dTgrU2krVWdtK0tGNWZkMSs0K3dZTzlVa3k5SzYwRGxRV0x3Y2ZJ?=
 =?utf-8?B?V1c2NWZKUzc2aXVtYTZVeStmY0pjdHowWk5MYUNSRVc0aE90amNKMGw3UTVu?=
 =?utf-8?B?MUZXajRiZ09YMWR4Z2FQWmJEK1dYb09wVkZiRHJ2S2NSUUdhZ2VkcldjQWh5?=
 =?utf-8?B?MXlUVGx4aVBkWUR6K1B1MStoL2VyU0tiY2FOL2NVRFFKZTVSRDVTeEVCZ3g2?=
 =?utf-8?B?OGFGWWVRWUk5N0o4WmRiTFFRSE1oc0tyM3hWdzhZMHFJa0s1OWhuR3lDOUFD?=
 =?utf-8?B?eFVwN0hkdGc0d1dCWU5nb0ltanFsMVZFYmVoZnhBTDljK0IzbGY2M2dXNmo3?=
 =?utf-8?B?VHhyNEt5QjVPdk55UEJsUGJXK0JUVWFpbCs2UE95TXNlajVtWWJkOXNjcDRn?=
 =?utf-8?B?b3E0WFdKZE9iR0FWM3gzM3ZkVXVYM3MvTGhUK25wcEFrSjFZa09ZMzJGK2Yv?=
 =?utf-8?B?dlByR0IrdGJLRitFSGhXWTljc05EWEdoRzJhT0dDRXJwRGZHNUQweWZvbVR4?=
 =?utf-8?B?STJ3UlduVzluWWNUYTRSeFpHcTc2NFBoTGswRkxFem9zdk13aSsySmdHcHB5?=
 =?utf-8?B?S09KUXhZQ3JIYzJOaGw4TDdMWm9mODJxWVJHRkVMQWlVamJPSmhLU1JqY3NV?=
 =?utf-8?B?OEJRZHdVTVhMbldnRHF0dllvdEEySWVKOS9jbXVxWnJ4d0ppb20ybTkvTjB3?=
 =?utf-8?B?UW5Ec1lBd2VvT0JnUFpTQWRReWo4RnRCY08zWmlwVlpHUW9LbGZNVGw3ZEFh?=
 =?utf-8?B?bkZrNXJuOG1YWk4vTTA2OXcwbm1FQVM5dTFpZTZCeE9mNmhhaTNJZ1E2Rlcx?=
 =?utf-8?B?SVllU3dJNkxRaVVBSCtabTNtR1FCQ21WYTdHRGtQR1RXVHlaTkV4M2o3allx?=
 =?utf-8?B?MlFKVmdTUk9aSWN1clZOTC9Nd1R4VkRySjE0M0UrelBmN3UrQlJFNGtqQngr?=
 =?utf-8?B?R21qOU80ek8xTnU1NG93REtrSHdwMGRjWDNUSXpvd3B5RW4wNHA3cUpwR2Fq?=
 =?utf-8?B?cE00Ny9yYkpSK1VpQW5sVjJ0LzF4UGtsajJXVmExU3h2b21EcldjajQvc25V?=
 =?utf-8?B?azhwaEJkRDJYOTk4YVRIKy9jempSNnc4QmxWVDEyUXZzUXJrV2ZrTXZwb3hZ?=
 =?utf-8?B?amVoY2JJWWlwMHV2NlR3dmg1b1dHMWVkOEhPN2plU01CZ2p5MVpldCtzMHZC?=
 =?utf-8?B?RHMySUpKNitnemFOWllxUFpyakdDUkJzMWhJM29KeE1lRHdhSHdtYVVNZjMx?=
 =?utf-8?B?QjF0Ly85aGR1MStPV1p5c1VuVU4wTFJnY09CL2dFVFYxamF3VmxmL09wNnNy?=
 =?utf-8?B?VVptNDVyOEJOWGx2TXFCUEZCSnFjR1ExTG04cUI5MUQvb0FIUGtybkVKRzR2?=
 =?utf-8?B?YW13bEVMTHNGV2NJZk5SNDBqRGY2Sk85em1tcDBUUCtPRjhka3ZIbVJWdTM2?=
 =?utf-8?B?dS9lY3VVT0MrOXdWTytGMkFIKzZabTRyVTZFanYzWGJ2b1l4STd3elhQdktV?=
 =?utf-8?B?YXZNUm1nelFDVWRUay9BRnRZanNqeDI0eTk2WkQ2VzFhN0NiMHNyNzNxMWp1?=
 =?utf-8?B?SmJiaUNkcGVOUnA5Q1VBS2l4cXRNTWtkU2s0cWVhTU1yY2l4bHVpM0tpL1U0?=
 =?utf-8?B?MHEyT0JRWEJKWXNFbEhEVVZqUnU3U1ExcW55d2sxN3IrUG9jSFlDYkxsTWFU?=
 =?utf-8?B?UURrczVCQnNGVkdqSlpyaFVudXNxdDZvalk3Z0tzRHhHY3JDaE9ZeHVHQnRx?=
 =?utf-8?B?TGZiTDY4Z0RpRSswdUFCbUsrQnVDNU1zNnFIMVdkeWxmSTFRMk1DTE81OXcx?=
 =?utf-8?B?d21oMHBQTGVDZFZLMVlHd1JxUE5Fc0tNdGFmbUluKzZVVEc4bGVCOEc5Y2s5?=
 =?utf-8?B?SDlkME5xYU5vajBnQTI2SGs3YkRZVDd5SjJnL2tydnpMVmRHWjUxNEE0NFYz?=
 =?utf-8?B?eWlkUlZqU1AzcXNkNUhGODNQVEFNZkhqYzBOeGJuL09FdWpFNGdGK0gwQm1U?=
 =?utf-8?B?M2ZkSjEzOSswOXZjMkd4cjdaTnhjZXgxY1hYYmtGdE9hT0dSN0dMMy9hOUor?=
 =?utf-8?B?Ymd2NkcxbUVTWHQ3MzdNNWtkZ3YreFNRSEkxUEdFUlhwdTg1Smw1Y1g0S0hr?=
 =?utf-8?B?RCttL0tpaEx3YWx1N0NGdU1DdzhCNzluR3ZQYmxPRktaaExySE9rdS9oOFBn?=
 =?utf-8?B?R0E9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 564712a9-68e0-4749-bc6c-08dac5e65884
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 02:17:14.7402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOoAi86ORpP8i7en5vIR3I0UW2tFBia49I52kv6fN2X2UekV5UQXhiOX4BAQhlGe9mHQ5Ju4dIUpisn7WeFwUQIVbrqHg+I+Tcw8WpzaxM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5289
X-Proofpoint-ORIG-GUID: hb9m4rQaPEXgdP5sbUn48m20Q7ZQZ5c-
X-Proofpoint-GUID: tTLGomxZGBrpUV4rKALGA6EksVfLGTAC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_02,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 bulkscore=0
 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211140015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 02:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173217


On 11/11/22 22:34, Steve Sakoman wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Master branch is currently at 2.13.7, so you will need to submit the
> version bump to 2.13.8 for master first.  I will then cherry-pick the
> version bumps to langdale and kirkstone.
>
> Thanks!
>
> Steve

Hi Steve,


The lttng-tools on master already upgraded to 2.13.8

https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb 



Thanks,

Xiangyu

> On Tue, Nov 8, 2022 at 3:14 PM Xiangyu Chen
> <xiangyu.chen@eng.windriver.com> wrote:
>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>
>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>> ---
>>   .../{lttng-tools_2.13.4.bb => lttng-tools_2.13.8.bb}  | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>   rename meta/recipes-kernel/lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.8.bb} (90%)
>>
>> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
>> similarity index 90%
>> rename from meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
>> rename to meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
>> index 0ea4da05ce..a814eb79f9 100644
>> --- a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
>> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
>> @@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
>>              file://disable-tests.patch \
>>              "
>>
>> -SRC_URI[sha256sum] = "565f3102410a53d484f4c8ff517978f1dc59f67f9d16f872f4357f3ca12200f6"
>> +SRC_URI[sha256sum] = "b1e959579b260790930b20f3c7aa7cefb8a40e0de80d4a777c2bf78c6b353dc1"
>>
>>   inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
>>
>> @@ -113,7 +113,7 @@ do_install_ptest () {
>>           for f in $(find "${B}/tests/$d" -maxdepth 1 -executable -type f -printf '%P ') ; do
>>               cp ${B}/tests/$d/$f ${D}${PTEST_PATH}/tests/`dirname $d`/$f
>>               case $f in
>> -                *.so|userspace-probe-elf-binary)
>> +                *.so|userspace-probe-elf-*)
>>                       install -d ${D}${PTEST_PATH}/tests/$d/
>>                       ln -s  ../$f ${D}${PTEST_PATH}/tests/$d/$f
>>                       # Remove any rpath/runpath to pass QA check.
>> @@ -124,6 +124,7 @@ do_install_ptest () {
>>       done
>>
>>       chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/userspace-probe-elf-binary
>> +    chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/userspace-probe-elf-cxx-binary
>>       chrpath --delete ${D}${PTEST_PATH}/tests/regression/ust/ust-dl/libbar.so
>>       chrpath --delete ${D}${PTEST_PATH}/tests/regression/ust/ust-dl/libfoo.so
>>
>> @@ -185,4 +186,10 @@ do_install_ptest () {
>>   INHIBIT_PACKAGE_STRIP_FILES = "\
>>       ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/userspace-probe-elf-binary \
>>       ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/.libs/userspace-probe-elf-binary \
>> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/userspace-probe-elf-cxx-binary \
>> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/.libs/userspace-probe-elf-cxx-binary \
>> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events/gen-syscall-events \
>> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events/.libs/gen-syscall-events \
>> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events-callstack/gen-syscall-events-callstack \
>> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events-callstack/.libs/gen-syscall-events-callstack \
>>       "
>> --
>> 2.34.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#173006): https://lists.openembedded.org/g/openembedded-core/message/173006
>> Mute This Topic: https://lists.openembedded.org/mt/94904524/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

