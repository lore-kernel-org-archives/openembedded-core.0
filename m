Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 245F8C48286
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 07:18:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.34528.1707031092566708449
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 23:18:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BdsUqHMk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=27642fc89d=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4147085m013871
	for <openembedded-core@lists.openembedded.org>; Sun, 4 Feb 2024 07:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=uDk3Yr2Cgx4sRpBBSi6Ocq3PAGPKq9YsRm+qYpbmFao=; b=
	BdsUqHMkDs0ARxP+DoNWgHpwqrQdIs8fMVqeztVjFPkqtJvowjoP129sZ0DrWARQ
	/3TqNcFCjY4AlEwA5H1VnxENgr1Mxhm5yVILZhd8/z0kIbLX2ttSiQkgAXt0gdgJ
	wgCdjytwjDs1KnB27ObNpWam0NZ8ZA0kM7CPTZwza3EQkPNZOufReGMTj9bGO4+7
	TlYR//4eWPXaDN8oMoY8vOuDTtRKAW8w4XcqFSTAeKOmmVgiWicPzRYYkKrJVHNw
	yMMw7NAd0Aw9ROEKtXsQpzZDC7H1nBk85dSiOutQbwFwetWm9MMKDnAQBbBnMNie
	7V4AL5glZmQhntGM4nf04w==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1cs78uf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 07:18:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOPTPsk4I7EDaekYIOS64EEzlAQgadab2D50ybEtzBVtgaxk/8M18NTFgfPvSQeiQ4HF3eYX9acALJ+rwJyY0jZD6xmIs5LtMrkgw6cDXUU6Xu+23ix7HOspMaCwGPztqcCYPnQSFrVa00EfWStwj8pSRvWlDRdOXlU07n8Vp8UUmxDs44Jnq8P8DfdXHUtLLd9uRJKfywuqvQt3PlatnRG41BtPlC/Ptp9D71+GRHAehp/6tIEKAXjZBc++vyrQXhqR/r1PjnNrNZIOLQ/1U4Jy/9pM41IJmb3euHllQ4PFHhHeF6u3FjhwTCnQZsGa68/gyd7osNXFpami7YNMzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDk3Yr2Cgx4sRpBBSi6Ocq3PAGPKq9YsRm+qYpbmFao=;
 b=h7DMSHIcm8IRvNuVJMTMs6t4lOdlAS/6ewiPQccg+XK/tCwzTrKnghRVhnOmsM0vZfDPd7QCH67gs8ihiGb/LaGqb0vJDDygZFUcn62mSLVF8W/3N7228dNXwQ4PPw+a6DbtixPmbf9WyOhsXB1lUbKwCvOJugps7bFaii/9PGmxi/iAonooIfrnXBroS84DSZaJewkD5ll4TJcUthmcEZprnZz2QXyyQnVJwtaJL5SD165h1FCcrYeOqFinx/NHZou3hyRdJ27PbXa1wHMKdGVWSYDY+mX8g6ANXjtV81HoJIIKiXvmV09JumEpEdbXdbswErF447ggx77LZhPChg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SJ0PR11MB4912.namprd11.prod.outlook.com (2603:10b6:a03:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.33; Sun, 4 Feb
 2024 07:18:07 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::ea58:82e8:1c55:a217]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::ea58:82e8:1c55:a217%4]) with mapi id 15.20.7249.032; Sun, 4 Feb 2024
 07:18:07 +0000
