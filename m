Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F8FEC25B7B
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 13:57:25 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.92])
 by mx.groups.io with SMTP id smtpd.web10.20304.1716299840648524927
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 06:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=O5AVYdaz;
 spf=pass (domain: topic.nl, ip: 40.107.21.92, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmVxOx1MEbW+2iMR/6VegHe2pHBVmlr0B9B9e5ZrnIJbQiZczd1YW00BhGdPYwBdP5J4SoxCL0M5NHiT+Jf6IJODxfIlkqKqs8XIzF/zaIHA81t54taUPghTqlSvORKzB0zw1mVPp814DSSoB/W/tOn7D8tsOkRs+FjPyGhzBD6ONATAvtu+8cf6LVNn45wuP+LDtIBN9duwI2cDYkF6mziwZmfVB5LfqST7HWTQPA941i7DoxhULgPkigv6vqzm+F1bAfz5HymSSxBFqzINK8DRTujkSyX+zUnRbfy+ZD03vBz1XaO1x30DGVa0YRTwHMmoCc8kGcfinmNVwYUYBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7hIEZsC0F/4brZ9qFgVL25QPPX6lAQvkRW53tTbJlo=;
 b=aHCl/i4N4Fu+ztPQUukPeaZHifLJoabBwO71PHGOysC5Iws8SHZ110RZeD6B9KErMPKzaFEaXNkGEpRAO9V3N6b1CkiVnsEMKlcAiBbr/qQ468S1BJRMxaiajlG1+/MTHuKtU6a2sOWBAdI14E4yC/xe3zl60SZrYz1djxZeBsOMthIVhthxpUBq3vLReiWh8RgzmxcotAp+a+eXIfA+nVlewLEWS73HVkQukHhhlum6TrZSkHCLIpuTHM79AROKRnrYOASBCOjg+pqtAGGlyfj9HvnunTBpIqQqG26pNoizzESBAqrIEfh1U28s9GvrRJ2xb95uWKKtz9xtQ1q8GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7hIEZsC0F/4brZ9qFgVL25QPPX6lAQvkRW53tTbJlo=;
 b=O5AVYdazSsQG9BLPnZNOVIS+R4R5vbR1SxtSn23L2cQAvTMkfVMfHWXln6bMtXu84aTv3AiBIoHCH/x/Rfo5KcGYhI2m2Poxf2kzEfCJtxR/a7z4VTul/IMAcPav6meQ69OiPTjrsLDzEfDw/pEw1OOL6bP0nRV9/lW8efgM2Pzy78YwMC/8xUU9sTO+i5cMhCn8JfIRLubbMfQe+fT+kS7wd76bviBnMBBRfbl/7+iF2YBMLvSaiT5R53IdjaBCbwOwyNJ9sQOlWeYtgRnAbyZrrVf5s5RoR3RYnS2W14WlimzO2ym0E7nC+bOrGKGcTl2xdNmqxXLqp41i+y9vSg==
Received: from DUZPR01CA0275.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::6) by DB9PR04MB8493.eurprd04.prod.outlook.com
 (2603:10a6:10:2c5::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 13:57:16 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::dd) by DUZPR01CA0275.outlook.office365.com
 (2603:10a6:10:4b9::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Tue, 21 May 2024 13:57:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 13:57:15 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (104.47.51.169) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Tue, 21 May 2024 13:57:14 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by AM8PR04MB7842.eurprd04.prod.outlook.com (2603:10a6:20b:245::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 13:57:10 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%4]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 13:57:10 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
CC: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] meta: uboot-config: Fix broken menuconfig for "fitImage" kernel
Date: Tue, 21 May 2024 15:57:05 +0200
Message-ID: <20240521135705.444470-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0042.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::16) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR04MB8644:EE_|AM8PR04MB7842:EE_|DB5PEPF00014B9B:EE_|DB9PR04MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: d2e582a4-e37b-4ec6-4c41-08dc799dec24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|1800799015|366007|376005|52116005|38350700005;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?tKgWNpwbc3Ytep2ob5IA6g1zD3/QCd58l01aJS9N8AJOtDBVdOmn+jiRXcVR?=
 =?us-ascii?Q?Eko4CbOUUzbAI/sVzkpQootTjSk3vIHub5Un5PbIYTbIXd08cAvHBXDMCgVY?=
 =?us-ascii?Q?KIo1T1oy8fFR0bAHEX7Z+QpJToRQ4SVOJOfBgO5jMrE36jQu+efRTDfFPoy3?=
 =?us-ascii?Q?PMDoo+R3ivzPAs/ZGQFLMz+SFzSfjIxPTQ8NgkQP2GxSrwvvHKY6SUTCnvlQ?=
 =?us-ascii?Q?qUL1BDRNIiU62AoNiEVIKoxQX+pHzB5x5aLaB0eSZ1z5CNowEG9mNnbu0cfd?=
 =?us-ascii?Q?qyNsBgqiRmYPtSGcvjdntGYniCG4iQWxEvwwzlj/gLiv7xHeI38ynl1rHpEk?=
 =?us-ascii?Q?Fp/dUmms2ivE4hmbIRUrGDdc6+qpJbeZo9XvcGPoKrxcPjbvjPaoh5OKY8Ui?=
 =?us-ascii?Q?DeqJB2JvVRUQFX5bGi91Zc6E91HpACBzejDyT/aziq5AJQC70/k9MGSPpHJt?=
 =?us-ascii?Q?C+YuTTruoi7uHxkl3X618//yF21mbLMk0W3/Gr/2/+5rro1yuivx3UtUrPYs?=
 =?us-ascii?Q?4MAOvvoIW9So6wHTuw8w5kHQ0KrSrO3KC3SNotX+2a3626rpYXXl2cTLT6Vo?=
 =?us-ascii?Q?dlP76vbpc/uVKSKZg+dIICYoQ5L/tamiDP865sH/9SoQ5T+sQmHo9ZgIBMWo?=
 =?us-ascii?Q?sLAKF62U1zMrJAnVM271wtgfHQ3DzwfeAy/4Ir7InhytqYfIQdzMaisftx7P?=
 =?us-ascii?Q?+TAO+mXBHduymeFJvG91VenrKgr1qvC9NMP01x2aW6G6qbAGmvDfa3u5RQAY?=
 =?us-ascii?Q?fIVtrurDLj+tFoEujZjJ9KEV8JXjzol7FDtNb7L1j102fJecf8D3z17T3khu?=
 =?us-ascii?Q?yqib248KGcyWVP1K8NTbvd9b+e2XD4TVi5eJq12cmJ82u+92lM3nVYayCckg?=
 =?us-ascii?Q?UaDX4fZE6uoqtUe1vg4s/kx354hZ2elw+dm2ErIl6sMo3iXNb8r5vIIbFxRD?=
 =?us-ascii?Q?qRvjX9jj5z8GMgiggs/wZW6OEnA5apXJnz7EY4xi1T6DmwZloEzQ8CIrjtWD?=
 =?us-ascii?Q?XoG+7cCpPKQNM823f4SibMAAt4l68QxJaY9PsFRDR7gd3M5tAnXfm7HW1AlD?=
 =?us-ascii?Q?CL4CDTVIaN4qgyUa/wqwSmDou/JUOYqhFq6c6YtSlCYZnz7JxabZCYD6nHtF?=
 =?us-ascii?Q?pP1lU2Fq2rO4qkt8YvsRrYoPtoHuYEHfuLYEWxAM9tulapMnAMZqr2iFtmFV?=
 =?us-ascii?Q?h7IhWZ+xSB18ruIapHKNXjBFoTsR28i+tJqS53SOBsPEiFQ2abBWFXmqXEOh?=
 =?us-ascii?Q?wj54xVESTNzuMeuD/jtjK/X+X56PASB2Ep8YyNMFaOmF9/3kNtNhqaOsy4vI?=
 =?us-ascii?Q?qHeuU2ZavQGZfint2L891kR0NRf4sVMYleyIagizPw+fGw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7842
