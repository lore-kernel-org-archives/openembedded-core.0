Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7F7CFA460
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 00:08:52 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.294.1763683731592821355
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 16:08:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=j0RXnQtx;
 spf=pass (domain: axis.com, ip: 52.101.83.51, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgb9uGstEgOJzwgj+ihTFIRi9+5Zv0xerEHGdV1v1PUnSIVBtdZ4h+W5+k0TaRHXe1D5RsUktMdhuXdWxDAzhkv2EYOcYPKCZTivjPtfqZvCophoMcfHE7ZHgHX22xaza1u1KRl6me1VBhz4vpIywqN10pFjlZWQ5mHew8pdIt8t2/PnBrmh2MRfb3hsu93c1RWMDNjYEWsc09RoBUGos9QdhJ1q+JSQO7e37GnC5X67E7asbBbfHMU4NPLp/SkGwdyMLMaaon9bZShE0Ypvq8N2xSb0AcYvMzFQHBrTqyju+PdUxEPHxV3AUapwJW5LtwkA6Cp5VmMD6/RU6BSNDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nmonzkhIg3HghfMDRDBj5eXdfJQvFl0CY3DDMJHZog=;
 b=oL1O8LkLOev0MpGjW4nbgUcGn0Cw5WVKyTZawPlk6SisbeBTYy/pMo7sXtvFujB1FtsqKZJCQekXWovs0ZJdRbLcJxLLOSQrtYgOmyea2WNXGUtNeDgZyCrtYxRNdqM/qyzet8zvmPp1VJ84cdxXgCqcznjXOv3YjoU6PAAo36tLPoBik9cp1Ob98kBglm66Fr+Gs5PDIyJZYJhTGT/A1Dx3Ajhtl8oPVMvAiXDN+lHFBxZNnWAeOOaYcVfIPbCJazJu8rkLpcvhWxOib3oqQ0ppG5SuAN3p1umf0IyiyP2+vYeOhW3goA5K/lRHPuyxZMioRx6/TZHXsst5mQ0ziA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nmonzkhIg3HghfMDRDBj5eXdfJQvFl0CY3DDMJHZog=;
 b=j0RXnQtxy12o5PX8faOzljcaw5tcxhPrpR/q1rZYPePCu/aWyXHYqqyHnNKbwNnbcBjzqPj2bdRF85z7TtA213l72UifeD8jxxVW0gd7OhgGmpUpx/SZXq2fJ+MTUAHg+Z1xfoqQZjyiCTO+QanSsPW26sXv+Nf1/lrREGDr1ug=
Received: from DU7PR01CA0044.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::28) by AS8PR02MB7142.eurprd02.prod.outlook.com
 (2603:10a6:20b:2e5::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 00:08:47 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::87) by DU7PR01CA0044.outlook.office365.com
 (2603:10a6:10:50e::28) with Microsoft SMTP Server (version=TLS1_3,
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
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 00:08:47 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Fri, 21 Nov
 2025 01:08:46 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Fri, 21 Nov
 2025 01:08:46 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Fri, 21 Nov 2025 01:08:46 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 2682328DA
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 01:08:46 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 6F42E12058E; Fri, 21 Nov 2025 01:10:34 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] configfragments.py: Correct the help for enable-fragment
Date: Fri, 21 Nov 2025 01:10:26 +0100
Message-ID: <20251121001028.3756594-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E8:EE_|AS8PR02MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: 10956f6f-4a3c-4498-a221-08de2892243a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?L8mMOOKmTiUvnxRgQytvDm0ZPMPz6bV4M1Nq8SFMDoQGD1x6rOlFkRbVoL1b?=
 =?us-ascii?Q?wRBcbPmfD6zYzsFIiSDNqRhyUB7rZZsNUTzJaqVHnYq+n0PzykqgBeIRXcvi?=
 =?us-ascii?Q?a7h9C2Ci2718VRwCYb5rNQKmqMW8iO+uhs+LI3+SWDyn5KA7cvhAnU4QyFxH?=
 =?us-ascii?Q?du83N1tyqvurf2h/b6F4GDet6wOMM/qUAVERAtM5otSHGGzZViYQHSOrhPmt?=
 =?us-ascii?Q?VHooN/dXkK+xuiEHGAaOn9y7bl6bviwFcwNE6oQTiMK0c0mDvKJLETLfkJRK?=
 =?us-ascii?Q?/kYJ9hkmJLh18jw7sWTJCIy1fxBv+v3vaHYbWUhTP+GTfLUcV+UvLOyDGVOR?=
 =?us-ascii?Q?+HfQV3A18U4qg3gGWPyYM+iWXPOECRbp1ZhuhoTncKDYHEwbAG6DBJBst/g7?=
 =?us-ascii?Q?BSvxDUsAQcaHN/D6hJzgUju80QdovxqBtti64Z1u+wgYW87/h/95siSaFQUF?=
 =?us-ascii?Q?XppJofIET5gjSdhPxfhvr2ye5hfHvo0jhO8YBzieKdrjB32CQdxE7KveUBTb?=
 =?us-ascii?Q?DLT5M+sKQG1cT+UQz8+2a23rEj78MjXNuv/zjZT9+OJ0QfNFqugJTWSYPtAa?=
 =?us-ascii?Q?PrJFBb3MhZ1aaDNi80gcQ4TM5ZKcfF7epiEmQ+9uYypjxJh8b+teyoT69Zb4?=
 =?us-ascii?Q?UdtNlHM2/IFHQUrs6CAznWZCT4N0KlIXyPaiWl9yqZKPlORl0mTbMqFF4L6B?=
 =?us-ascii?Q?cQkQlxhCW8d/tNPZNraUcliHCx4fHCnx2myznxQtvY6+M6HpTmiofUwbV5iu?=
 =?us-ascii?Q?rjMCOIhdvEWJ8UD9NDYfPD+1lK9vv90dz+Jhsvhnzp7WbCtEOZSurfN1tU5U?=
 =?us-ascii?Q?kZXeIhvpgNFuucQ4syzr7efnqlWmh9u14EynHnF6TcwNS0QiO3BLfozyVps+?=
 =?us-ascii?Q?aUY7KPU5rFcdgvNByHIdbCAbcHjZgipXCC3SOY8e9+bOyl//QFjoUx7DZRog?=
 =?us-ascii?Q?XMoOCH/nUsj9WXeQQ1R+AognqpDbzkzlu09HgYwd/IkcenSnRWYATY/czQyu?=
 =?us-ascii?Q?M56+Hfwi6TZvC8hmjRqWqgCmWq1e4EVy09tqja42AHCiyiyY3BAWmbwcWbOf?=
 =?us-ascii?Q?He2pv6SaqTLP64ICD8iqhny1NMo9BcIXgqlR1h51AIViOf0DpDyDolPej+WM?=
 =?us-ascii?Q?eYA/wQSk8PKNUFU/XHCihtPpdGiQxKvucN40BWsJebNUsLOC7lH8V0DAM4hU?=
 =?us-ascii?Q?pzwF4O9hd5H9156+N4xWzaJJOsvKYHBMkupMWfAvA1x4ZUnfrkWUPwjvowIf?=
 =?us-ascii?Q?8qap5dcUnbkwTUnpFhg2CU0LZ9IY5cPIw0YMfVEFREHSNIiifxB10rBF11dB?=
 =?us-ascii?Q?/11E1fyR5j4qB2EH3cMKQx03qb1rMvvfsSwCvL1gyhnTjNnYYzA8UybPU3nN?=
 =?us-ascii?Q?Q/unuzLl27/v43YP+AjLnPFivLwMVXdDjcKXZXel/TFDE+fMc8RN+Xos+v3r?=
 =?us-ascii?Q?x3p/Xh42oFOVWsd++Cb+fGWr+E0XAG4FDL78TEueYAZIpZpDJMDOG2Bd5jta?=
 =?us-ascii?Q?GUK08n99ApwfXGgK6Y1aqjUy0LZb3RDkmECJ88IldmDGhRq83BlMryzDnoyX?=
 =?us-ascii?Q?MGZIlk22hqpQA7JSF2k=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 00:08:47.0832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10956f6f-4a3c-4498-a221-08de2892243a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7142
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 00:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226645

