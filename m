Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8852BCA0EE8
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 19:05:54 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.59])
 by mx.groups.io with SMTP id smtpd.web11.28645.1755193171581537146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Aug 2025 10:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=tT2pKl3d;
 spf=pass (domain: ericsson.com, ip: 40.107.159.59, mailfrom: etxtrex@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JtmVkas/5312vnq9HCJlmOzEjP/QqTLumBckMQHi1noPilPkSkYzRWwNekRB7H1FLquSzuV9C454MRNQlsYScAdPQs/sITjwZVFqbZXYlCTL/N/Abk2k3n7g+OXGYDqH9+Rm+QOqqxEo/bSMPlrE7FVhbEJkuYkljhLeVU/Tr/RA6BYkyV+FDd1ARVd7ERhIq19Yy530ayEcYb6ovFBwkEIKQNkoM3XPa7wfPXvXDHuhcT+jOxSjDilNbIdv1bNoD0hMU8NtjwEAgc84D7ZOlgShANMpMOfzLOi/p/RJSjTr1k0BbGvXFLnjsU99LG6q3653mLTRbdaXhLSLOAMa8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDeZQPTTCRQOUM5570QQDz5TYJkK5GvDp/cj6G17TGY=;
 b=cMnbzUTwe33d4weGov1Oxrjx4GWz4VgMAeFfOz5DzjNe43eTp73XoGmrPSLjjcxwN8xsB5A61qcswv8dglCHDP62GGGEuiYuEAE0Yl+IbI1AphbmXMbyhk9yt0kVdiTzgiQeSIqzBUepczHGbGMHj+B7ReJsNF6r2kL8cwoa4o8Qvy7PkjEwt26Uhihn2Vx9iwFh/IQoFI1Ss7lo5Jl32IGv5sa5RTT0wmBxpxa4jwBC5hqJiI/GURIrRk0e2iq3mPFtvDR/6JSD/5Hn9ACAPNzWWQ+dokSzERBbXXq7HYPao5FuTBqg2hkxyVh3JJ5xItTkGhxBEF4EYsGV8AVr8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDeZQPTTCRQOUM5570QQDz5TYJkK5GvDp/cj6G17TGY=;
 b=tT2pKl3d6cnpK3x1f6uijKrMem2VcPZhvfPo6tyfbdALeXt3jKQs15qGY47vd+ThMqZDtcQLskVLQmVRsnQIISiCloMbg12t6g9tsWB5fBm2XPGI0LuX+ntMapAVWELejFw1VItKlJcUrnzvT9vm1mwJXf9QHMhZFHQa6RjiVWgSnDBJAilTaL3KBGh3bx9/H8ZrZUD/dNPksyyOAPQs9hFErM0158j7sNMf49yBSITfhSBJ0UHWCmvB8yiq8PiJC4NtR3zufs9IPij9mG7xMY8lkhL+TDcO+rju/sxYd4pQm5CYJ6YtYPWQZRy7KTolFGv26o+72rAHBU3dawNoJg==
Received: from DU2PR04CA0013.eurprd04.prod.outlook.com (2603:10a6:10:3b::18)
 by AM9PR07MB7171.eurprd07.prod.outlook.com (2603:10a6:20b:2c9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 17:24:05 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::71) by DU2PR04CA0013.outlook.office365.com
 (2603:10a6:10:3b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.17 via Frontend Transport; Thu,
 14 Aug 2025 17:24:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Thu, 14 Aug 2025 17:24:05 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 14 Aug 2025 19:24:04 +0200
Received: from seroiuts01755.sero.gic.ericsson.se (seroiuts01755.sero.gic.ericsson.se [10.63.162.68])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTPS id 831CE4020DD3;
	Thu, 14 Aug 2025 19:24:04 +0200 (CEST)
Received: by seroiuts01755.sero.gic.ericsson.se (Postfix, from userid 3150)
	id 683222C11DB; Thu, 14 Aug 2025 19:24:04 +0200 (CEST)
From: Tony Rex <tony.rex@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Tony Rex <tony.rex@ericsson.com>
Subject: [PATCH 1/1] base.bbclass: Fix the recipe parsing race issue
Date: Thu, 14 Aug 2025 19:23:09 +0200
Message-ID: <20250814172348.3882586-2-tony.rex@ericsson.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814172348.3882586-1-tony.rex@ericsson.com>
References: <20250814172348.3882586-1-tony.rex@ericsson.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B88:EE_|AM9PR07MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e15c5a0-1902-4ee3-0521-08dddb575e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GiQH2UfA3NyKhaSaCNUx3pu3n5f+P0mxR0CN/jcBIAV7xgDqiIOzd6qravFI?=
 =?us-ascii?Q?C/igq8uXd6A6k4+rm06nMdgPUfv/Bj+GbbPCXlnHJDYfHQQRpxGp6egLc2Rf?=
 =?us-ascii?Q?XQI3M4k5CwRdokeDZQyinx8gayKb+5sL3dS8wG8I0l/kaFUBWnzx59gZofAw?=
 =?us-ascii?Q?A8FAmjWwo73TK3YG7VXE25o3MLY5InC4NdJp87ueEoO21iQAg7kZXdUKU/n9?=
 =?us-ascii?Q?dfXQS+mH3NQcRloFjB9/ZBWKNJ9DwU/ISXEeFIZXxLzng0cm1a4pBTUggSID?=
 =?us-ascii?Q?SblnHoykv1dBDFKXrvL/zkiu94ale+fu0nNC8ixKNRzMx+qBtPLPUmhPGsOy?=
 =?us-ascii?Q?JKiW1w7SiXh6/xW/WkyfobQ0pZnC1/u7yLvutNHsUD4HE2LNA9rLL9KX+GM6?=
 =?us-ascii?Q?FjOf3S7aF+/zOyOnvOyZ2ceF5YlFJ1EhDPfNfmQCI0F7Qq3DehdBabyErju0?=
 =?us-ascii?Q?mw7Esd5b3Prg2MxCgkOv6mcEllt0PZD0yHvCiTshPbDYEnfVIA8UlMeax7LH?=
 =?us-ascii?Q?k5t5o2j3YGybpHWRpJtgsxqi6lIn+7xOJsm0ANuQTgJFoftyY8I+VOFt9XgT?=
 =?us-ascii?Q?6v6UY3A8sDclJXnM0tio+/VY3yz7jz/m1n/zev7Ri0XuVbT9EnPOuWTVsGc2?=
 =?us-ascii?Q?4LynPw7gla93f3BwAwewMtTEYthTak3TedI2G1Wj15I6pAOgQe7vdtbatyPx?=
 =?us-ascii?Q?1Rp18TNsChgpmRgIPkZMSnxTzvgHIs1OMz8Xvp+nCyEby3a1Ufg1JvNkTKIO?=
 =?us-ascii?Q?4Wu0y7mvvpfeSPg7WOAuTuK//P/RIKcTrz29IpL4aD5ICRsf3V0miTmPmPdG?=
 =?us-ascii?Q?lK/enVPFTvh2f8+2uO6xwg5WAOL+81vpbMOhx8S+nmdudeye/BooA+UQawVg?=
 =?us-ascii?Q?vBNCoZ2R/YkPmyODkXbURIzRynCL9dyYwQvN0LzpSCZYkvUm7qVH6A3hvcq7?=
 =?us-ascii?Q?8vzXz4CMfvMXBdCKzxRptvSLuYE5eVFEe8vmn2pIgsk8tioFTDJTVhZBBEGi?=
 =?us-ascii?Q?XQl6JOL2B05kLmRCGg7QnGjgKARbyhBsiYzghHXP2nFY7a//5ApAjXXNpjLt?=
 =?us-ascii?Q?3ChyhBsXDG9N+VidgccPDzY6zq02ysWV9gsO1X6rUlXfV/BN+gli4Wjv+sBW?=
 =?us-ascii?Q?bCq2kTYpc/UEhGj03At5MaQ53lxg/x+hEnfqdcVu40ksyBKVTMNSwfEBFgVS?=
 =?us-ascii?Q?FTZZjNueBIEL8o6GSRCK+Usv/l4gKv6SeoCApr33335Rtx0IUNZGv1hMmCj1?=
 =?us-ascii?Q?9O7A8uwh4ybw4m9dS6RsnMI6PVdnFv1SPI+giGsKVTG7q9LWNnzzue+PU1MD?=
 =?us-ascii?Q?DTGnudak9HjbzJD+Mo4PMzLGjuQ5FgBdtEi8oDvbh/Bakf5QEmeNzWeHnLr2?=
 =?us-ascii?Q?lCldQdoRhrL5ktnhE09gN6fjk11jgKGe7yqEIDK7E95UT2s+6uxc5NfMLVXx?=
 =?us-ascii?Q?UMmRlKrf3cRPB/1N7N09EjnTSQKiNtuoGD/ZQI7aV0G1rjaR4k+/o9DgTB7j?=
 =?us-ascii?Q?+H16cvGlBlYvYEXgtVaH1FpkjYZJ4xNjeL0w?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 17:24:05.1063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e15c5a0-1902-4ee3-0521-08dddb575e93
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7171
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 19:05:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221870

There seems to be some settings that are not done in time in
base.bbclass when setting up the do_fetch function which leads
to parsing issues of the recipes:

bb.data_smart.ExpansionError: Failure expanding variable
fetcher_hashes_dummyfunc[vardepvalue]

Also by fixing the build error the floating tag/branch build error
is taking effect again:
FetchError("Recipe uses a floating tag/branch

Signed-off-by: Tony Rex <tony.rex@ericsson.com>
---
 meta/classes-global/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bb=
class
index 6be1f5c2df..c955bb861f 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -147,7 +147,7 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=3DTrue=
):
 python fetcher_hashes_dummyfunc() {
     return
 }
-fetcher_hashes_dummyfunc[vardepvalue] =3D "${@bb.fetch.get_hashvalue(d)}"
+fetcher_hashes_dummyfunc[vardepvalue] :=3D "${@bb.fetch.get_hashvalue(d)}"
=20
 addtask fetch
 do_fetch[dirs] =3D "${DL_DIR}"

