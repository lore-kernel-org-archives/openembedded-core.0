Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B4EBCD6E42
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 12:44:45 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36129.1779799475083263745
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 05:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=XrFiaWov;
 spf=pass (domain: axis.com, ip: 40.107.162.40, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dT7kFtKMMdpKaJp3nbQ3HUgWBO+kO6b+zv22cbcyNEaZ664FFGovI2PnAPKuxBmzTTyszK8V/VmJrsQNOGJ1pMWjUsblHhNflOWfh1PvQlKS5Asbhi9bRvwigeKKbejLvJcvtoaZUAlo6g81CMVR1yfv1oYiuS0TBz5QFQ9bNKBS7nHcTAHNjOhfQ15W9mGoN84/p78s3OeZIr1CIyCZfmh2is7UcYWKdkqPNQY0T9bYQcFRyMNjPYrXCKeE4YBux3tPfqd84K2uYeS0n3AgUFNd4IC+9OVw6ViZtGRQn+h1SF7A+ANGhfp3kK4hyH7cSvuq27hN+nsdV4s7vTrGoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lw5q1CGh1JC5puG2Q27JoDM5Xizzun/S4Rugj0AgLZU=;
 b=Bx1O0KK/j+GcJoUXFLxPziF50Wgsp4f/Xi+7OG6R/6JrPvWTPPmAsIKaC0iIaS0AN4ywF4x9js1RpBb9dDae5RuHUHKPKEQX7CPSLVCuLk/3/4CxbjJtKmanHqKgnCt87tjxZTrSa0tZPCfJ09MCshLLJ6xPu78mdFe67X7JPhYsed7+R6Jcn/XUHkk7ggVCHQO8nAIzl8rWP6850W0VwbYkIlNZ4VhEsfkn+kt+/j/i3uvNPAUHpKxa2ges8NGoYTK4T++gUxXYWX2IvLFz/6miAKkumsGEc3VxVAGnwhAOfU7SphzDd1edE1e+fKFX3Mom+/y6GgpMPEv7b8ue1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lw5q1CGh1JC5puG2Q27JoDM5Xizzun/S4Rugj0AgLZU=;
 b=XrFiaWov1GNrQ0QojMPgom0HNd4veK1qbXTrdrK/Nj4cXP9UsgLUGOKdk+NdLvb6IGZfw8DX6U7+ejcZZV7kDUakVDDtzqfBUB38YOuGpv/r6tIMYoy/GhFQqlGrJMvpgb5Z4SHsYgp8adA58DI8r0ROx1bgYlvLfIhOv0VMJ6Q=
Received: from DUZPR01CA0141.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::28) by AM9PR02MB7091.eurprd02.prod.outlook.com
 (2603:10a6:20b:271::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 12:44:31 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::97) by DUZPR01CA0141.outlook.office365.com
 (2603:10a6:10:4bd::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Tue, 26
 May 2026 12:44:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 12:44:30 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 26 May
 2026 14:44:30 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 26 May 2026 14:44:30 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 932973784
	for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 14:44:30 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 908DF122A1F; Tue, 26 May 2026 14:44:30 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 3/6] package.bbclass: Add USERMOD_PARAM to PACKAGEVARS
