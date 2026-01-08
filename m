Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B61CD1D494
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 20:23:04 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16045.1767903777534581850
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 12:22:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=G/MB64nr;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.17, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czUQMMaPqsNZnMfuF0I+/iiYRp2gwZ9bOgT/0i4+JYX3+oc6CRb1ndX6IfrMUt9ZIJxA57pPg71fXhfdh07L5MNuBTsNwpvdu3wv5v+XoX1njJkEjSAC0llgjdYMgyEVQCKj3jWBKRbWhXo96RURC8gr6utHG6hCvljxowaQZziNWbgxOqK0OSGF6VZd7j3OffSulWLFgAqdhdPvKlb98pS4KUpVIevgDQF7YpAIXgEYzea16FYCCrmX5T5mXlJdfz3QVjqwByYTpTNI3FWPcEjcbqycobgoh5zSVM0RxrIAqUnwbeZBCpr9JD0WL0pXCkrHiwRk0dlQgEG5ywmYSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ml5qbCwgwD/TyjDbhitPOZsvrVwMFIwoFfNbO9XNpq0=;
 b=SW83IpC+UgWLgVz451cIdCq/0nUAUyHYCza8bxvhuy9rRhHtB5M1lwWiLgA3niFxABlDqnN51a1iBDwBfAYll2pfBavTwCAot/V/Tt6NBBRStrEF8kfU4J6Y4LgzL4RLWoO63IYsY8Ylxr6H13M01q5Bc5ftPtUGPP0QilmO9qFuTrbxG/50eOMd+YJ0tE0pawfP4O+MiGiw0suc0ymS1H42m6vhbxSfRg45uMurQCLUX9INaVDKfmC2o5FcGoWolT7bfwH4EjcUdvun1pL9E/Ln70Y4OYxTgkma6DxK4L1S8tQ0JBm46RTNSmZR3VGXMsX2gI/bwh6HGYGaEaQj+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ml5qbCwgwD/TyjDbhitPOZsvrVwMFIwoFfNbO9XNpq0=;
 b=G/MB64nrjtZ6Nej4w+F1zfacQRmLB3XMDvgewwK3vtWHLmp9pa043X0vSf84fXzcNGQV5dfDvhc1Nddt6VnVuX9ED7jGYjygNvwZtsIJPKkpYNLJDyl3qprBb4OEmkR9dQ43tXI9npijkF82CPa3Ro8pf2yrJPLjZDE7gf4KlSo=
