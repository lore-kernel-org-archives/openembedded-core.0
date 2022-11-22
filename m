Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D55BC4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 22:43:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6319.1669156999623748613
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 14:43:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ihhymRpx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83251fd825=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AMKYGdY008181
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 14:43:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=AeKrgZspVYSwzOjThKaTVwWPfilRvhqgc/3KYDjpYY4=;
 b=ihhymRpxdbZ01PNNqnOq7l6+M5PKUdeeuOCzru/NPXQ3FB30wRlJhx8FAmSnt+CFamy/
 pG817ZrAVQsaX9AM8g3SXC5WNnHncAJQlX30K1BAhwB37Zngd327e8CjhM2zLRNF5Cd6
 a6/t6vtt+WX905xLSXCLxWMhtYsyXWWl+y6ys9D6FVpeHTLJwfLVOJ4SohL8ihGy9KJM
 6oJx/V5Dpl7NgeixKVjQ/sbgqHB7KKRTEwY2cN6JjFQM9dz1JdMRg92aSAxYvS4M77a6
 fTXAgHge3/pIgnFrPiA/KwgPYmrMKBaYvnhFjPDyTGUjVroDJbxkxikHdt7JAaQuAOnZ 2Q== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxua6aurn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 14:43:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZ4qEmA5VTRDODexZLtJAnracjEqrL+/rEBxJ4MgqO+pfiaPAsYxZOuPY7LFP4UpZpnFrrUYgMzcz0mcL8Ujj5Utqz8LvDZkySpCFi9TDP1m6mhZUvjjqJ1ZIUUK/7T0yklq8NJeo1pb3Nw4w5Gxtl+VqtOXqt2WKp7Dk3/udpb/rGGjTPg/KuhJ8qB2eitXtjmIzv4k2XBPfimzZGogTuHwo9y8xnTSWlA2LWdT0V2dB+uk/DivjJn7Mym15CQKKn9+Vx0Yi7ptTvM8zXxHE5w4et6VrH6lA959MoQ3d1vYw8iNDtbWzKomvZAXIHB+CD6noXLv751KiJXh3L4VWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeKrgZspVYSwzOjThKaTVwWPfilRvhqgc/3KYDjpYY4=;
 b=Wegr6c8rnTG5qoYFl343HuUpmwalrNT0WxDvdQt8KMfS0XP7IoWz/SNQYHWmXM85q09izALEu2fbCiklOWsKeiX9CLOQGMRMaXQc86EAxyaQ154OQrMpvOOaCutL+FmbRpZA1zcTpA990XRIp4U0tKiIWqLWBNqMdkIg0yhTwY7ImpN4gW7axfQDkr5e1mHycsPlzLtSVY08YrGWc7E+/ZrnKc8kXY/WYwAx40YUxU3I136zSQvY7m58Ai87gIS/gU6IMp5VUPIkCO7B7/6FbskmCfSulgUl22IMkn3TK/Nw+T/WhbOmBfaNGNIWIPz1Zwx53b9UcSzTjf0jhyMXgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4612.namprd11.prod.outlook.com (2603:10b6:5:2a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 22:43:16 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 22:43:15 +0000
Content-Type: multipart/alternative;
 boundary="------------0r0RAez1MwVN0NLjKZF6ab32"
Message-ID: <5eb7291a-2152-b5ba-1217-900d10ebe070@windriver.com>
Date: Tue, 22 Nov 2022 17:43:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [master][PATCH v2] libtiff: Fix CVE-2022-3970
Content-Language: en-CA
To: Zheng Qiu <zheng.qiu@windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20221122154901.2290930-1-zheng.qiu@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20221122154901.2290930-1-zheng.qiu@windriver.com>
X-ClientProxiedBy: SJ0PR05CA0102.namprd05.prod.outlook.com
 (2603:10b6:a03:334::17) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DM6PR11MB4612:EE_
X-MS-Office365-Filtering-Correlation-Id: a72c9a9b-9998-4b7a-cd96-08daccdaf1c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Kc3RRdWyZbDE0vS43pD745vU7fnfXdDkiJAELZtoW8i0V2uuymZguh+40avRB39hUba6xYkHTSZnMqn27s7d2ou/ARvIUHcAkZSldw/Ok1uv9Ro25/EmiE5kU+xCyWXnoNOzKExlxXr/72imIZ8h262gst/wKq9X72H/6iY1zbG3tL5qcj/WY5XT020G1r88kQ5QQp3pe9SBAc9TpkpchDje3a5WIYOvzbyY2UogYqI1HKAXvBSY2BXpDRmiYMfFs/pWVBSNVk77MtbvWgNJ5TBuv+XV8PK4UhCTz2fCFKte0r+r6OZCouYcFk99y7hI2CiUuqe7VKl5gWh9qfqsPKVHJBJkPR2dnMXsRPg9rAcB7zxIpy2ppME0vBugQt/Z+qwfoEulru0dX23zZLGuEb7jClzmHh1CCt9GXY2JHzdMX0xbny2yDrrY/TyGiGQwBpA7QijnB4e4fxQMxV5Onjn3suZueVroROjo/ss/XgAG9BbDvNKR+oW9cNgGBp/P1zz+b1ezcTlrjuD3fBWZQ1SomEkTt0Wp4x+eYkDkK6/N2r2DVeFzT+X/tm3STiMlKKd0vn3hEUUL8lra6yhYLbhqwxK1yi279kNQOUbSMFBeMLL7/kbKvArRJe3m8vgCS4IXN1hRYCe2L9jXHQHcVA/QJ3Zn5O/EBUqBk0L6533Ms1yvp/BMSGfKdRycG+MLyfYcdfpCDEgtR7wYapmQlqY4A/n1GKhTien2uQWxFzfFjQ7XWPmZmJvBtb2aaUeBPovNFUra0y1ELsf6SCvbBPoxi6ngHyXGUewLrn/u9mnYruGcNafRoOGOS4saFNwq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39850400004)(396003)(136003)(346002)(366004)(451199015)(86362001)(66556008)(36756003)(31696002)(2616005)(53546011)(41300700001)(66946007)(5660300002)(33964004)(186003)(66476007)(6486002)(8936002)(8676002)(6666004)(966005)(26005)(6512007)(478600001)(316002)(6506007)(166002)(83380400001)(38100700002)(4001150100001)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cC9KY3U0Y2M4blc4QnVOL3Y3akhVZVFYNHRaTWVyekxzblM5QnRhN0xuOTNV?=
 =?utf-8?B?MC8yTkJERjNFajhkOEUyODRjNytMRHltaEltVDVXaDgrczlyYU5XSFBFWUQy?=
 =?utf-8?B?aFZWektBYm5QbWFKTjd6SVluK1h2QTdONSsvWldCcHB5YlJYMEZLOHBXT2Jv?=
 =?utf-8?B?bFI0WmluaG5lWEs1UTlBM05ycG54cnp1OE00OUd5L0pPN21wRHlrU2ZvQVlw?=
 =?utf-8?B?S0QzWmlKVC8rRWRXZWc0SlhFNzNrSXNEY0E1dk9rakpkUnBGejFXNTZaQmx0?=
 =?utf-8?B?OXZRd0dxQUd1K1J0RlljU00vV0x5NmxnM3JYZThpVUtyTmkwVGU2NWVkdzZH?=
 =?utf-8?B?WExmdG84azhjbm5zaVg1YnVRaVBqN0J4b1JXQVVackp3NkJIVVd1b2hzL1Qz?=
 =?utf-8?B?SlN3SEFzYXorZjlsVVlGYm5ibEl0aWNMcHJ1TXY4U2FNM3FUZHpYTkRqdTFK?=
 =?utf-8?B?YWQ1QUxxL2x5MmN5SVo3c0w4aEd5RmUrQVlaU2RkbUFlYWJnS0lQeHlJeDRj?=
 =?utf-8?B?WG41bzdxMmRac241d0VhQ241WnFVaVlaQk5GcENMblpSV0FJdmRERnF4R0RY?=
 =?utf-8?B?bWp5eis5ZHNiblYzQUd5bklYbWhWaURKYktwTHNGYjVXZkt3UXExTm5oYVRj?=
 =?utf-8?B?MUp0RSt1NXpITlBnS3hVWVIyTVVqS2tWZVhoMzdzejkzSldYaFhMdXZjem5J?=
 =?utf-8?B?Tkl6TlZVM3g1Sk4wYjhUSzIrSkd6am9pc1RWdVpaQ2tUN28yVFJiRDFicDF6?=
 =?utf-8?B?YUZtcURpTlROL3VTdHNxcWxSanBXSFhHd29pWTJlcWIzQkVraFRhYUVSYld0?=
 =?utf-8?B?VWV3azdWc2dMMjBDb0VjS3h6Q2srTDBYS0J2UzBoQVhIRFFEdFJLYnkyRnRp?=
 =?utf-8?B?T0wrajJMc0U5aFJnSzdZZGhjQStTNnJWblovT2Jud0V4UlpwNzRjbWxoUGg4?=
 =?utf-8?B?MGZndDZ6SExadkZaZ2RodE5kL012aW92cGI4WWNybEJsK0FmdlVld2R0L1M0?=
 =?utf-8?B?MTVkei9ldkxZQXJPbmlneldQTmwrTXZNR3hYT0dkajduNW1wcjIranNMZlBW?=
 =?utf-8?B?TlVZaVlzS3hweXR6Y0FxOWpaWVdEazFBNWpMR3JDNFNBWlJiYmpKVjh1YjFL?=
 =?utf-8?B?S25wWG1KUUFRdGFMRVBYY2xjbmtoeVpzVUNseGw4SUVnaXhhWWRDeStBVGgv?=
 =?utf-8?B?MHEwSUhYY1U1dmJUSjB0TFM3QUV6YW9QMGwrMkplU3Q4UGEzaTU3K21ReFEw?=
 =?utf-8?B?YjJFbGVFc2h4NWpiTWEwZXlLbE5CU0w2OTQ0NVUzdmVwdXhpUnJKZWpXMjRs?=
 =?utf-8?B?MEhCd0V6b2h0dERMa3NGVjRWOTN5MWpIV21KbGZXWHdRVFVxSTdObXM1REpk?=
 =?utf-8?B?VjlRUTZsVWRaeVF6MVpYQklKZ1BGODVhVU85cjRsNW1idzlMUmVmWi9rY3hL?=
 =?utf-8?B?S3FyRmcwaVRYbmI1UXFqNmhZbTdncllYcnpwdlZsQ21NdkYzZTRmb212Z3Y5?=
 =?utf-8?B?TnRoWkFTQmpGY3Y2L2IzWGJvN0s2ZVNQd2MvcDdFUE9PWDRNNzlCcDh0VFBV?=
 =?utf-8?B?YlA0ODY1RlRiTkIyeWFYMDhhQ29nWGI5MjFwR01FMHFkSlJ4MWt4NDJ3REFE?=
 =?utf-8?B?SWJsbXRiVFVJRHJZRkg3czJ0aVhkMG5EQ0IvcVB5RGQ5YmlaMjBGZ0c0TTNB?=
 =?utf-8?B?L3BLRHdaWmhldEs3OXM3UkxFNE5XNXBFQjFQaXppUGwycVNybndZa1lwQW5S?=
 =?utf-8?B?TzRLeTViWGk4VEpvc0FVYWU2YUJwR1NNWnpHbndPOGN5dmZvR3hxaHhPNnVt?=
 =?utf-8?B?Vk9CTTRNUWR6dXJmRktRdytSc1lZUWhvYkFVelJzTFVxQ3VSRGtkcUF0K3Za?=
 =?utf-8?B?MGQ4ODVjMVpiQ3RzWDFhV1lhZGVwK3E0cFh6eFd1VjRvWTZVRkxVdFRTTTlR?=
 =?utf-8?B?TXlTZitLdFgzR1BOdzF3ZHo1Rko4QmZkMFZuREtKMVh6VFRSRUNGaXdnN0xH?=
 =?utf-8?B?YnFnRU5PQUZ2Y05WbkZ1Q01FT0pNRTYzT2lFZ05QZW9VbnNUS3ZGQnJXUmM0?=
 =?utf-8?B?Rk1Dd0ZPd3BuNHlHaFVNQ3RuNTRFdE9RMmgxT21vdi9sVnJoSmEzVEhYODVH?=
 =?utf-8?B?RVpmY0tZZzZuWDRYVHUveFRFR0hERStseEFRNGc2RTltQ1JwOVRRTHE0VzF4?=
 =?utf-8?B?Y0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a72c9a9b-9998-4b7a-cd96-08daccdaf1c3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 22:43:15.8986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qWfOMq+FlhRu+YatgJZ5W/0RbfCnSlleB+fW7/1+0Blzq3mxfJ+1cuAoeF40UxHedA4lUILgDg54CMxaUqoPuY8sMCzlVu7EeC5Nt5vzsRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4612
