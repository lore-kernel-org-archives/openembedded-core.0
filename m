Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D99ACDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:35:38 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20962.1782221729473356181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=D3NCHklF;
 spf=pass (domain: est.tech, ip: 40.107.162.45, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UyHf7akgKmd+PsBsjht3TQZq2Dru4+R6de4kmuNo0fOqg4rML9bhj3BCBK2D5oYE2X3sgvfSSJRzZ4woZirsT+4dhdjA8C4/isxDlkHwgFNA610B3+qzK50AyQSbE0yRNgMRdoIhUpxUDS0+sFoS27NOq6r2cdoeFZVNy7a4G34sh+tHaCfmD3dMcHW8G2eDkTJc5k/U7uHRpskHtyECfjiRHx5pmVCZEZxP4PbXHpE6m8n5Ck1AX/O6e/PkuIY5zCTPsCCgW4eCjp6PtLNQO7lzpXFlF5qFLDzOpQWuy4FXjJo53V8zWSRA1H01nFCLp5WxS1sMv7nLjqutw7EEwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/DhFVIi4jNXVhDXQAOm+A68oiuS0+O2tR/Sdw+nroI=;
 b=O8LMh8qdgp+uWB4NBhRMV6xH9Hsl17yOdkf9tNpKSIlkE+Sjnxlirb8Ot1e6/464Vg0aB+hyqPb3WxmAareLOsp2JukK3pmnYP3zN8PeP5QtomqBgira4SVdXkB9nxVgTST++Kgg32Adj8coS3Au9LxB3cxNy/W6oeDzWVS2SEY8zK9OJy0lwCXAVWyWw5H0ikwQ3A3eZp3f7gcX+DL3Ioq5JCbrxX9NKddsm3yDutnvKMW0m0mb8uMehebZwUZlPMUuxupCX2JBnlSLUbBG/aNkSo/8D4uKeyy4ZKn0kIaZ4B+zIG9jccvisI3jTiRUpUkBsTJ9h5SeQ8rpBEJoRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/DhFVIi4jNXVhDXQAOm+A68oiuS0+O2tR/Sdw+nroI=;
 b=D3NCHklFMSVRS6ZB4bo+F9JjbgNyyTIAsc/M8vH7s2zbfP2nx9YzleFoygDKfJED3QMVzAb98p9VFf8SsZwG2sSfYgHerN9NmI5pzrJh/NKns8fYZTv5J5nknJZFbHiPcE7+TSQp1mVa7u4jovkA3ZU9t8xJ1V9ya1fsdB2qLPJ8hRBVGIxAGF2myUJuPBFMuNH79MoLctk0hDc7XVUK/os+DVtFY2AffQZH8biYo6Ed87rVVRe40oJbrsidVNY9IV+jE/DBMB6HJ9FbfUZ41ZKQrZQEVvZ4b4ISUN8E4y/7RNHyqH51SOygQ3HsfR2yQ9rvWP4lLr8aTR3747RZAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 DU4P189MB2742.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:566::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.20; Tue, 23 Jun 2026 13:35:28 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 13:35:28 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 2/9] oeqa/oelib: add runcmd tests
