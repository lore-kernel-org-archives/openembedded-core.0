Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9D5C02183
	for <webhook@archiver.kernel.org>; Sun, 12 Jan 2025 14:55:13 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.44])
 by mx.groups.io with SMTP id smtpd.web10.36963.1736693706343706106
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jan 2025 06:55:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=cbPqgyCq;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.93.44, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8nCRwPilp2F51rjSFj6f8sVHjAQWKzLg2r46074bI+Xp/uUGoMJ6QaVXrKygCnrvW2yAsBIzxCQIUc3EF0j+S54R6swQ3EEZGHbOo04xhOFhvxa6cOHiTNq1odS+Y/YjhfD2Z9Km+U0qZE9JXEKa991m+8hFjabi+zW8gLLBAIslgxrPb8IbKZS3IfImP1nkxetJ/ytxc/ejgMLRk3WMkWiAGAAUKUmZHer0NWjBRavknqLImpaZXT5njsHaSilWc6clA05k0VoNuO+kjTfLEqcnu1Noitntkw8K7qXqzWJYFecTO28tgHh1IB7aP0Tf7yoWyEknL5xp3OM8H28ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdHrwChRhEHbmPvSN8p8N+FwxH2IZa52MnK1MMvgHpk=;
 b=A5JfAmnoODXMDCzuqFekg0YchFWkUAwVW3sx2u/tKrTrIFQZf77F8boSr6AbxKWTz6b6OlNw3bkpG8xTmgskOEu6/jIHjNbsCv8qsygBsgk+Rmv1TVocgCuD13V3byqjmbR2OBmg/gxnhTsbjVNod1+RC3Kqr2SUE70jFxkjzaW6v7C55/yOdfrDGLqQOfwsMkdaYURYf4fkZ5rmnG+Q8roUz9XCcW3A4lP07dj3wFhO2zWuv4oN+R6bWGqhyZshKGuB/wJZgDHnRMSNxsfSkVLnw8HS1e2FjQSK7iSZsk4I/bIKqzOAiANnWPd9Bhn2h6WXgFHKfAw/85ZEo9UvVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdHrwChRhEHbmPvSN8p8N+FwxH2IZa52MnK1MMvgHpk=;
 b=cbPqgyCqJneuDJrZCQGeuJGMvOhZaA54G/HhuvG20YVkJMmZP2c77X8MTZ0lb3DDMygPRFLYgWCXB7VJajnRrC10y8hl0QNsVY6pvn8JSkSsTl9DPZ9/OJYk7CgnAivypljOrLFJVLuddZ6y0mxJpmmMyL+BmyxUGdj7JIA90f1D2bNVILdhIIO8lwYuyijiCG3mu8HoXPCOMM051yWDRFrPUBdrBH8DiSeqQ1iG44XMIYqXI24bkql9dF5ufpFLRTMScXIiho9QpTkhjA8LmooT4+vPhdgORAgfUI7O0EP1+LJUc5c3j0EY85wj17kGKDEP1lMhD1Cyzvl/miEv0Q==
Received: from BN9PR03CA0391.namprd03.prod.outlook.com (2603:10b6:408:111::6)
 by LV3PR12MB9214.namprd12.prod.outlook.com (2603:10b6:408:1a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Sun, 12 Jan
 2025 14:55:02 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:111:cafe::6) by BN9PR03CA0391.outlook.office365.com
 (2603:10b6:408:111::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.17 via Frontend Transport; Sun,
 12 Jan 2025 14:55:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.34) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Sun, 12 Jan 2025 14:55:02 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 12 Jan 2025 07:54:56 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 4/7] devtool: un-globalize 'config' variable
