Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D923EEA853
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 01:37:08 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61596.1770946622768676613
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 17:37:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=opyh7wBM;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.59, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dlIwCcFlnJA06FtBgAVdVSh6Ua8/vMxvFIg0zKmGAXhDZrvqn4wB1iteAsS5Fgzabh7hHoHIAoe/xLKRgDpCi9kCG5/MGnAWQwZXE8MRKSmc1K230mWhS2BPA91DWbhM5TLNNrk401AoIP/SZrCVh9QF0iwtDpFTpR6zXzvWYH7lOfiLPv8kPmBcAixkIf2SpMOAAccyVMTODMfvE2xDrD8JNgzxpZEvThXDC14q5m5BJNFJYLGB1xXIpybiCP6TgEYgwairQ8YuLf/ILtpTyzOpgK0X+/TY8Re6bhKX2x2PsDOdFCwi1/ngwVLWhtcbVWhf/457hReN2BnEHuwbcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9r2hA6lvqXwU7l5nfhS21YdHAN2YoXpyS0u7u5hCg8=;
 b=i1GEHrjmf66z3pihrjMqQYYnhLHbxnRedD72Nz/VEscUhq8V9KazAWXwIO8nU+7rt7/pPaILW4VJkVcXOgHmRjwG/Yqm7akUpN/ABtXV2iNeJWic0C4J/XPMegomJS3D37hG3lvxfCqzezLeS+Ouo07LjtmhXE8hVbZxbpat+uMu4Y5vKeTyj/HkMDH/QMLF/g928hrqs8zhNVCWejy4VeustMlGepqvt0zyNLFxMSUaeNCiwlmkLKWilNFJBZRX6GwrAMh+dHLg5mANweou7qvqXEkmpHed11mHDsM+s7kzA88DNVrB9l3iVZaex65u08c++zeXpRADpwOBEf7JHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9r2hA6lvqXwU7l5nfhS21YdHAN2YoXpyS0u7u5hCg8=;
 b=opyh7wBMRxBjPQnwyra2uGCovabr6hA4YA7AYmd+cgyTR6t2o/fi6FmDZL5J3RwlUmKiGSBuujd6zGUPsXg1R+fkJh5cThAerqwGzVBkDPkrlcEoIGAfdYuIKu2yxYO8x3tBHdS/krMGveQLAX1unh/fs8r4FoHyHNG6+xNUeAw=
Received: from BY5PR16CA0024.namprd16.prod.outlook.com (2603:10b6:a03:1a0::37)
 by PH7PR10MB6532.namprd10.prod.outlook.com (2603:10b6:510:203::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 01:37:00 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::91) by BY5PR16CA0024.outlook.office365.com
 (2603:10b6:a03:1a0::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Fri,
 13 Feb 2026 01:37:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 01:36:59 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 19:36:59 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 19:36:59 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 19:36:59 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61D1axRe311722;
	Thu, 12 Feb 2026 19:36:59 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 Feb 2026 19:36:59 -0600
Message-ID: <DGDG6LFLTR7X.2TCK86RQ93ME@ti.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCH] reproducible: fix git SOURCE_DATE_EPOCH
 randomness
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>,
	<otavio@ossystems.com.br>, <kexin.hao@windriver.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <1893A7AF46371281.653184@lists.openembedded.org>
