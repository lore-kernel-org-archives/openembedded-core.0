Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39A9C41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 03:49:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12420.1703216962419421552
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 19:49:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mSGbqdm1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0720462997=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BM2oS4M001967
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 19:49:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=YnNEofr/GsKXZ1h0d8eX/ZfVPsOrFzVwiBEcyQzUBjo=; b=
	mSGbqdm1fJml1EFcq9PwTtgSTzm+GUAGYLlcl2ibBXbQveyy3HyAWsHmnjgW7gQx
	MRxl32nBPMGaO+o0fgoSgdU+vqy1yWiCD9lWR7RxBXqHAfidhQwmDbNkNx+IfOdn
	81YrwrClDE4EIx4W8opP9ghk7F6Ad/hYt9zbouCtGNuMT3dX4CvKJHo2FAFTdmIQ
	JAQ9WoxWZ/SjfXdwPTVUxmZlbULHUQL+XAs8//o5dA2k+ZDptVL353pXEPwtTCr8
	wtzofKG4PyipwBoulGSJDBEdiILXCdWzFaX/hKRZlRtk9UEtfZJGuTVyAMH6Sf+l
	tck7rdDb+idZkXry7cKaWA==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1824q7e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 19:49:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkZw/75cXN/H+YyEYZJfd7iWA6n7bX8sWd6nNVz8JGAS1STj2SiQ/l4TlGRSDZtcNrvlPIFJZp7EkBU8owY0ZTHvditPjQ8RIAMa6GV9IRkGYWKStL9dfjvvgZLKc/grBij+isvXaZeAe0LzYTzbT2U23lmUsbOudm2BD4QayoWlh2br2MUCrJL5PwXkMA91DCX1MFYD6KMnW/F0Ph9e9TyXivOPgbwfpw2YRNb88TKBm/mVcYm4oNFlBxx87F71yankw627G20Uye6RYPe02HTJHOc2pc5pTIhiT8Ewfda6c9oXRSnW9PrjgXYdDmTC9JswacxUHFqXiLL7EAi88g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnNEofr/GsKXZ1h0d8eX/ZfVPsOrFzVwiBEcyQzUBjo=;
 b=YDpeSPpO5cjN0XB564xOfz7Xhjm/7pVsLYWhwl4kWqbqbKkwRumoQMpItfq5CoqgZQrbLtKcAJF2TR80pHBTesdJ7X14dPsEFKLfwZZWAYfhCMU0u9UvykGLsirl0UWZUiXub8asKFTRqOHWi91lkpzjefmviE/iGlZXWhZmjkIQmeYrUTAfbeTUyG7lZ3qLd50SGPdTSgBzRNl82J+blR8cdxfASDKeFKoRhaqC2zMpPcZ/+oS7r7fqWK9TkrID7SZQEzhSKOO5a7mKfpxmieucgL1KNPr/ywPmqzMnfRnQCt9Sm9SRgiLKH+XR4omVHFAspPoOmAKHbRJyedU/HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by DM4PR11MB6429.namprd11.prod.outlook.com (2603:10b6:8:b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Fri, 22 Dec
 2023 03:49:03 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5d43:ce18:14be:b2f7]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5d43:ce18:14be:b2f7%7]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 03:49:02 +0000
Message-ID: <ca3c8e5f-2f02-413a-9dd0-0348ecd643fc@windriver.com>
Date: Fri, 22 Dec 2023 11:48:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] archiver.bbclass: Drop tarfile module to
 improve performance
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <cover.1703011843.git.liezhi.yang@windriver.com>
 <692606bf032e2ffc29bd3283156449a7747fe793.1703011843.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <692606bf032e2ffc29bd3283156449a7747fe793.1703011843.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0094.jpnprd01.prod.outlook.com
 (2603:1096:405:3::34) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2789:EE_|DM4PR11MB6429:EE_
