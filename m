Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 419D5105F7B7
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 15:14:35 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18192.1773414867351632746
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 08:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=L4A4Kxf3;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.8, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8mVObemF/rtWhJQl0q2rNj7//7elGuBRAs/NmzaaO9jcx8xDRffUCvy9iAKMBnw44wK52ESznUFwRhHM0SDbSgN06g66nqoCy4soDfw7Wnq0bChgF+4XCY6HGKnxNjnKIr7a2TeovlVCWFcmNPUvmrO+19mTP3vVrSRi9/fNcUDsjX1qaS429sQHHyCgqhejwNIdDsKirznLnFhIBD9M6bE77a++cH4uH/736Sw0Kx8NjenizBM0k3U4Zjh/fakt6FkzJX7bVOUUzb52CeyHjc7aTbgEk93neP+0S8Ri2Xm+NLQWiLbHGe/o0VxL74U94Ko+Bx59/Y2xBVOObqe9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzIMGgJWfFu4CxVHS7B94zj6kjxTC/grBpZyQUkN6t4=;
 b=sccEfSlHh2PPt/dZknTxwW9nagS6vTOJ8brTCMBC0myV/Z39i6y/BR/fm2BC6Ps/CW3xlW0824liXzlSs/7+skJ4zrAn9UPFT9mObg0cFxLYXWZnQv6iIiCQxCaLP5NtZjKwtGiYVcl7EtbGzKmwfuoupDphlj5KF7/Cq9NIrzxy2fhMq2RbSZFHX/HgmK06vNk2TwKCq3LVrX3i9gvX/tiNqA3X2gIt+1Oq3KVdJXKoi8b77yfugvD4+D8Ue+UbP6L1NHo/EOeblkYZexelebK/R24a/mt2QhKI7B2s68UFnisN8FMRRnaDPJvMxIOzZRm94I6RMWSAlKu3aubx1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzIMGgJWfFu4CxVHS7B94zj6kjxTC/grBpZyQUkN6t4=;
 b=L4A4Kxf3AgREu3X5lgM4AxsQBUb1XmjRxHxrlWKnygd7PmUwKC2QCYHWBjyxuC/TX/Nfuf7PEDGZ6+toz52fy7ysSAVZJIlycN9a3zilZ4Azz61J8GboTjov56WWy34NVwU/vdpmSJlxKKkERZcVwOYyZPGlCjpTMXtSK4llsa4=
