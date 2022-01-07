Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3AABC433EF
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 02:56:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1911.1641524189209375347
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 18:56:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Hhdfn0FP;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8006e34bf1=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2072s3Ai012470
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Jan 2022 02:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : cc : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=EO5YUIZRO1449dG3ZsSSL3dArK6jKBeiO0SI+mXjUTc=;
 b=Hhdfn0FPqsc3DNSwyjcu5VZabjYijWUY6IsVAVhfOV3TYdR9KJGxuldjMIraAOTAC+VW
 zvtliXJshy9TKijchFh43Yxu2/8xVFdJxJEZ8QcGnZZVvLWtih2z097iztjmtO4+AGIl
 7jsezDVzkhM3W5c1mBgAdqA727pGk4EnLRwiJtKuP0bvB2Ljon0dhJLna+qU4J6E6noA
 DuzStooggoWk0dC0c0YhcaMLLxPjl8XhQfMZ57dIZzsPpYbrLcD0UcfJlujKPszsmq+f
 ZUFRJ2FEWTkCliWIm0+C48iwJuCq6apFASvklEkbupWGeCb1e8uTJKECG4zqSQ8Ycvo9 PA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3de4wc0a4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 02:56:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sx/s2W/BXCzuV5AvDMAHPLwChek6flmOTdCNiOZ8g3vRN2s+uz3sOp0aK3RxViWG1N/C42OAsfI1F0pjzb2n440PZmjmnKpLFruXw4fqj86VIbxtW28Uz8GzLMCnfSxykMlxUdRRs8KA9Ij7A8BDUnspYasvuWoK7q9TSqLSIiJa0q0YqFBd4VuDmyvn33tW8A7yIoYMxkUtEEAkjFmPRwGIbda0Xlwf9zbQgax8NiDWvqXWHxw2Ege68Uxbg9uqeGh+nvKuM3mGlYsEzIbyJVzGzNpJ2RwuRWrNc9qEnSIv8xPjxGRT8/ApL1R12cKj4NH919shlSZF2ZAlnbvcpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EO5YUIZRO1449dG3ZsSSL3dArK6jKBeiO0SI+mXjUTc=;
 b=UHGfX0jeAMvoP0n/c2trAFI91OlRGG7sUtiyEb1wNb3B6dMzVEMV83eN9Z5Li790QzUtBbJbe0bhtsXI20tCpCzwj1fRuv6TBqcY7nw6IU+uyW9cJbf0mijqoUyl+4ecnIBKY8lPFP24fLZZH+YwDUOSjANdy+tM1RD0dcZgkNJEr0Dhasal7jqSH6NPc4P54srTDvnOuLZcth+qCyLGkJYTbXiotiaRh4I4EO5bw1sBAxXBbL6K09XvIYyCmPBPSEb3wkSHtj/ZordkH9ENvL6hJ7QbMRU8k1UNmst3GGywOM76Md/Zx/MfR9WvqSLSo8T1+naNwvwudTMMkYtFBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13)
 by MW5PR11MB5857.namprd11.prod.outlook.com (2603:10b6:303:19d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Fri, 7 Jan
 2022 02:56:25 +0000
Received: from CO1PR11MB4851.namprd11.prod.outlook.com
 ([fe80::39d4:a247:159e:5693]) by CO1PR11MB4851.namprd11.prod.outlook.com
 ([fe80::39d4:a247:159e:5693%5]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 02:56:25 +0000
Subject: Re: [OE-core] [hardknott][PATCH 1/4] xserver-xorg: fix CVE-2021-4008
From: Kai <kai.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
References: <20211229013051.36342-1-kai.kang@windriver.com>
 <16C515AB4535CCA0.27787@lists.openembedded.org>
Message-ID: <46ba307e-dfba-4074-607f-a9b52bdeca06@windriver.com>
Date: Fri, 7 Jan 2022 10:56:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <16C515AB4535CCA0.27787@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------5909B910BB6312FCF5CD61A3"
Content-Language: en-US
X-ClientProxiedBy: SG2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::15)
 To CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f9c41b4-3176-4c97-675b-08d9d1894b49
X-MS-TrafficTypeDiagnostic: MW5PR11MB5857:EE_
X-Microsoft-Antispam-PRVS: 
	<MW5PR11MB5857A9A6B460ADB26F1BA7B5954D9@MW5PR11MB5857.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:131;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MDEg1pfLlHN3EFRHoLgNDOTveavQp4wZfOSo7NHg+6wJ0Q4rorDNFgFRUhTusxYFyImY2StxfZBFNP7qHJYbiNxBZs64tL/sq6HX6pfuKKJKOW3MMUz5QZ6O5s5UNoZrKQQr43np5EAh1Nho22MNrqpKrOdQ5MH64esVrPr35+n/RncuLL39sXkNv2Ahe0p8k00ISAIukdCiQYHcVQFnqZrg7CbhA+KGn+p2mFqYa1CjQl7tL+5CV8yxOpbeTC/QI1oyLP8UPHZoYtH/hZLzQfj08QNjkdRYvPTJtF+yagWIoroLsX7uIvCuhADLF5Z90kDwzXPx9SWmPD2xUIoAxDy4OX4bOTZIqZ6o5/emvZJjCeAxMbwv6sXMDgtYRm3qDJxOi/c1g1Hrp5LILH+2rxz1d7pOGk6gXwZLYPVcSpQefA6fxg4ywafq5F0DXoTAtc/Kgm6MPQdudlkTJ0fHRXaJl7p+X7UMqGw0G9/RbipjuDwX0kQ/aXaZtakjgq1BHyWSndU6fbCn34dvPpfTjivHB/29Dkd6jjKqArWDtFagK9AZnRUmoxyUqgwyWdSNbZUQQxtxhmogGe9nL0FJFij0XyG2i5bBBzcUh36rI85cC72SpqGPfNwbckx7ffLaXa4txcH2H5b0Pt6qXv/O0PuJFoPHtCA0Ebqfi3AC1YSULNl+kR4SUoEtwAVYw+dLrpnfb3O0cwpV0cMXTZqQUeRHfRJzJDefZkiI6ruphCb5IbgCn1JKmXurXHbsezY0hGJTHwGX4BjQjuoIlKEwDGmsYzL5i15ABA251mFnM/F2vH+7Bg88F76thvvr9z8AcdETS0K/iD/ksB8ZxEopC9i6hcNdAuenKzYJkq63wowtPUtjySJ+9HmTafzwh/C32D8JjP4hGOEB5/tikl6BzJK8t1EVuQUbVtVRzEzXD100iv3hD+XrdWYjIQ4Neis4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4851.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(66946007)(107886003)(6506007)(8936002)(6486002)(66556008)(8676002)(6666004)(31686004)(52116002)(36756003)(53546011)(66476007)(33964004)(966005)(31696002)(2616005)(508600001)(186003)(38350700002)(6916009)(83380400001)(166002)(316002)(5660300002)(4326008)(26005)(2906002)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cDBGWGJ2YTM0R2RYRUJOd0ZHdm9hanBqVWVpNVRPZ2tHbjdXZ1ErUktnM25a?=
 =?utf-8?B?ekNSZjFPSmNsRWgyMFdFWTFLb1hlVGlRSm9NeTVRK1lZNERuUkloeUhOMnNJ?=
 =?utf-8?B?T29YNmIzTEpHTmxxanh5bFNpZGt5dThkVXdkdTdtOVk2WDJWVVVSNlpTNCtU?=
 =?utf-8?B?QXhOMGtZSk5zVUQxY21DSTNGb0JZQTRsWTlKeERVSnoycXM4Z2F5NSt4R3o5?=
 =?utf-8?B?SURJK0Q2UCtURXFhSUpWbjNKaDZkdExzd1NHYk1QYzZ2ckRmdC8zTWQvL0xZ?=
 =?utf-8?B?bmRiME5uWm02MXEzbEtjOXN5ai9nZ3VFZzVTOVdkaWNwTFdPYTkrYmhGbWZX?=
 =?utf-8?B?eUVXOXFCcTlISlU5WWRROGN6cmdKd0E3TmVtRGxzMkpwRzdqdHAvS0k1Wnh5?=
 =?utf-8?B?ZlR2WUJlVXlObGJieFI4L3JIWWgyckRnS1pLckduZGVZT0IwaGhXUFV3aFpu?=
 =?utf-8?B?cnMwNW1RbTkvNVNqajlmY0dUd1JndURiR2FjSXpKb3FLTHF0OERJU1hSSldz?=
 =?utf-8?B?TmZFNjNwSktUYXRScXhMbW5SeXdKTmJWM1lwcXdjL1ZaQldOLzFJN3lLaDNV?=
 =?utf-8?B?V2c3Tnp3aTJzZW0yU3RUUGVkcFBQRFVmNEhJYzJuNDQwZm5CaVl1dHlIVWw3?=
 =?utf-8?B?OTI4b3B2YkJDcEdVbTNWVGp2QVdKeUI1YTNGTW4rZ2pnR2dRM25xRktRT1dR?=
 =?utf-8?B?Q21YUmtQblphTW91TzNLR2hYYVcyRS8zMmNyYndGQzZSYlJYbzRTME94dzMz?=
 =?utf-8?B?UkdZZ1NDOU1FeHJSOFFyTUtDZ1haaVVac1JXVlQwN1V1V3RuR2kwRDh4c05y?=
 =?utf-8?B?VHYxQnFTeHdsZ25aNGhmQmYzWWtmTWlwRWM1STV4eUNMdmZxWmRGS2ZoTlJW?=
 =?utf-8?B?TTN0NkhNWlV0Y1Zma1lQd3lJYzJ6cEJxMHlUeDh3MEdkaE5TallEa1JSalVj?=
 =?utf-8?B?N0pqUFVjMUxwVm9PWmpyb1pYdnhkQ2M2NkhkZERIeC9ENmxnaHV6VFVCaVcw?=
 =?utf-8?B?VE5BY2MyRHFzQ0MvOW00NlRGYy8zdXkxWjlUNERYcVhnRkZ5QjdXakRzaTJI?=
 =?utf-8?B?Qm1FZWpaZ3lvN0FIQUJUdUZhL05HaE5ROUFtR0hzdjR1MkxBdWFXT2cxb1g3?=
 =?utf-8?B?OUEydHZGZURPSVpUS1dYRVhKSFV2VDE0b3RaOW5IekxFYU9ZdE50bUJlbVY4?=
 =?utf-8?B?NmNEeXN0WW9QaDE3VWlQNnRFb0szMWp4TXB5OWRuRjNQQmo4YUZqWWtydW9U?=
 =?utf-8?B?YlltM1ZQYzliVnFKVWpKY29hMXZCNmhYOFdTdUpYT2tYQXBwSUFEdFc0TkJq?=
 =?utf-8?B?S3UwUFZicXBoczZYNW1HZTdnVlc1QUZJUk1XWTNhVVRIUmIxNDVRV0R3SVZs?=
 =?utf-8?B?eUM0TTBRdVBwV1MzTjJ3bWM0YVJ3M1FGd0Nya2lsQ2UyQkd6NUtaT0VmelRQ?=
 =?utf-8?B?dndMK3RwYU4yd3NnUUwvNEw5T1BFTG5DVnVnK1kwUjdiUHkrQmN3S0RZRjNE?=
 =?utf-8?B?QmRLSEtMNkpRZU1vRUpNeE9uL1dhaGU0U1VQcUlZbldWQ21pdk1UNTlZQUk4?=
 =?utf-8?B?aXZtUkRzaVJKUC8vM3NseFlPK2Z5SWx5RlhEYXB6T21JUGk0TmJFeFZpNkc4?=
 =?utf-8?B?eXljSGtEaGZoWHBaRWFpS1ZLYThabUhqS3dYdUMxU0FaWWFSTllVLzlxeVAx?=
 =?utf-8?B?QTBST1BkeFdML0hjUGdtTTZRMTJrWUZ5UmphR2QxQXkzdElSTEl6ZHI3TWdV?=
 =?utf-8?B?N1NsTzRrZ1M4RnVtaE9HTnl5ZEZ2WnhOL09qd0NZZHd3akV4UjBGdVBSZjNG?=
 =?utf-8?B?TFZrR29BZ1Q1M0Q2RHJkYlV4aTcvSVlXY1doYVo4Qkc0UlBFdTVmaXBjbVZG?=
 =?utf-8?B?Y0pHTTFvZ3E1RWxibE5KVjVGN0g5ZkgyNFA0bjNVZ0FpU3JoOENFckszNVh3?=
 =?utf-8?B?UDc1aHcwSFl4SnJCTGxCOElFTGJIOGs2b2ljQ25qNzdUK2ZBdVRaR0lXc00z?=
 =?utf-8?B?bHUzb09lYVpJSi9TSnhGYjNKczZmcTJrUmV4ODNWdWxyNzlTQ2I1a0R5UmNY?=
 =?utf-8?B?c3RwcnB6UGRaZGxUYVJ0UkVBSFg5V0pobUUrRTNTeEV2c0JlT2R0TkFLV1ha?=
 =?utf-8?B?bDE2Ukc0VGlxTFFML0VCNlZraEM2Z29zUlRybHJWaWhoYUREOUxqRWR3U3VQ?=
 =?utf-8?Q?dBrFXOlK1u2FtGUZk+JY2tI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5f9c41b4-3176-4c97-675b-08d9d1894b49
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4851.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 02:56:25.8161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mAqXIchYcbAQ5sWJtbFrOAY58PqNnbWB06+6GJhoRxVGEIczp8CZdDaVuo1Qv2t6RqMyNyxOI1MrZAQvNpUHkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5857
X-Proofpoint-GUID: 4VRMeEN5FurWHobB4TzumdBRI2u_LFyh
X-Proofpoint-ORIG-GUID: 4VRMeEN5FurWHobB4TzumdBRI2u_LFyh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_01,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201070018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 02:56:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160247

--------------5909B910BB6312FCF5CD61A3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/29/21 9:30 AM, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Backport patch to fix CVE-2021-4008 for xserver-xorg.
>
> CVE: CVE-2021-4008

Ping.

Kai

>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   .../xserver-xorg/CVE-2021-4008.patch          | 59 +++++++++++++++++++
>   .../xorg-xserver/xserver-xorg_1.20.10.bb      |  1 +
>   2 files changed, 60 insertions(+)
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4008.patch
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4008.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4008.patch
> new file mode 100644
> index 0000000000..3277be0185
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4008.patch
> @@ -0,0 +1,59 @@
> +Backport patch to fix CVE-2021-4008.
> +
> +CVE: CVE-2021-4008
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/ebce7e2]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +From ebce7e2d80e7c80e1dda60f2f0bc886f1106ba60 Mon Sep 17 00:00:00 2001
> +From: Povilas Kanapickas <povilas@radix.lt>
> +Date: Tue, 14 Dec 2021 15:00:03 +0200
> +Subject: [PATCH] render: Fix out of bounds access in
> + SProcRenderCompositeGlyphs()
> +
> +ZDI-CAN-14192, CVE-2021-4008
> +
> +This vulnerability was discovered and the fix was suggested by:
> +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
> +
> +Signed-off-by: Povilas Kanapickas <povilas@radix.lt>
> +---
> + render/render.c | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/render/render.c b/render/render.c
> +index c376090ca..456f156d4 100644
> +--- a/render/render.c
> ++++ b/render/render.c
> +@@ -2309,6 +2309,9 @@ SProcRenderCompositeGlyphs(ClientPtr client)
> +
> +         i = elt->len;
> +         if (i == 0xff) {
> ++            if (buffer + 4 > end) {
> ++                return BadLength;
> ++            }
> +             swapl((int *) buffer);
> +             buffer += 4;
> +         }
> +@@ -2319,12 +2322,18 @@ SProcRenderCompositeGlyphs(ClientPtr client)
> +                 buffer += i;
> +                 break;
> +             case 2:
> ++                if (buffer + i * 2 > end) {
> ++                    return BadLength;
> ++                }
> +                 while (i--) {
> +                     swaps((short *) buffer);
> +                     buffer += 2;
> +                 }
> +                 break;
> +             case 4:
> ++                if (buffer + i * 4 > end) {
> ++                    return BadLength;
> ++                }
> +                 while (i--) {
> +                     swapl((int *) buffer);
> +                     buffer += 4;
> +--
> +GitLab
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
> index e0551fa999..9a7aa1ed9a 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
> @@ -9,6 +9,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
>              file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch \
>              file://CVE-2021-3472.patch \
>              file://0001-hw-xwayland-Makefile.am-fix-build-without-glx.patch \
> +           file://CVE-2021-4008.patch \
>              "
>   SRC_URI[sha256sum] = "977420c082450dc808de301ef56af4856d653eea71519a973c3490a780cb7c99"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160043): https://lists.openembedded.org/g/openembedded-core/message/160043
> Mute This Topic: https://lists.openembedded.org/mt/88007524/3616933
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kai.kang@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Kai Kang
Wind River Linux


