Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4FAC6FD1D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 21:05:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.901.1679346331502877860
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 14:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=kLk5Eejq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2443999f3c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32KKvE5k016670
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 21:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=w95mydUrM2QS3YshfwIRTEoFvpQ5l3fFKOfdVCaIJ/A=;
 b=kLk5Eejq54RxFV59PWNWeQZr/+8J2Cm+xEOYXBzWu/1ywL8r1dDzIkrSAV5NSYEUZPkz
 X6Y10UzfzCkQ+FkjQzT9AIzjy6l/6z7sp/suUaJLkGjHjF4CmYvICIS99VsAP67AJGCo
 aDFrQ6hjbIGUZrekaUz3Zzd0UsqGevTXMBx4nKotqPEfpdVria99Bptzl+X+KJ3DbH1O
 KNAU1/PaS38z6IBG6DM4JEhTfBbGdC5xkUOqtyChUw3HRXOBfXJzLFKAi0EhEs6Ef9jk
 Rx4VlTw8Or/9nF7TC+DPy3eg4HRVB1gCWBuvnm56ortDWPhXDJ3oePF1mvVIVVEZRHzZ MA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pd2h3acbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 21:05:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XD+QUaD4apFp8Zfg7JSsj+Py4edgMsFUUSDxvvVXZTK5G6Bq/Ie/sQ86qlmL8sGyQtbYi6uNpGt9ZT4AT5dWKOP4V1KS+mnVDV/kGxJsmElnV7J63His48wyawooKHCOyYq0EZc6ed6Wj1IpE1A86jFVnmMq2Z4w/q5lMxTd57QbS+7bx+uQnJPvwxAR+53oatR7NsRX/E9lHdZ89Ic7Sg61iBCe5VdPwP34lDL418oW1mtio49yazHmVcGh2yJ4sNVsbVUqt0Vs2Pg/o+ariUUedjXlMf9ajySbc08/EaBR0JUiJtFEBQ0+fxp7BQA6mwFeEKjIrGepqSn48QNQKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w95mydUrM2QS3YshfwIRTEoFvpQ5l3fFKOfdVCaIJ/A=;
 b=SsflaZ2n/IJoJgKQTlBbLX3EaCqGn9YFzW4mfW2xQeKqvxRKxl5FIy+qZmBzt7SetZnMNYDoFyRUM2kvK5DcAF0ktYwSkKvXs8zsEimykW3j7hGO8sy/CMpgfb2ijrJk+NVANqPLxzouoE1uaFxkhnMRgjLw86gv1mffpTV9RbOKpHGOJiz9ziTM1zBFDKkMKnlXDyRv036WN3P2lrIC57GX64z8jECFaUyhpDXWPR1LrWQoLABZCECF1amnKLoaGl9coQFyohHp5VW1npqku2qy50iv/By+o6sSHZbIHYQDXEWjQ2J+66tKWQnBJRtLpPU8D05k0ApcezLMjF+YAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Mon, 20 Mar
 2023 21:05:25 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67%6]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 21:05:25 +0000
Content-Type: multipart/alternative;
 boundary="------------GMfZCS5AlRV0P9ZH2HAAENLE"
Message-ID: <45c4b6fc-6728-c4f2-78c3-0f42db9d4548@windriver.com>
Date: Mon, 20 Mar 2023 17:05:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [kirkstone][PATCH] go: fix CVE-2022-2879 and
 CVE-2022-41720
Content-Language: en-CA
To: sakib.sajal@windriver.com, openembedded-core@lists.openembedded.org
References: <20230320200908.1233173-1-sakib.sajal@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230320200908.1233173-1-sakib.sajal@windriver.com>
X-ClientProxiedBy: YT4PR01CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::20) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CY5PR11MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: d95f69eb-28b1-40f6-1262-08db2986d302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ly3QZADE1EKa8v8sFd/pSwHkYLW5HTzlSmsAe41yM/QwvryIlCq7/EjwWJXRYpJd+TsrfkC4gej88xGz3yw1iY1adrAJUX86JD/jNU5KdTaDL26FvmaTYVGAouxCrolXaLVtAj2wmtF4Y/t8bWT6FbetFiMbJl38tKIz6gb1NK66xcP4gR3uox9osNnN3X2Cmo3uq81BZx2/K9TchkkKASjliNa6D2Hj0pteo/R9J+vH4xYbduQ2MJYvLkvjt+XOoTKGbyuORb1aI6IYObSRQ67gRwjsrwBps2ZRle6r8YQLCoWK2DNsTpMD7CVd5N/9YO58F0MeTvha7LoqAlReo8q/txL8rlp7Kk52b6aeZRj7ma4uww8XwbGcXZBomqysNqSdC605wLz/5MTf/cSPBvxWeAtOsHawLiQ+fo+/Q/Qh/+eggB02xbF2kIbA9lBj8uOaHINyEuOcRvlLzxPlAdbxnf4IcrgAEujA3WkdsUy+92OajxkJZUolrQVLC+8tKGXTD3TK+1bLl/iuxAcvA4+3vzR4nI8I2KA5csfdVG2ada9rNfqBcEXBYrKP2qFZOcHbWMuh1c3i/xC8xy04c5saRUM0k/uevpPI3mpZ0dhAg3855u37+irSICn6tMLCcyuP5b/3tYjwRMSOdvpwfY5NUhW7qjrR2YtSqKLmeR5noQYtwNLOWpAjRSw1gs9tfSJ84DAk5UU86hdQYH1rrV5r1PpUuWMkS9MzVD1nyvOlHvxZv+T/iMZJkCV21KBZEFJURPAjYxZa1DMUa8NXBPwJd2JNUJMojApXfc/mFUk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39840400004)(346002)(136003)(366004)(396003)(451199018)(166002)(31686004)(966005)(316002)(36756003)(6486002)(38100700002)(2906002)(66476007)(66556008)(8676002)(66946007)(66899018)(2616005)(186003)(6506007)(26005)(6666004)(53546011)(6512007)(478600001)(33964004)(83380400001)(31696002)(41300700001)(86362001)(8936002)(5660300002)(30864003)(403724002)(43740500002)(45980500001)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M2JERzNWTm1NN0E2NkhEMEtxZlAxV29yb3I2c2dwQnJVQWJyMnd1RnpLMVF3?=
 =?utf-8?B?SmdDK0pCN3B6U2ZFeFZ2enNzbTJOZWt4Q3VVSXBnbUhreWR0YzNUejdZWVE2?=
 =?utf-8?B?alMyV0tLb3U1QnBZczQvS0RUNUsvM0YyWVk1VlQ5SHFZU3JRYmtwdkV0TDBp?=
 =?utf-8?B?ZkJQaFNmV2xsaDY0RDNUZU1VQ0Q4blJuWGhCNVpvSHZaOGgvWllNSzJRQW5s?=
 =?utf-8?B?UG53N3Bwa3VRd2tXMWlEa2xwVEdNZVVmMmN3THVCNE1aLzlMTlBCdHdiTWpo?=
 =?utf-8?B?NVQxeU1zcEIvRDMvSWpTSnByWlUxSU9seTNSR1VqTVlCOHowMG8rcDNqVjdn?=
 =?utf-8?B?YzBOR3dHTk9jeEd0eVNFZy95eks5ajhrT1hkV2FObzZMMzNKS1NKWnJwNFp1?=
 =?utf-8?B?Ym1Zc05pbUtNbE8vMGZuRGdhVFlObUtrTlVCekxBMnhON0ZQa3ovTi8zb28z?=
 =?utf-8?B?ZVpaSEZkazhUZjliT3h2TFN5TE1hR3VJMjBaTDV1QnM1aE1QYWR0dVBqSlFx?=
 =?utf-8?B?TTR2SUk1YXFObUlwUjh6ZGRHYTNINFMzYnZUTklZU3AzY0pOaEdFSDhINW1x?=
 =?utf-8?B?L212Qkhibloxc0RYd05QTUJHd2VRYm9SS1pSb0hRZEpaa245SnhFbjJ5SUtF?=
 =?utf-8?B?UEcyMFlvNXQvK3VPdlNXdlpPRUhkUkRUTjNUNllhZ3hqTVVneTZIdG1SdUpp?=
 =?utf-8?B?a2wzU2Iwc1FmR05MVEozQUtmekwwTk1zWG9URUcrK044TEtTN1gzYlgvSUV0?=
 =?utf-8?B?QzVwbHFmZ2tEaDA2Z0RDRFhjVXFqOG1sNWJrSnBOUDNBVU5EVGFQb2gzbTcv?=
 =?utf-8?B?N1RrSkxnUVgwVXNzVnpGUVRTbXVnaFIxQ1JJSmczNkZoRGhJTHZtdDVWNjll?=
 =?utf-8?B?N1BndE5VYXNmSlFScGtEK0ZiUkNxOXcyLzQ5Ty9Dd1pOazViWGJwN3BobGN4?=
 =?utf-8?B?dC9iUXh4cHpTK0lLcVUrYWlUbnd1Z3dVazVjdWp6bVRuUnhjK3EyVjcrRm1M?=
 =?utf-8?B?WWVRQjErWFJTblhBVGZxMVdrQ2N5Q0FMWUFaRHdRUlhrUTlTaXBTVmNYSTlJ?=
 =?utf-8?B?REZHczJFbXZRaGJac3dvTUl0N1BHQWJiVkRkRlMyQ1IxbFMxK0duQUdHZXEr?=
 =?utf-8?B?ZmJFaStpaVF0NHorTzV6NWs1VFVVZmp2d20wN1lyNjdRNDVaYUVtYy9SZWpG?=
 =?utf-8?B?WHdqb3VwYTBJNXdTUzF0ZWVOK2hhaGpwZnpMc2F3dlYrQjJwaHdiOXhMclRP?=
 =?utf-8?B?Zk4xOWgzWkR2ZXpYVStudTg2bDc5RXBVaEw0QkhrYWtTOENicGZJYTZ6S3JN?=
 =?utf-8?B?NGcwTmQ5VzRNLzVhbTgxNldxTVlWb2wwcjV5L0NiUmFIUEE3RmZSc1BrL05t?=
 =?utf-8?B?Zk5xRGFVWXJtaWMzWmN1UzFTNFJYcUcwZUpsTTE0b0FWZHpUdXRNUkI3OE9i?=
 =?utf-8?B?ckFGb1NSM1dyWDVRcGtJVDNGWUFnQWpWQnZVSWJFSFhzdERrZ1owWEdMa2Rh?=
 =?utf-8?B?cmdEK3MwVWlTVXdQenpPZ2NQSExaeVlyYklTS0V1NG8xNVVKRmZJMWE1d3hR?=
 =?utf-8?B?c3pGQWhxZ2xSckp3emlhMG9Pa3BhRkNjQmVqaHpIa2g4MkRQZTJWMXBKcWEy?=
 =?utf-8?B?a2crREpMcnBLaG9uUzc1Vks0K0MyY0VETWlGYWNjOFBKYzJSZ1ZhWUdVN3BV?=
 =?utf-8?B?S0t1UDR6dVhHVkJzWTVTM04ycS9leTN0bzRGUEdWdTNaTHBORkIwaFFCRjlP?=
 =?utf-8?B?Y1ZGNk5WRjFPNDRwR3BOQzAvS2ZPWEVya010VmdwakN3a2lzSStvYk5nV1k2?=
 =?utf-8?B?M2dSRWtBMVZuWHVRSDhuOG5iYXhHbFhvdWVLZ215OXRkU1VFNFFWOThHNElr?=
 =?utf-8?B?dFFveFdTajVzbDdxSjlQQ3dnY2pKNCtwczBoSzJjcGdoaHNWcDFreTVpa0Fr?=
 =?utf-8?B?aHhNZ3YrSkpCZUhQVzNNRVgyWTNtWFRmT0E4a0FGUUZtdUM2cHpzeWJ6V3Fv?=
 =?utf-8?B?QUdGR3N5clpSWUsySFVkVFdVUGV5ZWpWYXRHMk9ybFhVQXk5cGtPZVk2NVQ4?=
 =?utf-8?B?YnEybzBoT1VlNUJ4MjArVlZ3THdWR0hsakIyWUx4STRDNFdORFpZN1Jtcks5?=
 =?utf-8?B?bmVHWlplVUZWV1ptVmFDMThiTGw0VDRRS0UvZSsrclRRS1NDVW5KRk1CYUVt?=
 =?utf-8?B?ZVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d95f69eb-28b1-40f6-1262-08db2986d302
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 21:05:25.0385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vf/lFoW7MRUqbS+TuBaYQiozO0ggXglxPiljXPUxC1Wzntm0nse5ElzkBO3meP/GH0shfKvB1sZGPgWplf0WXeqtwL/d6G2AZldnk5FTZO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6366
X-Proofpoint-GUID: xfcbm74WVYQqVMyWc20l1vDnjKeL2KDO
X-Proofpoint-ORIG-GUID: xfcbm74WVYQqVMyWc20l1vDnjKeL2KDO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_16,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303150002 definitions=main-2303200178
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 21:05:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178841

