Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B65C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 06:02:26 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10651.1785823345321802484
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 23:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=ODP5Ssus;
 spf=pass (domain: ericsson.com, ip: 40.107.162.31, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ObL1Rfzd/NDCNf6EKNtAZ+8vYEo3CQvSOhmiBf+TR+TKcUAzQDlDmmhnIgtC/p9RFeGxQnHthSsND0BOxoFtPB1LIrF5qkzOTut+/IC5QsBQp/ap8MRlplXO94g6EHZUo6jhF3torw9Lru5FM2UJ1ckIedBEBwQw7YfTVu3nr8Fnq9UhH5k0NNMUtnAVsG+R6mqW0CD+qf3uMmzZJvI/iA4GIX8BfEVLlHdYQcrLJ3eWTDvkpKLMsmhRrO58hQCEIQmvfoshs8JawmFdUF1XdrdvCptXdtiWCiS6xQLwdeZbBuJOx+P0rp3QyL49Zjm3hkX28Edlj40JIVKMhDK6vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1+uF6kOC/21Q8lOP07YR21Yabf9tyEBzODA8nvm7i8=;
 b=jTVJJJF+rBU6agXcSPkGB5QPmwLb07GII8+C01tcOtJu2y1H+xIemrBIKaicTm/FyGV/aTEpmoo+3+/h9tYJWtcCiY/6SBKEHQ3v2DK2EywWakgMzXVPf+Y4cGca/Dg5UdSEFGl2Ta2tkPDFH7Nt6gBjefLR4bdVQUMJpSTRYF9kUQcORS6YvpCftIVQPm+OUqD4UIbtIOX7u+LvgUCE7JouqtqWc1VptqWCR4NrAAuH/iFf98DLELRmY6hU5Jvb802PBqFl6brjTdOn3IY54iGCLopg9V8XATYfRVa8tm27+usdsDyFmy1+YYAVRQFfxlr6CcpPiWDGPJYhNw/Hig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1+uF6kOC/21Q8lOP07YR21Yabf9tyEBzODA8nvm7i8=;
 b=ODP5SsusQVCVO+v7N0oh8nBeugoxC0Nh3DJkQXqCS4nDR1Qu8pqzA5JFHmb8XmA+4DYF/t8Mh3tWCylwMnu1445iTey57bQI5hGKGGHS9cAQxHALyFBk/guos/DsF68DTW+udERaf9QiBF2Oid0T9fBtHyFukHyahibKWagfq9sISNd5fkuBzkp0sxKXiTq9ZqIEVvjKlNcqeaJm4p1EW5c9QH+hw8AddRq/UrGcv/gDN+wgpu5gwvp+BaWWogk+PvvCWn2nN22l259HiNLPRMX8rMUJsBT/S/HtIpjeBaBE7woxrk8/kb/YZaSeR6DNogA6bdRzL9rn8sVPmkueeA==
Received: from AS4P190CA0043.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::14)
 by ZR6PR07MB028784.eurprd07.prod.outlook.com (2603:10a6:910:da::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 06:02:20 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::ab) by AS4P190CA0043.outlook.office365.com
 (2603:10a6:20b:5d1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 06:02:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 06:02:19 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 4 Aug 2026 08:02:19 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 0A15D4020C3B;
	Tue,  4 Aug 2026 08:02:15 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id CBFF0700DF49; Tue,  4 Aug 2026 08:02:15 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2 1/3] devtool: upgrade: ignore changelogs from 3rd party
