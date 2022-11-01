Return-Path: <xiangyu.chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E30FA3740
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 01:50:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.1500.1667267407120393303
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 18:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=Wto/Rqau;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83045f318c=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A11k5ZC017560
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Nov 2022 01:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=L8f31jRAxpE97XRJCSg5rZ3n3AR969nEAphlP9CJaiQ=;
 b=Wto/RqauYnYaw/jsMivL/vvFNT9A+CgjTgEGfgdZhxgAxFAJmmpehL+ER0ZuLGWPs+kT
 6Bg+hVdTZLDgNHrB2U9cQvuSCIyneIjHVOsFl81TgtIH/hYQ6vY27xBbVP8/xLD653C0
 eacVYO+XMbfriY+Lf11GOwMTI7ds/36X+j9t44/wRsKB8zBd8t6mP/VoGhxsR39Tl5yY
 y6sphEdQlcBCCZqw0sRdm0zagvtuND7IcFJPLRWm/rSLK5FHmcrBVfMY/0f3H1KqhCut
 ihJ074ty5kMa1T9emnxxpll3bCNc7UM8KrIU31dtcIME+SSPUcYxSq5dxNFaa5wMXT7r xg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kgu5c20ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 01:50:06 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A11o50u024609
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Nov 2022 01:50:05 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kgu5c20pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Nov 2022 01:50:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUv8nnMAyKRLQWU2ZT2JUvitINCUZJ6kV7wfCf9Knw9zpinBUEA+/69ox4qnscMp5p9n00BqBqrQFnlFqBTs+W603xhJEpxy0VdnvXD7rc0qPLjT4agBYEhH510iPOglLssYAX4P5lXRui/0fc/fu/0nljQ3v73DVLRep5yLM2xJV5GzXSTdxeThoY7yOewpWO7DcoC9OP4pxbpJbroTBwZfoe1gN9iYtipPVjYqdaad1/9i+Q0hFZMaJvQZsMG8qByFr5i6kiDrkwxW7fTD3XmavHvERhxKl1keNAT+VAf/44W7Miw+bhuwCv8Td7eHXpXItkLgdeuUhHgYbKKOmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8f31jRAxpE97XRJCSg5rZ3n3AR969nEAphlP9CJaiQ=;
 b=CjVh97SIDEPyJKg5ZTEd2+qP4iX8YmX2m/JkQt2loZK1efPAZO5bjaMJMM0yASYkwPMwg5KJVh/i1t4jl+vZ6oYDSUgf9vObXBNavP5MM9QAnUjv5Kmphjm3otKtnhhda6bu07b0Kvj7y3acGB1ywa1bRbXNBZ0xedNz3SJe52GzSFc92gEXRGQDUohWKdzYdC5SlviVRzCHvw/82uvDCkieCnDWPJenCnloPm2z6FaT1BMJsQSQRmvPQC7up20og53KLY4Vi2igj56Q6Sghbdayz5l8FNO6BOrvAIRD2Gvo9zrM3QsDspNnoA+Vlbht4qLicAeYfK9KLcXK+GJH/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH7PR11MB6676.namprd11.prod.outlook.com (2603:10b6:510:1ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 1 Nov
 2022 01:50:03 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::99b5:140d:8487:5f3]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::99b5:140d:8487:5f3%8]) with mapi id 15.20.5769.019; Tue, 1 Nov 2022
 01:50:03 +0000
Message-ID: <b1879230-4a17-1d7f-819d-94053d35c1da@windriver.com>
Date: Tue, 1 Nov 2022 09:49:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-Core][kirkstone][master][PATCH] rng-tools: Add Arm aarch64
 CPU specific configuration to address excessive CPU usage on startup
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20221031075042.224693-1-xiangyu.chen@windriver.com>
 <CAMKF1sq_Ubb3r+UtgZ651=wf-SFvkDW17cDzJ_us47oiGc6mZg@mail.gmail.com>
