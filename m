Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5999BC54798
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 02:45:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4731.1709088304114320752
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 18:45:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=27884c6328=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41S1e9c0028938
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 18:45:03 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfgumkgwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 18:45:03 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41S2j31P022706;
	Tue, 27 Feb 2024 18:45:03 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfgumkgwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 18:45:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DSOeoapDjrmldPZDwqiVB4v/6obfRjW1Y2L7J4c30z5UXPkWKOaJR4nqApmmxyBQrDXE5woJDwa46SfPib/66s6xh7UpQ/9DNoW43wMKg5mjqfpdIR8oyf+DgTkglfErxhz9vu4QCSUaLcQS8wYbWGWrJuYjKA53MwydTMqGQ16tk/vSU5gn+VxegJ2+um/Y7xbhlqwS6RIN9Cfy4fVhksojEQN2xPrC00/n/k9DrgADQgTeVZHQuov93CNLWTW7jyz1OR0X7wdC2P+qOp61wnzjoaKAOp09aOkKzThsumcYxq8pNauDaLUGWrOOERhT8+q5X1oo9jQ1U9tSFutiYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGFYsoBEoPQJdv9HhY8lxMnV85bycf8YLVg8Gm4BHK8=;
 b=TgTxb2/sLWuocVCMbk0vf4Vu3gKqdW4sox7E/sF+A6JCTvSMAsJiE9fMhMa++FTgoM8kDwo2C6DrVIOcfqycfH8VvzfqqH/6eecrtHq7CZPm7bad5rA3VXci8iJcrMTqR5K//ZveclTrOmMB5+GBw8gcDDSaPLjCcx4PzAoRGPwxKoHSejHk1DRlVGubVI7rG/2YtjH4TC32vxaPB/Jn0xHgzXdl1hdsUJTkqnrk0tjTer02KZc8wTo0BOm7Sc1bhsvJLfWMV+nTDxPNBcdkEqmF24QDWG76JX4VG2WLEDvQ7VIIGjMf2wDGoxCnx03M/X2+s+uhPRjQpsBjlFNG2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by BL1PR11MB5447.namprd11.prod.outlook.com (2603:10b6:208:315::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Wed, 28 Feb
 2024 02:44:59 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673%4]) with mapi id 15.20.7339.023; Wed, 28 Feb 2024
 02:44:59 +0000
Message-ID: <4823ed44-2ba4-4d18-86c2-e6dc426e0a46@eng.windriver.com>
Date: Wed, 28 Feb 2024 10:44:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 1/2] bash: add locale alias for ja_JP shiftjis in
 run-ptest
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240227085722.2025994-1-xiangyu.chen@eng.windriver.com>
 <CANNYZj_uUATQFE54rkXaCiUqPRyaRvRWDJdhH0gGwBd9WHiLjA@mail.gmail.com>
