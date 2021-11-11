Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D84C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 04:09:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.6230.1636603785266800940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=WYf0P9bb;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=694951ed80=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AB3xMAQ015600
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 04:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=rxmPNQdUJfyKpY7ggjQZAJ6ScwVjbIgzojO8XIg60XA=;
 b=WYf0P9bbzkhUFKvmLks4XSHuh4IGxTd7sblaKwMDdyRPDkKv7jlLyIaVaQU2qx6TrfYy
 hM5vB51P+ZAyx+GQ+nLbM18UgD7kO3E3CfL190edHPPQCpqTQ6XjYcpPvet/a0LY7h7k
 4dxxhQscJFq9A9qwm1xjJ/24oTky1AfNaE5psKSnoAxXdrNi8UpfXz87UcK7x/MMJhJ4
 MpWXpk3nLGAPdFqLFTuXu0RCQQB4IEXrdVHBBYcjZiSHkgiNVTyDIZOPflLP+IrhlWHi
 YdMptO8ypQhMGQEMzg3oViNLs3wt1+UBfmiW1YUK3e9k9uGmkzZbqZj2vs5sMZDe3X7p Ig==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c7sf1svrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 04:09:44 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.1.2/8.16.1.2) with ESMTP id 1AB49hc6005808
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 04:09:43 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c7sf1svrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Nov 2021 04:09:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HFEDIM/Hxh/Qq3PWbiLr4/ajrx77sSRDiHalGL8SIwgvnrzjvs4Tm2zhxxHIGnuvxgl5TCy3TzKGJfZ8pkD2LT7zjLauCn9t9X2XtYpzUyo3Grk8KkcmLFqM7LwYLHICq8H2rELyx8+z7c7t5DNrucQljGXUf2BrAqAg/lvp22rZTzIynyJ2Y1jiX1E73QC+uyh/7t9CjY+cOAkIkpSUFd5x7+t8xxUMLKjvunV4M2boXvGItk8inZoUK4J/C+74+exX/VApclLMn5drTgKMlvflqEXCv2yy4dALr9VseJny0HYhsutb9Ehg8ay42b4iVjxPu8GscJHzb2k1565suA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxmPNQdUJfyKpY7ggjQZAJ6ScwVjbIgzojO8XIg60XA=;
 b=ijwb37rBd5uaerRjS6SiRh9oOqGSL9iH5946V8jaGBxFkDUGmXLrpx5j3QxzbHLdnYwo16N5SooOecdc3/H6pnDpWdTq2ltIXR5UbMiXwthOoTqXg5zJEycTdUF2IulmP6jwmOK/0XxZhADm9S8KZyw8bOlqq4kcwgvkDQfhdRtYEoIjRT0e2YRYuSw3p3/nvLTOOHwpZIE5WwNatvQz97BeVhGC5kdw99m6IffIxptbAOo+UDCEE158OWPk53R/mFZQayDxaB8MT3sTkuueum03GTDJKNFM+vdOjV5OkDGgxliwlGdJr2f02Yc5cEX+7M99n4ZTfimrUf+nomLP6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13)
 by DM6PR11MB4107.namprd11.prod.outlook.com (2603:10b6:5:198::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Thu, 11 Nov
 2021 04:09:41 +0000
Received: from DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::896a:7d8a:5ecb:7970]) by DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::896a:7d8a:5ecb:7970%9]) with mapi id 15.20.4669.016; Thu, 11 Nov 2021
 04:09:41 +0000
Subject: Re: [OE-core] [PATCH 1/1] bitbake.conf: Set ZSTD_THREADS to half of
 cpu number
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
        OE-core <openembedded-core@lists.openembedded.org>
References: <cover.1636447679.git.liezhi.yang@windriver.com>
 <5e10cddcd2697c7b762c8c8d245bb76f8666aefc.1636447679.git.liezhi.yang@windriver.com>
 <AM9PR09MB46429C45C98E52EAF652EBF0A8929@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <f4b8c857-395d-2091-00c5-5c96a2ce536a@windriver.com>
 <CANNYZj9HcjwtHKqLwY2icgTrvK_SJzD5ue-4Gf38hrwPH8Yo3g@mail.gmail.com>
 <dc06a051-c271-892f-ef5d-ce265ac45151@windriver.com>
 <CANNYZj9RmumFVXjgoLzEM9eUAk0-rc6+oWjuDUfk+m6uFqP1jQ@mail.gmail.com>
 <4cea3606226d54d229d0103281160343b041eb3f.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <505921f1-c7e7-1ace-2b91-a0248f47b31d@windriver.com>