Received: from CH2PR03CA0003.namprd03.prod.outlook.com (2603:10b6:610:59::13)
 by BLAPR10MB5041.namprd10.prod.outlook.com (2603:10b6:208:30e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 15:14:25 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:59:cafe::ab) by CH2PR03CA0003.outlook.office365.com
 (2603:10b6:610:59::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17 via Frontend Transport; Fri,
 13 Mar 2026 15:14:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.1 via Frontend Transport; Fri, 13 Mar 2026 15:14:24 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 10:14:23 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 10:14:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 10:14:22 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62DFEMAx739046
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 10:14:22 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w14DW-0000000FbhV-3YpY
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Mar 2026 10:14:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 2/2] selftest: uboot: Add sefltest for recent KCONFIG_CONFIG_ROOTDIR fix
Date: Fri, 13 Mar 2026 10:14:22 -0500
Message-ID: <20260313151422.3719829-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313151422.3719829-1-reatmon@ti.com>
References: <20260313151422.3719829-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|BLAPR10MB5041:EE_
X-MS-Office365-Filtering-Correlation-Id: f64db5ed-d21a-49a0-8f13-08de81133658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Exu9Qt5fIzeVs/oayrDAwMMJ8c14auyK9txtuWCRqEg1FnPBH3fx4ScntwZ7LfLx2vY7JrbOd6V5Lv89klYFRTMPPCq0phKBQ8KfPJkimr4XwZRwHTtqpH7EclnYZrAxAXm+dU4zzsImSXtEc/ongpiURzWDJtr7L9r4tbi5XPWdB1ibZbT2Yl2hLhN2sZqUpQTfFuVMeCFsw7CQCfi2jhYVrwC3fDnWrnVOMhQSGCGL4/FrYV1HDTh8b87Ny4mXKiXiXmZ94jnun+ub8/4nSNovFZRkEtUTrCsznG2HZuADU1+EF46/9zGqUyh8lQwshkfcRYcpwXGOEpkNPia/PJC0E4yEPF8SX8J8REMvMLy2mgnP/qBiwxPrD52sozob5ULlpFHKmshu1c0pFSWQzdF66HlpLonci7E7egHCcRkodt3BVna8vFjO1/qLPjezMgxowKvlF+c4WgqZUK7YOuvaLdCaI5nUZ3PJfp253YWiyEnxjLM/C0Z4S1iCLndFtLeNh3sJkR6+KEzOsJ5uo6goDejphALOMbC440/zdBC9ynhdnrw+gx8H08BQobhhA4f4XL1RP5YyDz4yR85bJoGe1r8hmz5MOZfbjDvt0nH4ILGZ0Wd9TjXq8x2iS0tYnoPLDl16RVpph5pfsnC2K24XF0rLxVfKGkMrE/4gb7UbLSYXrJ9qP+uWoPrrscC12BjAvHF8K58ZS14+gT6QQp0iVNvfsb0fCsE4SJ3ae1igYO9vSv5IkDyl3SAT603j8K3vG+40tooYy6cAmyWbCw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fsGm4fbOQBoxx5zIlLSaAW5LpX/yv3hQdLGJ3BzftqNFrSRTxLkGeMtDtUAW7sNkYSn1G8si+nRv2rQHr3jWn2kpGBnUBbSg02+Sh/zYqGHzwiQ/tWtg6A+klgZA7bIqKeoc9ThBHHhh21bHlOCvcYtRdfrF1ywhUNRffjT6wnyQZv1RqTCF5Hxghig9UpACXIuusmbs16czTDLxPgvSb1cx3K8atnhbJSF4sAPqL9Gl654UXAZOyff2RXVwxLRavOEVqk30VcqzGNSJ1sOEkNQrOvKfIQC2a09YU38mdbFbOT0rJmEM3LeJBdkZYrfFKKnP6TgodWstD2tWcZYqRODh6OCU9MVWAKXCiYUrFK/ICQo66UauJ/jJZgROjWp/HbwayEaxhHhuJybmSo8yq+StCfcm1Dfu+XFu6VBMfhSQ8vWGnKmhdkMreMqPHY9W
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:14:24.8457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f64db5ed-d21a-49a0-8f13-08de81133658
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 15:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233046

Add a check to make sure that KCONFIG_CONFIG_ROOTDIR and
KCONFIG_CONFIG_ENABLE_MENUCONFIG are being set correctly in the
different cases.

A recent commit [1] showed that we were missing a check for the
correctness of these variables.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D2548c040ea1=
55c981e41cb0282bcb28c47b3b688

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta/lib/oeqa/selftest/cases/uboot.py | 38 +++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/uboot.py b/meta/lib/oeqa/selftest=
/cases/uboot.py
index 8e53ae5031..2e4530fddd 100644
--- a/meta/lib/oeqa/selftest/cases/uboot.py
+++ b/meta/lib/oeqa/selftest/cases/uboot.py
@@ -178,13 +178,46 @@ class UBootConfigTest(OESelftestTestCase):
=20
         bitbake("-e u-boot")
