Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EBCE77188
	for <webhook@archiver.kernel.org>; Sun, 12 Jan 2025 14:55:13 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (NAM02-DM3-obe.outbound.protection.outlook.com [40.107.95.78])
 by mx.groups.io with SMTP id smtpd.web10.36967.1736693707523365522
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jan 2025 06:55:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=gCwnPpHF;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.95.78, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYFe0qZHU1nkxPpGcwHfshm+TLmcNrG58ZKhY8O6/WaLoRwT/GKMep/J4LLjRe+yZT2qEl5zR0O50TMjVfziRtZC73z1uP0SrLzTb4niz22tsFRFX/S0wyQBVTSWnzIgVBS4lnOw6ThZp7CGFLtcxfDbCtSpmC3PHsNy6vU2bkEqsBJnNVAh/+lHPByF0CgFNz25c1zfI2P5m228qAvBXCpiZ+pUFsUwk+fbWU6xioMugMJdm/gay4EDRTb/VNbV2zpDWegKWu0xb2o4Q9xagOn3jW2iOxUyBileCJUc6UuT/fTfvJFi9xDjn6nVt3Z79G2O7MtE7lamo7dAHV1taQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lsk4kgJ1ksZ+Y74iHHMzcH1UtdjDzfj98m/xjSw6muY=;
 b=W6CMv5wuVuKWmbF3MqNefOyaI3UoennvMRKHuNmoP/CGV4yh/gnSRAzsmP7v0E50e42A7oH7fMC669gLDeioYYlpwMj+p/WSiPcwRG1OBZ5nEjmkvVfhST/P6hZEXhYYQNjqwnorcVNJZj4NNqk9wkLZb/tDZViDtMiSL12J0HIjBnOyamgqwxeatp3XdtDs2KxAoLM5EcxT2b62IzBByEQFXEK2u5vs6S1TjikMypq/eLdblhas/OeIgoTHw28zArwWtheSI713q9vvzt60p/8eP55Ciyc8GyKwgLFGO4TBTgR+OTC9Z546ocGic0pLnA75QplPRg3ivX8e6PWqIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lsk4kgJ1ksZ+Y74iHHMzcH1UtdjDzfj98m/xjSw6muY=;
 b=gCwnPpHFQdhgyNne5ZvybKUObm6WxGPGJDhyuUkjBiELiZP+7Ic/mv7ddXLQrOygsFX54E2FwcKjrYCy2LfzHxODey1Q4V5RdotvxJZRzcxgNPAmmCrHwOLlb4KRpKXVZQcibPd2wPMcghOzpIaN6Xz7RgvB075z283QVwiU6jdo/c29PJbBAxMufrbgm6gDwjIr/FdzKw+d70eH/J39xba1hhsuNedKa5HNrD/AnAPEAWr5PfbDrxrYbKXHHWSkoHYnYIl3cTSQcf7ZCkX5KuqGjViEvMklvLS8jOcM5VGt69M27MhdAJ68d2qmFcJ96HqpDbmOQFIz5rj44fASmQ==
Received: from BN0PR04CA0135.namprd04.prod.outlook.com (2603:10b6:408:ed::20)
 by DS7PR12MB6045.namprd12.prod.outlook.com (2603:10b6:8:86::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Sun, 12 Jan
 2025 14:55:01 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:ed:cafe::97) by BN0PR04CA0135.outlook.office365.com
 (2603:10b6:408:ed::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.17 via Frontend Transport; Sun,
 12 Jan 2025 14:55:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.34) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Sun, 12 Jan 2025 14:55:00 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 12 Jan 2025 07:54:56 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 3/7] devtool: un-globalize 'context' variable and convert it to a dataclass