X-Proofpoint-ORIG-GUID: J3uiaWsIeOemhssTxuu2wUw2jYPSuzHV
X-Proofpoint-GUID: J3uiaWsIeOemhssTxuu2wUw2jYPSuzHV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211220171
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 22:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173703

--------------0r0RAez1MwVN0NLjKZF6ab32
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022-11-22 10:49, Zheng Qiu wrote:
> This patch contains a fix for CVE-2022-3970
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2022-3970
> https://security-tracker.debian.org/tracker/CVE-2022-3970
>
> Patch generated from :
> https://gitlab.com/libtiff/libtiff/-/commit/227500897dfb07fb7d27f7aa570050e62617e3be
>
> Upstream-Status: Accepted
>
> Signed-off-by: Zheng Qiu<zheng.qiu@windriver.com>
> ---
>   .../libtiff/files/CVE-2022-3970.patch         | 38 +++++++++++++++++++
>   meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |  1 +
>   2 files changed, 39 insertions(+)
>   create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch
>
> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch
> new file mode 100644
> index 0000000000..e8f143933a
> --- /dev/null
> +++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch
> @@ -0,0 +1,38 @@
> +From 227500897dfb07fb7d27f7aa570050e62617e3be Mon Sep 17 00:00:00 2001
> +From: Even Rouault<even.rouault@spatialys.com>
> +Date: Tue, 8 Nov 2022 15:16:58 +0100
> +Subject: [PATCH] TIFFReadRGBATileExt(): fix (unsigned) integer overflow on
> + strips/tiles > 2 GB