From: Xiangyu Chen <xiangyu.chen@windriver.com>
In-Reply-To: <CAMKF1sq_Ubb3r+UtgZ651=wf-SFvkDW17cDzJ_us47oiGc6mZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SL2P216CA0181.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::7) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH7PR11MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: 16dbe077-f675-45b6-a870-08dabbab64be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8r7hgk3spYXtDRDSmg9SNwLrRPKVLYT1/sHNC2XIcA4d9+/NKkb86wx55ZHDwX0hmCfA5n4NolZjVbxwH/DJvEjo2MXgUyjJVoZtgbznCdhEmzOD6zYT+rlxlDH0YFZYJjHNE4LA6q7eU+CMX0goRWhfEcCd1y1vWTrt3xL+TDfrvB2YQvt+1dJOg8NmBGY5h89H2AADdwLkFm3+gCgGYQcNPefGeXUWDWg+xkXSd4Wlx4sGPtj/GiNBDfAV/d9lHgHUpDti+fsX/oJ7/jejf33OY6RE1+xXqowF8ZtYskTPkHkwPe4vcnLhgsMmEwa/KEetTylblN4CmDGNeufRlvU3yksqssp8lDRFiqpff08n1tAQipyTPK32YtfAtlnro5gDCzkAF2U7NY4MsU8hy08DQb1xrLz/tsZpNL/jixQqp5iZCofXS44yWdkzq20uvBB9cVYMNOeQjtHgmOtmLXEIw/bwUv36nv5TjMfp9inU1gHHmWIE0O8gyGJXeoE62gZcGZA45kw247kM0xV1bOvyvikstXq454WhhjKoOcbPnfI9V6lWEk7rN6/cJ17ximVZYNLCxUbZLws06HnKfDcbPurw1MYJPj6K+tZFJV6iXNqs+K8cc69AETJ+CLUq/ooNuE74ItCiFmf3zUOPZSFjWxppmQ1AExTQHG82SkhxseFJFgfsz5fND8Hn+t9SlrJzEyuGJglTJayEdJxGbUOpt2cnSt7/Ht3w7VJjuM8x8lf76e+O++TSMgCgROeVGUxdZrzc4ncFt/fATzD1pDsw3dAKSnE2MXbLvXew23kv95PzQSKfTfOfCQ7DQKROsaL8Jz1dpR5Xg+ZldHZ76r3huoW7MJnuOGIHW+Kknw4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39850400004)(376002)(346002)(366004)(396003)(451199015)(6666004)(26005)(2906002)(6506007)(6512007)(31686004)(53546011)(2616005)(966005)(8936002)(478600001)(36756003)(6486002)(44832011)(6916009)(186003)(316002)(66899015)(8676002)(38100700002)(66556008)(83380400001)(31696002)(4326008)(86362001)(66946007)(41300700001)(66476007)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TnJ3RnFYS05Yc3B2dklYajA1TjR2aENFU250Kzc1emwzS1NFTXgwTVI3UUdp?=
 =?utf-8?B?ZlBVMllabC9oR2o1M1RJZHpBWDFRTzZqRDRZMDRETTFNVkk2aWozMmUxTGlL?=
 =?utf-8?B?SWhCekZPcDhpSjM0a2NYckpMV2ZNbmI0Z2RRdUFHYmc5VXkwdmJ4RkcxMzFV?=
 =?utf-8?B?cWhlNmZvTGcvV2JvdWhJTHJZUXNmZUwrblRIZGZCUDRBRTFDS0FpTmZxRGM4?=
 =?utf-8?B?dFdkbTh6bkxBSktpRVhRSVY4NVNZM3QyWG9HTXRzTWIrcmlmVzBnYTM2TS9j?=
 =?utf-8?B?a00rNFkvR096VWovUEpXTnpsQjdBWmdrN2ExMGt3R0puZlNRVnRwSzhhK0da?=
 =?utf-8?B?Ym5XYWdwc1RjcFdpYW1YYlNTRVd3ejF6dEpoY2QreXhEMVlLbEprQmVManhX?=
 =?utf-8?B?ZCs1SDN4ZjJINkU5d3ZXUnBhM1h0SnZDU2J1VExxbktFNFlpV1A3TkRvajZJ?=
 =?utf-8?B?UG9KYlBnNGduMXFja2luSDdKWXB1NDIxWE9sVWVlS1p2Umt4Q1A4YUNXSHAx?=
 =?utf-8?B?MVJlSUhxUmtQaFNhT1dNYml1UEV5MmVMNmlHWFcrVXJYLzI3eUVUcTN5aWpC?=
 =?utf-8?B?Znl4emhFR1ZwK0Jna252Y2xIcjNMRzlJVTVzZ2ZEclczK0VIZHJUZDFDZ0pW?=
 =?utf-8?B?ZkoxbjFGcHVOb215SUdZVlZteVB1Qm84OHVGcXJCR2hnZG1GKzMwS2VyRnRn?=
 =?utf-8?B?a0MzWlVORHJ3VTRrOXoyTU1zWXNHMHQrTmNSQ00vRFg3REFncThObTlCU1pS?=
 =?utf-8?B?a0ZCWUM3NzEreEl1bU1odzF1S2RaemM4YXBBM2ZVdHhOR3lLZExld1FnQ0U4?=
 =?utf-8?B?T2kzS1F5ODhLZnl2Ym9ZZ3BPdFVpZk1HaU8xdWtteGtwbi9PbDBVaVhBZUFO?=
 =?utf-8?B?em1iREs3M3d2aTdESkFEUHNNOTRHVHJ5cTV3UFFaM2owaDVlSTViUWFuRjYy?=
 =?utf-8?B?d0JQU1dMY1pEMDZuV2lWbnllS28yL3BPUEFoZW5aajJTckh2VW9oczJCSFd3?=
 =?utf-8?B?ekl2OG5DUXVHV2laZXJzaGR4cUlFWDZZZVBkRkV1dkErNVM4Y0lDTmwyYVl2?=
 =?utf-8?B?VFcwekl5VDV4dHl0RW4reGVuRkZCRjBwUktpaGw2WXBjaWhVeWZMZG93VDUv?=
 =?utf-8?B?MWZWTXJFMkFGZXJoK0kvNjdaZ1c0UjQ5ODlLLzM0ZVlyUTJZUXYvTmtReXdk?=
 =?utf-8?B?TCtSNmIwNEJqdzYyRDZWZDFPeXp4Y3M4SjJ4VW44Z3MrQ3VGei85UkVsQm9w?=
 =?utf-8?B?dVV1UEtJcFM0b0U4ZEF6Sm8wakRrUDEvbjJZRnRSYWk5TUZSbGtDZUN6QTlZ?=
 =?utf-8?B?RUxUeUJRYjhWUFVDY2xrc25hY05Id3ZtblpnV00xQUZLeE5EODdJMjJSS2VY?=
 =?utf-8?B?b2lWNEpGY0dLYjdZNXJFZC9DR0Y1WCtsSUlZSmJWeVZHeXZPcS9vaER1cWYz?=
 =?utf-8?B?dVRqU1FiZERDbUpTVFNhaG1uN1dOUml2ZDhuU2dNZlczelF1Z2dLdnNoMktl?=
 =?utf-8?B?dmdQd0xDNVg2czd1ckk3WXFMdTNITFZHWVZlNTY4M1lQOExpLzhFWGZHVis4?=
 =?utf-8?B?cWdicm93bmJVYVFpSGhZMHIweDBzdjlOK1M1V2tXOC9yR0w1elJTTm03MFdJ?=
 =?utf-8?B?THQ1SGFhckdneXFvM05DYVBWclhsQjd1a3VtQVM0R1BrczhPYXpwSWd3eWo5?=
 =?utf-8?B?RTV0RDJDckhtSzUrWDZydEc2UXVoOTJuUnU1RFFCMXprSEc4SmZlZVBnOW4v?=
 =?utf-8?B?aSsveDdRbTRDMVpyaldRT3BGWXFtcUNVSHIrcTZuYlE4Z0o5czFXaGhlVHRl?=
 =?utf-8?B?dEFybE5WaTRRZEdCU1V4OWw0RnRneXNRU2xRUENxRFdsc01JaEtLUzJMQkEy?=
 =?utf-8?B?d2Fza0JabWRZc1k1cmY1WlJxcDFibEYzY3h5NW5WblMyeU5TM1ZMYWRhUDNH?=
 =?utf-8?B?SWNuZGFTMTlUQlBBYVIxZU9zczRDM3IyWVl2UnAvZEVRUVoyYWlRTXlmQlE0?=
 =?utf-8?B?OXRwVFN1SDZDMWI4aEJxSVhnaXh5SVp5MnFnWjVPY0FuU0tjNHVzeklDYks4?=
 =?utf-8?B?a29QSHNWYzl3QjNSNGFmVlVtSU1uSVE4RTlJRzgvNzNGeEtCZVdBNEg2Z0F3?=
 =?utf-8?B?cDBJNWhLS1ptWDFWMDhydklLMndERHVDaFJFN0JzdnI1NXhGM2RsMGZVenJZ?=
 =?utf-8?B?ZWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16dbe077-f675-45b6-a870-08dabbab64be
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 01:50:03.2551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q/UO6nwRsnIBgSDBesiRCuE5OIhZ2cp+19ZH/yAJQf3DVjQciIhelL3HDum8E8jTer1dBPj00/P8UIhHSqCaHIfZOxfTGtnJFzOtKnTsaEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6676
X-Proofpoint-ORIG-GUID: vvAY7mwKYc7fowadjMbyWD8rGg8YeVwF
X-Proofpoint-GUID: RvEYqJB-YklWRBOUPZST3PgkDPTMWkKW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-31_22,2022-10-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211010012
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2A11k5ZC017560
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 01:50:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172350


