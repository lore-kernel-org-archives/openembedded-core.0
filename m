Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6213DD715E4
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 18:21:07 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24150.1769278864278061149
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Jan 2026 10:21:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=fcXdmz7k;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.60, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uuOiU73Y7b6yr1UV+hOZ8+Uvw6qW3fu9w9bGAjNmDTTSHlMN9oFk63W7EfZTJn2uP87RbgFuxMBIezerPwXzvNgQNphUZ3FLz+vwq3G6gxdP6kpmK93M9sNKD8qqLf5S2GHeUnHeVpWxOsklKGp6GbKdinHb/iqNK1fIYHzqOYepvMTCfcdKvk8yeYBShGuV2fQMH0qmu+8AfoMjVjp3FiI4PcwSY/0Q53NJB9FR3w0JnOcqXtHY6mdYWMGf32W3NoWYbMEZ6cMJE0gPZ42Ia3m77eBu2QEzspWY4wt+5MOGA+vA/+0sXhCsphF1GzpV8wEa+uLXBfkB9QjUMPs2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKOwAtsKfjejrMVVFqAdaxpDmrhnvRJsCUCj+xcxojU=;
 b=n0PngZT4OKFijlQ2rE8GUewstWyeGDx9d0PkTCwWVaGi6GRx+8q2y31fdkCzIaDlt17KlK0faPih+2U5cqqhrIU/qmWpXtpTzRKge9onjtXut0sssSOA053cVqo+QkmRYbUjJKjlYq05qS0l7JaFO1KRTum1IBZvNKr5jAyRRDD9tUVXxCFbzyDn0SDJ4s+0zar66NX+20sSyjTPKdw17/xAIexUXmQsT48SR3avUBkpkEbNzB4/G0zgF9fGzns0pO33SzS2XA+xtxgn81Hc8oZN9g91B9AN9knviT+uir/H6aDUUQ/UQHOjKOn5uecETxLVc2QRcOfuWfhbuFuBXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKOwAtsKfjejrMVVFqAdaxpDmrhnvRJsCUCj+xcxojU=;
 b=fcXdmz7kbr00i+kUK5lAKy/NgBpJR4fwA8gBvoznBTAzPJy5r9NZdcotJNydwnvltfiue0XmtF/f4qPyBwM9Sgve9bHTiOFuRRc1WtLavtXWg7CRJtyB5Q2bLmpixsIzeSyKbKWyLwQZDIK2534RnIlJKhL754qBcVJV3xMM44E=