The Upstream-Status should be here in the headre of the patch.

v3, please or update the patch if this gets merged.

"While adding this tracking information to*the patch headers* is 
currently optional, it is highly recommended and some maintainers may 
require it. It is optional at this time so that it can be evaluated as 
to its usefulness over time. Existing patches will be updated with the 
tag as they are modified."

https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status


../Randy

> +
> +Fixeshttps://bugs.chromium.org/p/oss-fuzz/issues/detail?id=53137
> +---
> + libtiff/tif_getimage.c | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
> +index a4d0c1d6..60b94d8e 100644
> +--- a/libtiff/tif_getimage.c
> ++++ b/libtiff/tif_getimage.c
> +@@ -3016,15 +3016,15 @@ TIFFReadRGBATileExt(TIFF* tif, uint32_t col, uint32_t row, uint32_t * raster, in
> +         return( ok );
> +
> +     for( i_row = 0; i_row < read_ysize; i_row++ ) {
> +-        memmove( raster + (tile_ysize - i_row - 1) * tile_xsize,
> +-                 raster + (read_ysize - i_row - 1) * read_xsize,
> ++        memmove( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize,
> ++                 raster + (size_t)(read_ysize - i_row - 1) * read_xsize,
> +                  read_xsize * sizeof(uint32_t) );
> +-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize+read_xsize,
> ++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize+read_xsize,
> +                      0, sizeof(uint32_t) * (tile_xsize - read_xsize) );
> +     }
> +
> +     for( i_row = read_ysize; i_row < tile_ysize; i_row++ ) {
> +-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize,
> ++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize,
> +                      0, sizeof(uint32_t) * tile_xsize );
> +     }
> +
> +--
> +2.33.0
> +
> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
> index 29cb4111d6..f92b034c4c 100644
> --- a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
> +++ b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
> @@ -12,6 +12,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
>              file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch  \
>              file://CVE-2022-34526.patch  \
>              file://CVE-2022-2953.patch  \
> +	file://CVE-2022-3970.patch  \
>              file://0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch  \
>              file://0001-tiffcrop-S-option-Make-decision-simpler.patch  \
>              file://0001-tiffcrop-disable-incompatibility-of-Z-X-Y-z-options-.patch  \


