Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B7FC19F2C
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 09:40:31 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.103])
 by mx.groups.io with SMTP id smtpd.web10.4180.1659433227070210350
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 02:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@leica-geosystems.com
 header.s=selector1 header.b=Yk4W+s5I;
 spf=permerror,
 err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}:
 invalid domain name (domain: leica-geosystems.com, ip: 40.107.5.103,
 mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVUTW1tbkEw7zQe4DYJTfYf/eVU/8lZiW4Kqs/05CRytkd9Mjo9mpMzIEGXat6z7kDtc3mUUN/QzAjKfvibVI9T8N+ah3D0fr2UkGSIUtvcckDJ8mGo71C6nd/XbyNpEHLmfJSGW105x18HFW5kizajfFtI//ZlWRuEvPhv6f8rInprynYlYISi3eQdvB11pCeo6zhXLdaGs4RJA/4XFmmF0KhgSfC04EZGsONrjCSVl76xDY+ULORyasWBG1iD/MYwzmvDpkqVrUw5IuRnYuNHWgs/0nyHO2be/gSsP/DPIQlv+6JJsq/uArYH9/2X1yv+yqOejMmY0WtXVX2h9CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uicvxipZZ/sNVNGuYgAh6z4mUglbSEB//xlY3Kouwik=;
 b=j9Gb4gfYX5vUDSMT0mNDvMj/1appRUHVAWR6rOrStttAPWx5NoPThA7bOPyQrb9Izgjj2zAO+3l6zfLZToOFNlGa8AMh3+fq4JvUjpAF+6/PLKyNwNKwjej1dE6kXNeBBi79L1Kn6i6ktEXWvWapa7cPWWNY3QW81Cs13NF1CS4Tj3oXPRFP1yIbahyfhm9e6nIfNv9Hxcj6VmDqcQfP50S2pnRdejHqFTzkleIq+NqVtEQgWFrXrXT2IAVVn+uFaCFiTPghoAaf395X4oZdG+lTA+jPbdLZoHacYaHv3JtE1uiKXBiThrrhwjEgra8TaR5oZnc2JEcr1t6P4izEUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=quarantine sp=quarantine
 pct=100) action=none header.from=leica-geosystems.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uicvxipZZ/sNVNGuYgAh6z4mUglbSEB//xlY3Kouwik=;
 b=Yk4W+s5IiRy/+n8IcuQchbTNmSxoRIHjBTF7Y5TxfGcjcAyenT4Vw+LTGRcB/wJR3aYeKFR2JStenGw+KB20LGGGLvilOJDAlH/grwvvN3Hz4J7IEOGQ7qaoAjpE42XrmboDLClUN4yz/B8H0DGswK7/E0cF9715krajo4/2MdY=
