Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9033C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 08:47:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.5329.1646210843736196294
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 00:47:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=AUC68XxJ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=0060efda98=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2227jGTe020741
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Mar 2022 08:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=h6gJsXv3S0YlIqSUcVQ8qMlKwUP/iQq73aARBmGeMLY=;
 b=AUC68XxJmHjNQYUneFSqdZaRKuWjzDqij+4u6aIuxa3WbNKhvwB+ZPDLHH9Xv/DvWU0N
 dtty//3s7vsa+CQlNZzgADWUwiDk3Z9T6f7efHXnIpRRJhSIIFPASCuWL0b8NMcgmNBV
 WUAw4gSpcVnmBxR/+NBiScnlBl9hCgGAH4isSE6rcp3P3hXvKtNHFDKw+wUqXj2Nxqit
 YEAhdFciwrqCtwz3LbDhoYseMi+PcOmCZ7ggLivEIEMyUFSripjP9DI/ZOlJIVEk+N4j
 Iutr+xqphYsiT7JXb+LSUt/4zgHNZtfu2/ZYdRUWvCHtrQ4LZhRp5h5CGh7TOdWPQTvs dA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3eh0yj9mmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 08:47:22 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2228jMbN017989
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Mar 2022 08:47:22 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3eh0yj9mmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Mar 2022 08:47:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHW1jXFOEaJw6qh7C6AEhryIhU34paf/Zxzfr3L/T7fm7zJ8MAz76+n17jJGv1Y4gJYFI2GNB4euo/YeLhyaCtGHuG8YoqgJpr1MZONKoOYPL/hsOTQ61iEdRPmFBK5eHENbSxAjn3vXU49/8i1uyeR1vkAMNc3TAYMcJzBRKggvBBhNVjMA4zlPmdNG2y/z4Y+rD4NhbzbWU1rFdX1vzlV01hDKFb5vcaqAN+Z/LR8gCDyuhN7JIjAwHHG3j81C0oJvb0WElC0aeIHE8ke2zHX2ClQjpLdZ1Oisr0meS6zdBhJv2I6q5Y7bVqFbKRUkCnLv2S/NU9AF2p8ZdCvuSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6gJsXv3S0YlIqSUcVQ8qMlKwUP/iQq73aARBmGeMLY=;
 b=hkb41swxGh6ChLipCpINo7oxIRR4gepSYOa+JmnljQCPVm0Qbmg7xuPyZF7CL9BmJQsBuHmDyFGnXKHM1fxlw7bQz5ia76qfln9RseCZ6DLjk88pMJqAB0WDpbPJ5G1TMmiNHUN/JPc5GvS1+Im4a4ytX7p5ir3lBfWiAeXpVpAL4wYWNiPlGKeaThCyoLCC0cJVYxXYNJbQWfACP+r2yxTlea5S28qkacgJkFAWvwRbDS6gmUQG5qdfwbO/7fixYiYN1/k2IjUVywICNZfcxz46xEQZFRecHQuWrt2LOUhO2YO9TpyBUxCl8pVDT/D4JvjSYW0ojA6L3qfKAfteBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by PH0PR11MB5781.namprd11.prod.outlook.com (2603:10b6:510:14a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 08:47:18 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::9505:de88:28c6:f439]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::9505:de88:28c6:f439%7]) with mapi id 15.20.5017.027; Wed, 2 Mar 2022
 08:47:18 +0000
Message-ID: <88666595-4acf-5d7e-eb4b-23cd28b9929d@windriver.com>
Date: Wed, 2 Mar 2022 16:47:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH 2/3] perl: Makefile.PL: Fix _PATH_LOG for
 deterministic build
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <cover.1646204967.git.liezhi.yang@windriver.com>
 <d4b25c6c4a2a48da96da92bd03fe060e0cb37547.1646204967.git.liezhi.yang@windriver.com>
 <CANNYZj8Qd9uDCKQ2M_X35O__2MeiSJEP9A1J9TJzZsi+y6OCOw@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: 
 <CANNYZj8Qd9uDCKQ2M_X35O__2MeiSJEP9A1J9TJzZsi+y6OCOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0020.namprd21.prod.outlook.com
 (2603:10b6:a03:114::30) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdee47b6-4070-4891-d01c-08d9fc29418c
