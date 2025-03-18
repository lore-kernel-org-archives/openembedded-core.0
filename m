Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FDFC282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 23:25:57 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.55])
 by mx.groups.io with SMTP id smtpd.web10.752.1742340350283125511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 16:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=rjfaVLnj;
 spf=pass (domain: axis.com, ip: 40.107.22.55, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWfwctuKw+A7atEpuQEayb/y43ue+dGfT7zRYXONo2l+hVsAx6PbpdR5vvdgaaMORWoWvEIl1Bfs2CBM6BAQQAxiZm1UHwhd0yc0/02P4kQ51dVs/D0tnwRU4FG2RDLEZu+Agfv7Md4jnfM0ky6Y41IikbCF97HmbM2L+MXy60vlVrysOypiAFKI0lvAKCY3y4YWmuZNd2YTc0gqSS4wlNvNsS4+AI3IU+OvGuD2G0FvfD/Yhp622ZMTp2MqL/uOJeTSdGflGcGCocwTCQgu9+fBxrAv/0GD+rcmicw5gMqQmnSFCd/BZ5oAdC7b7K3dD4NxF0VtIxOhfX0VWyE3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkJk9I3dZLtvU/kAT9hlimS/8FK9jl5mrLRiaEBfuHE=;
 b=l0FECTbJaimUC1KF/U2fYtrSsoz8mPXrD0nrbxncQvsplqvU+8P7E/XM7uur68m4SUzENkWSUWORj7yS++iNDARQPoGby2ApgtVdJuLaGMD1Lav5kCgl/g87rsFNwYw5pfMtsgP6xXWGSdb81g3pEM5vvv6BRyUMCJwMIqKCweGUlQmJ2nKT8tZdpYvpr/VlzDljiUaEI8dfa0pfQNj1qZ44p1VjcvDb2jKQeJqgKOsKLrsCW/H/CxCPdqVqnXa2j1lLyYgA+owBX8TTylcDouwEO0VnQFpv6YPPDejXQN+eW1w0yW8Hqff177HgW3RxvB4e9VHRu/wfIDJG8kgXuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkJk9I3dZLtvU/kAT9hlimS/8FK9jl5mrLRiaEBfuHE=;
 b=rjfaVLnjAxyG3RRqfG8Zr8p/og93LFifQ6AV4MZ3VVoo7KlupnjN/ZkljpvlsY3uNadEE0IUlmpZsOlyfPUZPQEbk6gnLWF/DoM8U3ewM4JvAUAecV45mDhwp9FvrKgP0pLLI1+tzgqurRv0dxKSkwSRusWz069QJiIwtfKwMlM=
Received: from DB8PR09CA0032.eurprd09.prod.outlook.com (2603:10a6:10:a0::45)
 by PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 23:25:45 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:a0:cafe::ad) by DB8PR09CA0032.outlook.office365.com
 (2603:10a6:10:a0::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Tue,
 18 Mar 2025 23:25:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 18 Mar 2025 23:25:45 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 19 Mar
 2025 00:25:44 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 19 Mar
 2025 00:25:44 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Wed, 19 Mar 2025 00:25:44 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id AB579D7
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 00:25:44 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 52INPiko634257
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 00:25:44 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 52INPhKF634253
	for openembedded-core@lists.openembedded.org; Wed, 19 Mar 2025 00:25:43 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] devtool: reset: Escape command line input used in regular expression
