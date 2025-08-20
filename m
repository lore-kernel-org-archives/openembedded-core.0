Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D619CA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 13:42:22 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.64])
 by mx.groups.io with SMTP id smtpd.web11.20207.1755697335203440183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 06:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=FUS7DPFo;
 spf=pass (domain: axis.com, ip: 52.101.69.64, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sLFt0K0KvIHVhh3hgFX3ZfY1Une1X4M04oSa6m4MtlSwWcqNlyIQ9jTXlSzHQGMIu+PGlCgQWeIcbdsLFd5gYMEKzSz3gs6pltB8W4LHyb9N60LMqACAAZm5ViugVxaAC6QNKaLDZtGs9Jm97qKawmcecjqoDrxNKMiBGve9+zC34MpfkzdahSDeEn3aadzgl5BLmRBfExjnLL0Oug3hJtn2GjOyNLT8f2MgErgn57SwTxaaLZEE2OeKI9EZQOySs62q5cHf/oZXEcC9LM8Pegvf3zVPxkSv1JCOA7OKuKXbWCwCJplutAPInf+OekyoX+yWsHJNuPRiki1mCQkBog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VIJBwHo3zI1MeiyVzAGPX9INMG9m3ydFZ6KunFjpIY=;
 b=UtW1zx3GzY+2kaZ15bcZuE84gio1aWYU6uRlv8e9pjSQrQmQWGt8mJvgR/VEK67ECGjtBY5QoBszFWfUNdFH61zQMqWgqSzCpTDtWC6L0FagV0i9TBTcFGVXdYBqDXbHEQsMDwAZbSbDQ7JnB+CuvJbHD/yQNjDYb7utzTuCgoLUu66WqH6QGwPaJBfmGo9/cawcmEcLiYYSqolDdGfMWcMZ4ON7JNcPfH7P+OawyGZFD4S9BSrRcdeiuWKIyVnSX4Fd+VnFo/ONHhFFSDmuynRnqdAcSRKmQ/v4vAJARBIBFs6pXVaK8GJDYJXfG3Sx2xymlrJSC/DzV2LLYfXfkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VIJBwHo3zI1MeiyVzAGPX9INMG9m3ydFZ6KunFjpIY=;
 b=FUS7DPFoOKLUbEjwIaYiJUexIss7pX3bpedng1/zzVFbRodVyNgdJcW4OomY3qr7ot4wbxtRYtgy7Qe9sXcKB+VShbbV++HFtXxpKqWM0HvnKdUsInVTyysIy6ORXEmBoL+5bMcbC7EBZkUEmkksqoUYA4hkpjH10x6Sq56BYj8=
Received: from DU7P195CA0030.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::17)
 by VI6PPFE37652F62.eurprd02.prod.outlook.com (2603:10a6:808:1::322) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 13:42:09 +0000
Received: from DB1PEPF000509E5.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::51) by DU7P195CA0030.outlook.office365.com
 (2603:10a6:10:54d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.14 via Frontend Transport; Wed,
 20 Aug 2025 13:42:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E5.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 20 Aug 2025 13:42:06 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 20 Aug
 2025 15:42:05 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Wed, 20 Aug 2025 15:42:05 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id E204F2C94
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 15:42:05 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id D01F6120088; Wed, 20 Aug 2025 15:42:05 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv5 2/2] systemd.bbclass: Make systemd_postinst run as intended
Date: Wed, 20 Aug 2025 15:42:02 +0200
Message-ID: <20250820134202.1412477-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820134202.1412477-1-pkj@axis.com>
References: <20250820134202.1412477-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E5:EE_|VI6PPFE37652F62:EE_
X-MS-Office365-Filtering-Correlation-Id: cf5f8628-76b0-4197-3404-08dddfef5a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gcCeiVX4vJoU/+HFenR/GKUYJJv+Jz241BrHBXfsaI5zXVQ/R9dNE9UWYIs0?=
 =?us-ascii?Q?iSyKbbFn/DFvTnuGQDTGOGdrSc9NzhaBO8LOiV6MuC4A3kNLfugnFcnaDvFP?=
 =?us-ascii?Q?fxrXfvWK+V3gcwN2XsEJLme5xjAKTp+5LuLc8IKG9FXdOLiI16u2c+J0VDUK?=
 =?us-ascii?Q?LveTj56c5ZNrFi/MFOLHUv/so5ZS/x30c7QgA0TBvwprVH/t9pQB+q2vHES1?=
 =?us-ascii?Q?8b5gxfQfLI9ZgRwdgBHAJPVRJTliHxlTlti87V+81hoEffQ60LGnzB2Mid+r?=
 =?us-ascii?Q?9FWlJEOv9jgZzkY8UslyGqjQRaJOWuDPu8j0l+RnL9Yd0BCAcpE5Wu3ZRUy6?=
 =?us-ascii?Q?goFAhgzK8fPscmxc6Mcg0z1IYgyfEmr3Z4bNC+Y+TjDjgPxsYBV0l0x+9yP1?=
 =?us-ascii?Q?XIZLpJu1Y4Q4zEDRRMd9odNRZe7Z/WFHrJa3xDW6uhLjpBU7gp3QxHW6a36P?=
 =?us-ascii?Q?/hRl/m9dT9Vi2TJ/efLqy75yfNyGChGS1p8H2yIFswH0yIUmSZ4dx2rYVz9T?=
 =?us-ascii?Q?Jd5525l6OhDILVJiggV2HlrMVTxaPQJ8OttkEjhtBa6j5596kPoMHqf0bPqJ?=
 =?us-ascii?Q?yJ9FZvi0j/FK5wQFEsE3f1MumUpE4KmpK1vDLMXn0vLGHxwnECi8cb6iOkRV?=
 =?us-ascii?Q?5EVbcc/j9a03sshW1d+oEs6S98vELNWxy4sy0sG/+Rwvc+quA39jlvhtVb00?=
 =?us-ascii?Q?gtxtCrxhlSYJoeQ1mZDQEwPhuzaZuMqAgG+7vS7JwlUTH4zFPvrzr2tZBt8P?=
 =?us-ascii?Q?TQ53uq734VTCxNxTOf/LachqzoTGGUQ3JGtH3zkIknni1uIfb40Xw5gtj6LR?=
 =?us-ascii?Q?nSkiC+PU4P7XOMXfQNLRopRTKsP429NU6AcE4G16xxGaxTr6PDHdZGKb6Bit?=
 =?us-ascii?Q?5IZFNNAnKFpE1AahFTHIWlv7jLorbyY7T1cvofLFebgadf4hehXVN65xyF1Y?=
 =?us-ascii?Q?MKNWkiBroGEeSM9Pz+yf0DPsSIIzCptJlcRWF/MAN0DfcgNuE7nPkYC17FTU?=
 =?us-ascii?Q?L85pJ5Mz75R514tteUvgMvr4xd1RP9CX3ock9CEFqX7qN4lKEdNZOuUpBR7I?=
 =?us-ascii?Q?tfCq9NUvzYjK1RV3XE/0Pb+FtD3jXiClE3ExIVPzDS9VOaOP/KfcJUa/bkki?=
 =?us-ascii?Q?TNljdZfmJJaCZtkoNBpiClAvYrWzwzW/Ug2gIYfNwvwN+MD0ZunQb/q1kLr9?=
 =?us-ascii?Q?3TTJxpkRMRHzpj4m7BRv3C2ZguO8QlE0fkJk5iS5+i6S3VJ5zVbjsIa+Rsjb?=
 =?us-ascii?Q?tYlkt6/CffaGYVH3wWscrgrY1a0qnU+ouqfKK7KgqH/k/7whKxf651D/HPTZ?=
 =?us-ascii?Q?SsOvRDg0X09h9nD0Y/f8471yMPV6btoydSZZYrgiPB37N8NwRIUgP+0YXs7f?=
 =?us-ascii?Q?g+QPCRGN/mpwbzQPDSNeqcR1Iy3Z2LGbuUkuF40U+WR4+2cCMuFHLdvxPvg4?=
 =?us-ascii?Q?xaxlUFGyIW4xomY7TmTaYxJNgdG9emce5ma+/RV6ELt3EJkph/w7DsGkL2QA?=
 =?us-ascii?Q?QjdQCxVLN4tmtvsrWG1onxi0V5o9DRTCkxiI?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 13:42:06.2659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5f8628-76b0-4197-3404-08dddfef5a64
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPFE37652F62
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 13:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222183

