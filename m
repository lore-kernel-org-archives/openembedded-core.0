Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D03C46CA3
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 20:55:51 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.71])
 by mx.groups.io with SMTP id smtpd.web10.45021.1701896150445737061
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 12:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=C6S7++gB;
 spf=pass (domain: axis.com, ip: 40.107.7.71, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKRDUM5DUXLkeDS5Saozcx44AN+BAls9u2LOvhrxnCue2MLKjb2Ga6Qdl04fqrXwreoLuj6CN21NupLU1bEtgi6/Cv4IUbKnTzNhUVoaHfNX2QSDa17exPDNLRjhtZO0AOjCBC9t5iFLUJYptShmxwr+WxtbBHG1Egwj3JBAMc2V7IoTXFTjCDH7canAQske27xDEKY4bkthkDDaiFaDBBAC8FynKHEs+OIhicf7LEBi7vjLPz6pHzktDp/yzKODBuJ3Ky9qiW/szkmrjcqgcOaJwwZ7Q0zYzT40erQHR+nK6MOLJ3vF5U7OLo9UfG5rRAMtvJDKgJ1RNw3tuISXhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjgM1auMgtGcX+tMjlp1yHFTVHmMVFipfVBFyzlQs00=;
 b=C5aXi59oIjFNCKL/KQaTGfpk5KstR01WnJpSTzMQmothq/uZr61g0parUeUOYSiuaenqCmZM5tluF3A/YbD5U3twofjIeiybe0M6cq2NVppiuDqBzE97pJ+ZxvfawgAiAZKV3d5Xf4Tki5zM0KiPqq0FOKf7ZUkbO9pRh7sE6WaV+F7MuSsbtMuzbhkbJdWpxJZ1/yZpjntap9mv/qP7rnpG8tGh4KAMbvncLB6vpRycGzofD3xWN/ckkOAM6TH2Yr1yWpx5WjFbv7Cfs320PH7Uy9o8E+lvuax6OHx2qszzPeOzNWjQuRIHaMBxKNXbk4xttpfAzmjaPI4sz1NhKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjgM1auMgtGcX+tMjlp1yHFTVHmMVFipfVBFyzlQs00=;
 b=C6S7++gBbvy6K5stu12Fo0hhTi4yH2KJFnoS+yK7y8i57THVTfAVYXwwL40Id5nyhYbNEoHnhmXPYnpjEEcQ10dDgPUQeVYainqOveeHENEuKlzJcg+I1btVi/XFpe72moAVqGDk5+PUcwcQeWWEGBLQwsnGpQvcx8mkDny3dPI=
Received: from AM0PR02CA0127.eurprd02.prod.outlook.com (2603:10a6:20b:28c::24)
 by AS2PR02MB9320.eurprd02.prod.outlook.com (2603:10a6:20b:578::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 20:55:47 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::b6) by AM0PR02CA0127.outlook.office365.com
 (2603:10a6:20b:28c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Wed, 6 Dec 2023 20:55:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 20:55:47 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 21:55:45 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 6 Dec 2023 21:55:45 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 2B846F686
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Dec 2023 21:55:45 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3B6KtjP04037621
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 21:55:45 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3B6KtjLT4037620
	for openembedded-core@lists.openembedded.org; Wed, 6 Dec 2023 21:55:45 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 9/9] devtool: modify: Make --no-extract work again
Date: Wed, 6 Dec 2023 21:55:31 +0100
Message-ID: <20231206205531.4037549-10-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231206205531.4037549-1-pkj@axis.com>
References: <20231206205531.4037549-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000041:EE_|AS2PR02MB9320:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aa17ce9-9d70-4061-09ee-08dbf69db8fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SfZBPJgMCTsenE+tRQldtNheYwd8iEglt8tw34l4si0z/jHguH5kPSCQGL6EYUi9ohUzC5ytk7a0S3BjGNuIZwV+1wQw2K92iz8P3eHY8c4gWnI92A731I/pFvSBFzHzzQN7CFDZdpt2FtaDJfaMJNSIOtnYR969bOSjwiWlK27W/efh7nP/5tLRYGAbGlrToPI0/iwxDBEgAZfK0/mB9zS5v2DisUCa24nTMHQwZMgMabgNfP1biCozMIHC5yFEOYYvZRZWxtdNoqLTa5E/JMevOMGSnuPdXNtE96ITAFxE0Vvjv+pNbqltnCHGaHLqEu4twNgBrGcEV7ob0tTyQsMkSLkOer89N3+PpkAg0XVSKp2F4jg6fg0+1lxLheL/pfDrbVMxja1Igd7x3N61kKOxZstG82hbzC0jQ9nBxuBsFwUHgRd9YDSLfhdMGLdG2aEAcSTwBYB3BYeV4IHzE1K5US7IQ3sV47nqJ/Fk4iwhs46Td2x6ZcXphHxIZUES+k1LCK0k+PKLjtry21EkMYH60P1Kvaw9WS93xE+0zCph6uFa5oupiUbhjZXmmaWx8LY0grcgVU67v6ftu/zwKHInPJvI59dPuFOedqbLFy9SzM0OM4VMVLCkCM1zfqYxY48alslXOPCIN7oGDSciDel7CXeRCGVrtQue9Bdz6H68f9S841V8Z5K5hIPNF9+s4uyvbhWrA06uKOpQc5Zpd3jJ94nzcFVfsNx8BDjGbvs2ITd5DVfdl73yWDnPCoxorBPNgwvvac5E9EE+rIftyQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(82310400011)(46966006)(36840700001)(40470700004)(36860700001)(426003)(83380400001)(6666004)(82740400003)(40480700001)(6916009)(336012)(26005)(2616005)(70586007)(70206006)(42186006)(316002)(81166007)(1076003)(478600001)(356005)(47076005)(8936002)(8676002)(5660300002)(40460700003)(36756003)(41300700001)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 20:55:47.6502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa17ce9-9d70-4061-09ee-08dbf69db8fb
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9320
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 20:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191930

This avoids the following error when using --no-extract, introduced in
commit 900129cbdf (devtool: add support for git submodules):

  Traceback (most recent call last):
    File ".../scripts/devtool", line 349, in <module>
      ret =3D main()
    File ".../scripts/devtool", line 336, in main
      ret =3D args.func(args, config, basepath, workspace)
    File ".../scripts/lib/devtool/standard.py", line 995, in modify
      for commit in commits[name]:
  KeyError: '.'

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/lib/devtool/standard.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index ad6e346279..5b7ea6b886 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -991,7 +991,8 @@ def modify(args, config, basepath, workspace):
                 '}\n')
             if initial_revs:
                 for name, rev in initial_revs.items():
-                        f.write('\n# initial_rev %s: %s\n' % (name, rev))
+                    f.write('\n# initial_rev %s: %s\n' % (name, rev))
+                    if name in commits:
                         for commit in commits[name]:
                             f.write('# commit %s: %s\n' % (name, commit))
             if branch_patches:

