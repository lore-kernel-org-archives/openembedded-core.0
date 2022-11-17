Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7D2C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 01:44:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5176.1668649442279929576
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 17:44:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83202e5e84=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AH1i2bg004804
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 17:44:02 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ktbvrbrh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 17:44:01 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AH1i16r004756
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 17:44:01 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ktbvrbrh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Nov 2022 17:44:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZbalDQEX595mmhjmaKt6n8jvTEgv/d009Nh5PxsOqvmxvn4YXtDG/ESscpJs2mOs8Tm7fbYRjiTFxKkQTk1A0STxhPZ0fXTlxS1PyVXlndaoJsvctSOqkyNhJ8/Y3SIMhBl67/z3Q6uHOaqYokXOCaheOtw0/TGbrtyW0X8EEQX/vEX56q7LsJUCvEFPCoLOxfNdr9gJSm8boAaz1zLL9TNkkXiMr51i0sfRYNljBgg2IIPA224eiXQHYpLw+nvlGqyl90bH+GVjIGaRIWJRtJ4IJypCy2ZAm5iu8vCZW7KVbmprl8Vm1jYK4u1CfScUbq2zgyrVTW3IjKr6MecpWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XkOxOZBlj6sCwBAvcmHsbbh0ib7dsynOVDCzoOlvIgI=;
 b=hNhEP4vKQCcgriSHLuLMB/FtChuNweqpzru8uXePVmfWcpfdO6/VHX0+tDUqEtJNkAE1lnJSN0+7AE+aOYV7u0/gJJPL7enofRUQmT+kb7oFwgR1MBuDKoB6MUpWNPW2cCZKyKynilt+FfFK4uY/Glg6P2ON0D9JXy0Vccz7+Jd4NWiXEoqX5HutxxEqou0VGwY8sLitQh1MgvaRyZGa652uIH5M3MLiOu9YqyC9m6S6Sr4HcpD2vxS1ftglV/QBMl6cvtT4tTNJ4sBvJMMtn1ZM9TAG4d085Qq6reN+REE0ev5EjmpIfVFjqVsGGuVAV/9vBcivTY/PWeJkAYdtSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by LV2PR11MB6000.namprd11.prod.outlook.com (2603:10b6:408:17c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Thu, 17 Nov
 2022 01:43:57 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5813.018; Thu, 17 Nov 2022
 01:43:57 +0000
Message-ID: <bb134142-7135-879e-bf46-b3ce71df2ecb@windriver.com>
Date: Thu, 17 Nov 2022 09:43:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-Core][master][kirkstone][PATCH V2] rng-tools: Add Arm aarch64
 CPU specific configuration to address excessive CPU usage on startup
Content-Language: en-US
From: xiangyu.chen@eng.windriver.com
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <172352CEDDCB35BE.6436@lists.openembedded.org>
 <d26c2ba8-eb2c-5a72-e7ee-e1ad89e95444@windriver.com>
 <CAMKF1soeerVU3hLV+UG7HzBkNkN2MYddoPj3S49oQg=fHRCbcw@mail.gmail.com>
 <17252C632166F148.18251@lists.openembedded.org>
