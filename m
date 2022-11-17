Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A8DC4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 10:05:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12124.1668679517549523581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 02:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83202e5e84=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AH9KNMQ022129
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 10:05:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kwbu1g80n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 10:05:16 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AHA5GvO019305
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 10:05:16 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kwbu1g80m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Nov 2022 10:05:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Li7NNZaTIwHeauJIc4n+RQIBBCpIZdIWM2ezDclt7rPz13qiAWlKA+vujCH3Gyfp6rjIhbMtGIptSk8/lc0PtATrLf9LDsL21z/iTcapzqGQN5dd0u/+ZC7nJMSsUqqslwDQYGkXpKISX7ZiKp/8ILCC5mTe+TusWMgyZS9rZgV1MZTGZpkynlU3zIoWrHLd3GXakudYIT+8GleI/PqVei9aZLg8Xd1QWHTIxTObYaWQAfjUDOq8tnaGwaxfCOMEOcXbs5/org6rGv+vmfJTwVNadmV7f0jv9rYftNMxEi+6DD5UZkIszMMx6pPhjtz1fJoB1DCuI+VlWU5v0sXIXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjPgzL6OD6FgbMxzwkBUCBOB7j2WieX5rsyWLZ3f75g=;
 b=kRsdS1/nNzDIF+YNZ3jV1pmVS0z3fFZhrprL7RaDsB0XV0Sab1UtFZAZSONymooz6tAQEUvWBC7Otc8pqz2xegVcGg9YoIJ8D1cYwP75mdNauohGAfPtYWsZze9knvEyxZEMzDnsSO96Ia3izrCv6gqvIblJwzhlOnjqVQEHQnHCGFYogR+Zf7NWyaa5FgLSQSkNlkCjjpAjFQwanwSp/scX7sbn5l5ldGRP/4lctDmsXdk1bapDKooKsFRVNJEBbGYo4PNl/8KuySO22PpTazSxeviWU+WGt1LetbRcjF3hoUJQnQ8bZBFtoBmrnnm3i7q39dkvbTJ7ZPIHNhKTzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by MN0PR11MB6134.namprd11.prod.outlook.com (2603:10b6:208:3ca::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Thu, 17 Nov
 2022 10:05:09 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5813.018; Thu, 17 Nov 2022
 10:05:09 +0000
Message-ID: <de88fa52-43b7-b03d-fb81-4c6a6ece789f@windriver.com>
Date: Thu, 17 Nov 2022 18:05:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-Core][kirkstone][PATCH] sudo: fix CVE-2022-43995 potential
 heap overflow for passwords < 8 characters
Content-Language: en-US
To: Randy MacLeod <randy.macleod@windriver.com>,
        "steve@sakoman.com" <steve@sakoman.com>
