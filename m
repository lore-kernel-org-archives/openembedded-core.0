Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E790C5320E
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 22:31:49 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.57])
 by mx.groups.io with SMTP id smtpd.web10.7245.1724193108010351671
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 15:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=q1X0irPc;
 spf=pass (domain: axis.com, ip: 52.101.66.57, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bS8eHHATAIhNNWMBEvqrJo0VkwfV0+wfwXlvHHtc48kBrSs4c//JC7x1iimPZnc5l6aDw4iFPWNHyZmlnk8FtJ4WJU2nGkhKwSsvHq7CclpRRWTtp0wwkh/X6zi1vVYHiHeHdmg4Np0haoRgC7i0AdVCJetYo8/AzgK9uDxvAudgL8dn5NyYl5CBhsgNxcQJHp165GrPeXFjruEcOFQMfGAsz28Gc+JmJPrDjaIrRRMmmlnw+JfzUjILoA0lC4hP/h03LyvZzExhaB8+DgIBu6v7ohvBrz8jvRSVYeGvBUFQRqrjQdDe6QM+PtYSjU92oHx12gkjkAQvmAKWIqCMkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZkOPqrB2RHdaow/+G5H3D71d716vKHnrO8+1wVBkUQ=;
 b=D0GkgKM3PQvFOmTN5BpdiN0hKSI71sBA/yBLREjD945E4afr+TsHZP5ng/gr/yTolPth+5lSQ/i10d+YRqemmMY42qgF2/b0Om8ryW+qsEUhk5QEj8EtWbcuukuqdrs2zYHSFguHKBxCfgy9/SyVqtgp2+/6cG1SFogobSXwOfQiAQplIHVDr6Q7w/SREWWyrNrz1P6bxmSwTYpspLCpMeswtZfDuQxgxM6UPw/VifrAw8HvEsYucA7tnNOUt2j+WEDHD1LZdV6y2hUyv3YgZLFKYpXi289UWw3WX4GW8PqVe35moUNtntojAW51qOxqM+umY6uRlLILSeFtPjKo1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ZkOPqrB2RHdaow/+G5H3D71d716vKHnrO8+1wVBkUQ=;
 b=q1X0irPc3yVHvADrzne+/Y/xtcfFvc7w+OeojSzHWEgExgHB7apg+GK6l8FXLLT62tICVu1AdEb08v8eXwpsQORLngCqK89pKWPbqkMWQz5NaGjl2LMtaFikLssZVcVuDC4SAN2hBoDoEIV0GRnFy1+1tJpyrbNn9tiyWQYY4oo=
Received: from AS8PR04CA0108.eurprd04.prod.outlook.com (2603:10a6:20b:31e::23)
 by PA6PR02MB10756.eurprd02.prod.outlook.com (2603:10a6:102:3d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Tue, 20 Aug
 2024 22:31:43 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:20b:31e:cafe::cd) by AS8PR04CA0108.outlook.office365.com
 (2603:10a6:20b:31e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.22 via Frontend
 Transport; Tue, 20 Aug 2024 22:31:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Tue, 20 Aug 2024 22:31:43 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 Aug
 2024 00:31:42 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 21 Aug 2024 00:31:42 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 732FF1B3
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 00:31:42 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 47KMVgul770610
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 00:31:42 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 47KMVglL770609
	for openembedded-core@lists.openembedded.org; Wed, 21 Aug 2024 00:31:42 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 2/2] oeqa/selftest/bbclasses: Add tests for systemd and update-rc.d interaction
Date: Wed, 21 Aug 2024 00:31:40 +0200
Message-ID: <20240820223140.770567-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240820223140.770567-1-pkj@axis.com>
References: <20240820223140.770567-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019B:EE_|PA6PR02MB10756:EE_
X-MS-Office365-Filtering-Correlation-Id: e1defadf-842c-4cdf-5068-08dcc167de28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fUAuRUqRIKXy+ePanOGnvrCPd6ZIrV3uHTDxqlS59vll+vRIqgp/V9PGIWOo?=
 =?us-ascii?Q?J/ydA6wLjFWa6FrI8zswh8eeCrkQ7Ed97BqUEYmnNUbEBv9v6EEBlka/EQ00?=
 =?us-ascii?Q?aXI0rUAc5TO/CfzQ/CJGjm5WDXE9DtZwZvjpdXqi+8zVlT+F91+eRgbngEYd?=
 =?us-ascii?Q?I5TVsfCFgI5CgkC5A3ovA96xKFWcvbEA6G3YeNXB80zx2xAWi7jP5a50RfAC?=
 =?us-ascii?Q?TgYDlneHh4sDaMEW6tz0y65C9namYDD3RpCoaOZZpYDDIgnvX4vQFP/ZzDG2?=
 =?us-ascii?Q?m9UQhEP4R2BAkH6BvG+5jVrh5BLZnmE+WxNU2JnH1xwpBgQuQMx0uWrhzFag?=
 =?us-ascii?Q?l14iz0q2cWfSV1GhN8UsIwIgbHtdqD4HpmoN1yDoc+auZ+fTNUGtuGhLDZy1?=
 =?us-ascii?Q?uPsrDGAC2oWJy0xvU7HdKYt3yB9c6O09Q6TZsH1/3CtP8IZpqFazYyOXdyTA?=
 =?us-ascii?Q?zqzeyafZrzkOnOGVL5N3+zsZpECP3pVS35ZZjc7Oo0j6roFakyHA3SWUn6em?=
 =?us-ascii?Q?3jKZynckrjI1KjD6isSBhHaj2CqXh/W3RTPHT9TT9DCZGbDtFdAK1INsevnQ?=
 =?us-ascii?Q?qSR1Vi9zrKrmhf6pT5iQEfw1kjyK/VmksjuHi6sPNHOUumo1scPw8gZrKWGz?=
 =?us-ascii?Q?L9FR9/8GuD9U+IUHQm3acfSj4oE4LnF5XFnZBr1gPOLWr/xBsHGrY+WvlzQj?=
 =?us-ascii?Q?LpcLebCgtuTE+XbbUKxB+tvwLjifZzHW9wXeWQoTxNChGWGXxIDm73BrlY0F?=
 =?us-ascii?Q?eXfjoH8QD1APyn3/fjQwu4Irfy1GediQ4IRgNOvGO6R3bEiN97RjqLMudsSg?=
 =?us-ascii?Q?FfzyYWg4/1S0SSF44Nts6Mtfq7EMS1Szqb5A0p6fMhckmfLsq6EUUYQYCMK6?=
 =?us-ascii?Q?R1JHrOJyrdV4xWjzndZNy5maeNMwAHavJ3RsOVuEVGUsZ2vlxdbqEo5av1ac?=
 =?us-ascii?Q?Ju21Q/i5WDsKvMqdLbsaW51NHiNHZ37G/e5G9OqIUVlYjjZgJInu9T3T+Ccw?=
 =?us-ascii?Q?q8Q7LchF+ldEu4pQzUbtpSxU85ntAp2jCK48tjQ64mtjvHoOqO/worWhLZ8g?=
 =?us-ascii?Q?EhykB39Ul8gPitGg59WDtfkJ2QUUUPY8dqzkAOv8sy4mguhCN1upvxepK0Vv?=
 =?us-ascii?Q?h+Bbvs6hojKNKTtdpcT7/i8rOzQrIMFK2wKjKUUa8JhYJZkThA435R2qczJq?=
 =?us-ascii?Q?IJPH9g7fygVWAlIoiogruqY+c9iytPiHRWxuibL4TjPO+RtQJI1rt6DIyN2l?=
 =?us-ascii?Q?K3Tk2yzZPyoSrFnsau6r1pbB9ptGgkWPaURJ6Be6WzyY8vfzx48hJkTVPxvL?=
 =?us-ascii?Q?ye00syq/YPMF4xrbaT+xY2luR6/cK4uGqFIT8Qw9DYAIzoUuyZG9q+6dlOe1?=
 =?us-ascii?Q?U8i7MU2Ls2UdKe2qMwr1hqgHqH8XGeepVj26tSsdTAiuOnlE6bq69CA/xkYW?=
 =?us-ascii?Q?/d6HAbvvz6vpOkGotFrf9KjRnIXGJhLg?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 22:31:43.2275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1defadf-842c-4cdf-5068-08dcc167de28
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR02MB10756
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 22:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203571

These tests verify that the correct files are left behind when systemd
is inherited and depending on whether the systemd and/or sysvinit distro
features are enabled.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Change LICENSE to MIT and add EXCLUDE_FROM_WORLD to the test
         recipes

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
+EXCLUDE_FROM_WORLD =3D "1"
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
+EXCLUDE_FROM_WORLD =3D "1"
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