Message-ID: <e1c33511-a475-4cef-8454-09de1986fd33@windriver.com>
Date: Sun, 4 Feb 2024 15:18:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] xmlto: Remove the explicit PV setting
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <17ABBC6806A4667E.11393@lists.openembedded.org>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <17ABBC6806A4667E.11393@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0333.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::19) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|SJ0PR11MB4912:EE_
X-MS-Office365-Filtering-Correlation-Id: 50040091-66d7-47a9-3c39-08dc25516f31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	miRsGsX81h7NwkP5o0wktyIOhzHhnB5qGNbyWK2kEDqbRPY9cacxY79SvcRTHW4TZbMEjHXGBvTuwchbjXCfKXJ5VXztr+n8YLnCmrK1HUFDhDxLsXYv4ZW38SDVy6stV+CmMAdEH8lx7gG5jNqg0pBz5TnhuVMO/pKeP2B4SkKKTpx7+EF55uU6mjK8GLRSwUM2QvpN4aA050XrPHu6CcyKzsRPE0SM6MI8/JB/Qa5XRv18h6BoFI9dGd3XK24JRCvoGc00782fWTur5ZkannbSh4Y51ydByATFGFmRMTaKVvcwY2C7AR6WFg6I9oT4jpaMQhfoIKn0NqaMnwDqJtXk0RMdvsoA4rpBBxQ/kTXebGLlBx6KBT4PKTLHcERtenV0IT9e91cyBhsKlW++CgKYDe9uWn8Y3EDSBHFvGMxenJke9EUSaixiD3TK5KfH1vMLhLVcCbDvYCV0CduR79f/LZup5tFt1DBUUoB0OdSBtgfqKE/yVsGMYwHkmKXI8KuuFoj+ILfQzDA4BgWp0JxUiCwJPW4wbttjFxnZvfPLtGESPYDFqA9lv9S1fDriMDad/1XP3TSOGJI7d6+TYPU8VTsAFXJRLhboT4kE3dI8unH8TmjZbieiQkdP7Aa9GFlZZS2d7rvhfatfSXwrEZfgKBaPDchZZj6nhlayATI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39850400004)(376002)(396003)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(26005)(2616005)(83380400001)(41300700001)(31696002)(38100700002)(86362001)(8676002)(8936002)(66476007)(316002)(66556008)(6506007)(66946007)(5660300002)(2906002)(6666004)(53546011)(478600001)(966005)(6486002)(6512007)(36756003)(31686004)(66899024)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cGxORm9XN1VIcDFGMThOaHRXb0FmcDI3M0l0RFVFeWRrV0hWSGg4cEFYQTQy?=
 =?utf-8?B?QjlGZEdHVjJ5RDM2bUtlNGQyeHkrWFdrTUErdFMyTGVHeURXZjBrckRUdnhk?=
 =?utf-8?B?STdMQ2tYMUlSZnBhYkV0a285WHpOWGxXNnl6QjhiRndPd0VFRWZsSENWdEor?=
 =?utf-8?B?YWY0dVBTZ2xmSU0yZndlU0NKeVczNW9TNlpTUU91MGNJLzNpTXlJbThRVVJs?=
 =?utf-8?B?M01HVFJFV1dzbXVRSmlRNXhYVzFZakcrMU96SDlYMy9uMlhmVUgxZUF1WnU5?=
 =?utf-8?B?bEpNQndDQ05zQ1ZZTmk5UEhjMHdIWTVOYVoyRkJPUXcvRTBnZDBiczV0SW4w?=
 =?utf-8?B?d1JWV21VckZWdytldWIwSHF5Sk5jYzI0VDFGUWttaFhpQ0psODJ0ejFucmdV?=
 =?utf-8?B?aFJGc3F4MW15ZUZ2MWxSRUhUR1hMcTNYU3hkand0QmRMeVFHdnZVb0Z3OXh0?=
 =?utf-8?B?em5iaHBESEFHZUpJblVibDdHMG44TzEwdkJ0eFZWY3lsdWNiYm5wcFI3TUdr?=
 =?utf-8?B?bG5GTlY3WlFvcnBsWFRya1RVci8wTGtJK1h1V1ZKOHlmWnd4b2tnc1p3REhP?=
 =?utf-8?B?VXFoVC9GSC9JdHlaZ2hoR1hxaEZKWHg4ZUFjR3EvalhLOUVPMVlINUErTFhH?=
 =?utf-8?B?VVcxWmhaT2w5MWxmamltSVI1cEF1b29nTi8rODhUaHJDM3RCWlVJYVJZV3Ry?=
 =?utf-8?B?RG5hRnA2dTd4M2pQT1hYMllsNXdXU0NISWxDLzFabDVZRFpZQ3F2QVVtS0xX?=
 =?utf-8?B?U3BOVi85WE1FRTljWDBUSkd3RlZrdzNmaVI2YXhHV2h5UmlmNCtwTmVkMGZ2?=
 =?utf-8?B?WWpSVTBqYWxaaVJSdE9JQ1g1ZlFRZnRuV3RIT1c5VjQrOE9jTHhzUHZ4WU1m?=
 =?utf-8?B?L2RwRUhLV0I1MGt3ZlhRWXRRVFgyd255ZjNUNXByQkVoekZidG1oTElRNDNK?=
 =?utf-8?B?dnJydlBVdGVWZURPaHR4SXBFM0tvOHpKVmVtRVpWa29nR1lraGhPY3dubkI1?=
 =?utf-8?B?aDlaa3RLZ050dHN2N2tJZnorVDJvNi9ReE8zZjY2VG14SFplUWtDcXBxRWhh?=
 =?utf-8?B?VHlYMjkvNWhzWDlNOWFoMzRVQ1VKVC9iNU5qQUJZTzFwZVlvN0Y1S3p2dHVC?=
 =?utf-8?B?ZEJNdURnOGt2WE1XR0wzdWtkWFh2enl5M29TVUNhWlhPenh4VEdueENGM05v?=
 =?utf-8?B?dEJDRUV4dzVWcXIvd2VLSUpCdE16L09CamlZYlovbGNuaDY5cTFRcnJ1Nklw?=
 =?utf-8?B?cC9QVzVjRCtNNmZlN0pPRlV6R0R5MTdOQVBYREMrOTMxM2ZmUnEzbVhaVVIr?=
 =?utf-8?B?S3M0Q1VVUDAraUVvSURaMWU4MXM0SlA2RzV6TDdUcmNRSC9yelJjdXFTa2Z6?=
 =?utf-8?B?UVh3aHFUc3IzU1BCS21SRC9JUFpBWC9NeDU1L3VRMklDbDh0NHZFTlo3NHNZ?=
 =?utf-8?B?dG1FQUhEN2RRZTk1REwzS3REK0JBdlE3R3lwOW1McGdWMkJyWEVlYXJVMXR3?=
 =?utf-8?B?TWg4Zzd0UXV2TVpFeWpRSWErZ1Z5QVNvanBRVXhMR04vZDZuckgxb0ZhSC9L?=
 =?utf-8?B?UXlSVURqR05KOVlLQVhIbjhXS21wS3VOVi8yOW45SUd5cWV6d0FzZ1piU2Np?=
 =?utf-8?B?c05NellYR0Zsa2FqbXJxUisrdkhza2hHY25uR2ZxcEhhQ0NTdkNnbUdYL3lo?=
 =?utf-8?B?RHNRM09nOG1hd2lROUtlV2l2ZDBKbVVYVXB0WWJkd2l2S1VVSUZCdFNHOGlw?=
 =?utf-8?B?bzMzUTN2c25hYldzbTI1aXFoSyt1UWJHeU1kczlaM0ZuSVRXRnA2REJVRitB?=
 =?utf-8?B?d1p3aXF6V015NUMxM2ZFN00yS1ZQK1Z5Z2JWQktGcmw5VENMVWlBdHZUdlZL?=
 =?utf-8?B?OGwyakhtSWdxeEZGK2YwZFVET1NsNzhXQi9uQWM3Sk91YXp4d2tvbnB0ZldJ?=
 =?utf-8?B?TnZhbFdpUnF2M3d4SWEvb0UxWk52K3hKUFR2c3VGQXBOVlRaM2JrWGFsQkxx?=
 =?utf-8?B?R0NMbzg5Z1hveWxFaktNVjkrajZVQ205M0tWR1BESkZKNjBUaC9BMWFqN2Vn?=
 =?utf-8?B?aSt3azZpZFo2QWQrckVZS3NzbG1hYm1XV3VTT25BRzBJTUNSc29pOTZTRW45?=
 =?utf-8?Q?wxLTVwLhd59IqStBH6sZ/vhVG?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50040091-66d7-47a9-3c39-08dc25516f31
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2024 07:18:06.9639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4iS+NRDiQ648H72WY+y+/po68XDUOWoVMyKm/aNlbuNxFLMAz583+oZ/Ob57a93oq2iqTcaMH/me6lH8GBEVOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4912
X-Proofpoint-ORIG-GUID: Qjjk_rSMWpPG77wia5I25uhDfv7NFjCn
X-Proofpoint-GUID: Qjjk_rSMWpPG77wia5I25uhDfv7NFjCn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-04_05,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 bulkscore=0 mlxlogscore=675 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402040054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 07:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194877

Ping.

Thanks,

On 1/19/24 19:33, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> The latest release for xmlto is 0.0.28 [1], but the PV is set
> individually [2] in terms of backport several patches to fix
> builds with newer compilers after 0.0.28 was releases in 2015.
> 
> [1] https://releases.pagure.org/xmlto/
> [2] https://git.openembedded.org/openembedded-core/commit/?id=27a5000724e4f4df274279bcd801d1dc2830208e
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> index d5a0e69849..69f989f5b8 100644
> --- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> +++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> @@ -11,8 +11,6 @@ UPSTREAM_CHECK_COMMITS = "1"
>   SRC_URI = "git://pagure.io/xmlto.git;protocol=https;branch=master"
>   S = "${WORKDIR}/git"
>   
> -PV .= "+0.0.29+git"
> -
>   inherit autotools
>   
>   CLEANBROKEN = "1"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194029): https://lists.openembedded.org/g/openembedded-core/message/194029
> Mute This Topic: https://lists.openembedded.org/mt/103827978/3618448
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mingli.yu@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

