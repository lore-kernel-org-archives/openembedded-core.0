Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D04AC38142
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 17:41:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.52039.1674150074620146567
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 09:41:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=bF7IxvG+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0383287c4c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30JDDn1O026945
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 17:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : cc : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=Pyvp/Bq99mCohACyfgkvRTDI1/rGrdrFdyeyYCEte+Q=;
 b=bF7IxvG+fX7Nho17Wzac4con0GMx8Q95w06ZA9u3bWTiPhgceVIqz+W8YrKmQv3CEKBm
 a5PqWtGqHNYakrLof5B5Lav+H4N8ANvVEcR9tNpt4NQiqXw2Z89VpO2BJUtYespXL/fS
 vsdgK4tnT9quptNv5Y1jaAEyB4DjP12mgmyJK3c6vfzfAkpDksQboFy2w/vmv8US000g
 fEi47ekd0Er/zOmrnan9BxzFRdfDyjhNEWk5xJtmHoMHJ1poG38m7+vjsOzHFf2jwFqm
 tUkOTh+nV8pKiAol9o+lp3vYSMvv8+Q61WhBRO8BFYvS6mB8q1PegJ90cYWz9IHSLtY0 3w== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3jx6nhvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 17:41:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqpuJ22PTicFDxUSxX3EQm11EybiRL7v4aYHwXunauq/CGu5+wFmd7/nJ6qdX0QAEfHQaKhsoi9hNBg96QIBigQPg5nUQD3bC5fa76GxuW8M5bhbvG3Kpep+7riODYCx5alwW6uCm++mgIch0r+PhqVKiXfMQPB3hNoHXl7Qw+QYGkQHALcVb9rvj05KbeUrcVogMzoJkArmoqztbqPHJoxaedABPg+KZ20A1SMrLjoACFo0aJXkh8x0N6AjofJbhApuUrKTRlKtm2b4q58YYug7uwqqiXsJgPd8qYjhxur8jwjmsV7uSaXygpQrWjkXUX4auWD1Sg5oGpeb0cwziA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pyvp/Bq99mCohACyfgkvRTDI1/rGrdrFdyeyYCEte+Q=;
 b=V7dRXX3MFclnA+FCJBqLTVN+F8YHqDpgV527bHF49kTfrlPIwDpYUkR7nLxInq/WTpvRAui7vNozcUUCnypU7rJHQqnmgvPFd9eL4lEhVuZ/GpHI1P6agAMXYIBG2fMAx1bQn0ZDDF5QnVumoA1aTYKbGwGfWLbXT3udAunrEGVGpubvEAczFSvzUDSuF2i1zu/sZZ+aG3Axt3TdkmhjtPQmei9Jsw33BO8C/bKU+wmEaSug+4/V28lC4jlqep7gmdhV1jjb3xQS6MCtFd+OIR+S/ZdvXCzPZwxTg6hiMPomjjLOm6jtq5NYYP/tEsPdwEOI64kmWefZG2ZOwCDFSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by LV2PR11MB5998.namprd11.prod.outlook.com (2603:10b6:408:17e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 17:41:10 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%7]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 17:41:10 +0000
Content-Type: multipart/alternative;
 boundary="------------e42S5AzBD0I9CZOBpPK4p680"
Message-ID: <6a545950-3808-6f6a-1a64-9968a4a12a2c@windriver.com>
Date: Thu, 19 Jan 2023 12:41:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [kirkstone][PATCH] glibc: explicit use the internal
 __time64_t type