After the switch from using a systemctl written in Python to using the
official version of systemctl from the systemd project, the
systemd_postinst function has effectively not been executed during the
rootfs creation. The reason is that systemctl provided by
systemctl-native fails if run without argument (as systemd_postinst
does):

  Failed to connect to system scope bus via local transport: Operation
  not permitted (consider using --machine=3D<user>@.host --user to connect
  to bus of other user)

This is not seen in the logs since stderr is sent to /dev/null, and the
only way to tell that there is a problem is because systemd services
that are expected to be enabled aren't running.

The reason this has gone unnoticed is because systemd_handle_machine_id
in rootfs-postcommands.bbclass will call systemctl preset-all, which in
most cases will create the missing links to enable the systemd services.

This change effectively reverts commit
a52e66762c0c51918b1ba3d4622759637b6e920a (systemd.bbclass: update
command to check systemctl available) and instead only runs systemctl
without arguments (to determine that it can communicate with systemd)
when executed on target.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Add --sysv-install=3D to $OPTS to instruct systemctl where to
         look for systemd-sysv-install.
PATCHv3: No changes.
PATCHv4: No changes.
PATCHv5: No changes.

 meta/classes-recipe/systemd.bbclass | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 12c59647be..0a7de208e8 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -29,11 +29,16 @@ python __anonymous() {
 }
=20
 systemd_postinst() {
-if systemctl >/dev/null 2>/dev/null; then
+if type systemctl >/dev/null 2>/dev/null; then
 	OPTS=3D""
=20
 	if [ -n "$D" ]; then
-		OPTS=3D"--root=3D$D"
+		# Use ${STAGING_LIBDIR_NATIVE}/systemd rather than
+		# ${STAGING_DIR_NATIVE}${systemd_unitdir} because the latter is
+		# affected by whether the usrmerge distro feature is set _for
+		# target_, and we need to know the path to systemd-sysv-install
+		# where it was installed _for native_.
+		OPTS=3D"--root=3D$D --sysv-install=3D${STAGING_LIBDIR_NATIVE}/systemd/sy=
stemd-sysv-install"
 	fi
=20
 	if [ "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
@@ -46,7 +51,7 @@ if systemctl >/dev/null 2>/dev/null; then
 		done
 	fi
=20
-	if [ -z "$D" ]; then
+	if [ -z "$D" ] && systemctl >/dev/null 2>/dev/null; then
 		# Reload only system service manager
 		# --global for daemon-reload is not supported: https://github.com/system=
d/systemd/issues/19284
 		systemctl daemon-reload
@@ -66,8 +71,8 @@ fi
 }
=20
 systemd_prerm() {
-if systemctl >/dev/null 2>/dev/null; then
-	if [ -z "$D" ]; then
+if type systemctl >/dev/null 2>/dev/null; then
+	if [ -z "$D" ] && systemctl >/dev/null 2>/dev/null; then
 		if [ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False,=
 d)}" ]; then
 			systemctl stop ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}",=
 False, d)}
 			systemctl disable ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED=
}", False, d)}

