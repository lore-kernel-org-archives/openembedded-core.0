Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57CE6C55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 06:02:26 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10519.1785823345171496126
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 23:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=hNOe0YZU;
 spf=pass (domain: ericsson.com, ip: 52.101.69.56, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TvPlTnxx7GHja9uoZaKESsVZWpIapQmFEwkmWPmqigRB+s+1pxOXBTw5gBvSlt9vw8AI8UGzBrPKhqjs8ddWH/HCT8lda9YjcUDMFMmu833pRIK19VG1EAKkNmQdaO+UoAM+cAhOOCw8PT2xn2urFXeQPVLukJn9ThMq9uYKjbl+DWm7E6CelTo7xizdB0Vwx8C48mEMd3jijIdYRfpy7wp3yWrP1xCq1QNSoXq1Z1aAStCDoQb1UFiU85Zi1z2di8AlF1UnOm4Mw0IVMFFPkRYPdJTVz8Yc1Y9xH2v6bj8xol+xtWMP/slKGCdGD3oz2rm6TaKQV8BFtVUDgRL3wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsHsigVjtaPVySM4lCI4f+NRKSkRnRedqZGUUyyb3bc=;
 b=X7SqSRohKSIH0DkwOiKUm0CHAckDTUVrJmCP+mduOwqwfBJfcNqWothketnv2QpHjvnS20bYV3JAKnOvJyGLOMjjD2CcC489PAePUlyN/YeM6ET9ovlwlzsVNXTShERTekcrXDEcI338QulhXbcR2uqg5GpKNxyOax2xgjfJoewpcwQseI2Iz2sqykh1EbhxcI3B/1zK6fve5dgLVA5m4gkCz5FGNhOP7b5oBxeVFDdztp3zGV4+iD/xmD8o0c0RclGMefIP2qwQBSwd/obK4qbeszRJeHPuFLN4ro9KNpcMSRXhspdnuzf4klwcYuhXNq3aWJkbptx9CplniSyGqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsHsigVjtaPVySM4lCI4f+NRKSkRnRedqZGUUyyb3bc=;
 b=hNOe0YZUQXHNRHEAg6I8fRSXlCXI1auPyq2aHMID5guqQcYJxXqPXK+iRN4hQ3LJJd8jXKENUDXjf2Hgf91lFeAcYg3+T8uSgrBq6M5WeOtfHIJnZdKsSM6eGh1uya3jqUvX27OXo3p7JuT6vLWLMPys/4H7Gw6sZg+ZBB8yVp0MAaHX9JZPNcWwO2r2l9dP8N/R5HtXngYZZo3q+RKvJ8oE4J8SWbo/h1u20aGPDq+4UHTIKli62jcFq37K08NGg4ucQXJUCseZvO7FKBmG1V5UadLkIgBLibtzN0XVNNHJQFxUhu3hx1CVQCi1aBot7Bi8KrogY/wuU6zZsYqCCQ==
Received: from DUZPR01CA0114.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::13) by DB9PR07MB7961.eurprd07.prod.outlook.com
 (2603:10a6:10:2ab::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 06:02:18 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::a4) by DUZPR01CA0114.outlook.office365.com
 (2603:10a6:10:4bb::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 06:02:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 06:02:18 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 4 Aug 2026 08:02:17 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 07D0C95800;
	Tue,  4 Aug 2026 08:02:15 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id CFFE4700DF4B; Tue,  4 Aug 2026 08:02:15 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2 2/3] devtool: upgrade: read changelog blobs via a temp file