Content-Language: en-US
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <CANNYZj_uUATQFE54rkXaCiUqPRyaRvRWDJdhH0gGwBd9WHiLjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0022.jpnprd01.prod.outlook.com (2603:1096:405::34)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|BL1PR11MB5447:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d0d7a6d-df84-405a-dfad-08dc38074122
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Kp69QhJb+nGWsb5+9nq3GCk1TNXX0ml6bqzJ231P/R6gZJUB9+hWhKSCziwrlEGSkczSIHKtb/h0rXIpGPi2ibG3RCc4SKWtWC5N0yHeASBrZOhiHd8FCUeiql4EYYA2hRDzZTS3bJ9EVZjYX1dSJ+rfGC1J3xMMVTWK8sdQH0Nsbo4EBvtDxPLu6AA6xr0Gv+HN3wb1avLmKYqtKwyyyVYA2w+f50M/TtP4zoJdcc5KeifeyBHhQIywI43E/KmZzUqD73K7MzN4bYMQT3atDwxmheSsY5Len11fefbbbnFYA2Oh78AqIoBA+j04VPlbR23V8yk8Bybs6MRSoFfWPobjeEY6J3NCSl2mMulSk52bUSAf//B6yrpTmZ0Ej24xIud/5oeCJJAAd/5hT2Vcsk7aqOh8h0Sc6vuJDyR3lkmCrHpGhGeECp/R5TY2B5wv8pJnhWMpxj6a6FY1hHC0TRV/rYbLE/cEa3I1t2rrrFqKLNu0hZ70/D2Z9YCTVhOhzSH586ahDKjSKb4D3lNU1Skw2BHviKYthT01tQe65lkV+uSHPs5Vx0i997Nf8Hi4vsqhIbircTN6hUbRqyioNr0akiEHx5dhKNg6q5skMndO/asragm1sCV122Z8T+N+SX0Ki5JyA22Y03F6zdE03w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cFdrMkpQZThqbHpBTUF4MWhsTkNENjFXV2Uyb0ZpWXpUb2xlU3NJN1RKOXpl?=
 =?utf-8?B?Q1JkSXM5TGdHd2JhSzcrdlRRS0g0TG41K1VrbzUzaVhvc2tUNmM2WTc2YmdC?=
 =?utf-8?B?YWlhU0dDVjRVcUZJaFZ6T2E0cEM4ZkRpZnl3aE5yTEZPWnBqbmdnSDYwMEdX?=
 =?utf-8?B?bjdndDI5QmhwMVI5SGJkTkUwQUFXZjByclpvUHBFdXFVRDBtNG9qSkI0SzNn?=
 =?utf-8?B?dytMM1BjS29HMmFhcWsxUlFsaWRXa1ZLcjk1Nld0RXQ5bGh4ZHRiMnQyVS8x?=
 =?utf-8?B?dXBHang5eHlFWDFyK1Z6eWpQdVJDdGlNZDMrbVFDTDdrU3QydzAxcm91SjdG?=
 =?utf-8?B?aWgwaHVzdVh3eS82UEtxNCtZSTlkdnZQWEZFY2Y3czJDTElod2RuL1hwd0JT?=
 =?utf-8?B?RHA5OGJHdVlVbmk3S1I0UTV2d2tHdVQrUW1rSVBQRWEzVDFHcmh5OHNKaUow?=
 =?utf-8?B?R1VVWm5MblBDV2EyQWFEYXBCdUFlaVNVYTJLaUE3MXhkUU9UazRMZlRTRG9u?=
 =?utf-8?B?by9uYWI2bUp1VjdMeWE3alFQVTNHUjBlaHFQQ2lzNE1XdSszMm9QZEhrSFR0?=
 =?utf-8?B?Mjk0TjdxMUVTa3VjSzVSWUJ5TmtYdG9wWXhDdDBjUzVxTHhvY0hoUm9Lc0NJ?=
 =?utf-8?B?QWh5WW5UQUNMckQ1MjI1ZnIxaStaMnRIT1V4L3J2bW5Tclk4U2JkSEoxY1F3?=
 =?utf-8?B?RER2TmdOOSsvMXVDNmRaS3RWQmliN3MyVjkyejhKTXFqRHpZOUZpWC9aYzBN?=
 =?utf-8?B?UDQvemc4L0hhQW14N2JEMFpCTWlyRWdIMEx5bUxTaTJ0MFl2ZEZGYlc5ODd4?=
 =?utf-8?B?SlBaOU5xTVBkQ3pQYWFBa0NSbWIyUzVYWjVEWGRFQWs5Q3l3amZUV0RBSnFa?=
 =?utf-8?B?bGx1OGZrVXpJZ1ZKY3lXdlZrTXRUQUluajlWZStPL3UxeDRpOFdZcUtRNk5a?=
 =?utf-8?B?R3c0L01waTZpMWFteHg5ZkUzSkpScHl6TTBFTXBIbGRoMFpiRXM3Qnk4WDFz?=
 =?utf-8?B?eUZEcm4wcmY2amIzaU5kaDBYWTB3VDkyQUFpYzIwVVlEaklIU1RDcGdyWm5N?=
 =?utf-8?B?ZFZkblhzbUVwRk4weEhNdXM4MVUwSWgvOWZGcUp1TDRTSnJaakVONUJvNDIw?=
 =?utf-8?B?d2RrVUd1S3JOMEpPWEJnTXVhcVlwTW4zSlUrcmxWVDliWTlnVkV3TmI0MFdp?=
 =?utf-8?B?UWJUeXBkMyszV1VWTGg2MDk2T1ErWXVqWWowd0V0a25pV2piTE5lWkQ5cUtU?=
 =?utf-8?B?WXpPeWR5WGxKVjdxVnI4Nys3VmZRWUVIdVRNZUp2UmxHckx3cDZZKzZtWFRB?=
 =?utf-8?B?d1lGWWw0MUtjeVhPTnNzM0NucTUxc0RIdThhWjlJVjNYaU9wcVlqWVdaQysv?=
 =?utf-8?B?VnNHSGM4MkVwSW9aM2NOWjY3OXMyQlgxN3dZQTAvd0g0S3ZLNnRZbmtNMEJi?=
 =?utf-8?B?RWxpTHdDU2JWSWRTU2c2a21TK1dzOGE3eFhZRnZ5MTRjdUZVcC92dGhLODds?=
 =?utf-8?B?eVN4SWRRNzlRdWZZRnFsUXRWVDFnd0xJeHV6cm1zTWxFdmRTU2sxRDBML2pa?=
 =?utf-8?B?YnFZRTR4VHdHTXlOSkN1eFlUdW9lRUlOYnhhMmMxcFNXQlgrNHNraFVNT045?=
 =?utf-8?B?KzZHajZJTzVhNzNURmpGcVIyVXhXZWEwR3lDVGFTbms4ZDlmYzgxYldhMG53?=
 =?utf-8?B?bm50WUw0SmRzc2o0eEJkOVJiNGtRLzZ2a3J2allQRUQ4dTIxNHZiTEM5Zm9O?=
 =?utf-8?B?RlhCQkhVOHdVK0JTQWtMTGZqMndXeXhIeStNZklSVXZWSnAvckRyTE5sSXU3?=
 =?utf-8?B?ZkNTMmluL1NYc1lhVUJXMEVEMkwveUZCa3lQZzNJRTBJVlYrNkFlSHRnYzhH?=
 =?utf-8?B?WkRvZVIwSXFvVjNJdDdyaFN4Z3BzK2U0UURvYTNqak9LOVJuWWhiK2JNRngz?=
 =?utf-8?B?MGRTOCtMeGdyeGNZSXY3OWtrWURPNUxUdlhlbE8rRzlRYXJoaUljcWR4cVY2?=
 =?utf-8?B?NWNkeU5iZkZxZGdIRUxsWmRISzJpNWVxZklOcUNkT2lPT1NoYSswOHR5Y1Rj?=
 =?utf-8?B?ZUxDSzByaVI2eHhKRGY3NHRYazRyaXpEazlteEFBcVBrUGI0dDFyM0FnV0tp?=
 =?utf-8?B?bmxldmJNVDdLMUtOVTFwVk9RQ2UzNkdmT29udXpCSDEwQ1RmZDR1cDRLcExp?=
 =?utf-8?B?R2c9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0d7a6d-df84-405a-dfad-08dc38074122
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 02:44:59.0527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfotekWmJVYJ6sVS3Zfaz9XaFbiIhfxfwWicKGrsicfWCSIgnbX0PX1vxiVL38mCwvk42oL1GhnLZvst0+qG08RWMqpYGUqrOgM6lHjTrMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5447
X-Proofpoint-ORIG-GUID: rVLPasRQpXkEnKShZpPN1CHSxskwOeoI
X-Proofpoint-GUID: z8b5QD64_GQDLdSCZgmQhYWPxtxfyGn9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_02,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402280020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 02:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196320