The help entry for --quiet had been added to list-fragments rather than
enable-fragment.

Due to the fact that --quiet is a global option, this actually adds a
dummy --quiet option as it would otherwise hide the global option, but
would never be set since any --quiet argument would already have been
parsed when this option is parsed.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/bbconfigbuild/configfragments.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigb=
uild/configfragments.py
index 6fdac33a5d..f79e238297 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -197,7 +197,9 @@ class ConfigFragmentsPlugin(LayerPlugin):
=20
         parser_enable_fragment =3D self.add_command(sp, 'enable-fragment',=
 self.do_enable_fragment, parserecipes=3DFalse)
         parser_enable_fragment.add_argument("--confpath", default=3Ddefaul=
t_confpath, help=3D'Configuration file which contains a list of enabled fra=
gments (default is {}).'.format(default_confpath))
-        parser_list_fragments.add_argument('--quiet', '-q', action=3D'stor=
e_true', help=3D'Do not print descriptions of the newly enabled fragments')
+        # Store the quiet argument in quiet_dummy. This is because --quiet=
 is a
+        # global option and this one is only here to add an entry for --he=
lp.
+        parser_enable_fragment.add_argument('--quiet', '-q', action=3D'sto=
re_true', dest=3D'quiet_dummy', help=3D'Do not print descriptions of the ne=
wly enabled fragments')
         parser_enable_fragment.add_argument('fragmentname', help=3D'The na=
me of the fragment (use list-fragments to see them)', nargs=3D'+')
=20
         parser_disable_fragment =3D self.add_command(sp, 'disable-fragment=
', self.do_disable_fragment, parserecipes=3DFalse)

