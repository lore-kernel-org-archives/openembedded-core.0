Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3461FC531DC
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 17:06:48 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.46])
 by mx.groups.io with SMTP id smtpd.web11.1511.1724432804443410549
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Aug 2024 10:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Trvfy/hH;
 spf=pass (domain: axis.com, ip: 52.101.66.46, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jtHTZ9N4RSX4I4gy3HHvgH0NBMi6DEGwdkpDhBNPM7j8GPo5LLGKZm7ulaCKMTxfY3ni42aoyxMXAnuftCAY5BfEOMZlTjIcgewkc6dKcLkHaM4McHL/5vJ7gMPUJs6B9q5J/WSIv24836/CNxWtPT/0/njbbX41za9ILoo1JM4KxTMVFzo7+OD8qfnsaFCrl1Ydn5IsVM8C4bX0fdzfq1lhQiv4a5H/mZnQhe4wVNGY5ye4yAsr5MuZ1IXNoXuSCEP2IlTRvgO0win4YY18y2lQFt7T2/+IZMhpqKDtqLl2B85LbKOOgjNhRgRD1bfpLDou0nMuS4zeFAzMyYCSfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cp2ije/eAK9fnX+rcNiJUrGVf7ZPpTD66KFmSbwXgcU=;
 b=GkwaxwHrlY/8uPmo8FoLTPdzUDXZ68WcBONc/ZUup5mpySD/Gf9bzIIRWH/YbWcGa5mtYmrLtLOBCIsU4qzyo0PZqcdf9wjiOaZDdx4Tu1udEZijoQSS+34pA0dhKwzuPBpwvs1o0ZqHI9sLyC3BF9F4XgyQlnVlHNUXSoioIMBeN2FHdB6xqVPr+AZIcSufhNbL//GVtZJRUalEnNtjSw7GQmENj5zE9MjABiX5P7X/7K7VyZ1VqvJBf42Xkinl8GbkJft7SMIdvvU9ISeERZSpLCEX9S3HIh7BhoSriC3EX1DxEk+wK7vqDtd8kwMNrGC5/YjwXw50eZbYjeGt9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cp2ije/eAK9fnX+rcNiJUrGVf7ZPpTD66KFmSbwXgcU=;
 b=Trvfy/hH+j4NCduyiNcaiz6GPOeU/vMR30MhZZsmV2580TStPD2aXzhrKzK5eU0efXepL0ffUyPiuxb1cW4tPunI7oDbYAW1XsOj70fJepRw5d1P8mvhyAfLC/Wjb07EIEE2uiP/wZ/B/6n5IFHShLmBXbuAKrERaRL0MyLW26Q=
Received: from AS9PR06CA0054.eurprd06.prod.outlook.com (2603:10a6:20b:463::14)
 by VI1PR02MB5984.eurprd02.prod.outlook.com (2603:10a6:800:18c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Fri, 23 Aug
 2024 17:06:38 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:20b:463:cafe::c3) by AS9PR06CA0054.outlook.office365.com
 (2603:10a6:20b:463::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Fri, 23 Aug 2024 17:06:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 17:06:38 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 19:06:37 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 23 Aug 2024 19:06:37 +0200
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 3F0F33CD
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 19:06:37 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 47NH6bBS2776923
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 19:06:37 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 47NH6bsL2776922
	for openembedded-core@lists.openembedded.org; Fri, 23 Aug 2024 19:06:37 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 2/2] oeqa/selftest/bbclasses: Add tests for systemd and update-rc.d interaction
Date: Fri, 23 Aug 2024 19:06:33 +0200
Message-ID: <20240823170633.2776886-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240823170633.2776886-1-pkj@axis.com>
References: <20240823170633.2776886-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9E:EE_|VI1PR02MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: ed3cd91b-c602-44b6-90d4-08dcc395f37a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?n/6fNa6/cUw3ANvu3PpEqQRiQMOCZlJyGS36FlB7+VixM1ueMmlvg7hkS+mi?=
 =?us-ascii?Q?27ULaeW1fdYCFH25+3u3/MgKfQq87bYNNllKw8m+wJG4W13N6TYdmVuhtIHF?=
 =?us-ascii?Q?X1lsOGq9fgOZWpDCFOnW0RGHJq+Zsqm6sVtx+pAIGP0sXXoEPYKjvUhO9LH9?=
 =?us-ascii?Q?XkQTDBvyWDcfRhEojRhCBdAtwj6b3FT8jB+/4oLhODPLuh0NO/qRU8Q/Bejf?=
 =?us-ascii?Q?Nse0BCM/OSugNX1b0g6L045rkXg2TomzU7PFaLhLckuOSreNhzatBZ0yUsEi?=
 =?us-ascii?Q?N3JAwiDBBIh7/z5De2x7THkzoVzgynZEET9gw11r1muOPbGqt1sSWoO4Zba/?=
 =?us-ascii?Q?wK5KDX+CdSV92VBwvwo6jv6gvtfzUAYXYQ2iw+IevFh/zs/AYZInXiTpu8DA?=
 =?us-ascii?Q?Wi/VmhKrztLe1ec8UXYb7YztX+6gPJR2psgsvnZZFmU1ZUhWNP1A3ujqMaCU?=
 =?us-ascii?Q?2m2ipxVM6BAZHp7zSk2G5hh6ypLn3izzI1LFyRWKo3h/qDmfKxEiTJD525tU?=
 =?us-ascii?Q?qYMOODtMyvZi3r8pCwJP90lLOvgZ5JSVEmt9Xwq7Watcg8hO6kudh1QY0M2u?=
 =?us-ascii?Q?qjdfFWFVZknaIbEqrujYW95xSC4hVg+fM0c2VfxvxQL5YpTRVmb4UNxd84gz?=
 =?us-ascii?Q?dfNln/u1IAAEdvwYInrLq4fSXeMLC9/iD51n1no082ukKZBWirlrRz0TvOjj?=
 =?us-ascii?Q?PcVsDnJDremiXnFGVBo6fFyrTQJxCCdNZfSXN+f/NCCaFNvXOdt1wFQ8xNmz?=
 =?us-ascii?Q?73x7vQSsge8lL1Ed6CWZsLVZqiiw7ciN+1HAWxJA5zmazFZ0LqK+SndWSkEA?=
 =?us-ascii?Q?unrYqM7xt8+VfBG4AnF2M/m1FcZvgUoXsbmAF/FSZtBu6a2qsMjuEIoyfpiq?=
 =?us-ascii?Q?TCATGPALBWT4BhId9zZ33vfpwGgYopUAUgkHs3vKY/T9oOXHRTJ4CJdV8AXy?=
 =?us-ascii?Q?KZd+/hWvtvnaS2TwrmpzEAvzLtCCTflPV+cNGBrzyjnZLMXA0J2qvErsacCt?=
 =?us-ascii?Q?h4i/vSOWlrkmGHzvgIPIT6KNt8RmD3H8wnqgSKWA0tFNYxcpPCdIb8dL4b5O?=
 =?us-ascii?Q?v0vX9oAklZW64QMle2eGjLIC/InAX0PoKXuDLdXlafIlzCjpW8wBpXV4YU11?=
 =?us-ascii?Q?dEvQIMFzuKuwIsaJazKuplpMDIFL93O3xETa1EvGjVxlmYRcw8p4WsSTB35G?=
 =?us-ascii?Q?tqxlIcBuLOTJjtoRJlBdtOfHw+OxyJd3fhgdMKGkLSh+bQlw/FftnEFkZuSj?=
 =?us-ascii?Q?TgArNlyzkC1jwb2ECBOonCCDi6THEApUe1gWCT9k8OTNuHGsHy1fgh+TvIyc?=
 =?us-ascii?Q?ciBAe+dN8CcGKpQj/3OzgPGn4dLEgmDwBwJl8ajWYYsXoPv3zIEXlXny4uzz?=
 =?us-ascii?Q?LXcCNs6aCN41vIc1j0+PcG5Zzxt4qX8WrxIQg/gpno8erEcdLLrLrsxF2bNZ?=
 =?us-ascii?Q?N518XyBDv1g1nV9FbzJxFyzIEH0nhj/r?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 17:06:38.1894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed3cd91b-c602-44b6-90d4-08dcc395f37a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5984
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 17:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203702

These tests verify that the correct files are left behind when systemd
is inherited and depending on whether the systemd and/or sysvinit distro
features are enabled.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2:
* Change LICENSE to MIT for the test recipes.
* Add EXCLUDE_FROM_WORLD to the test recipes.

 .../bbclasses/systemd-and-sysvinit.bb         |  17 +++
 .../recipes-test/bbclasses/systemd-only.bb    |  12 ++
 meta/lib/oeqa/selftest/cases/bbclasses.py     | 106 ++++++++++++++++++
 3 files changed, 135 insertions(+)
 create mode 100644 meta-selftest/recipes-test/bbclasses/systemd-and-sysvin=
it.bb
 create mode 100644 meta-selftest/recipes-test/bbclasses/systemd-only.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/bbclasses.py

diff --git a/meta-selftest/recipes-test/bbclasses/systemd-and-sysvinit.bb b=
/meta-selftest/recipes-test/bbclasses/systemd-and-sysvinit.bb
new file mode 100644
index 0000000000..f9fc59a494
--- /dev/null
+++ b/meta-selftest/recipes-test/bbclasses/systemd-and-sysvinit.bb
@@ -0,0 +1,17 @@
+LICENSE =3D "MIT"
+
+inherit allarch systemd update-rc.d
+
+do_install() {
+	install -d ${D}${systemd_system_unitdir}
+	touch ${D}${systemd_system_unitdir}/${BPN}.service
+
+	install -d ${D}${INIT_D_DIR}
+	touch ${D}${INIT_D_DIR}/${BPN}
+}
+
+INITSCRIPT_NAME =3D "${BPN}"
+
+SYSTEMD_SERVICE:${PN} =3D "${BPN}.service"
+
+EXCLUDE_FROM_WORLD=3D"1"
diff --git a/meta-selftest/recipes-test/bbclasses/systemd-only.bb b/meta-se=
lftest/recipes-test/bbclasses/systemd-only.bb
new file mode 100644
index 0000000000..590a27b9cb
--- /dev/null
+++ b/meta-selftest/recipes-test/bbclasses/systemd-only.bb
@@ -0,0 +1,12 @@
+LICENSE =3D "MIT"
+
+inherit allarch systemd
+
+do_install() {
+	install -d ${D}${systemd_system_unitdir}
+	touch ${D}${systemd_system_unitdir}/${BPN}.service
+}
+
+SYSTEMD_SERVICE:${PN} =3D "${BPN}.service"
+
+EXCLUDE_FROM_WORLD=3D"1"
diff --git a/meta/lib/oeqa/selftest/cases/bbclasses.py b/meta/lib/oeqa/self=
test/cases/bbclasses.py
new file mode 100644
index 0000000000..10545ebe65
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/bbclasses.py
@@ -0,0 +1,106 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import get_bb_vars, bitbake
+
+class Systemd(OESelftestTestCase):
+    """
+    Tests related to the systemd bbclass.
+    """
+
+    def getVars(self, recipe):
+        self.bb_vars =3D get_bb_vars(
+            [
+                'BPN',
+                'D',
+                'INIT_D_DIR',
+                'prefix',
+                'systemd_system_unitdir',
+                'sysconfdir',
+            ],
+            recipe,
+        )
+
+    def fileExists(self, filename):
+        self.assertExists(filename.format(**self.bb_vars))
+
+    def fileNotExists(self, filename):
+        self.assertNotExists(filename.format(**self.bb_vars))
+
+    def test_systemd_in_distro(self):
+        """
+        Summary:    Verify that no sysvinit files are installed when the
+                    systemd distro feature is enabled, but sysvinit is not=
.
+        Expected:   Systemd service file exists, but /etc does not.
+        Product:    OE-Core
+        Author:     Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+        """
+
+        self.write_config("""
+DISTRO_FEATURES:append =3D " systemd usrmerge"
+DISTRO_FEATURES:remove =3D "sysvinit"
+VIRTUAL-RUNTIME_init_manager =3D "systemd"
+""")
+        bitbake("systemd-only systemd-and-sysvinit -c install")
+
+        self.getVars("systemd-only")
+        self.fileExists("{D}{systemd_system_unitdir}/{BPN}.service")
+
+        self.getVars("systemd-and-sysvinit")
+        self.fileExists("{D}{systemd_system_unitdir}/{BPN}.service")
+        self.fileNotExists("{D}{sysconfdir}")
+
+    def test_systemd_and_sysvinit_in_distro(self):
+        """
+        Summary:    Verify that both systemd and sysvinit files are instal=
led
+                    when both the systemd and sysvinit distro features are
+                    enabled.
+        Expected:   Systemd service file and sysvinit initscript exist.
+        Product:    OE-Core
+        Author:     Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+        """
+
+        self.write_config("""
+DISTRO_FEATURES:append =3D " systemd sysvinit usrmerge"
+VIRTUAL-RUNTIME_init_manager =3D "systemd"
+""")
+        bitbake("systemd-only systemd-and-sysvinit -c install")
+
+        self.getVars("systemd-only")
+        self.fileExists("{D}{systemd_system_unitdir}/{BPN}.service")
+
+        self.getVars("systemd-and-sysvinit")
+        self.fileExists("{D}{systemd_system_unitdir}/{BPN}.service")
+        self.fileExists("{D}{INIT_D_DIR}/{BPN}")
+
+    def test_sysvinit_in_distro(self):
+        """
+        Summary:    Verify that no systemd service files are installed whe=
n the
+                    sysvinit distro feature is enabled, but systemd is not=
.
+        Expected:   The systemd  service file does not exist, nor does /us=
r.
+                    The sysvinit initscript exists.
+        Product:    OE-Core
+        Author:     Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+        """
+
+        self.write_config("""
+DISTRO_FEATURES:remove =3D "systemd"
+DISTRO_FEATURES:append =3D " sysvinit usrmerge"
+VIRTUAL-RUNTIME_init_manager =3D "sysvinit"
+""")
+        bitbake("systemd-only systemd-and-sysvinit -c install")
+
+        self.getVars("systemd-only")
+        self.fileNotExists("{D}{systemd_system_unitdir}/{BPN}.service")
+        self.fileNotExists("{D}{prefix}")
+        self.fileNotExists("{D}{sysconfdir}")
+        self.fileExists("{D}")
+
+        self.getVars("systemd-and-sysvinit")
+        self.fileNotExists("{D}{systemd_system_unitdir}/{BPN}.service")
+        self.fileNotExists("{D}{prefix}")
+        self.fileExists("{D}{INIT_D_DIR}/{BPN}")