Cc: Xiangyu Chen <xiangyu.chen@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20221114052721.21489-1-xiangyu.chen@eng.windriver.com>
 <1c2bdea8-c90a-cc38-93aa-e73343395714@windriver.com>
 <2c017856-14ae-b64d-9ade-1a40d6d5c3bd@windriver.com>
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <2c017856-14ae-b64d-9ade-1a40d6d5c3bd@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: YQBPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::36) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|MN0PR11MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: 9156468e-d570-4d56-c4fd-08dac88335bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9+ZenkOVYUcCdaH60hT94fw9GIglFTPIjgX2mR0/HBLTHTErSB8x4k1Bdriphbcd6wEeyEU/PZcNS7ph19r85YIi8rHltIcENPbC/glMhOBF2vVHFTs5rPWVjB45oK0BHCVNr7RFJVFNmtQIbuzg8F2wKROYybTZmCYTjvc+mV8Rm4xSviU4pP8PBm8IZXuRT4bqrZoG5//YobD6tFOse5K1pNVFXZHVQeOYaQTHC0v40CH2btIx8S5IazYDFbfUQk8LN52bowmIuv1AT6euyuEVrRAjTAggKB1Sh01Bto9Xds3A+bLFg+X1sjuIqFtgWZQ5ROBiB5Z+Vd1jW7ZwOZCJOhzZbqc44EUL8yXc31+tarYqElvyZDqJeEt8vadegk2hdaBiGWC9wZ6UGUtr4Q4545Yu0DBN4WXuLOy93+Gzo6dT0ZQuxew2n29tTKUAmIo4Ll1KtDZL5nJIscWIJj5nDudZx/c9EGteBjkeYPXHJ3eGWMud9a2Wd7987GYcMpLqPzJSoI9tWDGPnb0XId5KF2I7ZuFxJq0Hpi54ykgblo77om1X2EVEuapLx5igTcn/p/JPDQ74hl9N2W+Qk4B8lRD7BT2HxAny68mymSoL85q1RZG2/hy9whVAJngcbHNWrSYph9Mibw5piq7Hd1tzm1mE1LGlH4/mbGMT//7n3WBia4Y+HwCSxUjEjCe+UVVO8ttLLD9vsrYpF1l8OHqaWEDwaf4+BzZg55aqQr6lWEX2R07w4/ibZnIjdlAD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39850400004)(376002)(136003)(346002)(451199015)(38100700002)(83380400001)(31696002)(83170400001)(478600001)(6486002)(966005)(53546011)(8936002)(6506007)(6666004)(4326008)(8676002)(66946007)(66556008)(66476007)(41300700001)(316002)(110136005)(186003)(4001150100001)(2906002)(44832011)(5660300002)(9686003)(6512007)(26005)(31686004)(36756003)(66899015)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UkJPYTF5VmZkMmIrUktQWG0ybDEzeld2YUl1RG1VWkVHZHlYSm5iWEdCWHVa?=
 =?utf-8?B?emt0SEZPL0pnMnUzdWFTRHRFUHJYQjU1KzdWWmh0Z2VzVlpaL1RQQ1hWSmhu?=
 =?utf-8?B?Y1BnUmxoa3ByNjUzenQ0M25BSEgzN2FpcW1XZzQ2VU5xMjNsMXBsUUFKMlQ0?=
 =?utf-8?B?dWg1Y0RRdWVPY3pjZTMySTBQQ2dwNTBiSXRneUk0RHM0c2hXZVlLUC9qZnh2?=
 =?utf-8?B?VHdYMFZnN1RLeFlacE5oY3ZaZms2TzJUdVFXTVpqQmlCUTI0ZE16ZVVoZWJh?=
 =?utf-8?B?MlBhVkRxR09xb3N3ZGJ0aGJ0VVVydnhCRW41Nks0SjZSVmVDanlESEV1NmpH?=
 =?utf-8?B?a2diMHhhbENzTnoyY2JuNVVvUHdoM0MxY0ZIY0ZQQU5xbmRQbjc2c1pLRFhj?=
 =?utf-8?B?ZnR3QVY0MkhmOWpQK2dRL0ZhMXpGZ0pOTXU2bUs5KzZiaXNVdHYwN1YwWEpw?=
 =?utf-8?B?UmphMzRqQUZVWEkvVkVZSW9rZU80YmVzVGNKem5WMzJ2S3RHOTRRS3YvUjJ6?=
 =?utf-8?B?eG01bEE4NmNZSmNWQlJrNFFxWmdTcXI3UmlTeElRYS9tQ2YxNk44Y2ZUenVj?=
 =?utf-8?B?L1ltajJVM3JaaVJTNytKWTNuQ0RMRFVOVkpibVJENmNBOTFTSGhCOWErY0VN?=
 =?utf-8?B?SjdGRDZ6SG4yUDE1Y0dXN0FhelNWNVNmWXJYb3pwdXlqK1I5bTdoS1F3bk41?=
 =?utf-8?B?R3pqQm9vYW9kbWJ0eGJmWmZoKzN3WVhFVXc4ZmRnS3A0NGlaK1d6aVUzQ09w?=
 =?utf-8?B?MUVPNTFXZUE5MEhJUWVnMTU5RDZNOUxsWXFoZm0xS1JKNU9PeVpCUXA1c1o4?=
 =?utf-8?B?SU1pNW1nU2h0cXFwLys4aVVxOW9MUlc1TkYralZXMkhSS2tuWG90RzRUelha?=
 =?utf-8?B?WmMrOXp5U010OVhsY21KN3JnS01BRmpaUGMzbmJWVEZqczE2ak5TeEFGNlBM?=
 =?utf-8?B?eGh3blpKR0NPeTFvcGcrNmFHUzhyWGlBWnlRNXFKN0xGS1VyVnlqZHdzYU5D?=
 =?utf-8?B?NE5UL01jTFpkR21mQWdodG0xcng0VGgxM0NGdXJ5YXhhZmxJVlBmQ0wvWFZl?=
 =?utf-8?B?a0hrcjVlckdYamdDYnRQblpnTXFXK1hSbVUvbVkyczFhSTNwYVZQUkpVbHg5?=
 =?utf-8?B?MldzUUx2eFJrNElhR1p3STFoMDNFb0RJRVNhekE3WXZQcUViS1NNaTRSNE1X?=
 =?utf-8?B?UWVlck1OL2RuNlpMNWx3b0NtQUl4MXRMWEU4RlI4OGw2TTEwYnB4QWNBaFBm?=
 =?utf-8?B?dHlhUWptN0MrWlV6ZzFucUlJcjBGUHpkTW9jMzFrOVNXaDRGam0zc0Z4NWZw?=
 =?utf-8?B?RWJWWkhKKysxLzhKOWYzVEM3ek1seTVYZ01TalpMNVpzQXA3bFhWeXdSQWtV?=
 =?utf-8?B?UVEycFJnVTBWY3JLN251WE1BejU2WVllSGJzbDhuVmZteWpyRHJUbE1wdHNU?=
 =?utf-8?B?RDZDUUZkeUpCLzVLVnRLbExEQjlzdVJFL1Jvcko0NEE5QVVlTTlxakRYOFk2?=
 =?utf-8?B?b3pqY1RMSitxY0JUaERLd0tsUlJLMU5MMzhOTCtvRjhFVWQ1c0ZZa1FnOWNa?=
 =?utf-8?B?bzhJUWMzYzdKZ2x1NjRUdGNSME02ZFR5VWh2R3ErTUVXSE5hR2FpR1A1YlBM?=
 =?utf-8?B?a1pSTUZzMnZBRmVxeHUxSHpraDdRemdrM0hkTjhHYWRleFM1NStqdlREK1NV?=
 =?utf-8?B?M0FzK3AvRTFiZkVGRDdvb092ZGo0L3JFVzk2aGxuZ0tIOWpESitDeDRiaWZH?=
 =?utf-8?B?TTVqRzZGSS9ienI0R2ZMR2VRSnZQMkduZmxvSE1NMndsNDhXNzR2b1k0OVlz?=
 =?utf-8?B?TmtQc0p6UWFzRmdmUlczWmJMNGhnR0ErUzFuVkpOTllYaStkQTlHQUR3QU45?=
 =?utf-8?B?dUkreDM1a0t1OFNQd0FyK3QxZkljU3VnVlV5UXVpVmlKSGUrb0twUDBneitp?=
 =?utf-8?B?YWVzenI3ejh6ZkJmdWZtTENYN25US0ZPVkNZYTNsd201dmdwY1R5S1NmRjJs?=
 =?utf-8?B?SjdMYTBsWTZxak4vOGNKNy9GVzBydk5xZjl0dCsrcEhVNk5wZHB4NHowU0Fk?=
 =?utf-8?B?bkdrZWFrWlB5c043WmFXR0VxOTFMVjBuWHpkaUoweWEzTHg0cHhJd1Q3QmVy?=
 =?utf-8?B?anMyQm11NHdoYzJvdGptMDJ3U0tNSnZuTHFuN3g5SGpCSHF5bXI5cE5TWmNu?=
 =?utf-8?B?Z3c9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9156468e-d570-4d56-c4fd-08dac88335bc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 10:05:09.6055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vrEQj49rEu8mJdmAExNoxC6z2DXAfhcRaSpeDc+dDr/PL/bSVwbq2XWsK3aDrW04o1uhg8PwwRZmJ15zuw4OEAOtR2AAm32dqreaulZAjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6134
