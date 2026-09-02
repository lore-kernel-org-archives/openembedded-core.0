Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79651C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 09:59:43 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9250.1788343181439269248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 02:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=YsIGwInh;
 spf=pass (domain: ericsson.com, ip: 52.101.84.45, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsdIjyQnGu5E//fQytiaTn+ET3mqevtOBNSBxkfdwaCB8J4exBNh2y4GeKZviS28oqNQJdzqHW6GoeLF+DRWYDIxtuXXO3qGTX377ghxJ060gTtt1BepShehEecoz+386BXjDEI4CDSDCXyt08vm3Bq7qkrgoF8NsJu0TEKM/wH3LB9TC30vHE8Ql1mMol8BhYyNorcPoMVnpeik1qlxRtS7VAFf36ie3HcW150HVMRErfu9P6To8lZRNf7uA8KNMsYe+VMVPP1HuFIgn5wDZa6YN0u5nf0mfi20IwuqrgfeA2k+owoVCvPNriif91bHffEwqIzE7K4GDW0DVTLzjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZZ4P/2hD1aoqDUwEzKtgFdrnOWGlYlgyZLA8bLkfkM=;
 b=pXbbm4D64eaR2u171dWlvzpG/3IRk1LSoQSuf8eCvSBjbz5iubBRZasAj+jdqqaBJz+uriEIFcOY8a50uIER5FX85mz+C3R5hJpUFcIQQdo+lPnaGaL56kpkw9EEb6JeUEfUmiF013ewJ+XFi/LkYp5zju8DZ/F9h/CV5XH1ApZflRVthuiMtytzxLiVx2Zr6TbmgYXfTj8HRYt326MH+/FPquF3vv8iRDq823M2T7uXkZHqbzZhyA/pTMGuUcfeuKvtp51+H59y1MuJkGzzszpRNgZ2g8l/b3v6zc3VR+CS6CzlyiZXf1EZlQ1fgDOkEkzbhYg8kY+ZAWOcYKqa9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZZ4P/2hD1aoqDUwEzKtgFdrnOWGlYlgyZLA8bLkfkM=;
 b=YsIGwInhR17kcSRjzB9ZCACLyL01mbcIWTecvxmzulXlHzZsPFlqPlSHt1ZRL8poMsuRAglGM6ykpIsJvNCyNBJwoPuRD72uhZ+ey/yVn8WcbXa5IrDqmRHnYLdPb/VUrLire10dyKQwPYfgvS7zFlCUolYRAKaJbJuPgy4KyuOS1WGN+bTBdeTIJtLWxk6cWhv8Z5ebThJvE1paxN2A4kY6OXeKTXnZdat1mV+htANi7RiM//DgIXxrSMb13yn7xj7uy4mEgcDSmMw8rTx+ds8uKnaxWXSILWkM0MK3hhAQyIAxRhFbuQVwFNX8x18Eg717acWvaRHbrXssHEvW7Q==
Received: from AM0PR10CA0012.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::22)
 by AS8PR07MB7783.eurprd07.prod.outlook.com (2603:10a6:20b:352::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 09:59:35 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:208:17c:cafe::15) by AM0PR10CA0012.outlook.office365.com
 (2603:10a6:208:17c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 09:59:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 09:59:33 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 2 Sep 2026 11:59:33 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 685184020B44;
	Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 3EF6B700CF27; Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chen Qi <Qi.Chen@windriver.com>, Antonin Godard
	<antonin.godard@bootlin.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [wrynose][PATCH 02/20] upstream-stable-release-point.bbclass: add bbclass for stable point upgrade
Date: Wed, 2 Sep 2026 11:59:02 +0200
Message-ID: <20260902095920.2840293-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902095920.2840293-1-daniel.turull@ericsson.com>
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009525:EE_|AS8PR07MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: 525d981e-a86a-4cd5-4a4d-08df08d8e3df
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	tfhbSi4I2kRVJdeJfkYRVT/OVgX1Krxv6O0P0MVZj561qeiq1hO1knZdDqG4d0bHNzhAeqoRZ2Nt8oMlWGwDRMMSEPh9H8WJ2kmwYix1KQBHq9kOGHiRQJzFJmt94aDFezUMhVOtLmUdVRrUqaYDFgfS1Z+3V3KQshtOmqksUQnXvhUaW4QXssqY9IdL2/AxkryevVpdIdW42WI2kkuvuGfQClKXhFR4xkNJ97Sr7a+CJwuOCJI4r/h630HJrGKPCtweI8eMYcYLCkz+roIeA/1kXbdL6sIpVTc68qpHN9NJ45bephFWwkeIw7OrhWoGYgGsq1PiUqFcH2KjxKEigzCS7aZtjcLRGCdIjM+8mhX+K+Czsj8/YiRSzyEAFw+RR/bT42t9fX8jH5kfWTLVPKXNM3yYUD5P7lngtGvwBcPVbYa7Zdbgp/9EdjRIELkzjLF38+58ALDdkNamPKZt49w2PZqXictwLT26Sz8QHZnEFHlt70owHkLl+QLawO+scRU3W0fHGN2+e6bZPV9ssE5du10cVwb+PiB9oSwJEMRyXwL1wNEymxQHCVxmu4DW+DlaBOr8I/hOPLVvfBsxnKNPLBaRZRsJTbO6YT+Xgk833WpWeEKLHmTfLLKM3FiJctuZOJkfPHfsbaqZ8pOCGryjgLumOQ5vsyJz89nQN7GYzrDKcJs3BVdhh07tGj7bF6ID6XgsPBr30ZpgqGBQyQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	AUisTLGVOTEeNalHy2nJirr6MBD755Dn2gGXicT/Mp31uyxmDwitFsMTZeCs5tZWfrLcTTeZFqSXEgyu7u1+NtFSfC9KBeXolqri6vV8xsPktxl/UCCzGxyhnph4tExHfyxPGYUHTKb2KLvSXTayzIV95Rj5LJXqdnat1bpHFTd9r15AytaDDo+2A1uEc4FNnMH2G4F3PyUIhG13G8fNy6Z/PrG4DpOfDKAtdjJ2WqXoUp+usXz0peV9HVSJcgKqRxVdOXFWsJ73deBDVmB+z9RTwRK1ODr83odJ+vWDX6Cwwr20+b1Zg5+ASuN3wsH8rhTAVdGGu5FCJRsHW7egklgliULmG1AC/9B1it9e1VsZgsL9i4uadiLYj/osk/KIN7xDi9/34igEzoa2fxtSu0ntz/AkXTJWgg6CkaAHLoV49MWBp8aaxm/dcg80F8l9
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 09:59:33.8105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 525d981e-a86a-4cd5-4a4d-08df08d8e3df
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7783
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 09:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244921

From: Chen Qi <Qi.Chen@windriver.com>

If a recipe can do stable version upgrade and the stable parts of the versi=
on
is seperated by '.', then it can inherit this bbclass.

By default, the stable parts number is 2, which means the following upgrade=
s
are stable version upgrades:
x.y.z -> x.y.z+1
x.y.z+1 -> x.y.z+1.zz
x.y.z+1.zz -> x.y.z+2

Recipes that have different stable version parts can also inherit this bbcl=
ass
and set STABLE_VERSION_PARTS. For example, systemd sets this variable to "1=
".

For recipes whose stable version part is not separated by '.', they should =
not
inherit this bbclass and intead set UPSTREAM_STABLE_RELEASE_REGEX themselve=
s.
For example, openssh's stable part is separted by 'p' and should not inheri=
t
this bbclass.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit a1e069d04cb13e990b362804bd56a4935338ef96)
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../upstream-stable-release-point.bbclass     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/classes-recipe/upstream-stable-release-point.bbcla=
ss

diff --git a/meta/classes-recipe/upstream-stable-release-point.bbclass b/me=
ta/classes-recipe/upstream-stable-release-point.bbclass
new file mode 100644
index 0000000000..98fdb5b808
--- /dev/null
+++ b/meta/classes-recipe/upstream-stable-release-point.bbclass
@@ -0,0 +1,21 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+#
+# This bbclass is expected to be inherited by recipes explicitly.
+# If a recipe's version is separated by point and we know for sure
+# which parts of the version represent the stable part, then the
+# recipe could inherit this bbclass.
+#
+
+STABLE_VERSION_PARTS ?=3D "2"
+def get_majmin_version_regex(d):
+    pv =3D d.getVar('PV')
+    stable_parts =3D pv.split('.')[:int(d.getVar('STABLE_VERSION_PARTS'))]
+    return r'\.'.join(stable_parts)
+
+STABLE_VERSION_REGEX =3D "${@get_majmin_version_regex(d)}"
+UPSTREAM_STABLE_RELEASE_REGEX ?=3D "^${STABLE_VERSION_REGEX}(\.\d+)*$"