Date: Wed, 19 Mar 2025 00:25:39 +0100
Message-ID: <20250318232539.634222-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885E:EE_|PAXPR02MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dfa54a3-e5d8-48ab-2f66-08dd66743564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7g0WTVbdYGVAjZ5FIi0ga90MxsjgLCKNnOXsedwniLdCERDoVVlPnabJNltZ?=
 =?us-ascii?Q?l9pxVIoPWlL9uGNQ9tZFSRcHHhIsEAILXPdctZvIyCTV7hqG0LzNp6X0pyas?=
 =?us-ascii?Q?0v1JcOqUaGavtYaus+isV1TTci1zRh4PenPGspv7qee6iZwFnpYcxmxt1Eav?=
 =?us-ascii?Q?6EgpYkiS2xd8dcaEOkQ8Fy1kBZ3SN94GHiXR7vra6gNRKAtA2/UQA3cKp2eh?=
 =?us-ascii?Q?cPO4ClAfH0VQsRytRHjiWUOBctJKg4FBbEyHmHPIB9Ti9V18VkcFeZ0ps4lx?=
 =?us-ascii?Q?hYG62kZNkluD9/X7T9HFBBU31TK1HAwlFxsLL4Xjdr5uMEld5inj8eWt41u1?=
 =?us-ascii?Q?FkEvY0Z88PX4hRlQVtqs16G+LxCl4A98K9FxR+8WaCP2Fm3SswJv5UwhPBng?=
 =?us-ascii?Q?OGy0toPApxXFB8m0Asv41SwztFlaE87o9BAgCW/TtC+U6cnckWdHKuYSkSww?=
 =?us-ascii?Q?vxXWYUtCzqo3iy2mtLLmUGzZqooEAcDhWDM3X0ru0Cu8tkzeAlwKdmIuqel1?=
 =?us-ascii?Q?bKP162Hv+FYYAa+AvSHMEbMjWtmkXTL1UVPQq0crik7v9Gc0H2hTTIibV3+j?=
 =?us-ascii?Q?kKpGqLxviHwKO1AI9wXYHsd63nP1yPUfvq8Oz2912i/3E/iQ8yCgucr094l6?=
 =?us-ascii?Q?Gv+uE8n+yfzsqeN2r0yP4usIvqviRcaAwGhW2+2+GL1sHWePnQ7pBV1dhQia?=
 =?us-ascii?Q?t9Uc7Sx/DbnyfL/MdWIQjVxQpR1oQOojy7dqzvSDjMC0v0N5J1pfU27/yKse?=
 =?us-ascii?Q?d/zqxjbPVfFCDwx2BqUfBICA42Dbzs3DkSM/zofEv0nE7vimxfy7Fx8X6dYo?=
 =?us-ascii?Q?8xoYvKs6LL3RNI+mjdywMIaAypNKXP3wM2x02nBGjyDKCe86FBY5J997gwtJ?=
 =?us-ascii?Q?oVjEvD5lJZjguOG4/Hf9PwATyNHd9fEt3bSpAxCeINg4xoY21a+iy+MqSXZJ?=
 =?us-ascii?Q?J595hR+dxFp8lIlFCKTZv2f4CGvDBstM+pMUoGyVe5+7Eq+5In+iVkR10ibx?=
 =?us-ascii?Q?Lopg3Ce+CZPuwwldR3Rl1cUvwUvE1FbYA8VCm5WznkAOZAkG9omEGQXNj2lh?=
 =?us-ascii?Q?yCFr8N5mruIjd5ejpLShpuTW9+RX545DNF/PqxIHHn4+Xtr4h0O+wi+Ui/Eh?=
 =?us-ascii?Q?EJziLRwNANM+CSqdhEe3JQLiDtWUuC88U2uHzcCWw1rYRzPpND3IzDJ1lXPd?=
 =?us-ascii?Q?DWviSoHi4noGhy+9sJFDXqsOhfX1aBtrUTHhZINT179PLxAWc5cDu2xH1I5H?=
 =?us-ascii?Q?UGNhdM3isPXMoXJTvggtU6ufpBprgLPDlxzOgm0v2fpUGnnPjq/Fcncn7bSG?=
 =?us-ascii?Q?ESOoIc7CHZsk2xiYKS/4sOFh6OIvRS+MamHQ0wU/M/s7eBpRX9mD/Zj9oaMH?=
 =?us-ascii?Q?PVKjikARbhy6rn1nt/j7lZJALYIeexZQqLS8VMucRl/ApfWDDa2geLZD9DUP?=
 =?us-ascii?Q?RIr+riu2TOiMI0HgyNJAUdj9pP+1IbQ5D/VOXB4HvlJK0oT2HCQCufUm0YnQ?=
 =?us-ascii?Q?WCzriUZqDZn9I/Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 23:25:45.3694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dfa54a3-e5d8-48ab-2f66-08dd66743564
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7310
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 23:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213260

Running, e.g., `devtool reset sdbus-c++` would result in the following
error:

  re.error: multiple repeat at position 35

