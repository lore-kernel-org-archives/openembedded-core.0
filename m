Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A8DC63700
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8529.1650465348372225590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=V/TGY0th;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1109983ce3=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23KE0Q41030994
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Apr 2022 14:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=yQ3ljSGcYthjkcnHtKQzYbThH0rOtyCnhEJ6Dfetqgo=;
 b=V/TGY0thDY5sWD6A6e91kwU8uz3ZxWhYoO0tj+k/NNj9dAg9bnoGdFihpBAzXeVZVQbR
 q8SUYgJoqHyZG71sw2ERhYJAXTLKJ6SibMyL9O2o5xrDjefpMftKqRZ2UMlok+qupVQ0
 TBJFBpWtNhsF8ZUVUjRDritFlRNeVwYUIuhyqCyGE7lmpnvK81pU+yBWqPNHd0ZRkPp7
 3l4y/Vk0po8qhOjNNPPA/QPj6I7rLhYWNbbdWxAw+BlTiZ7mkyM43dftclb1MvvYsoKn
 g4od3Rzcg2thvjXs0gcOZkN1Ln0fjJm64K0u7zeZxmU621vaxR+M+zDOHTZay7ZegXbY 2Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffpqn30vw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 14:35:47 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23KEZk2W002832
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Apr 2022 14:35:46 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2046.outbound.protection.outlook.com [104.47.74.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffpqn30vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Apr 2022 14:35:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWInbYUPa8O/UnW2Dbyy+anjhizJqzY248jf6NYvQuVAGy9I8Zub6wpmNqu+pq43nesmgvty98BvfIDlUGv53aXzlFbiQFEPC786iLTCRJnl9ZZBTDOIoJ3NYl031mUUk7FqA0LSqxrnjMOH1eQ7zBeenDF+K5VGaTyyuhvuIBkHN8LF4IBf2td9p0841Uvd7CB3OeK7nSozG2BVoTpX76487CGYfp0ue284KKkaRTIt8eXZ53RuU2VFnqUBhrVYt3lDURNjt4CIAYt8O0Db3zzSMFI40oJCPIduwZbJxTeSgCq8y3wMOcp97C3BT9g2xCmR43Zgv9Svhn/E6s2/wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQ3ljSGcYthjkcnHtKQzYbThH0rOtyCnhEJ6Dfetqgo=;
 b=MDd234EHNkCVQTxIR4J03TuU4Y3IQARQLqMGyka9bI2wijO3bkuUgfusoQIFUVJ/Yf6etQStT+iyPczaIMdp29+yq9E7+moyKPoTOskxLoHE2wCPTZ1I/qEhplF1zpr0d4jq8wt+S95VLqm2fBYRtNpq4Zh9mpjhkWU1R/tUUNkwLF31CRNeIesps8sV190FFa1rlD/JCAmK6WuxotfKyVKOg/DiAGPagOw3jigezjwaAwZJtbu09Dl75G5pKjCeLPZdBYdm80Y74NJlkeLMscsqR5mm3HqqFm07Zilie0vO8UEXfCkP9Wlxgpe7Iokqmjh/9rXFie6wWqBw3Z5OmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BN8PR11MB3619.namprd11.prod.outlook.com (2603:10b6:408:85::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 14:35:43 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::4529:9749:17c6:d1c2]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::4529:9749:17c6:d1c2%7]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 14:35:43 +0000
Message-ID: <3fbc21f8-da33-55f5-587a-aadbe34e8678@windriver.com>
Date: Wed, 20 Apr 2022 10:35:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [hardknott][PATCH] glibc: upgrade glibc-2.33 to latest
 version
Content-Language: en-CA
To: Pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com, rwmacleod@gmail.com, umesh.kalappa0@gmail.com
References: <20220130062039.151292-1-pgowda.cve@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220130062039.151292-1-pgowda.cve@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BYAPR08CA0031.namprd08.prod.outlook.com
 (2603:10b6:a03:100::44) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8afbd44-aea8-4d54-0aed-08da22db0cad
