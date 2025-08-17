Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD97ACA0EE4
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 19:50:22 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.35])
 by mx.groups.io with SMTP id smtpd.web10.59694.1755460218642674412
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 12:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=A5J85wz0;
 spf=pass (domain: axis.com, ip: 52.101.66.35, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqKyug3lEpvXZ80KGNWn8CnaJ6pFUPFz0KIrZrA6nimBJmKugEqleUgFSKJNdJQ1v9H0dwkh0qzTuPGiWD8iF6dVqH8uj66I+0YVWLGB5p/wFgL/RMQbCqlPgibTENBfRZZvBFqrNWy5G8d7Qx6bbLi2mKO+gZBhcK0givhh6CQ30brcxjgLrCgoJB90+I/KKQ222QnsQK+Nx3aXt1HoWykBiKDFgMIh5qFEYaeZSotl72hMzLkEGm5BlDEiCQjNnVyMyA5bfxmMhPgyWtw6UZ2acduV6xEzPZjv/uzymlfsTYJqX2wNxfztz2oN26tyheEoW8qCuxGmjau/FfCIOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTUVgSeQcb5xhcFRlNYs9CKVx1KY6fOXbvmqtv/Jby4=;
 b=i/3wcbl8F968Wtp4QRrXFmRZMqEAj5HknB41RL+pkGA6LK+kil3O9gQ9aV5NFiIGWNIaWp0MNoVEN8C7HfoVpVQLHsena2kzqyb6HYbgVIagAqxpBrc6T+rdAVQ0Nf0sEEnJ9KwALd8EW27OGa5DBDxp/8Nj4cf15Jj2WikEJ9+W0cMKD/tYTh9+4zVenduHBdJFrLKSdURMdLScZ0Uf0ChGWQ2SlmT9V0ZLHEr3ZuhOiFGHXJg54rdjBzl2OtjuHIe7KHeRutxrmmfbDSO35S2914ijyFWuWnrf9X+vBssRt6jVYwUvYSnZZ8Zy33/RpK5oQhvC2YLPujbHq4Iz3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTUVgSeQcb5xhcFRlNYs9CKVx1KY6fOXbvmqtv/Jby4=;
 b=A5J85wz00soodjsIsuTtR9iMkFKppjo1O9iBXOe6D2lRXT/zjd0O6GTXTrpsa7yqcGHBaP4EAPCxEx8CORzCvftbBR5zZLIK0rszWngYk06AdgyRDEjj4kbeNFJDfnZ0W+NDugkrwAZo636uCTcUZY5A+tIzMFs6irNTq5XTGyk=
Received: from DU2P250CA0008.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::13)
 by PA4PR02MB6733.eurprd02.prod.outlook.com (2603:10a6:102:f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.23; Sun, 17 Aug
 2025 19:50:13 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:231:cafe::7b) by DU2P250CA0008.outlook.office365.com
 (2603:10a6:10:231::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.20 via Frontend Transport; Sun,
 17 Aug 2025 19:50:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Sun, 17 Aug 2025 19:50:11 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Sun, 17 Aug
 2025 21:50:11 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Sun, 17 Aug 2025 21:50:11 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 80946280F
	for <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 21:50:11 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 72619120050; Sun, 17 Aug 2025 21:50:11 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 2/2] systemd.bbclass: Make systemd_postinst run as intended
