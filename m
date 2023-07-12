Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB01EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 22:05:09 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.106])
 by mx.groups.io with SMTP id smtpd.web10.2886.1689199502771358140
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 15:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ni.com header.s=selector1 header.b=NMQomVpl;
 spf=pass (domain: ni.com, ip: 40.107.244.106, mailfrom: alex.stewart@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWYq5qDnNyD0jUs7DW7/spKsG0jyssg3EhKOmF0pfV7jTKMqU+IIYUIvYGyrxoGRIxxlqWG9Hhf2KIehgvXwpojPVhyTO/lrRRnUsGw6kXQtICvna/K+J5NFLz/V5YpUmX0vZieioUU6+/8ynDsoFubmS4NGdurhHD3/1vYYOwKc+WS3Bd8Po+EblXVGuVZnqfymXA4JfZKruhu+lqmHjH0F7h8Z66Grzeg9rzREA8TTCZCzTXN1tVYV58aJOMSbZ2eTrg0agIAyrZE70tFwFhPzHZPxAUpZSTh+bD5JhkvaB7bQSFlrUnwbXSXsfA6CrPOFi5OQZldBaF7bOcexKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNo0WGa+o9J3xQ2NV17iHCBRP0f3vfONFHg6iP9SCQs=;
 b=OCtbVJF0EzlyAiU14zp+WmiQI64ONeftu2VJCYEc8/MTZMSGt48ARRfb9iPAj5fbHOv1ew1o7FdiuzlV10FTy6jcvbw2QGKr0FA5ZJgivJccNqsKSrQLP80O7ToKrk186q2I/lATAH7EupNnI38xW8BNLfcestsRTaRVcZcHrM8UllJth9DwVqri5iu4S/OJcbTdqx3Dz6J0z4CDztTDtzJIocOipc/X1mSVP7zMnNtV/iETSD9QkI47B5/1qQtz/7GEMpv+e4WD/jufbRUwBxvY8bQ4YCTz/5XUSrPxNvJzzNbMHBSTaA64ydb/SUWhBsi+7xDdhPPb2GzVVqNz+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNo0WGa+o9J3xQ2NV17iHCBRP0f3vfONFHg6iP9SCQs=;
 b=NMQomVplW6lm9kqhMD+P0s6uqfijFVbFa801J0n9yuVQGkjLLuqTUXHrxesqdXamExGFwWHXh5O1Vtk3KuczKuk+guP8Zz7JFhy4KRU1hRKXcRIXHhLiEs6LzALBvhaxiA+sitlijjxAQCr+5+Y2RGA630Oj6X+7/wqGuLOaCf0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by DM6PR04MB6908.namprd04.prod.outlook.com (2603:10b6:5:229::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Wed, 12 Jul
 2023 22:05:00 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::fa97:81aa:8d0d:c43c]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::fa97:81aa:8d0d:c43c%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 22:05:00 +0000
Message-ID: <0cce368f-36b7-672e-df83-94b4914a1344@ni.com>
Date: Wed, 12 Jul 2023 18:04:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro
 native features support
Content-Language: en-US
To: p.lobacz@welotec.com, openembedded-core@lists.openembedded.org
References: <20230712190428.379909-1-p.lobacz@welotec.com>
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: <20230712190428.379909-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN9PR03CA0943.namprd03.prod.outlook.com
 (2603:10b6:408:108::18) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|DM6PR04MB6908:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c90962f-1a56-4b85-ca90-08db83240919
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OjFdsovQ8FNdaneVN2jJ7Ep+KUeAsEYP8lntTbJ50KqJsvq8k6ZW2+B8pBQfasoWKQFcWV5NWskTeWcGYL4WAYbfdE396gkbeJPmGFJ3hhtUDlFLlwDbBNHrzoDdiJbj4GDZCqCs5dj7nHOPl8zoj8ZN+rDqYd93iXESP9VUqA64df+kydhS+8cONyrud6wqcLnDKVlDB1Gue+sjXAjTBJKmXcITrE16C1ael6RRzN2jf4bdqsNp8D8FNnMXLOtEjPRrZRDk0PHE7bqMFXbyQAbbrXQM3vPi3TUwf9py7/4dqnKzCPx9/rE/fgv4Y5sHuoCW0k7vOTkeZUaV0TnJOUB9JiQX7M9lrdLt2tHbPUCHDO4kWUnYTKv6S/LaljPBiZ4ahQrUMNmfxAAYEcHo++c8cPTmXAnmI740no/JaFyxoaIoUGDGC3aJ3VvrxVYQxO0MfIgV4WymXInt16sbqB90B5BGIUpunMZzi/B61HkCRNndm5ycMS9kyaUL8Tbyb5D1NEUO5oMHKfMHe00Lme3ScEJwvt9l2IQ0BzRWmE9/ESasrmVQ3lS8fM/YHG7mjyyWlsNwNfjyplWbsQSPLXpXfy7WKX5PcDy/OOM0pM7ccHXWPRUYz2qfcJ6o6g2V3F3kLkHcta7N4v4qA+pe2DRZjLP+TMFqNBgIs4uZjvvaci9nPV5XRVTy4H0aBLf7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199021)(66574015)(2906002)(2616005)(36756003)(41300700001)(66899021)(83380400001)(53546011)(5660300002)(6506007)(186003)(44832011)(8936002)(8676002)(31696002)(6486002)(66476007)(66946007)(66556008)(36916002)(6666004)(86362001)(478600001)(38100700002)(31686004)(316002)(6512007)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5+z6hp0bSxBN9yNNZdRwOmgEaiYyZGAFYsVQ15caehZ640yBHrs0pmJZ6HPM?=
 =?us-ascii?Q?E5CyCjVckzPIlMLBHbVopPDeheS/6nI2HVoe4OpHlFC4xXRgXqBEo5UjEqJe?=
 =?us-ascii?Q?s17w+mBprfjOagNzVyLVk5PcTejerWziYbOMYmyDN1efTfQ7vC8aTAYqydDL?=
 =?us-ascii?Q?HSvXj62Xeet2qKq7t3+0g9VXz0FGr+l++iG1yfmB/ijOr7m0AKFDgf4Qjshh?=
 =?us-ascii?Q?GmMuweS/oBofIt3f9EuesGY4nk39PoLcI51fc1QD895G2dZNpQC3b9f3o4nm?=
 =?us-ascii?Q?1eZrePNuAFNF+24CzcxnFZn2QB8fePHudXg37R4xo18sfE+K7mPkOuZAAyFB?=
 =?us-ascii?Q?C9SjmUE6W0bJvYWMPk0vZCqCtIDo6BW9/FxddoUZboEvZ7Me8BI9sLTQMvzs?=
 =?us-ascii?Q?u+3iQ5lC+MMVxvCcVzPkoQ3SHLVa9WSEiCC31UFE7x8zBwBh8heHVriFklEi?=
 =?us-ascii?Q?5h10ddN1CPuxtO5ym/RRgY+JJCfnZtjeg1/T7NPuPMZ0fGr0J9oMVRZNUeEb?=
 =?us-ascii?Q?ZTJ02Crkb+6bmoeXqUx9ro8u1mILAUKmOm+NFdngGTBW7Olrb8g1Ycb0c20a?=
 =?us-ascii?Q?gR/U65V37WxA+IaAb07LwPHF+vXaT2xnzWvDt7UNSIfXIvl4KvS4uOJIBz5q?=
 =?us-ascii?Q?Si6FH/8kz18W01vjj1DyZpnp85+xXmNiySvPdbclK6rWDhNAd6xPhWTHP88I?=
 =?us-ascii?Q?MVZeWTfHkcDrLyUZKbslHUhBPTjVeeLJkPhG5ErmdtwXW4r5FPs4ePJb1T3r?=
 =?us-ascii?Q?VoBZUdycHiwNdcOhcXweF0r3EAg47TnaYYi2++D4ODnshoTYangr4NwdfIzk?=
 =?us-ascii?Q?RFDdPZ3mN6Ix0ZPKrIXIvwlDjINqwk5mhuNZsafyEzNLQJ/EbWwYAf8IntuC?=
 =?us-ascii?Q?Q3YrjHtV9DlMxk/vBlC2AGTN7XpzUYkMam44uDQ9x6nEO7JnF5L5v2Ja/aR7?=
 =?us-ascii?Q?njleK8qON+6BtxfSdlP6uuERV/gLWfwq+rFaXsUr18mcF7H+BBjQmsCiet3s?=
 =?us-ascii?Q?mIxx90Fx8Xj7oiwoV5VZiu6734tMf4Ds7Owxet+pEudwBTPLJLEoim9JwfpQ?=
 =?us-ascii?Q?JAvmXq2oykIHGJTXjo+rMUUqt6FHRi44sCMQgBQDZumqEzgYIbMh+n1Dxhqh?=
 =?us-ascii?Q?uCPh54f9TaFwH9tksSsXxS++oq0XAwegFgcvA0hyslD9fnlXW0ibK2QFQxRq?=
 =?us-ascii?Q?S1Xl8THsnI3m306KcZ2XW1WKSCQINJzX5+7N3MG6rRTT59X/+RLs2azLMSnt?=
 =?us-ascii?Q?LyyVTxEAgEOG3jKBcmyZ7T1tMX19Hth0B7X4DJgeMgpiAJ9DZ9jqee8WN+2r?=
 =?us-ascii?Q?/auOoOQtUhdN3uqlzs3O3uDOwhYY8CLOVEktEDn9NRoA3HeJJ1NyjBzJkQxM?=
 =?us-ascii?Q?H8VY8BNbJzw8KprATUXEerr5N72Qs162cidNJG750Iou1reZokGcrJ1ss1cR?=
 =?us-ascii?Q?e0g8STNqB76oxd+LyOnATZUzVXPQVPt+1DzYH73jZxQ0GPmQQgaToZSnUsjL?=
 =?us-ascii?Q?3wl8JMtiU/5aLpA8gzzYsSi+njJpFLHiVLAuU9Vu7VJk3DP298mLXu31n16s?=
 =?us-ascii?Q?d2XMDp1gPGEgVyOcYFW/UXSuUlJr68gT8HvkjjTgmiLZjenbw0kj2c6vOY4x?=
 =?us-ascii?Q?YPYCQYb6IWP63JAFyP6nUeFX9e47AOSt329jxAINp9EB?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c90962f-1a56-4b85-ca90-08db83240919
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 22:04:59.9559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ba6Kve+EhftD88GIyyo43f5U/1W9nbpn2xqM1P9RQobdeh/SKKuXlFSgWv0pB+M6K0rOn7mEVV7M4K+KQxng7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6908
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 22:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184228