X-CodeTwo-MessageID: 22c967b1-ef3f-4006-ba9e-a10030eb8876.20240521135714@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.cc544a93-e646-4932-8496-82717a21cde8@emailsignatures365.codetwo.com>
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f18e042e-9510-43d5-6bcb-08dc799de90a
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|1800799015|376005|35042699013|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EPcvhhj7CuBIeIka15zJjXkeJGLlNMKS5ZGFRzLfaOrmycCAcOE9dAYfB9Pa?=
 =?us-ascii?Q?eK+MqWVOqKJ1E+MzgfpeXd09FsC1rkr/QcTCVhHzkra5A+dCH8Cl8Uey4a11?=
 =?us-ascii?Q?O5X280UULxQRq/sq446itx16ijbnbY/d2uDDjYPZdzLSUCTRSs1+BZ9L4xcO?=
 =?us-ascii?Q?SlXdz7pf6x0HUbc+Fd7TNnPDzTi0l66o7hYxC0cGT6s9BS+W0qsgmqCLsJiK?=
 =?us-ascii?Q?tR5daEM6II6MOgB7FR28DzT/ecmA67Yo1S++ZNZe4X/4xv4DLP44geqJAQSo?=
 =?us-ascii?Q?sFHX0EM5iv+sdazmM2uy0aVm/CFnCVtIITAwcZ2YBWXU+DyBBa77KssY52kI?=
 =?us-ascii?Q?4gYZzzyRwwnt4Z9wG0oQFlT8m2bMW4KmmtoJxRhumQVxnxI5fKW6AZjyfF+Y?=
 =?us-ascii?Q?MZkarDqE02ZA8lrOZ2xyJrDV0aVCfGyQUEFkWB83tzF0c1vK3lEL1ItJ0vzT?=
 =?us-ascii?Q?S0FpTcR4TbnozIYMe3l5PK0a1Qx5/hh6fWUMxCNb6XLSid+sHLhK+0RYpG3V?=
 =?us-ascii?Q?WpiKTXrjTz8rKghenIMf8XWZf77qFF5+Ctf13wRwYb2yY1ELAqWqtFqrDc0s?=
 =?us-ascii?Q?/0fa53kQiviBXa/PjMY5oe4jB6SGU6I8qJHIbSbJ3x7tC7NQvzc9Ns5Pkr2P?=
 =?us-ascii?Q?j+uajTcbjl+kX34ZuriAa2pRPkWhr2GjxqOohTqzFlCMlth69j3fhD2kvgXK?=
 =?us-ascii?Q?GxhF69y2Bo08dWusnrCws/aZZZ0jzX50TWcDpYGkKC1UQvOYL9dCLXVF0R+k?=
 =?us-ascii?Q?CMjPwMSIpECX0EaMKEUB/2T/dZzVhJ4DXxDd3f0PF3EhLGg8dGVuSDSWQ4GI?=
 =?us-ascii?Q?ZL+UEHrpsOCHkIPtly90ZM1LI8R/lRw+Is5p+grqWYxWR6XHxBF3IgBBUnZc?=
 =?us-ascii?Q?QgHA/DqY9gABEBRbjw7o1KIZdVSLa2MGoXTyfIXNK6DWAiiJUvcfwpCFvx+w?=
 =?us-ascii?Q?m267UNlF05iwcdfJvFEFyOiM2Bmj9pHTtdhMv8OlVgtM4wII4pzfIwBVB6h4?=
 =?us-ascii?Q?R/uQJ0b7oOJWPrtnhQ5co8kV/qqHspqOdIzDvgjN3kAUiIYmAAS0uZZJDtUQ?=
 =?us-ascii?Q?3FScVlQXqcvYvLlQALEgRYipevuw1XQx3GHRsqg3GgDhf+Kq5nXqSQhyE5e9?=
 =?us-ascii?Q?3quhqSub+buJMfNEXb+W+n2eltM5AOV4Ojkp/K45mPr5qmHhPnDGlyUkvF3+?=
 =?us-ascii?Q?x0jdcs/IFoCpoALSGg6n5tMiOgrOOM1NXP81A3s4+nXPwI7jiyJ+pu69vdwV?=
 =?us-ascii?Q?DFsVT3fnqaLGuic0qBx8aEzRX29u4KkZdUHoOg832f9kgiNQdKDwAd4J4tAB?=
 =?us-ascii?Q?Ewt6nOk5+19s0R4VMq6GcbUl?=
