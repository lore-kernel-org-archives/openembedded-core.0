Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A59DCD5854
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 11:47:05 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4019.1767786421143014254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 03:47:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=ro4GthrH;
 spf=pass (domain: axis.com, ip: 40.107.162.71, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXRSkFDpZfzgHjsBqi3UcCy8TNbmdTUrTwWCFW/EF4XkCTpUEEMmHcKpxCB9U4Ud1kxIRw0S4X410dcOVYaeHfO0gCYkn6RkBGCnsnslO2ytr2XEEsJOSzcL5+gvtLpEH99VzMj5Bzqe7cE9tcNmQWEh0vzwA6vK7AFnv0kHkPYTfTEZnLFR+RGj765riDAkaW3xW0xhWSzh15+SL0xQQyKzBf2/BxWLb9agBDem+t6vrx8s4Lo5qEyQnxZJfDETR+fnsnRPShr0arIFlEETuIR/zAVly/Est7iU6e9f+0UfwviQfv/ueuve4ZeySEz/kXae/tD+WQreY6Zpu/tcxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+coNM2cU8a/ry0VwW6OI+g5WmCjYSjeJq877CtuEDcM=;
 b=Nl2+HLhPVJmmd9e0ykKwAPU5axTx5zWdh3OuJJP8hP+GBlmo5AAzVmrB1wbu8Tit8i/nssxCN61TVRbqi7P5eIwXwzw1JMYVtdTajes7OzBxd0qgLjT0xTSH16vsJxgdDKCvlKA9bzp6+ZiR01hlPbdTtw29AiRIgJKfpM4l/pu4reQeHvqrSDEkoVis40dSfi9xqv/3T+5gM+MF5z2FyNITL6wyyShSrvHXiXb55cWtaPrRGa1Inv5wQraIZEekxkquCeheU1SFANyq1Voz+5EDDRqL6BAKGfiZSWzaz6YGRDQm0VuvQUPpFhSKsOxBjcWkvp/0PKFM1Jsp6XR/CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+coNM2cU8a/ry0VwW6OI+g5WmCjYSjeJq877CtuEDcM=;
 b=ro4GthrHyc/EjMzCHU/opEMPYvv1BaKjslLgGozT00sezuCmCsLzIHKCEuz8Nv6ysMAV6slNbhSLYgJm6JkMeV+SPkkrR1QpHegNyP67gc3+a+pr/T1HLGf3c6VTOdHmc11N7j91GhY4gpgm66+ZypsYBzAz+QWm5LStq7cJsqw=
Received: from DU7P190CA0017.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::24)
 by GV2PR02MB9542.eurprd02.prod.outlook.com (2603:10a6:150:e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 11:46:55 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:550:cafe::86) by DU7P190CA0017.outlook.office365.com
 (2603:10a6:10:550::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 11:46:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 11:46:54 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Wed, 7 Jan
 2026 12:46:54 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Wed, 7 Jan 2026 12:46:54 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 4169B1A28
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 12:46:54 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 3B9BE129943; Wed,  7 Jan 2026 12:46:54 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] patch.bbclass: Show full path when a patch fails to apply
Date: Wed, 7 Jan 2026 12:46:49 +0100
Message-ID: <20260107114649.3874373-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B622:EE_|GV2PR02MB9542:EE_
X-MS-Office365-Filtering-Correlation-Id: 558ef05b-66e9-400c-9e68-08de4de27495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0TfPMxwGjWPZbpIYSxGOwW/2F/Ze2nF3QYeW+svV4x9Q88Va3K19ZQdAaHgh?=
 =?us-ascii?Q?l9X5b3CVZowSTTLq2O+TO8W0fE4CTs026OlhhZB/TRTvwm0lZIDEPTayej1Y?=
 =?us-ascii?Q?JHKBHyZ7+jEiJReu4UhpipEhjqYzlkyIPqDsX+QJBkc9CGdgQXDEkcrzZoZ2?=
 =?us-ascii?Q?PFITduqS2aaeNYLOhbxLiyJmJIGWUQIM7o8TnHme9rZMolcW3yEqhiMdCQMp?=
 =?us-ascii?Q?NX5b5TS59wMzDMnVFFkVS+e1XK/uKFQ2cao73pdYHjBkx4Ksj7cN56WEJ3nt?=
 =?us-ascii?Q?4UsZolx6oy4sPo4AljnjT6E4M22LMVvN4qsQEf42u7ja1hdkZdi8iVfhEcbG?=
 =?us-ascii?Q?jwhCl4H/EmqU9+U22VKAviHoRhbdyOrI/Uh7Y6NH9WcTk6e5io+8KnIUspkh?=
 =?us-ascii?Q?qy2IFoiMWmNbviO9Npr2+2ywPyRmRn9FMB9ldC9Pj7R1KeTCuRrn7jKfDuBZ?=
 =?us-ascii?Q?2SKU3+Ilp9EKcdXZ9Fd2EqS9J1LCS3rpbl8Oh1Dk2jwhCVELV7M+7ItCJ9mO?=
 =?us-ascii?Q?dd4Zrr9SBTjMIxMoYMWti4oBI3LS+E1fS3HvVnvUn8gnsQBhCjgqVsqKAIcJ?=
 =?us-ascii?Q?YAy8RojDobsBPMS7fzo/0IbaAM3tVp6a8FwVFVhhmKQSGNWHzZvPkA5mNt+q?=
 =?us-ascii?Q?bnrOL4UCCM4HtSQmtFwY+b62Uy+uVg2CGgwmwSxLlKTzQeUgHNhwjy5o2y5x?=
 =?us-ascii?Q?00bOTNLHa2fEz89F3UQtJZqD0PO6Ufci19kyXos2tyAeUITTHFUpreJsBYc2?=
 =?us-ascii?Q?is02JACKjHJWkLeES7Bt4OqTRJNuv0g0iBfc6UbZ2SXjMDx4XToOdGDCnPFG?=
 =?us-ascii?Q?reA+kR5XyjTO54yt9yXIP+fQDavryABAQkphttdMFyxy4dOmMxpfPNQwtO35?=
 =?us-ascii?Q?SKu5/XirquqModRHObKbNUlFVuXYNz1fqRJxDQ804JBwEcm4eg3lOXU/0aXi?=
 =?us-ascii?Q?dFlbGRcjjmW0buqFbiBt66othNAKPQGM+gS4fgte94TdfMDsTOgtNlpVbsVJ?=
 =?us-ascii?Q?2Mzj/wgJTqACR1+76kT+b44PQkg47szneI3nmQYO6r2A8z8wk32lXrQBKOEM?=
 =?us-ascii?Q?NpbYjquRvcl2NJnksm5DSqYyXx0aAKMh8E5xR1HTIp/vrZUr5mzNaWPAuy+7?=
 =?us-ascii?Q?Owni1+XJROjkiz+Or4B6BMo30i0C5Rg5w4FeYLulzPGutpeMHN1S2JQQ+cYe?=
 =?us-ascii?Q?aoXOcYaTmf7BJvoHOT/fZ92gM7YViaiEhHGddcWjtZ2UnPXFTAn4qaOItRUB?=
 =?us-ascii?Q?z78fQ2zcI+sL+gsVSevkpZuGTqyMK7nnIBkpK81S4bzPVDDvLId3Tz2kxDOH?=
 =?us-ascii?Q?L7qfbhu/hhroTa/YpdA3ssayWQSL71aUQMMVSxVeImKnUoZ8cCjyQjPRv8iK?=
 =?us-ascii?Q?41WihpJXKWJAXNQePdaFmJYQ4kOhtLk7i3fNAN3cBujOFaD0reyOn9tg577M?=
 =?us-ascii?Q?avotsfNak6z+43sZsl9AoI+HtdKaW+5fThQR2sdYOXteo3MFJtXmKZAwsZxG?=
 =?us-ascii?Q?ODR242tzS5kARv5JSQIB+nngo5pBg6utVhhnir3yBKCcF3vWP4vGqVFajsjY?=
 =?us-ascii?Q?taEaF1hxrixDeSmx1aE=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 11:46:54.6544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 558ef05b-66e9-400c-9e68-08de4de27495
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB9542
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 11:47:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228992

If a patch fails to apply, it helps to know the full path to it. This is
especially true if multiple versions of the patch exists, e.g., due to
overrides via bbappends.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-global/patch.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/patch.bbclass b/meta/classes-global/patch.=
bbclass
index e5786b1c9a..2d9b39c9a5 100644
--- a/meta/classes-global/patch.bbclass
+++ b/meta/classes-global/patch.bbclass
@@ -150,12 +150,12 @@ python patch_do_patch() {
             patchset.Import({"file":local, "strippath": parm['striplevel']=
}, True)
         except Exception as exc:
             bb.utils.remove(process_tmpdir, True)
-            bb.fatal("Importing patch '%s' with striplevel '%s'\n%s" % (pa=
rm['patchname'], parm['striplevel'], repr(exc).replace("\\n", "\n")))
+            bb.fatal("Importing patch '%s' with striplevel '%s'\n%s" % (lo=
cal, parm['striplevel'], repr(exc).replace("\\n", "\n")))
         try:
             resolver.Resolve()
         except bb.BBHandledException as e:
             bb.utils.remove(process_tmpdir, True)
-            bb.fatal("Applying patch '%s' on target directory '%s'\n%s" % =
(parm['patchname'], patchdir, repr(e).replace("\\n", "\n")))
+            bb.fatal("Applying patch '%s' on target directory '%s'\n%s" % =
(local, patchdir, repr(e).replace("\\n", "\n")))
=20
     bb.utils.remove(process_tmpdir, True)
     del os.environ['TMPDIR']

