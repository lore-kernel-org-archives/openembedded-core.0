Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B6FC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 19:06:32 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3933.1785265591588867922
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 12:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=L8AWdzpH;
 spf=pass (domain: axis.com, ip: 52.101.84.44, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jT2tkVlHCM0g9f4tfW1MfndqtkClTGnAJ0IjkceBI8az2bC+k8Df6UxVN7p+Ayz9GRDGmNbHCeGxLn6AIfyQ1ylsPVHIdhHeCKnEndhY4ReB9zsVba1EKrlbf5cxFhNlbsHUk/0XjgMIxMZsDFqIoNhjyQWQvYPFzKUBrfdT4iSQbWoPjZUPSATk0hwlT7Hls1NPiyQzqYA2MaYqOaPE41veXoIDTu6bErrGcl+58fJu3Ff1Rz9q0LHjklOVPdFWfOnKCD0CmYFTf6TERTMSXs0SgVhGfw5IIGduvdRnJ29GAQcj/BpIzMWFrdWkC2QnKx3EomugzyMNPwmxvkD3wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPiZz6Lz67DGu3E/kZZ5gjC2eGWpHgpdO+jyZMawDLo=;
 b=bDrz98aSOeX3cSlal5/VGQM/45zcebF+0UiB+QwFOQsTGa3y3E3Q2hXUkMVzOhihMAQiaTIJ/2zXUyW/1r9EoMCI4OCe3Qst6k8tZAy1de6eab0W3fi4Z+HJKQ5NO/14z+5K3fkB5pFQr6fwduTyVr6lbD9ZvMlixOhU+aCga0NSMJ/JzSp/lg6fHHq/PEiYBJjObKurhUzV9W2aqVhcCFaqb5mNGmaWXqdQ6+UjSnsc/CA8Dw2ttaOOj+gm9e8LZTq5w4lpgheIblVuBDLQvnVHk6uImoKQ7DQZLDeoF/PwRLgUKqXlNuouO5U2BTZOYem/Y1TRnU3GclFVffNtUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPiZz6Lz67DGu3E/kZZ5gjC2eGWpHgpdO+jyZMawDLo=;
 b=L8AWdzpHjdDkCgze3qCsDlzgDyRMFvtnUev2axzHaZqoW5R/uecOPbzEJaW6Q33gzJMC4QKE3ALMYow1r3fxaL/fw3y4/iDkcn9RXWxCgIl8bo6gyDcXR25sr1NMbJIckkC3bEl//EcMFSSF5m+vBYp08dpl+wOOLQrlR9b9Fo0=
Received: from DB9PR01CA0029.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::34) by VI1PR02MB6304.eurprd02.prod.outlook.com
 (2603:10a6:800:194::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 19:06:24 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::8) by DB9PR01CA0029.outlook.office365.com
 (2603:10a6:10:1d8::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 19:06:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E3.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 19:06:23 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Tue, 28 Jul
 2026 21:06:23 +0200
Received: from se-mail11w.axis.com (10.20.40.11) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 28 Jul
 2026 21:06:23 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 28 Jul 2026 21:06:23 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 686BE2CB
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 21:06:23 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 5F1F212B8C3; Tue, 28 Jul 2026 21:06:23 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] sstate.bbclass: Correct a typo in an error message
Date: Tue, 28 Jul 2026 21:06:17 +0200
Message-ID: <20260728190617.1816887-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E3:EE_|VI1PR02MB6304:EE_
X-MS-Office365-Filtering-Correlation-Id: 29fa1b50-71bc-4d9c-79d6-08deecdb5157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	5+YhCrBWipzcrNxgMyxyIPeZmeLvgQtrgCloyn+xQZkY/vd/dKD7fnl3c8DZyzvB3vNDG+fQGnX+szWBfV00qqSzqwd9qHpf0JUYLMCEDu7Lf/HtkkwafOEbvziub2J7kn3AN1e7OOxAANVHDF2/Dci1pFGt8S0Ir0xqBmfMTwOWEfbHQHNDzRs9MvEBwu9WYJZQVHCVMC5w+BVyxF1Qca1Dsz1No7IQ+0VTqJjZmehRN/jtvlUc95F5pNfmaypfFGW1hDVY1B3O1z1J4I9aq+rnv9ozswQFrDmb52EQ3nH5Qjlt9cBj3JUPMsVGMAHGvSWp1L6MBf2Y5aC73LWlB8gqnQcXS8eE0UvUBshpqHUU9pbb7wSwi/U3CB0GsQRWXretYOtZeFuqGx85e3JBAc5JZsUZS/z1HAWDcr+cghqKMEmK6CF5R4O22y4zb/BG61Luoo/MjIcG0ILfo3aJrvEw28+BljdHje8v3irO0qblTLc8HOri85eVFu1r1fnAeS5ba/NhN3sQe4/5s+cmBg4pA9k/P0NkWBtDp8fW5InzszZLqr9G4nAEeEatXXo/KB+TIyRrtzLVtTs6RbD5fWrMo3YYdqCTicwpOeb7sBck8vHfmNeAH9sAaEUJr9xSl/BvcCbIMf9Sl2Vc9fE/q/AMDn81JLo+ZZkzg0yWCVvBcNCjgM+/SDJsoFQ/euPvn+DPMhohPy+jCmUtr0eJYQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0uRu8vtv1uc7/BZigXCNUjaiOn/hfn/9oVJCtnc4Sc2EA8WETNo02LD41QLWv04uf9lrZdcQMTwdEHNycQtwX9qlZeh9o5BVGMzlGXTaYl9ZWtXtQe7WwqxYaoNdsQ0XXEnb838CJv5RiBVxT5dQEKOQNCBGCSBsYWjPVxDcY20iTvObHfW+Cvm5ZlU4uav1MewMBHa84iPLWQXL3u+nkDrncW0DwPNr+ZMnCdxzkeBp7po5BYF22scCEzm87QYTtWEn4UQDCa1FJxqHcefHUhD+O85WO0E4ktOOwpkUXMkNxWHZVsoR3qmDUETbK98aVXcd4eshSNF3Z6KXgHXSXGpwOhq4oyOykX2Nuwwj63rOCixkA0buriswTc3GgtBwpc3rvU2wbKC78pL8zekVw7SBFTeJMd6YZ07U4JnEi62jYKHdwvYvP6MFYgR7G2++
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 19:06:23.9369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29fa1b50-71bc-4d9c-79d6-08deecdb5157
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6304
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 19:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242198

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-global/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 6ee83717bb..169654767c 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -663,7 +663,7 @@ def sstate_package(ss, d):
             for dir in dirs:
                 dir =3D os.path.join(walkroot, dir).removeprefix(state[1])
                 if tmpdir in dir:
-                    bb.error("sstate found a tmpdir path reference in inst=
allation directiory %s which must be removed." % dir)
+                    bb.error("sstate found a tmpdir path reference in inst=
allation directory %s which must be removed." % dir)
                     exit =3D True
         bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1], s=
statebuild + state[0]))
         bb.utils.rename(state[1], sstatebuild + state[0])

