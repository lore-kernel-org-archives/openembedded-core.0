Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBDBC61DCB
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 19:29:34 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.286.1787845958056297341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 08:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=nMXNXjI0;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.83.53, mailfrom: roman.nazarenko@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgsIimUZ3e44sxzshWAYIPPDbDlX3JLvSoMqmQX3szOGZ+/OrJlX60lLPcOa2iZmDdyBp5HOdbYl/2uk2FcjVFMvF2tmAA1oyyU7SxRCclszXO2terI5HGxAZ32Z/mCFGdUQJs0q6bAl2xZyKd+lMZRCdtjWTNWRd/Yw5KOzPznU6H6YYD+uKs9Y+gn5ag6tO41vYCNvuywACMUQB/FF5npp4dDBJTxc2Beudyqvqpl/Xa9s4M58qRuatD+vpJgDv8xS/47oLr0t/TzV2sPbv4rDvj60T5H38tyl2+By0+XRAsgQRx1cb7+qhJvH/jPcl6Sj4Em80YXyWOyxeiZmfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ra2kBRjwQZVdWi600BnURI7dyWJAZPJpbhBGrCjIZgs=;
 b=CpLkegDn1zvh8QsMbU7hhDlDhKrELy4TCl7+aFLRi5tBdt3sbEisebTdrVGOEWvMD2REn+rBlTOIbvIEcFFgOkEO/BL8I/ZweuzT9lJQzZTOnP2VY29Ysv8W3AAMROgcUAh/9T4UZWIn8oZmBw3gHfs1IeXAYsJ2Wgf9Ur5Rd4sW/Hqo4RK3qNFdfI791jKbu9FtuKVH8ph8leMFMPKu8GLABiQiQdgDuO3gMMMQcYfj6T1xs6/c4gnWWD0VZeJUWhr7kWUCM0sWlW7+9RgfxBPc7vDXdXlnLn/VFNF8CMKyr9xXGhBcAxQHGYlVjOHO42XYcFAkUPfa+k0VgdahhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ra2kBRjwQZVdWi600BnURI7dyWJAZPJpbhBGrCjIZgs=;
 b=nMXNXjI0xiI8Vit6S0LAP7awExVFaLN7OUwV9ksfaNeAsBoQiXdUi3CLOayu4fcNLSCN8yFRnksLCzeN6myW+s/2rEyky93IeCo+X9bxkmqUGrOT5WcW8pFRh6P/vFd5d+y1T69ab3g01M1+nPegDPgaKxZBtpVokVRUmeJ7LkI=