Received: from AM6PR01CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::44) by VI1PR06MB3965.eurprd06.prod.outlook.com
 (2603:10a6:802:65::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Tue, 2 Aug
 2022 09:40:22 +0000
Received: from AM5EUR02FT065.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::db) by AM6PR01CA0067.outlook.office365.com
 (2603:10a6:20b:e0::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Tue, 2 Aug 2022 09:40:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=aherlnxbspsrv01.lgs-net.com; pr=C
Received: from aherlnxbspsrv01.lgs-net.com (193.8.40.94) by
 AM5EUR02FT065.mail.protection.outlook.com (10.152.9.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Tue, 2 Aug 2022 09:40:22 +0000
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH v4] classes: rootfs-postcommands: autologin root on
 serial-getty
Date: Tue,  2 Aug 2022 11:40:19 +0200
Message-ID: <20220802094019.962927-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 45ff57c3-ab77-4ef3-e918-08da746b052d
X-MS-TrafficTypeDiagnostic: VI1PR06MB3965:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S3bC8Iy3AsPFpb+evSPj+nyN0KGUz8qI4jGs1P7r7yU3Q5QJHGjsNJjZlOoA4QdVw2ZY4leB2F6A5xlpvPdLRONmay/fn70nXvqM+UUdw4BeT7tJ41WdAw8BkPFdhcf2e9On4gqT1rMC0rIayjiPnOrn5b6+mGlBFoRK5qPgps2cwP6aGCfuPXxw0pnsulOXy3Z/6rnjsOKTvaX+wKtkjX8+Up35mtaH8z0RxnKq3Z+/Vg7hQL32jZFOWEtPK+3rJUpjGAJMDGk6dLkBILvUwTK8CtjcvornCoUa2bU9/NK6FU0nXmkXgjpPp/jqr1RYWgbrPxhpZyL6aOuW5yxnRFWirDHSBaPQuBo7fCIHM/NbdYFh1OLU6caRguTn6bmeTkQfqWFGHj0y5P5ilxCBGgztlzrfFdJStUOvLdNpepVNWqa3PuvMF33UihS1/y8Bos2DuZpz0Sll58Y9GfLMAdJFaD6MrbQ4Brsj99SqNEQDfOxFVUmA37So9D4a9vlgfR/cvLW38MT9JIltXd/gAWxgtwIdfGqu8MHniUMrnC+SBldScTGyFBXBxazLa8hQr5zrFs5JA852gAmtlbcRLaI05uqjpPZVeM6Rtm5jYJXrx1ViTfKvaerYCT52KVOltxB3oeKSQ8kxkRULlv0aC2M7+PWqdTB6GOTQjivMedN0JID8fEN2MbvwDnLfvaTi/rLFFxSBtcJ7VVH2z9lfqhQuyG73biI/N3BR/wHC3lES0NydX5d7QxKG+O6Pm8fc2vMwGspfvSe6NP9UjKhTMMKiERM7Ay/pN5pOqTh9POaZVgVeo79ubM+gymEJFXli
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:aherlnxbspsrv01.lgs-net.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(376002)(39860400002)(40470700004)(36840700001)(46966006)(6506007)(6512007)(26005)(6486002)(186003)(41300700001)(36756003)(6666004)(9316004)(47076005)(40480700001)(36860700001)(6916009)(36736006)(316002)(4326008)(8676002)(44832011)(8936002)(2906002)(86362001)(40460700003)(5660300002)(956004)(2616005)(1076003)(478600001)(107886003)(82740400003)(83380400001)(82310400005)(336012)(356005)(81166007)(70206006)(70586007)(118246002);DIR:OUT;SFP:1102;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 09:40:22.2626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 45ff57c3-ab77-4ef3-e918-08da746b052d
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[aherlnxbspsrv01.lgs-net.com]
X-MS-Exchange-CrossTenant-AuthSource: 
 AM5EUR02FT065.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB3965
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 09:40:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168774

when empty-root-password AND serial-autologin-root are part of the
IMAGE_FEATURES, save some of the developers time by not having to type
the (then still sole) 'root' username on the serial console after each
and every reboot

this is done by inserting '--autologin root' into the command line of
the responsible 'getty' service

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta/classes/core-image.bbclass               |  1 +
 meta/classes/image.bbclass                    |  2 +-
 meta/classes/rootfs-postcommands.bbclass      | 20 +++++++++++++++++++
 .../sysvinit/sysvinit-inittab/start_getty     |  3 ++-
 4 files changed, 24 insertions(+), 2 deletions(-)

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
index a8a952f31d..3dadba6047 100644
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
@@ -196,6 +199,23 @@ ssh_allow_root_login () {
 	fi
 }
=20
+#
+# Autologin the 'root' user on the serial terminal,
+# if empty-root-password' AND 'serial-autologin-root are enabled
+#
+serial_autologin_root () {
+	if ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "true", "false", d=
)}; then
+		# add autologin option to util-linux getty only
+		sed -i 's/options=3D"/&--autologin root /' \
+			"${IMAGE_ROOTFS}${base_bindir}/start_getty"
+	elif ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true", "false", =
d)}; then
+		if [ -e ${IMAGE_ROOTFS}${systemd_system_unitdir}/serial-getty@.service ]=
; then
+			sed -i '/^\s*ExecStart\b/ s/getty /&--autologin root /' \
+				"${IMAGE_ROOTFS}${systemd_system_unitdir}/serial-getty@.service"
+		fi
+	fi
+}
+
 python sort_passwd () {
     import rootfspostcommands
     rootfspostcommands.sort_passwd(d.expand('${IMAGE_ROOTFS}${sysconfdir}'=
))
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty b/meta=
/recipes-core/sysvinit/sysvinit-inittab/start_getty
index 699a1ead1a..7106fb72fb 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
@@ -9,9 +9,10 @@ case $(readlink -f "${getty}") in
         if [ -x "/usr/bin/setsid" ] ; then
             setsid=3D"/usr/bin/setsid"
         fi
+        options=3D""
         ;;
 esac
=20
 if [ -e /sys/class/tty/$2 -a -c /dev/$2 ]; then
-	${setsid:-} ${getty} -L $1 $2 $3
+	${setsid:-} ${getty} ${options:-} -L $1 $2 $3
 fi
--=20
2.25.1