ACK this patchset, assuming the other maintainers are happy with how=20
we're handling the DISTO_FEATURES.

I chose not to include Piotr's opkg and opkg-utils ACL/xattr changes=20
into the 0.6.2 release, which I have just pushed. They've been merged=20
afterward, and can still be applied atop 0.6.2, and they'll be merged=20
into the December opkg release.

I have a branch ready to upgrade the opkg and opkg-utils recipes, but=20
I'd like to wait for this patchset to clear, because they will otherwise=20
conflict.

On 7/12/23 15:04, Piotr =C5=81obacz via lists.openembedded.org wrote:
> Include support for ACLs and extended file attributes for native
> builds, by default.
>
> Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
> ---
>   meta/conf/bitbake.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9625a6fef4..8daaaad615 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
>  =20
>   # Native distro features (will always be used for -native, even if they
>   # are not enabled for target)
> -DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
> +DISTRO_FEATURES_NATIVE ?=3D "acl x11 ipv6 xattr"
>   DISTRO_FEATURES_NATIVESDK ?=3D "x11"
>  =20
>   # Normally target distro features will not be applied to native builds:
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184214): https://lists.openembedded.org/g/openembedde=
d-core/message/184214
> Mute This Topic: https://lists.openembedded.org/mt/100106217/3616788
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.stewart@ni.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


