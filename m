Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34825C48BC4
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 19:00:11 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.61])
 by mx.groups.io with SMTP id smtpd.web10.5208.1708110007093854274
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 11:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=XHjUOP49;
 spf=pass (domain: axis.com, ip: 40.107.247.61, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7p0tYnhktZAqdMR6ETXeZ6QTt+8PyHfJFpgri3CFAwzDGLMRTkIs4GEeBVgBU/RhCwWBP4cCYse4CV3dfb8D7JX1DZD/hsHrZfL3alo35VF8NF1P4H3HrAxHFXiTJuTCkVbA3qr5vKk5CC/8gi/DIdxFTQQcm2ASs9ryC21PUIRYlxNHUdfi5KuIbD8T8gmioQ6R5fIH/ZNUTGhGqt/PplbS8f5zEvsUWTAgwJEZiaz3+kyuqd1xnNKpQlfVf7qivYp3gIWSe7Bu6WWT0hngSLIKmoh1vHE0dHKb9yMN3jMTlP5aAo7IL2/WvtAdwdN7BiZBlKUAQwGSMLHkmFlJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVpFys/UN3QzTJpYCvXQkogN6cKHWIjSQVDt9beS9JI=;
 b=B0n7IFFFAC5vNOXrzY0vlLsu0A32sFbXk0mYu/sJSyw08Iq54SYHqSKbUXmFxqO6Pix5lqGGaj6HABkI7M7z/8I63URO5JvFzBuO+k14BkVabTZFyVAgljDmWa3dZmphHJ5uH40Dae3RkpgydZGHdSH3+CyM59NtSfbmYmzduUjVTCzw6YMldNpxoF748x9vPEdI5dNSz7doyrAVQ2Y0O24H4n7l5KEFMpKNH+sfsHwfm+FzPilIgWHJJsKqBCjhtPUwcPF0pyzl+aZP5Bj+mlu8HIxztBdKE2/4uqQVv3zOZleHQiXqnO7GyWVzoPuI3svZqWAjSS6K5VaL2YVDog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVpFys/UN3QzTJpYCvXQkogN6cKHWIjSQVDt9beS9JI=;
 b=XHjUOP493Hw+OKZmqLX68aOVVuwOGNQebxHNHbwfAz19a3gdDNbK4IPd8V0gQvK/2Fm/F8zFdnV03s4OjD/xL7/PsvtsX14e4a6mtCPSo4imIL5bzgcpSdKM6+g7zcCHUHE++5p3dalgH+lQbn6NqiOzAc6bJpFZRPIucPJpMt0=
Received: from AS4PR09CA0022.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::14)
 by DU5PR02MB10745.eurprd02.prod.outlook.com (2603:10a6:10:527::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Fri, 16 Feb
 2024 19:00:04 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::2b) by AS4PR09CA0022.outlook.office365.com
 (2603:10a6:20b:5d4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Fri, 16 Feb 2024 19:00:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 19:00:03 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Feb
 2024 20:00:03 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Feb
 2024 20:00:02 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 16 Feb 2024 20:00:02 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id E047714939
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 20:00:02 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 41GJ022k2607022
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 20:00:02 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 41GJ02ga2607021
	for openembedded-core@lists.openembedded.org; Fri, 16 Feb 2024 20:00:02 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 5/7] devtool: Make use of oe.patch.GitApplyTree.commitIgnored()
Date: Fri, 16 Feb 2024 19:59:54 +0100
Message-ID: <20240216185956.2606978-5-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240216185956.2606978-1-pkj@axis.com>
References: <20240216185956.2606978-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA2:EE_|DU5PR02MB10745:EE_
X-MS-Office365-Filtering-Correlation-Id: 14c660d4-271a-47bc-4b39-08dc2f217bf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AZ66p+/CgLj9B+BzwEhRrJhsVs1zqob40ZNnALDfSfaZfnlFBSZ9VmTkW+0jF2ILUTECIIj0uV+y19chtf57VZW4PjGa5kS1jaxfTgP3lV0Em6zodiLY/MZIBVRdS0LuMOkCv6B/bLJXlXeY0z3m33Us7Wmn6u2lApw/579l0VWjETwShAnJ5e8LSNo26IwSOql5T0LjSzB4i9HNOQXTEBNlWkMfn+Tf9hpLK0rMdpmdLvZ6E3xxdBRvSn/BgL9+xL5eQmdSQvUpfYdWQHoZgFgYRF1WicXic+1RW8LxhtBA9Pb2u4Nzzl20EQ2+nGikCfipCDarkGvo+//OYjz7sdj4p10LX2Rmcf4E2/m/tRoaajMMJE9/oUcM32jdEt+Nx62koY8zWoGBxRwpVKavR2BbkjQpODB4icVVr1PdydvCsJuOUzbs4GGcEiabFvjIA3wSxok2cwQWrzpZVTYR4JEkrQ5OSk9Hu8C0tMY47isk6W05zatGcKVfC9OasKerFcdfXKkBYz9IMj99JkgnLtWatb7EXrIIr0yRH4hnHk2Uq40CxleGHPDe+JRvDHv9d/drCpPRHtrNBMrkGM75mhI0YZl9fp6V38eDl/nWcpaNqFgyTEDIUJXWGZAkWaAtevMFHEUMyCNvKQjLxkVg89O50Q4mZocc+NILAGdUfrw=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(396003)(136003)(230922051799003)(82310400011)(451199024)(64100799003)(36860700004)(186009)(1800799012)(46966006)(40470700004)(2616005)(478600001)(41300700001)(2906002)(8936002)(6916009)(8676002)(42186006)(70206006)(5660300002)(70586007)(6666004)(316002)(36756003)(83380400001)(336012)(81166007)(426003)(26005)(1076003)(356005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 19:00:03.9070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c660d4-271a-47bc-4b39-08dc2f217bf0
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10745
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 19:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195797

This makes use of the oe.patch.GitApplyTree.commitIgnored() function to
create commits that shall be ignored by `devtool finish`.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
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

