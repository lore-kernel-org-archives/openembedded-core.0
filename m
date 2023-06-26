Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 093EEEB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 06:00:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1847.1687759244610536093
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 23:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ReSuJo8x;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55413d2f40=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35Q5hamv029084
	for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 23:00:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=tKoMXVuWAHxuVL0xO/pSQvcrYa35WMv2N5OmddKNdfI=; b=
	ReSuJo8xvL74heirWKDjWnSm/cOzfFNIKrCb05DAQknNmJ/uBvIiCFTYeNveAsgC
	7qCUb0RAZROMi+XCOdRbXqXfnRWqG+ZHmHUsB3HetZyIh3tK9Q1me9/zyWZwQNDc
	JEWeFIjXoZEAic5qtILxhjSEVlMxkLzJlcDozGUVo3W0qb343Sx2kWP/JhHEhCac
	6sNuSjCrpp/W3IzVgj0pTfKaCQ2kJTOO4xaBPftvJZrQo+KoU+CtHSKt1z77V0W2
	hCcCYqZIf9/VkQz71JNW7MuY5Z5G+/aGK90ZOJ1UUOTzGkAvw5effS7VG6PB2DrG
	B3IPKYy/vVV3n/eUrR4IKQ==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3regfb0mwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 23:00:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJtICE2vp8dREGl3stmJTZ7thvhXAtx6o/ebYkw8R+RLSkXG+qVoM2GHq3ZOlYfvWlS/UXRops22CnfNdzO/yqysynX7/u36Ul77dQsBdRoT/KqcpQECzp37RAukCi2zOM5V+Riq0Uzn+Jnaqy2k3MaqZ4OrEbk9vKckWjlDnAsNStBbukI5H3pckjBiwQ3kdvXOIolRfjyhtmcXwjtWj0Od1WS6pk0jcutVBhlGMM/es5i+0FIoWUQ+srlbVtTYIEr7cEhSO8GzqH9/wdfhKH5458B/6S9iQ6GuYFZNIts/kzF7vnItuI+St4ypbjAt+fbHKye+AxPnKXpXvMcPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKoMXVuWAHxuVL0xO/pSQvcrYa35WMv2N5OmddKNdfI=;
 b=JiAIjGArPssB6Hik3gkIT21zyt2Vbs37UvFX7SqBld66wrfY8gUqVDDfrzZovj50/4p7xPOMWpIUe8p245XtL4GLvCABV0h72Jn95/dKTRbf7RN4zSlgDckT4jjOMg9kOCEANZURgzshay3lvmTKBcymzc7KoM2oWuTTGUFRN/Ptm/4vYe9X95Zq7sLXLWzN/YRmn1bAFNDfeXprbJUWR8jumGWC5xhELF8d9cjrQXbS09c1O5otyIMI5iJ3IJtohbR3wofoskOhHg+R1Qp2KX+Xnt9iR+HchPukZjziV2qk3UimWGBNIUuAfHstAuvlXQdQRXbEosKZ7xDbHVWTbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by PH8PR11MB6975.namprd11.prod.outlook.com (2603:10b6:510:224::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 06:00:39 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::5896:32db:f6ae:c431]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::5896:32db:f6ae:c431%7]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 06:00:38 +0000
