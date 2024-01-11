Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A73C47073
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 00:56:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.974.1704934570625994971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 16:56:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=au+qVvS7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17401cb73c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40B0bXIK009217
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 00:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=c6r6MRQQA6hb+Ajhtzv
	o8qIwborixCmywMpxMTKOS04=; b=au+qVvS7w/EFJEgKMnJPN7eMXNYkAeitMZl
	ABOrMY2W4YM+wuM9WYcSgAsoakW6PkQGih4qLvWl4BNMBWhJIL5V7WIO+S1NrxrV
	jw27KoSQfRyYT42EQ82uB7yCkhQOFH9ZvguC2mlVHXG1wlmg6GqMvsHm++UM8tDS
	SanZpe8RSsfoU8RByYpV2JD9D56G2weSFmhElMWROAbtS0dEg5/LRoTMBtihLmbm
	FYu2vQStdLUJDthzC+iDtl4o1mqfPrIKd4CvVoXKsz0ZdELjxH+WopFKDOVFh6Uo
	FzgwGFsdw9AsjH/IrsHD+npaScPjcDL4VBTfNs6E2wNPpCAPxJg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vewekd878-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 00:56:09 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40B0u9w9030120
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 00:56:09 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vewekd876-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 00:56:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YuDt0XfFrKHxQW5ey4xIV53HYW1N6k+QVo3hxFumGnrpBluatGKgsUObNU5W2EWEOihhFNv/RxA0z74fNWrc05b9MdmSdcqA9jwuyDHFdgs8P4Ey6s2wO262qspEpaYO4ozTkMjcHbatWpkuvPBPdwJ79DyMcshUfciLeu/nZ7RmKZhmGZZWl0ZYvbpnZzV1lq74uJAuz6Hb8w5CZzGWL+JgEU5l0jybrQTlH6VHD32LiBVO1jUyeteHbIip68Y7zDMZE2Vdu/l4hVtk/V300m0+vvnaek9+ikjmyNIvkyGFGj795f2P8IEmMG9B9IFnE7J+4QgOfAiArqxRmfBY5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6r6MRQQA6hb+Ajhtzvo8qIwborixCmywMpxMTKOS04=;
 b=OdoCLciIpoZiFTLzkPyNE8sWXyNa6Htd1EE3TnlQsKZc6AozSY8dtW5vNW4EhhBeKCTWdc5I81hg/ky0KsKruKPfiLCM6fSwDMWFlUVK27aytkucPMW/G1AkRggY3UHZFdlaBLHaT20jF0+1o1Fk3iXhN7cgT4H1oPrVr33KR8y44jTnfdX1dsNvRZ/45BY7amBNMze9n9s9f/ZedQ8JD6z45Bwy79fxGyFq59Tu22maVpYCuFJaCd5cZPFpNTBz77jg88u2l/uzqm9dzHoMpwEOoCKv0IV8mIfx7arRv8FK6tISQNEXIgjN33hOzc24Y2jSht0eHO2BNI4JRSz0jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by DM6PR11MB4708.namprd11.prod.outlook.com (2603:10b6:5:28f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Thu, 11 Jan
 2024 00:56:04 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7159.020; Thu, 11 Jan 2024
 00:56:04 +0000
Content-Type: multipart/alternative;
 boundary="------------MrFdaKdZrQuiGcnVh9jqgd0j"
Message-ID: <8bb0d710-5391-4731-bc39-e4acf8c799fe@windriver.com>
Date: Wed, 10 Jan 2024 19:56:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [kirkstone][PATCH] gdb [V2]: Fix CVE-2023-39130
Content-Language: en-CA
To: sanjana.venkatesh@windriver.com, openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
References: <20240109111719.3908417-1-sanjana.venkatesh@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20240109111719.3908417-1-sanjana.venkatesh@windriver.com>
X-ClientProxiedBy: BY5PR17CA0047.namprd17.prod.outlook.com
 (2603:10b6:a03:167::24) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|DM6PR11MB4708:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fabea74-3d8d-45ee-9c75-08dc1240165b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AoTUqCz+gtsF4wrjZOH+a5P/Hish38Fu+u3w36OaBgwPrx76IG87lCHhXcE1dugza0UmRVhMhMLHL+OD8l15vchP6b/zUpXKVDAzfl0UHrGEBxZCFOR+kfjR47KGf4xoHMkistmhOQ7MDcT7yOsLqbh+ol8QNR56cOM/wjik2tcA8gJZ0rQe8DtWSDtkvikmjSfC2t7aHj0CQi0OGNyeN0YGIFNZrYPzNyrSgohD8ZEsg1IZRnoyqhT7wS+ebntlIb40jqm6/3Q4VNPDcPTeYnlRz0piovRFfT5jTUPmFYPghKCI/qrV5GDItcLLbfgHn0AyqOOhbQs3Wd4YchiyFIKbygzcrZpIXdgV3fFeWf6JVDHW4BfEfpAGxtQRGmxA+KPOX9AXvgpXwxqDCtsJ4jMzy0uLM/2+qRa4m5hyNsC9QE3eGGmZZShDXD7b2g+rGFysjH0h4q9jtMEVKV0mxX8EpWzEzihqWwsBTTeMk0ujmU6OVenwuu2GTER6MuaYeyrfG/1fwfEIo4DhBfO1btT8issLoxFdsduhZH46w4ggrEIp4fNvKYy1q1R2WNRm/5udIMtcx3z3u0Vgm97h1srrQl3EDIG7K8yhIdilTyEhcnomsTNlAt2AArpik13Av+hNb2XaevJLdvGpSA4Ll2mRL5jzFRcNzUd54BlIQ4XezMNsHG+3nb5MrPFQ5wJ+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(396003)(136003)(39850400004)(230173577357003)(230922051799003)(230273577357003)(1800799012)(186009)(451199024)(64100799003)(31686004)(36756003)(6486002)(53546011)(33964004)(6506007)(66556008)(66946007)(6512007)(31696002)(86362001)(478600001)(66476007)(83380400001)(38100700002)(2616005)(166002)(26005)(107886003)(2906002)(316002)(5660300002)(6916009)(4326008)(6666004)(41300700001)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZWpCSU5KYlFEVTlBS2JHdVJYVVovOG1EbDhBMi84aGJhTHVMeGlPNlZmNk4w?=
 =?utf-8?B?bWZHdU1vME8waWFhU2g0SkJtMXZMOXd1b0pPTnEvZnVSUTNDa0xQQWlHNHZI?=
 =?utf-8?B?WTQvRWtzRDBWL0VtQU5mZ2pNdXRScHZaSW56Y3ZOc0JIMkRxWHdPZkM4Mlkr?=
 =?utf-8?B?THFWTmlqOHl0cFJ6L0hlbTE1eW92MzFVZEhKa0xWM3RSS2s1bWE3QTlKZTZX?=
 =?utf-8?B?a1hxdnJyYXYyQXRrMm9HQlkwTGZpNysrUXM2NXJKdk50RG1qMjFKQVUwbDcv?=
 =?utf-8?B?ZGVkMDBaMmttOTFtMS9peG82M1VwWklGWGJBV2RMNVVHYlRtV3VDdnFIa0hv?=
 =?utf-8?B?MkdxSjhobXdGbEt1aCs2WFZOTnUvazhPUi9IQUxqOWYzeVRoQndDYkhiQnh5?=
 =?utf-8?B?aDUyS0prcFdyQWlzTjR4dm1ObWdaQUJ2M25yNHd5QVp1M2Q2b2QyaEUvSmY2?=
 =?utf-8?B?OEdnWVZYeVQ2SmdTeG9FdkxWUHlNOEVZU05raXN5djBQVGtRV0lvdzdOamZo?=
 =?utf-8?B?STQzWGZCRlFkUGEycThZK0xQREtndGJKNS9iZDRpZktqYVViWW5vbk1ablAz?=
 =?utf-8?B?VDMvUmFpQmoyQjQwalJCK2NKMDBrV1hqWWw3MzJLSjhKS2IvYk4xQVpZWVQw?=
 =?utf-8?B?VlJDQnpaNUovc01YVWhDZzlOVndDQ0xVcG9jUUJtSHQrL1NLNWN2NlN0VVFE?=
 =?utf-8?B?bHJQbUljNVEwLzdweEM2UlFZcHd3cXNvS211MGFnbzZaNmZ0M2tpMExTVDk1?=
 =?utf-8?B?ZmVTY0RubnpYbG1FVDJ2VnNHOXd6dDltTURTRnlXRkVlMXhtM3ZJOHliOGlS?=
 =?utf-8?B?cjUvYXFqWWVDZ1pGY2RCZE1icUx1ZlNzMzRmcEM3M2lJMnBsWmZNWldXWFh2?=
 =?utf-8?B?RS9yZmNRUVdtRWhIekFFVmk3L0w0anhxOUNPb0ZXUnZGVFFxRkU5VEhSKytL?=
 =?utf-8?B?V2hJVmdFcVdUL2dpSjQzNnpvQlhiMy9ab01TTXorcUVaVHRWaXB4L0svSXJm?=
 =?utf-8?B?Z3ArM1k2K2ViclpCTXk5ek9DVVE5S0xqTVFhQjM1a1JFdFpjUXNRSTBFNTBx?=
 =?utf-8?B?WnhEVDdzdkZPQmdleVJLYUc5SzliSnBsL0tEQ2RkaHk5cFJ4ZjRHUFgwRUJC?=
 =?utf-8?B?K0JPR0l6Q2QxMTNBTU02dzRRT25RQnBlSWtBbjFrUDhldHlPNkRzb0hOeEJh?=
 =?utf-8?B?SHZKUmNKWGRQQUNSMWFFQlgwZEgxa2ptR2ZEK21tVWFXSHBwN015a2liZ1pO?=
 =?utf-8?B?NVg4N0lTTUZyMkdCNE1HakxEbkhWdDE1aFNHZEsyeGI3SnFYd2U3TmtYT2Iz?=
 =?utf-8?B?UWw5ZUtBcFp4QTE4c2tTQzFTQ0FNZzZwZEtRV0JSaExCZWFOZGpmbXE3SmQy?=
 =?utf-8?B?TFdicWh6T0tHYlhrdjZPQVlueWcyYlpEZkFhQTZTSHZGVEtNMFlKajlRWWdl?=
 =?utf-8?B?eTc3VnRIRjhTZGZMc1k1NENoQjBvc0xyLytpamk1VFFqZHAyNEQrS0xUSTlK?=
 =?utf-8?B?L0NlWTBsbGZNamRYcU15MUFOTUszTFRsU3FVRVY2QU1NTkhNQXNVMEplb1VN?=
 =?utf-8?B?RXBMN3haMGlWKzVIeHY2Znl2MEc0cHdrajI1QUQwWWRaUnExdi9OSzhCSGJy?=
 =?utf-8?B?ODR0WkpxeTI0SkZ5T0JKYzA1UDdHS0x6Szk3NjUyU01aWlBDejFsYWtZRDBB?=
 =?utf-8?B?aHhLd04reU1saUFpTklmTUVRc1I3UkNFYXpyZjQ3elFvc0QvZSs4MEVXYlpT?=
 =?utf-8?B?R3JKRENmREg4QTYyV0cvd3l6N1FEd1g5YlZ4SmszTWdZOHlJZzByUE9tc0sw?=
 =?utf-8?B?dEFuRTNKMXR3eUJ0ZTN4Z082MEx0QzFLekt3WTIyN094a3UwaUtwOGJxVU1L?=
 =?utf-8?B?aDgrOGZqZDRCNDFQaTVlWWZOeENjQWpiVXZkd0NXUE00TmFRVWNFN2R6OGJY?=
 =?utf-8?B?TDJtT1FQanRtbGZ2cWNETGJjVWp2bFFtcTFTTzlmSzhiaU1WK3JZMHdUd2Zn?=
 =?utf-8?B?SGpiZDgrY3RRaVdpWnFTN3JjVDcyNkNFb2pUWFM2NzZKRkM3M1hrWTU3LytT?=
 =?utf-8?B?V1FQMzYzTllxTS82a3dHVVp3UXBsYS9TcnFlK3MyZnBIc1piSkRjdlBvM25D?=
 =?utf-8?B?RmNKY0g4RHR0UWtsTG1PQndOS2NoL0cwa2hDUndmdnpqSlowOUJqYWFLOWxu?=
 =?utf-8?B?ZlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fabea74-3d8d-45ee-9c75-08dc1240165b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 00:56:04.3718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IBGVqaK5rMNVcG8vn+dLfQWyomvjpqi+hkCAphZLmqLIXczWsD6k2l6lRFr77RBYgM/gK3ocQCqT7c+qTbjOltPU8KXHpwkoxyM1JXdQmvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4708
X-Proofpoint-GUID: hpsKgWhdYj2Sq7B1jmGTsyoM6Itc4Beo
X-Proofpoint-ORIG-GUID: 1VDfIX1LbMpFx9-8QgpoRHlDUpwfah3k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401110006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 00:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193532

--------------MrFdaKdZrQuiGcnVh9jqgd0j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40B0bXIK009217

On 2024-01-09 6:17 a.m., sanjana.venkatesh@windriver.com wrote:
> From: Sanjana<sanjana.venkatesh@windriver.com>
>
> Issue: LIN1022-4855
>
> Signed-off-by: Sanjana<sanjana.venkatesh@windriver.com>
> ---
>   meta/recipes-devtools/gdb/gdb.inc             |   1 +
>   .../gdb/gdb/0013-CVE-2023-39130.patch         | 326 +++++++++++++++++=
+
>   2 files changed, 327 insertions(+)
>   create mode 100644 meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.=
patch
>
> diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/=
gdb/gdb.inc
> index 099bd2d8f5..62b813d5cb 100644
> --- a/meta/recipes-devtools/gdb/gdb.inc
> +++ b/meta/recipes-devtools/gdb/gdb.inc
> @@ -15,5 +15,6 @@ SRC_URI =3D "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
>              file://0009-Fix-invalid-sigprocmask-call.patch  \
>              file://0010-gdbserver-ctrl-c-handling.patch  \
>              file://0011-CVE-2023-39128.patch  \
> +file://0013-CVE-2023-39130.patch  \
>              "
>   SRC_URI[sha256sum] =3D "1497c36a71881b8671a9a84a0ee40faab788ca30d7ba1=
9d8463c3cc787152e32"
> diff --git a/meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch b/=
meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch
> new file mode 100644
> index 0000000000..c659f8a08c
> --- /dev/null
> +++ b/meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch
> @@ -0,0 +1,326 @@
> +From 2db20b97f1dc3e5dce3d6ed74a8a62f0dede8c80 Mon Sep 17 00:00:00 2001
> +From: Alan Modra<amodra@gmail.com>
> +Date: Wed, 9 Aug 2023 09:58:36 +0930
> +Subject: [PATCH] gdb: warn unused result for bfd IO functions
> +
> +This fixes the compilation warnings introduced by my bfdio.c patch.
> +
> +The removed bfd_seeks in coff_symfile_read date back to 1994, commit
> +7f4c859520, prior to which the file used stdio rather than bfd to read
> +symbols.  Since it now uses bfd to read the file there should be no
> +need to synchronise to bfd's idea of the file position.  I also fixed
> +a potential uninitialised memory access.
> +
> +Approved-By: Andrew Burgess<aburgess@redhat.com>
> +
> +Upstream-Status: Backport from [https://sourceware.org/git/?p=3Dbinuti=
ls-gdb.git;a=3Dcommitdiff;h=3D2db20b97f1dc3e5dce3d6ed74a8a62f0dede8c80]
> +CVE: CVE-2023-39130
> +Signed-off-by: Sanjana Venkatesh<sanjana.venkatesh@windriver.com>

Hi Sanjana,

I was looking in the gdb git repo to see if you had to adjust the commit=20
at all
since it's a fairly large patch. It seems you didn't change anything=20
which is good!

but...

I think you need this follow-up commit:

commit ec2479e820c32ef443382a622a1d555a71730f64
Author: Alan Modra <amodra@gmail.com>
Date:=C2=A0=C2=A0 Sat Aug 12 19:26:12 2023

 =C2=A0=C2=A0=C2=A0 Re: gdb: warn unused result for bfd IO functions

 =C2=A0=C2=A0=C2=A0 Add a missing return statement.

It would be nice to be able to test that these toolchain changes don't=20
cause any regressions.

The code here is only "Used as a last resort if no debugging symbols=20
recognized." so that's a bit of a challenge. What runtime testing, if=20
any, did you do so far? Do you know or can you easily determine if any=20
of the tests in gdb cover the code that changed here?

It looks like Steve already has your patch in his queue so unless he=20
says otherwise, just send a commit to add the patch above.


../Randy


--------------MrFdaKdZrQuiGcnVh9jqgd0j
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-01-09 6:17 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:sanjana.venkatesh@windriver.com">sanjana.venkatesh@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240109111719.3908417-1-sanjana.venkatesh@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Sanjana <a class="moz-txt-link-rfc2396E" href="mailto:sanjana.venkatesh@windriver.com">&lt;sanjana.venkatesh@windriver.com&gt;</a>

Issue: LIN1022-4855

Signed-off-by: Sanjana <a class="moz-txt-link-rfc2396E" href="mailto:sanjana.venkatesh@windriver.com">&lt;sanjana.venkatesh@windriver.com&gt;</a>
---
 meta/recipes-devtools/gdb/gdb.inc             |   1 +
 .../gdb/gdb/0013-CVE-2023-39130.patch         | 326 ++++++++++++++++++
 2 files changed, 327 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 099bd2d8f5..62b813d5cb 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -15,5 +15,6 @@ SRC_URI = &quot;${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            <a class="moz-txt-link-freetext" href="file://0009-Fix-invalid-sigprocmask-call.patch">file://0009-Fix-invalid-sigprocmask-call.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0010-gdbserver-ctrl-c-handling.patch">file://0010-gdbserver-ctrl-c-handling.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0011-CVE-2023-39128.patch">file://0011-CVE-2023-39128.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0013-CVE-2023-39130.patch">file://0013-CVE-2023-39130.patch</a> \
            &quot;
 SRC_URI[sha256sum] = &quot;1497c36a71881b8671a9a84a0ee40faab788ca30d7ba19d8463c3cc787152e32&quot;
diff --git a/meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch b/meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch
new file mode 100644
index 0000000000..c659f8a08c
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch
@@ -0,0 +1,326 @@
+From 2db20b97f1dc3e5dce3d6ed74a8a62f0dede8c80 Mon Sep 17 00:00:00 2001
+From: Alan Modra <a class="moz-txt-link-rfc2396E" href="mailto:amodra@gmail.com">&lt;amodra@gmail.com&gt;</a>
+Date: Wed, 9 Aug 2023 09:58:36 +0930
+Subject: [PATCH] gdb: warn unused result for bfd IO functions
+
+This fixes the compilation warnings introduced by my bfdio.c patch.
+
+The removed bfd_seeks in coff_symfile_read date back to 1994, commit
+7f4c859520, prior to which the file used stdio rather than bfd to read
+symbols.  Since it now uses bfd to read the file there should be no
+need to synchronise to bfd's idea of the file position.  I also fixed
+a potential uninitialised memory access.
+
+Approved-By: Andrew Burgess <a class="moz-txt-link-rfc2396E" href="mailto:aburgess@redhat.com">&lt;aburgess@redhat.com&gt;</a></pre>
    </blockquote>
    <blockquote type="cite" cite="mid:20240109111719.3908417-1-sanjana.venkatesh@windriver.com">
      <pre class="moz-quote-pre" wrap="">
+
+Upstream-Status: Backport from [<a class="moz-txt-link-freetext" href="https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=2db20b97f1dc3e5dce3d6ed74a8a62f0dede8c80">https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=2db20b97f1dc3e5dce3d6ed74a8a62f0dede8c80</a>]
+CVE: CVE-2023-39130
+Signed-off-by: Sanjana Venkatesh <a class="moz-txt-link-rfc2396E" href="mailto:sanjana.venkatesh@windriver.com">&lt;sanjana.venkatesh@windriver.com&gt;</a></pre>
    </blockquote>
    <p>Hi <span style="white-space: pre-wrap">Sanjana,</span></p>
    <p>I was looking in the gdb git repo to see if you had to adjust the
      commit at all<br>
      since it's a fairly large patch. It seems you didn't change
      anything which is good!</p>
    <p>but...</p>
    <p>I think you need this follow-up commit:<br>
    </p>
    <p>commit ec2479e820c32ef443382a622a1d555a71730f64<br>
      Author: Alan Modra <a class="moz-txt-link-rfc2396E" href="mailto:amodra@gmail.com">&lt;amodra@gmail.com&gt;</a><br>
      Date:&nbsp;&nbsp; Sat Aug 12 19:26:12 2023<br>
      <br>
      &nbsp;&nbsp;&nbsp; Re: gdb: warn unused result for bfd IO functions<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; Add a missing return statement.<br>
    </p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">It would be nice to be able to test that these toolchain changes don't cause any regressions.
</span></p>
    <p><span style="white-space: pre-wrap">The code here is only &quot;Used as a last resort if no debugging symbols recognized.&quot;
so that's a bit of a challenge. What runtime testing, if any, did you do so far?
Do you know or can you easily determine if any of the tests in gdb cover the code that changed here?
</span></p>
    <p><span style="white-space: pre-wrap">It looks like Steve already has your patch in his queue so unless he says otherwise,
just send a commit to add the patch above.
</span></p>
    <br>
    <p><span style="white-space: pre-wrap">../Randy
</span></p>
    <br>
  </body>
</html>

--------------MrFdaKdZrQuiGcnVh9jqgd0j--