X-Proofpoint-GUID: 2u633h2VgWllY2OZzJD0xiUENQGbqDVu
X-Proofpoint-ORIG-GUID: iwU1hAHqtWQ-4R7i3LkxCa7sT-qJSwwQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170077
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2AH9KNMQ022129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 10:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173411


On 11/16/22 02:21, Randy MacLeod wrote:
> On 2022-11-15 14:08, Randy MacLeod wrote:
>> Thanks Xiangyu but for kirkstone/langdale I think we should take the=20
>> patch update:
>> =C2=A0 sudo: upgrade 1.9.12 -> 1.9.12p1
>> that was sent to the list for master since it includes this CVE fix=20
>> and more bug fixes:
>>
>> $ git log --oneline SUDO_1_9_12..SUDO_1_9_12p1 | cut -c -99
> Oops, I'm wrong. Please consider taking the patch backport for now.
>
> This patch is for 1.9.10 and master is on 1.9.12 going to 1.9.12p1.
>
> It may be sensible to update from 1.9.10 to 1.9.12p1 but I haven't look=
ed
> at that yet. It seems that the 'sudo-1.9' branch (1) is stable so=20
> someone should
> look into the list of changes made on that branch to see how=20
> disciplined the sudo maintainers
> have been.
>
>
> ../Randy