Message-ID: <0481d3a5-94b3-0fa2-17d8-02412462967b@windriver.com>
Date: Mon, 26 Jun 2023 14:00:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] qemu: Install the default qemu emulation rpm
Content-Language: en-US
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <1768C72652DD9852.10197@lists.openembedded.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <1768C72652DD9852.10197@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0302.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::14) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|PH8PR11MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: 786fe99e-e438-471f-d616-08db760aaa73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qSQd/NnphXGCJNJhOce9MytcsgeGom28mMqncOyh902pBmT3GE/HLKDyGrYLr72G+hnoiYX32tawXj+c6IwanbLdX4F+fuzV+se10EJ3HqXBzNEhX76ffYUQIVj+qzB+cu1ob1/XY+rdKAMgGDvFluLK66RAOqJQxRaWRheKo0CJgm3ZdF7Wglmtce6QJmBcczZxKm93W+/yjlNtAety124WI2S5AEXgyu8RxdJJaFNv/rM6n8+JPccI+7oerGbhDm8MCS8OD5AnSjX05VkSO4COVXy7f4O1yt+HSphpqjeoSgVC86GEL9nlhfyxaxnegk+Iy7gPQEc031wo9TxSie5b/5WK2Me9OIDXXPTT2dWaBiaL6t144cNbCZWIY01F9gcYLjDmn+xQ6t65RnSagx8d3hP4XuhwHBMSmL8R6ptvL9YZflHWG9X6+6oGLPdMpW6aiych7ddEFC9biDdnBm8UFxEjXfTSmHh6AD8omctnyDPeYUSv6AqFuQaOLVArndm/xxVnit58T5kMggAFEPteygevTZOzWo2PxsbBDZWj52KxwtIU/IPDVp9w1j7Kvb3sD+9dw8xLSjK9C0XYGh980iI1gbWPXb1eJswCpY32j8zJfBugQHWwQpxYStojUOPJYZZ5AIJ2vCN1E4l7QjIPetB1VNy/lCugTmc0DZQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39840400004)(346002)(376002)(136003)(451199021)(2906002)(186003)(26005)(38100700002)(2616005)(53546011)(6512007)(6506007)(5660300002)(41300700001)(66556008)(83380400001)(66946007)(66476007)(8936002)(8676002)(36756003)(31696002)(6666004)(966005)(6486002)(86362001)(478600001)(316002)(31686004)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UHZSdXdxZldaMnc0NDEvRW95cEdReFVSaWlmcjBiWmdRcXdkTnRubVJ4N1ZK?=
 =?utf-8?B?N0tSQlZzSVpDVnhReTBpZFBnNWhTT2cxSnVKTGNoM3l6SkI0b2UySFRQaXJr?=
 =?utf-8?B?RzFES0RXSVJxZDc0Rno0N2pzMGU4Wjl3a1JOVmhyQk1oUCtPL2c1c2FNcGs3?=
 =?utf-8?B?ZEltUk8zdUFaVEcvRkxUZjIrUERNOTdwZ0pQZGI3MmF5LzFQWE43djhQMGVs?=
 =?utf-8?B?NW40a3ZQR252WlMvWUIzWmZMemNSMmVWenJEK3pFb1lDOEJWS05rcTRWUkFQ?=
 =?utf-8?B?bTlDaGdXQ0JlWE9IUjg4WU5kZ0lmZ2RUUzFDRUIwcnZ6dGdJT3NZdnNIRm5z?=
 =?utf-8?B?ZHJlTXRUUkw1Q3VuSjFhYm5CaTNDUms1b3AzWGRZWTBwV1h4RzF1NHpLWmRh?=
 =?utf-8?B?dnhRNXR2SHo3MTMyNFdWVm9vbE04djZGQ3Vsa1I0bTJ5WmFiOWVwdmRjSGZB?=
 =?utf-8?B?Vno1OXJZSDR6NlVmb3dWcVZ1QWpUR3ZiMzBieG5qT2kvU0pGV1pjTk9HVHZu?=
 =?utf-8?B?OWNZMEJjZTA3eUFVVlNHcXNHYXBaMkM2bktuU2N3Wi9KNGVVK0Q1cjNBYnlW?=
 =?utf-8?B?NytHWktEcnN2MVlPZmt4eTJnTVdoSWhaN0o2ZVduSG9VcEN2KzRURmo5Y1ox?=
 =?utf-8?B?YUNaY05EemFtZFMzOWdsRGpWMHhwZnJNRE5QQUdZeURUNHo0dHJUYzk2Qko0?=
 =?utf-8?B?bnNOVnd2MHJxN2RuZFFIWlhWUnprQlhOUW42VG9kYStpOFppMkF6RDkrS1FG?=
 =?utf-8?B?dzUvTzY4TGtlMjdmbFBuRnNnK0VaSElreFo2TzZjalBqZHJHSHk3Q0xqWVhD?=
 =?utf-8?B?RHRROG9PYjlQeWpxSVZhd2YwZTBHbW1DbnFZcW54RCtrY0psaEc4QWtqdXBy?=
 =?utf-8?B?NGpzVXE1TTNqM3I3NHI0NkNmYTgwUURPQWR2LzA4ZUx0bVgzdFpwNkRlOU9P?=
 =?utf-8?B?b1NZSUhQTGlNS1RrTXBzdjhpYitEL1dTM1g2Z3k5UjRJOXh2eW01b09XNUJX?=
 =?utf-8?B?Y2VVd1lVNHo0Q0padXJVZEMyREZoK3hVZ00yam9RZXMvbDI3V3NzM0tyZ1lm?=
 =?utf-8?B?eHF3S2tMSTQ0cGFmK3VqaGYvaGkxSWNWaUVReG5VNG5JQjN3NmVQRzRZeitj?=
 =?utf-8?B?V3U2eC9ua09QRkgxWWhnUDIvMW9SQ3E4SGxjU2hXOExJaWFCeEJKb2NXUTVU?=
 =?utf-8?B?Y1llZWFzbjN0WXdGdkUxS2xNYWxjaUxEOW9QUzBiWllJaGMxb2pOTC8rUi9O?=
 =?utf-8?B?elBLWmZPMVA1QnhwQzBtSEpmc29YdHRWV2c1S0JEUmxXdksxQ3FhMU5TczZp?=
 =?utf-8?B?amJzcjRXdUxLbWZJMUxXVmlmbDlHclNyZlhvWWFmWmtBTzJDRGxrRENNSkJv?=
 =?utf-8?B?ZE5YQWhtTi9oQTZuSkgrZC9KNFp4ck54dlY0QXV6dkpsRUUxcWR2aTlJcmZO?=
 =?utf-8?B?YmRNb25Kb1E0d0NSUmZNMXgrQkxmWjNlWXVBWnpRK2lRT3FOalI1eW53RWhh?=
 =?utf-8?B?SzFDaEMvbllOOS83RlJiUjBxUjJnSGt2OWFVOXl3ZzgxbEU4aGdjdDBEOFBW?=
 =?utf-8?B?OW5Ockx6VGdweGxPdnorZFZmVUF3dW5IeGxMTmNINlczeG9VR3E3Q24zVWk4?=
 =?utf-8?B?ZURRQXJIZmJsN2ZPTjk4MmIyK09wU2U1bGpaL0JUSmduYTJmSUVJUU5XTThn?=
 =?utf-8?B?bUozdFVwSERwZzhDNU5zbk11dVp5SENwVWVqS1dQZjltZVpvMjZYQnNGNTNR?=
 =?utf-8?B?V2dwdkNZdk1PZVA3Zzk2Sml5WWdxRzFxVndOODR6WW8yTXpjaEhoM2RxYkZS?=
 =?utf-8?B?Rk4rNzdON2FzZ1BGSG5icG9SZkJ0YjAxaWpNbi9hVGhVeUFtc2ZxQ3VCdFhu?=
 =?utf-8?B?cktSMGt6N0psOVlFOUE4VlF2UFpBUDZCQmVVRGF2MWZNNlIvbi9Cc3B5bTVX?=
 =?utf-8?B?T2QwRXViNXZLRFdHVnNPcDdPbWZaTnlMeStrZ2puQWdKNytaTXBIVkZxcHIv?=
 =?utf-8?B?U0NCMlBnMjNodXNZMmtxY0tzNHVVMkJRdXg5N3dTQXBDTGgyUHFxKzNFcG1z?=
 =?utf-8?B?bjM4ZnBhL21PYjlvS3BLbHRJd3pHQ2UzSFVId3NQdzQ4dVAwSmNacVdveVdk?=
 =?utf-8?Q?c/culhmJGJWISb5hS2eHveMf2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 786fe99e-e438-471f-d616-08db760aaa73
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 06:00:38.7805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0sLuZWaPYzSzgGYrIbUf7kWLWjaMYPSZpoJ9sRq9/8bqBvjuyWhMPdLEGKfzssQ0cSItzxgt51Ji63itqiiCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6975
X-Proofpoint-GUID: OqMq5waZq28HYqygxwNmqAIa8NR2ARX6
X-Proofpoint-ORIG-GUID: OqMq5waZq28HYqygxwNmqAIa8NR2ARX6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_03,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=885 spamscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306260054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 06:00:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183404

