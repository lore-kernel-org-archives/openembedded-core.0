Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B8AC43334
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 03:32:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.23972.1658719964389181835
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 20:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=WzodLt9b;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=4205c318a4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26P3Vd7d023815
	for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 20:32:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=QCeUPXS5sKQ1/8vBFXvFkkUeHcjLU6FLxvA8V5h6wfs=;
 b=WzodLt9b35ZWjCh0vjlH0maW1pEiPEKJ3BW0aBlfCI5ZyvgXvZy/UjEYESoTGh5AbkjI
 5E7oFTxWZp8dvL4S+Be28yakV0O2pJ2iRxhrv4QiZESBIHsExCREtbjp10jJbvGhlcUA
 4aLRj5jYB/ralFCCEEbdnu86gj6ZUO1Ezu09EENxN1e7SHLF0q/OxzVHgjZ7lwvLJeri
 CnPrcbhnsQsfgDgcIaB3y6KJCWHEEO0CJwMycoCRNXmtgCXpRw5K1Xr7oMWv7SQJcw5Z
 9GmumByeKKsmuKy1Hi7g3vIIcqf8Oh7YAVLPQ5NulxdkFb8Qt1eCH1JbVl2Y6j6RxbVg 5Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hgggk8yxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 20:32:43 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26P3Whk4026522
	for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 20:32:43 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2045.outbound.protection.outlook.com [104.47.51.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hgggk8yxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 Jul 2022 20:32:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZtGqoHfbG0N8DIL26V2jSDfbghNEGVGZWGKwTi8WLQWi5XY0rBp072YwV2pTj9G2gx9sXbPh3WX+XID0Q5D/MEKRrlx5ltjaM8aXyEP0fW+UncKnljSMu9nJwtiP1lINLL6TeiU/ZLxKq5ll5vtk8eos2zTnF7Byc9qfwsxpHIQuQ695lgFITTCauhT/FJyanvrZ7jhTcmxfjQciTonPBmS1K1J75KZZxOIsDjGmyvjwB5L7H77qUHKvd8w26H1j98Pz0IlJL2f8L3zQtP+L7UEnAavLfYIlDdQpXbABrTPeS1JGgNvLMFpnuITAWvoxsrL3tCep6byqBF4aIVbXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCeUPXS5sKQ1/8vBFXvFkkUeHcjLU6FLxvA8V5h6wfs=;
 b=fkbgG/vY2qSYWbHc+5+Cnm3a57HAyYLys0rYK6DiwEZJe69QFWjePQPMsNnEUkNSa0PEQxkByPjmltb2qwOxaVMOFK+r0er9ockZA9TV66M4bDRoOqFralJkLWfAL5hzDQ9sc9Y0WgZyXyQqVaZvgxcUznpYOMuJ2nBMCP6HxbidSuloBW0jKkKEyi69tAIVBwr5tvm/mtNoWmwqfwaxO/TLlBJdCXf2rHpmBbk79jWCiuISv4pfVajObXuS/pwRc1HvoL1uMdRj6Jzv1t5NdtW0hOE71sLZaZhhPcSMwOqiZHDzi5wDitr1DZd+0MTNNNMQSjfzuVDt+MTZOKbZDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CO6PR11MB5617.namprd11.prod.outlook.com (2603:10b6:5:35c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Mon, 25 Jul
 2022 03:32:39 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::fb:42c3:2c21:391a]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::fb:42c3:2c21:391a%3]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 03:32:39 +0000
Message-ID: <fedbda26-96ef-2918-6291-607e9a617c81@windriver.com>
Date: Mon, 25 Jul 2022 11:32:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core][kirkstone 01/35] curl: Fix multiple CVEs
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>,
        openembedded-core@lists.openembedded.org
References: <cover.1658155579.git.steve@sakoman.com>
 <2749916ff534aecfd2a7871268b1166e5bb5bca4.1658155579.git.steve@sakoman.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: 
 <2749916ff534aecfd2a7871268b1166e5bb5bca4.1658155579.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0142.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::22) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac59ade4-1664-4120-95e4-08da6dee52f5