--------------GMfZCS5AlRV0P9ZH2HAAENLE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32KKvE5k016670

On 2023-03-20 16:09, Sakib Sajal via lists.openembedded.org wrote:
> Backport appropriate patches to fix CVE-2022-2879 and CVE-2022-41720.
>
> Modified the original fix for CVE-2022-2879 to remove a testdata tarbal=
l
> and any references to it since git binary diffs are not supported in qu=
ilt.
>
> Signed-off-by: Sakib Sajal<sakib.sajal@windriver.com>
> ---
>   meta/recipes-devtools/go/go-1.17.13.inc       |  36 +-
>   ...01-archive-tar-limit-size-of-headers.patch | 177 ++++++
>   ...d-escapes-from-os.DirFS-and-http.Dir.patch | 514 +++++++++++++++++=
+
>   3 files changed, 710 insertions(+), 17 deletions(-)
>   create mode 100644 meta/recipes-devtools/go/go-1.18/0001-archive-tar-=
limit-size-of-headers.patch
>   create mode 100644 meta/recipes-devtools/go/go-1.18/0002-os-net-http-=
avoid-escapes-from-os.DirFS-and-http.Dir.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-dev=
tools/go/go-1.17.13.inc
> index 99662bd298..f5cf192361 100644
> --- a/meta/recipes-devtools/go/go-1.17.13.inc
> +++ b/meta/recipes-devtools/go/go-1.17.13.inc
> @@ -4,23 +4,25 @@ FILESEXTRAPATHS:prepend :=3D "${FILE_DIRNAME}/go-1.18=
:"
>  =20
>   LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd=
74707"
>  =20
> -SRC_URI +=3D "\
> -file://0001-allow-CC-and-CXX-to-have-multiple-words.patch  \
> -file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch=
  \
> -file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch =
 \
> -file://0004-ld-add-soname-to-shareable-objects.patch  \
> -file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch=
  \
> -file://0006-cmd-dist-separate-host-and-target-builds.patch  \
> -file://0007-cmd-go-make-GOROOT-precious-by-default.patch  \
> -file://0008-use-GOBUILDMODE-to-set-buildmode.patch  \
> -file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch  \
> -file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch  \
> -file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch=
  \
> -file://CVE-2022-27664.patch  \
> -file://0001-net-http-httputil-avoid-query-parameter-smuggling.patch  \
> -file://CVE-2022-41715.patch  \
> -file://CVE-2022-41717.patch  \
> -"
> +SRC_URI =3D "https://golang.org/dl/go${PV}.src.tar.gz;name=3Dmain \


Nack.


Sakib,

You said this works for you but if you look at:

=E2=9D=AF cat meta/recipes-devtools/go/go-1.17.13.inc
require go-common.inc

FILESEXTRAPATHS:prepend :=3D "${FILE_DIRNAME}/go-1.18:"

LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd747=
07"

SRC_URI +=3D "\
 =C2=A0...

and then

=E2=9D=AF grep SRC_URI meta/recipes-devtools/go/go-common.inc
SRC_URI =3D "https://golang.org/dl/go${PV}.src.tar.gz;name=3Dmain"

You see that you should stick with the +=3D operator.

I think you said that devtool changed that , right?

If so, and if we can learn why this change even built for you,
then consider opening a bug against devtool.

../Randy


> +file://0001-allow-CC-and-CXX-to-have-multiple-words.patch  \
> +file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch=
  \
> +file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch =
 \
> +file://0004-ld-add-soname-to-shareable-objects.patch  \
> +file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch=
  \
> +file://0006-cmd-dist-separate-host-and-target-builds.patch  \
> +file://0007-cmd-go-make-GOROOT-precious-by-default.patch  \
> +file://0008-use-GOBUILDMODE-to-set-buildmode.patch  \
> +file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch  \
> +file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch  \
> +file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch=
  \
> +file://CVE-2022-27664.patch  \
> +file://0001-net-http-httputil-avoid-query-parameter-smuggling.patch  \
> +file://CVE-2022-41715.patch  \
> +file://CVE-2022-41717.patch  \
> +file://0001-archive-tar-limit-size-of-headers.patch  \
> +file://0002-os-net-http-avoid-escapes-from-os.DirFS-and-http.Dir.patch=
  \
> +           "
>   SRC_URI[main.sha256sum] =3D "a1a48b23afb206f95e7bbaa9b898d965f90826f6=
f1d1fc0c1d784ada0cd300fd"
>  =20
>   # Upstream don't believe it is a signifiant real world issue and will=
 only
