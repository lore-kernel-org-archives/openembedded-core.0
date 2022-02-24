Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5B5C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 01:01:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.4484.1645664510953414042
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 17:01:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=J9FN6atD;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=90546d8fae=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21O0qsDO019720
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 01:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=qMu/jLJOYBSHwzCr1ZBdt+teqFm+JYRNRzFQPKSH7j8=;
 b=J9FN6atD5AVoXGziAiSJagyqgRLCcX4mbWmAPVkrrIit+TSuXhb6CoJVBMnd3V2drngK
 TvYE8IPkjjR9FdlpXpMdlecgw4/ATC8P0sA8EmmENoXTtEza6wEG/up+tSiZTeOajFaL
 PNu0dfOeX09pKFNOOdEQG7Y2KCUEPPnfcDoTutX9s9FnfFXBXq2aF3FUIpYGBhta4yyz
 ppNknLDZBZd3jVLHva40l9aOI6JKZKrJVhYhXtDXjcUAsv3fQ9BNntqHdagykMF+7LpF
 Ma/J0tMF2BRzJ9EBvtU9AfQF7nK0Zc0tWRluPZfY1geRo/e7+EKbEn4oSoe/Sk6kKJy0 qA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3edukjg6ec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 01:01:49 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 21O11npQ005861
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 01:01:49 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3edukjg6ea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Feb 2022 01:01:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4YZCPM1fELE21mtURjR5V3dJdS9Nzpz5pXG8Xa3uMoOfcanrpXxjCxnK2fYmXUac/xqSM35B08tyzXI87ZnWBDz5ktwiCKktlfphy7sOGAY5v20OWc+S9mWY4FZYt3d+AET80+NvJvaPVQgb4Oufk45WwIyz781Eg3eBxkjEWkaN6gZ88o+Q0XZikDkOjdhK/EEPjQKAJrDCxMeenuhu3/gODzoYoOOCtenq8xQVQ6FOZN48MTV9byqphUGBcYCAJq/V///w+YWoxiekSe58wC2T7FrE1/FbGeXGF8/zPz6L/IqcyduYA3AMRkZ7ipetnYrbafCoNx7LnSTTKU9Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMu/jLJOYBSHwzCr1ZBdt+teqFm+JYRNRzFQPKSH7j8=;
 b=eM9/sRizf2v8B+YVvcee+Y9lVNGvzB0L+hUCuCaSTOjPkEKcgACvB6xUOsMOvyVB6uWfY/8i98EYKqKfHApB1KjGw1BBifzLupD+07+qCLKb1/4Z6fYKS2rni8XCvc9IfPf1zm1n/fN5Hk3PQkixUmj7kkaxGB72Djg7LJjURNtNTmz7QufYZR2GJVGwabBKcgwvFSaHqHYH5VtSje/DJCvIUm1ScjBGkDeVFED8nJzEDsa08GH8N1dl+y81YbI8qjVE0BLrB3rTpc42e0S8iFO9dw0oDaWjNGz4uJRLZ5X8aQwXow93Yi1u8K4ueNsK3KiuY1hg0yJiYzyTALBrKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CH0PR11MB5538.namprd11.prod.outlook.com (2603:10b6:610:d5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 01:01:47 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::fca9:1fa9:6fdd:9dee]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::fca9:1fa9:6fdd:9dee%5]) with mapi id 15.20.4995.027; Thu, 24 Feb 2022
 01:01:47 +0000
Message-ID: <34156304-0480-6b77-3e30-0f02d2534373@windriver.com>
Date: Wed, 23 Feb 2022 20:01:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe-core][hardknott][PATCH 1/1] virglrenderer: fix CVE-2022-0135
 and -0175
Content-Language: en-CA
To: Joe Slater <joe.slater@windriver.com>,
        openembedded-core@lists.openembedded.org,
        "Mittal, Anuj" <anuj.mittal@intel.com>