X-MS-TrafficTypeDiagnostic: CO6PR11MB5617:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9xsEhVzEMhwhUOwCrQguaeBMYzGCF4SYFyATgOu//AiN8aNFSH9bJCkTg11KK3GJ4L671c3a0hXsuo/TJRTNHPNzty0D1sSEEWmA6OpbBrvGZjohHBYs5E32tWsnfa7RWNkfIn1t8zsF/KOcx9k+GISTjlIgQVeMZNN4Dn7n+Obh7X6A50tUBCdxOs8k8zIqXnrM5mpRkVExm20xPCZfmxvQi+IUX3vt31qsqY0fQqxEkAqecegdF625rSAzGn/hW559y0sAYhfJVh1k6tFN/HTsYo47xHxUnXZGJXPndUlyga+/WefKgC+dyAXnh5Rjwly9UyHbavucWoslBkr115cntZV8a228fPoNI1ejFxuv3GvcVzHR15jT0YJxduDUxRKxJjQY0jh/6VFwoHFbe9gI8Fa2nw0ZTI320FDP1Ps/vne6+xFB3DRBrkIaNxPCEIMPqGT6RCNK7rg9UJ+NisfXoqqc9dOOK+C1WrXQlSY7g8KPercSlQmBFFQolEP4ZleG2J74Ge3HK0cqrUb99Pk7AOX6I2kiy8i0za9rgendNEbZXRpCRjBuV/8mOjlIAiz6hperTBMi861wvYi3jZTWsQVefXht60kHNgmrAARMonPVnIIHWLD2ZJ6QWqxSX+gsC78jZBHaEI38HaxAgOMwDAO6Bj8Ld0XkA88IkM2kxnV4UEM6YhfZM3l7i0LdIF6zmuU5NYR3ozgT/89uAPj3X8wSrzzEhOfEWmeHYQGX3mbhgoILwQE+qdV71ZHyCPt15dIG4hHzpGsSwNeyVN3IejY1iOVSpAq8W236qfAoAmd7gPMyhjDjxoqFGt2kJIlD8mvIc3uakuN9RxLtaLCQwuDlyqkZeIB0FNNwme1lt3bpOX1m32XqCH30blPnqNEuwXXJxs4RDB2lZBtALQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(39840400004)(396003)(366004)(136003)(83380400001)(31686004)(8936002)(31696002)(86362001)(36756003)(6512007)(26005)(186003)(38100700002)(6506007)(53546011)(2616005)(6486002)(316002)(41300700001)(6666004)(966005)(478600001)(5660300002)(30864003)(8676002)(66946007)(66476007)(66556008)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eElXVGNZdVJhUGJqVGcycG1MQXJZVE5CakpsYmgrTHZRMjlUeGZ0Q1VjUWNz?=
 =?utf-8?B?c1BNOUsza1Q1ZVVpWG16Uk55SXZXQWUyZDVwbUVCSDdxQUJSZ0hYK2x4akZV?=
 =?utf-8?B?NVV0NEpjWHpTd01XcXZqMTFFZ0luakREODF5M0o4Q3Z4aE5hcTF0dERnTzdO?=
 =?utf-8?B?aVlwZkVCckxDK0lUVjhnUEJTYld5L2ZLWXZ0ang2WTRSV2tWVmZ4bEdOKzhY?=
 =?utf-8?B?d0o1cGUybGRpVWxvaGl6L3d2YThBQmdkb1Q1RFpmVXQrdGlCUVY2ZkNJbkRF?=
 =?utf-8?B?QXB6UG8rc2tONmZxaXkwQ0lPZ2VtTG96K2IxT0RYVmxUY0UraitQNHc2Tngr?=
 =?utf-8?B?Q3lTWGZJTktxZXFPTExVR1lxK1Y4bW5qY0tZK2hadHhoZGY3SlhlTjhDWVly?=
 =?utf-8?B?QzJ2UXo0RitoMFBzV1Jub01YbjlRdkxKaElzNm1pT2ZmY3dNTFBuenpPdEpv?=
 =?utf-8?B?RlF0WktFSlh2VkxiWGpYTWJJK2p3YWExcFdWWHZLVkJra3NIVzlFcEU4RDY3?=
 =?utf-8?B?Mjl6WThrN3N2SDJzTm92OEgraStqRlIrR3JQaXQxY3BvK1BJNnNLKzdnQXVw?=
 =?utf-8?B?TGRBVVlTVUhVNVgvWHBSeVZMcDB2MFVHcEcrcU4vamk3SFU4QUdhdzVjc2tJ?=
 =?utf-8?B?MzdPRENkT0FpVDlvT0dESG1wR01JSDBxdXJuOXFxVTA0UlZBemRwSndxeXQr?=
 =?utf-8?B?dHcxM09yYklkNUN6RWd1NDliUXNUS1hiUnlPNUJ6ZlMxeTlaaTFWekFIRGI4?=
 =?utf-8?B?ZStsVXVDbnBsRndndDdzTlJ3em1KTE5JQndOd01SdCtyS2hVSCt4VVFzQnRs?=
 =?utf-8?B?eHRVQitYcVNpOG4xakRLcDloUTJlREJYMnM3SWsvbE5PWlc1NXFjVm5xVUlF?=
 =?utf-8?B?L1pyUXpvTzVCdlRyN0s4Nk53WjJMQzYwV2lZMWdKbWR4TXdQQ2lLc2szemtw?=
 =?utf-8?B?bFBzQjBjTTcvQnc4OVIvK2xNUTBObkFwSjF5TWNnRUJYT2t0dkE2dWR4aVh5?=
 =?utf-8?B?aU0wOUkrcEozdytwTVRSM3JzQ3JaRytDVVUrVjg1bDBEYlZsUWk4Y282Ymdr?=
 =?utf-8?B?aVByR2RzUDFCenJjYmtEcXNydkhIdkNyenF6S29DTVlGQVMyZGZhbDEzamJC?=
 =?utf-8?B?cnhhWGozSUwzdzJxTGludjZxTnhReFp6dWJMTGpIdkNGM3FKUDFZSjdhVUVL?=
 =?utf-8?B?Y3JNZ01BbDkzdFBjeFpZdzJUclk4N1pJdjZUY0xBNGpURG55UkJmRER0NTE4?=
 =?utf-8?B?QzhaSTd1VEV5L2F4THBlb3V2b25NeTgvZFovYVkwMUFxWll1R2ZtTTNiY2V3?=
 =?utf-8?B?ajV3cWdBd3FWZ3ByT29xdzJwOGY1N25ra01VNURYM1ZiemdDVTYxQ0YwZ2ZO?=
 =?utf-8?B?dXRkb3R1b2I4N0ZFTVBTTFZsNnJkSmpGYjZ0NzdaVEoycjg1L0RXMkg5TjFY?=
 =?utf-8?B?SEd2eG43K0diMGRwQW54aVVzUTNQZlRqK1RmcFN6UlNjMnNtWCtFK3BxTVM2?=
 =?utf-8?B?TGFDajlHeUt2SDhFZjhFZFFQYk14M0NEQnFIRVg0ZFptQkNCSHQ2V3c2STZp?=
 =?utf-8?B?TUpRR1IzOEVTVHhFS0FmYVFZS282eUc4bHhTcnBjR1ZWcWh2Z0c3aTVOSXpG?=
 =?utf-8?B?T3NmZ3BXaHJrU1BOcGdFZlB6TTF0LzVkb0poZ0FFSDVTUmJmU0RHeEpuMVZZ?=
 =?utf-8?B?K3lmVFk5dVM0QnNTK2JEVGY1L2tPNFVYL0NPS01JbHFBSy84V2M1SnExWWhV?=
 =?utf-8?B?cnpHRXBITTY1R09ibStzemF0WHJKaGNYRUdEcDF5TzF5R2xUQzRDU21IL00v?=
 =?utf-8?B?MTdybUVzcDdZRUVtTlJFWmllc3ZYajZMZWZidTVXcVVESmdVQ21SVllKRUNF?=
 =?utf-8?B?aUtPeEJrejdNK0lKYWhjOE5LT0JVSDNFWmQrcFJPb1UvMy80Qmt4UzJ0SkdE?=
 =?utf-8?B?ZmJRTVdVeUlvR2U2TWJqZjFmcXlYR0QzVVBqVm1JVFZOK2huTDZzeWxCdis3?=
 =?utf-8?B?NFdsTmRLQVh3WXdZaVFrclZCNXIzV1UvemR6WDYxZUJKVWczbWkzNmFHWm5m?=
 =?utf-8?B?eFVuR3lyWXU0UFBEMFhGWVB5QVdEb093V052M0MrbSsrYnE3Y2dYRUJGVHZY?=
 =?utf-8?Q?y83EeNECFOSY0+HGkdAI6MJOf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ac59ade4-1664-4120-95e4-08da6dee52f5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 03:32:39.0473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mrq1OHZOTBB09n6Y9X/va79DigGyVojgqV3y6VP6Ef0N96D943ilhQojeJbftDsmQYNU7B084Sg7vUk+ajVlFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5617
