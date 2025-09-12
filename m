Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA726CA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 15:57:26 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.51])
 by mx.groups.io with SMTP id smtpd.web11.20612.1757692642753138418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 08:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=nsktTBbZ;
 spf=pass (domain: axis.com, ip: 52.101.72.51, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtLayKJ84OxH/Qrod2CuttlQtuLGTwJN1lKXbcd/nORbwSkfRYE/ne0klih1SKMGLNUih5h94Aae0BtDPJeKizDW1r36mkBckfALgEKvl/OBoYRLsyFSWv/UKFo8cABkTHmE9iD6VseTl02mQjDV91MRwArahgUVmcKlpKTu4DfFyUXrb6gWPxrNt4j8WFb3zePNuLLoUnfbkKN3+XsxJX7mazsq8nmwxSqX8jHSTq0J3eenyqSoZxn+HaouFZA2Vnaeurg+Ew/TcBac8Ztl//4tAEf1UDdlrK/SEWIjcQw+Uj68YMTBmQOCeB89dG0Y9i7iipRIhnLKoXxV5QnpXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6vg9r4m9mpPCml9MXwZBVKOiMHc+t6I4dHY8QdLhT0=;
 b=D+cyTTr9ozF8sqCR7Z2OJ4/nCc+X824ykIny6iLWSzArRd4idtTDv0O30VCKi56JX7Vi3+1G4O9634f9HBMqu1baAH0dH8R/lLWPzvgsTIup5GQ+nXdqE060nCM6JR7R1SqrfnIhJG5GkhovLWHVmVoBpi6BeAxfDwet3tn5Bqb0ON+bjcHlylfxsqmMDY96fDq6uRHXivWbCREKBx46CwXugHwShkTtIpImL3/DNBBeujS6rbx+zf5gmQk9c+ZW6n3VvAmplcg30rvG2twmaLm5HwuTD2g/l99Rmb5l6u9WbC37jMLHbCSahzWcoeSAk4WXTsAFRRGX2FYtgrawhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6vg9r4m9mpPCml9MXwZBVKOiMHc+t6I4dHY8QdLhT0=;
 b=nsktTBbZWmX/CjQuTvcGZ618Lu73p5cvjmGDjAx1u2vLJ12Ca76Ug3gjwlo4LxiiCO0IYZeyXDTdMnFtBqMCRq8XWzho0dIIzgyZ941JUIxUM53lfB9fGbDTE9BJxmQWr1rYLbyFrPHsUF+w9sPbtISQUBN7XrJZCopslDtLtCs=
Received: from AS4P189CA0038.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::10)
 by AM9PR02MB6644.eurprd02.prod.outlook.com (2603:10a6:20b:2cc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 15:57:15 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::2d) by AS4P189CA0038.outlook.office365.com
 (2603:10a6:20b:5dd::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.18 via Frontend Transport; Fri,
 12 Sep 2025 15:57:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 15:57:15 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Fri, 12 Sep
 2025 17:57:15 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 12 Sep 2025 17:57:15 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 72F1822E8
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 17:57:15 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id EFEB11200F9; Fri, 12 Sep 2025 17:57:14 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH 3/3] systemd.bbclass: Make systemd_postinst run as intended
Date: Fri, 12 Sep 2025 17:57:12 +0200
Message-ID: <20250912155712.3340513-3-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912155712.3340513-1-pkj@axis.com>
References: <20250912155712.3340513-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000045:EE_|AM9PR02MB6644:EE_
X-MS-Office365-Filtering-Correlation-Id: 17fdfe7a-7c1e-4284-e026-08ddf2150b88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uwxZ5rm/cAl6HEPMev5lrl1slAOhNuk8b8oDE6WJqT7FUW1p2RN8RiUhrWnP?=
 =?us-ascii?Q?1iyJ7qnWqVlbUzCTWtGPvEXQhxA4jiFlXmWYAlQ+1BF4WyNAMoLx1ouHkc3D?=
 =?us-ascii?Q?pTUajAEm/rlu9xJgyFbHH7iHcQ+lOUa0eCHgeZfStxFdUQdbhMCNEu+uZ9ld?=
 =?us-ascii?Q?EI9R427wLKbxzw34X2jpt2xIxgBunkP8wAojmpHs97DDWQlGY9ih7tUsw2A9?=
 =?us-ascii?Q?lN1mmQ2n2JQPbExhX6QbIWCXcSn3lZIFt/iqGXHwoNvCvb5SPKEEU2qvozlu?=
 =?us-ascii?Q?K1cVv1C2e18KSnQfMC34Fbfdl4QqKSkYk9IvtrRQz35cTXhvZQF6wss8bnFF?=
 =?us-ascii?Q?wK3slDVwj6ggMx7qpl5R9udrTmeRXXc1+MlVraqif7vTptTX/Lk+0uKH/UZh?=
 =?us-ascii?Q?4vB9i93Y4rzszUWxFaJf+jLq8nodxrW9yPhFtwyP5ELEq2Wg+/hBXXJKu22u?=
 =?us-ascii?Q?q1atBUE9aVap3sTrWahoVsvtB+wartXKAmhp+GidOMq+ZCBdJCazw/DcLdMZ?=
 =?us-ascii?Q?nxDcfWVHFz/1pNNibx4TNiOfT5zSHWH0Z/Xy+3jHCyfekq5M3xPSRF4t9M0N?=
 =?us-ascii?Q?im14e1HCqRV4girnMeld09VYwwgqvFxhPO6pw3k6dpFDllilLWkvphgILPzb?=
 =?us-ascii?Q?QVQdFrBKzSH/h5LE+5Jnb5Cz6xDii6zIkicprKrVLrPRx4dmvpek5lvIHHX/?=
 =?us-ascii?Q?CSyhxDJpQjRtveK6KHsMRaSKFMmWIEBh81+GnxX4fJ8LBlQSBvAVenKv7lSQ?=
 =?us-ascii?Q?5XpHIpyKGdU1iRF6L1gtBjVei+09yRw71CFKEmsDTFdbnOIo5ctOCWPGhsIz?=
 =?us-ascii?Q?ohF4Zh8vr25/x+pCGWg4u4HQOVDegyYUQPpm9tolL5OzsP4xW9OxXOfDNwI7?=
 =?us-ascii?Q?PqpX9R3pmFf4HbnUTGGU9i1Nzyj9DrsLks0p+Ul16SQGJvvj3G/HlvChlMlz?=
 =?us-ascii?Q?YvPoApbmnBYEz+r9POoG5nAZiKE9gmFtFz5TS19N/p8eVPQat7MBA11Ajnt6?=
 =?us-ascii?Q?7vYJNu5gOuCHeVntZbQU47B1j4tfh5HpVPScXhHe+RLnzqaJjZLs52Sq8kQY?=
 =?us-ascii?Q?/pRLjMPr5pAOmzETrkrkZYlLv3ZRoXxVVMR29aaSSo8qRsO3So0JvBll6ayD?=
 =?us-ascii?Q?stccuiz3O6/ZdUUtb7AzRZTr/XfgFMkCYvgfeTVeEfPEv9pmhQSnMW+F3WQr?=
 =?us-ascii?Q?uGaNxZ3DH1/BYjdRQjzDhIoZf0h4oQtYVE2ayrSSBsDiIPrtrUQpgxVsLZYS?=
 =?us-ascii?Q?Oqk2E4t8kh3Va9FDAk/o+2/H4Kd2z2ZHbokWOiQFxjRzw68w220WzedMupRz?=
 =?us-ascii?Q?Mv6f/poZAy9MK2IuxUW1jk4dCtI/3PGd0ifm9OwpPYHVxtSCimZDLaBe8/+A?=
 =?us-ascii?Q?xa6MhMU6nqgT/Vj8SnwpOKx/Uhg9fZLpjnjwP0Nguj+IoAnfgugZ2AmCY0+k?=
 =?us-ascii?Q?T46sbj10RknAteS8/2bVujGN1Xv9j+1bDIWHywNH8+xd/0Cyph5a5gTHR9yP?=
 =?us-ascii?Q?xWtFQZMxC+eG8zUN5Vd/KG+109Xviof8IRyY?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 15:57:15.7837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17fdfe7a-7c1e-4284-e026-08ddf2150b88
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6644
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 15:57:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223327

After the switch from using a systemctl written in Python to using the
official version of systemctl from the systemd project, the
systemd_postinst function has effectively not been executed during the
rootfs creation. The reason is that systemctl provided by
systemctl-native fails if run without arguments (as systemd_postinst
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
 meta/classes-recipe/systemd.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 12c59647be..3d8ca24a68 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -29,7 +29,7 @@ python __anonymous() {
 }
=20
 systemd_postinst() {
-if systemctl >/dev/null 2>/dev/null; then
+if type systemctl >/dev/null 2>/dev/null; then
 	OPTS=3D""
=20
 	if [ -n "$D" ]; then
@@ -46,7 +46,7 @@ if systemctl >/dev/null 2>/dev/null; then
 		done
 	fi
=20
-	if [ -z "$D" ]; then
+	if [ -z "$D" ] && systemctl >/dev/null 2>/dev/null; then
 		# Reload only system service manager
 		# --global for daemon-reload is not supported: https://github.com/system=
d/systemd/issues/19284
 		systemctl daemon-reload
@@ -66,8 +66,8 @@ fi
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

