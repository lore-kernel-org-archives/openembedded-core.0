Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEC9C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 03:02:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6110.1699412525077647363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 19:02:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9676a13196=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A82dQCL017881
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Nov 2023 03:02:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w3y07d8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 03:02:04 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3A8323gr024832;
	Wed, 8 Nov 2023 03:02:03 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w3y07d6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Nov 2023 03:02:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IH8ok86VAgj+V8XTsd+AdF/B96DHeEM39vjHRC8j+/g4egmlS3qlVlx02mCXkIwv/WgiWVoONKtBvEApgzP4F9sHy9ZY7XZudl4RzjCQiQ76Tu/Owe8dV0cBLUeE6SCcf/J/RqxntCgvzX0WivAcwNCYSir2n7WRosx/p9EPAhK4BxoMeKOZTfuBeNhAdHp6cyJsPC7QAUXmgmcJpa3LNx9EwBHb84kbIi+E5ijfOpM9tz+R0V9ox8XTe4GV8PrjUiX+C0wupnMvTRXSzfA/KH3wDcnd1uTmk4SXre0NbjNZPOr/vtBE+5pUtBcyqzTpe3XuQEjHIlqQE/I0SbvHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZqipGkPVjHCFmxyvZyD3uYzhdtRX2T9KJXl1Hhy1HA=;
 b=D/elmuyLljYKjYIuL/dKMgKZqxj5LfgEiDnTko5PulaoQMqwV76boPvexAYo0gSrKTjj4ruB0QaX4IOCsMv4DPGI1wp15/7eCeOMTkLcrlH6wdV2H9iCT2alwhU6NgBdgtJTd+TgJ7yUzc67wEr5U6F6jZQE7xOLqcy8iFs60s6r63P/jdBDp3VyY11Zsy2ouBHcHuh1Vm1Pp4IAHy2yYOWE3I8AYAxbjhvhi8LPTrUX16UKuotUJhLxSpVH/Dty70f7EVEzUBZyrCxYaGJOY59tMvgWFDmjKaiJwdRxEeF3sXp2TR6T8Xi6PA/VjuObK2mE4Xxm/deucxUkrazYiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by BL3PR11MB6314.namprd11.prod.outlook.com (2603:10b6:208:3b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 03:02:00 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 03:01:59 +0000
Message-ID: <680e15e3-1884-f608-4a62-7b3b8c08e6e9@windriver.com>
Date: Wed, 8 Nov 2023 11:01:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [OE-core][master][mickledore][PATCH] grub2: fix CVE-2023-4692
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
        Steve Sakoman <steve@sakoman.com>
References: <20231020080914.1377762-1-xiangyu.chen@eng.windriver.com>
 <202310202246598ced9e5d@mail.local>
 <CAOSpxdZGo_xZ8vq6x2hhH-BWx3EeRbN6VHJBngumeBeVz0b_Pw@mail.gmail.com>
Content-Language: en-US
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <CAOSpxdZGo_xZ8vq6x2hhH-BWx3EeRbN6VHJBngumeBeVz0b_Pw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0059.jpnprd01.prod.outlook.com
 (2603:1096:405:2::23) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|BL3PR11MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: 8680f864-27f8-4ccd-bcca-08dbe0071346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XHqYv6bSF7TA6NYN5XPk8FhtlEoFty9mVLqjDZhOA5G14IHkEQsTIksHXEoib3Oyzdj7Rv/gUJUWcchWCm0Bhhw3MFgkFia7xDwCL6CaKDXEiAihMPX+D5qkZ1x5kZJ87cSx+xNdvAckDWveZ7m8bXVx7zWxpZkdzADzoFQFmosrETgCVgOPQA7iLyU2BbMoLszC2Key9tkwIQrQDo0XLVOQN0R49uByHMvmWDqharZbstltWiqOF3uDzG25PZhesNNDE4zsRzJ4GHkaTTGG4W1xiO0MyVH7nQbjtBY97PrUmxUiaWpuvKgqqDLfTM37voMukf0U5Ln/1WycXD87nGtkDybQKcJbhyoFzfucHRD1SgHcWIQna9z5cImldbinb/QHuotnC4TBTi+ucV/b+ZMtP9cR0bC/RazSwzKF4uc9nkwPSzO//bJyfRx4lRHuWDeOZ+1fH5KMbUEa5CZUGAwkaDN0maMrbelVRWFU60zQbI91n2MetP7FSIR5JFKGrHVF1CjrUQh+ZBmsJRfA33Ovs8BjaTVJZpC2G46TnE9U+GCGw1EvjSgoLNosX1dfr+FaRTYThflGVCPpF/gRV3J3na9fh49zDys3oWBnRO0mhvg7bxwAF6PFzIvNqHdrmMZpFINkt/be9nL4d8czUTpizorHVdUENfdHPTtyAWZEMGhOac/8pyE+mt5pv3IQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(39850400004)(366004)(136003)(230173577357003)(230922051799003)(230273577357003)(451199024)(1800799009)(64100799003)(186009)(478600001)(6512007)(9686003)(41300700001)(44832011)(6486002)(53546011)(6506007)(966005)(6666004)(5660300002)(83380400001)(8676002)(8936002)(2906002)(4326008)(26005)(66476007)(66946007)(66556008)(316002)(6916009)(83170400001)(31686004)(31696002)(38100700002)(66899024)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Znloakdnbm5YN3pReWwyYmdRVDVpRGpkVVU3d1h6U3EzYVFDVnRqMUNWMEJl?=
 =?utf-8?B?S3AyUVoyeVRGVnIzU3h4Nnd4b0dMZkUrU0dMc2JEVmdoa3lhRGRPNlNNRUZi?=
 =?utf-8?B?cFFiOFpyUnZsaUxab0VDbzkycmJIYWlvSzdSZi9PMy9KMlpWQk9oWnoxU3Jq?=
 =?utf-8?B?RWRJODJ1NThDdzYyeXJrZEhUdlJ3Rk54VXZVTkxub01vQnROV1lYbzV3ai9V?=
 =?utf-8?B?MlR4ZG1IWFpucEFHeHJUZlhzZytNZkFKdi9lQWdmYXJ3MU9iTkpIYUNGWlhI?=
 =?utf-8?B?NnNHUkIvaDhvdFJNVHpzZHA1WkUzZkhVV0NIZ2lrc1ZrSlE2THVHWTAxb01q?=
 =?utf-8?B?TE9BQkJ2MVhGZEZTRUpUK2U5U1daOEtnTHpMYmUrSUpwSXF0WmJBZ3Q2c3My?=
 =?utf-8?B?aU1oNk0xamdPS1lPK0Vyb21lYSsrQy90VC9XV01OUldYZVVFV1BKTGxTSzN3?=
 =?utf-8?B?UlA5YnVmcHdIVG9OcG00NnpSSWJjMGg5azBocXAyUWdlSWpTZitSY004WHFF?=
 =?utf-8?B?eWN3a0d3SHI2U0prTHBXZWoyYjJmZ3QwUGlaK09mUFFZNXRkWFFxWHBaRjhx?=
 =?utf-8?B?cFh0Q3g3ZkVrRWg2MG1idi9ZWVRwQm5YcmRTbGhPV2h6K1NVeTc3TDltbGcw?=
 =?utf-8?B?Nk91bTVtc0htdjRrREJlT25idk8wTU1DNFRvUDZZMDJoTnduTURjbDYwZU15?=
 =?utf-8?B?TVdBeXRwWHpOMTQzS3B4RkxveTdvRjU5T3E4U0V5NUNYQzJUeWdsUmpQMlFR?=
 =?utf-8?B?OU1XT3V4N1A5Y0hEb2xJeHo4T2NOeVZhU21zYzZuUXl5Y040cWh0LzRLZEU2?=
 =?utf-8?B?WlN5ZzI0cHpKRldjbEFjSUo0V1IyTWZZREx5WUw5dHdQYmkyUjRwckd6ejQr?=
 =?utf-8?B?YlZxQklCY0pSL3VJWE5GTXZCM2JGZmx3c1U2V3hDc0hSYXFmWVBVWlpCWDRJ?=
 =?utf-8?B?NDRlZXV5U1Q0V1RsNmo3VlkvakpuUXZ1NGdabElrbmxabDlFcWlaSU5hdDJ3?=
 =?utf-8?B?N1dsUGY0UkwzdXV6OUdJRndSODN0c3NYSTJlV0pXQUdrZHk3VTgyY3lSOFlt?=
 =?utf-8?B?Y1BKeUlOOFgyQnlURjlEazRSWjBQakdIRm9ZTzRWL1lxQkhmQ2k1TE5ZYUlv?=
 =?utf-8?B?ZkdnclVPZ0RqRW1tam9FZjBmOVFQZ1I4OWNiMEh0c3I4THZQYTVoZGNnYW1h?=
 =?utf-8?B?eXF1NmlKV25ob1pnSC9WZ3RUUSs1M09YalRuR3lEMnZhd2RrbC95T0tuZzRx?=
 =?utf-8?B?VzhUdnc4NGZENWZKbGxHQ0JRWEVVWTJIN1h1SmhsYmJZOVRUellkaTZocE8x?=
 =?utf-8?B?MUlZVlBTMHlaVlY1WWdvcmJ1bnlyYUZWaU0zZHc0cnk0b2lQUkNmeXAxRWlq?=
 =?utf-8?B?RmhmTHc2dTNndzkrb25qNU1palU3U3pjdldnZlZXYWVXUFZtWVFuVU5LbXIv?=
 =?utf-8?B?ZW1CT2RrTkk5am5NVWZVb2l1eUprdlc0aytESDRtQmpjb3l4M2hoVkdwanhk?=
 =?utf-8?B?NkpDNkJmS2M3TU1iTlJaaTd0QTlKSjczUTRVaW1jeDJhbko0UWZSSEZYUUwx?=
 =?utf-8?B?TVVmSDhIM1hWWmd4RDNkZWhHTUZrMVdwRGpsRVhHbVFwK0tZd3loQjN6SHBw?=
 =?utf-8?B?M1o4U2E0UnBEWWlkM0g3MGo4b0lUdTRnWVZUZjZwRGtsNHhWdFB6VDdaKzU0?=
 =?utf-8?B?Q2ZIWm91K3d2ajJxNm5Ob1hxTjFUcVBiK0VsaVM5OUJtYmJVL0NvTUxpY3RL?=
 =?utf-8?B?NHkwTzZ5aFV1ZFlFNXQrTithVnVjbFNkUzRxcG0yL2JKQXpnY0NET21RNWRK?=
 =?utf-8?B?TmV6NGs2SjJrbWlRTnlMSi9vdVNEaFFJaWh6dFBJejF2SHF3MHhDSzRJTWhX?=
 =?utf-8?B?K2ZEUGZnUGdWd0RUOEVFVDJNUHJJNjlBay9ObDdMQXVDVnRCYm4yYzh3d3o5?=
 =?utf-8?B?b0RrYkM0dlhkT1ljejdIZGlhY3hLRlpZT3Z6czVFeVl4RlNsM1F4V1pmeWdw?=
 =?utf-8?B?OWV0R1VWay9rM3ZzTm1lcEREMUFkbzYxWTErLzNZM3Vzbnk0cjVRQW9NTUgx?=
 =?utf-8?B?T2c5VXlBS1lCOXJIYUlQaHR1YmliWVZUZnpjeXl5aS9TMkRQMlIySlRzNWF4?=
 =?utf-8?B?aFNwdithZGxzQVU1U2ptUzJtK21wLzRJcWc2bmdwdGdwNm1qRi9GR1pVUWZw?=
 =?utf-8?B?MlE9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8680f864-27f8-4ccd-bcca-08dbe0071346
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 03:01:59.7351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y12PNevwA3RkrS6eBLvg0lg5Hrh1EYIV7ni/rOGjWRZzFKrAVY4Q4P26t5nr8RjbbH2KaL21TCjuvioOoeqU0xh+RzHF0oUn+5JfjavMxpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6314
X-Proofpoint-GUID: 8Y8DR1CcX0bGAvwCxvRPtdhu0CcbEW3W
X-Proofpoint-ORIG-GUID: z3ts9-ZAVweMaAhiRxkfud30Rd1K7AC9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-08_01,2023-11-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311080023
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3A82dQCL017881
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 03:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190301


On 11/6/23 23:50, Steve Sakoman wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, Oct 20, 2023 at 12:47=E2=80=AFPM Alexandre Belloni via
> lists.openembedded.org
> <alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>> Hello,
>>
>> This doesn't apply on master, can you rebase?

Hi Alex,


I tried on latest version of master oe-core, the patch can be applied=20
and compiled without error, could you please help to append the error=20
log in your setup? thanks!


> I can't take this patch for nanbield or mickledore until it is
> accepted in master, so all branches are waiting for an updated patch
> for master!
>
> Steve
>
>> On 20/10/2023 16:09:14+0800, Xiangyu Chen wrote:
>>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>>
>>> Crafted file system images can cause heap-based buffer overflow and m=
ay
>>> allow arbitrary code execution and secure boot bypass
>>>
>>> Reference:
>>> https://security-tracker.debian.org/tracker/CVE-2023-4692
>>>
>>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>>> ---
>>>   .../grub/files/CVE-2023-4692.patch            | 98 ++++++++++++++++=
+++
>>>   meta/recipes-bsp/grub/grub2.inc               |  1 +
>>>   2 files changed, 99 insertions(+)
>>>   create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4692.patch
>>>
>>> diff --git a/meta/recipes-bsp/grub/files/CVE-2023-4692.patch b/meta/r=
ecipes-bsp/grub/files/CVE-2023-4692.patch
>>> new file mode 100644
>>> index 0000000000..305fcc93d8
>>> --- /dev/null
>>> +++ b/meta/recipes-bsp/grub/files/CVE-2023-4692.patch
>>> @@ -0,0 +1,98 @@
>>> +From 43651027d24e62a7a463254165e1e46e42aecdea Mon Sep 17 00:00:00 20=
01
>>> +From: Maxim Suhanov <dfirblog@gmail.com>
>>> +Date: Mon, 28 Aug 2023 16:31:57 +0300
>>> +Subject: [PATCH] fs/ntfs: Fix an OOB write when parsing the $ATTRIBU=
TE_LIST attribute
>>> + for the $MFT file
>>> +
>>> +When parsing an extremely fragmented $MFT file, i.e., the file descr=
ibed
>>> +using the $ATTRIBUTE_LIST attribute, current NTFS code will reuse a =
buffer
>>> +containing bytes read from the underlying drive to store sector numb=
ers,
>>> +which are consumed later to read data from these sectors into anothe=
r buffer.
>>> +
>>> +These sectors numbers, two 32-bit integers, are always stored at pre=
defined
>>> +offsets, 0x10 and 0x14, relative to first byte of the selected entry=
 within
>>> +the $ATTRIBUTE_LIST attribute. Usually, this won't cause any problem.
>>> +
>>> +However, when parsing a specially-crafted file system image, this ma=
y cause
>>> +the NTFS code to write these integers beyond the buffer boundary, li=
kely
>>> +causing the GRUB memory allocator to misbehave or fail. These intege=
rs contain
>>> +values which are controlled by on-disk structures of the NTFS file s=
ystem.
>>> +
>>> +Such modification and resulting misbehavior may touch a memory range=
 not
>>> +assigned to the GRUB and owned by firmware or another EFI applicatio=
n/driver.
>>> +
>>> +This fix introduces checks to ensure that these sector numbers are n=
ever
>>> +written beyond the boundary.
>>> +
>>> +Fixes: CVE-2023-4692
>>> +
>>> +Upstream-Status: Backport from
>>> +[https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D43651027d24=
e62a7a463254165e1e46e42aecdea]
>>> +CVE: CVE-2023-4692
>>> +
>>> +Reported-by: Maxim Suhanov <dfirblog@gmail.com>
>>> +Signed-off-by: Maxim Suhanov <dfirblog@gmail.com>
>>> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
>>> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>>> +---
>>> + grub-core/fs/ntfs.c | 18 +++++++++++++++++-
>>> + 1 file changed, 17 insertions(+), 1 deletion(-)
>>> +
>>> +diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c
>>> +index bbdbe24..c3c4db1 100644
>>> +--- a/grub-core/fs/ntfs.c
>>> ++++ b/grub-core/fs/ntfs.c
>>> +@@ -184,7 +184,7 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8=
_t attr)
>>> +     }
>>> +   if (at->attr_end)
>>> +     {
>>> +-      grub_uint8_t *pa;
>>> ++      grub_uint8_t *pa, *pa_end;
>>> +
>>> +       at->emft_buf =3D grub_malloc (at->mft->data->mft_size << GRUB=
_NTFS_BLK_SHR);
>>> +       if (at->emft_buf =3D=3D NULL)
>>> +@@ -209,11 +209,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uin=
t8_t attr)
>>> +         }
>>> +       at->attr_nxt =3D at->edat_buf;
>>> +       at->attr_end =3D at->edat_buf + u32at (pa, 0x30);
>>> ++      pa_end =3D at->edat_buf + n;
>>> +     }
>>> +       else
>>> +     {
>>> +       at->attr_nxt =3D at->attr_end + u16at (pa, 0x14);
>>> +       at->attr_end =3D at->attr_end + u32at (pa, 4);
>>> ++      pa_end =3D at->mft->buf + (at->mft->data->mft_size << GRUB_NT=
FS_BLK_SHR);
>>> +     }
>>> +       at->flags |=3D GRUB_NTFS_AF_ALST;
>>> +       while (at->attr_nxt < at->attr_end)
>>> +@@ -230,6 +232,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uint=
8_t attr)
>>> +       at->flags |=3D GRUB_NTFS_AF_GPOS;
>>> +       at->attr_cur =3D at->attr_nxt;
>>> +       pa =3D at->attr_cur;
>>> ++
>>> ++      if ((pa >=3D pa_end) || (pa_end - pa < 0x18))
>>> ++        {
>>> ++          grub_error (GRUB_ERR_BAD_FS, "can\'t parse attribute list=
");
>>> ++          return NULL;
>>> ++        }
>>> ++
>>> +       grub_set_unaligned32 ((char *) pa + 0x10,
>>> +                             grub_cpu_to_le32 (at->mft->data->mft_st=
art));
>>> +       grub_set_unaligned32 ((char *) pa + 0x14,
>>> +@@ -240,6 +249,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uint=
8_t attr)
>>> +         {
>>> +           if (*pa !=3D attr)
>>> +             break;
>>> ++
>>> ++              if ((pa >=3D pa_end) || (pa_end - pa < 0x18))
>>> ++                {
>>> ++              grub_error (GRUB_ERR_BAD_FS, "can\'t parse attribute =
list");
>>> ++              return NULL;
>>> ++            }
>>> ++
>>> +           if (read_attr
>>> +               (at, pa + 0x10,
>>> +                u32at (pa, 0x10) * (at->mft->data->mft_size << GRUB_=
NTFS_BLK_SHR),
>>> +--
>>> +cgit v1.1
>>> +
>>> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/=
grub2.inc
>>> index 41839698dc..5ce8699363 100644
>>> --- a/meta/recipes-bsp/grub/grub2.inc
>>> +++ b/meta/recipes-bsp/grub/grub2.inc
>>> @@ -42,6 +42,7 @@ SRC_URI =3D "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
>>>              file://CVE-2022-3775.patch \
>>>              file://0001-risc-v-Handle-R_RISCV_CALL_PLT-reloc.patch \
>>>              file://0001-fs-ext2-Ignore-checksum-seed-incompat-featur=
e.patch \
>>> +           file://CVE-2023-4692.patch \
>>>   "
>>>
>>>   SRC_URI[sha256sum] =3D "23b64b4c741569f9426ed2e3d0e6780796fca081bee=
4c99f62aa3f53ae803f5f"
>>> --
>>> 2.34.1
>>>
>>>
>>>
>>
>> --
>> Alexandre Belloni, co-owner and COO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#189580): https://lists.openembedded.org/g/openembe=
dded-core/message/189580
>> Mute This Topic: https://lists.openembedded.org/mt/102077193/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