Ping.

Thanks,

On 6/15/23 16:17, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> The qemu rpm can be split or not via customize PACKAGESPLITFUNCS and
> there is no specific qemu emulation rpm installed when we choose split
> the qemu rpms now.
> 
> To gurantee the basic usage, install the qemu emulation rpm which
> corresponding to the target arch by default when split the qemu rpm.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   meta/recipes-devtools/qemu/qemu.inc | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 7d39f0a25d..c9df43a5a2 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -248,6 +248,9 @@ python split_qemu_packages () {
>       mipspackage = d.getVar('PN') + "-user-mips"
>       if mipspackage in ' '.join(userpackages):
>           d.appendVar('RDEPENDS:' + mipspackage, ' ' + d.getVar("MLPREFIX") + 'bash')
> +
> +    targetarch = "${@'i386' if d.getVar('TARGET_ARCH') in ['x86', 'i486', 'i586', 'i686'] else d.getVar('TARGET_ARCH').replace('_', '-')}"
> +    d.appendVar('RRECOMMENDS:' + d.getVar('PN'), ' ' + d.getVar('PN') + '-user-' + targetarch + ' ' + d.getVar('PN') + '-system-' + targetarch)
>   }
>   
>   # Put the guest agent in a separate package
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182837): https://lists.openembedded.org/g/openembedded-core/message/182837
> Mute This Topic: https://lists.openembedded.org/mt/99544571/3618448
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mingli.yu@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