Date: Tue, 23 Jun 2026 15:35:14 +0200
Message-ID: <20260623133521.17053-3-anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623133521.17053-1-anders.heimer@est.tech>
References: <20260623133521.17053-1-anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0046.eurprd04.prod.outlook.com
 (2603:10a6:10:234::21) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|DU4P189MB2742:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c01977c-d52b-48cc-3597-08ded12c4a0b
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: ynHStapMzCKfX67rhIoRqw1o5gbRQWHbhc1dI8ktPKVsFKozV+p5JhxcszIpml8R0+3G8pOlVw1gRKouQ/fqUOkrbo7IeOdgoZP3tXES3+W5S208MsCXrkvw/1sBDfHdaoGxNGXTUqvc0DpEoInwHeqwWWpBWaBTPG/JVf+3bf4C6oZhLVHu/vcLQvVT6q2QHL7YP+HD3HyaobudUSuRlCmm3eKoFu7UkJui07d6dQwaoZHTfjQhcnEd9A0u9onr1AUXlmOj/zk6NOYOagimKH2M/ernMaC8tNYckwcZqcj6gN6aBfjkpe2byy0YrOAGEzU/BMku0foO40SCT6Y5C9eUpaKyYdy9I+ww3MvFG/Sohh3vq1r83Trtl5DVEOLh77jBTVT4G3xzN4a1trN/LjgkDQ75xccJAS4m5BBp4lQlx9W5o3ti3IocA/WHmz0OpPlD6wuMw/I4exIUE+19rPdkfwFGMkgc5D8keKA2Qj481Ke8jeIC73BtUsReT39Jo05niMN8i7bwLo/PSiRUxgw+IpFH0LFhr7LP3Teq8SA4URLiOIIWBT2yVyx/ogtv8lghqv1IYJAhWojymppzrT24g/rlCgcvBlz126+PCYs4LQD27tPTOHPfPz7G3KgIluOsMLtgfTn5XzUis9bt5ozxkVeUaTZRDbUBe3kqjDU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DpFiXiULclc2nDcl4V7pfaKdyvs3yIy3nvOEYFKH+faVY0SgSwf/0UlOJPw5?=
 =?us-ascii?Q?mi+Wxg/DgpzpQch0uV3bh6zDI77fayuZOpAaDSGiPyrHXJbTniB9K1hIwXO2?=
 =?us-ascii?Q?BZ4gIW4ukSOaOFMRuf8/mGOU9nktrnxAJXtzaVj0TEH5xpGBBTWsOokj0YFp?=
 =?us-ascii?Q?XiuC5MvG/BSediHmQatH7kSwFpMRU96058pUlifwY03+AYSXD4JW3yP9HUFe?=
 =?us-ascii?Q?b+rvkqrNfvREDnYA6m2/2gwSELgp0BF9JCythkVEcF+tAC3HhFH4dRDc5n3J?=
 =?us-ascii?Q?MtL6XVFXxi5gvbwlb6dK4GvXTcRsZ1NKzWS4cDPXMAaLcVtPErgcE682syzf?=
 =?us-ascii?Q?ywWtCRXMIpDZrn+f2n1SwrqmshGSQ/pR7G8j92pXryWr2qlDbmHLSDSbO2H7?=
 =?us-ascii?Q?B3ozGlVbcp5eCkjoB+ztsBw8GNUs9fB6iO71dFDGKuaWTrVz2y7KF+eUSQCl?=
 =?us-ascii?Q?ZBVkMrPBfmJyBc60roJljkUawoFRSg1L7/QvqkKgFqAHY212uL2WE8ZwoLmN?=
 =?us-ascii?Q?kUdV++X5dw4gv1mqJb2th/eaDmCJv3V7Ruagz9Um8FCsQA0Ap0fobO1sQO12?=
 =?us-ascii?Q?Pju1SCiLe/ahYjSxW0mpk2LKLAx1wqXFVGj/NmgzHmcaJ1mZC4WU/jCwaw++?=
 =?us-ascii?Q?BeAPrL8Mv5vXXZB4Uou1+E3PkSEz8zDSYMmm8AuEZvG+5GZUvdqUDQj/c5Mj?=
 =?us-ascii?Q?KN+DT6XaVBrcauQ7XLviNVV+oOkbv+g57TG2636u5fDPPJ3XC7s51+YHhjfs?=
 =?us-ascii?Q?mtBjEPz0tkt1Syyf5FEzcmc+V9r5ZhIFD45fSc4fgPV9ZtEDfGFB10iHXHGV?=
 =?us-ascii?Q?1AG4gsARYuoRoZ21fJ5MqJZke/Ls6I/RDOjkrN6boYFEKfrCy3cEjoQD+o9F?=
 =?us-ascii?Q?Hp2eghRCWndBA7gfbDHKWnWY2DnPsP+jrD9Nn43Yv+4pmoa8Oh9W3V6dJ726?=
 =?us-ascii?Q?uW1iEQnyORNy5HJCEIdrwsONj35fbQkH5Qyyz8EU8plyhumN+istBmQ6Xn1I?=
 =?us-ascii?Q?Ri/maGdwUUhs+01+JDkaimJkyd6sC5KKJMk7vcIQfdTBhwEGYGV77V60MK1K?=
 =?us-ascii?Q?+jbkfv8nGxWZft1hrmoqhErpZI0PuBsTeJuEIpnkyiZiMD0SO1Cy6kKBNwhB?=
 =?us-ascii?Q?D02efiHe1FeDJhns4qTHxFmac5t/rvAg0nX4qWvtO0xSFPE90B90uEbH7/xx?=
 =?us-ascii?Q?NbhW53Up+h4MKzyx5rWd1yn1u66C4TfRCuSVd23nfgI8Pdu9yjWGPjSGFR03?=
 =?us-ascii?Q?C35+b5+LpBr+mJ/Qc7JzzxVgMAZiGm9TmRD4UqWx0Qno2OuUqlV8oCZW0HPI?=
 =?us-ascii?Q?aLyoUQy9pgrGLy7jasJvP6Y+i1xN+gpkcHEZrwJe8iahC2e7NMtJ+/TojBhP?=
 =?us-ascii?Q?C3h/KymZecqm4ldoMGz0GP0InsWZ1ifbQWaLfITFnPnU/wVU426CGg4Y0IlR?=
 =?us-ascii?Q?nS9i6rCSFt6xyHjKuyjrOFLIW+UaccSSuBv6o2aJm6k6kZ//xOI3jgFkeUWa?=
 =?us-ascii?Q?7PnkxApNhUxHqMzxkCNMSMGA9nS+6UNQDOvMT1iIL/izD34yjgTKrZ/ckqd9?=
 =?us-ascii?Q?y7YJz0QL+TyrUTCYENMgGH54NhVoWH0lFxi4iWTfG/EFeiB8u91KYRHyIUE+?=
 =?us-ascii?Q?2BjjxQZH24n+xFQ9IIiofTCdBd4B/jPr1QbjjizJkIvebAJgbDQqmUck8Phn?=
 =?us-ascii?Q?LZC27AXCV9Wa7MqbizqgQ1Jfh44YW9g1b7y0lEIUGDIi9Sb/sGmBAtP5FKw0?=
 =?us-ascii?Q?BGqXnZHvDQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c01977c-d52b-48cc-3597-08ded12c4a0b
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 13:35:28.4904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1dgMVF50/VpY+upBNPNH/pnKzHrCoISWJ2RCBltz7z1ZXISd4BIipmMrt21WPSKhboG6w/9Kb1wEsQntD50DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB2742
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:35:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239395

