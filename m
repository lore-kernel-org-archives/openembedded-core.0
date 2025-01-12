Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3EE2E7719C
	for <webhook@archiver.kernel.org>; Sun, 12 Jan 2025 14:55:13 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.49])
 by mx.groups.io with SMTP id smtpd.web10.36962.1736693704545218603
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jan 2025 06:55:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=RXYE3Bpt;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.243.49, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uuK/2poquT4OPkkpURYgntyk7b5uDcvMbEJzmmwSirWf8UravIFyI+7gO4BnBYk+INqErBIlqFqD0GtXRqVbBgiNLaPqlY+7BxlUudNyIcxkJdo8u9Ve0Ed1CnT1d3PdBz8rw45lTBH4pCzUeNdwJf+TZnaNoZBHZrYcd66jg7AB9MtlneV6vWrhHgb0qncG+91fG2mFeFPrDgSud+52MwH5Yyq2ZF9d1hXAQRrtGDyT6GDQdKSPynYg0T4Tozn49oHDhlo9PQp8btpbVXyo5Na5xHnQtaqtFZ8YAuiyh7uAYgolYkXF3Ap1RgV/B17K81Jifr7ooBcQ/XsjULOcVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ga1UWXiImv+lxoTybktwMqY93o8AeRBHOIlRNLtmv8M=;
 b=t5mMWGkhywoGEXcqKnQ4JxMUhlMb/hpSJGY17uC/HQeGAztYS9i7rsu5LFn1tetdq0Sj6dTONQ9j32foz61u2BdV760zZbVUJDeXZlxxlRoDeba0bAmu+JwR/Mf8D2sp9pKjvFTIkrpXtSwdyYMnAf0cbDVOW/dZ9l6oBoCbw5Eh7QVjR8grySUIvcPygkh0Ou8O07B0sGwNSEL5Goion/TxkbboySd/EPCw/K2W6N9vsGqzA3xTA1aYNeLxhz4A9d5OScWCJMdv601qPMAlwnrotBYcL+WxYJDOAH6fbLKA/tnQfCMRZ35qrNMqZNs+VxiyM/vq7UNQn5xQq/fEEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ga1UWXiImv+lxoTybktwMqY93o8AeRBHOIlRNLtmv8M=;
 b=RXYE3Bptye0huov0OSxjYSADgMBwZqjC3kLfwxud9vNSBQnKNEIDpZ5CYQL75im8TvUFamWy0Mb5t2lhBmitcGtyMsKj2FzudBG/6Xiljh/6hx/UVsnujbk+ixsDj+FHTkfpNYKe2DLswdXJpwUk8fZBjGq5TeGAzFkkDCybVR66RWyKPbGvj6FCFEUTfdKAROdQ5J9fc2cpuiKiN5JD2typ81353ddhfToeX8Wkq+Ci9s29rqTNrbS4tgc5bnkyC/hVF4C2LVOBw4AMKv1hNgI/qLOIvKpotaXrUGevadsVPD7iBhVN7lKsd/42irTT17BTSJzlVopm38RMihGZLg==
Received: from BN0PR03CA0039.namprd03.prod.outlook.com (2603:10b6:408:e7::14)
 by PH7PR12MB6636.namprd12.prod.outlook.com (2603:10b6:510:212::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Sun, 12 Jan
 2025 14:54:58 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:e7:cafe::76) by BN0PR03CA0039.outlook.office365.com
 (2603:10b6:408:e7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.17 via Frontend Transport; Sun,
 12 Jan 2025 14:54:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.34) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Sun, 12 Jan 2025 14:54:58 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 12 Jan 2025 07:54:55 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 1/7] devtool: un-globalize the 'basepath' variable
