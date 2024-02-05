Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7F9C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 16:46:38 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.100])
 by mx.groups.io with SMTP id smtpd.web11.67623.1707151590500854340
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 08:46:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=lFp+VEB7;
 spf=pass (domain: axis.com, ip: 40.107.21.100, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbKRoARS41Mreo4jrLl5XHm9YdPwjhQkqZ2ucpbsVm9oOWKONVFyNBNFtennJw6eC/47Z7QKlS6r6mRetdX1wbz+mghnSeDkp1MWtgK4ZDjAGqbI1elvn6MbYwMza3h2YyH7oXPHL893Cm/F62BrUIbH8m14xpK1ZhwCx0/BZKL8BXysg6zlDCys9R8IZDGhLCv9WYuqkpiGcO3a7BC92PUKnPjitifvtTic3T1lH8jNVri5BBC3iT+/C208gw45qx2IlB0DkOFx3FtJRL46eymEWXgsqOm560952yqMPAFICuhtu7KBfaDVJgyIDM8sTrUdOfvTl4KwgSdRHWKKcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8V9KY7FKxfpfVT2h+ZeBFkcY6L8BRyt3Yd6Q9UDAYzI=;
 b=P0ez5Bo875/l1Z+/WpYpQWcjjzUCwjyNty9osdlQ/M3n1mndzqImAfGtUfYrvNv05DlPpLFZYKew83q3OWXnPgfBQTU2txGYUnduA9OBOn4SVp6IexXTJ4SrtVsPshnAd6Er8mpRc+Pycu3dci8X2KmQ1EGjGZlftnlHOYuoSVMEgQZTU9k0L/kmtK8E7PrvyoE2C/irKSkq9dn1kvsrIDlMwo68oNpol7AUvG8u/RSooBf0yePoBOkaR+wUQQ98rKNtOIb/CwYqWUB5wnQ2R2vL5SpwxavxCxdrJJaJ8mufbQsSC7McJZb4CwB41LJBZhhLzpqkzZ3qY+jVFCRKWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8V9KY7FKxfpfVT2h+ZeBFkcY6L8BRyt3Yd6Q9UDAYzI=;
 b=lFp+VEB7pjBt7ZREh28BRxmoehI8tjs/70b7hs9OZmD4MECBN+acjbOU+2a6g99AP0zm5OTfc85todJKTF0HyLvh8/OSHGUwN2LBSwf0K+fkVAAxHFnj+e7WBH4uGgw7xz1XwxIXxOL+c0q/hcPuZaX8hyJ0L5dyPBE0DaV8+NA=
Received: from DUZPR01CA0262.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::24) by AS2PR02MB9668.eurprd02.prod.outlook.com
 (2603:10a6:20b:5e8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 16:46:26 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::54) by DUZPR01CA0262.outlook.office365.com
 (2603:10a6:10:4b9::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34 via Frontend
 Transport; Mon, 5 Feb 2024 16:46:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 5 Feb 2024 16:46:26 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Feb
 2024 17:46:25 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Feb
 2024 17:46:25 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 5 Feb 2024 17:46:25 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 6EF2713AA0
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Feb 2024 17:46:25 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 415GkPUO3086711
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Feb 2024 17:46:25 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 415GkOgo3086710
	for openembedded-core@lists.openembedded.org; Mon, 5 Feb 2024 17:46:24 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] bitbake-diffsigs: Support tasks with dependencies correctly again
Date: Mon, 5 Feb 2024 17:46:19 +0100
Message-ID: <20240205164619.3086698-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B622:EE_|AS2PR02MB9668:EE_
X-MS-Office365-Filtering-Correlation-Id: 8871ca48-f7b9-4046-e77f-08dc2669fe72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9FuIu5UtUkd6Zr7NQTRfvDhsuBksWNMAYQJmPbHZbHokYfzARLVM5jtWIfBD6E0gbLsZjXvoFgzGMXNirSruT1b5LS2XQfricYrwZIwutbXea+S/F2uuQwVSunrAy5XpU7N55RC/bQWSQn2J4lPco+5fKj8o7njEj3xhqs+CYaYzixQXxvIFE8owxnS8Jwu6G3hE7lvHM35eTOfTmAVnpPSRKL/UZoTXBt2NYdf2VcsWRXd+XX9aC1N4ePa/8XNcPfNis2YYZ9XUJu6BSWnhjigUquQ9LiGqc10MlaMSYQaSkRaQGYlsBVEVmOlOMSQegtCsTkrRsxR0Club1EFHB1yiAVumWtWWdKe2Ktr3kf19jUEVAWTUh1yohNv5vPZ07uPaq+dNKvFyFDkyaQkYuJGXmDEKdq9bAyTUO7VfkaWD+xkSqs4VevMQOq/nfmNpoIzqhOogPH2jN8oh2c5Fk8BxW9xY6eMr7EKOxvDR1wdLpzzpXcyxGZ/inksqF0BLCWtfSA48LSuxGE+WZWQTrqkfK2S1ZI491WI3HFKh8anRF/RCmKGO7V3iRXnh2KwGvJnGHxvUv90GjnsXt34u0YdlCBxB+7iNmUiTLTQHOStqUsLHD2dW84gVEi/xvG7wpOyJ1U5pO9eW+dKyZiP+av2T99r9s33xsG7SOlylTlBkFMMQ2gfGQs26rpj8Et9UswwmBpvtu7ecDWc4wf8roy8GvZT/s/k3z+SUMX9GmjE2LEq1MoImd9NNplhjc6DjfBZ7yhnT4i1JnSAm/0ry/Q==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(82310400011)(186009)(46966006)(40470700004)(36840700001)(40460700003)(40480700001)(36756003)(41300700001)(47076005)(356005)(81166007)(82740400003)(478600001)(36860700001)(2906002)(6666004)(336012)(83380400001)(426003)(26005)(1076003)(2616005)(4744005)(316002)(6916009)(70206006)(42186006)(70586007)(8676002)(5660300002)(8936002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 16:46:26.1507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8871ca48-f7b9-4046-e77f-08dc2669fe72
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9668
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 16:46:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194955

This was missed in commit 5439aca056c84ab4410aaf24bdb68e896191d8e1 that
adapted the code to the changes made to find_siginfo(), which now
returns a dict for each file rather than just the filename.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 bitbake/bin/bitbake-diffsigs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/bin/bitbake-diffsigs b/bitbake/bin/bitbake-diffsigs
index a8f49191b0..8202c78623 100755
--- a/bitbake/bin/bitbake-diffsigs
+++ b/bitbake/bin/bitbake-diffsigs
@@ -99,7 +99,7 @@ def recursecb(key, hash1, hash2):
     elif hash2 not in hashfiles:
         recout.append("Unable to find matching sigdata for %s with hash %s=
" % (key, hash2))
     else:
-        out2 =3D bb.siggen.compare_sigfiles(hashfiles[hash1], hashfiles[ha=
sh2], recursecb, color=3Dcolor)
+        out2 =3D bb.siggen.compare_sigfiles(hashfiles[hash1]['path'], hash=
files[hash2]['path'], recursecb, color=3Dcolor)
         for change in out2:
             for line in change.splitlines():
                 recout.append('    ' + line)

