Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87F3C77B7F
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 11:18:43 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.81])
 by mx.groups.io with SMTP id smtpd.web11.24393.1683285514807555454
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 04:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=lwimKTv5;
 spf=pass (domain: siemens.com, ip: 40.107.6.81, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpR48MV1TT3T4tPECaJzmTdTTqtibkSJ2IvYG8hv5ROJoAxBfpKUcIQxB/WSG79y9GxJqzG/dv9dAQCEMqAW98B8uxEWBAk+xu8D0MQZ6ekDfpViv6aWsYM97Qn+AGwxc1RLUtLWvtMuflOpzGFdHfWGpMc+aSjMfOw6FfzzAQ6aL9Dj86femMaq9sjy4i911eQglKBKpqkWR19+L3aH9a3x5OR0EfvofRAiWQXW3jKvqa1tYrhPPMNZX2+UTS7+sfUeMS18msMIlWcAxC/fdpzVI5aqnmkJ9zG+2MkTz6ORXpQEjVCOBpGmlencZda5fJprTIoHw45r7kvKsx6lzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4s5WG+X2KDiB0AfGaJsxf2TmgISV0J1m1sZIR/GRCwg=;
 b=FTNw5NtO+7pzcImqQ7vXn9M5NGGAXjuLEkyhKYJqOuEC+aMbH6ZJqKXRqRMbrReHe2N50pjy2M49A/W6RLEjzKCzI34DjCfaUEDfNA7OflAlfBBQ8LlhefN+jhFUsLsOG9dwMNzwu/uRCWIJKnL8ZSdtO0Lr8/Hd9uGGwRMb6LjobC8oMMtvGVjmaj8dKn/mDqNttuL0hgKoIuuTMxnUEh1dvxqVD1DYg9e7iYNEsqxtV9bmWqnWjVZTk5dy6IdM8vmxM3dkoItGQb3JUEe1SvJlujumXHen+5gSZt5nYHBSiiABcTn3su4bSI+k2tQKGKGI8BUvT0tp3mEExSVfxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4s5WG+X2KDiB0AfGaJsxf2TmgISV0J1m1sZIR/GRCwg=;
 b=lwimKTv5Mh/ADGRys9CFRCObqRalIiUmhe7hjR2aOSX5TGEN1fuyhnkh65gwv/Qi/VT3iss5OY3N9toA5x4MoMHfnQ+CqOLXSp0bFLJaJRXmMQ+RoSW0Aegb94rVVKj6xvDSmuJdcZkQ1xKRSEZdxB8QRuyuz4p/gtcAL0tjit07t/Sw2RitxFC3ZSMOofgnuGpkkvGqPboYnc1Cn7+jx1mOBHz9cI7NiCb1leLGfvHxuxH9OK6mcGHUhCeDkNPfmqGIKrP/k9rZiAbONXTVa4DPfvHRADwTvQtBkxgM3HB9GV3I+yBLz1/jjUNM2/FGYa1En2d1Wz2eGT66wGBgwg==
Received: from DB6PR0601CA0039.eurprd06.prod.outlook.com (2603:10a6:4:17::25)
 by DB9PR10MB7124.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:459::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 11:18:31 +0000
Received: from DB5EUR01FT030.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::99) by DB6PR0601CA0039.outlook.office365.com
 (2603:10a6:4:17::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27 via Frontend
 Transport; Fri, 5 May 2023 11:18:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 DB5EUR01FT030.mail.protection.outlook.com (10.152.4.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.25 via Frontend Transport; Fri, 5 May 2023 11:18:31 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 5 May 2023 13:18:31 +0200
Received: from md3hr6tc.ad001.siemens.net (167.87.35.172) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 5 May 2023 13:18:30 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH] cve-check: add option to add additional patched CVEs
Date: Fri, 5 May 2023 13:18:14 +0200
Message-ID: <20230505111814.491483-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [167.87.35.172]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR01FT030:EE_|DB9PR10MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: dfe9bb20-0023-4cfd-5f73-08db4d5a7574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lM/iAX32FN/iKiAx9EQcbpXxi9rbIb8FqjQ9Ix6th/mtPWZL7BAVMCTyB0pFTUf//BEzQ8W68lHzYIqZETMuBa1ODQ0nYhtjDce9QgsVhj3oPicJIXG/03ljHHkorjYRUYXtd0xc1vd1ZbHGAHdutj3UT4L4RZnt4goEyVQhlpDOPJ0h9yi+IgqG+o0jRD1LJBc6UJ/LY0McLfuw74Gn+yj084PXHwjBv6hgQMU2UadhcCZY2/tepxyWEJKfyHQmHIdWI70ZRK0jJIDYImfoSXfXbJhcFyKk7ieYQyAS1tWiCQlVhc5MlBz4TUEvkQrc1JfdoLZZ/TgH3OJ3Pj249eFkEB+2Aa+07KEYFwz2nI32p1m3xBqbbVx4lNSD0RJjhazxa8rQvyun1SJVfcKqpOX/BUaOSz0WpgpyNfpBhObSGOYu5wb9Ndb3GSOrJmRe7nKl19Eq7Q8jo+nW/ejvxNbz5auTLuZr1CNBxwR3URD/rU73hAogvn7dgt8XWwF+LmrEiTTvMyodPIpmyTLsz3gHHdBELbQk2IzPw8iCT8OTIx79tixzy4u0HdJYgOmp7C56mKne5Ja63XTo4lu6AdOEukXD1Fa+R8jllpk3ugO/2xtMxfWBpwRYV3h1Th/r6KUlpSxC1+9lH9/EGCYFNafcGt8rgbYTVhWCYsz1qw4merysFfd96iLJD5c4q969KxUxGUL1Rmq8lW5a7Y/zJg==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199021)(36840700001)(46966006)(40470700004)(36756003)(86362001)(316002)(6916009)(4326008)(70206006)(70586007)(6666004)(478600001)(41300700001)(40480700001)(82310400005)(8936002)(5660300002)(8676002)(44832011)(2906002)(186003)(7636003)(7596003)(82740400003)(356005)(82960400001)(16526019)(2616005)(1076003)(107886003)(36860700001)(26005)(336012)(47076005)(83380400001)(956004)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 11:18:31.5388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe9bb20-0023-4cfd-5f73-08db4d5a7574
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT030.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 11:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180911

CVE_CHECK_PATCHED - should contains an additional CVEs which have been
fixed and shouldn't be mark as vulnerable nor ignored.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/classes/cve-check.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index bd9e7e7445c..957ea0130dc 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -78,6 +78,11 @@ CVE_CHECK_SKIP_RECIPE ?=3D ""
 #
 CVE_CHECK_IGNORE ?=3D ""
=20
+# Usually a CVE gets treated as patched when a patch with the name of the =
CVE
+# gets applied. Basically this variable should not be used. But if there a=
re
+# other reasons to mark a CVE as patched it can be added to this list.
+CVE_CHECK_PATCHED ?=3D ""
+
 # Layers to be excluded
 CVE_CHECK_LAYER_EXCLUDELIST ??=3D ""
=20
@@ -284,6 +289,9 @@ def check_cves(d, patched_cves):
=20
     cve_ignore =3D d.getVar("CVE_CHECK_IGNORE").split()
=20
+    # add additional patched CVEs into existing patched list
+    patched_cves.update(d.getVar("CVE_CHECK_PATCHED").split())
+
     import sqlite3
     db_file =3D d.expand("file:${CVE_CHECK_DB_FILE}?mode=3Dro")
     conn =3D sqlite3.connect(db_file, uri=3DTrue)
--=20
2.40.1