Received: from DU2PR04CA0199.eurprd04.prod.outlook.com (2603:10a6:10:28d::24)
 by GV4PR06MB9983.eurprd06.prod.outlook.com (2603:10a6:150:27d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 15:52:30 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:28d:cafe::25) by DU2PR04CA0199.outlook.office365.com
 (2603:10a6:10:28d::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Thu,
 27 Aug 2026 15:52:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 27 Aug 2026 15:52:30 +0000
Received: from GEO-L5CG4163Q2B.lgs-net.com ([10.67.144.98]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 27 Aug 2026 17:52:29 +0200
From: roman.nazarenko@leica-geosystems.com
To: openembedded-core@lists.openembedded.org
CC: Roman Nazarenko <roman.nazarenko@leica-geosystems.com>
Subject: [PATCH] classes-global/license: create -lic package from PKGD, not D
Date: Thu, 27 Aug 2026 17:52:27 +0200
Message-ID: <20260827155227.813074-1-roman.nazarenko@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-OriginalArrivalTime: 27 Aug 2026 15:52:29.0785 (UTC) FILETIME=[10BEA490:01DD363C]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A01:EE_|GV4PR06MB9983:EE_
X-MS-Office365-Filtering-Correlation-Id: bf18164f-f641-4166-e734-08df0453336c
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|3023799007|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	9bJxadVRfPdVTKhmQ2eYz2sEyC5RQcxjllEV7d0UydRYWH7M7DdeuCHZvhYoiIQsvpIhIGz+yTLO1n4e+U3ITHBVA5rA/w5fZP39mzVXBuFmqowga2Dz0v/8KiwRYYxQ2ATI6sTxnToY+9S4WGa4zzw/eieFsPuyPA5rwmRkykxyogKg39ParzQXN5YOf8NbDUg17zRBv0+IAHY08EYX5CCUIy5fY0pWGHBKSzIfYs54OdCKGXguiEv0MDv5/EQNmcyw/BOL5YH2+rUwj9jzsfrBFtEHfvksNTR65ozUjc0CVDe5aaxc9dAzL4KRb4/4DQ7P4QYBox1czSXUbR52k5fTX1xAhRyFvWnt/l8lgZcJ3yXnrSGZ5lGWfY46jBvnfyi0rDwgZ0n29a3dhCtaNJg0m/hWPHA8g0FlMbnUMvu/cHs7su/MbXB9Jo1irqs9i+DsvLMdsb/bMoWP4uTEgE5sm3w0bMAKM9OfUaCwJ11cVBJbP0YzTiMixWQi0argfvZAvKClMkqlvl2jEA3TB2C+nw1BIyelFudFFA32obuHOrZTPLSZFuWxotQC2r/oJgJ+vNtxMgiAi9y1ffBa5Vy46MCIi23ZUA9kEqv2tRtpxDbRr6haofjUEoXCKplK5I7UHeMJuDmjZRizWDJJbL5IzHbXGCym8qnZ46VerYEkmAtI4lHjfaHONhAidgpCyRvtpSRmBAtvT9t2bTvyPA==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	IyuMP5ug0ghZn1kg6vdXgM/suBqSxKVGJjGDdNmWMZ1m3og1VlFXZhbc6o0Cx1SHkTd0ekviU5wvL9zIg0Tnmw+nnVXGC3YZpzo9ZQeDq8YStWhRHRXqpm75zq9oSwEEiJX7D5ExAyJX6ii5Q3cJIBWC0J0IJH8D38NNIQCilmAYSgTTTFszKFQh+IwPhc9XCOHjq8ypuQfNreeOxKObepQ1J1ElJTH5NlA6gJ1NcbGVycMcnWuFgwVWQF0S3hGK5tIQtW3Mqrf+6ExkyKROfLfwGLFOXCmuB0RYKFPHOTJZDXfMnLwaIrbHmnE0qMABYKwFPn/xOYfBDXxDq5syG9N/lMIAsmoU4RCvfrcSizm+TSKMbc12370ltW9+oIWY6xdn8iwetpNtxzridN2ZaXqjYGKWA+js2EcxNVFfM6aq4QOrhoa+Amra4niQXwvK
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 15:52:30.0824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf18164f-f641-4166-e734-08df0453336c
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR06MB9983
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 19:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244505

From: Roman Nazarenko <roman.nazarenko@leica-geosystems.com>

do_package and do_populate_sysroot are siblings - both are only ordered
"after do_install" - so they run concurrently. With
LICENSE_CREATE_PACKAGE=3D1, perform_packagecopy:prepend wrote the
LIC_FILES_CHKSUM texts straight into ${D}${datadir}/licenses/${PN}/,
mutating the very tree do_populate_sysroot stages with find|cpio:

  | DEBUG: Executing shell function sysroot_stage_all
  | cpio: ./licenses/libmodule/LICENSE: Cannot stat: No such file or direct=
ory
  | WARNING: exit code 2 from a shell command.

copy_license_files() removes and re-links an already existing
destination, so a file can be listed by find and gone by the time cpio
stats it.

Write into ${PKGD} from a perform_packagecopy:append instead. By then
${D} is complete and untouched, and ${PKGD} is a private copy that
do_populate_sysroot never reads. Package contents, on-target paths and
ownership are unchanged - do_package is a fakeroot task, so the
os.chown() in copy_license_files() still applies. As a side effect the
license texts stop being staged into every target recipe's sysroot,
which they had no business being in.

This changes perform_packagecopy, so do_package basehashes change for
every recipe; expect a one-time repackage.

Signed-off-by: Roman Nazarenko <roman.nazarenko@leica-geosystems.com>
---
 meta/classes-global/license.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/lice=
nse.bbclass
index 86c9ee5878..1d266dd25d 100644
--- a/meta/classes-global/license.bbclass
+++ b/meta/classes-global/license.bbclass
@@ -38,14 +38,15 @@ python do_populate_lic() {
     oe.qa.exit_if_errors(d)
 }
=20
-# it would be better to copy them in do_install:append, but find_license_f=
iles is python
-python perform_packagecopy:prepend () {
+# Write into PKGD, not D: do_populate_sysroot stages D concurrently and ra=
ces
+# with the remove-then-relink in copy_license_files().
+python perform_packagecopy:append () {
     enabled =3D oe.data.typed_value('LICENSE_CREATE_PACKAGE', d)
     if d.getVar('CLASSOVERRIDE') =3D=3D 'class-target' and enabled:
         lic_files_paths =3D find_license_files(d)
=20
-        # LICENSE_FILES_DIRECTORY starts with '/' so os.path.join cannot b=
e used to join D and LICENSE_FILES_DIRECTORY
-        destdir =3D d.getVar('D') + os.path.join(d.getVar('LICENSE_FILES_D=
IRECTORY'), d.getVar('PN'))
+        # LICENSE_FILES_DIRECTORY starts with '/' so os.path.join cannot b=
e used to join PKGD and LICENSE_FILES_DIRECTORY
+        destdir =3D d.getVar('PKGD') + os.path.join(d.getVar('LICENSE_FILE=
S_DIRECTORY'), d.getVar('PN'))
         copy_license_files(lic_files_paths, destdir)
         add_package_and_files(d)
 }
--=20
2.43.0


