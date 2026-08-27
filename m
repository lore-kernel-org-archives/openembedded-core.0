Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D87CC61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 19:29:34 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.243.1787845896406451352
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 08:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=mhwgMpAD;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.72.60, mailfrom: roman.nazarenko@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLmIWysaOjlHJ6SkUG7QXCP4wAG5Vpuc5A7/PgaIgqgojEoxpIulot+cya/jq6X/gMZ6OBA+9q5G/IN6x3clJcePL9zYPfj3HBfeT31PAV9gy4jSjqXM9pexNTFYWRxakpmnwyMsno28DNxn5/e8/ScDiLikRbvz1P20VMFnPsqYMzWn9Q6ScLoeTXyVhdB3U2AhbCo2Bv+GUFext3e9mka0G/1NiFomPZ3XFNwSxOKN2gAmOFLZiLGIK3IhTPYetMPhdjOuwaHcno9dDy+nlS/hCyjUMhofOTvkntqE/muno+HKZ3GO9nThWNnipx1zsEwiRtrYRmvZuduzDfDa6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2lROvqG3FohjbyAbw2JkemnC/fUpTqMO1wP5tv3I6g=;
 b=PhMtHun7SHHE+nyzwkBM3eCiwArYDmm8RwJLN8cUAuu6HfeVlkzVCY++wfRaI4Jfrgq5czJdRra1SVfdYbkq4kMUc9plZ5TvdI096aROL7Z1OEsOVpdnz3mLgEkwybRh6YHuqS6VWUI/a4fL1CgRuiZvn6H4pKpfUPocvhIp+1CCnR9GjetJFrN2PTJS5YgaTeTbR5E4kg1Z4/6EMAA6bR9ZZ5I9dIbvrLwOYcIjYB5cm7niGnpr1bWc/8QVCjSYoTPQFay4We/2J/0RcERVTm0Xv0OozDIQ40MJoo9k7ytEoa8Yfh38A33dUKYzW/FP2/aI207TBGpBPmmKcvbwoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2lROvqG3FohjbyAbw2JkemnC/fUpTqMO1wP5tv3I6g=;
 b=mhwgMpADSAOXHSs8fOBuBMT51VL18MA024NsVFcKlk9YnSwbr15Sla4tGcAbH8cghyDZ5vALoijWANieqqQaxGCCTIoTrnRXddL4AdPFzYasttAJ/Uxtoj8MynpY5fA6KvGP3tX6jZbBfXbGskl4lSqWMVv27BPhUVv4MXN7qNI=
Received: from DU2PR04CA0012.eurprd04.prod.outlook.com (2603:10a6:10:3b::17)
 by AM9PR06MB8297.eurprd06.prod.outlook.com (2603:10a6:20b:434::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 15:51:31 +0000
Received: from DU2PEPF00028CFE.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::1) by DU2PR04CA0012.outlook.office365.com
 (2603:10a6:10:3b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Thu,
 27 Aug 2026 15:51:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DU2PEPF00028CFE.mail.protection.outlook.com (10.167.242.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 27 Aug 2026 15:51:30 +0000
Received: from GEO-L5CG4163Q2B.lgs-net.com ([10.67.144.98]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 27 Aug 2026 17:51:30 +0200
From: roman.nazarenko@leica-geosystems.com
To: openembedded-core@lists.openembedded.org
CC: Roman Nazarenko <roman.nazarenko@leica-geosystems.com>
Subject: [wrynose][PATCH] classes-global/license: create -lic package from PKGD, not D
Date: Thu, 27 Aug 2026 17:51:13 +0200
Message-ID: <20260827155113.811046-1-roman.nazarenko@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-OriginalArrivalTime: 27 Aug 2026 15:51:30.0395 (UTC) FILETIME=[ED5872B0:01DD363B]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFE:EE_|AM9PR06MB8297:EE_
X-MS-Office365-Filtering-Correlation-Id: d19bfef1-a20e-4573-73b4-08df04531003
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|3023799007|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	DF5/Opdh/UDFZJCct7D/iZmhiK8Wqa6UIccUu0dtxBbkDTmMCD647hJR2jJFBLn2C+0mOM3hjpafZa93A/ufN5Lz3I4UBUOancYrabwZ/9GP7DupWMOHomda9213gkOZIcIcpWq4DJvlkYNbmtlpr4vRk0UzbG7luhttjZjWtmm3oInhCcWzmotgPWExy4FxHU2O38yMJcReOvWS3ywg5NaKl3ItgqQy2Xj6W/gCmgnR9FHMp/M0WPY2J8zhXwLv6Lc+NfUCyWbJoRQq2bY4cDHe7jsf40WlDUtxulu8Kl0++82SoBqcc38hEJcOtduOsHTl7dkSaUYrtMFsviaYbE2+sIILDcZc/+y6ZuzFOoxG0F834e0QlxzJYtUbG2azPTFc5uAhou1co2J8Lxrc4S5uLOcoRq2Hr0fOZYj+5YPC0T/VK/oNVAvZrOj0GzdD+cs76pw55wF2DDXGXP4S+XzhSfJ0bzuETmbRMED6hugLrdNb3BnvEcKClXhwk1PlBdOfxNZgMkgk/QGF4Kllpr8DzdsEL6SCA8wD9PfvewB2nqO4ylDIqjosyRsLLQYJF0+Cr0rPs2ApB+lOMzA+DzvAkLsk3cz5Nh4MnjLg+u8sl/z87OGFTrq/M+uhlXFVmM3NdmDFRpUYFTnu+nyNgUebfMUQZ/ZJT8NW4kLNl7sZC1VUms6903bfD6r/EpX5
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ZMCMpAFJeU4idFyF/owEVn1r0KRGFHoFPpJ7ZZKS1/SNYJ2xwwSSb5zfh8c30+X4U+/rM4IAu0FUy6KOYhMaOmXXPbOxyVJJ/TPO7+0X1FoZtKcvSPZAdKa6GNpsA9kLlqDZzuZQW8yy0pqKgc9GR6OYvNyX1+HzZna1keXBginBKb1UVCVgFOXN9bSfUy/nSg454aNILeOewj2kWNYT/q3I4EXQmhSqimQU5IfWPG5PbnNkOIAl1MOvF1GGQS9YL1ZU92kBige35yvW+6EnTItll5B5J6IS17t9p8qTqgyJ0kq/kXuqrLPweOWxlzcsIsfGQlywZPI8U52RT07efmtddc277/vsA3mccN97BIOIjkUGzAI8IfojtRgDNgY13ckpHRXs32Uufe5urHfJBt14NoA/D3s0RkSQe4DXhvN5B7+NpLArgschG7xQrQsx
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 15:51:30.6711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d19bfef1-a20e-4573-73b4-08df04531003
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB8297
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 19:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244504

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
index 2d4ad6df26..cb150ae0c2 100644
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


