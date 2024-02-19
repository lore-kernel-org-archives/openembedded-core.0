Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7970C54764
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 01:28:56 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.84])
 by mx.groups.io with SMTP id smtpd.web10.32005.1708306129137048565
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 17:28:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=K0GyQBdr;
 spf=pass (domain: axis.com, ip: 40.107.21.84, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7CfidgCIV3d3sgtUDUwykbiHs9sGGhcoTdiRGUhL9JOXrnVv9nLJZOrUKeXTcEFux1oCyk9PooQFmhum0rs1YcIx4sqmu1nAceYIH4wUb590b6otuwonk30VJ2Qv1c35bEOjJpbbtaTbIXJvi/zszCyCIlFlHGYEagqt15EoupMR9TKU6ffghlnThzAj1xdSQh0j035SIyUYuN9i4vTXZbZ2hgI8wGp5bRTES8MbUAXZ36SFFnB4je3BY6a3bq9ClDrYmcB1ikWEylXZkJ57TJbvazuCJ6WVLOdAxSIe1GEQWMKEKpQwLntv7Ze3ybM2Xj1VFkvWCSq3ZBDvdB0MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZUZfBVD8k3l0ympm9u+y9u/tvohKOSqq7uI1Vg7TOik=;
 b=A+xmKHvljHS/OCj05rxDFPMGxMPlAVRtzBZAMssqNu9rpVCgTxZ8hc2T2lOCC/DEVlguSEQtUrXVdT1iec629JBpYqpeYrPW2aXBzxzSe6xe9kpn9iINAAcE6V8EFmezFHy5RioBnzEDJb3MDilu33fhGhS8vNg3i0/LKLooQESfNbCKaPLB/bAXsubzxfizUPClGnD+Q/ftmW2nWijWn3nZVx1dJE+WXUOPmpfW3M5cTe+ZYLHt45lnrrlQv/aE7XLc0iO13NsVaIuwVfwwv0+unwkk41wemf+dARlaLZ7yOm8KMOLWuqAG6nBU1T04EjUSWPxNkdWZ0mLkMOADEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUZfBVD8k3l0ympm9u+y9u/tvohKOSqq7uI1Vg7TOik=;
 b=K0GyQBdrz5Bqc20aHJ8G6WmOV2L9SfUVKqupdTP2NU297CQi9bVLwvHm3lXPZtH+MsWez1J81WrZXaAu7MRo/HopfvWKAHOUpJ447PhXLn9VMe/3uMMtLjhuTnq9tdXNEkxO8qKu2vlbu0R7VXIkM5s6O2hRIc6E7OZPOCAe8bE=
Received: from DUZPR01CA0073.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::11) by PAVPR02MB9039.eurprd02.prod.outlook.com
 (2603:10a6:102:2fe::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.34; Mon, 19 Feb
 2024 01:28:45 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::32) by DUZPR01CA0073.outlook.office365.com
 (2603:10a6:10:3c2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38 via Frontend
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
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 19 Feb
 2024 02:28:43 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 19 Feb
 2024 02:28:43 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 19 Feb 2024 02:28:43 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 9E1D91494E
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 02:28:43 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 41J1Sh153090822
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 02:28:43 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 41J1Shp63090821
	for openembedded-core@lists.openembedded.org; Mon, 19 Feb 2024 02:28:43 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 2/5] lib/oe/patch: Add GitApplyTree.commitIgnored()
Date: Mon, 19 Feb 2024 02:28:29 +0100
Message-ID: <20240219012832.3090768-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240219012832.3090768-1-pkj@axis.com>
References: <20240219012832.3090768-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E3:EE_|PAVPR02MB9039:EE_
X-MS-Office365-Filtering-Correlation-Id: cc74c571-a0ae-41ae-7a2c-08dc30ea1d6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Fql8TQNbtmNNMZDm77kEjw7WzinHktd8pAAqPsIbyCVTfnfabXyPuUfycuRB+vz5dJ3mO3zKSW2BIhYWN2vOzGxEDc4182Bxf1gGPv/Nm1Z+Vo55rnfw5YPQbuEWfSEHOJxP3u6LZRlAhOK5Wv29Lq//HmIJBWZ69EGd7lF8J42FLNEy+ufPwmlELkbTed1KkAEC+O1raLNZxJ3vgoK+uDZ5nAH6kapUu9dnbLFaBKLAiLtMrl0CKiH1Z9VsqpayfLnj4Z5YssEDSkmH6iPvmm5xhRn9JPx9HDLtML6rnT86chOyGh8AwpHIktqRv2Y7+aHk8WGm0gO+CNUmH420Om5DS0uXvscDbmr8b5gtEr38qWYcK3d6Ur5z1E0Z3WoB2ptoMWl6nNZIkbaOibRb9k7bmKovm5+/bKjPBgYbgCp27KfSEe1NRIYty7FosJ43nsWW2lxIg+z6tBkKKlC+zceIYgBg6O9Ubo9E2jxwMSt8BEyLInB/bRD76Zje3ltgg7Pk/hKKgwfm6G13Xp3RXAqvoSYR0OnFsgaru6S5/0t++2OyHLi6w88spJCKeGbRCy4UKXrdo+s9ag0HGg+MxO5zePEGKpjtMaHvu6w1dpYlZXA52HRFIGyvb8osi7Gw0sFNy6IZPFGXbHHSK/P/CRyGRTJ5FcV9VBx2Wp7gjoc=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(396003)(346002)(136003)(376002)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(36860700004)(1800799012)(46966006)(40470700004)(83380400001)(36756003)(2616005)(42186006)(6666004)(41300700001)(316002)(426003)(4744005)(5660300002)(336012)(2906002)(478600001)(70206006)(70586007)(8936002)(1076003)(8676002)(6916009)(26005)(81166007)(356005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 01:28:45.3206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc74c571-a0ae-41ae-7a2c-08dc30ea1d6b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 01:28:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195855

This function can be used to create a commit that devtool will ignore
when creating/updating the patches.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

 meta/lib/oe/patch.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 70cdb1d9c0..3ded5f3601 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -460,6 +460,16 @@ class GitApplyTree(PatchTree):
             cmd.append('--date=3D"%s"' % date)
         return (tmpfile, cmd)
=20
+    @staticmethod
+    def commitIgnored(subject, dir=3DNone, files=3DNone, d=3DNone):
+        if files:
+            runcmd(['git', 'add'] + files, dir)
+        message =3D "%s\n\n%s" % (subject, GitApplyTree.ignore_commit_pref=
ix)
+        cmd =3D ["git"]
+        GitApplyTree.gitCommandUserOptions(cmd, d=3Dd)
+        cmd +=3D ["commit", "-m", message, "--no-verify"]
+        runcmd(cmd, dir)
+
     @staticmethod
     def extractPatches(tree, startcommits, outdir, paths=3DNone):
         import tempfile