Received: from BYAPR02CA0050.namprd02.prod.outlook.com (2603:10b6:a03:54::27)
 by IA3PR10MB7995.namprd10.prod.outlook.com (2603:10b6:208:50d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Sat, 24 Jan
 2026 18:21:00 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::73) by BYAPR02CA0050.outlook.office365.com
 (2603:10b6:a03:54::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.14 via Frontend Transport; Sat,
 24 Jan 2026 18:21:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Sat, 24 Jan 2026 18:21:00 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 24 Jan
 2026 12:20:59 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 24 Jan
 2026 12:20:59 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 24 Jan 2026 12:20:59 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60OIKxQ1059797;
	Sat, 24 Jan 2026 12:20:59 -0600
Message-ID: <3b59555b-0edb-4c2c-b203-e1172d0482b4@ti.com>
Date: Sat, 24 Jan 2026 12:20:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] lttng-modules: Fix CONFIG_TRACEPOINTS patch
To: <bruce.ashfield@gmail.com>, <reatmon@ti.com>
CC: <openembedded-core@lists.openembedded.org>
References: <20260123230820.289540-1-reatmon@ti.com>
 <CADkTA4OA-Vx9tPqkuyK4tLsxv2BXB8r_1+jKxJ6x5vB-5xC-Dg@mail.gmail.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CADkTA4OA-Vx9tPqkuyK4tLsxv2BXB8r_1+jKxJ6x5vB-5xC-Dg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|IA3PR10MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: bb76381e-b8ea-4416-815d-08de5b75539c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|4022899009|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LhakpvGLUcqgX0cszQt5FTjXFF25Emaya7bMklWRBnfXt5NCK3rttDmBsgua?=
 =?us-ascii?Q?r4WOiAwuNuxVPzHkSybjLd0haW+6qsgX3ZEBWwHWBZ1IKDZK8ZwBz6HHK55+?=
 =?us-ascii?Q?YZimZWWn0KYVE7LvVhDTNF9VE6VvhWaGWo0ZtJMFCYypOJOUkXhnvk5/MlGj?=
 =?us-ascii?Q?k5Gpp7DpovebIKnduGAE5/ZSSSp44YvCIYxOwnivYg9L6Fe3aEQSZ7lLCGCO?=
 =?us-ascii?Q?csDI8dwgIS4Eismzi+c4CNmwG/AKSyvO5X9fogC5Wp9zMnPj2BEUvEL7WppY?=
 =?us-ascii?Q?IEzpubTyg9u+GaL+6RlJIDwnyfzGakmNMqFvmyOVPK9nWkBbLNtKZiGqFajo?=
 =?us-ascii?Q?kY1kshXZIMLzvA7faX29Jz65gUzVTmAL6atRuMLSq0mFb+wvkfZ5Lslxy/p/?=
 =?us-ascii?Q?tK+zndaaqmv/upjN9es/hL+NeA1UQI0IiQmfLWaKN57CRI7u31vC9vWsCS5l?=
 =?us-ascii?Q?V/xcHTnJBS2OOL2M+040BmAMY7r+lwR9IE12DNnd4aiu4JyvBHy53mP2vOSN?=
 =?us-ascii?Q?g2bM5gjDFtbaM9LQcYb6VCJ8GeV5S+S5hwvyV5dV3TQ1HgsFl7QMtGEcmsxM?=
 =?us-ascii?Q?6SAVCJbgLXgAWsp+j9LIbSGu62Y/oYhWFLd88UnqTRMGBce8Rk5sfaM+1WZ+?=
 =?us-ascii?Q?idoGIMigXe1l1haOL4yJgH7zmU5DtmwS5mwS4qZaD2sj/sFfx64H814Od+/a?=
 =?us-ascii?Q?nvooc+AdAW50hbiGPZ8Fnz5a/ugNFNGkcVfUr44C5mHBmScmI+mYS1RZAju+?=
 =?us-ascii?Q?dFu0k/nIL9WzmL3sz/HZRlt2jpGLVCtLmaLfXmpN/79HDlhlmBEftNSmGE/G?=
 =?us-ascii?Q?z5TEsjiqsMriShAPLCKOGELafUnPyUBhXm/bQP0x5Eb5mt+fzSh1k3ogXMZL?=
 =?us-ascii?Q?6yi/DAtVlbabEeW8bARqdPkWTmwJ4Yn/ep5ajiVlhOncXmdc2W7b6nbKvZ7m?=
 =?us-ascii?Q?1eXW+W8Yvc/0Y1t/HQXnoAJ6bJS25ABNVttMtbGhx4srRN1Px9NyYMa7RSFH?=
 =?us-ascii?Q?D73ygqbEH39XAk1Bm8BWT2QmAVgf9lNb/voKDVXBBPskAfsNRxd3i/kQ5Jrk?=
 =?us-ascii?Q?XAPVtkoXsb+Gpxt4wC2oOUegTaIxg/KKD3QyBQb3TQdMkiVzmjQQp1it5GFr?=
 =?us-ascii?Q?AnPGl4Iae9oiLZTjZgjppCDSgLTik61KwJRaAb+k9UxTeXPilWR3AvQwTqot?=
 =?us-ascii?Q?SHGrNfhVh5gdVfSk2ZgmSCUU7JaV0zxtsWb9CsWJOlOAdXSBYDAouW1NI+YG?=
 =?us-ascii?Q?LCKgiE2MCFcwLtHWkgpEGAGHOVs/MYlmSAlhB/RknhBOxi1ENSS1576krRE6?=
 =?us-ascii?Q?+fXKLojLp16om+fCJEKKsJYyEjlC3Er0hwpyrZDkPnkeJseNyvijK8L+6H5q?=
 =?us-ascii?Q?HNEogu0rzmvM2lHexlGY03z1jmNDcdkBT2hP6xGXeE3FpYfHhhiQAy4bVQkf?=
 =?us-ascii?Q?+px3YWNIB+qtoJLrWSyAXY3Of8fIFdPb4qQTgfaECL+XWwzMgq5dFA4V5vvD?=
 =?us-ascii?Q?i3Pw7sW1mIYmX2jOLO9we3ZuRli6ImMBm1BZBs1XAydGrk05szpzcTY9vgMe?=
 =?us-ascii?Q?hnA1UIEkd+YuyMZnjo+wjK9V1xsknRn5Gof72Yt3TY1BwSDKMgMW65jri7S2?=
 =?us-ascii?Q?Kw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(4022899009)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 18:21:00.3964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb76381e-b8ea-4416-815d-08de5b75539c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7995
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Jan 2026 18:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229920