Date: Sun, 12 Jan 2025 09:53:55 -0500
Message-ID: <20250112145359.607585-4-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250112145359.607585-1-chris.laplante@agilent.com>
References: <20250112145359.607585-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|DS7PR12MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: 4684c7cf-5b6e-42f8-a5e0-08dd33191712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?n4VgL+CxLELems3t4qGIZAUu+Pf1+XvYHjqI/X2d25HeQDelGn+07bVYp4aP?=
 =?us-ascii?Q?QRkVhUp7qUEp+jn7WN1R/N006qcgkA17qMn4cmXdSIbnafARJilpWDw6RAIP?=
 =?us-ascii?Q?TfIEcngM4ZQwUrEn9Sztyl+B6NlBx7REtowiXqwnY7NDiTFM4V/VkzE1pHY5?=
 =?us-ascii?Q?7MqMi9vZ0oZ2lcYIGUw5AwEgPKL0Dvz3h8bf+IuIEg29e6FLUzVU8tTR0VMK?=
 =?us-ascii?Q?9nWkNuHFlYZZpQLP++yaD466ATUaKa6nx47GNmibmCoxa6j3OjY32jjRk3hg?=
 =?us-ascii?Q?TCI+GvJX1rXanv6i74VGmzL8g6NP6qkjMjyLbVqCRiO5WEuej8BTDmKfp/xp?=
 =?us-ascii?Q?ma7k81e8vB+6X3EMjJ2aEXXVdP82rOIHJ8VpDxRFbFSDGhuEoAPR4+tgZePi?=
 =?us-ascii?Q?IeQknXEpGwW5/N3H1NEjEh9tYAjBm9Ek4/0gZQh2KzhY6vtUnKcQpqq3pmZB?=
 =?us-ascii?Q?qzfBsQ+vXSaqbJxnN8LRWma5Z241sfZGA/rIsmt0vCAOjgfNBKZazSHEWd4f?=
 =?us-ascii?Q?CQEbu20K3O4SxOobVfXrngEEPoGtEsMfbtKmQobEiX8uKg9srP1wA1qMEhEc?=
 =?us-ascii?Q?i7oUlZr/HDDjOslsD0+BwJUBTRkSiRq1k617yZMLOErA+DZusKYTpnZpMYdK?=
 =?us-ascii?Q?UJ6qQDpr4SWT7Ezr9A4SaITBcB6zcdd74p+K1Zzvx9dfA14qWLn0AkvprnP8?=
 =?us-ascii?Q?uXdSvC8QSRq7I9EPbN09810fkTz2fMQslUH8oYZXH9hakcZtdBAMf6BE4Tn3?=
 =?us-ascii?Q?lXWPVwgRmJ7UARq4aToOxTZnLr52Vb1N9zPXu1AgfLJODcfTKxsCL9OzC2Nl?=
 =?us-ascii?Q?/yTRdhumeMTsncq6KOr/L2MjG05h1xtZMVOj9BGTiAwN55ZZMq2ObxJofIcQ?=
 =?us-ascii?Q?OYcHn8XBK4DTljAEI0IQlr6EcvzhCPueLuuWQ1F+WHWOA4TV2crT7tVatuAB?=
 =?us-ascii?Q?AuURNxsdEqPG0C2dviZuS2mXVA35/rcXUn2+chMfI1U70lkqQdztpczL2r65?=
 =?us-ascii?Q?kk8FXHrx1ULX8LE264ODaDk93cd73ORQ0oVbUTJ4fJ4LA6opJNaUUCOhTyca?=
 =?us-ascii?Q?92ZgyHZlhUDxGHARJaiCrY4g26JkMAhZ90tHrRDxO78X0eDV1LGc8CYBHrOE?=
 =?us-ascii?Q?cyAq60+gnLsvRnBT0vogyxnxqiBTxICk4MRmQBhY+tTzrk92GgRqSn5rd1QZ?=
 =?us-ascii?Q?3GhISp/33ebqe3fcENaRgWgalSB0cjLL/yBZ0g89loiUDRH5g1nfIm1QZ9Gp?=
 =?us-ascii?Q?aMlO282aHK31W7enIJYP8Iy/yj/4YFj3yu2zVzThVHu6MarjTS+eR0oS1oz6?=
 =?us-ascii?Q?oTCDBvK5ex8P2DrpyKq3H7480ZTeLrU24YTyhy4FL4S7av6AupLDqGD/ND8F?=
 =?us-ascii?Q?rKTwTgjETpLqDvWJgluGJCyGZ4YnWjfFCBQ69E+Q0I8yqQeeiQr+Qz5lY+44?=
 =?us-ascii?Q?Ak14P4xaFFY=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2025 14:55:00.9525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4684c7cf-5b6e-42f8-a5e0-08dd33191712
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 14:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209694

