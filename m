Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3F9C3A59D
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:48 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.74])
 by mx.groups.io with SMTP id smtpd.web12.8624.1649175523986903133
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 09:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seco.com header.s=selector1 header.b=ZA2td/JZ;
 spf=pass (domain: seco.com, ip: 40.107.1.74,
 mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKANeOPXV53hrp062Md99SE2tv8o7P39eUp8KUEpPBCs0wNOfN36sm/bWvEsg+Q3r6Ob4PwH68Mi9SBI17ISnIALMeCk7XcNJeknRzELHTrx5ZtopPXEEMfQ/wyrn4RTyDeD81WXsxGSq+7ACg49hGgqIHSqsfI7bQJoElv3yDAkGxGv1Q/40xQRCzB/YMBhj6sjg3kS4g0cKfLcICN1P/xmJVh6K1Uw8lCYaY7q9VRoQvHIp6jT/ftXPCb/nwHLDLlrrX55olxzTFIqOKhib4brzvuyZKZP+lxeNhMpA3fOzW4Abxw71w1QUy6UIXFGBBgP+uJ7kHGiusI+c0jpHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeleMC0aeQB3LUCw4ejVQEOEDwSH4F9KuTaudXCHuVQ=;
 b=IBq7N8oyhonZX000rEiKnMn0LKS0ImNrfVLtRR0SVxk4Qs7CygiFk9TgIoI7WOsh2pPDwnXrdkU5P8BaKYGixXIMprpo6c8YGSLByYlIXI8rGDJEp0MXj6j3ysa3YcaOm19br+AAgmQLs8j2dX8NMlzlRo9Vh6MQkEnMWQPFuDlTw81xNkiqGjyj8jvQIoBEuvLGIuieykvPXtZuGQwRsQcrppyL8lafroW/1Ouz9hE86uHO7A68HBDKCl5H8vW0RTG5H2tCzZxkLIuOVlNkYCXX2ifkhBxYx02X7C4BQ9O/mvPAwAHwBr8KyD/vPlM2aDKyL/IlYzIxqbpa/6KFrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeleMC0aeQB3LUCw4ejVQEOEDwSH4F9KuTaudXCHuVQ=;
 b=ZA2td/JZehAxUGKVsfWsHFmXXz6ZHK9kQtI5J6usNfrr08FEBRNbjsQkBGGhu+yIsZLTltJlaCXxtzSdgZU8tr+txYmyhOqwnIgYjbX4DikF5s/5UDV+tnaJYLtMyPujqa7of7nKoHQ/X3I43LUkKnTOpFxulMBY1owQkhIRCn49PFYQHc5tpDLximcras2BHrV7sxcdkxIgraHpUeQwRLpyTxQ41CXiywQTJKU66ZRfwhoLV+FNn1WJHZcQ0MxnwDRD+igs1pYiYabshhEnTxcIKZhRrejtaOL8HcmivSJ4Atnufz+e8jcYGUg78Ni0aepW6t4FaQc1FQHiJPZrpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com (2603:10a6:803:c5::12)
 by AS8PR03MB7191.eurprd03.prod.outlook.com (2603:10a6:20b:2ee::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Tue, 5 Apr
 2022 16:18:40 +0000
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::2ca2:213d:e44b:cf71]) by VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::2ca2:213d:e44b:cf71%7]) with mapi id 15.20.5123.030; Tue, 5 Apr 2022
 16:18:40 +0000
Subject: Re: [OE-core] [PATCH] libpcap: Disable DPDK explicitly
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20220210204919.3029824-1-sean.anderson@seco.com>
 <6d9e43d436cf62b31cc0848b1d325fdecef6bb9d.camel@intel.com>
