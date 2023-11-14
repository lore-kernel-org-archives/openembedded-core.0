Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD52C54E7F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 20:36:24 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (NAM02-DM3-obe.outbound.protection.outlook.com [40.107.95.87])
 by mx.groups.io with SMTP id smtpd.web11.3920.1699994177452613791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 12:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@infinera.com header.s=selector1 header.b=mnFf5Wwy;
 spf=pass (domain: infinera.com, ip: 40.107.95.87, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiNa5C+aVVbmRIteZ10jaO75wsa7FIVn73DipVqYqupN4tagz5km3gO4BVnyOHAsevCVM9EpyDpVS3tcKp8ChFlUjc49VWbIWpxQp3bms38UCt4IvNuUwwR5W3DGNKTuYTmXDhaHCvcDCRH7wJN6UoAb8dZph9KFsi5Nmo4BOW/ZNIUtdpYDPQJVteFodRVMnKEE85TwUc2nJchIoL9f2NpULdcZUPTsX94wN+fNPiFdVoSsr08sH3GvuN5IuQSVugc/A8e4CLFK25rJaCrUVhEILwBx3m51iZMXIP8mveJcYXJfUIcVhsIfyjszzjNw2WsQ4pR5GhupAtJFw6d/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0cu8aPddouhVFFnCamRgjJyovGnhgtMQg/Y5yZRAJU=;
 b=VvXfFIpw7EUb6zT+dGVDStcbInuYtHdFFnFrbFOWqWA0ROA/TdpFk8qPsKDwhFCHdMCzccPxovNZkgKJ0KWH3dIC54pzgFzKMytL+mfZPdHSLA2RWpY6wqZxvA0CVQz92932zWZZzLr4mnUO++zxdYyP9ze/uTUqb28bxyocLOW3kMuzwbvepygZAziHTfjtNiQSN//MLC6KsiWJgVJAGcWwZ0TUgyxmOTNr3rXlBrYXOZvZr/fBYI1vakHt88tEc1bWzrb1MA4nE24HIkzY7LuQoXHmKeg5ab7ga1kof76eFNqmq8jLf7HQ2B82dD+h+XsIKwJmEWN9P1989o2meg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.4.225.30) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=infinera.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=infinera.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0cu8aPddouhVFFnCamRgjJyovGnhgtMQg/Y5yZRAJU=;
 b=mnFf5Wwy9SGOXGa1TVJ0PvAtx3f3XehUzWJxaH781vN7jB0JMTSj47nvKnJMOsFGDPAF/I2OEIozqtu0PfPF0sqMMZ5dPR94fK03yVlT+faeB8LoqHt0CKdJI6vR1WrTLwPjhoq91uRyY/ebHSK8zzgsFCM3WtPJZWh4UZdHRqU06I1fKFaoVqp5ixadwV8uvNKygZ8uT6JFm3RLYWzlOXqT2j8RbsorqstPyWkCl/s3ZtNkKfBhmp0E1darLvmmct7SZBgoZDdPLrpFYmudoltuQ3l/WfjGZ+AzNVlxbLzuCRTg5MqjY1pegUdX7k4+sng2Nq+pq4ps+9vWWUl+Cw==
Received: from BLAPR03CA0133.namprd03.prod.outlook.com (2603:10b6:208:32e::18)
 by BN0PR10MB5383.namprd10.prod.outlook.com (2603:10b6:408:124::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Tue, 14 Nov
 2023 20:36:14 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:32e:cafe::9e) by BLAPR03CA0133.outlook.office365.com
 (2603:10b6:208:32e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Tue, 14 Nov 2023 20:36:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.4.225.30)
 smtp.mailfrom=infinera.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=infinera.com;
Received-SPF: Pass (protection.outlook.com: domain of infinera.com designates
 8.4.225.30 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.4.225.30; helo=owa.infinera.com; pr=C
Received: from owa.infinera.com (8.4.225.30) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.14 via Frontend Transport; Tue, 14 Nov 2023 20:36:14 +0000
Received: from sv-ex16-prd.infinera.com (10.100.96.229) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Tue, 14 Nov 2023 12:36:13 -0800
Received: from sv-smtp-prod3.infinera.com (10.100.98.58) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server id
 15.1.2507.6 via Frontend Transport; Tue, 14 Nov 2023 12:36:13 -0800
Received: from se-metroit-prd1.infinera.com ([10.210.32.58]) by sv-smtp-prod3.infinera.com with Microsoft SMTPSVC(8.5.9600.16384);
	 Tue, 14 Nov 2023 12:36:13 -0800
Received: from gentoo-jocke.infinera.com (gentoo-jocke.infinera.com [10.210.71.73])
	by se-metroit-prd1.infinera.com (Postfix) with ESMTP id D5CFA2C06D83
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 21:36:12 +0100 (CET)
Received: by gentoo-jocke.infinera.com (Postfix, from userid 1001)
	id D4B2F456169E; Tue, 14 Nov 2023 21:36:12 +0100 (CET)
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: <openembedded-core@lists.openembedded.org>
CC: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Subject: [PATCH 3/3] pseudo: Add PW_SUBDIR
Date: Tue, 14 Nov 2023 21:34:52 +0100
Message-ID: <20231114203608.1490318-4-joakim.tjernlund@infinera.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114203608.1490318-1-joakim.tjernlund@infinera.com>
References: <20231114203608.1490318-1-joakim.tjernlund@infinera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 14 Nov 2023 20:36:13.0786 (UTC) FILETIME=[35BB4BA0:01DA173A]
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|BN0PR10MB5383:EE_
X-MS-Office365-Filtering-Correlation-Id: ece186ef-c77b-4b1c-bffe-08dbe55158c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8G8ya0PyNB0LnprbnAGsrSGWJ3WiY1XP9qXub4ZHS0hW2RbSD+KtTG3v1WdH9QRsAkMiV46QkmMj0XwaGz9TENskGEtciJ6CwxomBQuzHLgVuztcekdyMwFoFKt99LmMGpevrhL6o/UM9u3QqztVu0lIOz8fgAjrqQDMpLP/YDo2IRRi+2sHOHyToMewbjhaStTq9NiFeR81p+QuJw3IhCmdJv/M+e/ipa7M1Ex3R8HihE0160eq6MDE8Hvs79Aia8sj475UlKFvalpx+KngXBFaTDhlZ5Qhaa2qAcBcDaIEZhtCGkVIwzbMq//tLsfXs9dpHK9QSHs+BiSjYq6DMBm/gdeAE9bP7iuVGhvLzR9nmMX5hl8OBLl7sPXLqIGtZ7JEjuaGBPwEL40EA3pjU8S9V9em1Mo/C8+EoX2mTOzWnda6Jm6ZG7OxefvIYXInrCX83DzEWwYegDqMDeLh7SCWPoSFX51GUwYAe0OpwnqbWLZVHlr8es0xUXX5tPrfRsR5r9mOAcPrQ/zpxgRx/dqHlBZg+dIB/OujHBfPdz+TCvmiqsfg+0CthAfludmVwfxjOqPoVNYwxhKBmlp51yrh8rmy8eg4OScAZRs+Sp+ftbe3RvWzbRSVm0nCWxnTl5LUld7Et76WSYHwv4Ffh3V/fw0jFBgSd92+RIkI2sk/A02km6INo5XzzqtjWRh7w/MYXt2Pufu599t0H83NCYS1zGubYLhEUQBZqFD0/wzziAGdBKsrrKJa36fO5B+W
X-Forefront-Antispam-Report: 
	CIP:8.4.225.30;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:owa.infinera.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(64100799003)(82310400011)(451199024)(186009)(1800799009)(36840700001)(46966006)(40480700001)(356005)(81166007)(6666004)(83380400001)(36860700001)(47076005)(26005)(1076003)(2616005)(82740400003)(107886003)(336012)(41300700001)(2906002)(5660300002)(86362001)(8936002)(4326008)(8676002)(44832011)(36756003)(42186006)(70586007)(70206006)(6916009)(316002)(426003)(6266002)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 20:36:14.5870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ece186ef-c77b-4b1c-bffe-08dbe55158c6
X-MS-Exchange-CrossTenant-Id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=285643de-5f5b-4b03-a153-0ae2dc8aaf77;Ip=[8.4.225.30];Helo=[owa.infinera.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5383
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 20:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190516

Add support for creating passwd files in a /etc subdir
Set PW_SUBIR to pwdb to get passwd files in /etc/pwdb

Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtool=
s/pseudo/pseudo.inc
index 7e09b6d58c..7ba2e2261c 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -10,6 +10,9 @@ SECTION =3D "base"
 LICENSE =3D "LGPL-2.1-only"
 DEPENDS =3D "sqlite3 attr"
=20
+#Set PW_SUBDIR to pwdb to get passwd files in /etc/pwdb
+PW_SUBDIR ?=3D ""
+
 FILES:${PN} =3D "${prefix}/lib/pseudo/lib*/libpseudo.so ${bindir}/* ${loca=
lstatedir}/pseudo ${prefix}/var/pseudo"
 INSANE_SKIP:${PN} +=3D "libdir"
 INSANE_SKIP:${PN}-dbg +=3D "libdir"
@@ -131,10 +134,12 @@ do_install () {
=20
 do_install:append:class-native () {
 	chrpath ${D}${bindir}/pseudo -r `chrpath ${D}${bindir}/pseudo | cut -d =
=3D -f 2 | sed s/XORIGIN/\\$ORIGIN/`
-	install -d ${D}${sysconfdir}
+	install -d ${D}${sysconfdir}/${PW_SUBDIR}
 	# The fallback files should never be modified
-	install -m 444 ${WORKDIR}/fallback-passwd ${D}${sysconfdir}/passwd
-	install -m 444 ${WORKDIR}/fallback-group ${D}${sysconfdir}/group
+	install -m 444 ${WORKDIR}/fallback-passwd ${D}${sysconfdir}/${PW_SUBDIR}/=
passwd
+        [ -n "${PW_SUBDIR}" ] && ln -fs ${PW_SUBDIR}/passwd ${D}${sysconfd=
ir}/passwd
+	install -m 444 ${WORKDIR}/fallback-group ${D}${sysconfdir}/${PW_SUBDIR}/g=
roup
+        [ -n "${PW_SUBDIR}" ] && ln -fs ${PW_SUBDIR}/group ${D}${sysconfdi=
r}/group
=20
 	# Two native/nativesdk entries below are the same
 	# If necessary install for the alternative machine arch.  This is only
--=20
2.41.0


