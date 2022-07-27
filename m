Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DE7C19F21
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 03:37:57 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.112])
 by mx.groups.io with SMTP id smtpd.web12.15731.1658893067943537282
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 20:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@leica-geosystems.com
 header.s=selector1 header.b=DJUA8TnP;
 spf=permerror,
 err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}:
 invalid domain name (domain: leica-geosystems.com, ip: 40.107.15.112,
 mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2iQDnyKK3kE2tDvxibTIJ9q5FDTYMwdo0VqPP9V1bZ0yqJAgOTmkVwqIHDtLRONI9q709Dyqv/f077Vn4tCztTgRmf8CV8VKNqobTDVJxUtROmeOMqWO3Cq4Fiv4EvzjU29iF67OT62GcFwyMePrZXT6uxiDZpMDN9VYT3n4UNzC1mKQntwZ/+/xC0O9+ElewU5dBFg19+MpoxiXTnmlK0NsfvFBXQ5nqByPA/BoJ1zLSb4t3hyadP3Ml3o9YflnShY7SnIDnWhT4a/ceEdK1StLd2QuKCj9VcVyTIMpQ44CpDbeDt6O2c6fTUKEt/qf8KbOJPoQVxcFKZCh4JyVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ng4emkOmxFFYtK/L/zYf2sXYpBgwbz6mZAi71qIcan8=;
 b=IQrahb4pKyhZrH8S3fQtVfCCi/gH0zNgwWBX6yV8xyWkmisod+SMVBToPO5HvfnnytOqkwTgE33utvJUTb4WHFqSzDhxBU5gHfhN336Hn0l1gTFkw+RS8OT8umU9YPEoJMum8vzrIm03iFnvIBR7mO22PEaa+J4yda+WE4o72SyEl7np8/SFUfFriu3LGDyncrpAiQXB5tVJm2skSQ4pUhPlZX1Hhw6yuqPint/MrqIgm02UBxsQYGi6hIyy7GHm9O3L7JekeptzP1VtUrgV9N83jyOHHoq7jk7vXgqi5LKOTmAFtrQ4cwW/l/HfAoLhiiYu8/iHkZLESQnxRA0ykg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=quarantine sp=quarantine
 pct=100) action=none header.from=leica-geosystems.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ng4emkOmxFFYtK/L/zYf2sXYpBgwbz6mZAi71qIcan8=;
 b=DJUA8TnPGY8jqaxgVZZI3tPNdYFfDbU7W7Vl12YGR7aJxKwxplJnr2W7NlIQ4X4xSKAdTgaLtjyD9tTkr4NjHNv/jBsg3PqISxqLNoFppk6OEqzC4q1FFAEN4o2sC49j/wKSyOkoXQhGPEhoVyvbbpTHW/czHE6+3OqRXBgAmpE=
