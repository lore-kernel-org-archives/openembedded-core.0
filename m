Return-Path: <henning.schild@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE43C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 13:22:41 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.59])
 by mx.groups.io with SMTP id smtpd.web11.12327.1672924951362016238
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 05:22:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=pr1EkVZ3;
 spf=pass (domain: siemens.com, ip: 40.107.7.59, mailfrom: henning.schild@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rrp5298DP81zj/jmJOYdIHYbrceY6ZxHXoT1tDOU1mNBWWhdK272GP+rBVP/VlWi+APIQrYX/K8kcrczKAHbnxFYel/I6fO8APxjB5Ydwo9WhJ2L5vA2TCZhWocQc4MCm/sQPqwpoaJTQvKFEzipi1YS7Rb6q3KCT1Zs+BnLQ9BnwisWa3ZhxDe/HHk3bLKWIDENRoRJNZvX+XszBDrVoXCrht3y6vIwuCaypFm/vxvGHY8bF4FnTutkE2DAYG0HgO/xjVo661Cd6JJVFlRCwhvGOOSN5Lnz4nNDxI1ckyFM3q9FCZFN1BfKklz3rebRXJbU/TgtFFWy9R6ueRPuUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nh9FWmzv/OnP7O97xnECVN5jIHGx5OqB/BtbVcCGBDI=;
 b=AzbQkeJxQKpl2u/rWX5hI3Jy6B8C6HzNa96/0N+boxorXLRhX0ITA/MkUdHeyZPrRdQxRbA03dDVZOAGY6nMhgoiVx2QI05rQAKPfOoowzoKHMLyha9/JFyR6Rw8Vq7dW3VT8yGx9ZRROWinpQFNLC+J05jhSjJGR5DWEBouBsst4AsXFwL7a6hBaIFB8L6ukVTg4Zsl45s5NtS5RE51LId3TcV8brGat4g5zLdEHs9Pu5NFcShTlZj4Y8ke/rcaywMd6+LhhYyUgP+5wqZDGvIbg3Pe9K8/GeYj4hXlh+eaJzGF63hC7H4fHo+tNr1siYUAc3/LimHiz10YT/T2Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nh9FWmzv/OnP7O97xnECVN5jIHGx5OqB/BtbVcCGBDI=;
 b=pr1EkVZ3H9+wYSkVv3kOA9TsEFvSnU1XPINq64VZKpPak+5XYIcumMtjql32FVesXqcxH4CqRAK+V4CiB7UGaGmyz5cjgm38bgFssxqHPFCHnwNRsQ71M7CgsEfQ4l936t2hUL0qo0GsANDDYoLEsSTU3FkR5iAk3rrfG6XZGQSOzzZljf7zGNKyvVSvDxmCzTKpovlXs/aLZ7MeT3qjesUTo902u1Ehf8A/Wj7Zo9lmIAk+nswPkXlTEy1rT2DIz07mHpypviuuozQ/r/myVf+ok5yGYiGQODBzqDu79LdVbU06UdJGH2AQn5+uYApYbdBhcM+5H1lbkEgBY+qRfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8)
 by PR3PR10MB4013.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:a1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 13:22:28 +0000
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bdf0:fdeb:f955:bc79]) by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bdf0:fdeb:f955:bc79%3]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 13:22:28 +0000
Date: Thu, 5 Jan 2023 14:22:24 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Felix Moessbauer <felix.moessbauer@siemens.com>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com,
 alexandre.belloni@bootlin.com, richard.purdie@linuxfoundation.org,
 tobiasschmidl@siemens.com, luca.ceresoli@bootlin.com
Subject: Re: [OE-core][PATCH 0/2] wic/plugins/images/direct: replace fstab
 entries
