Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E84BBC54788
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 01:28:56 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.57])
 by mx.groups.io with SMTP id smtpd.web10.32006.1708306129359660017
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 17:28:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=hLpH0m/f;
 spf=pass (domain: axis.com, ip: 40.107.21.57, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Skjq8S9IWRkGqZlLvNoW7UHSVdeBWVuDO0eMfmtaeMB+O4HCmTOBvSymKLxBaCRqoPqfejGRkldknyZz/rsFWLtodK/nbDi5A/VTb0VGryKxT10pfXH+reAdYIe62veDrTX3wlsiXKG97r+a+h+Bwz7CBghxbvRK/p7Y3KsWrmvKRg4dV/Iy/iIHH/uFhnCCfF4TT4NqY0smZYH0jcMC/iV5QqVyBilOpU2piq3pnIrxNSI4AvBNXeyQhltririNrxTAvyoEAcpCsjqX2488I6TvNW+PH/bI0KSWlv24IK6EzQkTi21GSMTICnug3NxrH8nAWbUjH5Q9W6gI09XBxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ft2p2mCPBCPctOqF3aCvRaVRYYsYVO02j0C+ap1fiGI=;
 b=lLFe9+EQ/0Kr52AmJmUjBvR3u5v/4j6i14EfVFtjRApxpw0ilv94ByseXSytQM/b+JkQD3qQqrxiGo9KJFJ+bsi0WOCToydIm2dMyHP8kxE8spB5iTVbrB/YaaW8LUqeCUi97TEFV9Kh2IwIaeMijLrssSYj5JI1jEIGu+EXrWD5aCdcT9dEwIMrKPyALGGdeosDml+jvmkYg9rZcoMfR62xTSjOx81zsHhKdLNyehWe+xPXSnqkvGePN8EZr6I49KCiY1eCUKPBrVarY/IT1CuDIfdVkf4wUgmKebEMeLiCc+flYVe+5bh4gSGOgXZ7cUQ+dsuf/C+4YIGacGeCxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ft2p2mCPBCPctOqF3aCvRaVRYYsYVO02j0C+ap1fiGI=;
 b=hLpH0m/fjXaiNYW3rHNhm0cOu0m9pxljdMSqRnvvcJgRlaBVtJLUfmB7sv9g857yr2+2A3q7puns3ZD61fg2HYO7pOQrOF+MXLF9NuTct0shn1KutiCeLPI+0pnijAIVsXFssD3nZkWjRzq4u64C/mINBXZabOSZywcApu8yFtg=
Received: from DUZPR01CA0075.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::7) by AM7PR02MB6276.eurprd02.prod.outlook.com
 (2603:10a6:20b:1bb::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Mon, 19 Feb
 2024 01:28:45 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::ab) by DUZPR01CA0075.outlook.office365.com
 (2603:10a6:10:3c2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.37 via Frontend
 Transport; Mon, 19 Feb 2024 01:28:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E3.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 19 Feb 2024 01:28:45 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 19 Feb
 2024 02:28:44 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 19 Feb
 2024 02:28:43 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 19 Feb 2024 02:28:43 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id BB8A214929
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 02:28:43 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 41J1Shjv3090831
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 02:28:43 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 41J1ShJx3090828
	for openembedded-core@lists.openembedded.org; Mon, 19 Feb 2024 02:28:43 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 3/5] devtool: Make use of oe.patch.GitApplyTree.commitIgnored()
