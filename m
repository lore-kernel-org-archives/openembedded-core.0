Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48628C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 08:52:12 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.133])
 by mx.groups.io with SMTP id smtpd.web08.4407.1658825516458963039
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 01:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@leica-geosystems.com
 header.s=selector1 header.b=iSnT9/8h;
 spf=permerror,
 err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}:
 invalid domain name (domain: leica-geosystems.com, ip: 40.107.13.133,
 mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmfZ0uI8ngJozWi+IGGoAWl4Nv80Ytv7+vzQakQhv/C2BrI/7ZWJ1ULorvWofadk7XKnHkhG3ognbpjkSiVu7UBFmdWWw4fvbmSc2UlB8NJwnUMxeO9S/Gzg8rpGDpmIS4IA3NZS751YzXc9KHkgZBjQ/v2xRRil1K9D4yrvZGHHhX6BCLuMDE+5nhmfMeLYMLXi60RwLhIdLkaI4JBaUhGQxSyqazCpgAejTeLt2lIzt2Ze8apVgWHIlQhWwEEVAY8Ub4H+1EK/gRM99cccoX6I8BTx+kMZX3M2a2d02bkj3UIPP/u4WM14jfYBSsG8OKVmbUaQ46DI1K/BJvrLMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20qCVx0eO3mJs2PPIGllSEx6L/QKT5NcgvZb+XqxtiA=;
 b=U3SKSqHN6qJiLlS8cDOOBXll0+Rd0H7vGUYd2vdhLXYLupGYr+m3qjKcfGaBrz6D4UJB4udnUlWprAKQAfPST5i4Qm4rmCK2uVL0T8rW+Fm1TDAzaG1cSbj1+wVMBAMjnEFD0/ma5mRvLQnF3XKj4R4G6Jw+PRtVcSktBGGLxU9VN+4l0Q3sPw1Tyv1dENK6wposTPqmTkbIwpplFtF+Mnco3FnwyvI1XZJnv/1CSbIX/X15mapg3v6ZtDB2ivo1Tsebxfmok7C51ZegCPXX0lcYi4fgZie/Gnh055vITtCMVhBUHxFmeVOLZCovuslfFp97LFYWZLCXw0ARzrmrug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=quarantine sp=quarantine
 pct=100) action=none header.from=leica-geosystems.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20qCVx0eO3mJs2PPIGllSEx6L/QKT5NcgvZb+XqxtiA=;
 b=iSnT9/8hwuf0jFqjnKU5dntCJQOQwLj5mxH3fukVw62ygVqBql+sgroeTqZN0/VBL4fI76LBPJVZF74bg6h6hSb5fgvQx6NJ5GgNR71ExUILK3UhO/XiflmABr2FIoP2XYXlghgEn2dnE5SyAuwn7x+GfMp1rBCOkjNPth+AO3s=
Received: from AS9PR07CA0051.eurprd07.prod.outlook.com (2603:10a6:20b:46b::16)
 by DB9PR06MB8188.eurprd06.prod.outlook.com (2603:10a6:10:29c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Tue, 26 Jul
 2022 08:51:52 +0000
Received: from AM5EUR02FT086.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:46b:cafe::c8) by AS9PR07CA0051.outlook.office365.com
 (2603:10a6:20b:46b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.1 via Frontend
 Transport; Tue, 26 Jul 2022 08:51:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=aherlnxbspsrv01.lgs-net.com; pr=C
Received: from aherlnxbspsrv01.lgs-net.com (193.8.40.94) by
 AM5EUR02FT086.mail.protection.outlook.com (10.152.9.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Tue, 26 Jul 2022 08:51:52 +0000
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH] classes: rootfs-postcommands: autologin root on serial-getty
Date: Tue, 26 Jul 2022 10:51:39 +0200
Message-ID: <20220726085139.464795-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 361bb23f-d2fb-4f51-efac-08da6ee415a4
X-MS-TrafficTypeDiagnostic: DB9PR06MB8188:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8/6NsnAu6/7OavBinopciv2eumTSJEN9s6/UwGxHCTfn8ikW7CBU4gTrJBTe9s6s+eCjwK/jCjF5X+3J6wY2HtWNzwIkyu6mPpygCWWPzPDyTcIgBPnIg0fdqbm1Eq0J8XLFfIAtNXC4/4qxz8AwzoTiEJjMcv6nIvbMEkKWGd+UJTc9w9ANGORfX4hjcL3rpSJFEDlGXRPZSREAYWRbfcZ5WOtDpAXPLW4g6F5JzOvUWe+oxFkxAbdbpTm3MUUvydoHD6wmO2H0LerIQzGqPVETY7GvYDYXvI198JFh+F6LEhngWIEzjxc22hlcK5MtnZwzuGMytrm2x0E6gjheHJxAn70uUGSshtyZDgxlP5wlM6vyMhLn4dwqO9VyorW0drJ7eDAsoYSl4WMe4ReDRaBPgqSW5bi5auWSjVFgaum5x5p7U8ptogKgrIycHdjWz3OJ2EQ13ZVPyKvqo3aZyPE+tImZBz2QSehQ0wXdM7rOAgyAC2kUCf0pZNd3WdeyGuvi2qtLEismfDTA5pczB5WFeyrRMNbjTvQ+Oa15MjyHCy8bvuh3Dia/3wjCfoSTYMcmOa8dPGIa2rOiBxTs1akmzAEDA2FIJ0OIyk4tvyC6XtObk1t7kAhUMFbkI5PZH9VTAxfNY7IvyCTpjNXk+wOeztS7gEg0LWYksa1HSn4g315VcmI6t5eRi5ATkl4p77d4pgbWYqSRgkLTGM+jOxv5rdk2cc/OsqU+0OETBAyo8D3Dfabk/Dl+uYqTx5t9LI2CjdqycVHReLilsmyl8MDvYl/jfZg2ozzlxGXvF61dJgpqbOD+Qj/VN764r+6w
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:aherlnxbspsrv01.lgs-net.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(346002)(376002)(46966006)(40470700004)(36840700001)(83380400001)(2906002)(82740400003)(9316004)(86362001)(81166007)(82310400005)(26005)(356005)(40460700003)(956004)(70586007)(70206006)(6666004)(8676002)(4326008)(36860700001)(6916009)(36756003)(2616005)(316002)(478600001)(8936002)(1076003)(107886003)(36736006)(6512007)(6506007)(44832011)(186003)(118246002)(41300700001)(47076005)(40480700001)(336012)(5660300002)(6486002);DIR:OUT;SFP:1102;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 08:51:52.0207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 361bb23f-d2fb-4f51-efac-08da6ee415a4
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[aherlnxbspsrv01.lgs-net.com]
X-MS-Exchange-CrossTenant-AuthSource: 
 AM5EUR02FT086.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 08:52:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168499

when debug-tweaks or empty-root-password are part of the
IMAGE_FEATURES, save some of the developers time by not having to type
the (then still sole) 'root' username on the serial consoleafter each
and every reboot

by inserting '--autologin root' into the command line of the
responsible 'getty' service

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta/classes/rootfs-postcommands.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs=
-postcommands.bbclass
index a8a952f31d..39992b101e 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -8,6 +8,9 @@ ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("=
IMAGE_FEATURES", [ 'deb
 # Allow dropbear/openssh to accept root logins if debug-tweaks or allow-ro=
ot-login is enabled
 ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_FEATURES"=
, [ 'debug-tweaks', 'allow-root-login' ], "ssh_allow_root_login; ", "",d)}'
=20
+# Autologin the root user on the serial console, if debug-tweaks or empty-=
root-password are active
+ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_FEATURES"=
, [ 'debug-tweaks', 'empty-root-password' ], "serial_autologin_root; ", "",=
d)}'
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
+serial_root_autologin () {
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


