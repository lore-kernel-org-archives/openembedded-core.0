Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B802FC4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 02:00:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.112695.1699495231943823364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 18:00:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DHnTHLUt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9677a88a23=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A90f2Ft008181
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Nov 2023 18:00:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=fiUsmcyDUTIwxl6zpaW
	yuMDBOW8KMqPr03fFAUpO8Ks=; b=DHnTHLUtRaYzoqdVdStG9GuMSgDpIR7R1qi
	Uh0YZwuEBohEHcr/cJobrirBqA12eC5Gclz71tHpAizWAXDyQmj64hoAqLGGQlYS
	PS9JhOKRcPUtwCqb99lrm8VQ2VA7TowhrWRfJbGaYVLh8MQqTWWV5lRaGAT9gZvb
	Co7EFN/wCr6HYWusiGF8AJFaMMhmbHJcT9nWUjI9K6totwvWKN95/gKYKAd3fjW/
	wRrn34l7l3uizVUUBcKoa2/RI0GAqitjs+JCU/t2lLYLdcbJnHDQlQieZwxkJSZB
	8m3DbpCzWDtfz5vtQgo8nTISXfk8N4fL8pDvvO3iDAkfZPEGd9A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w2t1d86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 18:00:31 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3A920UTP007176
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Nov 2023 18:00:30 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w2t1d84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Nov 2023 18:00:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wv45HeZoGRk5hGSeVF5xvbC0GFiFHP5r/O5Ddlln/+Vh08dvWWhOZwzUdxiyViH3TJhMeZtRT++JTQyQJc3Z1OtZuuJ7NjvuzjtTaH1UzRuWQuVN4AkIcy1E25G1XIXslAsDJNeBOgwqf0QDdzxknaE82MKv1CsSJLOcu56CT/iWmnJSKivIJdN13jOtxf3yGS9AtlgdUxSmxDJOCUVgAip5ixa+we8UN9C751cR396PrFD/VNeRCOnsOhWWwMm/Iccgt7ERVvMt8loriq8G3PbS+R32mU7LlNQgKxYtGJVNbIn3OyRVUEOH23IFCSFnZlreqeYPXbK25wJOS68IQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiUsmcyDUTIwxl6zpaWyuMDBOW8KMqPr03fFAUpO8Ks=;
 b=Um4wnlojdg29L0LT3z66VCMK3GtRQvPCtqxNcLNvlG0EV6cFRw7iDnPPFU0L1M6iEBmxtgYEJu38fGNyAZY1VpbOzWle7yG6nA/+hmDOfOcma1c9wZIDjmUKNT4zm260h/qeUjjc5Q0DNwU+v+Z4NhNiXKilBGS25EGKRk/WRixw6xL7FKpj9wSOKIMx5o+TXvm631Ee4Htd6bNC8gau1nX9EC6Wz21BaaeHkNo9Nq9CRSfBrhFoy0c+qmJniQ2x1KXEi5sC+bzmplDapm0gVOiaLZutOQALi8E6GsDH2dNP9lu7oFc+y/5SdpSfgZZYyC1RuIYxBVB7LaLbvNd/8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SA1PR11MB6568.namprd11.prod.outlook.com (2603:10b6:806:253::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 9 Nov
 2023 02:00:27 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::1452:e3f3:48cb:a128]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::1452:e3f3:48cb:a128%4]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 02:00:27 +0000
Content-Type: multipart/alternative;
 boundary="------------f08LDoMwDOD99v7DRd0GB5jw"