Content-Language: en-CA
To: mingli.yu@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <20230119040416.864574-1-mingli.yu@eng.windriver.com>
Cc: "Shinde, Yash" <yash.shinde@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230119040416.864574-1-mingli.yu@eng.windriver.com>
X-ClientProxiedBy: SJ0PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::25) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|LV2PR11MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: b62f9081-b0a7-4c44-c16f-08dafa4459d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EGHPGkqeYr4a1li3Eug3ziuRA6C2v6do76HFz/Zae0R1KeAf31p+wZ+v+QCbsTH2uVIFCiRak7sW7Id2PGB12Vttwml3JAsVf8qfTFKF/JKs6R89sdMXXkM/KVzyIsMYCkS9GOiADSLxVYSDpjwYuBw0r7w8L2DyBJrJy894Y10vdW93Me3cerUVxRtM+Qy/6fvX6qht5x0WLzYL5/Tlijd7FU/AJXTRpJLqaIStTzVkYE4r97+l27lBszVBgBJmwsTU11cA69USaxB1vmbQL3ioBh/i2cGPzmfUHdzJNtux/mvX03siCiw1VC7AlCqGGRqgjx/t6uHFdGinYL9L8HOFFrZsFBi784yBXsUqD33b6GRE68WuT/BDoRF5ExEWOXYrXbY6x0Y00+gWsXTt29qO0pcIS/N45AVLeekCINb6Y6utwyb0035a9P6aohB0mJuBq/XtmOfERk8drR3ov25aEvDhs3Q5Ip/GX+O5V2zFTPjuL7fP2TkOMILr8Vqvw4i00+jwQE7+anhuZlm8/dKsZ7AV/4ePEj5L8nviRg60KVEKf3g3qfmDj4Wfmg2RAgeZjcEuIHOfJPhzkCwpUfDxrp4qq3J5aZdYl2uvArkJbEonQlqwRwUr0SkGSxT+XtyQvyzaQ7XsCGd8BF8GRdDxJXHf3jsrZYhUk0TebiXiiW/FLyxOrKM62zn8orc831mv3iZaNnVVP0uuecUZd2I+IishdRvVM7dO6XNcQl6dpZnoIS516ytONVXQrenItJ8XoBP1ASZ0QFJV93ZwbeqOo2taY6j/E43EuHFABsk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(396003)(346002)(39850400004)(451199015)(31686004)(66899015)(31696002)(26005)(36756003)(2616005)(66556008)(41300700001)(4326008)(8676002)(66476007)(66946007)(186003)(53546011)(86362001)(6512007)(8936002)(166002)(6666004)(966005)(83380400001)(478600001)(2906002)(33964004)(316002)(107886003)(5660300002)(6486002)(38100700002)(4001150100001)(30864003)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RE96UDBYS3V4d1YvUFBnbndiYTQ2djk2akgvZktQM3JnekV1LytWRUMyQ2l0?=
 =?utf-8?B?U3pqblozcEFpV2JRTWZ1eDAzcHBRY2dFZVVSN0lGVm9IMWYrcXV2dDg4bTV6?=
 =?utf-8?B?TnhZdEZ1cW4wT3lLMkRGamdSckMwRXNxczBNZm90M2lYSDNRSWpidzVMd3ND?=
 =?utf-8?B?Q2c3SlBpaUVqODZDby9DaWZFejNmQzcvU1AzTUJsLytDd1VzdW9lTXh3Z2V4?=
 =?utf-8?B?MkZUZnllUjJ6UlJvdm9uSUltaUI4ZU5ncHNJN1hETHZobTlnYVV5SzRoS0xY?=
 =?utf-8?B?ZWZaM2QxdVl2aFNzMU11VjRpaXZOS2d3bzk3ZFp2azVabjhDM2xMbTFYRUh1?=
 =?utf-8?B?Slg1N3ZWeVk1TVI5dFd4SGFyVnV6Yi9vK0M2OTJ4Mm5PN2JGL2NTblc2bDdr?=
 =?utf-8?B?WXl3a2hhQ05lamNFSThzNXBFTjVWZ0YyMlNQcFZ4S2hnZ1NsS1F0cS81cC83?=
 =?utf-8?B?bkhLdUxGd1hWaTdUbjBSNTlEcnp3MXIydnE0NzkxOHpqUjAvUEVsdkJDbVZr?=
 =?utf-8?B?cXhENkR1U0VKeHlIZldDc0VJcnppaTFibXY2MGNZWC9WdjZKeHdUK1lYVVl6?=
 =?utf-8?B?TDQ5ZTQ4QnlvQ2NzWXdLcE9ualV6bHZNUWhiR24yc01FYzloUkJzYUdUcFBN?=
 =?utf-8?B?NXRGOFNvbjlzanpxdWJva0tMRHI2ck1UL0F1YTgrVjRYczhEcVJGejlLZlFi?=
 =?utf-8?B?bnRYS2RhY0tNZ0dCbGxDWjJEMUhsTnhaRm12Wnlhbk1HMHNqdm8weUlsRWZ1?=
 =?utf-8?B?SktZZEFlajAvUjI3Wmd5Qzdqa2ZWZ0M3bG5LTkR3bHhLWnYwSXBaN05TWnMy?=
 =?utf-8?B?enV5TWwwY2FPa2IrQ1g2bTBHVW9yUnVSRzJjQjl4WXdvT2ZHR25wSGVZajJx?=
 =?utf-8?B?dGdrd0RCbkYyS3N1emtBYTV6cTk1TEFSSXRwWTRZc1B2Z0hDeEFBckxUY2I1?=
 =?utf-8?B?UUpWSjVvakpMTTlqR0JwOEUyUjk0SHhMcGZpNTFKclErU3B3RlhZOTVFL0t1?=
 =?utf-8?B?aGhVa2t1amo4NWc4aStyOUVJVjM3dVZWcTd4ZFNyaVhZUVpVQmpRa3BBaE9C?=
 =?utf-8?B?M2pNZk5SeStkbkQzRlVaSGhJdFRUZENMRzlzVGlsektDN1cwVUFIMjN4T0FL?=
 =?utf-8?B?aFBjdVhmVUgweTM2TUMzVmtFS3JIdnhBRjZFK3VSMkZFTll4MSs1dXV1T2ds?=
 =?utf-8?B?VUVMcG1JbUNmdU5hQ0FXTVVhY3JianA3L3VkOFYzVlNJRTAzZmtwYiswb3M2?=
 =?utf-8?B?WDYrREwybkN1bWVYL3RBeGtuckEzckxoRDZHMDBuYk9jalpQSTNGdytMNDd1?=
 =?utf-8?B?UmJ2SGgwN2FJQS9XNDhNVmpZMHVyeUVlVTZXbDhPM2RBM0FtdmpKUHZDZGdi?=
 =?utf-8?B?STJwL2ZQQmtEUmNYT1M1cnZlWGVWTTJoeVZ1NTh5TkdUMU9iUVNzdHpGQlhh?=
 =?utf-8?B?VFZJY21mc1dmU0JVaEg1OW5NM2Z3c2t3K1NFNGZjc3lmY3VSdG9CZm1oeklC?=
 =?utf-8?B?SVYxTDlXL2ZGWTB1VHlRbm9NdTJSVXJCODFwSnR0VFN2aWdrZ0ZWaWxVbmJN?=
 =?utf-8?B?RTdIaFR4ZU9HbFZ6VWF4QjFsREx1ank4ZkxYdmc4angwQ3puRnZEQnRFaHpm?=
 =?utf-8?B?N0VKbHRXL3c2WnQ1dEFJaDM5UlNLb1ZEY2Q3MXRJdDlSc0NGYlgvZ3BCSzl3?=
 =?utf-8?B?WEJuTlVqWDVENzNIZjVaMk9BYzl6SWNKSkFhZGZqaDhsRGczbFE4enFWUFNG?=
 =?utf-8?B?V3F1ZWRTYUEyNlNBNzJ5aHZYN3VlZFIxSG1HZUFvYnlKeVVwTm9tUmdqNU1t?=
 =?utf-8?B?dE9ISzEzV1dxb0xCVjdWWmhCL1YzcHhkWkE0S1p0NHRIdm95WnlrdWhtN0dv?=
 =?utf-8?B?TkUwWjVjRnpJNC9YMDRrbXJoR3BJbmpkUjRFRFhJRGYzNnlEbXVuVHM2enBo?=
 =?utf-8?B?emozSzdINVgydU9BREZRK3BBcWViSGI1Y09Jb1RRcDFFNGdOWG5UMVlmVVFy?=
 =?utf-8?B?UUlLdnNpSHNwM1IxOEsvZnJiTkdndlZYd1FaZ3lOVWN6bWFDMFBOOWtzQ3BV?=
 =?utf-8?B?VWpOaG9BTFpsU3E4L3kwM2tDaW5VMklOalQ1M2pIZEhYWWNKTXdYUmpVRk5p?=
 =?utf-8?B?WkpsZGkxc3UxSzFSZmhrcXdpSUdsR1JSa2M1M0g4VnlTK01rVjF4bjhZNTJ3?=
 =?utf-8?B?cHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b62f9081-b0a7-4c44-c16f-08dafa4459d3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 17:41:09.9522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvBQW72rfmb8ZU6khr6vKYHWixAzhAaPEp3lgdmDQsHwPMILV20YH1HMHAWG3Jf+4uVvO4ri7M5W2fkxImsQxYwlWTIGzl+LCXD6mnYBvXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5998
