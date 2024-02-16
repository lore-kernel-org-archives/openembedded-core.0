Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D8D0C48BF5
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 19:00:11 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.79])
 by mx.groups.io with SMTP id smtpd.web10.5205.1708110006335943639
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 11:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=cdVv8b0b;
 spf=pass (domain: axis.com, ip: 40.107.104.79, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n91JlDDhNjEIkd4Vz2OvawJaLff/3quUVfd4GHo0VLBU6Qceqw79dxIwNL+YFAAhw1uh84yBI+DvbbiFvYdVLcUJMVO0sROXod1GplhWu3KUzmAurLR0HtLnXhmTTRHgJsxhjonhu3UF2Y9neAyyrK00B3G+SYBHkeHFFe7jjgPQgp2DxNXOWQbwBRuTK/ma9emfu46uKnKT5kw5ffjr4qU22yRABYoW325wF/r+6JXCHr+/9iXPrFgqXCBgmz0Yp5sGjEwthDT5MeyfT+MwmVINZxhwxVBORGD+WvAFYmhzqUQwFBeg/nb6/I9VAkfeFShm8sGSktrjB/zpKYI3eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trhDGfwis0o0vWS8pNIYbD71DN6HVqcS5/4wQeDeS5o=;
 b=lhXT7EbfqmEdpT6yiZ5hRp2veUxuYCtVc74VsVgAIr5S1bh/Kz0nvSKaa77WFMT/hyHyJqsKwK3rA7v/+bFmA2qk8Jsjws6epumv4gibDotUHQVs4m+aiZ5EHnvQx+ZdsaX3xqObUU0sZSTWXhEpCaFEzEUvKaZ+I8stYAssuduXJAhyK8QDsHumoeHWAo4norzzvabJ7PhfKv2YuRryXdMJObACeQaHyc4v7inf0cIoFVLA6Op6zyKqGvRIXn7YmWQN9PZwMoj26AfIeQfAUcN5MItT2qSBn9UtcQUpbo7LxD+8a45ee/qac1i+blonAT+w8gGSkM8ANE5GnjZ6KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trhDGfwis0o0vWS8pNIYbD71DN6HVqcS5/4wQeDeS5o=;
 b=cdVv8b0bj2PA9xHthqMKMCz7pz6eBw54A77LEnwIGIDNb5QVevesnG3QrHtvO1LPiMdcFP82iRd6q8Oq5EQXWxo6wBSfMR9DA6P4L7SozKbixAszTBCKtnDW5muYohAGI+nySDL9ldBE/0v6qvyM4M4Kef3/ZxVa2N4DeB+GSoQ=
Received: from AS4PR09CA0025.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::15)
 by AS8PR02MB10169.eurprd02.prod.outlook.com (2603:10a6:20b:63f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Fri, 16 Feb
 2024 19:00:03 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::be) by AS4PR09CA0025.outlook.office365.com
 (2603:10a6:20b:5d4::15) with Microsoft SMTP Server (version=TLS1_2,
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
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Feb
 2024 20:00:03 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 16 Feb 2024 20:00:03 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 0A19F14944
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 20:00:03 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 41GJ02X72607026
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 20:00:02 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 41GJ02al2607025
	for openembedded-core@lists.openembedded.org; Fri, 16 Feb 2024 20:00:02 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 6/7] patch.bbclass: Make use of oe.patch.GitApplyTree.commitIgnored()
Date: Fri, 16 Feb 2024 19:59:55 +0100
Message-ID: <20240216185956.2606978-6-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240216185956.2606978-1-pkj@axis.com>
References: <20240216185956.2606978-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA2:EE_|AS8PR02MB10169:EE_
X-MS-Office365-Filtering-Correlation-Id: df3fa98f-a656-4729-4ca8-08dc2f217bd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k8PKjrVoXAMdkL+0E4PjnpOJQexxbEhA2sIvvUWJMel+iKojKGaVynth9TU7amS4fu6B6fOv3gmkt5cgc7qy7hKUvSoxi1YegriBKb6/yYyy+zGFezzmaFvnaNyLIvY8I3piQcVJy/ORnKDCAtqLGL/zRboyJpukMPpcjIzvxKc67Lp/RChREkLDqE8W9wr1auCr03VPopY2+dAY/3JPMVLzjykkMdRZLJdBZqcXAq+QeXTG0vMicgQQ6MNkSIyHVA37mCk022BanaEbo4RDSAP8ytTzuJeeUbyGINxUOxAXB7GTU8VAMadpo0VDObaYemjMPveMLs/3NBib94dTpACyVZ0Weye2JR+gVBLhb72O4U5y3qsZYUBn6dsutpofL1C5V7bj+SM2i5EZcQjgLJFBkwL//80UUlcQqUApcIlIDxLDTjlANLy0LqtFXkw57quTaJCBsLLEdHUUINY+s4z6/QzqOgBUAjmijpHlbZblBRnrz9kJMq6OdrNIVAx0m1IZ+EpU9NFwoZSq1cg/cy6vQztZJMQcMTnPquVr8N/BnRv4fsXXCI+dBkA0l5b8oE4wIxMgNFGPN3KpX253oLUxpT9HIZiaeE8Ri8GUlsRz0uCA2HQ9PDMfBGAgC/vnlYE9/FNlJoCDPW/7OS94hQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(82310400011)(1800799012)(186009)(36860700004)(40470700004)(46966006)(478600001)(2616005)(6916009)(2906002)(8676002)(8936002)(70206006)(70586007)(5660300002)(316002)(83380400001)(42186006)(41300700001)(26005)(356005)(1076003)(36756003)(6666004)(336012)(81166007)(426003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 19:00:03.7039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df3fa98f-a656-4729-4ca8-08dc2f217bd1
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB10169
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 19:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195794

This makes use of the oe.patch.GitApplyTree.commitIgnored() function to
create commits that shall be ignored by `devtool finish`.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-global/patch.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes-global/patch.bbclass b/meta/classes-global/patch.=
bbclass
index e3157c7b18..e5786b1c9a 100644
--- a/meta/classes-global/patch.bbclass
+++ b/meta/classes-global/patch.bbclass
@@ -79,9 +79,7 @@ python patch_task_postfunc() {
                         bb.process.run('git checkout patches', cwd=3Dsrcsu=
bdir)
         stdout, _ =3D bb.process.run('git status --porcelain .', cwd=3Dsrc=
subdir)
         if stdout:
-            useroptions =3D []
-            oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=3Dd=
)
-            bb.process.run('git add .; git %s commit -a -m "Committing cha=
nges from %s\n\n%s"' % (' '.join(useroptions), func, oe.patch.GitApplyTree.=
ignore_commit_prefix + ' - from %s' % func), cwd=3Dsrcsubdir)
+            oe.patch.GitApplyTree.commitIgnored("Add changes from %s" % fu=
nc, dir=3Dsrcsubdir, files=3D['.'], d=3Dd)
 }
=20
 def src_patches(d, all=3DFalse, expand=3DTrue):