Received: from DS7PR06CA0007.namprd06.prod.outlook.com (2603:10b6:8:2a::25) by
 SA1PR10MB5734.namprd10.prod.outlook.com (2603:10b6:806:23f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 20:22:53 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:8:2a:cafe::20) by DS7PR06CA0007.outlook.office365.com
 (2603:10b6:8:2a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 20:22:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 20:22:52 +0000
Received: from DFLE20.ent.ti.com (10.64.6.57) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 14:22:51 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE20.ent.ti.com
 (10.64.6.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 14:22:51 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 8 Jan 2026 14:22:39 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 608KMd9v2934714
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Jan 2026 14:22:39 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vdwWl-0000000AASg-0eLB
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Jan 2026 14:22:39 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 3/3] selftest: uboot: Add selftests for new UBOOT_CONFIG flow
Date: Thu, 8 Jan 2026 14:22:39 -0600
Message-ID: <20260108202239.2423335-3-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108202239.2423335-1-reatmon@ti.com>
References: <20260108202239.2423335-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|SA1PR10MB5734:EE_
X-MS-Office365-Filtering-Correlation-Id: 803d2fd7-adfd-41b5-f666-08de4ef3b32c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|34070700014|34020700016|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dmRe5fabG2k/6eSHYFHQdXIqSY2tMDHijRYvcnVV9eNF4Ee9ATUUbiH0K3G8?=
 =?us-ascii?Q?E3T6VgzsZjEbFuQHk38BvEa5vhyTiugPhJba6fnoHTw8UoMggCGyjhgDzoyo?=
 =?us-ascii?Q?kurxwSn2B3QjWiN8OEjfXQtIlu3dRJrBXUI2AWr3C15b/xt3wWz7OClj/0Ui?=
 =?us-ascii?Q?i6J641xrqnqL6OYR1RPAyHP4AAlrh6EsCEnCPY7gQz05FlPDk7i4jI8e/Lhh?=
 =?us-ascii?Q?ZHA3BYAUJbgWuJf5JYiNrTY8lni9TMlqXYDGmuW76wmItgQUCxOUn8OM6sF7?=
 =?us-ascii?Q?3JSSpfJC/eC5Kzlm5gz+wol/YCDcXLNWLMVGxWe7uX7PZIXfPLxdHtivWlhC?=
 =?us-ascii?Q?SnokkR9Z0Z5GIyCP65j0vEsE6K4C/Tan4x3w9VfI86sUFU8D7dGBMnuU2v8f?=
 =?us-ascii?Q?DyxncUGMCwvTdkF9ZqDSLkPR9P6Wj83w66d3AmUl0j+Szk/5DuNQT+9iwaUo?=
 =?us-ascii?Q?5CbRNWnwluWXSbHlFX/pgqAqUhoB2AuoMSWi8X1ZDoBdK0LE9q7bRErSyGMe?=
 =?us-ascii?Q?O6gr2TcN1s5htfNslb4eE+kXfTvBJhnLYq9Gnx9/J2960Mm/Pvokji42MjwU?=
 =?us-ascii?Q?WVjhkHf2LOpITSkuMNv+OSBy2WddUuHAv6NBGUBS7hvUzBgVWq1bfbmupW8N?=
 =?us-ascii?Q?/B5HtdpviG28Vnz/oVV1IgdV5DjMB0lzHQAv1CA4EvSaD4Fbom2LTQdTSBWy?=
 =?us-ascii?Q?HiA2X1RhWG64yERLKGevzIfD36gtjlsErgAH8WBl4suNRtXsmmygh5wXa7p7?=
 =?us-ascii?Q?v0oFznkQiqQ5IN8DX67DmKWX9oduW4CgoMWbUYN3F3scc3Xahc/an99kOnzV?=
 =?us-ascii?Q?zWIsTZsH6FDqLfq1IJI9NDgAaoxNl62sS8tz/NaopjZ37Kpg6vfsjCbOJaRP?=
 =?us-ascii?Q?5IDtXnPKl7X4ItHYTdERoaQQDuMuJvBUWtwhsvv1C1kdqRJGWRRoJtI5BHFI?=
 =?us-ascii?Q?jiSPU05ourI2wqX/M3R8gbn7BjVhPXrhBE5qlWxGqv+C1JQwm4h17VfU4kKP?=
 =?us-ascii?Q?m4G2/DWoxbZ5HREdbq9oYsVLA6HKYrc0rUFFdg1To+9QRZ47ltPSSOjsagpw?=
 =?us-ascii?Q?JTdQDS7u4ss6r04hLN0ac1fhNg6F7TjHCKz0cPCbdNPwtVWCmkpenrajznmG?=
 =?us-ascii?Q?iojAzT57Ndf6z4tVaDGP3R2qsC/MQ4srUKduKmKCkWbP4hfZjrpwm0tgtYER?=
 =?us-ascii?Q?FojdfI7GJgc9tpWgUi/jB4zLASUxSgJsElW+sKV5wQBvYSQeKMvTAEJFSB6E?=
 =?us-ascii?Q?Y4WFCEuIVuys6LYdPeytqHRZDSJBLXlSfkVmlmSbUYKf23RJ/slprTDY1/Pe?=
 =?us-ascii?Q?fAxUOtwlnbSeRrYL2S5tkTvXvPX615cAHRwQg+LzVyHIC6YmiMu49lVhSaBh?=
 =?us-ascii?Q?vt+5SmuvDABLJAJxRo7lz+k4MvkOoqnQ259x3ucSBjexaHpib9Nxv8s6hI7c?=
 =?us-ascii?Q?eOjt7H3N6J/vsTu7X5IxaF0an5eqi0HUBwIwYAp6yEzpxoUIaVzqNJAuzxK0?=
 =?us-ascii?Q?aWfve9jSirJgmAAEYZ5iFHogbMGBxks0XiM7PhiFXEew9auKvxVn5uFQzNEz?=
 =?us-ascii?Q?WB8RrLeAjf1J0VbuA2w=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(34070700014)(34020700016)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 20:22:52.2275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 803d2fd7-adfd-41b5-f666-08de4ef3b32c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5734
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 20:23:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229089

This adds seven new selftests to verify the functionality of the
overhauled UBOOT_CONFIG flow.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta/lib/oeqa/selftest/cases/uboot.py | 217 ++++++++++++++++++++++++++
 1 file changed, 217 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/uboot.py b/meta/lib/oeqa/selftest=
/cases/uboot.py
index 28169514f5..8e53ae5031 100644
--- a/meta/lib/oeqa/selftest/cases/uboot.py
+++ b/meta/lib/oeqa/selftest/cases/uboot.py
@@ -150,3 +150,220 @@ QB_DRIVE_TYPE =3D "/dev/vd"
         ))
=20
         self.assertExists(uboot_initial_env_binary_path)
+
+
+class UBootConfigTest(OESelftestTestCase):
+
+    def test_uboot_config_extract(self):
+        """
+        Tests the uboot-config.bbclass python function that extracts all o=
f
+        the config variations into the support variables.
+        """
+
+        self.write_config(textwrap.dedent(f"""
+            UBOOT_BINARY =3D "defBinary"
+            UBOOT_MACHINE =3D ""
+            UBOOT_CONFIG =3D "test1 test2 test3"
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
CONFIG_BINARY", "UBOOT_CONFIG_MAKE_OPTS", "UBOOT_CONFIG_FRAGMENTS"], "u-boo=
t")
+
+        self.assertEqual(bb_vars["UBOOT_MACHINE"], " machine1 machine2 mac=
hine3")
+        self.assertTrue(bb_vars["IMAGE_FSTYPES"].endswith(" image_fstype2 =
image_fstype3"))
+        self.assertEqual(bb_vars["UBOOT_CONFIG_BINARY"], "defBinary ? defB=
inary ? binary3 ? ")
+        self.assertEqual(bb_vars["UBOOT_CONFIG_MAKE_OPTS"], "OPT=3D1 ?  ? =
OPT=3D3 FOO=3D2 ? ")
+        self.assertEqual(bb_vars["UBOOT_CONFIG_FRAGMENTS"], "fragment1a fr=
agment1b ? fragment2 ?  ? ")
+
+    def test_uboot_config_extract_legacy(self):
+        """
+        Tests the legacy comma-separated portion of the uboot-config.bbcla=
ss
+        python function that extracts all of the config variations into th=
e
+        support variables.
+        """
+
+        self.write_config(textwrap.dedent(f"""
+            UBOOT_BINARY =3D "defBinary"
+            UBOOT_MACHINE =3D ""
+            UBOOT_CONFIG =3D "test1 test2 test3"
+            UBOOT_CONFIG[test1] =3D "machine1"
+            UBOOT_CONFIG[test2] =3D "machine2,image_fstype2"
+            UBOOT_CONFIG[test3] =3D "machine3,image_fstype3,binary3"
+        """))
+
+        bitbake("-e u-boot")
+
+        bb_vars =3D get_bb_vars(["UBOOT_MACHINE", "IMAGE_FSTYPES", "UBOOT_=
CONFIG_BINARY", "UBOOT_CONFIG_MAKE_OPTS", "UBOOT_CONFIG_FRAGMENTS"], "u-boo=
t")
+
+        self.assertEqual(bb_vars["UBOOT_MACHINE"], " machine1 machine2 mac=
hine3")
+        self.assertTrue(bb_vars["IMAGE_FSTYPES"].endswith(" image_fstype2 =
image_fstype3"))
+        self.assertEqual(bb_vars["UBOOT_CONFIG_BINARY"], "defBinary ? defB=
inary ? binary3 ? ")
+        self.assertEqual(bb_vars["UBOOT_CONFIG_MAKE_OPTS"], " ?  ?  ? ")
+        self.assertEqual(bb_vars["UBOOT_CONFIG_FRAGMENTS"], " ?  ?  ? ")
+
+    def test_uboot_config_extract_error_missing_config(self):
+        """
+        Tests the uboot-config.bbclass python function that extracts all o=
f
+        the config variations to make sure it errors on having a missing
+        flag in UBOOT_CONFIG.
+        """
+
+        self.write_config(textwrap.dedent(f"""
+            UBOOT_BINARY =3D "defBinary"
+            UBOOT_MACHINE =3D ""
+            UBOOT_CONFIG =3D "test1 test2 test3"
+            UBOOT_CONFIG[test1] =3D "machine1"
+            UBOOT_CONFIG[test2] =3D "machine2"
+        """))
+
+        with self.assertRaises(AssertionError) as cm:
+            bitbake("-e u-boot")
+
+        e =3D cm.exception
+        s =3D str(e)
+
+        self.assertIn("ERROR: Nothing PROVIDES 'u-boot'", s)
+        self.assertIn("u-boot was skipped: The selected UBOOT_CONFIG key t=
est3 has no match in dict_keys(['test1', 'test2']).", s)
+
+    def test_uboot_config_extract_error_nothing_set(self):
+        """
+        Tests the uboot-config.bbclass python function that extracts all o=
f
+        the config variations to make sure it errors on not having=20
+        UBOOT_MACHINE or UBOOT_CONFIG set.
+        """
+
+        machine =3D get_bb_var("MACHINE", "u-boot")
+
+        self.write_config(textwrap.dedent(f"""
+            UBOOT_MACHINE =3D ""
+            UBOOT_CONFIG =3D ""
+        """))
+
+        with self.assertRaises(AssertionError) as cm:
+            bitbake("-e u-boot")
+
+        e =3D cm.exception
+        s =3D str(e)
+
+        self.assertIn("ERROR: Nothing PROVIDES 'u-boot'", s)
+        self.assertIn("u-boot was skipped: Either UBOOT_MACHINE or UBOOT_C=
ONFIG must be set in the %s machine configuration." % machine, s)
+
+    def test_uboot_config_extract_error_set_both_config_and_machine(self):
+        """
+        Tests the uboot-config.bbclass python function that extracts all o=
f
+        the config variations to make sure it errors on setting both=20
+        UBOOT_MACHINE or UBOOT_CONFIG.
+        """
+
+        self.write_config(textwrap.dedent(f"""
+            UBOOT_MACHINE =3D "machine"
+            UBOOT_CONFIG =3D "test1 test2"
+        """))
+
+        with self.assertRaises(AssertionError) as cm:
+            bitbake("-e u-boot")
+
+        e =3D cm.exception
+        s =3D str(e)
+
+        self.assertIn("ERROR: Nothing PROVIDES 'u-boot'", s)
+        self.assertIn("u-boot was skipped: You cannot use UBOOT_MACHINE an=
d UBOOT_CONFIG at the same time.", s)
+
+    def test_uboot_config_extract_error_set_uboot_config_image_fstypes(sel=
f):
+        """
+        Tests the uboot-config.bbclass python function that extracts all o=
f
+        the config variations to make sure it errors on setting internal
+        variable UBOOT_CONFIG_IMAGE_FSTYPES.
+        """
+
+        self.write_config(textwrap.dedent(f"""
+            UBOOT_MACHINE =3D ""
+            UBOOT_CONFIG =3D "test1 test2"
+            UBOOT_CONFIG_IMAGE_FSTYPES =3D "fstype"
+        """))
+
+        with self.assertRaises(AssertionError) as cm:
+            bitbake("-e u-boot")
+
+        e =3D cm.exception
+        s =3D str(e)
+
+        self.assertIn("ERROR: Nothing PROVIDES 'u-boot'", s)
+        self.assertIn("u-boot was skipped: You cannot use UBOOT_CONFIG_IMA=
GE_FSTYPES as a variable, you can only set flags.", s)
+
+    def test_uboot_config_extract_error_set_uboot_config_binary(self):
+        """
+        Tests the uboot-config.bbclass python function that extracts all o=
f
+        the config variations to make sure it errors on setting internal
+        variable UBOOT_CONFIG_BINARY.
+        """
+
+        self.write_config(textwrap.dedent(f"""
+            UBOOT_MACHINE =3D ""
+            UBOOT_CONFIG =3D "test1 test2"
+            UBOOT_CONFIG_BINARY =3D "binary"
+        """))
+
+        with self.assertRaises(AssertionError) as cm:
+            bitbake("-e u-boot")
+
+        e =3D cm.exception
+        s =3D str(e)
+
+        self.assertIn("ERROR: Nothing PROVIDES 'u-boot'", s)
+        self.assertIn("u-boot was skipped: You cannot use UBOOT_CONFIG_BIN=
ARY as a variable, you can only set flags.", s)
+
+    def test_uboot_config_extract_error_set_uboot_config_make_opts(self):
+        """
+        Tests the uboot-config.bbclass python function that extracts all o=
f
+        the config variations to make sure it errors on setting internal
+        variable UBOOT_CONFIG_MAKE_OPTS.
+        """
+
+        self.write_config(textwrap.dedent(f"""
+            UBOOT_MACHINE =3D ""
+            UBOOT_CONFIG =3D "test1 test2"
+            UBOOT_CONFIG_MAKE_OPTS =3D "OPT=3D1"
+        """))
+
+        with self.assertRaises(AssertionError) as cm:
+            bitbake("-e u-boot")
+
+        e =3D cm.exception
+        s =3D str(e)
+
+        self.assertIn("ERROR: Nothing PROVIDES 'u-boot'", s)
+        self.assertIn("u-boot was skipped: You cannot use UBOOT_CONFIG_MAK=
E_OPTS as a variable, you can only set flags.", s)
+
+    def test_uboot_config_extract_error_set_uboot_config_fragments(self):
+        """
+        Tests the uboot-config.bbclass python function that extracts all o=
f
+        the config variations to make sure it errors on setting internal
+        variable UBOOT_CONFIG_FRAGMENTS.
+        """
+
+        self.write_config(textwrap.dedent(f"""
+            UBOOT_MACHINE =3D ""
+            UBOOT_CONFIG =3D "test1 test2"
+            UBOOT_CONFIG_FRAGMENTS =3D "fragment"
+        """))
+
+        with self.assertRaises(AssertionError) as cm:
+            bitbake("-e u-boot")
+
+        e =3D cm.exception
+        s =3D str(e)
+
+        self.assertIn("ERROR: Nothing PROVIDES 'u-boot'", s)
+        self.assertIn("u-boot was skipped: You cannot use UBOOT_CONFIG_FRA=
GMENTS as a variable, you can only set flags.", s)
--=20
2.43.0