From: Chris Laplante <chris.laplante@agilent.com>

Please excuse the usage of 'typing' slipping in here - it's just how
dataclasses work :/.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 scripts/devtool | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index d7a5903c9f..1ace6fb035 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -7,6 +7,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
=20
+import dataclasses
 import sys
 import os
 import argparse
@@ -15,8 +16,10 @@ import re
 import configparser
 import logging
=20
+# This can be removed once our minimum is Python 3.9: https://docs.python.=
org/3/whatsnew/3.9.html#type-hinting-generics-in-standard-collections
+from typing import List
+
 config =3D None
-context =3D None
=20
=20
 scripts_path =3D os.path.dirname(os.path.realpath(__file__))
@@ -80,12 +83,15 @@ class ConfigHandler:
             self.config_obj.add_section(section)
         self.config_obj.set(section, option, value)
=20
+
+@dataclasses.dataclass
 class Context:
-    def __init__(self, **kwargs):
-        self.__dict__.update(kwargs)
+    fixed_setup: bool
+    config: ConfigHandler
+    pluginpaths: List[str]
=20
=20
-def read_workspace(basepath):
+def read_workspace(basepath, context):
     workspace =3D {}
     if not os.path.exists(os.path.join(config.workspace_path, 'conf', 'lay=
er.conf')):
         if context.fixed_setup:
@@ -210,13 +216,10 @@ def _enable_workspace_layer(workspacedir, config, bas=
epath):
=20
 def main():
     global config
-    global context
=20
     if sys.getfilesystemencoding() !=3D "utf-8":
         sys.exit("Please use a locale setting which supports utf-8.\nPytho=
n can't change the filesystem locale after loading so we need a utf-8 when =
python starts or things won't work.")
=20
-    context =3D Context(fixed_setup=3DFalse)
-
     # Default basepath
     basepath =3D os.path.dirname(os.path.abspath(__file__))
=20
@@ -241,21 +244,23 @@ def main():
     elif global_args.quiet:
         logger.setLevel(logging.ERROR)
=20
+    is_fixed_setup =3D False
+
     if global_args.basepath:
         # Override
         basepath =3D global_args.basepath
         if os.path.exists(os.path.join(basepath, '.devtoolbase')):
-            context.fixed_setup =3D True
+            is_fixed_setup =3D True
     else:
         pth =3D basepath
         while pth !=3D '' and pth !=3D os.sep:
             if os.path.exists(os.path.join(pth, '.devtoolbase')):
-                context.fixed_setup =3D True
+                is_fixed_setup =3D True
                 basepath =3D pth
                 break
             pth =3D os.path.dirname(pth)
=20
-        if not context.fixed_setup:
+        if not is_fixed_setup:
             basepath =3D os.environ.get('BUILDDIR')
             if not basepath:
                 logger.error("This script can only be run after initialisi=
ng the build environment (e.g. by using oe-init-build-env)")
@@ -266,7 +271,6 @@ def main():
     config =3D ConfigHandler(basepath, os.path.join(basepath, 'conf', 'dev=
tool.conf'))
     if not config.read():
         return -1
-    context.config =3D config
=20
     bitbake_subdir =3D config.get('General', 'bitbake_subdir', '')
     if bitbake_subdir:
@@ -299,7 +303,9 @@ def main():
=20
     # Search BBPATH first to allow layers to override plugins in scripts_p=
ath
     pluginpaths =3D [os.path.join(path, 'lib', 'devtool') for path in glob=
al_args.bbpath.split(':') + [scripts_path]]
-    context.pluginpaths =3D pluginpaths
+
+    context =3D Context(fixed_setup=3DFalse, config=3Dconfig, pluginpaths=
=3Dpluginpaths)
+
     for pluginpath in pluginpaths:
         scriptutils.load_plugins(logger, plugins, pluginpath)
=20
@@ -332,7 +338,7 @@ def main():
     try:
         workspace =3D {}
         if not getattr(args, 'no_workspace', False):
-            workspace =3D read_workspace(basepath)
+            workspace =3D read_workspace(basepath, context)
         ret =3D args.func(args, config, basepath, workspace)
     except DevtoolError as err:
         if str(err):
--=20
2.43.0