X-Proofpoint-GUID: tVnHeJPWjoYHypFbjfKWzcVNgS7cQEQV
X-Proofpoint-ORIG-GUID: tVnHeJPWjoYHypFbjfKWzcVNgS7cQEQV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_11,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190145
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 17:41:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176158

--------------e42S5AzBD0I9CZOBpPK4p680
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-01-18 23:04, Yu, Mingli via lists.openembedded.org wrote:
> From: Mingli Yu<mingli.yu@windriver.com>
>
> Backport a patch [1] to explicit use the internal __time64_t type
> to fix the issue that nscd wrongly cut /etc/hosts to be /hosts on
> 32bits system.

Already covered by:

[OE-core][kirkstone 7/9] glibc: stable 2.35 branch updates.

https://lore.kernel.org/openembedded-core/20230110064813.239677-1-yashinde145@gmail.com/

> Below commits on glibc-2.35 stable branch are updated.
> 293211b6fd time: Use 64 bit time on tzfile
> 26c8278889 nscd: Use 64 bit time_t on libc nscd routines (BZ# 29402)

Above is your patch:
0001-nscd-Use-64-bit-time_t-on-libc-nscd-routines-BZ-2940.patch


> f75f61b659 nis: Build libnsl with 64 bit time_t
> ca97201c24 Apply asm redirections in syslog.h before first use [BZ #27087]
> cad7947db7 elf: Fix wrong fscanf usage on tst-pldd
> e9eb987894 Allow for unpriviledged nested containers
> 2636fbb7ef elf: Fix wrong fscanf usage on tst-pldd
> e7019eeeb5 x86: Fix wcsnlen-avx2 page cross length comparison [BZ #29591]
> fb73a40981 elf: Fix rtld-audit trampoline for aarch64
>
> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>


../Randy

>
> Before the patch:
>    root@qemux86:~# systemctl status nscd
> * nscd.service - Name Service Cache Daemon
>       Loaded: loaded (/lib/systemd/system/nscd.service; enabled; vendor preset: enabled)
>       Active: active (running) since Mon 2022-07-25 09:17:41 UTC; 41s ago
>      Process: 264 ExecStart=/usr/sbin/nscd (code=exited, status=0/SUCCESS)
>     Main PID: 267 (nscd)
>        Tasks: 10 (limit: 4810)
>       Memory: 992.0K
>       CGroup: /system.slice/nscd.service
>               `-267 /usr/sbin/nscd
>
> Jul 25 09:17:57 qemux86 nscd[267]: 267 checking for monitored file `/hosts': No such file or directory
> Jul 25 09:17:59 qemux86 nscd[267]: 267 checking for monitored file `/nsswitch.conf': No such file or directory
> Jul 25 09:17:59 qemux86 nscd[267]: 267 checking for monitored file `/services': No such file or directory
> Jul 25 09:18:13 qemux86 nscd[267]: 267 checking for monitored file `/nsswitch.conf': No such file or directory
> Jul 25 09:18:13 qemux86 nscd[267]: 267 checking for monitored file `/resolv.conf': No such file or directory
> Jul 25 09:18:13 qemux86 nscd[267]: 267 checking for monitored file `/hosts': No such file or directory
> Jul 25 09:18:14 qemux86 nscd[267]: 267 checking for monitored file `/nsswitch.conf': No such file or directory
> Jul 25 09:18:14 qemux86 nscd[267]: 267 checking for monitored file `/services': No such file or directory
> Jul 25 09:18:18 qemux86 nscd[267]: 267 checking for monitored file `/nsswitch.conf': No such file or directory
> Jul 25 09:18:18 qemux86 nscd[267]: 267 checking for monitored file `/passwd': No such file or directory
> Jul 25 09:18:28 qemux86 nscd[267]: 267 checking for monitored file `/nsswitch.conf': No such file or directory
> Jul 25 09:18:28 qemux86 nscd[267]: 267 checking for monitored file `/resolv.conf': No such file or directory
> Jul 25 09:18:28 qemux86 nscd[267]: 267 checking for monitored file `/hosts': No such file or directory
>
> After the patch:
>    root@qemux86:~# systemctl status nscd
> * nscd.service - Name Service Cache Daemon
>       Loaded: loaded (/lib/systemd/system/nscd.service; enabled; vendor preset: enabled)
>       Active: active (running) since Wed 2022-10-26 05:24:41 UTC; 55s ago
>      Process: 235 ExecStart=/usr/sbin/nscd (code=exited, status=0/SUCCESS)
>     Main PID: 240 (nscd)
>        Tasks: 10 (limit: 4812)
>       Memory: 716.0K
>       CGroup: /system.slice/nscd.service
>               `- 240 /usr/sbin/nscd
>
> Oct 26 05:24:45 qemux86 nscd[240]: 240 monitoring directory `/etc` (2)
> Oct 26 05:24:45 qemux86 nscd[240]: 240 monitoring file `/etc/passwd` (1)
> Oct 26 05:24:45 qemux86 nscd[240]: 240 monitoring directory `/etc` (2)
> Oct 26 05:24:45 qemux86 nscd[240]: 240 monitoring file `/etc/nsswitch.conf` (6)
> Oct 26 05:24:45 qemux86 nscd[240]: 240 monitoring directory `/etc` (2)
> Oct 26 05:24:45 qemux86 nscd[240]: 240 monitoring file `/etc/group` (3)
> Oct 26 05:24:45 qemux86 nscd[240]: 240 monitoring directory `/etc` (2)
> Oct 26 05:24:58 qemux86 nscd[240]: 240 monitored file `/etc/resolv.conf` changed (mtime)
> Oct 26 05:24:58 qemux86 nscd[240]: 240 monitoring file `/etc/resolv.conf` (7)
> Oct 26 05:24:58 qemux86 nscd[240]: 240 monitoring directory `/etc` (2)
>
> [1]https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=fa4a19277842fd09a4815a986f70e0fe0903836f;hp=545eefc2f5da61801ba82b7a32ca2589b769ec90
>
> Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
> ---
>   ...time_t-on-libc-nscd-routines-BZ-2940.patch | 46 +++++++++++++++++++
>   meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
>   2 files changed, 47 insertions(+)
>   create mode 100644 meta/recipes-core/glibc/glibc/0001-nscd-Use-64-bit-time_t-on-libc-nscd-routines-BZ-2940.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0001-nscd-Use-64-bit-time_t-on-libc-nscd-routines-BZ-2940.patch b/meta/recipes-core/glibc/glibc/0001-nscd-Use-64-bit-time_t-on-libc-nscd-routines-BZ-2940.patch
> new file mode 100644
> index 0000000000..8d324a3074
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0001-nscd-Use-64-bit-time_t-on-libc-nscd-routines-BZ-2940.patch
> @@ -0,0 +1,46 @@
> +From 3d89d36bb2c7f91fee0d81226234205126971eb7 Mon Sep 17 00:00:00 2001
> +From: Adhemerval Zanella Netto<adhemerval.zanella@linaro.org>
> +Date: Wed, 26 Oct 2022 12:29:18 +0800
> +Subject: [PATCH] nscd: Use 64 bit time_t on libc nscd routines (BZ# 29402)
> +
> +Although the nscd module is built with 64 bit time_t, the routines
> +linked direct to libc.so need to use the internal symbols.
> +Reviewed-by: DJ Delorie<dj@redhat.com>
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=fa4a19277842fd09a4815a986f70e0fe0903836f;hp=545eefc2f5da61801ba82b7a32ca2589b769ec90]
> +
> +Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
> +---
> + nscd/nscd.h          | 2 +-
> + nscd/nscd_gethst_r.c | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/nscd/nscd.h b/nscd/nscd.h
> +index 368091aef8..f15321585b 100644
> +--- a/nscd/nscd.h
> ++++ b/nscd/nscd.h
> +@@ -65,7 +65,7 @@ typedef enum
> + struct traced_file
> + {
> +   /* Tracks the last modified time of the traced file.  */
> +-  time_t mtime;
> ++  __time64_t mtime;
> +   /* Support multiple registered files per database.  */
> +   struct traced_file *next;
> +   int call_res_init;
> +diff --git a/nscd/nscd_gethst_r.c b/nscd/nscd_gethst_r.c
> +index 9becb62033..31c64275f0 100644
> +--- a/nscd/nscd_gethst_r.c
> ++++ b/nscd/nscd_gethst_r.c
> +@@ -112,7 +112,7 @@ __nscd_get_nl_timestamp (void)
> +   if (map == NULL
> +       || (map != NO_MAPPING
> + 	  && map->head->nscd_certainly_running == 0
> +-	  && map->head->timestamp + MAPPING_TIMEOUT < time_now ()))
> ++	  && map->head->timestamp + MAPPING_TIMEOUT < time64_now ()))
> +     map = __nscd_get_mapping (GETFDHST, "hosts", &__hst_map_handle.mapped);
> +
> +   if (map == NO_MAPPING)
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
> index df847e76bf..4352c6edd7 100644
> --- a/meta/recipes-core/glibc/glibc_2.35.bb
> +++ b/meta/recipes-core/glibc/glibc_2.35.bb
> @@ -50,6 +50,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>              file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch  \
>              \
>              file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch  \
> +file://0001-nscd-Use-64-bit-time_t-on-libc-nscd-routines-BZ-2940.patch  \
>              "
>   S = "${WORKDIR}/git"
>   B = "${WORKDIR}/build-${TARGET_SYS}"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176116):https://lists.openembedded.org/g/openembedded-core/message/176116
> Mute This Topic:https://lists.openembedded.org/mt/96371326/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------e42S5AzBD0I9CZOBpPK4p680
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-01-18 23:04, Yu, Mingli via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230119040416.864574-1-mingli.yu@eng.windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>

Backport a patch [1] to explicit use the internal __time64_t type
to fix the issue that nscd wrongly cut /etc/hosts to be /hosts on
32bits system.</pre>
    </blockquote>
    <p>Already covered by:<br>
    </p>
    <p>[OE-core][kirkstone 7/9] glibc: stable 2.35 branch updates.<br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://lore.kernel.org/openembedded-core/20230110064813.239677-1-yashinde145@gmail.com/">https://lore.kernel.org/openembedded-core/20230110064813.239677-1-yashinde145@gmail.com/</a></p>
    <pre id="b"><blockquote type="cite"><pre id="b">Below commits on glibc-2.35 stable branch are updated.</pre>

293211b6fd time: Use 64 bit time on tzfile
<pre id="b">26c8278889 nscd: Use 64 bit time_t on libc nscd routines (BZ# 29402)
</pre></blockquote>
Above is your patch: 
0001-nscd-Use-64-bit-time_t-on-libc-nscd-routines-BZ-2940.patch


<blockquote type="cite"><pre id="b">
f75f61b659 nis: Build libnsl with 64 bit time_t
ca97201c24 Apply asm redirections in syslog.h before first use [BZ #27087]
cad7947db7 elf: Fix wrong fscanf usage on tst-pldd
e9eb987894 Allow for unpriviledged nested containers
2636fbb7ef elf: Fix wrong fscanf usage on tst-pldd
e7019eeeb5 x86: Fix wcsnlen-avx2 page cross length comparison [BZ #29591]
fb73a40981 elf: Fix rtld-audit trampoline for aarch64

Signed-off-by: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a></pre>
</blockquote>

../Randy
</pre>
    <p></p>
    <blockquote type="cite" cite="mid:20230119040416.864574-1-mingli.yu@eng.windriver.com">
      <pre class="moz-quote-pre" wrap="">

Before the patch:
  root@qemux86:~# systemctl status nscd
* nscd.service - Name Service Cache Daemon
     Loaded: loaded (/lib/systemd/system/nscd.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2022-07-25 09:17:41 UTC; 41s ago
    Process: 264 ExecStart=/usr/sbin/nscd (code=exited, status=0/SUCCESS)
   Main PID: 267 (nscd)
      Tasks: 10 (limit: 4810)
     Memory: 992.0K
     CGroup: /system.slice/nscd.service
             `-267 /usr/sbin/nscd

Jul 25 09:17:57 qemux86 nscd[267]: 267 checking for monitored file `/hosts': No such file or directory
Jul 25 09:17:59 qemux86 nscd[267]: 267 checking for monitored file `/nsswitch.conf': No such file or directory
Jul 25 09:17:59 qemux86 nscd[267]: 267 checking for monitored file `/services': No such file or directory
Jul 25 09:18:13 qemux86 nscd[267]: 267 checking for monitored file `/nsswitch.conf': No such file or directory
Jul 25 09:18:13 qemux86 nscd[267]: 267 checking for monitored file `/resolv.conf': No such file or directory
Jul 25 09:18:13 qemux86 nscd[267]: 267 checking for monitored file `/hosts': No such file or directory
Jul 25 09:18:14 qemux86 nscd[267]: 267 checking for monitored file `/nsswitch.conf': No such file or directory
Jul 25 09:18:14 qemux86 nscd[267]: 267 checking for monitored file `/services': No such file or directory
Jul 25 09:18:18 qemux86 nscd[267]: 267 checking for monitored file `/nsswitch.conf': No such file or directory
Jul 25 09:18:18 qemux86 nscd[267]: 267 checking for monitored file `/passwd': No such file or directory
Jul 25 09:18:28 qemux86 nscd[267]: 267 checking for monitored file `/nsswitch.conf': No such file or directory
Jul 25 09:18:28 qemux86 nscd[267]: 267 checking for monitored file `/resolv.conf': No such file or directory
Jul 25 09:18:28 qemux86 nscd[267]: 267 checking for monitored file `/hosts': No such file or directory

After the patch:
  root@qemux86:~# systemctl status nscd
* nscd.service - Name Service Cache Daemon
     Loaded: loaded (/lib/systemd/system/nscd.service; enabled; vendor preset: enabled)
     Active: active (running) since Wed 2022-10-26 05:24:41 UTC; 55s ago
    Process: 235 ExecStart=/usr/sbin/nscd (code=exited, status=0/SUCCESS)
   Main PID: 240 (nscd)
      Tasks: 10 (limit: 4812)
     Memory: 716.0K
     CGroup: /system.slice/nscd.service
             `- 240 /usr/sbin/nscd

Oct 26 05:24:45 qemux86 nscd[240]: 240 monitoring directory `/etc` (2)
Oct 26 05:24:45 qemux86 nscd[240]: 240 monitoring file `/etc/passwd` (1)
Oct 26 05:24:45 qemux86 nscd[240]: 240 monitoring directory `/etc` (2)
Oct 26 05:24:45 qemux86 nscd[240]: 240 monitoring file `/etc/nsswitch.conf` (6)
Oct 26 05:24:45 qemux86 nscd[240]: 240 monitoring directory `/etc` (2)
Oct 26 05:24:45 qemux86 nscd[240]: 240 monitoring file `/etc/group` (3)
Oct 26 05:24:45 qemux86 nscd[240]: 240 monitoring directory `/etc` (2)
Oct 26 05:24:58 qemux86 nscd[240]: 240 monitored file `/etc/resolv.conf` changed (mtime)
Oct 26 05:24:58 qemux86 nscd[240]: 240 monitoring file `/etc/resolv.conf` (7)
Oct 26 05:24:58 qemux86 nscd[240]: 240 monitoring directory `/etc` (2)

[1] <a class="moz-txt-link-freetext" href="https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=fa4a19277842fd09a4815a986f70e0fe0903836f;hp=545eefc2f5da61801ba82b7a32ca2589b769ec90">https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=fa4a19277842fd09a4815a986f70e0fe0903836f;hp=545eefc2f5da61801ba82b7a32ca2589b769ec90</a>

Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
---
 ...time_t-on-libc-nscd-routines-BZ-2940.patch | 46 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-nscd-Use-64-bit-time_t-on-libc-nscd-routines-BZ-2940.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-nscd-Use-64-bit-time_t-on-libc-nscd-routines-BZ-2940.patch b/meta/recipes-core/glibc/glibc/0001-nscd-Use-64-bit-time_t-on-libc-nscd-routines-BZ-2940.patch
new file mode 100644
index 0000000000..8d324a3074
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-nscd-Use-64-bit-time_t-on-libc-nscd-routines-BZ-2940.patch
@@ -0,0 +1,46 @@
+From 3d89d36bb2c7f91fee0d81226234205126971eb7 Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella Netto <a class="moz-txt-link-rfc2396E" href="mailto:adhemerval.zanella@linaro.org">&lt;adhemerval.zanella@linaro.org&gt;</a>
+Date: Wed, 26 Oct 2022 12:29:18 +0800
+Subject: [PATCH] nscd: Use 64 bit time_t on libc nscd routines (BZ# 29402)
+
+Although the nscd module is built with 64 bit time_t, the routines
+linked direct to libc.so need to use the internal symbols.
+Reviewed-by: DJ Delorie <a class="moz-txt-link-rfc2396E" href="mailto:dj@redhat.com">&lt;dj@redhat.com&gt;</a>
+
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=fa4a19277842fd09a4815a986f70e0fe0903836f;hp=545eefc2f5da61801ba82b7a32ca2589b769ec90">https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=fa4a19277842fd09a4815a986f70e0fe0903836f;hp=545eefc2f5da61801ba82b7a32ca2589b769ec90</a>]
+
+Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
+---
+ nscd/nscd.h          | 2 +-
+ nscd/nscd_gethst_r.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/nscd/nscd.h b/nscd/nscd.h
+index 368091aef8..f15321585b 100644
+--- a/nscd/nscd.h
++++ b/nscd/nscd.h
+@@ -65,7 +65,7 @@ typedef enum
+ struct traced_file
+ {
+   /* Tracks the last modified time of the traced file.  */
+-  time_t mtime;
++  __time64_t mtime;
+   /* Support multiple registered files per database.  */
+   struct traced_file *next;
+   int call_res_init;
+diff --git a/nscd/nscd_gethst_r.c b/nscd/nscd_gethst_r.c
+index 9becb62033..31c64275f0 100644
+--- a/nscd/nscd_gethst_r.c
++++ b/nscd/nscd_gethst_r.c
+@@ -112,7 +112,7 @@ __nscd_get_nl_timestamp (void)
+   if (map == NULL
+       || (map != NO_MAPPING
+ 	  &amp;&amp; map-&gt;head-&gt;nscd_certainly_running == 0
+-	  &amp;&amp; map-&gt;head-&gt;timestamp + MAPPING_TIMEOUT &lt; time_now ()))
++	  &amp;&amp; map-&gt;head-&gt;timestamp + MAPPING_TIMEOUT &lt; time64_now ()))
+     map = __nscd_get_mapping (GETFDHST, &quot;hosts&quot;, &amp;__hst_map_handle.mapped);
+ 
+   if (map == NO_MAPPING)
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index df847e76bf..4352c6edd7 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -50,6 +50,7 @@ SRC_URI =  &quot;${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            <a class="moz-txt-link-freetext" href="file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch">file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch</a> \
            \
            <a class="moz-txt-link-freetext" href="file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch">file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0001-nscd-Use-64-bit-time_t-on-libc-nscd-routines-BZ-2940.patch">file://0001-nscd-Use-64-bit-time_t-on-libc-nscd-routines-BZ-2940.patch</a> \
            &quot;
 S = &quot;${WORKDIR}/git&quot;
 B = &quot;${WORKDIR}/build-${TARGET_SYS}&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#176116): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/176116">https://lists.openembedded.org/g/openembedded-core/message/176116</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/96371326/3616765">https://lists.openembedded.org/mt/96371326/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------e42S5AzBD0I9CZOBpPK4p680--