Message-ID: <20230105142224.7743db91@md1za8fc.ad001.siemens.net>
In-Reply-To: <20230105125223.398216-1-felix.moessbauer@siemens.com>
References: <20230105125223.398216-1-felix.moessbauer@siemens.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.35; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::18) To PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:269::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5780:EE_|PR3PR10MB4013:EE_
X-MS-Office365-Filtering-Correlation-Id: bf8b8703-73cd-4ed7-b389-08daef1fe416
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xbMmZ3kXI8qfVYIAMxJpdRjrjS6LcFoXE4BE9vY9RkPx+h/ywjQ785cm6UnJVyUBQdW5fJ5onlia/8P9cU17mLnBkOEaW6LeAUV+n6L0wAeQHr1Uh9AgzTCycIYSG/L/ua38L+PtgSAh8jk3hc7FGPs+ZIyU3SbjXLkJcaW++2h6uYRICh/up8mFEmTJImePFJ4z23WOyKdBBmo2guciVIsH8w9Vdt1CeAEXSu/f+9XIuxb9+BPwX5D7aGnXc+ZelwiyBsvZOyqvPQZw5oyeMylrmvpif08r4E+8aM4m/vMUaDfKgWWvXJCJmCuidp00qghEMCt3/hgQ5Q2Ym5JR6t5YJKZX7bQSBTtKtBHIzLCD8128bCLKa+7Zxn3QmqmQQW+1dq5VYcUM+8tdKmaJSix9AumOrS6UPKjOzRwUPg1OLn2R1+mrj4oiBhQNZKKgjbfcLkAAarqBxliOQkwr9T4jXs0DYnUJIiG5WRnO5plzCDlq1y25Egj5pFpHs8FPgJbIfA+tsnonXEC1gGjJR0L6XdVEVO/IgGt45BmHTIbH4u79/LirIOIuEhpyFk4ZdVuSCqFStuN1WzNSJK109aoeMH9gdSwkc1vGNy8qgp5X7MNzxHOs1LfBURMfI6yHvM3ALkXHpIl3wbSdfBczQA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199015)(83380400001)(6862004)(86362001)(66476007)(66556008)(1076003)(8676002)(82960400001)(38100700002)(8936002)(44832011)(4326008)(5660300002)(2906002)(6666004)(316002)(66946007)(6636002)(6506007)(186003)(6512007)(41300700001)(9686003)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5gjbX3aaievVXSGOJalu8mzFTxEl0aUWMR1Se/LuJ3Z2oBzluyZjFEjUe/gP?=
 =?us-ascii?Q?f5w7ZrzeNuFEnFb2YuJiFcPoJhKWH4+fvzG1x3QVzKstjorgYoJmx+4gD/NE?=
 =?us-ascii?Q?y3Z4OzxcXj3e2iqJbOJd93FvFP/BnSIavCeqpB3Z4qCx3DM1IfguM4A5fTtt?=
 =?us-ascii?Q?W3N6U20TkaIV97FVtSIES6YsSuaihHQyw5J40cCKyUXtmSiyZnYgUblRArrd?=
 =?us-ascii?Q?wEjZ2TyfEjEb61gnnTxcd7XU3jLMmp7y5o5/0DAOC8niDwdhAtIeXgThL3nx?=
 =?us-ascii?Q?C4qxLkjnrigXL3R/468g+xyJyym5BsNzkFEow+fM3W+cc/qARpG9J0MgR4ue?=
 =?us-ascii?Q?1OJsDePxjdUtt0gSzN8wtdh73xRAqvSSSAJ0EG72oIw5cnGCiT0+9HAAvsbS?=
 =?us-ascii?Q?CG+hriHBgXo0z3xnByYe1Fjw6r8ocG5MzysHE/UqiiQ/xggE1j5McKVymhft?=
 =?us-ascii?Q?wJLn0tQlZab81Bxpd66APRoqBIoEbmjA0rR5m600ADDSECH2phMnzbSOpHiP?=
 =?us-ascii?Q?CC0CQABvrT96QOhGxKQHN66WZNpkxtSynGpv/RLNnPcTrRIUXTKfNEoteYHG?=
 =?us-ascii?Q?jb9V6DhT3M+WYNkc3nx3UzrRKovPPeakdYiJ8rg1NM8/s6sPnnFHCOjNTUuA?=
 =?us-ascii?Q?murZaNuJn33LKhDhgqhc5V2Fm+4HRycNwTjbCsqzhHOpwxGcQncjFuS6xMtQ?=
 =?us-ascii?Q?7IxHD9aF1ta1JdYlSf79AjPJRXhO4yf/8hq1JOtv1hOO2CKqANHHPv8GJQaR?=
 =?us-ascii?Q?fwWA/DIgIP2Q3gpFYOaY4ygGaR151POxdE3Ub+WAIiy9Mw7Oy8sTxMWiZcxq?=
 =?us-ascii?Q?Cli3zB1GKT8byec9Jr50D34PQ/1gVcjaI61fLunm+HaAD1F9VOKHAREa2b15?=
 =?us-ascii?Q?kgqBBdfqumhOLitRrFCVmcUKdzSJ3eg5b4C8Tvct86FpFPuGjv5vYcTgzY2y?=
 =?us-ascii?Q?vqO07zyeGrP67JR6oqUvh24sRoTfWv3ZXjjhE7H560FgieLhmcPbryzh7N/c?=
 =?us-ascii?Q?UxuPd+nkiiJLcGyfRkCDyQ63wVrvW81oGsdCl68e06P1FtrTBMy8aGHpc+C0?=
 =?us-ascii?Q?Sh3mIvY66+n56zyAVl7YLttxe/lPXOGZpnmfIBFhEuAyMH9bIqnywA33nTUE?=
 =?us-ascii?Q?pzk54FyUfOQoBaGp/jD5qmCzC6n/LhpznJNu1Z66nTsKLcR7E80UyHpBJlTi?=
 =?us-ascii?Q?Onzd0t/WdFvNDYGpMDa0y//HWM+2ZnrFC8GEg+OWwKcSwCgrbqW3tcKe93hU?=
 =?us-ascii?Q?uWyHcE5BpCHYu+BzgNft0ynlzJaCp1nj/wCc7I/huJ1YlM2eV1P1vEjIbTS7?=
 =?us-ascii?Q?jiAE0phkusoYi7q7DC0zxNSO/sbVw+dCiN5dHhEbPanFrzglP9h5RUUqxlQd?=
 =?us-ascii?Q?krbC9n42jme0toLku4R2PGIkmHznADeFErPqCO0RCecMqbcgome6k36OvnFf?=
 =?us-ascii?Q?cUPK2pq1wExb/iHlXb97ZsQp2p2izmV6IFdvnwqlgUpsDCihxOFpTf8Skyp8?=
 =?us-ascii?Q?42nxpuMjFYQwx+ivDMBKbkrdDOsik5D8iEJrgUTnYmq0qq8/9Hev8fF4MI7l?=
 =?us-ascii?Q?YPdFW16KFgf2YKNhRaQHOos8uRM8Rg+sDzqE5OeYvGJ2gPAk4dvQ2H/iu7lK?=
 =?us-ascii?Q?T4SD+l7pCQ5Q5YvfmdGvebWxhQpObK06dLx5KIQ8OzrWExhqb71/XRG/yhOQ?=
 =?us-ascii?Q?reKZ2g=3D=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf8b8703-73cd-4ed7-b389-08daef1fe416
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 13:22:27.8094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1RXiPMwn72aFNgsITmjWbsT1TC3WLyTEEbMH7OPYDTWOPzPHyNP7d851mA494CF48nTlkY9JIkNQeaf7y/HcVkfhj0PRKe/Ri9ffz7m01GY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 13:22:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175524

