Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699FCCDB483
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 16:04:51 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.45])
 by mx.groups.io with SMTP id smtpd.web10.32113.1697731484836506259
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 09:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=U7KScYZk;
 spf=pass (domain: axis.com, ip: 40.107.104.45, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSuMstpre0YrN7SydjlF/AOZNReD9qc8vTbSXhuPKWRaLGMV6vpJaZve+5U1IWOvfyQbeJkZeMTjYvPdjYsMZ+6v0b0v1/JLbLu82zyE50RbVNo3D0cCgm5Y0WZ/AyvENP7TIriWO2xnP5uZ5HFQn+VkSNIVNX+68etpQP9RqjJfPlu0AH4AX2QdpnpnD/5oXmGejiIGkUnoecpdGLvVZDugWJeXCXvNsBkQdQfh542Dj8pExOiylwdMzpJN2/XZ56g00r8p4KGEeES83Q43KVR2DhpZR5knC6h/WtZ/8nERNbVL6iUNih1DOdmGa8t1ttqSVREhbprIdhr6iPbuWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOUHNdgn+F8vAN8phcDNcRcPz+4QY+dNtP8oJyj8hlw=;
 b=c12evrCmpgtwTVef4+nLoQuEvkxC6b/hkc6wBtGlthGGOw1p3LouCcI37DzU7kI/ys5Xdk0q2fG80nFQvY6x5J4tCfdoRLrpuyjGOnArDEklUQ9pcZdG01NR23ozWlIIwvQku4bCY4/6f4g8SawN0e1S9DxmX6mIGn71oW/puCBPGMLa7adUmeCp0n5gFRpIPvkRbsJo9+FDy6Fi+RmbDFgG+IAOo+TuQnzrCiqaAL2XP947dLpZISOeZMo9K+Lr19eflVV6uTUa5FU8XNrx/hxb1T0xOF/lX1Gkagg/VAP6z56OMW7lXqiui4MjV0Ao5Fa61Y3bcWWkv0XayTGaYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOUHNdgn+F8vAN8phcDNcRcPz+4QY+dNtP8oJyj8hlw=;
 b=U7KScYZk/BgU9RfYbTGQ6vOvTFnlmfz8ecwxqyfvrYOsLHweWdvHj4GwIYtQHUKMJEEt9uQEJGBngfnWCsg3FHm9mIggABIzdMuMzsAM4mmff9haov1ysJNMuQ6fsbz8KSpyUD3g6kqugQ8ZqyU4hB2StR3ijj2kKb8PPVx3qjA=
Received: from AS9PR05CA0325.eurprd05.prod.outlook.com (2603:10a6:20b:491::32)
 by DU0PR02MB8315.eurprd02.prod.outlook.com (2603:10a6:10:3bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 19 Oct
 2023 16:04:41 +0000
Received: from AM2PEPF0001C70D.eurprd05.prod.outlook.com
 (2603:10a6:20b:491:cafe::9a) by AS9PR05CA0325.outlook.office365.com
 (2603:10a6:20b:491::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.25 via Frontend
 Transport; Thu, 19 Oct 2023 16:04:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C70D.mail.protection.outlook.com (10.167.16.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Thu, 19 Oct 2023 16:04:40 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 19 Oct
 2023 18:04:40 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 19 Oct
 2023 18:04:40 +0200
Received: from se-intmail02x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 19 Oct 2023 18:04:40 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 0C77A295B
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 18:04:40 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 39JG4dZZ3788897
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 18:04:39 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 39JG4dLI3788896
	for openembedded-core@lists.openembedded.org; Thu, 19 Oct 2023 18:04:39 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] bb-matrix-plot.sh: Show underscores correctly in labels
Date: Thu, 19 Oct 2023 18:04:37 +0200
Message-ID: <20231019160437.3788884-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70D:EE_|DU0PR02MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: f86d68d6-a001-48d9-9f87-08dbd0bd19f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bBHQnU7Je9dOQ+k4+MczGoFVxJiVD/wFgvz9w6fRsSkVRI3VJQdu0XOB3Arm8Q5I/JkjvSHlO8YAXSXJfnlvWWLN7tlMB4AmGPZz/J0Cx/sviaCYYptAVr3zoG7+jrRtuDxiHfyqQMZPPBG7uNupM9GfArxpadN/0gudGzIi+nqcNr5DuxBmGSj5+l4hgTnBfxc3iwbOUKoz0Ot6oFsqe4BeudwTe2Eb9FTVkPAgKz+BBsXiGP2TR9lOQ8mA86Ox/7pUF9v2UehRswuyc3Erg8wyik9BNa9CUfbUUEtuUgLIdNq1BhGSByuMrUrIFghKtjQ4HYLFG7c6UXs3Y1ymrjHZbxSyC7Ljp9wFdyxFgFYwB1cP2Fi33BfpQ3IMMTc0j2+e/IchNwhmojwOXlghfCLpdDzSVHFZ7lT04OZexpQIlCh4dl3TDk5qKyGlPx2pAxMYtXPdQ9qgV6Wtizj6Bbao8pf2qjB8+Z361zkhSJm1Beet/o8nQYXpAgZmVHk4eHLTm6DgG7IIOgUb1LumIUmYcaajwUduxs9UpcIxIV4bWSekVEMkHBJuYz4VCUJ1GsQhAOpbKwhlTr0QZ4imCz6E1hRCSX8/ET1kWllFT2lnOvHSygHtCIgicV9kLpZJKSq07UitEInz0u/BwR5AyDVc368WHzSY4ZKpJ++18jxM8t4Kd9FGIO6rrXaA9ADoehHe/nEVTpiBfmJ4sfPPpUqjSxubR3+9r8VrpQl5v7ww/4UM7lPbLwrqHbwe6/4pX1l7tSadDO4S8i0Pquk6MqYtI+WzsTMrx3aglDkmz+0=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(346002)(376002)(396003)(136003)(230922051799003)(186009)(451199024)(82310400011)(1800799009)(64100799003)(36840700001)(40470700004)(46966006)(81166007)(47076005)(34020700004)(356005)(36756003)(8676002)(26005)(8936002)(316002)(36860700001)(478600001)(83380400001)(1076003)(70206006)(42186006)(426003)(70586007)(6916009)(336012)(2616005)(4744005)(2906002)(82740400003)(41300700001)(5660300002)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 16:04:40.5799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f86d68d6-a001-48d9-9f87-08dbd0bd19f7
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8315
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 16:04:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189474

Underscores previously caused the next character in the label to be
printed using subscript due to the enhanced string support in gnuplot.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/contrib/bb-perf/bb-matrix-plot.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/bb-perf/bb-matrix-plot.sh b/scripts/contrib/bb=
-perf/bb-matrix-plot.sh
index e7bd129e9e..6672189c95 100755
--- a/scripts/contrib/bb-perf/bb-matrix-plot.sh
+++ b/scripts/contrib/bb-perf/bb-matrix-plot.sh
@@ -16,8 +16,8 @@
=20
 # Setup the defaults
 DATFILE=3D"bb-matrix.dat"
-XLABEL=3D"BB_NUMBER_THREADS"
-YLABEL=3D"PARALLEL_MAKE"
+XLABEL=3D"BB\\\\_NUMBER\\\\_THREADS"
+YLABEL=3D"PARALLEL\\\\_MAKE"
 FIELD=3D3
 DEF_TITLE=3D"Elapsed Time (seconds)"
 PM3D_FRAGMENT=3D"unset surface; set pm3d at s hidden3d 100"