Date: Sun, 17 Aug 2025 21:50:08 +0200
Message-ID: <20250817195008.2455455-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250817195008.2455455-1-pkj@axis.com>
References: <20250817195008.2455455-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B94:EE_|PA4PR02MB6733:EE_
X-MS-Office365-Filtering-Correlation-Id: 7de91e2b-6b87-49a5-45ed-08ddddc74734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fCPkAL6RGTXF4ckYx3JtFmhL1VwJ8VGIfkC8AFCDRFHXZg7YR6QMox6mxfZF?=
 =?us-ascii?Q?eKbPl+ri+LR7yOiSC2JRzqnOwhJWA/rm/1eOWDWWg79Y/gRVEZoGvqIesyfK?=
 =?us-ascii?Q?HhLjNFbhxdbuY+G4VLSo/qyc9L8iyDNANRaGxM5qVEV3SBS0lAdzP6CzQ8ax?=
 =?us-ascii?Q?TrhtkDmWhPZTMO60siPWojirkm3BSgnksg40lBvtTAAySQnB00lUnBvi/xBZ?=
 =?us-ascii?Q?7Bjt7ojUx0YNMoMTfMNg4gdxmX/gxJjaXVScxKuWfAFqFfyE9DrQYdXqSsWA?=
 =?us-ascii?Q?YlA2ZEht9hWs1QazGOSSzdAROd0PpUXMXol6sJjo/Z2RJ9xGlFNtDlkqbFoA?=
 =?us-ascii?Q?A74z+VEbCORlxRycUadnurzwXB4NbPN70XMS/QducNrqXSEWwVXQqLa1UEEC?=
 =?us-ascii?Q?NZSLmVd4vwJ1qQoKFPFBtkGH1Kg7Z5O7DJkvr+chC2rptRF0kqckczdebs26?=
 =?us-ascii?Q?N27PeB5TzGWn0SfzX+3ezXLPSC87q4dBsKcWCGxH8caAO9HxHHQuRguZd8YK?=
 =?us-ascii?Q?VQ47EBevbhtn/jY/vP0yoBHi/d9H81edmX44OdeoiNXSMHcHRqVXfDfPdgwc?=
 =?us-ascii?Q?WI09fPgv2+tY+PtKwqwSS+EapZKsUP4pDdanAzA/ZYc+nGdPenB9pg6VTuEV?=
 =?us-ascii?Q?cT//fVvcAk4LSNsRq3PLcMAcG60MKH7UXbclb9pryAGTqA0+oq2J05c3ZPI1?=
 =?us-ascii?Q?eT2cELcsjGrI6N7KgdeWiWdKUlUlfreUS6daOqWbTN3l4h0zIakIa4uPsS4m?=
 =?us-ascii?Q?N/ohmw2C47Ly+5BbsA4nEJx2gnMNcXjO1/EOM3vU/7Gcfg6qpekXaRp/pwF+?=
 =?us-ascii?Q?LAyE9IolaQUUKgtfiyCE9ezz3b8LIp8+ivjiOezx3T87/9VR5fmkxP6Nd5FG?=
 =?us-ascii?Q?L56Xh75BNUZJ4DdBZUnzH/KgCvKu5J2FCbi5zHeMu7FJKDD1dfPRIM7eTp1/?=
 =?us-ascii?Q?1z8vSFB2iWjwPNsW0iaXLLz2Dh8OqpwnaAecXXyQflTVXr0p8bTxe6jp+0EV?=
 =?us-ascii?Q?nN0ZZncfjuXVsKpwMyO8cu9syQ+bpFEdtF1gIpBxapBjtrG2vRqhoa4cRJ8a?=
 =?us-ascii?Q?e0T9N/kuTjVPyc7DZBlnZmSQeh0nNKfcN1UiSAYNkqth34cLb1MMqIMbzjbI?=
 =?us-ascii?Q?SqR0DVk5zLhwGnKc0x0vo806fc4VdtZwJRuSW0V+RrJobYaBpyV1oQg5SapC?=
 =?us-ascii?Q?aanFKnn3w8+ZOedZqd9tXvfJOY8cSspNnhKAIrreLk2Kath2qqeBu5lgCe3a?=
 =?us-ascii?Q?V37cijcJKXRHN1/uKgqRmOLf5eNshkEnhyqJGzrbmwcpTbDVtyDYA2K2zk0N?=
 =?us-ascii?Q?31owA1R4B9uMuhXQJ/sXS3lqCirPv4C6ZFtNGDwqE9hOfVLRmn2kQ3XU58rb?=
 =?us-ascii?Q?3qhqDY+kZE+YN/zeSvpK6sEXC86UzRfwwaSl5rAIyKEDWukk2NwwiZOKRQbt?=
 =?us-ascii?Q?OCuiNfCPWknlHfeyNzvvSRlU8EntP0GPvmzCWJ1BZ+KDXFhU6tAfsg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2025 19:50:11.8800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de91e2b-6b87-49a5-45ed-08ddddc74734
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6733
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 19:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222008

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