X-Forefront-Antispam-Report: 
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(35042699013)(82310400017);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 13:57:15.7927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e582a4-e37b-4ec6-4c41-08dc799dec24
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 13:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199643

kernel-fitimage inherited uboot-config, which resulted in failure to
run "menuconfig" on a system that has both multiple u-boot configs and
wants a fitImage kernel.

Fix the issue by splitting up uboot-config into uboot-config-vars that
only contains the "harmless" variable settings, and inherit that in a
new uboot-config class which contains the Python code to do the U-boot
specific settings. Inherit only uboot-config-vars in kernel-fitimage
so that it has what it needs but doesn't break.

Fixes: f9e834e31788 "meta: introduce KCONFIG_CONFIG_ENABLE_MENUCONFIG"
Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/classes-recipe/kernel-fitimage.bbclass   |  2 +-
 meta/classes-recipe/uboot-config-vars.bbclass | 95 +++++++++++++++++++
 meta/classes-recipe/uboot-config.bbclass      | 80 +---------------
 3 files changed, 97 insertions(+), 80 deletions(-)
 create mode 100644 meta/classes-recipe/uboot-config-vars.bbclass

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-rec=
ipe/kernel-fitimage.bbclass
index 4b74ddc201..070a822b43 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
-inherit kernel-uboot kernel-artifact-names uboot-config
+inherit kernel-uboot kernel-artifact-names uboot-config-vars
=20
 def get_fit_replacement_type(d):
     kerneltypes =3D d.getVar('KERNEL_IMAGETYPES') or ""