Date: Tue, 4 Aug 2026 08:02:03 +0200
Message-ID: <20260804060205.179715-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260804060205.179715-1-daniel.turull@ericsson.com>
References: <20260804060205.179715-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B622:EE_|ZR6PR07MB028784:EE_
X-MS-Office365-Filtering-Correlation-Id: daa5db28-1f40-4b84-dbe4-08def1edf1e4
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Xe08ByuZx4EPogSGE+0C2bOJasQOK13xiFW6MXXz2daEEF01rRTTonlqYMq93MbICSvaODj1s/T59ocs6qRlqSu9p4kfJzAnsgV1iaWjYmcBxY1FXHsKlzcGM00cBAgFiM6tO4xoflJO/GTzduC1VMTJaI3SCF51IuDaKI6X3RWZCBX1Mg5MAG/Td4o/72W4tZbQqA6LaITTtQKgKY8AKBTQxaGKbd3nZXEY/2QdY4sJpEfxPIzxM7QhiaKegSMCDSNFAhj/ZEoxxylOInyLgSaoBXxO3ppI5Ti7XJNivh3GbSMiVkEabL+skTyCMpT8lyW6bWSJfB2kUOrMJXzExO1mym04WAPO4P4BnHyuvbzAs4BZWHbhxW5b1EyqSjLykOeHRXF214fWoNlUTBHFLWKy0CZZ1gvO+0j49RRKIFfUt8+AkiNaKgf4egKNExYbsmuAeuE6SfBWEsmtLkTWlEgY0BZKswA0LV4ATEyGZ1tDw6+HzBsWx9BJWj1qlXTvak09XtcngwXLlji3ZGffInEaSCuy8P6cuNFyE/wz4PQPmEqAXMaxPMLC6+4OTWnmJ2HTQOK64ZW6K22g8qJsOK3AIFOGzo7JpvnNP0OiUxRzbRjQt5HTuJegnYL+qpvgijMPMLtt5JWA8cvL8sJvjwUa4SHkjff4TeV/Rfi9itBO0Q6Nw7Wj2S0EI5OaTCUG6rdrPbuz47vCIeeXaAoAJw==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	3eNBbxxVQN6ymPIHBHkBq/jjSIQa33UHHE3BR0JMxnEvvo6zFRw1D0m1FZz4ZM51IO2ZQEi4d+nr0NiWaX8p4y5G4XrV2RdUymAOOu/CHwHg7OLyBwcHEi4jh5w/I58bAvsL+GpSC0TVpOVNommzlAc2G0oISXi4qZc+RniZUXjhIR79lPxSgFYJYcojYd7srgc4LJJ6e1s7N3KY4/FwiFf8DsTija+VxrwM6hgE8WvD8w/K2IfmvJLPrpMMs57odxx6HWcAly8hPVq63O7XpdizNevx9OnZh4O/I64YDCZ6rHzr3mgbib/oipKn0UAIvZ38Bv479uAiHJi4Hi/CKG/3LJcFFqTt+t1PTQ7Y8EkF5WbHJHfB05I57VDVsxY90GMgcPMde9zPO50fMt3aMHdSUtibUQ87Ezbb2BJyj58Ib28EW9MIuuiRVUshjMVj
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 06:02:19.9879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daa5db28-1f40-4b84-dbe4-08def1edf1e4
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR07MB028784
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 06:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242699

From: Daniel Turull <daniel.turull@ericsson.com>

Some upstream projects bundle vendored dependencies in their source
tree (e.g. nghttp2 ships third-party/mruby, which has its own
NEWS.md). The changelog extractor could mistake one of these
vendored changelogs for the recipe's own, misattributing unrelated
upstream changes to the package being upgraded.

Exclude paths under common vendoring directory names (third-party,
vendor, external, deps, etc.) from changelog candidates.

AI-Generated: Kiro with Claude Sonnet 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/lib/devtool/upgrade.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index 13d51bf952..495a5b8217 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -55,6 +55,13 @@ _CHANGELOG_BASENAMES =3D {
     'perldelta.pod',
 }
=20
+# Path components indicating a bundled/vendored dependency rather than the
+# recipe's own source, so its changelog-like files should not be mistaken
+# for the recipe's own changes (e.g. third-party/mruby/NEWS.md in nghttp2)=
.
+_VENDORED_PATH_RE =3D re.compile(
+    r'(^|/)(third[-_]party|vendor|vendored|external|extern|deps|3rdparty)(=
/|$)',
+    re.IGNORECASE)
+
 def _run(cmd, cwd=3D''):
     logger.debug("Running command %s> %s" % (cwd,cmd))
     return bb.process.run('%s' % cmd, cwd=3Dcwd)
@@ -591,6 +598,9 @@ def _extract_changelog(srctree, pn, old_ver, new_ver, o=
ld_tag, new_tag, workspac
     try:
         stdout, _ =3D _run('git diff --name-only %s %s' % (old_tag, new_ta=
g), srctree)
         changed_files =3D [f.strip() for f in stdout.splitlines() if f.str=
ip()]
+        # Exclude bundled/vendored dependencies; their changelogs are not
+        # relevant to this recipe's own version bump.
+        changed_files =3D [f for f in changed_files if not _VENDORED_PATH_=
RE.search(f)]
=20
         # First pass: collect per-version release notes that changed
         # Matches files with a version number whose path suggests release =
notes

