Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE1AC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 09:39:22 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.119])
 by mx.groups.io with SMTP id smtpd.web11.4631.1658828358047622440
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 02:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@leica-geosystems.com
 header.s=selector1 header.b=oLf4/U22;
 spf=permerror,
 err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}:
 invalid domain name (domain: leica-geosystems.com, ip: 40.107.1.119,
 mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYVxRVywEkdjpOGbimEJ0EB8NGuaefcwPGWw719R1sOh+W+C7tPYog0c1SfihIw2gGN06i/8iMx679OCjzHoYEROxRmI4XIRLENqKPrwpJoecrPQEo9ghmrbrfoGE9Gff+0WdMMdLb+sSvrvRUN8xk9M1fG0K5cSdIDcRwXkaAl7bM3t4fonBdGCXokF61SfF3n2X65Y6WKEo/01Wewk/97g/grluKEiB00yBCmFeGWp+W2fJDCOkk+eIQpuAPerL/k8IILfQWqB8lVTtHtn4cc36MzrxAWcKOMaH9a2Mco16c1qTUz5FLCZDFOaUDsRe5Yny6fEO9gdli1P0Rbi1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUqdXdxupiM+/t8jGr3dnP7BO17SzWlty+aPqyVIOco=;
 b=kcsVlXVR9JK/oOmtvU90fcptTQbH24DAb5LjCdfJxaPwcWxO4ggOSLXZN0xLxEETGNiEnwmwAyUWPKNawUChbEz1imdq2eRdTPg2ZF/gZNiNGijjda+co8BH1SkMweCCIbRKkGhv9opgoXt/L0YDul/MgwasvEwlyHHjUqy+qa+ICX1UgyXuVTs39nvAk2VEuiOGuP02a5hidExHM8pzCINYqG/om4vIuVqt7y2G2iB9FJGHWXwq5rE0S6Ixl4+nLIIexqQ8ddv9amOyQIzFUcwE2AH0+3Y5PuftmLefGmZjjXjkEruw75NO8Ek6uhtNdcr+WoLQJ6JQfDUTU/kofw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=quarantine sp=quarantine
 pct=100) action=none header.from=leica-geosystems.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUqdXdxupiM+/t8jGr3dnP7BO17SzWlty+aPqyVIOco=;
 b=oLf4/U22C5N8YJcQ3x72rV8oj7w3qIeFnC3PiEvCBvkfhVoEpBQinr6PQG4SbjEJoyXyN4W8Mm+TGuZFFPNP1/SN2s+NG+QMkeDrz8DvNAMEE1tJ+79SEZdhKSQU+fAAy0AAYlzZk1jwSZFNc3LggylAKRr7cewxioXTDj9vJo8=
