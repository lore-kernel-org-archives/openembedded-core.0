Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DE3C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 20:55:50 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.52])
 by mx.groups.io with SMTP id smtpd.web10.45018.1701896147962766295
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 12:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=oP74SnNT;
 spf=pass (domain: axis.com, ip: 40.107.22.52, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLoYxuCxMDxxwuqNhC/abVHMLHCb/Ub7XJrf4CgbBEKh9zOa0oPOJWm5dnQk4XzqZXJ4ZkDsOGqMowDkFw/nNajYJC6N+GtRFQjxRi/fqCa8BgJMGBGsy1XOkvIWZjIZQ3Zu55blk/IuwC0327zX3Nto4HtN1MLJ8gZK94zjfCGZ1mPqUpxedxbn8w/OSXdAP0W5bblYf9SromyIFT1OZm/X3NGfnESbn7QMrgHSkhSwUXuZw1gSesdX5woVASFC4l37VYLtHiQWFI6fOlDlLP8elv3N7GPTc6PpLcR71YsjsPJxj6uuoSuSIUcnUAHeE6lAmIDdCuf+hwcuyf8mHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKU+TA0vtuleRncv3nkdi+MNGeUQE8Cv1y/L86RoGUo=;
 b=TOsKwlXowKzIF48Qw9CqCYRd5zVw9ynAq1GdRJn2jM0GxWQCczTAo4mzOXz9MNPLHRTuopa+kgLbrDUdV9HU54IdFf43BxOHTRqbaZrutaeIYfejhqum2fVLlcuzfi/ZpjuRyYD+R0R/MEjbYFjsl4xSEb+qFHlQjqY2aNX/yUxy8vK+5XghLxP6CCewo2fKm/mTNY2o2D2BIKTloy12nGUWG3rmrGXnGR2nrkQmYSGe/8Cd14bR1sceBNBGqqfGJVjNzgpVpD3ZzwoaV7/frVUurALTPgOQVeFWE39KfYKgMJ373w95PWTWXUc5BeMKva+i3zv0cogtz7ILJwnQ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKU+TA0vtuleRncv3nkdi+MNGeUQE8Cv1y/L86RoGUo=;
 b=oP74SnNTjLUbCq/7K/3gGP0++dBKB53leUeH3hLLWGeiVuX7g6an3OEIJUgbyaRbPuwguP124NHXK+IX3Heu+XaQyfZuPk2EpRM9gJ/35SdZsLPTng3xj3EzV3rEKGIma/hktF1Awq6uAV+tDXOEkleLn8Ul+/AvNL9psNHk/hM=
Received: from AM0PR02CA0120.eurprd02.prod.outlook.com (2603:10a6:20b:28c::17)
 by AM0PR02MB5923.eurprd02.prod.outlook.com (2603:10a6:208:187::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.26; Wed, 6 Dec
 2023 20:55:45 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::79) by AM0PR02CA0120.outlook.office365.com
 (2603:10a6:20b:28c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Wed, 6 Dec 2023 20:55:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 20:55:44 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 21:55:44 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 6 Dec 2023 21:55:44 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id F3489F689
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Dec 2023 21:55:43 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3B6Kthwn4037589
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 21:55:44 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3B6KthUc4037588
	for openembedded-core@lists.openembedded.org; Wed, 6 Dec 2023 21:55:43 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 1/9] oeqa/selftest/devtool: Correct git clone of local repository
Date: Wed, 6 Dec 2023 21:55:23 +0100
Message-ID: <20231206205531.4037549-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231206205531.4037549-1-pkj@axis.com>
References: <20231206205531.4037549-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000041:EE_|AM0PR02MB5923:EE_
X-MS-Office365-Filtering-Correlation-Id: 28f33c4a-c860-4a78-e4d8-08dbf69db70f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fuXHWPohccGHgKCaVailiEhqspBsY4sTEYQw3eUOl4bdXjk3RmgVDG2UpAekwzDytmsS5bWKAF8plOBGYAueLdqk6WqsZd3m8HLh52neGv8a0hRl2W9lufmL087PB++hPsSNIpPpl6buI8Yiiye1HTM928l/Zh7xHM1eS6bq4MBECqLJjR+J5yMHZueODWmt2zJQSian7QiouCWT1C8SUEk80TEaJvjWL0SL/R5RIKlj+HE53fmFYWbYyvXJPLlGpGYld/NPDKBFg8ZvDo6JjcxKCaZPKEnYtKpRdkkH6eX2i775z7misP6YuOEoJAClkqZ/uhqiGl0C572VBl1zkWqW6EFvCN6KeCeql4GNohnGmTn2G2llP1hEMGJT/PVUdIicTOLhtmQZfdET586Ecje5RMOE6xzB1QNqu16c2KVmBJmsFcV4X3KK79SgrrTDrwONv0brasH5YDWDbog0O0YPIP7Zj0oQP0aZ/QDnETTwKP4w9y6m8XPkhN9YGo7cV6yeh9Q17jAYiLRXeyR4jgLa5ghCzHKpTDRZy8Eix4vY+tU6BQ4NSOnvWEzWc9LqHqtVnR3Wr1X6nEQXudp3HAg/ejQNHjbxxPE2yAYU/fbfOuYDAkKJw23neYxeY7VUg6tFq+EncJ6RDokDolO2zOkUnsfrH7ON11QtK0ucG5ecv1teUdmyEwgvo/ehfzRpcjDDnRvjuzs+cTqWa1uPfO4zaJ0VkkJx6oW7eM2ip2H6yvPHCBrRDQxT1JQHhaNdXl2WCgy/XFENU0L790sB7w==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(186009)(82310400011)(1800799012)(64100799003)(40470700004)(36840700001)(46966006)(478600001)(5660300002)(40460700003)(6666004)(6916009)(316002)(8676002)(8936002)(42186006)(70206006)(70586007)(82740400003)(47076005)(36860700001)(356005)(81166007)(426003)(40480700001)(83380400001)(41300700001)(36756003)(1076003)(2616005)(2906002)(336012)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 20:55:44.4315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f33c4a-c860-4a78-e4d8-08dbf69db70f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5923
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 20:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191923

If the build environment is setup using `repo`, then poky/.git/object
is a symbolic link rather than a directory. To clone such repositories,
the source path must be prefixed with "file://". This avoids the
following error:

  fatal: failed to start iterator over '.../poky/.git/objects': Not a direc=
tory

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index 2a11886e4b..55bfc24b7c 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -54,7 +54,7 @@ def setUpModule():
             result =3D runCmd('git rev-parse --show-toplevel', cwd=3Dcanon=
ical_layerpath)
             oldreporoot =3D result.output.rstrip()
             newmetapath =3D os.path.join(corecopydir, os.path.relpath(oldm=
etapath, oldreporoot))
-            runCmd('git clone %s %s' % (oldreporoot, corecopydir), cwd=3Dt=
emplayerdir)
+            runCmd('git clone file://%s %s' % (oldreporoot, corecopydir), =
cwd=3Dtemplayerdir)
             # Now we need to copy any modified files
             # You might ask "why not just copy the entire tree instead of
             # cloning and doing this?" - well, the problem with that is

