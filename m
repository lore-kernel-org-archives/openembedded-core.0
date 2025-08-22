Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A533CA0EEB
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 18:20:53 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.30])
 by mx.groups.io with SMTP id smtpd.web10.1192.1755886847889624856
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Aug 2025 11:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=eTopu66F;
 spf=pass (domain: axis.com, ip: 40.107.130.30, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRg5HpBKhnUexh8AYGcRY9KIjTRUteBkW8825/CxuXMpnu7+Ry39hMhginxXftlPsfkm+hWvAZQtFDaiddE/+w/FxnNGfsPXe+vhgxUBmOh7JKMX9o/IR/qahuu3ZLpnwbNY+krik7d/1YRy60AX12Z9V5KBQMiit3x2zh0fK+/GEsE7esVZWpcZvDZ8pIhrsBeUwcTFtE14bZZHMTPjm51Od4vtIH2GgbaV1t1+8DMAx/hjgNKx4Rn5tiMR8hzMgl/tSNGDQoxD8HahyfSRX4/pMPFaawrSxD1f69y91Sloh1lXi1KRYY6nhf1PY3ke/DpdJ9HNVYZbkYR3Itk30g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZZ1tG9G2eftgEzF+JwBSeSDQ2KDKKipf2hhO0OyXwU=;
 b=rGcr8kk8gEF2XjIH7yDjH8h2W+7NgIqa1GhhaUgloQ5EVXxEdA2sWq3UV0x0pLcBiXxRKMnThJ4nBHJaZrpRJA0MjXUwxlG1CAICHT9HayHxAUbx0OCDSwcAf9eqcF4gCVpuQV/XuXe6L/d12HrBDkJ+pMQlKudMON0CJSglVL2PBcOhmrPfncwmoaG4+Y8Wuz3ylmQBc4vZ193QfYABVgDV0h59HVnesmbnXmt27hXRx1sxkKjfo6b9uOLjWTPb+YXBz+JYuv+8B8KvxXJzudQZ7mqUucK1CMPFWRxX2VSojSjw3f6n32He5rV43eeTJSqomteNrgo7xF7+c6gEsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZZ1tG9G2eftgEzF+JwBSeSDQ2KDKKipf2hhO0OyXwU=;
 b=eTopu66F8DN3fgkMa2NK+WnA14oDk43yNSfvZiCvh9fcXWbfTaDJNQvHSTDOeuCSgkS8HGmaROmvrfkM+IQJ/cuFcyUiwNPFjXC7kcY/pbkWj2IU8qPO4n5MuVJ0Acp+yh8bL3LIn3Uu1EAZmrlC/TJMoR3qAGk/kJ7OeqI6p/8=
Received: from DB8PR03CA0021.eurprd03.prod.outlook.com (2603:10a6:10:be::34)
 by DB9PR02MB7940.eurprd02.prod.outlook.com (2603:10a6:10:33a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 18:20:42 +0000
Received: from DB5PEPF00014B92.eurprd02.prod.outlook.com
 (2603:10a6:10:be:cafe::6a) by DB8PR03CA0021.outlook.office365.com
 (2603:10a6:10:be::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.19 via Frontend Transport; Fri,
 22 Aug 2025 18:20:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B92.mail.protection.outlook.com (10.167.8.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 18:20:42 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 22 Aug
 2025 20:20:41 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 22 Aug 2025 20:20:41 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 76FCD29B0
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 20:20:41 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 64273120094; Fri, 22 Aug 2025 20:20:41 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv6 2/2] systemd.bbclass: Make systemd_postinst run as intended
Date: Fri, 22 Aug 2025 20:20:38 +0200
Message-ID: <20250822182038.1295769-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822182038.1295769-1-pkj@axis.com>
References: <20250822182038.1295769-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B92:EE_|DB9PR02MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: dbf2260f-492a-4cc0-39c1-08dde1a89af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OQfvl7HD9qe4Pp3gUtpfOX/F5MQM5S7DWCvurvbYd0JOpqlzI2L+ZptrepT3?=
 =?us-ascii?Q?aPJX3JwESsu33jEh8q+rH0JHGzvHqKiqJI/QLfg1gpNev/o2ZPZkk9ZGm2Ts?=
 =?us-ascii?Q?DuEFSrtfTS1ruevPVKIOEugjz201NmhOA6nhnfZ6z4+0szJXnYVpBpSzliCt?=
 =?us-ascii?Q?VJynxabZ4ZVCTl75YQB6oyS93PGwPKST5cF7uqD05hcAonyIy45H/QJ12ZAl?=
 =?us-ascii?Q?ctKKMAY5E1+j4quV7K1Z/nmfFmfBYkemRGDq7IRSnOoexjci4MLyNGn3zK4V?=
 =?us-ascii?Q?JL8GPLiNGhZu+G2gPyQAIVNEiNCF9kxsn91JjuQ3q8s02g89TS4q4CAcvU/I?=
 =?us-ascii?Q?699UF6yJaNKDITzouSUTuT7t3OzuUDq27n0BGfsLusFKmx5YSZZdw3ILdRc9?=
 =?us-ascii?Q?Rj3vUkEpVDSfDymfjatS8TlyLmWQZefUMzDfiGGQeqhmEwADLjWRBes3PVj0?=
 =?us-ascii?Q?VOAWvrCh+gG0V9aaYaPtsXkDk90hxGM9koz2/Y8ilt1XEVSY2tq6rc3Vwktf?=
 =?us-ascii?Q?pKGnLBdW/M9jGRb50h1wNM6pEVx6OWAreavzralODjPGrUy+e24okFxN7HwS?=
 =?us-ascii?Q?eSVAqEHgGU+U8cuZhQqcPDPko9sW1lBDgbNlmInPlhYeiOfEUIKr/IYzviqp?=
 =?us-ascii?Q?qVA05HaWKak1FF9PCI4eU/aw/y1OAKMyVK98c3TwysX7YF8HLqDDeJmBH5SB?=
 =?us-ascii?Q?x212MF7xl07l4KBzJZaDYVYtj4E+lyyL90dAKjPcQ8YLRHwrA1Xw2yJDmirt?=
 =?us-ascii?Q?dSuWA/C2ueV8JQqWzEh0ingWHk7CA5FUNGUTnYo094IDHVr/Cg3TnFFZ8M76?=
 =?us-ascii?Q?LsfWM8qxfo5I8oLkXEb+n2SLDHfeTek2DAeWyRpzUMkasmvs7ZlnoZrRfQiB?=
 =?us-ascii?Q?BaKJLjKvgdLGTD1nUKVOaroBGdy/dLobuEjm4MlCgrxPzvrWKevhqvWXMa/K?=
 =?us-ascii?Q?VuXhl7r/PdkEyeOyWJzsLABQnvM8cGzkxT0IOroFdowise3dIIXvf7Zo2292?=
 =?us-ascii?Q?I0H80Iqb66ruApj/qY7ZCWXvyoVaFeo9OM/VVTnhwB2/IzK8ulY0Ua3RKGAb?=
 =?us-ascii?Q?YyBsPt6VUi5OdKR/XIvkBlioeDNWv2DvIBEu6aasBmxHFaLWLpM2tDZ1UcyC?=
 =?us-ascii?Q?teSglCLm9+cx1QOL9ryzrM7F7YihKgSaJHL+CDQueWK6lIlWsM3e1z8VYJbF?=
 =?us-ascii?Q?fk+t7KmgQt0s9H8dorS+pSKTlAbHO0MbFI9DVUoQeoPlaxfHS4isvrDY5kUD?=
 =?us-ascii?Q?Pg+OLfoD4+nM3MOxfwP+UyCUaAu1IgDGF+DeFY6prTJm7gu/rPD2+6tCk5tr?=
 =?us-ascii?Q?6b1hA6w5MAzoB9mDRzew8ogd3kywPPzzU1okty8Z5I+PD33vwKoeSC9BNEJR?=
 =?us-ascii?Q?bZwK1QnfscWZu7POMYLrebfSDtWxaY5x+jWzE/YYHiSjC1iynXNDaqfednty?=
 =?us-ascii?Q?PaX07ArXmV2WgoH7855q+2oWb0TFt+ZQyaEvo3L7J8gPSdTUfuMDvFjxWwqm?=
 =?us-ascii?Q?fKXmNsvBF903bvdADTmVjwr730UR6Z0mN0Oj?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 18:20:42.6151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf2260f-492a-4cc0-39c1-08dde1a89af0
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7940
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 18:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222340

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

PATCHv2: Add --sysv-install=3D to $OPTS to instruct systemctl where to
         look for systemd-sysv-install.
PATCHv3: No changes.
PATCHv4: No changes.
PATCHv5: No changes.
PATCHv6: Removed the --sysv-install=3D parameter again.

 meta/classes-recipe/systemd.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 0e9f7cfa33..4e687135f1 100644
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