Date: Sun, 12 Jan 2025 09:53:56 -0500
Message-ID: <20250112145359.607585-5-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250112145359.607585-1-chris.laplante@agilent.com>
References: <20250112145359.607585-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|LV3PR12MB9214:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba6e9c6-ac48-4f30-97b1-08dd331917ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rhMEV6o5wKlhZXb8AqJH8kVkoT8mjnmW7fB6lIf+VfsPzZwpD8H+uwjuD7YA?=
 =?us-ascii?Q?rbZD+972GsMHVOhcCstOtmn5x2VVIklfkASg4Mr307VBTEONX0CYSGNBxfB9?=
 =?us-ascii?Q?6PiGAteKEdyoXaO4M8JJc9HsWo2qk9AvqU+qGxC1yuESgJW14/WEm3r1xw4A?=
 =?us-ascii?Q?CrNPNGOSMGx1dxRL16zHiVPwiAPGyWnijtS5WLVuDnZIj7rE9CybyW822hMu?=
 =?us-ascii?Q?3djFREieAvBac4SV+xrkwRCQgzqWlaWG4kaIAW6ayrxFFiA1Xfzgv/8uKMor?=
 =?us-ascii?Q?ZbFLsVnwmKrbDXI+sQMtaEW0Zz0g/NRU7PEhtfUb5eBjQHQ/ncPrCQLchj7s?=
 =?us-ascii?Q?5Us6cZ5oYd9Kki7jnOYHAOpbtFCdTTBP/hqtHhs7+NW/8VnYTVfoYbI/fst+?=
 =?us-ascii?Q?cTwG2K4GHCpb3F4L3Cg9rHQ50TVz2zc7cDTvSBfiJ8qJfMbOnXuOqfuSOx56?=
 =?us-ascii?Q?JXjatJJYL5Vm/VahoMSCddT07QG+QXSKi4/1PYCC53xBHcHtqXi8WjnLVkZ4?=
 =?us-ascii?Q?5/F8yj1ZqhurqE+TJ9SR/JeN1gRo04E1ucCiYSDtqFKMesVQFv0ooD1HLc7e?=
 =?us-ascii?Q?rCyAp2LeOA+pmuKbyt4pnjJJs+Ghk7857L7DKt/kmjMAj3VwT2ql05bBSlYM?=
 =?us-ascii?Q?XWL/EJ694UNQbT1FBiVT9DRbLQl3tV5Z7QFnGKALWaBV0Srq2NSC1qt51gQE?=
 =?us-ascii?Q?xyRZB4RUfZjnM4QsK5JAv+j7kRS5H3mLjEDXygJ66nprChsBlTEGEggubyQC?=
 =?us-ascii?Q?NNBP0jgwYqdQQQ+CYyWgdFiCnpKSNfeDMAe7+SPZg+NZhKgB0KM48h0Z1fgh?=
 =?us-ascii?Q?DwqcRO3gZCjgP55m/asdOBT3JPlZWKFU8JRMBldONmSBXUaly6g0kEpsL3SM?=
 =?us-ascii?Q?iyUCQlakEBUrwyD7t+FYfOdwy9fjZAlG3lSHhR0Kaej9fwRw+BuRbVT1rwmD?=
 =?us-ascii?Q?TrmhI/00VZKL4k+LJkuYgnxoqWY8pybmf2z9jK869zRsvZSFkDqBbb3X57Tl?=
 =?us-ascii?Q?00HevdNkXxUIRPplzCZ9pYeZgY/3TzS0WBqw2p2m6rv9t9ZxoWLQdDvr0B31?=
 =?us-ascii?Q?RJznJsmdmgyltwF8EVkQ3c4TVglf7tiTPRDl05DnmwjoSFEVCoOmtxOtMrMl?=
 =?us-ascii?Q?TVJ+QcZcho50skNLWVnWYLdRCeVHdKqs/MMVpSMaKB1OU5dVcFT/99mSQlvt?=
 =?us-ascii?Q?u6glZdKFo/FmQUrA5GGuyDb9zuWTJ5X6FnE/o6gWLpSsfRPYjYlzQXAhEUA1?=
 =?us-ascii?Q?a81w8gfxYY1J/NBb7JOVzHf1udxGd9E/U4ub3ovPyGOIApcoJc7hLAJ42S4e?=
 =?us-ascii?Q?lVD0mzmhu1TAHrg8VR6eeA7g+SL//3umJFNRcuE4sS1tb4oWrDdIkGoDwGj3?=
 =?us-ascii?Q?oNzbjmXkPMpEIIz7UVcNilKTk79In9k0yXmvkZ2qpyepLRv8YViWrRhVrcBD?=
 =?us-ascii?Q?+aVT+Y7/oQA=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2025 14:55:02.0531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba6e9c6-ac48-4f30-97b1-08dd331917ba
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9214
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 14:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209692