In-Reply-To: <1893A7AF46371281.653184@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|PH7PR10MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cbe3bcd-0ea8-48c4-fa4d-08de6aa061c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?elpKSHhjcGFIT3BKamtrTWdZdEgrUzZuOWZTcXhGdmtqc3BjdXJkQk5SVUFB?=
 =?utf-8?B?VEpwOEFjSVhQMVd5MlgyMndGdnVaMzY4cFk5ayt1dnRLVUhxak9EMzVwZVFO?=
 =?utf-8?B?SGNHU2gyVTRtVk4zYjF5M3V3d2JiZFRXVEVtckIwZVJ3RlRDMGs3ajFxTnY5?=
 =?utf-8?B?QkFYNjc0QUNWbjI5L0pxcDNNQ20vS1phSTMvdGxCSHBZTjZaLzZTaTlEaTlQ?=
 =?utf-8?B?Q2ZFMXhXUjk0UVVlck5qemM2UDBJTDZkMmdpQW1GOHN6elUvUDk5cVV1Z25j?=
 =?utf-8?B?RlZCYVdjaWN1ZmlCcWVUV0Y4dVFaaS9QWWNqS0Y5Q3UrZlBjUUxSaEQrQXIy?=
 =?utf-8?B?NjRnZ09kdU5zMXluUy9Nck5YblFUVlAzSzhaK2N4YlFRcnlMUndTaktLc1Bq?=
 =?utf-8?B?c1hhV2ZZclRCTzBrRGdvNlh0QW16cC8rSlZCQm1YOWVrNVVSeVU2UlY1eHky?=
 =?utf-8?B?V1pWL0ppSGh0QjQwaE4yZk1uNkVuTlhUbFZQZzVoNnRMcHNXaTA4UGlxZ0ND?=
 =?utf-8?B?ZFM1Z3ZKUmtHeVFWUjZkc0NBQmVvYURyN01vZ2hnc2VkbW4xRi9pcGFRTjBI?=
 =?utf-8?B?d3ZXVWNlZzl3VXFPQStIdm1iUDFoM081ZEJQa0RkRkZLSmtwcFFHcmdDQWtL?=
 =?utf-8?B?emNidytlVEVpZERlcTFOQitmT0VPOEQyZTh0c0hUVlVFTmlISGpkN1VLSjJT?=
 =?utf-8?B?NFV0dnNLSWZ0V2JvMmQvUHowaU5VQ2NLcnZ3Q2VLVnc5Q2FRMUd4SDFGK0tp?=
 =?utf-8?B?VEZ0U1NQQk11eXRtaHNXc0tpU1NJdXViMHk4U1pHVHd5NHNCYjFySEYrdnJF?=
 =?utf-8?B?ZGJ3VFFYRlQvNXE5WUlNbS9LcFhyaitaV2tnTDY4NDFWdTNHUXRPdGJwT0Jm?=
 =?utf-8?B?eERHQUVXeXB6b0Mwa25pQ3hua1ZlaEJLMnBwT0FDZ3BNeDZtUVhDQ0FhOTVS?=
 =?utf-8?B?Tmo3UEFuOTdTZkZaV0IxQmJLMTdrdlhtbmlONUw5WlJ6cFh4R1lEUDd1dktW?=
 =?utf-8?B?Yk8zeG1TdkVZM0MxQkhDK3NDM2lLSWFJeGhxUGovZ2k1MW85OExJTDdXY0pB?=
 =?utf-8?B?YmZGWEh4Z0ZSSVNpazRzN3RkTXBUNkJsUDBud2dGZW5zOUFSUXErdEUzMlFi?=
 =?utf-8?B?WDlRQ2pKYmRwTGVwRmJqdXFWVkE2Sk52NnJOY29kNUUyaFgyMTEzVUdBajEw?=
 =?utf-8?B?WGZsQmU0OURpdHBwQllneVFnalowV0dTUjBJblBKQ0hmOTFZNDIyZ2kwMWIv?=
 =?utf-8?B?NitQMjVqUWJNUm16SlNOaHFZaWoxMHF1UVJJNk9MTk5FcmtEQTdMUEFla25p?=
 =?utf-8?B?NW91SldmZ0xQbzZFS0dva0duaW5pamJSQjRhYmFxSmhWT0doVGtRbmFqaGhD?=
 =?utf-8?B?M01SSU9yZUluS3doVnA1S3BORmJIY1RDS3dHWlNCbnZpbyszdDkzUzV4OWY5?=
 =?utf-8?B?aXowZXBNOER5aGMzRUhBNHFLZ2RTYUdRMEtRbEJidzFHMmhUV2UrVVcrYm5r?=
 =?utf-8?B?QVl6cEl2ZEkxdjBEWG1oakV1SjJMSHdUTHlOVWZ3S0ZidGl2dFR4VXBkN2VX?=
 =?utf-8?B?ZGVxbGl2UmRXM1VWMTk0emZoWXAveHVDMmJmbUdCVS9Ibm1NVDB1OWFEL2t6?=
 =?utf-8?B?cEJTcWRzcCtMMC9EOGY1VXN6L1I5TkY2VTYxQWZiV1ptWTFvUWx1WndWNEx0?=
 =?utf-8?B?T1dweGFiNFFmS2F3S2JGTVFBSGpYL2w4VGhnZ2kyMDhVLzEwajFKcVYwRnF5?=
 =?utf-8?B?VUlzaTVTYWVacC9jbnpqeEloVmZtYTZRd3M0RCtxSmdyV1pXT3Y2WDNOdDIx?=
 =?utf-8?B?Zm5QZnprWWw3VXE5dHFCUUkya3JIMDA5eDc2Z0FqajVzdmFlOTU5K1o5QkRD?=
 =?utf-8?B?QzQ0OFo2TjZMU2g0MUQvMEJuSkU4K2t4RkVOc0NaSjB2Uk10WWZVekkwVEw2?=
 =?utf-8?B?Umc5K2dqR0o3Z1lkcnc0SmJPTjJMZldGbzdPUDBrdXhkVXdRUnlmb0hoN0Zp?=
 =?utf-8?B?SE5TQWhwV01hRGIrdlEzNHdzMWdtRWkzQVdUSC9GNjlwcGhqVXRqUjJPQWRQ?=
 =?utf-8?B?U3hKNGJYMFcrQ25OWXhzWTMyZUh6UzlHNTg3OXdBVE80Y3J6UzNZRWxNSnBR?=
 =?utf-8?B?SjdJZjQxUFdOTStVSnNuQ3BleTFzblNZb2JwMTZTT0ExaGNyd3VXZWNOc1NY?=
 =?utf-8?B?enJQdXlyaFFQdFZEVmhHY2M5WTVJU3gybW5SMEFQUHo0aVZuazRyUE8xNnAw?=
 =?utf-8?B?Z2lqQk95SU0xaEdtT1hmc0o4K2pRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	EeVndjESC67mYej6piux69qitH+p1rUlXBJXxXwMS8TSt6JflHsgD91wGcMxkims4XcxYXZt/hcxXgDZsTuPbWsLW51ahfDvu2g4AlWyucAWA9xm+Fo9O6+8UB+xywmD+pvBWDh003qR01WoyIYVnIMgekTDjJAQ5z3a3GJmvBYFfPyH2PSrcTy/sS5fgA10w8qYHtpT9kMTuXJYlupndY3VN2CDZxhxc89tBRtMP5avYQ1x35lnuJx5nGlqv4I8oJ1ba21v51cyumz9LQbOuFt+AbDl5PVgI0RLvjSFZBWNoz/tefqusf8VQs9sBd2vgHzMGYFprk5F3RdpIGLefJvs72NRly+c4OWYCtGdHEPv66qWmEtzTSFHharITFRpzH0x0HGIZYWtd4z2hWhM56oaQ05XfdHml20dpF6BoaWyDATm86SuyaZZoRoSp1Tb
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 01:36:59.9518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cbe3bcd-0ea8-48c4-fa4d-08de6aa061c4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6532
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 01:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231078

