Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AA6C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 15:20:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10979.1702308042921897388
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 07:20:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=p/Z/QcK3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0709970ff9=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BBBYm8a026158
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 15:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=Gaz/gQ0e4zAM9vcWuwi
	vIRsfl1ypX/l/moSU4M0S7BE=; b=p/Z/QcK35WjsDD13k432UoR7Bx+v2VCwAW4
	tsZ/RaaLkwbUz453ft1/gd4AdSJ2EhDBEHc1V34Fm4abTK0kjxOVb0Q/M+SBJFEI
	O3k4OoUx3hiGsHU86H2YEiossWAAOK6R5IvR5+8quBDeVKT1ymsvH/bSBJInfKnV
	hlqCu6i2Y9Bld3aJ9322trzV35sdxvve3Qn4yTH9/HxbrRPg4XxikJ+/qZyL9Gav
	oCb2IEWtH4vGavRmVInV2Q2qohPr9Sc2+V4qUYMf5sWVLLJ/aLuAB+NMHyE5MOA4
	/PPpXSurxp742WFLOrZyj8vmhywZgocHhqeHrV6jDsy7hr5XYxw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvf761t3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 15:20:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUmbK6bWS8kXAJERNpYi/OrE3sVYvD4X+74BD/nHc4lpfbCqxxJzl55dtOdZmd6duWjUAjjVImsUxIIeEPws6qmZ1o54J2XhinQKncJ50XL+c5ugKptQEXIcaWydtWguH+K6ByGgOsv3mE6yomk8dW6OR+R/Xv46lhGy+FwfB2TCtLNjdfEW+6tL0/zZDyJL4+WO3gTic7E0lt272sUmHxXFab2MhuZgsBLb6liiSFLs0EKSo6SbQhtT8k6Nmh2lgXW3g3EftTJVldStCtIM8bLyz57FqHguFxY4/xqLJAjYhdzQeVj4pcvoSJ0Kbyw4iyk9xRKsRs8QPFZIE7nb3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gaz/gQ0e4zAM9vcWuwivIRsfl1ypX/l/moSU4M0S7BE=;
 b=QbTfnSJnK1zPvcCoFrX0iFLc25qGt9kuWVrFk7xrhCVeClEu9A+1FvfiuwJeV5RvQPsYvGh1Yjc3/9Zp4w0PYDziMlW1Mm1c1QUS7cJ6q+edmeTLoFQEMosKCEcPC1xofV949sIDXcLGE5iDkXbFHRxcLaahx7Arnuzr+uyVYg17PL+p0iseMJ3/2/MfvnM2NwdrtEjOpCd0z1DZJTUHgCFJ+FfcsorWEVDkrZD7GPp85rG1yOiCxa0pX/6hX/UNnPUDjP6m3es037h6aVF5IiS04Duy4yUYNY0NfTL7gV7dR56wTrMt826lboOaGre0Nfr9frdX09J/XcweAABPyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM4PR11MB8159.namprd11.prod.outlook.com (2603:10b6:8:17d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 15:20:37 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b0b6:b188:9e9a:2c2a]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b0b6:b188:9e9a:2c2a%5]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 15:20:35 +0000
Content-Type: multipart/alternative;
 boundary="------------SBcharK1OjezEc05lbbNXXDG"
Message-ID: <cd25a9d6-8422-4539-82a0-1418ffc6b52a@windriver.com>
Date: Mon, 11 Dec 2023 10:20:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [kirkstone][PATCH] nativesdk-sdk-provides-dummy.bb: Update host
 tools for rust-cross-canadian