X-MS-TrafficTypeDiagnostic: BN8PR11MB3619:EE_
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB3619ABAC393E165EEDD28784F8F59@BN8PR11MB3619.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Zg+BJpcSdKlhAbGL5jXqS8X0SvndICBky2+SWN8saBkkcukpY+YEhxBcIZd+xdOeWyIUsR9MDAlcf9JL+BSqikCmRmHKqsKZT/j9J+5HsjT7ED1z59TP+FVod4JwECarM6h+68m2r6ZvbySjQ7ryBwKa8umIL+x90K9TEe/eLA02jZ4YSJwUN4KPRORH7KwL4qxRKF+OK6XtRL4V+P0MVySJK6c5tL/mB11MHyrpOkWz294RPIDYEZ2fwXGyEbifIhSVZ52hXMxxP6WMLHAODE1Jt4xjKCtLnnGg0XwL/ZYayPAPLuIg4wQhf9hWgJgQi9WbahNUbPk8Z1iZYvbaTAfTaxjxKMwVcTFS7MI/EIA+v+LgcN6RnIXq0NKq7oZhZ3aJoga3B9lfZ6cuKC73sozuXghwgLDa0q4v/5AWcn4FTqw4KqrNOvEZjnvZ06Hxc7VitUCefqRaJ5/mhtaeFJU0XHLDxCP8BvqW46qIFcyYJEarJKMmNYFgU8YnTR/LFeCa2jdvv4vEhJRgrVcR4s0T6gsRkJefNsTmmSelQOY8EEXFtf60SRsQx17f05qAJNml+/rGGFnsRAYT6LeKm47Syt9r+MfuTSNoPdPusOCVU2wq0K8zNz+slLEAAS5tI0JltfhgdWTjBtQDwJOI7KnkJmv1vfKa+Becqjs7njblMPYWVb7r6t+r9tdLvQI8h5XFkP4a/YajSLUGsQAchT9bbc8obO9o6IYd6GGtdZyLxJUe8tvRv373B4TvDk8+6fV3K+MLojNWl0Bbiz5+NwnTsNsGyq3IMKSOA9MMu2PoYf4vfnKbUdarhVWirDvpGneYzMbjk6knfin1ofXmiycfE3n90DpZlwGHAgaU1UwCcR/FsT3sQeRA277KqKzP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(6666004)(86362001)(31696002)(6506007)(2616005)(52116002)(53546011)(316002)(8676002)(66946007)(66556008)(66476007)(508600001)(6486002)(966005)(83380400001)(186003)(26005)(38100700002)(38350700002)(4326008)(2906002)(31686004)(36756003)(4001150100001)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TUhPR1JXM0FVUkt1WDVZL2V2WTJZMnAxUWNQT0NXN0VNa3cxK1pyeUpGT3Qy?=
 =?utf-8?B?cFExQVRIaFkycnZuSi9wM1UxMjErcGVjSXQ3MFl2bGRJa2pJcExpTnRJUHVX?=
 =?utf-8?B?ck02SmZCMWlaNzdaVmpreG1sWSs0NG1Dc2dCR0RjS1UwMVV0eVBQOGNndEpF?=
 =?utf-8?B?ejZGdHhxd3ZjUzVMRHhTelNMM1JoNnFaeDVnYTV1Q0JENWNEL0x1RkZTV0hC?=
 =?utf-8?B?dGxHTThCaWg4MUZadXdGUmxYVytsUWpsbFZCcHVUTk9JMGN0Ti9kQUgrVU1I?=
 =?utf-8?B?Sk53UkFoRVl0TkpOR20vM3dGSi8yL2pQckpja3AzbndxSXBZMGZVSk1udXJm?=
 =?utf-8?B?QzYzMVN0bUZXcTFSVU15LzRzY3cyY3V0K1BYb2E2TEFsaTZtWkdiLzUyUytT?=
 =?utf-8?B?TmtpbGRuQnFaOEF4bWZsWWdDUmVSNnVWc3N2MExkbk03VWNXRjJRREFCSEdV?=
 =?utf-8?B?NjlRSGdHSlZOUUJEMEJOY1lQZ09aYXFTbkw0OUNicG9uZzIxT1pJWktpVHl0?=
 =?utf-8?B?eEw0L2hiN0trY2JKd1plbHU5UFlISzFTazltTFVzdlltcTRTblVBbEczZSt3?=
 =?utf-8?B?aWFHdlRmWFJ0QXVNdU9QeXIvdXUwTVduMjdoNWZYZkpXU29Iemd1bVhmOEdt?=
 =?utf-8?B?OXBMTEwzb0VGMG9uaUJleWoxajhnZ2F3bmg0dDQ3L0VTK04wUmNQNXdHZkdH?=
 =?utf-8?B?VVdwWFVXeDhxbUNyYXZ4b0RMdy9DOEpvM0JvRjYyRytFOUEwdGluZmtQVzcv?=
 =?utf-8?B?V3ZlZm12d3R2VDRIMlNDN1pFZWdHSzBRQW04VjIvNStabExKNzFiK1NBZm5D?=
 =?utf-8?B?NlpjTDUwckFodUxMZDZ4cFFmRnlCOXJBVWYxV3N5MGRiN094dHhiSDhVUmE5?=
 =?utf-8?B?ZE50dzU2Mk9uVTBXZWRtdDc5Z2NMdDZLZVR0RTFXY1pJdUJ2QjZ4UzJlS1NH?=
 =?utf-8?B?MG5jcjlZNUI2R2R2bERYM0xoSHdIWEdoWmF5WHNjR1kzVFJTQ3JyTWIvMmlI?=
 =?utf-8?B?cG1yK0hzU1FlYTdnbHlENEJzMWpTWXo1T3ZXeTFLSFYrTzhnblBxZ3Z0RFpz?=
 =?utf-8?B?dW1kV0IwWnBtZ3NFL3pWcWplWGhxZDdDd1dBN3BEMm5FSmhQWkN6bi9SZkRp?=
 =?utf-8?B?bW53UTB3THlTRGlQVkRkZzZqSGNyTlNtM2Z1dGJwd2ppUFRCUFFCa1kwam9T?=
 =?utf-8?B?S2IyVTAweS9rNEpyWVFGWW5nMGNxTWswSFhMTnFXTUZYQlZhdFBqZUVjaFNr?=
 =?utf-8?B?cVFHQjJYYlhmVWJBZ0lnZ0NWTExDbldOZlZVTWRaS3RoYzZYbXBmcGZYTjN3?=
 =?utf-8?B?dmtrQXVKRVJrWWJSTHlxalJBZmtXZVlDVW0vck13c1ArYnNmUmVxbnhXbnpm?=
 =?utf-8?B?eDhKWlZoRDBJTmYzaW1YTGdkZGlkQ1RwdURHbStieWxodjFjQTNpU25mUDFB?=
 =?utf-8?B?VHY0WWRHb2ljNW5wYUpZZytBbk5PbElycjhha3daUFQ0MDl1dXArUEt6RUp2?=
 =?utf-8?B?enZ5RHVxOEMyTEYvVTZBb1ZxN2RPbDRnN1BvZW5zZitoelN6QlFmaFhZb0R4?=
 =?utf-8?B?VnNEVnFnZURSOGxXSlV4cnVBSU9hZmpQUHkxQ3dsTlRaVFVsN0dYa0ZsZXNz?=
 =?utf-8?B?K3EwM0l2TVFRQkRVeGxKZEhUUkZjNXVCSkhEK1hnQ3JLNnkvK2RtT0NuTVhC?=
 =?utf-8?B?SmM5cUFpcENPanFqRmFMbHhFQXpRdEZ3Y2VEZnlGbWZTRjZZUVRnMWdRbjZU?=
 =?utf-8?B?Qy85MGhzd2E1NEFXYmI3WWFobmdEQmtDaFdFWTRiVXdJRkQxd3VtNjBaWHha?=
 =?utf-8?B?elJCTS9BblJHKy81VmVFUk1yZjdUWHIzUTBkZTdHem1zK1RDdStKMkdUL0ZO?=
 =?utf-8?B?TGgzR044WWk1d1ZEbUJhUEhqQ1VseVN1cTJOdTIycGJDMUY1eWh0WGw5dk5q?=
 =?utf-8?B?VC9vcEg0QS92NC94bFhpb01wck83RmgxV3VWN3NRNmV4Tksrd2hHV3M0ODda?=
 =?utf-8?B?NzUrWjJKOEdUYmxtNTM4STJVTHh1M1hWQTJrTkw4SHNzOWdQNVpja2d6OUNY?=
 =?utf-8?B?ZVdETCttcmM4RjlQczNiRTMvbHkzelNQZ0IxbS9rSVFDWmpqNlhUL1RsazFM?=
 =?utf-8?B?T0gwbEVyd2QvNlpKUWIxblV1eGxqVlg3VERGR0pkTEhJdWxsbWdQdXhHU2ZZ?=
 =?utf-8?B?VitXRGV3cXJINzBqcXdiNUhHc0dlOC9qaXBpWi9KQjVQSTdJZTlsSnJSa1By?=
 =?utf-8?B?YWJYaEFsN2M0WHVUUURRTlgrOWdhQm9PcFRGMTliaVdyKzEvR04yZjBZbXRr?=
 =?utf-8?B?YjhwQlZmQVdUWjQ0Y3ZEQ1cvcGVuUmJvYWQxMC91UUh2TlgrcjJudkNBY245?=
 =?utf-8?Q?JM+RIhjWbAwuDGIc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c8afbd44-aea8-4d54-0aed-08da22db0cad
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 14:35:43.4070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ak2dZc+mwnSmrJT7YZsOtWD1EoubgwxsjWlaxX9cIZ0RMIGi+2EHAwSVDW1XsV2DfjjK3VqSNoh+ysLnzIUIctNaDN1jXgIvpd92NQJD09E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3619
X-Proofpoint-GUID: ryfNZJte_ZKVPxi_xsGOwg5N5tx9WO81
X-Proofpoint-ORIG-GUID: 5GdBxwbtilhi2gwqGBJLliTZMwq6NyuE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-20_04,2022-04-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204200086
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 23KE0Q41030994
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164696