On 1/23/26 5:55 PM, Bruce Ashfield via lists.openembedded.org wrote:
>=20
>=20
> On Fri, Jan 23, 2026 at 6:08=E2=80=AFPM Ryan Eatmon via lists.openembedde=
d.org <http://lists.openembedded.org> <reatmon=3Dti.com@lists.openembedded.=
org <mailto:ti.com@lists.openembedded.org>> wrote:
>=20
>     The check for CONFIG_TRACEPOINTS is guarded by a check for
>     CONFIG_LOCALVERSION.=C2=A0 But what happens if your .config has
>     CONFIG_LOCALVERSION=3D"" ?=C2=A0 Then the check never runs and you tr=
y and
>     build the module even though CONFIG_TRACEPOINTS is missing.
>=20
>     Update the guard to check for either CONFIG_LOCALVERSION or
>     CONFIG_LOCALVERSION_AUTO.
>=20
>     Signed-off-by: Ryan Eatmon <reatmon@ti.com <mailto:reatmon@ti.com>>
>     ---
>      =C2=A0...-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch | 7=
 ++++---
>      =C2=A01 file changed, 4 insertions(+), 3 deletions(-)
>=20
>     diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-=
change-missing-CONFIG_TRACEPOINTS-to-warn.patch b/meta/recipes-kernel/lttng=
/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.pa=
tch
>     index 1854d9a944..a47b5b9789 100644
>     --- a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-=
missing-CONFIG_TRACEPOINTS-to-warn.patch
>     +++ b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-=
missing-CONFIG_TRACEPOINTS-to-warn.patch
>     @@ -16,8 +16,8 @@ Upstream-Status: Inappropriate [embedded specific]
>=20
>      =C2=A0Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com <mailt=
o:bruce.ashfield@gmail.com>>
>      =C2=A0---
>     - src/Kbuild | 7 ++++++-
>     - 1 file changed, 6 insertions(+), 1 deletion(-)
>     + src/Kbuild | 9 +++++++--
>     + 1 file changed, 7 insertions(+), 2 deletions(-)
>=20
>      =C2=A0Index: lttng-modules-2.14.0/src/Kbuild
>      =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     @@ -25,7 +25,8 @@ Index: lttng-modules-2.14.0/src/Kbuild
>      =C2=A0+++ lttng-modules-2.14.0/src/Kbuild
>      =C2=A0@@ -3,10 +3,13 @@
>=20
>     - ifdef CONFIG_LOCALVERSION=C2=A0 =C2=A0 =C2=A0# Check if dot-config =
is included.
>     +-ifdef CONFIG_LOCALVERSION=C2=A0 =C2=A0 =C2=A0# Check if dot-config =
is included.
>     ++ifneq ($(CONFIG_LOCALVERSION)$(CONFIG_LOCALVERSION_AUTO),)=C2=A0 =
=C2=A0 # Check if dot-config is included.
>      =C2=A0 =C2=A0 ifeq ($(CONFIG_TRACEPOINTS),)
>      =C2=A0-=C2=A0 =C2=A0 $(error The option CONFIG_TRACEPOINTS needs to =
be enabled in your kernel configuration)
>      =C2=A0+=C2=A0 =C2=A0 $(warning The option CONFIG_TRACEPOINTS needs t=
o be enabled in your kernel configuration)
>=20
>=20
> Why is this changing to a warning ?
>=20

It isn't, this is a patch for a patch, these diff change lines are already =
part of
the patch from before.

https://git.openembedded.org/openembedded-core/commit/?id=3D6215ffec6a3d506=
9cc74ae9853167c3c6395b1db

Andrew

> You have no mention of it in the changelog. Although the check wasn't
> working, the intention of making this an error is still the same.
>=20
> Bruce
>=20
>     --=20
>     2.43.0
>=20
>=20
>=20
>=20
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229917): https://lists.openembedded.org/g/openembedde=
d-core/message/229917
> Mute This Topic: https://lists.openembedded.org/mt/117427953/3619733
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [af=
d@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


