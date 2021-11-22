Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D6DC433F5
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 12:00:14 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.106])
 by mx.groups.io with SMTP id smtpd.web11.5386.1637582412990610189
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 04:00:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=krY2lwsb;
 spf=pass (domain: outlook.com, ip: 40.92.91.106,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+p3hkKFA+XcTvK6Iq4lCmhgehguXqJGf5D/v7kP4lFTeDzMtbhbRM7HWR0RV6X1GWBapFv8QVDVeKlPc9UX6rAffxX7PGgOTCfJwPUoPju3xaDdDc9Wf3TR8BC+mMN+wFw8jHTXBz4Yu6lVqsvGYlPZ4jfoOxJzKM5+uB4uxRJR2vdayFkGFkbnd6RXsbA0+2UR+97ajB0H9UWy3APpt3PBd33ft7WUN7IhszBW1YozNuIpnzkzZjChNgEfnUxh6aYKtMwFAq0f0rfzeEU9E1oL4N/0muyc1C0NARz56BZtmmPja7WkyRA5uy+cIKmyUqrs1SjSd8Fomzfd1T44jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6t6v0aPrB82M5xPIJmh0ifesPKdY8IYp+d+AotEzss=;
 b=LJoSTouj9lb+2+5E8YAksPzftvKGR2eUphJyuC30AjP2hy7k9qWJhwPiPUUfPAEWFBu7Rhy7seqBV9HU61w4CX8fvllb4tyhwgim8lwXq6V/4oWOqlnfmuOMQrL+Jj01ucTzzW1xUSiL9fEJgmgy2oZcYZi0CsL059G4YJuNExhfXrfnBjUGhjR89NaRDPhZ7i+8qYs52OyrRSXZeV0wq8KBOixcTHulmntvv0pzzWzlqD1n33gjLFpEOedmvyyKB7O4vSFo/kKUTCTnVGmJss2N2nPLsbEdVcliUIX7jawzwblIrYPZVY3Y5icM2nCdRdcidh4opg0ORROOixlFdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6t6v0aPrB82M5xPIJmh0ifesPKdY8IYp+d+AotEzss=;
 b=krY2lwsbpk9YUKHImIUhSnWCB2TMLftbk2iHe7lW34x/NusKj+kVcP7qew+aggk0YVPgYOIuAZem48YgJP68O1CDw/yOHmLl1t++5SZDJTT0T3MQAV1yFxH+F9007BAoPEO9Wp8/c++xjU1L1c+mtkXP5/89z32n3HyRxzJg9fGY3YBs14ncLnqQ5jvCPvUw4/iTw4a4yJE1e6pFYUkqQA0L1aUe+MFD5SJJplUytvdD8bRV3cSToiRq8X2dGCZIS//7VRRpzRXM99NysSiYpFaqVVmFu8oXvzL9KU2cpG/Wq/XLKWWh7yDMNnbXID0vov20Y2ggrt/KOCWD6HfbgA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2963.eurprd09.prod.outlook.com (2603:10a6:208:12f::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 12:00:10 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%4]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 12:00:10 +0000
Subject: Re: [OE-core] [meta-oe][PATCH v2] gmp: Add security fix for
 CVE-2021-43618
To: Pavel Zhukov <pavel@zhukoff.net>, openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel.zhukov@huawei.com>
References: <20211122115418.1352-1-pavel@zhukoff.net>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB464249C50942935BF87985B1A89F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Mon, 22 Nov 2021 13:00:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211122115418.1352-1-pavel@zhukoff.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [QKChwsL6Vf2b3WW8/vOZ7ovo8NWXY2kCeDMcw0SJl7RHQdRZ5jozhQ8YIwg0wF8G]
X-ClientProxiedBy: AM0PR02CA0086.eurprd02.prod.outlook.com
 (2603:10a6:208:154::27) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <cf750385-591e-e96b-0fa8-2bc60eed5088@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM0PR02CA0086.eurprd02.prod.outlook.com (2603:10a6:208:154::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Mon, 22 Nov 2021 12:00:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bb80582-411b-4cb5-2266-08d9adafa23d
X-MS-TrafficTypeDiagnostic: AM0PR09MB2963:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7rt6wLjB7KTMBapTicHg1wP/+1cbd4hFYoJO5tV4l5cGD+gkqt3fc+qcQiictJgkuW64hmzJMEGJV6V2qFXbOSZB7c3nfQCsOBeoJJAAlwpN0VTrJwIgDw7EDAJqsl5VQbWAMJzmfAEwAn63lkH+nOlfnNY09ScSl3ga1SkkrXO2KGRaBvich0qOXlB9rxqDApQqKJMyJymCq4DsdX52M70KsRllOm5THogOJzwo8jWuXI6AbxigXzNmG9RsTcTC+yxw3WoW0EI9yscg84KDJYCT13ZI7QM081ekLkHbRlCZv6bArx9ENyOeTM6wr0ZLNsewIaUKc9vnNLD31ACUf6vbzzYqTcTpgGs75+w7+EJdAxfxnQ8EG7AJSj6mEATtrxpmy7QJxcP/kTze21ox8zAElOsK6+6SZRMU0uzBavVP1Wx9Edw9GH840zMHJ+9ErQzJB9JHDD/2QLLCQv/ZH6Ca/z56Z94wlWJuQU+R17O2bwWb4chptDfqCAEby6fIsEIcyVfm75EzYwVDLWD6LjfAoNjFTX1VBLcZyZ0cTtTVdzrB7l6Grjz0urT4/cOaHcA9a7P/Iwe23Ad/aW3VyvhtTEk3VsqADx58gYQ/rf+LQUr9sq6rtMt+ox9VTicRcjqib8VhWQkDFlaBYhzAUc5Zu9e8SgoU1ny+zf2NDwM=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sPdNSEO+f7BpJiNh0mLtmCgsxvyTByD/19kTsDCs2O5Cu8D2DaHMZulwa7Gz5xfx+oSiQjZwNwf2bUOpHdS4/OM98MMUIOaAQuFPXIIGJUlbgoVqPKileSmW6iR0K4mzkixQiTiRZPijyxGAsdDxR//HL8vn/UINTXik2ZBG4dXHs/Ke7IUJWgCqVuxuY4wlf9rVMDtCKe6ilBf11rSU0Zo5X5lyPkT0Jrh4+oQlAMwwTJyx0m5ul8gNN8w6OJzD9RQPj/xAZm3obmdw5u3Kh3S0N/Tr4gg92deR/fKRlroyDZLX2QmihCgM1Dyjjkxhu8HLDiGcqH9M05/XFfW+lfp/TcspSOEAM2wFAKNXR747DGRyavWw8j2JCE5eN57jotCKyD+1QjNvbKQNLTdf1LOJ1Av3KUG/izj09r/iD8iOpdJLuFr+UKF8FvdQiXnmMREnBLmZDdpjQXzzwCQ9J32XqDBmJZpaJd9j6fbtoi6OYD1KxZNGgc65qs8933w5b1GSgkF8KgE/P/COq+KBqPrRG09EZZZ/DbD7Nkq/24zGYow65B/b/mPIZuJfp64w9hr/W3Unq+oVrpJgr9zqvAhgASJEswEAn0E2+EXRRnox5SC+FqiYmKb6R0cbVBCXgucSCiJDL4SFUa/7McNBFTxuilmj9gRGmTXSaDc1wySQ3wfkzkieuiJGw8LSLJInGVcpxIBcvJhiNPM7BdQbtDXVdDFq3UxOJzD0j4lcfSVbk/pk+CyJ/GpEjj4l+KLqgC1n55Un3yqs25LcsL/Cbw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2bb80582-411b-4cb5-2266-08d9adafa23d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 12:00:10.6166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2963
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 12:00:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158565

Both of your patches don't meet the OE patch guideline [1].
Just look at Ross's patch for an exmaple [2]

So just in case for this one I would prefer picking Ross's patch, which 
seems to me does the very same


[1] 
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status
[2] https://lists.openembedded.org/g/openembedded-core/message/158561

On 22.11.21 12:54, Pavel Zhukov wrote:
> From: Pavel Zhukov <pavel.zhukov@huawei.com>
> 
> Fix mpz/inp_raw.c integer overflow and resultant buffer overflow via crafted input,
> leading to a segmentation fault on 32-bit platforms.
> 
> References: https://gmplib.org/repo/gmp-6.2/rev/561a9c25298e
> References: https://gmplib.org/list-archives/gmp-bugs/2021-September/005077.html
> References: https://bugs.debian.org/994405
> 
> Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
> ---
>   .../gmp/gmp/CVE-2021-43618.patch              | 25 +++++++++++++++++++
>   meta/recipes-support/gmp/gmp_6.2.1.bb         |  1 +
>   2 files changed, 26 insertions(+)
>   create mode 100644 meta/recipes-support/gmp/gmp/CVE-2021-43618.patch
> 
> diff --git a/meta/recipes-support/gmp/gmp/CVE-2021-43618.patch b/meta/recipes-support/gmp/gmp/CVE-2021-43618.patch
> new file mode 100644
> index 0000000000..f741972439
> --- /dev/null
> +++ b/meta/recipes-support/gmp/gmp/CVE-2021-43618.patch
> @@ -0,0 +1,25 @@
> +
> +# HG changeset patch
> +# User Marco Bodrato <bodrato@mail.dm.unipi.it>
> +# Date 1634836009 -7200
> +# Node ID 561a9c25298e17bb01896801ff353546c6923dbd
> +# Parent  e1fd9db13b475209a864577237ea4b9105b3e96e
> +mpz/inp_raw.c: Avoid bit size overflows
> +
> +diff -r e1fd9db13b47 -r 561a9c25298e mpz/inp_raw.c
> +--- a/mpz/inp_raw.c	Tue Dec 22 23:49:51 2020 +0100
> ++++ b/mpz/inp_raw.c	Thu Oct 21 19:06:49 2021 +0200
> +@@ -88,8 +88,11 @@
> +
> +   abs_csize = ABS (csize);
> +
> ++  if (UNLIKELY (abs_csize > ~(mp_bitcnt_t) 0 / 8))
> ++    return 0; /* Bit size overflows */
> ++
> +   /* round up to a multiple of limbs */
> +-  abs_xsize = BITS_TO_LIMBS (abs_csize*8);
> ++  abs_xsize = BITS_TO_LIMBS ((mp_bitcnt_t) abs_csize * 8);
> +
> +   if (abs_xsize != 0)
> +     {
> +
> diff --git a/meta/recipes-support/gmp/gmp_6.2.1.bb b/meta/recipes-support/gmp/gmp_6.2.1.bb
> index d5996abd00..7c12a97228 100644
> --- a/meta/recipes-support/gmp/gmp_6.2.1.bb
> +++ b/meta/recipes-support/gmp/gmp_6.2.1.bb
> @@ -12,6 +12,7 @@ SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2 \
>              file://use-includedir.patch \
>              file://0001-Append-the-user-provided-flags-to-the-auto-detected-.patch \
>              file://0001-confiure.ac-Believe-the-cflags-from-environment.patch \
> +           file://CVE-2021-43618.patch \
>              "
>   SRC_URI[md5sum] = "28971fc21cf028042d4897f02fd355ea"
>   SRC_URI[sha256sum] = "eae9326beb4158c386e39a356818031bd28f3124cf915f8c5b1dc4c7a36b4d7c"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158563): https://lists.openembedded.org/g/openembedded-core/message/158563
> Mute This Topic: https://lists.openembedded.org/mt/87233112/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