On 2022-01-30 01:20, Pgowda wrote:
> glibc-2.33 has been upgraded to latest version that includes many CVE a=
nd
> other bug fixes. Ran the regressions and results are better.
>
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> ---
>   meta/recipes-core/glibc/glibc-version.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-c=
ore/glibc/glibc-version.inc
> index 63241ee951..e1eefdee49 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>   SRCBRANCH ?=3D "release/2.33/master"
>   PV =3D "2.33"
> -SRCREV_glibc ?=3D "55b99e9ed07688019609bd4dcd17d3ebf4572948"
> +SRCREV_glibc ?=3D "3e2a15c666e40e5ee740e5079c56d83469280323"
>   SRCREV_localedef ?=3D "bd644c9e6f3e20c5504da1488448173c69c56c28"
>  =20
>   GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161106): https://lists.openembedded.org/g/openembed=
ded-core/message/161106
> Mute This Topic: https://lists.openembedded.org/mt/88782078/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

Naveen, Anuj, Richard,

Is there time to do this one last time for hardknott=C2=A0 to pick up the=
se=20
67 bug fixes in glibc?

We're particularily interested in:

78d25827ae=C2=A0=C2=A0 2021-09-28=C2=A0=C2=A0 Linux: Simplify __opensock =
and fix race=20
condition [BZ #28353]

but there seem to be many good bug fixes and optimizations in the list.

Naveen, please try it and test ASAP.

../Randy

5eddc29c92=C2=A0=C2=A0 2022-04-13=C2=A0=C2=A0 (HEAD -> release/2.33/maste=
r,=20
origin/release/2.33/master) S390: Add new s390 platform z16.
c78ad8eb47=C2=A0=C2=A0 2022-03-15=C2=A0=C2=A0 hppa: Use END instead of PS=
EUDO_END in=20
swapcontext.S
32f74d4f14=C2=A0=C2=A0 2022-03-15=C2=A0=C2=A0 hppa: Implement swapcontext=
 in assembler (bug=20
28960)
baa74e8589=C2=A0=C2=A0 2022-03-06=C2=A0=C2=A0 hppa: Fix warnings from _dl=
_lookup_address
6d9525b620=C2=A0=C2=A0 2022-02-28=C2=A0=C2=A0 nptl: Fix cleanups for stac=
k grows up [BZ# 28899]
8f56ecc19b=C2=A0=C2=A0 2022-02-22=C2=A0=C2=A0 hppa: Revise gettext trampo=
line design
ea94346dbe=C2=A0=C2=A0 2022-02-18=C2=A0=C2=A0 hppa: Fix swapcontext
aeab7584c2=C2=A0=C2=A0 2022-03-06=C2=A0=C2=A0 Fix elf/tst-audit2 on hppa
f341ab08fc=C2=A0=C2=A0 2022-02-18=C2=A0=C2=A0 NEWS: Add a bug fix entry f=
or BZ #28896
24e95955aa=C2=A0=C2=A0 2022-02-18=C2=A0=C2=A0 x86: Fix TEST_NAME to make =
it a string in=20
tst-strncmp-rtm.c
6f8e99b567=C2=A0=C2=A0 2022-02-18=C2=A0=C2=A0 x86: Test wcscmp RTM in the=
 wcsncmp overflow=20
case [BZ #28896]
a3cd0fe201=C2=A0=C2=A0 2022-02-15=C2=A0=C2=A0 x86: Fallback {str|wcs}cmp =
RTM in the ncmp=20
overflow case [BZ #28896]
cb922428dc=C2=A0=C2=A0 2022-02-17=C2=A0=C2=A0 string: Add a testcase for =
wcsncmp with=20
SIZE_MAX [BZ #28755]
211cce703d=C2=A0=C2=A0 2021-02-02=C2=A0=C2=A0 <bits/platform/x86.h>: Corr=
ect x86_cpu_TBM
55446dd8a2=C2=A0=C2=A0 2021-11-22=C2=A0=C2=A0 socket: Do not use AF_NETLI=
NK in __opensock
9495d729f6=C2=A0=C2=A0 2021-10-18=C2=A0=C2=A0 hurd if_index: Explicitly u=
se AF_INET for if=20
index discovery
78d25827ae=C2=A0=C2=A0 2021-09-28=C2=A0=C2=A0 Linux: Simplify __opensock =
and fix race=20
condition [BZ #28353]
1956ad4930=C2=A0=C2=A0 2021-07-08=C2=A0=C2=A0 x86-64: Test strlen and wcs=
len with 0 in the=20
RSI register [BZ #28064]
260360e89b=C2=A0=C2=A0 2021-07-08=C2=A0=C2=A0 x86: Remove wcsnlen-sse4_1 =
from wcslen=20
ifunc-impl-list [BZ #28064]
1b8f2456b9=C2=A0=C2=A0 2022-01-24=C2=A0=C2=A0 x86: Use CHECK_FEATURE_PRES=
ENT to check HLE=20
[BZ #27398]
54fdfa2b33=C2=A0=C2=A0 2022-01-14=C2=A0=C2=A0 x86: Black list more Intel =
CPUs for TSX [BZ=20
#27398]
0a5f5e2dc1=C2=A0=C2=A0 2021-06-30=C2=A0=C2=A0 x86: Check RTM_ALWAYS_ABORT=
 for RTM [BZ #28033]
5cb6edb6cd=C2=A0=C2=A0 2021-06-23=C2=A0=C2=A0 x86: Copy IBT and SHSTK usa=
ble only if CET is=20
enabled
3e2a15c666=C2=A0=C2=A0 2021-04-19=C2=A0=C2=A0 x86-64: Require BMI2 for __=
strlen_evex and=20
__strnlen_evex
25941de34e=C2=A0=C2=A0 2022-01-27=C2=A0=C2=A0 NEWS: Add a bug fix entry f=
or BZ #27974
2b00ee820a=C2=A0=C2=A0 2021-06-09=C2=A0=C2=A0 String: Add overflow tests =
for strnlen,=20
memchr, and strncat [BZ #27974]
8a3a0177c7=C2=A0=C2=A0 2021-04-19=C2=A0=C2=A0 x86: Optimize strlen-evex.S
cef3bffade=C2=A0=C2=A0 2021-06-23=C2=A0=C2=A0 x86: Fix overflow bug in wc=
snlen-sse4_1 and=20
wcsnlen-avx2 [BZ #27974]
3ac5a7fe8b=C2=A0=C2=A0 2021-06-23=C2=A0=C2=A0 x86-64: Add wcslen optimize=
 for sse4.1
5697e2dda8=C2=A0=C2=A0 2021-06-22=C2=A0=C2=A0 x86-64: Move strlen.S to mu=
ltiarch/strlen-vec.S
3dea108f60=C2=A0=C2=A0 2021-05-07=C2=A0=C2=A0 x86-64: Fix an unknown vect=
or operation in=20
memchr-evex.S
355afae940=C2=A0=C2=A0 2021-05-03=C2=A0=C2=A0 x86: Optimize memchr-evex.S
b72b89705e=C2=A0=C2=A0 2021-04-19=C2=A0=C2=A0 x86: Optimize strlen-avx2.S
453ed0a0f2=C2=A0=C2=A0 2021-06-09=C2=A0=C2=A0 x86: Fix overflow bug with =
wmemchr-sse2 and=20
wmemchr-avx2 [BZ #27974]
e09c377806=C2=A0=C2=A0 2021-05-03=C2=A0=C2=A0 x86: Optimize memchr-avx2.S
902af2f5ee=C2=A0=C2=A0 2022-01-27=C2=A0=C2=A0 NEWS: Add a bug fix entry f=
or BZ #27457
31dd3e3cb3=C2=A0=C2=A0 2021-04-01=C2=A0=C2=A0 x86-64: Fix ifdef indentati=
on in strlen-evex.S
d49105cc7a=C2=A0=C2=A0 2021-03-07=C2=A0=C2=A0 x86-64: Use ZMM16-ZMM31 in =
AVX512 memmove=20
family functions
763cea698b=C2=A0=C2=A0 2021-03-07=C2=A0=C2=A0 x86-64: Use ZMM16-ZMM31 in =
AVX512 memset=20
family functions
82f1ba9af7=C2=A0=C2=A0 2021-02-23=C2=A0=C2=A0 x86: Add string/memory func=
tion tests in RTM=20
region
0598a25cbe=C2=A0=C2=A0 2021-03-05=C2=A0=C2=A0 x86-64: Add AVX optimized s=
tring/memory=20
functions for RTM
15bae38c8b=C2=A0=C2=A0 2021-03-05=C2=A0=C2=A0 x86-64: Add memcmp family f=
unctions with=20
256-bit EVEX
47bf9f38bb=C2=A0=C2=A0 2021-03-05=C2=A0=C2=A0 x86-64: Add memset family f=
unctions with=20
256-bit EVEX
1697e739ef=C2=A0=C2=A0 2021-03-05=C2=A0=C2=A0 x86-64: Add memmove family =
functions with=20
256-bit EVEX
06d1aed51b=C2=A0=C2=A0 2021-03-05=C2=A0=C2=A0 x86-64: Add strcpy family f=
unctions with=20
256-bit EVEX
9cee072f8f=C2=A0=C2=A0 2021-03-05=C2=A0=C2=A0 x86-64: Add ifunc-avx2.h fu=
nctions with=20
256-bit EVEX
f0a2b67147=C2=A0=C2=A0 2021-02-26=C2=A0=C2=A0 x86: Set Prefer_No_VZEROUPP=
ER and add=20
Prefer_AVX2_STRCMP
a744a0a3fe=C2=A0=C2=A0 2021-03-27=C2=A0=C2=A0 test-strnlen.c: Check that =
strnlen won't go=20
beyond the maximum length
6b7b6c7514=C2=A0=C2=A0 2021-03-27=C2=A0=C2=A0 test-strnlen.c: Initialize =
wchar_t string with=20
wmemset [BZ #27655]
86c153d092=C2=A0=C2=A0 2022-01-26=C2=A0=C2=A0 NEWS: Add a bug fix entry f=
or BZ #28755
3d52239b30=C2=A0=C2=A0 2022-01-09=C2=A0=C2=A0 x86: Fix __wcsncmp_avx2 in =
strcmp-avx2.S [BZ#=20
28755]
d251ad533e=C2=A0=C2=A0 2021-06-01=C2=A0=C2=A0 aarch64: align stack in clo=
ne [BZ #27939]
06ce5fbd6d=C2=A0=C2=A0 2021-06-25=C2=A0=C2=A0 support: Fix xclone build f=
ailures on ia64 and=20
hppa
48d9161e02=C2=A0=C2=A0 2022-01-24=C2=A0=C2=A0 Linux: Detect user namespac=
e support in=20
io/tst-getcwd-smallbuff
41980af2d7=C2=A0=C2=A0 2022-01-24=C2=A0=C2=A0 realpath: Avoid overwriting=
 preexisting error=20
(CVE-2021-3998)
bcdde07537=C2=A0=C2=A0 2022-01-21=C2=A0=C2=A0 getcwd: Set errno to ERANGE=
 for size =3D=3D 1=20
(CVE-2021-3999)
46a70c49ba=C2=A0=C2=A0 2021-03-10=C2=A0=C2=A0 support: Add xclone
f63cb3cf72=C2=A0=C2=A0 2022-01-24=C2=A0=C2=A0 tst-realpath-toolong: Fix h=
urd build
e41e5b97e3=C2=A0=C2=A0 2022-01-13=C2=A0=C2=A0 realpath: Set errno to ENAM=
ETOOLONG for result=20
larger than PATH_MAX [BZ #28770]
e081bafcb1=C2=A0=C2=A0 2022-01-18=C2=A0=C2=A0 support: Add helpers to cre=
ate paths longer=20
than PATH_MAX
ac148bdd88=C2=A0=C2=A0 2021-06-25=C2=A0=C2=A0 elf: Fix glibc-hwcaps prior=
ities with cache=20
flags mismatches [BZ #27046]
5cab4e3f3a=C2=A0=C2=A0 2021-09-25=C2=A0=C2=A0 powerpc: Fix unrecognized i=
nstruction errors=20
with recent binutils
0f70b829f8=C2=A0=C2=A0 2022-01-17=C2=A0=C2=A0 CVE-2022-23218: Buffer over=
flow in sunrpc=20
svcunix_create (bug 28768)
4f4452721d=C2=A0=C2=A0 2021-03-09=C2=A0=C2=A0 <shlib-compat.h>: Support=20
compat_symbol_reference for _ISOMAC
dae9a8e7f6=C2=A0=C2=A0 2022-01-17=C2=A0=C2=A0 sunrpc: Test case for clnt_=
create "unix"=20
buffer overflow (bug 22542)
4653cd9e36=C2=A0=C2=A0 2022-01-17=C2=A0=C2=A0 CVE-2022-23219: Buffer over=
flow in sunrpc=20
clnt_create for "unix" (bug 22542)
f10e992e8d=C2=A0=C2=A0 2022-01-17=C2=A0=C2=A0 socket: Add the __sockaddr_=
un_set function
a51b76b71e=C2=A0=C2=A0 2022-01-17=C2=A0=C2=A0 x86: use default cache size=
 if it cannot be=20
determined [BZ #28784]

--=20
# Randy MacLeod
# Wind River Linux


