Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B97C10DCE
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 19:22:40 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.79])
 by mx.groups.io with SMTP id smtpd.web11.41996.1701890559233776191
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 11:22:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Z+WxvRZJ;
 spf=pass (domain: axis.com, ip: 40.107.15.79, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBRpO6T7u+QDk/KzmLU6i0/lSt45/61sFehNUvu33zOoJTVdJw4dqzz7qv8yBD1WnizKTeexrsCyi4othuHBdCSkKuTVxhGcxt7qsD9BImzvK1Cey8mLVTAuB+ltVp4dE6CzjaLj2V5HROaZhLeF6joqNXrmYH/I/5jgkWu2+/SykGGzYpOeImW1nZZdVlbDwIonGrF7FiO4aER9W1PgdPKDAveQ8rOaNBOOgTBZURySy+21uUeLjkDF976IrX3v6PIAu9az8Tlu+iFbzqYK5zWsx7piDzqTtU9v+P0LTdV2HgPmwvTMOiFdc0DL82EMw8EtTfYAIxsMtlTrlxxK7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjgM1auMgtGcX+tMjlp1yHFTVHmMVFipfVBFyzlQs00=;
 b=FdlJpAwC1jz1oA/8GHIZEM+RW0f6J0H9roN/uIaKGRGgeIxQPph0VbWUYULXHGqw+LHg0LP2L/Grex7gJ61NmvXf/Cv+UIoAVOs5kX0OzpQBd7FcbHAEA6LC9IySqF/4E7wm4hoR/TrJV6wlQWUXmp6GaGB69nYBhMDmLBWMNR/cPQzDk94FMAY0ZmQMZZwV1dEuXb/5oPQ8rDROG2so9cbv+IfGCIh5qXcngbQJkQaziSyFYc3tCbLP/Lw7/255qKiEmpen9VxtFXe3J0TyiEERLRCyXuqBPyGJdzAXazT1e4X0TpWwz1+S4E9w0fv0P9NQ0iObaUKjIk5C41q9cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjgM1auMgtGcX+tMjlp1yHFTVHmMVFipfVBFyzlQs00=;
 b=Z+WxvRZJPOnWP9qdM8TyJg7SG/NrZ0m8ry2XcN4hCwnQas21S+VOAH2Z19hJYzHV5cmJGebOXpd37qD6PB33n6BRiEyezKzsoXpDL/5OfM9HYuNE1OFLTCfexCLGehAOMkL3givWWGrmfRsb4rBusuaQj5V25212NMcT9XrzZ+k=
Received: from DB7PR02CA0003.eurprd02.prod.outlook.com (2603:10a6:10:52::16)
 by AM7PR02MB6161.eurprd02.prod.outlook.com (2603:10a6:20b:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 19:22:36 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:52:cafe::3a) by DB7PR02CA0003.outlook.office365.com
 (2603:10a6:10:52::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Wed, 6 Dec 2023 19:22:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 19:22:36 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 20:22:33 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 6 Dec 2023 20:22:33 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 7B6A8F5C4
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Dec 2023 20:22:33 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3B6JMXI72838211
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 20:22:33 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3B6JMXmT2838210
	for openembedded-core@lists.openembedded.org; Wed, 6 Dec 2023 20:22:33 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 9/9] devtool: modify: Make --no-extract work again
Date: Wed, 6 Dec 2023 20:22:07 +0100
Message-ID: <20231206192207.2838077-10-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231206192207.2838077-1-pkj@axis.com>
References: <20231206192207.2838077-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B621:EE_|AM7PR02MB6161:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e4a2a7a-d4df-4bd4-84d0-08dbf690b422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gTcjICCaismAwRUAjifviSHo1ZyiG6YbEH0dLtpqgn8TuIcXsjnLiK5+QgviBLoMgImeX8z2K+/aAePi8QdJgoQKCjXC2sQp4rWqjow6O/yXgJtQugsM5QfR4/aHZw1U+380p6tubpNti+bpE6S8p/EVVbuPJIGy6ywcIQiGBag4nQgBrIhZJRt2FIuxi42RIBPJ6bVsOllJWtbtVN5TlfzO/UFnMH7ULlQSBx2QTKeJauqtr5t0admt1RANTcdDE4pKdJfXTZsotmqI9x+hQTpNRIA83AY1uvK1OTuxo+dKAXwpMj1u0RemcvBpiEFxZfp3IbsDIk1r4ybOSg5A43JKcWddef5HVOJJy+dg5ZEMU5/bW7Y7bgAfDfKyMaKrhfYqMwFfrYA1JVKyJLpcM0o6xh12BZy/Xv8qvGdT4rd9YFaOxlj3yQToyqhbS2vzG+Pd+P/LEwVotErkRjb0A5/SegMvV/rzaHVUEb0ySQQJlnOSkyujv+uuzfXOjD8yvqNWZUwafXD3hp2eqx5nlkydzzi2s3cq7EdWgh6MpHZM9aqEkVbr/7dhRiFL86x/q7F7LuGVQWp3pcPh8G1Cofk0m5KZIV9dfqBSRKWnnqlLMmOPtCG/9oCNrBzUGZ398uC1bXIYbxmT1gYapFqNorZGjo9Fw1NhgtZFuYEU8UJsm9CvZacDEGA9VeZp+okJfH/8RIMrEku3ObRoGn3MheNEAItf+6/cnakzyktwRi0b3tccTZVNhtO2jJ5HzSDxett3vwZA3f0iNTMjWRbl9Q==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(39850400004)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(82310400011)(186009)(40470700004)(46966006)(36840700001)(36860700001)(2906002)(26005)(426003)(83380400001)(336012)(356005)(40460700003)(82740400003)(81166007)(47076005)(40480700001)(36756003)(6666004)(5660300002)(2616005)(1076003)(8676002)(8936002)(41300700001)(478600001)(42186006)(316002)(70586007)(70206006)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 19:22:36.0316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4a2a7a-d4df-4bd4-84d0-08dbf690b422
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6161
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 19:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191915

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

