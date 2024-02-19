Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D6DC48BF6
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 01:28:56 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.74])
 by mx.groups.io with SMTP id smtpd.web11.32254.1708306128142012346
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 17:28:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=KPJ1EfFJ;
 spf=pass (domain: axis.com, ip: 40.107.104.74, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOUvHSaHOz5NuGwoaH638GVrYjpnCaT6I9WV32yHyxyYedeD/MtQ+QJNjdaYcD5CKwF/PvPXfiDueEGEvjZ1gtdXP10QPaAapnjw9lGHECPZ3BEG4n/hTOjj6wtwKvUQjNHyX3Cwbq7ctvHI9h+ErEm6OZnWnZHx5CCtsIJjSlBst/2JcqdjgPsJKji22jjTbWD6n2tOokpKTgA8syHTzCJWmItBQrAFqHzfZX0KJQpTXf8hojJduQDlxk6HcXlQb8HmY7gxvPUtEmOnNkJ9H4BdyLft+Y1iXjF8BdrtF6ZL/Oe38MjrRw2SrSAfJ0rD90hXapgbQMJ5Jgx6UyOIQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+RJcf5g8PvdC7dtJKYG01lgIcxYdyjatGWYQd7b6Ug=;
 b=WDsENPQpfFicvbPnjKOCeDlzgRD7le1gbzfdDR5w4FljdiC/l4AlStMPjJMa9ATEhLHWabvqhD/LHvmYGNyUo/RI+sGKyynwTpHFTE0plSDwwwXIgH1DpMHmNlgunv+ISAEf1/1zrDEGVPGE8PNpCDiu3yFWThUz5UhhLbHJ6j4qoIMynvlssmP5pZiSg+eU5gXWkG/eax7f3urHzFsDl+XH59dlzus5ZCR1yAT33om0hknUWGaD+iIkybhPhu1UxZTcbFTPSLKdlY3jx3RD1xBJlwy95HIPLdxZXwbQMj0l4712m0obCKrjHYFDYN7MPm+SYNhV5CjYG5LcVlytIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+RJcf5g8PvdC7dtJKYG01lgIcxYdyjatGWYQd7b6Ug=;
 b=KPJ1EfFJEA+pZlZ6BlUCppz45ZxMb5ZDL8/K/z+MfCS4x7YT7a+RPW2M/BSKMDs3iRx1fbQAlBq8WO67RuO1q0MqzgERXc3BWVaZYm7E7NYEvGWOnAbYSkDpGY1qx9YV5ya1pFknwex840IcBxWy6gSeF91nATBZ4uV0VTXe4K4=
Received: from AS9PR07CA0035.eurprd07.prod.outlook.com (2603:10a6:20b:46b::25)
 by PR3PR02MB6217.eurprd02.prod.outlook.com (2603:10a6:102:71::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Mon, 19 Feb
 2024 01:28:45 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:20b:46b:cafe::4a) by AS9PR07CA0035.outlook.office365.com
 (2603:10a6:20b:46b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.15 via Frontend
 Transport; Mon, 19 Feb 2024 01:28:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 19 Feb 2024 01:28:44 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 19 Feb
 2024 02:28:44 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 19 Feb
 2024 02:28:43 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 19 Feb 2024 02:28:43 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id D99171494E
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 02:28:43 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 41J1ShJ53090835
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 02:28:43 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 41J1ShGw3090834
	for openembedded-core@lists.openembedded.org; Mon, 19 Feb 2024 02:28:43 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 4/5] patch.bbclass: Make use of oe.patch.GitApplyTree.commitIgnored()
Date: Mon, 19 Feb 2024 02:28:31 +0100
Message-ID: <20240219012832.3090768-4-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240219012832.3090768-1-pkj@axis.com>
References: <20240219012832.3090768-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B2:EE_|PR3PR02MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: a611320e-5173-4f85-843d-08dc30ea1cd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7VoJ+V7ewZSK5LFO2MtzcbI2t1yNZ1CmhNA8hIMCTkA/a/N3RaSFRq0otb07PQoZC3p2ySqEoDcambv12aj49twBdxSLrFOpmRpdQJomo+iYI3GjNjDkPREhziRJI9H+Etmf4MfkiGev++NZw25Prox1VRmpOI5wngAEoh35yNsvzX5MqtHxBJG33znSN4e63RCpijhs5nmQusSKyaJpTnNdWmRycKwvLQyAoKmYyXy4L8+QRxlcQhicfWLG9xcl24/o5Mp1b9DNTtDbFzKrrxHZGm+O+mT/do3hCrU2e+4pGYosdPCZ1MWlIw99EwXgI/A3BEaK+N3UUq1IJ6T6KLacf750Jjo0A0cynRawCPfQSqHa0+CaToXSrvskua3xVjsFJMfbGgMIrPJNhDbBEy0pXH8LWUG7NGN5P56LAE2ARHfKmPzpFGAJP04A28DVZbtpTGWU42NvB9pqS73xgZMWmrLsT0je0hAWvx1poVQXFuuQji3/IY6DDNaziKM/ZWb5F8wKuhWAPe+/jgT1uh9R1OTHlqVy307LiWBLBbzk1ceiwNCtDjeRdNySsVtaUOhPsHjMdluT+M+IfObKzGUkncfO+Y62iJZ82fnCepYgJjTXBPHuuSuhYYVxYny9lmkeqhnQ3/wHfZSSYdkptw==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(186009)(82310400011)(1800799012)(64100799003)(36860700004)(46966006)(40470700004)(8936002)(81166007)(356005)(8676002)(2906002)(6916009)(70586007)(70206006)(5660300002)(82740400003)(26005)(1076003)(36756003)(2616005)(83380400001)(41300700001)(336012)(426003)(478600001)(316002)(6666004)(42186006);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 01:28:44.3272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a611320e-5173-4f85-843d-08dc30ea1cd1
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6217
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 01:28:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195853

This makes use of the oe.patch.GitApplyTree.commitIgnored() function to
create commits that shall be ignored by `devtool finish`.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

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