Date: Sun, 12 Jan 2025 09:53:53 -0500
Message-ID: <20250112145359.607585-2-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250112145359.607585-1-chris.laplante@agilent.com>
References: <20250112145359.607585-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|PH7PR12MB6636:EE_
X-MS-Office365-Filtering-Correlation-Id: 222bba68-6f26-404a-efaf-08dd33191571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?V1H4xJ/JK3UTmjdCxOqukEnW6YYA6xYN8NrDna5en4GnPe3s5sC+zlGjtSEf?=
 =?us-ascii?Q?Ohob5kvk4rqE/nPsupRIWpYbNMLK0jeKENQB8Jeo7akT4KfH6/fEjWPBPSBt?=
 =?us-ascii?Q?LJ07CTYlQQA1JDyarvDHYDHw2L9WPB5xIp0ZnCVZiKb44jAXGZD5eFaWngbD?=
 =?us-ascii?Q?L3DlMJ1Oxfx90lg60xPo7zaA7wZl0NeRuVbBDRbafTte/vSNFuDG1eQZWd49?=
 =?us-ascii?Q?0uztkT2QAdjrswej3QtZXWxY9sPdWPpgzACET+uQuqHxf9XzLGQD2M/p2AMH?=
 =?us-ascii?Q?2Y7CCyXCh3DwsUZ61kigtexeAW8N4I+dnHeZZM7n6TzNx9gY4kleB6TBTO6U?=
 =?us-ascii?Q?Ocpsoql1evu1n003fXnZCJ8ZgcalWiiOm6y8tIm0n9/H7a6TUO1vSycKnndJ?=
 =?us-ascii?Q?qvZZNSM9sZDfvgTg0swyqbzbiNnv9bj9d4m2ToGAEYZ8ClQ9J6Srv1V0TtAD?=
 =?us-ascii?Q?HAeShGdQynkNe71aPvaL411rtJtJThhmotNYtK+1+bZQ8gPaXo/sMgwDVAK8?=
 =?us-ascii?Q?LL1TkdvpKEGnNSZn1huBiPCx9yPxgT3d2beZuuN0Pnu0YjjZtHK4bzdWy9FA?=
 =?us-ascii?Q?ZpRwVv0rJkXnsIW9vJF50CLkhaRaYNKYPgQrcmYO8iMK+Cgd66/74u69T1yq?=
 =?us-ascii?Q?PfIJGLdAgwqPg+3leKrGdA7CDsZlqhEEx+FTdRVXess7pr4bTnqCbN1ox34G?=
 =?us-ascii?Q?CcSO91vNduv+TQ2MlStonJKRsHnABYiqD4uiKYLRM0rMns5EloFQC9a9rssU?=
 =?us-ascii?Q?yvU3RELWFQlW7RQ3e1WQb+mHr+Ld5krEgAkUZ8pgZuVkK+k10y12f0VDTGRh?=
 =?us-ascii?Q?N/+gtxRhhuzas5YBTLdd6edAAwr1kR5izvbyVaa34lVoh+7x1xNJLdLbB1+a?=
 =?us-ascii?Q?y1AKbiM8fbdwe0JFYCTA0QCvQfc9vyqG0hXrtLgHNYlHhAb8DuQJuv08r5hJ?=
 =?us-ascii?Q?Qn/zNWsZGa68ChJuzFC3sIBButipNXrDRk9E2pWJG/84SR6dnFj0S7jvOett?=
 =?us-ascii?Q?Yk10Cqltx1JVBYrcJCq2BID8QSVgBzgOkW33zjNTQtxvSwOquL8sNCw643+z?=
 =?us-ascii?Q?J/4NrBDrKNixvwLHN+9OXU3eVmrdHHV4ajRG03dFUf1xEHWLuV6rE9Sux9XR?=
 =?us-ascii?Q?VswWRvDCWupNXF2J85ZiTARqbyLE8OZKkiWPoacBim9OR2bd4ziKmho5cw1U?=
 =?us-ascii?Q?gq3HTXcTBIj023Uh3wICI59yst2jsYtDLIdVYL02COVefruKHSSKUACNj7wS?=
 =?us-ascii?Q?wq9aSLROlhSoS3xZNSDy6CO16HsoZ/d2FTYe1rMsmZPuP0DbV8tCDwgqfgGv?=
 =?us-ascii?Q?Zpq+5VOQTxigc+vilFWgZLzLyexuvTBSXrgYmy243Xj28+qPMskRZcz0wlx1?=
 =?us-ascii?Q?fq6RgBk2IEsLY93LbfCow2wXI3hKfaERRXfzh9m+oyFkGQkN8SlRIETDebvR?=
 =?us-ascii?Q?+43B6JWIVYd6S5DjPqyvZIRPHs108Qzc107QqU4wUSE6fBj48frkHCodGpLw?=
 =?us-ascii?Q?dPM/ZqPYnFAFh/U=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2025 14:54:58.2215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 222bba68-6f26-404a-efaf-08dd33191571
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6636
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 14:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209691

From: Chris Laplante <chris.laplante@agilent.com>

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 scripts/devtool | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 60ea3e8298..acc4e0e982 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -13,10 +13,8 @@ import argparse
 import glob
 import re
 import configparser
-import subprocess
 import logging
=20
-basepath =3D ''
 workspace =3D {}
 config =3D None
 context =3D None
@@ -33,13 +31,15 @@ logger =3D scriptutils.logger_create('devtool')
 plugins =3D []
=20
=20
-class ConfigHandler(object):
+class ConfigHandler:
+    basepath =3D None
     config_file =3D ''
     config_obj =3D None
     init_path =3D ''
     workspace_path =3D ''
=20
-    def __init__(self, filename):
+    def __init__(self, basepath, filename):
+        self.basepath =3D basepath
         self.config_file =3D filename
         self.config_obj =3D configparser.ConfigParser()
=20
@@ -59,14 +59,14 @@ class ConfigHandler(object):
=20
             if self.config_obj.has_option('General', 'init_path'):
                 pth =3D self.get('General', 'init_path')
-                self.init_path =3D os.path.join(basepath, pth)
+                self.init_path =3D os.path.join(self.basepath, pth)
                 if not os.path.exists(self.init_path):
                     logger.error('init_path %s specified in config file ca=
nnot be found' % pth)
                     return False
         else:
             self.config_obj.add_section('General')
=20
-        self.workspace_path =3D self.get('General', 'workspace_path', os.p=
ath.join(basepath, 'workspace'))
+        self.workspace_path =3D self.get('General', 'workspace_path', os.p=
ath.join(self.basepath, 'workspace'))
         return True
=20
=20
@@ -86,7 +86,7 @@ class Context:
         self.__dict__.update(kwargs)
=20
=20
-def read_workspace():
+def read_workspace(basepath):
     global workspace
     workspace =3D {}
     if not os.path.exists(os.path.join(config.workspace_path, 'conf', 'lay=
er.conf')):
@@ -209,7 +209,6 @@ def _enable_workspace_layer(workspacedir, config, basep=
ath):
=20
=20
 def main():
-    global basepath
     global config
     global context
=20
@@ -264,7 +263,7 @@ def main():
=20
     logger.debug('Using basepath %s' % basepath)
=20
-    config =3D ConfigHandler(os.path.join(basepath, 'conf', 'devtool.conf'=
))
+    config =3D ConfigHandler(basepath, os.path.join(basepath, 'conf', 'dev=
tool.conf'))
     if not config.read():
         return -1
     context.config =3D config
@@ -332,7 +331,7 @@ def main():
=20
     try:
         if not getattr(args, 'no_workspace', False):
-            read_workspace()
+            read_workspace(basepath)
=20
         ret =3D args.func(args, config, basepath, workspace)
     except DevtoolError as err:
--=20
2.43.0