In-Reply-To: <17252C632166F148.18251@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SL2P216CA0151.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::6) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|LV2PR11MB6000:EE_
X-MS-Office365-Filtering-Correlation-Id: a6b6d04b-ca48-44ea-55a9-08dac83d30fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I+FkgWfAOZbjytrTJ/iu1QgDIsfK71HZ/ZXbhwVuX031pS9n7t67OFrM/zit+yzR3Ll4s/xEHl/S2pzHtaQitqN78l+DCEU9f8RkpJyhlS6aVGYcnhKQi3tmSGGK/1iJ7Hj+oWBRKoTxa1SQ9Q1IXL1YIF8cYDfll4t1Athoz5sTAr38d5v6bwC+NuXs0IossBxrm5wZUMZqoSiBxmtAw2RwCFJjKYzvJMr3jsgf071Ttu+BrhH6WAcIi+xRhspicjRxQBjXxySquJYgXlQLH3BNIlL7emj56933qxOG8v+ZeBP8DEpeGvA4XsUd6rNg4+e7AIawggKWNcqOprOsgbOgrW5e82EZiLXo3M3CuFkFRPqKzgPB86x30/BAund/oWGeGF2wgndDKfYZ40RdyA5z/jdBHMYgUDHxpg6+wZVCy9rngOO7ejzBhHv2brNsK3QQyndO1YwWM0LpbZxqxUwMoIy1mO6l9lZ3Cp9Huh8kaAADjxVf8OQtyuuoYFcqrAEoF88LX+1pMnwu0Zxot1CaHlqQGxCqr3bzWBb05gycRseEOwX1OgTvy68XRq2nNoUSDmRi1JZInN9pltMb5GB+8J66VXGrwNjYV6CnwNiTORqMjI6b0HoVdK7J6uUvEJB2lFWNu3vVgDWnr+OcCV4RIusVvlv8NfsjFgK4QXHatt0Z9R2FCz699kFYzkhGipoz1rZbVrbGkziXuWMwn2BUi6u6SfRAf07VJ1Ha1976v4hNc2i3HugSSAiABI3iwjJ/7Ef3ysG7mxW+CUZOXoKfu+++gEsVGcrpkNt3GjVEqrTdau0nHAd2t9KkTk2n
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(346002)(396003)(39850400004)(451199015)(6666004)(66946007)(53546011)(2906002)(9686003)(26005)(6512007)(6916009)(31686004)(6506007)(41300700001)(6486002)(5660300002)(8676002)(4326008)(186003)(8936002)(478600001)(66476007)(83380400001)(966005)(66556008)(31696002)(83170400001)(316002)(66899015)(36756003)(38100700002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MTA0akx0a09qYTVIQjRMOVVQZE5zellsbU0zaStiRkRPSk5MWklqQTRUZ253?=
 =?utf-8?B?QlhBWEc2czhvZGE2cmlSK1N6eTRDT0dSWjY3UnZ2ZHpaRnE0ZTVJQkVFR1JV?=
 =?utf-8?B?UlR0NEdEc3Q4bGVITGNpV0dXcXE5aEoyazZ3L2lpaWMzaVhnb2pId1Q1SWZG?=
 =?utf-8?B?M0ltelRURCsrSzBNeHAvejFUbmRNQ0NUVVlCSkNJbGhLVmdmUjIyQW5uTlVT?=
 =?utf-8?B?eVJ5dXdwa3BTWU8wRm45QTRoQ1J6eFZ5Sm42YnkxL0xsUG9hZy9la1VzMWtr?=
 =?utf-8?B?VlNMcy9obVBsMjZNZGdBNjN6dHFiRGJRQTFEM0Uxd2Z5cFY1TFBVeWNsWHJG?=
 =?utf-8?B?OTJpTXFpZ3UwQTc0cWJONkZGSk4xQmZGMWVTbEwxWXBWSkozYlpWNll5SGF2?=
 =?utf-8?B?ckRWdVJNSGtnaEN5UkNGZGlHYWtWLzN6MWJNcCsyQ1Q2U2R4UTdGQVZ6YjMv?=
 =?utf-8?B?V1NEUUdSREZ2eWhjUUNlM3dROWllQTdDakRpTGJZNWMweXFMeERrZ1NZU0Fv?=
 =?utf-8?B?SFBxdGE4M0UzSlhWKzBvdjhscUF2ZXl5cGlxZXJSZGFPWFJVdjNWM0w0VzZl?=
 =?utf-8?B?Sk9UdmhSa0oxb2lvY284eDYxakVkczhMRExVM2pHZFJuK1lST0YvdTF0M3du?=
 =?utf-8?B?RHBaSUU5ZTVuZE1qZUNoYnlJVm5CYjcraFJmZVVOYXJoZ2hDRnJLWnVRK3RV?=
 =?utf-8?B?SUJ1VlZFenhyR0wxQkExalJNSWt5NjhZK2sxZGxLME1MdkJiUlhrMFhCWkxq?=
 =?utf-8?B?YWR3ajByU3hhbHVndE1GZ1R4cG5OOG1ISHE4U2tncWp6MXkrenVUY0NYYkla?=
 =?utf-8?B?UVNsbWN3MEluNjh5YVZxUm9ITWpkWFlGMGdOZ0srVVJhTktMTHQwcGlKL09Z?=
 =?utf-8?B?VGpsMW1CTzFZKzJHMEhTWmp4ekd2Zkt1WGljTmE0Yk5TVm5JSmRWRzNmdXVP?=
 =?utf-8?B?emc2dGtSeFlQY0IyTWhNcXdrOTBuZjJCOXNPQWU3d1g2MFB1aWdjNlliQ2lX?=
 =?utf-8?B?NGFFVmF2TXp3WUp4aFlORFI1Y2lvZ01BTC9uazVMc2lIYlU1L0NESFBTNzF6?=
 =?utf-8?B?MVdMODM2TmRtb25Gek5ycEpYUWhBa2dNWFIrQ21RZ3B1WEI1SjFVVW1OSXB4?=
 =?utf-8?B?WE9xTk9laFlQbTlNMlp2VGJDcm43eldEMkpWY1NmazRHY2NkcHZ2MTJiOWx2?=
 =?utf-8?B?UVU2WHAycnBJbjZtVUZLQnhWYVZlZitJK01kTVNmQkdsdG1IbmhEWWEvUUM5?=
 =?utf-8?B?MmNIVkFIZTFBL1FFRHhVcnJCWlZDQ1JQckZ4UllvUnN6M0FEYW9iYnB4bk9m?=
 =?utf-8?B?Vm8rRUtuenlJUit0bkdMVUJTMlVySE5qT3lxcHZNZ2grdjhoSDNaVDRuNkJQ?=
 =?utf-8?B?WlFYZEhwQVdqdWNBMGNCNzllN2xqNXRsNnhCcHZtMlF5R3p1OHV3dmJvVThO?=
 =?utf-8?B?ZGkwa2tUanQ5SmxWR0RRdGo4d3I2bytiK3RKOVFXdmZxWmc2ZWtVRFBoY3ht?=
 =?utf-8?B?OWFDbDNYQlJBbmduQ0llVWV6QU16L3VpQmhVcERhdS90anVzTWdxWWVKRHlL?=
 =?utf-8?B?ZnduT2U0Wm9LYkN6Vmw4MHYwSFd2QjlnWUZFV25RUmsyMlNYc0J6Z20zZ0d2?=
 =?utf-8?B?Wkt0c2JIOGlCb3VsYXBGL1k5WmJUT0ZmWGx3NlZkeG5Mbk90RXo5Q0VBTmM4?=
 =?utf-8?B?Ymw4VjZ6Vy9Hd1kvdlgvVUMrVHBvNkxNRC9lc0JCRnZMd21vem9ZVXJ5SnJq?=
 =?utf-8?B?RkNtUFpqaktMcEJFai83Y3pEaGI1Ni9xcWtNMk5wUXZzWW8xUFBYc2gwOGow?=
 =?utf-8?B?ZENBN0lWSEVZTi9acVpURHpRQ0ZiWnYyZ2FqSnNBaWIyTkk1S2dCK1VuOURv?=
 =?utf-8?B?d3pqcHBUa1FESDhpTmtReEZlUXcvT3hsc3VTUkhFVFh6Y05yY2g5cTBKZVRr?=
 =?utf-8?B?SEFTM1BPVnE3dXZqTC8xWS9sQ1FkWVYyQkppdlZ5R3lyNnJneGVZb0FFai8w?=
 =?utf-8?B?T2hLZkJENnBlem9WYlNxVEl5N0JuUHdscVhKa2pzUytrNXB2ZGMyS3Q4d1M5?=
 =?utf-8?B?eUtCSUc1ajVIdUtzejFQYVJvWTN6LzFoOHZjQjd1SGZ4MDFBcXcyc3RFWDkr?=
 =?utf-8?B?NW4veUpUVWQyQ3dDV0d4T3R3TXBEVFlKVWNGNXc2MEZhN3k4RVczenI5ZGVM?=
 =?utf-8?B?Ync9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b6d04b-ca48-44ea-55a9-08dac83d30fd
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 01:43:57.1033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3HD1wttISJfh6mzz9kKLo0pkX0JNQtU4nG4eYx+HHfM1bnoNcsWQJzNA6vsT3iMmt6mnF9BKFRLef9TQ1S4zGa5h5DE/3KEPd5+9uNkFDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6000
X-Proofpoint-ORIG-GUID: looknGdO7vTMHa7mFJ7QZAyDN8UZ8qFs
X-Proofpoint-GUID: BBh7r4k4IcAl45OD-wjlhswFLzMgWkKo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211170010
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2AH1i2bg004804
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 01:44:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173396


On 11/7/22 10:27, Xiangyu Chen wrote:
>
> On 11/7/22 10:18, Khem Raj wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the=20
>> sender and know the content is safe.
>>
>> On Sun, Nov 6, 2022 at 5:21 PM Xiangyu Chen=20
>> <xiangyu.chen@windriver.com> wrote:
>>>
>>> On 11/1/22 09:48, Xiangyu Chen wrote:
>>>> With the default jitter options aarch64 CPU-based devices typically=20
>>>> experience continuous
>>>> high CPU utilisation for several minutes after rngd starts.
>>>>
>>>> Accoring to the rng-tools issue #150[1] and comments[2],in order to=20
>>>> address this,
>>>> the following configuration changes have been made, those=20
>>>> configurations
>>>> also can be found on Alpine Linux[3]:
>>>>
>>>> - reduce the number of threads used to 1 in total, rather than 1=20
>>>> per core.
>>>> - reduce the buffer size from 16535 to 4133 which reduces the time=20
>>>> taken
>>>> =C2=A0=C2=A0=C2=A0 to fill the buffer (and so reduces the duration o=
f CPU load).
>>>>
>>>> [1] https://github.com/nhorman/rng-tools/issues/150
>>>> [2]=20
>>>> https://github.com/nhorman/rng-tools/issues/150#issuecomment-9530792=
12
>>>> [3]=20
>>>> https://git.alpinelinux.org/aports/tree/main/rng-tools/rngd.confd-ar=
m
>>>>
>>>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>>>> ---
>>>> Changes in V2:
>>>> =C2=A0=C2=A0=C2=A0 *put the aarch64 specific default file in=20
>>>> meta/recipes-support/rng-tools/rng-tools/aarch64
>>> Friendly ping. Is there any more concern on this?
>> My concern is that will it be so for all aarch64 machines ?
>
Please discard this thread, we also found that the rng-tools high cpu=20
usage not only on ARM64 but also on ARM32 platform(also include=20
qemuarm/qemuarm64), it's a common issue on ARM platform.

A new patch has been sent to list as below link, tested in my local=20
setup, thanks.


https://lists.openembedded.org/g/openembedded-core/message/173266

https://patchwork.yoctoproject.org/project/oe-core/patch/20221115081819.7=
61176-1-xiangyu.chen@eng.windriver.com/



Thanks,

Xiangyu

> I tested two aarch64 platforms on my hand, zynqmp and raspi4, the=20
> rng-tools behavior is the same, when service start, the jitter random=20
> generator would load full cpu cores load. It would cause other=20
> services take long time to start. I also checked another linux=20
> distribution, so far, only Alpine Linux processed this issue and it=20
> applied those configurations on all aarch64 platforms.
>
>
> Thanks,
>
> Xiangyu
> Thanks,
>
> Xiangyu
>
>> ---
>> =C2=A0=C2=A0 .../rng-tools/rng-tools/aarch64/default=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11=20
>> +++++++++++
>> =C2=A0=C2=A0 1 file changed, 11 insertions(+)
>> =C2=A0=C2=A0 create mode 100644=20
>> meta/recipes-support/rng-tools/rng-tools/aarch64/default
>>
>> diff --git a/meta/recipes-support/rng-tools/rng-tools/aarch64/default=20
>> b/meta/recipes-support/rng-tools/rng-tools/aarch64/default
>> new file mode 100644
>> index 0000000000..5a2fbcc9ef
>> --- /dev/null
>> +++ b/meta/recipes-support/rng-tools/rng-tools/aarch64/default
>> @@ -0,0 +1,11 @@
>> +# With the default jitter options Arm CPU-based devices typically=20
>> experience
>> +# continuous high CPU utilisation for several minutes after rngd=20
>> starts.
>> +# See https://gitlab.alpinelinux.org/alpine/aports/-/issues/13035 and
>> +# https://github.com/nhorman/rng-tools/issues/150
>> +# In order to address this the following configuration changes have=20
>> been made:
>> +#
>> +#=C2=A0=C2=A0 - reduce the number of threads used to 1 in total, rath=
er than 1=20
>> per core.
>> +#=C2=A0=C2=A0 - reduce the buffer size from 16535 to 4133 which reduc=
es the=20
>> time taken
>> +#=C2=A0=C2=A0=C2=A0=C2=A0 to fill the buffer (and so reduces the dura=
tion of CPU load).
>> +#
>> +EXTRA_ARGS=3D"-r /dev/hwrng -O jitter:buffer_size:4133 -O=20
>> jitter:refill_thresh:4133 -O jitter:thread_count:1"
>>
>>
>>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172821): https://lists.openembedded.org/g/openembed=
ded-core/message/172821
> Mute This Topic: https://lists.openembedded.org/mt/94701000/7175143
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
xiangyu.chen@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

