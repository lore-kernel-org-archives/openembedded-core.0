Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71D4C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 20:35:48 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.68])
 by mx.groups.io with SMTP id smtpd.web11.4707.1724186147227318555
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 13:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=o7yv9VMI;
 spf=pass (domain: axis.com, ip: 40.107.104.68, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+AA5LZTzOuKZTU4506x8InmfBE3HABul5c0bX2md13hu442YRuD3RcRAdS3sj/l+vuoSFCvomp5eBmgLiklRCsZr+zGovhSoYs63QibysSYYmXMJMSukKx2BPeDLppRVJS3zfxGezcMOmWbkszJa+HmL5f35uogbMfDgFDHyEuD+Eswztioggo8bAR93U1ZigBHosX5Xg11/ESuXm+65cWMkn+3UPnRlYzdrA8b3tGdvPjsvDKkF9aqfJCjG23KrlJCWdYXJ6vKws08FFJeQVxQ93JaZMV+GbmmHVi/lq6zxU/smTlyBr49M7m51xw6reT+9LuHPSE3Zl0FSdS6Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYQa6+Ss4uZO4mnNgBHG56j4fcsRAhn8gxnOnu78FoA=;
 b=pqcRe795Zb0Pa/fV0tfYny8rTvOvcibVaD0Izz4SRNKsSpsKHofipYfO+QtdyoYG2IOw2ot7sZCEQ+pF4Mxi3AH9p0U0tEdb49F0x+oaQL/hW1fpoNxn3OT7ugcxpcPg89sozhCAdZ3g6m6J+DRMU1KBK99J21sDvwQjsUg2tavbMUzkSX1XqIKmXRyzBdwtpqowVkezbPjNgy9OLL5J/5saxaeGW0VQElcjI6aZb60KAfn5TjPMmq9mXFNZTSpxxb6/le8IlBAFIZJ3Xq8KUtYL3SQlBByRB8xKL4mDS4rCDkDE5GLIFpi7F4FCX5I7o95OaU4CQznGGcB6y49BpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYQa6+Ss4uZO4mnNgBHG56j4fcsRAhn8gxnOnu78FoA=;
 b=o7yv9VMIe8VeYF9ldf0AhS6+tEfap05yYZvY9FSh7qtetCw5nYPe0kCNKPcxTyPYlEJyXaZ3oPhpdJHeExGOJz03LHbyffSDssTKPtMsbKpfAj65liBPFT1unM4o59VqzRUg0kCEPQ3L0jyLYUZax27LXfQKldQgKha8bBU7G7Y=
Received: from AS9PR06CA0747.eurprd06.prod.outlook.com (2603:10a6:20b:487::27)
 by PAXPR02MB7912.eurprd02.prod.outlook.com (2603:10a6:102:28d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Tue, 20 Aug
 2024 20:35:43 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:20b:487:cafe::55) by AS9PR06CA0747.outlook.office365.com
 (2603:10a6:20b:487::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25 via Frontend
 Transport; Tue, 20 Aug 2024 20:35:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Tue, 20 Aug 2024 20:35:43 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 22:35:41 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 20 Aug 2024 22:35:41 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 231BB1C3
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 22:35:41 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 47KKZfq14166678
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 22:35:41 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 47KKZffS4166677
	for openembedded-core@lists.openembedded.org; Tue, 20 Aug 2024 22:35:41 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] oeqa/selftest/bbclasses: Add tests for systemd and update-rc.d interaction
Date: Tue, 20 Aug 2024 22:35:33 +0200
Message-ID: <20240820203533.4166641-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240820203533.4166641-1-pkj@axis.com>
References: <20240820203533.4166641-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A4:EE_|PAXPR02MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: fa1a7648-cae3-4c55-9c69-08dcc157a9ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mPEx9ueSuD/0hV8rJ50w4sbK0wVwXTYoFuF5u8tgWB1GfWItu/2o2iUDsoqf?=
 =?us-ascii?Q?L5n7mHJlWgBxJ+E+Hh7nzgjHuvAcImeN5lhQC6THboZ6Y9lmxcy3Ny0fNZLU?=
 =?us-ascii?Q?48Uts+raSaO4vTECs4y2kss6skmSbjfYaru3nW3RUhKp3ad6b3UmOgJKfr4s?=
 =?us-ascii?Q?cYTYyNmEkX1Tggp0LkaHFjZpJ510rCTPi1hbiIkDh2rCv91ogZLAgTw0pJCE?=
 =?us-ascii?Q?k3LkW0seM5L/LMBH4U/+P0Idle6hTyWwQRKEU73L/BJvNDa9ZrlHk6T8MMIS?=
 =?us-ascii?Q?ZftvyzfYE2MHYmvIyKWbUJZtqL33NwC9cvyceyVv+LGeRU3aYwbF+7cbWGz4?=
 =?us-ascii?Q?BKZFAhFzGiZCzldyYL/Rdfxx4PQzu8z/PwqLWuF4H2ELvm+3cfZwBI2qjj75?=
 =?us-ascii?Q?mZNxAT2CDiHoNVEVCQ+P01IooacCTj5Qsk9F1PMea6urIkipKzR/43q/MnAR?=
 =?us-ascii?Q?JNUMivzMarBWCKhV1Zwf1lGhXpfFIXDw2pXYllOP4259kRaRY9PsFERKXxub?=
 =?us-ascii?Q?EUhqE0Or7b2Yox2sxdqf6AUP380zBWohdSmxwsNv4yxlJV+V10GFdnFlzKo8?=
 =?us-ascii?Q?nFuJRsywQNVn7a6BkLKCYBOynohxxGoOeJKk8zdE4Xg5RrQH6SHQlpnMwUVa?=
 =?us-ascii?Q?4rt/sL66vWo/nOn+Cxa+5Zh6xUjp+6XsRe5AFeliLtFduyWzj4PWw2ryNrIZ?=
 =?us-ascii?Q?C0lCydbXCo8t2fV22F2eRlv334uskc3t0hKnc7HcMYawNroHYUcJIqN26woC?=
 =?us-ascii?Q?xJP0WQaaz+BNU25RWt3adn/g/rZDGosQWyVVv+/i0nQHGn1VUghA988/XNnP?=
 =?us-ascii?Q?9AvdAzOVz6nYR9G0UhMc4lKgry3YWVf3lj3QDVASwzbfvPG/n4NbXtvCoCxP?=
 =?us-ascii?Q?vIERT8jkLEtpM4KtFAmvnCD/MdpfAyOYVqU8ZHms9fE1XtyBMkStEtvHMxm9?=
 =?us-ascii?Q?2S5F17OdyqNdCMwjJuX0sVLUF+8tuvf4QFzqd6OfFQBLv2VB+y91JC4Crp6g?=
 =?us-ascii?Q?z7r7ioA4yldWUNaXRxbL1lMYgNHG+r6aWogKTzDmOVyzKXXq9of20ShshqYP?=
 =?us-ascii?Q?P3DcBEbW0iI+vqcUbiEeQA5tu6Z/KCnGbLQtgnP1qMeVbaHNQknRHFer0eS6?=
 =?us-ascii?Q?yGg93QaPMh6sinYj/JZsLA/3C0Fjtp5ivCwDsi33LapokC9LhVUR5h4h6Mzs?=
 =?us-ascii?Q?WjHopxIZWm3ec+9An4vD7imRRubywoctcXPh++q/WIFIqDePiLeWF2VUQfW7?=
 =?us-ascii?Q?+md70XykUioW4o7XlZz1w3TUcb3GoHNJRDPSVgO7HVyXVwq4RXzLNHhs1J9W?=
 =?us-ascii?Q?5F4BP1hRLIZ8vitrPztQMzGFjWjzgXDBsh9ykySZBLaoak1htV+Rg+ELa7m/?=
 =?us-ascii?Q?GKsuBQE+O+47KMBxVG8Io3145uX1wD51GSjxwoUjGBSJHFLcfbo72iaW973I?=
 =?us-ascii?Q?HXKA7ANeGSz6eJm8eTNiawuw0krQEtYN?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 20:35:43.6470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1a7648-cae3-4c55-9c69-08dcc157a9ec
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7912
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 20:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203568

These tests verify that the correct files are left behind when systemd
is inherited and depending on whether the systemd and/or sysvinit distro
features are enabled.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../bbclasses/systemd-and-sysvinit.bb         |  15 +++
 .../recipes-test/bbclasses/systemd-only.bb    |  10 ++
 meta/lib/oeqa/selftest/cases/bbclasses.py     | 106 ++++++++++++++++++
 3 files changed, 131 insertions(+)
 create mode 100644 meta-selftest/recipes-test/bbclasses/systemd-and-sysvin=
it.bb
 create mode 100644 meta-selftest/recipes-test/bbclasses/systemd-only.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/bbclasses.py

diff --git a/meta-selftest/recipes-test/bbclasses/systemd-and-sysvinit.bb b=
/meta-selftest/recipes-test/bbclasses/systemd-and-sysvinit.bb
new file mode 100644
index 0000000000..b820a10528
--- /dev/null
+++ b/meta-selftest/recipes-test/bbclasses/systemd-and-sysvinit.bb
@@ -0,0 +1,15 @@
+LICENSE =3D "CLOSED"
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
diff --git a/meta-selftest/recipes-test/bbclasses/systemd-only.bb b/meta-se=
lftest/recipes-test/bbclasses/systemd-only.bb
new file mode 100644
index 0000000000..3a28713cb5
--- /dev/null
+++ b/meta-selftest/recipes-test/bbclasses/systemd-only.bb
@@ -0,0 +1,10 @@
+LICENSE =3D "CLOSED"
+
+inherit allarch systemd
+
+do_install() {
+	install -d ${D}${systemd_system_unitdir}
+	touch ${D}${systemd_system_unitdir}/${BPN}.service
+}
+
+SYSTEMD_SERVICE:${PN} =3D "${BPN}.service"
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

