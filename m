Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBD9C48BF8
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 19:00:11 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.81])
 by mx.groups.io with SMTP id smtpd.web10.5207.1708110006843341487
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 11:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Lx/KBm7q;
 spf=pass (domain: axis.com, ip: 40.107.241.81, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzMBHHraRCPEceFGEgFhKLvRv/+ZhSAEhmOEHaqDv/ZhQh7AJ82N8+fJ8WSHk5C1zmNf2EfknnIEwk+hSqzy85bSrKGo50LMIQCwyqKCIwy6XLyFiEXvyB/2FMFPhAkh1XPpeaOvj92R/YM1WT5lwPo6fDpMNO1lZ6ItLm1VHiO1oyAiOviJVpDMMUsqH07uOekJ+LEIcBF/3NwOWavqCoKTjrqrEtkt1mhyX/23/sCEeaGoJpBb+43bqWVpcvVt0Hawy+g3+0LadIetJoqpGy4RniFva7p8MYGLcmcxM0ikOIUll8LsA37dC8q6rFOItUoxb8jC3j0V91lMbOaWaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9IZylfdaz+WQ7rJOxxIIfeKL85hid8jiOfTBm37z88=;
 b=F1wv6rRQukPi0g+ubuxdMbwpdmoExnXzYNxbM5LkH5yr2BZFW3FQrdg/XKN89zF3RPR8kCj9oQq9DKxVIkrI44STCWTql+uusm0zqggYR8ZcBhpj5ieK76CVRlMsE4h1nhyh77EPeX8MtadmJy5zlICXJEQM/FrLMzwBFtbPdBZj952KWw3AsdD4F5RSCK+XA04ZGv22HUxp1paPSb908Z5Q8YHwlBHZUn0hmGuZ+VXbxRIykiaEfS2pz31Gk5wweDGUyPKaRY4VsgzFGT9QFFbi5c+cZAk2YZ0Z6z/P/EHalubuLJNwIomDSAMDjVxVBby4Rh6AWCpViy/fXa9GFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9IZylfdaz+WQ7rJOxxIIfeKL85hid8jiOfTBm37z88=;
 b=Lx/KBm7q7DRHWF0LTxAqDIIydb/f7Pudh/KV1/HEy/3wvoqHSwKw3pTmvZpPtBlC6dkH15TrljyuH1WMgHY9NI6Er7v2+Q0RsN7z/7Szi1fWwpO2B/H5kBbN90V+m9fcolCp1olNXqKqdvVQpTPmyAJPWKcDN20y/JgPNuVqLOc=
Received: from AS4P195CA0032.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::6)
 by DU2PR02MB10330.eurprd02.prod.outlook.com (2603:10a6:10:46e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.27; Fri, 16 Feb
 2024 19:00:03 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:20b:65a:cafe::a8) by AS4P195CA0032.outlook.office365.com
 (2603:10a6:20b:65a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Fri, 16 Feb 2024 19:00:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 19:00:03 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Feb
 2024 20:00:03 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Feb
 2024 20:00:02 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 16 Feb 2024 20:00:02 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id C22E014698
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 20:00:02 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 41GJ029A2607018
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 20:00:02 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 41GJ02Ac2607017
	for openembedded-core@lists.openembedded.org; Fri, 16 Feb 2024 20:00:02 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/7] lib/oe/patch: Add GitApplyTree.commitIgnored()
Date: Fri, 16 Feb 2024 19:59:53 +0100
Message-ID: <20240216185956.2606978-4-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240216185956.2606978-1-pkj@axis.com>
References: <20240216185956.2606978-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9B:EE_|DU2PR02MB10330:EE_
X-MS-Office365-Filtering-Correlation-Id: 587aadab-6fe5-466c-d2da-08dc2f217bc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kn4GH0Hc/AR2Rr5aNl3h4CxswMfX8MuTfUkz6SZoPhY/RXvdvEWLVmS4NEXTd7o1zx4ldxN2aYIWBIYksObQ6kBP8uijxUKVmNBYUAJMcjU4p/oXe0iGeguyt/ltIKQCANbPr6LXUk/OJ1jl/DKm04BG5iSrA/KIPU7jnKOoBqI0VbQADzQmAgAsU7uExsS70YSuWisChEqbksJ358R4G1zhc98SgmAkZpJYXnBOx7zivoKwP7cmykXRRbQAnSZrD+I2idp+afOnoMaHCe48QkvqXuepVY57/QF6vJOC0Sg5qvq6ENXdRvgYEgf9qXGCmNt5vZu2R9yf+vBeKe+/wGKHEZjqUAC+Ch/RAeSNDWFFr033mnegU227ckn+FP3S9GpM0G1dAMO+y8yVb6+/j+ayfDOuk4UNg3raTrbsJt+T/bz31s+8FyFhSKDTBIyqORQaaq5GqgVixokKof+QLrmQkg6yxa83BLWzEi095E3Kw/wx45XC2Ca3HYEYJCZgyPXTnk1g/yYCJrqWN5iXiOrniZ1qzgIS+u5ixAod78TfJ6kQOVelZjVbfG8s4ZeiJ9j5T9uLklj2wcCljYA9uq4ethfOLEci5VHDP8gI+xMRtxcO+SwKT1wYistoKJn0j54a5cg3XTNiXElCNIl2twvdhxjXOQk59bom3kUlfo0=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39850400004)(396003)(230922051799003)(82310400011)(186009)(451199024)(1800799012)(64100799003)(36860700004)(46966006)(40470700004)(478600001)(41300700001)(2616005)(8676002)(2906002)(6916009)(8936002)(4744005)(70206006)(5660300002)(70586007)(6666004)(316002)(42186006)(26005)(1076003)(336012)(83380400001)(36756003)(82740400003)(426003)(81166007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 19:00:03.6115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 587aadab-6fe5-466c-d2da-08dc2f217bc0
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR02MB10330
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 19:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195795

This function can be used to create a commit that devtool will ignore
when creating/updating the patches.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
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