X-MS-TrafficTypeDiagnostic: PH0PR11MB5781:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB57813734D75051C04142B371FF039@PH0PR11MB5781.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TcDrGhK1seqctMzI26LUExlsD33QO5iuXwCWjLH4qKfqQ9Y1XqHKWTTF4d5uNy3R/PfdDewzBUbvzrLpnzsF7fdv8YqV1tpB6CzBAkgBEt+OchH0SAYnnUyoatMzlcBW+NOyqE5EuS8yzhBN9Qzlawi7iJ694WvmOzBbeLdajwZaqFaxfWkGpITBQuhYpw9NkYHWTtKNbyDxrhN/8XxS3J2Olsd8M/z65Y7MI68PS5mXJFIx3NhjJ1V72GBrkb+kG1gr6mR3s6UaR9BzpCxIVWgbGGmzdg2goGpQn3LzgGqE0vP9R+t7sbJB7KJwWBD4CE0D58Rt+oayE8vSu915RBaxiixce28UBqhQhXTiowAvUOzQWS9r0D5gH/Gq6sOZpqkaCMVqshWkM1oqSJuSqYXyAzV66izczu66ouPKKEb9b4VpOH0M7B0x0Q0d7xVOkkJ3MbQMK9EuQHhIdl0+0PPiLoHJMJKSjg/WmPuHN8K3zxI6uvG4LWOz/OrrT8Qm42c1kaEgOPMrVH3XBFuy0hr6bSTen2yE1y9k1OJa87Bmo87ZHmUzfYB7dejb9jLGLtIuapoFLMdB8gtFKAjHMkxTPL0amnwA3m04oZDF8Nq3N2RPwSwP+8TUrFhylDA7GUYIdW7c3T7doppXezxWkk6X/cI4OBgBg6g7bZK6Yw3lpqSjPO6u7SUVi8ZjNpos9zqb4N+ceL3kYZAD9IHWYcPxURgk6KIeia8pfDx1CnTFJn+Dh9x+8sB+MMrsr2XjUOaJQKiF1dZkN2zXo/okgFKTUt3OvUF7vfGzwYzV/LC+CDO8ffZt8EN67afjljVAG3dNxOwd5q2idR3xiwmJAe3lyAhWvK/ndVepkyWs2kme+4EnoEJrWCmBdue0Pe2/ZcmuGfY9yXkHzQJkrfz/lw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(2906002)(8676002)(4326008)(36756003)(8936002)(2616005)(186003)(26005)(31686004)(508600001)(52116002)(53546011)(66946007)(6666004)(6512007)(31696002)(6506007)(38100700002)(66476007)(86362001)(66556008)(38350700002)(966005)(5660300002)(6486002)(316002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QXZJNGxSMXdRSHEwM1VHRFhDZERLZS8wQ295Vk9xRldiaEs5bEFidnp2ODBI?=
 =?utf-8?B?RnkwTE9zVHB6VWxUTXRZNGYxdGF5RnZTa3ZHZCtXaEU1RVJqSGFibHdLRkEz?=
 =?utf-8?B?VG5ySEpzMVVhakFLTndUY2pHaGVpMDlzSWFPWVVOdEhOTUgxaTZXMVNpazlV?=
 =?utf-8?B?SHB5OHRER09RbzZsWHNpVitLanBnZjRIc0Q0bzRHUjRuMVZ5T2xJaFZ5TkVH?=
 =?utf-8?B?L0hHd3NLMmd5eFYvTGlrSVpuZGIwd0tEK1JmVWhCS2Q0b2cxNGhRdzVYU2dZ?=
 =?utf-8?B?RlZSdFRrWDNGNEltWW01T01xSW5TQjkwRVNjSlVHR0o3dTJjd3krRGt4Qys1?=
 =?utf-8?B?UVl3L0VUbzQwQ283YVRRbDRZVER3Vjhoa09ibkpLSFQxQ0FIeUdDMGNZV3E5?=
 =?utf-8?B?ZmhTa09nZGtHNFl1MjdPM1JtcmlBTEowNlFQVkVYNTYxN1p5d21HbTF1bnow?=
 =?utf-8?B?SW4yTGwvTE5vTjRSZk80NlNXS2NSd1F2RG5keWZUWGs0MVdiRnBOVG1zOUND?=
 =?utf-8?B?NWhpSGNyNElFVUcvV0orRHF3d2JZNm9ST3ZDdHZSVmlhNFUxUlUwY0prV2Zu?=
 =?utf-8?B?SHA1R2pjajBZWXpzNStWZzJENmRNVkJPVEpVNHAzUGh5OGJpakZuazlTVHVi?=
 =?utf-8?B?eEVlR0NFS2tJcmdyRTk0REtNd0kzK2dIOFQ0UE5VYlh3OUhmTnQ5eWNPL0xF?=
 =?utf-8?B?WUNUc3NmVVpwbmtaSk91UzJDd3BTY3dLaUZuYzFLejc5MUJRYVloZzlUU3lO?=
 =?utf-8?B?M29IZ05ORjNWZHozZGtQZTBTeFg2eit4bWhhV2JxejMrbDArQmRZOVlZV0pr?=
 =?utf-8?B?U1c5T2pOOGlQSTlvQk5ZVy9HM2tjQ3MzazZOTUdPUW1TWGFBS0xNNHordHpB?=
 =?utf-8?B?ZDVJRkV3SjZkYTg4R3ZweklHb210MTVVSzMxUm44czJyMmdIWGZuTW1oaVV6?=
 =?utf-8?B?YXZRaGw0bXp5V21LQm80YWVYMXRHQXBqVjM4VDgzdTVxTG5jWDFJOXR0aER6?=
 =?utf-8?B?VkQ2NjV1dHlnMjMzaGVMUElwTFRIYU84NFMyTXFpaVo4bXhUWjYxMEhiN1Vs?=
 =?utf-8?B?L216bmRLRXdyL3R5UksvemVpOUJVVTAwZzBNTDVvb1JnRllOQ2d3YUxYYVMr?=
 =?utf-8?B?c1J2SHBkdHJobG5QVXorYmNwcmQyZVZjWmpjd1pYOTVxaEJqQnB4ZENnWnYw?=
 =?utf-8?B?b1J1QjZnU2NuTU5rYzhqWHhJZkxmTkdBSzBJWWVHZitBMkxleEswbDN4ZVJI?=
 =?utf-8?B?a0dSK245UkNzRjd6b3Jjci9lQi9EellETWpKWlFiOUQvQjFHaEFLTFVvM2Fq?=
 =?utf-8?B?aGxpYUQxTzRMS0VSMXhtN2lRWjVld0RHTkgxMEFjN2E3ZUJaeGJxWEdROFJq?=
 =?utf-8?B?VDJ5TjkyV3I2N3RIbzFjQ2I4MGYrWXVGMlJXTmlLMk15K00xcW5oM3lYYjg2?=
 =?utf-8?B?cFVieGx6anFueDZjdkMwV29pb1JyclFLMDd4MTh1YTRtQ0JZOFNNUWx4UlBz?=
 =?utf-8?B?TklZanZKdnRzSW16cnM2bTJSTUhDUnoxRzNJTk95S2NwSkx5VzVOR3REQU9H?=
 =?utf-8?B?U0xkZVdSWWhwdFUvMldZS0tBMTM4aDBwRmFQa0NQMWhnL0IrOEJkdzdrVE95?=
 =?utf-8?B?OHUrTWd1aHgyRS9IY2ZXT1VEQVdNb2ZIbjZpdWMxOGVad3ZmWW1lN2g4T2Zq?=
 =?utf-8?B?dnVEY3hRM3c0TlhJMkdWdXBEU1VBUlVJZFJsZUdEei83ZEIzY0UxYW5PSEJY?=
 =?utf-8?B?a0ZTNG1JSWNBakt0Y1NHL2lGTHMwZCtEdGp2NXp3T09xQ0hGL3owQjk1bm5h?=
 =?utf-8?B?WXBYWkZSVkZvZzZUeWFsbytyc2FJUHV1K2NHelc4aHBrWmk4UW9qRXFKVUx0?=
 =?utf-8?B?OTBiMHJNVlBLVGhYcHdRUnRjVDUxZHBnRkFqWXMzaWdOY05kaXJpZ1o3OUd5?=
 =?utf-8?B?Vm1Ua0pwV2plRUtLRXloTUFhUzhNWUJEVG5JVldGeXlEOXdsY3Y5RS8xWjBC?=
 =?utf-8?B?dFo4NTh2Vkdmay9HTVJHai8yUEdYUHExaXcyUTJsUVFheEQ3K2Y1aHBFUWpJ?=
 =?utf-8?B?SHpzMWd6WW9ONklYek5MamNGTTlIeFZHekczdFFGUGZhQVlxd3hrQ3RUSWpS?=
 =?utf-8?B?Vll2MFdDcEdLa2NlUFVwa0RUVWlrM0xObWphaFZxR0RkY1kxbUtnc251OWg0?=
 =?utf-8?B?aUtYZ1k5TTdmUGhmeEdjVzIvQTRvdXJBOFRXZTFPNTEwdFRoaW5TNktYT2dJ?=
 =?utf-8?B?OWU3Um9zYThiTkg5TWphRlNPTkZ3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cdee47b6-4070-4891-d01c-08d9fc29418c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 08:47:17.6366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 C9GKp6mqQlQflNX9pfxWz+I9Rou8m0tOvHR+g1pQl0U5qNg8nbK1BNR0E9bnZJzyQn4lMuDYabbt5S+VrW2Qsf3l0Di/x01/BCLcdPXq9jk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5781
X-Proofpoint-GUID: wB1A3xKVHpJZxkvsNRTRh657N0m8l8aX
X-Proofpoint-ORIG-GUID: aLJ_yN5ZzluWEkttJoSBPMJjezArj2kK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=716 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 08:47:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162597

Hi

On 3/2/22 4:42 PM, Alexander Kanavin wrote:
> Can you file a ticket upstream for this please, and include the link
> in the patch?
> 

This patch won't work for upstream, only work by cross building, let me check on 
how to make it work for all cases.

// Robert


> Alex
> 
> On Wed, 2 Mar 2022 at 08:13, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> It checks host's path such as /dev/log and uses it, this doesn't make sense for
>> cross build, and it causes undeterministic, for example, the contianer os
>> usually doesn't have /dev/log which leads to a different build result since
>> other host usually has /dev/log, so make it always use the default value to fix
>> the issue.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   ...Makefile.PL-Fix-_PATH_LOG-for-determ.patch | 34 +++++++++++++++++++
>>   meta/recipes-devtools/perl/perl_5.34.0.bb     |  1 +
>>   2 files changed, 35 insertions(+)
>>   create mode 100644 meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
>>
>> diff --git a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
>> new file mode 100644
>> index 00000000000..f6bcbce6856
>> --- /dev/null
>> +++ b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
>> @@ -0,0 +1,34 @@
>> +From a73fff1fcf0def4ce93964f1b63fe3ad0967259d Mon Sep 17 00:00:00 2001
>> +From: Robert Yang <liezhi.yang@windriver.com>
>> +Date: Fri, 18 Feb 2022 09:44:26 +0000
>> +Subject: [PATCH] cpan/Sys-Syslog/Makefile.PL: Fix _PATH_LOG for deterministic
>> +
>> +It checks host's path such as /dev/log and uses it, this doesn't make sense for
>> +cross build, and it causes undeterministic, for example, the contianer os
>> +usually doesn't have /dev/log which leads to a different build result since
>> +other host usually has /dev/log, so make it always use the default value to fix
>> +the issue.
>> +
>> +Upstream-Status:Inappropriate [OE specific]
>> +
>> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> +---
>> + cpan/Sys-Syslog/Makefile.PL | 2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +diff --git a/cpan/Sys-Syslog/Makefile.PL b/cpan/Sys-Syslog/Makefile.PL
>> +index d09ba69..d44e58c 100644
>> +--- a/cpan/Sys-Syslog/Makefile.PL
>> ++++ b/cpan/Sys-Syslog/Makefile.PL
>> +@@ -130,6 +130,8 @@ else {
>> +     $_PATH_LOG = "";
>> + }
>> +
>> ++# OE specific
>> ++$_PATH_LOG = "";
>> +
>> + # if possible, generate the code that handles the constants with
>> + # ExtUtils::Constant, otherwise use cached copy in fallback/
>> +--
>> +2.31.1
>> +
>> diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
>> index a97da872032..8a1db7ed359 100644
>> --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
>> +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
>> @@ -20,6 +20,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
>>              file://aacd2398e766500cb5d83c4d76b642fcf31d997a.patch \
>>              file://ea57297a58b8f10ab885c19eec48ea076116cc1f.patch \
>>              file://5bc1e5fdd87aa205011512cd1e6cc655bcf677fd.patch \
>> +           file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
>>              "
>>   SRC_URI:append:class-native = " \
>>              file://perl-configpm-switch.patch \
>> --
>> 2.31.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#162590): https://lists.openembedded.org/g/openembedded-core/message/162590
>> Mute This Topic: https://lists.openembedded.org/mt/89496472/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