From: Chris Laplante <chris.laplante@agilent.com>

'read_workspace' can now access it via the 'context' that's passed in

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 scripts/devtool | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 1ace6fb035..d96d25a51a 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -19,8 +19,6 @@ import logging
 # This can be removed once our minimum is Python 3.9: https://docs.python.=
org/3/whatsnew/3.9.html#type-hinting-generics-in-standard-collections
 from typing import List
=20
-config =3D None
-
=20
 scripts_path =3D os.path.dirname(os.path.realpath(__file__))
 lib_path =3D scripts_path + '/lib'
@@ -93,19 +91,19 @@ class Context:
=20
 def read_workspace(basepath, context):
     workspace =3D {}
-    if not os.path.exists(os.path.join(config.workspace_path, 'conf', 'lay=
er.conf')):
+    if not os.path.exists(os.path.join(context.config.workspace_path, 'con=
f', 'layer.conf')):
         if context.fixed_setup:
             logger.error("workspace layer not set up")
             sys.exit(1)
         else:
-            logger.info('Creating workspace layer in %s' % config.workspac=
e_path)
-            _create_workspace(config.workspace_path, config, basepath)
+            logger.info('Creating workspace layer in %s' % context.config.=
workspace_path)
+            _create_workspace(context.config.workspace_path, context.confi=
g, basepath)
     if not context.fixed_setup:
-        _enable_workspace_layer(config.workspace_path, config, basepath)
+        _enable_workspace_layer(context.config.workspace_path, context.con=
fig, basepath)
=20
-    logger.debug('Reading workspace in %s' % config.workspace_path)
+    logger.debug('Reading workspace in %s' % context.config.workspace_path=
)
     externalsrc_re =3D re.compile(r'^EXTERNALSRC(:pn-([^ =3D]+))? *=3D *"(=
[^"]*)"$')
-    for fn in glob.glob(os.path.join(config.workspace_path, 'appends', '*.=
bbappend')):
+    for fn in glob.glob(os.path.join(context.config.workspace_path, 'appen=
ds', '*.bbappend')):
         with open(fn, 'r') as f:
             pnvalues =3D {}
             pn =3D None
@@ -116,7 +114,7 @@ def read_workspace(basepath, context):
                     pn =3D res.group(2) or recipepn
                     # Find the recipe file within the workspace, if any
                     bbfile =3D os.path.basename(fn).replace('.bbappend', '=
.bb').replace('%', '*')
-                    recipefile =3D glob.glob(os.path.join(config.workspace=
_path,
+                    recipefile =3D glob.glob(os.path.join(context.config.w=
orkspace_path,
                                                         'recipes',
                                                         recipepn,
                                                         bbfile))
@@ -130,7 +128,7 @@ def read_workspace(basepath, context):
             if pnvalues:
                 if not pn:
                     raise DevtoolError("Found *.bbappend in %s, but could =
not determine EXTERNALSRC:pn-*. "
-                            "Maybe still using old syntax?" % config.works=
pace_path)
+                            "Maybe still using old syntax?" % context.conf=
ig.workspace_path)
                 if not pnvalues.get('srctreebase', None):
                     pnvalues['srctreebase'] =3D pnvalues['srctree']
                 logger.debug('Found recipe %s' % pnvalues)
@@ -215,8 +213,6 @@ def _enable_workspace_layer(workspacedir, config, basep=
ath):
=20
=20
 def main():
-    global config
-
     if sys.getfilesystemencoding() !=3D "utf-8":
         sys.exit("Please use a locale setting which supports utf-8.\nPytho=
n can't change the filesystem locale after loading so we need a utf-8 when =
python starts or things won't work.")
=20
--=20
2.43.0