References: <20220216231204.21131-1-joe.slater@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220216231204.21131-1-joe.slater@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:217::30) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42d24390-d6a5-48af-2724-08d9f7313b49
X-MS-TrafficTypeDiagnostic: CH0PR11MB5538:EE_
X-Microsoft-Antispam-PRVS: 
	<CH0PR11MB5538D5C8638A1E71C500D09CF83D9@CH0PR11MB5538.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S9P1fWiDm7Cy6Ia4503e9yCtL3bb5hxlQro/L7aO5u6IYooWy1nfR2VLDM7nhz/RJVgOvWs9rVHcFxClYHy/stQbdvd1ZIaTK9g5O3M6orYu0sK/P/BcmzA7+ADou/vQ+EI9wnYD9P/wEHNrcpro+0z/vLYTmvbzGlqxL++u/g6TraQFOkahNJpy5ZbO+AwHx+JeGNqs3feh5rzOmiHzPns9JyUBjlLdb80NjFViWPqPoJ0HU5lyKmxCGALBE/MhAVPE2UaYfHv4uOTUpEQcdBxB67G1hTTMA0ph6Ukyq784YhGcSM/1zoGrZ9aq1geOOvBr73jg8UBcSwOiVO5nYDW57C41TlsPAMVRUkq/u7n9u+TdB7atjLCLXVTNq6HzOYTg/dJSLhaMgSG+da01Dpw4cRH0Gb0PqKFXTBFO3bSgD9SK8116QHlrF30cIhk9/oIU6S9+GOq54ULAT6icjsIBL0Ayhbd/oqy731fhGuHA3pySBtLOmgHqD7vX0KIFAJhYcvZwsvPDwFg9dLQ8lcknvDWVbIs5oUg3dQWMKHs7lGZDYknRSpyVrb2BALtPbjiuTFTAWltRcxZlQ7OJ+iwq7cag615gq79jEwDh8nTF5iCR1th2MrhfySo7bMl76vaSWE4DqB8k74KAPeC+/hPujYCRIQSYkerMC3NFef4bgyVv1z4pqVRER9ezon7+GbwZW6DweT8JRjRaS3B5MycJmwJjrDZoMERvEGbBfcJv8aK0B/nO/GDMOuCYAqorECCBs6VJO5eF+Rvh7JaAJgZpWWfEET2B2O1kAZbVlscxL8zm1QLcT5Mutq7gaieU520D7tXc4GH0dBbRlm61iA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6666004)(5660300002)(966005)(6486002)(6512007)(6506007)(8676002)(8936002)(86362001)(53546011)(52116002)(66946007)(66556008)(31686004)(31696002)(66476007)(508600001)(186003)(2616005)(84970400001)(36756003)(83380400001)(2906002)(316002)(110136005)(38350700002)(38100700002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SFZLMEtCR1ZLREJJNENjdmhuYmdwWElWWE5xTndkNlJ3MmNPd0k0NlBWSC92?=
 =?utf-8?B?MFBtREpqY3lSOHhtWXNkNk91TUhOWEMxTnMrOW1zZFBpYXplVTZVblVyQW50?=
 =?utf-8?B?Tkc4aGVjZnp5b0hzRmFGenVFTnZBTzhIRGpicGdtYkVhdWhpeHNxQUplNktT?=
 =?utf-8?B?VWNKVDdMeHFOUGhjT0gxdUg2OEZiSVRFZXlVUkhldnlqcE5sSXhhanVMTWk0?=
 =?utf-8?B?MjlMQ2JqcXBlNVJGZFJVTmkxM1phaHNCdW1oT1B6TkVzc0lWalVQT01FcnFK?=
 =?utf-8?B?c3RKNXZRcEtCMjZvUktWVzBCUGp0RGtiYUJZL1VKcElTVXlmUUttUXpjc1E4?=
 =?utf-8?B?a2U0Sm9RRU9LcEp4cm5JbUR2aFh5TmUxNy9oNkxsaTNkTVFiZ0REdHkweW14?=
 =?utf-8?B?VE9YWHprem1Mb2VPS08ySFZndkdvYTQzQXFTVU9Fa0FDYzM5cWFEUm9hc1Br?=
 =?utf-8?B?QnY1M3gyM0NUOGU5Mk5ic3dxVGtEcHFYbkFoUFBRUHJGNk9UVTJiNWs4WUdC?=
 =?utf-8?B?R09xeFVmL0hDc1czUE9wbVNITjdHdTh3NkluL1kyZHZyWHRGZ3ErdU0zTmFv?=
 =?utf-8?B?dWdqcEFGZ3VIVlppK3Y5U0MrRVIwTGhWbkJNRHlROHJyU09HN1RBaUVCYzlr?=
 =?utf-8?B?dFgxRDFSMGRWVjR6SVpIQUV1RTh3YmtXY0Mvdmo2d295RGIreFY5UGhvcTVr?=
 =?utf-8?B?QkNURDBwaVJldjg2UEFVbFlDYzJzdTVQK0tuMmZtMzBmUmk0bmdhQTM1TWJ3?=
 =?utf-8?B?TEFxb1g0SjNmSlVPbld6amtQZ1RlR2k1OS8xR3dzbDIremJrc09TVDY0YmZC?=
 =?utf-8?B?Mlh3eEZneFVnc21WRmprK3R5TVM5S0pmNDdJaU9aeGcwR2Faa0hKZlFZOTFp?=
 =?utf-8?B?cUYxQ09WSURJTnRCeERqREZFR1ZPcGkwelZJaTN2YkhQbTkvTThjSGNoT0px?=
 =?utf-8?B?N2FhV2FCdFZwRUVVdDBPbXlSVzlVYzdpdkVMTVU4UzRCdUlMQnBCK09CYXda?=
 =?utf-8?B?TFE0T2JxWE0wYWZYclJiVWVyNGxIZVBxUGx2UHp0WDJCYmtad1NieWlTaFVR?=
 =?utf-8?B?NHJ5djdsa1ZDbjlZVjY5Ly9IWXhLYmJZaHVRT1FBL3J6bnZZbWZkZHk2V2Y5?=
 =?utf-8?B?ZHhIMURLdVFuTk5rL3ZpN1RzaG81YThOS00vbUN2S05tY0FQbkxpcUxKZmJt?=
 =?utf-8?B?cU80WnVzbGJRRk9tUHNlU3JJS3BUQzM5cG9vYndUUkVrQTE0ZDlFRElxYlpB?=
 =?utf-8?B?eDhZRlhBRVkwZFRFMGdnUXNoeXR5dm5nRzQvVmsvcjAwQUFqMHBsUXZVK3ZV?=
 =?utf-8?B?OUNuUkR1SHJwYjBSeDVvbXdiY0tWSmVnVEp5a29iNHRTZ3VvYmsrVlM3U25W?=
 =?utf-8?B?eHZuTW96VlFXcjl3bkNFNFhiVWhsMHVkVjlDRzFCOHV3dDZoMjdrZEpVams0?=
 =?utf-8?B?SldUTGZVaDRBRFB5VHJSUW1WTzVTaHBqSkNwbzhtcm1qVVQrZGgzeW5HQ2JT?=
 =?utf-8?B?Q291SzFBUFlHWkp1ZUZJaENxMGd2ZmJ4eVAvbE51UXVVbW5SMXBiRURSWThC?=
 =?utf-8?B?MzEyc2plSGJRZ04wNkVpb3ZqZFkyelBXWU5rcEEzbXhFQjRDYklvT0JUSklM?=
 =?utf-8?B?bkVaQnBta29QTlJlUi9KVncwNkkwaS9ZSVF3dXdvVkt4Y0ZDendHMks2Y1JH?=
 =?utf-8?B?bVpDalhucDM0Tnh1NFNCVGFYOHRaRDJTZXZCbGxaelVYUmJTOWZsTCtoR2Vu?=
 =?utf-8?B?VEtmcytRakQ4ZFBIdHJFWGxSN2ozU3A4UE03OG1RYnBXa011SlF2TTN6dmZq?=
 =?utf-8?B?TmFqZWphRHJ6VU01TUp4bmlZRWZ3MHQ2S3Bsb0tFNTBJZ1dUZVRXTUJjZXJQ?=
 =?utf-8?B?ZlpBbXZHd3Q1a0JnQ1FpNXorRGJvckhzZ0wrVUExMElEOWhWR3NudE9NTGVl?=
 =?utf-8?B?QmZwSEhTZzNOL2pGelppZUFSZmFSS0hBVENTUEo1LzJod3IxdVUzSFFXZ1dt?=
 =?utf-8?B?Mkh6NWtpQkpSRUlUL2lVMHdJUE05UXREcXdLMFFYSThCc0hLc3o3Z3pqdXMz?=
 =?utf-8?B?aWg1QVdNTDNMWUtNcmV1djBqQmFLMTk1MnJoVE1wUGJ2RmJOZkVFbmpkREla?=
 =?utf-8?B?QlBDcTl1aCtSdkNJUTlCcVRUNzR6c01ndjJ1c3c3QU5MenZnN3VSdThSRnY2?=
 =?utf-8?B?dklYRE9UemVyRWlDWnRaeUJLTEs5M1RjQjRwelNyaGZQdlQ0MTFOMzBZa0hX?=
 =?utf-8?B?S1RvdWMwL0FISmxjaHlhNC9WU2x3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 42d24390-d6a5-48af-2724-08d9f7313b49
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 01:01:47.0993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OhBIZ8dFY136vjfyHCM69/FS8n97icLziUSK/f54ZP9mKqa1XZqsGVDM/workDjQZcEt6NXRzW9+dyoKWkVCvdgb5Izb21BqbB2J0tsoxAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5538
X-Proofpoint-GUID: VI2-5zsATmpOqBTAKLQl3irkbtpifvS3
X-Proofpoint-ORIG-GUID: 84jg_P_xEnnQl7hJ7XNOJtG5VXoXSDdx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-23_09,2022-02-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202240002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 01:01:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162283

Anuj,

Did you miss this one?
I don't see it in:
https://git.openembedded.org/meta-openembedded-contrib/log/?h=hardknott-next

../Randy

On 2022-02-16 18:12, Joe Slater wrote:
> CVE-2022-0135 concerns out-of-bounds writes in read_transfer_data().
> CVE-2022-0175 concerns using malloc() instead of calloc().
>
> We cherry-pick from master.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 91f7511df79c5c1f93add9f2827a5a266453614e)
>
> Modify -0175 patch to apply to hardknott branch.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>   .../virglrenderer/cve-2022-0135.patch         | 117 ++++++++++++++++++
>   .../virglrenderer/cve-2022-0175.patch         | 112 +++++++++++++++++
>   .../virglrenderer/virglrenderer_0.8.2.bb      |   2 +
>   3 files changed, 231 insertions(+)
>   create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0135.patch
>   create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0175.patch
>
> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0135.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0135.patch
> new file mode 100644
> index 0000000000..ae42dc8f6c
> --- /dev/null
> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0135.patch
> @@ -0,0 +1,117 @@
> +From 63aee871365f9c9e7fa9125672302a0fb250d34d Mon Sep 17 00:00:00 2001
> +From: Gert Wollny <gert.wollny@collabora.com>
> +Date: Tue, 30 Nov 2021 09:16:24 +0100
> +Subject: [PATCH 2/2] vrend: propperly check whether the shader image range is
> + correct
> +
> +Also add a test to check the integer underflow.
> +
> +Closes: #251
> +Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
> +Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> +
> +cherry-pick from anongit.freedesktop.org/virglrenderer
> +commit 2aed5d4...
> +
> +CVE: CVE-2022-0135
> +Upstream-Status: Backport
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +
> +---
> + src/vrend_decode.c          |  3 +-
> + tests/test_fuzzer_formats.c | 57 +++++++++++++++++++++++++++++++++++++
> + 2 files changed, 59 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/vrend_decode.c b/src/vrend_decode.c
> +index 91f5f24..6771b10 100644
> +--- a/src/vrend_decode.c
> ++++ b/src/vrend_decode.c
> +@@ -1249,8 +1249,9 @@ static int vrend_decode_set_shader_images(struct vrend_context *ctx, const uint3
> +    if (num_images < 1) {
> +       return 0;
> +    }
> ++
> +    if (start_slot > PIPE_MAX_SHADER_IMAGES ||
> +-       start_slot > PIPE_MAX_SHADER_IMAGES - num_images)
> ++       start_slot + num_images > PIPE_MAX_SHADER_IMAGES)
> +       return EINVAL;
> +
> +    for (uint32_t i = 0; i < num_images; i++) {
> +diff --git a/tests/test_fuzzer_formats.c b/tests/test_fuzzer_formats.c
> +index 154a2e5..e32caf0 100644
> +--- a/tests/test_fuzzer_formats.c
> ++++ b/tests/test_fuzzer_formats.c
> +@@ -958,6 +958,61 @@ static void test_vrend_set_signle_abo_heap_overflow() {
> +     virgl_renderer_submit_cmd((void *) cmd, ctx_id, 0xde);
> + }
> +
> ++static void test_vrend_set_shader_images_overflow()
> ++{
> ++    uint32_t num_shaders = PIPE_MAX_SHADER_IMAGES + 1;
> ++    uint32_t size = num_shaders * VIRGL_SET_SHADER_IMAGE_ELEMENT_SIZE + 3;
> ++    uint32_t cmd[size];
> ++    int i = 0;
> ++    cmd[i++] = ((size - 1)<< 16) | 0 << 8 | VIRGL_CCMD_SET_SHADER_IMAGES;
> ++    cmd[i++] = PIPE_SHADER_FRAGMENT;
> ++    memset(&cmd[i], 0, size - i);
> ++
> ++    virgl_renderer_submit_cmd((void *) cmd, ctx_id, size);
> ++}
> ++
> ++/* Test adapted from yaojun8558363@gmail.com:
> ++ * https://gitlab.freedesktop.org/virgl/virglrenderer/-/issues/250
> ++*/
> ++static void test_vrend_3d_resource_overflow() {
> ++
> ++    struct virgl_renderer_resource_create_args resource;
> ++    resource.handle = 0x4c474572;
> ++    resource.target = PIPE_TEXTURE_2D_ARRAY;
> ++    resource.format = VIRGL_FORMAT_Z24X8_UNORM;
> ++    resource.nr_samples = 2;
> ++    resource.last_level = 0;
> ++    resource.array_size = 3;
> ++    resource.bind = VIRGL_BIND_SAMPLER_VIEW;
> ++    resource.depth = 1;
> ++    resource.width = 8;
> ++    resource.height = 4;
> ++    resource.flags = 0;
> ++
> ++    virgl_renderer_resource_create(&resource, NULL, 0);
> ++    virgl_renderer_ctx_attach_resource(ctx_id, resource.handle);
> ++
> ++    uint32_t size = 0x400;
> ++    uint32_t cmd[size];
> ++    int i = 0;
> ++    cmd[i++] = (size - 1) << 16 | 0 << 8 | VIRGL_CCMD_RESOURCE_INLINE_WRITE;
> ++    cmd[i++] = resource.handle;
> ++    cmd[i++] = 0; // level
> ++    cmd[i++] = 0; // usage
> ++    cmd[i++] = 0; // stride
> ++    cmd[i++] = 0; // layer_stride
> ++    cmd[i++] = 0; // x
> ++    cmd[i++] = 0; // y
> ++    cmd[i++] = 0; // z
> ++    cmd[i++] = 8; // w
> ++    cmd[i++] = 4; // h
> ++    cmd[i++] = 3; // d
> ++    memset(&cmd[i], 0, size - i);
> ++
> ++    virgl_renderer_submit_cmd((void *) cmd, ctx_id, size);
> ++}
> ++
> ++
> + int main()
> + {
> +    initialize_environment();
> +@@ -980,6 +1035,8 @@ int main()
> +    test_cs_nullpointer_deference();
> +    test_vrend_set_signle_abo_heap_overflow();
> +
> ++   test_vrend_set_shader_images_overflow();
> ++   test_vrend_3d_resource_overflow();
> +
> +    virgl_renderer_context_destroy(ctx_id);
> +    virgl_renderer_cleanup(&cookie);
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0175.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0175.patch
> new file mode 100644
> index 0000000000..8bbb9eb579
> --- /dev/null
> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0175.patch
> @@ -0,0 +1,112 @@
> +From 5ca7aca001092c557f0b6fc1ba3db7dcdab860b7 Mon Sep 17 00:00:00 2001
> +From: Gert Wollny <gert.wollny@collabora.com>
> +Date: Tue, 30 Nov 2021 09:29:42 +0100
> +Subject: [PATCH 1/2] vrend: clear memory when allocating a host-backed memory
> + resource
> +
> +Closes: #249
> +Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
> +Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> +
> +cherry-pick from anongit.freedesktop.org/virglrenderer
> +commit b05bb61...
> +
> +CVE: CVE-2022-0175
> +Upstream-Status: Backport
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +
> +Patch to vrend_renderer.c modified to apply to version used by hardknott.
> +Patch to test_virgl_transfer.c unchanged.
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +
> +---
> + src/vrend_renderer.c        |  2 +-
> + tests/test_virgl_transfer.c | 51 +++++++++++++++++++++++++++++++++++++
> + 2 files changed, 52 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/vrend_renderer.c b/src/vrend_renderer.c
> +index ad7a351..d84f785 100644
> +--- a/src/vrend_renderer.c
> ++++ b/src/vrend_renderer.c
> +@@ -6646,7 +6646,7 @@ int vrend_renderer_resource_create(struct vrend_renderer_resource_create_args *a
> +       if (args->bind == VIRGL_BIND_CUSTOM) {
> +          /* use iovec directly when attached */
> +          gr->storage_bits |= VREND_STORAGE_HOST_SYSTEM_MEMORY;
> +-         gr->ptr = malloc(args->width);
> ++         gr->ptr = calloc(1, args->width);
> +          if (!gr->ptr) {
> +             FREE(gr);
> +             return ENOMEM;
> +diff --git a/tests/test_virgl_transfer.c b/tests/test_virgl_transfer.c
> +index 2c8669a..8f8e98a 100644
> +--- a/tests/test_virgl_transfer.c
> ++++ b/tests/test_virgl_transfer.c
> +@@ -952,6 +952,56 @@ START_TEST(virgl_test_transfer_near_res_bounds_with_stride_succeeds)
> + }
> + END_TEST
> +
> ++START_TEST(test_vrend_host_backed_memory_no_data_leak)
> ++{
> ++   struct iovec iovs[1];
> ++   int niovs = 1;
> ++
> ++   struct virgl_context ctx = {0};
> ++
> ++   int ret = testvirgl_init_ctx_cmdbuf(&ctx);
> ++
> ++   struct virgl_renderer_resource_create_args res;
> ++   res.handle = 0x400;
> ++   res.target = PIPE_BUFFER;
> ++   res.format = VIRGL_FORMAT_R8_UNORM;
> ++   res.nr_samples = 0;
> ++   res.last_level = 0;
> ++   res.array_size = 1;
> ++   res.bind = VIRGL_BIND_CUSTOM;
> ++   res.depth = 1;
> ++   res.width = 32;
> ++   res.height = 1;
> ++   res.flags = 0;
> ++
> ++   uint32_t size = 32;
> ++   uint8_t* data = calloc(1, size);
> ++   memset(data, 1, 32);
> ++   iovs[0].iov_base = data;
> ++   iovs[0].iov_len = size;
> ++
> ++   struct pipe_box box = {0,0,0, size, 1,1};
> ++
> ++   virgl_renderer_resource_create(&res, NULL, 0);
> ++   virgl_renderer_ctx_attach_resource(ctx.ctx_id, res.handle);
> ++
> ++   ret = virgl_renderer_transfer_read_iov(res.handle, ctx.ctx_id, 0, 0, 0,
> ++                                          (struct virgl_box *)&box, 0, iovs, niovs);
> ++
> ++   ck_assert_int_eq(ret, 0);
> ++
> ++   for (int i = 0; i < 32; ++i)
> ++      ck_assert_int_eq(data[i], 0);
> ++
> ++   virgl_renderer_ctx_detach_resource(1, res.handle);
> ++
> ++   virgl_renderer_resource_unref(res.handle);
> ++   free(data);
> ++
> ++}
> ++END_TEST
> ++
> ++
> + static Suite *virgl_init_suite(void)
> + {
> +   Suite *s;
> +@@ -981,6 +1031,7 @@ static Suite *virgl_init_suite(void)
> +   tcase_add_test(tc_core, virgl_test_transfer_buffer_bad_strides);
> +   tcase_add_test(tc_core, virgl_test_transfer_2d_array_bad_layer_stride);
> +   tcase_add_test(tc_core, virgl_test_transfer_2d_bad_level);
> ++  tcase_add_test(tc_core, test_vrend_host_backed_memory_no_data_leak);
> +
> +   tcase_add_loop_test(tc_core, virgl_test_transfer_res_read_valid, 0, PIPE_MAX_TEXTURE_TYPES);
> +   tcase_add_loop_test(tc_core, virgl_test_transfer_res_write_valid, 0, PIPE_MAX_TEXTURE_TYPES);
> +--
> +2.31.1
> +
> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> index 7f035f820a..d92359565a 100644
> --- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> @@ -13,6 +13,8 @@ SRCREV = "7d204f3927be65fb3365dce01dbcd04d447a4985"
>   SRC_URI = "git://anongit.freedesktop.org/virglrenderer;branch=master \
>              file://0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch \
>              file://0001-meson.build-use-python3-directly-for-python.patch \
> +           file://cve-2022-0135.patch \
> +           file://cve-2022-0175.patch \
>              "
>   
>   S = "${WORKDIR}/git"


-- 
# Randy MacLeod
# Wind River Linux