Date: Thu, 11 Nov 2021 12:09:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: 
 <4cea3606226d54d229d0103281160343b041eb3f.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK0PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::15) To DM4PR11MB5469.namprd11.prod.outlook.com
 (2603:10b6:5:399::13)
MIME-Version: 1.0
Received: from [128.224.162.198] (60.247.85.82) by
 HK0PR01CA0051.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13 via Frontend
 Transport; Thu, 11 Nov 2021 04:09:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a3c1af9-147c-4b4c-b25c-08d9a4c915d5
X-MS-TrafficTypeDiagnostic: DM6PR11MB4107:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4107683B15CB0406BD3ADE57FF949@DM6PR11MB4107.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kscsdG6DjYlsEaF43IKBOTcUD0a0zD4Xe7Yc79GZz49xMI2oZdX09K+SadPUHtSuOkP59SRwmuiWggIXvFK3WUdYImguzHPZFPLlPilPCgOizO/ECXhHCq82le/38NaZsCEKotJ2pX5WInozbl2Wm7G6jD7oukF+/ke3gjWoiZjjrgO/mkIicLi5F6r1Py/z18HNOqi/5/Zl0zEluxgfcrkKG5qROweO1+tcpygzgmdkGTGGYN1fm9nJ0VTHGjkZd4tD0sb6SLS1RambVcJ6jC5LBIDhNm7e49MjDYLFQR8meNoiTsh8XexP+rHLiggWMyN1LiJ2QDiC8F0SpxDTyWWf1pGexEzqQqpKNpPWVPdux1mP4Qr3FbnhSSiu0wG+lJIBXaXTtKRKD5F/ly5aXvR0RKu7z3sjGuxamA0cYboDUMbL54mObPQ/XVfFu8CCkLxKVUMhm0U4i+1vMmhDcg3M2nxRfIM76wrEU4qb14ePckAJfcNk1G9HL9pQCs3wwNB1f5fVRpt94JpMUjydcACShU4JXx2l5XiJbzPV1Sm99fIGstARiH7RaU3eNltxDf3cH1YM7Z7ynXEjInrnad5sKR05a3tS61eUACUaOJdcaAVzSiXZKT7ZOLVNtytIcIpvFa0oWcn5zaxnVScbI/+Ekf9iMeUgsbzF6HBR5mnsCnV8AL+ffyLTJLYNDc8AQTiRbO4eCY86Yyj44FEaeGY6EmXWWqJxUh3Ey8qtGX2NFwR8AWfj8lLUKGapn20vmijRRWlQJto/7bj4DHk9Ow==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5469.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(52116002)(6486002)(38350700002)(66556008)(36756003)(54906003)(31696002)(110136005)(38100700002)(16576012)(66476007)(956004)(86362001)(508600001)(6706004)(53546011)(2616005)(4326008)(66946007)(5660300002)(8936002)(26005)(31686004)(83380400001)(8676002)(186003)(2906002)(6666004)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eG1CbGVoZnM0U0tqVHJvbHlxWGRBQmRLM3Vjby9pYTBHemQ0WVh3V1FNeEZ2?=
 =?utf-8?B?Z2hmYTJ3aXZhZjBjWEo4Q3NIdkNLcEJzeUlJc3RUUlpPdHU1RWJMU0F1Titx?=
 =?utf-8?B?RUtmNTFLdDhoUE5yTmY5UG9MTXVQOUFJcm05VmRybWtwM0I0NnRKdm9LRVlj?=
 =?utf-8?B?WlVuZnVPREloWnBhNTZQTFpnalYyNjVkcDA1MTJaL1VqeitST0xhS3Bzek9L?=
 =?utf-8?B?ajBJM0MzR3U1K0VwallpVERxN3ZkVm1XeGdST3ZLOXRIUkdyM00yTFlsSndJ?=
 =?utf-8?B?djJqR3FvSEkyT1pYNVRZRGlwMmJ2TXhiNnp1ekFEakpZREFwYmNVUk1jbmlh?=
 =?utf-8?B?cjhPaDlGOGdON2NlVWlQK2Vnc25NOVBkUTM5TnVaWmUzbkZINzhzT3NvR2g1?=
 =?utf-8?B?MzhGN21TY1l3cVdGWGVMYUxPSC9PK2ZsZVJpR0J2ZkJLTytXaVNLS0czS1cz?=
 =?utf-8?B?OC82RVcrSXNDeWt4bm13dnpnaUt4a0xxcGJFSzBEZEY1dk9ad2ljWWFSYzA0?=
 =?utf-8?B?UjlEeks1Mzg3b0JtUG5QRjZzZVpUaXAzYjZZbHlnbUg2bzI3ZDdhZysvTjZ4?=
 =?utf-8?B?cGFEcWxiQnh2YkNRMHlUWEpTQldJbEZMbVc1Y2VhUDkwZ2tER3hWVndESWx3?=
 =?utf-8?B?VGlob2Z6ZmhKZTB2UlZtY29WbGtFbHdIdUxqb3FFemR1VzNwODVyOE9Va0Vz?=
 =?utf-8?B?OGU5akg4aHpSNkFhTmNNYmc1UUsxeE9lNTRzNFVXai8wbi9Xb0hTWXJrZGxM?=
 =?utf-8?B?MzlPTTh5L3h2MnNZZ0VJeDVOTnJsRC9SUktOZHhxSkVZbkJRL29xenowUkJm?=
 =?utf-8?B?aERjelRGUWVyYWNCNW1GRTBnZ1hRSVU5aXB1bTliRzdxNkdKaGxMeWZFVWF2?=
 =?utf-8?B?K2xDRjRPamZaSFhvbU1UdnM4cnNVZkJJWnRyMmtoUGpTZDRZdjB5R3NURGF0?=
 =?utf-8?B?UFZwZElSeWExUXVzOURuV3hyOGl3b29MYnN5YVFta1NVTTViK2F3YmFPRmlF?=
 =?utf-8?B?ZlFIWTkzSFFoQk4yUytQdjl2dDV5RlFyRStOUU01YXFLbmdIQlNyMTA0bmpK?=
 =?utf-8?B?RkhxZHRQWWxmM3k5dmN3aDZOMjNWcXRKYjhhSUw3UEhCQTVVVkNHREVEUHdB?=
 =?utf-8?B?M1NCeHRra2RBN1hKOGhsQktQT0NHc1o4TVQ5cCtWdVBxanJOSUFiNzdqYUVG?=
 =?utf-8?B?UGFRTEIyQzR3bERuTEJYV1NVaDVUaWNCUEQwQ3c0eHU0T2RYSFYzeUlKaUhT?=
 =?utf-8?B?UUdPb2pmMnFnVHp6V3hTVExXMklRYmtwNkFXSzUwcytQL1BWVmVySWoxQ3ZS?=
 =?utf-8?B?RGo0VnNZcUVKRzdma1FwNG1KL3VTTHlXaW9rODBhU0kzcmFGNUhpQWFwQkNQ?=
 =?utf-8?B?M0RZR08wTm1GSlNXL1MzOW1LTVVjRUlXbkw3ci9haGdhUHdmSjliRFdSckha?=
 =?utf-8?B?Z09KcW9HZ0ZvSlYyZFNCTGxPcEw0WHlrL2xoWUcrVE5MaUdob25TMnVISktv?=
 =?utf-8?B?NkltSjUydEl1MnBOaGlTU2NIdVZoNEt1a0dDeTNUd0dZR0N5OUlTU2dORlkw?=
 =?utf-8?B?TVZ1RGpNanNvbjZaaDhiU1R0dlJ2YVV2S0w0azJFQ2VvTSs2VTZpWjgwNmI2?=
 =?utf-8?B?dWkwVnpDWTFYZlhmWGREb1h4SmxpTHhSV1BzVEM1MVU0MEN6dnlIMlcwWlI0?=
 =?utf-8?B?cW1TcjdvNXdRMFV6a2ppYnRGWjE0YVpZalBEdmZsa1JKckIzV0R3WUJYRkEr?=
 =?utf-8?B?R0VuSGM3SFVjdjYxM0N0TkNjOGtXOTVoYlhjam5PZjlpU3hRNGpaQ2diK1ZH?=
 =?utf-8?B?R0o5T1BERmFKbnRlK1U0cDA0NFRrdFhBdjZvczNhOVR5cW5pTjl2MytHY3hB?=
 =?utf-8?B?OGlycHFwQ01RYVE5YTJtcXJ0UTB3NHVBTFFXb0xFRDVXWlkxNlgzamZYMGdS?=
 =?utf-8?B?WlJCUkN2bUxVMHo3Q1UzRlhKVWpWblJ1QWh6RGdCeGwxMDdIN05ia0F0NWVQ?=
 =?utf-8?B?dGJMNmc2YkptaERGVlVBYXA1cmx2aXJSYUZQNW5NNkJMb3hsTkM2Mm1wbVQ2?=
 =?utf-8?B?eTgzUVJDZzdMRTZUNkpsdFZRWWxuNnMwTWxrM21nQk1PZi9GdUpWWWZYMTBi?=
 =?utf-8?B?a2hQTm41ZzkvM01XejQ0UGRKeHJLVnFhLzEzYnkySSt0RmZ6ZThMSVZSMzd4?=
 =?utf-8?B?TVRGWXVzSjZVTGJHdk5xWnR2UWtUUVExTFVsL0F5L2tVamg5NUZ1MVlDdkkz?=
 =?utf-8?Q?LYG0f6XjF3wOhceyc7NLMfqtVX/OUnpIEjit/g3NKg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0a3c1af9-147c-4b4c-b25c-08d9a4c915d5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5469.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 04:09:41.2598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YE7ytiPPa4lOqvq/tqelow5fs4aHvvHjVccaqH3diiC6cg2iguDOLx1D7lFFCyLBBpWKQLqYI/sreVle+2rGK5uxv3FzgDxAglieYiucUjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4107
