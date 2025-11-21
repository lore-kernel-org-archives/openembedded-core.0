Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7BCCFA45F
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 00:08:52 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.293.1763683731017233644
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 16:08:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=XTkjUzwb;
 spf=pass (domain: axis.com, ip: 52.101.66.23, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyebDMar1g3clSXZ2aPfcUBcGUQsHIoqNnSBx3+4YSMd30okXTs5gkJmxrRjAuGtWUCARvOEGFmbmyKr+lPjqgkeZcmjbD4ETmyXethOB580YfB35xsDUiZ3tcaDUVtP7cUhMpM44RIIRZ5hiK8A/34sz6DD/8fjhIu/sEOB/nylc+3DRLVB44JLWoL12h8NXMixBmtYaKa+DSxZIOSywglY7q/tOm3VLWt0fmZMZGWtafiLWwqAE+hAbXBA7eYni24t1CbaurE4Eouoyea9vvdExQTrMRvQYQjE0MmYh2O+lqSv7nWVdFRlq6i1zlrt439cMVeoUY0WBB/Id0XC0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZd3MdKfShjbECTISRl3VS6YrrBtwAHSQo7zURasIXo=;
 b=f4czMNjD2Bm5rzw1Z4KfCr8D+kQDnadrSsxKAjdxMO+BYRP1gBTQasFwJyaOTcnlEAILzFAfiB4TPJd5KggGQydt4O8OXYcja6wX2LtZ/noLMwzSY3R5vy+Mixlaw786FXvCHOuUznzVt9J2pxkoScmRdD528Z2qhSnEs21RwrIBUrGPL5LT+Hd0YyM/T6xeEJRRm8czfTabipzVi0KhCDrGdZPzk0QNfjuM+A/2jVtMkv7/BpftZDNB94cQypoVVkOeSiTZ4WMjojSOs+Dwi3W58BaiNReSKCHUvYhv7n0p53Y1GYWQc/6VjjNyDUlWWzYfl5fSWSoe4Vp2R6OKGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZd3MdKfShjbECTISRl3VS6YrrBtwAHSQo7zURasIXo=;
 b=XTkjUzwb4DiO0IpHZ3s2Gr8GZ+23xi5UZ43QvRxCSuQqJWlQAre4ypyHW0s+BJ2zuy5WAPaZoC8hDbKnP8qmUH9nqEI4JH/hMCDKvTGQE5+NOtuXhwDkoMUwv20WdyZNobE5xPcneI+R0GsmMYtJNoaCHrq39sIlbjKlwQtpMP0=
Received: from DU7PR01CA0029.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::7) by OSKPR02MB11482.eurprd02.prod.outlook.com
 (2603:10a6:e10:9e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 00:08:46 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::4a) by DU7PR01CA0029.outlook.office365.com
 (2603:10a6:10:50e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 00:08:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 00:08:46 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Fri, 21 Nov
 2025 01:08:46 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Fri, 21 Nov 2025 01:08:46 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 0B8332DDB
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 01:08:46 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 729FB120600; Fri, 21 Nov 2025 01:10:34 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] configfragments.py: Make list-fragments fail early
Date: Fri, 21 Nov 2025 01:10:27 +0100
Message-ID: <20251121001028.3756594-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121001028.3756594-1-pkj@axis.com>
References: <20251121001028.3756594-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E8:EE_|OSKPR02MB11482:EE_
X-MS-Office365-Filtering-Correlation-Id: 6812b3ee-4397-4438-2c3e-08de289223e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2tJ6tiwgioV6ycP82aIzQVxyVj9v1Vu3hCiceF2VW59wKbTYcvKw4PRmDqs6?=
 =?us-ascii?Q?qqIOBYNp+gUooX2K9VpBl+cKEh4+HwictzBGwwUq5IzbeAYrrE6Zg3ZIh+YS?=
 =?us-ascii?Q?7vP1s+kKtHjaKLRubjTYp68Q8C81SfVLoOOGtQOzq9pj/3bIf9+zr57TJOEu?=
 =?us-ascii?Q?3clov0AdwjzRI/gSJN3Jj7zwHM0fb4cTeXycHiPJhj2kKkyyv6xnZUzRjAeT?=
 =?us-ascii?Q?el8StB8VRPR//0Fm45W8T897fCmCAQiojXhG7Pmp67quxcfuTqkvJAOwcPm4?=
 =?us-ascii?Q?DMZ6mOfliHFIRRYzyoaqaQycf8XBdSbOHNiEFofp/PZTY7UXRX9fKpVCWyL5?=
 =?us-ascii?Q?zqcb2RwAyX8bXD3Z6fXcNmqG4tYJB97xBAptqp+ySLePGp9km+m3NNvl2m1V?=
 =?us-ascii?Q?sGb5KKklHuu9avVs7A6e4sjlTNNSnZx2ceMxY+KsNHg3ncWvBr43AXiMDrfw?=
 =?us-ascii?Q?eK4Q6KCIe1KEwrxRu57DbCZpqWBhVzmMjYHxo/0H6buMZU/XBdBMX2XQH65O?=
 =?us-ascii?Q?d7Cj3dM1n6Idp+eA1jT6FtmpCb+6EFlQH5G9MBRqPsMMuY6oq+M2NWMi2TiV?=
 =?us-ascii?Q?iH+K84dUl3unoEt42dGLBIq6Tx7N569HFR2rYA/za8oQ9cvwCF73hsM2WrDw?=
 =?us-ascii?Q?rI0GxPrwi9kkFJdOkGR6o7w4o0Tpt1H8JofTl1G+L09DNf5ca9wNrdB6/QbJ?=
 =?us-ascii?Q?qq2pS33fTv0vEYijSXPjELxLW5Ov9VDANxH0MTSihR9133W2iUDiPh517gDU?=
 =?us-ascii?Q?xxG5wNHx1/VuO4AMydED4gyUzW5cs3I3dyf25mqvlMZt477boTbTLmJlz4CL?=
 =?us-ascii?Q?5iE1D9wfY9L+mzQYn71/Cj1ZGZpc/p3HKTUYEfY1WNJBtaEH9gPdWDzI3/+W?=
 =?us-ascii?Q?r8Nz4ikyIntTXIMkdG6Ez1IVgIHJSraYrZTT9xtwbvDLWui9YBY+22DiIU5d?=
 =?us-ascii?Q?LfC6OJrCwP49x906F3UagA5RqS2YO3R8BHzlBhaf0pwUV/e8Ke5G/I5zhUQ7?=
 =?us-ascii?Q?Rtosu7uSe3DyOcQiPvd122PBLG9ITLFfj+kzXUMlhic8pxHkQuuQARiiUjWL?=
 =?us-ascii?Q?+y0TUZT8CEy0ulrZC/zBg58eoWEI4ThsImWAaLKlJmLx4nYvCKCkl2DfU0fF?=
 =?us-ascii?Q?dkHq5/3xHHTj34v6AV9GjFdXev6jZbitVFJiMeLYWdoOchBmWdoWXtNCSkPE?=
 =?us-ascii?Q?7GhXmBvwd502Ru5fmuGqqsD1Pc0Ti6mvtktvqLtQMWNmHfv0s81u5eYl2tq5?=
 =?us-ascii?Q?fpp/2qcv3uwd0DiDumMljoRyTBsjAEgP/UcVmUqSvNG0oUfiZUU4PQC06PRx?=
 =?us-ascii?Q?XDuiV784G5dWJ+Rp3KWqo1nLKwa2jcOcsxvz0e/qTI/duyil003aUSjO0fC2?=
 =?us-ascii?Q?aQ631zEEB6e7IIy7fmMmfnY/KZGV59FqFWd9WgamVbRv6rFSy2m/oPdO9q2O?=
 =?us-ascii?Q?raiSQtyBprq9vcjEGHrw8VlRHbI/XRRfUcdMaQM0+CDYYigxZNiN/xamjXRM?=
 =?us-ascii?Q?EMcX/bRkFn7eLlqbXN8JplOJL3N0JuRqB/1LqelCvmXIcHANghNV3uoRZ2ZW?=
 =?us-ascii?Q?OAKNuwOCXAPplXD8zJE=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 00:08:46.5485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6812b3ee-4397-4438-2c3e-08de289223e9
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR02MB11482
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 00:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226643

If a fragment has not been configured correctly, make list-fragments
fail with an error before it has output information about any built-in
fragments.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/bbconfigbuild/configfragments.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigb=
uild/configfragments.py
index f79e238297..15142ec9f9 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -75,11 +75,13 @@ class ConfigFragmentsPlugin(LayerPlugin):
                  print('{}\tSets {} =3D "{}"'.format(f, builtin_dict[prefi=
x], value))
             print('')
=20
+        allfragments =3D self.discover_fragments()
+
         all_enabled_fragments =3D (self.tinfoil.config_data.getVar('OE_FRA=
GMENTS') or "").split()
         all_builtin_fragments =3D (self.tinfoil.config_data.getVar('OE_FRA=
GMENTS_BUILTIN') or "").split()
         print_builtin_fragments(all_builtin_fragments, all_enabled_fragmen=
ts)
=20
-        for layername, layerdata in self.discover_fragments().items():
+        for layername, layerdata in allfragments.items():
             layerdir =3D layerdata['layerdir']
             fragments =3D layerdata['fragments']
             enabled_fragments =3D [f for f in fragments if f['name'] in al=
l_enabled_fragments]