--------------5909B910BB6312FCF5CD61A3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12/29/21 9:30 AM, kai wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16C515AB4535CCA0.27787@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

Backport patch to fix CVE-2021-4008 for xserver-xorg.

CVE: CVE-2021-4008</pre>
    </blockquote>
    <p>Ping.</p>
    <p>Kai<br>
    </p>
    <blockquote type="cite" cite="mid:16C515AB4535CCA0.27787@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
---
 .../xserver-xorg/CVE-2021-4008.patch          | 59 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.10.bb      |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4008.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4008.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4008.patch
new file mode 100644
index 0000000000..3277be0185
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4008.patch
@@ -0,0 +1,59 @@
+Backport patch to fix CVE-2021-4008.
+
+CVE: CVE-2021-4008
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/xorg/xserver/-/commit/ebce7e2">https://gitlab.freedesktop.org/xorg/xserver/-/commit/ebce7e2</a>]
+
+Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
+
+From ebce7e2d80e7c80e1dda60f2f0bc886f1106ba60 Mon Sep 17 00:00:00 2001
+From: Povilas Kanapickas <a class="moz-txt-link-rfc2396E" href="mailto:povilas@radix.lt">&lt;povilas@radix.lt&gt;</a>
+Date: Tue, 14 Dec 2021 15:00:03 +0200
+Subject: [PATCH] render: Fix out of bounds access in
+ SProcRenderCompositeGlyphs()
+
+ZDI-CAN-14192, CVE-2021-4008
+
+This vulnerability was discovered and the fix was suggested by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Povilas Kanapickas <a class="moz-txt-link-rfc2396E" href="mailto:povilas@radix.lt">&lt;povilas@radix.lt&gt;</a>
+---
+ render/render.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/render/render.c b/render/render.c
+index c376090ca..456f156d4 100644
+--- a/render/render.c
++++ b/render/render.c
+@@ -2309,6 +2309,9 @@ SProcRenderCompositeGlyphs(ClientPtr client)
+ 
+         i = elt-&gt;len;
+         if (i == 0xff) {
++            if (buffer + 4 &gt; end) {
++                return BadLength;
++            }
+             swapl((int *) buffer);
+             buffer += 4;
+         }
+@@ -2319,12 +2322,18 @@ SProcRenderCompositeGlyphs(ClientPtr client)
+                 buffer += i;
+                 break;
+             case 2:
++                if (buffer + i * 2 &gt; end) {
++                    return BadLength;
++                }
+                 while (i--) {
+                     swaps((short *) buffer);
+                     buffer += 2;
+                 }
+                 break;
+             case 4:
++                if (buffer + i * 4 &gt; end) {
++                    return BadLength;
++                }
+                 while (i--) {
+                     swapl((int *) buffer);
+                     buffer += 4;
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
index e0551fa999..9a7aa1ed9a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
@@ -9,6 +9,7 @@ SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patfile://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch\file://CVE-2021-3472.patch\file://0001-hw-xwayland-Makefile.am-fix-build-without-glx.patch\+file://CVE-2021-4008.patch\">&quot;file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch \
            file://CVE-2021-3472.patch \
            file://0001-hw-xwayland-Makefile.am-fix-build-without-glx.patch \
+           file://CVE-2021-4008.patch \
            &quot;</a>
 SRC_URI[sha256sum] = &quot;977420c082450dc808de301ef56af4856d653eea71519a973c3490a780cb7c99&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#160043): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/160043">https://lists.openembedded.org/g/openembedded-core/message/160043</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/88007524/3616933">https://lists.openembedded.org/mt/88007524/3616933</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:kai.kang@windriver.com">kai.kang@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------5909B910BB6312FCF5CD61A3--