This was due to the ++ in the recipe name, which would be treated as an
incorrect regular expression in _reset().

Use re.escape() to make sure all characters in the recipe name are
treated literally.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../devtool/devtool-test-reset-re++.bb        |  9 +++++++++
 .../devtool/devtool-test-reset-re++/file1     |  1 +
 meta/lib/oeqa/selftest/cases/devtool.py       | 19 +++++++++++++++++++
 scripts/lib/devtool/standard.py               |  2 +-
 4 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-reset-r=
e++.bb
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-reset-r=
e++/file1

diff --git a/meta-selftest/recipes-test/devtool/devtool-test-reset-re++.bb =
b/meta-selftest/recipes-test/devtool/devtool-test-reset-re++.bb
new file mode 100644
index 0000000000..35672a5265
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-reset-re++.bb
@@ -0,0 +1,9 @@
+LICENSE =3D "CLOSED"
+INHIBIT_DEFAULT_DEPS =3D "1"
+
+SRC_URI =3D "file://file1"
+
+S =3D "${WORKDIR}/sources"
+UNPACKDIR =3D "${S}"
+
+EXCLUDE_FROM_WORLD =3D "1"
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-reset-re++/fil=
e1 b/meta-selftest/recipes-test/devtool/devtool-test-reset-re++/file1
new file mode 100644
index 0000000000..51f466f2e4
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-reset-re++/file1
@@ -0,0 +1 @@
+A file
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index 115dc24d87..ddbc554af0 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1757,6 +1757,8 @@ class DevtoolExtractTests(DevtoolBase):
         self.assertExists(os.path.join(tempdir, 'Makefile.am'), 'Extracted=
 source could not be found')
         self._check_src_repo(tempdir)
=20
+class DevtoolResetTests(DevtoolBase):
+
     def test_devtool_reset_all(self):
         tempdir =3D tempfile.mkdtemp(prefix=3D'devtoolqa')
         self.track_for_cleanup(tempdir)
@@ -1783,6 +1785,21 @@ class DevtoolExtractTests(DevtoolBase):
         matches2 =3D glob.glob(stampprefix2 + '*')
         self.assertFalse(matches2, 'Stamp files exist for recipe %s that s=
hould have been cleaned' % testrecipe2)
=20
+    def test_devtool_reset_re_plus_plus(self):
+        tempdir =3D tempfile.mkdtemp(prefix=3D'devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */worksp=
ace')
+        testrecipe =3D 'devtool-test-reset-re++'
+        result =3D runCmd('devtool modify %s' % testrecipe)
+        result =3D runCmd('devtool reset -n %s' % testrecipe)
+        self.assertIn(testrecipe, result.output)
+        result =3D runCmd('devtool status')
+        self.assertNotIn(testrecipe, result.output)
+        self.assertNotExists(os.path.join(self.workspacedir, 'recipes', te=
strecipe), 'Recipe directory should not exist after resetting')
+
+class DevtoolDeployTargetTests(DevtoolBase):
+
     @OETestTag("runqemu")
     def test_devtool_deploy_target(self):
         self._check_runqemu_prerequisites()
@@ -1850,6 +1867,8 @@ class DevtoolExtractTests(DevtoolBase):
             result =3D runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, tes=
tcommand), ignore_status=3DTrue)
             self.assertNotEqual(result, 0, 'undeploy-target did not remove=
 command as it should have')
=20
+class DevtoolBuildImageTests(DevtoolBase):
+
     def test_devtool_build_image(self):
         """Test devtool build-image plugin"""
         # Check preconditions
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index 0cdb9c6cfb..cdfdba43ee 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1951,7 +1951,7 @@ def _reset(recipes, no_clean, remove_work, config, ba=
sepath, workspace):
             lines =3D f.readlines()
             with open(new_layerconf_file, 'a') as nf:
                 for line in lines:
-                    pprovider_exp =3D r'^PREFERRED_PROVIDER_.*? =3D "' + p=
n + r'"$'
+                    pprovider_exp =3D r'^PREFERRED_PROVIDER_.*? =3D "' + r=
e.escape(pn) + r'"$'
                     if not re.match(pprovider_exp, line):
                         nf.write(line)
                     else:

