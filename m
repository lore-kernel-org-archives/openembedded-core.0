Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCF1CD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 11:41:08 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9546.1778154058939976118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 04:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=JHjNGQNG;
 spf=pass (domain: ti.com, ip: 52.101.48.5, mailfrom: j-sahu@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjBjN2NzMBmZQ6fNfAnAfkcNKJxOhelkjlyndIBWZg7pFQTSdRiGGGBppekM4SP9Fz40hU7uypiSk3EuVHPWiKToY8K5F2QNiDsf+a5o9vUSPCK4+bxoyfFoyD9Vz9ob6SR0ihtRoultghMOjbTXaoKCykkbVf8kKC3j/Fsz8urNFDqgIzebxMdbJ3kZWHUnVcaVaG2QilN7nW5TZy/z5Y2AuEUMKxe/OoU4VGCAmyHrq2g7T5cgJPhnJXIAnszXfxQQD9ykZ3T1JZslko8tUyJZAb5Qi0faJwWLvukhz+R+b39hgRq78t1KBJQfKmyhkVV5+LqQJg0nasiKIlZ4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGzVfN1QUOqU2XCE8XgG8UojnmBSmFQLsHuMz9vgaEo=;
 b=IFakuY9bBJGcHZPD6LD3/xD1wncIT90ouUOEWHyz06DC0jotCv2/fzy2jpRQgxHzkXgqT+dzKa3unKlKrldt8LhdM1nnRC2rXvb4j54kOA9fdee3Yq6ggyd3I2CGA4R1Nf7ZvH00ZkauIE5HuGJYSA8bmoq4ry0W0CT3eZGgXiFBSSPXSvDdnfF9wON8P0s0SohUEcq2IrDEzuQLJaG2RIs0WylqPWJXLNzAGNCEYI/2jHK0hKbWysvAFMBy/0+zidemORJ6RoYd5V2e7oINvqC9ecYhYf71DGbO8Z+z0qvVsLTrcOy8O4af820pVjsmxtSc+VPjyJgVmlFz4FNJyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGzVfN1QUOqU2XCE8XgG8UojnmBSmFQLsHuMz9vgaEo=;
 b=JHjNGQNGW294abf7N0OOL+7MgddlHPGrdwqul78zJJHwTG11e1ucgcct1mVE2UX4e4Q0trGGOhJKtqfd1T2oGo8hR58+z+iMkvz7Vz4UzJhYd7uVKqZ6yRtjCZn0F/PfL81VwHP1xMM6LVX5wL8wuIbZDB/AbvQON1AARjYUc9Y=
Received: from SA0PR12CA0005.namprd12.prod.outlook.com (2603:10b6:806:6f::10)
 by MW4PR10MB6298.namprd10.prod.outlook.com (2603:10b6:303:1e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 11:40:56 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:806:6f:cafe::34) by SA0PR12CA0005.outlook.office365.com
 (2603:10b6:806:6f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Thu,
 7 May 2026 11:40:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 11:40:56 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 7 May
 2026 06:40:51 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 7 May
 2026 06:40:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 7 May 2026 06:40:51 -0500
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.233.81])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 647Beof33229611
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2026 06:40:50 -0500
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH][master] useradd: use --root for groupmems which lacks --prefix support
Date: Thu, 7 May 2026 17:10:43 +0530
Message-ID: <20260507114043.481583-1-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|MW4PR10MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: c60b326f-836c-464e-843f-08deac2d8080
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	+QkgzOvi73CRGae1MdMc1ogsYwFlrLplT3icn/wQtwLhu6L0KOf1b8cbFhqGpftPDw991dcj04du6rSrdyAc2TfuoJNX13lyHPsq4W5bL+ZMcqyM/kA32pJi2MojvIlhmI63fem6t3Ujk6iriuqy2aLdey3rd1GLnYqxbty+V1PBX6Nb0Ky482pIT1dTLdU/I8+DD4dKUu6UmOwltrTNgQ2joLxVRv5Lw6Jj50uKuG4aP93ifDe/2VakWL2NoTUvZnzp9SWOsvZ1ye9EHPs6sYn7gwspSfcSoI+UvkXwaigszwt0cCYefI+b4C9BFtuRiyRpzu12osvL7SQ6yqNUEBFgyxqKs3+MukFIzI2xVPpEjFlRZ7V4hmPtMx3HY5Qt4/gpHU8julllbLYWcy8gJODjV88IpztNvd4+7ey94PkMP+PPWuLHuXOtxCproi1N7YHyZ+zV+bGwBNfIjmmS+braXdMZ39//tP0iI1aIe8LRcG7CR2oQTgshM3uNkJF/VW/Fs8AH+P1x0m/XtaiXHF/9xnHUnoLz7ZJ00dxI/8z+L5OYpcqBKWsjNsluoC04KeADBFLbovfScvWMyjF1CDDZ6HhMagwhRwg9V3yDzzWE0I8tZNBGU4jfYVy+qxStutM6AINpfhEVln09LoChXP0ChooaES/fbBReOoblPesrHk0WKZDNR+D6NjWM9TpE7TlNyZ6r9DDi08X7pUI/qnbnvqUgp/+1d7ZxbIpz2Xc=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Z5/nuFBnch3V828hCcuTiBAz2UGz8QUPIUWmthnjpnjOyziIcv/NNxoYykTAGel8kuXkXZJpERQudRAcMXMPmIlgFiaaf+KR9d3i2Okc19bZ4GCEsPjVPn1M3+UxHBr3BpvDhwL7loj4gba8Xen48XKZ4ZHrHKGceCCR+MTY7ZoU6X1+93JbY7QX5Jr7hDpju3e3QQS8SuSyDebvF+6y1BOiX9Gc2pnudty+kOY1d/MnIWbqJfX03n2tlZDQhffWfe/If4fKWhFKZAhnqb7DiDd2J6wnPulpeuMGC50yW8eZxkuEn+Dx+J4pFddsZaYHYx88dGFWoc0NPrls4S15aRKa1mt5bC/KxfLVC7Mi66HxZUW/cq9zNaXgCQmn1vJLVXN6dxr5Xl/nkXJd81oHdI0tU8ZdSWJwWk6VBQEwFJFw0l60SqoVKMSWuXEUemQf
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 11:40:56.1882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c60b326f-836c-464e-843f-08deac2d8080
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6298
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 11:41:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236581

