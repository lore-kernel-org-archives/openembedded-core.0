Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75FCBE776DA
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 01:05:41 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.79])
 by mx.groups.io with SMTP id smtpd.web11.98878.1696295137824035148
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 18:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=DOzd0BXP;
 spf=pass (domain: axis.com, ip: 40.107.105.79, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSvsTuzi+j7ok8MeXzKiT+UU2xQGs+N8wllNdK/8xn6LwsEM70FZ+HynslH2sjo/EPSJxmxOAP77JXdku2rzRZUr4RZHTna9scu9YCB0iuoxxq/MGiTtJ87ejMEsK8CpZNGXcZyyMg2MAbdjVUXWt9D4TYkDvYdgHH/AKCkuUT0OUAxKDGtjSmZNxFa/0KN3aotMI1xlWn4HEhveFurSfmvSOpdWKnGCjiIOsNwPxZlt9upjZTWIp2UMxkPwpf8u4F3HvV6lQisCOjJAmly9L1qngxDYAdI0NAWF+Qb9paFqfNTs7OLfcnW/g6sOLGmkeMifucPDPzPu5ckgLJkTIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BW5XQE9DLA+5mtDNx/4O4ZH7sgkZISGNhAvrvBrpac=;
 b=OLC3Oz2uIMyt1AZuwIK/C/CxOGNMMXANsGJILAozCwGSKu1T5YRlUpMHBnHmrGIq0W1Ryyd0IYa5EU397Q0L/r6SKjALqG6cN/oWsLPmFi23GJL/rLOjT6cbSceeGY65yU56YhMUHjNK1GaC+GeH09Ia7rKBRA+WzPc28uXD6H0zoeYs0D/lEm+jBvy9gzyCniziHubSI+vKJlaSPTO0MSjRQKOTXYb8LJHP/S8eFUd1B/0uNDhy0qvH804Ih1UUZSmY9LfvIySW+TgvOei2b2Mqk5usC032IMmNLkHiIVwYTNLS8+g+zssNa7SYrfCAsl0OL3cW5FahyOgrhvpH0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/BW5XQE9DLA+5mtDNx/4O4ZH7sgkZISGNhAvrvBrpac=;
 b=DOzd0BXPyG2P6hamswr/Xg1bICBAizbWLN16MrgSNWduWDO3uYE9vk8s3oAgBt1jlp18sqjxdZ2MTYUoMNYRRppW82GUVqgxvg+mW1ZIeQBX0xJkjn5s1oQ7V8A2VqhYgQ0r1ElPEm3KLFCkmUArG8Uu+CDjLkz6SBz7sRmBjVw=
Received: from DB8PR03CA0009.eurprd03.prod.outlook.com (2603:10a6:10:be::22)
 by AM0PR02MB5809.eurprd02.prod.outlook.com (2603:10a6:208:187::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.37; Tue, 3 Oct
 2023 01:05:34 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:be:cafe::bc) by DB8PR03CA0009.outlook.office365.com
 (2603:10a6:10:be::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33 via Frontend
 Transport; Tue, 3 Oct 2023 01:05:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Tue, 3 Oct 2023 01:05:33 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Oct
 2023 03:05:33 +0200
Received: from se-intmail02x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 3 Oct 2023 03:05:33 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 1CDCF1072
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Oct 2023 03:05:33 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 39315WCS2892779
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Oct 2023 03:05:33 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 39315WBu2892778
	for openembedded-core@lists.openembedded.org; Tue, 3 Oct 2023 03:05:32 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] externalsrc.bbclass: Support specifying patterns in CONFIGURE_FILES
Date: Tue, 3 Oct 2023 03:05:27 +0200
Message-ID: <20231003010529.2892756-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B88:EE_|AM0PR02MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: aa6d0ab9-9d0b-44da-db72-08dbc3acd87b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kmrkA9sbt8zXBBStG/0FcBXdTq5JqMA8Bii924vvp3MU1mWSnNREvNW6dZyXj8YNC8JVLY6XDxGizgGtqCtt+m2OXfC7c3nfZyXtIRygyyVFxoxecTGhjO2+TVaH+ZzcKkwSeJXHdwAfzYxjkfrbcz4T/Q/sVc0Dp9NaL6o0sFW3THX5BosJmsH8/oi9emp8wOORH2Oeock7+AhKvMDfTQNsxYF5ak3Ov9dVFdhU+jJhgfnLv2+yUpyBeCLnObC5uBg9gJpEGsh1xL4PvfjrGGhI9kjv/Wbxr3Nj+PzipxV7PsvH2jUvbBD7DO1BuVBo+mJkMuP72iGvc3yCHo8CVTJSSIklh9b5B6wYSTUirCBq5IR1slW4i/M2VxS7rkxFG/qVoxIbJ7hqJyy9s/FxUU5EMoegCGHLZzBi4Sm3rbmIzwaJ92MsjH0ZW2LVGVj0/Zra4FFE9WICQuKE9jVLrjegbQcKhUugTZKqayjI403bUqVeDtwRBgBYJWbH2b82UziePR95JrCtSjpw49hvQ7ZGtHmN6Cu2aaOECNm4kiNFRlaF7H/pDsovbQIhfziB3kpEonBVNkcYC2VrLcXFaz0CI26QHWFpaJGsLUYXG52pVo9s5ouwUa39TQmVNftZD/Ttk3bnRKqiqz6dIbZeXGlrz5Qkb9cka3Wm9qv0MuVNnf36n5zQVB3x1OOXfhZdUE7ciC1axHdtd+2VLjHsGNo8fO41xd1nWvggDsfhVs5Qr8vPiGCmQYFstcmX5hqCpA6S2YebxXSpGy9o7MpfIw==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(136003)(39860400002)(230922051799003)(451199024)(186009)(82310400011)(1800799009)(64100799003)(46966006)(36840700001)(40470700004)(36860700001)(83380400001)(336012)(426003)(2616005)(47076005)(26005)(1076003)(36756003)(478600001)(6666004)(356005)(82740400003)(81166007)(70586007)(6916009)(316002)(8676002)(8936002)(2906002)(40460700003)(40480700001)(70206006)(42186006)(5660300002)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 01:05:33.6219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa6d0ab9-9d0b-44da-db72-08dbc3acd87b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5809
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 01:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188616

This allows, e.g., *.cmake to be added to CONFIGURE_FILES to make the
do_configure task depend on changes to any cmake file.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/externalsrc.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bb=
class
index cba80bb1d4..a54f316aa0 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -252,6 +252,8 @@ def srctree_configure_hash_files(d):
     Get the list of files that should trigger do_configure to re-execute,
     based on the value of CONFIGURE_FILES
     """
+    import fnmatch
+
     in_files =3D (d.getVar('CONFIGURE_FILES') or '').split()
     out_items =3D []
     search_files =3D []
@@ -263,8 +265,8 @@ def srctree_configure_hash_files(d):
     if search_files:
         s_dir =3D d.getVar('EXTERNALSRC')
         for root, _, files in os.walk(s_dir):
-            for f in files:
-                if f in search_files:
+            for p in search_files:
+                for f in fnmatch.filter(files, p):
                     out_items.append('%s:True' % os.path.join(root, f))
     return ' '.join(out_items)
=20