-- 
# Randy MacLeod
# Wind River Linux

--------------0r0RAez1MwVN0NLjKZF6ab32
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2022-11-22 10:49, Zheng Qiu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20221122154901.2290930-1-zheng.qiu@windriver.com">
      <pre class="moz-quote-pre" wrap="">This patch contains a fix for CVE-2022-3970

Reference:
<a class="moz-txt-link-freetext" href="https://nvd.nist.gov/vuln/detail/CVE-2022-3970">https://nvd.nist.gov/vuln/detail/CVE-2022-3970</a>
<a class="moz-txt-link-freetext" href="https://security-tracker.debian.org/tracker/CVE-2022-3970">https://security-tracker.debian.org/tracker/CVE-2022-3970</a>

Patch generated from :
<a class="moz-txt-link-freetext" href="https://gitlab.com/libtiff/libtiff/-/commit/227500897dfb07fb7d27f7aa570050e62617e3be">https://gitlab.com/libtiff/libtiff/-/commit/227500897dfb07fb7d27f7aa570050e62617e3be</a>

Upstream-Status: Accepted

Signed-off-by: Zheng Qiu <a class="moz-txt-link-rfc2396E" href="mailto:zheng.qiu@windriver.com">&lt;zheng.qiu@windriver.com&gt;</a>
---
 .../libtiff/files/CVE-2022-3970.patch         | 38 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch
new file mode 100644
index 0000000000..e8f143933a
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch
@@ -0,0 +1,38 @@
+From 227500897dfb07fb7d27f7aa570050e62617e3be Mon Sep 17 00:00:00 2001
+From: Even Rouault <a class="moz-txt-link-rfc2396E" href="mailto:even.rouault@spatialys.com">&lt;even.rouault@spatialys.com&gt;</a>
+Date: Tue, 8 Nov 2022 15:16:58 +0100
+Subject: [PATCH] TIFFReadRGBATileExt(): fix (unsigned) integer overflow on
+ strips/tiles &gt; 2 GB</pre>
    </blockquote>
    <p>The Upstream-Status should be here in the headre of the patch.</p>
    <p>v3, please or update the patch if this gets merged.</p>
    <p>&quot;While adding this tracking information to<b> the patch headers</b>
      is currently
      optional, it is highly recommended and some maintainers may
      require it. It is
      optional at this time so that it can be evaluated as to its
      usefulness over
      time. Existing patches will be updated with the tag as they are
      modified.&quot;</p>
    <p><a class="moz-txt-link-freetext" href="https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status">https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status</a><br>
    </p>
    <p><br>
    </p>
    <p></p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:20221122154901.2290930-1-zheng.qiu@windriver.com">
      <pre class="moz-quote-pre" wrap="">
+
+Fixes <a class="moz-txt-link-freetext" href="https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=53137">https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=53137</a>
+---
+ libtiff/tif_getimage.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index a4d0c1d6..60b94d8e 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -3016,15 +3016,15 @@ TIFFReadRGBATileExt(TIFF* tif, uint32_t col, uint32_t row, uint32_t * raster, in
+         return( ok );
+ 
+     for( i_row = 0; i_row &lt; read_ysize; i_row++ ) {
+-        memmove( raster + (tile_ysize - i_row - 1) * tile_xsize,
+-                 raster + (read_ysize - i_row - 1) * read_xsize,
++        memmove( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize,
++                 raster + (size_t)(read_ysize - i_row - 1) * read_xsize,
+                  read_xsize * sizeof(uint32_t) );
+-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize+read_xsize,
++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize+read_xsize,
+                      0, sizeof(uint32_t) * (tile_xsize - read_xsize) );
+     }
+ 
+     for( i_row = read_ysize; i_row &lt; tile_ysize; i_row++ ) {
+-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize,
++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize,
+                      0, sizeof(uint32_t) * tile_xsize );
+     }
+ 
+-- 
+2.33.0
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
index 29cb4111d6..f92b034c4c 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
@@ -12,6 +12,7 @@ SRC_URI = &quot;<a class="moz-txt-link-freetext" href="http://download.osgeo.org/libtiff/tiff-$">http://download.osgeo.org/libtiff/tiff-$</a>{PV}.tar.gz \
            <a class="moz-txt-link-freetext" href="file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch">file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch</a> \
            <a class="moz-txt-link-freetext" href="file://CVE-2022-34526.patch">file://CVE-2022-34526.patch</a> \
            <a class="moz-txt-link-freetext" href="file://CVE-2022-2953.patch">file://CVE-2022-2953.patch</a> \
+	   <a class="moz-txt-link-freetext" href="file://CVE-2022-3970.patch">file://CVE-2022-3970.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch">file://0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-tiffcrop-S-option-Make-decision-simpler.patch">file://0001-tiffcrop-S-option-Make-decision-simpler.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-tiffcrop-disable-incompatibility-of-Z-X-Y-z-options-.patch">file://0001-tiffcrop-disable-incompatibility-of-Z-X-Y-z-options-.patch</a> \
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------0r0RAez1MwVN0NLjKZF6ab32--