From: Sean Anderson <sean.anderson@seco.com>
Message-ID: <7ea02683-8588-460b-6b0c-de6935daf368@seco.com>
Date: Tue, 5 Apr 2022 12:18:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <6d9e43d436cf62b31cc0848b1d325fdecef6bb9d.camel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0320.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::25) To VI1PR03MB4973.eurprd03.prod.outlook.com
 (2603:10a6:803:c5::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39be29bb-1bb7-49a5-b747-08da171ff264
X-MS-TrafficTypeDiagnostic: AS8PR03MB7191:EE_
X-Microsoft-Antispam-PRVS: 
	<AS8PR03MB719131133B4327F598B35C0696E49@AS8PR03MB7191.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XIZZ7pLCZebJquXOAnpq21h1OWk6DIJnRNXxAqQC5l2jO51j3Mff11cjh0z8vySYvT32I49gX+buLwYxA/JfPwsWYNdVuhrsnDWm0EVHxhc7D+XgbJqmUfP20qCJKRE0Fd9gtA261pUxtpMgCWip1D2Zfp71Cw6lL1JVEDvpCT0Tx8xv38nTXZj6OKp6V/3CCjaiDfewxBq3LfB9njikWTeqEBQgUimwk6B629Ja4XJcNvXCMhj6dTh+lryWfOSOUIVr7chFmYKfvRCPROlyVJueFYueOQe15nY7klp5AFZupypZikHzcVyuujoh5oKtHT6PpAji2is47e2w7bsI8Eb7V3DnMf6SIu7bwMaeyxVxd4bkce3wvQuxQ1J2519RcFoZ13J2l5NqlEj2FXuAa9inkGFQeFmaifdq3Y5FY0SBhwtsbqTp8COPj5flqQ6fiZRAHUlx6Gzbi372Ls7pWft2SjE6K2+Esh9J2qJFchuN5ddiiMreTNe5Od9n5ixx5QzRdHwtMGqM4PnfidxV4i0K75P10TfpTtIRu9jFZGf0LdsyxNlXBssjv0k3MZjSxUt334wViBRxaEdBMGnruhYESaGz1+TpbOZQKAjxKKnUOqoflV2Y0GpSi3JjdzhT+J3yjwhtDgPtYukGUrXZU1QnN9TTyvgFBwKP7GcRi7Fo1M9DvUluKi9kSjroEHaG8PqVGwa4pVBOsnwZklVHIl8uLzr9Qy7Au8PHGZWEOaJq6CzMFO2IaQDtFT7c527HJX+V6Jv4XNzRhNJC/oNRwvX+eNSq8wSR4on+v10rDd3XWqM9NUCVm3hOBvIjZKh5ifv3uFPdcNlaqdLSvkujtT6TvttDOAht9hhtHYWFtS4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4973.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38350700002)(110136005)(38100700002)(52116002)(8936002)(66946007)(2616005)(8676002)(316002)(6506007)(5660300002)(186003)(2906002)(53546011)(6666004)(66556008)(26005)(66476007)(44832011)(6486002)(6512007)(31686004)(86362001)(31696002)(36756003)(83380400001)(508600001)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dWFYdHcrZjJpbDYyRlhNcnV6akFyczQ4K2c0a0hZWngwRU5vd1dUbXF3bmpo?=
 =?utf-8?B?YlpVK2pub2hyejdUK0NPTEdtdHRqVHFxYUJHYVAwSGNPTmdJbFo4cGh4WEhH?=
 =?utf-8?B?WVJtMWhyb1VxaFJqZnc0MzB4d3pxR3FIbFNFcU50MDNtRWhmSW1tdlNsLy9q?=
 =?utf-8?B?ZW51RkV1VThzbHpCNmNmSG1jR1VEejVRUVhweFRPaXRKVU03eVZIOWxwelpB?=
 =?utf-8?B?cUhwQlV6cExxSXZEY2xRWitVMThOalBIZ1VXRHRnT2d0MDUxRCtyMlhoZEdk?=
 =?utf-8?B?R2lUUTFCcTJ3T2lhQ3JBazVVV0w3ZWZhY1FUQUJrN1FMQzh3RGM4cmE1Zy9W?=
 =?utf-8?B?UkxEZ3RyNTc0U3Z5Z2N6aW4yZ1pFMEtXRzZsdkp1eVIySVZTa0pQTEliRFhQ?=
 =?utf-8?B?OTJWN2k1Y3pKeFRjdWJpMURxb3BzRUdkV3VJODAzMTM3OHJtZTRyalNjVENh?=
 =?utf-8?B?ZHdLMFZDVCtIejJrZlYzdWgvaTkxWmRCZHRFdWhxenp5c0kzd0Y4WFVFOWJX?=
 =?utf-8?B?eUY1Tk5HRTZrN0xpcjQyMWt1R3NIcE1vZjd6dUhNKzVreG1iZElNUnllTWdk?=
 =?utf-8?B?bThzK3FUb1U2eWNJVHJNREFxazFKY1JFS3FKcEhHRWJabzJVV09WYmlETTZT?=
 =?utf-8?B?dVFUSkp3a3ViS25sSnhkWHJPWnoyLzdpaXNnNUpMQTZmelZBZVI2Q3B4a3Jv?=
 =?utf-8?B?UC9HZ3gwekFHM0ZHZ2pwQTYzZU5JNW11T1BMNW9SU3JqOWhqNEpPMzhyUnIr?=
 =?utf-8?B?MWEyaGpteWQrL1VwQ3NZL1RPRmtHRXlpNkw3V2RjUm12cnNabm1zT2hQU0RS?=
 =?utf-8?B?bjM2TmN2dmFMcXV3aXlTclQ1MmdLS2h1d24wZXRRaHJKYzdMSHk5MXJQdmFS?=
 =?utf-8?B?WkFVZGVjK1NOU0RXeFFxaWhLZmx5TmRnQ3MwNHZLSU8zZmFYejRHYzFXc2l0?=
 =?utf-8?B?U28zQTU3ZzBQMFUvU05mbkUzdHgxSXMrNjhsemhuSEIzbzNyU1N5T1FmWnA3?=
 =?utf-8?B?Z1JZTUFjNGJ1eGJTb0tYMnNac3lqQTV4UUtZcExVNXM1TjhQSFRjNXNqaHZ5?=
 =?utf-8?B?MTBRaUZwZ0tTT0l2c2pWc3BWNU1FQW5LM3BTK2xxL2srQmRVSFhDTGFNd0J3?=
 =?utf-8?B?bXl6YVRLRm9sUjZGRk1DMmhwdlZSRERORjlwT2lWazVkWU81NUdIQUdEOG1o?=
 =?utf-8?B?MWlmWVBuUEhVL3FXbEdZaDZzNDZ5SGRnQS9pQkM5ZkNpUlZUUXFOS1g2Z3VF?=
 =?utf-8?B?NFFRa0liQmtYdzZURFhuMUgrWUZGL1J5NHJkVWw0dGpTOHVxWFZmTFk3MEU1?=
 =?utf-8?B?cGxhekNxcTlEcUEyaVdzK3pLVkd6bC9MWlB2cHFiN0NrRWdEby9tU21KQmVY?=
 =?utf-8?B?T2FKcE9Bc1hYUkRiSVU5MitUcjZxWC92YjFPMVRJeVV0cVYxeVJad3RxWndz?=
 =?utf-8?B?WDZYRTd3TloxSjN4TnZjaFVKN3lwS0IvSWFGTmVNdUNmYnRKS3ZIUnc0NTMr?=
 =?utf-8?B?c1g1V0xRUndYQ3Q1Z3JIZjl0RmhSa1lqYkJpV1gwN3lpMjJzYVlMMVFndlhQ?=
 =?utf-8?B?dG91c0RTRU9VQTRxNWFmQWQzU0hLbGo5SWM1ajFaS0M5UEZvVVBuVStocDlH?=
 =?utf-8?B?cDhpZmhGM2NvQzZhckduVUNTWWdQWXAzTXpUdTFLM29VQVlNT0lTTjRDaWFj?=
 =?utf-8?B?cUZsYTd5TjB1Wlo1aWdFdkd4SHJFVmE1UmxmdG5YcmNJNU1iY21QTDJiZ2hn?=
 =?utf-8?B?Vk56S1ZpWVhXQXE0OENWcjJVMlYvNjNydDRZQW9VOXZHNk94QkNGQ2t4bjhT?=
 =?utf-8?B?TEkvbGxQMkRibUpIdUJwWmRETWlqanNxNjE5d2JZc0Q1R29BbU9wYnNIN0VF?=
 =?utf-8?B?eUQzc3NWMU0vVFpLN2RCM2tjcEpSendodndGU0R1UW9pU0I4WFFzZCthZVdQ?=
 =?utf-8?B?NG5KMXZlenR1SVdQZVN1cVd0UmhSS1ZGckY0aVI3K0g3K1RJUEEzN1BiOFN0?=
 =?utf-8?B?eHgxQXQvQTlmWjdST0tFbGlCNnVWckdDdWlyZXpqR1YzVEtYczlkUnJkbkgz?=
 =?utf-8?B?cEFrbHNQVGl2d0xEbXBPcmVGdkNEUWhZenp6a1dNUlVUQjBoWDFhQzNyeElj?=
 =?utf-8?B?WVlIMTNQMFFoVUtjdXV3ek8rVWNrTjkzTW5NZWZwZDdlMkJIWW5jaU55WFc5?=
 =?utf-8?B?YmhndWJHdjV2cWlpc2V6SjR2Q0s0UXU2MEpOOHhnS1RyVUdIcEsxS0ZzbjJC?=
 =?utf-8?B?UmpqMS9DNTFsc1Q4cjU3dzZINERDQXhQTXRyUEs5NTZPYVR3QllJQTA2d0dr?=
 =?utf-8?B?REtjUUMxd3B4WlBYanliVGt6T2lZZEhqUDJ2NlBWVW40dTN1b1NseTF5c1RX?=
 =?utf-8?Q?vqdQFbp+73Wndi3g=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 39be29bb-1bb7-49a5-b747-08da171ff264
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4973.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 16:18:40.5395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aFf/Lp7NFtzbM9/3IkGSdGZ+Nj6VHpXbQTvtyGWmF3s3C4GLu87zXs5HqPRqACF2WHddaVnPly1crJvEPzCY5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164047



On 4/5/22 11:02 AM, Mittal, Anuj wrote:
> On Thu, 2022-02-10 at 15:49 -0500, Sean Anderson via
> lists.openembedded.org wrote:
>> libpcap looks for DPDK in the same way it looks for DAG. This can
>> poison
>> the build even if it doesn't find anything. Explicitly disable dpdk.
>>
>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>> ---
>>
>>  meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
>> b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
>> index 9a8c46e0ef..dbe2fd8157 100644
>> --- a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
>> +++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
>> @@ -19,10 +19,11 @@ BINCONFIG = "${bindir}/pcap-config"
>>
>>  # Explicitly disable dag support. We don't have recipe for it and if
>> enabled here,
>>  # configure script poisons the include dirs with /usr/local/include
>> even when the
>> -# support hasn't been detected.
>> +# support hasn't been detected. Do the same thing for DPDK.
>>  EXTRA_OECONF = " \
>>                   --with-pcap=linux \
>>                   --without-dag \
>> +                 --without-dpdk \
>>                   "

Huh, well it looks like this was already applied 

https://git.openembedded.org/openembedded-core/commit/?id=be5442f065da40b41d3cd60793341e22654f2681