Message-ID: <94196e06-f078-4df5-afee-e29c05f11b37@windriver.com>
Date: Wed, 8 Nov 2023 21:00:23 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC 1/5] valgrind: make ptest depend on all components
Content-Language: en-CA
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: alex.kanavin@gmail.com
References: <1795D005C571B567.15940@lists.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <1795D005C571B567.15940@lists.openembedded.org>
X-ClientProxiedBy: BYAPR06CA0040.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::17) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SA1PR11MB6568:EE_
X-MS-Office365-Filtering-Correlation-Id: eb19516b-2ebd-436a-b33c-08dbe0c7a411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GCrzxYG6wKANE3+hMG5+xYCODSIj7JkTURMCghMlBYVS/rakANUok3e/dfsXG3V96l4kQcl2Eoekbq4ckdtAFZgJXNpc6XWBj9NLohFq5/XihQ3xnnN2553DqOeV4FcqC5EmpLWoqV8a5yL8Fq+3cSYxTNf6wZJQWyFBnCyKT9Vg5fzObvwYGlpu2Q6CWCIEfx9etyt8OxT74muGWwpG1yMDt4z7XBtLENKVA7znofaVbnXR7gIqcAwBbT0gv+8FMOcM+tI3QEmpU0plIVjyfZ7oo6ZOXKu2nrpWSmOh4iJHMCiezad/6/o77P4m9EJa/3FsAZnwJFHRfnC6IAsy0wn3GYL+Bc8A8D8KM/Ropu9zVfCAOAlmIPHCRcGq3I5x8f519A8k1gYJRidVjVA1kcF5sDlBTpWPPd/9n6QqY9VTK+iFVhQyKXZTs02kFg84rI8nfQx6LIH+eNv7hr+fAPHpje7hKEeZ6jZgJGtuReA6E/kF/2hBsacfMHuXTqC2/uCrTdfyp+zIyZSdKTYqn06aXNHe+CV1fS5Qfo9/ccbu7BQDzrigUWQk4EzEII/SB0XDDjNMdw2kay6a4KOfV8aBJtvDd0cyK1UwKd9S0e5I6iS0bruFK04uDqLpNnITKUrFQAKJZLKyD6cinnyFZg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(136003)(376002)(346002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(53546011)(6666004)(33964004)(478600001)(6486002)(6512007)(2616005)(966005)(6506007)(83380400001)(66946007)(2906002)(26005)(41300700001)(316002)(5660300002)(66476007)(8936002)(8676002)(4326008)(6916009)(36756003)(38100700002)(31696002)(166002)(86362001)(66556008)(66899024)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YTB6Q1hkUFJLSlIzalE3dForOG1rdVZ4bnYwTldiWE1Lb0FDc0dwUTRGeDhm?=
 =?utf-8?B?YW1waXg4S1RXY1FMdkpweVVBSHpjamdzdERkTzk5djVEU2U5TzlkYmR5Zkll?=
 =?utf-8?B?WHpNZS9NRWNHaE81YytpZU1mY1h6a1NTY3J5ZzRBYTNORHFwdDFNWFR1Zmdk?=
 =?utf-8?B?SStGRjhaSzhtTGxnQW5oYloycDdjM3hZRUxDbmlBTU9na20xbG1USEdCYUJi?=
 =?utf-8?B?bmVJREN4T2hORmhYeXk5aTZiU1YrTEJ3T3RIS2tRTkY0d29WbEVNdGI3L2dF?=
 =?utf-8?B?TmRWT2YwVGo2ZU1kS0NYbGxQYzZHR25zY2lQMU1zUVFTaWpLWGZIUkcybDFJ?=
 =?utf-8?B?cXJYcEg3ZDVxeGtIenRhL1NTRTkwM1UrazhhcmkxNEtBZzBDZUp5YThhMlBr?=
 =?utf-8?B?QUo4SjVvRkRWNnlXbjBnN2x0aGVzWGFvZVFlb0NhRjBLN2xTYVVYa1NiLzR0?=
 =?utf-8?B?YmU5SVdqVlhabFV4Z2VvSXBFeHpuQldGZzVTUzBFVWdyUEJXbkczaU9JN0I3?=
 =?utf-8?B?SVIvWXRUTDR6bG1VNGVlbnVYOVhLcjBGM0ZTbGxIY2IwY1k4UmswLzEzTnZT?=
 =?utf-8?B?Um1xZW5FUE9tNG42SXNxekhBMTFSK01kMi9ITjVNNU91bWVIa1d1aFpKenk5?=
 =?utf-8?B?VnFXRFFWSncxZFl5RGVnalk1REwzTXREV21FK0RyVU0zMk4ySG5jQ29lc0lJ?=
 =?utf-8?B?TGpxbWIvNFBreVVGK2psNTFXWWZQeVc0bnJCaU9Fb1licXp1bE8rUmNCRmlK?=
 =?utf-8?B?dk1iNFJDUE8xbnY2UDMxaVBjK0p5Y2lhK3Iyb2dXaDNhVGpLL0VjaDRmVXRu?=
 =?utf-8?B?c1lyOGJvMlR6OXMzWVdnT0pyeGlOYldQelNPZGR0dWNwSThweTN4UUJiV0Vm?=
 =?utf-8?B?Z1RUS0JNU1BTSnNxUldFaWUxSEdaWDZBdW5XaHloZ015L2QrK0E2MU9WNkVH?=
 =?utf-8?B?RSs2bG1UMlQ2R0ljTHFhelZNMk5QUFJOYlM2eEs2eEtGNzh1VTduYjlGTUFO?=
 =?utf-8?B?SUt4YnhMbG52a2pQTnRjdmV2VUZ0Y1pGKy9lUHk1SXdpQTdIV3RKZkFBR2VG?=
 =?utf-8?B?bXFTalBHUWNDVGR5RGtoTTRmRjBVdGJ5cUlVZ0EzOFQ4TTZDeDZpbVAvUjRZ?=
 =?utf-8?B?R0diMndFV3pEc0tSZGRvS1Z3VDgvWW5SQzc2NmZUSjNackhqeXZCYU9vRUFX?=
 =?utf-8?B?eFh1T2ozNkdHOTVGamdhS0V3MDNmcjFQZDVabFhWb3RhNkY1SmpvRFlQSjVP?=
 =?utf-8?B?S2FrZndaRmY2enZiQ2JLQmxCOEpQdm8xK3dDY3BmQjlaM0w2TGsrUnVkSC90?=
 =?utf-8?B?UWFzcG5tc2x0NWl6RExHakV2ME5EZTdRdG9MRkpyUEt2cktjODdTTVRHTHdR?=
 =?utf-8?B?UVV3WGRZc3Z2Zzd2d0RDU0pUMmVTS2dCd0JzRjg4U0d1NURQbFplNnAxY0JO?=
 =?utf-8?B?UWpSRk1OZXQvb01DalExMlRKcEc2U0ZTWTlHOGtvUnM3ZUNaYVdVdlFDZ04r?=
 =?utf-8?B?YmV3NWFWYlFNZ1FtZzk4aHd1bFZZQ252S0tMSmVWUDBwOFQvMlBOaFlNOFJT?=
 =?utf-8?B?amMvZHpjcWE1eW02V2dNaExMNWpnbUlOaEhVVDhQVy84eVBtVThUTFVZcWRk?=
 =?utf-8?B?dmFLQ0hDLzJkYVdMemFiRXdkSWcyd3l2WFN4RnVMakNucEF6NkluWlVwNTg0?=
 =?utf-8?B?dXBrbENQVXBzNm4rTWN1b2VwM1VPUGRjSkhTSHZYK0NwbXpGNVgrZnZzNUhu?=
 =?utf-8?B?V3dMK1Z6Z2tZU2tUS3grUXkxbDBJTVBwLzZJejk3TklJT1hEL0gzYTNIVmw1?=
 =?utf-8?B?Wk8zYUhtOXJHditRaXQyOE1QN1lMUlBoajRCY1ZnbENhTlRpOVlEbTN2b3pw?=
 =?utf-8?B?UzhvNjlhWElQdkV0dFkvQzFOZGxrdUMrTEtPRVNQakVybVo0YnRzbFltNUsw?=
 =?utf-8?B?dkdjUmhFUm0zekxYYkZTcVRKMmFEUUtmYUwwWjVRWGFhbXJ5cnFkSExMRThU?=
 =?utf-8?B?YTc0N2pCY25GL0NCVXBZTlN5YWl3aG92OFc0VUQ3SURjUS96a1g3SS9QeUxY?=
 =?utf-8?B?WmV6MmVmb3JNOTZmQzZDdk9Ea1FsQTgzYTlZekFTbm9ibTdjQVlJUktCM01w?=
 =?utf-8?B?STFWVjJCaHNzdTRkZEV3U2dRTTA5bFBWblZLcldjQkRSQk5EellwSW5tYzhM?=
 =?utf-8?B?U2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb19516b-2ebd-436a-b33c-08dbe0c7a411
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 02:00:26.0055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZKMFyUqoq9uvW4mAOkmH4hWpBZrEhvoNNl3wEcKPw8vn5kC+dzrFNmtut3gBEreFDbZXKE7Siwkqe2tj6vMNIrI5P6ccaWt3uew7cJrmUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6568
X-Proofpoint-GUID: kuqH2TbmHKJZoAgqXaj-xr8andniC6e1
X-Proofpoint-ORIG-GUID: HRqzISUOZkxjevbx1mJkufFoF6-xgxoQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_01,2023-11-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 mlxlogscore=841 impostorscore=0 clxscore=1015 phishscore=0 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311090013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 02:00:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190374

--------------f08LDoMwDOD99v7DRd0GB5jw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-08 8:25 p.m., Randy MacLeod via lists.openembedded.org wrote:
> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>
> When the helper scripts were split into separate packages, they
> weren't added as ptest dependencies. Fix that.

Well, this is embarrassing...

I'm no longer convinced that this is required.

I think I saw the ../cg_diff errors below:

PASS: memcheck/tests/vcpu_fbench
PASS: memcheck/tests/wcs
PASS: memcheck/tests/wcsncpy
PASS: memcheck/tests/wmemcmp
FAIL: memcheck/tests/wrap1
FAIL: memcheck/tests/wrap2
FAIL: memcheck/tests/wrap3
FAIL: memcheck/tests/wrap4
FAIL: memcheck/tests/wrap5
FAIL: memcheck/tests/wrap6
FAIL: memcheck/tests/wrap7
FAIL: memcheck/tests/wrap8
PASS: memcheck/tests/wrapmalloc
PASS: memcheck/tests/wrapmallocstatic
PASS: memcheck/tests/writev1
PASS: memcheck/tests/xml1
python3: can't open file 
'/usr/lib/valgrind/ptest/cachegrind/tests/../cg_diff': [Errno 2] No such 
file or directory
post check failed: python3 ../cg_diff --mod-funcname="s/main/MAIN/" 
ann1.cgout ann1b.cgout > ann-diff1.cgout && python3 ../cg_annotate 
--mod-filename="s/a.c/A.c/" --mod-funcname s/MAIN/Main/
PASS: cachegrind/tests/ann-diff1
python3: can't open file 
'/usr/lib/valgrind/ptest/cachegrind/tests/../cg_diff': [Errno 2] No such 
file or directory
post check failed: python3 ../cg_diff --mod-filename="s/.*aux\//aux\//i" 
--mod-funcname="s/(f[a-z]*)[0-9]/\1N/g" ann-diff2a.cgout 
ann-diff2b.cgout > ann-diff2c.cgout && python3 ../cg_annotat
PASS: cachegrind/tests/ann-diff2

and made an assumption that may not be valid. I think this problem is 
still present
even after this change.

As I said previously, I may not have time to get back to this until next 
week so
if anyone picks up this work, they might want to confirm that this is 
really required.

I should have just waited until I had time to complete the update before 
spamming the list.

../Randy

../Randy


>
> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
> ---
>   meta/recipes-devtools/valgrind/valgrind_3.21.0.bb | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
> index 68ab319a1b..a2feda6aae 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
> @@ -139,7 +139,9 @@ RDEPENDS:${PN}-ptest += " bash coreutils curl file \
>      perl-module-overloading perl-module-cwd perl-module-ipc-open3 \
>      perl-module-carp perl-module-symbol \
>      procps sed ${PN}-dbg ${PN}-src ${TCLIBC}-src gcc-runtime-dbg \
> -   util-linux-taskset"
> +   util-linux-taskset \
> +   ${PN}-cachegrind ${PN}-massif ${PN}-callgrind \
> +"
>   RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils glibc-gconv-utf-32"
>   
>   # One of the tests contains a bogus interpreter path on purpose.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190367):https://lists.openembedded.org/g/openembedded-core/message/190367
> Mute This Topic:https://lists.openembedded.org/mt/102477896/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------f08LDoMwDOD99v7DRd0GB5jw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-11-08 8:25 p.m., Randy MacLeod
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1795D005C571B567.15940@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

When the helper scripts were split into separate packages, they
weren't added as ptest dependencies. Fix that.</pre>
    </blockquote>
    <p>Well, this is embarrassing...<br>
    </p>
    <p>I'm no longer convinced that this is required.</p>
    <p>I think I saw the ../cg_diff errors below:<br>
      <br>
      PASS: memcheck/tests/vcpu_fbench <br>
      PASS: memcheck/tests/wcs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: memcheck/tests/wcsncpy&nbsp;&nbsp; &nbsp;<br>
      PASS: memcheck/tests/wmemcmp&nbsp;&nbsp; &nbsp;<br>
      FAIL: memcheck/tests/wrap1 &nbsp;<br>
      FAIL: memcheck/tests/wrap2&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      FAIL: memcheck/tests/wrap3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      FAIL: memcheck/tests/wrap4&nbsp;&nbsp;&nbsp; &nbsp;<br>
      FAIL: memcheck/tests/wrap5&nbsp;&nbsp; &nbsp;<br>
      FAIL: memcheck/tests/wrap6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      FAIL: memcheck/tests/wrap7&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      FAIL: memcheck/tests/wrap8&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: memcheck/tests/wrapmalloc&nbsp; &nbsp;<br>
      PASS: memcheck/tests/wrapmallocstatic<br>
      PASS: memcheck/tests/writev1&nbsp;&nbsp;&nbsp; &nbsp;<br>
      PASS: memcheck/tests/xml1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
      python3: can't open file
      '/usr/lib/valgrind/ptest/cachegrind/tests/../cg_diff': [Errno 2]
      No such file or directory<br>
      post check failed: python3 ../cg_diff
      --mod-funcname=&quot;s/main/MAIN/&quot; ann1.cgout ann1b.cgout &gt;
      ann-diff1.cgout &amp;&amp; python3 ../cg_annotate
      --mod-filename=&quot;s/a.c/A.c/&quot; --mod-funcname s/MAIN/Main/<br>
      PASS: cachegrind/tests/ann-diff1<br>
      python3: can't open file
      '/usr/lib/valgrind/ptest/cachegrind/tests/../cg_diff': [Errno 2]
      No such file or directory<br>
      post check failed: python3 ../cg_diff
      --mod-filename=&quot;s/.*aux\//aux\//i&quot;
      --mod-funcname=&quot;s/(f[a-z]*)[0-9]/\1N/g&quot; ann-diff2a.cgout
      ann-diff2b.cgout &gt; ann-diff2c.cgout &amp;&amp; python3
      ../cg_annotat<br>
      PASS: cachegrind/tests/ann-diff2</p>
    <p>and made an assumption that may not be valid. I think this
      problem is still present<br>
      even after this change.<br>
      <br>
      As I said previously, I may not have time to get back to this
      until next week so<br>
      if anyone picks up this work, they might want to confirm that this
      is really required.</p>
    <p>I should have just waited until I had time to complete the update
      before spamming the list.</p>
    <p>../Randy<br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:1795D005C571B567.15940@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
---
 meta/recipes-devtools/valgrind/valgrind_3.21.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
index 68ab319a1b..a2feda6aae 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
@@ -139,7 +139,9 @@ RDEPENDS:${PN}-ptest += &quot; bash coreutils curl file \
    perl-module-overloading perl-module-cwd perl-module-ipc-open3 \
    perl-module-carp perl-module-symbol \
    procps sed ${PN}-dbg ${PN}-src ${TCLIBC}-src gcc-runtime-dbg \
-   util-linux-taskset&quot;
+   util-linux-taskset \
+   ${PN}-cachegrind ${PN}-massif ${PN}-callgrind \
+&quot;
 RDEPENDS:${PN}-ptest:append:libc-glibc = &quot; glibc-utils glibc-gconv-utf-32&quot;
 
 # One of the tests contains a bogus interpreter path on purpose.
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#190367): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/190367">https://lists.openembedded.org/g/openembedded-core/message/190367</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/102477896/3616765">https://lists.openembedded.org/mt/102477896/3616765</a>
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

--------------f08LDoMwDOD99v7DRd0GB5jw--

