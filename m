Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D06FC4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 06:58:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7285.1670569129820982815
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 22:58:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9342aad66c=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B95uISo031571
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Dec 2022 22:58:49 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m82m6w3dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 22:58:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hef4hhE3xsVDbOOW/xuNpu9uMQIkjsTtczhIEB/pmGlcAeU9noB1E2X3tbituglXMWjt7BbnLcF6AjBgU7NoP1pmwdHUkJZAZfEPyRZG5921/KYWwOL7SLZ4NcSoTA1HEVATzv/0U4ELbVttJk0twRb6Unxxg/DjdmJQMs3eG0lanIFZuNi5hSYPEX5wx7intdsBro0oEOx+MeUPncinUltBPSyjPC4NEz4G2XPyLkQR5tZ0DGmsS54Qdk0mat70tjkqHfl7+PynDQRNMGLGycLY8l/mimAhDqePk2PUbFVDs7uIa2U/kRR2XMPCECgWt9tJ+3RplBu/W6w9ovwOyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9r07RIpuuVqcxnIWwJ3tSQDmdE8gDg+Cbr6bL04lWw=;
 b=Zm+47liHZwnG0JsZat3LN6FGD/Q6C8BN7U26nfec+21KTtkpzXByIIz7JHL5/kkTC3mqi8JLiMVFuTMHNyMCBX8mjasuXJAJWpNN12N8PgrqrDO6DNLFhmOI57UUk+ODyM8ZHlZbyK7pn6Y8p6ZYzQuihyt2VSHrKpfSb6iEgM+5o+2VPLj/eDu0Zc+lrjAX1pULqiOt9x3L8Y4oW5E3NXT57R0QX8tf1i8YMs90e9tqFVJniMT6p84dE+IELZAqYRcXTgKvFZtGPXKyDFjw7oXBwtdsIpm2101ovnzxl5vZETE4uefqrWqVoaOAaeRZw46jWn2Aq1fHvBca2tWWVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH8PR11MB7093.namprd11.prod.outlook.com (2603:10b6:510:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Fri, 9 Dec
 2022 06:58:47 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5880.018; Fri, 9 Dec 2022
 06:58:46 +0000
Message-ID: <d8044f92-e7ad-fd35-9e0b-bc2db98e0f24@windriver.com>
Date: Fri, 9 Dec 2022 14:58:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: xiangyu.chen@eng.windriver.com
Subject: Re: [OE-Core][master][kirkstone][PATCH V2] rng-tools: Add Arm aarch64
 CPU specific configuration to address excessive CPU usage on startup
To: openembedded-core@lists.openembedded.org
References: <172352CEDDCB35BE.6436@lists.openembedded.org>
 <d26c2ba8-eb2c-5a72-e7ee-e1ad89e95444@windriver.com>
 <CAMKF1soeerVU3hLV+UG7HzBkNkN2MYddoPj3S49oQg=fHRCbcw@mail.gmail.com>
 <172E7C34890B966B.29158@lists.openembedded.org>
Content-Language: en-US
In-Reply-To: <172E7C34890B966B.29158@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SL2P216CA0221.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::15) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH8PR11MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: edf77ef4-febc-4b95-8798-08dad9b2d17d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gqqn2feNgiNeZ7HqrJODbVebz0+XMjqy8g6vzREhk8dfcLsFFdKPcqERWBJOMdBQz9OUjYltkoRWaOiLFtu6f2WszOR9t3bi7Il6QXSidkIRY2Mn/NgjUV1Ucn/75Po6Ihft8iDzBjO/hk9obVS1klja+qt5f9/IWk2Y4f/rp2dm4fj3p5k8Y2hr9sHAfXu7NPy4XNXZszI1jmHJOuy/4EA9bu8j7AlfzL8XyA74BcvdDQkaM0koeEdsAZKQaRDkVL6peJBnL2Tm5mDrhtWiB7jRE/N/NtwdeS9JmzWTVz8+nuqAWHtoUvg2d/jYi0NFjC1cycpgGbKKjenNOgzSOR0NicgnQlGSUURfWLBod/6lDV+58/MN8eFJu1DDQJ9hqFYyFyDwvVUS33/iqmOsuPfr/EscD17eH4ThP/pOlJygcSlrZzZw2D/Q/Y1q/NNEZngynHMdQQ7Wnx60hIioadOLkKRlqrJVCF6atXYFtyuZ1h9I31nLZ1GPhcugUN5ILuR5ChlKyyK2xFcS3WWjC9443SYuzYzWhz6QogqE5vs+ga3iYWX3thhrqABslW5lYLa+Z+3xWQYhf8CCPaG7PuCTtl3Xx0WoDiffhgMBCNrYd9bbQipXXof3Y0szzgN0dW8c6juVhokmpgwDH6ZLn9vn3xqvnQek4gRni7qmPfK6w/UcylFvjCOxj3vsinkjzDCyM7zHevsp6KkYDr2cUYM9Aiqh7u4URQ2t/0cTbbt0dORaqmt5HZ1bwCWs/NV9aYJpmb9npGvqLpRcYYmmKQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(396003)(346002)(376002)(136003)(366004)(451199015)(966005)(478600001)(6486002)(6666004)(66899015)(6506007)(53546011)(6512007)(9686003)(26005)(66556008)(66946007)(6916009)(316002)(66476007)(8676002)(5660300002)(83380400001)(2906002)(41300700001)(186003)(83170400001)(38100700002)(8936002)(30864003)(31686004)(31696002)(36756003)(2004002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TjZ3UVZ3eHR4S2hZbWk3RUpqTElHSU81VjJJcldTWUhRVTFpYzVrR1Z6VGtF?=
 =?utf-8?B?RVZKTmJPQ3NSWmt3ejcwdms0a3hLMlJGLzRvUGpwekQ5NnFqN2VYN1ljYXRK?=
 =?utf-8?B?aVlGRllzZVQ1N3V0SjJJWTd2cE9EMUozaGJ5MXZ3aTlhNHNpeVFML20wNzRn?=
 =?utf-8?B?ekpJVmpiNi8zWEZLN05RNm9CQnEwWGVJaFhzZEhnR1phei9idkVBajErZVA4?=
 =?utf-8?B?U3hGZU5NNmdHa3ZOUEszWmtLOTBVWmlJLysyQUM2T1o3Y2tiYUI0aHQxTW9x?=
 =?utf-8?B?WXZhakw3R3U4L0lPeDRMNHAzdWIrTVROeTlscktzTTBIbVBxK2crUFhlbk9R?=
 =?utf-8?B?OWhkT3FJUmtpbDh2dnNwK1hJTzBjZkRaUXFsSjFmcTVRM1VXTG11L2s1bkJK?=
 =?utf-8?B?NkxwZkk3bGVmWkNkRlBxTUNPT21iL2YzV2ZFdm5YcWE3UDAwZWdtSFlGVnJ5?=
 =?utf-8?B?YVBBWVVYKzA3TmxKYUlEMDFxdmRScmpFTXE4aFpicjJRUHFKQVJudmxUTEdJ?=
 =?utf-8?B?c3A3K0U0QzlxWXl1VDdKNndvdHN3enhydnhZZGpOZVNqb3FBNG1PbXR5dHdT?=
 =?utf-8?B?aXE1aGkxT0xPb0xsbkQvbW1Xejl3cG8ranBRb1RyS3U1cjdzdzJjWk43elNP?=
 =?utf-8?B?Vmh5K0hLUm50Zk9wS01YQVZaNExlMFRpUWJ5VU5kSzBFZk4vRjc2NmVjcmwv?=
 =?utf-8?B?OE5jMFhMUlVzVUxSTmh5ZVZFRlNMc0ZvRXZRaWRURHY4VFYwVlIxWHpwV0E3?=
 =?utf-8?B?S3ZlZDN2a01TbSs1T3NNMmV1ank4VHhXb3hxenBaanNtV0U4a2NXNUNaVCtn?=
 =?utf-8?B?WWFVQmt6Rm10TXNicndFNWo1Nk5DeUtlLzBIQnhTWU1mNkovYXZOVzFNK1BI?=
 =?utf-8?B?UVM1RHpzYmtYd0E3TFNDMXlmS3JDaERHRm9SVXFUK0svSDlXOHNUYk53YW92?=
 =?utf-8?B?TFo2SmpWeWgwSTE2SzQ4ZFRhMWFFbUxjNXg1NlY0TmtRZWJXUisxT3Y1bTlo?=
 =?utf-8?B?WThjTGE5dEY5VWZqTnJUVWZHWjg1NDFrb0c3THFFWExMd0F5clBlVkdQWitv?=
 =?utf-8?B?MXFBajdxRjBXUkVsSU9xVmx4dDEvMVB4VnJnUkVxWi9LaU5wNmxhcXlBd2FY?=
 =?utf-8?B?cUNmMWRWdXN4Y0Z1czhJclAxYjZIcnJ5S0VlaWprbVgxVXZicWdqbXpHcS9u?=
 =?utf-8?B?VjFwYit3bnNIbWYyZnF0VkNDUENCeW9zTUhBQmRNYWYyeThEa1FmSGpLeERY?=
 =?utf-8?B?MTNaYWtVNTFKMkVCOWQyeHl0YzlxSDQ2MExGbFIzNEpLYlBxRU9qcmFZRlJS?=
 =?utf-8?B?TUN2ZUoyN0VOSnRaRFJtWnVIaGlITG83RndvZXpaS3BOZnY5bHM3U0FwdDM1?=
 =?utf-8?B?NjNYYkY2Smd2Rm5vbDdGSlB2ZTIyZDFJR0JEYlNWc1RHOU53ZHAyYjcxdThR?=
 =?utf-8?B?cURFdzBDMmpSU3dCQzlzdXg2ZHVQcWxhSTZNY1JPaFk2S0U5b2UvbGN4cEgx?=
 =?utf-8?B?OUg3TEVIVCtOWm4xWDRabzU0bXBxS0pVTDRMbEY5dWphaUREWE9UZzhGNFJQ?=
 =?utf-8?B?cnJ4a0F3bXV5aDhXWHZpR1plUDNzdWF5R1pPdzdRSDBuaWhvT1RwNmVnSDhv?=
 =?utf-8?B?bWl3TGMrUGtBTzVqWE5aeTh6ek1meXJFN2NCa2dENmVlMmFaVHFLTUdLTldz?=
 =?utf-8?B?K09MYjUrdEg0S2pVRnp0cWhsSzRKN0Jac0lwSWI5b2N2U0o1QWhJRmJNWkdV?=
 =?utf-8?B?a1NTdHhGMFcxKzhiNE9kSUhrL09NcEZNZlNKUSswN3B4UXVPMGNFSEQxdHFF?=
 =?utf-8?B?ZHRwRFZaYVRrYXRUNm9IYlRUZnlHOWhQTzBUN2grMmg4OURJdnhrc2hIZ2RY?=
 =?utf-8?B?MTkvaHRrZ2dCb1QwWjBxMWpiNUJGMVpCdUpmUi85R0RtSTZvYVdOZWcyVCsw?=
 =?utf-8?B?V3ZVWEIrcnhPMysydXlkYXRpc0tsRzNjZVp2S0xGRjRRWUxVd0VaenBOWFd0?=
 =?utf-8?B?eGRORFFzMFJRbGJTOU12MGN6bmovSWNhdWN6dC9Mcjl5QWdyWkRRblhRVFR5?=
 =?utf-8?B?R3kvN3kwNlNhS2tSSGZvMGYyTEs1NlNZYmxVV3VEOGJCdU90c1BHeityNkho?=
 =?utf-8?B?aDFKeS9mRzNOUXNZTWczSVloOEhHc2l5Z3F2WDI4bmpaNFBGRUl6d1VaZVh4?=
 =?utf-8?B?TUE9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edf77ef4-febc-4b95-8798-08dad9b2d17d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 06:58:46.9367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jeLG7TBfy7RGVKgrsoNr09JkDYqrcd+rCEJQHe8VyKnha7licSfW8oMGro0gEokO1DY3xuopjEcDnY9VOKQXPPO2TLSh5a55E+pQwFUrch4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7093
X-Proofpoint-ORIG-GUID: gl7bK4ANmrDHwbOFrOhNjTKS15QPrr-5
X-Proofpoint-GUID: gl7bK4ANmrDHwbOFrOhNjTKS15QPrr-5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-09_04,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212090059
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2B95uISo031571
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 06:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174433


On 12/7/22 18:31, Xiangyu Chen wrote:
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
> Regarding the rng-tools high cpu usage still need to be discussed here.
>
> Currently, on some platforms like ARM, there is not any good idea to=20
> solve the rng-tools jitter module take full cpu load during the daemon=20
> start. In fact, after kernel v5.6, the /dev/random doesn't block=20
> anymore, so, perhaps we can use the parameter to limit rng-tools=20
> resource during it start up, does anyone have any ideas to propose?=C2=A0=
=20
> Thanks!
>
We have verified 2 boards on kernel 5.6 later, 1 board without rngd,=20
random number was also generated in perfectly speed, sshd also was=20
working well.

But in another board on kernel 5.2 without rngd, a testing random=20
progress was blocked due to no enough entropy.

 From the log, on kernel 5.15, we can observe that crng init in early=20
stage before mounting the rootfs,but on kernel 5.2, crng init after=20
rootfs was mounted, and although crng inited, the entropy still low if=20
rngd not start, a dd test progress was blocked due to low entropy,=20
that's explain why openssh enabled the rngd/rng-tools .

So, from the test result we can see, for newly kernel, the rngd seems=20
not necessary any more.



Testing result as below:


Board 1: Marvell CN96xx CRB (Cortex A72, aarch64)

crng init stage:

oot@marvell-cn96xx:~# dmesg | grep -C 5 crng
[=C2=A0=C2=A0 88.486463] bus: 'pci': __driver_probe_device: matched devic=
e=20
0000:03:00.1 with driver cavium_rng_vf
[=C2=A0=C2=A0 88.486513] bus: 'pci': really_probe: probing driver cavium_=
rng_vf=20
with device 0000:03:00.1
[=C2=A0=C2=A0 88.488911] cavium_rng_vf 0000:03:00.1: Adding to iommu grou=
p 73
[=C2=A0=C2=A0 88.516290] cavium_rng_vf 0000:03:00.1: assign IRQ: got 0
[=C2=A0=C2=A0 88.519205] driver: 'cavium_rng_vf': driver_bound: bound to =
device=20
'0000:03:00.1'
[=C2=A0=C2=A0 88.519459] bus: 'pci': really_probe: bound device 0000:03:0=
0.1 to=20
driver cavium_rng_vf
[=C2=A0=C2=A0 88.519473] random: crng init done
[=C2=A0=C2=A0 88.519723] driver: 'cavium_rng_pf': driver_bound: bound to =
device=20
'0000:03:00.0'
[=C2=A0=C2=A0 88.523222] bus: 'pci': really_probe: bound device 0000:03:0=
0.0 to=20
driver cavium_rng_pf
[=C2=A0=C2=A0 88.523295] devices_kset: Moving 0000:01:01.4 to end of list
[=C2=A0=C2=A0 88.523320] PM: Moving pci:0000:01:01.4 to end of list


Kernel version:

root@marvell-cn96xx:~# uname -a
Linux marvell-cn96xx 5.15.78-yocto-standard #1 SMP PREEMPT Wed Nov 23=20
04:17:58 UTC 2022 aarch64 aarch64 aarch64 GNU/Linux


Disabled rng-tools(rngd) and testing read random, we can observe almost=20
20.4 MB/s random number was generated from /dev/random with dd command,=20
rngtest also was working well:

root@marvell-cn96xx:~# systemctl stop rng-tools
root@marvell-cn96xx:~# ps -ef |grep rng
root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 441=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 2=C2=A0 0 10:59 ?=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 00:00:00 [hwrng]
root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 864=C2=A0=C2=A0=C2=A0=
=C2=A0 848=C2=A0 0 11:02 pts/0=C2=A0=C2=A0=C2=A0 00:00:00 grep rng
root@marvell-cn96xx:~# dd if=3D/dev/random of=3D/dev/null status=3Dprogre=
ss
1342177280 bytes (1.3 GB, 1.2 GiB) copied, 66 s, 20.4 MB/s
10+0 records in
10+0 records out
1342177280 bytes (1.3 GB, 1.2 GiB) copied, 65.7033 s, 20.4 MB/s
root@marvell-cn96xx:~# rngtest -c 1000 </dev/random
rngtest 6.15
Copyright (c) 2004 by Henrique de Moraes Holschuh
This is free software; see the source for copying conditions. There is=20
NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR=20
PURPOSE.rngtest: starting FIPS tests...
rngtest: bits received from input: 20000032
rngtest: FIPS 140-2 successes: 1000
rngtest: FIPS 140-2 failures: 0
rngtest: FIPS 140-2(2001-10-10) Monobit: 0
rngtest: FIPS 140-2(2001-10-10) Poker: 0
rngtest: FIPS 140-2(2001-10-10) Runs: 0
rngtest: FIPS 140-2(2001-10-10) Long run: 0
rngtest: FIPS 140-2(2001-10-10) Continuous run: 0
rngtest: input channel speed: (min=3D4.340; avg=3D135.364; max=3D146.719)=
Mibits/s
rngtest: FIPS tests speed: (min=3D8.197; avg=3D69.020; max=3D72.800)Mibit=
s/s
rngtest: Program run time: 418771 microseconds
root@marvell-cn96xx:~# echo $?
0
root@marvell-cn96xx:~#


Board 2: NXP i.mx6q(Cortex-A9 armb7l=C2=A0 32bit)

crng init stage:

root@nxp-imx6:~# journalctl -k
Apr 28 17:42:27 nxp-imx6 kernel: Booting Linux on physical CPU 0x0
Apr 28 17:42:27 nxp-imx6 kernel: Linux version 5.15.80-yocto-standard=20
(oe-user@oe-host) (arm-wrs-linux-gnueabi-gcc (GCC) 11.3.0, GNU ld (GNU=20
Binutils) 2.38.20220708) #1 SMP PREEMPT Mon Dec 5 17:32:29 UT>
Apr 28 17:42:27 nxp-imx6 kernel: CPU: ARMv7 Processor [412fc09a]=20
revision 10 (ARMv7), cr=3D10c5387d
Apr 28 17:42:27 nxp-imx6 kernel: CPU: PIPT / VIPT nonaliasing data=20
cache, VIPT aliasing instruction cache
Apr 28 17:42:27 nxp-imx6 kernel: OF: fdt: Machine model: Freescale i.MX6=20
Quad SABRE Smart Device Board
Apr 28 17:42:27 nxp-imx6 kernel: Memory policy: Data cache writealloc
Apr 28 17:42:27 nxp-imx6 kernel: Reserved memory: created CMA memory=20
pool at 0x2c000000, size 320 MiB
Apr 28 17:42:27 nxp-imx6 kernel: OF: reserved mem: initialized node=20
linux,cma, compatible id shared-dma-pool
Apr 28 17:42:27 nxp-imx6 kernel: Zone ranges:
......
Apr 28 17:42:27 nxp-imx6 kernel: mmcblk2: mmc2:ccbe SD02G 1.84 GiB
Apr 28 17:42:27 nxp-imx6 kernel: random: crng init done
Apr 28 17:42:27 nxp-imx6 kernel:=C2=A0 mmcblk2: p1 p2

Kernel version:

root@nxp-imx6:~# uname -a
Linux nxp-imx6 5.15.80-yocto-standard #1 SMP PREEMPT Mon Dec 5 17:32:29=20
UTC 2022 armv7l armv7l armv7l GNU/Linux


Disabled rng-tools(rngd) and testing read random, we can observe almost=20
31.9 MB/s random number was generated from /dev/random with dd command,r=20
ngtest also was working well:

root@nxp-imx6:~# rngtest -c 1000 </dev/random
rngtest 6.15
Copyright (c) 2004 by Henrique de Moraes Holschuh
This is free software; see the source for copying conditions. There is=20
NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR=20
PURPOSE.rngtest: starting FIPS tests...
rngtest: bits received from input: 20000032
rngtest: FIPS 140-2 successes: 999
rngtest: FIPS 140-2 failures: 1
rngtest: FIPS 140-2(2001-10-10) Monobit: 0
rngtest: FIPS 140-2(2001-10-10) Poker: 0
rngtest: FIPS 140-2(2001-10-10) Runs: 0
rngtest: FIPS 140-2(2001-10-10) Long run: 1
rngtest: FIPS 140-2(2001-10-10) Continuous run: 0
rngtest: input channel speed: (min=3D96.820; avg=3D326.769; max=3D340.598=
)Mibits/s
rngtest: FIPS tests speed: (min=3D15.090; avg=3D37.543; max=3D40.324)Mibi=
ts/s
rngtest: Program run time: 570229 microseconds
root@nxp-imx6:~#
root@nxp-imx6:~# dd if=3D/dev/random of=3D/dev/null status=3Dprogress
318916096 bytes (319 MB, 304 MiB) copied, 10 s, 31.9 MB/s^C
676517+0 records in
676516+0 records out
346376192 bytes (346 MB, 330 MiB) copied, 10.8611 s, 31.9 MB/s


Board 3: imx8q with kernel 5.2

crng init stage:

root@nxp-imx8:~# dmesg | grep -C 5 crng
[=C2=A0=C2=A0 13.219541] [VPU Decoder] error: vpu_firmware_download() req=
uest fw=20
vpu/vpu_fw_imx8_dec.bin failed(-2)
[=C2=A0=C2=A0 13.228465] [VPU Encoder] error: vpu_firmware_download fail
[=C2=A0=C2=A0 13.236340] [VPU Decoder] error: vpu_firmware_download fail
[=C2=A0=C2=A0 13.244367] [VPU Encoder] failed to create encoder ctx
[=C2=A0=C2=A0 13.769137] fsl-audmix 59840000.audmix: Started TDM1 needed =
for=20
config propagation!
[=C2=A0=C2=A0 14.967484] random: crng init done
[=C2=A0=C2=A0 14.969603] random: 7 urandom warning(s) missed due to ratel=
imiting
[=C2=A0=C2=A0 15.724775] fsl-audmix 59840000.audmix: Started TDM1 needed =
for=20
config propagation!
[=C2=A0=C2=A0 39.911462] can-en: disabling
[=C2=A0=C2=A0 39.913138] can-stby: disabling

Kernel version:

root@nxp-imx8:~# uname -a
Linux nxp-imx8 5.2.60-yocto-standard #1 SMP PREEMPT Mon Feb 28 13:28:52=20
UTC 2022 aarch64 aarch64 aarch64 GNU/Linux


Disabled the rngd and reboot again, the system available entropy very low=
:

root@nxp-imx8:~# cat /proc/sys/kernel/random/entropy_avail
36

Using dd command to read random was blocked until break by manual:

root@nxp-imx8:~# dd if=3D/dev/random of=3D/dev/null status=3Dprogress
^C0+0 records in
0+0 records out
0 bytes copied, 3.96411 s, 0.0 kB/s


The rngtest util also was blocked until break by manual:

root@nxp-imx8:~# ps -ef |grep rng
root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 459=C2=A0=C2=A0=C2=A0=
=C2=A0 448=C2=A0 0 13:42 pts/0=C2=A0=C2=A0=C2=A0 00:00:00 grep rng
root@nxp-imx8:~# rngtest -c 1000 </dev/random
rngtest 6.7
Copyright (c) 2004 by Henrique de Moraes Holschuh
This is free software; see the source for copying conditions. There is=20
NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR=20
PURPOSE.rngtest: starting FIPS tests...
^Crngtest: bits received from input: 48
rngtest: FIPS 140-2 successes: 0
rngtest: FIPS 140-2 failures: 0
rngtest: FIPS 140-2(2001-10-10) Monobit: 0
rngtest: FIPS 140-2(2001-10-10) Poker: 0
rngtest: FIPS 140-2(2001-10-10) Runs: 0
rngtest: FIPS 140-2(2001-10-10) Long run: 0
rngtest: FIPS 140-2(2001-10-10) Continuous run: 0
rngtest: input channel speed: (min=3D0.000; avg=3D0.000; max=3D0.000)bits=
/s
rngtest: FIPS tests speed: (min=3D0.000; avg=3D0.000; max=3D0.000)bits/s
rngtest: Program run time: 91647889 microseconds
root@nxp-imx8:~#



>
> Br,
>
> Xiangyu
>
>>
>>>
>>> Thanks,
>>>
>>> Xiangyu
>>>
>>>> ---
>>>> =C2=A0=C2=A0 .../rng-tools/rng-tools/aarch64/default=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11=20
>>>> +++++++++++
>>>> =C2=A0=C2=A0 1 file changed, 11 insertions(+)
>>>> =C2=A0=C2=A0 create mode 100644=20
>>>> meta/recipes-support/rng-tools/rng-tools/aarch64/default
>>>>
>>>> diff --git=20
>>>> a/meta/recipes-support/rng-tools/rng-tools/aarch64/default=20
>>>> b/meta/recipes-support/rng-tools/rng-tools/aarch64/default
>>>> new file mode 100644
>>>> index 0000000000..5a2fbcc9ef
>>>> --- /dev/null
>>>> +++ b/meta/recipes-support/rng-tools/rng-tools/aarch64/default
>>>> @@ -0,0 +1,11 @@
>>>> +# With the default jitter options Arm CPU-based devices typically=20
>>>> experience
>>>> +# continuous high CPU utilisation for several minutes after rngd=20
>>>> starts.
>>>> +# See https://gitlab.alpinelinux.org/alpine/aports/-/issues/13035 a=
nd
>>>> +# https://github.com/nhorman/rng-tools/issues/150
>>>> +# In order to address this the following configuration changes=20
>>>> have been made:
>>>> +#
>>>> +#=C2=A0=C2=A0 - reduce the number of threads used to 1 in total, ra=
ther than=20
>>>> 1 per core.
>>>> +#=C2=A0=C2=A0 - reduce the buffer size from 16535 to 4133 which red=
uces the=20
>>>> time taken
>>>> +#=C2=A0=C2=A0=C2=A0=C2=A0 to fill the buffer (and so reduces the du=
ration of CPU load).
>>>> +#
>>>> +EXTRA_ARGS=3D"-r /dev/hwrng -O jitter:buffer_size:4133 -O=20
>>>> jitter:refill_thresh:4133 -O jitter:thread_count:1"
>>>>
>>>>
>>>>
>>>
>>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174348):https://lists.openembedded.org/g/openembedd=
ed-core/message/174348
> Mute This Topic:https://lists.openembedded.org/mt/94701000/7175143
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
xiangyu.chen@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