Received: from OS6P279CA0023.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:33::9) by
 PAXPR06MB8111.eurprd06.prod.outlook.com (2603:10a6:102:1ad::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.18; Wed, 27 Jul 2022 03:37:44 +0000
Received: from HE1EUR02FT049.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:e10:33:cafe::95) by OS6P279CA0023.outlook.office365.com
 (2603:10a6:e10:33::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Wed, 27 Jul 2022 03:37:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=aherlnxbspsrv01.lgs-net.com; pr=C
Received: from aherlnxbspsrv01.lgs-net.com (193.8.40.94) by
 HE1EUR02FT049.mail.protection.outlook.com (10.152.11.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.10 via Frontend Transport; Wed, 27 Jul 2022 03:37:43 +0000
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH v3] classes: rootfs-postcommands: autologin root on
 serial-getty
Date: Wed, 27 Jul 2022 05:37:39 +0200
Message-ID: <20220727033739.1752802-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bb750e17-248a-4a2a-ff2f-08da6f815d72
X-MS-TrafficTypeDiagnostic: PAXPR06MB8111:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	z+JNEsKul1ffK1Ycs+tKYLKjX0FxJAkSleBIWBytbK9ss3xyH30lzuok7bvqIl5ha0uPL+1huh+G53SdhtkZnV8cc00ra6ovfAEW0+/uTn4Txo+JD4ub03aMbZ9So3j83HKMGsgmNphzbm2SfBIdN/DweYTnR9EalJg2iBhuaQX4oi5csokFCzdSzbZy5VU73rZ/9Hw9bLvz/jVUe6nnu8uxfSWiJHFpzyKsUw1xa+TBvQdBvvNvDcYsX4ejGmU2xAstyl6yQgngUZHAIXzFtQAqwpOEUT7JZy5o29tBJMDWcrshKVCyfzur3TuwAM2B4wCCJf7Nbssh1vSRWPCjhuhPcF3M4lNT8a5HPrSmFfnTszuTPDsq9EAR+CgQRV83/gYBI8l6LVU5KGfxfdYgl21tvkm7oRDy1rXaN/ADzWA+2cG7oo538i+PO4qTsFEunymU4Qg3fhEMxYs4/0Ps6WECU5EWS1dbUcUulrLEUDUtih54sEiM1yZ3ANHnkHOflt7F3PrEP7fGjeXMVh5my0WuGOsLhwBhr7KRs+kFmny/DSdtXAgpsAOmu4IutK9z72JeBqNwaEewzTr+xK8bpUc5qbabXM1ONo5fKQT0Kq/+BwnOxcSjmli8J/TmcZtTwnmMl2Ho/6LciICD2hcMwIhMb/5eNuLR5861QjL/CZLn3SX3IYefH3bofJBsx2dV9415J/KTS0pF1xG4hosVztDA3p8tn1yRhFQtayP3ssOOerLZHPDHSlfJSz3qM7kJBb0EUeJcuzK8r0cgZD66n1Da1YXYBA6Xa+Bemik5jwViUmepfHWA11YNOXWrfpLh
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:aherlnxbspsrv01.lgs-net.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39860400002)(136003)(376002)(46966006)(40470700004)(36840700001)(82310400005)(6486002)(36860700001)(356005)(9316004)(40460700003)(86362001)(478600001)(82740400003)(81166007)(44832011)(8936002)(316002)(36736006)(5660300002)(6506007)(2616005)(47076005)(4326008)(956004)(70206006)(70586007)(336012)(6916009)(107886003)(186003)(40480700001)(1076003)(41300700001)(8676002)(26005)(118246002)(2906002)(6512007)(83380400001)(6666004)(36756003);DIR:OUT;SFP:1102;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 03:37:43.3909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bb750e17-248a-4a2a-ff2f-08da6f815d72
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[aherlnxbspsrv01.lgs-net.com]
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1EUR02FT049.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 03:37:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168540

when empty-root-password AND serial-autologin-root are part of the
IMAGE_FEATURES, save some of the developers time by not having to type
the (then still sole) 'root' username on the serial consoleafter each
and every reboot

this is done by inserting '--autologin root' into the command line of
the responsible 'getty' service

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta/classes/core-image.bbclass          |  1 +
 meta/classes/image.bbclass               |  2 +-
 meta/classes/rootfs-postcommands.bbclass | 15 +++++++++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbcl=
ass
index 84fd3eeb38..6764035729 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -29,6 +29,7 @@
 #   - allow-empty-password
 #   - allow-root-login
 #   - post-install-logging
+# - serial-autologin-root - with 'empty-root-password': autologin 'root' o=
n the serial console
 # - dev-pkgs            - development packages (headers, etc.) for all ins=
talled packages in the rootfs
 # - dbg-pkgs            - debug symbol packages for all installed packages=
 in the rootfs
 # - lic-pkgs            - license packages for all installed pacakges in t=
he rootfs, requires
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
index a8a952f31d..65fe74cc5d 100644
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
+# if empty-root-password' AND 'serial-autologin-root are enabled
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