Date: Tue, 26 May 2026 14:44:17 +0200
Message-ID: <20260526124420.2564500-3-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526124420.2564500-1-pkj@axis.com>
References: <20260526124420.2564500-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F9:EE_|AM9PR02MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8d50d8-af3d-4454-9fe3-08debb248821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	9xKjTKfBiH73IG9v8WrGChUUzqsakPcMcAjxNmCqsgtw0nn/q1M7zDLy8cqrxB0SnOdZ2HHdiLv4CNic8JcmPJfckdjfFt1vrXzVSKJuBS2r/ZUBAW7GYOiyT0kogJk8UJUs3bEOsciStPJKE7l7klqXdvfk1JZ0uP690RfmrKdhouoLnu76Y1WriyZwinal6/fqiIlML64ALpwXAvepYkk95E4Jg/c+40IPfLig/r0rBRkoYklTtpp5p9WqLrvRUMud61fEhtUqZAMAA98J1yrYbDGMyabvy37BnDClHLyyavFUf7lnULOi1/3JgzSYsYZDN5ZyhMq5VJtMk+PuwYgQfd7sMBTg40mnDd3MKydt3uZ/9Dw/FCtiegxpIfZmbmreqbhKTti7bjxDUhARF73IjdpYsdmeBEXE/MWY2CjU6+92PnQO9dNdktzb2HyGRCu5sLGnBf0rab0EpoOaYQpSMHKf56sLt6deqnaD/p+NnGmnnQyMfGiKwQmFRolIzV1YuzM3n/POgTeZyxY3hw6Puix/RqBzApjJvqFKbzBtpvDIuUghu+mZy0P4T1z5Oy45N0wtOKdBNj8t9efUyWOzlCXQkqT9reNzT02ijjv0wcSQAJ4yIayiIf/NZGpV08Qpw4EQd8hmt3Nw3tef5If2mhk585/9ca8RfvRss1QbA2PpSk42oV/cInAth5KWUZ9V0zRTg+A4kIC6LNfXzMoxOsQiQvfgxsqfuTs3cxY=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/FUonujObMiUm2N/IUlxpFMSWOBdE5HPGeZnxy6Jg8z++O2wDXVOhREdPsQa3E4/c6sBVCV8MiDdT1IHaGta8paMmzMbeCf0AQZ7R3ZnP1s1wnQo48+uIIAN5uMI5o8473xsWQprdqsUa2vQuCRRFon6pRPN8ZkKRlINKYx79PASyi8rquMT9UDHZa0j1TqzR+XILUQae61AKtPIf6dtl+xJO0mSJ0jAM/OE1jxIcNGYLyrcibrKnnrqbMW+CgnfKMhmd/9QcE08vqOPPu+XOtkxt/VTzMmBgOZBVD+BO3jbcAb2U217Z7duvx0esJrvjBEx+wJKfO7uu/+cGSkyCCGNGiERwlXywcRNOMImc3z0sji4KJjvjp+FHCSbXWjgecWsOdISnQMXCSeB0/fgTE/3ta4Cd23HAyf8ETPIGM+jGUCqsB3mpCMV9EMOViA/
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 12:44:30.9831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8d50d8-af3d-4454-9fe3-08debb248821
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB7091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 12:44:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237602

This complements the USERADD_PARAM and GROUPADD_PARAM variables.

[YOCTO#16277]

Co-authored-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

 meta/classes-global/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass
index 67148fc1ac..30accaeaa9 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -438,7 +438,7 @@ python package_depchains() {
=20
 # Since bitbake can't determine which variables are accessed during packag=
e
 # iteration, we need to list them here:
-PACKAGEVARS =3D "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS =
RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm pkg_postinst_o=
ntarget INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME ALTERNATIVE PKG=
E PKGV PKGR USERADD_PARAM GROUPADD_PARAM CONFFILES SYSTEMD_SERVICE LICENSE =
SECTION pkg_preinst pkg_prerm RREPLACES GROUPMEMS_PARAM SYSTEMD_AUTO_ENABLE=
 SKIP_FILEDEPS PRIVATE_LIBS PACKAGE_ADD_METADATA"
+PACKAGEVARS =3D "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS =
RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm pkg_postinst_o=
ntarget INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME ALTERNATIVE PKG=
E PKGV PKGR USERADD_PARAM GROUPADD_PARAM USERMOD_PARAM CONFFILES SYSTEMD_SE=
RVICE LICENSE SECTION pkg_preinst pkg_prerm RREPLACES GROUPMEMS_PARAM SYSTE=
MD_AUTO_ENABLE SKIP_FILEDEPS PRIVATE_LIBS PACKAGE_ADD_METADATA"
=20
 def gen_packagevar(d, pkgvars=3D"PACKAGEVARS"):
     ret =3D []