Received: from SV0P279CA0032.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:12::19)
 by AM6PR06MB5666.eurprd06.prod.outlook.com (2603:10a6:20b:34::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Tue, 26 Jul
 2022 09:39:13 +0000
Received: from HE1EUR02FT050.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:f10:12:cafe::7d) by SV0P279CA0032.outlook.office365.com
 (2603:10a6:f10:12::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.7 via Frontend
 Transport; Tue, 26 Jul 2022 09:39:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=aherlnxbspsrv01.lgs-net.com; pr=C
Received: from aherlnxbspsrv01.lgs-net.com (193.8.40.94) by
 HE1EUR02FT050.mail.protection.outlook.com (10.152.11.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Tue, 26 Jul 2022 09:39:12 +0000
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH v2] classes: rootfs-postcommands: autologin root on
 serial-getty
Date: Tue, 26 Jul 2022 11:39:06 +0200
Message-ID: <20220726093906.619035-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8c0281ff-af93-472a-ae5b-08da6eeab2df
X-MS-TrafficTypeDiagnostic: AM6PR06MB5666:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ms6B9sKarQy8UNJuRwgpr4tihzOt9B+RCb7ZN2rpct/64MKk+K5Fvf+avXxZwm0TD94giQiY8fyyVXwtlNjj4munEbCRJgwd1qArQUIgfhhFRIW/vm765Mz9goEoBA+t1sQwxXmB92VKi+xzSyyqRel7FIWtakvzQXQpehjcCvcpY5tGDGjtgyTxVf+OF4Dv/SEX8dJAMfIvZNpu6InKBJZkaZV/7TAEKH5KnA2XqenZ7k2JRS11oNfezodeynVcBpQDybSGlXWupYX9Cbqnf2b+cwgq2BDLSeX5vg81Rb09E7ZpkfMtfil6PFZO8xdaHF++ne0IQcyuiYJBPgt1I0CX7a5P5lD/khLqtvY2JfSFhjQc2eZLzweVDZ3SUHEGx39hU0t23qxceoFnt7e2ysAE5w8QRIB75rPt4/FMPBoxThmuVSEghEh+T91dABbTM8Qz4D5A+WMH9QTeLviumJGHO6sGZ/mf5ChOUrzng0mGAIMvcVP6epNoJTKTq8bfVtJWFDBvOs98o2H93ROo0INRgCDWv/fnR77XyZjGu28+2rZYmOoBcuKLUy0Ui3pyKAf6L0aeBzOJfLyeYHRQRR6kErlHab+sRpCO/znvqUEHUbkJ8f5xOzdoMxs+LZDPW1AF/UFEIVG5nV+NYWKFWnytEjFTRFD9kapGj7XGevt8k8f6ZN4AHlWT2TfjBEaxSKn2i4ntXAZi5qhSzulI21KGLCtDcCGYXqJoaKeTjXKePc7PSw6Oui7nuot2CWElScVqtvUiWPvRZR5c48/eCYGJUpi3Q3WuuoEHdCU9vmJPe37RaywUT0klFLJYQNBx
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:aherlnxbspsrv01.lgs-net.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(346002)(376002)(36840700001)(40470700004)(46966006)(6486002)(478600001)(356005)(36756003)(6666004)(956004)(6916009)(41300700001)(86362001)(6506007)(1076003)(316002)(186003)(36736006)(2616005)(26005)(336012)(6512007)(82740400003)(107886003)(47076005)(83380400001)(2906002)(8676002)(9316004)(40460700003)(36860700001)(82310400005)(5660300002)(4326008)(118246002)(8936002)(70206006)(40480700001)(70586007)(44832011)(81166007);DIR:OUT;SFP:1102;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 09:39:12.6409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8c0281ff-af93-472a-ae5b-08da6eeab2df
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[aherlnxbspsrv01.lgs-net.com]
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1EUR02FT050.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR06MB5666
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 09:39:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168502

when empty-root-password AND serial-autologin-root are part of the
IMAGE_FEATURES, save some of the developers time by not having to type
the (then still sole) 'root' username on the serial consoleafter each
and every reboot

this is done by inserting '--autologin root' into the command line of
the responsible 'getty' service

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta/classes/image.bbclass               |  2 +-
 meta/classes/rootfs-postcommands.bbclass | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2139a7e576..fe32cdefd5 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -34,7 +34,7 @@ INHIBIT_DEFAULT_DEPS =3D "1"
 # IMAGE_FEATURES may contain any available package group
 IMAGE_FEATURES ?=3D ""
 IMAGE_FEATURES[type] =3D "list"
-IMAGE_FEATURES[validitems] +=3D "debug-tweaks read-only-rootfs read-only-r=
ootfs-delayed-postinsts stateless-rootfs empty-root-password allow-empty-pa=
ssword allow-root-login post-install-logging overlayfs-etc"
+IMAGE_FEATURES[validitems] +=3D "debug-tweaks read-only-rootfs read-only-r=
ootfs-delayed-postinsts stateless-rootfs empty-root-password allow-empty-pa=
ssword allow-root-login serial-autologin-root post-install-logging overlayf=
s-etc"
=20
 # Generate companion debugfs?
 IMAGE_GEN_DEBUGFS ?=3D "0"
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs=
-postcommands.bbclass
index a8a952f31d..e8e9661f58 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -8,6 +8,9 @@ ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("=
IMAGE_FEATURES", [ 'deb
 # Allow dropbear/openssh to accept root logins if debug-tweaks or allow-ro=
ot-login is enabled
 ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_FEATURES"=
, [ 'debug-tweaks', 'allow-root-login' ], "ssh_allow_root_login; ", "",d)}'
=20
+# Autologin the root user on the serial console, if empty-root-password an=
d serial-autologin-root are active
+ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATURES", [ =
'empty-root-password', 'serial-autologin-root' ], "serial_autologin_root; "=
, "",d)}'
+
 # Enable postinst logging if debug-tweaks or post-install-logging is enabl=
ed
 ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_FEATURES"=
, [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging; ", =
"",d)}'
=20
@@ -196,6 +199,18 @@ ssh_allow_root_login () {
 	fi
 }
=20
+#
+# Autologin the 'root' user on the serial terminal,
+# if empty-root-password is enabled
+#
+serial_autologin_root () {
+	if [ -e ${IMAGE_ROOTFS}${systemd_system_unitdir}/serial-getty@.service ];=
 then
+		sed -i '/^\s*ExecStart\b/ s/getty /&--autologin root /' \
+			"${IMAGE_ROOTFS}${systemd_system_unitdir}/serial-getty@.service"
+	fi
+}
+
+
 python sort_passwd () {
     import rootfspostcommands
     rootfspostcommands.sort_passwd(d.expand('${IMAGE_ROOTFS}${sysconfdir}'=
))
--=20
2.25.1