Date: Tue, 4 Aug 2026 08:02:04 +0200
Message-ID: <20260804060205.179715-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260804060205.179715-1-daniel.turull@ericsson.com>
References: <20260804060205.179715-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009524:EE_|DB9PR07MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: 391d0425-1bc4-4f92-d67d-08def1edf0b4
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|10067099003|11063799006|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	U5fF+CfPJ3+YBp35cfrNG6WyJFoIA+u1yXm9bl2xgjjuI7MJW1Lkx0B/ZuW8f4/Sx2808SDoCvWyc/Mj65q0+v9FucpikTWmydw3BLqVZJaxSaGJUvL4nQBz9PU/AxNzmVwaDF7lMr3OX2eRh+06FfPcz59qlACl3yrfJELce/aH4a7vjBwaRcmFrHwLfEaxjvPmaMdUQpmf0QXmk5bkfxTfHL0JbPKMtbOl2dsxwRcLPufXoiNhYtIl31bCd18w5qPoDKra3u7toj1S8AoycNn46E/xT+LFFE9mUPDvm6sn+XP9WtJGKGe6XZhR70Xt9lQdC7NUvC44jz+PcJ6fLMK93IUAcjmeg/uVThiNC/fOfg3W7d0Ju6iDkKxpMQXxF5L1aCXq90N3A5LATF8ePTiKnKR4LrXAPDpE3AntOSVEPBDfnRSaYTnhis5nt32U1iErcZFqSLPcOOVPkSJ8OsZGtUHxL389HkKerJCBahP9d6Fph/VQe87f8xeufoHTF9DIeff/mZxeG1yaWvWp6UEKZUlISOwwYP04SVLsy5HRXGjXDnzprq2LpOw8Q/a4Wr+fftZ7aDQWy4Wwr6OLoEuF+36p24LnLyJWS8gnptLP8UBh0F4m/f/fIwYOjG6Y9RmMnYRrL7QVVJzWB5mV8hiOoPrUeKTXWQTEjHnsIdd2lbCNe0aGn8K0audUzVus+2Lih57kg42LR1BBRsxVMQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	A4hpJaU+7Ovv91MUw28kEQi7CVedqj96Ur9hXLeBrY4dR8I6PLfZDltov7thuDS2tXM77An1OhuyDrhBOzTS+CHNOES7cQvJlBu7B4reMGMuxaY0uSSUYVwbcF2Ms2qGTFTrG0EDlP2dJqz690nY4owfEgtsmeRqMLTTXNbEJT1OCreGuk22F/Zu+fmrgxEAYkgTlQe++YxZwPi0PjgR9iaUKs0p+ZL9RY/JAsmQ1GBoGKSNBqMrTp66MuUNnUIJ/TEwWuagGTXcjt0AP0WJ0APgwfaTKCbvhB/PRI32pPzCD/ORZEDAHejJADfGvZSiyDYCGhB6a5GCjV+0y21R7GXNrrqhbedgEwFVOURAFel5kIz7bsxau1nVpLqLtJ2RqF4VxMrPyVUHxarL9i0VkuSR89RMOWD+KluYS0RoJR/kxCXXfiS9hbgUlRKZZJh0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 06:02:18.0312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 391d0425-1bc4-4f92-d67d-08def1edf0b4
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB7961
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 06:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242698

From: Daniel Turull <daniel.turull@ericsson.com>

bb.process.run() always decodes command output as UTF-8, which raises
UnicodeDecodeError for changelogs containing non-UTF-8 bytes (e.g.
Latin-1 author names). Add _git_show_file(), which redirects
`git show` to a temp file and reads it back with errors=3D'replace' to
tolerate that, and use it for the existing per-version release notes
lookup in _extract_changelog(), which had the same crash exposure.

AI-Generated: Kiro with Claude Sonnet 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/lib/devtool/upgrade.py | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index 495a5b8217..6883c99cce 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -589,6 +589,18 @@ def _resolve_rst_includes(content, srctree):
     return ''.join(result)
=20
=20
+def _git_show_file(srctree, ref, fname):
+    """Return the content of fname at ref. Changelogs occasionally contain
+    non-UTF-8 bytes (e.g. Latin-1 author names), which bb.process.run()
+    can't handle since it always decodes command output as UTF-8;
+    redirecting to a temp file and reading it back leniently avoids that
+    restriction."""
+    with tempfile.NamedTemporaryFile(prefix=3D'devtool-changelog') as tmpf=
:
+        _run('git show %s > %s' % (shlex.quote('%s:%s' % (ref, fname)), sh=
lex.quote(tmpf.name)), srctree)
+        with open(tmpf.name, 'r', errors=3D'replace') as f:
+            return f.read()
+
+
 def _extract_changelog(srctree, pn, old_ver, new_ver, old_tag, new_tag, wo=
rkspace_path, is_git_source):
     """Extract changelog between old and new version using devtool git tag=
s."""
     changelog_content =3D None
@@ -612,10 +624,10 @@ def _extract_changelog(srctree, pn, old_ver, new_ver,=
 old_tag, new_tag, workspac
                 continue
             if re.search(r'(releas|relnote|change|news|migrat)', fname, re=
.IGNORECASE):
                 try:
-                    file_content, _ =3D _run('git show %s' % shlex.quote('=
%s:%s' % (new_tag, fname)), srctree)
+                    file_content =3D _git_show_file(srctree, new_tag, fnam=
e)
                 except bb.process.ExecutionError:
                     try:
-                        file_content, _ =3D _run('git show %s' % shlex.quo=
te('%s:%s' % (old_tag, fname)), srctree)
+                        file_content =3D _git_show_file(srctree, old_tag, =
fname)
                     except bb.process.ExecutionError:
                         continue
                 if file_content.strip():