X-MS-Office365-Filtering-Correlation-Id: 1620c3d1-bb37-46f3-8c99-08dc02a0efba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4/Z9zb7lPBpB1jOvl4TPX7p5x4axXTrW2Uk9tPpj8UTvX+U8qkvL9tWMN1wok7G3/s2bPOmDyRFQ9VZGSN/lSeBTCLx6iaEgL1xICqAlpYe6+7Bg51CpykBbKWIiyLNsJbMcHlErKgfFuTh7x4NMvqjEGRlfwWYZKVBEIjcO/RsZY8K1T7qoIvUv/wIt6IN1rqH4L4S9nDwV6dpx3phgJM/JCFfAHIAwsaMJBgbizRHf4WSGIZrymeiWhEmOaHSafePaTc9inZ28YRk+nmZSvoXn+ej1OYGce8vCgK3RiD1VvuS/7SE6ddLnPigbRvw2d4QcFqUS2ToUYnm9USoRArcgzTQwGjoTdlVdss4040Zp0XqbP6As2K7ZCGAX1IAdL0HX94dX7ZsXMp9Zu/6EyQIr56G3Oy4HQlnBEehO21eGu5tQUqIMUYg0gl/I7ZdRyzEoyBu2afvpCmOpMPPXAAgw2UmdtrFG+FYp6mobCACiTC0Us87M91vX46h8C6NxEonF8ioAVfyiGLNSkS6ylreCWOU1xK7/CSFeDSvcbkllBryLJOn9pMcLINOioopNmiKcqh09KTWbXZwGqNN04dhM1SsGwMBPiBII4+ESsGTOXEUkz6OtV2RgwfT1Sc+oxNYApWSTwWYKzA0E8CC6qw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(346002)(376002)(39850400004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(8676002)(8936002)(66899024)(66946007)(66556008)(66476007)(6916009)(316002)(2906002)(41300700001)(86362001)(31696002)(36756003)(38100700002)(5660300002)(2616005)(26005)(83380400001)(6486002)(478600001)(966005)(6512007)(6506007)(53546011)(6666004)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VHVPRUJzN0IyUFhCeGU1ZlJnWEZHM3UwNytGREt5SXpVaFF1YklCZmFQRGdK?=
 =?utf-8?B?cVJlMm5RdFBrQXUrbVFJZy81NE5ySnlwUEduOVRnWGZLL1N3R2ZyS0IyZTdH?=
 =?utf-8?B?UEZWdkRqLzRMb25iYjRGM2dXWXBxdExhNmVQUjNmbllleFB2czdlNFkydDQ2?=
 =?utf-8?B?YlZxMVBsWHcycExTOUl4a0VpcEFNR3gxUWR1WE9zaTFTblQ0OU1vQ0NQL0lu?=
 =?utf-8?B?cldzSTJoZGZKTktQYzQzRGVFODFjZXhubURPQVB6aFdCMUgxOFV2emVSWFo0?=
 =?utf-8?B?TnhRbkhjbHlhRFpQczFVa2habUFWSElLbFNHTmxVRjg0L3hCWmNteTdsZnNJ?=
 =?utf-8?B?S0FqbFVKd1dGa0VaQnJsTWJ3WUEvU1ZmczBuNGcySk5ucmxMZjVjcnFwc0FF?=
 =?utf-8?B?eDQyRVVuR0NHa2ZDVllndXA0akdvWXR6NG5MbTAxOUNzN2VJU3BtaHVDSkpM?=
 =?utf-8?B?M0VJdnh6V1hBMlpqOU1xcDhYSEk4bitpNmYwa0JEaVdQS0t4L2wyMEtmSzZN?=
 =?utf-8?B?MEwzUDlGdUZHaWFaSlYzUWVtdFBEZm5nd3F1TENuYWZZQk5kOTYvUEI2K3V0?=
 =?utf-8?B?dDFheXEwY0dFRHFjbWJXWXQ2dmpmSUNxRDdzWWIrS09halRVRVFHVHU0SWRF?=
 =?utf-8?B?M3VTRVVyWUxvTno3M2JIWTRzU1JGdkliR3FNMkFlbUZPbmZNVGpVMTM3aXB2?=
 =?utf-8?B?NTN3K1hwOTVkdWtTKzlMclBNSjZFZlNKOXZGek9KSHJITHBaMmRoYWp2TmlI?=
 =?utf-8?B?ZzN6L240U0N5Wi9Tb2E1QWEyYlExYVVlMmI3di9sbVd1V3J0WnNsOUtldytH?=
 =?utf-8?B?ZDZkTnc3dElkK3dZaStYYWdEWnV2ck5GZHdCS090NWpNdFdDTlVmdkhnZFM3?=
 =?utf-8?B?d1M0UDhpcWdDekhLQWEvaWZoT3BBMlNKVEQ5amNRUGJDSGxDNjJrZVhoNFU0?=
 =?utf-8?B?bFNsVjBJaHB4NWdzTHRTWXZNK1ROSHowaUU1QTdRREJPRk42bndpU0FVTjFy?=
 =?utf-8?B?RSs5NjRyYktPOUJFbGdnM3pIbFloQUZzY0srbEpxUlJZZUNuckVHSVQ4QnA4?=
 =?utf-8?B?S0FGV3hlUUpzK1d2d1pTM1VIYlhjaGhGQTcxL0ljV09RQ003bHB6ZDdSa1g4?=
 =?utf-8?B?bGtJUDhsdDBlRWNGN1ZmZXlSSjNUM2pubklOa0JIUEI3YTY5ZW9VWGFOQnlj?=
 =?utf-8?B?SnR5MW52clR3Y2lKR0IrTjYyM091QWs2ME1uRVpKNFcrVmx3MWZSNEtXSk9J?=
 =?utf-8?B?QTRRanJBN09uZG1ubzN4WkZUejNHVThiRXA0SXY4RnpRSVpTeTBlZTdQeVhI?=
 =?utf-8?B?WDZYKzFTQnNmK25zVTN0OG8rcTVLWXlDWTRlalI1S2dlTmV3MDEwWE1ielUz?=
 =?utf-8?B?aCtmMFpTVEhKV0xwcHVZS3pCNkhySkFkS3p1WHRzUU5PU3d6SVZSdm5YUTdo?=
 =?utf-8?B?WmJhdWRxa29qbVRNUGRLajhHR1NVdnlMNERhZHNadEJURzVsaWlBV0dNVytJ?=
 =?utf-8?B?UVExWHNObDR4WmREZmZENW81Q0lnRkdtVk9QdGN2YXZmWnF2Nk9GOFJOeThn?=
 =?utf-8?B?ZTdyNzF6dEJZeG9CRlVkUTI2a0tvN0psdnljeEpNdFFLL3c4T3MvVGw5YVFv?=
 =?utf-8?B?UHJwZ0hQTG02WldCVGtad0ZUb0xvZi9seiswclJXM294Zmc0bUJsMmRBSnVZ?=
 =?utf-8?B?alBwZFV2bENxTnJFQ0Y2NTc3V2pqbkRPQW9MTWRlVzJYV0Q5ZE5PU1hGQzFs?=
 =?utf-8?B?aVR6TFFJS1pRaUJsK2M4V0FLKzN1dHdWM3NlRlVmQ3U2KzZQMTJuaXhFdmk3?=
 =?utf-8?B?OERhVWphdUwyV1c4NWtCMFE0QTkycFNDSGRDSFdLc2NoRXppWDM5TlNDWEND?=
 =?utf-8?B?ZG9LdHkxWDJ1U0M4ZWd1Tm43czNyeFlpaTZqVElyMmo0L3RqMmZMUlBGa3pN?=
 =?utf-8?B?TUlEUGt4Smt4aHp5VEI5Q3ZpTHlUdGQ4V2xpU0pIWVBlZExGN1Zmdm5jdzNn?=
 =?utf-8?B?S2liZjBxNk9hVTgwMCtlamRyNWp2M3FiaVovZ2szSlBxOW5sZ1BNQytzcytD?=
 =?utf-8?B?VHdRTW1nbmxsRTU5MG94ZlRFQ0tmSmN4OTRwTWdxVGNLZEdzYXEyeDNWZlNl?=
 =?utf-8?B?OGVOQTNvT2RMVEFGY0VNWHU0L21HeVhreXRLSjQxalhlS09DWFBWRUQwd2hr?=
 =?utf-8?B?dVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1620c3d1-bb37-46f3-8c99-08dc02a0efba
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 03:49:02.6218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLPcxuHYZYLqAGSSMNuOhe2+W+WttnPkooYIeqvQ/Ht6FoT/6Dji6t6uAobngRcG7I2qHyPOQXvnFQG+QGaay0Hl9v3/mQJj5tm4bscgtpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6429
X-Proofpoint-ORIG-GUID: 9OYcrsWL12awRkQzX_GEy4cMFjxVc-Ku
X-Proofpoint-GUID: 9OYcrsWL12awRkQzX_GEy4cMFjxVc-Ku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=754 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312220024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 03:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192856



On 12/20/23 02:52, Robert Yang via lists.openembedded.org wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
> 
> * The tarfile module doesn't support xz options or environment varible
>    XZ_DEFAULTS, this makes do_ar_patched incrediblely slow when the file is
>    large, for example, chromium-x11 is about 3GB:
>    - "bitbake chromium-x11 -car_patched" hasn't been done after 3 hours on my
>       host, I checked the partial tar.xz file is only 1.5GB, so maybe more than 6
>       hours is required to complete the task.
> 
>    - Now only less than 4 minutes is needed on the same host.
> 
> * Need add xz to HOSTTOOLS when archiver.bbclass is enabled and compression is xz.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/classes/archiver.bbclass | 28 ++++++++++++++++------------
>   meta/conf/bitbake.conf        |  3 +++
>   2 files changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index 80a69cf31db..2d0bbfbd422 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -401,19 +401,11 @@ python do_ar_mirror() {
>           subprocess.check_call(cmd, shell=True)
>   }
>   
> -def exclude_useless_paths(tarinfo):
> -    if tarinfo.isdir():
> -        if tarinfo.name.endswith('/temp') or tarinfo.name.endswith('/patches') or tarinfo.name.endswith('/.pc'):
> -            return None
> -        elif tarinfo.name == 'temp' or tarinfo.name == 'patches' or tarinfo.name == '.pc':
> -            return None
> -    return tarinfo
> -
>   def create_tarball(d, srcdir, suffix, ar_outdir):
>       """
>       create the tarball from srcdir
>       """
> -    import tarfile
> +    import subprocess
>   
>       # Make sure we are only creating a single tarball for gcc sources
>       if (d.getVar('SRC_URI') == ""):
> @@ -425,6 +417,16 @@ def create_tarball(d, srcdir, suffix, ar_outdir):
>       srcdir = os.path.realpath(srcdir)
>   
>       compression_method = d.getVarFlag('ARCHIVER_MODE', 'compression')
> +    if compression_method == "xz":
> +        compression_cmd = "xz %s" % d.getVar('XZ_DEFAULTS')
> +    # To keep compatibility with ARCHIVER_MODE[compression]
> +    elif compression_method == "gz":
> +        compression_cmd = "gzip"
> +    elif compression_method == "bz2":
> +        compression_cmd = "bzip2"
> +    else:
> +        bb.fatal("Unsupported compression_method: %s" % compression_method)
> +
>       bb.utils.mkdirhier(ar_outdir)
>       if suffix:
>           filename = '%s-%s.tar.%s' % (d.getVar('PF'), suffix, compression_method)
> @@ -433,9 +435,11 @@ def create_tarball(d, srcdir, suffix, ar_outdir):
>       tarname = os.path.join(ar_outdir, filename)
>   
>       bb.note('Creating %s' % tarname)
> -    tar = tarfile.open(tarname, 'w:%s' % compression_method)
> -    tar.add(srcdir, arcname=os.path.basename(srcdir), filter=exclude_useless_paths)
> -    tar.close()
> +    dirname = os.path.dirname(srcdir)
> +    basename = os.path.basename(srcdir)
> +    exclude = "--exclude=temp --exclude=patches --exclude='.pc'"
> +    tar_cmd = "tar %s -cf - %s | %s > %s" % (exclude, basename, compression_cmd, tarname)
> +    subprocess.check_call(tar_cmd, cwd=dirname, shell=True)
>   
>   # creating .diff.gz between source.orig and source
>   def create_diff_gz(d, src_orig, src, ar_outdir):
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index e7826e7af96..681af512bfa 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -528,6 +528,9 @@ HOSTTOOLS += " \
>   # Tools needed to run testimage runtime image testing
>   HOSTTOOLS += "${@'ip ping ps scp ssh stty' if (bb.utils.contains_any('IMAGE_CLASSES', 'testimage testsdk', True, False, d) or any(x in (d.getVar("BBINCLUDED") or "") for x in ["testimage.bbclass", "testsdk.bbclass"])) else ''}"
>   
> +# Used by archiver.bbclass when compression is xz
> +HOSTTOOLS += "${@'xz' if (('archiver.bbclass' in d.getVar('BBINCLUDED')) and (d.getVarFlag('ARCHIVER_MODE', 'compression') == 'xz')) else ''}"

Sorry, please ignore this patch, I will send a V2. The BBINCLUDED maybe None in 
layerindex which makes layerindex failed.

// Robert


> +
>   # Link to these if present
>   HOSTTOOLS_NONFATAL += "aws gcc-ar gpg gpg-agent ld.bfd ld.gold nc pigz sftp socat ssh sudo"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192756): https://lists.openembedded.org/g/openembedded-core/message/192756
> Mute This Topic: https://lists.openembedded.org/mt/103268096/7304958
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [liezhi.yang@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