diff --git a/meta/classes-recipe/uboot-config-vars.bbclass b/meta/classes-r=
ecipe/uboot-config-vars.bbclass
new file mode 100644
index 0000000000..5714ace579
--- /dev/null
+++ b/meta/classes-recipe/uboot-config-vars.bbclass
@@ -0,0 +1,95 @@
+# Handle U-Boot config for a machine
+#
+# The format to specify it, in the machine, is:
+#
+# UBOOT_CONFIG ??=3D <default>
+# UBOOT_CONFIG[foo] =3D "config,images,binary"
+#
+# or
+#
+# UBOOT_MACHINE =3D "config"
+#
+# Copyright 2013, 2014 (C) O.S. Systems Software LTDA.
+#
+# SPDX-License-Identifier: MIT
+
+
+def removesuffix(s, suffix):
+    if suffix and s.endswith(suffix):
+        return s[:-len(suffix)]
+    return s
+
+UBOOT_ENTRYPOINT ?=3D "20008000"
+UBOOT_LOADADDRESS ?=3D "${UBOOT_ENTRYPOINT}"
+
+# Some versions of u-boot use .bin and others use .img.  By default use .b=
in
+# but enable individual recipes to change this value.
+UBOOT_SUFFIX ??=3D "bin"
+UBOOT_BINARY ?=3D "u-boot.${UBOOT_SUFFIX}"
+UBOOT_BINARYNAME ?=3D "${@os.path.splitext(d.getVar("UBOOT_BINARY"))[0]}"
+UBOOT_IMAGE ?=3D "${UBOOT_BINARYNAME}-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFI=
X}"
+UBOOT_SYMLINK ?=3D "${UBOOT_BINARYNAME}-${MACHINE}.${UBOOT_SUFFIX}"
+UBOOT_MAKE_TARGET ?=3D "all"
+
+# Output the ELF generated. Some platforms can use the ELF file and direct=
ly
+# load it (JTAG booting, QEMU) additionally the ELF can be used for debugg=
ing
+# purposes.
+UBOOT_ELF ?=3D ""
+UBOOT_ELF_SUFFIX ?=3D "elf"
+UBOOT_ELF_IMAGE ?=3D "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}"
+UBOOT_ELF_BINARY ?=3D "u-boot.${UBOOT_ELF_SUFFIX}"
+UBOOT_ELF_SYMLINK ?=3D "u-boot-${MACHINE}.${UBOOT_ELF_SUFFIX}"
+
+# Some versions of u-boot build an SPL (Second Program Loader) image that
+# should be packaged along with the u-boot binary as well as placed in the
+# deploy directory.  For those versions they can set the following variabl=
es
+# to allow packaging the SPL.
+SPL_SUFFIX ?=3D ""
+SPL_BINARY ?=3D ""
+SPL_DELIMITER  ?=3D "${@'.' if d.getVar("SPL_SUFFIX") else ''}"
+SPL_BINARYFILE ?=3D "${@os.path.basename(d.getVar("SPL_BINARY"))}"
+SPL_BINARYNAME ?=3D "${@removesuffix(d.getVar("SPL_BINARYFILE"), "." + d.g=
etVar("SPL_SUFFIX"))}"
+SPL_IMAGE ?=3D "${SPL_BINARYNAME}-${MACHINE}-${PV}-${PR}${SPL_DELIMITER}${=
SPL_SUFFIX}"
+SPL_SYMLINK ?=3D "${SPL_BINARYNAME}-${MACHINE}${SPL_DELIMITER}${SPL_SUFFIX=
}"
+
+# Additional environment variables or a script can be installed alongside
+# u-boot to be used automatically on boot.  This file, typically 'uEnv.txt=
'
+# or 'boot.scr', should be packaged along with u-boot as well as placed in=
 the