On Thu Feb 12, 2026 at 6:42 PM CST, Randolph Sapp via lists.openembedded.or=
g wrote:
> From: Randolph Sapp <rs@ti.com>
>
> Anything that defines multiple git sources should have the largest value
> taken when calculating the SOURCE_DATE_EPOCH for a package.
>
> The previous iteration actually introduced some degree of randomness, as
> it would stop on the first git repository reported by os.walk, which
> does not assure any specific ordering by default.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>
> To address issue reported here:
> https://lists.openembedded.org/g/openembedded-core/message/231076
>
>  meta/lib/oe/reproducible.py | 64 ++++++++++++++++---------------------
>  1 file changed, 28 insertions(+), 36 deletions(-)
>
> diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
> index 0270024a83..06ceda8d7f 100644
> --- a/meta/lib/oe/reproducible.py
> +++ b/meta/lib/oe/reproducible.py
> @@ -3,6 +3,7 @@
>  #
>  # SPDX-License-Identifier: GPL-2.0-only
>  #
> +import glob
>  import os
>  import subprocess
>  import bb
> @@ -74,52 +75,43 @@ def get_source_date_epoch_from_known_files(d, sourced=
ir):
>          bb.debug(1, "SOURCE_DATE_EPOCH taken from: %s" % newest_file)
>      return source_date_epoch
>
> -def find_git_folder(d, sourcedir):
> -    # First guess: UNPACKDIR/BB_GIT_DEFAULT_DESTSUFFIX
> -    # This is the default git fetcher unpack path
> +def find_git_folders(d, sourcedir):
>      unpackdir =3D d.getVar('UNPACKDIR')
> -    default_destsuffix =3D d.getVar('BB_GIT_DEFAULT_DESTSUFFIX')
> -    gitpath =3D os.path.join(unpackdir, default_destsuffix, ".git")
> -    if os.path.isdir(gitpath):
> -        return gitpath
> -
> -    # Second guess: ${S}
> -    gitpath =3D os.path.join(sourcedir, ".git")
> -    if os.path.isdir(gitpath):
> -        return gitpath
> -
> -    # Perhaps there was a subpath or destsuffix specified.
> -    # Go looking in the UNPACKDIR
> -    for root, dirs, files in os.walk(unpackdir, topdown=3DTrue):
> -        if '.git' in dirs:
> -            return os.path.join(root, ".git")
> +    git_folders =3D []
>
> -    for root, dirs, files in os.walk(sourcedir, topdown=3DTrue):
> -        if '.git' in dirs:
> -            return os.path.join(root, ".git")
> +    for mainpath in (sourcedir, unpackdir):
> +        gitpath_glob =3D os.path.join(mainpath, "**/.git/")
> +        for gitpath in glob.glob(gitpath_glob, recursive=3DTrue):
> +            git_folders.append(gitpath)

