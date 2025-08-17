Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1A0CA0EE4
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 20:18:52 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.38])
 by mx.groups.io with SMTP id smtpd.web10.60204.1755461922408629360
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 13:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=oF8p+P43;
 spf=pass (domain: axis.com, ip: 52.101.65.38, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xz68FuUfYeUAJ4Vkj0gMOK9kcABVNrPpsWGKduIqEz7fRU+70Ut2lgJV4dFLkUrvo5nU2mEmUrYHoDtTON7IkqI8ui4KoWi1p1xwXEWDOtinXel66T64Vra9vOsu1/6uWLGEjSWadOjm9hmq3ZZ6x9VP2Lc1TMuRy6Ipihl+38AzoIWP+kA8rIusWCDn4q667rgYDMbWjFkgLBBermyuQISYx0mr2a+4p93TGoA/fP+/LYnwQkGwgQR5lFVjmguCZcxdTIPDx2RG/enFFgGdnBtbgJghLmjRLQP/nAaWHPRspqLgM5Q9dtoCmQw+pZM1S0QsB05RThLEPXnQjIYT2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqcK6fhV1camPl5QvxZVuYnxCsjnjhrOEAM7OFSCkcs=;
 b=lSXRaxKO2z4Xb1E576HVywa13M3Pr91cpQ/Al4wd0gLVpZUEGjdgE+xY5OmYLyWf/orbmTEn3G2hNY1OEcPd5958K43pDNhxaqy4WAQb9/VID9zd1n/v8KB5Ci865VD+Tkcr7rxCKI7JOrY8bNmmyaU+SZCc9Cjtf26s3d1tOIpk5bI8OekjZIAs/JEj0lWo7aaOWXLxRXeVSgz+P4Nlx1DHOsT2DFI7Laj4yTu4z8EnbfwG/e2feeTS6qJU2jDwkjnWBh3O6rqSdB8uJqhCo1spD7wSEM3KqDMscJbGQsFXS41mK95iz9I3Yo4TrBv5Gryipz2Vj2MYbeMSgqBjzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqcK6fhV1camPl5QvxZVuYnxCsjnjhrOEAM7OFSCkcs=;
 b=oF8p+P43+XFLRYaa7gJRIg9i7XGBGtSa5H6KQ0ug3kFvW/McYe6RDMwwkwr3oc8Uz+KevNC0iR1OSQZCx5SaLxzuLgxagKEaX7yKNUbQniKHDZv9CsgwgeYmAVvNmzGfm0rthulGv/h5ofvNAYSlV6IUYrHbCUHoX9G12utGPk4=
Received: from DB7PR05CA0036.eurprd05.prod.outlook.com (2603:10a6:10:36::49)
 by VI1PR02MB6333.eurprd02.prod.outlook.com (2603:10a6:800:19b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Sun, 17 Aug
 2025 20:18:35 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:36:cafe::d9) by DB7PR05CA0036.outlook.office365.com
 (2603:10a6:10:36::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.21 via Frontend Transport; Sun,
 17 Aug 2025 20:18:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Sun, 17 Aug 2025 20:18:35 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Sun, 17 Aug
 2025 22:18:34 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Sun, 17 Aug 2025 22:18:34 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id CD0F42404
	for <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 22:18:34 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id BE7401200B9; Sun, 17 Aug 2025 22:18:34 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv4 2/2] systemd.bbclass: Make systemd_postinst run as intended
Date: Sun, 17 Aug 2025 22:18:32 +0200
Message-ID: <20250817201832.2462509-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250817201832.2462509-1-pkj@axis.com>
References: <20250817201832.2462509-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|VI1PR02MB6333:EE_
X-MS-Office365-Filtering-Correlation-Id: 419d991c-d975-4769-d7bd-08ddddcb3e77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nHMk4UWFE2Tmk7yCeu3AAWINTW+oDZMe6z0tGbIxLckDklJq2nvbBfyfcVpJ?=
 =?us-ascii?Q?agQTuDqfMk6hsuxQiw0AWfhbamYyybjeNUeBBpyvtoA5cvtMruF995G2mX9J?=
 =?us-ascii?Q?6pOS4Ob7ixQm1vhmj5bxSa4zIC83UjneryTsDbAcMOxGJZigQ4lMFP5SS7P1?=
 =?us-ascii?Q?UK2KQeQZ65BFGFt1rgSVJrNpwTGcT3jAu2a66NGt7uulenCAUd1sfg6UjIyt?=
 =?us-ascii?Q?/lBoLcm5cv3vNQihRIPPLjhTfK2+nFkYs8t61O3ttVLmp9/xr7rh4esuGFpd?=
 =?us-ascii?Q?hAIqIsfb5IJHe1xY/Il0xVrR+cX1hQs3OPViCgarr7G5zEm1TP6FIYIukd7I?=
 =?us-ascii?Q?o40QH8mlUg7rBOKVzp+1u2AhTMcOEa9ZFCNhhQAZIjwGQ/gDECyKkH9w/Ta0?=
 =?us-ascii?Q?6TEI8SUndmh3OhBWurqHh06PXBBIi3MsdkL6sihLRPPJ/uOTjgla1VeyFEAz?=
 =?us-ascii?Q?Ak1CefbuHnY815MfoC2kmujmXJTcaR/s8At+ctC0/QXWRQHmBj54vKEMULIY?=
 =?us-ascii?Q?J+5Z/m/xqdS5M+XSISNYiZHrEmQ98qvCDCr06zxsVRWkAKeMQHDdiUdf8n4M?=
 =?us-ascii?Q?8l3aEvRt+rp4HCD73J1E6I+FzQy7l/qAYaCGPUBqXJ/2FKVDZhf+kB+cTD6Z?=
 =?us-ascii?Q?ZD18lPwDuPbCO3rFb1iDiwlKQLDh2Otk/xir/L6ONa5uHAL7ce6w6NV1rZw7?=
 =?us-ascii?Q?hs3+dbXJvqscFZ8sSwC3EhoOgyxFtSpvtNnOARJ/F/YHGtgSmZ9FMu+7uoL8?=
 =?us-ascii?Q?sBic+a+ClqivNLKj3xYCy8oFG5SXdl+wrANzHHr+h9Z6J+eEEu70hSExN5fh?=
 =?us-ascii?Q?qsKa0TvCA/CHRYZDSsllgOuoP2GqLs1u+/iWWUoi2MlWShXmnA3XUfQ1Pjjf?=
 =?us-ascii?Q?hBc32l4supUpQOR7K0QtQdcI6OEc5mPpKGOGUdJGzcG9T2azdOC7Jj4YtefT?=
 =?us-ascii?Q?su4Twjtxevj8G2CcAN9EC+0zpvC3k1nVen5MxzVHl0vDY6GCIzMk6Nw7ZuSz?=
 =?us-ascii?Q?A9MCFlTR8VrLjn+JnvO/ZXMy9xXKzjcFn6kxDl9VcYKHHObyUUzF9xR3secC?=
 =?us-ascii?Q?UoPIOgIe2g3qvCFujx9Nx7gRmkTe2+/vk01cUi6pJNlL6NbqMC4xi05pEyBx?=
 =?us-ascii?Q?3DIXNxIial5jogZZj07tdwyNRST6Ytngqi0x0bDp9/EGKoIS7cKH9uIef57l?=
 =?us-ascii?Q?/jTaoimqgl5PTuZwEC6Q6JF+c8zm48hsRZw6pLgb1+0YakV70ybp6819CYXM?=
 =?us-ascii?Q?P2E7jb6plH3ow7ul38FP9Pigg4qbV/+ljYsxo4oXbvV1GB/e0EKnQWcfV/Ux?=
 =?us-ascii?Q?46+M7+eynfcX589Kz8BPZKm0f6NO7lBcZFWS7Qc8OPiUi6xeuw2htedQ/R5w?=
 =?us-ascii?Q?LHcj7BqG6UpUIWVgx2S0dfh1S7bgru1MkK2Ni9hJW2pnjW39ktsiBxvcbyfR?=
 =?us-ascii?Q?RmeNyemLIg+7i5lQ4qtrFaNmplLNyHioJz0BnW1WB21TX8TAoFLVMg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2025 20:18:35.2055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 419d991c-d975-4769-d7bd-08ddddcb3e77
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6333
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 20:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222015

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