=20
-        bb_vars =3D get_bb_vars(["UBOOT_MACHINE", "IMAGE_FSTYPES", "UBOOT_=
CONFIG_BINARY", "UBOOT_CONFIG_MAKE_OPTS", "UBOOT_CONFIG_FRAGMENTS"], "u-boo=
t")
+        bb_vars =3D get_bb_vars(["UBOOT_MACHINE", "IMAGE_FSTYPES", "UBOOT_=
CONFIG_BINARY", "UBOOT_CONFIG_MAKE_OPTS", "UBOOT_CONFIG_FRAGMENTS", "KCONFI=
G_CONFIG_ENABLE_MENUCONFIG"], "u-boot")
=20
         self.assertEqual(bb_vars["UBOOT_MACHINE"], " machine1 machine2 mac=
hine3")
         self.assertTrue(bb_vars["IMAGE_FSTYPES"].endswith(" image_fstype2 =
image_fstype3"))
         self.assertEqual(bb_vars["UBOOT_CONFIG_BINARY"], "defBinary ? defB=
inary ? binary3 ? ")
         self.assertEqual(bb_vars["UBOOT_CONFIG_MAKE_OPTS"], "OPT=3D1 ?  ? =
OPT=3D3 FOO=3D2 ? ")
         self.assertEqual(bb_vars["UBOOT_CONFIG_FRAGMENTS"], "fragment1a fr=
agment1b ? fragment2 ?  ? ")
+        self.assertEqual(bb_vars["KCONFIG_CONFIG_ENABLE_MENUCONFIG"], "fal=
se")
+
+    def test_uboot_config_extract_single_config(self):
+        """
+        Tests the uboot-config.bbclass python function that extracts all o=
f
+        the config variations into the support variables.
+        """
+
+        self.write_config(textwrap.dedent(f"""
+            UBOOT_BINARY =3D "defBinary"
+            UBOOT_MACHINE =3D ""
+            UBOOT_CONFIG =3D "test1"
+            UBOOT_CONFIG[test1] =3D "machine1"
+            UBOOT_CONFIG[test2] =3D "machine2"
+            UBOOT_CONFIG[test3] =3D "machine3"
+            UBOOT_CONFIG_IMAGE_FSTYPES[test2] =3D "image_fstype2"
+            UBOOT_CONFIG_IMAGE_FSTYPES[test3] =3D "image_fstype3"
+            UBOOT_CONFIG_BINARY[test3] =3D "binary3"
+            UBOOT_CONFIG_MAKE_OPTS[test1] =3D "OPT=3D1"
+            UBOOT_CONFIG_MAKE_OPTS[test3] =3D "OPT=3D3 FOO=3D2"
+            UBOOT_CONFIG_FRAGMENTS[test1] =3D "fragment1a fragment1b"
+            UBOOT_CONFIG_FRAGMENTS[test2] =3D "fragment2"
+        """))
+
+        bitbake("-e u-boot")
+
+        bb_vars =3D get_bb_vars(["UBOOT_MACHINE", "IMAGE_FSTYPES", "UBOOT_=
CONFIG_BINARY", "UBOOT_CONFIG_MAKE_OPTS", "UBOOT_CONFIG_FRAGMENTS", "KCONFI=
G_CONFIG_ROOTDIR"], "u-boot")
+
+        self.assertEqual(bb_vars["UBOOT_MACHINE"], " machine1")
+        self.assertEqual(bb_vars["UBOOT_CONFIG_BINARY"], "defBinary ? ")
+        self.assertEqual(bb_vars["UBOOT_CONFIG_MAKE_OPTS"], "OPT=3D1 ? ")
+        self.assertEqual(bb_vars["UBOOT_CONFIG_FRAGMENTS"], "fragment1a fr=
agment1b ? ")
+        self.assertTrue(bb_vars["KCONFIG_CONFIG_ROOTDIR"].endswith("/build=
/machine1-test1"))
=20
     def test_uboot_config_extract_legacy(self):
         """
@@ -204,13 +237,14 @@ class UBootConfigTest(OESelftestTestCase):
=20
         bitbake("-e u-boot")
=20
-        bb_vars =3D get_bb_vars(["UBOOT_MACHINE", "IMAGE_FSTYPES", "UBOOT_=
CONFIG_BINARY", "UBOOT_CONFIG_MAKE_OPTS", "UBOOT_CONFIG_FRAGMENTS"], "u-boo=
t")
+        bb_vars =3D get_bb_vars(["UBOOT_MACHINE", "IMAGE_FSTYPES", "UBOOT_=
CONFIG_BINARY", "UBOOT_CONFIG_MAKE_OPTS", "UBOOT_CONFIG_FRAGMENTS", "KCONFI=
G_CONFIG_ENABLE_MENUCONFIG"], "u-boot")
=20
         self.assertEqual(bb_vars["UBOOT_MACHINE"], " machine1 machine2 mac=
hine3")
         self.assertTrue(bb_vars["IMAGE_FSTYPES"].endswith(" image_fstype2 =
image_fstype3"))
         self.assertEqual(bb_vars["UBOOT_CONFIG_BINARY"], "defBinary ? defB=
inary ? binary3 ? ")
         self.assertEqual(bb_vars["UBOOT_CONFIG_MAKE_OPTS"], " ?  ?  ? ")
         self.assertEqual(bb_vars["UBOOT_CONFIG_FRAGMENTS"], " ?  ?  ? ")
+        self.assertEqual(bb_vars["KCONFIG_CONFIG_ENABLE_MENUCONFIG"], "fal=
se")
=20
     def test_uboot_config_extract_error_missing_config(self):
         """
--=20
2.43.0