On 10/31/22 23:40, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Mon, Oct 31, 2022 at 12:51 AM Xiangyu Chen
> <xiangyu.chen@windriver.com> wrote:
>> With the default jitter options aarch64 CPU-based devices typically ex=
perience continuous
>> high CPU utilisation for several minutes after rngd starts.
>>
>> Accoring to the rng-tools issue #150[1] and comments[2],in order to ad=
dress this,
>> the following configuration changes have been made, those configuratio=
ns
>> also can be found on Alpine Linux[3]:
>>
>> - reduce the number of threads used to 1 in total, rather than 1 per c=
ore.
>> - reduce the buffer size from 16535 to 4133 which reduces the time tak=
en
>>    to fill the buffer (and so reduces the duration of CPU load).
>>
>> [1] https://github.com/nhorman/rng-tools/issues/150
>> [2] https://github.com/nhorman/rng-tools/issues/150#issuecomment-95307=
9212
>> [3] https://git.alpinelinux.org/aports/tree/main/rng-tools/rngd.confd-=
arm
>>
>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>> ---
>>   .../rng-tools/rng-tools/default.aarch64               | 11 +++++++++=
++
>>   meta/recipes-support/rng-tools/rng-tools_6.15.bb      |  5 +++++
>>   2 files changed, 16 insertions(+)
>>   create mode 100644 meta/recipes-support/rng-tools/rng-tools/default.=
aarch64
>>
>> diff --git a/meta/recipes-support/rng-tools/rng-tools/default.aarch64 =
b/meta/recipes-support/rng-tools/rng-tools/default.aarch64
>> new file mode 100644
>> index 0000000000..5a2fbcc9ef
>> --- /dev/null
>> +++ b/meta/recipes-support/rng-tools/rng-tools/default.aarch64
>> @@ -0,0 +1,11 @@
>> +# With the default jitter options Arm CPU-based devices typically exp=
erience
>> +# continuous high CPU utilisation for several minutes after rngd star=
ts.
>> +# See https://gitlab.alpinelinux.org/alpine/aports/-/issues/13035 and
>> +# https://github.com/nhorman/rng-tools/issues/150
>> +# In order to address this the following configuration changes have b=
een made:
>> +#
>> +#   - reduce the number of threads used to 1 in total, rather than 1 =
per core.
>> +#   - reduce the buffer size from 16535 to 4133 which reduces the tim=
e taken
>> +#     to fill the buffer (and so reduces the duration of CPU load).
>> +#
>> +EXTRA_ARGS=3D"-r /dev/hwrng -O jitter:buffer_size:4133 -O jitter:refi=
ll_thresh:4133 -O jitter:thread_count:1"
>> diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb b/meta/r=
ecipes-support/rng-tools/rng-tools_6.15.bb
>> index 0696351903..e1f6b2ad77 100644
>> --- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
>> +++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
>> @@ -12,6 +12,7 @@ SRC_URI =3D "git://github.com/nhorman/rng-tools.git;=
branch=3Dmaster;protocol=3Dhttps \
>>              file://init \
>>              file://default \
>>              file://rngd.service \
>> +           file://default.aarch64 \
>>              "
>>   SRCREV =3D "381f69828b782afda574f259c1b7549f48f9bb77"
>>
>> @@ -59,3 +60,7 @@ do_install:append() {
>>               ${D}${systemd_system_unitdir}/rngd.service
>>       fi
>>   }
>> +
>> +do_install:append:aarch64() {
>> +    install -Dm 0644 ${WORKDIR}/default.aarch64 ${D}${sysconfdir}/def=
ault/rng-tools
>> +}
> Perhaps drop the aarch64 specific default file inside a folder called
> aarch64 under meta/recipes-support/rng-tools/rng-tools
> and we don't need any changes in recipe.

Thanks,=C2=A0 already sent the v2 patch.

https://lists.openembedded.org/g/openembedded-core/message/172349

>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#172290): https://lists.openembedded.org/g/openembe=
dded-core/message/172290
>> Mute This Topic: https://lists.openembedded.org/mt/94680433/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

