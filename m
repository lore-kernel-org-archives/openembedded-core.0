Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0694CA0EC4
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 21:14:46 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.35])
 by mx.groups.io with SMTP id smtpd.web10.86639.1755033280666091911
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 14:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=W6jZO6Su;
 spf=pass (domain: axis.com, ip: 52.101.69.35, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZt/WkpeRWtwuyEo7NPj0qk2s6Kkom5URHjEnGNXwuL2Xa1LRJcc88CfWCm23chWIOed4KVvxkiX/ck8J5aMD43w5sqyJze/KrvWUlfkipt/xQi3TFA7TfE77fLeOnqycbrLMa9Sov+7aQAjPksOUMjwRY6PaUEzPV+30pA8HYl4MnUqX7VZs6UkiQPpa/e5RrhSxiw15MtkHFsIedQtkuq6rgZxnHZWzOfNY7bA8KyYrCRdXxbNWuZw2DxiFC2GtSZgqmMoICURTtCpB67hHnnq6b2p8iz56aBK02n2NG1uwhzsPoakIRJ1M/6GSNPm7tJZam8HlpRV4gIBZnDLhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SekLgO0CmxiBdlhzk4azPmFXoT69pL+cwXfDQecyilw=;
 b=tY1UTqcDrhrjzPvTPKWW2dkrrD7nTSHL25o6dF3TYQ1j0yQTacQ7KgPetfJgosjnMv6Ykthf5YsB6mUaJPV58rhi0F/JMGcl2FKzdCKQq9Q88kMdiU9Q5X+rmZDD6vyRnOP/GufZAs8FkJC5DKDQVrngUev5NocnQv+jEETd8Z0gzE7VCE0YceO75vv9oeDxZbVcH1Kel7hq8Sm2ioIZSuVuzDsuoO5UKC5kneH0ocQfFFQcurfdxEwwmNtW2HCUNQfCERR2RUuR2oTyzJoWEnc1Zbq9X7e3X51qVfleSPlyngFUHfDMWRanu1xBNe2RV9MtdWzW03yROvmvmEv4TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SekLgO0CmxiBdlhzk4azPmFXoT69pL+cwXfDQecyilw=;
 b=W6jZO6Sun9vVM1oSbV9eqDpiRR00btWkZNx3U0KLEqfYS+Th3R4ky8NsNVegRxUV48h5o5pNZWlrX5HM7hS0Z5Xpgnzg/O+OVu+lvZ1wgRlJUiUYfduOviydMJrUiL/OMFaDhmvi58N7+II+1Uua5xIGc7O/q9P64YJSSF0B/nE=
Received: from AS4PR10CA0028.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::13)
 by AS4PR02MB8550.eurprd02.prod.outlook.com (2603:10a6:20b:585::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 21:14:36 +0000
Received: from AM4PEPF00025F96.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::67) by AS4PR10CA0028.outlook.office365.com
 (2603:10a6:20b:5d8::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.15 via Frontend Transport; Tue,
 12 Aug 2025 21:14:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00025F96.mail.protection.outlook.com (10.167.16.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.0 via Frontend Transport; Tue, 12 Aug 2025 21:14:36 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 12 Aug
 2025 23:14:35 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 12 Aug 2025 23:14:35 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id D8E3C1FD2
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 23:14:35 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id DB57D120340; Tue, 12 Aug 2025 23:14:35 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] systemd.bbclass: Make systemd_postinst run as intended
Date: Tue, 12 Aug 2025 23:14:24 +0200
Message-ID: <20250812211424.76559-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F96:EE_|AS4PR02MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e73a22c-69f9-4cfa-8b40-08ddd9e53dbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BKiJfFrX7Q1NNQdgdf+nIt1HEqqkFBrvVmu4O7dnFD8dF/t3wHt9cB0msLkB?=
 =?us-ascii?Q?+KnFMOpOxpVp4c0RYYaEq7lNEjlYKan3o6tBzaBgxKXHZuYXZQ50snE46XNR?=
 =?us-ascii?Q?4tn8sAU8QKChElKEzATdNNTX5G3vqp1RwCKYdU4oxYWwDJkFQgGLVLID3Jie?=
 =?us-ascii?Q?3C4CvP12fB0M4BVmLt/vfoF43AV2ZvV2NCunt2ycXpUn8ju8jxES4998AwjH?=
 =?us-ascii?Q?OxiwOyS916Joz4CqOmMh5bf0ZuffuG2v2jibyMNmfnVSbAjUqLcnifBpajTX?=
 =?us-ascii?Q?ke1Yo9Jt76nkd61Q6JxsXHomh40yBmVZpGJsh4NAMNbSmMvZviRYxLo6yaEI?=
 =?us-ascii?Q?22CnI2IgKqqj+F/St2uU+M9NT/uHxyv0odhRKXJf0htq+8jtOhDDBQkatHY0?=
 =?us-ascii?Q?bM1htGCvhWkqOKxX34r+EFkn7I355oa4e8nj86IChqQqhJB0MRCM8EaxpuCY?=
 =?us-ascii?Q?aTQ9Y9EGm6qdVhluZDPh1L+GFe+wxwnJDZIjLCXItXqgRpZ6cPcDMlfae8Kg?=
 =?us-ascii?Q?ETmmY9BHZfy4GBH5wPyig0w/BZhLJLjsOdTDLtXoVHArw809IHTEtZnPUENl?=
 =?us-ascii?Q?BlAMDjwKsfO4mbE+5afPmTbRWg1Pn+qmv4tjqctPgLIBiO9I+agx6HzhTRjP?=
 =?us-ascii?Q?OT1RAj6g0LQTcnhFeLGoFKCu6N0R4pfJWXcLkyds0YywgIKyGux9nTYh1lbq?=
 =?us-ascii?Q?zN/CCnOTWeyN+HHSFLxNOYxrgbRKLqtBM19Ru4BZuh74zjC9fcw0/zI6kDnT?=
 =?us-ascii?Q?GkiFZsWZT9m/Bf/Il7CxrjBBdWhgw5ZG7SUcP6dU3cM4iFJ2nukjocJe4eVb?=
 =?us-ascii?Q?Stqb3S1zujJZ5jZqT/I/xB4+azTikvFTf77SL8N+yPYpcF2g9eDxuToFF27+?=
 =?us-ascii?Q?9fGhm3HkejN6TO6ipQjLNsi07YuyPe9B2jBkx4TTX0VSOba8LTvKujb4NBmT?=
 =?us-ascii?Q?UVBsvUV1BwPSloylQDYEPqZDob4pOe8rNiuOcVhNVsMMcxRMt80oALmth9eX?=
 =?us-ascii?Q?dPbQsaQ1mAARiVy3FKLrNgafxz5rCik36P1AxCHO70yC0Z67TsDUvPtj1L+K?=
 =?us-ascii?Q?Waug+BRWDl/1jj3KFN8h9GyKCnwJDZ+R1w1MNErsJsjA5QEbkcAJd+5buEn1?=
 =?us-ascii?Q?3wRw674q6gPJoMSq57yLtkDJtxs7ntm7bUhQq7S22O5rGyo53emSpCvgbLkv?=
 =?us-ascii?Q?sK8oHbLXlRDInXaI7t3fHUnCf08Fw3ZhvS4l4gVu0FtfDffglX8m7RV6offc?=
 =?us-ascii?Q?mSIwsEb0bOrDrEhxD81dijl5QuVPA8CB6aFyDVFoosdrbepLIYm4gukolFYi?=
 =?us-ascii?Q?k9lTmZcqSuU/bnFADXRVJrxhhVBq/MjfzI5+5BL5MIEdejlc76G8ClUn20J/?=
 =?us-ascii?Q?AxGUvRK64vJrq8ILAuk8LFfbjW3ntHXQJW60fQV25nC6AZQdbXkUTHH9btsB?=
 =?us-ascii?Q?SEYzaBSpJ8U2eP9C7gT8UJSsSsvguXoj1jzhxjRizlhdFoHqwEx2ovHm78tU?=
 =?us-ascii?Q?fHmLgg+v6eKOAPj8i2VcRuwWeS/I/Sql0JKF?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 21:14:36.2557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e73a22c-69f9-4cfa-8b40-08ddd9e53dbc
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8550
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 21:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221779

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