+# deploy directory.  Machine configurations needing one of these files sho=
uld
+# include it in the SRC_URI and set the UBOOT_ENV parameter.
+UBOOT_ENV_SUFFIX ?=3D "txt"
+UBOOT_ENV ?=3D ""
+UBOOT_ENV_SRC_SUFFIX ?=3D "cmd"
+UBOOT_ENV_SRC ?=3D "${UBOOT_ENV}.${UBOOT_ENV_SRC_SUFFIX}"
+UBOOT_ENV_BINARY ?=3D "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
+UBOOT_ENV_IMAGE ?=3D "${UBOOT_ENV}-${MACHINE}-${PV}-${PR}.${UBOOT_ENV_SUFF=
IX}"
+UBOOT_ENV_SYMLINK ?=3D "${UBOOT_ENV}-${MACHINE}.${UBOOT_ENV_SUFFIX}"
+
+# U-Boot EXTLINUX variables. U-Boot searches for /boot/extlinux/extlinux.c=
onf
+# to find EXTLINUX conf file.
+UBOOT_EXTLINUX_INSTALL_DIR ?=3D "/boot/extlinux"
+UBOOT_EXTLINUX_CONF_NAME ?=3D "extlinux.conf"
+UBOOT_EXTLINUX_SYMLINK ?=3D "${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}-${PR}"
+
+# Options for the device tree compiler passed to mkimage '-D' feature:
+UBOOT_MKIMAGE_DTCOPTS ??=3D ""
+SPL_MKIMAGE_DTCOPTS ??=3D ""
+
+# mkimage command
+UBOOT_MKIMAGE ?=3D "uboot-mkimage"
+UBOOT_MKIMAGE_SIGN ?=3D "${UBOOT_MKIMAGE}"
+
+# Signature activation - this requires KERNEL_IMAGETYPE =3D "fitImage"
+UBOOT_SIGN_ENABLE ?=3D "0"
+
+# Arguments passed to mkimage for signing
+UBOOT_MKIMAGE_SIGN_ARGS ?=3D ""
+SPL_MKIMAGE_SIGN_ARGS ?=3D ""
+
+# Options to deploy the u-boot device tree
+UBOOT_DTB ?=3D ""
+UBOOT_DTB_BINARY ??=3D ""
+
+# uboot-fit_check_sign command
+UBOOT_FIT_CHECK_SIGN ?=3D "uboot-fit_check_sign"
+
diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe=
/uboot-config.bbclass
index e55fc38b7c..79e6093b6a 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -13,85 +13,7 @@
 #
 # SPDX-License-Identifier: MIT