Content-Language: en-CA
To: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com
References: <20231211122613.2429111-1-Deepthi.Hemraj@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20231211122613.2429111-1-Deepthi.Hemraj@windriver.com>
X-ClientProxiedBy: SJ0PR13CA0236.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::31) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DM4PR11MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f2a2930-d757-4203-6763-08dbfa5cb968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5Lz711a5UHCzUDrUwKeAWq6XPAI0Q6mODOEeJMSPHwBzDcXECPEuXr+rKFN6MpH7+t409pFGI1xiWD4XPnpAyxSJGFPB8xCRNEegW3qym9qqZLAxi06c+0C0clRkqzWkn/aQjthfHS4EJ9PJzsxMynUa38NpaH+WZMYbl5+4+rMsE+4JnhSFejE1L7gljZukTjGGUoirsPQnVxVee7cI7A8VKHRnV/X4T6UCU/UnojecZbO8lL4xO4juFKFo1E+g64nI1U+WEBHMvFEwkomcvUlk47qFDNeTZTgTtLqhY9knk/C24GXYbG0Y643DE3ZKqgRkWHqnFd4pzQpBh+1S9WGe14HGUJNteaASP6Dv2nk/m3+n1hXx7DW/aQUWNIb3RXQt6/IIyY7yXEcrEz7I3ZParSOqa+sr73tam/acwP6e4XjZVkh1P9FFms5z6Yfbxx/9qQ3jFTzbr6J3ZYbBTqmd0OJF3NgwggILpUpNKDZ5B2V8vCCHrotenmUd0DbOr+VkhsjARJCm9JdM+DKBd738xhYws3nyujYcXV6wRHHV/7gC+JYdZDxUWEZeHD+OA1iKN3Lvpxogy7WdONTIh8VaaE6yUnRxrvgQdtI5qdXNAPs19/EBoJ7GDhEJ/yfPQ22pPdlVOA/S/+Bu4gEXXA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39850400004)(396003)(136003)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(2906002)(478600001)(41300700001)(31686004)(4001150100001)(66556008)(66476007)(6486002)(66946007)(316002)(38100700002)(6666004)(86362001)(31696002)(8936002)(8676002)(4326008)(53546011)(6506007)(33964004)(6512007)(36756003)(5660300002)(107886003)(26005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MEdJMm9WdzRIZGRkRnpiVTA3eUhXdFNiRStrY0NJdksyMk9tWUpMaSsvSVFR?=
 =?utf-8?B?ZFNFc1FuNzRnbUUyUlpMVUZFdXViMFY1b1lCek5qN1lVckZCeVJ2aS9IYnpq?=
 =?utf-8?B?OTc1NVF4Nmg5V2xIcDRWdFRBazM5QWZjT3kzQXUvMzE3YTBlZVZOQkFWbHhE?=
 =?utf-8?B?YXFTQWNoOVY2TXZYRW9ISGhzYk9ORDFjeVhLc3FSSWRIUGJZSDRSNkVtM3U5?=
 =?utf-8?B?MTR5T2R6MVZvZmdZend3TnJ3WlZWbmd5eFNFQ3M5V3VvNGFOUDNxRmMzYlZ5?=
 =?utf-8?B?aWRDL0RqQ1g2NEhaYjJlV1k4dTUyZVJBUTJzYm5XaDRJZ21hd3dHbHhkUFZL?=
 =?utf-8?B?aGhhWDV4Wm1kUlRTa3NaREhUSjdmUmFHaWp4TEhJcFQ2ai9MWStzWGtoUUZY?=
 =?utf-8?B?RzJoZHpzTkRsM0JKVUJZZytGUXpQWEd2OGZ5ZXFWQVhuU1dsTGMyZjRMYjFm?=
 =?utf-8?B?SXJDdFlxTjIzQlBZN0NUcm9NWWxJMUhSeWU3TFV1M0E3QXJ0MW95R3psQzF3?=
 =?utf-8?B?T0NwdFJQMTdyUGlmMHJCRjJrVnJ3ekJhVjg4Tk90eExMaWdOUXFvRWF3SmVG?=
 =?utf-8?B?UndUcUIveTNubUpPMlhsWHcvK0h6L1R2Q3h5MkFvU0pBNTRJVUJrZWNVY0hY?=
 =?utf-8?B?OW1WUTE5dGoyRXgxa1MrYzJNQlNRT3NBajQxR2ZsdDBwMmY5WStZRGpQZ1Bk?=
 =?utf-8?B?NTdCR0JTNCt3MEZSRDlxZ3UyVkpaaXVtWS9ZN1J4aDZ5N1R3b3cveVRJbnVO?=
 =?utf-8?B?b280MGc2aXlDaTJ3SW5scXRuR3JqQ2xYZmZrazE1RlNKTGNIZElqcXNjNlVY?=
 =?utf-8?B?VnF3UU8vRjlIdUx2U0orRDAzN3RxL1NBcENyQWhLYWNHRndMWWRYQXpzSnEw?=
 =?utf-8?B?Z2w5SEdlWllwKzVnd2dEZytQRDJndENmK3ZFU1FqK0JVNUQwblJPQnVtMkNs?=
 =?utf-8?B?bTZEZHVzSWtESzEwSmlBdm5QcHdmOU9aVHNMQlJEc1RseStQMXdZakhjSzN4?=
 =?utf-8?B?T3haOE5jREZQTzI3U092OFo3UjhqUEhYYXFqNE54SjBxQk93bEJsZXp2TUZv?=
 =?utf-8?B?TkxKOCsvZDkvQlpVZU5IOUZhR0ZRQmdEUEwxRzNuSTluem8ybjd1Z0xkYnFX?=
 =?utf-8?B?RWpTRlM1ZEJrbDR4cnpqcVkvZ25DdVVnSVBVcFpadm5oUEZncm9pdDYyc3A2?=
 =?utf-8?B?Z3N6UndMWHhhbVlEdW5kay92Vyt6TFJjbEkzQ2ZpTlNCemFjSTNQaFpaLzBM?=
 =?utf-8?B?MEZvU092dWhCU0gyNlY5eTlERFAvQWNoSkJSeG9IOG9HRitCMlBoZklha3Vx?=
 =?utf-8?B?em5oL0ExVHJLalR4dTdsN0RRWUQ5Z1NzQUh5b0hLa0ZNWGFTMTRNeFA2MU9k?=
 =?utf-8?B?ejlpSHBWRlNHbHEvOUZ4aDRrYXQ3U2MxZW5VamEzWjc1MHZuOW1PUU9QSHRY?=
 =?utf-8?B?UVZCZ2V2a2MySTdodG1sMTBpVU41akw4QW9DQ1Z3V3Y3RlpqVFVRWHFOUktw?=
 =?utf-8?B?VWNCL3o0YTdvS1E3b29UYXRhNEdSTVB6L25yQUJLbVBjNGtTa2pWdExLTGxT?=
 =?utf-8?B?dlBRWUwxZXJwUzZNaVJ6SHc4YTVRU1FNQTNma2dUOFRJdDNQeFdqZlU2Uy95?=
 =?utf-8?B?c2t0cGcvVmVBMXdWMHp1V1k2Y1VNZ3hXVGczRU1QS1JOS3pLQ01sa3oyZGZh?=
 =?utf-8?B?RzMxb1orL0huNGZsS3hGM2QzYUc1OVhMS0s2ekdaUm9reUV4THFtOXA0OWQr?=
 =?utf-8?B?aHRjcWp3RnZrYVdDQkZzR25MNW9UNXhIbTRveGQ1a2dvSEkzQW1HZWx5QXh0?=
 =?utf-8?B?SC92OXJ0UW1KcEo2bHFoRTFCQXZucmpUY2FYQ2o3NmFTRkpIVHYzNFZEdW9N?=
 =?utf-8?B?VllCdU12SmpTakh2ZUd5R0swdXZwd0ZqRWUrMmZRenRLaWpOeklHZVVEQnNm?=
 =?utf-8?B?bDY4Z3JVMC9PNDJCY2V4TThGTUQyUGdQajRPazlmbkh0NENHL1JLVkJtOGNF?=
 =?utf-8?B?M1BOZ043SlYrWmQrMk5jTjBDZ29rMGUxMUZVazAvWDIyY2pCV1Z1VWlGZk12?=
 =?utf-8?B?MzE3MjdlM05ZV1grbW94VkxEWGQ2RWRBSndBV1pZeXNBNXh2SytjTjZNYW1v?=
 =?utf-8?B?NitxMCt1MloyN3IrTTJFZDU5d1NNRGtwY0xCcVVYWWRJZm8wQ084QnBTZGMx?=
 =?utf-8?B?d3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f2a2930-d757-4203-6763-08dbfa5cb968
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 15:20:35.9116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Ruc82uaVTa0HXDFXqRbQnWmbcUQkehwgRrlGEznm9AiA1nRYk1NSTjmIY0diK05qoy3KJnOxK1eQwlux75sRDfRmsBM3eGkBsN9k3QVm90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8159
X-Proofpoint-GUID: CCu7TKjMRhEqBIghxMC5bZBxdTNBK9y6
X-Proofpoint-ORIG-GUID: CCu7TKjMRhEqBIghxMC5bZBxdTNBK9y6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=627 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxscore=0 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312110126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 15:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192175

--------------SBcharK1OjezEc05lbbNXXDG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-11 7:26 a.m., Deepthi.Hemraj@windriver.com wrote:
> From: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>
> [YOCTO #15082]
> Packagegroup-rust-cross-canadian package requires rust-cross-canadian, but the necessary libstdc++.so.6(GLIBCXX_3.4.30)(64bit) library is missing.
> The fix adds the libstdc++.so.6(GLIBCXX_3.4.30)(64bit) library requirement to the  SDK dummy package, resolving the dependency conflict.
>
> Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
> ---
>   meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
> index 1d71f373a4..dc3ae1edaf 100644
> --- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
> +++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
> @@ -10,7 +10,8 @@ DUMMYPROVIDES = "\
>       /usr/bin/env \
>       libGL.so()(64bit) \
>       libGL.so \
> -"
> +    libstdc++.so.6(GLIBCXX_3.4.30)(64bit) \
> +"
>   
>   require dummy-sdk-package.inc
>   

This doesn't seem right to me...

Does the problem happen on master?

I haven't tried it but I suspect we want to add something like:

nativesdk-libstdc++

to:

DEPENDS:append:class-nativesdk = " nativesdk-rust-llvm"

in the rust bb file.

-- 
# Randy MacLeod
# Wind River Linux

--------------SBcharK1OjezEc05lbbNXXDG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-12-11 7:26 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:Deepthi.Hemraj@windriver.com">Deepthi.Hemraj@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20231211122613.2429111-1-Deepthi.Hemraj@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Deepthi Hemraj <a class="moz-txt-link-rfc2396E" href="mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>

[YOCTO #15082]
Packagegroup-rust-cross-canadian package requires rust-cross-canadian, but the necessary libstdc++.so.6(GLIBCXX_3.4.30)(64bit) library is missing.
The fix adds the libstdc++.so.6(GLIBCXX_3.4.30)(64bit) library requirement to the  SDK dummy package, resolving the dependency conflict.

Signed-off-by: Deepthi Hemraj <a class="moz-txt-link-rfc2396E" href="mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>
---
 meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 1d71f373a4..dc3ae1edaf 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -10,7 +10,8 @@ DUMMYPROVIDES = &quot;\
     /usr/bin/env \
     libGL.so()(64bit) \
     libGL.so \
-&quot;
+    libstdc++.so.6(GLIBCXX_3.4.30)(64bit) \
+&quot; 
 
 require dummy-sdk-package.inc
 
</pre>
    </blockquote>
    <p>This doesn't seem right to me...<br>
    </p>
    <p>Does the problem happen on master?<br>
      <br>
      I haven't tried it but I suspect we want to add something like:<br>
    </p>
    <p>nativesdk-libstdc++</p>
    <p>to:<br>
    </p>
    <p>DEPENDS:append:class-nativesdk = &quot; nativesdk-rust-llvm&quot;<br>
    </p>
    <p>in the rust bb file.<br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------SBcharK1OjezEc05lbbNXXDG--