Date: Mon, 19 Feb 2024 02:28:30 +0100
Message-ID: <20240219012832.3090768-3-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240219012832.3090768-1-pkj@axis.com>
References: <20240219012832.3090768-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E3:EE_|AM7PR02MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: 0933edbd-98b6-49b4-3c52-08dc30ea1dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Bb+8qK+JaIcEAv/TZSxngNCzbmyyQBdstflUrEMDHnLlBLww6i0cCDoxyxix6jlZiYpR17ycUcD5o1AREv+Wk692ttFbEokYBP12WGa2zgoDbLxoa/ZpyNDpJtrP74fASTN6b6pRl1SgVMaKW/WDUKQVogX2hneGWGaI6OftyKbL0PGhndDa383+GemOw5m3y6BuLD63fPI/NnoH8kEvh7dMqA4AxgPKufYJLR9EKJdDiL/fOhDsiY+SdJX3E3D/AAjVCi8xttkt5Oer9NYI3FA7Ds9J20DG4+jOCvj95oIaWQl0Lr7k3vL1zYB/4HaqQg1Ct4h+eWXqAL8486EuJyybKQYy/YBV+CuUlXkml/B9zFcjMoJqjW9xB1FDztOehB10H9e1Kyd/RSXQ93EdNZJVwbHPlBM3ro/AllyjJVz8/kjpnJex3AXsPWon8Cm83NxqeYpb6kVgBmU5QISocTg8pqoNIJSv/RMvmzOXeiW+KZWcs5Q26Uk3lfhIFIPtAR7z+P8RsUn562qlgYiDbxhNixv6T6gFxRXpfkmqevBi9/pC64Nah28mlvnPj6mHdRsK5XClEIwiLAp+Coi6PUalpCNuxitQ+U8k9fDwk7l82ss0XF56NcyuRDyieKDwZi9fQB5Dotju49TWAVNdhPtQhstOv/mtLEDZvY1vb9k=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(396003)(39850400004)(230922051799003)(82310400011)(1800799012)(186009)(36860700004)(64100799003)(451199024)(46966006)(42186006)(316002)(6666004)(5660300002)(2906002)(70586007)(6916009)(8676002)(8936002)(70206006)(41300700001)(478600001)(2616005)(26005)(36756003)(1076003)(83380400001)(426003)(336012)(356005)(81166007)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 01:28:45.7581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0933edbd-98b6-49b4-3c52-08dc30ea1dae
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6276
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 01:28:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195856

This makes use of the oe.patch.GitApplyTree.commitIgnored() function to
create commits that shall be ignored by `devtool finish`.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

 scripts/lib/devtool/__init__.py | 4 +---
 scripts/lib/devtool/standard.py | 6 +-----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__=
.py
index c7fc3cfc41..6133c1c5b4 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -253,9 +253,7 @@ def setup_git_repo(repodir, version, devbranch, basetag=
=3D'devtool-base', d=3DNone):
                     bb.process.run('git submodule add %s %s' % (remote_url=
, os.path.relpath(root, os.path.join(root, ".."))), cwd=3Dos.path.join(root=
, ".."))
                     found =3D True
                 if found:
-                    useroptions =3D []
-                    oe.patch.GitApplyTree.gitCommandUserOptions(useroption=
s, d=3Dd)
-                    bb.process.run('git %s commit -m "Adding additionnal s=
ubmodule from SRC_URI\n\n%s"' % (' '.join(useroptions), oe.patch.GitApplyTr=
ee.ignore_commit_prefix), cwd=3Dos.path.join(root, ".."))
+                    oe.patch.GitApplyTree.commitIgnored("Add additional su=
bmodule from SRC_URI", dir=3Dos.path.join(root, ".."), d=3Dd)
                     found =3D False
     if os.path.exists(os.path.join(repodir, '.gitmodules')):
         bb.process.run('git submodule foreach --recursive  "git tag -f %s"=
' % basetag, cwd=3Drepodir)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index ccb7ea851b..6d7fd17fbd 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -484,11 +484,7 @@ def symlink_oelocal_files_srctree(rd, srctree):
                     os.symlink('oe-local-files/%s' % fn, destpth)
                 addfiles.append(os.path.join(relpth, fn))
         if addfiles:
-            bb.process.run('git add %s' % ' '.join(addfiles), cwd=3Dsrctre=
e)
-            useroptions =3D []
-            oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=3Dr=
d)
-            bb.process.run('git %s commit -m "Committing local file symlin=
ks\n\n%s"' % (' '.join(useroptions), oe.patch.GitApplyTree.ignore_commit_pr=
efix), cwd=3Dsrctree)
-
+            oe.patch.GitApplyTree.commitIgnored("Add local file symlinks",=
 dir=3Dsrctree, files=3Daddfiles, d=3Drd)
=20
 def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath,=
 workspace, fixed_setup, d, tinfoil, no_overrides=3DFalse):
     """Extract sources of a recipe"""

