Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F5BC61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 14:27:55 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37229.1787840472051536929
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 07:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=UIAAP7dn;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.70.68, mailfrom: roman.nazarenko@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6rRU0A8hS2h0NdB7wtzyF2RvfbTq54xEHgN13FaItadGpwOuHE8cGO9oT3IjldnkX6QOYle4DOEEHWROxy04df79kcEsOYJTZb1mXIoegYH+1ByGW9rbAmkRl90Qx5UxGdRvJ6xl/Ti1lOBJIPtZKj5DwZIogLXyQ4CGZjy0dVBuSqQQFUgtJ12qUZaXV/smCXRQZV26x2YMnRJKl2Znl5FsWAu3H5bnh93RvyHSmlX3+52v9kMfMli0s8yPN9z5aAiSOCURaAjv7RakiUNs3C5/m0p/IdZqelAURbDcnQTkLteYVdoeIuybzApCFkaejytNo+n3twqOYvkTK6z3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FL6BkUgQkniXEA4GwSTJVouYIBxvKGQZnZVpBxNbQ7M=;
 b=kVdmgHGlvk2JqpshcY4Mmkcqgh9iFMCH0s4eHAlK9LIq3MkJp1SwNnG3rYjxt36rKcruumXh2pGHHoP7GSHIVM7C4vyerEBWCIax2XteikS76nWLNQw5flHloSPsf2eEiJpT7sJeg5WldfSLklZoboMZ7Vq18BJBO+cQPp/kDjlB7x+3Nk5dyLL6kF4oe/F0yNARWQuPLqQiwWRvXG5X9ZYwNYEAYY5bRmbT5Kn8HVFs1ObHpbfZlr4eTLxrzrfzoL9ThgRd75Pfjmknirb+/2LNPNd3+H6lROYn9CFnrJs5jrZkfDA2LjmP+JSU2vB2uPsQJTPmUE3ZHlD/9LMf2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FL6BkUgQkniXEA4GwSTJVouYIBxvKGQZnZVpBxNbQ7M=;
 b=UIAAP7dn2rwxiAveL826P+EazlOx0+o1tRIfGs1wJf79WBasx08CklK8l0U3j7f2zIS/OVTguU6m4ZlDDoNfL7iX9McuANRg+jxPIyRvv3/krzw0j+oaXcW4dY6Zs6L7HPs6XBatWWLMf5wjrM5tey2AMjfPHyaMJfhFaewolCg=
Received: from DUZPR01CA0211.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::24) by AM7PR06MB6487.eurprd06.prod.outlook.com
 (2603:10a6:20b:111::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 14:05:48 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:4b4:cafe::9c) by DUZPR01CA0211.outlook.office365.com
 (2603:10a6:10:4b4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Thu,
 27 Aug 2026 14:05:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 27 Aug 2026 14:05:48 +0000
Received: from GEO-L5CG4163Q2B.lgs-net.com ([10.67.144.98]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 27 Aug 2026 16:05:47 +0200
From: roman.nazarenko@leica-geosystems.com
To: openembedded-core@lists.openembedded.org
CC: Roman Nazarenko <roman.nazarenko@leica-geosystems.com>
Subject: [scarthgap][PATCH] classes-global/license: create -lic package from PKGD, not D
Date: Thu, 27 Aug 2026 16:05:42 +0200
Message-ID: <20260827140542.669897-1-roman.nazarenko@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-OriginalArrivalTime: 27 Aug 2026 14:05:47.0863 (UTC) FILETIME=[28E6DE70:01DD362D]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E2:EE_|AM7PR06MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: d5ac9aff-9562-4fd7-17ef-08df04444b9c
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|376014|36860700016|1800799024|18002099003|11063799006|56012099006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: 
	KUJ3Y1Sc2zIsiU7RfeGBX6aspGDEzDldepll3mfWYfviA0gron5jTjXIGkBXPqSmAMKyvy2sgE2n1i+KlPxhvGYhdGc5+Aiqt3eqxBO8z0TRytYi7BVBmp3i6aAu4qYCX3SnodQ+yHnkCcHZ38xdpm4eT9PO/1TgYbcB7eBRIh5ZLjHhaa5sPwvOIw4e2HkH0zS4df1NHbLofWrB4CfqkGuOs0J6r8jVysm3njKt5S2bfbm1Y6VLN+n/SJlmo9JBAefC4aJvn38DMpZ4US83AmZr5/I3OGRG7Vm/DdCfNo2Ll1VDNzjafV5PGwIHzpX5brX1tLNNCjBz7+48a7l0fCT7AxLdBPBkKUToYQT2i82DHdqEdVDIhgZEdNtkFdpcdNN2urr4wfaePjiY4XlxCV9hskzvqfe2tGyttiiPVyMuZtLNuw/mtT6P6yhNq/tVL+DYHfbCdCZQBVxOKVYypGFugld0pBg9LEqSp4F8Kil6q0m4HmJYlHsKrECyUbIu4Zx5T/LznUGR0kHf0cZZ01BTlHC0SgePn2MIJtBBeC4vews2SjoM4wGh4TCl0022GUDiPw/nhJyXeq76cdZOY7sM51iZtN1vUDPrwFwsvdepnKyjbFOOQt8wWZyhXktmfGXRsC0cvawYpzwIoHkmSBdnDXlg0/J8blsn7l8bVpTl/ibfV8N/RwpZ7vK+WkCaZCeO4Y1Q404FdiPDZpYcpg==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(11063799006)(56012099006)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	96TC3DktveSwk8ICFtHU6OFbQIS6Fm9V3UVrNcIKaAihBWRR1YdzB6xprfvTWeoSHF1VquJxbgqt/HEm1JILBrg9Jp8QNZnYH+X+D3UJmymWbOwUDRcZWqtcYWoYZbwBqLgqqlWWBqGDEVABY/gujXwa7DeEvf7rBP0CTcpEob8en09hryis3toKmmU6Dis9TPjuBEnmOa2672lrFEVBtsSC2y4iJ1koc+xUfoPVPErR6F1B/zmJmKdRYTIWtcLBDEuG/oOvksQ6FbpcDrv19H0h1mvx+pyZBLNG0mD5eIaEtn3BjBfyzUXPmTfyJDgIek/a2DTAtrGpdJN1iVPaYLr+gWHlmxXUtm4e+nnBkh7RntLX77Ydt6VKP+uGjj7CXutcrQ6KPytsH/fmGRPf1eC2sXBnX47gZPKWAVbqV2+QqKek1gOCLSPIi27Dh8kf
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 14:05:48.2055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ac9aff-9562-4fd7-17ef-08df04444b9c
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR06MB6487
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 14:27:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244495

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

The stale comment about do_install:append goes away with the change,
taking the find_license_filesa typo with it.

This changes perform_packagecopy, so do_package basehashes change for
every recipe; expect a one-time repackage.

Signed-off-by: Roman Nazarenko <roman.nazarenko@leica-geosystems.com>
---
 meta/classes-global/license.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/lice=
nse.bbclass
index 6e0de5f414..f2d83c227c 100644
--- a/meta/classes-global/license.bbclass
+++ b/meta/classes-global/license.bbclass
@@ -45,14 +45,15 @@ python do_populate_lic() {
 }
=20
 PSEUDO_IGNORE_PATHS .=3D ",${@','.join(((d.getVar('COMMON_LICENSE_DIR') or=
 '') + ' ' + (d.getVar('LICENSE_PATH') or '') + ' ' + d.getVar('COREBASE') =
+ '/meta/COPYING').split())}"
-# it would be better to copy them in do_install:append, but find_license_f=
ilesa is python
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