I honestly don't know if recursively searching the deploy directory is any =
worse
than instantiating a new fetcher and walking the SRC_URI and destsuffix val=
ues
directly. They both feel a little heavy-handed.

> -    bb.warn("Failed to find a git repository in UNPACKDIR: %s" % unpackd=
ir)
> -    return None
> +    if not git_folders:
> +        bb.warn("Failed to find any git repository in UNPACKDIR or S")
> +
> +    return git_folders
>
>  def get_source_date_epoch_from_git(d, sourcedir):
>      if not "git://" in d.getVar('SRC_URI') and not "gitsm://" in d.getVa=
r('SRC_URI'):
>          return None
>
> -    gitpath =3D find_git_folder(d, sourcedir)
> -    if not gitpath:
> -        return None
> +    # Get an epoch from all valid git repositoies
> +    sources_dates =3D []
> +    for gitpath in find_git_folders(d, sourcedir):
> +        # Check that the repository has a valid HEAD; it may not if subd=
ir is used
> +        # in SRC_URI
> +        p =3D subprocess.run(['git', '--git-dir', gitpath, 'rev-parse', =
'HEAD'], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT)
> +        if p.returncode !=3D 0:
> +            bb.debug(1, "%s does not have a valid HEAD: %s" % (gitpath, =
p.stdout.decode('utf-8')))
> +            continue
>
> -    # Check that the repository has a valid HEAD; it may not if subdir i=
s used
> -    # in SRC_URI
> -    p =3D subprocess.run(['git', '--git-dir', gitpath, 'rev-parse', 'HEA=
D'], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT)
> -    if p.returncode !=3D 0:
> -        bb.debug(1, "%s does not have a valid HEAD: %s" % (gitpath, p.st=
dout.decode('utf-8')))
> -        return None
> +        bb.debug(1, "git repository: %s" % gitpath)
> +        p =3D subprocess.run(['git', '-c', 'log.showSignature=3Dfalse', =
'--git-dir', gitpath, 'log', '-1', '--pretty=3D%ct'],
> +                           check=3DTrue, stdout=3Dsubprocess.PIPE)
> +        sources_dates.append(int(p.stdout.decode('utf-8')))
> +
> +    if sources_dates:
> +        return sorted(sources_dates, reverse=3DTrue)[0]
>
> -    bb.debug(1, "git repository: %s" % gitpath)
> -    p =3D subprocess.run(['git', '-c', 'log.showSignature=3Dfalse', '--g=
it-dir', gitpath, 'log', '-1', '--pretty=3D%ct'],
> -                       check=3DTrue, stdout=3Dsubprocess.PIPE)
> -    return int(p.stdout.decode('utf-8'))
> +    return None
>
>  def get_source_date_epoch_from_youngest_file(d, sourcedir):
>      if sourcedir =3D=3D d.getVar('UNPACKDIR'):
> --
> 2.52.0