> diff --git a/meta/recipes-devtools/go/go-1.18/0001-archive-tar-limit-si=
ze-of-headers.patch b/meta/recipes-devtools/go/go-1.18/0001-archive-tar-l=
imit-size-of-headers.patch
> new file mode 100644
> index 0000000000..0315e1a3ee
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.18/0001-archive-tar-limit-size-of-h=
eaders.patch
> @@ -0,0 +1,177 @@
> +From d064ed520a7cc6b480f9565e30751e695d394f4e Mon Sep 17 00:00:00 2001
> +From: Damien Neil<dneil@google.com>
> +Date: Fri, 2 Sep 2022 20:45:18 -0700
> +Subject: [PATCH] archive/tar: limit size of headers
> +
> +Set a 1MiB limit on special file blocks (PAX headers, GNU long names,
> +GNU link names), to avoid reading arbitrarily large amounts of data
> +into memory.
> +
> +Thanks to Adam Korczynski (ADA Logics) and OSS-Fuzz for reporting
> +this issue.
> +
> +Fixes CVE-2022-2879
> +Updates #54853
> +Fixes #55925
> +
> +Change-Id: I85136d6ff1e0af101a112190e027987ab4335680
> +Reviewed-on:https://team-review.git.corp.google.com/c/golang/go-privat=
e/+/1565555
> +Reviewed-by: Tatiana Bradley<tatianabradley@google.com>
> +Run-TryBot: Roland Shoemaker<bracewell@google.com>
> +Reviewed-by: Roland Shoemaker<bracewell@google.com>
> +(cherry picked from commit 6ee768cef6b82adf7a90dcf367a1699ef694f3b2)
> +Reviewed-on:https://team-review.git.corp.google.com/c/golang/go-privat=
e/+/1590622
> +Reviewed-by: Damien Neil<dneil@google.com>
> +Reviewed-by: Julie Qiu<julieqiu@google.com>
> +Reviewed-on:https://go-review.googlesource.com/c/go/+/438500
> +Reviewed-by: Dmitri Shuralyov<dmitshur@golang.org>
> +Reviewed-by: Carlos Amedee<carlos@golang.org>
> +Reviewed-by: Dmitri Shuralyov<dmitshur@google.com>
> +Run-TryBot: Carlos Amedee<carlos@golang.org>
> +TryBot-Result: Gopher Robot<gobot@golang.org>
> +
> +CVE: CVE-2022-2879
> +Upstream-Status: Backport [0a723816cd205576945fa57fbdde7e6532d59d08]
> +Signed-off-by: Sakib Sajal<sakib.sajal@windriver.com>
> +---
> + src/archive/tar/format.go      |  4 ++++
> + src/archive/tar/reader.go      | 14 ++++++++++++--
> + src/archive/tar/reader_test.go |  8 +++++++-
> + src/archive/tar/writer.go      |  3 +++
> + src/archive/tar/writer_test.go | 27 +++++++++++++++++++++++++++
> + 5 files changed, 53 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/archive/tar/format.go b/src/archive/tar/format.go
> +index cfe24a5..6642364 100644
> +--- a/src/archive/tar/format.go
> ++++ b/src/archive/tar/format.go
> +@@ -143,6 +143,10 @@ const (
> + 	blockSize  =3D 512 // Size of each block in a tar stream
> + 	nameSize   =3D 100 // Max length of the name field in USTAR format
> + 	prefixSize =3D 155 // Max length of the prefix field in USTAR format
> ++
> ++	// Max length of a special file (PAX header, GNU long name or link).
> ++	// This matches the limit used by libarchive.
> ++	maxSpecialFileSize =3D 1 << 20
> + )
> +
> + // blockPadding computes the number of bytes needed to pad offset up =
to the
> +diff --git a/src/archive/tar/reader.go b/src/archive/tar/reader.go
> +index 1b1d5b4..f645af8 100644
> +--- a/src/archive/tar/reader.go
> ++++ b/src/archive/tar/reader.go
> +@@ -103,7 +103,7 @@ func (tr *Reader) next() (*Header, error) {
> + 			continue // This is a meta header affecting the next header
> + 		case TypeGNULongName, TypeGNULongLink:
> + 			format.mayOnlyBe(FormatGNU)
> +-			realname, err :=3D io.ReadAll(tr)
> ++			realname, err :=3D readSpecialFile(tr)
> + 			if err !=3D nil {
> + 				return nil, err
> + 			}
> +@@ -293,7 +293,7 @@ func mergePAX(hdr *Header, paxHdrs map[string]stri=
ng) (err error) {
> + // parsePAX parses PAX headers.
> + // If an extended header (type 'x') is invalid, ErrHeader is returned
> + func parsePAX(r io.Reader) (map[string]string, error) {
> +-	buf, err :=3D io.ReadAll(r)
> ++	buf, err :=3D readSpecialFile(r)
> + 	if err !=3D nil {
> + 		return nil, err
> + 	}
> +@@ -826,6 +826,16 @@ func tryReadFull(r io.Reader, b []byte) (n int, e=
rr error) {
> + 	return n, err
> + }
> +
> ++// readSpecialFile is like io.ReadAll except it returns
> ++// ErrFieldTooLong if more than maxSpecialFileSize is read.
> ++func readSpecialFile(r io.Reader) ([]byte, error) {
> ++	buf, err :=3D io.ReadAll(io.LimitReader(r, maxSpecialFileSize+1))
> ++	if len(buf) > maxSpecialFileSize {
> ++		return nil, ErrFieldTooLong
> ++	}
> ++	return buf, err
> ++}
> ++
> + // discard skips n bytes in r, reporting an error if unable to do so.
> + func discard(r io.Reader, n int64) error {
> + 	// If possible, Seek to the last byte before the end of the data sec=
tion.
> +diff --git a/src/archive/tar/reader_test.go b/src/archive/tar/reader_t=
est.go
> +index 789ddc1..926dc3d 100644
> +--- a/src/archive/tar/reader_test.go
> ++++ b/src/archive/tar/reader_test.go
> +@@ -6,6 +6,7 @@ package tar
> +
> + import (
> + 	"bytes"
> ++	"compress/bzip2"
> + 	"crypto/md5"
> + 	"errors"
> + 	"fmt" +@@ -625,9 +626,14 @@ func TestReader(t *testing.T) { + } + de=
fer=20
> f.Close() + ++ var fr io.Reader =3D f ++ if strings.HasSuffix(v.file, "=
.bz2") {
> ++				fr =3D bzip2.NewReader(fr)
> ++			}
> ++
> + 			// Capture all headers and checksums.
> + 			var (
> +-				tr      =3D NewReader(f)
> ++				tr      =3D NewReader(fr)
> + 				hdrs    []*Header
> + 				chksums []string
> + 				rdbuf   =3D make([]byte, 8)
> +diff --git a/src/archive/tar/writer.go b/src/archive/tar/writer.go
> +index e80498d..893eac0 100644
> +--- a/src/archive/tar/writer.go
> ++++ b/src/archive/tar/writer.go
> +@@ -199,6 +199,9 @@ func (tw *Writer) writePAXHeader(hdr *Header, paxH=
drs map[string]string) error {
> + 			flag =3D TypeXHeader
> + 		}
> + 		data :=3D buf.String()
> ++		if len(data) > maxSpecialFileSize {
> ++			return ErrFieldTooLong
> ++		}
> + 		if err :=3D tw.writeRawFile(name, data, flag, FormatPAX); err !=3D =
nil || isGlobal {
> + 			return err // Global headers return here
> + 		}
> +diff --git a/src/archive/tar/writer_test.go b/src/archive/tar/writer_t=
est.go
> +index a00f02d..4e709e5 100644
> +--- a/src/archive/tar/writer_test.go
> ++++ b/src/archive/tar/writer_test.go
> +@@ -1006,6 +1006,33 @@ func TestIssue12594(t *testing.T) {
> + 	}
> + }
> +
> ++func TestWriteLongHeader(t *testing.T) {
> ++	for _, test :=3D range []struct {
> ++		name string
> ++		h    *Header
> ++	}{{
> ++		name: "name too long",
> ++		h:    &Header{Name: strings.Repeat("a", maxSpecialFileSize)},
> ++	}, {
> ++		name: "linkname too long",
> ++		h:    &Header{Linkname: strings.Repeat("a", maxSpecialFileSize)},
> ++	}, {
> ++		name: "uname too long",
> ++		h:    &Header{Uname: strings.Repeat("a", maxSpecialFileSize)},
> ++	}, {
> ++		name: "gname too long",
> ++		h:    &Header{Gname: strings.Repeat("a", maxSpecialFileSize)},
> ++	}, {
> ++		name: "PAX header too long",
> ++		h:    &Header{PAXRecords: map[string]string{"GOLANG.x": strings.Rep=
eat("a", maxSpecialFileSize)}},
> ++	}} {
> ++		w :=3D NewWriter(io.Discard)
> ++		if err :=3D w.WriteHeader(test.h); err !=3D ErrFieldTooLong {
> ++			t.Errorf("%v: w.WriteHeader() =3D %v, want ErrFieldTooLong", test.=
name, err)
> ++		}
> ++	}
> ++}
> ++
> + // testNonEmptyWriter wraps an io.Writer and ensures that
> + // Write is never called with an empty buffer.
> + type testNonEmptyWriter struct{ io.Writer }
> diff --git a/meta/recipes-devtools/go/go-1.18/0002-os-net-http-avoid-es=
capes-from-os.DirFS-and-http.Dir.patch b/meta/recipes-devtools/go/go-1.18=
/0002-os-net-http-avoid-escapes-from-os.DirFS-and-http.Dir.patch
> new file mode 100644
> index 0000000000..6c2e8804b3
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.18/0002-os-net-http-avoid-escapes-f=
rom-os.DirFS-and-http.Dir.patch
> @@ -0,0 +1,514 @@
> +From f8896a97a0630b0f2f8c488310147f7f20b3ec7d Mon Sep 17 00:00:00 2001
> +From: Damien Neil<dneil@google.com>
> +Date: Thu, 10 Nov 2022 12:16:27 -0800
> +Subject: [PATCH] os, net/http: avoid escapes from os.DirFS and http.Di=
r on
> + Windows
> +
> +Do not permit access to Windows reserved device names (NUL, COM1, etc.=
)
> +via os.DirFS and http.Dir filesystems.
> +
> +Avoid escapes from os.DirFS(`\`) on Windows. DirFS would join the
> +the root to the relative path with a path separator, making
> +os.DirFS(`\`).Open(`/foo/bar`) open the path `\\foo\bar`, which is
> +a UNC name. Not only does this not open the intended file, but permits
> +reference to any file on the system rather than only files on the
> +current drive.
> +
> +Make os.DirFS("") invalid, with all file access failing. Previously,
> +a root of "" was interpreted as "/", which is surprising and probably
> +unintentional.
> +
> +Fixes CVE-2022-41720.
> +Fixes #56694.
> +
> +Change-Id: I275b5fa391e6ad7404309ea98ccc97405942e0f0
> +Reviewed-on:https://team-review.git.corp.google.com/c/golang/go-privat=
e/+/1663832
> +Reviewed-by: Julie Qiu<julieqiu@google.com>
> +Reviewed-by: Tatiana Bradley<tatianabradley@google.com>
> +Reviewed-on:https://go-review.googlesource.com/c/go/+/455360
> +Reviewed-by: Michael Pratt<mpratt@google.com>
> +TryBot-Result: Gopher Robot<gobot@golang.org>
> +Run-TryBot: Jenny Rakoczy<jenny@golang.org>
> +
> +CVE: CVE-2022-41720
> +Upstream-Status: Backport [7013a4f5f816af62033ad63dd06b77c30d7a62a7]
> +Signed-off-by: Sakib Sajal<sakib.sajal@windriver.com>
> +---
> + src/go/build/deps_test.go                 |  1 +
> + src/internal/safefilepath/path.go         | 21 +++++
> + src/internal/safefilepath/path_other.go   | 23 ++++++
> + src/internal/safefilepath/path_test.go    | 88 +++++++++++++++++++++
> + src/internal/safefilepath/path_windows.go | 95 ++++++++++++++++++++++=
+
> + src/net/http/fs.go                        |  8 +-
> + src/net/http/fs_test.go                   | 28 +++++++
> + src/os/file.go                            | 36 +++++++--
> + src/os/os_test.go                         | 38 +++++++++
> + 9 files changed, 328 insertions(+), 10 deletions(-)
> + create mode 100644 src/internal/safefilepath/path.go
> + create mode 100644 src/internal/safefilepath/path_other.go
> + create mode 100644 src/internal/safefilepath/path_test.go
> + create mode 100644 src/internal/safefilepath/path_windows.go
> +
> +diff --git a/src/go/build/deps_test.go b/src/go/build/deps_test.go
> +index 45e2f25..dc3bb8c 100644
> +--- a/src/go/build/deps_test.go
> ++++ b/src/go/build/deps_test.go
> +@@ -165,6 +165,7 @@ var depsRules =3D `
> + 	io/fs
> + 	< internal/testlog
> + 	< internal/poll
> ++	< internal/safefilepath
> + 	< os
> + 	< os/signal;
> +
> +diff --git a/src/internal/safefilepath/path.go b/src/internal/safefile=
path/path.go
> +new file mode 100644
> +index 0000000..0f0a270
> +--- /dev/null
> ++++ b/src/internal/safefilepath/path.go
> +@@ -0,0 +1,21 @@
> ++// Copyright 2022 The Go Authors. All rights reserved.
> ++// Use of this source code is governed by a BSD-style
> ++// license that can be found in the LICENSE file.
> ++
> ++// Package safefilepath manipulates operating-system file paths.
> ++package safefilepath
> ++
> ++import (
> ++	"errors"
> ++)
> ++
> ++var errInvalidPath =3D errors.New("invalid path")
> ++
> ++// FromFS converts a slash-separated path into an operating-system pa=
th.
> ++//
> ++// FromFS returns an error if the path cannot be represented by the o=
perating
> ++// system. For example, paths containing '\' and ':' characters are r=
ejected
> ++// on Windows.
> ++func FromFS(path string) (string, error) {
> ++	return fromFS(path)
> ++}
> +diff --git a/src/internal/safefilepath/path_other.go b/src/internal/sa=
fefilepath/path_other.go
> +new file mode 100644
> +index 0000000..f93da18
> +--- /dev/null
> ++++ b/src/internal/safefilepath/path_other.go
> +@@ -0,0 +1,23 @@
> ++// Copyright 2022 The Go Authors. All rights reserved.
> ++// Use of this source code is governed by a BSD-style
> ++// license that can be found in the LICENSE file.
> ++
> ++//go:build !windows
> ++
> ++package safefilepath
> ++
> ++import "runtime"
> ++
> ++func fromFS(path string) (string, error) {
> ++	if runtime.GOOS =3D=3D "plan9" {
> ++		if len(path) > 0 && path[0] =3D=3D '#' {
> ++			return path, errInvalidPath
> ++		}
> ++	}
> ++	for i :=3D range path {
> ++		if path[i] =3D=3D 0 {
> ++			return "", errInvalidPath
> ++		}
> ++	}
> ++	return path, nil
> ++}
> +diff --git a/src/internal/safefilepath/path_test.go b/src/internal/saf=
efilepath/path_test.go
> +new file mode 100644
> +index 0000000..dc662c1
> +--- /dev/null
> ++++ b/src/internal/safefilepath/path_test.go
> +@@ -0,0 +1,88 @@
> ++// Copyright 2022 The Go Authors. All rights reserved.
> ++// Use of this source code is governed by a BSD-style
> ++// license that can be found in the LICENSE file.
> ++
> ++package safefilepath_test
> ++
> ++import (
> ++	"internal/safefilepath"
> ++	"os"
> ++	"path/filepath"
> ++	"runtime"
> ++	"testing"
> ++)
> ++
> ++type PathTest struct {
> ++	path, result string
> ++}
> ++
> ++const invalid =3D ""
> ++
> ++var fspathtests =3D []PathTest{
> ++	{".", "."},
> ++	{"/a/b/c", "/a/b/c"},
> ++	{"a\x00b", invalid},
> ++}
> ++
> ++var winreservedpathtests =3D []PathTest{
> ++	{`a\b`, `a\b`},
> ++	{`a:b`, `a:b`},
> ++	{`a/b:c`, `a/b:c`},
> ++	{`NUL`, `NUL`},
> ++	{`./com1`, `./com1`},
> ++	{`a/nul/b`, `a/nul/b`},
> ++}
> ++
> ++// Whether a reserved name with an extension is reserved or not varie=
s by
> ++// Windows version.
> ++var winreservedextpathtests =3D []PathTest{
> ++	{"nul.txt", "nul.txt"},
> ++	{"a/nul.txt/b", "a/nul.txt/b"},
> ++}
> ++
> ++var plan9reservedpathtests =3D []PathTest{
> ++	{`#c`, `#c`},
> ++}
> ++
> ++func TestFromFS(t *testing.T) {
> ++	switch runtime.GOOS {
> ++	case "windows":
> ++		if canWriteFile(t, "NUL") {
> ++			t.Errorf("can unexpectedly write a file named NUL on Windows")
> ++		}
> ++		if canWriteFile(t, "nul.txt") {
> ++			fspathtests =3D append(fspathtests, winreservedextpathtests...)
> ++		} else {
> ++			winreservedpathtests =3D append(winreservedpathtests, winreservede=
xtpathtests...)
> ++		}
> ++		for i :=3D range winreservedpathtests {
> ++			winreservedpathtests[i].result =3D invalid
> ++		}
> ++		for i :=3D range fspathtests {
> ++			fspathtests[i].result =3D filepath.FromSlash(fspathtests[i].result=
)
> ++		}
> ++	case "plan9":
> ++		for i :=3D range plan9reservedpathtests {
> ++			plan9reservedpathtests[i].result =3D invalid
> ++		}
> ++	}
> ++	tests :=3D fspathtests
> ++	tests =3D append(tests, winreservedpathtests...)
> ++	tests =3D append(tests, plan9reservedpathtests...)
> ++	for _, test :=3D range tests {
> ++		got, err :=3D safefilepath.FromFS(test.path)
> ++		if (got =3D=3D "") !=3D (err !=3D nil) {
> ++			t.Errorf(`FromFS(%q) =3D %q, %v; want "" only if err !=3D nil`, te=
st.path, got, err)
> ++		}
> ++		if got !=3D test.result {
> ++			t.Errorf("FromFS(%q) =3D %q, %v; want %q", test.path, got, err, te=
st.result)
> ++		}
> ++	}
> ++}
> ++
> ++func canWriteFile(t *testing.T, name string) bool {
> ++	path :=3D filepath.Join(t.TempDir(), name)
> ++	os.WriteFile(path, []byte("ok"), 0666)
> ++	b, _ :=3D os.ReadFile(path)
> ++	return string(b) =3D=3D "ok"
> ++}
> +diff --git a/src/internal/safefilepath/path_windows.go b/src/internal/=
safefilepath/path_windows.go
> +new file mode 100644
> +index 0000000..909c150
> +--- /dev/null
> ++++ b/src/internal/safefilepath/path_windows.go
> +@@ -0,0 +1,95 @@
> ++// Copyright 2022 The Go Authors. All rights reserved.
> ++// Use of this source code is governed by a BSD-style
> ++// license that can be found in the LICENSE file.
> ++
> ++package safefilepath
> ++
> ++import (
> ++	"syscall"
> ++	"unicode/utf8"
> ++)
> ++
> ++func fromFS(path string) (string, error) {
> ++	if !utf8.ValidString(path) {
> ++		return "", errInvalidPath
> ++	}
> ++	for len(path) > 1 && path[0] =3D=3D '/' && path[1] =3D=3D '/' {
> ++		path =3D path[1:]
> ++	}
> ++	containsSlash :=3D false
> ++	for p :=3D path; p !=3D ""; {
> ++		// Find the next path element.
> ++		i :=3D 0
> ++		dot :=3D -1
> ++		for i < len(p) && p[i] !=3D '/' {
> ++			switch p[i] {
> ++			case 0, '\\', ':':
> ++				return "", errInvalidPath
> ++			case '.':
> ++				if dot < 0 {
> ++					dot =3D i
> ++				}
> ++			}
> ++			i++
> ++		}
> ++		part :=3D p[:i]
> ++		if i < len(p) {
> ++			containsSlash =3D true
> ++			p =3D p[i+1:]
> ++		} else {
> ++			p =3D ""
> ++		}
> ++		// Trim the extension and look for a reserved name.
> ++		base :=3D part
> ++		if dot >=3D 0 {
> ++			base =3D part[:dot]
> ++		}
> ++		if isReservedName(base) {
> ++			if dot < 0 {
> ++				return "", errInvalidPath
> ++			}
> ++			// The path element is a reserved name with an extension.
> ++			// Some Windows versions consider this a reserved name,
> ++			// while others do not. Use FullPath to see if the name is
> ++			// reserved.
> ++			if p, _ :=3D syscall.FullPath(part); len(p) >=3D 4 && p[:4] =3D=3D=
 `\\.\` {
> ++				return "", errInvalidPath
> ++			}
> ++		}
> ++	}
> ++	if containsSlash {
> ++		// We can't depend on strings, so substitute \ for / manually.
> ++		buf :=3D []byte(path)
> ++		for i, b :=3D range buf {
> ++			if b =3D=3D '/' {
> ++				buf[i] =3D '\\'
> ++			}
> ++		}
> ++		path =3D string(buf)
> ++	}
> ++	return path, nil
> ++}
> ++
> ++// isReservedName reports if name is a Windows reserved device name.
> ++// It does not detect names with an extension, which are also reserve=
d on some Windows versions.
> ++//
> ++// For details, search for PRN in
> ++//https://docs.microsoft.com/en-us/windows/desktop/fileio/naming-a-fi=
le.
> ++func isReservedName(name string) bool {
> ++	if 3 <=3D len(name) && len(name) <=3D 4 {
> ++		switch string([]byte{toUpper(name[0]), toUpper(name[1]), toUpper(na=
me[2])}) {
> ++		case "CON", "PRN", "AUX", "NUL":
> ++			return len(name) =3D=3D 3
> ++		case "COM", "LPT":
> ++			return len(name) =3D=3D 4 && '1' <=3D name[3] && name[3] <=3D '9'
> ++		}
> ++	}
> ++	return false
> ++}
> ++
> ++func toUpper(c byte) byte {
> ++	if 'a' <=3D c && c <=3D 'z' {
> ++		return c - ('a' - 'A')
> ++	}
> ++	return c
> ++}
> +diff --git a/src/net/http/fs.go b/src/net/http/fs.go
> +index 57e731e..43ee4b5 100644
> +--- a/src/net/http/fs.go
> ++++ b/src/net/http/fs.go
> +@@ -9,6 +9,7 @@ package http
> + import (
> + 	"errors"
> + 	"fmt"
> ++	"internal/safefilepath"
> + 	"io"
> + 	"io/fs"
> + 	"mime" +@@ -69,14 +70,15 @@ func mapDirOpenError(originalErr error, =
name=20
> string) error { + // Open implements FileSystem using os.Open, opening=20
> files for reading rooted + // and relative to the directory d. + func=20
> (d Dir) Open(name string) (File, error) { +- if filepath.Separator !=3D=
=20
> '/' && strings.ContainsRune(name, filepath.Separator) { +- return nil,=20
> errors.New("http: invalid character in file path")
> ++	path, err :=3D safefilepath.FromFS(path.Clean("/" + name))
> ++	if err !=3D nil {
> ++		return nil, errors.New("http: invalid or unsafe file path")
> + 	}
> + 	dir :=3D string(d)
> + 	if dir =3D=3D "" {
> + 		dir =3D "."
> + 	}
> +-	fullName :=3D filepath.Join(dir, filepath.FromSlash(path.Clean("/"+n=
ame)))
> ++	fullName :=3D filepath.Join(dir, path)
> + 	f, err :=3D os.Open(fullName)
> + 	if err !=3D nil {
> + 		return nil, mapDirOpenError(err, fullName)
> +diff --git a/src/net/http/fs_test.go b/src/net/http/fs_test.go
> +index b42ade1..941448a 100644
> +--- a/src/net/http/fs_test.go
> ++++ b/src/net/http/fs_test.go
> +@@ -648,6 +648,34 @@ func TestFileServerZeroByte(t *testing.T) {
> + 	}
> + }
> +
> ++func TestFileServerNamesEscape(t *testing.T) {
> ++	t.Run("h1", func(t *testing.T) {
> ++		testFileServerNamesEscape(t, h1Mode)
> ++	})
> ++	t.Run("h2", func(t *testing.T) {
> ++		testFileServerNamesEscape(t, h2Mode)
> ++	})
> ++}
> ++func testFileServerNamesEscape(t *testing.T, h2 bool) {
> ++	defer afterTest(t)
> ++	ts :=3D newClientServerTest(t, h2, FileServer(Dir("testdata"))).ts
> ++	defer ts.Close()
> ++	for _, path :=3D range []string{
> ++		"/../testdata/file",
> ++		"/NUL", // don't read from device files on Windows
> ++	} {
> ++		res, err :=3D ts.Client().Get(ts.URL + path)
> ++		if err !=3D nil {
> ++			t.Fatal(err)
> ++		}
> ++		res.Body.Close()
> ++		if res.StatusCode < 400 || res.StatusCode > 599 {
> ++			t.Errorf("Get(%q): got status %v, want 4xx or 5xx", path, res.Stat=
usCode)
> ++		}
> ++
> ++	}
> ++}
> ++
> + type fakeFileInfo struct {
> + 	dir      bool
> + 	basename string
> +diff --git a/src/os/file.go b/src/os/file.go
> +index e717f17..cb87158 100644
> +--- a/src/os/file.go
> ++++ b/src/os/file.go
> +@@ -37,12 +37,12 @@
> + // Note: The maximum number of concurrent operations on a File may be=
 limited by
> + // the OS or the system. The number should be high, but exceeding it =
may degrade
> + // performance or cause other issues.
> +-//
> + package os
> +
> + import (
> + 	"errors"
> + 	"internal/poll"
> ++	"internal/safefilepath"
> + 	"internal/testlog"
> + 	"internal/unsafeheader"
> + 	"io" +@@ -623,6 +623,8 @@ func isWindowsNulName(name string) bool { =
+ //=20
> the /prefix tree, then using DirFS does not stop the access any more=20
> than using + // os.Open does. DirFS is therefore not a general=20
> substitute for a chroot-style security + // mechanism when the=20
> directory tree contains arbitrary content. ++// ++// The directory dir=20
> must not be "".
> + func DirFS(dir string) fs.FS {
> + 	return dirFS(dir)
> + }
> +@@ -641,10 +643,11 @@ func containsAny(s, chars string) bool {
> + type dirFS string
> +
> + func (dir dirFS) Open(name string) (fs.File, error) {
> +-	if !fs.ValidPath(name) || runtime.GOOS =3D=3D "windows" && containsA=
ny(name, `\:`) {
> +-		return nil, &PathError{Op: "open", Path: name, Err: ErrInvalid}
> ++	fullname, err :=3D dir.join(name)
> ++	if err !=3D nil {
> ++		return nil, &PathError{Op: "stat", Path: name, Err: err}
> + 	}
> +-	f, err :=3D Open(string(dir) + "/" + name)
> ++	f, err :=3D Open(fullname)
> + 	if err !=3D nil {
> + 		return nil, err // nil fs.File
> + 	}
> +@@ -652,16 +655,35 @@ func (dir dirFS) Open(name string) (fs.File, err=
or) {
> + }
> +
> + func (dir dirFS) Stat(name string) (fs.FileInfo, error) {
> +-	if !fs.ValidPath(name) || runtime.GOOS =3D=3D "windows" && containsA=
ny(name, `\:`) {
> +-		return nil, &PathError{Op: "stat", Path: name, Err: ErrInvalid}
> ++	fullname, err :=3D dir.join(name)
> ++	if err !=3D nil {
> ++		return nil, &PathError{Op: "stat", Path: name, Err: err}
> + 	}
> +-	f, err :=3D Stat(string(dir) + "/" + name)
> ++	f, err :=3D Stat(fullname)
> + 	if err !=3D nil {
> + 		return nil, err
> + 	}
> + 	return f, nil
> + }
> +
> ++// join returns the path for name in dir.
> ++func (dir dirFS) join(name string) (string, error) {
> ++	if dir =3D=3D "" {
> ++		return "", errors.New("os: DirFS with empty root")
> ++	}
> ++	if !fs.ValidPath(name) {
> ++		return "", ErrInvalid
> ++	}
> ++	name, err :=3D safefilepath.FromFS(name)
> ++	if err !=3D nil {
> ++		return "", ErrInvalid
> ++	}
> ++	if IsPathSeparator(dir[len(dir)-1]) {
> ++		return string(dir) + name, nil
> ++	}
> ++	return string(dir) + string(PathSeparator) + name, nil
> ++}
> ++
> + // ReadFile reads the named file and returns the contents.
> + // A successful call returns err =3D=3D nil, not err =3D=3D EOF.
> + // Because ReadFile reads the whole file, it does not treat an EOF fr=
om Read
> +diff --git a/src/os/os_test.go b/src/os/os_test.go
> +index 506f1fb..be269bb 100644
> +--- a/src/os/os_test.go
> ++++ b/src/os/os_test.go
> +@@ -2702,6 +2702,44 @@ func TestDirFS(t *testing.T) {
> + 	if err =3D=3D nil {
> + 		t.Fatalf(`Open testdata\dirfs succeeded`)
> + 	}
> ++
> ++	// Test that Open does not open Windows device files.
> ++	_, err =3D d.Open(`NUL`)
> ++	if err =3D=3D nil {
> ++		t.Errorf(`Open NUL succeeded`)
> ++	}
> ++}
> ++
> ++func TestDirFSRootDir(t *testing.T) {
> ++	cwd, err :=3D os.Getwd()
> ++	if err !=3D nil {
> ++		t.Fatal(err)
> ++	}
> ++	cwd =3D cwd[len(filepath.VolumeName(cwd)):] // trim volume prefix (C=
:) on Windows
> ++	cwd =3D filepath.ToSlash(cwd)               // convert \ to /
> ++	cwd =3D strings.TrimPrefix(cwd, "/")        // trim leading /
> ++
> ++	// Test that Open can open a path starting at /.
> ++	d :=3D DirFS("/")
> ++	f, err :=3D d.Open(cwd + "/testdata/dirfs/a")
> ++	if err !=3D nil {
> ++		t.Fatal(err)
> ++	}
> ++	f.Close()
> ++}
> ++
> ++func TestDirFSEmptyDir(t *testing.T) {
> ++	d :=3D DirFS("")
> ++	cwd, _ :=3D os.Getwd()
> ++	for _, path :=3D range []string{
> ++		"testdata/dirfs/a",                          // not DirFS(".")
> ++		filepath.ToSlash(cwd) + "/testdata/dirfs/a", // not DirFS("/")
> ++	} {
> ++		_, err :=3D d.Open(path)
> ++		if err =3D=3D nil {
> ++			t.Fatalf(`DirFS("").Open(%q) succeeded`, path)
> ++		}
> ++	}
> + }
> +
> + func TestDirFSPathsValid(t *testing.T) {
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178840):https://lists.openembedded.org/g/openembedd=
ed-core/message/178840
> Mute This Topic:https://lists.openembedded.org/mt/97740601/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------GMfZCS5AlRV0P9ZH2HAAENLE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32KKvE5k016670

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2023-03-20 16:09, Sakib Sajal via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20230320200908.1233173-1-sakib.=
sajal@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">Backport appropriate patches=
 to fix CVE-2022-2879 and CVE-2022-41720.

Modified the original fix for CVE-2022-2879 to remove a testdata tarball
and any references to it since git binary diffs are not supported in quil=
t.

Signed-off-by: Sakib Sajal <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  36 +-
 ...01-archive-tar-limit-size-of-headers.patch | 177 ++++++
 ...d-escapes-from-os.DirFS-and-http.Dir.patch | 514 ++++++++++++++++++
 3 files changed, 710 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.18/0001-archive-tar-lim=
it-size-of-headers.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/0002-os-net-http-avo=
id-escapes-from-os.DirFS-and-http.Dir.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devto=
ols/go/go-1.17.13.inc
index 99662bd298..f5cf192361 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -4,23 +4,25 @@ FILESEXTRAPATHS:prepend :=3D &quot;${FILE_DIRNAME}/go-1=
.18:&quot;
=20
 LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://L=
ICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707">&quot;file://LICENSE;md5=3D=
5d4950ecb7b26d2c5e4e7b4e0dd74707&quot;</a>
=20
-SRC_URI +=3D &quot;\
-    <a class=3D"moz-txt-link-freetext" href=3D"file://0001-allow-CC-and-=
CXX-to-have-multiple-words.patch">file://0001-allow-CC-and-CXX-to-have-mu=
ltiple-words.patch</a> \
-    <a class=3D"moz-txt-link-freetext" href=3D"file://0002-cmd-go-make-c=
ontent-based-hash-generation-less-pedan.patch">file://0002-cmd-go-make-co=
ntent-based-hash-generation-less-pedan.patch</a> \
-    <a class=3D"moz-txt-link-freetext" href=3D"file://0003-allow-GOTOOLD=
IR-to-be-overridden-in-the-environment.patch">file://0003-allow-GOTOOLDIR=
-to-be-overridden-in-the-environment.patch</a> \
-    <a class=3D"moz-txt-link-freetext" href=3D"file://0004-ld-add-soname=
-to-shareable-objects.patch">file://0004-ld-add-soname-to-shareable-objec=
ts.patch</a> \
-    <a class=3D"moz-txt-link-freetext" href=3D"file://0005-make.bash-ove=
rride-CC-when-building-dist-and-go_boot.patch">file://0005-make.bash-over=
ride-CC-when-building-dist-and-go_boot.patch</a> \
-    <a class=3D"moz-txt-link-freetext" href=3D"file://0006-cmd-dist-sepa=
rate-host-and-target-builds.patch">file://0006-cmd-dist-separate-host-and=
-target-builds.patch</a> \
-    <a class=3D"moz-txt-link-freetext" href=3D"file://0007-cmd-go-make-G=
OROOT-precious-by-default.patch">file://0007-cmd-go-make-GOROOT-precious-=
by-default.patch</a> \
-    <a class=3D"moz-txt-link-freetext" href=3D"file://0008-use-GOBUILDMO=
DE-to-set-buildmode.patch">file://0008-use-GOBUILDMODE-to-set-buildmode.p=
atch</a> \
-    <a class=3D"moz-txt-link-freetext" href=3D"file://0009-Revert-cmd-go=
-make-sure-CC-and-CXX-are-absolute.patch">file://0009-Revert-cmd-go-make-=
sure-CC-and-CXX-are-absolute.patch</a> \
-    <a class=3D"moz-txt-link-freetext" href=3D"file://0001-exec.go-do-no=
t-write-linker-flags-into-buildids.patch">file://0001-exec.go-do-not-writ=
e-linker-flags-into-buildids.patch</a> \
-    <a class=3D"moz-txt-link-freetext" href=3D"file://0001-src-cmd-dist-=
buildgo.go-do-not-hardcode-host-compile.patch">file://0001-src-cmd-dist-b=
uildgo.go-do-not-hardcode-host-compile.patch</a> \
-    <a class=3D"moz-txt-link-freetext" href=3D"file://CVE-2022-27664.pat=
ch">file://CVE-2022-27664.patch</a> \
-    <a class=3D"moz-txt-link-freetext" href=3D"file://0001-net-http-http=
util-avoid-query-parameter-smuggling.patch">file://0001-net-http-httputil=
-avoid-query-parameter-smuggling.patch</a> \
-    <a class=3D"moz-txt-link-freetext" href=3D"file://CVE-2022-41715.pat=
ch">file://CVE-2022-41715.patch</a> \
-    <a class=3D"moz-txt-link-freetext" href=3D"file://CVE-2022-41717.pat=
ch">file://CVE-2022-41717.patch</a> \
-&quot;
+SRC_URI =3D &quot;<a class=3D"moz-txt-link-freetext" href=3D"https://gol=
ang.org/dl/go$">https://golang.org/dl/go$</a>{PV}.src.tar.gz;name=3Dmain =
\</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Nack.</p>
    <p><br>
    </p>
    <p>Sakib,<br>
    </p>
    <p>You said this works for you but if you look at:</p>
    <p>=E2=9D=AF cat meta/recipes-devtools/go/go-1.17.13.inc <br>
      require go-common.inc<br>
      <br>
      FILESEXTRAPATHS:prepend :=3D &quot;${FILE_DIRNAME}/go-1.18:&quot;<b=
r>
      <br>
      LIC_FILES_CHKSUM =3D
      <a class=3D"moz-txt-link-rfc2396E" href=3D"file://LICENSE;md5=3D5d4=
950ecb7b26d2c5e4e7b4e0dd74707">&quot;file://LICENSE;md5=3D5d4950ecb7b26d2=
c5e4e7b4e0dd74707&quot;</a><br>
      <br>
      SRC_URI +=3D &quot;\<br>
      &nbsp;...<br>
    </p>
    <p>and then <br>
    </p>
    <p>=E2=9D=AF grep SRC_URI meta/recipes-devtools/go/go-common.inc <br>
      SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://gola=
ng.org/dl/go${PV}.src.tar.gz;name=3Dmain">&quot;https://golang.org/dl/go$=
{PV}.src.tar.gz;name=3Dmain&quot;</a><br>
    </p>
    <p>You see that you should stick with the +=3D operator.</p>
    <p>I think you said that devtool changed that , right?</p>
    <p>If so, and if we can learn why this change even built for you,<br>
      then consider opening a bug against devtool.</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20230320200908.1233173-1-sakib.=
sajal@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
+           <a class=3D"moz-txt-link-freetext" href=3D"file://0001-allow-=
CC-and-CXX-to-have-multiple-words.patch">file://0001-allow-CC-and-CXX-to-=
have-multiple-words.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://0002-cmd-go=
-make-content-based-hash-generation-less-pedan.patch">file://0002-cmd-go-=
make-content-based-hash-generation-less-pedan.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://0003-allow-=
GOTOOLDIR-to-be-overridden-in-the-environment.patch">file://0003-allow-GO=
TOOLDIR-to-be-overridden-in-the-environment.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://0004-ld-add=
-soname-to-shareable-objects.patch">file://0004-ld-add-soname-to-shareabl=
e-objects.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://0005-make.b=
ash-override-CC-when-building-dist-and-go_boot.patch">file://0005-make.ba=
sh-override-CC-when-building-dist-and-go_boot.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://0006-cmd-di=
st-separate-host-and-target-builds.patch">file://0006-cmd-dist-separate-h=
ost-and-target-builds.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://0007-cmd-go=
-make-GOROOT-precious-by-default.patch">file://0007-cmd-go-make-GOROOT-pr=
ecious-by-default.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://0008-use-GO=
BUILDMODE-to-set-buildmode.patch">file://0008-use-GOBUILDMODE-to-set-buil=
dmode.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://0009-Revert=
-cmd-go-make-sure-CC-and-CXX-are-absolute.patch">file://0009-Revert-cmd-g=
o-make-sure-CC-and-CXX-are-absolute.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://0001-exec.g=
o-do-not-write-linker-flags-into-buildids.patch">file://0001-exec.go-do-n=
ot-write-linker-flags-into-buildids.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://0001-src-cm=
d-dist-buildgo.go-do-not-hardcode-host-compile.patch">file://0001-src-cmd=
-dist-buildgo.go-do-not-hardcode-host-compile.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://CVE-2022-27=
664.patch">file://CVE-2022-27664.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://0001-net-ht=
tp-httputil-avoid-query-parameter-smuggling.patch">file://0001-net-http-h=
ttputil-avoid-query-parameter-smuggling.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://CVE-2022-41=
715.patch">file://CVE-2022-41715.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://CVE-2022-41=
717.patch">file://CVE-2022-41717.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://0001-archiv=
e-tar-limit-size-of-headers.patch">file://0001-archive-tar-limit-size-of-=
headers.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://0002-os-net=
-http-avoid-escapes-from-os.DirFS-and-http.Dir.patch">file://0002-os-net-=
http-avoid-escapes-from-os.DirFS-and-http.Dir.patch</a> \
+           &quot;
 SRC_URI[main.sha256sum] =3D &quot;a1a48b23afb206f95e7bbaa9b898d965f90826=
f6f1d1fc0c1d784ada0cd300fd&quot;
=20
 # Upstream don't believe it is a signifiant real world issue and will on=
ly
diff --git a/meta/recipes-devtools/go/go-1.18/0001-archive-tar-limit-size=
-of-headers.patch b/meta/recipes-devtools/go/go-1.18/0001-archive-tar-lim=
it-size-of-headers.patch
new file mode 100644
index 0000000000..0315e1a3ee
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/0001-archive-tar-limit-size-of-hea=
ders.patch
@@ -0,0 +1,177 @@
+From d064ed520a7cc6b480f9565e30751e695d394f4e Mon Sep 17 00:00:00 2001
+From: Damien Neil <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:dnei=
l@google.com">&lt;dneil@google.com&gt;</a>
+Date: Fri, 2 Sep 2022 20:45:18 -0700
+Subject: [PATCH] archive/tar: limit size of headers
+
+Set a 1MiB limit on special file blocks (PAX headers, GNU long names,
+GNU link names), to avoid reading arbitrarily large amounts of data
+into memory.
+
+Thanks to Adam Korczynski (ADA Logics) and OSS-Fuzz for reporting
+this issue.
+
+Fixes CVE-2022-2879
+Updates #54853
+Fixes #55925
+
+Change-Id: I85136d6ff1e0af101a112190e027987ab4335680
+Reviewed-on: <a class=3D"moz-txt-link-freetext" href=3D"https://team-rev=
iew.git.corp.google.com/c/golang/go-private/+/1565555">https://team-revie=
w.git.corp.google.com/c/golang/go-private/+/1565555</a>
+Reviewed-by: Tatiana Bradley <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:tatianabradley@google.com">&lt;tatianabradley@google.com&gt;</a>
+Run-TryBot: Roland Shoemaker <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:bracewell@google.com">&lt;bracewell@google.com&gt;</a>
+Reviewed-by: Roland Shoemaker <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:bracewell@google.com">&lt;bracewell@google.com&gt;</a>
+(cherry picked from commit 6ee768cef6b82adf7a90dcf367a1699ef694f3b2)
+Reviewed-on: <a class=3D"moz-txt-link-freetext" href=3D"https://team-rev=
iew.git.corp.google.com/c/golang/go-private/+/1590622">https://team-revie=
w.git.corp.google.com/c/golang/go-private/+/1590622</a>
+Reviewed-by: Damien Neil <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:dneil@google.com">&lt;dneil@google.com&gt;</a>
+Reviewed-by: Julie Qiu <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:julieqiu@google.com">&lt;julieqiu@google.com&gt;</a>
+Reviewed-on: <a class=3D"moz-txt-link-freetext" href=3D"https://go-revie=
w.googlesource.com/c/go/+/438500">https://go-review.googlesource.com/c/go=
/+/438500</a>
+Reviewed-by: Dmitri Shuralyov <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:dmitshur@golang.org">&lt;dmitshur@golang.org&gt;</a>
+Reviewed-by: Carlos Amedee <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:carlos@golang.org">&lt;carlos@golang.org&gt;</a>
+Reviewed-by: Dmitri Shuralyov <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:dmitshur@google.com">&lt;dmitshur@google.com&gt;</a>
+Run-TryBot: Carlos Amedee <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:carlos@golang.org">&lt;carlos@golang.org&gt;</a>
+TryBot-Result: Gopher Robot <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:gobot@golang.org">&lt;gobot@golang.org&gt;</a>
+
+CVE: CVE-2022-2879
+Upstream-Status: Backport [0a723816cd205576945fa57fbdde7e6532d59d08]
+Signed-off-by: Sakib Sajal <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
+---
+ src/archive/tar/format.go      |  4 ++++
+ src/archive/tar/reader.go      | 14 ++++++++++++--
+ src/archive/tar/reader_test.go |  8 +++++++-
+ src/archive/tar/writer.go      |  3 +++
+ src/archive/tar/writer_test.go | 27 +++++++++++++++++++++++++++
+ 5 files changed, 53 insertions(+), 3 deletions(-)
+
+diff --git a/src/archive/tar/format.go b/src/archive/tar/format.go
+index cfe24a5..6642364 100644
+--- a/src/archive/tar/format.go
++++ b/src/archive/tar/format.go
+@@ -143,6 +143,10 @@ const (
+ 	blockSize  =3D 512 // Size of each block in a tar stream
+ 	nameSize   =3D 100 // Max length of the name field in USTAR format
+ 	prefixSize =3D 155 // Max length of the prefix field in USTAR format
++
++	// Max length of a special file (PAX header, GNU long name or link).
++	// This matches the limit used by libarchive.
++	maxSpecialFileSize =3D 1 &lt;&lt; 20
+ )
+=20
+ // blockPadding computes the number of bytes needed to pad offset up to=
 the
+diff --git a/src/archive/tar/reader.go b/src/archive/tar/reader.go
+index 1b1d5b4..f645af8 100644
+--- a/src/archive/tar/reader.go
++++ b/src/archive/tar/reader.go
+@@ -103,7 +103,7 @@ func (tr *Reader) next() (*Header, error) {
+ 			continue // This is a meta header affecting the next header
+ 		case TypeGNULongName, TypeGNULongLink:
+ 			format.mayOnlyBe(FormatGNU)
+-			realname, err :=3D io.ReadAll(tr)
++			realname, err :=3D readSpecialFile(tr)
+ 			if err !=3D nil {
+ 				return nil, err
+ 			}
+@@ -293,7 +293,7 @@ func mergePAX(hdr *Header, paxHdrs map[string]string=
) (err error) {
+ // parsePAX parses PAX headers.
+ // If an extended header (type 'x') is invalid, ErrHeader is returned
+ func parsePAX(r io.Reader) (map[string]string, error) {
+-	buf, err :=3D io.ReadAll(r)
++	buf, err :=3D readSpecialFile(r)
+ 	if err !=3D nil {
+ 		return nil, err
+ 	}
+@@ -826,6 +826,16 @@ func tryReadFull(r io.Reader, b []byte) (n int, err=
 error) {
+ 	return n, err
+ }
+=20
++// readSpecialFile is like io.ReadAll except it returns
++// ErrFieldTooLong if more than maxSpecialFileSize is read.
++func readSpecialFile(r io.Reader) ([]byte, error) {
++	buf, err :=3D io.ReadAll(io.LimitReader(r, maxSpecialFileSize+1))
++	if len(buf) &gt; maxSpecialFileSize {
++		return nil, ErrFieldTooLong
++	}
++	return buf, err
++}
++
+ // discard skips n bytes in r, reporting an error if unable to do so.
+ func discard(r io.Reader, n int64) error {
+ 	// If possible, Seek to the last byte before the end of the data secti=
on.
+diff --git a/src/archive/tar/reader_test.go b/src/archive/tar/reader_tes=
t.go
+index 789ddc1..926dc3d 100644
+--- a/src/archive/tar/reader_test.go
++++ b/src/archive/tar/reader_test.go
+@@ -6,6 +6,7 @@ package tar
+=20
+ import (
+ 	&quot;bytes&quot;
++	&quot;compress/bzip2&quot;
+ 	&quot;crypto/md5&quot;
+ 	&quot;errors&quot;
+ 	&quot;fmt<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:+@@-625,9+6=
26,14@@funcTestReader(t*testing.T){+}+deferf.Close()+++varfrio.Reader=3Df=
++ifstrings.HasSuffix(v.file,">&quot;
+@@ -625,9 +626,14 @@ func TestReader(t *testing.T) {
+ 			}
+ 			defer f.Close()
+=20
++			var fr io.Reader =3D f
++			if strings.HasSuffix(v.file, &quot;</a>.bz2&quot;) {
++				fr =3D bzip2.NewReader(fr)
++			}
++
+ 			// Capture all headers and checksums.
+ 			var (
+-				tr      =3D NewReader(f)
++				tr      =3D NewReader(fr)
+ 				hdrs    []*Header
+ 				chksums []string
+ 				rdbuf   =3D make([]byte, 8)
+diff --git a/src/archive/tar/writer.go b/src/archive/tar/writer.go
+index e80498d..893eac0 100644
+--- a/src/archive/tar/writer.go
++++ b/src/archive/tar/writer.go
+@@ -199,6 +199,9 @@ func (tw *Writer) writePAXHeader(hdr *Header, paxHdr=
s map[string]string) error {
+ 			flag =3D TypeXHeader
+ 		}
+ 		data :=3D buf.String()
++		if len(data) &gt; maxSpecialFileSize {
++			return ErrFieldTooLong
++		}
+ 		if err :=3D tw.writeRawFile(name, data, flag, FormatPAX); err !=3D ni=
l || isGlobal {
+ 			return err // Global headers return here
+ 		}
+diff --git a/src/archive/tar/writer_test.go b/src/archive/tar/writer_tes=
t.go
+index a00f02d..4e709e5 100644
+--- a/src/archive/tar/writer_test.go
++++ b/src/archive/tar/writer_test.go
+@@ -1006,6 +1006,33 @@ func TestIssue12594(t *testing.T) {
+ 	}
+ }
+=20
++func TestWriteLongHeader(t *testing.T) {
++	for _, test :=3D range []struct {
++		name string
++		h    *Header
++	}{{
++		name: &quot;name too long&quot;,
++		h:    &amp;Header{Name: strings.Repeat(&quot;a&quot;, maxSpecialFileS=
ize)},
++	}, {
++		name: &quot;linkname too long&quot;,
++		h:    &amp;Header{Linkname: strings.Repeat(&quot;a&quot;, maxSpecialF=
ileSize)},
++	}, {
++		name: &quot;uname too long&quot;,
++		h:    &amp;Header{Uname: strings.Repeat(&quot;a&quot;, maxSpecialFile=
Size)},
++	}, {
++		name: &quot;gname too long&quot;,
++		h:    &amp;Header{Gname: strings.Repeat(&quot;a&quot;, maxSpecialFile=
Size)},
++	}, {
++		name: &quot;PAX header too long&quot;,
++		h:    &amp;Header{PAXRecords: map[string]string{&quot;GOLANG.x&quot;:=
 strings.Repeat(&quot;a&quot;, maxSpecialFileSize)}},
++	}} {
++		w :=3D NewWriter(io.Discard)
++		if err :=3D w.WriteHeader(test.h); err !=3D ErrFieldTooLong {
++			t.Errorf(&quot;%v: w.WriteHeader() =3D %v, want ErrFieldTooLong&quot=
;, test.name, err)
++		}
++	}
++}
++
+ // testNonEmptyWriter wraps an io.Writer and ensures that
+ // Write is never called with an empty buffer.
+ type testNonEmptyWriter struct{ io.Writer }
diff --git a/meta/recipes-devtools/go/go-1.18/0002-os-net-http-avoid-esca=
pes-from-os.DirFS-and-http.Dir.patch b/meta/recipes-devtools/go/go-1.18/0=
002-os-net-http-avoid-escapes-from-os.DirFS-and-http.Dir.patch
new file mode 100644
index 0000000000..6c2e8804b3
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/0002-os-net-http-avoid-escapes-fro=
m-os.DirFS-and-http.Dir.patch
@@ -0,0 +1,514 @@
+From f8896a97a0630b0f2f8c488310147f7f20b3ec7d Mon Sep 17 00:00:00 2001
+From: Damien Neil <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:dnei=
l@google.com">&lt;dneil@google.com&gt;</a>
+Date: Thu, 10 Nov 2022 12:16:27 -0800
+Subject: [PATCH] os, net/http: avoid escapes from os.DirFS and http.Dir =
on
+ Windows
+
+Do not permit access to Windows reserved device names (NUL, COM1, etc.)
+via os.DirFS and http.Dir filesystems.
+
+Avoid escapes from os.DirFS(`\`) on Windows. DirFS would join the
+the root to the relative path with a path separator, making
+os.DirFS(`\`).Open(`/foo/bar`) open the path `\\foo\bar`, which is
+a UNC name. Not only does this not open the intended file, but permits
+reference to any file on the system rather than only files on the
+current drive.
+
+Make os.DirFS(&quot;&quot;) invalid, with all file access failing. Previ=
ously,
+a root of &quot;&quot; was interpreted as &quot;/&quot;, which is surpri=
sing and probably
+unintentional.
+
+Fixes CVE-2022-41720.
+Fixes #56694.
+
+Change-Id: I275b5fa391e6ad7404309ea98ccc97405942e0f0
+Reviewed-on: <a class=3D"moz-txt-link-freetext" href=3D"https://team-rev=
iew.git.corp.google.com/c/golang/go-private/+/1663832">https://team-revie=
w.git.corp.google.com/c/golang/go-private/+/1663832</a>
+Reviewed-by: Julie Qiu <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:julieqiu@google.com">&lt;julieqiu@google.com&gt;</a>
+Reviewed-by: Tatiana Bradley <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:tatianabradley@google.com">&lt;tatianabradley@google.com&gt;</a>
+Reviewed-on: <a class=3D"moz-txt-link-freetext" href=3D"https://go-revie=
w.googlesource.com/c/go/+/455360">https://go-review.googlesource.com/c/go=
/+/455360</a>
+Reviewed-by: Michael Pratt <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:mpratt@google.com">&lt;mpratt@google.com&gt;</a>
+TryBot-Result: Gopher Robot <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:gobot@golang.org">&lt;gobot@golang.org&gt;</a>
+Run-TryBot: Jenny Rakoczy <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:jenny@golang.org">&lt;jenny@golang.org&gt;</a>
+
+CVE: CVE-2022-41720
+Upstream-Status: Backport [7013a4f5f816af62033ad63dd06b77c30d7a62a7]
+Signed-off-by: Sakib Sajal <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
+---
+ src/go/build/deps_test.go                 |  1 +
+ src/internal/safefilepath/path.go         | 21 +++++
+ src/internal/safefilepath/path_other.go   | 23 ++++++
+ src/internal/safefilepath/path_test.go    | 88 +++++++++++++++++++++
+ src/internal/safefilepath/path_windows.go | 95 +++++++++++++++++++++++
+ src/net/http/fs.go                        |  8 +-
+ src/net/http/fs_test.go                   | 28 +++++++
+ src/os/file.go                            | 36 +++++++--
+ src/os/os_test.go                         | 38 +++++++++
+ 9 files changed, 328 insertions(+), 10 deletions(-)
+ create mode 100644 src/internal/safefilepath/path.go
+ create mode 100644 src/internal/safefilepath/path_other.go
+ create mode 100644 src/internal/safefilepath/path_test.go
+ create mode 100644 src/internal/safefilepath/path_windows.go
+
+diff --git a/src/go/build/deps_test.go b/src/go/build/deps_test.go
+index 45e2f25..dc3bb8c 100644
+--- a/src/go/build/deps_test.go
++++ b/src/go/build/deps_test.go
+@@ -165,6 +165,7 @@ var depsRules =3D `
+ 	io/fs
+ 	&lt; internal/testlog
+ 	&lt; internal/poll
++	&lt; internal/safefilepath
+ 	&lt; os
+ 	&lt; os/signal;
+=20
+diff --git a/src/internal/safefilepath/path.go b/src/internal/safefilepa=
th/path.go
+new file mode 100644
+index 0000000..0f0a270
+--- /dev/null
++++ b/src/internal/safefilepath/path.go
+@@ -0,0 +1,21 @@
++// Copyright 2022 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++// Package safefilepath manipulates operating-system file paths.
++package safefilepath
++
++import (
++	&quot;errors&quot;
++)
++
++var errInvalidPath =3D errors.New(&quot;invalid path&quot;)
++
++// FromFS converts a slash-separated path into an operating-system path.
++//
++// FromFS returns an error if the path cannot be represented by the ope=
rating
++// system. For example, paths containing '\' and ':' characters are rej=
ected
++// on Windows.
++func FromFS(path string) (string, error) {
++	return fromFS(path)
++}
+diff --git a/src/internal/safefilepath/path_other.go b/src/internal/safe=
filepath/path_other.go
+new file mode 100644
+index 0000000..f93da18
+--- /dev/null
++++ b/src/internal/safefilepath/path_other.go
+@@ -0,0 +1,23 @@
++// Copyright 2022 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++//go:build !windows
++
++package safefilepath
++
++import &quot;runtime&quot;
++
++func fromFS(path string) (string, error) {
++	if runtime.GOOS =3D=3D &quot;plan9&quot; {
++		if len(path) &gt; 0 &amp;&amp; path[0] =3D=3D '#' {
++			return path, errInvalidPath
++		}
++	}
++	for i :=3D range path {
++		if path[i] =3D=3D 0 {
++			return &quot;&quot;, errInvalidPath
++		}
++	}
++	return path, nil
++}
+diff --git a/src/internal/safefilepath/path_test.go b/src/internal/safef=
ilepath/path_test.go
+new file mode 100644
+index 0000000..dc662c1
+--- /dev/null
++++ b/src/internal/safefilepath/path_test.go
+@@ -0,0 +1,88 @@
++// Copyright 2022 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++package safefilepath_test
++
++import (
++	&quot;internal/safefilepath&quot;
++	&quot;os&quot;
++	&quot;path/filepath&quot;
++	&quot;runtime&quot;
++	&quot;testing&quot;
++)
++
++type PathTest struct {
++	path, result string
++}
++
++const invalid =3D &quot;&quot;
++
++var fspathtests =3D []PathTest{
++	{&quot;.&quot;, &quot;.&quot;},
++	{&quot;/a/b/c&quot;, &quot;/a/b/c&quot;},
++	{&quot;a\x00b&quot;, invalid},
++}
++
++var winreservedpathtests =3D []PathTest{
++	{`a\b`, `a\b`},
++	{`a:b`, `a:b`},
++	{`a/b:c`, `a/b:c`},
++	{`NUL`, `NUL`},
++	{`./com1`, `./com1`},
++	{`a/nul/b`, `a/nul/b`},
++}
++
++// Whether a reserved name with an extension is reserved or not varies =
by
++// Windows version.
++var winreservedextpathtests =3D []PathTest{
++	{&quot;nul.txt&quot;, &quot;nul.txt&quot;},
++	{&quot;a/nul.txt/b&quot;, &quot;a/nul.txt/b&quot;},
++}
++
++var plan9reservedpathtests =3D []PathTest{
++	{`#c`, `#c`},
++}
++
++func TestFromFS(t *testing.T) {
++	switch runtime.GOOS {
++	case &quot;windows&quot;:
++		if canWriteFile(t, &quot;NUL&quot;) {
++			t.Errorf(&quot;can unexpectedly write a file named NUL on Windows&qu=
ot;)
++		}
++		if canWriteFile(t, &quot;nul.txt&quot;) {
++			fspathtests =3D append(fspathtests, winreservedextpathtests...)
++		} else {
++			winreservedpathtests =3D append(winreservedpathtests, winreservedext=
pathtests...)
++		}
++		for i :=3D range winreservedpathtests {
++			winreservedpathtests[i].result =3D invalid
++		}
++		for i :=3D range fspathtests {
++			fspathtests[i].result =3D filepath.FromSlash(fspathtests[i].result)
++		}
++	case &quot;plan9&quot;:
++		for i :=3D range plan9reservedpathtests {
++			plan9reservedpathtests[i].result =3D invalid
++		}
++	}
++	tests :=3D fspathtests
++	tests =3D append(tests, winreservedpathtests...)
++	tests =3D append(tests, plan9reservedpathtests...)
++	for _, test :=3D range tests {
++		got, err :=3D safefilepath.FromFS(test.path)
++		if (got =3D=3D &quot;&quot;) !=3D (err !=3D nil) {
++			t.Errorf(`FromFS(%q) =3D %q, %v; want &quot;&quot; only if err !=3D =
nil`, test.path, got, err)
++		}
++		if got !=3D test.result {
++			t.Errorf(&quot;FromFS(%q) =3D %q, %v; want %q&quot;, test.path, got,=
 err, test.result)
++		}
++	}
++}
++
++func canWriteFile(t *testing.T, name string) bool {
++	path :=3D filepath.Join(t.TempDir(), name)
++	os.WriteFile(path, []byte(&quot;ok&quot;), 0666)
++	b, _ :=3D os.ReadFile(path)
++	return string(b) =3D=3D &quot;ok&quot;
++}
+diff --git a/src/internal/safefilepath/path_windows.go b/src/internal/sa=
fefilepath/path_windows.go
+new file mode 100644
+index 0000000..909c150
+--- /dev/null
++++ b/src/internal/safefilepath/path_windows.go
+@@ -0,0 +1,95 @@
++// Copyright 2022 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++package safefilepath
++
++import (
++	&quot;syscall&quot;
++	&quot;unicode/utf8&quot;
++)
++
++func fromFS(path string) (string, error) {
++	if !utf8.ValidString(path) {
++		return &quot;&quot;, errInvalidPath
++	}
++	for len(path) &gt; 1 &amp;&amp; path[0] =3D=3D '/' &amp;&amp; path[1] =
=3D=3D '/' {
++		path =3D path[1:]
++	}
++	containsSlash :=3D false
++	for p :=3D path; p !=3D &quot;&quot;; {
++		// Find the next path element.
++		i :=3D 0
++		dot :=3D -1
++		for i &lt; len(p) &amp;&amp; p[i] !=3D '/' {
++			switch p[i] {
++			case 0, '\\', ':':
++				return &quot;&quot;, errInvalidPath
++			case '.':
++				if dot &lt; 0 {
++					dot =3D i
++				}
++			}
++			i++
++		}
++		part :=3D p[:i]
++		if i &lt; len(p) {
++			containsSlash =3D true
++			p =3D p[i+1:]
++		} else {
++			p =3D &quot;&quot;
++		}
++		// Trim the extension and look for a reserved name.
++		base :=3D part
++		if dot &gt;=3D 0 {
++			base =3D part[:dot]
++		}
++		if isReservedName(base) {
++			if dot &lt; 0 {
++				return &quot;&quot;, errInvalidPath
++			}
++			// The path element is a reserved name with an extension.
++			// Some Windows versions consider this a reserved name,
++			// while others do not. Use FullPath to see if the name is
++			// reserved.
++			if p, _ :=3D syscall.FullPath(part); len(p) &gt;=3D 4 &amp;&amp; p[:=
4] =3D=3D `\\.\` {
++				return &quot;&quot;, errInvalidPath
++			}
++		}
++	}
++	if containsSlash {
++		// We can't depend on strings, so substitute \ for / manually.
++		buf :=3D []byte(path)
++		for i, b :=3D range buf {
++			if b =3D=3D '/' {
++				buf[i] =3D '\\'
++			}
++		}
++		path =3D string(buf)
++	}
++	return path, nil
++}
++
++// isReservedName reports if name is a Windows reserved device name.
++// It does not detect names with an extension, which are also reserved =
on some Windows versions.
++//
++// For details, search for PRN in
++// <a class=3D"moz-txt-link-freetext" href=3D"https://docs.microsoft.co=
m/en-us/windows/desktop/fileio/naming-a-file">https://docs.microsoft.com/=
en-us/windows/desktop/fileio/naming-a-file</a>.
++func isReservedName(name string) bool {
++	if 3 &lt;=3D len(name) &amp;&amp; len(name) &lt;=3D 4 {
++		switch string([]byte{toUpper(name[0]), toUpper(name[1]), toUpper(name=
[2])}) {
++		case &quot;CON&quot;, &quot;PRN&quot;, &quot;AUX&quot;, &quot;NUL&quo=
t;:
++			return len(name) =3D=3D 3
++		case &quot;COM&quot;, &quot;LPT&quot;:
++			return len(name) =3D=3D 4 &amp;&amp; '1' &lt;=3D name[3] &amp;&amp; =
name[3] &lt;=3D '9'
++		}
++	}
++	return false
++}
++
++func toUpper(c byte) byte {
++	if 'a' &lt;=3D c &amp;&amp; c &lt;=3D 'z' {
++		return c - ('a' - 'A')
++	}
++	return c
++}
+diff --git a/src/net/http/fs.go b/src/net/http/fs.go
+index 57e731e..43ee4b5 100644
+--- a/src/net/http/fs.go
++++ b/src/net/http/fs.go
+@@ -9,6 +9,7 @@ package http
+ import (
+ 	&quot;errors&quot;
+ 	&quot;fmt&quot;
++	&quot;internal/safefilepath&quot;
+ 	&quot;io&quot;
+ 	&quot;io/fs&quot;
+ 	&quot;mime<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:+@@-69,14+=
70,15@@funcmapDirOpenError(originalErrerror,namestring)error{+//Openimple=
mentsFileSystemusingos.Open,openingfilesforreadingrooted+//andrelativetot=
hedirectoryd.+func(dDir)Open(namestring)(File,error){+-iffilepath.Separat=
or!=3D'/'&amp;&amp;strings.ContainsRune(name,filepath.Separator){+-return=
nil,errors.New(">&quot;
+@@ -69,14 +70,15 @@ func mapDirOpenError(originalErr error, name string)=
 error {
+ // Open implements FileSystem using os.Open, opening files for reading =
rooted
+ // and relative to the directory d.
+ func (d Dir) Open(name string) (File, error) {
+-	if filepath.Separator !=3D '/' &amp;&amp; strings.ContainsRune(name, f=
ilepath.Separator) {
+-		return nil, errors.New(&quot;</a>http: invalid character in file path=
&quot;)
++	path, err :=3D safefilepath.FromFS(path.Clean(&quot;/&quot; + name))
++	if err !=3D nil {
++		return nil, errors.New(&quot;http: invalid or unsafe file path&quot;)
+ 	}
+ 	dir :=3D string(d)
+ 	if dir =3D=3D &quot;&quot; {
+ 		dir =3D &quot;.&quot;
+ 	}
+-	fullName :=3D filepath.Join(dir, filepath.FromSlash(path.Clean(&quot;/=
&quot;+name)))
++	fullName :=3D filepath.Join(dir, path)
+ 	f, err :=3D os.Open(fullName)
+ 	if err !=3D nil {
+ 		return nil, mapDirOpenError(err, fullName)
+diff --git a/src/net/http/fs_test.go b/src/net/http/fs_test.go
+index b42ade1..941448a 100644
+--- a/src/net/http/fs_test.go
++++ b/src/net/http/fs_test.go
+@@ -648,6 +648,34 @@ func TestFileServerZeroByte(t *testing.T) {
+ 	}
+ }
+=20
++func TestFileServerNamesEscape(t *testing.T) {
++	t.Run(&quot;h1&quot;, func(t *testing.T) {
++		testFileServerNamesEscape(t, h1Mode)
++	})
++	t.Run(&quot;h2&quot;, func(t *testing.T) {
++		testFileServerNamesEscape(t, h2Mode)
++	})
++}
++func testFileServerNamesEscape(t *testing.T, h2 bool) {
++	defer afterTest(t)
++	ts :=3D newClientServerTest(t, h2, FileServer(Dir(&quot;testdata&quot;=
))).ts
++	defer ts.Close()
++	for _, path :=3D range []string{
++		&quot;/../testdata/file&quot;,
++		&quot;/NUL&quot;, // don't read from device files on Windows
++	} {
++		res, err :=3D ts.Client().Get(ts.URL + path)
++		if err !=3D nil {
++			t.Fatal(err)
++		}
++		res.Body.Close()
++		if res.StatusCode &lt; 400 || res.StatusCode &gt; 599 {
++			t.Errorf(&quot;Get(%q): got status %v, want 4xx or 5xx&quot;, path, =
res.StatusCode)
++		}
++
++	}
++}
++
+ type fakeFileInfo struct {
+ 	dir      bool
+ 	basename string
+diff --git a/src/os/file.go b/src/os/file.go
+index e717f17..cb87158 100644
+--- a/src/os/file.go
++++ b/src/os/file.go
+@@ -37,12 +37,12 @@
+ // Note: The maximum number of concurrent operations on a File may be l=
imited by
+ // the OS or the system. The number should be high, but exceeding it ma=
y degrade
+ // performance or cause other issues.
+-//
+ package os
+=20
+ import (
+ 	&quot;errors&quot;
+ 	&quot;internal/poll&quot;
++	&quot;internal/safefilepath&quot;
+ 	&quot;internal/testlog&quot;
+ 	&quot;internal/unsafeheader&quot;
+ 	&quot;io<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:+@@-623,6+62=
3,8@@funcisWindowsNulName(namestring)bool{+//the/prefixtree,thenusingDirF=
Sdoesnotstoptheaccessanymorethanusing+//os.Opendoes.DirFSisthereforenotag=
eneralsubstituteforachroot-stylesecurity+//mechanismwhenthedirectorytreec=
ontainsarbitrarycontent.++//++//Thedirectorydirmustnotbe">&quot;
+@@ -623,6 +623,8 @@ func isWindowsNulName(name string) bool {
+ // the /prefix tree, then using DirFS does not stop the access any more=
 than using
+ // os.Open does. DirFS is therefore not a general substitute for a chro=
ot-style security
+ // mechanism when the directory tree contains arbitrary content.
++//
++// The directory dir must not be &quot;</a>&quot;.
+ func DirFS(dir string) fs.FS {
+ 	return dirFS(dir)
+ }
+@@ -641,10 +643,11 @@ func containsAny(s, chars string) bool {
+ type dirFS string
+=20
+ func (dir dirFS) Open(name string) (fs.File, error) {
+-	if !fs.ValidPath(name) || runtime.GOOS =3D=3D &quot;windows&quot; &amp=
;&amp; containsAny(name, `\:`) {
+-		return nil, &amp;PathError{Op: &quot;open&quot;, Path: name, Err: Err=
Invalid}
++	fullname, err :=3D dir.join(name)
++	if err !=3D nil {
++		return nil, &amp;PathError{Op: &quot;stat&quot;, Path: name, Err: err=
}
+ 	}
+-	f, err :=3D Open(string(dir) + &quot;/&quot; + name)
++	f, err :=3D Open(fullname)
+ 	if err !=3D nil {
+ 		return nil, err // nil fs.File
+ 	}
+@@ -652,16 +655,35 @@ func (dir dirFS) Open(name string) (fs.File, error=
) {
+ }
+=20
+ func (dir dirFS) Stat(name string) (fs.FileInfo, error) {
+-	if !fs.ValidPath(name) || runtime.GOOS =3D=3D &quot;windows&quot; &amp=
;&amp; containsAny(name, `\:`) {
+-		return nil, &amp;PathError{Op: &quot;stat&quot;, Path: name, Err: Err=
Invalid}
++	fullname, err :=3D dir.join(name)
++	if err !=3D nil {
++		return nil, &amp;PathError{Op: &quot;stat&quot;, Path: name, Err: err=
}
+ 	}
+-	f, err :=3D Stat(string(dir) + &quot;/&quot; + name)
++	f, err :=3D Stat(fullname)
+ 	if err !=3D nil {
+ 		return nil, err
+ 	}
+ 	return f, nil
+ }
+=20
++// join returns the path for name in dir.
++func (dir dirFS) join(name string) (string, error) {
++	if dir =3D=3D &quot;&quot; {
++		return &quot;&quot;, errors.New(&quot;os: DirFS with empty root&quot;=
)
++	}
++	if !fs.ValidPath(name) {
++		return &quot;&quot;, ErrInvalid
++	}
++	name, err :=3D safefilepath.FromFS(name)
++	if err !=3D nil {
++		return &quot;&quot;, ErrInvalid
++	}
++	if IsPathSeparator(dir[len(dir)-1]) {
++		return string(dir) + name, nil
++	}
++	return string(dir) + string(PathSeparator) + name, nil
++}
++
+ // ReadFile reads the named file and returns the contents.
+ // A successful call returns err =3D=3D nil, not err =3D=3D EOF.
+ // Because ReadFile reads the whole file, it does not treat an EOF from=
 Read
+diff --git a/src/os/os_test.go b/src/os/os_test.go
+index 506f1fb..be269bb 100644
+--- a/src/os/os_test.go
++++ b/src/os/os_test.go
+@@ -2702,6 +2702,44 @@ func TestDirFS(t *testing.T) {
+ 	if err =3D=3D nil {
+ 		t.Fatalf(`Open testdata\dirfs succeeded`)
+ 	}
++
++	// Test that Open does not open Windows device files.
++	_, err =3D d.Open(`NUL`)
++	if err =3D=3D nil {
++		t.Errorf(`Open NUL succeeded`)
++	}
++}
++
++func TestDirFSRootDir(t *testing.T) {
++	cwd, err :=3D os.Getwd()
++	if err !=3D nil {
++		t.Fatal(err)
++	}
++	cwd =3D cwd[len(filepath.VolumeName(cwd)):] // trim volume prefix (C:)=
 on Windows
++	cwd =3D filepath.ToSlash(cwd)               // convert \ to /
++	cwd =3D strings.TrimPrefix(cwd, &quot;/&quot;)        // trim leading =
/
++
++	// Test that Open can open a path starting at /.
++	d :=3D DirFS(&quot;/&quot;)
++	f, err :=3D d.Open(cwd + &quot;/testdata/dirfs/a&quot;)
++	if err !=3D nil {
++		t.Fatal(err)
++	}
++	f.Close()
++}
++
++func TestDirFSEmptyDir(t *testing.T) {
++	d :=3D DirFS(&quot;&quot;)
++	cwd, _ :=3D os.Getwd()
++	for _, path :=3D range []string{
++		&quot;testdata/dirfs/a&quot;,                          // not DirFS(&=
quot;.&quot;)
++		filepath.ToSlash(cwd) + &quot;/testdata/dirfs/a&quot;, // not DirFS(&=
quot;/&quot;)
++	} {
++		_, err :=3D d.Open(path)
++		if err =3D=3D nil {
++			t.Fatalf(`DirFS(&quot;&quot;).Open(%q) succeeded`, path)
++		}
++	}
+ }
+=20
+ func TestDirFSPathsValid(t *testing.T) {
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#178840): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/178840">https:/=
/lists.openembedded.org/g/openembedded-core/message/178840</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/97740601/3616765">https://lists.openembedded.org/mt/=
97740601/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------GMfZCS5AlRV0P9ZH2HAAENLE--