X-Proofpoint-GUID: duKL9xDZMJgN2HYgFUmBEHmC1NsFkyZ9
X-Proofpoint-ORIG-GUID: WkbGyOZvzcepw3sX3mrHhzHk_zkiP7aM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-11_01,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111110020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 04:09:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158147

Hi RP,

On 11/9/21 6:26 PM, Richard Purdie wrote:
> On Tue, 2021-11-09 at 10:56 +0100, Alexander Kanavin wrote:
>> On Tue, 9 Nov 2021 at 10:51, Robert Yang <liezhi.yang@windriver.com> wrote:
>>>> Maybe, but once we start doing tweaks like this, where do they stop? Hey,
>>> I'd
>>>
>>> I think that it's not only a performance tweak, but this should be
>>> considered
>>> as
>>> a bug since it would be failed to build on powerful machine, which isn't
>>> good
>>> for oe-core's user experience.
>>>
>>
>>
>> I managed to bring down a powerful machine just yesterday by building webkit
>> and llvm together at the same time. They together ate all the RAM, and someone
>> in the office had to go and reset the box.
>> Do I see it as a bug? Absolutely not: it's in fact my fault for not ensuring
>> system resource consumption doesn't overwhelm the machine. This is the same:
>> if you do not have RAM to match the cores on your specific rig, add RAM or
>> limit the threads.
> 
> I can see both sides of this. If we had a pool for all the threads and the
> pieces of the system all used the same pool, it would work well as implemented.
> Sadly the bitbake threads, the make processes and now the compression threads
> are all separate.
> 
> We do see the autobuilder break due to load issues too and on that we have
> scaled back some of the defaults but not ZSTD as yet that I recall.
> 
> As such I think limiting the upper value on number of threads may be a good
> compromise, both for compression and maybe for parallel make too.

What should we do next, please? Limit bb thread + parallel make + zstd thread?
Or just limit zstd's thread since other people may concern about the
performance.

// Robert

> 
> Cheers,
> 
> Richard
> 