Cover literal argv handling, explicit shell use, subprocess exit
status, and exec failure wrapping.

AI-Generated: Claude Opus 4.6

Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/lib/oeqa/selftest/cases/oelib/patch.py | 45 +++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/patch.py

diff --git a/meta/lib/oeqa/selftest/cases/oelib/patch.py b/meta/lib/oeqa/se=
lftest/cases/oelib/patch.py
new file mode 100644
index 0000000000..4cbfef4ce6
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/oelib/patch.py
@@ -0,0 +1,45 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import sys
+from unittest.case import TestCase
+
+import oe.patch
+
+
+class TestRunCmd(TestCase):
+    def test_runcmd_preserves_argv_elements(self):
+        output =3D oe.patch.runcmd([
+            sys.executable,
+            "-c",
+            "import sys; print(sys.argv[1])",
+            "value with spaces;$(false)*",
+        ])
+        self.assertEqual(output, "value with spaces;$(false)*\n")
+
+    def test_runcmd_allows_explicit_shell(self):
+        output =3D oe.patch.runcmd([
+            "sh", "-c", 'printf "%s" "$1"', "sh", "shell value",
+        ])
+        self.assertEqual(output, "shell value")
+
+    def test_runcmd_reports_exit_status(self):
+        with self.assertRaises(oe.patch.CmdError) as ctx:
+            oe.patch.runcmd([
+                sys.executable,
+                "-c",
+                "raise SystemExit(7)",
+            ])
+
+        self.assertEqual(ctx.exception.status, 7)
+
+    def test_runcmd_wraps_exec_failure(self):
+        with self.assertRaises(oe.patch.CmdError) as ctx:
+            oe.patch.runcmd([
+                "/definitely-not-an-existing-executable",
+            ])
+
+        self.assertEqual(ctx.exception.status, 127)

