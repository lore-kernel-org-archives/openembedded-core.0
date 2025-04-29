Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32BC3C3ABAB
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 14:39:14 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.64])
 by mx.groups.io with SMTP id smtpd.web11.110.1745937552581874944
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 07:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=MmvxU4nY;
 spf=pass (domain: ericsson.com, ip: 40.107.249.64, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iy+IqJmIy1BUKn0/zaK/bZxetng/Deybxjp0XCGMiUkIweARcCRWY1r8y+SeIJpPrvlD7S0LPHeZGVLp79nQiTFRVuj4ezcVevvMCF3/19jMRaR6in7J5fZn7Mg/Fz11tDRkeB21Rroc9POdaz8LfvA++FEk1JNw36faquehXqhXbfBtofsKhQbz2U2iLuedTu3DGxbVc9UO8LvmEMqqTlf1nAM4wxyiDc3jk3XDgo+JM+Ky5d2B9oORNGlLrVmRzmgcguTtw5+7aT8xAcuh0qBu+BEihftJAELjLGlgbcFspvK8qa64BQ7HzrmqheuonfdP0Fhn+pd+qUzFafIQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOS3y0epCls3c/4Vk0iVxpFybRek3VFU+Kwnq14Q1yk=;
 b=Lh0h3tv5dPNPHn5EK4pyAssOiOap26s+j8tZSmQSKW1lve0nJdTvhBog/SY3DV5Ac70ojACAUKyAxS7AdjnrCEPjHgBLua7E3PRZC7Kd1hG+MBrJUz2ajuTcRaYdtBGfcMxCl6+USOxHnrXdlORC6lxxIYHmR4HuE22u4bjXkeFj7PV8I6FvCc0zLS9Fwx70NQyZQaWebTjXOVUgUI9zasny4NJvuWhEGcv90xxq9IdtTb9kDT3+RcWpkts0dIbg0JR6vpUxgZ7aCYs1kvyXlX8WySKA+0QsHymCrcVb1xEUgV2JR3GCTb1pYFxwu5vSWBmCGPZdEdKl38HpHKn4GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOS3y0epCls3c/4Vk0iVxpFybRek3VFU+Kwnq14Q1yk=;
 b=MmvxU4nY8azhqowVFptLmxmrS6Lq86dg12cJ2fRnXdtx8qcltdi1TJh86b3EoK8Al8nx97zpibNba1GUDXZFAAK4zJJv12oHeKbHyqQFc4RPEPiYHRGtwho5rMK11oxP3hL2xsM26FdH6g0Tf5dxiNH/qmtm0Hfyt9824sPgQBHpcEGwOvaqj4EkJ795oylMMH6+FKeAHKoTDVUVe5v2CYBxrj/uYC16p3jHw1XDyK523eTGRGmv+zqUO0giLQjcJCu1JjdtIJJYEr1QhX3kQe+t9RMbxy/Q68Whn5NWWGp7NWrXyu5DB7Y1f+Qj9ij1MfKvgDJTuIyBO44fU+A28Q==
Received: from AM0PR06CA0126.eurprd06.prod.outlook.com (2603:10a6:208:ab::31)
 by AM9PR07MB7699.eurprd07.prod.outlook.com (2603:10a6:20b:2c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 14:39:08 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:208:ab:cafe::dd) by AM0PR06CA0126.outlook.office365.com
 (2603:10a6:208:ab::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 29 Apr 2025 14:39:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 14:39:08 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:08 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id DB6104020C05;
	Tue, 29 Apr 2025 16:39:07 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id B2B0970E75F2; Tue, 29 Apr 2025 16:39:07 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Peter.Marko@siemens.com>, Daniel Turull <daniel.turull@ericsson.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>, Peter Marko
	<peter.marko@siemens.com>
Subject: [PATCH v3 3/8] kernel: add support to extract compiled files
Date: Tue, 29 Apr 2025 16:38:59 +0200
Message-ID: <20250429143904.634082-4-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429143904.634082-1-daniel.turull@ericsson.com>
References: <20250429143904.634082-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78F:EE_|AM9PR07MB7699:EE_
X-MS-Office365-Filtering-Correlation-Id: 46ba11cc-32fb-4bc2-971d-08dd872b9988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5cQMGN+ZGjM3g9ZMtxrohB8Tj/GfwW7lXmahYjiRVDw+nzs0g+Zx+mfFavFO?=
 =?us-ascii?Q?yeaO1zsWxh5+LI4YNGTK++X8/G8kbkhqps/IWw7UHwa7u6eQYI9HipVSS8N9?=
 =?us-ascii?Q?PJU24ZgWWBuwOZTrZUOpAa5BY+C6W1BJcmPJv6Mk3mQbCd/pj+D54ulBqkpJ?=
 =?us-ascii?Q?Qb9sKxNkZ1CNxJslCTRZda9mf0mIZrS1mZsKvxdFlWMwoHdYMNmp/mfzz6pY?=
 =?us-ascii?Q?euE8J6EzIzvu35vmzyA3sZ3yeHcotNbAboYec/vw1sRpFdVbIY+bH3d20VGn?=
 =?us-ascii?Q?v9saz3xYt7xG6hQIGtzXOablTsrdmGI9YATSaDhS8mffn3q3EMhG0tMdLuBy?=
 =?us-ascii?Q?OT7+lXQ0SoUgO6AJS5CFAdAlyytoC2RtiPJp53sqbiYlZvRsMwLxkITwfzsL?=
 =?us-ascii?Q?I95aKvU4HQ44nNHDVneoN/2j1eq8nW9sJweo8f3tE7TJYWr1ix1eD2+ULqgw?=
 =?us-ascii?Q?Z5hmwT1ZFtTEeA+oGyTqGEFcHoEjc+veUET7gvo24GbRJP+UoBcLpFiuQkPd?=
 =?us-ascii?Q?WKLFwjY4PNSoav6KFL574iurP+C7EDTxjn6DJoPJ76PZ5gU5CPUI+tvFSnsW?=
 =?us-ascii?Q?dtOD59WZ5rrDgYjsiYVYU9tj8sm+E0yHmMNf4bLzr1n7uV27jVFKicjWs9gg?=
 =?us-ascii?Q?NC/vKt6OSwShe4zr6IgGZI5ZL3RbRAI3imFeayUFIVZn9RQ8u/SSVS4QShe/?=
 =?us-ascii?Q?7dDUKk5MDvarIc81mVSI6x3uOEegJyk7+PMveZ5alQSfbRdifdkbmWDyVaZD?=
 =?us-ascii?Q?pQPNywZATVcZN0ugMFyczXlhSy/joFv1fRYBkmuHGAEaO8LafOo4Kags245g?=
 =?us-ascii?Q?LHyBtAk8/jyJjfEBDNjQGvIpvSAlDMhbdTBxcXLLOwVq7TG120QNwghdvqIc?=
 =?us-ascii?Q?w3BPJ0Vn9k5SrO/eNMntcXOCJaYFTeWFFU+8m/EY/MmKXyeXj+zRtFs12nTq?=
 =?us-ascii?Q?QxDeycX8ptwYnUbozjl0MurZQj11QIsZC46JBaPMDxYyMcB2ghekc79s+xn3?=
 =?us-ascii?Q?Zsxjs4Y8sFfB0HWTSHHbfKFUC0b6csbRj9GMKeKR9j27N8CLHTNRmQ1E6zqa?=
 =?us-ascii?Q?7JR5uqIxR75Zpipigo3IIZSBHuf/43I34rcxfcfdfJY3gJ0HJJSFGnNJYizp?=
 =?us-ascii?Q?jylnfYra9u8eX5NkfH8fh0ohOkEWGua5/BDIFSJzwpBEuOUDKfQZZn3v/IY7?=
 =?us-ascii?Q?RyaU7qWl+uSO9+7AqpOWwnEbj9aIUpDBAOV2I3u0wpHckEzcsA3X8DByywl8?=
 =?us-ascii?Q?OBomuIGT+PYqHWQ+iW53asJhRrbKzCSU6MO/rjzUId2chcSX5gXroJAzOPFx?=
 =?us-ascii?Q?UIg2gGnOHfjRKlMvS9RRYS+2mmAq2WN8Q+Giz/iFtb49N1cEGHgslxen2d2K?=
 =?us-ascii?Q?V4wOQmx6tBVL8IcFBiAQicK6/X9kxt7iWqvY4SWFmZXdJQzdr6PtfQz0oyws?=
 =?us-ascii?Q?qgFYLxcZ247c7EZQeL5CpK+KLe26NMTZTW2wDqBti8iXrzptOmHKOlmHWSWK?=
 =?us-ascii?Q?eK3QpwUjDPLZpiAW3sWEhwAH1NR77QvP93jR?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 14:39:08.5080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ba11cc-32fb-4bc2-971d-08dd872b9988
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7699
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 14:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215668

From: Daniel Turull <daniel.turull@ericsson.com>

Use gen_compile_commands.py to extract files used during compilation
for the used kernel configuration.

CC: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/classes-recipe/kernel.bbclass | 37 ++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass
index 36ce659762..e321f6e228 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -159,6 +159,8 @@ set -e
     image_task =3D d.getVar('INITRAMFS_TASK')
     if image_task:
         d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
+    if d.getVar('CVE_CHECK_KERNEL_CONFIG') =3D=3D '1':
+         bb.build.addtask('do_save_compiled_files', None, 'do_compile do_c=
ompile_kernelmodules', d)
 }
=20
 # Here we pull in all various kernel image types which we support.
@@ -867,3 +869,38 @@ EXPORT_FUNCTIONS do_deploy
=20
 # Add using Device Tree support
 inherit kernel-devicetree
+
+KERNEL_FILES_DIR ?=3D "${LOG_DIR}/cve/kernel_files"
+KERNEL_SRC_FILES ?=3D "${KERNEL_FILES_DIR}/compile_commands.json"
+
+do_save_compiled_files() {
+    bbdebug 1 "Saving compiled files in ${KERNEL_SRC_FILES}"
+    mkdir -p ${KERNEL_FILES_DIR}
+    ${S}/scripts/clang-tools/gen_compile_commands.py -o ${KERNEL_SRC_FILES=
} -d ${B}
+}
+
+# Helper functions for spdx and cve-check
+# Check if the file, is a kernel compiled file
+def is_compiled_source(d, filename, kernel_sources):
+    import os
+
+    _, extension =3D os.path.splitext(filename)
+    # Special case, that we need to ignore, since this is not a source fil=
e
+    # We filter .c files
+    if filename.rfind(".mod.c") > 0 or extension !=3D ".c":
+        return True
+    # Check that the c file is in the list
+    if filename in kernel_sources:
+        return True
+    return False
+
+# Get results from the save_compiled files and include also header files, =
extracting path
+def get_compiled_sources(d):
+    import json
+    import os
+    kfiles =3D []
+    with open(d.getVar('KERNEL_SRC_FILES'), 'r') as f:
+        for item in json.load(f):
+            kfile =3D os.path.basename(item['file'])
+            kfiles.append(kfile)
+    return kfiles