Hi Steve and Randy,


Could you please ignore this patch.

I checked the sudo 1.9 branch from 1.9.10 to 1.9.12p1, most of commits=20
are bug fix/security fix, and others like test/debug/output string change=
s.

So, we can take a small upgrade from 1.9.10 to 1.9.12p1.

Another patch has been sent to the list:

for kirkstone:

https://lists.openembedded.org/g/openembedded-core/message/173409 /=20
https://patchwork.yoctoproject.org/project/oe-core/patch/20221117095236.2=
423969-1-xiangyu.chen@eng.windriver.com/

for langdale:

https://lists.openembedded.org/g/openembedded-core/message/173410 /=20
https://patchwork.yoctoproject.org/project/oe-core/patch/20221117095450.2=
424717-1-xiangyu.chen@eng.windriver.com/


Thanks;


Br,

Xiangyu


>
> 1)
>
> $ cd .../sudo.git
>
> $git branch -a
> =C2=A0 main
> =C2=A0 master
> * sudo-1.9
> =C2=A0 remotes/origin/HEAD -> origin/master
> =C2=A0 remotes/origin/audit-server-tls-support
> =C2=A0 remotes/origin/main
> =C2=A0 remotes/origin/master
> =C2=A0 remotes/origin/sudo-1.7
> =C2=A0 remotes/origin/sudo-1.8
> =C2=A0 remotes/origin/sudo-1.9
> =C2=A0 remotes/origin/sudoers-iolog-tls
> =C2=A0 remotes/origin/tls-config-default-values
>
> $ git branch -a --contains SUDO_1_9_10
> * sudo-1.9
> =C2=A0 remotes/origin/sudo-1.9
>
> $ git branch -a --contains SUDO_1_9_12p1
> * sudo-1.9
> =C2=A0 remotes/origin/sudo-1.9
>
>> 7a103879a Merge sudo 1.9.12p1 from tip.
>> 3df1e9a07 sudo 1.9.12p1
>> 7ba318470 Include time.h for struct timespec used by sudo_iolog.h.
>> b2c8e1b1b Display sudo_mode in hex in debug log. This makes it easier=20
>> to match against the MODE_ de
>> 7ec1ee0e5 bsdauth_verify: do not write to prompt, it is now const
>> d242261dd Store raw sudoers lines in the debug log. Also add a=20
>> "sudoerslex" prefix to the token deb
>> 966731311 The line numbers in sudoers_trace_print() were off by one.=20
>> The line counter is incremente
>> 4da22b101 Make the second arg to the sudo auth verify function const.=20
>> This may be either a plaintex
>>
>> bd209b9f1 Fix CVE-2022-43995, potential heap overflow for passwords <=20
>> 8 characters. Starting with s
>>
>> c78e78dc5 Move debugging info from hostname_matches() to host_matches(=
).
>> 6a3fb3fd7 Add debugging to sudo_set_grlist() and sudo_set_gidlist().
>> 366217571 configure: better test for -fstack-clash-protection The gcc=20
>> front-end may accept -fstack-
>> 6a2075b67 Check that compiler accepts -fstack-clash-protection and=20
>> -fcf-protection. Previously, we
>> 794449419 Fix compilation error on Linux/mips.
>> 3d2b84ed2 Added tag SUDO_1_9_12 for changeset b53d725f7c88
>>
>> ../Randy
>>
>> On 2022-11-14 01:27, Xiangyu Chen via lists.openembedded.org wrote:
>>> Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
>>> ---
>>> =C2=A0 ...95-potential-heap-overflow-for-passw.patch | 57=20
>>> +++++++++++++++++++
>>> =C2=A0 meta/recipes-extended/sudo/sudo_1.9.10.bb=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 1 +
>>> =C2=A0 2 files changed, 58 insertions(+)
>>> =C2=A0 create mode 100644=20
>>> meta/recipes-extended/sudo/files/0001-Fix-CVE-2022-43995-potential-he=
ap-overflow-for-passw.patch
>>>
>>> diff --git=20
>>> a/meta/recipes-extended/sudo/files/0001-Fix-CVE-2022-43995-potential-=
heap-overflow-for-passw.patch=20
>>> b/meta/recipes-extended/sudo/files/0001-Fix-CVE-2022-43995-potential-=
heap-overflow-for-passw.patch=20
>>>
>>> new file mode 100644
>>> index 0000000000..be52af27e1
>>> --- /dev/null
>>> +++=20
>>> b/meta/recipes-extended/sudo/files/0001-Fix-CVE-2022-43995-potential-=
heap-overflow-for-passw.patch
>>> @@ -0,0 +1,57 @@
>>> +From bd209b9f16fcd1270c13db27ae3329c677d48050 Mon Sep 17 00:00:00 20=
01
>>> +From: "Todd C. Miller" <Todd.Miller@sudo.ws>
>>> +Date: Fri, 28 Oct 2022 07:29:55 -0600
>>> +Subject: [PATCH] Fix CVE-2022-43995, potential heap overflow for=20
>>> passwords < 8
>>> + characters. Starting with sudo 1.8.0 the plaintext password buffer =
is
>>> + dynamically sized so it is not safe to assume that it is at least=20
>>> 9 bytes in
>>> + size. Found by Hugo Lefeuvre (University of Manchester) with=20
>>> ConfFuzz.
>>> +
>>> +Upstream-Status: Backport from
>>> +[https://github.com/sudo-project/sudo/commit/bd209b9f16fcd1270c13db2=
7ae3329c677d48050]=20
>>>
>>> +
>>> +Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
>>> +---
>>> + plugins/sudoers/auth/passwd.c | 11 +++++------
>>> + 1 file changed, 5 insertions(+), 6 deletions(-)
>>> +
>>> +diff --git a/plugins/sudoers/auth/passwd.c=20
>>> b/plugins/sudoers/auth/passwd.c
>>> +index b2046eca2..0416861e9 100644
>>> +--- a/plugins/sudoers/auth/passwd.c
>>> ++++ b/plugins/sudoers/auth/passwd.c
>>> +@@ -63,7 +63,7 @@ sudo_passwd_init(struct passwd *pw, sudo_auth *aut=
h)
>>> + int
>>> + sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth,=20
>>> struct sudo_conv_callback *callback)
>>> + {
>>> +-=C2=A0=C2=A0=C2=A0 char sav, *epass;
>>> ++=C2=A0=C2=A0=C2=A0 char des_pass[9], *epass;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 char *pw_epasswd =3D auth->data;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 size_t pw_len;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int matched =3D 0;
>>> +@@ -75,12 +75,12 @@ sudo_passwd_verify(struct passwd *pw, char=20
>>> *pass, sudo_auth *auth, struct sudo_c
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Truncate to 8 chars if standard DES=
 since not all crypt()'s=20
>>> do this.
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0 * If this turns out not to be safe we will=
 have to use OS=20
>>> #ifdef's (sigh).
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +-=C2=A0=C2=A0=C2=A0 sav =3D pass[8];
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 pw_len =3D strlen(pw_epasswd);
>>> +-=C2=A0=C2=A0=C2=A0 if (pw_len =3D=3D DESLEN || HAS_AGEINFO(pw_epass=
wd, pw_len))
>>> +-=C2=A0=C2=A0=C2=A0 pass[8] =3D '\0';
>>> ++=C2=A0=C2=A0=C2=A0 if (pw_len =3D=3D DESLEN || HAS_AGEINFO(pw_epass=
wd, pw_len)) {
>>> ++=C2=A0=C2=A0=C2=A0 strlcpy(des_pass, pass, sizeof(des_pass));
>>> ++=C2=A0=C2=A0=C2=A0 pass =3D des_pass;
>>> ++=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Normal UN*X password check.
>>> +@@ -88,7 +88,6 @@ sudo_passwd_verify(struct passwd *pw, char *pass,=20
>>> sudo_auth *auth, struct sudo_c
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * only compare the first DESLEN chara=
cters in that case.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 epass =3D (char *) crypt(pass, pw_epasswd);
>>> +-=C2=A0=C2=A0=C2=A0 pass[8] =3D sav;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (epass !=3D NULL) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (HAS_AGEINFO(pw_epasswd, pw_len) && strl=
en(epass) =3D=3D DESLEN)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 matched =3D !strncm=
p(pw_epasswd, epass, DESLEN);
>>> +--
>>> +2.34.1
>>> +
>>> diff --git a/meta/recipes-extended/sudo/sudo_1.9.10.bb=20
>>> b/meta/recipes-extended/sudo/sudo_1.9.10.bb
>>> index aa0d814ed7..e1f603a125 100644
>>> --- a/meta/recipes-extended/sudo/sudo_1.9.10.bb
>>> +++ b/meta/recipes-extended/sudo/sudo_1.9.10.bb
>>> @@ -4,6 +4,7 @@ SRC_URI =3D "https://www.sudo.ws/dist/sudo-${PV}.tar.=
gz \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'pam',=20
>>> '${PAM_SRC_URI}', '', d)} \
>>> file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
>>> file://0001-lib-util-mksigname.c-correctly-include-header-for-ou.patc=
h=20
>>> \
>>> +=20
>>> file://0001-Fix-CVE-2022-43995-potential-heap-overflow-for-passw.patc=
h=20
>>> \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "
>>> =C2=A0 =C2=A0 PAM_SRC_URI =3D "file://sudo.pam"
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#173225):=20
>>> https://lists.openembedded.org/g/openembedded-core/message/173225
>>> Mute This Topic: https://lists.openembedded.org/mt/95013602/3616765
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe:=20
>>> https://lists.openembedded.org/g/openembedded-core/unsub=20
>>> [randy.macleod@windriver.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>
>