groupmems in shadow does not support --prefix (unlike useradd, groupadd,
usermod). Only -R/--root is recognized. Recent commit [0] switched the
global OPT to --prefix, breaking any recipe using GROUPMEMS_PARAM with
"unrecognized option '--prefix'" at do_prepare_recipe_sysroot.

Introduce GROUPMEMS_OPT=3D"--root $D" used exclusively in the groupmems
loop, keeping OPT=3D"--prefix $D" unchanged for all other shadow ops.

[0]: https://git.openembedded.org/openembedded-core/commit/?id=3Da7b846ba7d=
6d63a5e59939d75d9c5fe3e4cbb0e9

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 meta/classes/useradd.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index d7ed6cb931..6738ad12f4 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -22,11 +22,15 @@ PACKAGE_WRITE_DEPS +=3D "shadow-native"
 useradd_preinst () {
 OPT=3D""
 SYSROOT=3D""
+GROUPMEMS_OPT=3D""
=20
 if test "x$D" !=3D "x"; then
 	# Installing into a sysroot
 	SYSROOT=3D"$D"
 	OPT=3D"--prefix $D"
+	# groupmems does not support --prefix (unlike useradd/groupadd/usermod),
+	# only -R/--root is recognized. Use --root specifically for groupmems.
+	GROUPMEMS_OPT=3D"--root $D"
=20
 	# Make sure login.defs is there, this is to make debian package backend w=
ork
 	# correctly while doing rootfs.
@@ -92,7 +96,7 @@ if test "x`echo $GROUPMEMS_PARAM | tr -d '[:space:]'`" !=
=3D "x"; then
 	opts=3D`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
 	remaining=3D`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 2- | sed -e 's#[ \t]=
*$##'`
 	while test "x$opts" !=3D "x"; do
-		perform_groupmems "$SYSROOT" "$OPT $opts"
+		perform_groupmems "$SYSROOT" "$GROUPMEMS_OPT $opts"
 		if test "x$opts" =3D "x$remaining"; then
 			break
 		fi
--=20
2.34.1