On 2/27/24 17:41, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Wait. Why is the correct locale not generated? How do other systems do
> it? There's an issue elsewhere, possibly in glibc-locale, and this
> works around that, instead of fixing the original problem.

Hi Alex,


Since SHIFTJIS is not a ISO2022/posix compliant and not in the list of 
glibc locale data support, it was generated by manual with localedef and 
don't have a unified name.


The following name has been already found on different linux:

ja_JP.SJIS ja_JP.SHIFT_JIS ja_JP.shiftjis japanese.sjis


Br,

Xiangyu


>
> Alex
>
> On Tue, 27 Feb 2024 at 09:57, Xiangyu Chen
> <xiangyu.chen@eng.windriver.com> wrote:
>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>
>> Bash has a test case that needs ja_JP shift jis locale.
>>
>> It will check current system has ja_JP.SJIS locale or not, but in yocto,
>> this locale named ja_JP.shiftjis, they are the same.
>> So create a locale alias, making ja_JP.SJIS link to ja_JP.shiftjis.
>>
>> Also add warning message if current system doesn't contain shift jis locale.
>>
>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>> ---
>>   meta/recipes-extended/bash/bash/run-ptest | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/meta/recipes-extended/bash/bash/run-ptest b/meta/recipes-extended/bash/bash/run-ptest
>> index 738ad3c42c..3cafb5e2ea 100644
>> --- a/meta/recipes-extended/bash/bash/run-ptest
>> +++ b/meta/recipes-extended/bash/bash/run-ptest
>> @@ -3,6 +3,7 @@
>>   en_US=`locale -a | grep en_US*`
>>   fr_FR=`locale -a | grep fr_FR*`
>>   de_DE=`locale -a | grep de_DE*`
>> +ja_JP_SJIS=`locale -a | grep ja_JP.shiftjis`
>>
>>   if [ -z "$en_US" ]
>>   then
>> @@ -19,8 +20,28 @@ then
>>           echo "Warning: The de_DE* locales is needed to run the intl.tests, please add it."
>>   fi
>>
>> +if [ -z "$ja_JP_SJIS" ]
>> +then
>> +        echo "Warning: The ja_JP.shiftjis locales is needed to run the intl.tests, please add it."
>> +else
>> +# Yocto generated shiftjis locale named ja_JP.shiftjis, but bash's test script using ja_JP.SJIS
>> +# They are the same one, so add an alias in locale.alias
>> +        if [ -f /usr/share/locale/locale.alias ]
>> +        then
>> +                cp /usr/share/locale/locale.alias /usr/share/locale/locale.alias.bak
>> +        fi
>> +
>> +        echo "ja_JP.SJIS        ja_JP.shiftjis" >> /usr/share/locale/locale.alias
>> +fi
>> +
>> +
>>   useradd bashtest
>>   chown -R bashtest:bashtest tests
>>   setpriv --reuid bashtest --rgid bashtest --clear-groups --reset-env $(dirname "$0")/run-bash-ptests
>>   chown -R root:root tests
>>   userdel -r bashtest
>> +
>> +if [ -f /usr/share/locale/locale.alias.bak ]
>> +then
>> +        mv /usr/share/locale/locale.alias.bak /usr/share/locale/locale.alias
>> +fi
>> --
>> 2.34.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#196244): https://lists.openembedded.org/g/openembedded-core/message/196244
>> Mute This Topic: https://lists.openembedded.org/mt/104599698/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

