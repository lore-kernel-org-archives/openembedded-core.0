Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1414D15DA1
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 14:37:38 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.0])
 by mx.groups.io with SMTP id smtpd.web10.48051.1729521453502954427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 07:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=OxuIPyqv;
 spf=pass (domain: axis.com, ip: 52.101.70.0, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngIL6UxkfVelLDFQkE7KStjX0e+Qor9JVGai19kmyVVFa4W11AOTliZcFLI/nWdxaypUkmfxMnrD1CAaSBpA3zIib08DmeIwq9RPt/Tie//wqTyZdcaTayWx2I5ImWffMtKZ0uGKi8/flnThWQRNnQ9Yy7DsIDE5szKr2C93AhEo3MPAqKPnMWNeH1LslxAEg3Cff11sYST/quywJ2iu5oWgfhEuCdXWBVfI0ST9AJFSxcMJzWFkMCD2AvzJiDUlDL/eAo8Vdodzki/hUi3BlbE1mXNDczxBu4MYVBPWi7/Wb7G9rZd6fLT/J4lQnfU+I3lXSyLFKIodOwryNgARrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhSCWe0/wzaZYCgCnDdYzmxEaD549ba9WAe5wbRbIik=;
 b=qvW235gejJiasMNR7TIYgrWWz6dnm23FOFoMW2V/T1xMbhB4EHW4/U0a7kmRLOaH59vuHgo0BlDV/xHI+ASv9q+KJxbE8DoeLmA9RBqZL8u9yCIH2iZin+EKOUmXf7iQZ3U0s6Ejv6OXDhoj6zclnWYqJN5+VzuMpjh5xREQzwPkWjPJNOLbYIgTXuyQv+ffbL1YiUkJcF0cSAZC29vR+YyqGzOQHXtVWTPAshC0uqARmSKWx+Tqmr0ASzwXJdWVNbXEUf+9YMNTgZLO8fZ3rmRJmc5oG15RVXscmZfBZos/dQaY67c8Je1n4jQes6amlcFhwDUX5snuQKWs6xBEeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhSCWe0/wzaZYCgCnDdYzmxEaD549ba9WAe5wbRbIik=;
 b=OxuIPyqvDos32W12ozpxiIxbwysnETgqHXnvvRsazixWX5GlavY18kH3+xgS5JmHl8a0COm6Y0MfXSD6EukqIm7TPjLYpsEkEU5iNJ9SVvVKbqPwJhjwDE7EN7ZofZFwh6jVj9qr+xMmg111KbC6pm185sTfGPkOigxQjF9pgpE=
Received: from DU7PR01CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::17) by PAVPR02MB9475.eurprd02.prod.outlook.com
 (2603:10a6:102:304::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 14:37:25 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::73) by DU7PR01CA0003.outlook.office365.com
 (2603:10a6:10:50f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29 via Frontend
 Transport; Mon, 21 Oct 2024 14:37:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 14:37:24 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 16:37:24 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 21 Oct 2024 16:37:24 +0200
Received: from pc58073-2410 (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 56783BF;
	Mon, 21 Oct 2024 16:37:24 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Ola x Nilsson <olani@axis.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: Fix missing randomness in
 __gen_tempname
In-Reply-To: <20241021100352.56570-1-olani@axis.com> (Ola x. Nilsson's message
	of "Mon, 21 Oct 2024 12:03:52 +0200")
References: <20241021100352.56570-1-olani@axis.com>
User-Agent: mu4e 1.12.1; emacs 31.0.50
Date: Mon, 21 Oct 2024 16:37:24 +0200
Message-ID: <jwqwmi1ldy3.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0C:EE_|PAVPR02MB9475:EE_
X-MS-Office365-Filtering-Correlation-Id: e0f016e8-d9fe-4472-e44a-08dcf1dde147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WdLe2Q8jAcUZMLAW47bngArJ9cXULfQ6dEa8yiLl6aMEg81A+1xTMz/oWI+r?=
 =?us-ascii?Q?+tOwLfJXGlYPKFxcbEnPYDsHdynVijnMl/GO5IuFa1G/gcGHKD0PT9rXZUuX?=
 =?us-ascii?Q?t9xHf2UJYqJ/5uocZbzm4PMcrQgKZenqaXGT+TQI3r6Q5sO8QhUaoOrhTS9n?=
 =?us-ascii?Q?mJ9Ta0uJhm6fdwSER92oY4fj5sjw09jUyPGMZUeDaRDr6GaOT9UXp/jPthLh?=
 =?us-ascii?Q?0cUSR1ZhwmkjbF1W5yd4GgHY69Q6Yv3Atm0QDT026WLicVm2rll8FHdW2AKJ?=
 =?us-ascii?Q?5zyD3XMgO/XHfb07Rf7jTKGjXetZM89VosDrpMTPLFN49OvvNgtOvtiwliaV?=
 =?us-ascii?Q?aKiz8Ec6SWO7zPVFkszea48rKOHWIL8R72AVuyAxWOkOdS3OuDJaWw91uGT3?=
 =?us-ascii?Q?xh8Lju0D3z4SLJ9EPqQSr+kiFplK1WigmJYNcZL/2mbKyPUNWErKgW6RZYs4?=
 =?us-ascii?Q?kMMrqye/FrqOOJy0C0hh+4dBl8xV2vM1puD+Qw2Uxvc7G+32bVZ3dic6OFRz?=
 =?us-ascii?Q?vxMc5C3X+p3i0aSQXOivkmj3BgHyj1+eVtXJw7Y8QWzftXPXF1R/sOj7XWx6?=
 =?us-ascii?Q?j1ggy101AI1k3ceAdsXYn7BdeJH3SrWYchnEzlo+tMeiUO2IGNGbXij/wGqH?=
 =?us-ascii?Q?ShDgvZLGA/0G0/Z/duBLXutfKmSF3lmnb2dsp/0aZrWT7i50VGbaWo3pKxmk?=
 =?us-ascii?Q?+smde4sLr6A5zWOQ+qXA3s9aGWtJdVK6yokR2t/EbibAwvvLZr1osy/YCQH4?=
 =?us-ascii?Q?R1W8Cv6r/1GI6i+qkwtA41jAMrD9NW1amw/Euwqy/0fsVJFLcKcQoE+jMKGk?=
 =?us-ascii?Q?kQgg4wTH1IfdDz6Gl31BZC5jI2aNw6L4bCNhAznvgcAGCC8G2s1cgVvdZ4hV?=
 =?us-ascii?Q?7klTUEIcKv/K21qGcxBj3SlIuymeoS9eU8gaPjs58CjnVj9kH1CHo75hQG+c?=
 =?us-ascii?Q?HbkscVRnzhe59qlD9idK/zvslbr+RNoWHxy8bXITGhdTf5AHrNqdN8m50gjg?=
 =?us-ascii?Q?zJHk8MtpVQ7TLP3BI1D6wQJ9GCzDyV1Nr0ggCM84WpXkFDeC55YSLSf9QyWc?=
 =?us-ascii?Q?T7dj6ew79vvXrO0luB/fnUsDOaq9hcOl1tcfZ6QzOFcB78QRnsUVA/dE3q+B?=
 =?us-ascii?Q?DyHukewiG1EW24O4rlx1onWSYyFKEpNcZoMHbKGSh6UyXLaLpE0DwYNPPBVh?=
 =?us-ascii?Q?1wy8W6yc1hxBDdoY6P4Hb0ot0EtHGB8tBV6uZHqDncBjal07AZCiqTEOlgYw?=
 =?us-ascii?Q?eRurtEkTAhY5VQy/MjVehRt9Fmx6t+h4WP+P8lR2zr982qmjnAAolSKA7imK?=
 =?us-ascii?Q?IAi2uJC1+N8OmRx2f8jefe1a1P+Qc6W0N+BQRrKydgRQPS/iEonJdbd9LaAK?=
 =?us-ascii?Q?bpdCH5Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 14:37:24.8794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f016e8-d9fe-4472-e44a-08dcf1dde147
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9475
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 14:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206122


Please ignore this patch.  I was supposed to send it for styhead but got
mixed up.

/Ola


On Mon, Oct 21 2024, Ola x Nilsson wrote:

> From: Ola x Nilsson <olani@axis.com>
>
> Backport the fix for glibc bug 32214.
>
> The missing randomness in early boot may cause some systemd services
> to fail when they occasionally try to create tempdirs like
> /run/systemd/namespace-aaaaaa at the same time.
> The error messages can contain things like
> "Failed to set up mount namespacing".
>
> Signed-off-by: Ola x Nilsson <olani@axis.com>
> ---
>  ...ndomness-in-__gen_tempname-bug-32214.patch | 29 +++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.39.bb         |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0024-Fix-missing-randomness-in-__gen_tempname-bug-32214.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0024-Fix-missing-randomness-in-__gen_tempname-bug-32214.patch b/meta/recipes-core/glibc/glibc/0024-Fix-missing-randomness-in-__gen_tempname-bug-32214.patch
> new file mode 100644
> index 0000000000..c9f3e32f58
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0024-Fix-missing-randomness-in-__gen_tempname-bug-32214.patch
> @@ -0,0 +1,29 @@
> +From 9d30d58c32fe9d5f8ec6cda79fb11159e6789bcf Mon Sep 17 00:00:00 2001
> +From: Andreas Schwab <schwab@suse.de>
> +Date: Wed, 25 Sep 2024 11:49:30 +0200
> +Subject: [PATCH] Fix missing randomness in __gen_tempname (bug 32214)
> +
> +Make sure to update the random value also if getrandom fails.
> +
> +Fixes: 686d542025 ("posix: Sync tempname with gnulib")
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5f62cf88c4530c11904482775b7582bd7f6d80d2]
> +
> +Signed-off-by: Ola x Nilsson <olani@axis.com>
> +---
> + sysdeps/posix/tempname.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/sysdeps/posix/tempname.c b/sysdeps/posix/tempname.c
> +index c00fe0c181..fc30958a0c 100644
> +--- a/sysdeps/posix/tempname.c
> ++++ b/sysdeps/posix/tempname.c
> +@@ -117,6 +117,8 @@ random_bits (random_value *r, random_value s)
> +      succeed.  */
> + #if !_LIBC
> +   *r = mix_random_values (v, clock ());
> ++#else
> ++  *r = v;
> + #endif
> +   return false;
> + }
> diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
> index 2484ae1cd9..2db18251e3 100644
> --- a/meta/recipes-core/glibc/glibc_2.39.bb
> +++ b/meta/recipes-core/glibc/glibc_2.39.bb
> @@ -53,6 +53,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
>             file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
>             file://0023-qemu-stale-process.patch \
> +           file://0024-Fix-missing-randomness-in-__gen_tempname-bug-32214.patch \
>  "
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build-${TARGET_SYS}"