X-Proofpoint-ORIG-GUID: SA1XT3eysUmW0XlVOLeNPkr_GrRt5Wk5
X-Proofpoint-GUID: IpAhJgO4U5H1WAmBwrR4BD3yZtU6NtVO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-23_02,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207250014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 03:32:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168467

Ping.

Thanks,

On 7/18/22 22:48, Steve Sakoman wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> From: Robert Joslyn <robert.joslyn@redrectangle.org>
> 
> Backport fixes for:
>   * CVE-2022-32205 - https://curl.se/docs/CVE-2022-32205.html
>   * CVE-2022-32206 - https://curl.se/docs/CVE-2022-32206.html
>   * CVE-2022-32207 - https://curl.se/docs/CVE-2022-32207.html
>   * CVE-2022-32208 - https://curl.se/docs/CVE-2022-32208.html
> 
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   .../curl/curl/CVE-2022-32205.patch            | 174 +++++++++++
>   .../curl/curl/CVE-2022-32206.patch            |  51 ++++
>   .../curl/curl/CVE-2022-32207.patch            | 283 ++++++++++++++++++
>   .../curl/curl/CVE-2022-32208.patch            |  67 +++++
>   meta/recipes-support/curl/curl_7.82.0.bb      |   4 +
>   5 files changed, 579 insertions(+)
>   create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32205.patch
>   create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32206.patch
>   create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32207.patch
>   create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32208.patch
> 
> diff --git a/meta/recipes-support/curl/curl/CVE-2022-32205.patch b/meta/recipes-support/curl/curl/CVE-2022-32205.patch
> new file mode 100644
> index 0000000000..165fd8af47
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2022-32205.patch
> @@ -0,0 +1,174 @@
> +From a91c22a072cbb32e296f1efba3502f1b7775dfaf Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Sun, 26 Jun 2022 11:00:48 +0200
> +Subject: [PATCH] cookie: apply limits
> +
> +- Send no more than 150 cookies per request
> +- Cap the max length used for a cookie: header to 8K
> +- Cap the max number of received Set-Cookie: headers to 50
> +
> +Bug: https://curl.se/docs/CVE-2022-32205.html
> +CVE-2022-32205
> +Reported-by: Harry Sintonen
> +Closes #9048
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/48d7064a49148f0394]
> +Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> +---
> + lib/cookie.c  | 14 ++++++++++++--
> + lib/cookie.h  | 21 +++++++++++++++++++--
> + lib/http.c    | 13 +++++++++++--
> + lib/urldata.h |  1 +
> + 4 files changed, 43 insertions(+), 6 deletions(-)
> +
> +diff --git a/lib/cookie.c b/lib/cookie.c
> +index 1b8c8f9..8a6aa1a 100644
> +--- a/lib/cookie.c
> ++++ b/lib/cookie.c
> +@@ -477,6 +477,10 @@ Curl_cookie_add(struct Curl_easy *data,
> +   (void)data;
> + #endif
> +
> ++  DEBUGASSERT(MAX_SET_COOKIE_AMOUNT <= 255); /* counter is an unsigned char */
> ++  if(data->req.setcookies >= MAX_SET_COOKIE_AMOUNT)
> ++    return NULL;
> ++
> +   /* First, alloc and init a new struct for it */
> +   co = calloc(1, sizeof(struct Cookie));
> +   if(!co)
> +@@ -816,7 +820,7 @@ Curl_cookie_add(struct Curl_easy *data,
> +       freecookie(co);
> +       return NULL;
> +     }
> +-
> ++    data->req.setcookies++;
> +   }
> +   else {
> +     /*
> +@@ -1354,7 +1358,8 @@ static struct Cookie *dup_cookie(struct Cookie *src)
> +  *
> +  * It shall only return cookies that haven't expired.
> +  */
> +-struct Cookie *Curl_cookie_getlist(struct CookieInfo *c,
> ++struct Cookie *Curl_cookie_getlist(struct Curl_easy *data,
> ++                                   struct CookieInfo *c,
> +                                    const char *host, const char *path,
> +                                    bool secure)
> + {
> +@@ -1409,6 +1414,11 @@ struct Cookie *Curl_cookie_getlist(struct CookieInfo *c,
> +             mainco = newco;
> +
> +             matches++;
> ++            if(matches >= MAX_COOKIE_SEND_AMOUNT) {
> ++              infof(data, "Included max number of cookies (%u) in request!",
> ++                    matches);
> ++              break;
> ++            }
> +           }
> +           else
> +             goto fail;
> +diff --git a/lib/cookie.h b/lib/cookie.h
> +index 0ffe08e..7411980 100644
> +--- a/lib/cookie.h
> ++++ b/lib/cookie.h
> +@@ -81,10 +81,26 @@ struct CookieInfo {
> + */
> + #define MAX_COOKIE_LINE 5000
> +
> +-/* This is the maximum length of a cookie name or content we deal with: */
> ++/* Maximum length of an incoming cookie name or content we deal with. Longer
> ++   cookies are ignored. */
> + #define MAX_NAME 4096
> + #define MAX_NAME_TXT "4095"
> +
> ++/* Maximum size for an outgoing cookie line libcurl will use in an http
> ++   request. This is the default maximum length used in some versions of Apache
> ++   httpd. */
> ++#define MAX_COOKIE_HEADER_LEN 8190
> ++
> ++/* Maximum number of cookies libcurl will send in a single request, even if
> ++   there might be more cookies that match. One reason to cap the number is to
> ++   keep the maximum HTTP request within the maximum allowed size. */
> ++#define MAX_COOKIE_SEND_AMOUNT 150
> ++
> ++/* Maximum number of Set-Cookie: lines accepted in a single response. If more
> ++   such header lines are received, they are ignored. This value must be less
> ++   than 256 since an unsigned char is used to count. */
> ++#define MAX_SET_COOKIE_AMOUNT 50
> ++
> + struct Curl_easy;
> + /*
> +  * Add a cookie to the internal list of cookies. The domain and path arguments
> +@@ -97,7 +113,8 @@ struct Cookie *Curl_cookie_add(struct Curl_easy *data,
> +                                const char *domain, const char *path,
> +                                bool secure);
> +
> +-struct Cookie *Curl_cookie_getlist(struct CookieInfo *c, const char *host,
> ++struct Cookie *Curl_cookie_getlist(struct Curl_easy *data,
> ++                                   struct CookieInfo *c, const char *host,
> +                                    const char *path, bool secure);
> + void Curl_cookie_freelist(struct Cookie *cookies);
> + void Curl_cookie_clearall(struct CookieInfo *cookies);
> +diff --git a/lib/http.c b/lib/http.c
> +index 4433824..2c8b0c4 100644
> +--- a/lib/http.c
> ++++ b/lib/http.c
> +@@ -2709,12 +2709,14 @@ CURLcode Curl_http_bodysend(struct Curl_easy *data, struct connectdata *conn,
> + }
> +
> + #if !defined(CURL_DISABLE_COOKIES)
> ++
> + CURLcode Curl_http_cookies(struct Curl_easy *data,
> +                            struct connectdata *conn,
> +                            struct dynbuf *r)
> + {
> +   CURLcode result = CURLE_OK;
> +   char *addcookies = NULL;
> ++  bool linecap = FALSE;
> +   if(data->set.str[STRING_COOKIE] &&
> +      !Curl_checkheaders(data, STRCONST("Cookie")))
> +     addcookies = data->set.str[STRING_COOKIE];
> +@@ -2732,7 +2734,7 @@ CURLcode Curl_http_cookies(struct Curl_easy *data,
> +         !strcmp(host, "127.0.0.1") ||
> +         !strcmp(host, "[::1]") ? TRUE : FALSE;
> +       Curl_share_lock(data, CURL_LOCK_DATA_COOKIE, CURL_LOCK_ACCESS_SINGLE);
> +-      co = Curl_cookie_getlist(data->cookies, host, data->state.up.path,
> ++      co = Curl_cookie_getlist(data, data->cookies, host, data->state.up.path,
> +                                secure_context);
> +       Curl_share_unlock(data, CURL_LOCK_DATA_COOKIE);
> +     }
> +@@ -2746,6 +2748,13 @@ CURLcode Curl_http_cookies(struct Curl_easy *data,
> +             if(result)
> +               break;
> +           }
> ++          if((Curl_dyn_len(r) + strlen(co->name) + strlen(co->value) + 1) >=
> ++             MAX_COOKIE_HEADER_LEN) {
> ++            infof(data, "Restricted outgoing cookies due to header size, "
> ++                  "'%s' not sent", co->name);
> ++            linecap = TRUE;
> ++            break;
> ++          }
> +           result = Curl_dyn_addf(r, "%s%s=%s", count?"; ":"",
> +                                  co->name, co->value);
> +           if(result)
> +@@ -2756,7 +2765,7 @@ CURLcode Curl_http_cookies(struct Curl_easy *data,
> +       }
> +       Curl_cookie_freelist(store);
> +     }
> +-    if(addcookies && !result) {
> ++    if(addcookies && !result && !linecap) {
> +       if(!count)
> +         result = Curl_dyn_addn(r, STRCONST("Cookie: "));
> +       if(!result) {
> +diff --git a/lib/urldata.h b/lib/urldata.h
> +index e006495..54faf7d 100644
> +--- a/lib/urldata.h
> ++++ b/lib/urldata.h
> +@@ -707,6 +707,7 @@ struct SingleRequest {
> + #ifndef CURL_DISABLE_DOH
> +   struct dohdata *doh; /* DoH specific data for this request */
> + #endif
> ++  unsigned char setcookies;
> +   BIT(header);        /* incoming data has HTTP header */
> +   BIT(content_range); /* set TRUE if Content-Range: was found */
> +   BIT(upload_done);   /* set to TRUE when doing chunked transfer-encoding
> diff --git a/meta/recipes-support/curl/curl/CVE-2022-32206.patch b/meta/recipes-support/curl/curl/CVE-2022-32206.patch
> new file mode 100644
> index 0000000000..25f5b27cc7
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2022-32206.patch
> @@ -0,0 +1,51 @@
> +From e12531340b03d242d3f892aa8797faf12b56dddf Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Mon, 16 May 2022 16:28:13 +0200
> +Subject: [PATCH] content_encoding: return error on too many compression steps
> +
> +The max allowed steps is arbitrarily set to 5.
> +
> +Bug: https://curl.se/docs/CVE-2022-32206.html
> +CVE-2022-32206
> +Reported-by: Harry Sintonen
> +Closes #9049
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/3a09fbb7f264c67c43]
> +Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> +---
> + lib/content_encoding.c | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/lib/content_encoding.c b/lib/content_encoding.c
> +index c03637a..6f994b3 100644
> +--- a/lib/content_encoding.c
> ++++ b/lib/content_encoding.c
> +@@ -1026,12 +1026,16 @@ static const struct content_encoding *find_encoding(const char *name,
> +   return NULL;
> + }
> +
> ++/* allow no more than 5 "chained" compression steps */
> ++#define MAX_ENCODE_STACK 5
> ++
> + /* Set-up the unencoding stack from the Content-Encoding header value.
> +  * See RFC 7231 section 3.1.2.2. */
> + CURLcode Curl_build_unencoding_stack(struct Curl_easy *data,
> +                                      const char *enclist, int maybechunked)
> + {
> +   struct SingleRequest *k = &data->req;
> ++  int counter = 0;
> +
> +   do {
> +     const char *name;
> +@@ -1066,6 +1070,11 @@ CURLcode Curl_build_unencoding_stack(struct Curl_easy *data,
> +       if(!encoding)
> +         encoding = &error_encoding;  /* Defer error at stack use. */
> +
> ++      if(++counter >= MAX_ENCODE_STACK) {
> ++        failf(data, "Reject response due to %u content encodings",
> ++              counter);
> ++        return CURLE_BAD_CONTENT_ENCODING;
> ++      }
> +       /* Stack the unencoding stage. */
> +       writer = new_unencoding_writer(data, encoding, k->writer_stack);
> +       if(!writer)
> diff --git a/meta/recipes-support/curl/curl/CVE-2022-32207.patch b/meta/recipes-support/curl/curl/CVE-2022-32207.patch
> new file mode 100644
> index 0000000000..bc16b62f39
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2022-32207.patch
> @@ -0,0 +1,283 @@
> +From 759088694e2ba68ddc5ffe042b071dadad6ff675 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Wed, 25 May 2022 10:09:53 +0200
> +Subject: [PATCH] fopen: add Curl_fopen() for better overwriting of files
> +
> +Bug: https://curl.se/docs/CVE-2022-32207.html
> +CVE-2022-32207
> +Reported-by: Harry Sintonen
> +Closes #9050
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/20f9dd6bae50b]
> +Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> +---
> + CMakeLists.txt          |   1 +
> + configure.ac            |   1 +
> + lib/Makefile.inc        |   2 +
> + lib/cookie.c            |  19 ++-----
> + lib/curl_config.h.cmake |   3 ++
> + lib/fopen.c             | 113 ++++++++++++++++++++++++++++++++++++++++
> + lib/fopen.h             |  30 +++++++++++
> + 7 files changed, 154 insertions(+), 15 deletions(-)
> + create mode 100644 lib/fopen.c
> + create mode 100644 lib/fopen.h
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index b77de6d..a0bfaad 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -1027,6 +1027,7 @@ elseif(HAVE_LIBSOCKET)
> +   set(CMAKE_REQUIRED_LIBRARIES socket)
> + endif()
> +
> ++check_symbol_exists(fchmod        "${CURL_INCLUDES}" HAVE_FCHMOD)
> + check_symbol_exists(basename      "${CURL_INCLUDES}" HAVE_BASENAME)
> + check_symbol_exists(socket        "${CURL_INCLUDES}" HAVE_SOCKET)
> + check_symbol_exists(select        "${CURL_INCLUDES}" HAVE_SELECT)
> +diff --git a/configure.ac b/configure.ac
> +index d431870..7433bb9 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -3351,6 +3351,7 @@ AC_CHECK_DECLS([getpwuid_r], [], [AC_DEFINE(HAVE_DECL_GETPWUID_R_MISSING, 1, "Se
> +
> +
> + AC_CHECK_FUNCS([fnmatch \
> ++  fchmod \
> +   geteuid \
> +   getpass_r \
> +   getppid \
> +diff --git a/lib/Makefile.inc b/lib/Makefile.inc
> +index e8f110f..5139b03 100644
> +--- a/lib/Makefile.inc
> ++++ b/lib/Makefile.inc
> +@@ -133,6 +133,7 @@ LIB_CFILES =         \
> +   escape.c           \
> +   file.c             \
> +   fileinfo.c         \
> ++  fopen.c            \
> +   formdata.c         \
> +   ftp.c              \
> +   ftplistparser.c    \
> +@@ -263,6 +264,7 @@ LIB_HFILES =         \
> +   escape.h           \
> +   file.h             \
> +   fileinfo.h         \
> ++  fopen.h            \
> +   formdata.h         \
> +   ftp.h              \
> +   ftplistparser.h    \
> +diff --git a/lib/cookie.c b/lib/cookie.c
> +index 8a6aa1a..cb0c03b 100644
> +--- a/lib/cookie.c
> ++++ b/lib/cookie.c
> +@@ -96,8 +96,8 @@ Example set of cookies:
> + #include "curl_get_line.h"
> + #include "curl_memrchr.h"
> + #include "parsedate.h"
> +-#include "rand.h"
> + #include "rename.h"
> ++#include "fopen.h"
> +
> + /* The last 3 #include files should be in this order */
> + #include "curl_printf.h"
> +@@ -1620,20 +1620,9 @@ static CURLcode cookie_output(struct Curl_easy *data,
> +     use_stdout = TRUE;
> +   }
> +   else {
> +-    unsigned char randsuffix[9];
> +-
> +-    if(Curl_rand_hex(data, randsuffix, sizeof(randsuffix)))
> +-      return 2;
> +-
> +-    tempstore = aprintf("%s.%s.tmp", filename, randsuffix);
> +-    if(!tempstore)
> +-      return CURLE_OUT_OF_MEMORY;
> +-
> +-    out = fopen(tempstore, FOPEN_WRITETEXT);
> +-    if(!out) {
> +-      error = CURLE_WRITE_ERROR;
> ++    error = Curl_fopen(data, filename, &out, &tempstore);
> ++    if(error)
> +       goto error;
> +-    }
> +   }
> +
> +   fputs("# Netscape HTTP Cookie File\n"
> +@@ -1680,7 +1669,7 @@ static CURLcode cookie_output(struct Curl_easy *data,
> +   if(!use_stdout) {
> +     fclose(out);
> +     out = NULL;
> +-    if(Curl_rename(tempstore, filename)) {
> ++    if(tempstore && Curl_rename(tempstore, filename)) {
> +       unlink(tempstore);
> +       error = CURLE_WRITE_ERROR;
> +       goto error;
> +diff --git a/lib/curl_config.h.cmake b/lib/curl_config.h.cmake
> +index d2a0f43..c254359 100644
> +--- a/lib/curl_config.h.cmake
> ++++ b/lib/curl_config.h.cmake
> +@@ -157,6 +157,9 @@
> + /* Define to 1 if you have the <assert.h> header file. */
> + #cmakedefine HAVE_ASSERT_H 1
> +
> ++/* Define to 1 if you have the `fchmod' function. */
> ++#cmakedefine HAVE_FCHMOD 1
> ++
> + /* Define to 1 if you have the `basename' function. */
> + #cmakedefine HAVE_BASENAME 1
> +
> +diff --git a/lib/fopen.c b/lib/fopen.c
> +new file mode 100644
> +index 0000000..ad3691b
> +--- /dev/null
> ++++ b/lib/fopen.c
> +@@ -0,0 +1,113 @@
> ++/***************************************************************************
> ++ *                                  _   _ ____  _
> ++ *  Project                     ___| | | |  _ \| |
> ++ *                             / __| | | | |_) | |
> ++ *                            | (__| |_| |  _ <| |___
> ++ *                             \___|\___/|_| \_\_____|
> ++ *
> ++ * Copyright (C) 1998 - 2022, Daniel Stenberg, <daniel@haxx.se>, et al.
> ++ *
> ++ * This software is licensed as described in the file COPYING, which
> ++ * you should have received as part of this distribution. The terms
> ++ * are also available at https://curl.se/docs/copyright.html.
> ++ *
> ++ * You may opt to use, copy, modify, merge, publish, distribute and/or sell
> ++ * copies of the Software, and permit persons to whom the Software is
> ++ * furnished to do so, under the terms of the COPYING file.
> ++ *
> ++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
> ++ * KIND, either express or implied.
> ++ *
> ++ * SPDX-License-Identifier: curl
> ++ *
> ++ ***************************************************************************/
> ++
> ++#include "curl_setup.h"
> ++
> ++#if !defined(CURL_DISABLE_COOKIES) || !defined(CURL_DISABLE_ALTSVC) ||  \
> ++  !defined(CURL_DISABLE_HSTS)
> ++
> ++#ifdef HAVE_FCNTL_H
> ++#include <fcntl.h>
> ++#endif
> ++
> ++#include "urldata.h"
> ++#include "rand.h"
> ++#include "fopen.h"
> ++/* The last 3 #include files should be in this order */
> ++#include "curl_printf.h"
> ++#include "curl_memory.h"
> ++#include "memdebug.h"
> ++
> ++/*
> ++ * Curl_fopen() opens a file for writing with a temp name, to be renamed
> ++ * to the final name when completed. If there is an existing file using this
> ++ * name at the time of the open, this function will clone the mode from that
> ++ * file.  if 'tempname' is non-NULL, it needs a rename after the file is
> ++ * written.
> ++ */
> ++CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
> ++                    FILE **fh, char **tempname)
> ++{
> ++  CURLcode result = CURLE_WRITE_ERROR;
> ++  unsigned char randsuffix[9];
> ++  char *tempstore = NULL;
> ++  struct_stat sb;
> ++  int fd = -1;
> ++  *tempname = NULL;
> ++
> ++  if(stat(filename, &sb) == -1 || !S_ISREG(sb.st_mode)) {
> ++    /* a non-regular file, fallback to direct fopen() */
> ++    *fh = fopen(filename, FOPEN_WRITETEXT);
> ++    if(*fh)
> ++      return CURLE_OK;
> ++    goto fail;
> ++  }
> ++
> ++  result = Curl_rand_hex(data, randsuffix, sizeof(randsuffix));
> ++  if(result)
> ++    goto fail;
> ++
> ++  tempstore = aprintf("%s.%s.tmp", filename, randsuffix);
> ++  if(!tempstore) {
> ++    result = CURLE_OUT_OF_MEMORY;
> ++    goto fail;
> ++  }
> ++
> ++  result = CURLE_WRITE_ERROR;
> ++  fd = open(tempstore, O_WRONLY | O_CREAT | O_EXCL, 0600);
> ++  if(fd == -1)
> ++    goto fail;
> ++
> ++#ifdef HAVE_FCHMOD
> ++  {
> ++    struct_stat nsb;
> ++    if((fstat(fd, &nsb) != -1) &&
> ++       (nsb.st_uid == sb.st_uid) && (nsb.st_gid == sb.st_gid)) {
> ++      /* if the user and group are the same, clone the original mode */
> ++      if(fchmod(fd, sb.st_mode) == -1)
> ++        goto fail;
> ++    }
> ++  }
> ++#endif
> ++
> ++  *fh = fdopen(fd, FOPEN_WRITETEXT);
> ++  if(!*fh)
> ++    goto fail;
> ++
> ++  *tempname = tempstore;
> ++  return CURLE_OK;
> ++
> ++fail:
> ++  if(fd != -1) {
> ++    close(fd);
> ++    unlink(tempstore);
> ++  }
> ++
> ++  free(tempstore);
> ++
> ++  *tempname = NULL;
> ++  return result;
> ++}
> ++
> ++#endif /* ! disabled */
> +diff --git a/lib/fopen.h b/lib/fopen.h
> +new file mode 100644
> +index 0000000..289e55f
> +--- /dev/null
> ++++ b/lib/fopen.h
> +@@ -0,0 +1,30 @@
> ++#ifndef HEADER_CURL_FOPEN_H
> ++#define HEADER_CURL_FOPEN_H
> ++/***************************************************************************
> ++ *                                  _   _ ____  _
> ++ *  Project                     ___| | | |  _ \| |
> ++ *                             / __| | | | |_) | |
> ++ *                            | (__| |_| |  _ <| |___
> ++ *                             \___|\___/|_| \_\_____|
> ++ *
> ++ * Copyright (C) 1998 - 2022, Daniel Stenberg, <daniel@haxx.se>, et al.
> ++ *
> ++ * This software is licensed as described in the file COPYING, which
> ++ * you should have received as part of this distribution. The terms
> ++ * are also available at https://curl.se/docs/copyright.html.
> ++ *
> ++ * You may opt to use, copy, modify, merge, publish, distribute and/or sell
> ++ * copies of the Software, and permit persons to whom the Software is
> ++ * furnished to do so, under the terms of the COPYING file.
> ++ *
> ++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
> ++ * KIND, either express or implied.
> ++ *
> ++ * SPDX-License-Identifier: curl
> ++ *
> ++ ***************************************************************************/
> ++
> ++CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
> ++                    FILE **fh, char **tempname);
> ++
> ++#endif
> diff --git a/meta/recipes-support/curl/curl/CVE-2022-32208.patch b/meta/recipes-support/curl/curl/CVE-2022-32208.patch
> new file mode 100644
> index 0000000000..9a4e398370
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2022-32208.patch
> @@ -0,0 +1,67 @@
> +From fd2ffddec315c029e923e6e6f2c049809d01a5fc Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Thu, 9 Jun 2022 09:27:24 +0200
> +Subject: [PATCH] krb5: return error properly on decode errors
> +
> +Bug: https://curl.se/docs/CVE-2022-32208.html
> +CVE-2022-32208
> +Reported-by: Harry Sintonen
> +Closes #9051
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/6ecdf5136b52af7]
> +Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> +---
> + lib/krb5.c | 18 +++++++++++-------
> + 1 file changed, 11 insertions(+), 7 deletions(-)
> +
> +diff --git a/lib/krb5.c b/lib/krb5.c
> +index 787137c..6f9e1f7 100644
> +--- a/lib/krb5.c
> ++++ b/lib/krb5.c
> +@@ -140,11 +140,8 @@ krb5_decode(void *app_data, void *buf, int len,
> +   enc.value = buf;
> +   enc.length = len;
> +   maj = gss_unwrap(&min, *context, &enc, &dec, NULL, NULL);
> +-  if(maj != GSS_S_COMPLETE) {
> +-    if(len >= 4)
> +-      strcpy(buf, "599 ");
> ++  if(maj != GSS_S_COMPLETE)
> +     return -1;
> +-  }
> +
> +   memcpy(buf, dec.value, dec.length);
> +   len = curlx_uztosi(dec.length);
> +@@ -506,6 +503,7 @@ static CURLcode read_data(struct connectdata *conn,
> + {
> +   int len;
> +   CURLcode result;
> ++  int nread;
> +
> +   result = socket_read(fd, &len, sizeof(len));
> +   if(result)
> +@@ -514,7 +512,10 @@ static CURLcode read_data(struct connectdata *conn,
> +   if(len) {
> +     /* only realloc if there was a length */
> +     len = ntohl(len);
> +-    buf->data = Curl_saferealloc(buf->data, len);
> ++    if(len > CURL_MAX_INPUT_LENGTH)
> ++      len = 0;
> ++    else
> ++      buf->data = Curl_saferealloc(buf->data, len);
> +   }
> +   if(!len || !buf->data)
> +     return CURLE_OUT_OF_MEMORY;
> +@@ -522,8 +523,11 @@ static CURLcode read_data(struct connectdata *conn,
> +   result = socket_read(fd, buf->data, len);
> +   if(result)
> +     return result;
> +-  buf->size = conn->mech->decode(conn->app_data, buf->data, len,
> +-                                 conn->data_prot, conn);
> ++  nread = conn->mech->decode(conn->app_data, buf->data, len,
> ++                             conn->data_prot, conn);
> ++  if(nread < 0)
> ++    return CURLE_RECV_ERROR;
> ++  buf->size = (size_t)nread;
> +   buf->index = 0;
> +   return CURLE_OK;
> + }
> diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
> index d5dfe62a39..67de0220c6 100644
> --- a/meta/recipes-support/curl/curl_7.82.0.bb
> +++ b/meta/recipes-support/curl/curl_7.82.0.bb
> @@ -24,6 +24,10 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
>              file://CVE-2022-27782-1.patch \
>              file://CVE-2022-27782-2.patch \
>              file://0001-openssl-fix-CN-check-error-code.patch \
> +           file://CVE-2022-32205.patch \
> +           file://CVE-2022-32206.patch \
> +           file://CVE-2022-32207.patch \
> +           file://CVE-2022-32208.patch \
>              "
>   SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
> 
> --
> 2.25.1
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168201): https://lists.openembedded.org/g/openembedded-core/message/168201
> Mute This Topic: https://lists.openembedded.org/mt/92460238/3618448
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mingli.yu@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

