Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE13C3ABDA
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 01:25:55 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.43])
 by mx.groups.io with SMTP id smtpd.web11.3461.1747272351110839759
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 18:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=ZbXK5xIi;
 spf=pass (domain: ericsson.com, ip: 40.107.22.43, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U97p5OfAYJQyrxBqjtNfOKG+txmFNUGDMboJz6PtUYja/24gGOhKi88GFgF7xdjw+uFoPLbc+OMXhUpVqW49VwakZIDO5bHufaCMPGQvgd5m42dcIO/waV0VI9FqvCgHkqMdoTFEpoiHJkBuCCm3H3gWC8CF4MzzVTc2JpqlFQnx9mJUIwNnztobUOR2GJvQu0HZXqNuUTG+bo+yzCmJywdo7Ey/Qqi+0TEulOIbarnHh3joseNPLoAiIMVF43bHSytN+7hjaWwlufF9wmDdWBPqWfL08J1DtnoK4RI4EJ1F5ZJG3Pq+5FIbARlh4mLgRL3ke3SI+lITHaTwwjRyIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0XZBT+CcBsku8vVTZ1kS3EbkLEq6kMOnnbdoJkkKcc=;
 b=mHnapQGFKXr2/pH/BdvwokmgGnmttfdoal+k6HO1rhI9jUydTwDH2gVL+wv4vX/CraZM2uhHUOhlezYLsUqz/Bp0YxbCoWrqW35InUU/ba1V7BSloJDRlDzYhhyph/F5sFeRuAO/YEeRWym57SmfHlTSZarbos6tGkvH7ONPMu0eGQzL5j30VtBVAiS/cmG4f/YooYcAWvkliafV+GJ/tecw+3pFy0qxqyq28s/n0ua7FSrxYIQrMf8hzeAtCZ89YF7kt+0Wqi4mgB5iJl2ihHnjWfMJ1rEStDBOMVsqk7MQUvEbLAc57olv6GsH7E5Zj9YMqOABGFz6qXXYU8Sxvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0XZBT+CcBsku8vVTZ1kS3EbkLEq6kMOnnbdoJkkKcc=;
 b=ZbXK5xIif1AI2LAe78Yj+uPCBfBpk0H2RbLKphwUVjQsYYajWs6t63W+xvqPecjJPLSNj6fiN7pxmwEkFB8+31FEmYRmGKjt6U2Hut4U7AucDR/G88QyAL9MTpgCQtihfzrGHzxyj3GW1BK9IFclfKk5uf38huOC1yRegvVfbLOJ1GZ6JQs+PS0eKIRoG723ck1Q1xH3+2LVbfOoQOMRuoj/wphfjJQ4vOYv4iF6VL1ZEAkWTphY6RKH8wA/4LwIpJLRISltFmR5IW9DPd06VAkhpnjz2TAcy3MIr2Er7VH15w59DmVWJLH4TF4xANNfPTr4OF9bJ057fjTLe/B3nw==
Received: from DB8PR06CA0024.eurprd06.prod.outlook.com (2603:10a6:10:100::37)
 by DB9PR07MB7098.eurprd07.prod.outlook.com (2603:10a6:10:1fa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 01:25:43 +0000
Received: from DU2PEPF00028D03.eurprd03.prod.outlook.com
 (2603:10a6:10:100:cafe::94) by DB8PR06CA0024.outlook.office365.com
 (2603:10a6:10:100::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Thu,
 15 May 2025 01:25:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF00028D03.mail.protection.outlook.com (10.167.242.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 01:25:43 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 03:25:35 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 82B8B410FCB1;
	Wed, 14 May 2025 14:57:28 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 6AB6F70E61C0; Wed, 14 May 2025 14:57:28 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Marta Rybczynska
	<rybczynska@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, "Peter
 Marko" <peter.marko@siemens.com>
Subject: [PATCH v4 2/3] kernel: add support to extract compiled files
Date: Wed, 14 May 2025 14:57:05 +0200
Message-ID: <20250514125706.495571-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514125706.495571-1-daniel.turull@ericsson.com>
References: <20250514125706.495571-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D03:EE_|DB9PR07MB7098:EE_
X-MS-Office365-Filtering-Correlation-Id: b1aae62b-09d2-4f55-9a75-08dd934f693b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0WaPxyk6VmYRwfckc6nEJKFtgUY+QWHfLxsUROIKQDqT8fQio/AQKecfsRjO?=
 =?us-ascii?Q?/tABDiN+CHx8rahcX1MmCUO4uQ++sYDeYLVaggGHnq0FQgNjdeKl33XJlrdc?=
 =?us-ascii?Q?JuLjgvh837ua1eFQbKOrqPe9ktz1zQmkTr0/5vjeUDEgN1cOReikZmb8Jg7e?=
 =?us-ascii?Q?Bf0jyvoP6QPQOlPH4Iaq6j0AB2Dh6GVCdnpIeVUClEChE2GWpiPO3dXUg4wu?=
 =?us-ascii?Q?f+EQblNIXM7wbbMiRk46nMJ/e06vInh5DLw9UgRwuFc2ZpdMFVOLqzLnhIsg?=
 =?us-ascii?Q?pAsSt7MNWYEvIkUKjopQx2tmB0mxqJUdUKYeZTjYQ7pEC8olsTFLq4X5kPMf?=
 =?us-ascii?Q?gQobcKsS72Y8tdSJRQOqLuLq668d8q/x8ASWKj3LVmIz9JHUcEcc84FH7X2A?=
 =?us-ascii?Q?g+ABMsitq8VHCpw6FhR/KdI9PRg7DrY117x3aTsTMIgPMAIqW6p/M0KgasFO?=
 =?us-ascii?Q?WrY80NcEh10R1QVG4Rwa79RUfk+846NdjFsOkW2GsnQUc5yl1Eiino63VOL4?=
 =?us-ascii?Q?KxeIR8JcPzy+M+TH2xTGdaViUD2QENTTGqbqGJFj/iYiTcFvToTzKHpyGm/f?=
 =?us-ascii?Q?VmB2yJjNdNKTBFNYd/cEbGe+iBVBkUZZ6Xx0/IQS/3Z9uIw6NkVANXk3S/lu?=
 =?us-ascii?Q?J7otAYKLaaorD5OdZO58Ug/8Ur89Q8FtbjBZeeDMf4FgU/ZS5j6AHJ/kEP5b?=
 =?us-ascii?Q?YwH4/Himaqjc74tqsJ3Y+YJbK/xGsnC8gTHyUCAO6WcC+IAFxv4B2iVIJXVM?=
 =?us-ascii?Q?Jcn3LhyqNDyHhrGC/CoBgOT0OxnSKdPoKGDt70SWNEHd0CLIqsbTULzmnfFq?=
 =?us-ascii?Q?D3UIlm1aGf3QWZzccUat3E5rnbkutPSx9g97RdJuLxIlv2eyxHbEq2Of8Xvt?=
 =?us-ascii?Q?js4Lx5brsHMby4EapNt0LvJXRrqAr6K75773QH5NjhPei1oJU7aMW5yLwaPd?=
 =?us-ascii?Q?bpaCfFloBzqCB/+tQq34Pf0e1Hm5YjWyZxevBlTwrG3UTHazLDCSEvVDH3Cj?=
 =?us-ascii?Q?x2nqmTkYN1LcIDYiJ9XY5BOrcp2Ic2EvUclkfyp2oV/u9FsStaW0SSEb5Yan?=
 =?us-ascii?Q?ng/+m4VCdcNGsF/7nSvsx5woVokAPqHSjtnvLzCVCB6Q02OVA7lFelpE0jU5?=
 =?us-ascii?Q?eVQvaEHk6N4cI99ptiKYyjKzyqhZ9XzKtwQfgDvCKzjr2JI8BVgoyy9DZUHD?=
 =?us-ascii?Q?7FDwoSu03/kE6uR/wCpdXj2aGvfL9u9F5jJEC4Eg5Ek74DtD9MnQJoOLX5uh?=
 =?us-ascii?Q?Oru2nm7nkG07ssxz5QE9FhbgZMHvQXxmaYaNbuTG72pkz6nJkQSCu1SOyVAN?=
 =?us-ascii?Q?EF3NZHOS9Spb7GzHHN05GZZQSnc8Pkb6F0lkzox8qRrUGcwPSybOIGixIbZ+?=
 =?us-ascii?Q?E3mbcE3LwmR+T92InilEn/UeUPtD0x946h0p2BRc17YSKwVHgECmC7Ei/bKX?=
 =?us-ascii?Q?W10uTxqrJV3SLDkQXcFCIyhxi9iW+eb6F/u/any4xUu48oJyJ1jEfoDPmo7h?=
 =?us-ascii?Q?DOkJZ82wfNXyVJ2AN1/ZUldS/P/XjgweCnHk?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 01:25:43.2825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1aae62b-09d2-4f55-9a75-08dd934f693b
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB7098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 01:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216564

From: Daniel Turull <daniel.turull@ericsson.com>

Use gen_compile_commands.py to extract files used during compilation
for the used kernel configuration.

To enable set SPDX_INCLUDED_COMPILED_SOURCES=3D"1"

The location can be controlled with KERNEL_FILES_DIR

CC: Marta Rybczynska <rybczynska@gmail.com>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/classes-recipe/kernel.bbclass | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass
index 36ce659762..acef8b86ce 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -159,6 +159,9 @@ set -e
     image_task =3D d.getVar('INITRAMFS_TASK')
     if image_task:
         d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
+    if d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") =3D=3D "1":
+        bb.build.addtask('do_save_compiled_files', 'do_build', 'do_compile=
 do_compile_kernelmodules', d)
+        d.appendVarFlag('do_create_spdx', 'depends', f'{pn}:do_save_compil=
ed_files')
 }
=20
 # Here we pull in all various kernel image types which we support.
@@ -867,3 +870,19 @@ EXPORT_FUNCTIONS do_deploy
=20
 # Add using Device Tree support
 inherit kernel-devicetree
+
+# in case we don't use spdx bbclass
+SPDX_COMPILED_SOURCES_DIR ?=3D "${LOG_DIR}/spdx-compiled/${PN}"
+SPDX_COMPILED_SOURCES ?=3D "${SPDX_COMPILED_SOURCES_DIR}/compiled_src-${MA=
CHINE}-${BP}.txt"
+
+KERNEL_COMPILED_FILES ?=3D "${SPDX_COMPILED_SOURCES_DIR}/compiled_commands=
-${MACHINE}-${BP}.json"
+
+do_save_compiled_files() {
+    bbdebug 1 "Saving compiled files in ${SPDX_COMPILED_SOURCES}"
+    mkdir -p ${SPDX_COMPILED_SOURCES_DIR}
+    ${S}/scripts/clang-tools/gen_compile_commands.py -o ${KERNEL_COMPILED_=
FILES} -d ${B}
+    # Make paths releative to the kernel source
+    sed -i 's|${B}/||g' ${KERNEL_COMPILED_FILES}
+    sed -i 's|${S}/||g' ${KERNEL_COMPILED_FILES}
+    grep '"file": ' ${KERNEL_COMPILED_FILES} | awk '{print $2}' | tr -d '"=
' > ${SPDX_COMPILED_SOURCES}
+}