Am Thu,  5 Jan 2023 12:52:21 +0000
schrieb Felix Moessbauer <felix.moessbauer@siemens.com>:

> For comparison, here the fstab files for the ext4 and the wic version
> of the core-image-minimal (see below).

In fact one probably really wants no fstab / line at all, unless it is
ever somehow explicitly asked for.
The bootloader and kernel need to know that, in the rootfs it only
makes some sense if you have "special needs". Having it in the rootfs
just means that your rootfs is kind of device specific ... say you want
to use the same rootfs for nfs and nvme, or same content but in ext4 vs
btrfs

I think the best way would be to drop / from the template first. Later
allow wic to edit and add it like proposed here. But only when that is
explicit ... --root-fstab-update

Or in the end people can decide what to do about their own template,
but i suggest making this explicit for this special mountpoint
with something like --root-fstab-update

Henning

> Putting all persons in CC who have been involved in the first try and
> in the revert.
> 
> Best regards,
> Felix Moessbauer
> Siemens AG
> 
> .ext4
> ```
> # stock fstab - you probably want to override this with a machine
> specific one
> 
> /dev/root            /                    auto       defaults
>      1  1 proc                 /proc                proc
> defaults              0  0 devpts               /dev/pts
> devpts     mode=0620,ptmxmode=0666,gid=5      0  0 tmpfs
>   /run                 tmpfs      mode=0755,nodev,nosuid,strictatime
> 0  0 tmpfs                /var/volatile        tmpfs      defaults
>           0  0
> 
> # uncomment this if your device has a SD/MMC/Transflash slot
> #/dev/mmcblk0p1       /media/card          auto
> defaults,sync,noauto  0  0 ```
> 
> .wic
> ```
> # stock fstab - you probably want to override this with a machine
> specific one
> 
> proc                 /proc                proc       defaults
>      0  0 devpts               /dev/pts             devpts
> mode=0620,ptmxmode=0666,gid=5      0  0 tmpfs                /run
>             tmpfs      mode=0755,nodev,nosuid,strictatime 0  0 tmpfs
>               /var/volatile        tmpfs      defaults              0
>  0
> 
> # uncomment this if your device has a SD/MMC/Transflash slot
> #/dev/mmcblk0p1       /media/card          auto
> defaults,sync,noauto  0  0
> 
> /dev/sda1       /boot   vfat    defaults        0       0
> UUID=c53e2046-48db-4533-8083-b997d9976fbf       /       ext4
> defaults        0       0 ```
> 
> 
> Felix Moessbauer (2):
>   wic/plugins/images/direct: replace fstab entries
>   Revert "Revert "wic/plugins/images/direct: Allow changes in fstab on
>     rootfs""
> 
>  scripts/lib/wic/plugins/imager/direct.py | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 