=20
-
-def removesuffix(s, suffix):
-    if suffix and s.endswith(suffix):
-        return s[:-len(suffix)]
-    return s
-
-UBOOT_ENTRYPOINT ?=3D "20008000"
-UBOOT_LOADADDRESS ?=3D "${UBOOT_ENTRYPOINT}"
-
-# Some versions of u-boot use .bin and others use .img.  By default use .b=
in
-# but enable individual recipes to change this value.
-UBOOT_SUFFIX ??=3D "bin"
-UBOOT_BINARY ?=3D "u-boot.${UBOOT_SUFFIX}"
-UBOOT_BINARYNAME ?=3D "${@os.path.splitext(d.getVar("UBOOT_BINARY"))[0]}"
-UBOOT_IMAGE ?=3D "${UBOOT_BINARYNAME}-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFI=
X}"
-UBOOT_SYMLINK ?=3D "${UBOOT_BINARYNAME}-${MACHINE}.${UBOOT_SUFFIX}"
-UBOOT_MAKE_TARGET ?=3D "all"
-
-# Output the ELF generated. Some platforms can use the ELF file and direct=
ly
-# load it (JTAG booting, QEMU) additionally the ELF can be used for debugg=
ing
-# purposes.
-UBOOT_ELF ?=3D ""
-UBOOT_ELF_SUFFIX ?=3D "elf"
-UBOOT_ELF_IMAGE ?=3D "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}"
-UBOOT_ELF_BINARY ?=3D "u-boot.${UBOOT_ELF_SUFFIX}"
-UBOOT_ELF_SYMLINK ?=3D "u-boot-${MACHINE}.${UBOOT_ELF_SUFFIX}"
-
-# Some versions of u-boot build an SPL (Second Program Loader) image that
-# should be packaged along with the u-boot binary as well as placed in the
-# deploy directory.  For those versions they can set the following variabl=
es
-# to allow packaging the SPL.
-SPL_SUFFIX ?=3D ""
-SPL_BINARY ?=3D ""
-SPL_DELIMITER  ?=3D "${@'.' if d.getVar("SPL_SUFFIX") else ''}"
-SPL_BINARYFILE ?=3D "${@os.path.basename(d.getVar("SPL_BINARY"))}"
-SPL_BINARYNAME ?=3D "${@removesuffix(d.getVar("SPL_BINARYFILE"), "." + d.g=
etVar("SPL_SUFFIX"))}"
-SPL_IMAGE ?=3D "${SPL_BINARYNAME}-${MACHINE}-${PV}-${PR}${SPL_DELIMITER}${=
SPL_SUFFIX}"
-SPL_SYMLINK ?=3D "${SPL_BINARYNAME}-${MACHINE}${SPL_DELIMITER}${SPL_SUFFIX=
}"
-
-# Additional environment variables or a script can be installed alongside
-# u-boot to be used automatically on boot.  This file, typically 'uEnv.txt=
'
-# or 'boot.scr', should be packaged along with u-boot as well as placed in=
 the
-# deploy directory.  Machine configurations needing one of these files sho=
uld
-# include it in the SRC_URI and set the UBOOT_ENV parameter.
-UBOOT_ENV_SUFFIX ?=3D "txt"
-UBOOT_ENV ?=3D ""
-UBOOT_ENV_SRC_SUFFIX ?=3D "cmd"
-UBOOT_ENV_SRC ?=3D "${UBOOT_ENV}.${UBOOT_ENV_SRC_SUFFIX}"
-UBOOT_ENV_BINARY ?=3D "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
-UBOOT_ENV_IMAGE ?=3D "${UBOOT_ENV}-${MACHINE}-${PV}-${PR}.${UBOOT_ENV_SUFF=
IX}"
-UBOOT_ENV_SYMLINK ?=3D "${UBOOT_ENV}-${MACHINE}.${UBOOT_ENV_SUFFIX}"
-
-# U-Boot EXTLINUX variables. U-Boot searches for /boot/extlinux/extlinux.c=
onf
-# to find EXTLINUX conf file.
-UBOOT_EXTLINUX_INSTALL_DIR ?=3D "/boot/extlinux"
-UBOOT_EXTLINUX_CONF_NAME ?=3D "extlinux.conf"
-UBOOT_EXTLINUX_SYMLINK ?=3D "${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}-${PR}"
-
-# Options for the device tree compiler passed to mkimage '-D' feature:
-UBOOT_MKIMAGE_DTCOPTS ??=3D ""
-SPL_MKIMAGE_DTCOPTS ??=3D ""
-
-# mkimage command
-UBOOT_MKIMAGE ?=3D "uboot-mkimage"
-UBOOT_MKIMAGE_SIGN ?=3D "${UBOOT_MKIMAGE}"
-
-# Signature activation - this requires KERNEL_IMAGETYPE =3D "fitImage"
-UBOOT_SIGN_ENABLE ?=3D "0"
-
-# Arguments passed to mkimage for signing
-UBOOT_MKIMAGE_SIGN_ARGS ?=3D ""
-SPL_MKIMAGE_SIGN_ARGS ?=3D ""
-
-# Options to deploy the u-boot device tree
-UBOOT_DTB ?=3D ""
-UBOOT_DTB_BINARY ??=3D ""
-
-# uboot-fit_check_sign command
-UBOOT_FIT_CHECK_SIGN ?=3D "uboot-fit_check_sign"
+inherit uboot-config-vars
=20
 python () {
     ubootmachine =3D d.getVar("UBOOT_MACHINE")
--=20
2.34.1


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=

